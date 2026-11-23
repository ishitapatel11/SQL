
-- SESSION 3: WHERE CLAUSE AND OPERATORS

-- TASK 1

select
product_name,
category,
stock_qty
from products
where stock_qty < 20;

select
product_name,
category,
unit_price_inr
from products
where unit_price_inr >= 150;

-- TASK 2

-- Version 1: Using parentheses

select * from products
where (category = 'Snacks' or category = 'Oils')
and unit_price_inr <= 200;

-- Version 2: Without parentheses

select * from products
where category = 'Snacks'
or category = 'Oils'
and unit_price_inr <= 200;

-- TASK 3

-- Version 1: Using NOT

select * from sales
where not (
sale_date = '2026-10-02'
or quantity = 1
);

-- Version 2: Using <> operator

select * from sales
where sale_date <> '2026-10-02'
and quantity <> 1;
