--TABLES
--Replace this with your table creations.
Drop Table Store_location;
Drop Table Store_Address;
Drop Table Store_State;
Drop Table Product;
Drop Table Shipping_supply;
Drop Table Office_supply;
Drop Table Printing_supply;
Drop Table Distributor;
Drop Table Customer_product;
Drop Table Customer;
Drop Table Address;
Drop Table Purchase;
Drop Table Face_to_face;
Drop Table Online;
Drop Table Returns;
Drop Table Online_return;
Drop Table Face_to_face_return;
--Drop sequence Store_ID_seq;
Drop Sequence Store_address_ID_seq;
Drop Sequence Store_State_ID_seq;
Drop Sequence Product_ID_seq;
Drop Sequence Distributor_ID_seq;
Drop Sequence Customer_ID_seq;
Drop Sequence Address_ID_seq;
Drop Sequence Purchase_ID_seq;
Drop Sequence Return_ID_seq;

-- Tables

Create Table Store_State(
Store_state_code Char(2) not null primary key,
Store_state varchar(255) not null
);

Create Table Store_Address(
Store_address_ID Decimal(2) not null primary key,
Store_street varchar(255) not null,
Store_city varchar (255) not null,
Store_postal decimal(5) not null,
Store_state_code char(2) not null
foreign key (Store_state_code) references Store_State(Store_state_code)
);

Create Table Store_location(
Store_ID Decimal(2) not null primary key,
Store_address_ID Decimal(2) not null
foreign key (Store_address_ID) references Store_Address(Store_address_ID)
);

Create Table Customer(
Customer_ID Decimal(2) not null primary key,
First_name varchar(64) not null,
Last_name varchar(255) not null,
Phone_number Decimal(11) not null 
);

Create Table Address(
Address_ID Decimal(12) not null primary key,
Street_address varchar(255) not null,
City_name varchar(255) not null,
Customer_ID Decimal(2) not null,
foreign key (Customer_ID) references Customer(Customer_ID)
);

Create Table Returns(
Return_ID Decimal(12) not null primary key,
Customer_ID Decimal(2) not null,
Product_name varchar(255) not null,
Return_date Date not null,
IsOnline Char(1) not null,
Return_reason varchar(1024) not null,
foreign key (Customer_ID) references Customer(Customer_ID)
);

Create Table Face_to_face_returns(
Return_ID Decimal(12) not null primary key,
foreign key (Return_ID) references Returns(Return_ID)
);

Create Table Online_returns(
Return_ID Decimal(12) not null primary key,
foreign key (Return_ID) references Returns(Return_ID)
);

Create Table Distributor(
Distributor_ID Decimal(2) not null primary key,
Distributor_name varchar(255) not null
);
Create Table Product(
Product_ID Decimal(12) not null primary key,
Store_ID Decimal(2) not null,
Product_name varchar (255) not null,
Product_description varchar (1024) not null,
Return_ID Decimal(12) not null,
Transaction_ID Decimal(20) not null,
Distributor_ID Decimal(2) not null,
Sale_date Date
foreign key (Store_ID) references Store_location(Store_ID),
foreign key (Return_ID) references Returns(Return_ID),
foreign key (Distributor_ID) references Distributor(Distributor_ID)
);

Create Table Shipping_supply(
Product_ID Decimal(12) not null primary key,
foreign key (Product_ID) references Product(Product_ID),
);

Create Table Office_supply(
Product_ID Decimal(12) not null primary key,
foreign key (Product_ID) references Product(Product_ID),
);

Create Table Printing_supply(
Product_ID Decimal(12) not null primary key,
foreign key (Product_ID) references Product(Product_ID),
);



Create Table Customer_product(
Product_ID Decimal(12) not null,
Customer_ID Decimal(2) not null,
Quantity Decimal(5) not null,
foreign key (Product_ID) references Product(Product_ID),
foreign key (Customer_ID) references Customer(Customer_ID)
);



Create Table Purchase(
Purchase_ID Decimal(12) not null primary key,
Customer_ID Decimal(2) not null,
Total_price Decimal(7,2) not null,
Purchase_date Date not null,
IsOnline Char(1) not null
foreign key (Customer_ID) references Customer(Customer_ID)
);

Create Table Face_to_face(
Purchase_ID Decimal(12) not null primary key,
foreign key (Purchase_ID) references Purchase(Purchase_ID)
);

Create Table Online(
Purchase_ID Decimal(12) not null primary key,
foreign key (Purchase_ID) references Purchase(Purchase_ID)
);



--SEQUENCES
--Replace this with your sequence creations.

