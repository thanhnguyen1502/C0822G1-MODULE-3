drop database if exists student;
create database student;
use student;

-- tạo bảng student
create table student(
 id int primary key,
`name` varchar(50),
age int,
email varchar(50)
);

-- thêm mới --
insert into student(id, `name`, age, email) value 	
				(1,"Thanh Nguyen", 20,"thanh@gmail.com"),
				(2,"Le Nguyen", 21,"thanh@gmail.com"),
				(3,"Ngan Nguyen", 22,"thanh@gmail.com");

-- tạo bảng class
create table class(
 id int primary key,
`name` varchar(50)
);

insert into class(id,`name`) value	(1,"duc vinh"),
									(2,"xuan quynh"),
									(3,"ngoc le"),
									(4,"thi ngan");

-- tạo bảng teacher
create table teacher(
 id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);

insert into teacher(id, `name`, age, country) value 	
		(1,"ngoc quang", 18, "quang tri"),
		(2,"ngoc le", 19, "ha noi"),
		(3,"ngoc nguyen", 20, "tp. hcm"),
		(4,"ngoc ngan", 22, "da nang");


