
namespace MAGVA.Front.TransacoesFinanceiras.Services
{
    using Infrastructure;
    using ViewModels;
    using Microsoft.Extensions.Options;
    using System.Net.Http;
    using System.Threading.Tasks;
    using Newtonsoft.Json;

    public class ConsumidorService : IConsumidorService
    {
        private readonly IOptions<AppSettings> _settings;
        private readonly HttpClient _apiClient;
        private readonly string _transacoesFinanceirasUrl;

        public ConsumidorService(HttpClient httpClient, IOptions<AppSettings> settings)
        {
            _apiClient = httpClient;
            _settings = settings;

            _transacoesFinanceirasUrl = $"{_settings.Value.TransacoesFinanceirasUrl}/api/v1/Consumidor";
        }

        public async Task<Consumidor> GetConsumidor(ApplicationUser user)
        {
            var uri = API.Consumidor.GetConsumidor(_transacoesFinanceirasUrl, user.Id);

            var responseString = await _apiClient.GetStringAsync(uri);

            return string.IsNullOrEmpty(responseString) ?
                new Consumidor() { LoginId = user.Id } :
                JsonConvert.DeserializeObject<Consumidor>(responseString);
        }
    }
}
