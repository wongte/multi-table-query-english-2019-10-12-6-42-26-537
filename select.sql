# 1.Query the existence of 1 course
select * from course where id = 1;
# 2.Query the presence of both 1 and 2 courses
select * from course where id = 1 or id = 2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select * from student.id, student.name, avg(student_course.score) from studnet
  join student_course on student.id = student_course.studentId
  group by student.id, student.name
  having avg(student_course.score) >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student.* from studnet
where not exists (
  select 1 from student_course where student_course.studentId = student.id
);
# 5.Query all SQL with grades
select student.*, student_course.*, course.*, teacher.*
from student 
join student_course on student.id=student_course.studentId
join course on student_course.courseId=course.id
join teacher on course.teacherId=teacher.id;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select student.* from student
join student_course on student.id = student_course.studentId
where student.id = 1 and student_course.id = 2;
# 7.Retrieve 1 student score with less than 60 scores in descending order
select student.* , student_course.courseId, student_course.score from student
join student_course on student.id = student_course.studentId
where student_course.score < 60 and student.id = '1'
order by student_course.score desc
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select course.id , course.name , avg(student_course.score)
from course
join student_course on course.id = student_course.courseId   
group by course.id , course.name
order by avg(student_course.score) desc, course.id asc
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name, score from student
join student_course on student_course.studentId = student.id 
join course on student_course.courseId = course.id 
where course.name = 'Math' and student_course.score < 60
