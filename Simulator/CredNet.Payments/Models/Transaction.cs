
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
        //Card // Propriedades do cartão

        /// <summary>
        /// Número de parcelas, **se for uma transação de crédito parcelado**
        /// </summary>
        public int Number { get; set; } 
        
        public Transaction()
        {
        }
    }
}
