SET SQL_SAFE_UPDATES = 0;
call transfer_commit('CH-15','SV-1',100,@rc);
select @rc;
select * from ec3_savings;
select * from ec3_checking;
select * from ec3_transfer_log;

