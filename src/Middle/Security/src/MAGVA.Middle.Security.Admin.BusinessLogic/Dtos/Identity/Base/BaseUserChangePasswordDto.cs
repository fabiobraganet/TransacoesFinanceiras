namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Identity.Base
{
    public class BaseUserChangePasswordDto<TUserId>
    {
        public TUserId UserId { get; set; }
    }
}