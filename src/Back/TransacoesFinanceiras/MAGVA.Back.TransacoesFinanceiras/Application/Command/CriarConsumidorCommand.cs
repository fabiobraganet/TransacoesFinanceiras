
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using System.Runtime.Serialization;

    [DataContract]
    public class CriarConsumidorCommand
         : IRequest<bool>
    {

        [DataMember]
        public string Nome { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public int LoginId { get; set; }
        [DataMember]
        public bool Ativo { get; set; }

        public CriarConsumidorCommand()
        {
        }

        public CriarConsumidorCommand(
            string nome,
            string email,
            int loginId,
            bool ativo = true)
        {
            Nome = nome;
            Email = email;
            LoginId = loginId;
            Ativo = ativo;
        }
    }
}
