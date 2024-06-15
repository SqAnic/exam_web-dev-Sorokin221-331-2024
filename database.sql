-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_2415_exam
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('8e0d3d58ab1d');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genre` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `fk_book_genre_genre_id_genres` (`genre_id`),
  CONSTRAINT `fk_book_genre_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_book_genre_genre_id_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (2,6),(6,6),(11,6),(17,6),(21,6),(6,7),(11,7),(20,7),(23,7),(16,9),(18,9),(2,10),(6,11),(13,11),(17,11),(20,11),(22,11),(16,12),(18,12),(18,13),(24,14),(24,15),(2,16),(22,17),(13,19),(16,19),(17,19),(21,19),(23,20),(24,22),(18,23),(20,23),(23,23),(13,24),(17,24),(20,24),(22,24),(24,24);
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `year` int(11) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `pages` int(11) NOT NULL,
  `cover_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_cover_id_covers` (`cover_id`),
  CONSTRAINT `fk_books_cover_id_covers` FOREIGN KEY (`cover_id`) REFERENCES `covers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Этюд в багровых тонах','<p>Детективная повесть <strong>Артура Конана Дойла</strong>, опубликованная в 1887 году. Именно в этом произведении впервые появляется <strong>Шерлок Холмс</strong></p>\n',1887,'Ward Lock & Co','Артур Конан Дойл',60,2),(6,'Хоббит, или Туда и обратно!','<p><em>В основе сюжета — путешествие хоббита Бильбо Бэггинса, волшебника Гэндальфа и тринадцати гномов во главе с Торином Дубощитом. Их путь лежит к Одинокой Горе, где находятся гномьи сокровища, охраняемые драконом Смаугом</em></p>\n',1937,'George Allen & Unwin','Джон Рональд Руэл Толкин',400,6),(11,'Гарри Поттер и философский камень','<p>Сюжет строится вокруг главного героя, сироты <strong>Гарри Поттера</strong>, который узнаёт, что он волшебник в его одиннадцатый день рождения. Обучаясь в школе чародейства и волшебства <strong>«Хогвартс»</strong>, он заводит себе близких друзей, Рона Уизли и Гермиону Грейнджер, с помощью которых останавливает попытку возвращения злого волшебника Волан-де-Морта, убившего родителей Гарри, когда ему было всего шесть месяцев</p>\n',1997,'Bloomsbury Publishing','Джоан Роулинг',300,11),(13,'1984','<p>Антиутопический роман о тоталитарном государстве, где за всеми следят, и правительство контролирует все аспекты жизни.</p>\n',1949,'Secker & Warburg','Джордж Оруэлл',328,13),(16,'Унесённые ветром','<p>Эпическая история любви и выживания на фоне гражданской войны в США.</p>\n',1936,'Macmillan Publishers','Маргарет Митчелл',1037,16),(17,'Преступление и наказание','<p>Психологический роман о студенте, который совершает убийство и испытывает моральные муки.</p>\n',1866,'The Russian Messenger','Фёдор Достоевский',671,17),(18,'Маленькие женщины','<p>История взросления четырех сестёр, их борьбы и достижений в XIX веке.</p>\n',1868,'Roberts Brothers','Луиза Мэй Олкотт',759,18),(20,'451 градус по Фаренгейту','<p>Роман описывает американское общество близкого будущего, в котором книги находятся <strong>под запретом</strong>; «пожарные», к числу которых принадлежит и главный герой Гай Монтэг, сжигают любые найденные книги.</p>\n',1953,'Ballantine Books','Рэй Брэдбери',356,19),(21,'Гордость и предубеждение','<p>Роман, исследующий вопросы класса, брака и морали в Англии XIX века.</p>\n',1813,'T. Egerton','Джейн Остин',168,20),(22,'Над пропастью во ржи','<p>Роман о переживаниях молодого человека в Манхэттене после исключения из подготовительной школы.</p>\n',1951,'Little, Brown and Company','Дж. Д. Сэлинджер',243,21),(23,'Джейн Эйр','<p>Роман, описывающий переживания его одноименной героини, включая ее взросление и любовь к мистеру Рочестеру.</p>\n',1847,'Smith, Elder & Co.','Шарлотта Бронте',432,22),(24,' Великий Гэтсби','<p>Роман об американской мечте и крахе тех, кто пытается достичь ее иллюзорных целей.</p>\n',1925,'Charles Scribner\'s Sons','Ф. Скотт Фицджеральд',231,14);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_book`
--

