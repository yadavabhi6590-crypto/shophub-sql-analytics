use tutedude_project

select * from customers 

select c1.customer_unique_id,
c1.customer_id as customer_1_id,
c1.customer_city as city_1,
c2.customer_id as customer_2_id,
c2.customer_city as city_2
from customers c1
join customers c2 
on c1.customer_unique_id = c2.customer_unique_id 
and c1.customer_id <> c2.customer_id
 