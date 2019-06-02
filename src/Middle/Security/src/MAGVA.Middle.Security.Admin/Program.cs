
namespace MAGVA.Middle.Security.Admin
{
    using EntityFramework.DbContexts;
    using Infrastructure;
    using Infrastructure.Middlewares;
    using Helpers;
    using Microsoft.AspNetCore;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Logging;
    using Microsoft.Extensions.Options;
    using Serilog;
    using System;
    using System.IO;

    public class Program
    {
        public static readonly string Namespace = typeof(Program).Namespace;
        public static readonly string AppName = Namespace.Substring(Namespace.LastIndexOf('.', Namespace.LastIndexOf('.') - 1) + 1);
        public static IWebHost host;

        public static int Main(string[] args)
        {
            var configuration = GetConfiguration();

            Serilog.ILogger log = CreateSerilogLogger(configuration);
            Log.Logger = log;

            try
            {
                Log.Information("Configuring web host ({ApplicationContext})...", AppName);
                host = BuildWebHost(configuration, log, args);

                Log.Information("Applying migrations ({ApplicationContext})...", AppName);
                _ = host.MigrateDbContext<AdminDbContext>((context, services) =>
                {
                    var env = services.GetService<IHostingEnvironment>();
                    var settings = services.GetService<IOptions<ProgramSettings>>();
                    var logger = services.GetService<ILogger<AdminDbContextSeed>>();

                    new AdminDbContextSeed()
                        .SeedAsync(context, env, settings, logger)
                        .Wait();
                });


                Log.Information("Starting web host ({ApplicationContext})...", AppName);
                host.Run();

                return 0;
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "Program terminated unexpectedly ({ApplicationContext})!", AppName);
                return 1;
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        private static IWebHost BuildWebHost(IConfiguration configuration, Serilog.ILogger logger, string[] args) =>
                    WebHost.CreateDefaultBuilder(args)
                        .CaptureStartupErrors(false)
                        .UseFailing(options => options.ConfigPath = "/Failing")
                        .UseStartup<Startup>()
                        .UseContentRoot(Directory.GetCurrentDirectory())
                        .UseConfiguration(configuration)
                        .UseSerilog(logger)
                        .Build();

        private static Serilog.ILogger CreateSerilogLogger(IConfiguration configuration)
        {
            //var seqServerUrl = configuration["Serilog:SeqServerUrl"];
            var logstashUrl = configuration["Serilog:LogstashgUrl"];
            return new LoggerConfiguration()
                .MinimumLevel.Debug()
                .Enrich.WithProperty("ApplicationContext", AppName)
                .Enrich.FromLogContext()
                .WriteTo.Console()
                //.WriteTo.Seq(string.IsNullOrWhiteSpace(seqServerUrl) ? "http://seq" : seqServerUrl)
                .WriteTo.Http(string.IsNullOrWhiteSpace(logstashUrl) ? "http://magvalogstash:5044" : logstashUrl)
                .ReadFrom.Configuration(configuration)
                .CreateLogger();
        }

        private static IConfiguration GetConfiguration()
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddEnvironmentVariables();

            return builder.Build();
        }
    }
}