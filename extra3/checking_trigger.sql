DROP TRIGGER IF EXISTS `extra3`.`ec3_checking_BEFORE_INSERT`;

DELIMITER $$
USE `extra3`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `extra3`.`ec3_checking_BEFORE_INSERT` BEFORE INSERT ON `ec3_checking` FOR EACH ROW
BEGIN
declare max_count int;
set max_count = (select max(id_count) from ec3_checking);
set new.id_count = max_count+1;
set new.account_id = concat('CH-', max_count+1);

END$$
DELIMITER ;