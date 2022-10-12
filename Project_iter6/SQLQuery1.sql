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

-- index
create Index Add_Statecode
on Store_Address(Store_state_code)

Create Table Store_location(
Store_ID Decimal(2) not null primary key,
Store_address_ID Decimal(2) not null
foreign key (Store_address_ID) references Store_Address(Store_address_ID)
);

-- index
create unique Index Add_Store_add
on Store_location(Store_address_ID)


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

-- index
create unique Index Add_Customer_ID
on Address(Customer_ID)


Create Table Returns(
Return_ID Decimal(12) not null primary key,
Customer_ID Decimal(2) not null,
Product_name varchar(255) not null,
Return_date Date not null,
IsOnline Char(1) not null,
Return_reason varchar(1024) not null,
foreign key (Customer_ID) references Customer(Customer_ID) 
);
--index
create Index Add_Customer_ID
on Returns(Customer_ID)


Create Table Face_to_face_returns(
Return_ID Decimal(12) not null primary key,
foreign key (Return_ID) references Returns(Return_ID)
);

-- index
create unique Index Add_Face_to_face_returns
on Face_to_face_returns(Return_ID)

Create Table Online_returns(
Return_ID Decimal(12) not null primary key,
foreign key (Return_ID) references Returns(Return_ID)
);

-- index
create unique Index Add_Online_returns
on Online_returns(Return_ID)

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

-- index
create Index Add_Product_Store
on Product(Store_ID)
create Index Add_Product_Ret
on Product(Return_ID)
create Index Add_Product_Dis
on Product(Distributor_ID)

Create Table Shipping_supply(
Product_ID Decimal(12) not null primary key,
foreign key (Product_ID) references Product(Product_ID),
);

-- index
create Index Add_Shipping_supply
on Shipping_supply(Product_ID)

Create Table Office_supply(
Product_ID Decimal(12) not null primary key,
foreign key (Product_ID) references Product(Product_ID),
);

-- index
create Index Add_Office_supply
on Office_supply(Product_ID)

Create Table Printing_supply(
Product_ID Decimal(12) not null primary key,
foreign key (Product_ID) references Product(Product_ID),
);

-- index
create Index Add_Printing_supply
on Printing_supply(Product_ID)


Create Table Customer_product(
Product_ID Decimal(12) not null,
Customer_ID Decimal(2) not null,
Quantity Decimal(5) not null,
foreign key (Product_ID) references Product(Product_ID),
foreign key (Customer_ID) references Customer(Customer_ID)
);

-- index
create Index Add_Customer_product
on Customer_product(Product_ID)
create Index Add_Customer_product_Customer_ID
on Customer_product(Customer_ID)

Create Table Purchase(
Purchase_ID Decimal(12) not null primary key,
Customer_ID Decimal(2) not null,
Total_price Decimal(7,2) not null,
Purchase_date Date not null,
IsOnline Char(1) not null
foreign key (Customer_ID) references Customer(Customer_ID)
);

-- index
create Index Add_Purchase
on Purchase(Customer_ID)

Create Table Face_to_face(
Purchase_ID Decimal(12) not null primary key,
foreign key (Purchase_ID) references Purchase(Purchase_ID)
);

Create Table Online(
Purchase_ID Decimal(12) not null primary key,
foreign key (Purchase_ID) references Purchase(Purchase_ID)
);

-- index
create Index Add_Face_to_face
on Face_to_face(Purchase_ID)
create Index Add_Online
on Online(Purchase_ID)



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
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Sadio'),'10x10 paper box','31-OCT-2021','n','product does not fit')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Kyle'),'Gel pens','13-JUN-2022','n','Pen ink dried up')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Steven'),'Stapler','21-AUG-2022','n','Stapler broke easily')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Ernest'),'Hazard label','30-SEP-2021','n','Not needed anymore')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Kylian'),'Laser Ink Cartridge','02-JUL-2022','n','Ink not strong enough')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Jake'),'Printing paper','22-NOV-2021','y','Paper is not white enough')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Kyle'),'10x10 paper box ','19-JAN-2022','y','Box broke apart')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'John'),'Sticky notes ','01-OCT-2022','y','Glue is weak')
insert into Returns(Return_ID, Customer_ID,Product_name,Return_date,IsOnline,Return_reason) 
values(next value for Return_ID_seq, (select Customer_ID from Customer where first_name = 'Steven'),'Hp printer ','28-JUN-2022','y','Printer dones not print both sides')