Create sequence Store_ID_seq start with 1;
Create sequence Store_address_ID_seq start with 1;
--Create sequence Store_State_ID_seq start with 1;
Create sequence Product_ID_seq start with 1;
Create sequence Distributor_ID_seq start with 1;
Create sequence Customer_ID_seq start with 1;
Create sequence Address_ID_seq start with 1;
Create sequence Purchase_ID_seq start with 1;
Create sequence Return_ID_seq start with 1;

--insertaion

--inserting the store states. Note: I am only interested in the following states, not all. 

insert into Store_State (Store_State_code,Store_State) values ('AL','Alabama');
insert into Store_State (Store_State_code,Store_State) values ('AK','Alaska');
insert into Store_State (Store_State_code,Store_State) values ('AS','American Samoa');
insert into Store_State (Store_State_code,Store_State) values ('FL','Florida');
insert into Store_State (Store_State_code,Store_State) values ('GA','Georgia');
insert into Store_State (Store_State_code,Store_State) values ('GU','Guam');
insert into Store_State (Store_State_code,Store_State) values ('HI','Hawaii');
insert into Store_State (Store_State_code,Store_State) values ('ID','Idaho');
insert into Store_State (Store_State_code,Store_State) values ('IL','Illinois');
insert into Store_State (Store_State_code,Store_State) values ('IN','Indiana');
insert into Store_State (Store_State_code,Store_State) values ('IA','Iowa');
insert into Store_State (Store_State_code,Store_State) values ('KS','Kansas');
insert into Store_State (Store_State_code,Store_State) values ('KY','Kentucky');
insert into Store_State (Store_State_code,Store_State) values ('LA','Louisiana');
insert into Store_State (Store_State_code,Store_State) values ('ME','Maine');
insert into Store_State (Store_State_code,Store_State) values ('MH','Marshall Islands');
insert into Store_State (Store_State_code,Store_State) values ('MD','Maryland');
insert into Store_State (Store_State_code,Store_State) values ('MA','Massachusetts');
insert into Store_State (Store_State_code,Store_State) values ('MI','Michigan');
insert into Store_State (Store_State_code,Store_State) values ('MN','Minnesota');
insert into Store_State (Store_State_code,Store_State) values ('MS','Mississippi');
insert into Store_State (Store_State_code,Store_State) values ('MO','Missouri');
insert into Store_State (Store_State_code,Store_State) values ('MT','Montana');
insert into Store_State (Store_State_code,Store_State) values ('NE','Nebraska');
insert into Store_State (Store_State_code,Store_State) values ('NV','Nevada');
insert into Store_State (Store_State_code,Store_State) values ('NH','New Hampshire');
insert into Store_State (Store_State_code,Store_State) values ('NJ','New Jersey');
insert into Store_State (Store_State_code,Store_State) values ('NM','New Mexico');
insert into Store_State (Store_State_code,Store_State) values ('NY','New York');
insert into Store_State (Store_State_code,Store_State) values ('NC','North Carolina');
insert into Store_State (Store_State_code,Store_State) values ('ND','North Dakota');
insert into Store_State (Store_State_code,Store_State) values ('PA','Pennsylvania');

-- inserting Store address (Not real addresses)

insert into Store_Address (Store_address_ID,Store_street,Store_city,Store_postal,Store_state_code) values (next value for Store_address_ID_seq, '27 Rocky Freeway', 'Moorestown', 08341, 'NJ')
insert into Store_Address (Store_address_ID,Store_street,Store_city,Store_postal,Store_state_code) values (next value for Store_address_ID_seq, '136-90 86th Dr', 'Jamaica', 11435, 'NY')
insert into Store_Address (Store_address_ID,Store_street,Store_city,Store_postal,Store_state_code) values (next value for Store_address_ID_seq, '277 Cowley Road', 'Norfolk', 87401, 'ME')
insert into Store_Address (Store_address_ID,Store_street,Store_city,Store_postal,Store_state_code) values (next value for Store_address_ID_seq, '30 old parkway', 'Bloomingdale', 98641, 'IL')
insert into Store_Address (Store_address_ID,Store_street,Store_city,Store_postal,Store_state_code) values (next value for Store_address_ID_seq, '109 Princeton Ave', 'Philadephia', 19111, 'PA')
insert into Store_Address (Store_address_ID,Store_street,Store_city,Store_postal,Store_state_code) values (next value for Store_address_ID_seq, '673 First St', 'Jacksonville', 20953, 'FL')

--inserting into Store location table

