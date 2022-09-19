show databases;
drop database employees;
create database employees;
show databases;
use employees;
CREATE TABLE persons3 (
        PersonID int,
         LastName varchar(255),
        FirstName varchar(255),
         Address varchar(255),
         City varchar(255)
     );
select * from persons3;    
show tables;
insert into persons3 values(20, 'Ritu Raj', 'Kaundilya','Patna', 'Patna');
select * from persons3;
insert into persons3 (PersonID, LastName) values(21, 'Kaundilya');
insert into persons3 values(22, 'Rituraj', 'Kaundilya','Patna','');
alter table persons3 add DOB date;
select * from persons3;
insert into persons3 (PersonID, FirstName) values(23, 'Ritu Raj');
insert into persons3 values(20, 'Ritu Raj', 'Kaundilya','Patna', 'Bihar','1999-08-20');
select year(curdate())-year(DOB) from persons3;
UPDATE persons3 SET PersonID = 24 WHERE City ='Bihar';
alter table persons3 add constraint pk_person primary key (PersonID);
insert into persons3 values(24, 'Ritu Raj', 'Kaundilya','Patna', 'jharkhund','1999-08-20');
insert ignore into persons3 values(20, 'Ritu Raj', 'Kaundilya','Patna', 'Bihar','1999-08-20');
rollback;
alter table persons3 rename column DOB to Birthdate;
desc persons3;
alter table persons3 change Birthdate DOB int; 
desc persons3;
alter table persons3 rename column LastName to LName, rename column FirstName to FName;
desc persons3;
alter table persons3 change DOB DOB date;
alter table persons3 drop column City;
desc persons3;
insert ignore into persons3 values(25, 'Kaundilya','Ritu Raj','Patna','1999-08-20');
select * from persons3;
alter table persons3 drop primary key;
SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME
   FROM information_schema.table_constraints
    WHERE table_name='persons3';
desc information_schema.table_constraints;
alter table persons3 modify PersonID int NOT NULL;
desc persons3;
Alter table persons3 alter Address set default 'Patna';
select * from persons3;
insert into persons3 values(26,'Agarwal','Kushal','Pune', '1999-09-29');
show indexes from persons3;
alter table persons3 alter Address drop default;
create table identity (card_Number int, PersonID int, foreign key (PersonID) references persons3(PersonID));
create table sample( id int NOT NULL AUTO_INCREMENT, name varchar(255), unique key (id));
insert into sample values(NULL, 'Kondy');
insert into sample values(NULL, 'Chotu');
select * from sample;
desc sample ;
create table customer (
customer_id int primary key auto_increment,
cust_name varchar(255) not null,
cust_phone int not null,
cust_email varchar(255) not null,
cust_city varchar(255) not null,
cust_pin int not null,
cust_creation date);
desc customer;
create table technician (
tech_id int primary key,
tech_name varchar(255) not null,
tech_add varchar(255) not null,
tech_city_pin int not null,
tech_reg_dat date not null,
tech_skill varchar(255) not null);
create table problem(
case_id int primary key,
problem text not null,
customer_id int,
tech_id int,
case_raise date,
foreign key (customer_id)
references customer(customer_id),
foreign key (tech_id)
references technician(tech_id));
insert into customer values(null,'Aviral','555', 'av@local', 'Gorakhpur', 701002, '2010-08-21');
insert into customer values(null,'Kondy','121', 'kondy@local', 'Patna', 800006, '2008-07-18');
insert into customer values(null,'Chitrank','233', 'chittu@local', 'Jaipur', 732112, '2008-03-20');
insert into technician values(1001,'Mantu','Pune', 322223, '2011-09-05', 'Electrician');
insert into technician values(1002,'Santu','Patna', 434344, '2009-09-17', 'Plumber');
insert into problem values(20,'Electrical',1, 1001, '2013-10-07');
insert into problem values(21,'Plumbing',2, 1002, '2019-02-25');
desc customer;
select * from technician;
select * from customer;
select * from problem;
select a.customer_id, a.cust_name, a.cust_phone,c.problem, c.case_raise, b.tech_id, b.tech_name, b.tech_reg_dat from customer a , technician b, problem c where a.customer_id=c.customer_id and b.tech_id=c.tech_id;
Create database flight;
use flight;

create table flight_info( 
f_code varchar(255) primary key,
total_seats int not null,
dep_date date,
fare int);

create table passenger( 
PNR int auto_increment unique key ,
FName varchar(255) not null,
LName varchar(255),
Boarding_date date,
f_code varchar(255),
National_ID varchar(255) not null,
foreign key (f_code)
references flight_info(f_code));
desc passenger;
drop table passenger;
insert into passenger values(1, 'Mahatma','Gandhi', '2022-07-06', 'SJ74', 'fhdafh');
insert into passenger values(null, 'Saddam', 'Hussein', '2022-07-06', 'SJ74', 'ffhfnn');
select * from passenger;
insert into passenger values(null, 'Vikrant', 'Singh', '2022-05-09', 'SJ42', 'hjgbjj');
insert into passenger values(null, 'Nitish', 'Kumar', '2022-05-09', 'SJ42', 'mknkkn');



