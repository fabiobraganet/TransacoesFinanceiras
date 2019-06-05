
namespace MAGVA.Back.TransacoesFinanceiras.Domain.AggregatesModel.ConsumidorAggregate
{
    using Seedwork;
    using System.Threading.Tasks;

    public interface IConsumidorRepository : IRepository<Consumidor>
    {
        Consumidor Add(Consumidor consumidor);
        Consumidor Update(Consumidor consumidor);
        Consumidor Remove(Consumidor consumidor);
        Task<Consumidor> FindAsync(int loginid);
        Task<Consumidor> FindByIdAsync(int id);
    }
}
