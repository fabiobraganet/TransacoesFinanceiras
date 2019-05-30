using Microsoft.EntityFrameworkCore.Migrations;

namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.DataBase.Migrations.TransacoesFinanceiras
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "TransacoesFinanceiras");

            migrationBuilder.CreateSequence(
                name: "consumidorseq",
                schema: "TransacoesFinanceiras",
                startValue: int.MinValue,
                maxValue: int.MaxValue,
                incrementBy: 1);

            migrationBuilder.CreateTable(
                name: "Comsumidor",
                schema: "TransacoesFinanceiras",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false),
                    Nome = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    LoginId = table.Column<int>(nullable: false),
                    Ativo = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comsumidor", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Comsumidor_LoginId",
                schema: "TransacoesFinanceiras",
                table: "Comsumidor",
                column: "LoginId",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Comsumidor",
                schema: "TransacoesFinanceiras");

            migrationBuilder.DropSequence(
                name: "consumidorseq",
                schema: "TransacoesFinanceiras");
        }
    }
}