DROP TABLE IF EXISTS `collection_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_book` (
  `collection_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`collection_id`,`book_id`),
  KEY `fk_collection_book_book_id_books` (`book_id`),
  CONSTRAINT `fk_collection_book_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_collection_book_collection_id_collections` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_book`
--

LOCK TABLES `collection_book` WRITE;
/*!40000 ALTER TABLE `collection_book` DISABLE KEYS */;
INSERT INTO `collection_book` VALUES (2,11),(2,16),(3,16);
/*!40000 ALTER TABLE `collection_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collections_user_id_users` (`user_id`),
  CONSTRAINT `fk_collections_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (2,'Мои любимые книги!',3),(3,'Ненавижу',3);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covers`
--

DROP TABLE IF EXISTS `covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covers`
--

LOCK TABLES `covers` WRITE;
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
INSERT INTO `covers` VALUES (2,'book_img2.jpeg','image/jpeg','15ad29af19c7c5169014bc7b3143e2a0'),(6,'book_img3.jpeg','image/jpeg','08ee9c5bef7eb34a55b2c5f7d7bbc8ff'),(11,'book_img4.jpeg','image/jpeg','db975232a5662521116f9873c34f328f'),(13,'book_img6.jpeg','image/jpeg','4a524899fbb55a20a1b24c70a380b890'),(14,'cover.jpg.webp','image/webp','73ff87fac2bdc4ae9749ff49fc6d28a9'),(16,'Первое_издание_романа_\"Унесённые_ветром\".jpg','image/jpeg','dc3e25e9f22a04996e01d09b38520122'),(17,'images_tolstoy.jpeg','image/jpeg','c16feb2bd9f7beaf48a4e76e9efca253'),(18,'images101.jpeg','image/jpeg','dd4789e7357c3bcc343fa026c831c501'),(19,'book_img1.jpeg','image/jpeg','168dd59df4015c6e2ac3d1265bceccc5'),(20,'images_19.jpeg','image/jpeg','4ed8c4c49e8097f38df2e2c2d78aff52'),(21,'cover1__w820.jpg','image/jpeg','6822faf91ed17b51606d23b3b11b629b'),(22,'images_kek.jpeg','image/jpeg','aa091d336caf483ac76be34c6d6e2508');
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_genres_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (13,'Биография'),(9,'Детективы'),(19,'Драма'),(12,'Исторический'),(18,'Комедия'),(22,'Мемуары'),(15,'Мистика'),(14,'Научная литература'),(17,'Поэзия'),(11,'Приключения'),(24,'Психология'),(21,'Публицистика'),(6,'Роман'),(25,'Триллер'),(16,'Ужасы'),(10,'Фантастика'),(23,'Философия'),(7,'Фэнтези'),(20,'Эссе');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `text` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_book_id_books` (`book_id`),
  KEY `fk_reviews_user_id_users` (`user_id`),
  CONSTRAINT `fk_reviews_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_reviews_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,5,'<p>Удачи!</p>\n','2024-06-14 09:23:05'),(2,11,1,5,'<p>Удачи!</p>\n','2024-06-14 17:44:05'),(4,11,2,3,'<p>Больле люблю Таню Гроттер!</p>\n','2024-06-14 17:48:40');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор','Суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг'),(2,'Модератор','Может редактировать данные книг и производить модерацию рецензий'),(3,'Пользователь','Может оставлять рецензии');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_role_id_roles` (`role_id`),
  CONSTRAINT `fk_users_role_id_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','scrypt:32768:8:1$tlnheLMkyw1yenmE$738bf38ae428641b1d6ab9a61ea646b26aa7d8394cae14578e70b00d8a8cd5f12269a576920c8bd92f0a157c9ba69ba09cbf3f8f437865d398df38a775c99106','Сорокин','Егор','Андреевич',1),(2,'moderator','scrypt:32768:8:1$tlnheLMkyw1yenmE$738bf38ae428641b1d6ab9a61ea646b26aa7d8394cae14578e70b00d8a8cd5f12269a576920c8bd92f0a157c9ba69ba09cbf3f8f437865d398df38a775c99106','Савочкин','Андрей','Игоревич',2),(3,'user','scrypt:32768:8:1$tlnheLMkyw1yenmE$738bf38ae428641b1d6ab9a61ea646b26aa7d8394cae14578e70b00d8a8cd5f12269a576920c8bd92f0a157c9ba69ba09cbf3f8f437865d398df38a775c99106','Максимович','Богдан','Неретин',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16  0:11:51
