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
    public partial class Update : Form
    {
        DataTable Mark;
        string TeacherID;
        List<int> ID;
        public Update(string teacherID, List<int> id ,DataTable mark)
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

        }
    }
}
