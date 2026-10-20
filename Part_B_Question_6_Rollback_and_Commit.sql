use shophub_db

START transaction 

use shophub_db
INSERT INTO customer (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state) 
VALUES ('temp_cust_999', 'temp_uniq_999', '395007', 'Surat', 'GJ');


select * from customer



select * from customer
where customer_id ="temp_cust_999"


ROLLBACK


select * from customer
where customer_id ="temp_cust_999"



start transaction;

-- 1. Insert Geolocation
INSERT INTO geolocation (geolocation_zip_code_prefic, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state) VALUES
('395007', 21.17024000, 72.83106000, 'Surat', 'GJ');

-- 2. Insert Customer
INSERT INTO customer (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state) VALUES
('cust_ord_004', 'cust_uniq_101', '395007', 'Surat', 'GJ');

-- 3. Insert Seller
INSERT INTO sellers (seller_id, seller_zip_code_prefix, seller_city, seller_state) VALUES
('seller_004', '395007', 'Surat', 'GJ');

-- 4. Insert Product
INSERT INTO products (product_id, product_category_name, product_name_lenght, product_Description_lenght, product_photos_qlt, product_weight_g, product_lenght_cm, product_height_cm, product_width_cm) VALUES
('prod_004', 'electronics', 25, 120, 3, 450, 15, 10, 5);


select * from orders
-- 1. Insert Order
INSERT INTO orders (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_dat, order_delivered_customer_date, order_estimated_delivered_date) VALUES
('order_1004', 'cust_ord_001', 'delivered', '2026-03-01 10:00:00', '2026-03-01 10:30:00', '2026-03-02 14:00:00', '2026-03-04 16:00:00', '2026-03-07 00:00:00');

-- 2. Insert Order Item
INSERT INTO order_itmes (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value) VALUES
('order_1004', 1, 'prod_001', 'seller_001', '2026-03-06 10:00:00', 1200.00, 50.00);

-- 3. Insert Order Payment
INSERT INTO order_payments (order_id, payment_sequential, payment_type, payment_instollments, payment_values) VALUES
('order_1004', 1, 'credit_card', 2, 1250.00);

-- 4. Insert Order Review
INSERT INTO order_reviews (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creattion_date, review_answer_timestamp) VALUES
('rev_004', 'order_1001', 5, 'Great Product', 'Delivered fast and good quality.', '2026-03-05 09:00:00', '2026-03-05 14:20:00');


commit ;