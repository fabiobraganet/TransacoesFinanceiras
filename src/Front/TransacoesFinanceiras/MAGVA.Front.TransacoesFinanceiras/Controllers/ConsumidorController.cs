
namespace MAGVA.Front.TransacoesFinanceiras.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Services;
    using ViewModels;
    using Polly.CircuitBreaker;
    using System.Threading.Tasks;

    [Authorize]
    public class ConsumidorController : Controller
    {
        private readonly IIdentityParser<ApplicationUser> _appUserParser;
        public readonly IConsumidorService _consumidorService;

        public ConsumidorController(IIdentityParser<ApplicationUser> appUserParser, IConsumidorService consumidorService)
        {
            _appUserParser = appUserParser;
            _consumidorService = consumidorService;
        }

        public async Task<IActionResult> Index()
        {
            try
            {
                var user = _appUserParser.Parse(HttpContext.User);
                var vm = await _consumidorService.GetConsumidor(user);

                return View(vm);
            }
            catch (BrokenCircuitException)
            {             
                HandleBrokenCircuitException();
            }

            return View();
        }

        private void HandleBrokenCircuitException()
        {
            ViewBag.BasketInoperativeMsg = "O serviço de consumidor não está operacional";
        }
    }
}