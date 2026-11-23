-- TASK 1:
select
batch,
count(*) as papers,
round(AVG(marks_out_of_100), 1) as avg_marks,
max(marks_out_of_100) as best_mark
from class_marks
group by batch
order by avg_marks desc;

-- TASK 2: without HAVING
select
subject,
batch,
count(*) as papers,
round(avg(marks_out_of_100), 1) as avg_marks
from class_marks
group by subject, batch;

-- HAVING conditions
select
subject,
batch,
count(*) as papers,
round(avg(marks_out_of_100), 1) as avg_marks
from class_marks
group by subject, batch
having avg(marks_out_of_100) >= 60
and COUNT(*) >= 3;

-- TASK 3: 
select
batch,
count(*) AS papers,
round(avg(attendance_pct), 1) as avg_attendance
from class_marks
where exam_date >= '2026-09-01'
group by batch
having avg(attendance_pct) > 70;

-- TASK 4: 
select
student_name,
count(*) as papers,
round(AVG(marks_out_of_100), 1) as avg_marks,
max(marks_out_of_100) as best_mark
from class_marks
group by student_name
having avg(marks_out_of_100) >= 70
order by avg_marks desc
limit 5;