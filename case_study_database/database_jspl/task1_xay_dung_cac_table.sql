---------- CÁC BẢNG LƯU TRỮ DỮ LIỆU ----------

DROP DATABASE IF EXISTS furama_management;

CREATE DATABASE furama_management;

USE furama_management;

-- Vị trí --
CREATE TABLE furama_management.position (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Trình độ --
CREATE TABLE furama_management.education_degree (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Bộ phận --
CREATE TABLE furama_management.division (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Loại dịch vụ --
CREATE TABLE furama_management.facility_type (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Kiểu thuê --
CREATE TABLE furama_management.rengt_type (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Loại khách hàng --
CREATE TABLE furama_management.customer_type (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Dịch vụ miễn phí đi kèm --
CREATE TABLE furama_management.attach_facility (
    id INT,
    `name` VARCHAR(45),
    cost DOUBLE,
    unit VARCHAR(10),
    `status` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Nhân viên --
CREATE TABLE furama_management.employee (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    id_card VARCHAR(45),
    salary DOUBLE,
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    PRIMARY KEY (id),
    `status` bit(1) default 1
);

-- Khách hàng --
CREATE TABLE furama_management.customer (
    id INT AUTO_INCREMENT,
    customer_type_id INT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    gender BIT(1),
    id_card VARCHAR(45),
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    PRIMARY KEY (id),
    `status` bit(1) default 1
);

-- update customer set `status` =  0 where id = 1;
update customer set name = 'thanh', date_of_birth = '1997-02-15', gender = 1, id_card = '1' ,phone_number ='45454',email='aa@gmail.com',address='quangnam' where id = 3;
select * from customer;



-- Dịch vụ --
CREATE TABLE furama_management.facility (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(45),
    area INT,
    cost DOUBLE,
    max_people INT,
    rent_type_id INT,
    facility_type_id INT,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floor INT,
    facility_free TEXT,
    PRIMARY KEY (id),
	foreign key (rent_type_id) references rengt_type(id),
    foreign key (facility_type_id) references facility_type(id),
    `status` bit(1) default 1
);

-- Hợp đồng --
CREATE TABLE furama_management.contract (
    id INT AUTO_INCREMENT,
    start_date DATETIME,
    end_date DATETIME,
    deposit DOUBLE,
    employee_id INT,
    customer_id INT,
    facility_id INT,
    PRIMARY KEY (id)
);

-- Hợp đồng chi tiếc --
CREATE TABLE furama_management.contract_detail (
    id INT,
    amount INT,
    contract_id INT,
    attach_facility_id INT,
    PRIMARY KEY (id)
);