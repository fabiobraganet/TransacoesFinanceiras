
namespace MAGVA.GlobalBase.EventBus.Abstractions
{
    using Events;
    using System.Threading.Tasks;

    public interface IIntegrationEventHandler<in TIntegrationEvent> : IIntegrationEventHandler
        where TIntegrationEvent : IntegrationEvent
    {
        Task Handle(TIntegrationEvent @event);
    }

    public interface IIntegrationEventHandler
    {
    }
}
