
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.Services
{
    using Microsoft.AspNetCore.Http;
    using System;
    using System.Collections.Generic;

    public class IdentityService : IIdentityService
    {
        private IHttpContextAccessor _context;

        public IdentityService(IHttpContextAccessor context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public UserIdentityServer GetUserIdentityServer()
            => new UserIdentityServer(_context.HttpContext.User);

        public string GetUserIdentity()
            => _context.HttpContext.User.FindFirst("sub").Value;

        public string GetUserName()
            => _context.HttpContext.User.Identity.Name;
    }

    public class UserIdentityServer
    {
        public string NBF { get; private set; }
        public string EXP { get; private set; }
        public string ISS { get; private set; }
        public List<string> AUD { get; private set; }
        public string Client_Id { get; private set; }
        public string SUB { get; private set; }
        public string Auth_Time { get; private set; }
        public List<string> Scope { get; private set; }

        public UserIdentityServer(System.Security.Claims.ClaimsPrincipal claims)
        {
            NBF = claims.FindFirst("nbf").Value;
            EXP = claims.FindFirst("exp").Value;
            ISS = claims.FindFirst("iss").Value;
            Client_Id = claims.FindFirst("client_id").Value;
            SUB = claims.FindFirst("sub").Value;
            Auth_Time = claims.FindFirst("auth_time").Value;

            AUD = new List<string>();
            foreach (var claim in claims.FindAll("AUD"))
                AUD.Add(claim.Value);

            Scope = new List<string>();
            foreach (var claim in claims.FindAll("scope"))
                Scope.Add(claim.Value);
        }
    }
}
