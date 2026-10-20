-- List customers who registered but never placed an order.

use tutedude_project
select * from customers


select * from orders

select c.*
from customers c
left join orders o
on o.customer_id = c.customer_id 
where o.customer_id  is null