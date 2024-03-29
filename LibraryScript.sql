USE [SchoolLibrary]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 14.02.2024 2:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdRole]    Script Date: 14.02.2024 2:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IdRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 14.02.2024 2:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.02.2024 2:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Author], [Date]) VALUES (1, N'Граф Монте Кристо', N'Александр Дюма', N'2017')
INSERT [dbo].[Books] ([Id], [Name], [Author], [Date]) VALUES (2, N'Гарри Поттер и философский камень', N'Джоан Роулинг', N'1997')
INSERT [dbo].[Books] ([Id], [Name], [Author], [Date]) VALUES (3, N'Гарри Поттер и философский камень', N'Джоан Роулинг', N'1997')
INSERT [dbo].[Books] ([Id], [Name], [Author], [Date]) VALUES (4, N'Фантомная память', N'Франк Тилье', N'2018')
INSERT [dbo].[Books] ([Id], [Name], [Author], [Date]) VALUES (1002, N'ыва', N'выа', N'ыва')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[IdRole] ON 

INSERT [dbo].[IdRole] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[IdRole] ([Id], [Name]) VALUES (2, N'teacher')
INSERT [dbo].[IdRole] ([Id], [Name]) VALUES (3, N'student')
INSERT [dbo].[IdRole] ([Id], [Name]) VALUES (4, N'librarian')
SET IDENTITY_INSERT [dbo].[IdRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [UserName], [BookName]) VALUES (1, N'Новикова А.П.', N'Граф Монте Кристо')
INSERT [dbo].[Request] ([Id], [UserName], [BookName]) VALUES (2, N'Кузнецов А.А.', N'Гарри Потер')
INSERT [dbo].[Request] ([Id], [UserName], [BookName]) VALUES (1004, N'фывфы', N'фывф')
INSERT [dbo].[Request] ([Id], [UserName], [BookName]) VALUES (1006, N'TEST', N'TEST')
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Role], [Login], [Password]) VALUES (5, N'Новикова А.П.', 4, N'biblio', N'biblio')
INSERT [dbo].[Users] ([Id], [Name], [Role], [Login], [Password]) VALUES (7, N'Кузнецов А.А.', 3, N'Stud', N'Stud')
INSERT [dbo].[Users] ([Id], [Name], [Role], [Login], [Password]) VALUES (8, N'Николаева Е.Н.', 2, N'teach', N'teach')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_IdRole1] FOREIGN KEY([Role])
REFERENCES [dbo].[IdRole] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_IdRole1]
GO
