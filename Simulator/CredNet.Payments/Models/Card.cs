
namespace CredNet.Payments.Models
{
    using System;

    public class Card
    {
        /// <summary>
        /// Nome do portador do cartão
        /// </summary>
        public string CardholderName { get; private set; }

        /// <summary>
        /// Os números que são impressos no cartão, podendo variar entre 12 à 19 dígitos
        /// </summary>
        public string Number { get; private set; }

        /// <summary>
        /// Data de expiração do cartão - Formato MM/AA
        /// </summary>
        public string ExpirationDate { get; private set; }
        private DateTime _ExpirationDate => FormatExpirationDate();

        /// <summary>
        /// Bandeira do Cartão - Visa, Mastercard, American Express, Diners Club e Elo
        /// </summary>
        public string CardBrand { get; private set; }

        /// <summary>
        /// Senha do cartão
        /// </summary>
        public string Password { get; private set; }

        /// <summary>
        /// Chip ou tarja magnética
        /// </summary>
        public string Type { get; private set; }
        private _TypeEnum _Type => GetTypeEnum();
        private enum _TypeEnum { Chip = 0, MagneticStripe = 1, InvalidType = 2 };

        /// <summary>
        /// Se o cartão possui senha. Apenas cartões de tarja magnética podem ter essa propriedade como 'True'
        /// </summary>
        public bool HasPassword { get; set; }

        public Card(string cardholdername, string number, string expirationdate, string cardbrand, string password, string type, bool haspassword)
        {
            CardholderName = cardholdername;
            Number = number;
            ExpirationDate = expirationdate;
            CardBrand = cardbrand;
            Password = password;
            Type = type;
            HasPassword = haspassword;

            _ = _ExpirationDate;
            _ = _Type;
        }

        private DateTime FormatExpirationDate()
        {
            var arr = ExpirationDate.Split('/');

            if (arr.Length == 2)
                if (arr[0].Length == 2 && arr[1].Length == 2 && int.TryParse(arr[0], out int mes) && int.TryParse(arr[1], out int ano))
                    return new DateTime(2000 + ano, mes, DateTime.DaysInMonth(2000 + ano, mes));

            Notification.Messages.Add("InvalidExpirationDate", $"A exipração do cartão informada '{ExpirationDate}' é inválida.");

            return DateTime.MinValue;
        }

        private _TypeEnum GetTypeEnum()
        {
            const string MAGNETICSTRIPE = "MagneticStripe";
            const string CHIP = "CHIP";

            _TypeEnum typeEnum = _TypeEnum.InvalidType;

            if (string.IsNullOrEmpty(Type))
            {
                Notification.Messages.Add("InvalidCardType_001", $"Nenhum valor foi informado para o tipo de cartão.");
                return typeEnum;
            }

            if (!Type.ToUpper().Equals(CHIP) && !Type.ToUpper().Equals(MAGNETICSTRIPE))
            {
                Notification.Messages.Add("InvalidCardType_002", $"A informação do Tipo do cartão como '{Type}' é inválido.");
                return typeEnum;
            }

            if (Type.ToUpper().Equals(CHIP))
                typeEnum = _TypeEnum.Chip;

            if (Type.ToUpper().Equals(MAGNETICSTRIPE))
                typeEnum = _TypeEnum.MagneticStripe;

            return typeEnum;
        }


    }
}
