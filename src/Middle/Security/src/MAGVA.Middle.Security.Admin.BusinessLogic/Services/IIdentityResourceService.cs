using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Configuration;
using System.Threading.Tasks;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Services
{
    public interface IIdentityResourceService
    {
        Task<IdentityResourcesDto> GetIdentityResourcesAsync(string search, int page = 1, int pageSize = 10);

        Task<IdentityResourceDto> GetIdentityResourceAsync(int identityResourceId);

        Task<bool> CanInsertIdentityResourceAsync(IdentityResourceDto identityResource);

        Task<int> AddIdentityResourceAsync(IdentityResourceDto identityResource);

        Task<int> UpdateIdentityResourceAsync(IdentityResourceDto identityResource);

        Task<int> DeleteIdentityResourceAsync(IdentityResourceDto identityResource);

        IdentityResourceDto BuildIdentityResourceViewModel(IdentityResourceDto identityResource);
    }
}