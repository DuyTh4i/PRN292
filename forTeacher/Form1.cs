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
                button4.Visible = true;
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

            dataGridView1.DataSource = DAO.getStudentMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[1]);
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
            else
            {
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
                    Lab u = new Lab(TeacherID, DAO.getMarkID(TeacherID, comboBox1.SelectedValue.ToString(), ID[1]), DAO.getLabMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[1]));
                    this.Hide();
                    u.Show();
                }
                else
                {
                    MessageBox.Show("this semester is finished");
                }
            }
            else
            {
                if (DAO.getDate(comboBox1.SelectedValue.ToString()) >= DateTime.Today)
                {

                    Lab u = new Lab(DAO.getMarkID1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()), DAO.getLabMark1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()));
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

            if (DAO.getDate(comboBox1.SelectedValue.ToString()) >= DateTime.Today)
            {
                if (TeacherID.Length > 0)
                {
                    string[] ID = listBox1.SelectedValue.ToString().Split('-');
                    ProgressTest pt = new ProgressTest(TeacherID, DAO.getMarkID(TeacherID, comboBox1.SelectedValue.ToString(), ID[1]), DAO.getPTMark(TeacherID, comboBox1.SelectedValue.ToString(), ID[1]));
                    this.Hide();
                    pt.Show();
                }
                else
                {
                    ProgressTest pt = new ProgressTest(DAO.getMarkID1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()), DAO.getPTMark1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()));
                    this.Hide();
                    pt.Show();
                }
            }
            else

                MessageBox.Show("this semester is finished");
        }

        private void pe_Click(object sender, EventArgs e)
        {
            if (DAO.getDate(comboBox1.SelectedValue.ToString()) >= DateTime.Today)
            {

                PE pe = new PE(DAO.getMarkID1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()), DAO.getPEMark(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()));
                this.Hide();
                pe.Show();
            }
            else
            {
                MessageBox.Show("this semester is finished");
            }
        }

        private void fe_Click(object sender, EventArgs e)
        {
            if (DAO.getDate(comboBox1.SelectedValue.ToString()) >= DateTime.Today)
            {

                FE fe = new FE(DAO.getMarkID1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()), DAO.getFEMark(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()));
                this.Hide();
                fe.Show();
            }
            else
            {
                MessageBox.Show("this semester is finished");
            }
        }

        public void setTotal(List<int> id)
        {
            List<double> m = new List<double>();
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                string l1 = null, l2 = null, l3 = null, l4 = null, pt1 = null, pt2 = null, pe = null, fe = null, fer = null;
                double total = 0;
                if (row.Cells[2].Value != null)
                {
                    l1 = row.Cells[2].Value.ToString();
                    if(l1.Length>0)
                        total += 0.05 * Convert.ToDouble(l1);
                }
                if (row.Cells[3].Value != null)
                {
                    l2 = row.Cells[3].Value.ToString();
                    if (l2.Length > 0)
                        total += 0.05 * Convert.ToDouble(l2);
                }
                if (row.Cells[4].Value != null)
                {
                    l3 = row.Cells[4].Value.ToString();
                    if (l3.Length > 0)
                        total += 0.05 * Convert.ToDouble(l3);
                }
                if (row.Cells[5].Value != null)
                {
                    l4 = row.Cells[5].Value.ToString();
                    if (l4.Length > 0)
                        total += 0.05 * Convert.ToDouble(l4);
                }
                if (row.Cells[6].Value != null)
                {
                    pt1 = row.Cells[6].Value.ToString();
                    if (pt1.Length > 0)
                        total += 0.1 * Convert.ToDouble(pt1);
                }
                if (row.Cells[7].Value != null)
                {
                    pt2 = row.Cells[7].Value.ToString();
                    if (pt2.Length > 0)
                        total += 0.1 * Convert.ToDouble(pt2);
                }
                if (row.Cells[8].Value != null)
                {
                    pe = row.Cells[8].Value.ToString();
                    if (pe.Length > 0)
                        total += 0.3 * Convert.ToDouble(pe);
                }
                if (row.Cells[9].Value != null)
                {
                    fe = row.Cells[9].Value.ToString();
                    if (fe.Length > 0)
                        total += 0.3 * Convert.ToDouble(fe);
                }
                if (row.Cells[10].Value != null)
                {
                    fer = row.Cells[10].Value.ToString();
                    if (fer.Length > 0)
                    {
                        total -= 0.3 * Convert.ToDouble(fe);
                        total += 0.3 * Convert.ToDouble(fer);
                    }
                }
                m.Add(total);
            }
            for (int i = 0; i < id.Count; i++)
            {
                DAO.updateTotal(id[i], m[i].ToString());
            }
            MessageBox.Show("DONE");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            setTotal(DAO.getMarkID1(comboBox1.SelectedValue.ToString(), listBox1.SelectedValue.ToString()));
            loadMarkBoard1();
        }
    }
}
