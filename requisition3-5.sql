-- MySQL dump 10.13  Distrib 5.5.11, for Win32 (x86)
--
-- Host: localhost    Database: requisition
-- ------------------------------------------------------
-- Server version	5.5.11

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
-- Table structure for table `approvallevel`
--

DROP TABLE IF EXISTS `approvallevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvallevel` (
  `approvalLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `levelName` varchar(255) DEFAULT NULL,
  `levelNumber` int(11) DEFAULT NULL,
  `userCategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`approvalLevelId`),
  KEY `FKCD1CE6E19A795EED` (`userCategory`),
  CONSTRAINT `FKCD1CE6E19A795EED` FOREIGN KEY (`userCategory`) REFERENCES `usercategory` (`userCatid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvallevel`
--

LOCK TABLES `approvallevel` WRITE;
/*!40000 ALTER TABLE `approvallevel` DISABLE KEYS */;
INSERT INTO `approvallevel` VALUES (1,'Supervisor Ll 1',1,2),(2,'Director L1',1,4),(3,'Transport Officer L2',2,3);
/*!40000 ALTER TABLE `approvallevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvalrouting`
--

DROP TABLE IF EXISTS `approvalrouting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvalrouting` (
  `rountingId` int(11) NOT NULL AUTO_INCREMENT,
  `approveDate` date DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `requisition` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  PRIMARY KEY (`rountingId`),
  KEY `FK47ED48E38B505935` (`users`),
  KEY `FK47ED48E3605AAE9D` (`requisition`),
  CONSTRAINT `FK47ED48E3605AAE9D` FOREIGN KEY (`requisition`) REFERENCES `requisition` (`requisitionId`),
  CONSTRAINT `FK47ED48E38B505935` FOREIGN KEY (`users`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvalrouting`
--

LOCK TABLES `approvalrouting` WRITE;
/*!40000 ALTER TABLE `approvalrouting` DISABLE KEYS */;
INSERT INTO `approvalrouting` VALUES (1,'2017-05-01',' ok','Approved',13,2),(2,'2017-05-01',' approved by transport','Approved',13,3),(3,'2017-05-03',' aproved to supevisor side','Approved',15,2),(4,'2017-05-03',' ok approved','Approved',15,3),(5,'2017-05-03',' ok','Approved',12,2),(6,'2017-05-03',' ok','Approved',12,3);
/*!40000 ALTER TABLE `approvalrouting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departement`
--

DROP TABLE IF EXISTS `departement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departement` (
  `departementId` int(11) NOT NULL AUTO_INCREMENT,
  `departementName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`departementId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departement`
--

LOCK TABLES `departement` WRITE;
/*!40000 ALTER TABLE `departement` DISABLE KEYS */;
INSERT INTO `departement` VALUES (1,'Administration'),(2,'Finance'),(3,'IT'),(4,'Human Resource');
/*!40000 ALTER TABLE `departement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journeyinfo`
--

DROP TABLE IF EXISTS `journeyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journeyinfo` (
  `journeyId` int(11) NOT NULL AUTO_INCREMENT,
  `biginningDate` datetime DEFAULT NULL,
  `beginningTime` varchar(255) DEFAULT NULL,
  `commentOnVehicle` varchar(255) DEFAULT NULL,
  `journeyType` varchar(255) DEFAULT NULL,
  `recordingDate` datetime DEFAULT NULL,
  `startingKm` int(11) DEFAULT NULL,
  `requisition` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  PRIMARY KEY (`journeyId`),
  KEY `FK6993506E8B505935` (`users`),
  KEY `FK6993506E605AAE9D` (`requisition`),
  CONSTRAINT `FK6993506E605AAE9D` FOREIGN KEY (`requisition`) REFERENCES `requisition` (`requisitionId`),
  CONSTRAINT `FK6993506E8B505935` FOREIGN KEY (`users`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journeyinfo`
--

LOCK TABLES `journeyinfo` WRITE;
/*!40000 ALTER TABLE `journeyinfo` DISABLE KEYS */;
INSERT INTO `journeyinfo` VALUES (14,'2017-05-01 15:42:21','3:45 PM','Good condition','departure','2017-05-01 15:42:21',200,13,6),(15,'2017-05-01 15:43:20','3:45 PM','Take care on it','return','2017-05-01 15:43:20',500,13,6);
/*!40000 ALTER TABLE `journeyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginhistoric`
--

DROP TABLE IF EXISTS `loginhistoric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginhistoric` (
  `historicId` int(11) NOT NULL AUTO_INCREMENT,
  `IpAddress` varchar(255) DEFAULT NULL,
  `logOutTime` datetime DEFAULT NULL,
  `loginTimeIn` datetime DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  PRIMARY KEY (`historicId`),
  KEY `FKA90EB6C88B505935` (`users`),
  CONSTRAINT `FKA90EB6C88B505935` FOREIGN KEY (`users`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginhistoric`
--

LOCK TABLES `loginhistoric` WRITE;
/*!40000 ALTER TABLE `loginhistoric` DISABLE KEYS */;
INSERT INTO `loginhistoric` VALUES (1,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 10:52:08',5),(2,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:03:27',5),(3,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:16:39',5),(4,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:21:05',5),(5,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:24:21',5),(6,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:30:55',5),(7,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:34:23',5),(8,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:34:54',5),(9,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:39:04',10),(10,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 11:41:00',10),(11,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 12:22:56','2017-05-01 12:15:06',5),(12,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 12:24:37','2017-05-01 12:23:11',5),(13,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 12:26:49','2017-05-01 12:24:43',5),(14,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 12:28:20','2017-05-01 12:26:55',2),(15,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 12:29:49','2017-05-01 12:28:30',3),(16,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 12:29:53',6),(17,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 13:20:43',6),(18,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 14:05:34','2017-05-01 14:02:29',6),(19,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 14:22:01','2017-05-01 14:05:42',6),(20,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 14:50:29',6),(21,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 15:02:45',6),(22,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 15:11:34',6),(23,'DESKTOP-B1MCAJO/192.168.0.53',NULL,'2017-05-01 15:15:38',6),(24,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 16:18:31','2017-05-01 15:32:06',6),(25,'DESKTOP-B1MCAJO/127.0.0.1','2017-05-01 17:37:09','2017-05-01 16:18:37',3),(26,'DESKTOP-B1MCAJO/127.0.0.1','2017-05-01 17:38:37','2017-05-01 17:37:15',2),(27,'DESKTOP-B1MCAJO/127.0.0.1','2017-05-01 17:39:19','2017-05-01 17:38:45',4),(28,'DESKTOP-B1MCAJO/127.0.0.1','2017-05-01 17:40:30','2017-05-01 17:39:25',3),(29,'DESKTOP-B1MCAJO/127.0.0.1','2017-05-01 18:28:12','2017-05-01 17:43:08',1),(30,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 18:28:31','2017-05-01 18:28:23',1),(31,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 18:29:44','2017-05-01 18:29:36',1),(32,'DESKTOP-B1MCAJO/192.168.0.53','2017-05-01 18:44:48','2017-05-01 18:44:41',5),(33,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-02 17:29:48',2),(34,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 09:38:39',1),(35,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 09:50:37',5),(36,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:09:31',5),(37,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:10:54',5),(38,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:33:03',5),(39,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:36:12',5),(40,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:39:00',5),(41,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:46:40',5),(42,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:47:13',5),(43,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:50:32',5),(44,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:55:38',5),(45,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:58:28',10),(46,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 10:58:56',5),(47,'DESKTOP-B1MCAJO/127.0.0.1','2017-05-03 15:30:51','2017-05-03 15:30:04',5),(48,'DESKTOP-B1MCAJO/127.0.0.1',NULL,'2017-05-03 15:30:58',2),(49,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:20:22','2017-05-03 16:08:09',3),(50,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:38:48','2017-05-03 16:21:20',2),(51,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:43:26','2017-05-03 16:38:58',5),(52,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:45:21','2017-05-03 16:43:32',2),(53,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:46:13','2017-05-03 16:45:36',4),(54,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:46:34','2017-05-03 16:46:20',3),(55,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 16:50:35','2017-05-03 16:46:39',1),(56,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 17:13:14',13),(57,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 18:24:55',1),(58,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 18:40:15',1),(59,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 18:44:20','2017-05-03 18:44:14',5),(60,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 18:44:46','2017-05-03 18:44:26',3),(61,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 18:45:16','2017-05-03 18:44:50',1),(62,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 18:45:26','2017-05-03 18:45:23',7),(63,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 18:45:47','2017-05-03 18:45:32',2),(64,'DESKTOP-B1MCAJO/192.168.10.176','2017-05-03 18:48:23','2017-05-03 18:45:52',3),(65,'DESKTOP-B1MCAJO/192.168.10.176',NULL,'2017-05-03 18:48:30',3);
/*!40000 ALTER TABLE `loginhistoric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifyrequester`
--

DROP TABLE IF EXISTS `notifyrequester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifyrequester` (
  `noficationId` int(11) NOT NULL AUTO_INCREMENT,
  `Level` int(11) DEFAULT NULL,
  `notification` varchar(255) DEFAULT NULL,
  `subjetc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`noficationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifyrequester`
--

LOCK TABLES `notifyrequester` WRITE;
/*!40000 ALTER TABLE `notifyrequester` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifyrequester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifytransportofficer`
--

DROP TABLE IF EXISTS `notifytransportofficer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifytransportofficer` (
  `noficationId` int(11) NOT NULL AUTO_INCREMENT,
  `journeyType` varchar(255) DEFAULT NULL,
  `notification` varchar(255) DEFAULT NULL,
  `subjetc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`noficationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifytransportofficer`
--

LOCK TABLES `notifytransportofficer` WRITE;
/*!40000 ALTER TABLE `notifytransportofficer` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifytransportofficer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisition`
--

DROP TABLE IF EXISTS `requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisition` (
  `requisitionId` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `requisitionDate` datetime DEFAULT NULL,
  `requisitionDateIn` datetime DEFAULT NULL,
  `requisitionDateOut` datetime DEFAULT NULL,
  `requisitionNumber` varchar(255) DEFAULT NULL,
  `requisitionTimeIn` varchar(255) DEFAULT NULL,
  `requisitionTimeOut` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `totalMileage` int(11) DEFAULT NULL,
  `approvalLevel` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  `loginUser` int(11) DEFAULT NULL,
  `requester` int(11) DEFAULT NULL,
  `typeOfRequest` int(11) DEFAULT NULL,
  `vehicle` int(11) DEFAULT NULL,
  PRIMARY KEY (`requisitionId`),
  KEY `FK7B02F87C32EFA63D` (`vehicle`),
  KEY `FK7B02F87CC418A647` (`approvalLevel`),
  KEY `FK7B02F87C35C66355` (`driver`),
  KEY `FK7B02F87CAE0662A9` (`requester`),
  KEY `FK7B02F87CB626CDA1` (`typeOfRequest`),
  KEY `FK7B02F87C1E3EC9E1` (`loginUser`),
  CONSTRAINT `FK7B02F87C1E3EC9E1` FOREIGN KEY (`loginUser`) REFERENCES `users` (`userId`),
  CONSTRAINT `FK7B02F87C32EFA63D` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`vehicleId`),
  CONSTRAINT `FK7B02F87C35C66355` FOREIGN KEY (`driver`) REFERENCES `users` (`userId`),
  CONSTRAINT `FK7B02F87CAE0662A9` FOREIGN KEY (`requester`) REFERENCES `users` (`userId`),
  CONSTRAINT `FK7B02F87CB626CDA1` FOREIGN KEY (`typeOfRequest`) REFERENCES `typeofrequest` (`typeOfRequestId`),
  CONSTRAINT `FK7B02F87CC418A647` FOREIGN KEY (`approvalLevel`) REFERENCES `approvallevel` (`approvalLevelId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisition`
--

LOCK TABLES `requisition` WRITE;
/*!40000 ALTER TABLE `requisition` DISABLE KEYS */;
INSERT INTO `requisition` VALUES (12,600,'Musanze','tets','2017-05-01 12:23:58','2017-05-02 00:00:00','2017-05-02 00:00:00','R03051712','11:30 AM','12:30 PM','Approved',0,3,12,5,5,1,2),(13,4000,'Muhanga',' tetsing','2017-05-01 12:26:40','2017-05-02 00:00:00','2017-05-03 00:00:00','R01051713','12:30 PM','1:30 PM','Approved',300,3,6,5,5,1,1),(14,0,'Gisenyi','kugura ibikoresho','2017-05-01 17:38:08','2017-05-02 00:00:00','2017-05-09 00:00:00',NULL,'6:45 PM','5:45 PM','Not Yet',0,NULL,NULL,2,2,1,NULL),(15,3000,'Gisenyi',' Kusura','2017-05-03 15:30:46','2017-05-04 00:00:00','2017-05-04 00:00:00','R03051715','3:30 PM','9:30 PM','Approved',0,3,6,5,5,1,1),(16,0,'Muhanga',' Going','2017-05-03 16:40:44','2017-05-03 00:00:00','2017-05-03 00:00:00',NULL,'5:45 PM','6:45 PM','Not Yet',0,NULL,NULL,5,5,1,NULL);
/*!40000 ALTER TABLE `requisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeofrequest`
--

DROP TABLE IF EXISTS `typeofrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeofrequest` (
  `typeOfRequestId` int(11) NOT NULL AUTO_INCREMENT,
  `typeOfRequestName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeOfRequestId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeofrequest`
--

LOCK TABLES `typeofrequest` WRITE;
/*!40000 ALTER TABLE `typeofrequest` DISABLE KEYS */;
INSERT INTO `typeofrequest` VALUES (1,'Official Use'),(2,'Private Use');
/*!40000 ALTER TABLE `typeofrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercategory`
--

DROP TABLE IF EXISTS `usercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercategory` (
  `userCatid` int(11) NOT NULL AUTO_INCREMENT,
  `usercategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userCatid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercategory`
--

LOCK TABLES `usercategory` WRITE;
/*!40000 ALTER TABLE `usercategory` DISABLE KEYS */;
INSERT INTO `usercategory` VALUES (1,'Admin'),(2,'Supervisor'),(3,'Transport Officer'),(4,'Director'),(5,'Requester'),(6,'Driver');
/*!40000 ALTER TABLE `usercategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `loginStatus` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `departement` int(11) DEFAULT NULL,
  `userCategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName` (`userName`),
  KEY `FK4E39DE89A795EED` (`userCategory`),
  KEY `FK4E39DE86EC1E503` (`departement`),
  CONSTRAINT `FK4E39DE86EC1E503` FOREIGN KEY (`departement`) REFERENCES `departement` (`departementId`),
  CONSTRAINT `FK4E39DE89A795EED` FOREIGN KEY (`userCategory`) REFERENCES `usercategory` (`userCatid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kigali','ngaboericngabo2@gmail.com','Mugabo','Jean','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','admin',1,1),(2,'Kigali','ngaboericngabo2@gmail.com','Mukamurisa','Alice','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','supervisor',2,2),(3,'Kigali','ngaboericngabo2@gmail.com','Kalisa','Aime','online','29988429c481f219b8c5ba8c071440e1','777777777','active','transport',2,3),(4,'Kigali','ngaboericngabo2@gmail.com','Iradukunda','Frolance','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','director',2,4),(5,'Kigali','ngaboericngabo2@gmail.com','Ntwali','Rodrigue','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','requester',2,5),(6,'Kigali','ngaboericngabo2@gmail.com','Kbandandana','Saidi','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','driver',2,6),(7,'Kigali','ngaboericngabo2@gmail.com','Munama','Amini','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','supervisor2',3,2),(8,'Kigali','ngaboericngabo2@gmail.com','Jackeline','Munana','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','transport2',3,3),(9,'Kigali','ngaboericngabo2@gmail.com','Uwase','vava','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','director2',3,4),(10,'Kigali','ngaboericngabo2@gmail.com','Ngabo','Eric','online','29988429c481f219b8c5ba8c071440e1','777777777','active','requester2',3,5),(11,'Kigali','ngaboericngabo2@gmail.com','Ruramira','Andre','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','requester3',3,5),(12,'Kigali','ngaboericngabo2@gmail.com','Manzi','Tito','offline','29988429c481f219b8c5ba8c071440e1','777777777','active','driver2',3,6),(13,'Kigali','ngaboericngabo2@gmail.com','munana','aime','online','32250170a0dca92d53ec9624f336ca24','554444444444','active','requster3',2,5);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleType` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `plateNumber` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'Van','Good codition','RAD332D','Available'),(2,'Bus','Good codition','RAD343D','Available'),(3,'Voiture','Good codition','RAY343D','Available');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-03 18:53:40
