using Oracle.DataAccess.Client;
using System;
using System.Data;
//using System.Data.OracleClient;
using System.Windows.Forms;

namespace MailRu_register_bot
{
    public partial class Form1 : Form
    {
        OracleConnection conn = new OracleConnection(@"User Id=STUDENT;Password=STUDENT;Data Source=127.0.0.1:1521/xe;");
        private long _totalPersoane = 0;
        public Form1()
        {
            InitializeComponent();
            /*
            OracleConnection connection = new OracleConnection();
            connection.ConnectionString = "User Id=STUDENT;Password=STUDENT;Data Source=127.0.0.1:1521/xe"; //Data Source Format -> //IP_HOST:PORT/SERVICE_NAME e.g. //127.0.0.1:1521/Service_Name
            connection.Open();

            OracleCommand cmd2 = new OracleCommand("export_script", connection);
            cmd2.CommandType = CommandType.StoredProcedure;

            cmd2.Parameters.Add("tabel", "varchar2").Value = "profesori";

            cmd2.ExecuteNonQuery();

            return;
            */

            Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            //  cmd.CommandText = "select * from institutii";
            cmd.CommandText = "select i.nume, count(s.id), TO_CHAR(sum(s.multumit)/count(*)*100,'99.99')||'%' from studiaza s inner join institutii i on i.id=s.id_institutie group by s.id_institutie, i.nume order by i.nume";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                dataGridView1.Rows.Add(dr.GetOracleValue(0).ToString(), dr.GetOracleValue(1).ToString(), dr.GetOracleValue(2).ToString());

            }

            refreshTotalPersoane();
            afisarePersonae(); //  this.Refresh();

            setPage();
            statsInterese();





        }

        private void addToChart(string name, string value)
        {
            int val = Int32.Parse(value);
            chart1.Series.Add(name);
            chart1.Series[chart1.Series.Count - 1].Points.Add(val);
            chart1.Series[chart1.Series.Count - 1]["PointWidth"] = "0.5";
        }
        private void statsInterese()
        {
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            //  cmd.CommandText = "select * from institutii";
            cmd.CommandText = "select sum(citit), sum(sport), sum(tehnologie), sum(puzzeluri), sum(design), " +
                              "sum(psihologie), sum(istorie), sum(politica), sum(jocurile),sum(arte) from persoane";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            dr.Read();
            chart1.Series.Clear();

            chart1.ChartAreas[0].AxisX.MajorTickMark.Enabled = true;
            chart1.ChartAreas[0].AxisX.MajorTickMark.Size = 1;

            addToChart("Citi", dr.GetOracleValue(0).ToString());
            addToChart("Sport", dr.GetOracleValue(1).ToString());
            addToChart("Tehnologie", dr.GetOracleValue(2).ToString());
            addToChart("Puzzeluri", dr.GetOracleValue(3).ToString());
            addToChart("Design", dr.GetOracleValue(4).ToString());
            addToChart("Psihologie", dr.GetOracleValue(5).ToString());
            addToChart("Istorie", dr.GetOracleValue(6).ToString());
            addToChart("Politica", dr.GetOracleValue(7).ToString());
            addToChart("Jocurile", dr.GetOracleValue(8).ToString());
            addToChart("Arte", dr.GetOracleValue(9).ToString());


            //chart1.AlignDataPointsByAxisLabel();
            //dataGridView1.Rows.Add(dr.GetOracleValue(0).ToString(), dr.GetOracleValue(1).ToString(), dr.GetOracleValue(2).ToString());



        }
        private void setPage()
        {
            label23.Text = $"Pagina {minResults / 1000 + 1} din {_totalPersoane / 1000 + 1}";
        }

        private void refreshTotalPersoane()
        {
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            //  cmd.CommandText = "select * from institutii";
            cmd.CommandText = "select count(*) from persoane";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            dr.Read();
            _totalPersoane = long.Parse(dr.GetOracleValue(0).ToString());
        }