insert into Face_to_face_returns(Return_ID)
values(2);
insert into Face_to_face_returns(Return_ID)
values(3);
insert into Face_to_face_returns(Return_ID)
values(4);
insert into Face_to_face_returns(Return_ID)
values(5);
insert into Face_to_face_returns(Return_ID)
values(6);
insert into Face_to_face_returns(Return_ID)
values(7);
insert into Face_to_face_returns(Return_ID)
values(10);
insert into Face_to_face_returns(Return_ID)
values(8);
insert into Face_to_face_returns(Return_ID)
values(1);
insert into Face_to_face_returns(Return_ID)
values(9);

insert into Online_returns(Return_ID)
values(1);
insert into Online_returns(Return_ID)
values(7);
insert into Online_returns(Return_ID)
values(8);
insert into Online_returns(Return_ID)
values(9);
insert into Online_returns(Return_ID)
values(10);

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
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Kylian'), 62, '02-MAR-2022', 'y')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Jake'), 20, '11-JUN-2021', 'n')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'John'), 10, '14-DEC-2020', 'n')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Mohammad'), 8, '23-OCT-2019', 'n')
insert into Purchase(Purchase_ID, Customer_ID,Total_price,Purchase_date,IsOnline)
values(next value for Purchase_ID_seq, (select Customer_ID from Customer where First_name = 'Steven'), 31, '27-FEB-2022', 'y')


insert into Face_to_face(Purchase_ID) values (3)
insert into Face_to_face(Purchase_ID) values (4)
insert into Face_to_face(Purchase_ID) values (5)
insert into Face_to_face(Purchase_ID) values (8)
insert into Face_to_face(Purchase_ID) values (9)
insert into Face_to_face(Purchase_ID) values (10)

insert into Online(Purchase_ID) values (1)
insert into Online(Purchase_ID) values (2)
insert into Online(Purchase_ID) values (6)
insert into Online(Purchase_ID) values (7)
insert into Online(Purchase_ID) values (11)


-- procedures

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
execute Add_shipping_product  2, 2, '10x10 paper box', 'standar shipping box',2,2,2,'14-MAY-2021';
commit transaction Add_shipping_product 

begin transaction Add_shipping_product ;
execute Add_shipping_product  3, 2, 'Hazard label', 'Stick it into the hazardaous box',7,3,1,'14-MAY-2021';
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


begin transaction Add_Printing_product ;
execute Add_Printing_product  9, 3, 'Printing paper', '500 papers white for printing',8,8,4,'29-MAY-2022';
commit transaction Add_Printing_product 


begin transaction Add_Printing_product ;
execute Add_Printing_product  10, 4, 'Laser Ink Cartridge', 'Ink that never dies',9,9,2,'22-MAR-2022';
commit transaction Add_Printing_product 

begin transaction Add_Printing_product ;
execute Add_Printing_product  11, 1, 'HP printer', 'wireless printer',10,10,5,'10-MAR-2022';
commit transaction Add_Printing_product 



Create or Alter Procedure Add_Office_product 
@Product_ID Decimal(12),@Store_ID Decimal(2),@Product_name varchar(255),
@Product_description varchar(1024), @Return_ID Decimal(12),@Transaction_ID Decimal(20),@Distributor_ID Decimal(2),
@Sale_date Date
as
begin
	Insert Into Product(Product_ID,Store_ID,Product_name,Product_description,Return_ID,Transaction_ID,Distributor_ID,Sale_date)
	values(@Product_ID, @Store_ID, @Product_name,@Product_description, @Return_ID, @Transaction_ID,@Distributor_ID, @Sale_date);

	insert into Office_supply(Product_ID)
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

