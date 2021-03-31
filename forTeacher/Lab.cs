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
    public partial class Lab : Form
    {
        DataTable Mark;
        string TeacherID;
        List<int> ID;
        public Lab(string teacherID, List<int> id, DataTable mark)
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
            List<Logic.Lab> lab = new List<Logic.Lab>();
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                string l1 = null, l2 = null, l3 = null, l4 = null;
                if (row.Cells[2].Value != null)
                {
                    l1 = row.Cells[2].Value.ToString();
                }
                if (row.Cells[3].Value != null)
                {
                    l2 = row.Cells[3].Value.ToString();
                }
                if (row.Cells[4].Value != null)
                {
                    l3 = row.Cells[4].Value.ToString();
                }
                if (row.Cells[5].Value != null)
                {
                    l4 = row.Cells[5].Value.ToString();
                }
                lab.Add(new Logic.Lab(l1, l2, l3, l4));

            }
            for (int i = 0; i < ID.Count; i++)
            {
                if (lab[i].lab1.Length > 0)
                    DAO.updateLab1Mark(ID[i], lab[i].lab1);
                if (lab[i].lab2.Length > 0)
                    DAO.updateLab2Mark(ID[i], lab[i].lab2);
                if (lab[i].lab3.Length > 0)
                    DAO.updateLab3Mark(ID[i], lab[i].lab3);
                if (lab[i].lab4.Length > 0)
                    DAO.updateLab4Mark(ID[i], lab[i].lab4);

            }
            MessageBox.Show("DONE");
        }
    }
}
