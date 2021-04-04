using forTeacher.DataAcess;
using forTeacher.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace forTeacher
{
    public partial class FE : Form
    {
        Form1 f = new Form1();
        List<int> ID;
        DataTable Mark;
        public FE(List<int> id, DataTable mark)
        {
            Mark = mark;
            ID = id;
            InitializeComponent();
        }

        private void FE_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = Mark;

        }

        private void FE_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            this.Hide();
            f.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            List<Final> fe = new List<Final>();
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                string fe1 = null,fe2=null;
                if (row.Cells[2].Value != null)
                {
                    fe1 = row.Cells[2].Value.ToString();
                }
                if (row.Cells[3].Value != null)
                {
                    fe2 = row.Cells[3].Value.ToString();
                }


                fe.Add(new Final(fe1, fe2));

            }
            for (int i = 0; i < ID.Count; i++)
            {
                DAO.updateFEMark(ID[i], fe[i].fe);
                DAO.updateFEREMark(ID[i], fe[i].fer);
            }
            MessageBox.Show("DONE");
        }
    }
}
