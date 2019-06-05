using Microsoft.EntityFrameworkCore.Migrations;
using System;

namespace MAGVA.Back.TransacoesFinanceiras.Infrastructure.DataBase.Migrations.TransacoesFinanceiras
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "TransacoesFinanceiras");

            migrationBuilder.EnsureSchema(
                name: "Sistema");

            migrationBuilder.CreateSequence(
                name: "consumidorseq",
                schema: "TransacoesFinanceiras",
                startValue: int.MinValue,
                maxValue: int.MaxValue,
                incrementBy: 1);

            migrationBuilder.CreateTable(
                name: "Consumidor",
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
                    table.PrimaryKey("PK_Consumidor", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Consumidor_LoginId",
                schema: "TransacoesFinanceiras",
                table: "Consumidor",
                column: "LoginId",
                unique: true);

            migrationBuilder.CreateTable(
                name: "Requests",
                schema: "Sistema",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    Name = table.Column<string>(nullable: false),
                    Time = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Requests", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Consumidor",
                schema: "TransacoesFinanceiras");

            migrationBuilder.DropTable(
                name: "Requests",
                schema: "Sistema");

            migrationBuilder.DropSequence(
                name: "consumidorseq",
                schema: "TransacoesFinanceiras");
        }
    }
}
