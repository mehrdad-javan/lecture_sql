-- DROP DATABASE testdb;
-- CREATE DATABASE testdb;
-- USE testdb;
-- CREATE TABLE
CREATE TABLE PERSON(
ID INT not null,
FIRST_NAME VARCHAR(255) not null,
LAST_NAME varchar(255) not null,
BIRTH_DATE date not null,
STATUS tinyint default false
);

-- ALTER TABLE
alter table PERSON ADD REGISTER_DATE DATETIME; 
ALTER TABLE PERSON MODIFY FIRST_NAME varchar(400); 
alter table PERSON DROP REGISTER_DATE; 
alter table PERSON ADD REGISTER_DATE DATETIME default now(); 

-- DROP TABLE
DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT not null,
FIRST_NAME VARCHAR(255) not null,
LAST_NAME varchar(255) not null,
BIRTH_DATE date not null,
REGISTER_DATE datetime default now(),
CITY varchar(80),
STATUS tinyint default false
);

DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT not null,
FIRST_NAME VARCHAR(255) not null,
LAST_NAME varchar(255) not null,
EMAIL varchar(255) not null unique,
BIRTH_DATE date not null,
REGISTER_DATE datetime default now(),
CITY varchar(80),
STATUS tinyint default false
);


DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT not null primary key,
FIRST_NAME VARCHAR(255) not null,
LAST_NAME varchar(255) not null,
EMAIL varchar(255) not null unique,
BIRTH_DATE date not null,
REGISTER_DATE datetime default now(),
CITY varchar(80),
STATUS tinyint default false
);

DROP TABLE PERSON;

CREATE TABLE PERSON(
ID INT not null primary key auto_increment,
FIRST_NAME VARCHAR(255) not null,
LAST_NAME varchar(255) not null,
EMAIL varchar(255) not null unique,
BIRTH_DATE date not null,
REGISTER_DATE datetime default now(),
CITY varchar(80),
STATUS tinyint default false
);

insert into person (first_name,last_name,email,birth_date,register_date,city,status) values("mehrdad","javan","mehrdad.javan@lexicon.se", "1989-02-27",now(),"VAXJO",true);
insert into person (first_name,last_name,email,birth_date,register_date,status) values("test","test","test@lexicon.se", "1989-02-27",now(),0);
insert into person (first_name,last_name,email,birth_date,register_date,city,status) values("mehrdad","javan","mehrdad.javan33@lexicon.se", "1998-02-27",now(),"VAXJO",true);

insert into person (first_name,last_name,email,birth_date,city) values("test2","test2","tes2@lexicon.se", "1989-02-27","VAXJO");

insert into person values(0,"mehrdad","javan","mehrdad.javan22@lexicon.se", "1989-02-27",now(),"VAXJO",true);

select * from person;

CREATE TABLE TASK(
id int not null primary key auto_increment,
TITLE varchar(255) not null,
DESCRIPTION varchar(400),
person_id int,
foreign key (person_id) references person(id) 
);

select * from task;
insert into task values(0,"add search method","test test", 1);

select * from task;

-- insert into task values(0,"add search method","test test", 100);


-- ManyToMany

CREATE table GROUP_(
id int not null primary key auto_increment,
GROUP_NAME varchar(255) not null
);

-- create mapping table or assosiation
CREATE TABLE PERSON_GROUP(
id int not null primary key auto_increment,
person_id int not null,
group_id int not null,
foreign key (person_id) references person(id),
foreign key (group_id) references group_(id)
);

insert into group_ values(0,"Java");
insert into group_ values(0,"C#");

select * from group_ ;

insert into PERSON_GROUP values(0,1,1);
insert into PERSON_GROUP values(0,1,2);
insert into PERSON_GROUP values(0,2,1);

select * from PERSON_GROUP;

select first_name, last_name from person;

select id, first_name, last_name from person where id = 1 and first_name = "mehrdad";



select distinct last_name from PERSON;

-- default asc
select * from person order by last_name;
select * from person order by last_name desc;


select * from person limit 2;

select count(*) from person;
select count(*) from person where last_name = "javan";
select avg(id) from person;
select sum(id) from person;
select concat(first_name," ",last_name) as full_name from person;


select * from person p where p.id in(1,2); 
select * from person p where p.first_name like 'm%'; 
select * from person p where p.first_name like '%dad'; 
select * from person p where p.first_name like 't_%'; 
select * from person p where p.first_name like '_e%'; 

select * from person p where p.BIRTH_DATE between '1989-01-01' and '1992-01-01';

select person.first_name, person.last_name, task.title from person join task on person.id = task.id;
select person.first_name, person.last_name, task.title from person inner join task on person.id = task.id;

select person.first_name, person.last_name, task.title from person left join task on person.id = task.id;
select person.first_name, person.last_name, task.title from person right join task on person.id = task.id;
select person.first_name, person.last_name, task.title from person p JOIN task t on p.id = t.id;

select * from person;
update person set status = true where id = 2;
update person set status = false, city = 'ALVESTA' where id = 2;