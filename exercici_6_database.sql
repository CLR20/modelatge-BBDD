-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: exercici_6
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `address_street` varchar(45) NOT NULL,
  `address_number` int NOT NULL,
  `address_floor` int NOT NULL,
  `address_door` varchar(4) NOT NULL,
  `address_city` varchar(45) NOT NULL,
  `address_postalcode` varchar(5) NOT NULL,
  `address_country` varchar(45) NOT NULL,
  `address_telephon` int DEFAULT NULL,
  `address_fax` int DEFAULT NULL,
  `address_nif` varchar(8) DEFAULT NULL,
  `address_email` varchar(45) DEFAULT NULL,
  `address_registry` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'street1',1,1,'1','city1','11111','country1',1111111,11111110,'A1111111',NULL,'2020-10-09 09:32:44'),(2,'street1',2,2,'2','city2','22222','country2',222222222,222222220,'A2222222',NULL,'2020-10-09 09:35:05'),(3,'street1',3,3,'3','city3','33333','country3',333333333,333333330,'A333333',NULL,'2020-10-09 09:35:05'),(4,'street4',4,4,'4','city4','44444','country4',444444444,NULL,NULL,'anna@email.com','2020-10-09 09:56:11'),(5,'street5',5,5,'5','city5','55555','country5',555555555,NULL,NULL,'pere@email.com','2020-10-09 09:58:11'),(6,'street6',6,6,'6','city6','66666','country4',666666666,NULL,NULL,'berta@email.com','2020-10-09 09:58:11'),(7,'street7',7,7,'7','city7','77777','country7',777777777,NULL,NULL,'marc@email.com','2020-10-09 10:00:20');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `idBrand` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL,
  `Product_iProduct` int NOT NULL,
  `Supplier_idSupplier` int NOT NULL,
  PRIMARY KEY (`idBrand`,`Product_iProduct`,`Supplier_idSupplier`),
  KEY `fk_Brand_Product_idx` (`Product_iProduct`),
  KEY `fk_Brand_Supplier1_idx` (`Supplier_idSupplier`),
  CONSTRAINT `fk_Brand_Product` FOREIGN KEY (`Product_iProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_Brand_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (2,'1',1,1),(3,'1',2,1),(4,'1',3,1),(5,'1',4,1),(6,'2',5,1),(7,'3',6,2),(8,'3',7,3),(9,'4',8,3);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Client_name` varchar(45) NOT NULL,
  `Address_idAddress` int NOT NULL,
  `Recommended_idrecommended` int NOT NULL,
  PRIMARY KEY (`idClient`,`Address_idAddress`,`Recommended_idrecommended`),
  KEY `fk_Client_Address1_idx` (`Address_idAddress`),
  KEY `fk_Client_Recommended1_idx` (`Recommended_idrecommended`),
  KEY `fk_Client_Recommended2_idx` (`Client_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'anna prats',4,1),(3,'berta roca',6,2),(4,'marc lluna',7,3),(2,'pere pou',5,0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culdampolla`
--

DROP TABLE IF EXISTS `culdampolla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culdampolla` (
  `Supplier_idSupplier` int NOT NULL,
  `Employee_idEmployee` int NOT NULL,
  `Transaction_idTransaction` int NOT NULL,
  `Client_idClient` int NOT NULL,
  PRIMARY KEY (`Supplier_idSupplier`,`Employee_idEmployee`,`Transaction_idTransaction`,`Client_idClient`),
  KEY `fk_Culdampolla_Employee1_idx` (`Employee_idEmployee`),
  KEY `fk_Culdampolla_Transaction1_idx` (`Transaction_idTransaction`),
  KEY `fk_Culdampolla_Client1_idx` (`Client_idClient`),
  CONSTRAINT `fk_Culdampolla_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`),
  CONSTRAINT `fk_Culdampolla_Employee1` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `fk_Culdampolla_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `supplier` (`idSupplier`),
  CONSTRAINT `fk_Culdampolla_Transaction1` FOREIGN KEY (`Transaction_idTransaction`) REFERENCES `transaction` (`idTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culdampolla`
--

LOCK TABLES `culdampolla` WRITE;
/*!40000 ALTER TABLE `culdampolla` DISABLE KEYS */;
INSERT INTO `culdampolla` VALUES (1,2,1,1),(3,3,2,1);
/*!40000 ALTER TABLE `culdampolla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'sara'),(2,'miquel'),(3,'julia');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `product_brand` varchar(45) NOT NULL,
  `product_left_grad` decimal(5,0) NOT NULL,
  `product_right_grad` decimal(5,0) NOT NULL,
  `product_material` varchar(45) NOT NULL,
  `product_mat_color` varchar(45) DEFAULT NULL,
  `product_left_color` varchar(45) DEFAULT NULL,
  `product_right_color` varchar(45) DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'brand1',1,1,'frameless','grey','clear','clear',80),(2,'brand1',1,1,'frameless','grey','clear','clear',80),(3,'brand1',2,3,'pasta','red','black','black',100),(4,'brand1',2,3,'pasta','red','black','black',100),(5,'brand2',1,3,'pasta','white','clear','clear',100),(6,'brand3',3,3,'metal','gold','clear','clear',200),(7,'brand3',1,1,'metal','silver','clear','clear',180),(8,'brand4',2,2,'frameless','clear','clear','clear',90);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended`
--

DROP TABLE IF EXISTS `recommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended` (
  `idrecommended` int NOT NULL AUTO_INCREMENT,
  `Client_client` int NOT NULL,
  `client_recommendedby` varchar(45) NOT NULL,
  PRIMARY KEY (`idrecommended`,`Client_client`),
  KEY `fk_Recommended_Client1_idx` (`Client_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended`
--

LOCK TABLES `recommended` WRITE;
/*!40000 ALTER TABLE `recommended` DISABLE KEYS */;
INSERT INTO `recommended` VALUES (1,1,''),(2,3,''),(3,4,'');
/*!40000 ALTER TABLE `recommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) NOT NULL,
  `Address_idAddress` int NOT NULL,
  PRIMARY KEY (`idSupplier`,`Address_idAddress`),
  KEY `fk_Supplier_Address1_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Supplier_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'supplier1',1),(2,'supplier2',2),(3,'supplier3',3);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `idTransaction` int NOT NULL AUTO_INCREMENT,
  `Client_idClient` int NOT NULL,
  `Employee_idEmployee` int NOT NULL,
  `Product_idProduct` int NOT NULL,
  PRIMARY KEY (`idTransaction`,`Client_idClient`,`Employee_idEmployee`,`Product_idProduct`),
  KEY `fk_Transaction_Client1_idx` (`Client_idClient`),
  KEY `fk_Transaction_Employee1_idx` (`Employee_idEmployee`),
  KEY `fk_Transaction_Product1_idx` (`Product_idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,2,1),(2,1,3,6),(3,2,2,4),(4,3,1,7);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-14 12:54:22