insert into Store_location(Store_ID,Store_address_ID) values (next value for Store_ID_seq, (select Store_address_ID from Store_Address where Store_city = 'Moorestown'))
insert into Store_location(Store_ID,Store_address_ID) values (next value for Store_ID_seq, (select Store_address_ID from Store_Address where Store_city = 'Jamaica'))
insert into Store_location(Store_ID,Store_address_ID) values (next value for Store_ID_seq, (select Store_address_ID from Store_Address where Store_city = 'Norfolk'))
insert into Store_location(Store_ID,Store_address_ID) values (next value for Store_ID_seq, (select Store_address_ID from Store_Address where Store_city = 'Bloomingdale'))
insert into Store_location(Store_ID,Store_address_ID) values (next value for Store_ID_seq, (select Store_address_ID from Store_Address where Store_city = 'Philadephia'))
insert into Store_location(Store_ID,Store_address_ID) values (next value for Store_ID_seq, (select Store_address_ID from Store_Address where Store_city = 'Jacksonville'))

--inserting Distributors list

insert into Distributor(Distributor_ID, Distributor_name) values (next value for Distributor_ID_seq, 'Bombay incorporation' )
insert into Distributor(Distributor_ID, Distributor_name) values (next value for Distributor_ID_seq, 'Wright brothers incorporation' )
insert into Distributor(Distributor_ID, Distributor_name) values (next value for Distributor_ID_seq, 'The shippers corporation' )
insert into Distributor(Distributor_ID, Distributor_name) values (next value for Distributor_ID_seq, 'Ink producer' )
insert into Distributor(Distributor_ID, Distributor_name) values (next value for Distributor_ID_seq, 'The office guys' )
-- inserting into Customer table

insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Steven','King', 3474769076)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Ernest','Burn', 9178760076)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'John','Smith', 9173456784)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Marry','Palen', 2154530967)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Michelle','Obama', 3476510098)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Kyle','Walker', 2150098065)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Jake','Arron', 9178939261)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Mohammad','Salah', 9171230004)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Sadio','Mane', 2150061123)
insert into Customer(Customer_ID,First_name,Last_name,Phone_number) values(next value for Customer_ID_seq, 'Kylian','Mbappe', 3478960071)

-- inserting into Returns 

insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Marry'),'Duct tape','03-MAR-2021','y','Product not working')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Sadio'),'Ink Curtridge','31-OCT-2021','n','INK cartridge does not fit')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Kyle'),'Gel pens','13-JUN-2022','n','Pen ink dried up')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Steven'),'Stapler','21-AUG-2022','n','Stapler broke easily')


-- inserting into Purchase 

insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Sadio'), 20, '05-OCT-2022', 'y')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Mohammad'), 33.1, '04-OCT-2022', 'y')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Steven'), 102, '01-OCT-2022', 'n')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Kyle'), 11, '30-SEP-2022', 'n')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Marry'), 50, '28-SEP-2022', 'n')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Ernest'), 62, '21-SEP-2022', 'y')

select * from Purchase
select * from Face_to_face
select * from Online

insert into Face_to_face(Purchase_ID) values (1)
insert into Face_to_face(Purchase_ID) values (2)
insert into Face_to_face(Purchase_ID) values (6)

insert into Online(Purchase_ID) values (3)
insert into Online(Purchase_ID) values (4)
insert into Online(Purchase_ID) values (5)

insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Duct tape'),(select Customer_ID from Customer where first_name = 'John'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Ink Curtridge'),(select Customer_ID from Customer where first_name = 'Sadio'), 3 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Stapler'),(select Customer_ID from Customer where first_name = 'Marry'), 1 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Sticky notes'),(select Customer_ID from Customer where first_name = 'Ernest'), 11 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Gel pens'),(select Customer_ID from Customer where first_name = 'Jake'), 6 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Brothers model34 printer ink'),(select Customer_ID from Customer where first_name = 'Kyle'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Duct tape'),(select Customer_ID from Customer where first_name = 'Michelle'), 15 )



-- procedures

Create or Alter Procedure In_person_returns 
@Return_ID Decimal(12),@Customer_ID Decimal(2),@Product_name varchar(255),
@Return_date Date, @IsOnline Char(1), @Return_reason varchar(1024)
as
begin
	Insert Into Returns(Return_ID,Customer_ID,Product_name,Return_date,IsOnline,Return_reason)
	values(@Return_ID, @Customer_ID, @Product_name,@Return_date, @IsOnline , @Return_reason);

	insert into Face_to_face_returns(Return_ID)
	values(@Return_ID);
end;
go

begin transaction In_person_returns;
execute In_person_returns 5,2, 'Gel pens','01-FEB-2019','n','Product defective'
commit transaction In_person_returns

begin transaction In_person_returns;
execute In_person_returns 9,6, 'Sticky notes','01-JUL-2022','n','Product defective'
commit transaction In_person_returns


begin transaction In_person_returns;
execute In_person_returns 6,5, 'Duct tape','31-OCT-2022','n','Product not strong enough'
commit transaction In_person_returns


Create or Alter Procedure Online_returns_list
@Return_ID Decimal(12),@Customer_ID Decimal(2),@Product_name varchar(255),
@Return_date Date, @IsOnline Char(1), @Return_reason varchar(1024)
as
begin
	Insert Into Returns(Return_ID,Customer_ID,Product_name,Return_date,IsOnline,Return_reason)
	values(@Return_ID, @Customer_ID, @Product_name,@Return_date, @IsOnline , @Return_reason);

	insert into Online_returns(Return_ID)
	values(@Return_ID);
end;
go

begin transaction Online_returns_list;
execute Online_returns_list 7,10, 'Ink Curtridge','20-AUG-2022','y','Product arrived late'
commit transaction Online_returns_list

begin transaction Online_returns_list;
execute Online_returns_list 8,8, 'Stapler','03-NOV-2021','y','Product was damaged'
commit transaction Online_returns_list

Create or Alter Procedure Add_shipping_product 
@Product_ID Decimal(12),@Store_ID Decimal(2),@Product_name varchar(255),
@Product_description varchar(1024), @Return_ID Decimal(12),@Transaction_ID Decimal(20),@Distributor_ID Decimal(2),
@Sale_date Date
as
begin
	Insert Into Product(Product_ID,Store_ID,Product_name,Product_description,Return_ID,Transaction_ID,Distributor_ID,Sale_date)
	values(@Product_ID, @Store_ID, @Product_name,@Product_description, @Return_ID, @Transaction_ID,@Distributor_ID, @Sale_date);

	insert into Shipping_supply(Product_ID)
	values(@Product_ID);
end;
go

begin transaction Add_shipping_product ;
execute Add_shipping_product  1, 1, 'Duct tape', 'Clear duct tape',1,1,2,'04-DEC-2021';
commit transaction Add_shipping_product 

begin transaction Add_shipping_product ;
execute Add_shipping_product  2, 2, 'Ink Curtridge', 'Ink for HP printer',2,2,2,'14-MAY-2021';
commit transaction Add_shipping_product 

begin transaction Add_shipping_product ;
execute Add_shipping_product  3, 2, 'Brothers model34 printer ink', 'Ink for HP printer',7,3,1,'14-MAY-2021';
commit transaction Add_shipping_product 

Create or Alter Procedure Add_Printing_product 
@Product_ID Decimal(12),@Store_ID Decimal(2),@Product_name varchar(255),
@Product_description varchar(1024), @Return_ID Decimal(12),@Transaction_ID Decimal(20),@Distributor_ID Decimal(2),
@Sale_date Date
as
begin
	Insert Into Product(Product_ID,Store_ID,Product_name,Product_description,Return_ID,Transaction_ID,Distributor_ID,Sale_date)
	values(@Product_ID, @Store_ID, @Product_name,@Product_description, @Return_ID, @Transaction_ID,@Distributor_ID, @Sale_date);

	insert into Printing_supply(Product_ID)
	values(@Product_ID);
end;
go



Create or Alter Procedure Add_Office_product 
@Product_ID Decimal(12),@Store_ID Decimal(2),@Product_name varchar(255),
@Product_description varchar(1024), @Return_ID Decimal(12),@Transaction_ID Decimal(20),@Distributor_ID Decimal(2),
@Sale_date Date
as
begin
	Insert Into Product(Product_ID,Store_ID,Product_name,Product_description,Return_ID,Transaction_ID,Distributor_ID,Sale_date)
	values(@Product_ID, @Store_ID, @Product_name,@Product_description, @Return_ID, @Transaction_ID,@Distributor_ID, @Sale_date);

	insert into Printing_supply(Product_ID)
	values(@Product_ID);
end;
go

begin transaction Add_Office_product ;
execute Add_Office_product  4, 3, 'Stapler', 'Blue large stapler',4,4,3,'09-JAN-2022';
commit transaction Add_Office_product 

begin transaction Add_Office_product ;
execute Add_Office_product  5, 1, 'Gel pens', 'Black pens',3,4,4,'20-JUN-2022';
commit transaction Add_Office_product 

begin transaction Add_Office_product ;
execute Add_Office_product  6, 5, 'Sticky notes', 'Yellow sticky notes',9,5,3,'21-NOV-2020';
commit transaction Add_Office_product 

select * from Store_Address
select * from Store_location
select * from Distributor
select * from Product
select * from Customer
select * from Customer_product
select * from Returns
select * from Purchase




