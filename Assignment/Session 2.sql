
/*
Shop Name: Green Basket Kirana Store
File Purpose: Practice SELECT, FROM, column aliases and calculations
Date: 2026-11-20
*/

use kirana_store_db;


-- Business Question 1:
-- What are the product names, categories and prices?

select
product_name as Item,
category as Section,
unit_price_inr as `Price (Rs)`
from products;

-- Business Question 2:
-- What is the total stock value and price after a 5% price increase?

select
product_name,
unit_price_inr * stock_qty as stock_value_inr,
unit_price_inr * 1.05 as price_after_5pct_hike
from products;

-- Business Question 3:
-- What sales records are available in the store?

select * from sales;

#SELECT product_name FROM products;
