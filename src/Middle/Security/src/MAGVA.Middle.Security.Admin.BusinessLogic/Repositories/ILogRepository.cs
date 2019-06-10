using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities;
using System.Threading.Tasks;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Repositories
{
    public interface ILogRepository
    {
        Task<PagedList<Log>> GetLogsAsync(string search, int page = 1, int pageSize = 10);
    }
}