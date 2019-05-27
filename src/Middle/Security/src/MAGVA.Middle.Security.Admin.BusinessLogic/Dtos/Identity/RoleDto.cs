using System.ComponentModel.DataAnnotations;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity
{
    public class RoleDto : BaseRoleDto<int>
    {      
        [Required]
        public string Name { get; set; }
    }
}