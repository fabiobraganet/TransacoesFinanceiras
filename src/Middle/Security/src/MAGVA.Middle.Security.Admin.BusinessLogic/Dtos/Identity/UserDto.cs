using System;
using System.ComponentModel.DataAnnotations;
using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity
{
    public class UserDto : BaseUserDto<int>
    {        
        [Required]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public bool EmailConfirmed { get; set; }

        public string PhoneNumber { get; set; }

        public bool PhoneNumberConfirmed { get; set; }

        public bool LockoutEnabled { get; set; }

        public bool TwoFactorEnabled { get; set; }

        public string AccessFailedCount { get; set; }

        public DateTimeOffset? LockoutEnd { get; set; }
    }
}
