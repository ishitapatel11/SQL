-- TASK 1: Create delivery_partners table
create table delivery_partners (
    partner_id int primary key,
    partner_name varchar(100),
    manager_id int
);

insert into delivery_partners values
(1, 'Riya Shah', NULL),
(2, 'Arjun Patel', NULL),
(3, 'Neel Mehta', 1),
(4, 'Kavya Desai', 1),
(5, 'Dev Joshi', 2),
(6, 'Mira Shah', 2),
(7, 'Aarav Mehta', 3),
(8, 'Isha Patel', 3);

-- SELF JOIN to display partner and manager names
select
p.partner_name,
m.partner_name as manager_name
from delivery_partners as p
left join delivery_partners as m
on p.manager_id = m.partner_id;

create table meal_types (
    meal_id int primary key,
    meal_name varchar(30)
);

insert into meal_types values
(1, 'Veg'),
(2, 'Jain'),
(3, 'Diet');

create table delivery_slots (
    slot_id int primary key,
    slot_name varchar(30)
);

insert into delivery_slots values
(1, 'Lunch'),
(2, 'Dinner');

-- CROSS JOIN to generate menu combinations
select
m.meal_name,
d.slot_name
from meal_types as m
cross join  delivery_slots as d;

-- TASK 3: Create customer_feedback table
create table customer_feedback (
    feedback_id int primary key,
    customer_id int,
    rating int
);

insert into customer_feedback values
(1, 1, 5),
(2, 2, 4),
(3, 3, 3),
(4, 4, 5),
(5, 5, 4),
(6, 6, 5),
(7, 99, 2),
(8, 100, 3);

-- Find customers without feedback
select
c.customer_id,
c.customer_name,
f.feedback_id,
f.rating
from customers as c
left join customer_feedback as f
on c.customer_id = f.customer_id
where f.feedback_id is null;

-- Find feedback without a matching customer
select
c.customer_id,
c.customer_name,
f.feedback_id,
f.rating
from customers as c
right join customer_feedback as f
on c.customer_id = f.customer_id
where c.customer_id is null;
