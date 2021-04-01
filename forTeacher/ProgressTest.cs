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
    public partial class ProgressTest : Form
    {
        DataTable Mark;
        string TeacherID;
        List<int> ID;
        public ProgressTest(string teacherID, List<int> id, DataTable mark)
        {
            Mark = mark;
            TeacherID = teacherID;
            ID = id;
            InitializeComponent();
        }

        private void Update_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = Mark;
        }

        private void Update_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1(TeacherID);
            this.Hide();
            f.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List<Logic.ProgressTest> pt = new List<Logic.ProgressTest>();
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                string pt1 = null, pt2 = null;
                if (row.Cells[2].Value != null)
                {
                    pt1 = row.Cells[2].Value.ToString();
                }
                if (row.Cells[3].Value != null)
                {
                    pt2 = row.Cells[3].Value.ToString();
                }

                pt.Add(new Logic.ProgressTest(pt1, pt2));

            }
            for (int i = 0; i < ID.Count; i++)
            {
                    DAO.updatePT1Mark(ID[i], pt[i].pt1);
                    DAO.updatePT2Mark(ID[i], pt[i].pt2);
            }
            MessageBox.Show("DONE");
        }
    }
}
