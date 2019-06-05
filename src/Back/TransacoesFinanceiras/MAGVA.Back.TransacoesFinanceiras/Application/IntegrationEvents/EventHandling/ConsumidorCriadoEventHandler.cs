using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MAGVA.Back.TransacoesFinanceiras.Application.IntegrationEvents.EventHandling
{
    using MediatR;
    using GlobalBase.EventBus.Abstractions;
    using GlobalBase.EventBus.Extensions;
    using Domain.AggregatesModel.ConsumidorAggregate;
    using Microsoft.Extensions.Logging;
    using Application.Behaviors;
    using Application.Command;
    using Application.IntegrationEvents.Events;
    using Serilog.Context;
    using System.Threading.Tasks;

    public class ConsumidorCriadoEventHandler : IIntegrationEventHandler<ConsumidorCriadoEvent>
    {
        private readonly IMediator _mediator;
        private readonly ILogger<ConsumidorCriadoEventHandler> _logger;

        public ConsumidorCriadoEventHandler(
            IMediator mediator,
            ILogger<ConsumidorCriadoEventHandler> logger)
        {
            _mediator = mediator;
            _logger = logger ?? throw new System.ArgumentNullException(nameof(logger));
        }

        /// <summary>
        /// </summary>
        /// <param name="event">       
        /// </param>
        /// <returns></returns>
        public async Task Handle(ConsumidorCriadoEvent @event)
        {
            using (LogContext.PushProperty("IntegrationEventContext", $"{@event.Id}-{Program.AppName}"))
            {
                _logger.LogInformation("----- Handling integration event: {IntegrationEventId} at {AppName} - ({@IntegrationEvent})", @event.Id, Program.AppName, @event);
                await Task.Run(() => { });
            }
        }
    }
}
