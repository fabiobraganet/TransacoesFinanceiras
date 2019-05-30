
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.AutofacModules
{
    using Application.Command;
    using Application.Queries;
    using Autofac;
    using Domain.AggregatesModel.ConsumidorAggregate;
    using GlobalBase.EventBus.Abstractions;
    using Infrastructure.Idempotency;
    using Infrastructure.Repositories;
    using System.Reflection;

    public class ApplicationModule
        : Autofac.Module
    {

        public string QueriesConnectionString { get; }

        public ApplicationModule(string qconstr)
        {
            QueriesConnectionString = qconstr;
        }

        protected override void Load(ContainerBuilder builder)
        {

            builder.Register(c => new ConsumidorQueries(QueriesConnectionString))
                .As<IConsumidorQueries>()
                .InstancePerLifetimeScope();

            builder.RegisterType<ConsumidorRepository>()
                .As<IConsumidorRepository>()
                .InstancePerLifetimeScope();


            builder.RegisterType<RequestManager>()
               .As<IRequestManager>()
               .InstancePerLifetimeScope();

            builder.RegisterAssemblyTypes(typeof(CriarConsumidorCommandHandler).GetTypeInfo().Assembly)
                .AsClosedTypesOf(typeof(IIntegrationEventHandler<>));

        }
    }
}
