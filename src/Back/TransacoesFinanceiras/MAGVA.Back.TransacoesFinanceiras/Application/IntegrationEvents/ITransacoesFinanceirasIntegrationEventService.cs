
namespace MAGVA.Back.TransacoesFinanceiras.Application.IntegrationEvents
{
    using GlobalBase.EventBus.Events;
    using System;
    using System.Threading.Tasks;

    public interface ITransacoesFinanceirasIntegrationEventService
    {
        Task PublishEventsThroughEventBusAsync(Guid transactionId);
        Task AddAndSaveEventAsync(IntegrationEvent evt);
    }
}
