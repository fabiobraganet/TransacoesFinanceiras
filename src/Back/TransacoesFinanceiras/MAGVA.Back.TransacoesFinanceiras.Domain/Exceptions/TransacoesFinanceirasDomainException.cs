
namespace MAGVA.Back.TransacoesFinanceiras.Domain.Exceptions
{
    using System;

    public class TransacoesFinanceirasDomainException : Exception
    {
        public TransacoesFinanceirasDomainException()
        { }

        public TransacoesFinanceirasDomainException(string message)
            : base(message)
        { }

        public TransacoesFinanceirasDomainException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }
}
