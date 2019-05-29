
namespace MAGVA.Back.TransacoesFinanceiras.Application.Queries
{
    using System.Collections.Generic;
    using System.Threading.Tasks;

    interface IConsumidorQueries
    {
        Task<Consumidor> GetConsumidorAsync(int id);
        Task<List<Consumidor>> GetConsumidoresAsync();
    }
}
