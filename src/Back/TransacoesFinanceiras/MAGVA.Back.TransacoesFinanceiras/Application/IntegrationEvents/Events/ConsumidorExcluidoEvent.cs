
namespace MAGVA.Back.TransacoesFinanceiras.Application.IntegrationEvents.Events
{
    using GlobalBase.EventBus.Events;

    public class ConsumidorExcluidoEvent : IntegrationEvent
    {
        public int ConsumidorId { get; set; }

        public ConsumidorExcluidoEvent(int id)
            => ConsumidorId = id;
    }
}
