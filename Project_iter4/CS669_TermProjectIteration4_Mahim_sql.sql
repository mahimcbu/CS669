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
Drop sequence Store_ID_seq;
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
Store_state_ID Decimal(2) not null primary key,
Store_state varchar(255) not null
);

Create Table Store_Address(
Store_address_ID Decimal(2) not null primary key,
Store_street varchar(255) not null,
Store_city varchar (255) not null,
Store_postal decimal(5) not null,
Store_state_ID decimal(2) not null
foreign key (Store_state_ID) references Store_State(Store_state_ID)
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


Create Table Product(
Product_ID Decimal(12) not null primary key,
Store_ID Decimal(2) not null,
Product_name varchar (255) not null,
Product_description varchar (1024) not null,
Return_ID Decimal(12) not null,
foreign key (Store_ID) references Store_location(Store_ID),
foreign key (Return_ID) references Returns(Return_ID)
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

Create Table Distributor(
Distributor_ID Decimal(2) not null primary key,
Distributor_name varchar(255) not null
);

Create Table Customer_product(
Product_ID Decimal(12) not null,
Customer_ID Decimal(2) not null,
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
Create sequence Store_State_ID_seq start with 1;
Create sequence Product_ID_seq start with 1;
Create sequence Distributor_ID_seq start with 1;
Create sequence Customer_ID_seq start with 1;
Create sequence Address_ID_seq start with 1;
Create sequence Purchase_ID_seq start with 1;
Create sequence Return_ID_seq start with 1;

