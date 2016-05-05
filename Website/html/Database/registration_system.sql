-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: registration_system
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `administrator_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `administrator_id` (`administrator_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Kip','Irvine','iamadmin','admin@regsys.fiu.edu',2),(8,'Test ','Admin','wayne','ok2delete@gmail.com',2);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `school_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`coach_id`),
  UNIQUE KEY `coach_id` (`coach_id`),
  UNIQUE KEY `email` (`email`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'John','Curl','jcurl@gmail.com','ABC',2,1),(2,'Eduardo','Guerra','eguer048@fiu.edu','abc',1,1),(3,'Wayne','Curling','wcurl001@fiu.edu','CBA',3,1),(10,'Kip','Irvine','irvinek@cs.fiu.edu','potter33',10,1),(11,'John','Pen','JPen@gmail.com','test123',11,1);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `contest_id` int(4) NOT NULL AUTO_INCREMENT,
  `contest_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES (1,'Test','Here','2016-03-17','5:06 PM','admin@regsys.fiu.edu','This is a test.','n'),(2,'Stored Test','Here','2016-03-18','6:39 PM','admin@regsys.fiu.edu','Stored contest test.','n'),(3,'Demo','Demo','2016-03-22','1:20 PM','admin@regsys.fiu.edu','Demo','n'),(4,'Demo for Kip','Kip\'s office','2016-03-25','10:20 am','admin@regsys.fiu.edu','Demo for Kip','n'),(5,'Demo for video','Here','2016-03-05','Now','admin@regsys.fiu.edu','Just a test.','n'),(6,'New Contest (Kip)','MMC','2014-01-05','8:30','admin@regsys.fiu.edu','This is a new contest','n'),(7,'Contest #2 (Kip)','Mars','2016-04-23','3333','admin@regsys.fiu.edu','asfdasf','y');
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `coach_id` int(11) NOT NULL,
  `tshirt_size` char(10) DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  UNIQUE KEY `participant_id` (`participant_id`),
  UNIQUE KEY `email` (`email`),
  KEY `coach_id` (`coach_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (1,'John','Sanchez','jsmith@gmail.com',1,2,'S'),(2,'Bob','Ross','bross@gmail.com',2,1,'XS'),(3,'Wayne','Salvator','wayneC@gmail.com',1,2,'XS'),(4,'Hector','Jones','test@gmail.com',3,1,'L'),(6,'Dania','Andrew','DA@gmail.com',1,1,'XS'),(9,'Bob','Dillion','BDillion@gmail.com',1,1,'S'),(17,'Bob','Dillion','bDill@gmail.com',9,1,'XS'),(18,'Chris','Sanchez','cTest@gmail.com',2,1,'XL'),(19,'Rick','Sanchez','San@gmail.com',9,3,'XL'),(20,'Will','Smith','wSmith@gmail.com',2,1,'L'),(21,'Jessica','Alverez','jAlverez@hotmail.com',3,1,'S'),(22,'Kevin','Chang','Chang123@hotmail.com',3,1,'M'),(25,'test123','testing','testing123@gmail.com',13,11,'L');
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Coach'),(2,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(45) NOT NULL,
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `school_id` (`school_id`),
  KEY `coach_id` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Florida International University',2),(2,'Coral Gables High School',1),(3,'Coral Park High School',3),(10,'Hogwarts',10),(11,'Test123 High School',11);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_id` int(11) NOT NULL,
  `team_name` varchar(40) NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_id` (`team_id`),
  KEY `coach_id` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,2,'Test Team'),(2,1,'Panthers'),(3,1,'Senior Project'),(8,1,'Team W'),(9,3,'Team K'),(13,11,'Test 1234'),(14,11,'Test 122345');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-05 15:58:58
