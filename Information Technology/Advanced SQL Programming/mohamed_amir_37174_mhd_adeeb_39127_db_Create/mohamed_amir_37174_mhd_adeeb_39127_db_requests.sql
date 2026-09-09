/**   2.1.	еМлго Агфми хгАцзЦгА хмжФя гАьгАх "ЦЦоФм".   **/

select * from Attendance
where Attendance.StudentID = (select StudentID from Students where studentFName = 'mamdouh')

/**  2.2.	еМлго зАгЦгй Цгои "SQL".  **/

select Students.studentFName , Marks.MidTermMark , Marks.ActivityMark , Marks.ExamMark , Marks.Grade , Marks.Notes from Students , Marks
where Students.studentID = Marks.StudentID and Marks.CourseID = (Select Courses.CourseID from Courses where Courses.CourseName = 'SQL')


/**  2.3.	еМлго Агфми хьАгх ъА цсйгп. **/

select Teachers.TeacherFName , Teachers.TeacherLName , Students.studentFName  , Students.studentLName  from Teachers , Students
where Teachers.TeacherID = Students.teacherID
Order By TeacherFName ,TeacherLName , studentFName , studentLName


/**  2.4.	еМлго Дсх оФгЦ гАьАгх. **/


select Students.studentID , Students.studentFName , COUNT (Attendance.Attendance)*100/(select  COUNT (Attendance.Attendance) as AttendCount   from Attendance 
where  Attendance.StudentID=Students.studentID) as AttendCount   from Attendance , Students
where Attendance.Attendance='yes' and Attendance.StudentID=Students.studentID
Group By Students.studentID , Students.studentFName
 
 
 
 /**  2.5.	еМлго ежхгяи гАьгАх "ЦцЦФД".  **/
 
 
 select   Students.studentID , Students.studentFName , Students.studentLName , Teachers.TeacherFName , Teachers.TeacherLName ,  Courses.CourseName , Courses.CourseYear , Courses.CourseSemester , Marks.ActivityMark , Marks.ExamMark from Students , Teachers , Courses , Marks
where Students.studentFName = 'amir' and Teachers.TeacherID = Courses.teacherID  and Marks.CourseID = Courses.CourseID and Marks.StudentID = Students.studentID



/** 3.	ъйгхи гАЦДыгя гАпМ Муоя йчяМягП хлоФг гДтшгАМи гАчгзгй.  **/

USE [mohamed_amir_37174_mhd_adeeb_39127] 
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Rooms]
AS
SELECT     dbo.Lessons.RoomID, dbo.Lessons.LessonDate, dbo.Lessons.LessonTime, dbo.Lessons.LessonDuration, dbo.Teachers.TeacherFName, 
                      dbo.Teachers.TeacherLName, dbo.Courses.CourseName
FROM         dbo.Lessons INNER JOIN
                      dbo.Teachers ON dbo.Lessons.TeacherID = dbo.Teachers.TeacherID INNER JOIN
                      dbo.Courses ON dbo.Lessons.CourseID = dbo.Courses.CourseID
                      
                      
/**  4.1.	Агфми хгАьАгх гАягсхМД хкАгк ЦФго цФ цъкя.  **/

USE [mohamed_amir_37174_mhd_adeeb_39127] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Get_Failure_Students]
	

AS
BEGIN
		
	
	SELECT Students.studentID, Students.studentFName , COUNT(Marks.Grade) as #_courses_Failed
	FROM Students , Marks
	 
	Group By Students.studentFName , Students.studentID , Marks.StudentID ,Marks.Grade
	having Students.studentID = Marks.StudentID   and Marks.Grade='bad'  and COUNT(Marks.Grade)>=3
	RETURN
END


/**  4.2.	Агфми хгАЦФго гАйМ ййжЦД цзАЛ Дсх ясФх.  **/



USE [mohamed_amir_37174_mhd_adeeb_39127] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Get_Failure_Courses]
	@id int

AS
BEGIN
		
	
	select Courses.CourseID,Courses.CourseName , COUNT (Marks.Grade)*100/(select  COUNT (Marks.Grade) as a   from Marks
where  Courses.CourseID=Marks.CourseID) as a   from Courses , Marks
Group By Courses.CourseID ,  Courses.CourseName , Marks.Grade , Marks.CourseID
having Marks.Grade='bad' and Courses.CourseID=Marks.CourseID and COUNT (Marks.Grade)*100/(select  COUNT (Marks.Grade) as a   from Marks
where  Courses.CourseID=Marks.CourseID)>=@id

 
	RETURN
END


/**  5.	еДтга чгом зАЛ лоФА гАзАгЦгй АгМсЦм хеонгА зАгЦи АьгАх АЦ МогФЦ щМ йАъ гАЦгои.  **/


/**
АЦ Дзящ гАлФгх
**/

                      