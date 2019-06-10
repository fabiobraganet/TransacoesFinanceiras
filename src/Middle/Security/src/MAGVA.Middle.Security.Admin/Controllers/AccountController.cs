using MAGVA.Middle.Security.Admin.Constants;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace MAGVA.Middle.Security.Admin.Controllers
{
    [Authorize]
    public class AccountController : BaseController
    {
        public AccountController(ILogger<ConfigurationController> logger) : base(logger)
        {

        }

        public IActionResult AccessDenied()
        {
            return View();
        }

        public IActionResult Logout()
        {
            return new SignOutResult(new List<string> { AuthorizationConsts.SignInScheme, AuthorizationConsts.OidcAuthenticationScheme },
                new AuthenticationProperties { RedirectUri = "/" });
        }
    }
}
