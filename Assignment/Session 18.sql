
CREATE DATABASE society_energy_db;

USE society_energy_db;

create table meter_readings (
    reading_id int primary key,
    flat_no varchar(10),
    wing char(1),
    reading_date date,
    units_kwh int,
    rate_per_unit decimal(4,2)
);

insert into meter_readings values
-- WING A
(1, 'A-101', 'A', '2026-07-10', 180, 5.50),
(2, 'A-101', 'A', '2026-08-10', 210, 6.00),
(3, 'A-101', 'A', '2026-09-10', 195, 6.50),
(4, 'A-102', 'A', '2026-07-12', 250, 5.50),
(5, 'A-102', 'A', '2026-08-12', 280, 6.00),
(6, 'A-102', 'A', '2026-09-12', 260, 6.50),
(7, 'A-103', 'A', '2026-07-15', 120, 5.50),
(8, 'A-103', 'A', '2026-08-15', 150, 6.00),
(9, 'A-103', 'A', '2026-09-15', 140, 6.50),
(10, 'A-104', 'A', '2026-07-18', 320, 5.50),
(11, 'A-104', 'A', '2026-08-18', 350, 6.00),
(12, 'A-104', 'A', '2026-09-18', 330, 6.50),

-- WING B
(13, 'B-101', 'B', '2026-07-10', 200, 6.00),
(14, 'B-101', 'B', '2026-08-10', 230, 6.50),
(15, 'B-101', 'B', '2026-09-10', 220, 7.00),
(16, 'B-102', 'B', '2026-07-12', 300, 6.00),
(17, 'B-102', 'B', '2026-08-12', 330, 6.50),
(18, 'B-102', 'B', '2026-09-12', 310, 7.00),
(19, 'B-103', 'B', '2026-07-15', 150, 6.00),
(20, 'B-103', 'B', '2026-08-15', 170, 6.50),
(21, 'B-103', 'B', '2026-09-15', 160, 7.00),
(22, 'B-104', 'B', '2026-07-18', 400, 6.00),
(23, 'B-104', 'B', '2026-08-18', 430, 6.50),
(24, 'B-104', 'B', '2026-09-18', 410, 7.00),

-- WING C
(25, 'C-101', 'C', '2026-07-10', 100, 6.50),
(26, 'C-101', 'C', '2026-08-10', 130, 7.00),
(27, 'C-101', 'C', '2026-09-10', 110, 7.50),
(28, 'C-102', 'C', '2026-07-12', 220, 6.50),
(29, 'C-102', 'C', '2026-08-12', 240, 7.00),
(30, 'C-102', 'C', '2026-09-12', 230, 7.50),
(31, 'C-103', 'C', '2026-07-15', 350, 6.50),
(32, 'C-103', 'C', '2026-08-15', 380, 7.00),
(33, 'C-103', 'C', '2026-09-15', 360, 7.50),
(34, 'C-104', 'C', '2026-07-18', 450, 6.50),
(35, 'C-104', 'C', '2026-08-18', 420, 7.00),
(36, 'C-104', 'C', '2026-09-18', 440, 7.50);

select * from meter_readings;

-- Check total records
select count(*) as total_readings
from meter_readings;

-- TASK 2: Create monthly flat bill view

create or replace view v_monthly_flat_bill as
select
flat_no,
wing,
month(reading_date) as bill_month,
units_kwh,
round(units_kwh * rate_per_unit, 2) as bill_amount_inr
from meter_readings;

-- Display the view
select * from v_monthly_flat_bill;

-- TASK 3: Create a simple view for Wing A

create or replace view v_wing_a_readings as
select *
from meter_readings
where wing = 'A';

-- Display Wing A readings
select * from v_wing_a_readings;

-- Update units for flat A-101 in July
update v_wing_a_readings
set units_kwh = 190
where flat_no = 'A-101'
and reading_date = '2026-07-10';

-- Check updated view
select * from v_wing_a_readings;

-- Verify change in original table
select *
from meter_readings
where flat_no = 'A-101'
and reading_date = '2026-07-10';

-- TASK 4: Create wing summary dashboard view

create or replace view v_wing_summary as
select
    wing,
    sum(units_kwh) as total_units,
    round(avg(units_kwh * rate_per_unit), 2) as avg_bill_inr
from meter_readings
group by wing;

select * from v_wing_summary;

-- This UPDATE will fail because the view uses GROUP BY and aggregate functions
-- UPDATE v_wing_summary
-- SET total_units = 5000
-- WHERE wing = 'A';

-- The target table v_wing_summary of the UPDATE is not updatable.

SHOW FULL TABLES
WHERE Table_type = 'VIEW';