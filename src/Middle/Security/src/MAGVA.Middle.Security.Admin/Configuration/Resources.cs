
namespace MAGVA.Middle.Security.Admin.Configuration
{
    using IdentityModel;
    using IdentityServer4.Models;
    using System.Collections.Generic;

    public class ClientResources
    {
        public static IEnumerable<IdentityResource> GetIdentityResources()
        {
            return new[]
            {
                new IdentityResources.OpenId(),
                new IdentityResources.Profile(),
                new IdentityResources.Email(),
                new IdentityResource("custom.profile", new[] { JwtClaimTypes.Name, JwtClaimTypes.Email, "location" }),
                new IdentityResource("roles", "Roles", new[] { "role" })
            };
        }

        public static IEnumerable<ApiResource> GetApiResources()
        {
            return new[]
            {
                new ApiResource("magvabacktransacoesfinanceiras", "Recurso de acesso da API Transações Financeiras")
                {
                    ApiSecrets =
                    {
                        new Secret("secret".Sha256())
                    },
                    Enabled = true,
                    Scopes = new List<Scope>()
                    {
                        new Scope() { Name = "transacoesfinanceiras", DisplayName = "Transações Financeiras", Required = true, ShowInDiscoveryDocument = true, Description = "Permissão para gerenciar e realizar operações financeiras." },
                        new Scope() { Name = "consumidores", DisplayName = "Consumidores", Required = false, ShowInDiscoveryDocument = true, Description = "Permissão para gerenciar o cadastro de consumidores." },
                    },
                    UserClaims = { "Read", "Write" }
                }
            };
        }
    }
}