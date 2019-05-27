
namespace MAGVA.Back.TransacoesFinanceiras.Base
{
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Diagnostics.HealthChecks;
    
    public static class CustomExtensionMethods
    {
        public static IServiceCollection AddCustomHealthCheck(this IServiceCollection services, IConfiguration configuration)
        {
            var hcBuilder = services.AddHealthChecks();

            hcBuilder.AddCheck("self", () => HealthCheckResult.Healthy());

            hcBuilder
                .AddSqlServer(
                    configuration["ConnectionString"],
                    name: "OrderingDB-check",
                    tags: new string[] { "orderingdb" });

            hcBuilder
                .AddRedis(
                    configuration["ConnectionString"],
                    name: "redis-check",
                    tags: new string[] { "redis" });

                hcBuilder
                    .AddRabbitMQ(
                        $"amqp://{configuration["EventBusConnection"]}",
                        name: "rabbitmqbus-check",
                        tags: new string[] { "rabbitmqbus" });

            return services;
        }
    }
}
