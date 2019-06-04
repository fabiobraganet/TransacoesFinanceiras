
namespace MAGVA.Front.TransacoesFinanceiras.Constants
{
    using System.Collections.Generic;
    
    public class AuthorizationConsts
    {
        public const string TransacoesFinanceirasPolicy = "TransacoesFinanceirasRole";
        public const string TransacoesFinanceirasRole = "transacoesfinanceirasrole";
        public const string TransacoesFinanceirasResource = "magvafonttransacoesfinanceiras";

        public const string ApiTansacoesFinanceirashttpuri = "http://magvabacktransacoesfinanceiras:15001";
        public const string ApiTansacoesFinanceirasResource = "magvabacktransacoesfinanceiras";
        
        public const string IdentityCookieName = "IdentityServerAdmin";
        public const string IdentityRedirectUri = "http://magvafronttransacoesfinanceiras:15000/signin-oidc";
        public const string IdentityServerBaseUrl = "http://magvamiddlesecurityaspnetidentity:14000";
        public const string BaseUrl = "http://magvafronttransacoesfinanceiras:15000";

        public const string UserNameClaimType = "name";
        public const string SignInScheme = "Cookies";
        public const string OidcClientId = "transacoesfinanceiras";
        public const string OidcAuthenticationScheme = "oidc";
        public const string OidcResponseType = "id_token";
        public static List<string> Scopes = new List<string> { "openid", "profile", "email", "roles" };

        public const string ScopeOpenId = "openid";
        public const string ScopeProfile = "profile";
        public const string ScopeEmail = "email";
        public const string ScopeRoles = "roles";
        public const string ScopeTransacoesFinanceiras = "transacoesfinanceiras";

        public const string AccountLoginPage = "Account/Login";
        public const string AccountAccessDeniedPage = "/Account/AccessDenied/";
    }
}
