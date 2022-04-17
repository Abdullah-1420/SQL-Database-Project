
create database store ;
use store ;
-- create tables ------------------------
Create table countries (
code int primary key ,
name varchar (20),
continent_name varchar (20) 
);

Create table users (
id  int primary key ,
full_name varchar (20),
email varchar (20) ,
gender varchar (1),
data_of_birth varchar(15),
created_at datetime default now() ,
country_code int ,
    FOREIGN KEY (country_code) REFERENCES countries(code)
) ;

create table orders (
id int primary key ,
user_id  int ,
status varchar(6) ,
created_at datetime default now()  ,
FOREIGN KEY (user_id) REFERENCES users(id)
);
create table products (
id int primary key ,
name varchar(10) ,
price int ,
status varchar(10) ,
created_at datetime default now() 
);
create table order_products (
order_id int   ,
product_id int  ,
quantity int ,
FOREIGN KEY (order_id) REFERENCES orders(id) ,
FOREIGN KEY (product_id) REFERENCES products(id)
);
-- Add the constraints to each tables -----------------------------------------------

ALTER TABLE countries
ADD CONSTRAINT name  UNIQUE (code);

alter table countries modify column continent_name varchar (20)  NOT NULL; 

ALTER TABLE users
ADD CONSTRAINT email  UNIQUE (id);

alter table users
add constraint ck_gender
check (gender in ('M' or 'F') ) ;

alter table orders
add constraint ck_status
check (status in ('start' or 'finish') ) ;

ALTER TABLE order_products ALTER COLUMN quantity SET DEFAULT 0;

ALTER TABLE products ALTER COLUMN price SET DEFAULT 0;
alter table products modify column name varchar (10)  NOT NULL; 

alter table products
add constraint ck_status2
check (status in ( 'valid' or 'expired') ) ;

 -- DML commands for the following instructions -----------------------------------------------
 
 alter table countries add new_row varchar (10) ;
 alter table users add new_row varchar (10) ;
  alter table orders add new_row varchar (10) ;
    alter table products add new_row varchar (10) ;
        alter table order_products add new_row varchar (10) ;
        
        update countries set new_row = " Hi " where code = 1 ; 
        
        delete from products where id = 1 ;
        
        
        
        

    

  


 
 
 






