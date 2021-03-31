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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string username = textBox1.Text;
            string password = textBox2.Text;
            if (username.Length == 0 || password.Length == 0)
            {
                MessageBox.Show("username and password is required");
            }
            else
            {
                if(!DAO.checkAccExist(username,password)||DAO.accRole(username,password) !=1)
                    MessageBox.Show("wrong username or password");
                else
                {
                    Form1 f = new Form1(DAO.getTeacherID(username,password));
                    this.Hide();
                    f.Show();
                }
            }
        }

        private void Login_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    }
}
