
namespace MAGVA.Back.TransacoesFinanceiras.Application.Queries
{
    using Dapper;
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.Threading.Tasks;

    public class ConsumidorQueries
        : IConsumidorQueries
    {

        private string _connectionString = string.Empty;

        public ConsumidorQueries(string constr)
        {
            _connectionString = !string.IsNullOrWhiteSpace(constr) ? constr : throw new ArgumentNullException(nameof(constr));
        }

        public async Task<Consumidor> GetConsumidorAsync(int loginid)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var result = await connection.QueryAsync<dynamic>(
                   @"Select Consumidor.Id as Id
                           ,Consumidor.Nome as Nome
                           ,Consumidor.Email as Email
                           ,Consumidor.LoginId as LoginId
                           ,Consumidor.Ativo as Ativo
                       From [TransacoesFinanceiras].[Comsumidor] as Consumidor
                      Where Consumidor.LoginId = @loginid ", new { loginid }
                   );

                if (result.AsList().Count == 0)
                    throw new KeyNotFoundException();

                return MapConsumidor(result);
            }
        }

        public async Task<List<Consumidor>> GetConsumidoresAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var result = await connection.QueryAsync<dynamic>(
                   @"Select Consumidor.Id as Id
                           ,Consumidor.Nome as Nome
                           ,Consumidor.Email as Email
                           ,Consumidor.LoginId as LoginId
                           ,Consumidor.Ativo as Ativo
                       From [TransacoesFinanceiras].[Comsumidor] as Consumidor "
                   );

                if (result.AsList().Count == 0)
                    throw new KeyNotFoundException();

                return MapConsumidores(result);
            }
        }

        private Consumidor MapConsumidor(dynamic item)
        {
            return new Consumidor()
            {
                Id = item[0].Id,
                Nome = item[0].Nome,
                Email = item[0].Email,
                LoginId = item[0].LoginId,
                Ativo = item[0].Ativo
            };
        }

        private List<Consumidor> MapConsumidores(dynamic collection)
        {
            var consumidores = new List<Consumidor>();

            foreach (dynamic item in collection)
            {
                consumidores.Add(new Consumidor
                {
                    Id = item.Id,
                    Nome = item.Nome,
                    Email = item.Email,
                    LoginId = item[0].LoginId,
                    Ativo = item.Ativo
                });
            }

            return consumidores;
        }
    }
}
