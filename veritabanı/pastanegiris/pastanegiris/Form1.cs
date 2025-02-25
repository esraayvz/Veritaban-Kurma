using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;

namespace pastanegiris
{
    public partial class Form1 : Form
    {
        SqlConnection con;
        SqlDataReader dr;
        SqlCommand com;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }


        private void button1_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = textBox1.Text;
            string sifre = textBox2.Text;
            con = new SqlConnection("Data Source =.\\SQLEXPRESS; Initial Catalog = Pastane32; Integrated Security = True; TrustServerCertificate = True");
            com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "Select*From Kullanici_Sifre where kullaniciAdi='" + textBox1.Text +
                "'And sifre='" + textBox2.Text + "'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                MessageBox.Show("Giriş Başarılı!");
                Form2 gecis = new Form2();
                gecis.Show();
                this.Hide();
            }

            else
            {
                MessageBox.Show("Hatalı Kullanıcı Adı veya Şifre!");
            }

            con.Close();
        }

        private void Form1_Load_1(object sender, EventArgs e)
        {

        }
    }
}
