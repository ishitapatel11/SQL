CREATE DATABASE two_wheeler_db;
USE two_wheeler_db;

create table listings (
listing_id int primary key,
brand varchar(50),
model varchar(50),
year int,
kms_driven int,
price_inr decimal(10,2),
city varchar(50)
);

insert into listings values
(1, 'Roadster', 'Sprint', 2018, 45000, 20000, 'Surat'),
(2, 'Roadster', 'Classic', 2018, 38000, 45000, 'Ahmedabad'),
(3, 'Voltix', 'Urban', 2020, 25000, 65000, 'Vadodara'),
(4, 'Voltix', 'Sport', 2022, 18000, 95000, 'Surat'),
(5, 'Motora', 'Cruise', 2019, 32000, 55000, 'Rajkot'),
(6, 'Motora', 'Street', 2021, 22000, 80000, 'Ahmedabad'),
(7, 'Zentro', 'Flash', 2023, 12000, 120000, 'Vadodara'),
(8, 'Zentro', 'Classic', 2020, 30000, 75000, 'Surat'),
(9, 'Roadster', 'Max', 2021, 20000, 85000, 'Rajkot'),
(10, 'Voltix', 'Eco', 2017, 50000, 35000, 'Ahmedabad'),
(11, 'Motora', 'Power', 2022, 15000, 110000, 'Surat'),
(12, 'Zentro', 'Ride', 2019, 40000, 50000, 'Rajkot'),
(13, 'Roadster', 'Tour', 2024, 8000, 140000, 'Vadodara'),
(14, 'Voltix', 'Classic', 2019, 35000, 60000, 'Rajkot'),
(15, 'Motora', 'Urban', 2016, 60000, 25000, 'Surat'),
(16, 'Zentro', 'Sport', 2022, 17000, 100000, 'Ahmedabad'),
(17, 'Roadster', 'Mini', 2020, 28000, 70000, 'Surat'),
(18, 'Voltix', 'Max', 2024, 10000, 150000, 'Vadodara'),
(19, 'Motora', 'Classic', 2023, 14000, 130000, 'Rajkot'),
(20, 'Zentro', 'Eco', 2017, 48000, 40000, 'Ahmedabad');

select * from listings;

-- TASK 2: Listings priced above average

select
listing_id,
brand,
model,
year,
price_inr,
price_inr - (select avg(price_inr) from listings) as gap_from_avg_inr
from listings
where price_inr > (select avg(price_inr) from listings);

-- TASK 3: Listings with the same brand and year as the cheapest listing

select
listing_id,
brand,
model,
year,
price_inr,
city
from listings
where (brand, year) = (
select brand, year
from listings
order by price_inr asc
  limit 1
);

-- TASK 4: Average price by brand

select
brand,
avg_price_inr
from (
select
	brand,
	round(avg(price_inr), 2) as avg_price_inr
    from listings
    group by brand
) as brand_summary
where avg_price_inr > (
    select avg(price_inr)
    from listings
);
