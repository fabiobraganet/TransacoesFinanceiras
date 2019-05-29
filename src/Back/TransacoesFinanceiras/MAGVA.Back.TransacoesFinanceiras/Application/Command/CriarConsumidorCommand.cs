
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using System;
    using System.Runtime.Serialization;
    

    [DataContract]
    public class CriarConsumidorCommand
         : IRequest<bool>
    {

        [DataMember]
        public string Nome { get; private set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public bool Ativo { get; set; }

        public CriarConsumidorCommand()
        {
        }

        public CriarConsumidorCommand(
            string nome,
            string email,
            bool ativo = true)
        {
            Nome = nome;
            Email = email;
            Ativo = ativo;
        }
    }
}
