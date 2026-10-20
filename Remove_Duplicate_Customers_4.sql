-- Part A Question 4 Detect  and  Remove Duplicate Values


use tutedude_project 


select * from customers

select customer_unique_id,count(*) as duplicate_values
from customers
group by customer_unique_id
having count(*) >1;

-- Remove Duplicate
with duplicate_values as
(
select
	customer_id,
	customer_unique_id,
	row_number() over(
    Partition by customer_unique_id
    order by customer_id desc) as rn
from customers
)
delete from customers
where customer_id in (
select customer_id
from duplicate_values
where rn >1
);

set SQL_SAFE_UPDATEs=0;
