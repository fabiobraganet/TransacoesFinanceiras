
namespace MAGVA.Back.TransacoesFinanceiras.Application.Validations
{
    using Application.Command;
    using FluentValidation;
    using Microsoft.Extensions.Logging;

    public class ExcluirConsumidorCommandValidator : AbstractValidator<ExcluirConsumidorCommand>
    {
        public ExcluirConsumidorCommandValidator(ILogger<ExcluirConsumidorCommandValidator> logger)
        {
            RuleFor(command => command.Id).NotEmpty().WithMessage("É preciso ter um identificador para excluir o consumidor.");

            logger.LogTrace("----- INSTANCE CREATED - {ClassName}", GetType().Name);
        }

    }
}
