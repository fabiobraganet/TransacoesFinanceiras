
namespace MAGVA.Back.TransacoesFinanceiras.Controllers
{
    using Application.Command;
    using Application.Queries;
    using GlobalBase.EventBus.Extensions;
    using Infrastructure.Services;
    using MediatR;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Collections.Generic;
    using System.Net;
    using System.Threading.Tasks;

    [Route("api/v1/[controller]")]
    [Authorize()]
    [ApiController]
    public class ConsumidorController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IConsumidorQueries _consumidorQueries;
        private readonly IIdentityService _identityService;
        private readonly ILogger<ConsumidorController> _logger;

        public ConsumidorController(
            IMediator mediator,
            IConsumidorQueries orderQueries,
            IIdentityService identityService,
            ILogger<ConsumidorController> logger)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _consumidorQueries = orderQueries ?? throw new ArgumentNullException(nameof(orderQueries));
            _identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<Consumidor>), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<ActionResult> GetConsumidoresAsync()
        {
            try
            {
                var userid = _identityService.GetUserIdentity();
                var consumidores = await _consumidorQueries.GetConsumidoresAsync();

                return Ok(consumidores);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("{loginid:int}")]
        [HttpGet]
        [ProducesResponseType(typeof(Consumidor), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<ActionResult> GetConsumidorAsync(int loginid)
        {
            try
            {
                var consumidor = await _consumidorQueries.GetConsumidorAsync(loginid);

                return Ok(consumidor);
            }
            catch
            {
                return NotFound();
            }
        }
        
        [HttpPost]
        public async Task<ActionResult<bool>> CriarConsumidorAsync([FromBody] CriarConsumidorCommand criarConsumidorCommand)
        {
            _logger.LogInformation(
                "----- Sending command: {CommandName} - {IdProperty}: {CommandId} ({@Command})",
                criarConsumidorCommand.GetGenericTypeName(),
                nameof(criarConsumidorCommand.LoginId),
                criarConsumidorCommand.LoginId,
                criarConsumidorCommand);

            return await _mediator.Send(criarConsumidorCommand);
        }
        
        [HttpPut]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> EditarConsumidorAsync([FromBody]EditarConsumidorCommand editarConsumidorCommand, [FromHeader(Name = "x-requestid")] string requestId)
        {
            bool commandResult = false;

            if (Guid.TryParse(requestId, out Guid guid) && guid != Guid.Empty)
            {
                var requestEditarConsumidor = new IdentifiedCommand<EditarConsumidorCommand, bool>(editarConsumidorCommand, guid);

                _logger.LogInformation(
                    "----- Sending command: {CommandName} - {IdProperty}: {CommandId} ({@Command})",
                    requestEditarConsumidor.GetGenericTypeName(),
                    nameof(requestEditarConsumidor.Command.Id),
                    requestEditarConsumidor.Command.Id,
                    requestEditarConsumidor);

                commandResult = await _mediator.Send(requestEditarConsumidor);
            }

            if (!commandResult)
            {
                return BadRequest();
            }

            return Ok();
        }

        [HttpDelete]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> DeleteConsumidorAsync([FromBody]ExcluirConsumidorCommand excluirConsumidorCommand, [FromHeader(Name = "x-requestid")] string requestId)
        {
            bool commandResult = false;

            if (Guid.TryParse(requestId, out Guid guid) && guid != Guid.Empty)
            {
                var requestExcluirConsumidor = new IdentifiedCommand<ExcluirConsumidorCommand, bool>(excluirConsumidorCommand, guid);

                _logger.LogInformation(
                    "----- Sending command: {CommandName} - {IdProperty}: {CommandId} ({@Command})",
                    requestExcluirConsumidor.GetGenericTypeName(),
                    nameof(requestExcluirConsumidor.Command.Id),
                    requestExcluirConsumidor.Command.Id,
                    requestExcluirConsumidor);

                commandResult = await _mediator.Send(requestExcluirConsumidor);
            }

            if (!commandResult)
            {
                return BadRequest();
            }

            return Ok();
        }

    }
}