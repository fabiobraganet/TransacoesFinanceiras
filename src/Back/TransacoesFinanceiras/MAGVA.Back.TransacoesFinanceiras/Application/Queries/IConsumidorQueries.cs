
namespace MAGVA.Back.TransacoesFinanceiras.Application.Queries
{
    using System.Collections.Generic;
    using System.Threading.Tasks;

    public interface IConsumidorQueries
    {
        Task<Consumidor> GetConsumidorAsync(int loginid);
        Task<List<Consumidor>> GetConsumidoresAsync();
    }
}
