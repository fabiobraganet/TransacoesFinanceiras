using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base;
using System.ComponentModel.DataAnnotations;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity
{
    public class UserChangePasswordDto : BaseUserChangePasswordDto<int>
    {
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        [Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }
    }
}
