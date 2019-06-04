
namespace MAGVA.Front.TransacoesFinanceiras.Services
{
    using ViewModels;
    using System.Threading.Tasks;

    public interface IConsumidorService
    {
        Task<Consumidor> GetConsumidor(ApplicationUser user);
    }
}
