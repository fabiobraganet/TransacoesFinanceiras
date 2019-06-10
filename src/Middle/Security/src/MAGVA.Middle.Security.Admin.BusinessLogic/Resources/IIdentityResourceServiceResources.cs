using MAGVA.Middle.Security.Admin.BusinessLogic.Helpers;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Resources
{
    public interface IIdentityResourceServiceResources
    {
        ResourceMessage IdentityResourceDoesNotExist();

        ResourceMessage IdentityResourceExistsKey();

        ResourceMessage IdentityResourceExistsValue();
    }
}
