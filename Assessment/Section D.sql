insert into orders values
-- Ahmedabad
(6, 6, 5, '2026-11-21', 1800, 28, 'Completed'),
(7, 7, 6, '2026-11-21', 1200, 24, 'Pending'),
(5, 5, 6, '2026-11-21', 2000, 30, 'Cancelled'),
(6, 6, 7, '2026-11-21', 1400, 29, 'Completed'),
-- Surat
(1, 1, 1, '2026-11-21', 1200, 25, 'Completed'),
(2, 2, 2, '2026-11-21', 1500, 28, 'Completed'),
(3, 3, 3, '2026-11-21', 1800, 24, 'Pending'),
(1, 1, 4, '2026-11-21', 1100, 35, 'Cancelled'),
(2, 2, 1, '2026-11-21', 1600, 27, 'Completed'),
-- Vadodara
(8, 8, 8, '2026-11-21', 1700, 30, 'Completed'),
(9, 9, 9, '2026-11-21', 1900, 27, 'Completed'),
(10, 10, 10, '2026-11-21', 1600, 32, 'Pending'),
(8, 8, 8, '2026-11-21', 1800, 28, 'Cancelled'),
(9, 9, 9, '2026-11-21', 2100, 30, 'Completed');

-- Ai Generated --

WITH agent_stats AS (
    SELECT
        da.agent_id,
        da.agent_name,
        da.city,
        COUNT(o.order_id) AS completed_orders,
        AVG(o.delivery_time_mins) AS avg_delivery_time
    FROM delivery_agents AS da
    INNER JOIN orders AS o
        ON da.agent_id = o.agent_id
    WHERE o.order_status = 'Completed'
    GROUP BY
        da.agent_id,
        da.agent_name,
        da.city
    HAVING COUNT(o.order_id) > 5
),
ranked_agents AS (
    SELECT
        agent_id,
        agent_name,
        city,
        completed_orders,
        avg_delivery_time,
        RANK() OVER (
            PARTITION BY city
            ORDER BY completed_orders DESC
        ) AS agent_rank
    FROM agent_stats
)
SELECT
    agent_id,
    agent_name,
    city,
    completed_orders,
    avg_delivery_time,
    agent_rank
FROM ranked_agents
WHERE agent_rank <= 3
ORDER BY city ASC, agent_rank ASC;

---------------------------------------------------------------------------

with agent_stats as (
select
da.agent_id,
da.agent_name,
da.city,
count(o.order_id) as completed_orders,
round(avg(o.delivery_time_mins),2) as avg_delivery_time
from delivery_agents as da
inner join orders as o
on da.agent_id = o.agent_id
where o.order_status = 'Completed'
group by
da.agent_id,
da.agent_name,
da.city
having count(o.order_id) > 5
),
ranked_agents as (
select
agent_id,
agent_name,
city,
completed_orders,
avg_delivery_time,
row_number() over (
partition by city
order by completed_orders desc, agent_id asc
) as agent_rank
from agent_stats
)
select
agent_id,
agent_name,
city,
completed_orders,
avg_delivery_time,
agent_rank
from ranked_agents
where agent_rank <= 3
order by city asc, agent_rank asc;


