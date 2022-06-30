-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: memes_gallery
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_post` int NOT NULL,
  `texto` varchar(255) NOT NULL,
  `data_comentario` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int NOT NULL COMMENT 'autor do comentario',
  PRIMARY KEY (`id_comentario`),
  UNIQUE KEY `id_comentario_UNIQUE` (`id_comentario`),
  KEY `id_post_idx` (`id_post`),
  KEY `id_usuarios_idx` (`id_usuario`),
  CONSTRAINT `id_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  CONSTRAINT `id_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,1,'Muito Engraçado kkkkk rido alto','2022-06-22 14:53:34',3),(2,1,'Bem assim mesmo','2022-06-22 14:54:14',2),(3,2,'hahahahahaha','2022-06-22 16:20:47',2);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtidas`
--

DROP TABLE IF EXISTS `curtidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtidas` (
  `id_curtidas` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL COMMENT 'id do usuario que curtiu',
  `id_post` int NOT NULL,
  PRIMARY KEY (`id_curtidas`),
  UNIQUE KEY `id_curtidas_UNIQUE` (`id_curtidas`),
  KEY `id_usuariolike_idx` (`id_usuario`),
  KEY `id_postlike_idx` (`id_post`),
  CONSTRAINT `id_postlike` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  CONSTRAINT `id_usuariolike` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtidas`
--

LOCK TABLES `curtidas` WRITE;
/*!40000 ALTER TABLE `curtidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `curtidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria`
--

DROP TABLE IF EXISTS `galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galeria` (
  `id_galeria` int NOT NULL,
  `id_post` int NOT NULL,
  `data_savepost` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_galeria`),
  KEY `id_post_idx` (`id_post`),
  CONSTRAINT `id_postsalvo` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria`
--

LOCK TABLES `galeria` WRITE;
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id_post` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `postagem` varchar(255) NOT NULL COMMENT 'midia de postagem: imagem, gif, video.',
  `descricao` varchar(255) DEFAULT NULL,
  `feito_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_post`),
  UNIQUE KEY `id_post_UNIQUE` (`id_post`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-ci_FNZSacgqLYRbGST5MiKP3RRViybPR4g&usqp=CAU',NULL,'2022-06-21 15:49:54'),(2,1,'https://pbs.twimg.com/media/FVth9f6WQAEwaCC?format=jpg&name=small',NULL,'2022-06-21 15:56:44'),(3,2,'https://i.pinimg.com/564x/51/1c/52/511c52e616b482ec3a546ae035b8f006.jpg','KKKKKKKK','2022-06-22 14:34:37'),(4,12,'https://i.pinimg.com/564x/56/43/68/564368430f1b940aca9a669830e5665d.jpg','KKKK','2022-06-22 16:23:12'),(7,12,'https://techcrunch.com/wp-content/uploads/2014/06/babygif.gif?w=700&crop=1','Muito legal eu queria dançar assim','2022-06-22 16:53:20'),(8,1,'https://i.pinimg.com/236x/74/48/47/744847ca7c45e8b563aff2ee6d27bafb.jpg','Eu gosto disso muito adulto','2022-06-29 15:16:13'),(9,1,'https://i.pinimg.com/236x/74/48/47/744847ca7c45e8b563aff2ee6d27bafb.jpg',NULL,'2022-06-29 15:17:30');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `nome_usuario` varchar(45) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `biografia` varchar(255) DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT 'https://i.pinimg.com/736x/6f/f7/d9/6ff7d999092654ca48eba759140a8273.jpg',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `nome_usuario_UNIQUE` (`nome_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Susane','Susu','4321',NULL,NULL,'2022-06-14 00:00:00'),(2,'Luiza','Luma','1234',NULL,NULL,'2022-06-14 00:00:00'),(3,'Ruth','Alien','2134',NULL,NULL,'2022-06-14 00:00:00'),(11,'Bernardo','Berni','1010',NULL,NULL,'2022-06-15 15:44:49'),(12,'murilo','murilosccp','1234',NULL,NULL,'2022-06-22 16:12:45'),(13,'Conrado','Concon','1236',NULL,NULL,'2022-06-23 14:56:20'),(14,'Jojo','JO','1245',NULL,NULL,'2022-06-23 14:56:44'),(15,'','','',NULL,NULL,'2022-06-23 14:57:06'),(18,'Vick Fuentes','PTV','1234',NULL,NULL,'2022-06-23 16:24:01'),(19,'Victor','vick','1234',NULL,NULL,'2022-06-23 16:28:56'),(21,'Vick Fuentes','Victor','1234',NULL,NULL,'2022-06-23 16:40:26'),(24,'Vick Fuentes','PTVS','1234',NULL,NULL,'2022-06-23 16:56:05'),(28,'Vick Fuentes','PTVS0','1234',NULL,NULL,'2022-06-23 17:06:40'),(29,'Vick Fuentes','PTV@36363','9939393',NULL,NULL,'2022-06-28 15:13:54'),(30,'Renato Augusto','Guto','4569',NULL,NULL,'2022-06-28 15:16:49'),(31,'Hedenilson','Hedinho','4569',NULL,'https://i.pinimg.com/736x/6f/f7/d9/6ff7d999092654ca48eba759140a8273.jpg','2022-06-28 18:19:08');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-30 13:29:56
