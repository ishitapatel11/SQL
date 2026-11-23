
create table gym_activity (
    member_id int primary key,
    visits_last_30_days int,
    monthly_fee_inr int,
    foreign key (member_id) references members(member_id)
);

insert into gym_activity values
(1, 18, 2000),
(2, 12, 1500),
(3, 3, 2200),
(4, 20, 1800),
(5, 6, 1000),
(6, 25, 2500),
(7, 2, 1200),
(8, 9, 900),
(9, 16, 1900),
(10, 4, 1100),
(11, 14, 1600),
(12, 0, 800),
(13, 22, 2100),
(14, 7, 1400),
(15, 28, 2300);

select * from gym_activity;

-- TASK 2: Classify member engagement

select
member_id,
visits_last_30_days,
case
	when visits_last_30_days >= 16 then 'Regular'
	when visits_last_30_days >= 8 then 'Occasional'
	else 'Dormant'
end as engagement
from gym_activity;

-- TASK 3: Categorise monthly fees using CASE WHEN

select
case
	when monthly_fee_inr < 1200 then'Basic'
	when monthly_fee_inr between 1200 and 1799 then'Standard'
	when monthly_fee_inr >= 1800 then 'Premium'
end as fee_category,
count(*) as total_members,
sum(monthly_fee_inr) as total_fees_inr
from gym_activity
group by
case
	when monthly_fee_inr < 1200 then 'Basic'
	when monthly_fee_inr between 1200 and 1799 then 'Standard'
	when monthly_fee_inr >= 1800 then 'Premium'
end
order by fee_category;