begin transaction Add_Office_product ;
execute Add_Office_product  7, 1, 'Stapler', 'Stapler',4,6,4,'18-SEP-2022';
commit transaction Add_Office_product 

begin transaction Add_Office_product ;
execute Add_Office_product  8, 2,  'Gel pens', 'Blue pens',3,7,1,'03-AUG-2022';
commit transaction Add_Office_product 




-- inserting into customer_product table 

insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Duct tape'),(select Customer_ID from Customer where first_name = 'John'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = '10x10 paper box'),(select Customer_ID from Customer where first_name = 'Sadio'), 3 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Stapler'),(select Customer_ID from Customer where first_name = 'Marry'), 1 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Sticky notes'),(select Customer_ID from Customer where first_name = 'Ernest'), 11 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Blue pens'),(select Customer_ID from Customer where first_name = 'Jake'), 6 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Hazard label'),(select Customer_ID from Customer where first_name = 'Kyle'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Duct tape'),(select Customer_ID from Customer where first_name = 'Michelle'), 15 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Black pens'),(select Customer_ID from Customer where first_name = 'Kylian'), 5 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Blue large stapler'),(select Customer_ID from Customer where first_name = 'John'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Black pens'),(select Customer_ID from Customer where first_name = 'Mohammad'), 3 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Duct tape'),(select Customer_ID from Customer where first_name = 'Sadio'), 10 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Sticky notes'),(select Customer_ID from Customer where first_name = 'Steven'), 1 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Printing paper'),(select Customer_ID from Customer where first_name = 'Ernest'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Printing paper'),(select Customer_ID from Customer where first_name = 'Michelle'), 5 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Printing paper'),(select Customer_ID from Customer where first_name = 'Jake'), 1 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Laser Ink Cartridge'),(select Customer_ID from Customer where first_name = 'Kyle'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Printing paper'),(select Customer_ID from Customer where first_name = 'Marry'), 1 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Printing paper'),(select Customer_ID from Customer where first_name = 'Kylian'), 5 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Black pens'),(select Customer_ID from Customer where first_name = 'Sadio'), 2 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = 'Hazard label'),(select Customer_ID from Customer where first_name = 'John'), 4 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_name = '10x10 paper box'),(select Customer_ID from Customer where first_name = 'Kyle'), 10 )
insert into Customer_product(Product_ID,Customer_ID,Quantity)
values((select Product_ID from Product where Product_description = 'Stapler'),(select Customer_ID from Customer where first_name = 'Mohammad'), 5 )




--questions

--Find out how many shipping supplies have been sold prior to last 12 months and list the names of the customer’s name and their phone number.

select Product.Product_name,Customer.First_name,Customer.Last_name, Customer.Phone_number, Purchase_date,Quantity from Product
join Shipping_supply on Shipping_supply.Product_ID = Product.Product_ID
join Customer_product on Customer_product.Product_ID = Product.Product_ID
join Customer on Customer_product.Customer_ID = Customer.Customer_ID
join Purchase on Purchase.Customer_ID =Customer.Customer_ID
where Purchase_date > dateadd(m, -12, GETDATE()) 
order by Quantity asc

-- index
create Index Add_Purchase_Date
on Purchase(Purchase_date)





--what stores have sold how many products and of those, which ones were sold online? 
--Also, find out store state and address so it can be used for analysis i.e. what products are popular in what state..
create or alter view Store_performance as
	select Store_location.Store_ID, count(*) as nr_sold_online from Store_location
	join Product on Product.Store_ID = Store_location.Store_ID
	join Customer_product on Customer_product.Product_ID = Product.Product_ID
	join Purchase on Purchase.Customer_ID = Customer_product.Customer_ID
	join Online on Online.Purchase_ID = Purchase.Purchase_ID
	--join Face_to_face on Face_to_face.Purchase_ID = Purchase.Purchase_ID
	where Purchase.IsOnline = 'y'
	group by Store_location.Store_ID;

