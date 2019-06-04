
namespace MAGVA.Front.TransacoesFinanceiras.Services
{
    using System.Threading.Tasks;
    using ViewModels;

    public interface IConsumidorService
    {
        Task<Consumidor> GetConsumidor(ApplicationUser user);
        Task<string> PostConsumidor(Consumidor consumidor);
    }
}
