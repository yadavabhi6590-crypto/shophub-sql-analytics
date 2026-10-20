-- 15 Identify seasonal sales patterns by product category.

select * from products
select * from orders

select * from order_items


with category_monthly_sales as (
		select 
        p.product_category_name,
        month(o.order_approved_at) as sales_month_num,
        monthname(o.order_approved_at) as sales_month_name,
        count(distinct o.order_id) as total_orders,
        round(sum(oi.price),2) as monthly_revenue
        
        from orders o
        join order_items oi
        on o.order_id = oi.order_id
        join products p
        on p.product_id =oi.product_id
        
        group by p.product_category_name , month(o.order_approved_at) , monthname(o.order_approved_at) 
        ),
        ranked_seasnoal_patterns as (
				select 
                product_category_name,
                sales_month_num,
                sales_month_name,
                total_orders,
                monthly_revenue,
                rank() over(partition by product_category_name order by monthly_revenue desc
                ) as seasonal_peak_rank
                from category_monthly_sales
        )
select 
product_category_name,
sales_month_name,
total_orders,
monthly_revenue,
seasonal_peak_rank
from ranked_seasnoal_patterns
where seasonal_peak_rank <= 3
order by product_category_name , seasonal_peak_rank
        
     
        
        
        