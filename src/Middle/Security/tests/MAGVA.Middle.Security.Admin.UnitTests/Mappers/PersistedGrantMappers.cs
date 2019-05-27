using System;
using FluentAssertions;
using MAGVA.Middle.Security.Admin.BusinessLogic.Mappers;
using MAGVA.Middle.Security.Admin.UnitTests.Mocks;
using Xunit;

namespace MAGVA.Middle.Security.Admin.UnitTests.Mappers
{
    public class PersistedGrantMappers
    {
        [Fact]
        public void CanMapPersistedGrantToModel()
        {
            var persistedGrantKey = Guid.NewGuid().ToString();

            //Generate entity
            var persistedGrant = PersistedGrantMock.GenerateRandomPersistedGrant(persistedGrantKey);

            //Try map to DTO
            var persistedGrantDto = persistedGrant.ToModel();

            //Asert
            persistedGrantDto.Should().NotBeNull();

            persistedGrant.ShouldBeEquivalentTo(persistedGrantDto);
        }
    }
}