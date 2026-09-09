/**  ⁄·Ì„… ≈‰‘«¡ ﬁ«⁄œ… «·»Ì«‰«   **/

CREATE DATABASE [mohamed_amir_37174_mhd_adeeb_39127] ON  PRIMARY 
( NAME = N'mohamed_amir_37174_mhd_adeeb_39127', FILENAME = N'C:\ITD310\mohamed_amir_37174_mhd_adeeb_39127.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mohamed_amir_37174_mhd_adeeb_39127_log', FILENAME = N'C:\ITD310\mohamed_amir_37174_mhd_adeeb_39127_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)


/**   ⁄·Ì„… ≈‰‘«¡ «·Ãœ«Ê· **/
USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] NOT NULL,
	[TeacherFName] [nvarchar](10) NOT NULL,
	[TeacherLName] [nvarchar](10) NOT NULL,
	[TeacherAdress] [nvarchar](max) NOT NULL,
	[TeacherPhone] [nvarchar](50) NOT NULL,
	[TeacherMobile] [nvarchar](50) NOT NULL,
	[TeacherGender] [nvarchar](10) NOT NULL,
	[TeacherSocialSituation] [nvarchar](10) NOT NULL,
	[TeacherDiploma] [nvarchar](50) NOT NULL,
	[notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Students](
	[studentID] [int] NOT NULL,
	[studentFName] [nvarchar](10) NOT NULL,
	[studentLName] [nvarchar](10) NOT NULL,
	[studentFatherName] [nvarchar](10) NOT NULL,
	[studentMotherName] [nvarchar](10) NOT NULL,
	[studentAdress] [nvarchar](max) NOT NULL,
	[studentPhone] [nvarchar](50) NOT NULL,
	[studentMobile] [nvarchar](50) NOT NULL,
	[studentGender] [nvarchar](10) NOT NULL,
	[studentSocialSituation] [nvarchar](10) NOT NULL,
	[studentNationalID] [nvarchar](50) NOT NULL,
	[teacherID] [int] NOT NULL,
	[notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Teachers]
GO

USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] NOT NULL,
	[RoomCapacity] [int] NOT NULL,
	[RommPC] [nvarchar](50) NOT NULL,
	[RoomProjector] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Marks](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[MidTermMark] [int] NULL,
	[ActivityMark] [int] NOT NULL,
	[ExamMark] [int] NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO

ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Courses]
GO

ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([studentID])
GO

ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Students]
GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Lessons](
	[RoomID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[LessonDate] [date] NOT NULL,
	[LessonTime] [time](7) NOT NULL,
	[LessonDuration] [nvarchar](50) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO

ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO

ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO

ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Rooms]
GO

ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO

ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Teachers]
GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Exams](
	[ExamID] [int] NOT NULL,
	[ExamDate] [date] NOT NULL,
	[ExamTime] [time](7) NOT NULL,
	[ExamDuration] [time](7) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO

ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Courses]
GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExamRoom](
	[ExamID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExamRoom] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[RoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ExamRoom]  WITH CHECK ADD  CONSTRAINT [FK_ExamRoom_Exams] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ExamID])
GO

ALTER TABLE [dbo].[ExamRoom] CHECK CONSTRAINT [FK_ExamRoom_Exams]
GO

ALTER TABLE [dbo].[ExamRoom]  WITH CHECK ADD  CONSTRAINT [FK_ExamRoom_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO

ALTER TABLE [dbo].[ExamRoom] CHECK CONSTRAINT [FK_ExamRoom_Rooms]
GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Courses](
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseWeight] [nvarchar](50) NOT NULL,
	[CourseYear] [int] NOT NULL,
	[CourseSemester] [nvarchar](50) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AttendanceExam](
	[StudentID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[Attendance] [nvarchar](50) NOT NULL,
	[Mark] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AttendanceExam] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ExamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AttendanceExam]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceExam_Exams] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ExamID])
GO

ALTER TABLE [dbo].[AttendanceExam] CHECK CONSTRAINT [FK_AttendanceExam_Exams]
GO

ALTER TABLE [dbo].[AttendanceExam]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceExam_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([studentID])
GO

ALTER TABLE [dbo].[AttendanceExam] CHECK CONSTRAINT [FK_AttendanceExam_Students]
GO