--index
create Index Add_IsOnline
on Purchase(IsOnline)

select Store_Address.Store_street, Store_State.Store_state, Store_performance.Store_ID,count(Quantity) as total_sold, Store_performance.nr_sold_online from Store_performance
join Store_location on Store_location.Store_ID = Store_performance.Store_ID
join Product on Product.Store_ID = Store_location.Store_ID
join Customer_product on Customer_product.Product_ID = Product.Product_ID
join Store_Address on Store_Address.Store_address_ID = Store_location.Store_address_ID
join Store_State on Store_Address.Store_state_code = Store_State.Store_state_code
group by Store_Address.Store_street, Store_State.Store_state, Store_performance.Store_ID, Store_performance.nr_sold_online



--Find out the names of the distributors whose products have been returned more than twice in the last 11 months that was in-person returns. 


select Distributor.Distributor_name from Distributor
where Distributor.Distributor_ID in
(select Distributor.Distributor_ID from Distributor
join Product on Product.Distributor_ID = Distributor.Distributor_ID
join Returns on Returns.Return_ID = Product.Return_ID
join Face_to_face_returns on Face_to_face_returns.Return_ID = Returns.Return_ID
where Returns.Return_date > dateadd(m, -11, GETDATE())
group by Distributor_name, Distributor.Distributor_ID
having (count(*) ) >= 2) 


-- history table

create table Phone_nr_Change(
Phone_nr_Change_ID Decimal(2) not null,
Customer_ID Decimal(2) not null,
old_Phone_number Decimal(11) not null,
new_Phone_number Decimal(11) not null,
changed_on Date not null,
foreign key (Customer_ID) references Customer(Customer_ID),
);
create sequence Phone_nr_Change_ID_seq start with 1;



create or alter trigger phone_nr_trig
on Customer after update
as
begin
	declare @a_old_Phone_number Decimal(11) = (select Phone_number from Deleted);
	declare @a_new_Phone_number Decimal(11) = (select Phone_number from inserted);
	declare @a_Customer_ID decimal(2) = (select Customer_ID from inserted);

	if @a_old_Phone_number <> @a_new_Phone_number
	begin
		insert into Phone_nr_Change(Phone_nr_Change_ID,Customer_ID,old_Phone_number,new_Phone_number,changed_on)
		values(next value for Phone_nr_Change_ID_seq,@a_Customer_ID,@a_old_Phone_number,@a_new_Phone_number,GETDATE());
	end;
end;

UPDATE Customer 
SET Phone_number=3475932543 WHERE Customer.Customer_ID = 2;
UPDATE Customer 
SET Phone_number=9145690000 WHERE Customer.Customer_ID = 4;
UPDATE Customer 
SET Phone_number=9170903320 WHERE Customer.Customer_ID = 9;

select * from Phone_nr_Change

-- data visualization

select Product_name,Customer_product.Product_ID,sum(Quantity) from Product 
join Customer_product on Customer_product.Product_ID = Product.Product_ID
group by Product_name,Customer_product.Product_ID



select Product_ID,sum(Quantity)  from Customer_product
group by Customer_product.Product_ID
select Product_name,Store_ID from Product 

select Returns.Customer_ID,Returns.Return_ID,Customer.Last_name,Product.Product_name from Returns
join Customer on Customer.Customer_ID = Returns.Return_ID
join Product on Product.Product_name = Returns.Product_name
group by Product.Product_name,Customer.Last_name,Returns.Return_ID,Returns.Customer_ID

select Product.Store_ID,Returns.Product_name, Store_Address.Store_city from Product
join Returns on Returns.Product_name = Product.Product_name
join Store_location on Store_location.Store_ID = Product.Store_ID
join Store_Address on Store_Address.Store_address_ID= Store_location.Store_address_ID
where Returns.IsOnline = 'n'


select* from Store_location
select * from Product
select * from Returns	
select * from Purchase
select * from Distributor
select * from Customer
select * from Returns
select * from Customer_product