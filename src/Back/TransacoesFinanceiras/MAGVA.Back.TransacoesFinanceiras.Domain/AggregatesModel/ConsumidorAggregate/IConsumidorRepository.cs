
namespace MAGVA.Back.TransacoesFinanceiras.Domain.AggregatesModel.ConsumidorAggregate
{
    using SendWork;
    using System.Threading.Tasks;

    public interface IConsumidorRepository : IRepository<Consumidor>
    {
        Consumidor Add(Consumidor consumidor);
        Consumidor Update(Consumidor consumidor);
        Task<Consumidor> FindAsync(int loginid);
        Task<Consumidor> FindByIdAsync(int id);
    }
}
