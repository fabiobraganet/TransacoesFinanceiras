using System.Collections.Generic;

namespace MAGVA.Middle.Security.Admin.Constants
{
    public class AuthorizationConsts
    {
        public const string AdministrationPolicy = "RequireAdministratorRole";
        public const string AdministrationRole = "admrole";

        public const string ApiTansacoesFinanceirashttpuri = "http://magvabacktransacoesfinanceiras:15001";
        public const string ApiTansacoesFinanceirashttpsuri = "https://magvabacktransacoesfinanceiras:15002";

        public const string IdentityAdminCookieName = "IdentityServerAdmin";
        public const string IdentityAdminRedirectUri = "http://magvamiddlesecurityadmin:14001/signin-oidc";
        public const string IdentityServerBaseUrl = "http://magvamiddlesecurityaspnetidentity:14000";
        public const string IdentityAdminBaseUrl = "http://magvamiddlesecurityadmin:14001";

        public const string UserNameClaimType = "name";
        public const string SignInScheme = "Cookies";
        public const string OidcClientId = "administrator";
        public const string OidcAuthenticationScheme = "oidc";
        public const string OidcResponseType = "id_token";
        public static List<string> Scopes = new List<string> { "openid", "profile", "email", "roles" };

        public const string ScopeOpenId = "openid";
        public const string ScopeProfile = "profile";
        public const string ScopeEmail = "email";
        public const string ScopeRoles = "roles";

        public const string AccountLoginPage = "Account/Login";
        public const string AccountAccessDeniedPage = "/Account/AccessDenied/";
    }
}