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
            return (count > 0) ? true : false;
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
            string sql = "select LastName+' '+FirstName from teachers where TeacherID='" + teacherID + "'";
            return GetDataBySQL(sql).Rows[0][0].ToString();
        }
        public static string getStudentName(string studentID)
        {
            string sql = "select LastName+' '+FirstName from students where StudentID='" + studentID + "'";
            return GetDataBySQL(sql).Rows[0][0].ToString();
        }

        public static DataTable getSemForTeacher(string teacherID)
        {
            string sql = "select Semesters.SemesterID, Semesters.SemesterName from AClass join Semesters on AClass.SemesterID = Semesters.SemesterID where TeacherID ='" + teacherID + "' group by Semesters.SemesterID,Semesters.SemesterName, Semesters.[From] order by Semesters.[From]";
            return GetDataBySQL(sql);

        }

        public static DataTable getSemForStudent(string studentID)
        {
            string sql = "select Semesters.SemesterID, Semesters.SemesterName from AClass join Semesters on AClass.SemesterID = Semesters.SemesterID where StudentID ='" + studentID + "' group by Semesters.SemesterID,Semesters.SemesterName, Semesters.[From] order by Semesters.[From]";
            return GetDataBySQL(sql);
        }
        public static DataTable getSubject(string studentID, string semesterID)
        {
            string sql = "select Subjects.SubjectID,Subjects.SubjectName from AClass join Subjects on AClass.SubjectID = Subjects.SubjectID where StudentID ='" + studentID+"' and SemesterID = '"+semesterID+"'";
            return GetDataBySQL(sql);
        }

        public static string getClassForST(string studentID, string semesterID,string subjectID)
        {
            string sql = "select ClassID from AClass where StudentID='"+studentID+"' and SemesterID='"+semesterID+"' and SubjectID = '"+subjectID+"'";
            return GetDataBySQL(sql).Rows[0][0].ToString();
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

        public static DataTable getMark(string studentID,  string classID, string subjectID)
        {
            string sql = "select Lab1 as [Lab 1(5%)],Lab2 as [Lab 2(5%)],Lab3 as [Lab 3(5%)],Lab4 as [Lab 4(5%)],ProgressTest1 as [Progress Test 1(10%)],ProgressTest2 as [Progress Test 2(10%)],Practicalexam as [Practical exam(30%)],FinalExam as [Final exam(30%)],FinalExamResit as [FE Resit(30%)],Total from Marks where StudentID = '"+studentID+"' and SubjectID = '"+subjectID+"' and ClassID='"+classID+"'";
            return GetDataBySQL(sql);
        }
        public static DataTable getLabMark(string teacherID, string semesterID, string classID, string subjectID)
        {
            string sql = "select Students.StudentID,LastName+' '+FirstName as [Name],Lab1,Lab2,Lab3,Lab4  from AClass join Students on AClass.StudentID=Students.StudentID join Marks on AClass.StudentID = Marks.StudentID and AClass.SubjectID = Marks.SubjectID where TeacherID='" + teacherID + "' and AClass.SemesterID='" + semesterID + "' and Marks.SubjectID = '" + subjectID + "'";
            return GetDataBySQL(sql);
        }
        public static DataTable getPTMark(string teacherID, string semesterID, string classID, string subjectID)
        {
            string sql = "select Students.StudentID,LastName+' '+FirstName as [Name],ProgressTest1,ProgressTest2  from AClass join Students on AClass.StudentID=Students.StudentID join Marks on AClass.StudentID = Marks.StudentID and AClass.SubjectID = Marks.SubjectID where TeacherID='" + teacherID + "' and AClass.SemesterID='" + semesterID + "' and Marks.SubjectID = '" + subjectID + "'";
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

        public static bool updateLab1Mark(int id, string lab1)
        {
            string sql = "UPDATE Marks   SET  [Lab1] = @l1  WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@l1", SqlDbType.Char) {Value =lab1},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }

        public static bool updateLab2Mark(int id, string lab2)
        {
            string sql = "UPDATE Marks   SET  [Lab2] = @l2  WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@l2", SqlDbType.Char) {Value =lab2},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }

        public static bool updateLab3Mark(int id, string lab3)
        {
            string sql = "UPDATE Marks   SET  [Lab3] = @l3  WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@l3", SqlDbType.Char) {Value =lab3},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }

        public static bool updateLab4Mark(int id, string lab4)
        {
            string sql = "UPDATE Marks  SET  [Lab4] = @l4  WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@l4", SqlDbType.Char) {Value =lab4},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }

        public static bool updatePT2Mark(int id, string pt2)
        {
            string sql = "UPDATE Marks   SET  ProgressTest2 = @pt2  WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@pt2", SqlDbType.Char) {Value =pt2},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }

        public static bool updatePT1Mark(int id, string pt1)
        {
            string sql = "UPDATE Marks   SET  ProgressTest1 = @pt1  WHERE ID = @id";
            SqlParameter[] param = { new SqlParameter("@pt1", SqlDbType.Char) {Value =pt1},
                                    new SqlParameter("@id", SqlDbType.Int) {Value =id},
            };
            return ExecuteSQL(sql, param);
        }

        public static DateTime getDate(string semesterID)
        {
            string sql = "select [To] from semesters where SemesterID = '"+semesterID+"'";
            return Convert.ToDateTime(GetDataBySQL(sql).Rows[0][0]);

        }
    }
}
