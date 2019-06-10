using AutoMapper;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Log;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Mappers
{
    public class LogMapperProfile : Profile
    {
        public LogMapperProfile()
        {
            CreateMap<Log, LogDto>(MemberList.Destination)
                .ReverseMap();

            CreateMap<PagedList<Log>, LogsDto>(MemberList.Destination)
                .ForMember(x => x.Logs, opt => opt.MapFrom(src => src.Data));
        }
    }
}
