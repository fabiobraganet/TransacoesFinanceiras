
namespace MAGVA.Front.TransacoesFinanceiras.Infrastructure.Services
{
    using System.Security.Principal;

    public interface IIdentityParser<T>
    {
        T Parse(IPrincipal principal);
    }
}
