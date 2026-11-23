
CREATE DATABASE tiffin_service_db;
USE tiffin_service_db;

create table customers (
    customer_id int primary key,
    customer_name varchar(100),
    area varchar(50),
    plan_type varchar(30)
);

insert into customers values
(1, 'Ishita', 'Adajan', 'Monthly'),
(2, 'Jin', 'Vesu', 'Weekly'),
(3, 'RM', 'Pal', 'Monthly'),
(4, 'Suga', 'Katargam', 'Weekly'),
(5, 'Jhope', 'Varachha', 'Monthly'),
(6, 'Jimin', 'City Light', 'Daily'),
(7, 'V', 'Althan', 'Monthly'),
(8, 'JK', 'Piplod', 'Weekly');

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    meal_type varchar(30),
    amount_inr decimal(8,2),
    foreign key (customer_id) references customers(customer_id)
);

insert into orders values
(1, 1, '2026-11-01', 'Lunch', 100),
(2, 1, '2026-11-02', 'Dinner', 120),
(3, 1, '2026-11-03', 'Lunch', 100),
(4, 1, '2026-11-04', 'Dinner', 150),
(5, 2, '2026-11-01', 'Lunch', 80),
(6, 2, '2026-11-02', 'Dinner', 100),
(7, 2, '2026-11-03', 'Lunch', 90),
(8, 2, '2026-11-04', 'Dinner', 120),
(9, 3, '2026-11-02', 'Lunch', 110),
(10, 3, '2026-11-04', 'Dinner', 140),
(11, 3, '2026-11-06', 'Lunch', 100),
(12, 4, '2026-11-01', 'Dinner', 130),
(13, 4, '2026-11-03', 'Lunch', 90),
(14, 4, '2026-11-05', 'Dinner', 150),
(15, 5, '2026-11-02', 'Lunch', 160),
(16, 5, '2026-11-04', 'Dinner', 180),
(17, 5, '2026-11-06', 'Lunch', 120),
(18, 6, '2026-11-03', 'Dinner', 70),
(19, 6, '2026-11-05', 'Lunch', 100),
(20, 6, '2026-11-07', 'Dinner', 80);

show tables;

select * from customers;

select * from orders;

-- TASK 2: INNER JOIN
select
c.customer_name,
c.area,
o.order_date,
o.meal_type,
o.amount_inr
from customers as c
inner join orders as o
on c.customer_id = o.customer_id;

-- TASK 3: Find customers who have never placed an order
select
c.customer_name,
c.area
from customers as c
left join orders as o
on c.customer_id = o.customer_id
where o.order_id is null;

-- TASK 4: Find customers who have never placed an order using RIGHT JOIN
select
c.customer_name,
c.area
from orders as o
right join customers as c
on o.customer_id = c.customer_id
where o.order_id is null;

