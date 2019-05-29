
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using System.Runtime.Serialization;

    [DataContract]
    public class CriarConsumidorCommand
         : IRequest<bool>
    {
        [DataMember]
        public int Id { get; private set; }
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
            int id, 
            string nome,
            string email,
            bool ativo = true)
        {
            Id = id;
            Nome = nome;
            Email = email;
            Ativo = ativo;
        }
    }
}
