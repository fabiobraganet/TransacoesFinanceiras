
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using Domain.AggregatesModel.ConsumidorAggregate;
    using Infrastructure.Idempotency;
    using Infrastructure.Services;
    using IntegrationEvents;
    using IntegrationEvents.Events;
    using MediatR;
    using Microsoft.Extensions.Logging;
    using System.Threading;
    using System.Threading.Tasks;

    public class EditarConsumidorCommandHandler : IRequestHandler<EditarConsumidorCommand, bool>
    {
        private readonly IMediator _mediator;
        private readonly IIdentityService _identityService;
        private readonly IConsumidorRepository _consumidorRepository;
        private readonly ITransacoesFinanceirasIntegrationEventService _transacoesFinanceirasIntegrationEventService;
        private readonly ILogger<EditarConsumidorCommandHandler> _logger;

        public EditarConsumidorCommandHandler(
            IMediator mediator,
            IIdentityService identityService,
            IConsumidorRepository consumidorRepository,
            ITransacoesFinanceirasIntegrationEventService transacoesFinanceirasIntegrationEventService,
            ILogger<EditarConsumidorCommandHandler> logger)
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
        public async Task<bool> Handle(EditarConsumidorCommand command, CancellationToken cancellationToken)
        {
            var consumidorToUpdate = await _consumidorRepository.FindByIdAsync(command.Id);
            if (consumidorToUpdate == null)
            {
                return false;
            }

            var user = _identityService.GetUserIdentityServer();
            var loginid = user.SUB;
            var loginname = user.Client_Id;

            _logger.LogInformation("----- Editing Consumidor by loginid:{@loginid} name:{@loginname} - Consumidor: {@Consumidor}", loginid, loginname, command);

            var consumidorEditado = _consumidorRepository.Update(new Consumidor(
                id: command.Id,
                nome: command.Nome,
                email: command.Email,
                loginid: command.LoginId));

            _logger.LogInformation("----- Edited Consumidor by loginid:{@loginid} name:{@loginname} - Consumidor: {@Consumidor}", loginid, loginname, command);
            var consumidorEditadoEvent = new ConsumidorEditadoEvent(consumidorEditado.Id);
            await _transacoesFinanceirasIntegrationEventService.AddAndSaveEventAsync(consumidorEditadoEvent);

            return await _consumidorRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        }
    }

    public class EditarConsumidorIdentifiedCommandHandler : IdentifiedCommandHandler<EditarConsumidorCommand, bool>
    {
        public EditarConsumidorIdentifiedCommandHandler(
            IMediator mediator,
            IRequestManager requestManager,
            ILogger<IdentifiedCommandHandler<EditarConsumidorCommand, bool>> logger)
            : base(mediator, requestManager, logger)
        {
        }

        protected override bool CreateResultForDuplicateRequest()
        {
            return true;
        }
    }
}
