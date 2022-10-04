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
Insert into Person(person_id,first_name,last_name,username)
values( @current_person_seq, 'Mahim', 'Choudhury', 'mahcho');
DECLARE @current_post_seq INT = NEXT VALUE FOR post_seq;
INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(@current_post_seq,@current_person_seq,'Good morning all.',Cast('15-APR-2016' as Date),'Good Morni...');
DECLARE @current_likes_seq INT = NEXT VALUE FOR likes_seq;
INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
VALUES(@current_likes_seq,@current_person_seq,@current_post_seq,Cast('16-APR-2016' as Date));



Insert into Person(person_id,first_name,last_name,username)
values( next value for person_seq, 'John', 'Smith', 'Jsmith');
--INSERT INTO Post (post_id,person_id,content,created_on,summary)
--VALUES( NEXT VALUE FOR post_seq,next value for person_seq,'How are you all?',Cast('29-JUN-2016' as Date),'How are...');
--INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
--VALUES(NEXT VALUE FOR likes_seq,next value for person_seq, NEXT VALUE FOR post_seq,Cast('29-JUN-2016' as Date));


Insert into Person(person_id,first_name,last_name,username)
values( next value for person_seq, 'Jake', 'locks', 'Jlocks');
Insert into Person(person_id,first_name,last_name,username)
values( next value for person_seq, 'Chris', 'Fink', 'Cfink');
Insert into Person(person_id,first_name,last_name,username)
values( next value for person_seq, 'Joe', 'Frank', 'Jfrank');


INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'John'),'How are you all?',Cast('29-JUN-2016' as Date),'How are...');
INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
VALUES(NEXT VALUE FOR likes_seq,(select person_id from Person where first_name = 'Mahim'),(select post_id from Post where summary = 'How are...'),Cast('29-JUN-2016' as Date));


INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'Jake'),'Going on a vacation.',Cast('01-DEC-2016' as Date),'Going o...');
INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
VALUES(NEXT VALUE FOR likes_seq,(select person_id from Person where first_name = 'John'),(select post_id from Post where summary = 'Going o...'),Cast('02-DEC-2016' as Date));


INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'Chris'),'Finessing the whole day with fifa 23',Cast('02-MAR-2017' as Date),'Finessi...');
INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
VALUES(NEXT VALUE FOR likes_seq,(select person_id from Person where first_name = 'Joe'),(select post_id from Post where summary = 'Finessi...'),Cast('02-MAR-2017' as Date));

INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'Joe'),'Cannot wait for this summer!',Cast('02-MAR-2017' as Date),'Cannot ...');
INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'Mahim'),'I am gradutaing soon!',Cast('05-MAY-2017' as Date),'I am gr...');
INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'Jake'),'Enjoy the summer everyone.',Cast('06-JUN-2017' as Date),'Enjoy t...');
INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(NEXT VALUE FOR post_seq,(select person_id from Person where first_name = 'John'),'Here comes the fall!',Cast('18-AUG-2017' as Date),'Here co...');



CREATE PROCEDURE add_michelle_stella
as
begin
	insert into Person(person_id,first_name,last_name,username)
	values(next value for person_seq, 'Michelle', 'Stella', 'Mstella')
end;

execute add_michelle_stella;



CREATE PROCEDURE add_person
@person_id decimal(12),
@first_name varchar(32),
@last_name varchar(32),
@username varchar(20)
as
begin
	insert into Person(person_id,first_name,last_name,username)
	values(@person_id, @first_name, @last_name, @username)
end;

execute add_person 7 , 'Jacob', 'Anson', 'Janson';

CREATE PROCEDURE add_post
@post_id decimal(12),
@person_id decimal(12),
@content varchar(255),
@created_on date
as
begin
	declare @summary varchar(13);
	set @summary = SUBSTRING(@content, 1, 10);
	insert into Post(post_id,person_id,content,created_on,summary)
	values(@post_id, @person_id, @content, @created_on,@summary)
end;

execute add_post 9, 4, 'I am new to facebook', '03-JAN-2018';


CREATE or ALTER PROCEDURE add_like
@likes_id decimal(12),
--@username varchar(20),
@person_id decimal(12),
@post_id decimal(12),
@liked_on date
as
begin
	--declare @a_username varchar(20);
	declare @a_person_id decimal(12);
	select @a_person_id= @person_id from Person where username = 'Jsmith'
	--select @a_username = @username from Person where person_id = 2;
	insert into Likes(likes_id,person_id,post_id,liked_on)
	values(@likes_id, @a_person_id, @post_id, @liked_on)
end;

execute add_like 5, 2, 6, '01-JUL-2017';



create or alter trigger invalid_summary_trg
on Post After insert, update
as
begin
	declare @a_summary varchar(13);
	set @a_summary= (select INSERTED.summary from INSERTED);

	if LEN(@a_summary) < 10
	begin
		rollback;
		raiserror('Post summary cannot be less than 10 charecters',-1,1);
	end;
end;

INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(10,7,'Today is Monday',Cast('20-FEB-2019' as Date),'Today i...');

INSERT INTO Post (post_id,person_id,content,created_on,summary)
VALUES(11,6,'Yesterday was Friday and it was also holiday',Cast('27-NOV-20120' as Date),'Ye...');
select * from Post;

create or alter trigger invalid_like_trg
on Likes After insert, update
as
begin
	declare @a_liked_on date;
	declare @a_created_on date;
	select @a_liked_on=inserted.liked_on, @a_created_on= Post.created_on from Post
	join
	inserted on inserted.likes_id = Post.post_id;

	if cast(@a_liked_on as date) < cast(@a_created_on as date)
	begin
		rollback;
		raiserror('Post cannot be liked in a prior date',-1,1);
	end;
end;

INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
VALUES(6,2,3,Cast('03-DEC-2020' as Date));

INSERT INTO Likes(likes_id,person_id,post_id,liked_on)
VALUES(7,3,4,Cast('01-JAN-2017' as Date));
select * from Likes;


select * from Person;
select * from Post;

create table post_content_history(
post_id Decimal(12) not null,
--person_id Decimal(12) not null,
old_content varchar(255) not null,
new_content varchar(255) not null,
changed_on Date not null,
--summary varchar(13) not null,
foreign key (post_id) references Post(post_id),
--foreign key (person_id) references Person(person_id)
);

create or alter trigger post_his_trg
on Post after update
as
begin
	declare @a_old_content varchar(255) = (select content from Deleted);
	declare @a_new_content varchar(255) = (select content from inserted);
	declare @a_post_id decimal(12) = (select post_id from inserted);

	if @a_old_content <> @a_new_content
	begin
		insert into post_content_history(post_id,old_content,new_content,changed_on)
		values(@a_post_id,@a_old_content,@a_new_content,GETDATE());
	end;
end;

UPDATE Post 
SET content='Hi this is 2022 welcome' WHERE Post.post_id = 3;

select * from Post;
select * from post_content_history;