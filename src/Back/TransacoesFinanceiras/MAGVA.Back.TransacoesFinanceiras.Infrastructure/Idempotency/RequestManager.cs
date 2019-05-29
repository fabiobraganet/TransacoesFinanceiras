

namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.Idempotency
{
    using Domain.Exceptions;
    using System;
    using System.Threading.Tasks;

    public class RequestManager : IRequestManager
    {
        private readonly TransacoesFinanceirasContext _context;

        public RequestManager(TransacoesFinanceirasContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }


        public async Task<bool> ExistAsync(Guid id)
        {
            var request = await _context.
                FindAsync<ClientRequest>(id);

            return request != null;
        }

        public async Task CreateRequestForCommandAsync<T>(Guid id)
        {
            var exists = await ExistAsync(id);

            var request = exists ?
                throw new TransacoesFinanceirasDomainException($"Request with {id} already exists") :
                new ClientRequest()
                {
                    Id = id,
                    Name = typeof(T).Name,
                    Time = DateTime.UtcNow
                };

            _context.Add(request);

            await _context.SaveChangesAsync();
        }
    }
}
