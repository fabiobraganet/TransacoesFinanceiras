
namespace MAGVA.GlobalBase.EventBus.Abstractions
{
    using System.Threading.Tasks;

    public interface IDynamicIntegrationEventHandler
    {
        Task Handle(dynamic eventData);
    }
}