        public void Open()
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
        }
        public void Close()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }


        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from persoane where id=" + textBox1.Text + " and nr_telefon=" + textBox3.Text;
                // MessageBox.Show(cmd.CommandText + ":");
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();

                if (!dr.HasRows)
                {
                    MessageBox.Show("Nu au fost gasite date pentru informatiile introduse");
                    return;
                }
                dr.Read();

                labelNume1.Text = dr.GetString(1);
                labelPrenume1.Text = dr.GetString(2);
                labelDataNastere1.Text = dr.GetDateTime(3).ToShortDateString();
                labelNrTel1.Text = dr.GetString(4);
                labelGen1.Text = dr.GetString(5);


                listBoxInterese1.Items.Clear();
                if (dr.GetInt16(6) == 1)
                    listBoxInterese1.Items.Add("Citit");
                if (dr.GetInt16(7) == 1)
                    listBoxInterese1.Items.Add("Sport");
                if (dr.GetInt16(8) == 1)
                    listBoxInterese1.Items.Add("Tehnologie");
                if (dr.GetInt16(9) == 1)
                    listBoxInterese1.Items.Add("Arte");
                if (dr.GetInt16(10) == 1)
                    listBoxInterese1.Items.Add("Puzzeluri");
                if (dr.GetInt16(11) == 1)
                    listBoxInterese1.Items.Add("Design");
                if (dr.GetInt16(12) == 1)
                    listBoxInterese1.Items.Add("Psihologie");
                if (dr.GetInt16(13) == 1)
                    listBoxInterese1.Items.Add("Istorie");
                if (dr.GetInt16(14) == 1)
                    listBoxInterese1.Items.Add("Politica");
                if (dr.GetInt16(15) == 1)
                    listBoxInterese1.Items.Add("Jocuri");
            }
            catch (OracleException oex)
            {
                MessageBox.Show("Exceptie: " + oex.Message);
            }

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {

            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (!double.TryParse(textBox2.Text, out double n))
                {
                    MessageBox.Show("Introduceti un numar in casuta cu id-ul");
                    return;
                }


                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                //  cmd.CommandText = "select * from persoane where id=" + n;

                cmd.CommandText = "select * from persoane where id = :id and nr_telefon = :nr_tel";
                cmd.Parameters.Add("id", textBox2.Text);
                cmd.Parameters.Add("nr_tel", textBox4.Text);
                cmd.Prepare();


                // MessageBox.Show(cmd.CommandText + ":");
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();

                if (!dr.HasRows)
                {
                    MessageBox.Show("Nu au fost gasite date pentru informatiile introduse");
                    return;
                }

                dr.Read();

                labelNume2.Text = dr.GetString(1);
                labelPrenume2.Text = dr.GetString(2);
                labelDataNasteri2.Text = dr.GetDateTime(3).ToShortDateString();
                labelNrTel2.Text = dr.GetString(4);
                labelGen2.Text = dr.GetString(5);


                listBoxInterese2.Items.Clear();
                if (dr.GetInt16(6) == 1)
                    listBoxInterese2.Items.Add("Citit");
                if (dr.GetInt16(7) == 1)
                    listBoxInterese2.Items.Add("Sport");
                if (dr.GetInt16(8) == 1)
                    listBoxInterese2.Items.Add("Tehnologie");
                if (dr.GetInt16(9) == 1)
                    listBoxInterese2.Items.Add("Arte");
                if (dr.GetInt16(10) == 1)
                    listBoxInterese2.Items.Add("Puzzeluri");
                if (dr.GetInt16(11) == 1)
                    listBoxInterese2.Items.Add("Design");
                if (dr.GetInt16(12) == 1)
                    listBoxInterese2.Items.Add("Psihologie");
                if (dr.GetInt16(13) == 1)
                    listBoxInterese2.Items.Add("Istorie");
                if (dr.GetInt16(14) == 1)
                    listBoxInterese2.Items.Add("Politica");
                if (dr.GetInt16(15) == 1)
                    listBoxInterese2.Items.Add("Jocuri");
            }
            catch (OracleException oex)
            {
                MessageBox.Show("Exceptie: " + oex.Message);
            }
        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                int RETURN_VALUE_BUFFER_SIZE = 512;
                OracleCommand cmd = new OracleCommand();

                cmd.Connection = conn;
                cmd.CommandText = "insert_persoana";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("returnVal", OracleDbType.Varchar2, RETURN_VALUE_BUFFER_SIZE);
                cmd.Parameters["returnVal"].Direction = ParameterDirection.ReturnValue;

                cmd.Parameters.Add("nume", OracleDbType.Varchar2);
                cmd.Parameters["nume"].Value = textBoxNume.Text;

                cmd.Parameters.Add("prenume", OracleDbType.Varchar2);
                cmd.Parameters["prenume"].Value = textBoxPrenume.Text;

                cmd.Parameters.Add("data_nastere", OracleDbType.Date);
                cmd.Parameters["data_nastere"].Value = dateTimePicker1.Value.Date;

                cmd.Parameters.Add("nr_telefon", OracleDbType.Varchar2);
                cmd.Parameters["nr_telefon"].Value = textBoxNrTel.Text;

                cmd.Parameters.Add("gen", OracleDbType.Varchar2);
                cmd.Parameters["gen"].Value = radioButton1.Checked ? "M" : "F";

                cmd.Parameters.Add("citit", OracleDbType.Int16);
                cmd.Parameters["citit"].Value = checkBoxCitit.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("sport", OracleDbType.Int16);
                cmd.Parameters["sport"].Value = checkBoxSport.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("tehnologie", OracleDbType.Int16);
                cmd.Parameters["tehnologie"].Value = checkBoxTehnologie.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("arte", OracleDbType.Int16);
                cmd.Parameters["arte"].Value = checkBoxArte.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("puzzeluri", OracleDbType.Int16);
                cmd.Parameters["puzzeluri"].Value = checkBoxPuzzeluri.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("design", OracleDbType.Int16);
                cmd.Parameters["design"].Value = checkBoxDesign.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("psihiologie", OracleDbType.Int16);
                cmd.Parameters["psihiologie"].Value = checkBoxPsihologie.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("istorie", OracleDbType.Int16);
                cmd.Parameters["istorie"].Value = checkBoxIstorie.Checked ? 1 : 0;
                ;
                cmd.Parameters.Add("politica", OracleDbType.Int16);
                cmd.Parameters["politica"].Value = checkBoxPolitica.Checked ? 1 : 0;
                ;

                cmd.Parameters.Add("jocurile", OracleDbType.Int16);
                cmd.Parameters["jocurile"].Value = checkBoxJocuri.Checked ? 1 : 0;
                ;

                cmd.ExecuteNonQuery();
                int bval = int.Parse(cmd.Parameters["returnVal"].Value.ToString());
                MessageBox.Show("Persoana cu ID-ul: " + bval.ToString() + " a fost adaugata");
                refreshTotalPersoane();
            }
            catch (OracleException oex)
            {
                MessageBox.Show("Exceptie: " + oex.Message);
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                if (!double.TryParse(textBoxIdDel.Text, out double n))
                {
                    MessageBox.Show("Introduceti un numar in casuta cu ID-ul");
                    return;
                }

                OracleCommand ora_cmd = new OracleCommand("delete_persoana", conn);
                ora_cmd.BindByName = true;
                ora_cmd.CommandType = CommandType.StoredProcedure;


                ora_cmd.Parameters.Add("id_pers", OracleDbType.Double, n, ParameterDirection.Input);
                ora_cmd.Parameters.Add("nr_tel", OracleDbType.Varchar2, textBoxDelNrTel.Text, ParameterDirection.Input);

                /*********************Oracle Command**********************************************************************/

                ora_cmd.ExecuteNonQuery();
                MessageBox.Show($"Persoana cu id-ul: {n} a fost stearsa");
                refreshTotalPersoane();
            }
            catch (OracleException oex)
            {

                if (oex.Message.Contains("no data found"))
                    MessageBox.Show(
                        $"Nu a fost gasit un utilizator cu id-ul: {textBoxIdDel.Text} si numarul de telefon: {textBoxDelNrTel.Text}");
                MessageBox.Show("Exceptie: " + oex.Message);
            }

            return;
            ;
            OracleCommand cmd = new OracleCommand("delete_persoana", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("id_pers", "number").Value = Int16.Parse(textBoxIdDel.Text);
            cmd.Parameters.Add("nr_tel", "varchar2").Value = textBoxDelNrTel.Text;


            cmd.ExecuteNonQuery();
            MessageBox.Show("done)");
        }

        private void button7_Click(object sender, EventArgs e)
        {

        }

        private int minResults = 0;
        private void button5_Click(object sender, EventArgs e)
        {
            if (minResults < 1000)
            {
                MessageBox.Show("Sunteti deja pe prima pagina");
                return;
            }

            minResults -= 1000;
            afisarePersonae();
            setPage();
        }

        private void afisarePersonae()
        {
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            //  cmd.CommandText = "select * from institutii";
            cmd.CommandText = "SELECT * FROM (" +
                              "SELECT " +
                              "pers.nume, pers.prenume, pers.data_nastere, pers.gen, " +
                              "row_number() over (ORDER BY pers.id ASC) line_number " +
                              "FROM persoane pers) " +
                              $"WHERE line_number BETWEEN {minResults} AND {minResults + 1000}  ORDER BY line_number";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            dataGridView2.Rows.Clear();
            while (dr.Read())
            {
                dataGridView2.Rows.Add(dr.GetOracleValue(0).ToString(), dr.GetOracleValue(1).ToString(), dr.GetDateTime(2).ToShortDateString(), dr.GetOracleValue(3).ToString());

            }
        }
        private void button6_Click(object sender, EventArgs e)
        {
            if (_totalPersoane < minResults + 1000)
            {
                MessageBox.Show("Suneteti deja pe ultima pagina");
                return;
            }


            minResults += 1000;
            afisarePersonae();
            setPage();
        }

        private void button7_Click_1(object sender, EventArgs e)
        {
            try
            {

                OracleCommand cmd = new OracleCommand();


                cmd.Connection = conn;
                //  cmd.CommandText = "select * from persoane where id=" + n;

                cmd.CommandText = "select * from persoane where id = :id and nr_telefon = :nr_tel";
                cmd.Parameters.Add("id", textBox6.Text);
                cmd.Parameters.Add("nr_tel", textBox5.Text);
                cmd.Prepare();


                // MessageBox.Show(cmd.CommandText + ":");
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();

                if (!dr.HasRows)
                {
                    MessageBox.Show("Nu au fost gasite date pentru informatiile introduse");
                    return;
                }

                dr.Read();




              

                int RETURN_VALUE_BUFFER_SIZE = 512;
                cmd = new OracleCommand();

                cmd.Connection = conn;
                cmd.CommandText = "apel_nbc";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("returnVal", OracleDbType.Varchar2, RETURN_VALUE_BUFFER_SIZE);
                cmd.Parameters["returnVal"].Direction = ParameterDirection.ReturnValue;


                cmd.Parameters.Add("citit", OracleDbType.Int16);
                cmd.Parameters["citit"].Value = dr.GetInt16(6);
                ;

                cmd.Parameters.Add("sport", OracleDbType.Int16);
                cmd.Parameters["sport"].Value = dr.GetInt16(7);
                ;

                cmd.Parameters.Add("tehnologie", OracleDbType.Int16);
                cmd.Parameters["tehnologie"].Value = dr.GetInt16(8);
                ;

                cmd.Parameters.Add("arte", OracleDbType.Int16);
                cmd.Parameters["arte"].Value = dr.GetInt16(9);
                ;

                cmd.Parameters.Add("puzzeluri", OracleDbType.Int16);
                cmd.Parameters["puzzeluri"].Value = dr.GetInt16(10);
                ;

                cmd.Parameters.Add("design", OracleDbType.Int16);
                cmd.Parameters["design"].Value = dr.GetInt16(11);
                ;

                cmd.Parameters.Add("psihiologie", OracleDbType.Int16);
                cmd.Parameters["psihiologie"].Value = dr.GetInt16(12);
                ;

                cmd.Parameters.Add("istorie", OracleDbType.Int16);
                cmd.Parameters["istorie"].Value = dr.GetInt16(13);
                ;
                cmd.Parameters.Add("politica", OracleDbType.Int16);
                cmd.Parameters["politica"].Value = dr.GetInt16(14);
                ;

                cmd.Parameters.Add("jocurile", OracleDbType.Int16);
                cmd.Parameters["jocurile"].Value = dr.GetInt16(15);




                cmd.ExecuteNonQuery();

                MessageBox.Show("Categoria de facultati recomandata este: " + cmd.Parameters["returnVal"].Value.ToString());

            }
            catch (OracleException oex)
            {
                MessageBox.Show("Exceptie: " + oex.Message);
            }
        }

        private void radioButton17_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            int r1 = radioButton3.Checked ? 1 : 2;
            int r2;
            if (radioButton6.Checked)
                r2 = 1;
            else if (radioButton5.Checked)
                r2 = 2;
            else if (radioButton7.Checked)
                r2 = 3;
            else
                r2 = 4;


            int r3;
            if (radioButton12.Checked)
                r3 = 1;
            else if (radioButton11.Checked)
                r3 = 2;
            else if (radioButton10.Checked)
                r3 = 3;
            else
                r3 = 4;

            int r4 = radioButton14.Checked ? 1 : 2;

            int r5;
            if (radioButton18.Checked)
                r5 = 1;
            else if (radioButton17.Checked)
                r5 = 2;
            else if (radioButton16.Checked)
                r5 = 3;
            else
                r5 = 4;

            int r6;
            if (radioButton22.Checked)
                r6 = 1;
            else if (radioButton21.Checked)
                r6 = 2;
            else
                r6 = 3;


            int r7;
            if (radioButton25.Checked)
                r7 = 1;
            else if (radioButton24.Checked)
                r7 = 2;
            else if (radioButton23.Checked)
                r7 = 3;
            else
                r7 = 4;

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            //  cmd.CommandText = "select * from institutii";
            cmd.CommandText = "select max(id) from chestionar";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            dr.Read();
            MessageBox.Show(dr.GetOracleValue(0).ToString());
            var id = long.Parse(dr.GetOracleValue(0).ToString()) + 1;




            cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = $"insert into chestionar values({id}, {textBox7.Text}, {r1}, {r2}, {r3}, {r4},{r5}, {r6}, {r7})";

            int rowsUpdated = cmd.ExecuteNonQuery();
            if (rowsUpdated != 0)
                MessageBox.Show("Raspunsuri adaugate");


        }

        private void button9_Click(object sender, EventArgs e)
        {
            int r1 = radioButton3.Checked ? 1 : 2;
            int r2;
            if (radioButton6.Checked)
                r2 = 1;
            else if (radioButton5.Checked)
                r2 = 2;
            else if (radioButton7.Checked)
                r2 = 3;
            else
                r2 = 4;


            int r3;
            if (radioButton12.Checked)
                r3 = 1;
            else if (radioButton11.Checked)
                r3 = 2;
            else if (radioButton10.Checked)
                r3 = 3;
            else
                r3 = 4;

            int r4 = radioButton14.Checked ? 1 : 2;

            int r5;
            if (radioButton18.Checked)
                r5 = 1;
            else if (radioButton17.Checked)
                r5 = 2;
            else if (radioButton16.Checked)
                r5 = 3;
            else
                r5 = 4;

            int r6;
            if (radioButton22.Checked)
                r6 = 1;
            else if (radioButton21.Checked)
                r6 = 2;
            else
                r6 = 3;


            int r7;
            if (radioButton25.Checked)
                r7 = 1;
            else if (radioButton24.Checked)
                r7 = 2;
            else if (radioButton23.Checked)
                r7 = 3;
            else
                r7 = 4;



            int RETURN_VALUE_BUFFER_SIZE = 512;
            var cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "apel_nbc_quiz";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("returnVal", OracleDbType.Varchar2, RETURN_VALUE_BUFFER_SIZE);
            cmd.Parameters["returnVal"].Direction = ParameterDirection.ReturnValue;


            cmd.Parameters.Add("a1", OracleDbType.Int16);
            cmd.Parameters["a1"].Value = r1;
            ;

            cmd.Parameters.Add("a2", OracleDbType.Int16);
            cmd.Parameters["a2"].Value = r2;
            ;

            cmd.Parameters.Add("a3", OracleDbType.Int16);
            cmd.Parameters["a3"].Value = r3;
            ;

            cmd.Parameters.Add("a4", OracleDbType.Int16);
            cmd.Parameters["a4"].Value = r4;
            ;

            cmd.Parameters.Add("a5", OracleDbType.Int16);
            cmd.Parameters["a5"].Value = r5;
            ;

            cmd.Parameters.Add("a6", OracleDbType.Int16);
            cmd.Parameters["a6"].Value = r6;

            cmd.Parameters.Add("a7", OracleDbType.Int16);
            cmd.Parameters["a7"].Value = r7;

          


            cmd.ExecuteNonQuery();

            MessageBox.Show("Categoria de facultati recomandata este: " + cmd.Parameters["returnVal"].Value.ToString());
        }
    }
}
