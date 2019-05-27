using System.Threading.Tasks;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Log;
using MAGVA.Middle.Security.Admin.BusinessLogic.Mappers;
using MAGVA.Middle.Security.Admin.BusinessLogic.Repositories;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Services
{
    public class LogService : ILogService
    {
        private readonly ILogRepository _repository;

        public LogService(ILogRepository repository)
        {
            _repository = repository;
        }

        public async Task<LogsDto> GetLogsAsync(string search, int page = 1, int pageSize = 10)
        {
            var pagedList = await _repository.GetLogsAsync(search, page, pageSize);
            var logs = pagedList.ToModel();

            return logs;
        }
    }
}
