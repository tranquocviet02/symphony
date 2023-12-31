USE [master]
GO
/****** Object:  Database [symphony_limited]    Script Date: 18/1/2022 11:12:58 AM ******/
CREATE DATABASE [symphony_limited]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'symphony_limited', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\symphony_limited.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'symphony_limited_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\symphony_limited_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [symphony_limited] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [symphony_limited].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [symphony_limited] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [symphony_limited] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [symphony_limited] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [symphony_limited] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [symphony_limited] SET ARITHABORT OFF 
GO
ALTER DATABASE [symphony_limited] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [symphony_limited] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [symphony_limited] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [symphony_limited] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [symphony_limited] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [symphony_limited] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [symphony_limited] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [symphony_limited] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [symphony_limited] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [symphony_limited] SET  ENABLE_BROKER 
GO
ALTER DATABASE [symphony_limited] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [symphony_limited] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [symphony_limited] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [symphony_limited] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [symphony_limited] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [symphony_limited] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [symphony_limited] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [symphony_limited] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [symphony_limited] SET  MULTI_USER 
GO
ALTER DATABASE [symphony_limited] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [symphony_limited] SET DB_CHAINING OFF 
GO
ALTER DATABASE [symphony_limited] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [symphony_limited] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [symphony_limited] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [symphony_limited] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [symphony_limited] SET QUERY_STORE = OFF
GO
USE [symphony_limited]
GO
/****** Object:  Table [dbo].[Academy]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academy](
	[AcademyId] [int] IDENTITY(1,1) NOT NULL,
	[PeopleManageme] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [int] NULL,
	[Email] [nvarchar](150) NULL,
	[Fanpage] [nvarchar](150) NULL,
	[ImgAcademy] [text] NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[AcademyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Subject] [text] NULL,
	[message] [text] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[NameCourse] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[Numberofsession] [int] NULL,
	[TeacherId] [int] NULL,
	[Img] [text] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[PassWord] [nvarchar](20) NULL,
 CONSTRAINT [PK_Admin1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NameReult] [nvarchar](10) NULL,
	[Point] [float] NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[NameStudent] [nvarchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[Email] [text] NULL,
	[PhoneNumber] [int] NULL,
	[CourseId] [int] NOT NULL,
	[Genre] [nchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[NameTeachear] [nvarchar](50) NULL,
	[Experience] [text] NULL,
	[Image] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Academy] ON 

INSERT [dbo].[Academy] ([AcademyId], [PeopleManageme], [Address], [PhoneNumber], [Email], [Fanpage], [ImgAcademy], [description]) VALUES (6, N'Admin', N'Hà Nội', 123456789, N'Admin@gmail.com', N'https://www.facebook.com/tt.2116', N'academy6.jpg', N'learning 1')
INSERT [dbo].[Academy] ([AcademyId], [PeopleManageme], [Address], [PhoneNumber], [Email], [Fanpage], [ImgAcademy], [description]) VALUES (8, N'Admin2', N'Hà Nội', 123456789, N'Admin2@gmail.com', N'https://www.facebook.com/profile.php?id=100048774810014', N'academy8.jpg', N'learning 2')
INSERT [dbo].[Academy] ([AcademyId], [PeopleManageme], [Address], [PhoneNumber], [Email], [Fanpage], [ImgAcademy], [description]) VALUES (9, N'Admin3', N'Hà Nam', 123456789, N'Admin3@gmail.com', N'https://www.facebook.com/s2viet2s/', N'academy9.jpg', N'learning 3')
SET IDENTITY_INSERT [dbo].[Academy] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [NameCategory]) VALUES (2, N'Frontend')
INSERT [dbo].[Category] ([CategoryId], [NameCategory]) VALUES (3, N'BackEnd')
INSERT [dbo].[Category] ([CategoryId], [NameCategory]) VALUES (4, N'Java')
INSERT [dbo].[Category] ([CategoryId], [NameCategory]) VALUES (5, N'AnDroid')
INSERT [dbo].[Category] ([CategoryId], [NameCategory]) VALUES (6, N'C sharp')
INSERT [dbo].[Category] ([CategoryId], [NameCategory]) VALUES (7, N'Lập Trình C')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactId], [FullName], [Email], [Subject], [message]) VALUES (3, N'tran van viet', N'tranvanviet496@gmail.com', N'Student', N'tuyet voi ')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (19, N'Java Base', CAST(99 AS Decimal(18, 0)), N'active', N'Defines the foundational APIs of the Java SE Platform. Providers: The JDK implementation of this module provides an implementation of the jrt file system provider to enumerate and read the class and resource files in a run-time image.', 22, 13, N'teacher19.jpg', 4)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (21, N'Học BootStrap', CAST(200 AS Decimal(18, 0)), N'No Active', N'Get started with Bootstrap, the world’s most popular framework for building responsive, mobile-first sites, with BootstrapCDN and a template starter page.', 14, 14, N'teacher21.jpg', 2)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (22, N'Học JS', CAST(123 AS Decimal(18, 0)), N'No Active', N'JavaScript was initially created to “make web pages alive”.  The programs in this language are called scripts. They can be written right in a web page’s HTML and run automatically as the page loads.  Scripts are provided and executed as plain text. They don’t need special preparation or compilation to run.  In this aspect, JavaScript is very different from another language called Java.', 14, 12, N'teacher22.png', 2)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (23, N'Jquery', CAST(200 AS Decimal(18, 0)), N'Active', N'jQuery to handle the DOM on the web page. Without jQuery , we would have to deal with the DOM very, very hard; for example will have to frequently call document.getElementByTagName to get the element you want to manipulate, will have to manually traverse the html tree node.  html tree nodes  When using jQuery, it''s just a function call but it''s much shorter,. Not only that, $ is also very special when it allows you to randomly select an element on the page without having to go through it sequentially, etc. Once you have conveniently "grabbed" the elements on the page, you will freely change, animate them, from changing the text color, background color, making it fly on the screen, zooming in and out, ... to changing the content without reloading the entire page with Ajax technique.', 23, 12, N'teacher23.jpg', 2)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (28, N'Html/Css', CAST(100 AS Decimal(18, 0)), N'No Active', N'HTML stands for HyperText Markup Language (hypertext markup language) used to describe the structure of Web pages and create document types viewable in the browser.  HTML is an international standard whose specifications are maintained by the World Wide Web Consortium.', 14, 15, N'teacher28.png', 2)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (29, N'Angular', CAST(99 AS Decimal(18, 0)), N'Active', N'Angular is a javascript framework developed by google for building Single Page Applications (SPA) using JavaScript, HTML and TypeScript. Angular provides built-in features for animation , http service and has features like auto-complete , navigation , toolbar , menus , etc. The code is written in TypeScript , compiles to JavaScript and displays the same in the browser.', 15, 14, N'course29.png', 2)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (30, N'PHP', CAST(120 AS Decimal(18, 0)), N'No Active', N'PHP - Regression short for "Hypertext Preprocessor", is a scripting language that is run on the server side to generate html code on the client. PHP has gone through many versions and is optimized for web applications, with clear coding, fast speed, and ease of learning, so PHP has become a very popular and popular web programming language. .   PHP runs on a Webserver environment and stores data through a database management system, so PHP usually comes with Apache, MySQL and Linux operating system (LAMP).  Apache is a web server software that is responsible for receiving requests from the user''s browser, then handing it over to PHP to process and send back to the browser. MySQL is similar to other database management systems (Postgress, Oracle, SQL server...) as a place to store and query data. Linux: The widely used open source operating system for web servers. Usually the most used versions are RedHat Enterprise Linux, Ubuntu...', 14, 13, N'teacher30.png', 3)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (31, N'Laravel', CAST(99 AS Decimal(18, 0)), N'Active', N'For every developer, especially PHP developers, everyone knows that Laravel is an open source framework that ranks first in terms of downloads on Packagist as well as stars achieved on Github. Laravel was created by Taylor Otwell with the first version released in June 2011. Since then, Laravel has grown tremendously, surpassing other frameworks and rising to become the PHP framework that can be. said to be the most popular and used by the community when developing web with PHP. Here is a chart showing the growth of Laravel''s github stars compared to some other frameworks:', 21, 13, N'course31.jpg', 3)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (32, N'Sql/Mysql', CAST(123 AS Decimal(18, 0)), N'No Active', N'Note that MySQL is an open source database management system, so it only supports "open" languages, source codes like C++ will not be able to use MySQL for their projects. In addition, according to the company from Microsoft''s own bugnetproject, they have also confirmed that C++ or .Net Development languages will not be supported on the mySQL platform.', 14, 15, N'course32.jpg', 3)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (33, N'Java Advenced', CAST(156 AS Decimal(18, 0)), N'No Active', N'Advanced Web Programming with Java (Java Web Advanced) course is designed by NIIT - ICT HANOI in collaboration with enterprises (Application Programming & Advanced Java Web Programming) according to recruitment orders from enterprises , Specifically:  - Students learn from basic to advanced concepts, programming skills with the Java language as a prerequisite for accessing Java technologies such as Andoird, Web-Application, Services...  - Students understand the process of developing a Java Web project, directing students to the fastest web development and application building technologies, best performance and security through the latest developed frameworks. from SUN.  Students are equipped with development tools and code management tools according to the POM model commonly used by businesses. Students get practical experience through projects so that they can master advanced web programming technologies: Hibernate, JSF, SPRING...   After the course, students have enough knowledge and skills to apply to large software companies such as Fsoft, Tinh Van, CMC soft, Niteco, etc.', 16, 12, N'course33.jpg', 4)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (34, N'Java Web & Ejb ( EAD )', CAST(134 AS Decimal(18, 0)), N'Active', N'- Java EE (Enterprise Edition) là m?t n?n t?ng du?c s? d?ng r?ng rãi, ch?a m?t t?p h?p các công ngh? du?c ph?i h?p vào nhau, làm gi?m dáng k? chi phí và d? ph?c t?p c?a vi?c phát tri?n, tri?n khai và qu?n lý các t?ng làm vi?c, các ?ng d?ng máy ch? trung tâm. Java EE du?c xây d?ng d?a trên n?n t?ng Java SE và cung c?p thêm m?t t?p các API (giao di?n l?p trình ?ng d?ng) d? phát tri?n và ho?t d?ng các ?ng d?ng phía máy ch? (Server-Side Applications) m?t cách m?nh m?, có kh? nang m? rông, dáng tin c?y, di dông (portable) và b?o m?t. * M?t s? thành ph?n co b?n bao g?m: - Enterprise Java Beans (EJB): m?t thành ph?n ki?n trúc c?a các ?ng d?ng server du?c qu?n lý, s? d?ng d? bao gói (encapsulate) các business logic c?a các ?ng d?ng. Công ngh? EJB cho phép phát tri?n nhanh chóng và don gi?n hóa các ?ng d?ng phân tán, các giao d?ch an toàn và di d?ng d?a trên công ngh? Java. - Java Persistence API (JPA): m?t framework cho pháp nhà phát tri?n qu?n lý d? li?u b?ng cách s? d?ng ánh x? d?i tu?ng quan h? (Object Relational Mapping - ORM) trong các d?ng d?ng du?c xây d?ng trên n?n t?ng Java.', 14, 13, N'course34.jpg', 4)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (35, N'C++', CAST(199 AS Decimal(18, 0)), N'Active', N'1.015 / 5.000 K?t qu? d?ch C++ is a middle-level programming language. It means you can use C++ to develop high-level applications, and also low-level programs that work well on hardware. C++ is an object-oriented programming language. Unlike C programming language - a procedural programming language, programs are organized in terms of "functions", a function that includes the actions you want to do. C++ is designed with a completely new approach called object-oriented programming, where we use objects, classes and use concepts like: inheritance, polymorphism, encapsulation , abstraction… These concepts are quite complicated, so if you don''t understand them yet, don''t worry, we will clarify each concept in turn in different lessons. C++ is a structured programming language like C, which means we can organize programs on the concept of functions. C++ can run on many different platforms such as Windows, Mac OS, some variants of UNIX, etc. ', 19, 12, N'teacher35.png', 7)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (36, N'C sharp', CAST(150 AS Decimal(18, 0)), N'Active', N'In traditional Windows applications, the program source code is compiled directly into the operating system''s executable code. In applications that use the .NET Framework, program source code (C#, VB.NET) is compiled into Microsoft intermediate language (MSIL) code.', 13, 13, N'teacher36.png', 6)
INSERT [dbo].[Course] ([CourseId], [NameCourse], [Price], [Status], [Description], [Numberofsession], [TeacherId], [Img], [CategoryId]) VALUES (37, N'Android', CAST(255 AS Decimal(18, 0)), N'Active', N'The Android operating system accounts for more than 80% of the modern mobile device market today. Demand for mobile applications is also increasing. The demand for programming jobs on the world''s most popular mobile operating system has also increased sharply due to its openness and accessibility.  This series of articles will guide you through the basics of ANDROID PROGRAMMING. From Activity to Sqlite database, multimedia processing,..v…etc… so you can create your own Android apps for hobby or work.', 15, 14, N'teacher37.jpg', 5)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [Email], [PassWord]) VALUES (19, N'123457890@gmail.com', N'123')
INSERT [dbo].[Login] ([Id], [Email], [PassWord]) VALUES (20, N'tranvanviet497@gmail.com', N'12345')
INSERT [dbo].[Login] ([Id], [Email], [PassWord]) VALUES (21, N'tranvanviet4977@gmail.com', N'admin123')
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([id], [NameReult], [Point], [StudentId]) VALUES (2, N'Java', 6, 6)
INSERT [dbo].[Result] ([id], [NameReult], [Point], [StudentId]) VALUES (3, N'toan', 6, 14)
SET IDENTITY_INSERT [dbo].[Result] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [NameStudent], [BirthDay], [Email], [PhoneNumber], [CourseId], [Genre]) VALUES (6, N'tran van Ninh', CAST(N'2008-02-09T00:00:00.000' AS DateTime), N'tranvanviet496@gmail.com', 962737541, 19, N'M         ')
INSERT [dbo].[Student] ([StudentId], [NameStudent], [BirthDay], [Email], [PhoneNumber], [CourseId], [Genre]) VALUES (9, N'ninh nguyen', CAST(N'2008-02-09T00:00:00.000' AS DateTime), N'Admin2@gmail.com', 962737542, 21, N'M         ')
INSERT [dbo].[Student] ([StudentId], [NameStudent], [BirthDay], [Email], [PhoneNumber], [CourseId], [Genre]) VALUES (11, N'Tran Van Hoang', CAST(N'2008-02-09T00:00:00.000' AS DateTime), N'tranvanviet496@gmail.com', 962737541, 22, N'F         ')
INSERT [dbo].[Student] ([StudentId], [NameStudent], [BirthDay], [Email], [PhoneNumber], [CourseId], [Genre]) VALUES (14, N'tran van viet', CAST(N'2008-02-02T00:00:00.000' AS DateTime), N'tranvanviet496@gmail.com', 962737541, 19, N'F         ')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [NameTeachear], [Experience], [Image]) VALUES (12, N'Thầy Nguyễn Đức Hoàng', N'Chuyên gia Java, Python, IOS', N'teacher12.png')
INSERT [dbo].[Teacher] ([TeacherId], [NameTeachear], [Experience], [Image]) VALUES (13, N'Lê Việt Bách', N'Chuyên môn: C, HTML, Bootstrap/ Jquery, PHP, XML, Java Core, Javafx, C#, .Net Winform, ASP.Net MVC, Laravel', N'teacher13.png')
INSERT [dbo].[Teacher] ([TeacherId], [NameTeachear], [Experience], [Image]) VALUES (14, N'Thầy Văn Thành Chung', N'Chuyên môn: C, HTML, SQL, PHP, BSJ, Java Core', N'teacher14.png')
INSERT [dbo].[Teacher] ([TeacherId], [NameTeachear], [Experience], [Image]) VALUES (15, N'Thầy Đào Mạnh Thắng ', N'Chuyên gia .Net, Hybrid mobile (phonegap)', N'teacher15.png')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Category]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
/****** Object:  StoredProcedure [dbo].[Sp_Admin_login]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Admin_login]
	@Email nvarchar(200),
	@PassWord nvarchar(20)
as
begin 
	declare @count int
	declare @res bit 
	select @count = COUNT(*) from Login where Email = @Email and PassWord = @PassWord
	if @count > 1
		set @res = 1
	else
		set @res = 0 

		select @res
		end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Course_ListAll]    Script Date: 18/1/2022 11:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Course_ListAll]
as
select * from Course where status is not null
order by [NameCourse] asc
GO
USE [master]
GO
ALTER DATABASE [symphony_limited] SET  READ_WRITE 
GO
