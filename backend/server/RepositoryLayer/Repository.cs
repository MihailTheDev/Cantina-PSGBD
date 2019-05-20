using System;
using System.Data;
//using Oracle.ManagedDataAccess.Client;
using Dapper;
using Oracle.DataAccess.Client;

namespace RepositoryLayer
{
    public class Repository : IRepository
    {
      

    //{
    //    private IConfiguration _configuration;
    //    public Repository(IConfiguration configuration)
    //    {
    //        _configuration = configuration;
    //    }

    public object GetEmployeeList()
        {
            object result = null;
            try
            {
                //var dyParam = new OracleDynamicParameters();

                //dyParam.Add("EMPCURSOR", OracleDbType.RefCursor, ParameterDirection.Output);

                //var conn = this.GetConnection();
                //if (conn.State == ConnectionState.Closed)
                //{
                //    conn.Open();
                //}
                var connectionString = "Data Source=DESKTOP-TC3JI2V;Persist Security Info=True;User ID=student;Password=***********;Unicode=True";
                OracleConnection conn = new OracleConnection(connectionString);
                conn.Open();

                if (conn.State == ConnectionState.Open)
                {
                    var query = "SELECT ID FROM MENIU";

                    //result = SqlMapper.Query(conn, query, param: dyParam, commandType: CommandType.StoredProcedure);
                    result = SqlMapper.Query<Menu>(conn, query);
                    result = conn.Query<Menu>(query);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return null;
        }
        //public IDbConnection GetConnection()
        //{
        //    var conn = new OracleConnection(connectionString);
        //    return conn;
        //}
    }
    public class Menu
    {
        public int Id { get; set; }
    }
}



