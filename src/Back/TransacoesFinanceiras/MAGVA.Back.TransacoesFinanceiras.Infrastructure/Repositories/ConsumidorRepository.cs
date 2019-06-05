
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.Repositories
{
    using Microsoft.EntityFrameworkCore;
    using Domain.AggregatesModel.ConsumidorAggregate;
    using Domain.Seedwork;
    using System;
    using System.Linq;
    using System.Threading.Tasks;

    public class ConsumidorRepository
        : IConsumidorRepository
    {
        private readonly TransacoesFinanceirasContext _context;
        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _context;
            }
        }

        public ConsumidorRepository(TransacoesFinanceirasContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public Consumidor Add(Consumidor consumidor)
        {
            if (consumidor.IsTransient())
            {
                return _context.Consumidores
                    .Add(consumidor)
                    .Entity;
            }
            else
            {
                return consumidor;
            }
        }

        public Consumidor Update(Consumidor consumidor)
        {
            return _context.Consumidores
                    .Update(consumidor)
                    .Entity;
        }

        public Consumidor Remove(Consumidor consumidor)
        {
            return _ = _context.Consumidores
                    .Remove(consumidor)
                    .Entity;
        }

        public async Task<Consumidor> FindAsync(int loginid)
        {
            var consumidor = await _context.Consumidores
                .Where(b => b.LoginId == loginid)
                .SingleOrDefaultAsync();

            return consumidor;
        }

        public async Task<Consumidor> FindByIdAsync(int id)
        {
            var consumidor = await _context.Consumidores
                .Where(b => b.Id == id)
                .SingleOrDefaultAsync();

            return consumidor;
        }
    }
}
