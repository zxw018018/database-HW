SET SQL_SAFE_UPDATES = 0;
call transfer_commit('CH-16','SV-1',225,@rc);
select @rc;
select * from ec3_savings;
select * from ec3_checking;
select * from ec3_transfer_log;
