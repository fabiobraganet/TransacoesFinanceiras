namespace MAGVA.Front.TransacoesFinanceiras.Services.ModelDTO
{
    using System.ComponentModel.DataAnnotations;

    public class ConsumidorDTO
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string Nome { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public int LoginId { get; set; }
        [Required]
        public bool Ativo { get; set; }
    }
}
