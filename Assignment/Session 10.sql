CREATE DATABASE fest_registrations_db;
USE fest_registrations_db;

create table online_registrations (
    reg_id int primary key,
    student_name varchar(100),
    college varchar(100),
    event_name varchar(100),
    fee_inr decimal(8,2),
    reg_date date
);

insert into online_registrations values 
(1, 'Aisha Shah', 'Sunrise Arts College', 'Music Night', 200, '2026-11-01'),
(2, 'Rohan Patel', 'Sunrise Arts College', 'Dance Battle', 300, '2026-11-02'),
(3, 'Meera Joshi', 'Greenfield Commerce College', 'Quiz Competition', 150, '2026-11-03'),
(4, 'Aarav Desai', 'Riverdale Science College', 'Coding Challenge', 400, '2026-11-04'),
(5, 'Kavya Mehta', 'Sunrise Arts College', 'Photography', 250, '2026-11-05'),
(6, 'Dev Trivedi', 'Greenfield Commerce College', 'Music Night', 200, '2026-11-06'),
(7, 'Neha Shah', 'Riverdale Science College', 'Dance Battle', 300, '2026-11-07'),
(8, 'Karan Joshi', 'Sunrise Arts College', 'Coding Challenge', 500, '2026-11-08'),
(9, 'Priya Patel', 'Greenfield Commerce College', 'Photography', 150, '2026-11-09'),
(10, 'Ishaan Mehta', 'Riverdale Science College', 'Quiz Competition', 350, '2026-11-10'),
(11, 'Nisha Desai', 'Sunrise Arts College', 'Drama', 100, '2026-11-11'),
(12, 'Arjun Shah', 'Greenfield Commerce College', 'Dance Battle', 450, '2026-11-12');

create table counter_registrations (
    reg_id int primary key,
    student_name varchar(100),
    college varchar(100),
    event_name varchar(100),
    fee_inr decimal(8,2),
    reg_date date
);

insert into counter_registrations values
(1, 'Aisha Shah', 'Sunrise Arts College', 'Music Night', 200, '2026-11-02'),
(2, 'Rohan Patel', 'Sunrise Arts College', 'Dance Battle', 300, '2026-11-03'),
(3, 'Meera Joshi', 'Greenfield Commerce College', 'Quiz Competition', 150, '2026-11-04'),
(4, 'Aarav Desai', 'Riverdale Science College', 'Coding Challenge', 400, '2026-11-05'),
(5, 'Rahul Patel', 'Greenfield Commerce College', 'Music Night', 200, '2026-11-06'),
(6, 'Sana Mehta', 'Sunrise Arts College', 'Photography', 250, '2026-11-07'),
(7, 'Yash Desai', 'Riverdale Science College', 'Drama', 350, '2026-11-08'),
(8, 'Tina Shah', 'Greenfield Commerce College', 'Dance Battle', 300, '2026-11-09'),
(9, 'Jay Joshi', 'Sunrise Arts College', 'Coding Challenge', 500, '2026-11-10'),
(10, 'Riya Patel', 'Riverdale Science College', 'Photography', 150, '2026-11-11'),
(11, 'Manav Shah', 'Greenfield Commerce College', 'Quiz Competition', 350, '2026-11-12'),
(12, 'Diya Mehta', 'Sunrise Arts College', 'Drama', 100, '2026-11-13');

select * from online_registrations;

select * from counter_registrations;

select
reg_id,
student_name,
college,
event_name,
fee_inr,
reg_date,
'Online' as source
from online_registrations
union all
select
reg_id,
student_name,
college,
event_name,
fee_inr,
reg_date,
'Counter' as source
from counter_registrations
order by reg_date;

-- TASK 3: Combine registrations and remove duplicates
-- Matching UNION ALL result contains 24 rows
select
student_name,
college,
event_name
from online_registrations
union
select
student_name,
college,
event_name
from counter_registrations;

-- TASK 4: Create workshop_registrations table
CREATE TABLE workshop_registrations (
    reg_id INT PRIMARY KEY,
    college VARCHAR(100),
    student_name VARCHAR(100),
    fee_inr DECIMAL(8,2),
    reg_date DATE,
    event_name VARCHAR(100)
);

insert into workshop_registrations values
(1, 'Sunrise Arts College', 'Kabir Shah', 200, '2026-11-14', 'Web Development'),
(2, 'Greenfield Commerce College', 'Pooja Patel', 300, '2026-11-15', 'Excel Workshop'),
(3, 'Riverdale Science College', 'Dhruv Mehta', 400, '2026-11-16', 'Python Workshop'),
(4, 'Sunrise Arts College', 'Simran Joshi', 150, '2026-11-17', 'Design Workshop'),
(5, 'Greenfield Commerce College', 'Harsh Desai', 250, '2026-11-18', 'Excel Workshop'),
(6, 'Riverdale Science College', 'Tara Shah', 500, '2026-11-19', 'Python Workshop');

select * from workshop_registrations;

select
reg_id,
student_name,
college,
event_name,
fee_inr,
reg_date,
'Online' as source
from online_registrations
union all
select
reg_id,
student_name,
college,
event_name,
fee_inr,
reg_date,
'Counter' as source
from counter_registrations
union all
select
reg_id,
student_name,
college,
event_name,
fee_inr,
reg_date,
'Workshop' as source
from workshop_registrations
order by reg_date; 