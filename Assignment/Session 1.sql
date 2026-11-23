-- SESSION 1: KIRANA STORE DATABASE ASSIGNMENT
-- 1. Drop existing database and create a fresh database

drop database if exists kirana_store_db;
create database kirana_store_db;
use kirana_store_db;

-- 2. Create products table

create table products (
    product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    unit_price_inr decimal(8,2),
    stock_qty int
);

-- 3. Insert 12 products

insert into products values
(1, 'Toor Dal 1kg', 'Pulses', 180.00, 15),
(2, 'Moong Dal 1kg', 'Pulses', 140.00, 25),
(3, 'Chana Dal 1kg', 'Pulses', 95.00, 12),
(4, 'Basmati Rice 1kg', 'Grains', 220.00, 18),
(5, 'Wheat Flour 5kg', 'Grains', 250.00, 30),
(6, 'Poha 1kg', 'Grains', 65.00, 10),
(7, 'Sunflower Oil 1L', 'Oils', 160.00, 14),
(8, 'Groundnut Oil 1L', 'Oils', 280.00, 8),
(9, 'Mustard Oil 1L', 'Oils', 130.00, 22),
(10, 'Potato Chips', 'Snacks', 20.00, 50),
(11, 'Namkeen 500g', 'Snacks', 75.00, 16),
(12, 'Premium Dry Fruit Mix', 'Snacks', 650.00, 9);

-- 4. Create sales table

create table sales (
    sale_id int auto_increment primary key,
    product_id int,
    quantity int,
    sale_date date,
    foreign key (product_id) references products(product_id)
);

-- 5. Insert 15 sales records

insert into sales values
(1, 2, '2026-10-01'),
(4, 1, '2026-10-01'),
(7, 3, '2026-10-01'),
(2, 5, '2026-10-02'),
(5, 2, '2026-10-02'),
(10, 8, '2026-10-02'),
(12, 1, '2026-10-02'),
(3, 4, '2026-10-03'),
(6, 3, '2026-10-03'),
(8, 2, '2026-10-03'),
(9, 6, '2026-10-04'),
(11, 5, '2026-10-04'),
(1, 3, '2026-10-04'),
(4, 2, '2026-10-05'),
(7, 4, '2026-10-05');

-- 6. Final verification

show tables;
describe products;
describe sales;
select * from products;
select * from sales;
