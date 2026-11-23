-- TASK 1: Number payments from newest to oldest

select
    sender_handle,
    payment_id,
    paid_on,
    amount_inr,
    row_number() over (
        partition by sender_handle
        order by paid_on desc, payment_id desc
    ) as payment_no
from payments
order by sender_handle, payment_no;

-- TASK 2: Compare RANK and DENSE_RANK

select
payment_id,
sender_handle,
merchant_category,
amount_inr,
rank() over (
	partition by merchant_category
	order by amount_inr desc
) as payment_rank,
dense_rank() over (
	partition by merchant_category
	order by amount_inr desc
) as dense_payment_rank
from payments
order by merchant_category, amount_inr desc;

-- TASK 3: Find the latest payment of each sender

with latest_payments as (
select
	sender_handle,
	paid_on,
	amount_inr,
	row_number() over (
		partition by sender_handle
		order by paid_on desc, payment_id desc
	) as row_num
from payments
)
select
sender_handle,
paid_on,
amount_inr
from latest_payments
where row_num = 1;

-- TASK 4: Top 2 payment amounts in each category

with ranked_payments as (
select
	payment_id,
	sender_handle,
	merchant_category,
	amount_inr,
	dense_rank() over(
		partition by merchant_category
		order by amount_inr desc
	) as payment_rank
from payments
)
select
payment_id,
sender_handle,
merchant_category,
amount_inr,
payment_rank
from ranked_payments
where payment_rank <= 2
order by merchant_category, payment_rank;