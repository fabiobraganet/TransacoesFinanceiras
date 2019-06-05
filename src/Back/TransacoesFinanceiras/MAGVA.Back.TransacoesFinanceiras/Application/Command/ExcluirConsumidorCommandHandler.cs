
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using Domain.AggregatesModel.ConsumidorAggregate;
    using Infrastructure.Idempotency;
    using Microsoft.Extensions.Logging;
    using System.Threading;
    using System.Threading.Tasks;
    using IntegrationEvents;
    using IntegrationEvents.Events;
    using Infrastructure.Services;

    public class ExcluirConsumidorCommandHandler : IRequestHandler<ExcluirConsumidorCommand, bool>
    {
        private readonly IMediator _mediator;
        private readonly IIdentityService _identityService;
        private readonly IConsumidorRepository _consumidorRepository;
        private readonly ITransacoesFinanceirasIntegrationEventService _transacoesFinanceirasIntegrationEventService;
        private readonly ILogger<ExcluirConsumidorCommandHandler> _logger;

        public ExcluirConsumidorCommandHandler(
            IMediator mediator,
            IIdentityService identityService,
            IConsumidorRepository consumidorRepository,
            ITransacoesFinanceirasIntegrationEventService transacoesFinanceirasIntegrationEventService,
            ILogger<ExcluirConsumidorCommandHandler> logger)
        {
            _mediator = mediator;
            _identityService = identityService;
            _consumidorRepository = consumidorRepository;
            _transacoesFinanceirasIntegrationEventService = transacoesFinanceirasIntegrationEventService;
            _logger = logger;
        }

        /// <summary>
        /// ....
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        public async Task<bool> Handle(ExcluirConsumidorCommand command, CancellationToken cancellationToken)
        {
            var consumidorToDelete = await _consumidorRepository.FindByIdAsync(command.Id);
            if (consumidorToDelete == null)
            {
                return false;
            }

            var user = _identityService.GetUserIdentityServer();
            var loginid = user.SUB;
            var loginname = user.Client_Id;

            _logger.LogInformation("----- Deleting Consumidor by loginid:{@loginid} name:{@loginname} - Consumidor: {@Consumidor}", loginid, loginname, command);

            var consumidorExcluido = _consumidorRepository.Remove(consumidorToDelete);

            _logger.LogInformation("----- Deleted Consumidor by loginid:{@loginid} name:{@loginname} - Consumidor: {@Consumidor}", loginid, loginname, command);

            var consumidorExcluidoEvent = new ConsumidorExcluidoEvent(consumidorExcluido.Id);
            await _transacoesFinanceirasIntegrationEventService.AddAndSaveEventAsync(consumidorExcluidoEvent);

            return await _consumidorRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }

    public class ExcluirConsumidorIdentifiedCommandHandler : IdentifiedCommandHandler<ExcluirConsumidorCommand, bool>
    {
        public ExcluirConsumidorIdentifiedCommandHandler(
            IMediator mediator,
            IRequestManager requestManager,
            ILogger<IdentifiedCommandHandler<ExcluirConsumidorCommand, bool>> logger)
            : base(mediator, requestManager, logger)
        {
        }

        protected override bool CreateResultForDuplicateRequest()
        {
            return true;
        }
    }
}
