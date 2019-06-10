
namespace MAGVA.Back.TransacoesFinanceiras.Application.IntegrationEvents.Events
{
    using GlobalBase.EventBus.Events;

    public class ConsumidorCriadoEvent : IntegrationEvent
    {
        public int LoginId { get; set; }

        public ConsumidorCriadoEvent(int loginId)
            => LoginId = loginId;
    }
}
