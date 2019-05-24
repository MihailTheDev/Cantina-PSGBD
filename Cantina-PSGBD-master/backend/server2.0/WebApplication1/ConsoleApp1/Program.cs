using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        public IMenuRepository _repo;
        public Program(IMenuRepository repo)
        {
            _repo = repo;
        }
        static void Main(string[] args)
        {
            //_repo.GenerateMenu();
            Console.WriteLine("lala");
        }
    }
}
