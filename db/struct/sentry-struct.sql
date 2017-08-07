-- MySQL dump 10.13  Distrib 5.1.66, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: sentry
-- ------------------------------------------------------
-- Server version	5.1.66

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
-- Table structure for table `SENTRY_DB_PRIVILEGE`
--

DROP TABLE IF EXISTS `SENTRY_DB_PRIVILEGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_DB_PRIVILEGE` (
  `DB_PRIVILEGE_ID` bigint(20) NOT NULL,
  `PRIVILEGE_SCOPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SERVER_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `TABLE_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `COLUMN_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `URI` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `ACTION` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CREATE_TIME` bigint(20) NOT NULL,
  `WITH_GRANT_OPTION` char(1) NOT NULL,
  PRIMARY KEY (`DB_PRIVILEGE_ID`),
  UNIQUE KEY `SENTRY_DB_PRIV_PRIV_NAME_UNIQ` (`SERVER_NAME`,`DB_NAME`,`TABLE_NAME`,`COLUMN_NAME`,`URI`(250),`ACTION`,`WITH_GRANT_OPTION`),
  KEY `SENTRY_PRIV_SERV_IDX` (`SERVER_NAME`),
  KEY `SENTRY_PRIV_DB_IDX` (`DB_NAME`),
  KEY `SENTRY_PRIV_TBL_IDX` (`TABLE_NAME`),
  KEY `SENTRY_PRIV_COL_IDX` (`COLUMN_NAME`),
  KEY `SENTRY_PRIV_URI_IDX` (`URI`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_GM_PRIVILEGE`
--

DROP TABLE IF EXISTS `SENTRY_GM_PRIVILEGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_GM_PRIVILEGE` (
  `GM_PRIVILEGE_ID` bigint(20) NOT NULL,
  `ACTION` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `COMPONENT_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CREATE_TIME` bigint(20) NOT NULL,
  `WITH_GRANT_OPTION` char(1) NOT NULL,
  `RESOURCE_NAME_0` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_NAME_1` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_NAME_2` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_NAME_3` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_TYPE_0` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_TYPE_1` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_TYPE_2` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `RESOURCE_TYPE_3` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '__NULL__',
  `SCOPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SERVICE_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`GM_PRIVILEGE_ID`),
  UNIQUE KEY `GM_PRIVILEGE_UNIQUE` (`COMPONENT_NAME`,`SERVICE_NAME`,`RESOURCE_NAME_0`,`RESOURCE_TYPE_0`,`RESOURCE_NAME_1`,`RESOURCE_TYPE_1`,`RESOURCE_NAME_2`,`RESOURCE_TYPE_2`,`RESOURCE_NAME_3`,`RESOURCE_TYPE_3`,`ACTION`,`WITH_GRANT_OPTION`),
  KEY `SENTRY_GM_PRIV_COMP_IDX` (`COMPONENT_NAME`),
  KEY `SENTRY_GM_PRIV_SERV_IDX` (`SERVICE_NAME`),
  KEY `SENTRY_GM_PRIV_RES0_IDX` (`RESOURCE_NAME_0`,`RESOURCE_TYPE_0`),
  KEY `SENTRY_GM_PRIV_RES1_IDX` (`RESOURCE_NAME_1`,`RESOURCE_TYPE_1`),
  KEY `SENTRY_GM_PRIV_RES2_IDX` (`RESOURCE_NAME_2`,`RESOURCE_TYPE_2`),
  KEY `SENTRY_GM_PRIV_RES3_IDX` (`RESOURCE_NAME_3`,`RESOURCE_TYPE_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_GROUP`
--

DROP TABLE IF EXISTS `SENTRY_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_GROUP` (
  `GROUP_ID` bigint(20) NOT NULL,
  `GROUP_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CREATE_TIME` bigint(20) NOT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `SENTRY_GRP_GRP_NAME_UNIQUE` (`GROUP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_ROLE`
--

DROP TABLE IF EXISTS `SENTRY_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_ROLE` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CREATE_TIME` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `SENTRY_ROLE_ROLE_NAME_UNIQUE` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_ROLE_DB_PRIVILEGE_MAP`
--

DROP TABLE IF EXISTS `SENTRY_ROLE_DB_PRIVILEGE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_ROLE_DB_PRIVILEGE_MAP` (
  `ROLE_ID` bigint(20) NOT NULL,
  `DB_PRIVILEGE_ID` bigint(20) NOT NULL,
  `GRANTOR_PRINCIPAL` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`DB_PRIVILEGE_ID`),
  KEY `SEN_RL_DB_PRV_MAP_SN_DB_PRV_FK` (`DB_PRIVILEGE_ID`),
  CONSTRAINT `SEN_RLE_DB_PRV_MAP_SN_RLE_FK` FOREIGN KEY (`ROLE_ID`) REFERENCES `SENTRY_ROLE` (`ROLE_ID`),
  CONSTRAINT `SEN_RL_DB_PRV_MAP_SN_DB_PRV_FK` FOREIGN KEY (`DB_PRIVILEGE_ID`) REFERENCES `SENTRY_DB_PRIVILEGE` (`DB_PRIVILEGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_ROLE_GM_PRIVILEGE_MAP`
--

DROP TABLE IF EXISTS `SENTRY_ROLE_GM_PRIVILEGE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_ROLE_GM_PRIVILEGE_MAP` (
  `ROLE_ID` bigint(20) NOT NULL,
  `GM_PRIVILEGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GM_PRIVILEGE_ID`),
  KEY `SEN_RL_GM_PRV_MAP_SN_DB_PRV_FK` (`GM_PRIVILEGE_ID`),
  CONSTRAINT `SEN_RLE_GM_PRV_MAP_SN_RLE_FK` FOREIGN KEY (`ROLE_ID`) REFERENCES `SENTRY_ROLE` (`ROLE_ID`),
  CONSTRAINT `SEN_RL_GM_PRV_MAP_SN_DB_PRV_FK` FOREIGN KEY (`GM_PRIVILEGE_ID`) REFERENCES `SENTRY_GM_PRIVILEGE` (`GM_PRIVILEGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_ROLE_GROUP_MAP`
--

DROP TABLE IF EXISTS `SENTRY_ROLE_GROUP_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_ROLE_GROUP_MAP` (
  `ROLE_ID` bigint(20) NOT NULL,
  `GROUP_ID` bigint(20) NOT NULL,
  `GRANTOR_PRINCIPAL` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `SEN_ROLE_GROUP_MAP_SEN_GRP_FK` (`GROUP_ID`),
  CONSTRAINT `SEN_ROLE_GROUP_MAP_SEN_GRP_FK` FOREIGN KEY (`GROUP_ID`) REFERENCES `SENTRY_GROUP` (`GROUP_ID`),
  CONSTRAINT `SEN_ROLE_GROUP_MAP_SEN_ROLE_FK` FOREIGN KEY (`ROLE_ID`) REFERENCES `SENTRY_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SENTRY_VERSION`
--

DROP TABLE IF EXISTS `SENTRY_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SENTRY_VERSION` (
  `VER_ID` bigint(20) NOT NULL,
  `SCHEMA_VERSION` varchar(127) NOT NULL,
  `VERSION_COMMENT` varchar(255) NOT NULL,
  PRIMARY KEY (`VER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07  8:54:45