drop database if exists demo;

create database demo;

use demo;


-- Tạo bảng Products. 
create table products (
    product_id int primary key,
    product_code int,
    product_name varchar(40),
    product_price double,
    product_amount int,
    product_description text,
    product_status bit
);


-- Chèn dữ liệu cho bảng products 
insert into products
	 values
		(1,1,"product1",111,3,null,1),
		(2,2,"product1",111,3,null,1),
		(3,3,"product2",111555,35,null,1),
		(4,4,"product32",1171,38,null,0),
		(5,5,"product14",117571,73,null,1),
		(6,6,"product185",555111,3,null,0);
 
 
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục) 
create unique index i_product_code on products (product_code);
drop index i_product_code on products;


-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice) 
create  index i_product_name_price on products (product_name, product_price);
drop index i_product_name_price on products;


-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào 
explain select product_code from products where product_code >3;
explain select product_name, product_price 
		from 
			products 
		where product_price = 111 and  product_name = "product1" 
		group by product_name;
 

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products. 
create view v_products as
    select 
        product_code, 
        product_name, 
        product_price, 
        product_status
    from
        products; 

set sql_safe_updates =0;


-- Tiến hành sửa đổi view 
create or replace view v_products as
	select 
		product_code, 
		product_name, 
        product_price, 
        product_status, 
        product_amount
    from products;


-- Tiến hành xoá view 
drop view v_products;


-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product 
delimiter $$
create procedure product_info ()
begin
	select * from products;
end $$
delimiter ;


-- Tạo store procedure thêm một sản phẩm mới 
delimiter $$
create procedure add_new_product (in id int, `code` int, `name` varchar(40), price double, amount int,`description` text,`status` bit)
begin
	insert into products 
		value(id,`code`,`name`,price, amount, `description`, `status`);
end $$
delimiter ;

call add_new_product(8,4545,"product 8",5653453,756,null,0);


-- Tạo store procedure sửa thông tin sản phẩm theo id 
delimiter $$
create procedure update_product (in id int, `code` int, `name` varchar(40), price double, amount int,`description` text,`status` bit)
begin
	set sql_safe_updates =0;
	update products 
		set product_code = `code`, 
			product_name = `name`,
			product_price = price,
            product_amount = amount,
            product_description = `description`, 
            product_status = `status`
	where product_id = id;
    set sql_safe_updates =1;
end $$
delimiter ;
call update_product(3,87,"product345",545456,43,null,1);


-- Tạo store procedure xoá sản phẩm theo id 
delimiter $$
create procedure delete_product (in id int)
begin
	delete from products where product_id = id;
end $$
delimiter ;
call delete_product(5);


