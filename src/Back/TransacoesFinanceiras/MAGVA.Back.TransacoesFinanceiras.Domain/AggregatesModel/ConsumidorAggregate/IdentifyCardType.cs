
namespace MAGVA.Back.TransacoesFinanceiras.Domain.AggregatesModel.ConsumidorAggregate
{
    using SendWork;

    public class IdentifyCardType
        : Enumeration
    {
        public static IdentifyCardType Chip = new IdentifyCardType(1, "Chip");
        public static IdentifyCardType TarjaMagnetica = new IdentifyCardType(2, "Tarja Magnética");

        public IdentifyCardType(int id, string name)
            : base(id, name)
        {
        }
    }
}
