-- MySQL dump 10.13  Distrib 5.1.66, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: metastore
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
-- Table structure for table `BUCKETING_COLS`
--

DROP TABLE IF EXISTS `BUCKETING_COLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUCKETING_COLS` (
  `SD_ID` bigint(20) NOT NULL,
  `BUCKET_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `BUCKETING_COLS_N49` (`SD_ID`),
  CONSTRAINT `BUCKETING_COLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUCKETING_COLS`
--

LOCK TABLES `BUCKETING_COLS` WRITE;
/*!40000 ALTER TABLE `BUCKETING_COLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUCKETING_COLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CDS`
--

DROP TABLE IF EXISTS `CDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CDS` (
  `CD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CDS`
--

LOCK TABLES `CDS` WRITE;
/*!40000 ALTER TABLE `CDS` DISABLE KEYS */;
INSERT INTO `CDS` VALUES (136),(141),(142),(145),(146),(147);
/*!40000 ALTER TABLE `CDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLUMNS_V2`
--

DROP TABLE IF EXISTS `COLUMNS_V2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLUMNS_V2` (
  `CD_ID` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TYPE_NAME` varchar(4000) DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`CD_ID`,`COLUMN_NAME`),
  KEY `COLUMNS_V2_N49` (`CD_ID`),
  CONSTRAINT `COLUMNS_V2_FK1` FOREIGN KEY (`CD_ID`) REFERENCES `CDS` (`CD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLUMNS_V2`
--

LOCK TABLES `COLUMNS_V2` WRITE;
/*!40000 ALTER TABLE `COLUMNS_V2` DISABLE KEYS */;
INSERT INTO `COLUMNS_V2` VALUES (136,NULL,'id','int',0),(136,NULL,'name','string',1),(141,NULL,'id','int',0),(142,NULL,'id','int',0),(142,NULL,'name','string',1),(142,NULL,'phone','string',2),(145,NULL,'comment','varchar(255)',1),(145,NULL,'name','varchar(255)',0),(146,NULL,'id','int',0),(146,NULL,'name','string',1),(147,NULL,'0','int',0),(147,NULL,'1','string',1);
/*!40000 ALTER TABLE `COLUMNS_V2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPACTION_QUEUE`
--

DROP TABLE IF EXISTS `COMPACTION_QUEUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPACTION_QUEUE` (
  `CQ_ID` bigint(20) NOT NULL,
  `CQ_DATABASE` varchar(128) NOT NULL,
  `CQ_TABLE` varchar(128) NOT NULL,
  `CQ_PARTITION` varchar(767) DEFAULT NULL,
  `CQ_STATE` char(1) NOT NULL,
  `CQ_TYPE` char(1) NOT NULL,
  `CQ_WORKER_ID` varchar(128) DEFAULT NULL,
  `CQ_START` bigint(20) DEFAULT NULL,
  `CQ_RUN_AS` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`CQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPACTION_QUEUE`
--

LOCK TABLES `COMPACTION_QUEUE` WRITE;
/*!40000 ALTER TABLE `COMPACTION_QUEUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPACTION_QUEUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPLETED_TXN_COMPONENTS`
--

DROP TABLE IF EXISTS `COMPLETED_TXN_COMPONENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPLETED_TXN_COMPONENTS` (
  `CTC_TXNID` bigint(20) DEFAULT NULL,
  `CTC_DATABASE` varchar(128) NOT NULL,
  `CTC_TABLE` varchar(128) DEFAULT NULL,
  `CTC_PARTITION` varchar(767) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPLETED_TXN_COMPONENTS`
--

LOCK TABLES `COMPLETED_TXN_COMPONENTS` WRITE;
/*!40000 ALTER TABLE `COMPLETED_TXN_COMPONENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPLETED_TXN_COMPONENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASE_PARAMS`
--

DROP TABLE IF EXISTS `DATABASE_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASE_PARAMS` (
  `DB_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(180) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`DB_ID`,`PARAM_KEY`),
  KEY `DATABASE_PARAMS_N49` (`DB_ID`),
  CONSTRAINT `DATABASE_PARAMS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASE_PARAMS`
--

LOCK TABLES `DATABASE_PARAMS` WRITE;
/*!40000 ALTER TABLE `DATABASE_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASE_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DBS`
--

DROP TABLE IF EXISTS `DBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBS` (
  `DB_ID` bigint(20) NOT NULL,
  `DESC` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `DB_LOCATION_URI` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `UNIQUE_DATABASE` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DBS`
--

LOCK TABLES `DBS` WRITE;
/*!40000 ALTER TABLE `DBS` DISABLE KEYS */;
INSERT INTO `DBS` VALUES (1,'Default Hive database','hdfs://quickstart.cloudera:8020/user/hive/warehouse','default','public','ROLE');
/*!40000 ALTER TABLE `DBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DB_PRIVS`
--

DROP TABLE IF EXISTS `DB_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DB_PRIVS` (
  `DB_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `DB_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`DB_GRANT_ID`),
  UNIQUE KEY `DBPRIVILEGEINDEX` (`DB_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`DB_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `DB_PRIVS_N49` (`DB_ID`),
  CONSTRAINT `DB_PRIVS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DB_PRIVS`
--

LOCK TABLES `DB_PRIVS` WRITE;
/*!40000 ALTER TABLE `DB_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DB_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DELEGATION_TOKENS`
--

DROP TABLE IF EXISTS `DELEGATION_TOKENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DELEGATION_TOKENS` (
  `TOKEN_IDENT` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TOKEN` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`TOKEN_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DELEGATION_TOKENS`
--

LOCK TABLES `DELEGATION_TOKENS` WRITE;
/*!40000 ALTER TABLE `DELEGATION_TOKENS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DELEGATION_TOKENS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUNCS`
--

DROP TABLE IF EXISTS `FUNCS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUNCS` (
  `FUNC_ID` bigint(20) NOT NULL,
  `CLASS_NAME` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `FUNC_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `FUNC_TYPE` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`FUNC_ID`),
  UNIQUE KEY `UNIQUEFUNCTION` (`FUNC_NAME`,`DB_ID`),
  KEY `FUNCS_N49` (`DB_ID`),
  CONSTRAINT `FUNCS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUNCS`
--

LOCK TABLES `FUNCS` WRITE;
/*!40000 ALTER TABLE `FUNCS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUNCS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUNC_RU`
--

DROP TABLE IF EXISTS `FUNC_RU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUNC_RU` (
  `FUNC_ID` bigint(20) NOT NULL,
  `RESOURCE_TYPE` int(11) NOT NULL,
  `RESOURCE_URI` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`FUNC_ID`,`INTEGER_IDX`),
  CONSTRAINT `FUNC_RU_FK1` FOREIGN KEY (`FUNC_ID`) REFERENCES `FUNCS` (`FUNC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUNC_RU`
--

LOCK TABLES `FUNC_RU` WRITE;
/*!40000 ALTER TABLE `FUNC_RU` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUNC_RU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GLOBAL_PRIVS`
--

DROP TABLE IF EXISTS `GLOBAL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GLOBAL_PRIVS` (
  `USER_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `USER_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`USER_GRANT_ID`),
  UNIQUE KEY `GLOBALPRIVILEGEINDEX` (`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`USER_PRIV`,`GRANTOR`,`GRANTOR_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GLOBAL_PRIVS`
--

LOCK TABLES `GLOBAL_PRIVS` WRITE;
/*!40000 ALTER TABLE `GLOBAL_PRIVS` DISABLE KEYS */;
INSERT INTO `GLOBAL_PRIVS` VALUES (1,1461476189,1,'admin','ROLE','admin','ROLE','All');
/*!40000 ALTER TABLE `GLOBAL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HIVE_LOCKS`
--

DROP TABLE IF EXISTS `HIVE_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HIVE_LOCKS` (
  `HL_LOCK_EXT_ID` bigint(20) NOT NULL,
  `HL_LOCK_INT_ID` bigint(20) NOT NULL,
  `HL_TXNID` bigint(20) DEFAULT NULL,
  `HL_DB` varchar(128) NOT NULL,
  `HL_TABLE` varchar(128) DEFAULT NULL,
  `HL_PARTITION` varchar(767) DEFAULT NULL,
  `HL_LOCK_STATE` char(1) NOT NULL,
  `HL_LOCK_TYPE` char(1) NOT NULL,
  `HL_LAST_HEARTBEAT` bigint(20) NOT NULL,
  `HL_ACQUIRED_AT` bigint(20) DEFAULT NULL,
  `HL_USER` varchar(128) NOT NULL,
  `HL_HOST` varchar(128) NOT NULL,
  PRIMARY KEY (`HL_LOCK_EXT_ID`,`HL_LOCK_INT_ID`),
  KEY `HIVE_LOCK_TXNID_INDEX` (`HL_TXNID`),
  KEY `HL_TXNID_IDX` (`HL_TXNID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HIVE_LOCKS`
--

LOCK TABLES `HIVE_LOCKS` WRITE;
/*!40000 ALTER TABLE `HIVE_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `HIVE_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDXS`
--

DROP TABLE IF EXISTS `IDXS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDXS` (
  `INDEX_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DEFERRED_REBUILD` bit(1) NOT NULL,
  `INDEX_HANDLER_CLASS` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INDEX_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INDEX_TBL_ID` bigint(20) DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `ORIG_TBL_ID` bigint(20) DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`),
  UNIQUE KEY `UNIQUEINDEX` (`INDEX_NAME`,`ORIG_TBL_ID`),
  KEY `IDXS_N51` (`SD_ID`),
  KEY `IDXS_N50` (`INDEX_TBL_ID`),
  KEY `IDXS_N49` (`ORIG_TBL_ID`),
  CONSTRAINT `IDXS_FK1` FOREIGN KEY (`ORIG_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`),
  CONSTRAINT `IDXS_FK2` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `IDXS_FK3` FOREIGN KEY (`INDEX_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDXS`
--

LOCK TABLES `IDXS` WRITE;
/*!40000 ALTER TABLE `IDXS` DISABLE KEYS */;
INSERT INTO `IDXS` VALUES (1,1463482168,'\0','lucene_index','luceneindex_tb_cf',146,0,136,387);
/*!40000 ALTER TABLE `IDXS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDEX_PARAMS`
--

DROP TABLE IF EXISTS `INDEX_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDEX_PARAMS` (
  `INDEX_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`,`PARAM_KEY`),
  KEY `INDEX_PARAMS_N49` (`INDEX_ID`),
  CONSTRAINT `INDEX_PARAMS_FK1` FOREIGN KEY (`INDEX_ID`) REFERENCES `IDXS` (`INDEX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDEX_PARAMS`
--

LOCK TABLES `INDEX_PARAMS` WRITE;
/*!40000 ALTER TABLE `INDEX_PARAMS` DISABLE KEYS */;
INSERT INTO `INDEX_PARAMS` VALUES (1,'_lucene.1','org.apache.lucene.analysis.standard.StandardAnalyzer'),(1,'create_ddl_time_','1463482167'),(1,'transient_lastDdlTime','1463482168');
/*!40000 ALTER TABLE `INDEX_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MASTER_KEYS`
--

DROP TABLE IF EXISTS `MASTER_KEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MASTER_KEYS` (
  `KEY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MASTER_KEY` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MASTER_KEYS`
--

LOCK TABLES `MASTER_KEYS` WRITE;
/*!40000 ALTER TABLE `MASTER_KEYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MASTER_KEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEXT_COMPACTION_QUEUE_ID`
--

DROP TABLE IF EXISTS `NEXT_COMPACTION_QUEUE_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEXT_COMPACTION_QUEUE_ID` (
  `NCQ_NEXT` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEXT_COMPACTION_QUEUE_ID`
--

LOCK TABLES `NEXT_COMPACTION_QUEUE_ID` WRITE;
/*!40000 ALTER TABLE `NEXT_COMPACTION_QUEUE_ID` DISABLE KEYS */;
INSERT INTO `NEXT_COMPACTION_QUEUE_ID` VALUES (1);
/*!40000 ALTER TABLE `NEXT_COMPACTION_QUEUE_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEXT_LOCK_ID`
--

DROP TABLE IF EXISTS `NEXT_LOCK_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEXT_LOCK_ID` (
  `NL_NEXT` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEXT_LOCK_ID`
--

LOCK TABLES `NEXT_LOCK_ID` WRITE;
/*!40000 ALTER TABLE `NEXT_LOCK_ID` DISABLE KEYS */;
INSERT INTO `NEXT_LOCK_ID` VALUES (1);
/*!40000 ALTER TABLE `NEXT_LOCK_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEXT_TXN_ID`
--

DROP TABLE IF EXISTS `NEXT_TXN_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEXT_TXN_ID` (
  `NTXN_NEXT` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEXT_TXN_ID`
--

LOCK TABLES `NEXT_TXN_ID` WRITE;
/*!40000 ALTER TABLE `NEXT_TXN_ID` DISABLE KEYS */;
INSERT INTO `NEXT_TXN_ID` VALUES (1);
/*!40000 ALTER TABLE `NEXT_TXN_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NUCLEUS_TABLES`
--

DROP TABLE IF EXISTS `NUCLEUS_TABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NUCLEUS_TABLES` (
  `CLASS_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TYPE` varchar(4) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `OWNER` varchar(2) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `VERSION` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTERFACE_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`CLASS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NUCLEUS_TABLES`
--

LOCK TABLES `NUCLEUS_TABLES` WRITE;
/*!40000 ALTER TABLE `NUCLEUS_TABLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `NUCLEUS_TABLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITIONS`
--

DROP TABLE IF EXISTS `PARTITIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITIONS` (
  `PART_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `PART_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  `LINK_TARGET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PART_ID`),
  UNIQUE KEY `UNIQUEPARTITION` (`PART_NAME`,`TBL_ID`),
  KEY `PARTITIONS_N49` (`TBL_ID`),
  KEY `PARTITIONS_N50` (`SD_ID`),
  KEY `PARTITIONS_N51` (`LINK_TARGET_ID`),
  CONSTRAINT `PARTITIONS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`),
  CONSTRAINT `PARTITIONS_FK2` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `PARTITIONS_FK3` FOREIGN KEY (`LINK_TARGET_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITIONS`
--

LOCK TABLES `PARTITIONS` WRITE;
/*!40000 ALTER TABLE `PARTITIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_EVENTS`
--

DROP TABLE IF EXISTS `PARTITION_EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_EVENTS` (
  `PART_NAME_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `EVENT_TIME` bigint(20) NOT NULL,
  `EVENT_TYPE` int(11) NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_NAME_ID`),
  KEY `PARTITIONEVENTINDEX` (`PARTITION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_EVENTS`
--

LOCK TABLES `PARTITION_EVENTS` WRITE;
/*!40000 ALTER TABLE `PARTITION_EVENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_KEYS`
--

DROP TABLE IF EXISTS `PARTITION_KEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_KEYS` (
  `TBL_ID` bigint(20) NOT NULL,
  `PKEY_COMMENT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PKEY_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PKEY_TYPE` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TBL_ID`,`PKEY_NAME`),
  KEY `PARTITION_KEYS_N49` (`TBL_ID`),
  CONSTRAINT `PARTITION_KEYS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_KEYS`
--

LOCK TABLES `PARTITION_KEYS` WRITE;
/*!40000 ALTER TABLE `PARTITION_KEYS` DISABLE KEYS */;
INSERT INTO `PARTITION_KEYS` VALUES (136,'INSIDE_NOT_USED','_inside_par_1','string',0),(136,'INSIDE_NOT_USED','_inside_par_2','string',1),(136,'INSIDE_NOT_USED','_inside_par_3','string',2),(136,'INSIDE_NOT_USED','_inside_par_4','string',3),(136,'INSIDE_NOT_USED','_inside_par_5','string',4),(141,'INSIDE_NOT_USED','_inside_par_1','string',0),(141,'INSIDE_NOT_USED','_inside_par_2','string',1),(141,'INSIDE_NOT_USED','_inside_par_3','string',2),(141,'INSIDE_NOT_USED','_inside_par_4','string',3),(141,'INSIDE_NOT_USED','_inside_par_5','string',4),(146,'INSIDE_NOT_USED','_inside_par_1','string',0),(146,'INSIDE_NOT_USED','_inside_par_2','string',1),(146,'INSIDE_NOT_USED','_inside_par_3','string',2),(146,'INSIDE_NOT_USED','_inside_par_4','string',3),(146,'INSIDE_NOT_USED','_inside_par_5','string',4);
/*!40000 ALTER TABLE `PARTITION_KEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_KEY_VALS`
--

DROP TABLE IF EXISTS `PARTITION_KEY_VALS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_KEY_VALS` (
  `PART_ID` bigint(20) NOT NULL,
  `PART_KEY_VAL` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`PART_ID`,`INTEGER_IDX`),
  KEY `PARTITION_KEY_VALS_N49` (`PART_ID`),
  CONSTRAINT `PARTITION_KEY_VALS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_KEY_VALS`
--

LOCK TABLES `PARTITION_KEY_VALS` WRITE;
/*!40000 ALTER TABLE `PARTITION_KEY_VALS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_KEY_VALS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_PARAMS`
--

DROP TABLE IF EXISTS `PARTITION_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_PARAMS` (
  `PART_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_ID`,`PARAM_KEY`),
  KEY `PARTITION_PARAMS_N49` (`PART_ID`),
  CONSTRAINT `PARTITION_PARAMS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_PARAMS`
--

LOCK TABLES `PARTITION_PARAMS` WRITE;
/*!40000 ALTER TABLE `PARTITION_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART_COL_PRIVS`
--

DROP TABLE IF EXISTS `PART_COL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART_COL_PRIVS` (
  `PART_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_ID` bigint(20) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_COL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_COLUMN_GRANT_ID`),
  KEY `PART_COL_PRIVS_N49` (`PART_ID`),
  KEY `PARTITIONCOLUMNPRIVILEGEINDEX` (`PART_ID`,`COLUMN_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`PART_COL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  CONSTRAINT `PART_COL_PRIVS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART_COL_PRIVS`
--

LOCK TABLES `PART_COL_PRIVS` WRITE;
/*!40000 ALTER TABLE `PART_COL_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PART_COL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART_COL_STATS`
--

DROP TABLE IF EXISTS `PART_COL_STATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART_COL_STATS` (
  `CS_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PART_ID` bigint(20) NOT NULL,
  `LONG_LOW_VALUE` bigint(20) DEFAULT NULL,
  `LONG_HIGH_VALUE` bigint(20) DEFAULT NULL,
  `DOUBLE_HIGH_VALUE` double(53,4) DEFAULT NULL,
  `DOUBLE_LOW_VALUE` double(53,4) DEFAULT NULL,
  `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_NULLS` bigint(20) NOT NULL,
  `NUM_DISTINCTS` bigint(20) DEFAULT NULL,
  `AVG_COL_LEN` double(53,4) DEFAULT NULL,
  `MAX_COL_LEN` bigint(20) DEFAULT NULL,
  `NUM_TRUES` bigint(20) DEFAULT NULL,
  `NUM_FALSES` bigint(20) DEFAULT NULL,
  `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  KEY `PART_COL_STATS_FK` (`PART_ID`),
  CONSTRAINT `PART_COL_STATS_FK` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART_COL_STATS`
--

LOCK TABLES `PART_COL_STATS` WRITE;
/*!40000 ALTER TABLE `PART_COL_STATS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PART_COL_STATS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART_PRIVS`
--

DROP TABLE IF EXISTS `PART_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART_PRIVS` (
  `PART_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_ID` bigint(20) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_GRANT_ID`),
  KEY `PARTPRIVILEGEINDEX` (`PART_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`PART_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `PART_PRIVS_N49` (`PART_ID`),
  CONSTRAINT `PART_PRIVS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART_PRIVS`
--

LOCK TABLES `PART_PRIVS` WRITE;
/*!40000 ALTER TABLE `PART_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PART_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLES` (
  `ROLE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ROLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `ROLEENTITYINDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
INSERT INTO `ROLES` VALUES (1,1461476185,'admin','admin'),(2,1461476187,'public','public');
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_MAP`
--

DROP TABLE IF EXISTS `ROLE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_MAP` (
  `ROLE_GRANT_ID` bigint(20) NOT NULL,
  `ADD_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ROLE_GRANT_ID`),
  UNIQUE KEY `USERROLEMAPINDEX` (`PRINCIPAL_NAME`,`ROLE_ID`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `ROLE_MAP_N49` (`ROLE_ID`),
  CONSTRAINT `ROLE_MAP_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_MAP`
--

LOCK TABLES `ROLE_MAP` WRITE;
/*!40000 ALTER TABLE `ROLE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SDS`
--

DROP TABLE IF EXISTS `SDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SDS` (
  `SD_ID` bigint(20) NOT NULL,
  `CD_ID` bigint(20) DEFAULT NULL,
  `INPUT_FORMAT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `IS_COMPRESSED` bit(1) NOT NULL,
  `IS_STOREDASSUBDIRECTORIES` bit(1) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_BUCKETS` int(11) NOT NULL,
  `OUTPUT_FORMAT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `SERDE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SD_ID`),
  KEY `SDS_N49` (`SERDE_ID`),
  KEY `SDS_N50` (`CD_ID`),
  CONSTRAINT `SDS_FK1` FOREIGN KEY (`SERDE_ID`) REFERENCES `SERDES` (`SERDE_ID`),
  CONSTRAINT `SDS_FK2` FOREIGN KEY (`CD_ID`) REFERENCES `CDS` (`CD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SDS`
--

LOCK TABLES `SDS` WRITE;
/*!40000 ALTER TABLE `SDS` DISABLE KEYS */;
INSERT INTO `SDS` VALUES (376,136,'org.apache.hadoop.hive.ql.io.RCFileInputFormat','\0','\0','hdfs://quickstart.cloudera:8020/user/hive/warehouse/default/KSKJHAZJ',0,'org.apache.hadoop.hive.ql.io.RCFileOutputFormat',376),(381,141,'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat','\0','\0','hdfs://quickstart.cloudera:8020/user/hive/warehouse/default/7S4FXMN8',0,'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat',381),(382,142,'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat','\0','\0','hdfs://quickstart.cloudera:8020/user/hive/warehouse/wzy',-1,'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat',382),(385,145,'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat','\0','\0','hdfs://quickstart.cloudera:8020/user/hive/warehouse/wzy02',-1,'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat',385),(386,146,'org.apache.hadoop.hive.ql.io.RCFileInputFormat','\0','\0','hdfs://quickstart.cloudera:8020/user/hive/warehouse/default/KSKJHAZJ',0,'org.apache.hadoop.hive.ql.io.RCFileOutputFormat',386),(387,147,'org.apache.hadoop.hive.ql.io.RCFileInputFormat','\0','\0','hdfs://quickstart.cloudera:8020/user/hive/warehouse/default/KSKJHAZJ',0,'org.apache.hadoop.hive.ql.io.RCFileOutputFormat',387);
/*!40000 ALTER TABLE `SDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SD_PARAMS`
--

DROP TABLE IF EXISTS `SD_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SD_PARAMS` (
  `SD_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SD_ID`,`PARAM_KEY`),
  KEY `SD_PARAMS_N49` (`SD_ID`),
  CONSTRAINT `SD_PARAMS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SD_PARAMS`
--

LOCK TABLES `SD_PARAMS` WRITE;
/*!40000 ALTER TABLE `SD_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SD_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE_TABLE`
--

DROP TABLE IF EXISTS `SEQUENCE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE_TABLE` (
  `SEQUENCE_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `NEXT_VAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SEQUENCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE_TABLE`
--

LOCK TABLES `SEQUENCE_TABLE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE_TABLE` DISABLE KEYS */;
INSERT INTO `SEQUENCE_TABLE` VALUES ('org.apache.hadoop.hive.metastore.model.MColumnDescriptor',151),('org.apache.hadoop.hive.metastore.model.MDatabase',146),('org.apache.hadoop.hive.metastore.model.MGlobalPrivilege',6),('org.apache.hadoop.hive.metastore.model.MIndex',6),('org.apache.hadoop.hive.metastore.model.MPartition',261),('org.apache.hadoop.hive.metastore.model.MRole',6),('org.apache.hadoop.hive.metastore.model.MSerDeInfo',391),('org.apache.hadoop.hive.metastore.model.MStorageDescriptor',391),('org.apache.hadoop.hive.metastore.model.MTable',151);
/*!40000 ALTER TABLE `SEQUENCE_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERDES`
--

DROP TABLE IF EXISTS `SERDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERDES` (
  `SERDE_ID` bigint(20) NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `SLIB` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERDES`
--

LOCK TABLES `SERDES` WRITE;
/*!40000 ALTER TABLE `SERDES` DISABLE KEYS */;
INSERT INTO `SERDES` VALUES (376,NULL,'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe'),(381,NULL,'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'),(382,NULL,'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'),(385,NULL,'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'),(386,NULL,'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe'),(387,NULL,'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe');
/*!40000 ALTER TABLE `SERDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERDE_PARAMS`
--

DROP TABLE IF EXISTS `SERDE_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERDE_PARAMS` (
  `SERDE_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`,`PARAM_KEY`),
  KEY `SERDE_PARAMS_N49` (`SERDE_ID`),
  CONSTRAINT `SERDE_PARAMS_FK1` FOREIGN KEY (`SERDE_ID`) REFERENCES `SERDES` (`SERDE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERDE_PARAMS`
--

LOCK TABLES `SERDE_PARAMS` WRITE;
/*!40000 ALTER TABLE `SERDE_PARAMS` DISABLE KEYS */;
INSERT INTO `SERDE_PARAMS` VALUES (382,'serialization.format','1'),(385,'serialization.format','1');
/*!40000 ALTER TABLE `SERDE_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_COL_NAMES`
--

DROP TABLE IF EXISTS `SKEWED_COL_NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_COL_NAMES` (
  `SD_ID` bigint(20) NOT NULL,
  `SKEWED_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `SKEWED_COL_NAMES_N49` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_NAMES_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_COL_NAMES`
--

LOCK TABLES `SKEWED_COL_NAMES` WRITE;
/*!40000 ALTER TABLE `SKEWED_COL_NAMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_COL_NAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_COL_VALUE_LOC_MAP`
--

DROP TABLE IF EXISTS `SKEWED_COL_VALUE_LOC_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_COL_VALUE_LOC_MAP` (
  `SD_ID` bigint(20) NOT NULL,
  `STRING_LIST_ID_KID` bigint(20) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SD_ID`,`STRING_LIST_ID_KID`),
  KEY `SKEWED_COL_VALUE_LOC_MAP_N49` (`STRING_LIST_ID_KID`),
  KEY `SKEWED_COL_VALUE_LOC_MAP_N50` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK2` FOREIGN KEY (`STRING_LIST_ID_KID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_COL_VALUE_LOC_MAP`
--

LOCK TABLES `SKEWED_COL_VALUE_LOC_MAP` WRITE;
/*!40000 ALTER TABLE `SKEWED_COL_VALUE_LOC_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_COL_VALUE_LOC_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_STRING_LIST`
--

DROP TABLE IF EXISTS `SKEWED_STRING_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_STRING_LIST` (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_STRING_LIST`
--

LOCK TABLES `SKEWED_STRING_LIST` WRITE;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_STRING_LIST_VALUES`
--

DROP TABLE IF EXISTS `SKEWED_STRING_LIST_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_STRING_LIST_VALUES` (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  `STRING_LIST_VALUE` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`,`INTEGER_IDX`),
  KEY `SKEWED_STRING_LIST_VALUES_N49` (`STRING_LIST_ID`),
  CONSTRAINT `SKEWED_STRING_LIST_VALUES_FK1` FOREIGN KEY (`STRING_LIST_ID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_STRING_LIST_VALUES`
--

LOCK TABLES `SKEWED_STRING_LIST_VALUES` WRITE;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_VALUES`
--

DROP TABLE IF EXISTS `SKEWED_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_VALUES` (
  `SD_ID_OID` bigint(20) NOT NULL,
  `STRING_LIST_ID_EID` bigint(20) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID_OID`,`INTEGER_IDX`),
  KEY `SKEWED_VALUES_N50` (`SD_ID_OID`),
  KEY `SKEWED_VALUES_N49` (`STRING_LIST_ID_EID`),
  CONSTRAINT `SKEWED_VALUES_FK1` FOREIGN KEY (`SD_ID_OID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `SKEWED_VALUES_FK2` FOREIGN KEY (`STRING_LIST_ID_EID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_VALUES`
--

LOCK TABLES `SKEWED_VALUES` WRITE;
/*!40000 ALTER TABLE `SKEWED_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SORT_COLS`
--

DROP TABLE IF EXISTS `SORT_COLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SORT_COLS` (
  `SD_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ORDER` int(11) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `SORT_COLS_N49` (`SD_ID`),
  CONSTRAINT `SORT_COLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SORT_COLS`
--

LOCK TABLES `SORT_COLS` WRITE;
/*!40000 ALTER TABLE `SORT_COLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SORT_COLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABLE_PARAMS`
--

DROP TABLE IF EXISTS `TABLE_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABLE_PARAMS` (
  `TBL_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`TBL_ID`,`PARAM_KEY`),
  KEY `TABLE_PARAMS_N49` (`TBL_ID`),
  CONSTRAINT `TABLE_PARAMS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABLE_PARAMS`
--

LOCK TABLES `TABLE_PARAMS` WRITE;
/*!40000 ALTER TABLE `TABLE_PARAMS` DISABLE KEYS */;
INSERT INTO `TABLE_PARAMS` VALUES (136,'_cols_ids','[{\"_enable\":true,\"_id\":0,\"_name\":\"id\",\"_valueType\":\"int\"},{\"_enable\":true,\"_id\":1,\"_name\":\"name\",\"_valueType\":\"string\"}]'),(136,'_compress','NONE'),(136,'_partition_infos','[]'),(136,'_replication','1'),(136,'_tbl_uuid','KSKJHAZJ'),(136,'_ttl','-1'),(136,'transient_lastDdlTime','1462341668'),(141,'_cols_ids','[{\"_enable\":true,\"_id\":0,\"_name\":\"id\",\"_valueType\":\"int\"}]'),(141,'_compress','NONE'),(141,'_partition_infos','[]'),(141,'_replication','1'),(141,'_tbl_uuid','7S4FXMN8'),(141,'_ttl','-1'),(141,'transient_lastDdlTime','1463456922'),(142,'transient_lastDdlTime','1463457056'),(145,'transient_lastDdlTime','1463461111'),(146,'_cols_ids','[{\"_enable\":true,\"_id\":0,\"_name\":\"id\",\"_valueType\":\"int\"},{\"_enable\":true,\"_id\":1,\"_name\":\"name\",\"_valueType\":\"string\"}]'),(146,'_compress','NONE'),(146,'_partition_infos','[]'),(146,'_replication','1'),(146,'_tbl_uuid','KSKJHAZJ'),(146,'_ttl','-1'),(146,'transient_lastDdlTime','1462341668');
/*!40000 ALTER TABLE `TABLE_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAB_COL_STATS`
--

DROP TABLE IF EXISTS `TAB_COL_STATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAB_COL_STATS` (
  `CS_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TBL_ID` bigint(20) NOT NULL,
  `LONG_LOW_VALUE` bigint(20) DEFAULT NULL,
  `LONG_HIGH_VALUE` bigint(20) DEFAULT NULL,
  `DOUBLE_HIGH_VALUE` double(53,4) DEFAULT NULL,
  `DOUBLE_LOW_VALUE` double(53,4) DEFAULT NULL,
  `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_NULLS` bigint(20) NOT NULL,
  `NUM_DISTINCTS` bigint(20) DEFAULT NULL,
  `AVG_COL_LEN` double(53,4) DEFAULT NULL,
  `MAX_COL_LEN` bigint(20) DEFAULT NULL,
  `NUM_TRUES` bigint(20) DEFAULT NULL,
  `NUM_FALSES` bigint(20) DEFAULT NULL,
  `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  KEY `TAB_COL_STATS_FK` (`TBL_ID`),
  CONSTRAINT `TAB_COL_STATS_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAB_COL_STATS`
--

LOCK TABLES `TAB_COL_STATS` WRITE;
/*!40000 ALTER TABLE `TAB_COL_STATS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAB_COL_STATS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBLS`
--

DROP TABLE IF EXISTS `TBLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBLS` (
  `TBL_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `OWNER` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `RETENTION` int(11) NOT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `VIEW_EXPANDED_TEXT` mediumtext,
  `VIEW_ORIGINAL_TEXT` mediumtext,
  `LINK_TARGET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_ID`),
  UNIQUE KEY `UNIQUETABLE` (`TBL_NAME`,`DB_ID`),
  KEY `TBLS_N50` (`SD_ID`),
  KEY `TBLS_N49` (`DB_ID`),
  KEY `TBLS_N51` (`LINK_TARGET_ID`),
  CONSTRAINT `TBLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `TBLS_FK2` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`),
  CONSTRAINT `TBLS_FK3` FOREIGN KEY (`LINK_TARGET_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBLS`
--

LOCK TABLES `TBLS` WRITE;
/*!40000 ALTER TABLE `TBLS` DISABLE KEYS */;
INSERT INTO `TBLS` VALUES (136,1462341668,1,0,'root',0,376,'cf','MANAGED_TABLE',NULL,NULL,NULL),(141,1463456922,1,0,'root',0,381,'test','MANAGED_TABLE',NULL,NULL,NULL),(142,1463457056,1,0,'root',0,382,'wzy','MANAGED_TABLE',NULL,NULL,NULL),(145,1463461111,1,0,'root',0,385,'wzy02','MANAGED_TABLE',NULL,NULL,NULL),(146,1463482168,1,0,'root',0,386,'default__cf__luceneindex_tb_cf','INDEX_TABLE',NULL,NULL,NULL);
/*!40000 ALTER TABLE `TBLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_COL_PRIVS`
--

DROP TABLE IF EXISTS `TBL_COL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_COL_PRIVS` (
  `TBL_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_COL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_COLUMN_GRANT_ID`),
  KEY `TABLECOLUMNPRIVILEGEINDEX` (`TBL_ID`,`COLUMN_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`TBL_COL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `TBL_COL_PRIVS_N49` (`TBL_ID`),
  CONSTRAINT `TBL_COL_PRIVS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_COL_PRIVS`
--

LOCK TABLES `TBL_COL_PRIVS` WRITE;
/*!40000 ALTER TABLE `TBL_COL_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_COL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PRIVS`
--

DROP TABLE IF EXISTS `TBL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PRIVS` (
  `TBL_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_GRANT_ID`),
  KEY `TBL_PRIVS_N49` (`TBL_ID`),
  KEY `TABLEPRIVILEGEINDEX` (`TBL_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`TBL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  CONSTRAINT `TBL_PRIVS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PRIVS`
--

LOCK TABLES `TBL_PRIVS` WRITE;
/*!40000 ALTER TABLE `TBL_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TXNS`
--

DROP TABLE IF EXISTS `TXNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TXNS` (
  `TXN_ID` bigint(20) NOT NULL,
  `TXN_STATE` char(1) NOT NULL,
  `TXN_STARTED` bigint(20) NOT NULL,
  `TXN_LAST_HEARTBEAT` bigint(20) NOT NULL,
  `TXN_USER` varchar(128) NOT NULL,
  `TXN_HOST` varchar(128) NOT NULL,
  PRIMARY KEY (`TXN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TXNS`
--

LOCK TABLES `TXNS` WRITE;
/*!40000 ALTER TABLE `TXNS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TXNS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TXN_COMPONENTS`
--

DROP TABLE IF EXISTS `TXN_COMPONENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TXN_COMPONENTS` (
  `TC_TXNID` bigint(20) DEFAULT NULL,
  `TC_DATABASE` varchar(128) NOT NULL,
  `TC_TABLE` varchar(128) DEFAULT NULL,
  `TC_PARTITION` varchar(767) DEFAULT NULL,
  KEY `TC_TXNID` (`TC_TXNID`),
  CONSTRAINT `TXN_COMPONENTS_ibfk_1` FOREIGN KEY (`TC_TXNID`) REFERENCES `TXNS` (`TXN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TXN_COMPONENTS`
--

LOCK TABLES `TXN_COMPONENTS` WRITE;
/*!40000 ALTER TABLE `TXN_COMPONENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TXN_COMPONENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPES`
--

DROP TABLE IF EXISTS `TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPES` (
  `TYPES_ID` bigint(20) NOT NULL,
  `TYPE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TYPE1` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TYPE2` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`TYPES_ID`),
  UNIQUE KEY `UNIQUE_TYPE` (`TYPE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPES`
--

LOCK TABLES `TYPES` WRITE;
/*!40000 ALTER TABLE `TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_FIELDS`
--

DROP TABLE IF EXISTS `TYPE_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPE_FIELDS` (
  `TYPE_NAME` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `FIELD_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `FIELD_TYPE` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TYPE_NAME`,`FIELD_NAME`),
  KEY `TYPE_FIELDS_N49` (`TYPE_NAME`),
  CONSTRAINT `TYPE_FIELDS_FK1` FOREIGN KEY (`TYPE_NAME`) REFERENCES `TYPES` (`TYPES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_FIELDS`
--

LOCK TABLES `TYPE_FIELDS` WRITE;
/*!40000 ALTER TABLE `TYPE_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERSION`
--

DROP TABLE IF EXISTS `VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VERSION` (
  `VER_ID` bigint(20) NOT NULL,
  `SCHEMA_VERSION` varchar(127) NOT NULL,
  `VERSION_COMMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERSION`
--

LOCK TABLES `VERSION` WRITE;
/*!40000 ALTER TABLE `VERSION` DISABLE KEYS */;
INSERT INTO `VERSION` VALUES (1,'1.1.0','Set by MetaStore hive@127.0.0.1');
/*!40000 ALTER TABLE `VERSION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07  7:50:53
