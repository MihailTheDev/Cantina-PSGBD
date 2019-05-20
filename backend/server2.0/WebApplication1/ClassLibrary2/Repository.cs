using Dapper;
using Repositories.Services;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Repositories
{
    public class MenuRepository : IMenuRepository
    {
        private Connection connClass = new Connection();

        private IDbConnection _connection;
        private readonly IDbTransaction _transaction;

        public MenuRepository()
        {

            //_transaction = _connection.BeginTransaction();
        }

        public List<Meniu> GetMenuList()
        {
            _connection = connClass.Get();
            connClass.OpenConnection(_connection);

            var result = new List<object>();
            if (_connection.State == ConnectionState.Open)
            {
                result = _connection.Query<object>("Select Get_Number_Of_Products(7) from meniu").ToList();
            }                                           

            return null;
        }

        public void GenerateMenu()
        {
            _connection = connClass.Get();
            connClass.OpenConnection(_connection);
            var transaction = _connection.BeginTransaction();
            //if(_connection.State == ConnectionState.Open)
            //{
            //_connection.Execute("Generate_Menu", commandType: CommandType.StoredProcedure);
            //    //var x = _connection.Query("GENERATE_MENU", commandType: CommandType.StoredProcedure);
            //    //SqlMapper.Query(_connection, "generate_menu", null, null, commandType: CommandType.StoredProcedure);
            //    //SqlMapper.Query("GET_NUMBER_OF_PRODUCTS")
            //   var min =  _connection.Execute("GET_NUMBER_OF_PRODUCTS(@ID)", new { ID = 3 }, commandType: CommandType.StoredProcedure);
            //    //transaction.Commit();
            //}
            object resp = null;
            resp = _connection.Query("execute generate_menu");
            //resp = SqlMapper.Query(_connection, "Get_Number_Of_Products(7)", null, commandType: CommandType.StoredProcedure);
        }


    }

    public class Meniu
    {
        public int id { get; set; }
        public int id_produs { get; set; }
        public int quantity { get; set; }
    }
}

