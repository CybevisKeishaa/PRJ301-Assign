USE [Assignment_SU24]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
	[avatar] [nvarchar](150) NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_students]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_students](
	[username] [varchar](150) NOT NULL,
	[sid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_user_students] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 29/07/2024 10:04:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_lecturers](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'WS1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'WS2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'PT1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'PT2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'Assignment', 0.4, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'Final Examination', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'Practical Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'WS1', 1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'WS1', 0.5, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'WS2', 0.5, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (11, N'WS1', 0.25, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (12, N'WS2', 0.25, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (13, N'WS3', 0.25, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (14, N'WS4', 0.25, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (15, N'PT1', 0.5, 5)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (16, N'PT2', 0.5, 5)
GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'PRJ_SU24', 2, 1, 2)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'JPD_SU24', 3, 2, 2)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'IOT_SU24', 4, 4, 2)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'PRF_SU24', 2, 5, 2)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (5, N'PRF_SP24', 2, 5, 1)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (6, N'IOT_SP24', 4, 4, 1)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (7, N'MAS_SU24', 1, 3, 2)
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-06-20T00:00:00.000' AS DateTime), 0.5, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-06-21T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-06-22T00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-06-23T00:00:00.000' AS DateTime), 1.5, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-06-24T00:00:00.000' AS DateTime), 1, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-06-25T00:00:00.000' AS DateTime), 2, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-06-26T00:00:00.000' AS DateTime), 1.5, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 2, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-07-01T00:00:00.000' AS DateTime), 1.5, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-07-02T00:00:00.000' AS DateTime), 1.5, 10)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-07-15T00:00:00.000' AS DateTime), 0.5, 11)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (12, CAST(N'2024-07-16T00:00:00.000' AS DateTime), 0.5, 12)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (13, CAST(N'2024-07-17T00:00:00.000' AS DateTime), 0.5, 13)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (14, CAST(N'2024-07-18T00:00:00.000' AS DateTime), 0.5, 14)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (15, CAST(N'2024-07-25T00:00:00.000' AS DateTime), 1.5, 15)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (16, CAST(N'2024-07-26T00:00:00.000' AS DateTime), 1, 16)
GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 3, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 4, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 7, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 3, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 4, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 7, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 3, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 4, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 7, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 3, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 4, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 7, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 3, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 4, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 7, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 3, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 4, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 7, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 1, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 2, 10)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 3, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 4, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 7, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 8, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 9, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 1, 9.8000001907348633)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 2, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 3, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 5, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 4, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 10, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 4, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 10, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 1, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 3, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 1, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 3, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 1, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 3, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 1, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 3, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 3, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 3, 3)
GO
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'Longdz')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'Sonnt')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (3, N'Anhnn')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (4, N'Duongmn')
GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2024, N'SUMMER', 1)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'SUMMER', 1)
GO
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (1, N'Phi Long', N'/img/philong.JPG')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (2, N'Son No Te', N'/img/sonnt.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (3, N'Dinh Khuong', N'/img/khuong.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (4, N'Khanh Duy', N'/img/duy.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (5, N'Duy Thai', N'/img/thai.JPG')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (6, N'Quang Truong', N'/img/truong.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (7, N'Anh Van', N'/img/van.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (8, N'Kieu Trang', N'/img/trang.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (9, N'Duc Manh', N'/img/manh.jpg')
INSERT [dbo].[students] ([sid], [sname], [avatar]) VALUES (10, N'Anh Tung', N'/img/tung.jpg')
GO
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (7, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (7, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (8, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (8, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (9, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (10, 7)
GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'JPD123')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'MAS291')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (4, N'IOT102')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (5, N'PRF192')
GO
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'duy', 4, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'khuong', 3, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'manh', 9, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'philong', 1, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'stson', 2, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'tung', 10, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'thai', 5, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'trang', 8, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'truong', 6, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'van', 7, 1)
GO
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'anhnn', N'1', N'Ngoc Anh')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'duongmn', N'1', N'Duong ma na')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'duy', N'2', N'Duy Ngu Dan')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'khuong', N'2', N'Khuong oc cho ')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'longdz', N'1', N'Keishaa')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'manh', N'2', N'Manh Lay Vo ')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'philong', N'2', N'Phi Long')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sonnt', N'1', N'Son No Te')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'stson', N'2', N'Student No Te')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'tung ', N'2', N'Tung Nhu Nhuoc')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'thai', N'2', N'Thai Co Bac')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'trang', N'2', N'Trang Hoc Gioi')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'truong', N'2', N'Truong Yeu Duoi')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'van', N'2', N'Van Tong Tai')
GO
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'anhnn', 3, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'duongmn', 4, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'longdz', 1, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonnt', 2, 1)
GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[user_students]  WITH CHECK ADD  CONSTRAINT [FK_user_students_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[user_students] CHECK CONSTRAINT [FK_user_students_students]
GO
ALTER TABLE [dbo].[user_students]  WITH CHECK ADD  CONSTRAINT [FK_user_students_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[user_students] CHECK CONSTRAINT [FK_user_students_users]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_users]
GO
