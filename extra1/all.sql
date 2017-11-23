-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: extra1
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created` timestamp(6) NULL DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Candie','MacPake','cmacpake6@spiegel.de','2017-11-19 01:37:10.000000','CANDIE.MACPAKE.1'),('Carling','Bockman','cbockman5@cam.ac.uk','2017-11-19 01:37:10.000000','CARLING.BOCKMAN.1'),('Chrissy','Weatherup','cweatherup2@theguardian.com','2017-11-19 01:37:10.000000','CHRISSY.WEATHERUP.1'),('Cloris','Edards','cedards4@springer.com','2017-11-19 01:37:10.000000','CLORIS.EDARDS.1'),('Diannne','Aickin','daickin9@domainmarket.com','2017-11-19 01:37:10.000000','DIANNNE.AICKIN.1'),('Douglas','Snoxill','dsnoxill1@scribd.com','2017-11-19 01:37:10.000000','DOUGY.SNOXILL.1'),('Dulciana','Cambell','dcambell8@i2i.jp','2017-11-19 01:37:10.000000','DULCIANA.CAMBELL.1'),('Jared','Melarkey','jmelarkey3@google.co.jp','2017-11-19 01:37:10.000000','JARED.MELARKEY.1'),('Joice','Tomsen','jtomsen7@slideshare.net','2017-11-19 01:37:10.000000','JOICE.TOMSEN.1'),('Juana','Gatesman','jgatesman0@chron.com','2017-11-19 01:37:10.000000','JUANA.GATESMAN.1'),('John','Smith','js1@statcounter.com','2017-11-19 02:01:18.000000','JOHN.SMITH.1'),('John','Smith','js3@statcounter.com','2017-11-19 02:01:18.000000','JOHN.SMITH.3'),('John','Smith','js5@statcounter.com','2017-11-19 02:01:18.000000','JOHN.SMITH.5'),('John','Smith','js@myemail.com','2017-11-19 02:01:18.000000','JOHN.SMITH.6');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `extra1`.`employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW
BEGIN
declare firstName varchar(32);
declare lastName varchar(32);
declare tmp_name varchar(64);
declare next_number int;
declare count int;
set firstName = new.first_name;
set lastName = new.last_name;
set tmp_name = concat(firstName,lastName);
set count = (select user_prefix_count.max_value from user_prefix_count where user_prefix_count.prefix =  tmp_name);
if count is null then
set count = 0;
insert into user_prefix_count (prefix,max_value) values (tmp_name,1);
end if;
set next_number = count+1;
set new.created = now();
update user_prefix_count set max_value = next_number where prefix=tmp_name;
set new.user_id = concat(upper(firstName), '.', upper(lastName), '.', next_number);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `extra1`.`employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW
BEGIN
if new.created != old.created then
set new.created = old.created;
end if;
if new.user_id != old.user_id then
signal sqlstate'45000'
set message_text = 'cannot change user id';
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_prefix_count`
--

DROP TABLE IF EXISTS `user_prefix_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_prefix_count` (
  `prefix` varchar(45) NOT NULL,
  `max_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_prefix_count`
--

LOCK TABLES `user_prefix_count` WRITE;
/*!40000 ALTER TABLE `user_prefix_count` DISABLE KEYS */;
INSERT INTO `user_prefix_count` VALUES ('CandieMacPake',1),('CarlingBockman',1),('ChrissyWeatherup',1),('ClorisEdards',1),('DiannneAickin',1),('DougySnoxill',1),('DulcianaCambell',1),('JaredMelarkey',1),('JohnSmith',6),('JoiceTomsen',1),('JuanaGatesman',1);
/*!40000 ALTER TABLE `user_prefix_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'extra1'
--

--
-- Dumping routines for database 'extra1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-18 21:14:21
