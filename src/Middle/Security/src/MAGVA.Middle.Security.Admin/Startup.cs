
namespace MAGVA.Middle.Security.Admin
{
    using Helpers;
    using Base;
    using System.IdentityModel.Tokens.Jwt;
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Logging;

    using Microsoft.AspNetCore.Diagnostics.HealthChecks;
    using HealthChecks.UI.Client;

    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            JwtSecurityTokenHandler.DefaultInboundClaimTypeMap.Clear();

            var builder = new ConfigurationBuilder()
                    .SetBasePath(env.ContentRootPath)
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                    .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true, reloadOnChange: true)
                    .AddEnvironmentVariables();

            Configuration = builder.Build();

            HostingEnvironment = env;
        }

        public IConfiguration Configuration { get; }

        public IHostingEnvironment HostingEnvironment { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services
                .AddCustomDbContext(Configuration)
                .AddHealthChecks(Configuration)
                .AddCustomConfiguration(Configuration);

            services.AddAuthentication(HostingEnvironment);
            services.AddServices();
            services.AddMvcLocalization();
            services.AddAuthorizationPolicies();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            var pathBase = Configuration["PATH_BASE"];
            if (!string.IsNullOrEmpty(pathBase))
            {
                loggerFactory.CreateLogger<Startup>().LogDebug("Using PATH BASE '{pathBase}'", pathBase);
                app.UsePathBase(pathBase);
            }

            app.UseCors("CorsPolicy");

            app.UseHealthChecks("/liveness", new HealthCheckOptions
            {
                Predicate = r => r.Name.Contains("self")
            });

            app.UseHealthChecks("/hc", new HealthCheckOptions()
            {
                Predicate = _ => true,
                ResponseWriter = UIResponseWriter.WriteHealthCheckUIResponse
            });

            app.UseSecurityHeaders();
            app.UseStaticFiles();
            app.ConfigureAuthentification(env);
            app.ConfigureLocalization();

            app.UseMvc(routes =>
            {
                routes.MapRoute("default", "{controller=Home}/{action=Index}/{id?}");
            });
        }       
    }
}