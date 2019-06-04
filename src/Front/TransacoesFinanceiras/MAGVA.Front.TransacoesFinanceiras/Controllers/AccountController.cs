﻿
namespace MAGVA.Front.TransacoesFinanceiras.Controllers
{
    using MAGVA.Front.TransacoesFinanceiras.Constants;
    using Microsoft.AspNetCore.Authentication;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Logging;
    using System.Collections.Generic;

    [Authorize]
    public class AccountController : BaseController
    {
        public AccountController(ILogger<AccountController> logger) : base(logger)
        {

        }

        public IActionResult AccessDenied()
        {
            return View();
        }

        public IActionResult Logout()
        {
            //return new SignOutResult(new List<string> { AuthorizationConsts.SignInScheme, AuthorizationConsts.OidcAuthenticationScheme },
            //    new AuthenticationProperties { RedirectUri = "/" });
            return new SignOutResult(new[] { "oidc", "Cookies" });
        }
    }
}
