USE furama_management;

DELIMITER //
CREATE PROCEDURE customer_list()
BEGIN
	SELECT 
		c.id,
		c.name AS customer_name,
		c.date_of_birth,
		c.gender,
        c.id_card,
		c.phone_number,
		c.email,
		c.address,
		ct.name AS customer_type
	FROM
		customer c
			JOIN
		customer_type ct ON c.customer_type_id = ct.id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_new_customer(
	IN customer_type_id_new INT, 
	IN name_new VARCHAR(45), 
	IN date_of_birth_new DATE,
	IN gender_new BIT(1), 
	IN id_card_new VARCHAR(45),
	IN phone_number_new VARCHAR(45),
	IN email_new VARCHAR(45), 
	IN address_new VARCHAR(45)
)
BEGIN
	INSERT INTO furama_management.customer (
		customer_type_id, 
		`name`, 
		date_of_birth, 
		gender, 
		id_card,
		phone_number, 
		email,
		address
	) 
	VALUES(
		customer_type_id_new, 
		name_new, 
		date_of_birth_new,
		gender_new, 
		id_card_new,
		phone_number_new,
		email_new, 
		address_new
	);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_customer(IN id_delete INT)
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM customer 
	WHERE
		id = id_delete;
	SET FOREIGN_KEY_CHECKS=1;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE find_customer_by_id(IN customer_id_find INT)
BEGIN
	SELECT 
		c.id,
		c.name AS customer_name,
		c.date_of_birth,
		c.gender,
		c.id_card,
		c.phone_number,
		c.email,
		c.address,
        c.customer_type_id,
		ct.name AS customer_type
	FROM
		customer c
			JOIN
		customer_type ct ON c.customer_type_id = ct.id
	WHERE
		c.id = customer_id_find;	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE edit_customer(
	IN id_edit INT, 
	IN customer_type_id_edit INT, 
	IN name_edit VARCHAR(45), 
	IN date_of_birth_edit DATE,
	IN gender_edit BIT(1), 
	IN id_card_edit VARCHAR(45),
	IN phone_number_edit VARCHAR(45),
	IN email_edit VARCHAR(45), 
	IN address_edit VARCHAR(45)
)
BEGIN
	UPDATE customer c 
	SET 
		c.name = name_edit,
		c.date_of_birth = date_of_birth_edit,
        c.gender = gender_edit,
		c.id_card = id_card_edit,
		c.phone_number = phone_number_edit,
		c.email = email_edit,
		c.address = address_edit,
		c.customer_type_id = customer_type_id_edit
	WHERE
		c.id = id_edit;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE customer_type_list()
BEGIN
	SELECT 
		*
	FROM
		customer_type;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE find_customer(IN key_search VARCHAR(45))
BEGIN
	SELECT 
		c.id,
		c.name AS customer_name,
		c.date_of_birth,
		c.gender,
		c.id_card,
		c.phone_number,
		c.email,
		c.address,
        c.customer_type_id,
		ct.name AS customer_type
	FROM
		customer c
			JOIN
		customer_type ct ON c.customer_type_id = ct.id
	WHERE
		c.name LIKE  concat("%", key_search, "%") 
			OR 
        c.phone_number LIKE  concat("%", key_search, "%")
			OR  
        ct.name LIKE  concat("%", key_search, "%"); 
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE service_list()
BEGIN
	SELECT 
		f.id,
		f.name as service_name,
		f.area as useble_area,
		f.cost,
		f.max_people,
		rt.name as rent_type,
		ft.name as service_type,
		f.standard_room,
		f.description_other_convenience,
		f.pool_area,
		f.number_of_floor,
		f.facility_free
	FROM
		facility f
			JOIN
		rengt_type rt ON f.rent_type_id = rt.id
			JOIN
		facility_type ft ON f.facility_type_id = ft.id;
END //
DELIMITER ;

CALL service_list();