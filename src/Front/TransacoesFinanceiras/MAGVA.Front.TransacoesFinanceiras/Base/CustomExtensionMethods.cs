
namespace MAGVA.Front.TransacoesFinanceiras.Base
{
    using IdentityModel;
    using Infrastructure;
    using Infrastructure.Middlewares;
    using MAGVA.Front.TransacoesFinanceiras.Constants;
    using Microsoft.AspNetCore.Authentication.Cookies;
    using Microsoft.AspNetCore.Authentication.OpenIdConnect;
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.DataProtection;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.HttpOverrides;
    using Microsoft.AspNetCore.Localization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Razor;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Diagnostics.HealthChecks;
    using Microsoft.Extensions.Logging;
    using Microsoft.Extensions.Options;
    using Microsoft.IdentityModel.Tokens;
    using Middlewares;
    using Polly;
    using Polly.Extensions.Http;
    using Services;
    using StackExchange.Redis;
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Net.Http;
    using System.Threading;
    using System.Threading.Tasks;
    using ViewModels;

    public static class WebHostBuildertExtensions
    {
        static IAsyncPolicy<HttpResponseMessage> GetRetryPolicy()
        {
            return HttpPolicyExtensions
              .HandleTransientHttpError()
              .OrResult(msg => msg.StatusCode == System.Net.HttpStatusCode.NotFound)
              .WaitAndRetryAsync(6, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));

        }
        static IAsyncPolicy<HttpResponseMessage> GetCircuitBreakerPolicy()
        {
            return HttpPolicyExtensions
                .HandleTransientHttpError()
                .CircuitBreakerAsync(5, TimeSpan.FromSeconds(30));
        }

        public static IServiceCollection AddCustomMvc(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddOptions();
            services.Configure<AppSettings>(configuration);

            services.AddMvc()
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            services.AddSession();

            if (configuration.GetValue<string>("IsClusterEnv") == bool.TrueString)
            {
                services.AddDataProtection(opts =>
                {
                    opts.ApplicationDiscriminator = "transacoesfinanceiras.webmvc";
                })
                .PersistKeysToRedis(ConnectionMultiplexer.Connect(configuration["DPConnectionString"]), "DataProtection-Keys");
            }
            return services;
        }

        public static IWebHostBuilder UseFailing(this IWebHostBuilder builder, Action<FailingOptions> options)
        {
            builder.ConfigureServices(services =>
            {
                services.AddSingleton<IStartupFilter>(new FailingStartupFilter(options));
            });
            return builder;
        }

        public static IServiceCollection AddHealthChecks(this IServiceCollection services, IConfiguration configuration)
        {
            var hcBuilder = services
                .AddHealthChecks()
                .AddCheck("self", () => HealthCheckResult.Healthy())
                .AddUrlGroup(new Uri(configuration["IdentityUrlHC"]), name: "identityserver-check", tags: new string[] { "identityserver" })
                .AddUrlGroup(new Uri(configuration["ApiTransacoesFinanceirasHC"]), name: "apiTransacoesFinanceiras-check", tags: new string[] { "apiTransacoesFinanceiras" });

            return services;
        }

        public static IServiceCollection AddCustomConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddOptions();
            services.Configure<ProgramSettings>(configuration);
            services.Configure<ApiBehaviorOptions>(options =>
            {
                options.InvalidModelStateResponseFactory = context =>
                {
                    var problemDetails = new ValidationProblemDetails(context.ModelState)
                    {
                        Instance = context.HttpContext.Request.Path,
                        Status = StatusCodes.Status400BadRequest,
                        Detail = "Please refer to the errors property for additional details."
                    };

                    return new BadRequestObjectResult(problemDetails)
                    {
                        ContentTypes = { "application/problem+json", "application/problem+xml" }
                    };
                };
            });

