USE [master]
GO
/****** Object:  Database [Projekat]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE DATABASE [Projekat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Projekat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Projekat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projekat] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projekat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projekat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projekat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projekat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projekat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projekat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projekat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projekat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projekat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projekat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projekat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projekat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projekat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projekat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projekat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projekat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projekat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projekat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projekat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projekat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projekat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Projekat] SET  MULTI_USER 
GO
ALTER DATABASE [Projekat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projekat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projekat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projekat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Projekat] SET QUERY_STORE = OFF
GO
USE [Projekat]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Content] [nvarchar](60) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Path] [nvarchar](450) NOT NULL,
	[PostId] [int] NOT NULL,
	[PostId1] [int] NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[UserId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUserCase]    Script Date: 6/17/2021 2:17:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUserCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUserCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200902014354_initialsetup', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200902021936_initialsetup2', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200902022543_initialsetup3', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (4, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'nestoo', 6, 1)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (7, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'asdasdas', 3, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (8, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'asfdfsdf', 3, 1)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (9, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'wdsadsa', 6, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (14, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'bcxvxcvx', 6, 1)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (15, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'cmjghj', 7, 1)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (16, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'tsdfdsf', 7, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (18, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'ssdgsg', 8, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (19, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'afacccaa', 8, 1)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (20, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'hghgfhfgh', 8, 1003)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Content], [PostId], [UserId]) VALUES (21, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'ggggg', 8, 1004)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name]) VALUES (1, N'Priroda')
INSERT [dbo].[Groups] ([Id], [Name]) VALUES (2, N'Tehnologija')
INSERT [dbo].[Groups] ([Id], [Name]) VALUES (3, N'Umetnost')
INSERT [dbo].[Groups] ([Id], [Name]) VALUES (4, N'Vozila')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Path], [PostId], [PostId1]) VALUES (3, CAST(N'2020-09-02T04:20:27.4340819' AS DateTime2), NULL, 0, NULL, 1, N'5140154f-e293-4975-bf57-f9f8ec1bcf0e.jpg', N'wwwroot\images\5140154f-e293-4975-bf57-f9f8ec1bcf0e.jpg', 7, NULL)
INSERT [dbo].[Photos] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [Path], [PostId], [PostId1]) VALUES (4, CAST(N'2020-09-02T04:26:39.5551633' AS DateTime2), NULL, 0, NULL, 1, N'1b536e7e-34f4-4b3c-8d82-c469872d8b17.jpg', N'wwwroot\images\1b536e7e-34f4-4b3c-8d82-c469872d8b17.jpg', 8, NULL)
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (3, CAST(N'2020-09-02T04:03:13.6035237' AS DateTime2), NULL, 0, NULL, 1, N'Nikola', 2, 2, N'nekitamo')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (6, CAST(N'2020-09-02T04:13:51.0702952' AS DateTime2), NULL, 0, NULL, 1, N'likas', 1, 2, N'nekitamo2')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (7, CAST(N'2020-09-02T04:20:27.3767582' AS DateTime2), NULL, 0, NULL, 1, N'likas2', 2, 3, N'nekitamo2ad')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (8, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'slikaa', 2, 3, N'nekitamo2adg')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1004, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'Silkica', 2, 4, N'asdasdas')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1005, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'sicica', 1, 1, N'asdasda')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1006, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'asdasd', 2, 1, N'asdsa')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1008, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'asdsaaaaa', 1003, 2, N'asdsd')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1009, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'naaasd', 1003, 4, N'hkggk')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1010, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'kokokl', 1004, 2, N'asaaa')
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name], [UserId], [GroupId], [Description]) VALUES (1011, CAST(N'2020-09-02T04:26:39.4981255' AS DateTime2), NULL, 0, NULL, 1, N'aassaass', 1004, 3, N'ytytyt')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-09-02T01:51:40.7331814' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Nikola","ImageName":"8c5d5a20-fdfe-4ed5-808d-676ab0812542.jpg","Path":"wwwroot\\images\\8c5d5a20-fdfe-4ed5-808d-676ab0812542.jpg","UserId":0,"GroupId":2,"Description":"nekitamo","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"sle.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"sle.jpg\""],"Content-Type":["image/jpeg"]},"Length":52790,"Name":"image","FileName":"sle.jpg"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-09-02T01:53:24.1334600' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Nikola","ImageName":"8d7b2d0b-e5f3-46e4-ba0a-a4d80b460ba9.jpg","Path":"wwwroot\\images\\8d7b2d0b-e5f3-46e4-ba0a-a4d80b460ba9.jpg","UserId":0,"GroupId":2,"Description":"nekitamo","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"sle.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"sle.jpg\""],"Content-Type":["image/jpeg"]},"Length":52790,"Name":"image","FileName":"sle.jpg"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-09-02T01:54:57.2327683' AS DateTime2), N'User Registration', N'{"FirstName":"Stefan","LastName":"Popovic","Password":"nekitamo","Email":"stefan@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-09-02T01:55:29.6232165' AS DateTime2), N'User Registration', N'{"FirstName":"Milan","LastName":"kopovic","Password":"nekitamo2","Email":"milan@gmail.com"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-09-02T02:03:12.0564073' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Nikola","ImageName":"daf64784-109d-45e2-a2a6-f33bf5d61883.png","Path":"wwwroot\\images\\daf64784-109d-45e2-a2a6-f33bf5d61883.png","UserId":0,"GroupId":2,"Description":"nekitamo","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\""],"Content-Type":["image/png"]},"Length":747768,"Name":"image","FileName":"Screenshot 2020-03-22 20.59.55.png"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-09-02T02:10:42.6519935' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Nikola","ImageName":"e848f915-1bd4-4c0e-8bf7-0ef7c06019c0.png","Path":"wwwroot\\images\\e848f915-1bd4-4c0e-8bf7-0ef7c06019c0.png","UserId":0,"GroupId":2,"Description":"nekitamo","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\""],"Content-Type":["image/png"]},"Length":747768,"Name":"image","FileName":"Screenshot 2020-03-22 20.59.55.png"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-09-02T02:11:54.6480812' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Nikola","ImageName":"6bd36284-d373-4d64-ae02-850f62b39d2e.png","Path":"wwwroot\\images\\6bd36284-d373-4d64-ae02-850f62b39d2e.png","UserId":0,"GroupId":2,"Description":"nekitamo2","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\""],"Content-Type":["image/png"]},"Length":747768,"Name":"image","FileName":"Screenshot 2020-03-22 20.59.55.png"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-09-02T02:13:49.5424382' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"likas","ImageName":"fcd9a876-803d-4bdb-8017-ae3faa94f90a.png","Path":"wwwroot\\images\\fcd9a876-803d-4bdb-8017-ae3faa94f90a.png","UserId":0,"GroupId":2,"Description":"nekitamo2","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\""],"Content-Type":["image/png"]},"Length":747768,"Name":"image","FileName":"Screenshot 2020-03-22 20.59.55.png"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-09-02T02:20:25.7444560' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"likas2","ImageName":"5140154f-e293-4975-bf57-f9f8ec1bcf0e.jpg","Path":"wwwroot\\images\\5140154f-e293-4975-bf57-f9f8ec1bcf0e.jpg","UserId":0,"GroupId":3,"Description":"nekitamo2ad","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"sle.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"sle.jpg\""],"Content-Type":["image/jpeg"]},"Length":52790,"Name":"image","FileName":"sle.jpg"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-09-02T02:26:37.9405795' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"slikaa","ImageName":"1b536e7e-34f4-4b3c-8d82-c469872d8b17.jpg","Path":"wwwroot\\images\\1b536e7e-34f4-4b3c-8d82-c469872d8b17.jpg","UserId":0,"GroupId":3,"Description":"nekitamo2adg","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"sle.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"sle.jpg\""],"Content-Type":["image/jpeg"]},"Length":52790,"Name":"image","FileName":"sle.jpg"}}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1002, CAST(N'2021-06-16T18:00:31.5247113' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Asdasda","ImageName":"11e3e034-d78a-4a86-8f4f-784af248d3b7.png","Path":"wwwroot\\images\\11e3e034-d78a-4a86-8f4f-784af248d3b7.png","UserId":0,"GroupId":2,"Description":"nekitamoaa","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\""],"Content-Type":["image/png"]},"Length":747768,"Name":"image","FileName":"Screenshot 2020-03-22 20.59.55.png"}}', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1003, CAST(N'2021-06-16T18:02:11.0794402' AS DateTime2), N'Deleting Post', N'1002', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1004, CAST(N'2021-06-16T18:13:45.4789132' AS DateTime2), N'Deleting Post', N'1002', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1005, CAST(N'2021-06-16T18:16:08.0090991' AS DateTime2), N'Deleting Post', N'1002', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1006, CAST(N'2021-06-16T18:37:06.9841601' AS DateTime2), N'Create Post', N'{"Id":0,"Name":"Asdasda","ImageName":"24424fc5-61c6-4c04-bd3e-874910b513c8.png","Path":"wwwroot\\images\\24424fc5-61c6-4c04-bd3e-874910b513c8.png","UserId":0,"GroupId":2,"Description":"nekitamoaa","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"Screenshot 2020-03-22 20.59.55.png\""],"Content-Type":["image/png"]},"Length":747768,"Name":"image","FileName":"Screenshot 2020-03-22 20.59.55.png"}}', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1007, CAST(N'2021-06-16T18:37:59.1068756' AS DateTime2), N'Deleting Post', N'1003', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1008, CAST(N'2021-06-16T18:41:35.1548233' AS DateTime2), N'Deleting Post', N'1003', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1009, CAST(N'2021-06-16T18:43:55.8170509' AS DateTime2), N'Deleting Post', N'1003', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1010, CAST(N'2021-06-16T19:02:23.6841469' AS DateTime2), N'Deleting Post', N'1003', N'stefan@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1011, CAST(N'2021-06-16T19:06:13.9211199' AS DateTime2), N'Deleting Post', N'1003', N'stefan@gmail.com')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password]) VALUES (1, CAST(N'2020-09-02T03:54:58.9253482' AS DateTime2), NULL, 0, NULL, 1, N'Stefan', N'Popovic', N'stefan@gmail.com', N'nekitamo')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password]) VALUES (2, CAST(N'2020-09-02T03:55:29.6363643' AS DateTime2), NULL, 0, NULL, 1, N'Milan', N'kopovic', N'milan@gmail.com', N'nekitamo2')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password]) VALUES (1003, CAST(N'2020-09-02T03:55:29.6363643' AS DateTime2), NULL, 0, NULL, 1, N'Nesto', N'Nestovic', N'asda@gmail.com', N'nestotamo')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password]) VALUES (1004, CAST(N'2020-09-02T03:55:29.6363643' AS DateTime2), NULL, 0, NULL, 1, N'Neki', N'Nekivic', N'neki@gmail.com', N'nekako')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password]) VALUES (1005, CAST(N'2020-09-02T03:55:29.6363643' AS DateTime2), NULL, 0, NULL, 1, N'Tototo', N'Totovic', N'toto@gmail.com', N'tototo')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Email], [Password]) VALUES (1007, CAST(N'2020-09-02T03:55:29.6363643' AS DateTime2), NULL, 0, NULL, 1, N'Tebra', N'Tebric', N'tebri@gmail.com', N'terbiti')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUserCase] ON 

INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (5, 1, 1)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (6, 1, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 3)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (8, 1, 4)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (9, 1, 5)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (10, 2, 4)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (11, 2, 5)
SET IDENTITY_INSERT [dbo].[UserUserCase] OFF
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Groups_Name]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Groups_Name] ON [dbo].[Groups]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Photos_Name]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Photos_Name] ON [dbo].[Photos]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Photos_Path]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Photos_Path] ON [dbo].[Photos]
(
	[Path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Photos_PostId]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_Photos_PostId] ON [dbo].[Photos]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Photos_PostId1]    Script Date: 6/17/2021 2:17:54 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Photos_PostId1] ON [dbo].[Photos]
(
	[PostId1] ASC
)
WHERE ([PostId1] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_GroupId]    Script Date: 6/17/2021 2:17:55 AM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_GroupId] ON [dbo].[Posts]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Posts_Name]    Script Date: 6/17/2021 2:17:55 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Posts_Name] ON [dbo].[Posts]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/17/2021 2:17:55 AM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Users_Email]    Script Date: 6/17/2021 2:17:55 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/17/2021 2:17:55 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUserCase_UserId]    Script Date: 6/17/2021 2:17:55 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserUserCase_UserId] ON [dbo].[UserUserCase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Posts_PostId]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Posts_PostId1] FOREIGN KEY([PostId1])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Posts_PostId1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Groups_GroupId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[UserUserCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUserCase_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUserCase] CHECK CONSTRAINT [FK_UserUserCase_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Projekat] SET  READ_WRITE 
GO
