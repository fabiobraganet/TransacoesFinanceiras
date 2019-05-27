using System.Threading.Tasks;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Log;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Services
{
    public interface ILogService
    {
        Task<LogsDto> GetLogsAsync(string search, int page = 1, int pageSize = 10);
    }
}