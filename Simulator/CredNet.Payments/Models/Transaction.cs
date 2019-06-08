
namespace CredNet.Payments.Models
{
    using System;
    public class Transaction
    {
        /// <summary>
        /// Valor da transação
        /// </summary>
        public decimal Amount { get; set; }
        /// <summary>
        /// Tipo da transação
        /// </summary>
        public string Type { get; set; }

        /// <summary>
        /// Propriedades do cartão
        /// </summary>
        public Card Card { get; set; }

        /// <summary>
        /// Número de parcelas, **se for uma transação de crédito parcelado**
        /// </summary>
        public int Number { get; set; } 
        
        public Transaction(string type, decimal amount, int number, Card card)
        {
            Type = type;
            Amount = amount;
            Number = number;
            Card = card;
        }
    }
}
