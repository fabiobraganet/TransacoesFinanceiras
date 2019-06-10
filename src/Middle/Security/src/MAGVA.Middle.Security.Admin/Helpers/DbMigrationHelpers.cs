using IdentityServer4.EntityFramework.Mappers;
using MAGVA.Middle.Security.Admin.Configuration;
using MAGVA.Middle.Security.Admin.Constants;
using MAGVA.Middle.Security.Admin.EntityFramework.DbContexts;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities.Identity;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MAGVA.Middle.Security.Admin.Helpers
{
    public static class DbMigrationHelpers
    {
        /// <summary>
        /// Generate migrations before running this method, you can use command bellow:
        /// Add-Migration DbInit -context AdminDbContext -output Data/Migrations
        /// </summary>
        /// <param name="host"></param>
        public static async Task EnsureSeedData(IWebHost host)
        {
            using (var serviceScope = host.Services.CreateScope())
            {
                var services = serviceScope.ServiceProvider;

                await EnsureSeedData(services);
            }
        }

        public static async Task EnsureSeedData(IServiceProvider serviceProvider)
        {
            using (var scope = serviceProvider.GetRequiredService<IServiceScopeFactory>().CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<AdminDbContext>();
                var userManager = scope.ServiceProvider.GetRequiredService<UserManager<UserIdentity>>();
                var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<UserIdentityRole>>();

                context.Database.Migrate();
                await EnsureSeedIdentityServerData(context);
                await EnsureSeedIdentityData(userManager, roleManager);
            }
        }

        private static async Task EnsureSeedIdentityData(UserManager<UserIdentity> userManager,
            RoleManager<UserIdentityRole> roleManager)
        {
            #region Perfil Admin

            if (!await roleManager.RoleExistsAsync(AuthorizationConsts.AdministrationRole))
            {
                var role = new UserIdentityRole { Name = AuthorizationConsts.AdministrationRole };

                await roleManager.CreateAsync(role);
            }

            if (await userManager.FindByNameAsync(Users.AdminUserName) == null)
            {
                var user = new UserIdentity
                {
                    UserName = Users.AdminUserName,
                    Email = Users.AdminEmail,
                    EmailConfirmed = true
                };

                var result = await userManager.CreateAsync(user, Users.AdminPassword);

                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(user, AuthorizationConsts.AdministrationRole);
                }
            }

            #endregion

            string consumidorRole = "consumidorrole";
            if (!await roleManager.RoleExistsAsync(consumidorRole))
            {
                var role = new UserIdentityRole { Name = consumidorRole };

                await roleManager.CreateAsync(role);
            }

            #region Perfis de Usuarios para os casos

            for (int i = 0; i < 10; i++)
            {
                string consumidor = $"consumidor{i + 1}";
                string email = $"{consumidor}@email.com";

                if (await userManager.FindByNameAsync(consumidor) == null)
                {
                    var user = new UserIdentity
                    {
                        UserName = consumidor,
                        Email = email,
                        EmailConfirmed = true
                    };

                    var result = await userManager.CreateAsync(user, "Pa$$word123");

                    if (result.Succeeded)
                    {
                        await userManager.AddToRoleAsync(user, consumidorRole);
                    }
                }
            }

            #endregion
        }

        private static async Task EnsureSeedIdentityServerData(AdminDbContext context)
        {
            if (!context.Clients.Any())
            {
                foreach (var client in Clients.GetAdminClient().ToList())
                {
                    await context.Clients.AddAsync(client.ToEntity());
                }

                await context.SaveChangesAsync();
            }

            if (!context.IdentityResources.Any())
            {
                var identityResources = ClientResources.GetIdentityResources().ToList();

                foreach (var resource in identityResources)
                {
                    await context.IdentityResources.AddAsync(resource.ToEntity());
                }

                await context.SaveChangesAsync();
            }

            if (!context.ApiResources.Any())
            {
                foreach (var resource in ClientResources.GetApiResources().ToList())
                {
                    await context.ApiResources.AddAsync(resource.ToEntity());
                }

                await context.SaveChangesAsync();
            }
        }
    }
}
