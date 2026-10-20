-- Find top 10 products by revenue in each category.



with product_revenue as (
	select
		p.product_category_name,
		oi.product_id,
		round(sum(oi.price),2)as total_revenue
	from order_items oi
	join products p
		on p.product_id = oi.product_id
	group by p.product_category_name, oi.product_id
),
ranked_product as (
		select 
			product_category_name,
			product_id,
			total_revenue,
			dense_rank() over (
				partition by product_category_name 
                order by total_revenue desc
                ) as revenue_rank
	from product_revenue
)
select 
product_category_name,
product_id,
total_revenue,
revenue_rank
from ranked_product
where revenue_rank <=10
order by 
product_category_name,
revenue_rank;