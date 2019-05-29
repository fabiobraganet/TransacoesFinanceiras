
namespace MAGVA.Back.TransacoesFinanceiras.Controllers
{
    using Application.Queries;
    using MediatR;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Net;
    using System.Threading.Tasks;

    [Route("api/v1/[controller]")]
    [Authorize]
    [ApiController]
    public class ConsumidorController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IConsumidorQueries _consumidorQueries;
        //private readonly IIdentityService _identityService;
        private readonly ILogger<ConsumidorController> _logger;

        public ConsumidorController(
            IMediator mediator,
            IConsumidorQueries orderQueries,
            //IIdentityService identityService,
            ILogger<ConsumidorController> logger)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _consumidorQueries = orderQueries ?? throw new ArgumentNullException(nameof(orderQueries));
            //_identityService = identityService ?? throw new ArgumentNullException(nameof(identityService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        [AllowAnonymous]
        [Route("{id:int}")]
        [HttpGet]
        [ProducesResponseType(typeof(Consumidor), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<ActionResult> GetConsumidorAsync(int id)
        {
            try
            {
                var consumidor = await _consumidorQueries.GetConsumidorAsync(id);

                return Ok(consumidor);
            }
            catch
            {
                return NotFound();
            }
        }

    }
}