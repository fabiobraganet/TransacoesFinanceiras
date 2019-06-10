
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using Domain.AggregatesModel.ConsumidorAggregate;
    using Infrastructure.Idempotency;
    using Infrastructure.Services;
    using IntegrationEvents;
    using IntegrationEvents.Events;
    using MediatR;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Threading;
    using System.Threading.Tasks;

    public class CriarConsumidorCommandHandler
         : IRequestHandler<CriarConsumidorCommand, bool>
    {
        private readonly IConsumidorRepository _consumidorRepository;
        private readonly IIdentityService _identityService;
        private readonly IMediator _mediator;
        private readonly ITransacoesFinanceirasIntegrationEventService _transacoesFinanceirasIntegrationEventService;
        private readonly ILogger<CriarConsumidorCommandHandler> _logger;

        public CriarConsumidorCommandHandler(IMediator mediator,
            ITransacoesFinanceirasIntegrationEventService transacoesFinanceirasIntegrationEventService,
            IConsumidorRepository consumidorRepository,
            IIdentityService identityService,
            ILogger<CriarConsumidorCommandHandler> logger)
        {
            _consumidorRepository = consumidorRepository ?? throw new ArgumentNullException(nameof(consumidorRepository));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _transacoesFinanceirasIntegrationEventService = transacoesFinanceirasIntegrationEventService ?? throw new ArgumentNullException(nameof(transacoesFinanceirasIntegrationEventService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<bool> Handle(CriarConsumidorCommand message, CancellationToken cancellationToken)
        {
            var consumidor = new Consumidor(message.Nome, message.Email, message.LoginId);

            var user = _identityService.GetUserIdentityServer();
            var loginid = user.SUB;
            var loginname = user.Client_Id;

            _logger.LogInformation("----- Creating Consumidor by loginid:{@loginid} name:{@loginname} - Consumidor: {@Consumidor}", loginid, loginname, consumidor);

            _consumidorRepository.Add(consumidor);

            var ConsumidorCriadoEvent = new ConsumidorCriadoEvent(message.LoginId);
            _logger.LogInformation("----- Created Consumidor by loginid:{@loginid} name:{@loginname} - Consumidor: {@Consumidor}", loginid, loginname, consumidor);
            await _transacoesFinanceirasIntegrationEventService.AddAndSaveEventAsync(ConsumidorCriadoEvent);

            return await Task.FromResult(true);
        }

    }

    public class CriarConsumidorIdentifiedCommandHandler : IdentifiedCommandHandler<CriarConsumidorCommand, bool>
    {
        public CriarConsumidorIdentifiedCommandHandler(
            IMediator mediator,
            IRequestManager requestManager,
            ILogger<IdentifiedCommandHandler<CriarConsumidorCommand, bool>> logger)
            : base(mediator, requestManager, logger)
        {
        }

        protected override bool CreateResultForDuplicateRequest()
        {
            return true;
        }
    }
}
