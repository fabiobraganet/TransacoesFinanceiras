
namespace MAGVA.Back.TransacoesFinanceiras.Domain.AggregatesModel.ConsumidorAggregate
{
    using Events;
    using Seedwork;
    using System;
    using System.Text.RegularExpressions;

    public class Consumidor
      : Entity, IAggregateRoot
    {
        public string Nome { get; private set; }
        public string Email { get; private set; }
        public int LoginId { get; private set; }
        public bool Ativo { get; set; }
        
        protected Consumidor()
        {
        }

        public Consumidor(string nome, string email, int loginid) : this()
        {
            LoginId = loginid > 0  ? loginid : throw new ArgumentNullException(nameof(loginid));
            Nome = !string.IsNullOrWhiteSpace(nome) ? nome : throw new ArgumentNullException(nameof(nome));
            Email = !string.IsNullOrWhiteSpace(email) ? email : throw new ArgumentNullException(nameof(email));
            Ativo = true;
            Auditar();
        }
        public Consumidor(int id, string nome, string email, int loginid) : this()
        {
            Id = id;
            LoginId = loginid > 0 ? loginid : throw new ArgumentNullException(nameof(loginid));
            Nome = !string.IsNullOrWhiteSpace(nome) ? nome : throw new ArgumentNullException(nameof(nome));
            Email = !string.IsNullOrWhiteSpace(email) ? email : throw new ArgumentNullException(nameof(email));
            Ativo = true;
            Auditar();
        }

        public void Ativar() =>
            Ativo = true;

        public void Desativar() =>
            Ativo = false;

        private void Auditar()
        {
            AuditarNome();
        }

        private void AuditarNome()
        {
            if (Nome.Length > 80)
            {
                AddDomainEvent(new ConsumidorRequerAuditoriaDomainEvent(this, $"Foi identificado que o nome do consumidor é longo demais. ({Nome})"));
                return;
            }

            foreach (var parte in Nome.Split(' '))
            {
                if (parte.Length > 12)
                {
                    AddDomainEvent(new ConsumidorRequerAuditoriaDomainEvent(this, $"Foi identificado que uma parte do nome do consumidor é longa demais. Parte: ({parte})"));
                    return;
                }
            }

            if (!Regex.IsMatch(Nome, @"^[a-zA-Z]+$"))
            {
                AddDomainEvent(new ConsumidorRequerAuditoriaDomainEvent(this, $"Foi identificado que o nome contém caracteres suspeitos. ({Nome})"));
                return;
            }
        }

    }
}
