

with customer_monthly_orders as 
(
	select distinct c.customer_unique_id,
    date_format(STR_TO_DATE(o.order_purchase_timestamp, '%Y-%m-%d'), '%Y-%m') as order_month
    
    from customer c
    join orders o on c.customer_id =o.customer_id
    where o.order_status ='delivered'
    and o.order_purchase_timestamp is not null
    and o.order_purchase_timestamp !=''
),
lagged_orders as (
select 
	customer_unique_id,
    order_month,
    lag(order_month,1)over(partition by customer_unique_id order by order_month) as prev_month_1,
	lag(order_month,2)over(partition by customer_unique_id order by order_month) as prev_month_2
    from customer_monthly_orders
)
select distinct customer_unique_id
from lagged_orders
where PERIOD_DIFF(Date_format(concat(order_month,'-01'),'%Y%m'), DATE_FORMAT(concat(prev_month_1,'-01'),'%Y%m'))=1
and PERIOD_DIFF(Date_format(concat(prev_month_1,'-01'),'%Y%m'), DATE_FORMAT(concat(prev_month_2,'-01'),'%Y%m'))=1;