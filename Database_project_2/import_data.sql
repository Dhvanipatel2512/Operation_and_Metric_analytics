create database ig_clone_OA_IMS;
use ig_clone_OA_IMS;

# Table 1 job_data ds	job_id	actor_id	event	language	time_spent	org

create table job_data (
ds varchar(100),
job_id int,
actor_id int,
`event` varchar(50),
`language` varchar(100),
time_spent int,
org varchar(50)
);

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/job_data.csv"
into table job_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from job_data;


alter table job_data add column date_review date after ds;
update job_data set date_review = str_to_date(ds, '%d-%m-%Y');
alter table job_data drop column ds;
alter table job_data change column date_review ds date;


# Table 2 users user_id	created_at	company_id	language	activated_at	state

create table users (
users_id int unique primary key,
created_at varchar(100),
company_id int,
`language` varchar(50),
activated_at varchar(100),
state varchar(50)
);


load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv"
into table users
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

alter table users add column temp_created_at datetime after created_at;
update users set temp_created_at = str_to_date(created_at,'%d-%m-%Y %H:%i');
alter table users drop column created_at;
alter table users change column temp_created_at created_at datetime;

select * from users;

alter table users add column temp_activated_at datetime after activated_at;
update users set temp_activated_at = str_to_date(activated_at, '%d-%m-%Y %H:%i');
alter table users drop column activated_at;
alter table users change column temp_activated_at activated_at datetime;

# Table 3 events user_id	occurred_at	event_type	event_name	location	device	user_type
create table `events` (
user_id int,
occurred_at varchar(100),
event_type varchar(100),
event_name varchar(100),
location varchar(100),
device varchar(100),
user_type int,
foreign key (user_id) references users(users_id)
);


load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv"
into table `events`
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from events;

alter table `events` add column temp_occurred_at datetime after occurred_at;  
update `events` set temp_occurred_at = str_to_date(occurred_at, '%d-%m-%Y %H:%i');
alter table `events` drop column occurred_at;
alter table `events` change column temp_occurred_at occurred_at datetime;

# Table 4 email_events user_id	occurred_at	action	user_type

create table email_events (
user_id int,
occurred_at varchar(100),
`action` varchar(100),
user_type int,
foreign key (user_id) references users(users_id)
);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv"
into table email_events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from email_events;
alter table email_events add column temp_occurred_at datetime after occurred_at;
update email_events set temp_occurred_at = str_to_date(occurred_at, '%d-%m-%Y %H:%i');
alter table email_events drop column occurred_at;
alter table email_events change column temp_occurred_at occurred_at datetime;











 



