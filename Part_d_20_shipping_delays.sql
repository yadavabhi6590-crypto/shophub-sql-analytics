

select 
c.customer_id,
c.Customer_city,
c.Customer_state,
str_to_date(o.order_purchase_timestamp,'%Y-%m-%d')as purchase_date_product,
str_to_date(o.order_delivered_customer_date,'%Y-%m-%d')as order_reach_date,
str_to_date(o.order_estimated_delivery_date,'%Y-%m-%d')as estimated_date_of_reach,

datediff(
	STR_TO_Date(o.order_delivered_customer_date,'%Y-%m-%d'),
    STR_TO_DATE(o.order_estimated_Delivery_date,'%Y-%m-%d')
) as delay_in_days

from orders o
join customer c  on c.customer_id =o.customer_id
where o.order_status ="delivered"
	and o.order_delivered_customer_date is not null
    and o.order_delivered_customer_date !=''
    and o.order_estimated_delivery_date is not null
    and  o.order_estimated_delivery_date !=''
    and str_to_date(o.order_delivered_customer_date,'%Y-%m-%d') >
    str_to_date(o.order_estimated_delivery_date,'%Y-%m-%d')
    order by delay_in_days desc

