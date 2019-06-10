using IdentityServer4.EntityFramework.Entities;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities;
using System.Threading.Tasks;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Repositories
{
    public interface IPersistedGrantRepository
    {
        Task<PagedList<PersistedGrantDataView>> GetPersitedGrantsByUsers(string search, int page = 1, int pageSize = 10);
        Task<PagedList<PersistedGrant>> GetPersitedGrantsByUser(string subjectId, int page = 1, int pageSize = 10);
        Task<PersistedGrant> GetPersitedGrantAsync(string key);
        Task<int> DeletePersistedGrantAsync(string key);
        Task<int> DeletePersistedGrantsAsync(int userId);
        Task<bool> ExistsPersistedGrantsAsync(string subjectId);
        Task<int> SaveAllChangesAsync();
    }
}