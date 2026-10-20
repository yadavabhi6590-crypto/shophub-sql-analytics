
-- Calculate a 7-day moving average of daily order count.
select * from orders ;


with daily_order_count as (
select
STR_TO_DATE(order_purchase_timestamp,'%Y-%m-%d') as order_date,
count(order_id) as daily_orders
from orders
where order_purchase_timestamp is not null
and order_purchase_timestamp !=''
group by STR_TO_DATE(order_purchase_timestamp, '%Y-%m-%d')
)
select 
	order_date,
    daily_orders,
    round(
    avg(daily_orders) over(order by order_date
    rows between 6 PRECEDING and current row
    ),2
) as moving_avg_7day
from daily_order_count
order by order_date asc;