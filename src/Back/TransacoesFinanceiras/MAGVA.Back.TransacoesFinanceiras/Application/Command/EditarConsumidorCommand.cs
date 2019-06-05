
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using System.Runtime.Serialization;

    public class EditarConsumidorCommand : IRequest<bool>
    {
        [DataMember]
        public int Id { get; private set; }
        [DataMember]
        public string Nome { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public int LoginId { get; private set; }
        [DataMember]
        public bool Ativo { get; set; }


        public EditarConsumidorCommand(int id,
            string nome,
            string email,
            int loginId,
            bool ativo = true)
        {
            Id = id;
            Nome = nome;
            Email = email;
            LoginId = loginId;
            Ativo = ativo;
        }
    }
}
