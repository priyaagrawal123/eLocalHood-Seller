-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: e_Localhood3
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Locality` varchar(50) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `HouseName` varchar(100) NOT NULL,
  `Pincode` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessInformation`
--

DROP TABLE IF EXISTS `BusinessInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BusinessInformation` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `BusinessOwnerID` bigint NOT NULL,
  `ShopName` varchar(50) DEFAULT NULL,
  `ShopCategory` varchar(50) DEFAULT NULL,
  `WhatsAppNo` bigint NOT NULL,
  `DeliveryDetails` varchar(50) NOT NULL,
  `ShopPhoto` blob,
  `PhotoInsideShop` blob,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `BusinessOwnerID` (`BusinessOwnerID`),
  CONSTRAINT `BusinessInformation_ibfk_1` FOREIGN KEY (`BusinessOwnerID`) REFERENCES `BusinessOwner` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessInformation`
--

LOCK TABLES `BusinessInformation` WRITE;
/*!40000 ALTER TABLE `BusinessInformation` DISABLE KEYS */;
INSERT INTO `BusinessInformation` VALUES (2,2,NULL,NULL,7822969515,'Free Delivery within 1 KM',NULL,NULL,'2024-05-30 17:34:16');
/*!40000 ALTER TABLE `BusinessInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessOwner`
--

DROP TABLE IF EXISTS `BusinessOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BusinessOwner` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `AadharCardNo` bigint NOT NULL,
  `AadharFrontImage` blob,
  `AadharBackImage` blob,
  `PassportPhotoImage` blob,
  `AccountHolderName` varchar(100) NOT NULL,
  `BankACNo` bigint NOT NULL,
  `IFSCCode` varchar(11) NOT NULL,
  `UPIID` varchar(25) NOT NULL,
  `QRCodeImage` blob,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `BusinessOwner_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessOwner`
--

LOCK TABLES `BusinessOwner` WRITE;
/*!40000 ALTER TABLE `BusinessOwner` DISABLE KEYS */;
INSERT INTO `BusinessOwner` VALUES (2,117,626230347162,NULL,NULL,NULL,'Dhanraj Chitte',12345678952,'SBIN0000418','7822969515@ybl',NULL,'2024-05-30 17:25:32');
/*!40000 ALTER TABLE `BusinessOwner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `ProductID` bigint NOT NULL,
  `Quantity` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDescription`
--

DROP TABLE IF EXISTS `OrderDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDescription` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Order_1ID` bigint NOT NULL,
  `SellerID1` bigint DEFAULT NULL,
  `ProductID` bigint NOT NULL,
  `Price` bigint DEFAULT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Quantity` int NOT NULL,
  `CustomerID1` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Order_1ID` (`Order_1ID`),
  KEY `ProductID` (`ProductID`),
  KEY `fk_CustomerID1` (`CustomerID1`),
  KEY `fk_SellerID1` (`SellerID1`),
  CONSTRAINT `fk_CustomerID1` FOREIGN KEY (`CustomerID1`) REFERENCES `Order_1` (`CustomerID`),
  CONSTRAINT `fk_SellerID1` FOREIGN KEY (`SellerID1`) REFERENCES `Order_1` (`SellerID`),
  CONSTRAINT `OrderDescription_ibfk_1` FOREIGN KEY (`Order_1ID`) REFERENCES `Order_1` (`ID`),
  CONSTRAINT `OrderDescription_ibfk_2` FOREIGN KEY (`SellerID1`) REFERENCES `User` (`ID`),
  CONSTRAINT `OrderDescription_ibfk_3` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDescription`
--

LOCK TABLES `OrderDescription` WRITE;
/*!40000 ALTER TABLE `OrderDescription` DISABLE KEYS */;
INSERT INTO `OrderDescription` VALUES (26,11,117,102,400,'2024-05-31 08:48:39',1,118),(27,13,119,107,15000,'2024-05-31 08:50:00',1,118),(28,14,120,104,500,'2024-05-31 08:51:18',1,118),(29,14,120,105,300,'2024-05-31 08:53:02',2,118),(30,15,121,106,200,'2024-05-31 08:54:45',2,118),(31,15,121,107,15000,'2024-05-31 08:55:36',2,118),(32,16,122,109,50000,'2024-05-31 08:56:59',1,118),(35,16,122,110,100,'2024-05-31 09:02:59',2,118),(36,16,122,102,400,'2024-05-31 09:04:54',1,118),(37,17,123,106,400,'2024-05-31 09:06:36',2,118);
/*!40000 ALTER TABLE `OrderDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_1`
--

DROP TABLE IF EXISTS `Order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_1` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `SellerID` bigint DEFAULT NULL,
  `NetAmount` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CustomerID` bigint DEFAULT NULL,
  `Status` varchar(25) NOT NULL,
  `TypeOfProduct` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`SellerID`),
  KEY `fk_CustomerID` (`CustomerID`),
  CONSTRAINT `fk_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `User` (`ID`),
  CONSTRAINT `Order_1_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_1`
--

LOCK TABLES `Order_1` WRITE;
/*!40000 ALTER TABLE `Order_1` DISABLE KEYS */;
INSERT INTO `Order_1` VALUES (11,117,400,'2024-05-31 08:26:22',118,'pending',1),(13,119,15000,'2024-05-31 08:37:16',118,'accepted',1),(14,120,1100,'2024-05-31 08:39:45',118,'pending',2),(15,121,30400,'2024-05-31 08:42:13',118,'rejected',2),(16,122,50500,'2024-05-31 08:44:51',118,'accepted',3),(17,123,400,'2024-05-31 08:45:55',118,'rejected',1);
/*!40000 ALTER TABLE `Order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `BusinessInformationID` bigint NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` bigint NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Size` varchar(500) DEFAULT NULL,
  `Color` varchar(100) DEFAULT NULL,
  `PhotoURL` longtext,
  `Weight` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BusinessInformationID` (`BusinessInformationID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`BusinessInformationID`) REFERENCES `BusinessInformation` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (102,2,'Watch',400,'Fancy Product','2024-05-30 17:45:03',NULL,'Goldish','/Product/3867582_parentPhotoFile.jpg','250 gm','The Watch is for the Mens Only. It is not useful for the Women\'s.'),(104,2,'Keyboard',500,'Computer Product','2024-05-31 07:57:10',NULL,'Black','/Product/3867582_applicantPhotoFile.jpeg','1 Kg',NULL),(105,2,'Mouse',300,'Computer Product','2024-05-31 07:58:01',NULL,'Black','/Product/3867582_applicantPhotoFile.jpeg','200 gm',NULL),(106,2,'Monitor',200,'Computer Product','2024-05-31 07:58:48',NULL,'Black','/Product/3867582_applicantPhotoFile.jpeg','5 Kg',NULL),(107,2,'CPU',15000,'Computer Product','2024-05-31 07:59:42',NULL,'Black','/Product/3867582_applicantPhotoFile.jpeg','2 Kg',NULL),(108,2,'Mobile',15000,'Electronic Product','2024-05-31 08:02:35','7 inches','Green','/Product/3867582_applicantPhotoFile.jpeg','500 gm','The Company of the mobile is Redmi.And the mobile Redmi 9 Prime'),(109,2,'Refrigerator',50000,'Electronic Product','2024-05-31 08:03:45','4.5 Feet','Red','/Product/3867582_applicantPhotoFile.jpeg','10 Kg',NULL),(110,2,'NoteBook',50,'Education Product','2024-05-31 08:05:12','30*15','White','/Product/3867582_applicantPhotoFile.jpeg','100 gm',NULL),(113,2,'Shirt',1000,'Fancy Product','2024-06-01 02:38:32','M,L,XXL,S','White','/Product/3867582_applicantPhotoFile.jpeg','200 gm',NULL),(114,2,'Jeans',1000,'Fancy Product','2024-06-01 02:39:48','30,32,34,28','Black','/Product/3867582_applicantPhotoFile.jpeg','200 gm',NULL),(115,2,'Fan Usha',5000,'Electronic Product','2024-06-01 02:40:51',NULL,'Black','/Product/3867582_applicantPhotoFile.jpeg',NULL,NULL);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Role` varchar(25) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Customer','2024-02-06 14:36:35'),(2,'Seller','2024-02-06 14:38:38'),(3,'Service Provider','2024-02-06 14:39:28');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopAddress`
