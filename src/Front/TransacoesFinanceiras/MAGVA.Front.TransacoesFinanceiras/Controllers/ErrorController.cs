
namespace MAGVA.Front.TransacoesFinanceiras.Controllers
{
    using MAGVA.Front.TransacoesFinanceiras.Models;
    using Microsoft.AspNetCore.Mvc;
    using System.Diagnostics;

    public class ErrorController : Controller
    {
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
