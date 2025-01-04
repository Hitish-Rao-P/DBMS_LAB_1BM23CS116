create database insurance_116;
use insurance_116;


create table person_116(
driver_id varchar(10),
        name varchar(20),
        address varchar(30),
        primary key(driver_id)
);
desc person_116;
create table car_116(
reg_num varchar(10),
        model varchar(10),
        year int,
        primary key(reg_num)
);
desc car_116;
create table accident_116(
report_num int,
        accident_date date,
        location varchar(20),
        primary key(report_num)
);
desc accident_116;
create table owns_116(
driver_id varchar(10),
        reg_num varchar(10),
        primary key(driver_id,reg_num),
        foreign key(driver_id) references person_116(driver_id),  
        foreign key(reg_num) references car_116(reg_num)
);
desc owns_116;
create table participated_116(
driver_id varchar(10),
        reg_num varchar(10),
        report_num int,
        damage_amount int,
        primary key(driver_id,reg_num,report_num),
        foreign key(driver_id) references person_116(driver_id),
        foreign key(reg_num) references car_116(reg_num),
        foreign key(report_num) references accident_116(report_num)
);
desc participated_116;


select * from person_116;
select * from car_116;
select * from accident_116;
select * from owns_116;
select * from participated_116;



insert into person_116 values ("A01","Richard","Srinivas Nagar"),("A02","Pradeep","Rajaji Nagar"),("A03","Smith","Ashok Nagar"),("A04","Venu","N R Colony"),("A05","Jhon","Hanumanth Nagar");
select * from person_116;
insert into car_116 values ("KA052250","Indica",1990),("KA031181","Lancer",1957),("KA095477","Toyota",1998),("KA053408","Honda",2008),("KA041702","Audi",2005);
select * from car_116;
insert into owns_116 values("A01","KA052250"),("A02","KA053408"),("A03","KA031181"),("A04","KA095477"),("A05","KA041702");
select * from owns_116;
insert into accident_116 values(11,"2003-01-01","Mysore Road"),(12,"2004-02-02","South End Circle"),(13,"2003-01-21","Bull Temple Road"),(14,"2008-02-17","Mysore Road"),(15,"2005-03-04","Kanakpura Road");
select * from accident_116;
insert into participated_116 values("A01","KA052250",11,10000),("A02","KA053408",12,50000),("A03","KA095477",13,25000),("A04","KA031181",14,3000),("A05","KA041702",15,5000);
select * from participated_116;


update participated_116 set damage_amount=25000 where reg_num="KA053408" and report_num=12;
select * from participated_116;


insert into accident_116 values (16,"2008-03-15","Domlur");
select * from accident_116;

select accident_date,location from accident_116;

select driver_id from participated_116 where damage_amount>=25000;

select * from participated_116 order by damage_amount desc;

SELECT AVG(damage_amount) FROM participated_116;
