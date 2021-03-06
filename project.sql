USE [master]
GO
/****** Object:  Database [prn292]    Script Date: 3/29/2021 9:06:41 PM ******/
CREATE DATABASE [prn292]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prn292].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prn292] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prn292] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prn292] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prn292] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prn292] SET ARITHABORT OFF 
GO
ALTER DATABASE [prn292] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prn292] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prn292] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prn292] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prn292] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prn292] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prn292] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prn292] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prn292] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prn292] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prn292] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prn292] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prn292] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prn292] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prn292] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prn292] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prn292] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prn292] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prn292] SET  MULTI_USER 
GO
ALTER DATABASE [prn292] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prn292] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prn292] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prn292] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prn292] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prn292] SET QUERY_STORE = OFF
GO
USE [prn292]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[role] [int] NOT NULL,
	[StudentID] [varchar](10) NULL,
	[TeacherID] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AClass]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AClass](
	[SemesterID] [varchar](20) NOT NULL,
	[ClassID] [varchar](10) NOT NULL,
	[StudentID] [varchar](10) NOT NULL,
	[TeacherID] [varchar](20) NOT NULL,
	[SubjectID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [varchar](10) NOT NULL,
	[ClassName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](10) NOT NULL,
	[SubjectID] [varchar](10) NOT NULL,
	[Lab1] [float] NULL,
	[Lab2] [float] NULL,
	[Lab3] [float] NULL,
	[Lab4] [float] NULL,
	[ProgressTest1] [float] NULL,
	[ProgressTest2] [float] NULL,
	[Practicalexam] [float] NULL,
	[FinalExam] [float] NULL,
	[FinalExamResit] [float] NULL,
	[Total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[SemesterID] [varchar](20) NOT NULL,
	[SemesterName] [varchar](50) NOT NULL,
	[From] [date] NULL,
	[To] [date] NULL,
 CONSTRAINT [PK_Semesters] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [varchar](10) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [varchar](10) NOT NULL,
	[SubjectName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 3/29/2021 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [varchar](20) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password], [role], [StudentID], [TeacherID]) VALUES (N'aatvteacher100', N'12345678', 1, NULL, N'teacher100')
INSERT [dbo].[accounts] ([username], [password], [role], [StudentID], [TeacherID]) VALUES (N'abltteacher101', N'12345678', 1, NULL, N'teacher101')
INSERT [dbo].[accounts] ([username], [password], [role], [StudentID], [TeacherID]) VALUES (N'acntteacher102', N'12345678', 1, NULL, N'teacher102')
INSERT [dbo].[accounts] ([username], [password], [role], [StudentID], [TeacherID]) VALUES (N'aanvdemo100000', N'12345678', 2, N'demo100000', NULL)
INSERT [dbo].[accounts] ([username], [password], [role], [StudentID], [TeacherID]) VALUES (N'abnvdemo100001', N'12345678', 2, N'demo100001', NULL)
INSERT [dbo].[accounts] ([username], [password], [role], [StudentID], [TeacherID]) VALUES (N'acnvdemo100003', N'12345678', 2, N'demo100003', NULL)
GO
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100000', N'teacher100', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100001', N'teacher100', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100002', N'teacher100', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100003', N'teacher100', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100004', N'teacher100', N'PRF192')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100005', N'teacher101', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100006', N'teacher101', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100007', N'teacher101', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100008', N'teacher101', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100009', N'teacher101', N'PRF192')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100010', N'teacher102', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100011', N'teacher102', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100012', N'teacher102', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100013', N'teacher102', N'PRF192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100014', N'teacher102', N'PRF192')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100005', N'teacher100', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100001', N'teacher100', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100002', N'teacher100', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100003', N'teacher100', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1000', N'demo100004', N'teacher100', N'DBI202')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100010', N'teacher101', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100006', N'teacher101', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100007', N'teacher101', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100008', N'teacher101', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1001', N'demo100009', N'teacher101', N'DBI202')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100000', N'teacher102', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100011', N'teacher102', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100012', N'teacher102', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100013', N'teacher102', N'DBI202')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2020', N'class1002', N'demo100014', N'teacher102', N'DBI202')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100000', N'teacher100', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100001', N'teacher100', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100002', N'teacher100', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100003', N'teacher100', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100004', N'teacher100', N'PRO192')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100005', N'teacher101', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100006', N'teacher101', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100007', N'teacher101', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100008', N'teacher101', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100009', N'teacher101', N'PRO192')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100010', N'teacher102', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100011', N'teacher102', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100012', N'teacher102', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100013', N'teacher102', N'PRO192')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100014', N'teacher102', N'PRO192')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100005', N'teacher100', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100001', N'teacher100', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100002', N'teacher100', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100003', N'teacher100', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1000', N'demo100004', N'teacher100', N'CSD201')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100010', N'teacher101', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100006', N'teacher101', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100007', N'teacher101', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100008', N'teacher101', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1001', N'demo100009', N'teacher101', N'CSD201')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100000', N'teacher102', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100011', N'teacher102', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100012', N'teacher102', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100013', N'teacher102', N'CSD201')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SU2020', N'class1002', N'demo100014', N'teacher102', N'CSD201')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100000', N'teacher100', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100001', N'teacher100', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100002', N'teacher100', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100003', N'teacher100', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100004', N'teacher100', N'PRJ311')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100005', N'teacher101', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100006', N'teacher101', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100007', N'teacher101', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100008', N'teacher101', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100009', N'teacher101', N'PRJ311')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100010', N'teacher102', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100011', N'teacher102', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100012', N'teacher102', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100013', N'teacher102', N'PRJ311')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100014', N'teacher102', N'PRJ311')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100005', N'teacher100', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100001', N'teacher100', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100002', N'teacher100', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100003', N'teacher100', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1000', N'demo100004', N'teacher100', N'PRJ321')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100010', N'teacher101', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100006', N'teacher101', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100007', N'teacher101', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100008', N'teacher101', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1001', N'demo100009', N'teacher101', N'PRJ321')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100000', N'teacher102', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100011', N'teacher102', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100012', N'teacher102', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100013', N'teacher102', N'PRJ321')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'FA2020', N'class1002', N'demo100014', N'teacher102', N'PRJ321')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100000', N'teacher100', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100001', N'teacher100', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100002', N'teacher100', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100003', N'teacher100', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100004', N'teacher100', N'PRN292')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100005', N'teacher101', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100006', N'teacher101', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100007', N'teacher101', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100008', N'teacher101', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100009', N'teacher101', N'PRN292')
GO
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100010', N'teacher102', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100011', N'teacher102', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100012', N'teacher102', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100013', N'teacher102', N'PRN292')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100014', N'teacher102', N'PRN292')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100005', N'teacher100', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100001', N'teacher100', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100002', N'teacher100', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100003', N'teacher100', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1000', N'demo100004', N'teacher100', N'PRM391')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100010', N'teacher101', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100006', N'teacher101', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100007', N'teacher101', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100008', N'teacher101', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1001', N'demo100009', N'teacher101', N'PRM391')

INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100000', N'teacher102', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100011', N'teacher102', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100012', N'teacher102', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100013', N'teacher102', N'PRM391')
INSERT [dbo].[AClass] ([SemesterID], [ClassID], [StudentID], [TeacherID], [SubjectID]) VALUES (N'SP2021', N'class1002', N'demo100014', N'teacher102', N'PRM391')
GO
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (N'class1000', N'class1000')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (N'class1001', N'class1001')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (N'class1002', N'class1002')
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100000', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100001', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100002', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100003', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100004', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100005', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100006', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100007', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100008', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100009', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100010', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100011', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100012', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100013', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100014', N'PRF192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)

INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100000', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100001', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100002', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100003', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100004', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100005', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100006', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100007', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100008', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100009', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100010', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100011', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100012', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100013', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100014', N'DBI202', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)

INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100000', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100001', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100002', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100003', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100004', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100005', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100006', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100007', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100008', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100009', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100010', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100011', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100012', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100013', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100014', N'PRO192', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)

INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100000', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100001', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100002', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100003', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100004', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100005', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100006', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100007', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100008', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100009', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100010', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100011', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100012', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100013', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100014', N'CSD201', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)

INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100000', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100001', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100002', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100003', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100004', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100005', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100006', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100007', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100008', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100009', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100010', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100011', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100012', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100013', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100014', N'PRJ311', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)

INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100000', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100001', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100002', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100003', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100004', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100005', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100006', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100007', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100008', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100009', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100010', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100011', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100012', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ([StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100013', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)
INSERT [dbo].[Marks] ( [StudentID], [SubjectID], [Lab1], [Lab2], [Lab3], [Lab4], [ProgressTest1], [ProgressTest2], [Practicalexam], [FinalExam], [FinalExamResit], [Total]) VALUES ( N'demo100014', N'PRJ321', 7, 8, 7, 8, 7, 8, 7, 8, NULL, 7.55)

INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100000', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100001', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100002', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100003', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100004', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100005', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100006', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100007', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100008', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100009', N'PRN292')
INSERT [dbo].[Marks] ([StudentID], [SubjectID]) VALUES ( N'demo100010', N'PRN292')
INSERT [dbo].[Marks] ([StudentID], [SubjectID]) VALUES ( N'demo100011', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100012', N'PRN292')
INSERT [dbo].[Marks] ([StudentID], [SubjectID]) VALUES ( N'demo100013', N'PRN292')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100014', N'PRN292')

INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100000', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100001', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100002', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100003', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100004', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100005', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100006', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100007', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100008', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100009', N'PRM391')
INSERT [dbo].[Marks] ([StudentID], [SubjectID]) VALUES ( N'demo100010', N'PRM391')
INSERT [dbo].[Marks] ([StudentID], [SubjectID]) VALUES ( N'demo100011', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100012', N'PRM391')
INSERT [dbo].[Marks] ([StudentID], [SubjectID]) VALUES ( N'demo100013', N'PRM391')
INSERT [dbo].[Marks] ( [StudentID], [SubjectID]) VALUES ( N'demo100014', N'PRM391')

SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName], [From], [To]) VALUES (N'SP2020', N'Spring2020', CAST(N'2020-01-01' AS Date), CAST(N'2020-04-30' AS Date))
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName], [From], [To]) VALUES (N'SU2020', N'Summer2020', CAST(N'2020-05-01' AS Date), CAST(N'2020-08-31' AS Date))
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName], [From], [To]) VALUES (N'FA2020', N'Fall2020', CAST(N'2020-09-01' AS Date), CAST(N'2020-12-31' AS Date))
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName], [From], [To]) VALUES (N'SP2021', N'Spring2021', CAST(N'2021-01-01' AS Date), CAST(N'2021-04-30' AS Date))
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100000', N'AA', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100001', N'AB', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100002', N'AC', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100003', N'AD', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100004', N'AE', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100005', N'AF', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100006', N'AG', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100007', N'AH', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100008', N'AI', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100009', N'AJ', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100010', N'AK', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100011', N'AL', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100012', N'AM', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100013', N'AN', N'Nguyen Van')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (N'demo100014', N'AO', N'Nguyen Van')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'CSD201', N'Data Structures and Algorithms')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'PRF192', N'Programming Fundamentals')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'PRJ311', N'Desktop Java Applications')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'PRJ321', N'Web-Based Java Applications')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'PRM391', N'Mobile Programming')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'PRN292', N'.NET and C#')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName]) VALUES (N'PRO192', N'Object-Oriented Programming')
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName]) VALUES (N'teacher100', N'AA', N'Tran Van')
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName]) VALUES (N'teacher101', N'AB', N'Le Thu')
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName]) VALUES (N'teacher102', N'AC', N'Nguyen Tuan')
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[AClass]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[AClass]  WITH CHECK ADD FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semesters] ([SemesterID])
GO
ALTER TABLE [dbo].[AClass]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[AClass]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[AClass]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
USE [master]
GO
ALTER DATABASE [prn292] SET  READ_WRITE 
GO
