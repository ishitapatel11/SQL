create database Food_delivery;
use Food_delivery;
create table customers (
    customer_id int primary key auto_increment,
    customer_name varchar(100),
    city varchar(50),
    total_spend decimal(10,2)
);

create table restaurants (
    restaurant_id int primary key auto_increment,
    restaurant_name varchar(100),
    city varchar(50)
);

create table delivery_agents (
    agent_id int primary key auto_increment,
    agent_name varchar(100),
    city varchar(50)
);

create table orders (
order_id int primary key auto_increment,
customer_id int,
restaurant_id int,
agent_id int,
order_date date,
order_amount decimal(10,2),
delivery_time_mins int,
foreign key (customer_id)
references customers(customer_id),
foreign key (restaurant_id)
references restaurants(restaurant_id),
foreign key (agent_id)
references delivery_agents(agent_id)
);


insert into customers values
(1,'Ishita', 'Surat', 12500.00),
(2,'Honey', 'Surat', 8500.00),
(3,'Sahil', 'Surat', 4200.00),
(4,'Sia', 'Surat', 1800.00),
(5,'Vedika', 'Ahmedabad', 15000.00),
(6,'Yash', 'Ahmedabad', 7200.00),
(7,'Dev', 'Ahmedabad', 3500.00),
(8,'Naitik', 'Vadodara', 11000.00),
(9,'Vrushank', 'Vadodara', 4800.00),
(10,'Krish', 'Vadodara', 1200.00);

insert into restaurants values
(1,'Spice Garden', 'Surat'),
(2,'Urban Tadka', 'Surat'),
(3,'Pizza Palace', 'Surat'),
(4,'The Food Hub', 'Surat'),
(5,'Royal Kitchen', 'Ahmedabad'),
(6,'Food Junction', 'Ahmedabad'),
(7,'Burger House', 'Ahmedabad'),
(8,'Taste of India', 'Vadodara'),
(9,'The Green Bowl', 'Vadodara'),
(10,'Cafe Delight', 'Vadodara');

insert into restaurants values
('Spice Garden', 'Surat'),
('Urban Tadka', 'Surat'),
('Pizza Palace', 'Surat'),
('The Food Hub', 'Surat'),
('Royal Kitchen', 'Ahmedabad'),
('Food Junction', 'Ahmedabad'),
('Burger House', 'Ahmedabad'),
('Taste of India', 'Vadodara'),
('The Green Bowl', 'Vadodara'),
('Cafe Delight', 'Vadodara');

insert into delivery_agents values
(1,'Rahul', 'Surat'),
(2,'Amit', 'Surat'),
(3,'Neha', 'Surat'),
(4,'Karan', 'Surat'),
(5,'Priya', 'Ahmedabad'),
(6,'Rohit', 'Ahmedabad'),
(7,'Sneha', 'Ahmedabad'),
(8,'Arjun', 'Vadodara'),
(9,'Meera', 'Vadodara'),
(10,'Vikas', 'Vadodara');

insert into orders values
-- Surat orders
(1,1, 1, 1, '2026-10-01', 1200, 25),
(2,2, 1, 2, '2026-10-02', 1800, 30),
(3,3, 1, 3, '2026-10-03', 950, 22),
(4,4, 1, 4, '2026-10-04', 1500, 28),

(5,1, 2, 2, '2026-10-05', 2200, 35),
(6,2, 2, 3, '2026-10-06', 1700, 32),
(7,3, 2, 1, '2026-10-07', 1300, 27),
(8,4, 2, 4, '2026-10-08', 1900, 40),

(9,1, 3, 3, '2026-10-09', 2500, 20),
(10,2, 3, 4, '2026-10-10', 2100, 24),
(11,3, 3, 2, '2026-10-11', 1600, 29),
(12,4, 3, 1, '2026-10-12', 2800, 26),

(13,1, 4, 4, '2026-10-13', 900, 38),
(14,2, 4, 1, '2026-10-14', 1100, 34),
(15,3, 4, 2, '2026-10-15', 1400, 31),
(16,4, 4, 3, '2026-10-16', 1000, 36),

