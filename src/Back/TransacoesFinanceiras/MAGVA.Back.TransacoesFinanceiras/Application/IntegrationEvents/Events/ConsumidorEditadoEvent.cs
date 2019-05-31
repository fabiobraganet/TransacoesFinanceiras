
namespace MAGVA.Back.TransacoesFinanceiras.Application.IntegrationEvents.Events
{
    using GlobalBase.EventBus.Events;
    
    public class ConsumidorEditadoEvent : IntegrationEvent
    {
        public int ConsumidorId { get; set; }

        public ConsumidorEditadoEvent(int id)
            => ConsumidorId = id;
    }
}
