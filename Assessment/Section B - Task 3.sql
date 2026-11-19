#===========================Section B - Task_3===============================================

create table customers(
customer_id int primary key,
Name varchar(100),
city varchar(100),
Phone varchar(50)
);

create table restaurants(
restaurant_id int primary key,
Name varchar(100),
cuisine_type varchar(100),
city varchar(100)
);

create table orders(
order_id int primary key,
customer_id int,
restaurant_id int,
amount int,
order_date date,
foreign key (customer_id) REFERENCES customers(customer_id),
foreign key (restaurant_id) REFERENCES restaurants(restaurant_id)
);

insert into customers values
(1, 'Ishita', 'Surat', '9876543210'),
(2, 'Honey', 'Mumbai', '9876543211'),
(3, 'Sahil', 'Ahmedabad', '9876543212'),
(4, 'Sia', 'Surat', '9876543213'),
(5, 'Vedika', 'Mumbai', '9876543214'),
(6, 'Dev', 'Ahmedabad', '9876543215');

insert into restaurants values
(101, 'Pizza Point', 'Italian', 'Surat'),
(102, 'Spice Hub', 'Indian', 'Mumbai'),
(103, 'Burger House', 'Fast Food', 'Ahmedabad'),
(104, 'Tasty Bites', 'Chinese', 'Surat'),
(105, 'Food Corner', 'Indian', 'Mumbai'),
(106, 'Pasta Palace', 'Italian', 'Ahmedabad');

insert into orders values
(1001, 1, 101, 500, '2026-11-01'),
(1002, 2, 102, 750, '2026-11-02'),
(1003, 3, 103, 400, '2026-11-03'),
(1004, 4, 104, 650, '2026-11-04'),
(1005, 1, 102, 800, '2026-11-05'),
(1006, 2, 101, 550, '2026-11-06');

select
o.order_id,
c.Name as customer_name,
r.Name as restaurant_name,
o.amount,
o.order_date
from orders as o
inner join customers as c
on o.customer_id = c.customer_id
inner join restaurants as r
on r.restaurant_id = o.restaurant_id;

select
c.customer_id,
c.Name as Customer_Name,
c.city,
o.order_id,
o.amount,
o.order_date
from customers as c
left join orders as o
on o.customer_id = c.customer_id;

select
o.order_id,
o.amount,
c.Name as Customer_Name,
c.city as customer_city,
r.Name as restaurant_name,
r.city as restaurant_city
from customers as c
inner join orders as o
on o.customer_id = c.customer_id
inner join restaurants as r
on o.restaurant_id = r.restaurant_id
where r.city = c.city;

