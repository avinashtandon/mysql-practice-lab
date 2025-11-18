create database retail_db;

use retail_db;

select database();


CREATE TABLE orders (
 order_id int,
 order_date datetime,
customer_id int,
order_status varchar(30)
 );

SHOW TABLES;