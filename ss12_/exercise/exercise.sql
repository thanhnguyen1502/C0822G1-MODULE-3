DROP DATABASE IF EXISTS user_manager;

CREATE DATABASE user_manager;

USE user_manager;

CREATE TABLE `user` (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);


INSERT INTO user_manager.`user` (`name`, email, country) 
VALUE ('Minh','minh@codegym.vn','Viet Nam'),
	  ('Kante', 'kante@che.uk','Kenia');