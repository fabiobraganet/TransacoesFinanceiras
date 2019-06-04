
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

                if (string.IsNullOrEmpty(vm.Nome))
                    vm = null;

                return View(vm);
            }
            catch (BrokenCircuitException)
            {             
                HandleBrokenCircuitException();
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Nome,Email")] Consumidor consumidor)
        {
            try
            {
                string result = null;

                if (ModelState.IsValid)
                {
                    var user = _appUserParser.Parse(HttpContext.User);

                    consumidor.LoginId = user.Id;
                    consumidor.Ativo = true;

                    result = await _consumidorService.PostConsumidor(consumidor);

                    consumidor = null;
                    if (result.Contains("OK"))
                    {
                        consumidor = await _consumidorService.GetConsumidor(user);
                    }
                }

                return View(consumidor);
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