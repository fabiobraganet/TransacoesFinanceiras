using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base;
using System.ComponentModel.DataAnnotations;

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