using forTeacher.DataAcess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace scoreView
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string password = TextBox2.Text;
            if (username.Length == 0 || password.Length == 0)
            {
                Label1.Text= "username and password is required";
            }
            else
            {
                if (!DAO.checkAccExist(username, password))
                    Label1.Text = "wrong username or password";
                else
                {
                    Session["role"] = DAO.accRole(username, password);
                    if (DAO.accRole(username, password) == 1)
                        Session["ID"] = DAO.getTeacherID(username,password);
                    else if(DAO.accRole(username, password) == 2)
                        Session["ID"] = DAO.getStudentID(username, password);
                    Response.Redirect("view.aspx");
                }
            }
        }
    }
}