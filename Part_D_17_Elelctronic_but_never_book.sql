

select * from products 

select * from orders
 
select * from customer
select* from order_items


use shophub_db
-- Find customers who bought electronics but never books.


select 
	c.customer_unique_id,
	c.customer_state,
	c.customer_city,
	count(distinct o.order_id) as total_orders
from customer c
join orders o
	on o.customer_id = c.customer_id 
join order_items oi
	on oi.order_id = o.order_id
join products p
	on p.product_id = oi.product_id
where ( p.product_category_name like "%electronices%"
or p.product_category_name like "%informatica%"
    or p.product_Category_name like "%telefonia%"
)
and c.customer_unique_id not in (
	select distinct c2.customer_unique_id
	from customer c2
    join orders o2
    on o2.customer_id = c2.customer_id
    join order_items oi2
    on oi2.order_id =o2.order_id
    join products p2
    on p2.product_id =oi2.product_id
    where p2.product_category_name like '%livros%'
    )
group by 
	c.customer_unique_id, 
    c.customer_state, 
    c.customer_city;
    
    
    
    
    
select 
	c.customer_unique_id,
	c.customer_state,
	c.customer_city,
	count(distinct o.order_id) as total_orders
from customer c
join orders o on o.customer_id = c.customer_id 
join order_items oi on oi.order_id = o.order_id
join products p on p.product_id = oi.product_id
group by 
	c.customer_unique_id, 
    c.customer_state, 
    c.customer_city
having sum(case when p.product_category_name like "%electronicos%"
	or p.product_category_name like "%informatica%"
    or p.product_Category_name like "%telefonia%" then 1 else 0  end ) >0
    and  sum(case when p.product_category_name like "%livros%" then 1 else 0 end)=0;
    
