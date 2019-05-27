using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Serilog;
using MAGVA.Middle.Security.Admin.Helpers;
using System.Net;

namespace MAGVA.Middle.Security.Admin
{
    public class Program
    {
        private const string SeedArgs = "/seed";
        public static IWebHost host;

        public static async Task Main(string[] args)
        {            
            var seed = args.Any(x => x == SeedArgs);
            if (seed) args = args.Except(new[] { SeedArgs }).ToArray();

            host = BuildWebHost(args);

            //NOTE: Uncomment the line below to use seed data or use args params above
            //await DbMigrationHelpers.EnsureSeedData(host);

            if (seed)
            {
                await DbMigrationHelpers.EnsureSeedData(host);
            }

            host.Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseKestrel(c => c.AddServerHeader = false)
                //.UseUrls($"http://{IPAddress.Loopback}:14001")
                .UseStartup<Startup>()
                .UseSerilog()
                .Build();
    }
}