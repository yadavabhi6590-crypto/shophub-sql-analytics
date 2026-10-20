
select * from products
select * from order_items
use shophub_db

-- Get the 2nd highest revenue-generating product in each category.

with product_revenue as (
	select  p.product_category_name,
			p.product_id,
            round(sum(oi.price)) as total_revenue,
            count(oi.order_item_id) as  total_units_sold
            from products p
            join order_items oi 
            on oi.product_id =p.product_id
            where p.product_category_name is not null
            group by p.product_category_name , p.product_id

),ranking_products as (
	select product_category_name,
		product_id,
        total_revenue,
        total_units_sold,
        dense_rank() over(partition by product_category_name order by total_revenue desc
        ) as revenue_rank
	 from product_revenue
     )
     select product_category_name,
     product_id,
     total_revenue,
     total_units_sold
     from ranking_products
     where revenue_rank = 2 
     order by product_category_name asc