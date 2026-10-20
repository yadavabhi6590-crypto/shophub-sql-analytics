-- Calculate Customer Lifetime Value (CLV) and categorize customers.
select * from customer

select * from order_items

select * from  orders


with customer_spending as (
	select 
    c.customer_unique_id ,
    count(distinct o.order_id)as total_orders,
    round(sum(oi.price),2)as clv_total_value
    from customer c
    join orders o
    on o.customer_id = c.customer_id
    join order_items oi
    on oi.order_id =o.order_id
    group by c.customer_unique_id
)

select 
customer_unique_id,
total_orders,
clv_total_value,
case 
	when clv_total_value >=1000 then 'high value'
    when clv_total_value between 300 and 999.9 then  'medium value'
    else 'low value'
end as customer_category 
from customer_spending
order by clv_total_value desc;
