drop database if exists exercise;

create database exercise;
use exercise;

create table users(
id int(3) not null auto_increment,
name varchar (120) not null,
email varchar (220) not null,
country varchar(120),
primary key (id)
);

insert into users (name, email, country) values ('Minh', 'minh@codegym.com','Viet Nam');
insert into users (name, email, country) values ('Kante', 'kante@che.uk','Kenia');
insert into users(name, email, country) values('Long','long@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Trung','trung@che.uk','UK');
insert into users(name, email, country) values('Duyen','duyen@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Trang','trang@che.uk','US');

drop procedure if exists display_user_list;