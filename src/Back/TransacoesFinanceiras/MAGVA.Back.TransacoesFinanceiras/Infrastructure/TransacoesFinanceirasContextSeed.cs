
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure
{
    using Microsoft.Extensions.Logging;
    using Microsoft.Extensions.Options;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.EntityFrameworkCore;
    using Domain.Seedwork;
    using Infrastructure;
    using Polly;
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.IO;
    using System.Linq;
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

                //var policy = CreatePolicy(logger, nameof(TransacoesFinanceirasContextSeed));

                //await policy.ExecuteAsync(async () =>
                //{
                //    var useCustomizationData = settings.Value.UseCustomizationData;
                //    var contentRootPath = env.ContentRootPath;

                //    using (context)
                //    {
                //        context.Database.Migrate();

                //        //...

                //        await context.SaveChangesAsync();
                //    }
                //});
        }

        //private Policy CreatePolicy(ILogger<TransacoesFinanceirasContextSeed> logger, string prefix, int retries = 3)
        //{
        //    return Policy.Handle<SqlException>().
        //        WaitAndRetryAsync(
        //            retryCount: retries,
        //            sleepDurationProvider: retry => TimeSpan.FromSeconds(5),
        //            onRetry: (exception, timeSpan, retry, ctx) =>
        //            {
        //                logger.LogWarning(exception, "[{prefix}] Exception {ExceptionType} with message {Message} detected on attempt {retry} of {retries}", prefix, exception.GetType().Name, exception.Message, retry, retries);
        //            }
        //        );
        //}
    }
}
