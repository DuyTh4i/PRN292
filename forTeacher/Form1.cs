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
    public partial class Form1 : Form
    {
        string TeacherID;
        public Form1(string teacherID)
        {
            TeacherID = teacherID;
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            label1.Text = "Hello, " + DAO.getTeacherName(TeacherID);
            
            LoadSemester();
            loadClass();
            
            loadMarkBoard();
            
        }

        private void LoadSemester()
        {
            comboBox1.DisplayMember = "SemesterName";
            comboBox1.ValueMember = "SemesterID";
            comboBox1.DataSource = DAO.getSemForTeacher(TeacherID);
            comboBox1.SelectedIndex = comboBox1.Items.Count-1;

            
        }
        private void loadClass()
        {
            listBox1.DisplayMember = "Class";
            listBox1.ValueMember = "ID";
            listBox1.DataSource = DAO.getClassForTeacher(TeacherID, comboBox1.SelectedValue.ToString());
        }
        private void loadMarkBoard()
        {
            string[] ID = listBox1.SelectedValue.ToString().Split('-');

            dataGridView1.DataSource = DAO.getStudentMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]);
        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            Login l = new Login();
            this.Hide();
            l.Show();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadClass();
            loadMarkBoard();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadMarkBoard();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string[] ID = listBox1.SelectedValue.ToString().Split('-');
            Update u = new Update(TeacherID, DAO.getMarkID(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]), DAO.getLabMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]));
            this.Hide();
            u.Show();
        }
    }
}
