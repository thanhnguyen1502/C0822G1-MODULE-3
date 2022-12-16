DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;
USE student_management;

CREATE TABLE class (
    id INT,
    `name` VARCHAR(50)
);

CREATE TABLE student (
    id INT,
    `name` VARCHAR(55),
    age TINYINT,
    country VARCHAR(40)
);

ALTER TABLE class 
ADD PRIMARY KEY (id);


ALTER TABLE class 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE class 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE class 
ADD PRIMARY KEY (id), 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT;

INSERT INTO class (`name`) VALUE ('C0422G1');
INSERT INTO class (`name`) VALUE ('C0522G1');
INSERT INTO class (`name`) VALUE ('C0622G1');
INSERT INTO class (`name`) VALUE ('C0722G1');
INSERT INTO class (`name`) VALUE ('C0822G1');

SELECT 
    *
FROM
    class;

DELETE FROM class 
WHERE
    `id` = 2;
 
SELECT 
    *
FROM
    class;

SET sql_safe_updates = 0;
DELETE FROM class 
WHERE
    `name` = 'C0722G1';
set sql_safe_updates = 1;

SELECT 
    *
FROM
    class;

UPDATE class 
SET 
    `name` = 'C0722g1'
WHERE
    `id` = 1;

SELECT 
    *
FROM
    class;

SET sql_safe_updates = 0;
UPDATE class 
SET 
    `name` = 'C0822g1'
WHERE
    `name` = 'C0622G1';
SET sql_safe_updates = 1;
SELECT 
    *
FROM
    class;