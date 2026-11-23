
-- SESSION 4: COACHING CLASS DATABASE SETUP

create database coaching_class_db;

use coaching_class_db;

-- TASK 1: CREATE TABLE

create table class_marks (
    mark_id int primary key,
    student_name varchar(100),
    batch varchar(20),
    subject varchar(30),
    marks_out_of_100 int,
    attendance_pct int,
    exam_date date
);


-- INSERT 30 RECORDS

insert into class_marks values
(1, 'Aisha', 'Morning', 'Maths', 85, 95, '2026-09-05'),
(2, 'Aisha', 'Morning', 'Science', 78, 95, '2026-09-12'),
(3, 'Aisha', 'Morning', 'English', 90, 95, '2026-09-20'),
(4, 'Aarav', 'Morning', 'Maths', 75, 88, '2026-09-03'),
(5, 'Aarav', 'Morning', 'Science', 82, 88, '2026-09-14'),
(6, 'Aarav', 'Morning', 'English', 70, 88, '2026-10-02'),
(7, 'Rohan', 'Morning', 'Maths', 62, 80, '2026-09-08'),
(8, 'Rohan', 'Morning', 'Science', 74, 80, '2026-09-18'),
(9, 'Rohan', 'Morning', 'English', 68, 80, '2026-10-05'),
(10, 'Meera', 'Morning', 'Maths', 55, 92, '2026-08-10'),
(11, 'Meera', 'Morning', 'Science', 65, 92, '2026-09-22'),
(12, 'Meera', 'Morning', 'English', 72, 92, '2026-10-10'),
(13, 'Anaya', 'Evening', 'Maths', 88, 90, '2026-09-04'),
(14, 'Anaya', 'Evening', 'Science', 72, 90, '2026-09-15'),
(15, 'Anaya', 'Evening', 'English', 80, 90, '2026-10-12'),
(16, 'Ashwin', 'Evening', 'Maths', 95, 85, '2026-08-18'),
(17, 'Ashwin', 'Evening', 'Science', 68, 85, '2026-09-25'),
(18, 'Ashwin', 'Evening', 'English', 77, 85, '2026-10-20'),
(19, 'Karan', 'Evening', 'Maths', 58, 75, '2026-08-25'),
(20, 'Karan', 'Evening', 'Science', 63, 75, '2026-09-09'),
(21, 'Karan', 'Evening', 'English', 70, 75, '2026-10-25'),
(22, 'Priya', 'Weekend', 'Maths', 79, 98, '2026-08-12'),
(23, 'Priya', 'Weekend', 'Science', 84, 98, '2026-09-11'),
(24, 'Priya', 'Weekend', 'English', 73, 98, '2026-10-15'),
(25, 'Nisha', 'Weekend', 'Maths', 67, 82, '2026-09-02'),
(26, 'Nisha', 'Weekend', 'Science', 76, 82, '2026-09-19'),
(27, 'Nisha', 'Weekend', 'English', 81, 82, '2026-10-28'),
(28, 'Dev', 'Weekend', 'Maths', 28, 55, '2026-08-05'),
(29, 'Dev', 'Weekend', 'Science', 45, 55, '2026-09-27'),
(30, 'Dev', 'Weekend', 'English', 60, 55, '2026-10-30');

SELECT * FROM class_marks;

-- TASK 2

-- Names starting with A or containing sh

select
student_name,
subject,
marks_out_of_100
from class_marks
where student_name like 'A%'
or student_name like '%sh%';


-- Names containing exactly five letters

select
student_name,
subject,
marks_out_of_100
from class_marks
where student_name like '_____';

-- TASK 3

-- Marks between 60 and 80 and exam dates in September

select
mark_id,
student_name,
marks_out_of_100,
exam_date
from class_marks
where marks_out_of_100 between 60 and 80
and exam_date between '2026-09-01' and '2026-09-30';

-- Expected row count: 10

-- TASK 4

-- Scholarship shortlist

select
mark_id,
student_name,
batch,
subject,
marks_out_of_100
from class_marks
where subject in ('Maths', 'Science')
and batch in ('Morning', 'Weekend')
and marks_out_of_100 >= 75;

