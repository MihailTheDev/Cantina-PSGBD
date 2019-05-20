using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories.Services
{
    class Connection
    {
        private string _connectionString = "Data Source=DESKTOP-TC3JI2V;Persist Security Info=True;User ID=student;Password=student;";

        public IDbConnection Get()
        {
            var conn = new OracleConnection(_connectionString);
            return conn;
        }

        public void OpenConnection(IDbConnection conn)
        {
            if(conn.State == ConnectionState.Closed)
            conn.Open();
        }

    }
}
