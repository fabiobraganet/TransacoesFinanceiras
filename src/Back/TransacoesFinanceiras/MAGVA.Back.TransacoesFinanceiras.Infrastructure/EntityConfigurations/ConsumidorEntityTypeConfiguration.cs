
namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.EntityConfigurations
{
    using Domain.AggregatesModel.ConsumidorAggregate;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.EntityFrameworkCore.Metadata.Builders;
    
    class ConsumidorEntityTypeConfiguration
        : IEntityTypeConfiguration<Consumidor>
    {
        public void Configure(EntityTypeBuilder<Consumidor> configuration)
        {
            configuration.ToTable("Consumidor", TransacoesFinanceirasContext.DEFAULT_SCHEMA);

            configuration.HasKey(b => b.Id);

            configuration.Ignore(b => b.DomainEvents);


            configuration.Property(b => b.Id)
                .ForSqlServerUseSequenceHiLo("consumidorseq", TransacoesFinanceirasContext.DEFAULT_SCHEMA);

            configuration.Property(b => b.LoginId)
                .IsRequired();

            configuration.HasIndex("LoginId")
              .IsUnique(true);

            configuration.Property(b => b.Nome);

        }
    }
}
