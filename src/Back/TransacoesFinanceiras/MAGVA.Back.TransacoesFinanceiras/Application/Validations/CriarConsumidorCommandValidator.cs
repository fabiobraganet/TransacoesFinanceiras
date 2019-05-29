
namespace MAGVA.Back.TransacoesFinanceiras.Application.Validations
{
    using Application.Command;
    using FluentValidation;
    using Microsoft.Extensions.Logging;

    public class CriarConsumidorCommandValidator : AbstractValidator<CriarConsumidorCommand>
    {
        public CriarConsumidorCommandValidator(ILogger<CriarConsumidorCommandValidator> logger)
        {
            RuleFor(command => command.Nome).NotEmpty().WithMessage("É preciso ter um nome para criar um novo consumidor.");
            RuleFor(command => command.Email).NotEmpty().WithMessage("É preciso ter um e-mail para criar um novo consumidor."); ;

            logger.LogTrace("----- INSTANCE CREATED - {ClassName}", GetType().Name);
        }

    }
}
