-- Calculate running revenue totals and percentage contribution


with daily_revenue as (
select str_to_date(o.order_purchase_timestamp,'%Y-%m-%d') as order_date,
sum(oi.price) as daily_Rev
from orders o
join order_items oi on o.order_id =oi.order_id
where o.order_status='delivered'
and o.order_purchase_timestamp is not null
and o.order_purchase_timestamp !=''
group by str_to_date(o.order_purchase_timestamp,'%Y-%m-%d')
),
cumulative_calc as (
select order_date,
daily_rev,
sum(daily_rev) over(order by order_date rows unbounded preceding) as running_total_revenue,
sum(daily_rev) over() as total_revenue
from daily_revenue
)
select order_date,
round(daily_rev,2)as daily_revenue,
round(running_total_revenue,2) as running_total_revenue,
round(total_revenue,2) as grand_total_revenue,
round((running_total_revenue / total_revenue) * 100,4) as percentage_contribution
from cumulative_Calc
order by order_date asc;