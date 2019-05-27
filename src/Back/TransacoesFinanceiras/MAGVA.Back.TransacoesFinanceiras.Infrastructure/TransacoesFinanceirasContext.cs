
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure
{
    using System.Threading;
    using System.Threading.Tasks;
    using Domain.SendWork;
    using Microsoft.EntityFrameworkCore;

    public class TransacoesFinanceirasContext : DbContext, IUnitOfWork
    {
        public Task<bool> SaveEntitiesAsync(CancellationToken cancellationToken = default)
        {
            throw new System.NotImplementedException();
        }
    }
}