--

DROP TABLE IF EXISTS `ShopAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShopAddress` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `BusinessInformationID` bigint NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Locality` varchar(50) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Pincode` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `BusinessInformationID` (`BusinessInformationID`),
  CONSTRAINT `ShopAddress_ibfk_1` FOREIGN KEY (`BusinessInformationID`) REFERENCES `BusinessInformation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopAddress`
--

LOCK TABLES `ShopAddress` WRITE;
/*!40000 ALTER TABLE `ShopAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShopAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `RoleID` bigint NOT NULL,
  `EmailID` varchar(100) NOT NULL,
  `PhoneNo` bigint NOT NULL,
  `Password` varchar(25) NOT NULL,
  `OTP` bigint NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (117,2,'chittedhanraj3@gmail.com',7822969515,'CDChitte@1603',1111,NULL,NULL,'2024-05-30 17:01:14'),(118,1,'chittevalmik95@gmail.com',9518955343,'valmik@1711',1111,NULL,NULL,'2024-05-31 08:16:24'),(119,2,'priya@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:20:45'),(120,2,'ganesh@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:21:01'),(121,2,'pratik@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:21:11'),(122,2,'siddhesh@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:21:24'),(123,2,'stephen@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:21:50'),(124,2,'chandu@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:22:03'),(125,2,'darshan@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:22:15'),(126,2,'suyash@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:22:23'),(127,2,'suraj@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:22:34'),(128,2,'sushant@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:22:42'),(129,2,'vidyani@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:22:53'),(130,2,'rutuja@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:23:02'),(131,2,'shubhada@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-05-31 08:23:13'),(132,2,'priyaagaraw5g4@gmail.com',9867565566,'Priya@12356',1111,NULL,NULL,'2024-05-31 09:33:11'),(133,2,'priyaagrawaldarshan@gmail.com',9876547808,'priya@123A',1111,NULL,NULL,'2024-05-31 14:07:53'),(134,2,'dhanrajchitte9@gmail.com',7822969515,'Issc@1994',1111,NULL,NULL,'2024-06-01 02:35:26'),(135,2,'priyaagrawal@gmail.com',8975766502,'priyaag@123A',1111,NULL,NULL,'2024-06-01 05:06:28');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 12:39:52
