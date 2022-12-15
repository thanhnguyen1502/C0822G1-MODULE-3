DROP DATABASE IF EXISTS sell_management;

CREATE DATABASE sell_management;

USE sell_management;

-- Khách hàng --
CREATE TABLE customer (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    CHECK (age > 0),
    PRIMARY KEY (id)
);

-- Đơn đặt hàng --
CREATE TABLE `order` (
    id INT AUTO_INCREMENT,
    customer_id INT,
    day_oder DATE NOT NULL,
    total_price DOUBLE,
    CHECK (total_price > 0),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id)
        REFERENCES customer (id)
);

-- Sản phẩm --
CREATE TABLE product (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    price DOUBLE,
    CHECK (price > 0),
    PRIMARY KEY (id)
);

-- Chi tiết đơn đặt hàng --
CREATE TABLE order_detail (
    order_id INT,
    product_id INT,
    QTY VARCHAR(50) NOT NULL,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id)
        REFERENCES `order` (id),
    FOREIGN KEY (product_id)
        REFERENCES product (id)
);