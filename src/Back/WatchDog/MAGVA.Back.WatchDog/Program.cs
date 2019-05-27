
namespace MAGVA.Back.WatchDog
{
    using Microsoft.AspNetCore;
    using Microsoft.AspNetCore.Hosting;
    //using Microsoft.AspNetCore.Server.Kestrel.Core;
    //using System;
    //using System.Net;

    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>();
                //.UseKestrel()
                //.ConfigureKestrel((context, options) =>
                //        {
                //            options.Limits.MaxConcurrentConnections = 100;
                //            options.Limits.MaxConcurrentUpgradedConnections = 100;
                //            options.Limits.MaxRequestBodySize = 10 * 1024;
                //            options.Limits.MinRequestBodyDataRate = new MinDataRate(bytesPerSecond: 100, gracePeriod: TimeSpan.FromSeconds(10));
                //            options.Limits.MinResponseDataRate = new MinDataRate(bytesPerSecond: 100, gracePeriod: TimeSpan.FromSeconds(10));
                //            options.Listen(IPAddress.Loopback, 15098);
                //            options.Listen(IPAddress.Loopback, 15099, listenOptions => {});
                //        });
    }
}
