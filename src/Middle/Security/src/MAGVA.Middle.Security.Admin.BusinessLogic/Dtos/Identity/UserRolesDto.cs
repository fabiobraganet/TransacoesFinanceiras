using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base;
using System.Collections.Generic;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity
{
    public class UserRolesDto : BaseUserRolesDto<int, int>
    {
        public UserRolesDto()
        {
            Roles = new List<RoleDto>();
        }

        public List<SelectItem> RolesList { get; set; }

        public List<RoleDto> Roles { get; set; }

        public int PageSize { get; set; }

        public int TotalCount { get; set; }
    }
}
