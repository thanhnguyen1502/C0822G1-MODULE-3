DROP DATABASE IF EXISTS quanlybanhang;
CREATE DATABASE quanlybanhang;
USE quanlybanhang;

CREATE TABLE customer(
c_id INT AUTO_INCREMENT PRIMARY KEY,
c_name VARCHAR(20),
c_age INT
);

CREATE TABLE `order`(
	o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_totalprice DOUBLE,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE product(
p_id INT AUTO_INCREMENT PRIMARY KEY,
p_name VARCHAR(20),
p_price DOUBLE
);

CREATE TABLE order_detail(
o_id INT,
p_id INT,
od_qty DOUBLE,
PRIMARY KEY(o_id, p_id),
FOREIGN KEY (o_id) REFERENCES `order`(o_id),
FOREIGN KEY (p_id) REFERENCES product(p_id) 
);

INSERT INTO customer(c_name, c_age) 
VALUE 
('Minh Quan', 10),('Ngoc Oanh', 20),('Hong Ha', 50);

INSERT INTO `order`(c_id, o_date, o_totalprice) 
VALUE 
(1, '2006-3-21',null),(2, '2006-3-23',null),(1, '2006-3-16',null);

INSERT INTO product(p_name, p_price) 
VALUE 
('May Giat',3), ('Tu Lanh',5),
('Dieu Hoa',7), ('Quat',1), ('Bep Dien',2);

INSERT INTO order_detail(o_id, p_id, od_qty) 
VALUE 
(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);