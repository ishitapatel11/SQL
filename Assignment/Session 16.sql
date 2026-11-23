
create table member_contacts (
    member_id int primary key,
    full_name varchar(100),
    member_code varchar(50)
);

insert into member_contacts values
(1, ' rEKHA patel ', ' gym-ahd-0007 '),
(2, 'aARAV shah', 'GYM_AHD_0008'),
(3, ' PRIYA desai', ' gym-srt-0009'),
(4, 'roHAN mehta ', 'GYM_SRT_0010 '),
(5, ' nEHA joshi ', 'gym-vad-0011'),
(6, 'KARAN trivedi', ' GYM_VAD_0012'),
(7, ' meERA shah', 'gym-raj-0013 '),
(8, 'DEV patel ', ' GYM_RAJ_0014'),
(9, ' aNAYA mehta ', 'gym_ahd_0015'),
(10, 'NISHA desai', ' GYM_SRT_0016 '),
(11, ' arJUN shah ', 'gym_vad_0017'),
(12, 'KAVYA joshi ', ' GYM_RAJ_0018');

select * from member_contacts;

-- TASK 2: Clean member names

select
member_id,
concat(
	upper(left(trim(full_name), 1)),
	lower(substr(trim(full_name), 2))
) as clean_name
from member_contacts;

-- TASK 3: Clean member codes

select
member_id,
upper(replace(trim(member_code), '_', '-')) as clean_code,
substr(
	upper(replace(trim(member_code), '_', '-')),
	5,
	3
) as branch_code,
right(
	upper(replace(trim(member_code), '_', '-')),
	4
) as serial_no
from member_contacts;

-- TASK 4: Final cleaned member contact report

WITH cleaned_contacts AS (
    SELECT
        member_id,
        CONCAT(
            UPPER(LEFT(TRIM(full_name), 1)),
            LOWER(SUBSTR(TRIM(full_name), 2))
        ) AS clean_name,
        UPPER(REPLACE(TRIM(member_code), '_', '-')) AS clean_code
    FROM member_contacts
)

select
member_id,
clean_name,
clean_code,
concat(
	clean_name,
	' (',
	SUBSTR(clean_code, 5, 3),
	')'
) as label
from cleaned_contacts;