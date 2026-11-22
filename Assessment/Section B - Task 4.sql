#===========================Section B - Task_4===============================================
create table deliveries(
delivery_id int primary key,
agent_name varchar(50),
restaurant_name varchar(50),
delivery_time_mins int,
order_date date);

insert into deliveries values
(1, 'Jin', 'Pizza Hub', 25, '2026-01-01'),
(2, 'Jin', 'Burger Point', 30, '2026-01-02'),
(3, 'Jin', 'Food Corner', 28, '2026-01-03'),

(4, 'RM', 'Pizza Hub', 40, '2026-01-01'),
(5, 'RM', 'Burger Point', 45, '2026-01-02'),
(6, 'RM', 'Food Corner', 38, '2026-01-03'),

(7, 'Suga', 'Pizza Hub', 20, '2026-01-01'),
(8, 'Suga', 'Burger Point', 22, '2026-01-02'),
(9, 'Suga', 'Food Corner', 24, '2026-01-03'),

(10, 'Jhope', 'Pizza Hub', 35, '2026-01-01'),
(11, 'Jhope', 'Burger Point', 32, '2026-01-02'),
(12, 'Jhope', 'Food Corner', 37, '2026-01-03');

select * from deliveries;

with agent_stats as (
select
agent_name,
avg(delivery_time_mins) as avg_time
from deliveries
group by agent_name
)
SELECT
agent_name,
round(avg_time, 2) as avg_time,
rank() over (
order by avg_time asc
) as agent_rank,
case
when avg_time <= (
select avg(delivery_time_mins)
from deliveries
)
then 'On Track'
else 'Needs Improvement'
end as performance_status
from agent_stats
order by agent_rank;





