
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.Services
{
    public interface IIdentityService
    {
        UserIdentityServer GetUserIdentityServer();
        string GetUserIdentity();

        string GetUserName();
    }
}
