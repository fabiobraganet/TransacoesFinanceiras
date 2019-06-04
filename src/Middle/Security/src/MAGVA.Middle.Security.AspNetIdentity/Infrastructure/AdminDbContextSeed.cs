
namespace MAGVA.Middle.Security.AspNetIdentity.Infrastructure
{
    using Admin.EntityFramework.DbContexts;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.Extensions.Logging;
    using Microsoft.Extensions.Options;
    using System.Threading.Tasks;

    public class AdminDbContextSeed
    {
        public async Task SeedAsync(AdminDbContext context, IHostingEnvironment env, IOptions<ProgramSettings> settings, ILogger<AdminDbContextSeed> logger)
        {
            await Task.Run(() => { });
        }
    }
}
