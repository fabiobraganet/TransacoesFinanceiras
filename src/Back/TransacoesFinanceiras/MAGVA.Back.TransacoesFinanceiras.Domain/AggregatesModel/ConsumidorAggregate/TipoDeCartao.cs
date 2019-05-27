
namespace MAGVA.Back.TransacoesFinanceiras.Domain.AggregatesModel.ConsumidorAggregate
{
    using Seedwork;

    public class TipoDeCartao
        : Enumeration
    {
        public static TipoDeCartao Chip = new TipoDeCartao(1, "Chip");
        public static TipoDeCartao TarjaMagnetica = new TipoDeCartao(2, "Tarja Magnética");

        public TipoDeCartao(int id, string name)
            : base(id, name)
        {
        }
    }
}
