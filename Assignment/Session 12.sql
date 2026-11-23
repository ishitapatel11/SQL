
create table tabyearly_resales (
    sale_year int,
    brand varchar(50),
    units_sold int
);

insert into yearly_resales values
(2019, 'Voltix', 120),
(2019, 'Roadster', 90),
(2019, 'Motora', 75),
(2020, 'Voltix', 150),
(2020, 'Roadster', 110),
(2020, 'Motora', 95),
(2021, 'Voltix', 180),
(2021, 'Roadster', 130),
(2021, 'Motora', 105),
(2022, 'Voltix', 220),
(2022, 'Roadster', 160),
(2022, 'Motora', 125),
(2023, 'Voltix', 260),
(2023, 'Roadster', 190),
(2023, 'Motora', 150),
(2024, 'Voltix', 300),
(2024, 'Roadster', 230),
(2024, 'Motora', 180),
(2025, 'Voltix', 350),
(2025, 'Roadster', 270),
(2025, 'Motora', 210);

select * from yearly_resales;

with yearly_totals as (
    select
	sale_year,
	sum(units_sold) as total_units
    from yearly_resales
    group by sale_year
)
select
sale_year,
total_units
from yearly_totals
order by sale_year;

-- TASK 2: Calculate Year-over-Year growth

with yearly_totals as (
    select
        sale_year,
        sum(units_sold) as total_units
    from yearly_resales
    group by sale_year
)
select
    cur.sale_year,
    cur.total_units as current_year_units,
    prev.total_units as previous_year_units,
    round(
        ((cur.total_units - prev.total_units) / prev.total_units) * 100,
        1
    ) as yoy_growth_pct
from yearly_totals as cur
join yearly_totals as prev
    on cur.sale_year = prev.sale_year + 1
order by cur.sale_year;

-- TASK 3: Find the top-selling brand and its percentage share

with brand_totals as (
    select
        brand,
        sum(units_sold) as total_units
    from yearly_resales
    group by brand
),
top_brand as (
    select
        brand,
        total_units
    from brand_totals
    order by total_units desc
    limit 1
)
select
    tb.brand as top_brand,
    tb.total_units as brand_units,
    round(
        (tb.total_units / (select sum(units_sold) from yearly_resales)) * 100,
        1
    ) as share_pct
from top_brand as tb;

-- TASK 4: Recursive CTE for bike depreciation

with recursive depreciation as (
    select
        0 AS age_years,
        cast(80000 as decimal(10,2)) as value_inr
    union all
    select
        age_years + 1,
        cast(value_inr * 0.88 as decimal(10,2))
    from depreciation
    where age_years < 6
)
select
    age_years,
    value_inr
from depreciation
order by age_years;