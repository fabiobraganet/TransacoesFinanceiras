
namespace MAGVA.Back.TransacoesFinanceiras.Tests.Dominio
{
    using Domain.AggregatesModel.ConsumidorAggregate;
    using System;
    using Xunit;

    public class ConsumidorAggregateTest
    {
        public ConsumidorAggregateTest() { }

        [Fact]
        public void Criar_Consumidores_ComSucesso()
        {
            var consumidor = new Consumidor("teste", "email@email.com", 1);

            Assert.NotNull(consumidor);
            Assert.True(consumidor.Id.Equals(0));
            Assert.Contains("teste", consumidor.Nome);
            Assert.Contains("email@email.com", consumidor.Email);
            Assert.True(consumidor.LoginId.Equals(1));
            Assert.True(consumidor.Ativo);
        }

        [Fact]
        public void Criar_Consumidor_SemNome_SemSucesso()
        {
            Assert.Throws<ArgumentNullException>(() => new  Consumidor(string.Empty, "email@email.com", 1));
        }

        [Fact]
        public void Criar_Consumidor_SemEmail_SemSucesso()
        {
            Assert.Throws<ArgumentNullException>(() => new Consumidor("Teste", string.Empty, 1));
        }

        [Fact]
        public void Desativar_Ativar_Consumidor_ComSucesso()
        {
            var consumidor = new Consumidor("teste", "email@email.com", 1);

            consumidor.Desativar();

            Assert.False(consumidor.Ativo);

            consumidor.Ativar();

            Assert.True(consumidor.Ativo);
        }

        [Fact]
        public void Consumidor_Parte_Nome_Requer_Auditoria_ComSucesso()
        {
            string notificacao = string.Empty;
            string parterequerauditoria = "pneumoultramicroscopicossilicovulcanoconiótico";
            var consumidor = new Consumidor($"parte do nome {parterequerauditoria}", "email@email.com", 1);

            if (consumidor.DomainEvents.Count > 0)
            {
                foreach (dynamic item in consumidor.DomainEvents)
                {
                    string evento = item.ToString();
                    if (evento.Contains("ConsumidorRequerAuditoriaDomainEvent"))
                    {
                        notificacao = evento;
                        Assert.Contains($"({parterequerauditoria})", item.Motivo);
                        Assert.Equal(DateTime.UtcNow.Year, ((DateTime)item.Data).Year);
                    }
                }
            }

            Assert.Contains("ConsumidorRequerAuditoriaDomainEvent", notificacao);
        }

    }
}
