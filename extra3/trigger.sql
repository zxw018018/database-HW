CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer_commit`(in source_id varchar(12), in target_id varchar(12), in amount float, out rc int)
BEGIN
declare source_account varchar(2);
declare function_call int;
declare s_balance float;
declare t_balance float;
declare s_overdraft_limit float; 
declare s_minimum_balance float;
-- determine if the source account is checking or savings 
set source_account = (select mid(source_id, 1, 2));
-- if checking
if (source_account = 'CH') then
-- the transfer is valid if the checking account's 
-- balance - amount > -1.0*overdraft_limit for the account
set s_balance = (select balance from ec3_checking where account_id = source_id);
set t_balance = (select balance from ec3_savings where account_id = target_id);
set s_overdraft_limit = (select overdraft_limit from ec3_checking where account_id = source_id);
if (s_balance - amount > -1.0*s_overdraft_limit) then
-- debit the balance in the source account
update ec3_checking set balance = s_balance - amount where account_id = source_id;
-- increase the balance in the target account
update ec3_savings set balance = t_balance + amount where account_id = target_id;
-- set rc to 1
set rc = 1;
-- write a log record containing the source account id, target account id, amount and an rc = 1
insert into ec3_transfer_log (source_id, target_id, amount, result_code) values
(source_id, target_id, amount, rc);
-- else invalid 
else
-- set rc to -1
set rc = -1;
-- write a log record containing source account id, target account id, amount and rc = -1
insert into ec3_transfer_log (source_id, target_id, amount, result_code) values
(source_id, target_id, amount, rc);

end if;

-- if savings 
elseif (source_account = 'SV') then 
-- the transfer is valid if the savings account balance - amount > minimum_balance 
set s_balance = (select balance from ec3_savings where account_id = source_id);
set t_balance = (select balance from ec3_savings where account_id = target_id);
set s_minimum_balance = (select minimum_balance from ec3_savings where account_id = source_id);
-- if valid 
if (s_balance - amount > s_minimum_balance) then
-- debit the balance in the source account
update ec3_savings set balance = s_balance - amount where account_id = source_id;
-- increase the balance in the target account
update ec3_savings set balance = t_balance + amount where account_id = target_id;
-- set rc to 1
set rc = 1;
-- write a log record containing the source account id, target account id, amount and an rc = 1
insert into ec3_transfer_log (source_id, target_id, amount, result_code) values
(source_id, target_id, amount, rc);
-- if invalid
else 
-- set rc to -1
set rc = -1;
-- write a log record containing source account id, target account id, amount and rc = -1
insert into ec3_transfer_log (source_id, target_id, amount, result_code) values
(source_id, target_id, amount, rc);

end if;

else
signal sqlstate '45000'
set message_text = 'source_id is neither checking nor saving';
end if;


END