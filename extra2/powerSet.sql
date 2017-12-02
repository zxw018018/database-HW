drop table powerSet;

create table powerSet (col1 varchar(10), col2 varchar(10), col3 varchar(10));
insert into powerSet (col1, col2, col3) values(null,null,null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 0,1), null, null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 1,1), null, null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 2,1), null, null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 0,1), (select * from example limit 1,1), null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 0,1), (select * from example limit 2,1), null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 1,1), (select * from example limit 2,1), null);
insert into powerSet (col1, col2, col3) values ( (select * from example limit 0,1), (select * from example limit 1,1), (select * from example limit 2,1));

select * from powerSet;