
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.AutofacModules
{
    using Application.Behaviors;
    using Application.Command;
    using Application.Validations;
    using Autofac;
    using FluentValidation;
    using MediatR;
    using System.Reflection;

    public class MediatorModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(typeof(IMediator).GetTypeInfo().Assembly)
                .AsImplementedInterfaces();

            //---

            builder.RegisterAssemblyTypes(typeof(CriarConsumidorCommand).GetTypeInfo().Assembly)
                .AsClosedTypesOf(typeof(IRequestHandler<,>));

            builder
                .RegisterAssemblyTypes(typeof(CriarConsumidorCommandValidator).GetTypeInfo().Assembly)
                .Where(t => t.IsClosedTypeOf(typeof(IValidator<>)))
                .AsImplementedInterfaces();

            //---

            builder.RegisterAssemblyTypes(typeof(EditarConsumidorCommand).GetTypeInfo().Assembly)
                .AsClosedTypesOf(typeof(IRequestHandler<,>));

            builder
                .RegisterAssemblyTypes(typeof(EditarConsumidorCommandValidator).GetTypeInfo().Assembly)
                .Where(t => t.IsClosedTypeOf(typeof(IValidator<>)))
                .AsImplementedInterfaces();

            //---

            builder.RegisterAssemblyTypes(typeof(ExcluirConsumidorCommand).GetTypeInfo().Assembly)
                .AsClosedTypesOf(typeof(IRequestHandler<,>));

            builder
                .RegisterAssemblyTypes(typeof(ExcluirConsumidorCommandValidator).GetTypeInfo().Assembly)
                .Where(t => t.IsClosedTypeOf(typeof(IValidator<>)))
                .AsImplementedInterfaces();


            _ = builder.Register<ServiceFactory>(context =>
              {
                  var componentContext = context.Resolve<IComponentContext>();
                  return t => { object o; return componentContext.TryResolve(t, out o) ? o : null; };
              });

            builder.RegisterGeneric(typeof(LoggingBehavior<,>)).As(typeof(IPipelineBehavior<,>));
            builder.RegisterGeneric(typeof(ValidatorBehavior<,>)).As(typeof(IPipelineBehavior<,>));
            builder.RegisterGeneric(typeof(TransactionBehaviour<,>)).As(typeof(IPipelineBehavior<,>));

        }
    }
}
