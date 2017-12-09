drop table if exists ec3_transfer_log;
create table ec3_transfer_log (
sequence_number int not null auto_increment,
source_id  varchar(12) not null,
target_id varchar(12) not null,
amount float not null,
transfer_time timestamp not null default now(), 
result_code int not null,
PRIMARY KEY (sequence_number)
);
select * from ec3_transfer_log;