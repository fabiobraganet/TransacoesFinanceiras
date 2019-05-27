﻿

namespace MAGVA.Back.TransacoesFinanceiras.Domain.SendWork
{
    public interface IRepository<T> where T : IAggregateRoot
    {
        IUnitOfWork UnitOfWork { get; }
    }
}
