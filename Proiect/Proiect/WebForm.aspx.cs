using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Proiect
{
    public partial class WebForm : System.Web.UI.Page
    {

        string connectionString = @"conexiunea";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void PopulateGridview()
        {
            DataTa dtbl = new DataTable();

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM tabela", sqlCon);
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e) //comenzile pentru butoane
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO GridView2 (Nume,Prenume,Telefon) VALUES (@Nume,@Prenume,@Telefon)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Nume", (GridView2.FooterRow.FindControl("txtNumeFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Prenume", (GridView2.FooterRow.FindControl("txtPrenumeFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Telefon", (GridView2.FooterRow.FindControl("txtTelefon") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErorMessage.Text = "";
                    }
                }
            }
            catch(Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErorMessage.Text = ex.Message;
            }
        }
        }
    }
}