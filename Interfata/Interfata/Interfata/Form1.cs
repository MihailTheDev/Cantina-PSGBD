using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;

namespace Interfata
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            OracleConnection connection = new OracleConnection();
            connection.ConnectionString = "User Id=STUDENT;Password=STUDENT;Data Source=127.0.0.1:1521/xe"; //Data Source Format -> //IP_HOST:PORT/SERVICE_NAME e.g. //127.0.0.1:1521/Service_Name
            connection.Open();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
