-- TASK 1: 
select
count(*) as total_papers,
sum(marks_out_of_100) as total_marks,
round(AVG(marks_out_of_100), 2) as avg_marks,
min(marks_out_of_100) as lowest_mark,
max(marks_out_of_100) as highest_mark
from class_marks;


-- TASK 2: 
select
min(attendance_pct) as lowest_attendance,
max(attendance_pct) as highest_attendance,
round(avg(attendance_pct), 1) as avg_attendance
from class_marks
where batch = 'Evening';

-- TASK 3: 

select
round(avg(marks_out_of_100 >= 75) * 100, 2) as distinction_pct
from class_marks;



