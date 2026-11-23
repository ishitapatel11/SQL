
CREATE DATABASE upi_payments_db;
USE upi_payments_db;

create table payments (
    payment_id int primary key,
    sender_handle varchar(100),
    merchant_category varchar(50),
    amount_inr decimal(10,2),
    paid_on date
);

insert into payments values
(1, 'asha@fictbank', 'Food', 250, '2026-10-01'),
(2, 'asha@fictbank', 'Shopping', 1200, '2026-10-03'),
(3, 'asha@fictbank', 'Travel', 450, '2026-10-05'),
(4, 'asha@fictbank', 'Bills', 1800, '2026-10-08'),
(5, 'rohan@fictbank', 'Food', 250, '2026-10-02'),
(6, 'rohan@fictbank', 'Shopping', 2200, '2026-10-04'),
(7, 'rohan@fictbank', 'Travel', 600, '2026-10-09'),
(8, 'rohan@fictbank', 'Bills', 950, '2026-10-12'),
(9, 'meera@fictbank', 'Food', 500, '2026-10-03'),
(10, 'meera@fictbank', 'Shopping', 750, '2026-10-06'),
(11, 'meera@fictbank', 'Travel', 1500, '2026-10-11'),
(12, 'meera@fictbank', 'Bills', 2100, '2026-10-15'),
(13, 'aarav@fictbank', 'Food', 180, '2026-10-04'),
(14, 'aarav@fictbank', 'Shopping', 3200, '2026-10-07'),
(15, 'aarav@fictbank', 'Travel', 850, '2026-10-13'),
(16, 'aarav@fictbank', 'Bills', 1200, '2026-10-18'),
(17, 'nisha@fictbank', 'Food', 700, '2026-10-05'),
(18, 'nisha@fictbank', 'Shopping', 1800, '2026-10-10'),
(19, 'nisha@fictbank', 'Travel', 4000, '2026-10-16'),
(20, 'nisha@fictbank', 'Bills', 650, '2026-10-20'),
(21, 'dev@fictbank', 'Food', 350, '2026-10-06'),
(22, 'dev@fictbank', 'Shopping', 950, '2026-10-12'),
(23, 'dev@fictbank', 'Travel', 1100, '2026-10-21'),
(24, 'dev@fictbank', 'Bills', 3000, '2026-10-25');

select * from payments;

-- TASK 2: Overall average payment

select
payment_id,
sender_handle,
merchant_category,
amount_inr,
round(avg(amount_inr) over (), 2) as overall_avg,
round(amount_inr - avg(amount_inr) over (), 2) as diff_from_avg
from payments;

-- TASK 3: Category-wise average, total and percentage share

select
    payment_id,
    sender_handle,
    merchant_category,
    amount_inr,
    round(avg(amount_inr) over (
        partition by merchant_category
    ), 2) as category_avg,
    sum(amount_inr) over (
        partition by merchant_category
    ) as category_total,
    round(
        (amount_inr / sum(amount_inr) over (
            partition by merchant_category
        )) * 100,
        2
    ) as category_share_pct
from payments;

-- TASK 4: Running total per sender

select
    sender_handle,
    paid_on,
    amount_inr,
    sum(amount_inr) over (
        partition by sender_handle
        order by paid_on, payment_id
    ) as running_total_inr
from payments
order by sender_handle, paid_on, payment_id;