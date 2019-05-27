using MAGVA.Middle.Security.Admin.BusinessLogic.Helpers;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Resources
{
    public interface IPersistedGrantServiceResources
    {
        ResourceMessage PersistedGrantDoesNotExist();

        ResourceMessage PersistedGrantWithSubjectIdDoesNotExist();
    }
}
