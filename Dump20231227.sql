-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `группы_услуг`
--

DROP TABLE IF EXISTS `группы_услуг`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `группы_услуг` (
  `id` int NOT NULL,
  `Название` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `группы_услуг`
--

LOCK TABLES `группы_услуг` WRITE;
/*!40000 ALTER TABLE `группы_услуг` DISABLE KEYS */;
INSERT INTO `группы_услуг` VALUES (1,'Услуги парихмахерского зала'),(2,'Услуги маникюрного кабинета'),(3,'Услуги педикюрного кабинета'),(4,'Услуги массажного кабинета'),(5,'СПА-услуги'),(6,'Косметологические услуги');
/*!40000 ALTER TABLE `группы_услуг` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `должности`
--

DROP TABLE IF EXISTS `должности`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `должности` (
  `id` int NOT NULL,
  `Название` varchar(45) DEFAULT NULL,
  `Оклад` double DEFAULT NULL,
  `Группы_услуг_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Должности_Группы_услуг1_idx` (`Группы_услуг_id`),
  CONSTRAINT `fk_Должности_Группы_услуг1` FOREIGN KEY (`Группы_услуг_id`) REFERENCES `группы_услуг` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `должности`
--

LOCK TABLES `должности` WRITE;
/*!40000 ALTER TABLE `должности` DISABLE KEYS */;
INSERT INTO `должности` VALUES (1,'Женский мастер',45000,1),(2,'Маникюрист',32000,2),(3,'Мужской мастер',34000,1),(4,'Парикмахер-универсал',57000,1);
/*!40000 ALTER TABLE `должности` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиенты`
--

DROP TABLE IF EXISTS `клиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `клиенты` (
  `id` int NOT NULL,
  `ФИО` varchar(45) DEFAULT NULL,
  `Телефон` varchar(45) DEFAULT NULL,
  `Адрес` varchar(45) DEFAULT NULL,
  `Контакты_id` int DEFAULT NULL,
  `Дата_рождения` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Клиенты_Контакты1_idx` (`Контакты_id`),
  CONSTRAINT `fk_Клиенты_Контакты1` FOREIGN KEY (`Контакты_id`) REFERENCES `контакты` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиенты`
--

LOCK TABLES `клиенты` WRITE;
/*!40000 ALTER TABLE `клиенты` DISABLE KEYS */;
INSERT INTO `клиенты` VALUES (1,'Шарифуллин Ринас Рамилевич','+79393321212','ДУ 3/1',1,'12.06.2003'),(2,'Сабиров Камиль Рамилевич','+79872541243','ДУ 12',2,'04.05.2003'),(3,'Хакимов Ильмиир Радикович','+79175432354','ДУ 2',3,'06.02.2003');
/*!40000 ALTER TABLE `клиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `контакты`
--

DROP TABLE IF EXISTS `контакты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `контакты` (
  `id` int NOT NULL,
  `Мессенджер` varchar(45) DEFAULT NULL,
  `E-mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `контакты`
--

LOCK TABLES `контакты` WRITE;
/*!40000 ALTER TABLE `контакты` DISABLE KEYS */;
INSERT INTO `контакты` VALUES (1,'Вк','shrinasrml@bk.ru'),(2,'Инстаграмм','kamilS@mail.ru'),(3,'-','Ilmir2003@yandex.ru');
/*!40000 ALTER TABLE `контакты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `посещения`
--

DROP TABLE IF EXISTS `посещения`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `посещения` (
  `id` int NOT NULL,
  `Дата` date DEFAULT NULL,
  `Статус` varchar(45) DEFAULT NULL,
  `Услуги_id` int DEFAULT NULL,
  `Сотрудники_id` int DEFAULT NULL,
  `Клиенты_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Посещения_Услуги_idx` (`Услуги_id`),
  KEY `fk_Посещения_Сотрудники1_idx` (`Сотрудники_id`),
  KEY `fk_Посещения_Клиенты1_idx` (`Клиенты_id`),
  CONSTRAINT `fk_Посещения_Клиенты1` FOREIGN KEY (`Клиенты_id`) REFERENCES `клиенты` (`id`),
  CONSTRAINT `fk_Посещения_Сотрудники1` FOREIGN KEY (`Сотрудники_id`) REFERENCES `сотрудники` (`id`),
  CONSTRAINT `fk_Посещения_Услуги` FOREIGN KEY (`Услуги_id`) REFERENCES `услуги` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `посещения`
--

LOCK TABLES `посещения` WRITE;
/*!40000 ALTER TABLE `посещения` DISABLE KEYS */;
INSERT INTO `посещения` VALUES (1,'2023-11-02','Пришел',1,1,1),(2,'2023-10-24','Пришел',3,4,3),(3,'2023-11-12','Пришел',1,3,2);
/*!40000 ALTER TABLE `посещения` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `посещения_BEFORE_INSERT` BEFORE INSERT ON `посещения` FOR EACH ROW BEGIN
    SET NEW.Дата = NOW();
    
    IF NEW.Клиенты_id IS NULL OR NEW.Услуги_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Необходимо указать клиента и услугу для посещения.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `сотрудники`
--

DROP TABLE IF EXISTS `сотрудники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `сотрудники` (
  `id` int NOT NULL,
  `ФИО` varchar(45) DEFAULT NULL,
  `Адрес` varchar(45) DEFAULT NULL,
  `Телефон` varchar(45) DEFAULT NULL,
  `Должности_id` int DEFAULT NULL,
  `Дата_рождения` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Сотрудники_Должности1_idx` (`Должности_id`),
  CONSTRAINT `fk_Сотрудники_Должности1` FOREIGN KEY (`Должности_id`) REFERENCES `должности` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сотрудники`
--

LOCK TABLES `сотрудники` WRITE;
/*!40000 ALTER TABLE `сотрудники` DISABLE KEYS */;
INSERT INTO `сотрудники` VALUES (1,'Муртазин Айзат Радикович','ДУ 3/1','+79195432354',1,'23.05.2004'),(2,'Алпатов Иван Алексеевич','ДУ 7','+79123433365',4,'13.06.2003'),(3,'Федоров Максим Сергеевич','ДУ 5','+79879261254',3,'14.04.2002'),(4,'Шарафутдинов Равиль Рафаилович','ул. Академика Парина 6','+79393254465',2,'15.02.2000');
/*!40000 ALTER TABLE `сотрудники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `услуги`
--

DROP TABLE IF EXISTS `услуги`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `услуги` (
  `id` int NOT NULL,
  `Название` varchar(45) DEFAULT NULL,
  `Себестоимость` double DEFAULT NULL,
  `Описание` varchar(45) DEFAULT NULL,
  `Группы_услуг_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Услуги_Группы_услуг1_idx` (`Группы_услуг_id`),
  CONSTRAINT `fk_Услуги_Группы_услуг1` FOREIGN KEY (`Группы_услуг_id`) REFERENCES `группы_услуг` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `услуги`
--

LOCK TABLES `услуги` WRITE;
/*!40000 ALTER TABLE `услуги` DISABLE KEYS */;
INSERT INTO `услуги` VALUES (1,'Стрижка',120,'Стрижка волос',1),(2,'Окраска',240,'Окрашивание волос',1),(3,'Маникюр',310,'Маникюр',2);
/*!40000 ALTER TABLE `услуги` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `услуги_BEFORE_INSERT` BEFORE INSERT ON `услуги` FOR EACH ROW BEGIN
    DECLARE avg_cost INTEGER;
    SELECT AVG(Себестоимость) INTO avg_cost
    FROM Услуги
    WHERE Группы_услуг_id = NEW.Группы_услуг_id;

    IF NEW.Себестоимость <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Стоимость услуги не может быть отрицательной.';
	END IF;
    
    IF avg_cost IS NOT NULL THEN
        SET NEW.Себестоимость = NEW.Себестоимость + (avg_cost * 0.1);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetTotalServicesByEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalServicesByEmployee`(employee_id INT, start_date DATE, end_date DATE) RETURNS int
    READS SQL DATA
BEGIN
DECLARE total_services INT;

    SELECT COUNT(*) INTO total_services
    FROM Посещения
    JOIN Сотрудники ON Посещения.Сотрудники_id = Сотрудники.id
    JOIN Услуги ON Посещения.Услуги_id = Услуги.id
    WHERE Сотрудники.id = employee_id
    AND Посещения.Дата BETWEEN start_date AND end_date;

    RETURN total_services;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-27 11:50:17
