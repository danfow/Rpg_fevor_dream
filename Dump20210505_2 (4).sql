-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: rpg_fever_dream
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_`
--

DROP TABLE IF EXISTS `account_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_` (
  `PaymentInfo_FirstName` varchar(30) DEFAULT NULL,
  `PaymentInfo_LastName` varchar(30) DEFAULT NULL,
  `PaymentInfo_CreditCard` int DEFAULT NULL,
  `PaymentInfo_Address_Street` varchar(30) DEFAULT NULL,
  `PaymentInfo_Address_City` varchar(30) DEFAULT NULL,
  `PaymentInfo_Adresss_State` varchar(30) DEFAULT NULL,
  `PaymentInfo_Address_ZipCode` int DEFAULT NULL,
  `AccountType` varchar(30) DEFAULT NULL,
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) DEFAULT NULL,
  `Password_` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `ServerName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_`
--

LOCK TABLES `account_` WRITE;
/*!40000 ALTER TABLE `account_` DISABLE KEYS */;
INSERT INTO `account_` VALUES ('John','Doe',65118,'Random Street Drive','Kansas City','Missouri',55555,'User',1,'username','password','JohnDoe@gmail.com','World1'),('Jane','Doe',67412,'Whack Street Drive','Kansas City','Missouri',12345,'Admin',2,'uname','passw','JaneDoe@gmail.com','World1'),('Han','Solo',54725,'Far away drive','New York','New York',65623,'Designer',3,'shot','first','HanSolo@gmail.com','World1'),('Walter','White',-14800,'308 Negra Arroyo Lane','Albuquerque','New Mexico',87101,'User',4,'CrystalBlue','SayMyName','Heisenberg@gmail.com','World1'),('Gus','Fring',-15100,'1213 Jefferson St','Albuquerque','New Mexico',87101,'User',5,'ChickenMan','Empire','LosPollosHermanos@gmail.com','World1'),('Zack','Rawr',-13700,'121 Hillcrest Dr','Austin','Texas',79563,'User',6,'Asmongold','SupBois','Asmongold@gmail.com','World1');
/*!40000 ALTER TABLE `account_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alliance`
--

DROP TABLE IF EXISTS `alliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alliance` (
  `Name_` varchar(30) DEFAULT NULL,
  `AllianceID` int NOT NULL,
  PRIMARY KEY (`AllianceID`),
  UNIQUE KEY `Name_` (`Name_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alliance`
--

LOCK TABLES `alliance` WRITE;
/*!40000 ALTER TABLE `alliance` DISABLE KEYS */;
INSERT INTO `alliance` VALUES ('Breaking Bad',4),('Fantasy fighters',2),('Middle earth fighters',1),('Small folk',3);
/*!40000 ALTER TABLE `alliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongs_to`
--

DROP TABLE IF EXISTS `belongs_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongs_to` (
  `StartDate` datetime DEFAULT NULL,
  `AllianceID` int NOT NULL,
  `GuildID` int NOT NULL,
  PRIMARY KEY (`AllianceID`,`GuildID`),
  KEY `BELONGs_TOToGUILD` (`GuildID`),
  CONSTRAINT `BELONGs_TOtoAlliance` FOREIGN KEY (`AllianceID`) REFERENCES `alliance` (`AllianceID`),
  CONSTRAINT `BELONGs_TOToGUILD` FOREIGN KEY (`GuildID`) REFERENCES `guild` (`GuildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs_to`
--

LOCK TABLES `belongs_to` WRITE;
/*!40000 ALTER TABLE `belongs_to` DISABLE KEYS */;
INSERT INTO `belongs_to` VALUES ('2021-04-30 00:00:00',3,4),('2021-04-30 00:00:00',4,8),('2021-04-30 00:00:00',4,9);
/*!40000 ALTER TABLE `belongs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_`
--

DROP TABLE IF EXISTS `character_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_` (
  `CharacterID` int NOT NULL AUTO_INCREMENT,
  `CharacterName` varchar(100) DEFAULT NULL,
  `Gold` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `GuildID` int DEFAULT NULL,
  `Race` varchar(30) DEFAULT NULL,
  `Level_` int DEFAULT NULL,
  `Location_X` int DEFAULT NULL,
  `Location_Y` int DEFAULT NULL,
  `isSelected` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CharacterID`),
  UNIQUE KEY `CharacterName` (`CharacterName`),
  KEY `charactertoAccount` (`UserID`),
  KEY `charactertoLand` (`Location_X`,`Location_Y`),
  KEY `characterstoguild` (`GuildID`),
  CONSTRAINT `characterstoguild` FOREIGN KEY (`GuildID`) REFERENCES `guild` (`GuildID`),
  CONSTRAINT `charactertoAccount` FOREIGN KEY (`UserID`) REFERENCES `account_` (`UserID`),
  CONSTRAINT `charactertoLand` FOREIGN KEY (`Location_X`, `Location_Y`) REFERENCES `land` (`Location_X`, `location_Y`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_`
--

LOCK TABLES `character_` WRITE;
/*!40000 ALTER TABLE `character_` DISABLE KEYS */;
INSERT INTO `character_` VALUES (2,'Sam',3000,1,6,'Hobbit',0,0,1,0),(3,'Frodo',1002,2,4,'Hobbit',0,0,1,0),(5,'DOOMGUY',1000,3,5,'Human',0,1,0,0),(6,'Master Chief',1020,3,11,'Human',0,0,0,0),(7,'Pippin',3000,1,4,'Hobbit',0,0,0,0),(23,'Anakin',1000,2,7,'Human',0,0,0,0),(24,'Obi-Wan',1000,2,7,'Human',0,0,0,0),(25,'Yoda',965,2,7,'Unknown',0,0,0,0),(26,'Bilbo',3000,1,4,'Hobbit',0,0,0,0),(28,'Mace Windu',3000,1,7,'Human',0,0,0,0),(29,'Kit Fisto',3000,1,7,'Human',0,0,0,0),(30,'Heisenberg',1015,4,8,'Human',0,0,0,0),(31,'Jessie',1000,4,8,'Human',0,0,0,0),(32,'Skyler',1000,4,8,'Human',0,0,0,0),(33,'Walter Jr.',1000,4,8,'Human',0,0,0,0),(34,'Gus Fring',1000,5,9,'Human',0,0,0,0),(35,'Mike Ehrmantraut',1000,5,9,'Human',0,0,0,0),(36,'Victor',1000,5,9,'Human',0,0,2,0),(37,'Tyrus Kitt',1000,5,9,'Human',0,0,0,0),(38,'Deepari',1000,3,12,'Elf',0,1,1,0),(39,'Fury Warrior',1000,6,NULL,'Human',0,0,0,0),(40,'Survival Hunter',1000,6,NULL,'Human',0,0,0,0),(41,'Holy Paladin',1000,6,NULL,'Human',0,0,0,0),(42,'Marksmen Hunter',1000,6,NULL,'Human',0,0,0,0);
/*!40000 ALTER TABLE `character_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debugging`
--

DROP TABLE IF EXISTS `debugging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debugging` (
  `value1` int DEFAULT NULL,
  `value2` int DEFAULT NULL,
  `value3` int DEFAULT NULL,
  `value4` int DEFAULT NULL,
  `value5` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debugging`
--

LOCK TABLES `debugging` WRITE;
/*!40000 ALTER TABLE `debugging` DISABLE KEYS */;
/*!40000 ALTER TABLE `debugging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild` (
  `GuildLeader` varchar(30) DEFAULT NULL,
  `GuildID` int NOT NULL AUTO_INCREMENT,
  `GuildName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GuildID`),
  UNIQUE KEY `GuildName` (`GuildName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
INSERT INTO `guild` VALUES ('Frodo',4,'small folk'),('DOOMGUY',5,'FPS club'),('Sam',6,'Potato Farmers'),('Mace Windu',7,'The Jedi Council'),('Heisenberg',8,'The Empire Business'),('Gus Fring',9,'Los Pollos Hermanos'),('Master Chief',11,'Lolipop Guild'),('Deepari',12,'Thunder Cats');
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `IsOn` tinyint(1) DEFAULT NULL,
  `IsSell` tinyint(1) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `CharacterID` int DEFAULT NULL,
  `Price` int DEFAULT '1',
  `hasID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`hasID`),
  KEY `Hastocharacter` (`CharacterID`),
  KEY `HastoItem` (`ItemID`),
  CONSTRAINT `Hastocharacter` FOREIGN KEY (`CharacterID`) REFERENCES `character_` (`CharacterID`),
  CONSTRAINT `HastoItem` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (1,0,1,5,0,1),(0,0,1,5,0,2),(0,0,1,5,8,3),(0,0,1,5,20,4),(0,0,1,5,20,5),(0,0,1,5,20,6),(0,0,1,6,0,7),(0,0,1,6,0,8),(0,0,1,6,0,9),(0,0,1,6,0,10),(0,0,1,5,20,11),(0,0,1,5,20,12),(0,1,2,5,0,13),(0,1,2,5,0,14),(0,1,2,5,0,15),(0,1,2,5,0,16),(1,0,2,6,0,17),(0,0,2,6,0,18),(0,0,2,6,0,19),(0,1,2,6,0,20),(0,1,2,6,0,21),(0,0,3,6,2,23),(0,0,3,5,2,24),(1,0,4,3,2,25),(1,0,5,5,5,26),(0,0,5,5,5,27),(0,0,3,NULL,1,28),(1,0,4,5,1,29),(0,0,4,5,1,30),(0,0,3,3,1,31),(0,0,6,3,1,32),(0,0,1,5,20,33),(0,0,1,5,20,34),(0,0,1,5,20,35),(0,0,1,5,20,36),(0,0,1,5,20,37),(0,0,1,5,20,38),(0,0,1,5,20,39),(0,0,1,5,20,40),(0,0,1,5,20,41),(0,0,1,5,20,42),(0,0,1,5,20,43),(0,0,1,5,20,44),(0,0,1,5,20,45),(0,0,1,5,20,46),(0,0,1,5,20,47),(0,0,1,5,20,48),(0,0,1,5,20,49),(0,0,1,5,20,50),(0,0,1,5,20,51),(0,0,1,5,20,52),(0,0,1,5,20,53),(0,0,1,5,20,54),(1,0,1,25,20,55),(0,1,1,6,20,56),(0,1,1,6,20,57),(0,1,1,6,20,58),(0,1,1,6,20,59),(0,1,1,6,20,60),(0,1,1,6,20,61),(0,1,1,6,20,62),(1,0,7,23,0,71),(1,0,7,24,0,72),(1,0,7,25,0,73),(0,0,3,5,5,74),(1,0,7,26,0,75),(1,0,7,28,0,76),(1,0,7,29,0,77),(1,0,7,30,0,78),(1,0,7,31,0,79),(1,0,7,32,0,80),(1,0,7,33,0,81),(1,0,7,34,0,82),(1,0,7,35,0,83),(1,0,7,36,0,84),(1,0,7,37,0,85),(1,0,7,38,0,86),(1,0,7,39,0,87),(1,0,7,40,0,88),(1,0,7,41,0,89),(1,0,7,42,0,90),(0,1,8,25,15,94),(0,1,9,30,15,95),(0,1,10,30,15,96),(0,1,11,30,100,97),(0,1,12,30,1,98),(0,1,13,30,10,99);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `ItemType` varchar(30) DEFAULT NULL,
  `ItemID` int NOT NULL,
  `Stats_Attack` int DEFAULT NULL,
  `Stats_Defense` int DEFAULT NULL,
  `Name_` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('Head',1,0,10,'Helmet of Nefelheim'),('Feet',2,0,5,'Fleeting Shoes'),('Hands',3,4,1,'Spiked gloves'),('Hands',4,100,100,'Broken Sword'),('Off Hand',5,0,10,'Shield'),('Off Hand',6,0,100,'Tower Shield'),('Fists',7,1,0,'Fists'),('Main hand',8,1000,100,'Lightsaber'),('Main hand',9,10000,0,'BFG'),('Off hand',10,1,0,'toothpick'),('Main hand',11,110,110,'Frostmourne'),('Pants',12,0,1,'Nice purple pants'),('Pants',13,0,10,'Plate pants');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `land`
--

DROP TABLE IF EXISTS `land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `land` (
  `Location_X` int NOT NULL,
  `location_Y` int NOT NULL,
  `LandID` int DEFAULT NULL,
  `Description_` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Location_X`,`location_Y`),
  UNIQUE KEY `LandID` (`LandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `land`
--

LOCK TABLES `land` WRITE;
/*!40000 ALTER TABLE `land` DISABLE KEYS */;
INSERT INTO `land` VALUES (-5,-3,4,'The Citadel SW'),(-5,-2,69,'NW Citadel'),(-5,-1,58,'Far NW The Citadel'),(-5,0,48,'SW Jungle of Xandar'),(-5,1,38,'NW Jungle of Xandar'),(-5,2,27,'W of Land o spiders'),(-5,3,16,'SW Mount DOOM'),(-5,4,5,'NW Mount DOOM'),(-4,-3,81,'SE Citadel'),(-4,-2,70,'NE Citadel'),(-4,-1,59,'Far NE The Citadel'),(-4,0,49,'SE Jungle of Xandar'),(-4,1,39,'NE Jungle of Xandar'),(-4,2,28,'Land o spiders ahhhhhhhhhhh'),(-4,3,17,'SE Mount DOOM'),(-4,4,6,'NE Mount DOOM'),(-3,-4,7,'East Mount DOOM'),(-3,-3,82,'The Great Chasm'),(-3,-2,71,'N of THE Great Chasm'),(-3,-1,60,'West of Lake Hyrule'),(-3,0,50,'SW of Crystal Forest'),(-3,1,40,'East of jungle of Xandar'),(-3,2,29,'East of Land o spiders'),(-3,3,18,'East of mt DOOM,SW Orgrimmar'),(-2,-4,8,'Orgrimmar'),(-2,-3,83,'East of The Great Chasm'),(-2,-2,72,'Southern bank of Lake Hyrule'),(-2,-1,61,'Lake Hyrule'),(-2,0,80,'W of mushroom forest'),(-2,1,41,'The Crystal Forest'),(-2,2,30,'West of The Imperial City'),(-2,3,19,'Direct South of Orgrimmar'),(-1,-4,9,'Wampa Caves'),(-1,-3,84,'West of Mount Hyrule'),(-1,-2,73,'W of Rivendell'),(-1,-1,62,'S of mushroom forest'),(-1,0,52,'mushroom forest'),(-1,1,42,'Imperial Mines'),(-1,2,31,'The Imperial City'),(-1,3,20,'Direct S Wampa Caves'),(0,-3,85,'Mount Hyrule'),(0,-2,74,'Rivendell'),(0,-1,63,'S of The Shire'),(0,0,1,'The Shire'),(0,1,3,'Rolling Hills'),(0,2,32,'East of The Imperial City'),(0,3,21,'Direct S Windhelm'),(0,4,10,'Windhelm'),(1,-3,86,'East of Mount Hyrule'),(1,-2,75,'E of Rivendell'),(1,-1,64,'Southern Shire Farms'),(1,0,53,'Northern Shire Farms'),(1,1,43,'NE of The Shire'),(1,2,33,'Land of untouchables'),(1,3,22,'SE of Windhelm,SW Khan'),(1,4,11,'East of Windhelm'),(2,-3,87,'Southern bank Lake Fevor Dream'),(2,-2,76,'Lake Fevor Dream'),(2,-1,65,'N bank Lake Fevor Dream'),(2,0,54,'Southern Hobbiton mountains'),(2,1,44,'N Hobbiton Mountains'),(2,2,34,'Land of the fairy fountain'),(2,3,23,'Direct S Khan\'s Domain'),(2,4,12,'Khan\'s Domain'),(3,-3,88,'Far West of THE WALL'),(3,-2,77,'SW Alduin\'s domain'),(3,-1,66,'NW Alduin\'s Domain'),(3,0,55,'Abandoned Village'),(3,1,45,'SW Dark Forest'),(3,2,35,'NW Dark Forest'),(3,3,24,'SW world tree'),(3,4,13,'NW World Tree'),(4,-3,89,'West of THE WALL'),(4,-2,78,'SE Alduin\'s domain'),(4,-1,67,'NE Alduin\'s Domain'),(4,0,56,'Necromancer Tower'),(4,1,46,'SE Dark Forest'),(4,2,36,'NE Dark Forest'),(4,3,25,'SE world tree'),(4,4,14,'NE World Tree'),(5,-3,90,'THE WALL'),(5,-2,79,'THE WALL'),(5,-1,68,'THE WALL'),(5,0,57,'THE WALL'),(5,1,47,'THE WALL'),(5,2,37,'THE WALL'),(5,3,26,'THE WALL'),(5,4,15,'THE WALL'),(10,10,2,'Wasteland');
/*!40000 ALTER TABLE `land` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lands`
--

DROP TABLE IF EXISTS `lands`;
/*!50001 DROP VIEW IF EXISTS `lands`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lands` AS SELECT 
 1 AS `Location_X`,
 1 AS `location_Y`,
 1 AS `LandID`,
 1 AS `Description_`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `StartDate` datetime DEFAULT NULL,
  `AllianceID` int DEFAULT NULL,
  `Location_X` int NOT NULL,
  `Location_Y` int NOT NULL,
  PRIMARY KEY (`Location_X`,`Location_Y`),
  KEY `OwnsToAlliance` (`AllianceID`),
  CONSTRAINT `OwnsToAlliance` FOREIGN KEY (`AllianceID`) REFERENCES `alliance` (`AllianceID`),
  CONSTRAINT `OwntoLand` FOREIGN KEY (`Location_X`, `Location_Y`) REFERENCES `land` (`Location_X`, `location_Y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `who`
--

DROP TABLE IF EXISTS `who`;
/*!50001 DROP VIEW IF EXISTS `who`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `who` AS SELECT 
 1 AS `CharacterName`,
 1 AS `Location_X`,
 1 AS `Location_Y`,
 1 AS `Description_`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'rpg_fever_dream'
--

--
-- Dumping routines for database 'rpg_fever_dream'
--
/*!50003 DROP PROCEDURE IF EXISTS `buyItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `buyItem`(IN uusername VARCHAR(30),IN itemName varchar(30), In ggold int, IN amount int)
BEGIN 

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
    set @iitemID = (Select ItemID 
		   From Item 
		   Where  Item.Name_ = itemName);
								       
					
	/* Need to start loop here*/	
	set @counter := 0;
   myloop: while @counter < amount   do
    set @counter := @counter + 1;
    
    set @CharGold = (select gold
		     From Character_
		     Where Character_.CharacterID = @charID);

    set @SurrogateID = 0;
    set @SellerID = 0;
    set @BuyPrice = 0;	
	
   start transaction;	
    Select HasID, CharacterID, Price INTO @SurrogateID, @SellerID, @BuyPrice 
	FROM Has 
	where Has.ItemID = @iitemID and Has.Price <= ggold and Has.isSell = true 
    limit 1; 								       
								       
	IF @CharGold < @BuyPrice then
		Leave myloop;
	END IF;
    
    SET @cnt = (select count(ItemID)
    from has
    where Has.ItemID = @iitemID and Has.Price <= ggold and Has.isSell = true);
    
    IF @cnt < 1 then leave myloop;
	END If;
	
    Update Has
    Set Has.CharacterID = @charID 
    Where Has.HasID = @SurrogateID  limit 1;
    
    
    
    Update Has
    Set Has.IsSell = false
    Where Has.HasID = @SurrogateID  limit 1;
	
    
    
    Update Character_
    Set Character_.gold = Character_.gold - @BuyPrice
    Where Character_.CharacterID = @CharID limit 1;							       
    
    
	
    Update Character_
    Set Character_.gold = Character_.gold + @BuyPrice
    Where Character_.CharacterID = @SellerID limit 1;
	commit;
	end while;
							       
    /* End Loop here*/
    
								      
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createCharacter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `createCharacter`(IN uusername VARCHAR(30) ,IN nname VARCHAR(30),IN rrace VARCHAR(30))
BEGIN
	set @userID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
    
    

    
	INSERT INTO character_ (CharacterName,Gold,UserID,GuildID,Race,Level_,Location_X,Location_Y,isSelected)
    VALUES (nname,0,@userID,NULL,rrace,0,0,0,False);
    
    set @charID =
	(SELECT character_.CharacterID
    FROM character_
    WHERE character_.CharacterName = nname and character_.UserID = @userID);
    
	
    
    INSERT  HAS (IsON,IsSell,ItemID,CharacterID,price) VALUES (1,0,7,@charID,0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createGuild` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `createGuild`(IN uuserID INT, IN gguildName Varchar(30))
BEGIN
	start transaction;
    
    set @charName = (Select character_.CharacterName
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	 set @charGold = (Select character_.Gold
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	
            
	
	IF @charGold >=10000 THEN
    UPDATE character_
    Set  character_.GuildID = NULL
    WHERE character_.CharacterName = @charName;
    END IF;
    
    IF @charGold >=10000 THEN
    UPDATE character_
    Set character_.gold = @charGold -10000 
    WHERE character_.CharacterName = @charName;
    
  
    
    
    INSERT INTO GUILD (GuildLeader,GuildName) VALUES  (@charname,gguildName);
    
    
    set @guildID = (select guild.GuildID
						From guild
                        where guild.GuildName =gguildName );
    
	update character_
    Set character_.guildID = @guildID
	WHERE character_.CharacterName = @charName ;
	END IF;
	
 
    commit;       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteCharacter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `deleteCharacter`(IN ccharacterName VARCHAR(100), IN uusername VARCHAR(30))
BEGIN
	set @uuserID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
	set @charID =
	(SELECT character_.CharacterID
    FROM character_
    WHERE character_.CharacterName = ccharacterName and character_.UserID = @uuserID);

	
    DELETE
    FROM has
    WHERE has.CharacterID = @charID;
    
	DELETE 
    FROM character_
    WHERE character_.CharacterName = ccharacterName and character_.UserID = @uuserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `displayEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`JaysonNguyen`@`%` PROCEDURE `displayEquipment`(In uusername VARCHAR(30))
BEGIN 

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price
    From Item
    Join
    (Select ItemID, Price
    From Has
    Where Has.CharacterID = @charID and IsOn = true and IsSell = false) as inter1 on inter1.ItemID = Item.ItemID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `displayInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`JaysonNguyen`@`%` PROCEDURE `displayInventory`(In uusername VARCHAR(30))
BEGIN 

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price
    From Item
    Join
    (Select ItemID, Price
    From Has
    Where Has.CharacterID = @charID and IsOn = false and IsSell = false) as inter1 on inter1.ItemID = Item.ItemID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `displayMarket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `displayMarket`()
BEGIN
            
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price
    From Item
    Join
    (Select ItemID, Price
    From Has
    Where Has.IsSell = true) as inter1 on Item.ItemID = inter1.ItemID;
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `east` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `east`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X + 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `equip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `equip`(IN uusername VARCHAR(30), IN iitemname VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
    set @itemID = (select Item.ItemID
		from Item
        where Item.Name_ = iitemname); 
    
    
    set @isOn = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID and isOn=true);
    
	
	
	set @TypeCheck1 = (select ItemType from Item where Item.ItemID = @itemID);
								       
	set @TypeCheck2 = (select count(ItemType) from Item join (select ItemID from has where CharacterID = @CharID and isOn = true)
								       as inter1 on inter1.ItemID = Item.ItemID and Item.ItemType = @TypeCheck1);							       
								       
	
	set @hasItem = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID);
    
    set @currentStatus = (select isOn from Has where @itemID = has.ItemID and @charID = has.CharacterID limit 1);
    
	update has
    set isOn = if (@hasItem > 0 and @isOn = 0 and @TypeCheck2 = 0,true,@currentStatus) 
    where @itemID = has.ItemID and @charID = has.CharacterID limit 1;
        
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `joinAlliance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `joinAlliance`(IN uusername VARCHAR(30), IN aallianceName VARCHAR(30))
BEGIN


set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
set @charName = (Select character_.CharacterName
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
set @allianceID = (Select alliance.AllianceID
				   From alliance
                   where alliance.Name_ = aallianceName);
		
            
set @charGuildID = (Select character_.GuildID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            

                    
	set @guildLeader = (select guild.GuildLeader
						From guild
                        where guild.GuildID = @charGuildID);
                        
	
                        
	IF @guildLeader = @charName THEN
		INSERT INTO belongs_to VALUES ("2021-04-30",@allianceID,@charGuildID);
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `joinGuild` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `joinGuild`(IN uusername VARCHAR(30), IN gguildName VARCHAR(30))
BEGIN

 set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	set @guildID = (Select guild.GuildID
			        From guild
                    WHERE guild.GuildName = gguildName);
                    
	update character_
    set character_.GuildID = @guildID
    where character_.CharacterID = @charID;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listAlliances` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `listAlliances`()
BEGIN

 Select alliance.Name_
 From alliance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listCharacters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `listCharacters`(IN uname VARCHAR(20))
BEGIN

	SELECT character_.CharacterName,character_.Race,character_.Level_ as Level
	FROM account_ join character_ on account_.UserID = character_.UserID
	WHERE account_.userID = character_.UserID and account_.UserName = uname;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listGuildMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `listGuildMembers`(IN uusername VARCHAR(30))
BEGIN

 set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);

 set @guildID = (Select character_.guildID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	
                    
	select character_.characterName
    from character_
    INNER JOIN guild on character_.GuildID = guild.GuildID
    WHERE character_.GuildID = @guildID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listGuilds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `listGuilds`()
BEGIN

 Select guild.GuildName,guild.GuildLeader
 From guild;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `login`(IN uname VARCHAR(30), IN passw VARCHAR(30))
BEGIN

	SELECT account_.UserName,account_.Password_,account_.AccountType,account_.UserID
	FROM account_
	WHERE account_.UserName = uname and account_.Password_ = passw;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `north` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `north`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_Y = Location_Y + 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `northeast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `northeast`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X + 1 and Location_Y = Location_Y + 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `northwwest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `northwwest`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X - 1 and Location_Y = Location_Y + 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prompt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `prompt`(IN uusername VARCHAR(20))
BEGIN
	set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);

Select Description_, gold, level_, attack, defense
    From Land
    Join
(Select gold,level_, location_X,Location_Y, attack, defense
    FROM Character_
        Join
(Select  sum(Stats_Attack) as attack, sum(Stats_Defense) as defense,CharacterID 
    From Item join (SELECT ItemID,CharacterID
    From Has where CharacterID = @charID and isOn = True) as Derp on Item.ItemID = Derp.ItemID) as fastasy on fastasy.characterID = Character_.characterID) as hell on (hell.Location_X,hell.Location_Y) = (Land.Location_X, Land.Location_Y);
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `quit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `quit`(IN uusername VARCHAR(30))
BEGIN
	set @uuserID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
    Update Character_
    Set isSelected = False
    Where UserID = @uuserID;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpg_fever_dream_accountCreation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `rpg_fever_dream_accountCreation`(IN first VARCHAR(30), IN last VARCHAR (30), IN credit int(16), IN street VARCHAR(30),IN city VARCHAR(30),IN state VARCHAR(30),IN zipcode INT(10),IN uusername VARCHAR(30), IN pass VARCHAR(30), IN e_mail VARCHAR(100))
BEGIN
	INSERT INTO Account_(PaymentInfo_FirstName, PaymentInfo_LastName, PaymentInfo_CreditCard, PaymentInfo_Address_Street, PaymentInfo_Address_City,PaymentInfo_Address_State, PaymentInfo_Address_ZipCode, UserName, Password_, Email, ServerName)
		VALUES(first,last,credit,street,city,state,zipcode,uusername,pass,e_mail,"Test Sever Please Ignore");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectCharacter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `selectCharacter`(IN uusername VARCHAR(20),IN CCharacterName VARCHAR(20))
BEGIN
	set @uuserID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
    Update Character_
    Set isSelected = False
    Where UserID = @uuserID;
    
    
    set@selectedCount = (select count(isSelected) from Character_ where UserID=@uuserID and isSelected=True);
    
   Update Character_ 
   Set isSelected = if(@selectedCount = 0,True,False) 
   where CharacterName = CCharacterName and UserID = @uuserID; 
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sellItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`JaysonNguyen`@`%` PROCEDURE `sellItem`(IN uusername VARCHAR(30), IN itemName varchar(30), In amount int)
BEGIN

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	set @itemID = (Select ItemID From Item Where itemName = Item.Name_);
            
	Update Has
    Set Has.IsSell = true
    Where Has.CharacterID = @charID and @itemID = Has.ItemID and Has.IsOn = false and Has.IsSell = false
    Limit amount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `south` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `south`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_Y = Location_Y - 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `southeast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `southeast`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X + 1 and Location_Y = Location_Y - 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `southwwest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `southwwest`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X - 1 and Location_Y = Location_Y - 1
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unequip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `unequip`(IN uusername VARCHAR(30), IN iitemname VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
    set @itemID = (select Item.ItemID
		from Item
        where Item.Name_ = iitemname); 
    
    /*
    set @isOn = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID and isOn=true);
    
	set @hasItem = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID);
    */
    -- make sure character is left with more than 0 equipment
    set @itemCheck = (select count(hasID)
	from has
    where @charID = has.CharacterID and isOn = true);
    
    set @currentStatus = (select isOn from Has where @itemID = has.ItemID and @charID = has.CharacterID limit 1);
    
	update has
    set isOn = if (@itemCheck > 1,false,@currentStatus)
    where @itemID = has.ItemID and @charID = has.CharacterID;
        
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `west` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MarcusGarity`@`%` PROCEDURE `west`(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X - 1 
    Where Character_.CharacterID = @charID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Who` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ColinMcNish`@`%` PROCEDURE `Who`(IN uuserID INT)
BEGIN
	
    set @charLocation_X = (Select character_.Location_X
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	 set @charLocation_Y = (Select character_.Location_Y
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	SELECT c.CharacterName
    From character_ as c INNER JOIN land as l on (c.Location_X,c.Location_Y) = (l.Location_X,l.Location_Y)
    WHERE (c.Location_X,c.Location_Y) = (@charLocation_X,@charLocation_Y);
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `lands`
--

/*!50001 DROP VIEW IF EXISTS `lands`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ColinMcNish`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `lands` AS select `land`.`Location_X` AS `Location_X`,`land`.`location_Y` AS `location_Y`,`land`.`LandID` AS `LandID`,`land`.`Description_` AS `Description_` from `land` order by `land`.`Location_X`,`land`.`location_Y` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `who`
--

/*!50001 DROP VIEW IF EXISTS `who`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ColinMcNish`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `who` AS select `c`.`CharacterName` AS `CharacterName`,`c`.`Location_X` AS `Location_X`,`c`.`Location_Y` AS `Location_Y`,`l`.`Description_` AS `Description_` from (`character_` `c` join `land` `l`) where ((`c`.`Location_X` = `l`.`Location_X`) and (`c`.`Location_Y` = `l`.`location_Y`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-05 16:00:57
