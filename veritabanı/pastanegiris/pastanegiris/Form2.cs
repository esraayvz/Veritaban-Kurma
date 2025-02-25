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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SqlConnection baglanti = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=Pastane32;Integrated Security=True;TrustServerCertificate=True");
            baglanti.Open();
            SqlCommand komut = new SqlCommand("SELECT * FROM Musteri", baglanti);
            komut.ExecuteNonQuery();
            SqlDataAdapter adtr = new SqlDataAdapter(komut);
            DataTable musteri_tablo = new DataTable();
            adtr.Fill(musteri_tablo);
            dataGridView1.DataSource = musteri_tablo;
            baglanti.Close();
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SqlConnection baglanti2 = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=Pastane32;Integrated Security=True;TrustServerCertificate=True");
            baglanti2.Open();
            SqlCommand komut2 = new SqlCommand("SELECT * FROM Yonetici", baglanti2);
            komut2.ExecuteNonQuery();
            SqlDataAdapter adtr = new SqlDataAdapter(komut2);
            DataTable yonetici_tablo = new DataTable();
            adtr.Fill(yonetici_tablo);
            dataGridView1.DataSource = yonetici_tablo;
            baglanti2.Close();
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SqlConnection baglanti3 = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=Pastane32;Integrated Security=True;TrustServerCertificate=True");
            baglanti3.Open();
            SqlCommand komut3 = new SqlCommand("SELECT * FROM Urun", baglanti3);
            komut3.ExecuteNonQuery();
            SqlDataAdapter adtr = new SqlDataAdapter(komut3);
            DataTable urun_tablo = new DataTable();
            adtr.Fill(urun_tablo);
            dataGridView1.DataSource = urun_tablo;
            baglanti3.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

       }
       
    }

}
