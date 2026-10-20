
select * from orders
select * from order_items
select * from products


select 
	ifnull(year(o.order_approved_at),"GRAND TOTAL") as sales_yeas,
	ifnull(month(o.order_approved_at),"ALL Months Subtotal") as Sales_month,
	IFNULL(p.product_category_name,"ALL Categories Subtotal") as Product_category,
	count(distinct o.order_id) as total_orders,
	round(sum(oi.price),2) as total_revenue
from orders o
join order_items oi on oi.order_id = o.order_id
join products p on oi.product_id = p.product_id
where o.order_approved_at is not null
   and p.product_category_name is not null
group by year (o.order_approved_at), month (o.order_approved_at), p.product_category_name with rollup;





with raw_summary as(
select 
	year (o.order_approved_at) as sales_year,
    month(o.order_approved_at) as sales_month,
    p.product_category_name as product_category,
    count(distinct o.order_id) as total_orders,
    round(sum(oi.price),2) as total_revenue
from orders o
join order_items oi on o.order_id = oi.order_id
join products p  on oi.product_id = p.product_id
where o.order_approved_at is not null and p.product_category_name is not null
group by year(o.order_approved_at) , month(o.order_approved_at),
p.product_category_name with rollup
)

select 
ifnull(cast(sales_year as char), "Grand Total") as sales_year,
ifnull(cast(sales_month as char),"All Months Subtotal") as sales_month,
ifnull(product_category,"All Categories Subtotal") as Product_category,
total_orders,
total_revenue
from raw_summary
    