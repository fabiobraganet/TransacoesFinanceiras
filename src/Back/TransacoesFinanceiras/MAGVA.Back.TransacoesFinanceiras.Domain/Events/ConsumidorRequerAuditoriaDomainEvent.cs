
namespace MAGVA.Back.TransacoesFinanceiras.Domain.Events
{
    using AggregatesModel.ConsumidorAggregate;
    using MediatR;
    using System;

    public class ConsumidorRequerAuditoriaDomainEvent
        : INotification
    {
        public Consumidor Consumidor { get; private set; }
        public string Motivo { get; private set; }
        public DateTime Data { get; private set; }

        public ConsumidorRequerAuditoriaDomainEvent(Consumidor consumidor, string motivo)
        {
            Consumidor = consumidor;
            Motivo = motivo;
            Data = DateTime.UtcNow;
        }
    }
}
