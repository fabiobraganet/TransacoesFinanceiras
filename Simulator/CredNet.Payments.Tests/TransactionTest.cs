
namespace CredNet.Payments.Tests
{
    using CredNet.Payments.Models;
    using System;
    using Xunit;

    public class TransactionTest
    {
        public TransactionTest() { }

        [Fact]
        public void Criar_Transaction_InformacoesMinimas_ComSucesso()
        {
            var transaction = new Transaction(
                type: "", 
                amount: 0, 
                number: 0, 
                card: new Card(
                    cardholdername: "",
                    number: "",
                    expirationdate: "12/22",
                    cardbrand: "",
                    password: "",
                    type: "CHIP",
                    haspassword: true));

            var notify = Notification.Messages;

            Assert.True(notify.Count.Equals(0));
        }
    }
}
