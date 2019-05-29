
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

        public async Task<Consumidor> GetConsumidorAsync(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var result = await connection.QueryAsync<dynamic>(
                   @"Select con.Id as Id
                           ,con.Nome as Nome
                           ,con.Email as Email
                           ,con.Ativo as Ativo
                       From Consumidor 
                      Where con.Id = @id ", new { id }
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
                   @"Select con.Id as Id
                           ,con.Nome as Nome
                           ,con.Email as Email
                           ,con.Ativo as Ativo
                       From Consumidor "
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
                Id = item.Id,
                Nome = item.Nome,
                Email = item.Email,
                Ativo = item.Ativo
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
                    Ativo = item.Ativo
                });
            }

            return consumidores;
        }
    }
}
