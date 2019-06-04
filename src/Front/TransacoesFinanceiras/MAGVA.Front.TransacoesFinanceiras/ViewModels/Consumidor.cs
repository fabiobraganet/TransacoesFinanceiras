
using System.ComponentModel.DataAnnotations;

namespace MAGVA.Front.TransacoesFinanceiras.ViewModels
{
    public class Consumidor
    {
        public int Id { get; set; } = 0;

        [Required]
        [StringLength(150, MinimumLength = 3)]
        public string Nome { get; set; }

        [EmailAddress]
        public string Email { get; set; }

        public string LoginId { get; set; } = "0";
        public bool Ativo { get; set; } = true;
    }
}
