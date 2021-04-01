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
        string TeacherID = "";
        public Form1(string teacherID)
        {
            TeacherID = teacherID;
            InitializeComponent();
        }
        public Form1()
        {

            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (TeacherID.Length > 0)
            {
                label1.Text = "Hello, teacher " + DAO.getTeacherName(TeacherID);

                LoadSemester();
                loadClass();

                loadMarkBoard();
            }
            else
            {
                pe.Visible = true;
                fe.Visible = true;
                label1.Text = "Hello, ADMIN";
                LoadSemester1();
                loadSubject();
                loadMarkBoard1();
            }

        }

        private void LoadSemester()
        {
            comboBox1.DisplayMember = "SemesterName";
            comboBox1.ValueMember = "SemesterID";
            comboBox1.DataSource = DAO.getSemForTeacher(TeacherID);
            comboBox1.SelectedIndex = comboBox1.Items.Count - 1;

        }

        private void LoadSemester1()
        {
            comboBox1.DisplayMember = "SemesterName";
            comboBox1.ValueMember = "SemesterID";
            comboBox1.DataSource = DAO.getSem();
            comboBox1.SelectedIndex = comboBox1.Items.Count - 1;

        }

        private void loadSubject()
        {
            listBox1.DisplayMember = "SubjectName";
            listBox1.ValueMember = "SubjectID";
            listBox1.DataSource = DAO.getSubject1(comboBox1.SelectedValue.ToString());
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

        private void loadMarkBoard1()
        {

            dataGridView1.DataSource = DAO.getStudentMarkAdmin(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString());
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
            if (TeacherID.Length > 0)
            {
                loadClass();
                loadMarkBoard();
            }
            else
            {
                loadSubject();
                loadMarkBoard1();
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TeacherID.Length > 0)
            {
                loadMarkBoard();
            }
            else { 
                loadMarkBoard1();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (TeacherID.Length > 0)
            {
                if (DAO.getDate(comboBox1.SelectedValue.ToString()) >= DateTime.Today)
                {
                    string[] ID = listBox1.SelectedValue.ToString().Split('-');
                    Lab u = new Lab(TeacherID, DAO.getMarkID(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]), DAO.getLabMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]));
                    this.Hide();
                    u.Show();
                }
                else
                {
                    MessageBox.Show("this semester is finished");
                }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (TeacherID.Length > 0)
            {
                if (DAO.getDate(comboBox1.SelectedValue.ToString()) >= DateTime.Today)
                {
                    string[] ID = listBox1.SelectedValue.ToString().Split('-');
                    ProgressTest pt = new ProgressTest(TeacherID, DAO.getMarkID(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]), DAO.getPTMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[0], ID[1]));
                    this.Hide();
                    pt.Show();
                }
                else
                {
                    MessageBox.Show("this semester is finished");
                }
            }
        }
    }
}
