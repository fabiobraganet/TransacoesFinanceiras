using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using FluentAssertions;
using MAGVA.Middle.Security.Admin.Constants;
using MAGVA.Middle.Security.Admin.IntegrationTests.Common;
using Xunit;

namespace MAGVA.Middle.Security.Admin.IntegrationTests.Tests
{
    public class LogControllerTests : IClassFixture<TestFixture>
    {
        private readonly HttpClient _client;

        public LogControllerTests(TestFixture fixture)
        {
            _client = fixture.Client;
        }

        [Fact]
        public async Task ReturnRedirectInErrorsLogWithoutAdminRole()
        {
            //Remove
            _client.DefaultRequestHeaders.Clear();

            // Act
            var response = await _client.GetAsync("/log/errorslog");

            // Assert           
            response.StatusCode.Should().Be(HttpStatusCode.Redirect);

            //The redirect to login
            response.Headers.Location.ToString().Should().Contain(AuthorizationConsts.AccountLoginPage);
        }

        [Fact]
        public async Task ReturnSuccessInErrorsLogWithAdminRole()
        {
            //Get claims for admin
            _client.SetAdminClaimsViaHeaders();

            // Act
            var response = await _client.GetAsync("/log/errorslog");

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);
        }
    }
}
