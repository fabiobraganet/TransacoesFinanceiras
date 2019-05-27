using AutoMapper;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Log;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Mappers
{
    public static class LogMappers
    {
        internal static IMapper Mapper { get; }

        static LogMappers()
        {
            Mapper = new MapperConfiguration(cfg => cfg.AddProfile<LogMapperProfile>())
                .CreateMapper();
        }

        public static LogDto ToModel(this Log log)
        {
            return Mapper.Map<LogDto>(log);
        }

        public static LogsDto ToModel(this PagedList<Log> logs)
        {
            return Mapper.Map<LogsDto>(logs);
        }
        
        public static Log ToEntity(this LogDto log)
        {
            return Mapper.Map<Log>(log);
        }
    }
}
