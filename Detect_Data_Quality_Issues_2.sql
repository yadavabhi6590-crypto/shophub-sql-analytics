

use tutedude_project


select * from customers;

-- 1.Find missing customer_id
select count(*) as null_customer_id
from customers
where customer_id is null


-- 2 find duplicate customer_unique_id

select customer_unique_id , count(*) as duplicate_value
from customers
group by customer_unique_id
having count(*) >1


-- 3 find orphane_order

select count(*) as orphane_order
from orders o
left join customers c
on c.customer_id  = o.customer_id
where c.customer_id is null

-- 4 find negative price
select * from order_items;

select count(*) as negative_price
from order_items
where price < 0

-- 5 Reviews is null reviews
select * from order_reviews
select count(*) as null_reviews
from order_reviews;
where  review_score is null


select * from products
-- 6 missing category name

select count(*) as missing_category_name
from products
where product_category_name is null

use tutedude_project
-- 7.order parchase timeatamp

select * from orders;
select count(*) as nulltimestamp_date
from orders
where order_purchase_timestamp is null



-- 8.find missing sellers

select * from sellers
select count(*) as sellers_id
from sellers
where seller_id is null

-- 9 find the missing geolocations
select * from geolocation
select count(*) as missing_geo
from geolocation
where geolocation_lat is null

-- 10 Correct mapping: Aggregate lifetime spend on customer_unique_id, NOT customer_id
SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS lifetime_orders,
    SUM(oi.price) AS total_ltv
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id;
