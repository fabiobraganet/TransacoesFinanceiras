
namespace MAGVA.Back.TransacoesFinanceiras.Domain.AggregatesModel.ConsumidorAggregate
{
    using SendWork;
    using System;

    public class Consumidor
      : Entity, IAggregateRoot
    {
        public int LoginId { get; private set; }
        public string Nome { get; private set; }
        public string Email { get; private set; }
        public bool Ativo { get; set; }
        
        protected Consumidor()
        {
        }

        public Consumidor(int loginid, string nome, string email) : this()
        {
            LoginId = loginid > 0  ? loginid : throw new ArgumentNullException(nameof(loginid));
            Nome = !string.IsNullOrWhiteSpace(nome) ? nome : throw new ArgumentNullException(nameof(nome));
            Email = !string.IsNullOrWhiteSpace(email) ? email : throw new ArgumentNullException(nameof(email));
        }
    }
}
