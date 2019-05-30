
namespace MAGVA.Back.TransacoesFinanceiras.Application.IntegrationEvents.Events
{
    using GlobalBase.EventBus.Events;
    
    public class ConsumidorStartedIntegrationEvent : IntegrationEvent
    {
        public int LoginId { get; set; }

        public ConsumidorStartedIntegrationEvent(int loginId)
            => LoginId = loginId;
    }
}
