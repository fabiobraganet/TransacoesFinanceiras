using System.ComponentModel.DataAnnotations;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity
{
    public class UserClaimDto : BaseUserClaimDto<int, int>
    {
        [Required]
        public string ClaimType { get; set; }

        [Required]
        public string ClaimValue { get; set; }
    }
}