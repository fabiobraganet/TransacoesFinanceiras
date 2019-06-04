
namespace MAGVA.Front.TransacoesFinanceiras
{
    public class ProgramSettings
    {
        public bool UseCustomizationData { get; set; }
        public string ConnectionString { get; set; }
        public string EventBusConnection { get; set; }
        public int CheckUpdateTime { get; set; }
    }
}
