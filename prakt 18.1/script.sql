USE [master]
GO
/****** Object:  Database [Salary]    Script Date: 20.04.2022 14:55:30 ******/
--CREATE DATABASE [Salary]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'Salary', FILENAME = N'D:\SQL_BASE\Salary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
-- LOG ON 
--( NAME = N'Salary_log', FILENAME = N'D:\SQL_BASE\Salary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
--GO
--ALTER DATABASE [Salary] SET COMPATIBILITY_LEVEL = 140
--GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Salary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
--ALTER DATABASE [Salary] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [Salary] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [Salary] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [Salary] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [Salary] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [Salary] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [Salary] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [Salary] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [Salary] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [Salary] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [Salary] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [Salary] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [Salary] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [Salary] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [Salary] SET  DISABLE_BROKER 
--GO
--ALTER DATABASE [Salary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [Salary] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [Salary] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [Salary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [Salary] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [Salary] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [Salary] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [Salary] SET RECOVERY SIMPLE 
--GO
--ALTER DATABASE [Salary] SET  MULTI_USER 
--GO
--ALTER DATABASE [Salary] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [Salary] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [Salary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [Salary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
--GO
--ALTER DATABASE [Salary] SET DELAYED_DURABILITY = DISABLED 
--GO
--ALTER DATABASE [Salary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
--GO
--ALTER DATABASE [Salary] SET QUERY_STORE = OFF
--GO
USE [Salary]
GO
/****** Object:  Table [dbo].[MonthlySalary]    Script Date: 20.04.2022 14:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlySalary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Workshop] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[SizeSalary] [money] NOT NULL,
	[WorkExperiance] [tinyint] NOT NULL,
	[Category] [tinyint] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MonthlySalary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MonthlySalary] ON 

INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (1, N'Савельев', N'Дмитрий', N'Александрович', N'Колбасный цех', CAST(N'2021-11-12' AS Date), 100000.0000, 7, 1, N'Оператор-наборщик')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (2, N'Сомов', N'Михаил', N'Алексеевич', N'Кондитерский цех', CAST(N'2018-03-05' AS Date), 55000.0000, 3, 3, N'Начальник цеха')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (3, N'Назаров', N'Дмитрий', N'Александрович', N'Молочный цех', CAST(N'2020-01-12' AS Date), 67000.0000, 4, 2, N'Начальник цеха')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (4, N'Самсаков', N'Андрей', N'Александрович', N'Рыбный цех', CAST(N'2022-01-01' AS Date), 37000.0000, 1, 1, N'Сортировщик')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (5, N'Обухов', N'Сергей', N'Максимович', N'Молочный цеч', CAST(N'2017-02-01' AS Date), 43500.0000, 8, 4, N'Начальник цеха')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (8, N'Косуров', N'Илья', N'Николаевич', N'Овощной цех', CAST(N'2017-03-24' AS Date), 52000.0000, 10, 5, N'Заготовщик')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (9, N'Иванов', N'Михаил', N'Иванович', N'Колбасный цех', CAST(N'2014-03-03' AS Date), 30000.0000, 15, 6, N'Заготовщик')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (11, N'Лейбович', N'Михаил', N'Васильевич', N'Транспортный цех', CAST(N'2015-02-05' AS Date), 76000.0000, 9, 3, N'Заместитель начальника цеха')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (12, N'Лопаткин', N'Сергей', N'Михайлович', N'Холодный цех', CAST(N'2019-11-11' AS Date), 25000.0000, 2, 1, N'Повар холодного цеха')
INSERT [dbo].[MonthlySalary] ([Id], [FirstName], [MiddleName], [LastName], [Workshop], [Date], [SizeSalary], [WorkExperiance], [Category], [Position]) VALUES (13, N'Шестаков', N'Артем', N'Александрович', N'Горячий цех', CAST(N'2021-01-01' AS Date), 34000.0000, 7, 4, N'Повар горячего цеха')
SET IDENTITY_INSERT [dbo].[MonthlySalary] OFF
GO
USE [master]
GO
ALTER DATABASE [Salary] SET  READ_WRITE 
GO
