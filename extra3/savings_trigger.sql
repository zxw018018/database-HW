DROP TRIGGER IF EXISTS `extra3`.`ec3_savings_BEFORE_INSERT`;

DELIMITER $$
USE `extra3`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `extra3`.`ec3_savings_BEFORE_INSERT` BEFORE INSERT ON `ec3_savings` FOR EACH ROW
BEGIN
declare max_count int;
set max_count = (select max(id_count) from ec3_savings);
set new.id_count = max_count+1;
set new.account_id = concat('SV-', max_count+1);

END$$
DELIMITER ;