            return services;
        }

        public static IServiceCollection AddHttpClientServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddTransient<HttpClientAuthorizationDelegatingHandler>();
            services.AddTransient<HttpClientRequestIdDelegatingHandler>();
            services.AddHttpClient("extendedhandlerlifetime").SetHandlerLifetime(TimeSpan.FromMinutes(5)).AddDevspacesSupport();

            services.AddHttpClient<IConsumidorService, ConsumidorService>()
                   .SetHandlerLifetime(TimeSpan.FromMinutes(5))
                   .AddHttpMessageHandler<HttpClientAuthorizationDelegatingHandler>()
                   .AddPolicyHandler(GetRetryPolicy())
                   .AddPolicyHandler(GetCircuitBreakerPolicy())
                   .AddDevspacesSupport();

            services.AddTransient<IIdentityParser<ApplicationUser>, IdentityParser>();

            return services;
        }

        public static IServiceCollection AddHttpClientLogging(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddLogging(b =>
            {
                b.AddFilter((category, level) => true); 
                b.AddConsole(c => c.IncludeScopes = true);
                b.AddDebug();
            });

            return services;
        }

        public static IServiceCollection AddCustomAuthentication(this IServiceCollection services, IConfiguration configuration)
        {
            var useLoadTest = configuration.GetValue<bool>("UseLoadTest");
            var identityUrl = configuration.GetValue<string>("IdentityUrl");
            var callBackUrl = configuration.GetValue<string>("CallBackUrl");
            var sessionCookieLifetime = configuration.GetValue("SessionCookieLifetimeMinutes", 120);

            services.AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = OpenIdConnectDefaults.AuthenticationScheme;

                options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultForbidScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultSignOutScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            })
            .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, setup => 
            {
                setup.ExpireTimeSpan = TimeSpan.FromMinutes(sessionCookieLifetime);
                setup.Cookie.Name = AuthorizationConsts.IdentityCookieName;
            })
            .AddOpenIdConnect(options =>
            {
                options.SignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.Authority = identityUrl.ToString();
                options.SignedOutRedirectUri = callBackUrl.ToString();
                options.ClientId = useLoadTest ? "mvctest" : "transacoesfinanceiras";
                options.ClientSecret = "secret";
                options.ResponseType = useLoadTest ? "code id_token token" : "code id_token";
                options.SaveTokens = true;
                options.GetClaimsFromUserInfoEndpoint = true;
                options.RequireHttpsMetadata = false;

                options.Scope.Clear();
                options.Scope.Add(AuthorizationConsts.ScopeOpenId);
                options.Scope.Add(AuthorizationConsts.ScopeProfile);
                options.Scope.Add(AuthorizationConsts.ScopeEmail);
                options.Scope.Add(AuthorizationConsts.ScopeRoles);
                options.Scope.Add("transacoesfinanceiras");
                options.Scope.Add("consumidores");

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    NameClaimType = JwtClaimTypes.Name,
                    RoleClaimType = JwtClaimTypes.Role,
                };

                options.Events = new OpenIdConnectEvents
                {
                    OnMessageReceived = OnMessageReceived,
                    OnRedirectToIdentityProvider = OnRedirectToIdentityProvider
                };
            });

            return services;
        }
        
        public static void AddAuthorizationPolicies(this IServiceCollection services)
        {
            services.AddAuthorization(options =>
            {
                options.AddPolicy("RequererRegraDeConsumidor",
                    policy => policy.RequireRole("consumidorrole"));
            });
        }

        public static void AddMvcLocalization(this IServiceCollection services)
        {
            services.AddSingleton<ITempDataProvider, CookieTempDataProvider>();

            services.AddLocalization(opts => { opts.ResourcesPath = ConfigurationConsts.ResourcesPath; });

            services.AddMvc()
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1)
                .AddViewLocalization(
                    LanguageViewLocationExpanderFormat.Suffix,
                    opts => { opts.ResourcesPath = ConfigurationConsts.ResourcesPath; })
                .AddDataAnnotationsLocalization();

            services.Configure<RequestLocalizationOptions>(
                opts =>
                {
                    var supportedCultures = new[]
                    {
                        new CultureInfo("en-US"),
                        new CultureInfo("en")
                    };

                    opts.DefaultRequestCulture = new RequestCulture("en");
                    opts.SupportedCultures = supportedCultures;
                    opts.SupportedUICultures = supportedCultures;
                });
        }

        public static void UseSecurityHeaders(this IApplicationBuilder app)
        {
            app.UseForwardedHeaders(new ForwardedHeadersOptions()
            {
                ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
            });
            app.UseHsts(options => options.MaxAge(days: 365));
            app.UseXXssProtection(options => options.EnabledWithBlockMode());
            app.UseXContentTypeOptions();
            app.UseXfo(options => options.SameOrigin());
            app.UseReferrerPolicy(options => options.NoReferrer());
            var allowCspUrls = new List<string>
            {
                "https://fonts.googleapis.com/",
                "https://fonts.gstatic.com/"
            };

            app.UseCsp(options =>
            {
                options.FontSources(configuration =>
                {
                    configuration.SelfSrc = true;
                    configuration.CustomSources = allowCspUrls;
                });

                //TODO: consider remove unsafe sources - currently using for toastr inline scripts in Notification.cshtml
                options.ScriptSources(configuration =>
                {
                    configuration.SelfSrc = true;
                    configuration.UnsafeInlineSrc = true;
                    configuration.UnsafeEvalSrc = true;
                });

                options.StyleSources(configuration =>
                {
                    configuration.SelfSrc = true;
                    configuration.CustomSources = allowCspUrls;
                    configuration.UnsafeInlineSrc = true;
                });
            });
        }

        public static void ConfigureAuthentification(this IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseAuthentication();

            if (env.IsStaging())
            {
                app.UseMiddleware<AuthenticatedTestRequestMiddleware>();
            }
        }

        public static void ConfigureLocalization(this IApplicationBuilder app)
        {
            var options = app.ApplicationServices.GetService<IOptions<RequestLocalizationOptions>>();
            app.UseRequestLocalization(options.Value);
        }

        private static Task OnMessageReceived(MessageReceivedContext context)
        {
            context.Properties.IsPersistent = true;
            context.Properties.ExpiresUtc = new DateTimeOffset(DateTime.Now.AddHours(12));

            return Task.FromResult(0);
        }

        private static Task OnRedirectToIdentityProvider(RedirectContext n)
        {
            n.ProtocolMessage.RedirectUri = AuthorizationConsts.IdentityRedirectUri;

            return Task.FromResult(0);
        }

    }

    public static class ServiceCollectionDevspacesExtensions
    {
        public static IServiceCollection AddDevspaces(this IServiceCollection services)
        {
            services.AddTransient<DevspacesMessageHandler>();
            return services;
        }
    }

    public static class HttpClientBuilderDevspacesExtensions
    {
        public static IHttpClientBuilder AddDevspacesSupport(this IHttpClientBuilder builder)
        {
            builder.AddHttpMessageHandler<DevspacesMessageHandler>();
            return builder;
        }
    }

    public class DevspacesMessageHandler : DelegatingHandler
    {
        private const string DevspacesHeaderName = "azds-route-as";
        private readonly IHttpContextAccessor _httpContextAccessor;
        public DevspacesMessageHandler(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            var req = _httpContextAccessor.HttpContext.Request;

            if (req.Headers.ContainsKey(DevspacesHeaderName))
            {
                request.Headers.Add(DevspacesHeaderName, req.Headers[DevspacesHeaderName] as IEnumerable<string>);
            }
            return base.SendAsync(request, cancellationToken);
        }
    }
}
