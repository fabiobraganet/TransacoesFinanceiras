
namespace MAGVA.Back.TransacoesFinanceiras.Controllers
{
    using MAGVA.Back.TransacoesFinanceiras.Infrastructure;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.DependencyInjection;
    using System;

    [Route("api/[controller]")]
    [ApiController]
    public class SeedController : ControllerBase
    {
        [HttpGet]
        public ActionResult<bool> Get()
        {
            DbMigrationHelpers.EnsureSeedData(Program.Host);

            return true;
        }
    }

    public static class DbMigrationHelpers
    {
        public static void EnsureSeedData(IWebHost host)
        {
            using (var serviceScope = host.Services.CreateScope())
            {
                var services = serviceScope.ServiceProvider;

                EnsureSeedData(services);
            }
        }

        public static void EnsureSeedData(IServiceProvider serviceProvider)
        {
            using (var scope = serviceProvider.GetRequiredService<IServiceScopeFactory>().CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<TransacoesFinanceirasContext>();

                context.Database.Migrate();
            }
        }

    }

}