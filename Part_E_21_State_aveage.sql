-- Find customers spending above their state's average
select * from customer
select *from orders
select *from order_items

with customer_spending as (
select 
c.customer_unique_id,
c.customer_city,
c.customer_state,

round(sum(oi.price + oi.freight_value),2) as total_customer_spend
from customer c
join orders o
on o.customer_id =  c.customer_id
join order_items oi  on oi.order_id = o.order_id
where o.order_status ='delivered'
group by c.customer_unique_id , c.customer_city , c.customer_state
),
state_average_Spend as 
(
select 
customer_state,
round(avg(total_customer_spend),2) as avg_state_spend
from customer_spending
group by customer_state
)

select 
cs.customer_unique_id,
cs.customer_city,
cs.customer_state,
cs.total_customer_spend ,
sas.avg_state_spend,
cs.total_customer_spend - sas.avg_state_spend as spend_avb_avg
from customer_spending cs
join state_average_spend sas
on cs.customer_state =sas.customer_state
where cs.total_customer_spend > sas.avg_state_spend
order by cs.customer_state asc , cs.total_customer_spend desc



