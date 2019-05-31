
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using System.Runtime.Serialization;

    public class EditarConsumidorCommand : IRequest<bool>
    {
        [DataMember]
        public int Id { get; private set; }
        [DataMember]
        public string Nome { get; private set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public int LoginId { get; set; }
        [DataMember]
        public bool Ativo { get; set; }


        public EditarConsumidorCommand(int id)
        {
            Id = id;
        }
    }
}
