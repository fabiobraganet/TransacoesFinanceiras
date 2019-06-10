
namespace MAGVA.Front.TransacoesFinanceiras.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Models;
    using Polly.CircuitBreaker;
    using Services;
    using System.Diagnostics;
    using System.Threading.Tasks;
    using ViewModels;

    [Authorize()]
    public class HomeController : Controller
    {
        private readonly IIdentityParser<ApplicationUser> _appUserParser;
        public readonly IConsumidorService _consumidorService;

        public HomeController(IIdentityParser<ApplicationUser> appUserParser, IConsumidorService consumidorService)
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

        private void HandleBrokenCircuitException()
        {
            ViewBag.BasketInoperativeMsg = "O serviço de consumidor não está operacional";
        }

        [AllowAnonymous()]
        public IActionResult Privacy()
        {
            return View();
        }

        [AllowAnonymous()]
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
