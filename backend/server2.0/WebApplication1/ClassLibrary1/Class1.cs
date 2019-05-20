using System;

namespace ClassLibrary1
{

    public interface IEmployeeRepository
    {
        object GetEmployeeList();

    }

    public class Repo : IEmployeeRepository
    {
        public object GetEmployeeList()
        {
            throw new NotImplementedException();
        }
    }
}
