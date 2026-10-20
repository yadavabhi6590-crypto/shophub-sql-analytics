

with order_cutomer as (
select c.customer_unique_id,
o.order_id,
str_to_date(o.order_purchase_timestamp,'%Y-%m-%d')as order_date
from customer c
join orders o
on o.customer_id = c.customer_id
where o.order_purchase_timestamp is not null
and o.order_purchase_timestamp !=''

), lagged_customer_orders as (

select customer_unique_id ,
		order_id ,
        order_date,
        Lag(order_date,1) over(partition by customer_unique_id order by order_date asc
	) as Previous_order_Date
    from customer_orders    

)
select customer_unique_id,
order_id,
order_date,
previous_order_date,
datediff(order_date, previous_order_date)as days_sicne_last_order
from lagged_customer_orders
where previous_order_date is not null
order by customer_unique_id asc , order_Date asc ;
