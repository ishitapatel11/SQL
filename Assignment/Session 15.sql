
CREATE DATABASE gym_membership_db;
USE gym_membership_db;

create table members (
    member_id int primary key,
    member_name varchar(100),
    joined_on date,
    plan_months int,
    last_visit date
);

insert into members values
(1, 'Aarav Shah', '2026-06-05', 6, '2026-11-10'),
(2, 'Priya Patel', '2026-09-10', 3, '2026-11-12'),
(3, 'Rohan Mehta', '2025-12-20', 12, '2026-10-25'),
(4, 'Neha Desai', '2026-06-25', 6, '2026-11-08'),
(5, 'Karan Joshi', '2026-10-01', 3, '2026-11-05'),
(6, 'Anaya Shah', '2026-10-15', 1, '2026-11-14'),
(7, 'Meera Trivedi', '2026-05-10', 6, '2026-10-20'),
(8, 'Dev Patel', '2026-08-01', 3, '2026-09-15'),
(9, 'Ishaan Mehta', '2026-07-15', 6, '2026-11-01'),
(10, 'Nisha Desai', '2025-11-05', 12, '2026-10-12'),
(11, 'Arjun Shah', '2026-09-25', 1, '2026-10-10'),
(12, 'Kavya Joshi', '2026-04-20', 6, '2026-09-20'),
(13, 'Rahul Patel', '2026-01-12', 12, '2026-11-15'),
(14, 'Tina Mehta', '2025-06-01', 12, '2026-09-05'),
(15, 'Yash Desai', '2026-10-31', 1, '2026-11-13');

select * from members;

-- TASK 2: Extract date parts

select
member_name,
year(joined_on) as join_year,
month(joined_on) as join_month,
day(joined_on) as join_day,
now()as checked_at,
date(now()) as today_only
from members;

-- TASK 3: Calculate expiry and reminder dates

select
member_name,
joined_on,
plan_months,
date_add(joined_on, interval plan_months month) as expiry_date,
date_sub(
	date_add(joined_on, interval plan_months month),
	interval 7 DAY
) as reminder_date
from members;

-- TASK 4: Find memberships expiring within 30 days

select
member_name,
date_add(joined_on, interval plan_months month) as expiry_date,
datediff(
	date_add(joined_on, interval plan_months month),
	'2026-11-30'
) as days_left
from members
where DATE_ADD(joined_on, interval plan_months month)
between '2026-12-01' and '2026-12-30'
order by expiry_date;