
-- SESSION 5: DISTINCT, ORDER BY AND LIMIT

-- TASK 1

-- Unique student names

select distinct student_name
from class_marks;

-- Unique batch and subject combinations

select distinct
batch,
subject
from class_marks;

-- TASK 2

-- Full leaderboard sorted by highest marks

select
student_name,
subject,
marks_out_of_100
from class_marks
order by
marks_out_of_100 desc,
student_name asc;

-- TASK 3

-- Top 5 Maths papers

select
student_name,
subject,
marks_out_of_100
from class_marks
where subject = 'Maths'
order by marks_out_of_100 desc
limit 5;

-- TASK 4

-- Page 2 of the leaderboard (rows 6 to 10)

select
student_name,
subject,
marks_out_of_100
from class_marks
order by
marks_out_of_100 desc,
student_name asc
limit 5 offset 5;

-- Three lowest attendance papers

select
student_name,
subject,
attendance_pct
from class_marks
order by attendance_pct asc
limit 3;
