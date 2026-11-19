#===========================Section B - Task_2===============================================

create table delivery_orders(
order_id int primary key,
restaurant_name varchar(100),
city varchar(100),
total_amount int,
order_status varchar(50),
order_date date);

insert into delivery_orders values
(1, 'Zero', 'Surat', 3000, 'Completed', '2026-11-01'),
(2, 'Zero', 'Surat', 3500, 'Completed', '2026-11-02'),
(3, 'Zero', 'Surat', 2500, 'Pending', '2026-11-03'),
(4, 'Zero', 'Surat', 2200, 'Completed', '2026-11-04'),
(5, 'Humus', 'Mumbai', 2200, 'Completed', '2026-11-01'),
(6, 'Humus', 'Mumbai', 1800, 'Pending', '2026-11-02'),
(7, 'Humus', 'Mumbai', 2500, 'Completed', '2026-11-03'),
(8, 'Humus', 'Mumbai', 2100, 'Completed', '2026-11-04'),
(9, 'Thyme & Wyisk', 'Ahmedabad', 1200, 'Completed', '2026-11-01'),
(10, 'Thyme & Wyisk', 'Ahmedabad', 1500, 'Pending', '2026-11-02'),
(11, 'Nomads', 'Surat', 1600, 'Completed', '2026-11-01'),
(12, 'Nomads', 'Surat', 1700, 'Pending', '2026-11-02');

select * from delivery_orders;

select
restaurant_name,sum(total_amount) as total_revenue,
count(order_id) as total_orders,
avg(total_amount) as average_order_value
from delivery_orders
group by restaurant_name;

select
restaurant_name,
sum(total_amount) as total_revenue,
count(order_id) as total_orders,
avg(total_amount) as average_order_value
from delivery_orders
group by restaurant_name
having sum(total_amount) > 5000;

select 
restaurant_name,
sum(total_amount) as total_revenue,
count(order_id) as total_orders,
avg(total_amount) as average_order_value,
case
when sum(total_amount) > 10000
then 'High Revenue'
else 'Moderate revenue'
end as revenue_category
from delivery_orders
group by restaurant_name
having sum(total_amount) > 5000;

insert into delivery_orders values
(13, 'Nomads', 'Surat', 1800, 'Completed', '2026-11-03');