using System.Collections.Generic;

namespace Repositories
{
    public interface IMenuRepository
    {
        List<Meniu> GetMenuList();

        void GenerateMenu();

    }
}
