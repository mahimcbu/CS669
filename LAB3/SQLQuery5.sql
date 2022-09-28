--lab3


Create table Location(
location_id decimal(12) not null primary key,
location_name varchar(64) not null
);

Create table Dig_site(
dig_site_id decimal(12) not null primary key,
location_id decimal(12) not null,
dig_name varchar(32) not null,
dig_cost decimal(8,2) null,
foreign key (location_id) references Location(location_id)
);

Create table Paleontologist(
paleontolgist_id decimal(12) not null primary key,
first_name varchar(32) not null,
last_name varchar(32) not null

);

Create table Dinosaur_discovery(
dinosaur_discovery_id decimal(12) not null primary key,
dig_site_id decimal(12) not null,
paleontolgist_id decimal(12) not null,
common_name varchar(64) not null,
fossil_weight decimal(6) not null,
foreign key (dig_site_id) references Dig_site(dig_site_id),
foreign key (paleontolgist_id) references Paleontologist(paleontolgist_id)
);


--Dig location

insert into Location(location_id,location_name)
values (1,'Stonesfield');
insert into Location(location_id,location_name)
values (2,'Utah');
insert into Location(location_id,location_name)
values (3,'Arizona');
insert into Location(location_id,location_name)
values (4,'Brazil');

--Dig Site
insert into Dig_site(dig_site_id,location_id,dig_name,dig_cost)
values (101,1,'Great British Dig', 8000.00 );
insert into Dig_site(dig_site_id,location_id,dig_name,dig_cost)
values (102,2,'Parowan Dinosaur Tracks', 10000.00 );
insert into Dig_site(dig_site_id,location_id,dig_name,dig_cost)
values (103,3,'Dynamic Dessert Dig', 3500.00 );
insert into Dig_site(dig_site_id,location_id,dig_name,dig_cost)
values (104,1,'Mission Jurasic Dig', null );
insert into Dig_site(dig_site_id,location_id,dig_name,dig_cost)
values (105,1,'Ancient Site Dig', 5500.00 );
insert into Dig_site(dig_site_id,location_id,dig_name,dig_cost)
values (106,4,'Dino Digger', 6500.00 );

-- Paleontologist
insert into Paleontologist(paleontolgist_id,first_name,last_name)
values (11,'William', 'Buckland' );
insert into Paleontologist(paleontolgist_id,first_name,last_name)
values (12,'John', 'Ostrom' );
insert into Paleontologist(paleontolgist_id,first_name,last_name)
values (13,'Henry', 'Osborn' );


-- Dinosaur_discovery
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1001,101,11,'Megalosaurus', 3000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1002,101,11,'Apatosaurus', 4000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1003,101,11,'Triceratops', 4500 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1004,101,11,'Stegosaurus', 3500 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1005,102,12,'Parasaurolophus', 6000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1006,102,12,'Tyrannosaurus Rex', 5000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1007,102,12,'Velociraptor', 7000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1008,103,12,'Tyrannosaurus Rex', 6000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1009,104,13,'Spinosaurus', 8000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1010,104,13,'Diplodocus', 9000 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1011,105,13,'Tyrannosaurus Rex', 7500 );
insert into Dinosaur_discovery(dinosaur_discovery_id,dig_site_id,paleontolgist_id,common_name,fossil_weight)
values (1012,106,13,'Velociraptor', 4500 );


select * from Dinosaur_discovery;
select * from Paleontologist;
select * from Dig_site;
select * from Location;


select Location.location_id,location_name, Dig_site.dig_site_id, dig_name, dig_cost, common_name,fossil_weight, Paleontologist.paleontolgist_id,first_name,last_name from Location 
right Join Dig_site on Location.location_id = Dig_site.location_id
right Join Dinosaur_discovery on Dinosaur_discovery.dig_site_id = Dig_site.dig_site_id
right Join Paleontologist on Paleontologist.paleontolgist_id = Dinosaur_discovery.paleontolgist_id


select count(*) as above_4200_pounds
from Dinosaur_discovery where fossil_weight >= 4200;

select format(min(dig_cost), '$.00') as least_expensive, format(max(dig_cost), '$.00') as most_expensive from Dig_site;

select dig_name,dig_cost, COUNT(*) as nr_dinosaurs from Dig_site 
join Dinosaur_discovery on Dig_site.dig_site_id = Dinosaur_discovery.dig_site_id
group by Dig_Site.dig_cost, dig_name;

select location_name, COUNT(Location.location_id) as nr_dinosaurs from Dig_site 
Join Location on Dig_site.location_id = Location.location_id
join Dinosaur_discovery on Dinosaur_discovery.dig_site_id = Dig_site.dig_site_id
group by location_name 
having (COUNT(Location.location_id)) >= 6;


select dig_name, sum(Dinosaur_discovery.fossil_weight) as total_weight_above_15000 from Dig_site
join Dinosaur_discovery on Dig_site.dig_site_id = Dinosaur_discovery.dig_site_id
group by dig_name
having (sum(Dinosaur_discovery.fossil_weight) >= 15000);

Select first_name, last_name,location_name, count(Dig_site.dig_site_id) as nr_digsites from Paleontologist 
join Dinosaur_discovery on Dinosaur_discovery.paleontolgist_id = Paleontologist.paleontolgist_id
join Dig_site on Dig_site.dig_site_id = Dinosaur_discovery.dig_site_id
join Location on Location.location_id = Dig_site.location_id
where Location.location_id = 1
group by first_name,last_name,location_name
order by  count(Dig_site.dig_site_id) desc;

select location_name,fossil_weight from Location 
join Dig_site on Dig_site.location_id = Location.location_id
join Dinosaur_discovery on Dig_site.dig_site_id = Dinosaur_discovery.dig_site_id
group by location_name,fossil_weight;
