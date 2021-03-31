using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace forTeacher.DataAcess
{
    public class DAO
    {
        public static SqlConnection GetConnection()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DuyThai"].ToString();
            return new SqlConnection(ConnectionString);
        }


        public static DataTable GetDataBySQL(string sql)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);
            return ds.Tables[0];
        }

        public static bool ExecuteSQL(string sql, params SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parameters);
            command.Connection.Open();
            int count = command.ExecuteNonQuery();
            command.Connection.Close();
            return (count>0)?true:false;
        }
        public static bool checkAccExist(string username, string password)
        {
            string sql = "select count(*) from accounts where username ='" + username + "' and password = '" + password + "'";
            return (Convert.ToInt32(GetDataBySQL(sql).Rows[0][0]) == 1) ? true : false;
        }
        public static int accRole(string username, string password)
        {
            string sql = "select role from accounts where username ='" + username + "' and password = '" + password + "'";
            return Convert.ToInt32(GetDataBySQL(sql).Rows[0][0]);
        }
        public static string getTeacherID(string username, string password)
        {
            string sql = "select TeacherID from accounts where username ='" + username + "' and password = '" + password + "'";
            return GetDataBySQL(sql).Rows[0][0].ToString();
        }
        public static string getStudentID(string username, string password)
        {
            string sql = "select StudentID from accounts where username ='" + username + "' and password = '" + password + "'";
            return GetDataBySQL(sql).Rows[0][0].ToString();
        }
        public static string getTeacherName(string teacherID)
        {
            string sql = "select FirstName from teachers where TeacherID='" + teacherID + "'";
            return GetDataBySQL(sql).Rows[0][0].ToString();
        }

        public static DataTable getSemForTeacher(string teacherID)
        {
            string sql = "select Semesters.SemesterID, Semesters.SemesterName from AClass join Semesters on AClass.SemesterID = Semesters.SemesterID where TeacherID ='" + teacherID + "' group by Semesters.SemesterID,Semesters.SemesterName, Semesters.[From] order by Semesters.[From]";
            return GetDataBySQL(sql);

        }
        public static DataTable getClassForTeacher(string teacherID, string semesterID)
        {
            string sql = "select Classes.ClassID+'-'+SubjectID as ID, Classes.ClassName+ '-' + SubjectID as Class from AClass join Classes on AClass.ClassID = Classes.ClassID join Semesters on AClass.SemesterID = Semesters.SemesterID where TeacherID='" + teacherID + "' and AClass.SemesterID='" + semesterID + "' group by Classes.ClassID,AClass.SubjectID,Classes.ClassName";
            return GetDataBySQL(sql);

        }
        public static DataTable getStudentMark(string teacherID, string semesterID, string classID, string subjectID)
        {
            string sql = "select Students.StudentID,LastName+' '+FirstName as [Name],Lab1,Lab2,Lab3,Lab4,ProgressTest1,ProgressTest2  from AClass join Students on AClass.StudentID=Students.StudentID join Marks on AClass.StudentID = Marks.StudentID and AClass.SubjectID = Marks.SubjectID where TeacherID='" + teacherID + "' and AClass.SemesterID='" + semesterID + "' and Marks.SubjectID = '" + subjectID + "'";
            return GetDataBySQL(sql);
        }
        public static DataTable getLabMark(string teacherID, string semesterID, string classID, string subjectID)
        {
            string sql = "select Students.StudentID,LastName+' '+FirstName as [Name],Lab1,Lab2,Lab3,Lab4  from AClass join Students on AClass.StudentID=Students.StudentID join Marks on AClass.StudentID = Marks.StudentID and AClass.SubjectID = Marks.SubjectID where TeacherID='" + teacherID + "' and AClass.SemesterID='" + semesterID + "' and Marks.SubjectID = '" + subjectID + "'";
            return GetDataBySQL(sql);
        }


        public static List<int> getMarkID(string teacherID, string semesterID, string classID, string subjectID)
        {
            List<int> data = new List<int>();
            string sql = "select ID from AClass join Students on AClass.StudentID=Students.StudentID join Marks on AClass.StudentID = Marks.StudentID and AClass.SubjectID = Marks.SubjectID where TeacherID='" + teacherID + "' and AClass.SemesterID='" + semesterID + "' and Marks.SubjectID = '" + subjectID + "'";
            foreach (DataRow dr in GetDataBySQL(sql).Rows)
                data.Add(Convert.ToInt32(dr["ID"].ToString()));
            return data;
        }

        public static bool updateLabMark(int id, string lab1, string lab2, string lab3, string lab4)
        {
            string sql = "UPDATE Marks   SET     [Lab1] = @l1    ,[Lab2] = @l2    ,[Lab3] =@l3     ,[Lab4] = @l4 WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@l1", SqlDbType.Char) {Value =lab1},
                                    new SqlParameter("@l2", SqlDbType.Char) {Value =lab2},
                                    new SqlParameter("@l3", SqlDbType.Char) {Value =lab3},
                                    new SqlParameter("@l4", SqlDbType.Char) {Value =lab4},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }
    }
}
