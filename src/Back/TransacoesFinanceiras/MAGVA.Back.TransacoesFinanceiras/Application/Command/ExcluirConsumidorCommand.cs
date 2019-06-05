
namespace MAGVA.Back.TransacoesFinanceiras.Application.Command
{
    using MediatR;
    using System.Runtime.Serialization;

    public class ExcluirConsumidorCommand : IRequest<bool>
    {
        [DataMember]
        public int Id { get; private set; }

        public ExcluirConsumidorCommand(int id)
        {
            Id = id;
        }
    }
}
