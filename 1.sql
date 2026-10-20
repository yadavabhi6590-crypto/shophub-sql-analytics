
-- Part B Insert clean data with transaction 

start transaction

INSERT INTO customer (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
VALUES 
(999001, 'unique_cust_001', '01000', 'São Paulo', 'SP'),
(999002, 'unique_cust_002', '02000', 'Rio Janeiro', 'RJ'),
(999003, 'unique_cust_003', '03000', 'Belo Horizonte', 'MG');

select * from customer 



-- Insert cleaned order data

INSERT INTO orders (order_id, customer_id, order_status, order_purchase_timestamp, order_total)
VALUES 
('order_clean_001', 999001, 'delivered', '2024-01-15 10:30:00', 150.50),
('order_clean_002', 999002, 'delivered', '2024-01-16 11:45:00', 280.75);



commit



SELECT 'Transaction 1: COMMIT SUCCESS' as Result;



start transaction 


-- Try to insert customer
INSERT INTO customer (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
VALUES 
(999004, 'unique_cust_004', '04000', 'Brasília', 'DF');

select * from customer 
where customer_id ='999004'

select * from orders


-- Try to insert order (but customer_id doesn't exist - will cause error!)

INSERT INTO orders(order_id, customer_id, order_status, order_purchase_timestamp)
VALUES 
('order_clean_003', 999999, 'delivered', '2024-01-17 12:00:00');


rollback
select 'transaction 2 rollback - no data save ' as result; 