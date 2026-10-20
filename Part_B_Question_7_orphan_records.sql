
use tutedude_project

select * from order_items

select * from products

select oi.order_id,oi.product_id
from order_items oi
left join products p
on p.product_id =oi.product_id 
where p.product_id is null


SELECT oi.order_id, oi.product_id
FROM order_items oi
LEFT JOIN products p 
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;