-- Perform market basket analysis using self-joins.
select * from products;
select 
p1.product_category_name as primary_product_Category,
p2.product_Category_name as  co_purchase_product_Category,
count(distinct oi1.order_id) as time_brought,
round(sum(oi1.price +oi2.price),2) as combined_pair_Revenue

from order_items oi1
join order_items oi2
on oi1.order_id=oi2.order_id
and oi1.product_id < oi2.product_id

join products p1
on oi1.product_id = p1.product_id

join products p2
on oi2.product_id =p2.product_id

where p1.product_category_name  is not null
and p2.product_category_name is not null

group by 
p1.product_category_name, p2.product_category_name
order by time_brought
limit 10