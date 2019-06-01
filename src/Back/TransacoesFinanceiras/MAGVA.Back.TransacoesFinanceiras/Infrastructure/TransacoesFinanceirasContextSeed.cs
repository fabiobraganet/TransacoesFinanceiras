
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure
{
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Logging;
    using Microsoft.Extensions.Options;
    using System.Threading.Tasks;

    public class TransacoesFinanceirasContextSeed
    {
        public async Task SeedAsync(TransacoesFinanceirasContext context, IHostingEnvironment env, IOptions<ProgramSettings> settings, ILogger<TransacoesFinanceirasContextSeed> logger)
        {

            using (context)
            {
                context.Database.Migrate();
                await context.SaveChangesAsync();
            }

        }
    }
}
