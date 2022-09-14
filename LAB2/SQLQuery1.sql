create table Phone(
phone_id decimal(12) primary key not null,
phone_model varchar(32) not null,
phone_price decimal(6,2) not null,
release_date date not null
);

create table Customer(
customer_id decimal(12) primary key not null,
customer_email varchar(64) not null,
customer_name varchar(64) not null,
phone_id decimal(12)
);

alter table Customer
add constraint phone_id_FK
foreign key (phone_id)
references Phone(phone_id);

insert into Phone(phone_id,phone_model,phone_price,release_date)
values (1,'Apple iPhone X', 379,cast('03-NOV-2017' as date));
insert into Phone(phone_id,phone_model,phone_price,release_date)
values (2,'Galaxy S21+', 799,cast('29-JAN-2021' as date));
insert into Phone(phone_id,phone_model,phone_price,release_date)
values (3,'Xenos 360', 1024,cast('22-MAR-2021' as date));
insert into Phone(phone_id,phone_model,phone_price,release_date)
values (4,'Meridian Duplex', 462,cast('15-MAY-2021' as date));

insert into Customer(customer_id,customer_email,customer_name,phone_id)
values (1,'mc@gmail.com', 'Mahim Choudhury',null);
insert into Customer(customer_id,customer_email,customer_name,phone_id)
values (2,'qm@gmail.com', 'Mahdi Quddush',2);
insert into Customer(customer_id,customer_email,customer_name,phone_id)
values (3,'ik@gmail.com', 'Ifti Khan',3);
insert into Customer(customer_id,customer_email,customer_name,phone_id)
values (4,'da@gmail.com', 'Dewan Alindo',4);

select phone_model,customer_name from Phone join Customer on Customer.phone_id = Phone.phone_id;

select phone_model,release_date,customer_name from Phone left join Customer on Customer.phone_id = Phone.phone_id order by release_date Asc;
select phone_model,release_date,customer_name from Phone full join Customer on Customer.phone_id = Phone.phone_id order by release_date Asc;

select customer_name, phone_model from Phone right join Customer on Customer.phone_id = Phone.phone_id order by customer_email desc;
select customer_name,phone_model from Phone full join Customer on Customer.phone_id = Phone.phone_id order by customer_email desc;

select phone_model,customer_name,customer_email from Phone full join Customer on Customer.phone_id = Phone.phone_id order by phone_model,customer_name asc;


select phone_model,format(phone_price,'$.00') from Phone;

select phone_model,format((phone_price - 50),'$.00') from Phone;

select Cast(Customer.customer_name as varchar(64)) +' ('+cast(Phone.phone_model as varchar(32))+' - '+ format(cast(Phone.phone_price as decimal(6,2)),'$.00')+')' from Phone join Customer on Customer.phone_id = Phone.phone_id order by customer_name Asc;
select * from Phone;

select * from Customer;
