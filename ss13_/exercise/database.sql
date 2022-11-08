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
	  ('Kante', 'kante@che.uk','Kenia'),
      ('Hung', 'hung@che.uk','Kenia'),
      ('Nam', 'nam@che.uk','Kenia');
      
DELIMITER $$
CREATE PROCEDURE get_user_by_id (IN user_id INT)
BEGIN 
	SELECT u.`name`, u.email, u.country
	FROM `user` u
	WHERE u.id = user_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user (
	IN user_name VARCHAR(120), 	
    IN user_email VARCHAR(220), 
    IN user_country VARCHAR(120)
)
BEGIN 
	INSERT INTO `user`(`name`, email, country) 
	VALUE (user_name, user_email, user_country);
END $$
DELIMITER ;

CREATE TABLE Permision (
    id INT(11) PRIMARY KEY,
    name VARCHAR(50)
);


CREATE TABLE User_Permision (
    permision_id INT(11),
    user_id INT(11)
);

INSERT INTO Permision(id, name) 
VALUES (1, 'add'),
	   (2, 'edit'),
	   (3, 'delete'),
	   (4, 'view');
      

DELIMITER //
CREATE PROCEDURE list_user()
BEGIN
	SELECT *
    FROM `user`;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE update_user(
	IN user_id INT, 
    IN user_name VARCHAR(120), 
    IN user_email VARCHAR(220), 
    IN user_country VARCHAR(120)
)
BEGIN
	UPDATE `user` 
	SET 
		`name` = user_name,
		email = user_email,
		country = user_country
	WHERE
		id = user_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_user(IN user_id INT)
BEGIN
	DELETE FROM `user` 
	WHERE
		id = user_id;
END //
DELIMITER ;