-- Ahmedabad orders
(17,5, 5, 5, '2026-10-17', 3000, 25),
(18,6, 5, 6, '2026-10-18', 2500, 28),
(19,7, 5, 7, '2026-10-19', 1800, 32),
(20,5, 5, 5, '2026-10-20', 3500, 23),

(21,5, 6, 6, '2026-10-21', 1400, 35),
(22,6, 6, 7, '2026-10-22', 1600, 30),
(23,7, 6, 5, '2026-10-23', 1900, 33),
(24,5, 6, 6, '2026-10-24', 1200, 29),

(25,5, 7, 7, '2026-10-25', 2200, 20),
(26,6, 7, 5, '2026-10-26', 2800, 24),
(27,7, 7, 6, '2026-10-27', 2600, 22),
(28,5, 7, 7, '2026-10-28', 2400, 26),

-- Vadodara orders
(29,8, 8, 8, '2026-10-29', 1700, 30),
(30,9, 8, 9, '2026-10-30', 2100, 27),
(31,10, 8, 10, '2026-10-31', 1900, 32),
(32,8, 8, 8, '2026-11-01', 2300, 25),

(33,8, 9, 9, '2026-11-02', 1200, 38),
(34,9, 9, 10, '2026-11-03', 1500, 35),
(35,10, 9, 8, '2026-11-04', 1800, 33),
(36,8, 9, 9, '2026-11-05', 1400, 36),

(37,8, 10, 10, '2026-11-06', 2600, 22),
(38,9, 10, 8, '2026-11-07', 2900, 24),
(39,10, 10, 9, '2026-11-08', 2400, 21),
(40,8, 10, 10, '2026-11-09', 2700, 26);

select * from customers;
select * from restaurants;
select * from delivery_agents;
select * from orders;

alter table orders
add column order_status varchar(20) default 'Completed';

select * from orders;

update orders
set order_status = 'Pending'
where order_id in (5, 12, 20, 29, 35);

update orders
set order_status = 'Cancelled'
where order_id in (8, 18, 33, 40);

select order_id, order_status
from orders
where order_id in (5, 12, 20, 29, 35);

update orders
set order_status = 'Pending'
where order_id in (5, 12, 20, 29, 35);

select
order_status,
count(*) as total_orders
from orders
group by order_status;

select
r.restaurant_name,
r.city,
count(o.order_id) as total_orders,
sum(o.order_amount) as total_revenue,
avg(o.order_amount) as average_order_amount
from restaurants as r
join orders as o
on r.restaurant_id = o.restaurant_id
group by
r.restaurant_name,
r.city
having sum(order_amount) > 5000 and count(o.order_id) > 3
order by total_revenue  desc;

select
customer_id,
customer_name,
city,
total_spend,
case
when total_spend >= 10000 then 'Platinum'
when total_spend >= 5000 then 'Gold'
else 'Standard'
end as customer_category
from customers
order by total_spend DESC;

select
r.restaurant_name,
r.city,
sum(o.order_amount) as total_revenue,
dense_rank() over (
partition by r.city
order by sum(o.order_amount) desc
) as city_rank
from restaurants as r
join orders as o
on r.restaurant_id = o.restaurant_id
group by
r.restaurant_id,
r.restaurant_name,
r.city
order by
r.city,
city_rank;

create view vw_daily_order_summary as
select
o.order_date,
c.customer_name,
r.restaurant_name,
da.agent_name,
o.order_amount,
o.delivery_time_mins
from orders as o
join customers as c
on o.customer_id = c.customer_id
join restaurants as r
on o.restaurant_id = r.restaurant_id
join delivery_agents as da
on o.agent_id = da.agent_id;

insert into orders values
(41,8, 10, 10, '2026-11-13', 2600, 22),
(42,9, 10, 8, '2026-11-14', 2900, 24),
(43,10, 10, 9, '2026-11-15', 2400, 21),
(44,8, 10, 10, '2026-11-16', 2700, 26);

select * from vw_daily_order_summary
where order_date >= curdate()- INTERVAL 7 DAY
and order_date <= curdate()
order by order_date desc;
