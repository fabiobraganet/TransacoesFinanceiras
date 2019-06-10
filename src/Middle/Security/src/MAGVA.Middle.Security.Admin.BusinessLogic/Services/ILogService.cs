using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Log;
using System.Threading.Tasks;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Services
{
    public interface ILogService
    {
        Task<LogsDto> GetLogsAsync(string search, int page = 1, int pageSize = 10);
    }
}