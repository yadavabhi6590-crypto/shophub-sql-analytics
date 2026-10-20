use shophub_db
-- List sellers and their best-selling product in each category.

select * from sellers

select * from order_items

select * from products

with sellers_best_product as (
select 
	p.product_category_name,
    p.product_id,
    s.seller_id,
    count(oi.order_item_id)as total_unit_sold,
    round(sum(oi.price),2) as total_revenue
from sellers s
join order_items oi
on oi.seller_id=s.seller_id
join products p
on p.product_id =oi.product_id
where p.product_Category_name is not null
group by p.product_Category_name , p.product_id ,s.seller_id
),
ranked_seller_product as
(
select  
	product_category_name,
	product_id,
    seller_id,
    total_unit_sold,
    total_revenue,
    rank() over(partition by product_category_name order by 
    total_unit_sold desc , 
    total_revenue desc) 
     as seller_category_rank
    from sellers_best_product
)

select
product_category_name,
seller_id,
product_id,
total_unit_sold,
total_revenue,
seller_category_rank
from ranked_seller_product
where seller_category_rank =1
order by product_category_name;

