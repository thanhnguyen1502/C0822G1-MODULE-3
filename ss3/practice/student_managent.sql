DROP DATABASE IF EXISTS student_management;

CREATE DATABASE student_management;

USE student_management;

CREATE TABLE class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    `status` BIT
);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(60),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);

CREATE TABLE `subject` (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    `status` BIT
);

CREATE TABLE mark (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    FOREIGN KEY (sub_id)
        REFERENCES `subject` (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);

INSERT INTO class(class_name,start_date,`status`) 
	VALUES ("A1","2008-12-20",1);
INSERT INTO class(class_name,start_date,`status`) 
	VALUES ("A2","2008-12-22",1);
INSERT INTO class(class_name,start_date,`status`) 
	VALUES ("B3",CURRENT_DATE,0);

INSERT INTO student(student_name,address,phone,`status`,class_id)
	VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student(student_name,address,`status`,class_id)
	VALUES ('Hoa', 'Hai phong',1, 1);
INSERT INTO student(student_name,address,phone,`status`,class_id)
	VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO `subject`(sub_name,credit,`status`) 
	VALUE ("CF",5,1);
INSERT INTO `subject`(sub_name,credit,`status`) 
	VALUE ("C",6,1);
INSERT INTO `subject`(sub_name,credit,`status`) 
	VALUE ("HDJ",5,1);
INSERT INTO `subject`(sub_name,credit,`status`) 
	VALUE ("RDBMS",10,1);

INSERT INTO mark(sub_id,student_id,mark,exam_times) 
	VALUE (1,1,8,1);
INSERT INTO mark(sub_id,student_id,mark,exam_times) 
	VALUE (1,2,10,2);
INSERT INTO mark(sub_id,student_id,mark,exam_times) 
	VALUE (2,1,12,1);

SELECT 
    *
FROM
    student;
    

SELECT 
    *
FROM
    student
WHERE
    `status` = TRUE;
    

SELECT 
    *
FROM
    `subject`
WHERE
    credit < 10;
    

SELECT 
    student.student_id, student.student_name, class.class_name
FROM
    student
        JOIN
    class ON student.class_id = class.class_id
WHERE
    class.class_name = 'A1';
    
    
SELECT 
    student.student_id,
    student.student_name,
    `subject`.sub_name,
    mark.mark
FROM
    student
        JOIN
    mark ON student.student_id = mark.student_id
        JOIN
    `subject` ON mark.sub_id = `subject`.sub_id
WHERE
    `subject`.sub_name = 'CF';