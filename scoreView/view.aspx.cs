using forTeacher.DataAcess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace scoreView
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["role"].ToString()) == 1)
                {
                    Label1.Text = "Hello, teacher " + DAO.getTeacherName(Session["ID"].ToString());
                    Label3.Text = "Class";
                    DropDownList1.DataTextField = "SemesterName";
                    DropDownList1.DataValueField = "SemesterID";
                    DropDownList1.DataSource = DAO.getSemForTeacher(Session["ID"].ToString());
                    DropDownList1.DataBind();
                    DropDownList1.SelectedIndex = DropDownList1.Items.Count - 1;

                    loadClass();
                    loadMarkBoard();
                }
                else
                {
                    Label1.Text = "Hello, " + DAO.getStudentName(Session["ID"].ToString());
                    Label3.Text = "Subject";
                    DropDownList1.DataTextField = "SemesterName";
                    DropDownList1.DataValueField = "SemesterID";
                    DropDownList1.DataSource = DAO.getSemForStudent(Session["ID"].ToString());
                    DropDownList1.DataBind();
                    DropDownList1.SelectedIndex = DropDownList1.Items.Count - 1;

                    loadSubject();
                    loadMarkBoard1();
                }
            }

        }

        private void loadClass()
        {
            ListBox1.DataTextField = "Class";
            ListBox1.DataValueField = "ID";
            ListBox1.DataSource = DAO.getClassForTeacher(Session["ID"].ToString(), DropDownList1.SelectedValue.ToString());
            ListBox1.DataBind();
            ListBox1.SelectedIndex = 0;
        }

        private void loadSubject()
        {
            ListBox1.DataTextField = "SubjectName";
            ListBox1.DataValueField = "SubjectID";
            ListBox1.DataSource = DAO.getSubject(Session["ID"].ToString(), DropDownList1.SelectedValue.ToString());
            ListBox1.DataBind();
            ListBox1.SelectedIndex = 0;
        }

        private void loadMarkBoard()
        {

            string[] ID = ListBox1.SelectedValue.ToString().Split('-');
            GridView1.DataSource = DAO.getStudentMark(Session["ID"].ToString(), DropDownList1.SelectedValue.ToString(),  ID[1]);
            GridView1.DataBind();
        }
        private void loadMarkBoard1()
        {


            GridView1.DataSource = Pivot(DAO.getMark(Session["ID"].ToString(), DAO.getClassForST(Session["ID"].ToString(), DropDownList1.SelectedValue.ToString(), ListBox1.SelectedValue.ToString()), ListBox1.SelectedValue.ToString()));
            GridView1.DataBind();
        }
        public static DataTable Pivot(DataTable tbl)
        {
            bool flag = false;
            DataTable tblPivot = new DataTable();
            tblPivot.Columns.Add(tbl.Columns[0].ColumnName);
            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                if (tbl.Rows[i][0].ToString().Length > 0)

                    tblPivot.Columns.Add(tbl.Rows[i][0].ToString());
                else flag = true;
            }
            
                for (int col = 1; col < tbl.Columns.Count; col++)
                {
                    var r = tblPivot.NewRow();
                    r[0] = tbl.Columns[col].ToString();
                if (!flag)
                {
                    for (int j = 0; j < tbl.Rows.Count; j++)
                        r[j + 1] = tbl.Rows[j][col];
                }
                    tblPivot.Rows.Add(r);
                
            }
            
            return tblPivot;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["role"].ToString()) == 1)
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

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["role"].ToString()) == 1)
            {
                loadMarkBoard();
            }
            else
            {
                loadMarkBoard1();
            }
        }
    }
}