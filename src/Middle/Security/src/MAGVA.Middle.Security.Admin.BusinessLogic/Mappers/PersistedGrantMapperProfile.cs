using AutoMapper;
using IdentityServer4.EntityFramework.Entities;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Grant;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Mappers
{
    public class PersistedGrantMapperProfile : Profile
    {
        public PersistedGrantMapperProfile()
        {
            // entity to model
            CreateMap<PersistedGrant, PersistedGrantDto>(MemberList.Destination)
                .ReverseMap();

            CreateMap<PersistedGrantDataView, PersistedGrantDto>(MemberList.Destination);

            CreateMap<PagedList<PersistedGrantDataView>, PersistedGrantsDto>(MemberList.Destination)
                .ForMember(x => x.PersistedGrants,
                    opt => opt.MapFrom(src => src.Data));

            CreateMap<PagedList<PersistedGrant>, PersistedGrantsDto>(MemberList.Destination)
                .ForMember(x => x.PersistedGrants,
                    opt => opt.MapFrom(src => src.Data));
        }
    }
}
