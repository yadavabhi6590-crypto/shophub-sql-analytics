create database shophub_db;

use shophub_db;

create table geolocation(
geolocation_zip_code_prefic varchar(10),
geolocation_lat decimal(10,8),
geolocation_lng decimal(10,8),
geolocation_city varchar(100),
geolocation_state varchar(50)
);
use shophub_db;
create table customer(
customer_id varchar(50) primary key,
customer_unique_id varchar(50) not null,
customer_zip_code_prefix varchar(50),
customer_city varchar(50),
customer_state varchar(5)
); 
select * from customer


create table sellers(
seller_id varchar(50) primary key,
seller_zip_code_prefix varchar(50),
seller_city varchar(100),
seller_state varchar(5)
);


create table products(
product_id varchar(50) primary key,
product_category_name varchar(100),
product_name_lenght int,
product_Description_lenght int,
product_photos_qlt int,
product_weight_g int,
product_lenght_cm int,
product_height_cm int,
product_width_cm int 
);


create table orders(
order_id varchar(50) primary key,
customer_id varchar(50),
order_status varchar(20),
order_purchase_timestamp datetime,
order_approved_at datetime,
order_delivered_carrier_dat datetime,
order_delivered_customer_date datetime,
order_estimated_delivered_date datetime	,
foreign key (customer_id) references customer(customer_id)
);


create table order_itmes(
order_id varchar(50),
order_item_id int,
product_id varchar(50),
seller_id varchar(50),
shipping_limit_date datetime,
price decimal(10,2),
freight_value decimal (10,2),
primary key (order_id, order_item_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id),
foreign key (seller_id) references sellers(seller_id)
);



create table order_payments(
order_id varchar(50),
payment_sequential int,
payment_type varchar(30),
payment_instollments int,
payment_values decimal(10,2),
primary key (order_id,payment_sequential),
foreign key (order_id) references orders(order_id)
);


create table order_reviews(
review_id varchar(10),
order_id varchar(50),
review_score int,
review_comment_title text,
review_comment_message text,
review_creattion_date datetime,
review_answer_timestamp datetime,
primary key(review_id ,order_id),
foreign key (order_id) references orders(order_id)
);
)


