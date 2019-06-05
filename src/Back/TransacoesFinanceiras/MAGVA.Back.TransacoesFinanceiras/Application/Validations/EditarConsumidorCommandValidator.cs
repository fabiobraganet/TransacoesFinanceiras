
namespace MAGVA.Back.TransacoesFinanceiras.Application.Validations
{
    using Application.Command;
    using FluentValidation;
    using Microsoft.Extensions.Logging;

    public class EditarConsumidorCommandValidator : AbstractValidator<EditarConsumidorCommand>
    {
        public EditarConsumidorCommandValidator(ILogger<EditarConsumidorCommandValidator> logger)
        {
            RuleFor(command => command.Id).NotEmpty().WithMessage("É preciso ter um identificador para editar o consumidor.");
            RuleFor(command => command.Nome).NotEmpty().WithMessage("É preciso ter um nome para editar o consumidor.");
            RuleFor(command => command.Email).NotEmpty().WithMessage("É preciso ter um e-mail para editar o consumidor.");
            RuleFor(command => command.LoginId).NotEmpty().WithMessage("É preciso ter um identificador de login para editar o consumidor.");
            RuleFor(command => command.Ativo).NotEmpty().WithMessage("É preciso definir a situação do cadastro consumidor.");

            logger.LogTrace("----- INSTANCE CREATED - {ClassName}", GetType().Name);
        }

    }
}