USE [mohamed_amir_37174_mhd_adeeb_39127]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Attendance](
	[StudentID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[Attendance] [nvarchar](50) NOT NULL,
	[Evaluation] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[LessonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO

ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Lessons]
GO

ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([studentID])
GO

ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Students]
GO


/**  ⁄·Ì„«   ⁄»∆… «·Ãœ«Ê· **/

insert into Teachers 
values ('1','mahmood','almolki','damascus','564','53412','male','married','BIT','no' )

insert into Teachers 
values ('2','fatema','benchee','aleppo','5513219','0967962922','female','married','english','no' )

insert into Teachers 
values ('3','abdo','andraws','damascus','2365488','0912354782','male','married','Diploma','no' )

insert into Teachers 
values ('4','dalin','bakour','homs','1236548','0954125478','female','single','Computer Diploma','no' )


insert into Teachers 
values ('5','ali','baghdady','lattakia','2365897',' 0988552214','male','single','math','no' )


insert into Teachers 
values ('6','jehad','dahdouh','aleppo','2210235','0977425485','male','single','math','no' )

insert into Teachers 
values ('7','mota3','almalki','damascus','9965874','0933201010','male','married','BIT','no' )

insert into Teachers 
values ('8','tareq','alkaddah','aleppo','6985475','0922145874','male','single','english','no' )

insert into Teachers 
values ('9','rania','attar','damascus','3322310','0944521485','female','married','Computer Diploma','no' )

insert into Teachers 
values ('10','souha','affandy','homs','3256987','0965874521','female','single','Diploma','no' )



insert into Students 
values ('1','adeeb','bitar','mohamed','boushra','siefaldoula','5510666','0991538576','male','single','02010034484','1','no' )

insert into Students
values ('2','amir','dlewaty','jamal','amera','az3a','5501403','0933066006','femal','married','02040051616','2','no' )

insert into Students
values ('3','mamdouh','kadour','ismaeel','noor','aleppo','5574125','0933717577','male','single','02010054785','2','no' )

insert into Students
values ('4','najah','ali','jehad','douha','damascus','5214587','0965478512','female','single','02030152145','1','no' )


insert into Students
values ('5','mamoun','najar','mohamed','nahla','aleppo','5125698','0933214569','male','single','02010254785','3','no' )


insert into Students
values ('6','mysonn','mardini','abdhameed','safaa','aleppo','2232767','0933256800','female','married','02035698745','4','no' )

insert into Students
values ('7','bashar','kherallah','masoud','faten','homs','5510258','0965874500','male','single','05500102365','5','no' )

insert into Students
values ('8','jeseca','nassan','tom','marry','lattakia','3312547','0944521547','female','single','03314200258','6','no' )

insert into Students
values ('9','nessrin','hajjar','ahmad','farah','aleppo','3312458','0955807412','female','single','01002004578','7','no' )

insert into Students
values ('10','yousef','babazian','mechail','lora','homs','4752150','0944102010','male','married','10045207839','8','no' )


insert into Courses 
values ('1','BUS','hmg','2011','F10','1','no' )

insert into Courses 
values ('2','UNV','hb','2011','F10','2','no' )

insert into Courses 
values ('3','SQL','lkm','2011','F10','3','no' )

insert into Courses 
values ('4','database','s','2010','S10','4','no' )


insert into Courses 
values ('5','English','s','2010','s10','5','no' )


insert into Courses 
values ('6','Math','jkh','2010','s10','6','no' )

insert into Courses 
values ('7','network','j','2011','F10','7','no' )

insert into Courses 
values ('8','web',';l','2011','F11','8','no' )

insert into Courses 
values ('9','english','j','2010','s10','9','no' )

insert into Courses 
values ('10','advanced sql','k','2011','S11','10','no' )




insert into Marks
values ('1','1','50','80','100','very Good','no' )

insert into Marks
values ('1','2','50','75','90','very good','no' )

insert into Marks
values ('1','3','50','80','85','good','no' )

insert into Marks
values ('1','4','50','88','98','very good','no' )


insert into Marks
values ('1','5','50','73','89','very good','no' )


insert into Marks
values ('1','6','60','86','88','very good','no' )

insert into Marks
values ('1','7','60','79','93','very good','no' )

insert into Marks
values ('1','8','60','77','91','very good','no' )

insert into Marks
values ('1','9','60','84','88','very good','no' )

insert into Marks
values ('1','10','60','100','98','very good','no' )

insert into Marks
values ('2','1','50','70','75','good','no' )

insert into Marks
values ('2','2','50','69','75','good','no' )

insert into Marks
values ('2','3','50','71','79','good','no' )

insert into Marks
values ('2','4','50','85','89','very good','no' )


insert into Marks
values ('2','5','50','40','41','bad','no' )


insert into Marks
values ('2','6','60','20','0','bad','no' )

insert into Marks
values ('2','7','60','65','69','good','no' )

insert into Marks
values ('2','8','60','67','80','good','no' )

insert into Marks
values ('2','9','60','60','65','good','no' )

insert into Marks
values ('2','10','60','80','90','very good','no' )

insert into Marks
values ('3','1','50','65','69','good','no' )

insert into Marks
values ('3','2','50','80','87','very good','no' )

insert into Marks
values ('3','3','50','10','18','bad','no' )

insert into Marks
values ('3','4','50','49','49','bad','no' )


insert into Marks
values ('3','5','50','70','73','good','no' )


insert into Marks
values ('3','6','60','20','0','bad','no' )

insert into Marks
values ('3','7','60','65','69','good','no' )

insert into Marks
values ('3','8','60','67','80','good','no' )

insert into Marks
values ('3','9','60','60','65','good','no' )

insert into Marks
values ('3','10','60','80','90','very good','no' )

insert into Marks
values ('4','1','50','51','55','good','no' )

insert into Marks
values ('4','2','50','60','57','good','no' )

insert into Marks
values ('4','3','50','70','71','good','no' )

insert into Marks
values ('4','4','50','62','68','good','no' )


insert into Marks
values ('4','5','50','90','89','very good','no' )


insert into Marks
values ('4','6','60','64','70','good','no' )

insert into Marks
values ('4','7','60','60','64','good','no' )

insert into Marks
values ('4','8','60','50','58','bad','no' )

insert into Marks
values ('4','9','60','70','64','good','no' )

insert into Marks
values ('4','10','60','90','94','very good','no' )

insert into Marks
values ('5','1','50','80','100','very Good','no' )

insert into Marks
values ('5','2','50','75','90','very good','no' )

insert into Marks
values ('5','3','50','80','85','good','no' )

insert into Marks
values ('5','4','50','88','98','very good','no' )


insert into Marks
values ('5','5','50','73','89','very good','no' )


insert into Marks
values ('5','6','60','86','88','very good','no' )

insert into Marks
values ('5','7','60','79','93','very good','no' )

insert into Marks
values ('5','8','60','77','91','very good','no' )

insert into Marks
values ('5','9','60','84','88','very good','no' )

insert into Marks
values ('5','10','60','100','98','very good','no' )


insert into Marks
values ('6','1','50','70','75','good','no' )

insert into Marks
values ('6','2','50','69','75','good','no' )

insert into Marks
values ('6','3','50','71','79','good','no' )

insert into Marks
values ('6','4','50','85','89','very good','no' )


insert into Marks
values ('6','5','50','40','41','bad','no' )


insert into Marks
values ('6','6','60','20','0','bad','no' )

insert into Marks
values ('6','7','60','65','69','good','no' )

insert into Marks
values ('6','8','60','67','80','good','no' )

insert into Marks
values ('6','9','60','60','65','good','no' )

insert into Marks
values ('6','10','60','80','90','very good','no' )

insert into Marks
values ('7','1','50','51','55','good','no' )

insert into Marks
values ('7','2','50','60','57','good','no' )

insert into Marks
values ('7','3','50','70','71','good','no' )

insert into Marks
values ('7','4','50','62','68','good','no' )


insert into Marks
values ('7','5','50','90','89','very good','no' )


insert into Marks
values ('7','6','60','64','70','good','no' )

insert into Marks
values ('7','7','60','60','64','good','no' )

insert into Marks
values ('7','8','60','50','58','bad','no' )

insert into Marks
values ('7','9','60','70','64','good','no' )

insert into Marks
values ('7','10','60','90','94','very good','no' )

insert into Marks
values ('8','1','50','10','0','bad','no' )

insert into Marks
values ('8','2','50','45','40','bad','no' )

insert into Marks
values ('8','3','50','0','1','bad','no' )

insert into Marks
values ('8','4','50','51','55','good','no' )


insert into Marks
values ('8','5','50','24','38','bad','no' )


insert into Marks
values ('8','6','60','57','58','bad','no' )

insert into Marks
values ('8','7','60','10','49','bad','no' )

insert into Marks
values ('8','8','60','70','69','good','no' )

insert into Marks
values ('8','9','60','8','14','bad','no' )

insert into Marks
values ('8','10','60','57','49','bad','no' )

insert into Marks
values ('9','1','50','65','69','good','no' )

insert into Marks
values ('9','2','50','80','87','very good','no' )

insert into Marks
values ('9','3','50','10','18','bad','no' )

insert into Marks
values ('9','4','50','49','49','bad','no' )


insert into Marks
values ('9','5','50','70','73','good','no' )


insert into Marks
values ('9','6','60','20','0','bad','no' )

insert into Marks
values ('9','7','60','65','69','good','no' )

insert into Marks
values ('9','8','60','67','80','good','no' )

insert into Marks
values ('9','9','60','60','65','good','no' )

insert into Marks
values ('9','10','60','80','90','very good','no' )

insert into Marks
values ('10','1','50','51','55','good','no' )

insert into Marks
values ('10','2','50','60','57','good','no' )

insert into Marks
values ('10','3','50','70','71','good','no' )

insert into Marks
values ('10','4','50','62','68','good','no' )


insert into Marks
values ('10','5','50','90','89','very good','no' )


insert into Marks
values ('10','6','60','64','70','good','no' )

insert into Marks
values ('10','7','60','60','64','good','no' )

insert into Marks
values ('10','8','60','50','58','bad','no' )

insert into Marks
values ('10','9','60','70','64','good','no' )

insert into Marks
values ('10','10','60','90','94','very good','no' )



insert into Lessons
values ('1','1','11/04/2011','10:30','2Hours','1','1','no' )

insert into Lessons
values ('2','2','11/04/2011','10:00','1.5Hours','2','2','no' )

insert into Lessons
values ('3','3','12/04/2011','02:00','1.5Hours','8','3','no' )

insert into Lessons
values ('7','4','12/04/2011','02:00','1.5Hours','8','3','no' )


insert into Lessons
values ('8','5','01/01/2011','12:00','2Hours','10','5','no' )


insert into Lessons
values ('4','6','10/03/2011','11:00','1.5Hours','4','9','no' )

insert into Lessons
values ('5','7','08/08/2011','15:00','1.5Hours','7','7','no' )

insert into Lessons
values ('9','8','10/05/2011','17:00','1.5Hours','3','8','no' )

insert into Lessons
values ('7','9','02/06/2011','19:00','2Hours','9','4','no' )

insert into Lessons
values ('6','10','09/07/2011','20:00','1.5Hours','6','6','no' )

insert into Lessons
values ('4','11','09/05/2011','13:00','2Hours','5','10','no' )

insert into Lessons
values ('3','12','10/05/2011','15:00','1.5Hours','10','7','no' )

insert into Lessons
values ('7','13','10/05/2011','15:00','1.5Hours','7','8','no' )

insert into Lessons
values ('10','14','11/05/2011','11:00','1.5Hours','1','1','no' )

insert into Lessons
values ('1','15','11/10/2011','15:00','2Hours','4','6','no' )

insert into Lessons
values ('8','16','10/01/2011','17:00','1.5Hours','3','9','no' )

insert into Lessons
values ('2','17','04/30/2011','12:00','1.5Hours','9','2','no' )

insert into Lessons
values ('9','18','04/16/2011','14:00','1.5Hours','8','3','no' )

insert into Lessons
values ('4','19','04/16/2011','16:00','2Hours','5','7','no' )

insert into Lessons
values ('6','20','04/25/2011','18:00','1.5Hours','7','10','no' )

insert into Lessons
values ('10','21','04/17/2011','10:30','1.5Hours','10','1','no' )

insert into Lessons
values ('1','22','04/17/2011','12:00','2Hours','1','2','no' )

insert into Lessons
values ('5','23','04/18/2011','17:00','1.5Hours','8','3','no' )

insert into Lessons
values ('7','24','04/18/2011','18:30','2Hours','3','10','no' )

insert into Lessons
values ('9','25','04/18/2011','18:00','2Hours','2','5','no' )

insert into Lessons
values ('6','26','04/19/2011','15:00','2Hours','6','9','no' )

insert into Lessons
values ('2','27','04/19/2011','17:00','1.5Hours','8','7','no' )

insert into Lessons
values ('10','28','04/19/2011','19:00','1.5Hours','4','8','no' )

insert into Lessons
values ('1','29','04/20/2011','11:00','1.5Hours','1','4','no' )

insert into Lessons
values ('8','30','04/20/2011','11:30','2Hours','10','6','no' )



insert into Exams
values ('1','11/04/2011','10:30','02:00','1','no' )

insert into Exams
values ('2','11/06/2011','10:30','02:00','2','no' )

insert into Exams
values ('3','11/08/2011','10:30','02:00','3','no' )

insert into Exams
values ('4','11/11/2011','12:00','03:00','4','no' )


insert into Exams
values ('5','11/15/2011','13:30','02:30','5','no' )


insert into Exams
values ('6','11/17/2011','10:30','02:00','6','no' )

insert into Exams
values ('7','11/18/2011','15:00','02:00','7','no' )

insert into Exams
values ('8','11/19/2011','12:00','02:30','8','no' )

insert into Exams
values ('9','11/21/2011','11:00','02:00','9','no' )

insert into Exams
values ('10','11/25/2011','15:30','02:30','10','no' )

insert into Exams
values ('11','12/01/2011','10:30','02:00','1','no' )

insert into Exams
values ('12','12/04/2011','10:30','02:00','2','no' )

insert into Exams
values ('13','12/07/2011','10:30','02:00','3','no' )

insert into Exams
values ('14','12/09/2011','12:00','02:30','4','no' )

insert into Exams
values ('15','12/12/2011','12:00','03:00','5','no' )

insert into Exams
values ('16','12/15/2011','15:00','02:00','6','no' )

insert into Exams
values ('17','12/18/2011','10:30','02:00','7','no' )

insert into Exams
values ('18','12/21/2011','13:30','02:30','8','no' )

insert into Exams
values ('19','12/24/2011','17:30','02:00','9','no' )

insert into Exams
values ('20','12/29/2011','11:30','03:00','10','no' )

insert into Exams
values ('21','01/01/2012','10:30','02:00','1','no' )

insert into Exams
values ('22','01/05/2012','10:30','02:00','2','no' )

insert into Exams
values ('23','01/07/2012','10:30','02:00','3','no' )

insert into Exams
values ('24','01/10/2012','12:00','02:30','4','no' )

insert into Exams
values ('25','01/13/2012','13:30','02:30','5','no' )

insert into Exams
values ('26','01/16/2012','10:30','02:00','6','no' )

insert into Exams
values ('27','01/19/2012','15:00','02:30','7','no' )

insert into Exams
values ('28','01/22/2012','11:30','02:00','8','no' )

insert into Exams
values ('29','01/26/2012','17:00','02:30','9','no' )

insert into Exams
values ('30','01/30/2012','12:30','03:00','10','no' )



insert into ExamRoom
values ('1','1','10','no' )

insert into ExamRoom
values ('1','2','15','no' )

insert into ExamRoom
values ('1','3','10','no' )

insert into ExamRoom
values ('2','4','12','no' )


insert into ExamRoom
values ('2','5','9','no' )


insert into ExamRoom
values ('2','6','15','no' )

insert into ExamRoom
values ('3','7','4','no' )

insert into ExamRoom
values ('3','8','5','no' )

insert into ExamRoom
values ('3','9','2','no' )

insert into ExamRoom
values ('4','10','7','no' )

insert into ExamRoom
values ('4','1','10','no' )

insert into ExamRoom
values ('4','2' ,'6','no' )

insert into ExamRoom
values ('5','3' ,'10','no' )

insert into ExamRoom
values ('5','4' ,'7','no' )


insert into ExamRoom
values ('5','5' ,'3','no' )


insert into ExamRoom
values ('6','6','1','no' )

insert into ExamRoom
values ('6','7' ,'7','no' )

insert into ExamRoom
values ('6','8' ,'5','no' )

insert into ExamRoom
values ('7','9' ,'4','no' )

insert into ExamRoom
values ('7','10' ,'6','no' )

insert into ExamRoom
values ('7','1' ,'10','no' )

insert into ExamRoom
values ('8','2' ,'4','no' )

insert into ExamRoom
values ('8','3' ,'10','no' )

insert into ExamRoom
values ('8','4' ,'5','no' )


insert into ExamRoom
values ('9','5' ,'8','no' )


insert into ExamRoom
values ('9','6','0','no' )

insert into ExamRoom
values ('9','7' ,'10','no' )

insert into ExamRoom
values ('10','8' ,'8','no' )

insert into ExamRoom
values ('10','9' ,'4','no' )

insert into ExamRoom
values ('10','10' ,'6','no' )

insert into ExamRoom
values ('11','1' ,'3','no' )

insert into ExamRoom
values ('11','2' ,'4','no' )

insert into ExamRoom
values ('11','3' ,'2','no' )

insert into ExamRoom
values ('12','4' ,'7','no' )


insert into ExamRoom
values ('12','5' ,'5','no' )


insert into ExamRoom
values ('12','6' ,'9','no' )

insert into ExamRoom
values ('13','7' ,'12','no' )

insert into ExamRoom
values ('13','8' ,'4','no' )

insert into ExamRoom
values ('13','9' ,'3','no' )

insert into ExamRoom
values ('14','10' ,'7','no' )

insert into ExamRoom
values ('14','1' ,'10','no' )

insert into ExamRoom
values ('14','2' ,'6','no' )

insert into ExamRoom
values ('15','3' ,'8','no' )

insert into ExamRoom
values ('15','4' ,'9','no' )


insert into ExamRoom
values ('15','5' ,'9','no' )


insert into ExamRoom
values ('16','6' ,'4','no' )

insert into ExamRoom
values ('16','7' ,'3','no' )

insert into ExamRoom
values ('16','8' ,'9','no' )

insert into ExamRoom
values ('16','9' ,'6','no' )

insert into ExamRoom
values ('17','10' ,'10','no' )


insert into ExamRoom
values ('17','1' ,'5','no' )

insert into ExamRoom
values ('17','2' ,'7','no' )

insert into ExamRoom
values ('17','3' ,'9','no' )

insert into ExamRoom
values ('10','4' ,'8','no' )


insert into ExamRoom
values ('10','5' ,'1','no' )


insert into ExamRoom
values ('10','6','0','no' )

insert into ExamRoom
values ('19','7' ,'10','no' )

insert into ExamRoom
values ('19','8' ,'8','no' )

insert into ExamRoom
values ('19','9' ,'4','no' )

insert into ExamRoom
values ('20','10' ,'6','no' )

insert into ExamRoom
values ('20','1' ,'3','no' )

insert into ExamRoom
values ('20','2' ,'9','no' )

insert into ExamRoom
values ('21','3' ,'7','no' )

insert into ExamRoom
values ('21','4' ,'6','no' )


insert into ExamRoom
values ('21','5' ,'9','no' )


insert into ExamRoom
values ('22','6' ,'7','no' )

insert into ExamRoom
values ('22','7' ,'4','no' )

insert into ExamRoom
values ('22','8' ,'5','no' )

insert into ExamRoom
values ('23','9' ,'6','no' )

insert into ExamRoom
values ('23','10' ,'9','no' )

insert into ExamRoom
values ('23','1' ,'0','no' )

insert into ExamRoom
values ('24','2' ,'4','no' )

insert into ExamRoom
values ('24','3' ,'1','no' )

insert into ExamRoom
values ('24','4' ,'3','no' )


insert into ExamRoom
values ('25','5' ,'3','no' )


insert into ExamRoom
values ('25','6' ,'8','no' )

insert into ExamRoom
values ('25','7' ,'5','no' )

insert into ExamRoom
values ('26','8' ,'10','no' )

insert into ExamRoom
values ('26','9' ,'14','no' )

insert into ExamRoom
values ('26','10' ,'5','no' )

insert into ExamRoom
values ('27','1' ,'10','no' )

insert into ExamRoom
values ('27','2' ,'4','no' )

insert into ExamRoom
values ('27','3' ,'10','no' )

insert into ExamRoom
values ('28','4' ,'5','no' )


insert into ExamRoom
values ('28','5' ,'8','no' )


insert into ExamRoom
values ('28','6','0','no' )

insert into ExamRoom
values ('29','7' ,'10','no' )

insert into ExamRoom
values ('29','8' ,'8','no' )

insert into ExamRoom
values ('29','9' ,'4','no' )

insert into ExamRoom
values ('30','10' ,'6','no' )

insert into ExamRoom
values ('30','1' ,'3','no' )

insert into ExamRoom
values ('30','2' ,'5','no' )

insert into ExamRoom
values ('30','3' ,'7','no' )

insert into ExamRoom
values ('30','4' ,'8','no' )


insert into ExamRoom
values ('1','5' ,'8','no' )


insert into ExamRoom
values ('3','6' ,'7','no' )

insert into ExamRoom
values ('4','7' ,'4','no' )

insert into ExamRoom
values ('1','8' ,'5','no' )

insert into ExamRoom
values ('9','9' ,'6','no' )

insert into ExamRoom
values ('27','10' ,'4','no' )



insert into AttendanceExam
values ('1','1','yes','100','no' )

insert into AttendanceExam
values ('1','2','yes','90','no' )

insert into AttendanceExam
values ('1','3','yes','85','no' )

insert into AttendanceExam
values ('1','4','yes','98','no' )


insert into AttendanceExam
values ('1','5','yes','89','no' )


insert into AttendanceExam
values ('1','6','yes','88','no' )

insert into AttendanceExam
values ('1','7','yes','93','no' )

insert into AttendanceExam
values ('1','8','yes','91','no' )

insert into AttendanceExam
values ('1','9','yes','88','no' )

insert into AttendanceExam
values ('1','10','yes','98','no' )

insert into AttendanceExam
values ('2','1','yes','75','no' )

insert into AttendanceExam
values ('2','2','yes','75','no' )

insert into AttendanceExam
values ('2','3','yes','79','no' )

insert into AttendanceExam
values ('2','4','yes','89','no' )


insert into AttendanceExam
values ('2','5','yes','41','no' )


insert into AttendanceExam
values ('2','6','no','0','no' )

insert into AttendanceExam
values ('2','7','yes','69','no' )

insert into AttendanceExam
values ('2','8','yes','80','no' )

insert into AttendanceExam
values ('2','9','yes','65','no' )

insert into AttendanceExam
values ('2','10','yes','90','no' )

insert into AttendanceExam
values ('3','1','yes','69','no' )

insert into AttendanceExam
values ('3','2','yes','87','no' )

insert into AttendanceExam
values ('3','3','yes','18','no' )

insert into AttendanceExam
values ('3','4','yes','49','no' )


insert into AttendanceExam
values ('3','5','yes','73','no' )


insert into AttendanceExam
values ('3','6','no','0','no' )

insert into AttendanceExam
values ('3','7','yes','69','no' )

insert into AttendanceExam
values ('3','8','yes','80','no' )

insert into AttendanceExam
values ('3','9','yes','65','no' )

insert into AttendanceExam
values ('3','10','yes','90','no' )

insert into AttendanceExam
values ('4','1','yes','55','no' )

insert into AttendanceExam
values ('4','2','yes','57','no' )

insert into AttendanceExam
values ('4','3','yes','71','no' )

insert into AttendanceExam
values ('4','4','yes','68','no' )


insert into AttendanceExam
values ('4','5','yes','89','no' )


insert into AttendanceExam
values ('4','6','yes','70','no' )

insert into AttendanceExam
values ('4','7','yes','64','no' )

insert into AttendanceExam
values ('4','8','yes','58','no' )

insert into AttendanceExam
values ('4','9','yes','64','no' )

insert into AttendanceExam
values ('4','10','yes','94','no' )

insert into AttendanceExam
values ('5','1','yes','100','no' )

insert into AttendanceExam
values ('5','2','yes','90','no' )

insert into AttendanceExam
values ('5','3','yes','85','no' )

insert into AttendanceExam
values ('5','4','yes','98','no' )


insert into AttendanceExam
values ('5','5','yes','89','no' )


insert into AttendanceExam
values ('5','6','yes','88','no' )

insert into AttendanceExam
values ('5','7','yes','93','no' )

insert into AttendanceExam
values ('5','8','yes','91','no' )

insert into AttendanceExam
values ('5','9','yes','88','no' )

insert into AttendanceExam
values ('5','10','yes','98','no' )


insert into AttendanceExam
values ('6','1','yes','75','no' )

insert into AttendanceExam
values ('6','2','yes','75','no' )

insert into AttendanceExam
values ('6','3','yes','79','no' )

insert into AttendanceExam
values ('6','4','yes','89','no' )


insert into AttendanceExam
values ('6','5','yes','41','no' )


insert into AttendanceExam
values ('6','6','no','0','no' )

insert into AttendanceExam
values ('6','7','yes','69','no' )

insert into AttendanceExam
values ('6','8','yes','80','no' )

insert into AttendanceExam
values ('6','9','yes','65','no' )

insert into AttendanceExam
values ('6','10','yes','90','no' )

insert into AttendanceExam
values ('7','1','yes','55','no' )

insert into AttendanceExam
values ('7','2','yes','57','no' )

insert into AttendanceExam
values ('7','3','yes','71','no' )

insert into AttendanceExam
values ('7','4','yes','68','no' )


insert into AttendanceExam
values ('7','5','yes','89','no' )


insert into AttendanceExam
values ('7','6','yes','70','no' )

insert into AttendanceExam
values ('7','7','yes','64','no' )

insert into AttendanceExam
values ('7','8','yes','58','no' )

insert into AttendanceExam
values ('7','9','yes','64','no' )

insert into AttendanceExam
values ('7','10','yes','94','no' )

insert into AttendanceExam
values ('8','1','yes','0','no' )

insert into AttendanceExam
values ('8','2','yes','40','no' )

insert into AttendanceExam
values ('8','3','yes','1','no' )

insert into AttendanceExam
values ('8','4','yes','55','no' )


insert into AttendanceExam
values ('8','5','yes','38','no' )


insert into AttendanceExam
values ('8','6','yes','58','no' )

insert into AttendanceExam
values ('8','7','yes','49','no' )

insert into AttendanceExam
values ('8','8','yes','69','no' )

insert into AttendanceExam
values ('8','9','yes','14','no' )

insert into AttendanceExam
values ('8','10','yes','49','no' )

insert into AttendanceExam
values ('9','1','yes','69','no' )

insert into AttendanceExam
values ('9','2','yes','87','no' )

insert into AttendanceExam
values ('9','3','yes','18','no' )

insert into AttendanceExam
values ('9','4','yes','49','no' )


insert into AttendanceExam
values ('9','5','yes','73','no' )


insert into AttendanceExam
values ('9','6','no','0','no' )

insert into AttendanceExam
values ('9','7','yes','69','no' )

insert into AttendanceExam
values ('9','8','yes','80','no' )

insert into AttendanceExam
values ('9','9','yes','65','no' )

insert into AttendanceExam
values ('9','10','yes','90','no' )

insert into AttendanceExam
values ('10','1','yes','55','no' )

insert into AttendanceExam
values ('10','2','yes','57','no' )

insert into AttendanceExam
values ('10','3','yes','71','no' )

insert into AttendanceExam
values ('10','4','yes','68','no' )


insert into AttendanceExam
values ('10','5','yes','89','no' )


insert into AttendanceExam
values ('10','6','yes','70','no' )

insert into AttendanceExam
values ('10','7','yes','64','no' )

insert into AttendanceExam
values ('10','8','yes','58','no' )

insert into AttendanceExam
values ('10','9','yes','64','no' )

insert into AttendanceExam
values ('10','10','yes','94','no' )



insert into Attendance
values ('1','1','yes','good','no' )

insert into Attendance
values ('1','2','yes','good','no' )

insert into Attendance
values ('1','3','yes','good','no' )

insert into Attendance
values ('1','4','yes','good','no' )


insert into Attendance
values ('1','5','yes','good','no' )


insert into Attendance
values ('1','6','yes','good','no' )

insert into Attendance
values ('1','7','yes','good','no' )

insert into Attendance
values ('1','8','yes','good','no' )

insert into Attendance
values ('1','9','yes','good','no' )

insert into Attendance
values ('1','10','yes','good','no' )

insert into Attendance
values ('2','1','yes','good','no' )

insert into Attendance
values ('2','2','no','bad','no' )

insert into Attendance
values ('2','3','yes','good','no' )

insert into Attendance
values ('2','4','yes','good','no' )


insert into Attendance
values ('2','5','no','bad','no' )


insert into Attendance
values ('2','6','no','bad','no' )

insert into Attendance
values ('2','7','yes','good','no' )

insert into Attendance
values ('2','8','yes','good','no' )

insert into Attendance
values ('2','9','yes','good','no' )

insert into Attendance
values ('2','10','no','good','no' )

insert into Attendance
values ('3','11','yes','good','no' )

insert into Attendance
values ('3','12','yes','good','no' )

insert into Attendance
values ('3','13','no','bad','no' )

insert into Attendance
values ('3','14','yes','good','no' )


insert into Attendance
values ('3','15','yes','good','no' )


insert into Attendance
values ('3','16','yes','good','no' )

insert into Attendance
values ('3','17','no','bad','no' )

insert into Attendance
values ('3','18','yes','good','no' )

insert into Attendance
values ('3','19','yes','good','no' )

insert into Attendance
values ('3','20','no','bad','no' )

insert into Attendance
values ('4','11','yes','good','no' )

insert into Attendance
values ('4','12','yes','good','no' )

insert into Attendance
values ('4','13','yes','good','no' )

insert into Attendance
values ('4','14','yes','good','no' )


insert into Attendance
values ('4','15','yes','good','no' )


insert into Attendance
values ('4','16','yes','good','no' )

insert into Attendance
values ('4','17','no','bad','no' )

insert into Attendance
values ('4','18','no','bad','no' )

insert into Attendance
values ('4','19','no','bad','no' )

insert into Attendance
values ('4','20','no','bad','no' )

insert into Attendance
values ('5','21','yes','good','no' )

insert into Attendance
values ('5','22','no','bad','no' )

insert into Attendance
values ('5','23','no','bad','no' )

insert into Attendance
values ('5','24','no','bad','no' )


insert into Attendance
values ('5','25','no','bad','no' )


insert into Attendance
values ('5','26','no','bad','no' )

insert into Attendance
values ('5','27','no','bad','no' )

insert into Attendance
values ('5','28','no','bad','no' )

insert into Attendance
values ('5','29','no','bad','no' )

insert into Attendance
values ('5','30','no','bad','no' )


insert into Attendance
values ('6','21','yes','good','no' )

insert into Attendance
values ('6','22','yes','good','no' )

insert into Attendance
values ('6','23','no','bad','no' )

insert into Attendance
values ('6','24','yes','good','no' )


insert into Attendance
values ('6','25','no','bad','no' )


insert into Attendance
values ('6','26','yes','good','no' )

insert into Attendance
values ('6','27','yes','good','no' )

insert into Attendance
values ('6','28','yes','good','no' )

insert into Attendance
values ('6','29','yes','good','no' )

insert into Attendance
values ('6','30','no','bad','no' )

insert into Attendance
values ('7','1','yes','good','no' )

insert into Attendance
values ('7','2','yes','good','no' )

insert into Attendance
values ('7','3','yes','good','no' )

insert into Attendance
values ('7','4','no','bad','no' )


insert into Attendance
values ('7','5','yes','good','no' )


insert into Attendance
values ('7','6','yes','good','no' )

insert into Attendance
values ('7','7','yes','good','no' )

insert into Attendance
values ('7','8','yes','good','no' )

insert into Attendance
values ('7','9','no','bad','no' )

insert into Attendance
values ('7','10','no','bad','no' )

insert into Attendance
values ('8','1','yes','good','no' )

insert into Attendance
values ('8','2','no','bad','no' )

insert into Attendance
values ('8','3','yes','good','no' )

insert into Attendance
values ('8','4','yes','good','no' )


insert into Attendance
values ('8','5','no','bad','no' )


insert into Attendance
values ('8','6','no','bad','no' )

insert into Attendance
values ('8','7','yes','good','no' )

insert into Attendance
values ('8','8','yes','good','no' )

insert into Attendance
values ('8','9','yes','good','no' )

insert into Attendance
values ('8','10','no','good','no' )

insert into Attendance
values ('9','11','yes','good','no' )

insert into Attendance
values ('9','12','yes','good','no' )

insert into Attendance
values ('9','13','no','bad','no' )

insert into Attendance
values ('9','14','yes','good','no' )


insert into Attendance
values ('9','15','yes','good','no' )


insert into Attendance
values ('9','16','yes','good','no' )

insert into Attendance
values ('9','17','no','bad','no' )

insert into Attendance
values ('9','18','yes','good','no' )

insert into Attendance
values ('9','19','yes','good','no' )

insert into Attendance
values ('9','20','no','bad','no' )

insert into Attendance
values ('10','21','yes','good','no' )

insert into Attendance
values ('10','22','no','bad','no' )

insert into Attendance
values ('10','23','no','bad','no' )

insert into Attendance
values ('10','24','no','bad','no' )


insert into Attendance
values ('10','25','no','bad','no' )


insert into Attendance
values ('10','26','no','bad','no' )

insert into Attendance
values ('10','27','no','bad','no' )

insert into Attendance
values ('10','28','no','bad','no' )

insert into Attendance
values ('10','29','no','bad','no' )

insert into Attendance
values ('10','30','no','bad','no' )



insert into Rooms
values ('1','20','3','1','no' )

insert into Rooms
values ('2','50','10','1','no' )

insert into Rooms
values ('3','25','1','1','no' )

insert into Rooms
values ('4','20','10','0','no' )


insert into Rooms
values ('5','10','0','0','no' )


insert into Rooms
values ('6','20','1','1','no' )

insert into Rooms
values ('7','30','5','1','no' )

insert into Rooms
values ('8','25','10','2','no' )

insert into Rooms
values ('9','15','1','1','no' )

insert into Rooms
values ('10','10','0','1','no' )