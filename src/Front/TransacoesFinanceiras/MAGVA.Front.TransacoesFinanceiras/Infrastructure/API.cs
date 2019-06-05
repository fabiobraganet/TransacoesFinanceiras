
namespace MAGVA.Front.TransacoesFinanceiras.Infrastructure
{
    public static class API
    {
        public static class Consumidor
        {
            public static string GetConsumidor(string baseUri, string LoginId) => $"{baseUri}/{LoginId}";
            public static string PostConsumidor(string baseUri) => $"{baseUri}";
            public static string PutConsumidor(string baseUri) => $"{baseUri}";
            public static string DeleteConsumidor(string baseUri, string id) => $"{baseUri}/{id}";
        }
    }
}
