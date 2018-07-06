USE [student]
GO
/****** Object:  Table [dbo].[tb_student]    Script Date: 2018/7/6 12:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[student_name] [varchar](30) NOT NULL,
	[student_num] [varchar](30) NOT NULL,
	[gender] [int] NULL,
	[enter_school_time] [varchar](30) NULL,
	[major] [varchar](30) NOT NULL,
	[email] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[aver_path] [varchar](30) NULL,
	[class_id] [int] NULL,
	[school_id] [int] NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_class]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [varchar](30) NOT NULL,
	[comment] [varchar](40) NOT NULL,
	[create_time] [varchar](30) NULL,
 CONSTRAINT [PK_tb_class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_school]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_school](
	[school_id] [int] IDENTITY(1,1) NOT NULL,
	[school_name] [varchar](40) NOT NULL,
	[address] [varchar](80) NOT NULL,
 CONSTRAINT [PK_tb_school] PRIMARY KEY CLUSTERED 
(
	[school_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_studentInfo]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_studentInfo]
AS
SELECT   s.Id, s.student_name, s.student_num, s.gender, s.enter_school_time, s.major, s.email, s.phone, s.aver_path, s.class_id, 
                s.school_id, c.comment, c.create_time, c.class_name, dbo.tb_school.school_name
FROM      dbo.tb_student AS s INNER JOIN
                dbo.tb_class AS c ON s.class_id = c.Id INNER JOIN
                dbo.tb_school ON s.school_id = dbo.tb_school.school_id
GO
/****** Object:  Table [dbo].[tb_role]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[num] [varchar](20) NULL,
	[password] [varchar](20) NOT NULL,
	[gender] [int] NULL,
	[role_id] [int] NULL,
	[create_time] [varchar](35) NULL,
	[last_login_time] [varchar](35) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_userInfo]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_userInfo] as select u.*,r.Id as roleId, r.role_name from tb_user u inner join tb_role r on u.role_id = r.Id
GO
/****** Object:  Table [dbo].[tb_grade]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_grade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[test] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tb_grade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_systemLog]    Script Date: 2018/7/6 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_systemLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [varchar](25) NULL,
	[operation_time] [varchar](30) NULL,
	[operation] [varchar](35) NULL,
 CONSTRAINT [PK_systemLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_class] ON 

INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (1, N'1501', N'优秀', N'')
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (3, N'1502', N'优秀', NULL)
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (4, N'1503', N'优秀', NULL)
SET IDENTITY_INSERT [dbo].[tb_class] OFF
SET IDENTITY_INSERT [dbo].[tb_grade] ON 

INSERT [dbo].[tb_grade] ([id], [test]) VALUES (1, N'3123')
INSERT [dbo].[tb_grade] ([id], [test]) VALUES (3123, N'3123')
SET IDENTITY_INSERT [dbo].[tb_grade] OFF
SET IDENTITY_INSERT [dbo].[tb_role] ON 

INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (1, N'普通用户')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (2, N'教学秘书')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (3, N'管理员')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (7, N'1121221213')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (8, N'21312')
SET IDENTITY_INSERT [dbo].[tb_role] OFF
SET IDENTITY_INSERT [dbo].[tb_school] ON 

INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (1, N'武汉大学211', N'武汉        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (2, N'华中科技大学', N'武汉        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (3, N'湖北师范', N'黄石        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (4, N'武汉理工2', N'武汉        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (5, N'2123', N'312312    ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (6, N'112', N'2121      ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (7, N'1122', N'12212     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (18, N'3123', N'123123    ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (21, N'21312', N'1232      ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (22, N'321312', N'3213123   ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (23, N'445', N'45445     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (24, N'445', N'45445     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (25, N'21329999', N'31233     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (26, N'7', N'7         ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (27, N'11211', N'1         ')
SET IDENTITY_INSERT [dbo].[tb_school] OFF
SET IDENTITY_INSERT [dbo].[tb_student] ON 

INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (2, N'sam', N'11', NULL, N'', N'MajorTest', N'1501', N'4545645654444', NULL, 1, 7)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (3, N'lisi', N'12', NULL, N'', N'MajorTest', N'', N'45666', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (4, N'张三', N'54645', NULL, N'2018-07-10', N'MajorTest', N'1502', N'', NULL, 1, 3)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (5, N'王二', N'14', NULL, NULL, N'MajorTest2', NULL, NULL, NULL, 1, 2)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (6, N'test', N'15', NULL, N'', N'554', N'5456', N'54', NULL, 2, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (7, N'test2', N'16', NULL, N'', N'454', N'6456', N'545', NULL, 2, 2)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (8, N'test3', N'17', NULL, N'', N'1213', N'1233', N'3123', NULL, 1502, 3)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (9, N'4563', N'465', NULL, N'', N'6456', N'', N'6456', NULL, NULL, 4)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (12, N'56546', N'5465654', NULL, N'2018-07-05 17:28:05', N'45645+6', N'', N'', NULL, 2, 2)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (14, N'4563', N'4565', NULL, N'2018-07-16 00:00:00', N'4564', N'', N'465', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (15, N'2123', N'2131', NULL, N'2018-07-09 04:00:00', N'31231', N'', N'3213', NULL, 4, 2)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (16, N'99', N'99', NULL, N'2018-07-09 00:00:00', N'445645', N'', N'', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[tb_student] OFF
SET IDENTITY_INSERT [dbo].[tb_systemLog] ON 

INSERT [dbo].[tb_systemLog] ([Id], [user_id], [user_name], [operation_time], [operation]) VALUES (1, 1, N'1', N'1', N'1')
SET IDENTITY_INSERT [dbo].[tb_systemLog] OFF
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1, N'test', NULL, N'11', NULL, 1, N'Fri Jun 15 20:56:44 CST 2018', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (2, N'admin', NULL, N'123456', NULL, 3, N'20180615 09:04:21', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (3, N'sam', NULL, N'123456', NULL, 1, N'2018-06-15 09:04:47', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (4, N'lisi', NULL, N'123456', NULL, 1, N'2018-06-15 09:31:13', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (6, N'46', NULL, N'6456', NULL, NULL, N'2018年07月 02:38:25', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (7, N'23', NULL, N'232', NULL, NULL, N'2018年07月 03:54:40', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (9, N'21321311', NULL, N'1212', NULL, NULL, N'2018年07月 04:11:56', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (10, N'888', NULL, N'87878', NULL, 1, N'2018年07月 04:13:21', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (11, N'3123', NULL, N'32131', NULL, 1, N'2018年07月 08:02:34', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (12, N'99999', NULL, N'645654', NULL, 2, N'2018年07月 08:59:59', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (13, N'213123', NULL, N'321312', NULL, 7, N'2018年07月 09:00:13', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (14, N'64564', NULL, N'45646', NULL, 1, N'2018年07月 09:02:01', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (15, N'213213111121', NULL, N'31231', NULL, 8, N'2018年07月 09:02:22', NULL)
SET IDENTITY_INSERT [dbo].[tb_user] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[28] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 127
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_school"
            Begin Extent = 
               Top = 6
               Left = 461
               Bottom = 127
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1770
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_studentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_studentInfo'
GO
