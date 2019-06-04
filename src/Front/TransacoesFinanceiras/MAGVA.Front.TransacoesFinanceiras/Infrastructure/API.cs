
namespace MAGVA.Front.TransacoesFinanceiras.Infrastructure
{
    public static class API
    {
        public static class Consumidor
        {
            public static string GetConsumidor(string baseUri, string LoginId) => $"{baseUri}/{LoginId}";
        }

    }
}
