DROP DATABASE IF EXISTS order_management;

DROP DATABASE IF EXISTS order_management;

CREATE DATABASE order_management;

USE order_management;

-- Nhà cung cấp --
CREATE TABLE supplier (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(50),
    address VARCHAR(50),
    phone_number VARCHAR(10),
    PRIMARY KEY (id)
);

-- Số điện thoại --
CREATE TABLE phone_number (
    `number` VARCHAR(10),
    supplier_id INT,
    PRIMARY KEY (`number`),
    FOREIGN KEY (supplier_id)
        REFERENCES supplier(id)
);

-- Đơn đặt hàng --
CREATE TABLE orders (
    id INT AUTO_INCREMENT,
    day_oder DATE,
    supplier_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (supplier_id)
        REFERENCES supplier(id)
);

-- Vật tư --
CREATE TABLE material ( 
    id INT AUTO_INCREMENT,
    `name` VARCHAR(50),
    PRIMARY KEY (id)
);

-- Chi tiết đơn đặt hàng --
CREATE TABLE order_detail (
    order_id INT,
    material_id INT,
    PRIMARY KEY (order_id , material_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (id),
    FOREIGN KEY (material_id)
        REFERENCES material (id)
);

-- Phiếu xuất --
CREATE TABLE export_bill (
    id INT AUTO_INCREMENT,
    day_exprot DATE,
    PRIMARY KEY (id)
);

-- Chi tiết phiếu xuất --
CREATE TABLE export_bill_detail (
    material_id INT,
    export_bill_id INT,
    unit_price VARCHAR(45),
    amount VARCHAR(45),
    PRIMARY KEY (material_id , export_bill_id),
    FOREIGN KEY (material_id)
        REFERENCES material (id),
    FOREIGN KEY (export_bill_id)
        REFERENCES export_bill (id)
);

-- Phiếu nhập --
CREATE TABLE import_invoice (
    id INT AUTO_INCREMENT,
    day_import DATE,
    PRIMARY KEY (id)
);

-- Chi tiết phiếu nhập --
CREATE TABLE import_invoice_detail (
    material_id INT,
    import_invoice_id INT,
    unit_price VARCHAR(45),
    amount VARCHAR(45),
    PRIMARY KEY (material_id , import_invoice_id),
    FOREIGN KEY (material_id)
        REFERENCES material (id),
    FOREIGN KEY (material_id)
        REFERENCES import_invoice (id)
);