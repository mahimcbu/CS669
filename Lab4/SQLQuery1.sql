--lab4

Create table Person(
person_id Decimal(12) not null primary key,
first_name varchar(32) not null,
last_name varchar(32) not null,
username varchar(20) not null
);

Create table Post (
post_id Decimal(12) not null primary key,
person_id Decimal(12) not null,
content varchar(255) not null,
created_on Date not null,
summary varchar(13) not null,
foreign key (person_id) references Person(person_id)
);

Create table Likes(
likes_id Decimal(12) not null primary key,
person_id Decimal(12) not null,
post_id Decimal(12) not null,
liked_on Date
foreign key (person_id) references Person(person_id),
foreign key (post_id) references Post(post_id)
);

CREATE SEQUENCE person_seq START WITH 1; 
CREATE SEQUENCE post_seq START WITH 1; 
CREATE SEQUENCE likes_seq START WITH 1; 

DECLARE @current_person_seq INT = NEXT VALUE FOR person_seq; 
Insert into Person values( @current_person_seq, 'Mahim', 'Choudhury', 'mahcho');
DECLARE @current_post_seq INT = NEXT VALUE FOR post_seq;
INSERT INTO Post VALUES(@current_post_seq,@current_person_seq,'Good morning all.',Cast('15-APR-2016' as Date),'Good Morni...');
DECLARE @current_likes_seq INT = NEXT VALUE FOR likes_seq;
INSERT INTO Likes VALUES(@current_likes_seq,@current_person_seq,@current_post_seq,Cast('15-APR-2016' as Date));
delete from Person where person_id = 2 ;


select * from Person;
select * from Post;
select * from Likes;