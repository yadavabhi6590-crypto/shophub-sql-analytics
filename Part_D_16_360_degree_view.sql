
 
 select 
	c.customer_unique_Id,
	c.customer_city,
	c.customer_state,
	count(distinct o.order_id) as total_order_placed,
	round(sum(oi.price),2) as total_lifetime_spend,
	round(avg(oi.price),2) as avg_order_itme_value,
	max(o.order_purchase_timestamp) as last_order_date
from customer c
left join orders o 
	on c.customer_id = o.customer_id
left join order_items oi
	on oi.order_id= o.order_id
group by 
	c.customer_unique_id,
    c.customer_city,
    c.customer_state
order by 
total_lifetime_spend desc;