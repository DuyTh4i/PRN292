using forTeacher.DataAcess;
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
    public partial class PE : Form
    {
        List<int> ID;
        DataTable Mark;
        public PE(List<int> id, DataTable mark)
        {
            Mark = mark;
            ID = id;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            this.Hide();
            f.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List<string> pe = new List<string>();
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                string pe1 = null;
                if (row.Cells[2].Value != null)
                {
                    pe1 = row.Cells[2].Value.ToString();
                }
                
                pe.Add(pe1);

            }
            for (int i = 0; i < ID.Count; i++)
            {
                DAO.updatePEMark(ID[i], pe[i]);
            }
            MessageBox.Show("DONE");

        }
    

        private void PE_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = Mark;
        }

        private void PE_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    }
}
