-- MySQL dump 10.13  Distrib 5.1.66, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: hue
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `axes_accessattempt`
--

DROP TABLE IF EXISTS `axes_accessattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axes_accessattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` char(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trusted` tinyint(1) NOT NULL,
  `http_accept` varchar(1025) COLLATE utf8_unicode_ci NOT NULL,
  `path_info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attempt_time` datetime NOT NULL,
  `get_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failures_since_start` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `axes_accesslog`
--

DROP TABLE IF EXISTS `axes_accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axes_accesslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` char(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trusted` tinyint(1) NOT NULL,
  `http_accept` varchar(1025) COLLATE utf8_unicode_ci NOT NULL,
  `path_info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attempt_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beeswax_metainstall`
--

DROP TABLE IF EXISTS `beeswax_metainstall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beeswax_metainstall` (
  `installed_example` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beeswax_queryhistory`
--

DROP TABLE IF EXISTS `beeswax_queryhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beeswax_queryhistory` (
  `submission_date` datetime NOT NULL,
  `last_state` int(11) NOT NULL,
  `server_id` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_context` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `design_id` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  `has_results` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify` tinyint(1) NOT NULL,
  `server_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `server_host` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `server_port` int(10) unsigned NOT NULL,
  `server_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `server_guid` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operation_type` smallint(6),
  `modified_row_count` double,
  `statement_number` smallint(6) NOT NULL,
  `query_type` smallint(6) NOT NULL,
  `is_redacted` tinyint(1) NOT NULL,
  `extra` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `beeswax_queryhistory_bfe02e93` (`last_state`),
  KEY `beeswax_queryhistory_38ebade8` (`design_id`),
  KEY `beeswax_queryhistory_cb902d83` (`owner_id`),
  CONSTRAINT `design_id_refs_id_f8250ba5` FOREIGN KEY (`design_id`) REFERENCES `beeswax_savedquery` (`id`),
  CONSTRAINT `owner_id_refs_id_d5c13755` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beeswax_savedquery`
--

DROP TABLE IF EXISTS `beeswax_savedquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beeswax_savedquery` (
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `is_auto` tinyint(1) NOT NULL,
  `mtime` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_trashed` tinyint(1) NOT NULL,
  `is_redacted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `beeswax_savedquery_db558b3c` (`is_auto`),
  KEY `beeswax_savedquery_cb902d83` (`owner_id`),
  KEY `beeswax_savedquery_863b5435` (`is_trashed`),
  CONSTRAINT `owner_id_refs_id_9ecea72d` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beeswax_session`
--

DROP TABLE IF EXISTS `beeswax_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beeswax_session` (
  `last_used` datetime NOT NULL,
  `status_code` smallint(5) unsigned NOT NULL,
  `server_protocol_version` smallint(6) NOT NULL,
  `secret` longtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `guid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `beeswax_session_cdfd3889` (`last_used`),
  KEY `beeswax_session_cb902d83` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_0417c1ac` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_document`
--

DROP TABLE IF EXISTS `desktop_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_document` (
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `extra` longtext COLLATE utf8_unicode_ci NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `last_modified` datetime NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `version` smallint(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_document_content_type_id_24066d293ce4f1bf_uniq` (`content_type_id`,`object_id`),
  KEY `desktop_document_5ccb38e5` (`last_modified`),
  KEY `desktop_document_37ef4eb4` (`content_type_id`),
  KEY `desktop_document_cb902d83` (`owner_id`),
  CONSTRAINT `content_type_id_refs_id_800664c4` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `owner_id_refs_id_6062a036` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_document2`
--

DROP TABLE IF EXISTS `desktop_document2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_document2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `extra` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime NOT NULL,
  `version` smallint(6) NOT NULL,
  `is_history` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_document2_uuid_71ec93c81d6e68e7_uniq` (`uuid`,`version`,`is_history`),
  KEY `desktop_document2_cb902d83` (`owner_id`),
  KEY `desktop_document2_6f6e1b62` (`uuid`),
  KEY `desktop_document2_403d8ff3` (`type`),
  KEY `desktop_document2_5ccb38e5` (`last_modified`),
  KEY `desktop_document2_f516c2b3` (`version`),
  KEY `desktop_document2_dd08191e` (`is_history`),
  CONSTRAINT `owner_id_refs_id_04b63201` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_document2_dependencies`
--

DROP TABLE IF EXISTS `desktop_document2_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_document2_dependencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_document2_id` int(11) NOT NULL,
  `to_document2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_document2_depen_from_document2_id_180cf2c525720117_uniq` (`from_document2_id`,`to_document2_id`),
  KEY `desktop_document2_dependencies_5248ab40` (`from_document2_id`),
  KEY `desktop_document2_dependencies_19db1b82` (`to_document2_id`),
  CONSTRAINT `from_document2_id_refs_id_a2dfdbb8` FOREIGN KEY (`from_document2_id`) REFERENCES `desktop_document2` (`id`),
  CONSTRAINT `to_document2_id_refs_id_a2dfdbb8` FOREIGN KEY (`to_document2_id`) REFERENCES `desktop_document2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_document2_tags`
--

DROP TABLE IF EXISTS `desktop_document2_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_document2_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_document2_id` int(11) NOT NULL,
  `to_document2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_document2_tags_from_document2_id_30290bc57f13bcc9_uniq` (`from_document2_id`,`to_document2_id`),
  KEY `desktop_document2_tags_5248ab40` (`from_document2_id`),
  KEY `desktop_document2_tags_19db1b82` (`to_document2_id`),
  CONSTRAINT `from_document2_id_refs_id_297d33ea` FOREIGN KEY (`from_document2_id`) REFERENCES `desktop_document2` (`id`),
  CONSTRAINT `to_document2_id_refs_id_297d33ea` FOREIGN KEY (`to_document2_id`) REFERENCES `desktop_document2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_document_tags`
--

DROP TABLE IF EXISTS `desktop_document_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_document_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `documenttag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_document_tags_document_id_22435f97005dd9b0_uniq` (`document_id`,`documenttag_id`),
  KEY `desktop_document_tags_b7398729` (`document_id`),
  KEY `desktop_document_tags_21e9f328` (`documenttag_id`),
  CONSTRAINT `documenttag_id_refs_id_f5f1db6f` FOREIGN KEY (`documenttag_id`) REFERENCES `desktop_documenttag` (`id`),
  CONSTRAINT `document_id_refs_id_599007de` FOREIGN KEY (`document_id`) REFERENCES `desktop_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_documentpermission`
--

DROP TABLE IF EXISTS `desktop_documentpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_documentpermission` (
  `perms` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `doc_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_documentpermission_doc_id_60b132dd84ab9469_uniq` (`doc_id`,`perms`),
  KEY `desktop_documentpermission_fbbb6049` (`doc_id`),
  CONSTRAINT `doc_id_refs_id_6e61f686` FOREIGN KEY (`doc_id`) REFERENCES `desktop_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_documenttag`
--

DROP TABLE IF EXISTS `desktop_documenttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_documenttag` (
  `owner_id` int(11) NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desktop_documenttag_owner_id_1d5f76680ee9998b_uniq` (`owner_id`,`tag`),
  KEY `desktop_documenttag_cb902d83` (`owner_id`),
  KEY `desktop_documenttag_5659cca2` (`tag`),
  CONSTRAINT `owner_id_refs_id_a0e6eebe` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_settings`
--

DROP TABLE IF EXISTS `desktop_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_settings` (
  `collect_usage` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tours_and_tutorials` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `desktop_settings_02d738b3` (`collect_usage`),
  KEY `desktop_settings_73ca4b20` (`tours_and_tutorials`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desktop_userpreferences`
--

DROP TABLE IF EXISTS `desktop_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desktop_userpreferences` (
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `desktop_userpreferences_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_6de51743` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_openid_auth_association`
--

DROP TABLE IF EXISTS `django_openid_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` longtext COLLATE utf8_unicode_ci NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_openid_auth_nonce`
--

DROP TABLE IF EXISTS `django_openid_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_openid_auth_useropenid`
--

DROP TABLE IF EXISTS `django_openid_auth_useropenid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_useropenid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `claimed_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `claimed_id` (`claimed_id`),
  KEY `django_openid_auth_useropenid_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_8f018ae0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentpermission_groups`
--

DROP TABLE IF EXISTS `documentpermission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentpermission_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentpermission_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documentpermission__documentpermission_id_69436afd449228fe_uniq` (`documentpermission_id`,`group_id`),
  KEY `documentpermission_groups_35c59db1` (`documentpermission_id`),
  KEY `documentpermission_groups_5f412f9a` (`group_id`),
  CONSTRAINT `documentpermission_id_refs_id_b50c1f1d` FOREIGN KEY (`documentpermission_id`) REFERENCES `desktop_documentpermission` (`id`),
  CONSTRAINT `group_id_refs_id_dcacd481` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentpermission_users`
--

DROP TABLE IF EXISTS `documentpermission_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentpermission_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentpermission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documentpermission__documentpermission_id_6577517b9e586968_uniq` (`documentpermission_id`,`user_id`),
  KEY `documentpermission_users_35c59db1` (`documentpermission_id`),
  KEY `documentpermission_users_6340c63c` (`user_id`),
  CONSTRAINT `documentpermission_id_refs_id_b8222d7f` FOREIGN KEY (`documentpermission_id`) REFERENCES `desktop_documentpermission` (`id`),
  CONSTRAINT `user_id_refs_id_70816365` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_checkforsetup`
--

DROP TABLE IF EXISTS `jobsub_checkforsetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_checkforsetup` (
  `setup_run` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setup_level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_jobdesign`
--

DROP TABLE IF EXISTS `jobsub_jobdesign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_jobdesign` (
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobsub_jobdesign_cb902d83` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_753082e9` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_jobhistory`
--

DROP TABLE IF EXISTS `jobsub_jobhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_jobhistory` (
  `owner_id` int(11) NOT NULL,
  `submission_date` datetime NOT NULL,
  `design_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobsub_jobhistory_cb902d83` (`owner_id`),
  KEY `jobsub_jobhistory_38ebade8` (`design_id`),
  CONSTRAINT `design_id_refs_id_5e12bb2f` FOREIGN KEY (`design_id`) REFERENCES `jobsub_ooziedesign` (`id`),
  CONSTRAINT `owner_id_refs_id_58370e7c` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_oozieaction`
--

DROP TABLE IF EXISTS `jobsub_oozieaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_oozieaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_ooziedesign`
--

DROP TABLE IF EXISTS `jobsub_ooziedesign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_ooziedesign` (
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root_action_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobsub_ooziedesign_cb902d83` (`owner_id`),
  KEY `jobsub_ooziedesign_ce106e64` (`root_action_id`),
  CONSTRAINT `owner_id_refs_id_55551230` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `root_action_id_refs_id_26319073` FOREIGN KEY (`root_action_id`) REFERENCES `jobsub_oozieaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_ooziejavaaction`
--

DROP TABLE IF EXISTS `jobsub_ooziejavaaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_ooziejavaaction` (
  `oozieaction_ptr_id` int(11) NOT NULL,
  `files` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `jar_path` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `java_opts` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `main_class` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`oozieaction_ptr_id`),
  CONSTRAINT `oozieaction_ptr_id_refs_id_890da3c3` FOREIGN KEY (`oozieaction_ptr_id`) REFERENCES `jobsub_oozieaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_ooziemapreduceaction`
--

DROP TABLE IF EXISTS `jobsub_ooziemapreduceaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_ooziemapreduceaction` (
  `oozieaction_ptr_id` int(11) NOT NULL,
  `files` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `jar_path` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `archives` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`oozieaction_ptr_id`),
  CONSTRAINT `oozieaction_ptr_id_refs_id_85f71d45` FOREIGN KEY (`oozieaction_ptr_id`) REFERENCES `jobsub_oozieaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobsub_ooziestreamingaction`
--

DROP TABLE IF EXISTS `jobsub_ooziestreamingaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsub_ooziestreamingaction` (
  `oozieaction_ptr_id` int(11) NOT NULL,
  `files` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `mapper` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `reducer` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`oozieaction_ptr_id`),
  CONSTRAINT `oozieaction_ptr_id_refs_id_6dad0be7` FOREIGN KEY (`oozieaction_ptr_id`) REFERENCES `jobsub_oozieaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_bundle`
--

DROP TABLE IF EXISTS `oozie_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_bundle` (
  `kick_off_time` datetime NOT NULL,
  `job_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`job_ptr_id`),
  CONSTRAINT `job_ptr_id_refs_id_dfe854cc` FOREIGN KEY (`job_ptr_id`) REFERENCES `oozie_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_bundledcoordinator`
--

DROP TABLE IF EXISTS `oozie_bundledcoordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_bundledcoordinator` (
  `coordinator_id` int(11) NOT NULL,
  `parameters` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oozie_bundledcoordinator_a376e044` (`coordinator_id`),
  KEY `oozie_bundledcoordinator_2243b87b` (`bundle_id`),
  CONSTRAINT `bundle_id_refs_job_ptr_id_49f6b676` FOREIGN KEY (`bundle_id`) REFERENCES `oozie_bundle` (`job_ptr_id`),
  CONSTRAINT `coordinator_id_refs_job_ptr_id_4b9a476a` FOREIGN KEY (`coordinator_id`) REFERENCES `oozie_coordinator` (`job_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_coordinator`
--

DROP TABLE IF EXISTS `oozie_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_coordinator` (
  `end` datetime NOT NULL,
  `concurrency` smallint(5) unsigned DEFAULT NULL,
  `frequency_number` smallint(6) NOT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `job_ptr_id` int(11) NOT NULL,
  `frequency_unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `timeout` smallint(6) DEFAULT NULL,
  `timezone` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `throttle` smallint(5) unsigned DEFAULT NULL,
  `execution` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`job_ptr_id`),
  KEY `oozie_coordinator_17b2fdb1` (`workflow_id`),
  CONSTRAINT `job_ptr_id_refs_id_02836103` FOREIGN KEY (`job_ptr_id`) REFERENCES `oozie_job` (`id`),
  CONSTRAINT `workflow_id_refs_job_ptr_id_eff253f3` FOREIGN KEY (`workflow_id`) REFERENCES `oozie_workflow` (`job_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_datainput`
--

DROP TABLE IF EXISTS `oozie_datainput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_datainput` (
  `coordinator_id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`),
  KEY `oozie_datainput_a376e044` (`coordinator_id`),
  CONSTRAINT `coordinator_id_refs_job_ptr_id_a7f5bae4` FOREIGN KEY (`coordinator_id`) REFERENCES `oozie_coordinator` (`job_ptr_id`),
  CONSTRAINT `dataset_id_refs_id_6d9c387e` FOREIGN KEY (`dataset_id`) REFERENCES `oozie_dataset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_dataoutput`
--

DROP TABLE IF EXISTS `oozie_dataoutput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_dataoutput` (
  `coordinator_id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`),
  KEY `oozie_dataoutput_a376e044` (`coordinator_id`),
  CONSTRAINT `coordinator_id_refs_job_ptr_id_35e76a9d` FOREIGN KEY (`coordinator_id`) REFERENCES `oozie_coordinator` (`job_ptr_id`),
  CONSTRAINT `dataset_id_refs_id_c25267c2` FOREIGN KEY (`dataset_id`) REFERENCES `oozie_dataset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_dataset`
--

DROP TABLE IF EXISTS `oozie_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_dataset` (
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `frequency_number` smallint(6) NOT NULL,
  `coordinator_id` int(11) NOT NULL,
  `frequency_unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `timezone` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `done_flag` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `advanced_start_instance` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `instance_choice` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `advanced_end_instance` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oozie_dataset_a376e044` (`coordinator_id`),
  CONSTRAINT `coordinator_id_refs_job_ptr_id_c1a45b56` FOREIGN KEY (`coordinator_id`) REFERENCES `oozie_coordinator` (`job_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_decision`
--

DROP TABLE IF EXISTS `oozie_decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_decision` (
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_67bc250e` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_decisionend`
--

DROP TABLE IF EXISTS `oozie_decisionend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_decisionend` (
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_31e174a0` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_distcp`
--

DROP TABLE IF EXISTS `oozie_distcp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_distcp` (
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_94a882fe` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_email`
--

DROP TABLE IF EXISTS `oozie_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_email` (
  `cc` longtext COLLATE utf8_unicode_ci NOT NULL,
  `to` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_a770716b` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_end`
--

DROP TABLE IF EXISTS `oozie_end`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_end` (
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_d2ab2ce2` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_fork`
--

DROP TABLE IF EXISTS `oozie_fork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_fork` (
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_08311288` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_fs`
--

DROP TABLE IF EXISTS `oozie_fs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_fs` (
  `mkdirs` longtext COLLATE utf8_unicode_ci NOT NULL,
  `touchzs` longtext COLLATE utf8_unicode_ci NOT NULL,
  `chmods` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `moves` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deletes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_f2c6c820` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_generic`
--

DROP TABLE IF EXISTS `oozie_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_generic` (
  `xml` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_52bde32b` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_history`
--

DROP TABLE IF EXISTS `oozie_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_history` (
  `submission_date` datetime NOT NULL,
  `job_id` int(11) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `oozie_job_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `submitter_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `oozie_history_0ebd36f3` (`submission_date`),
  KEY `oozie_history_218f3960` (`job_id`),
  KEY `oozie_history_5f7282ee` (`submitter_id`),
  CONSTRAINT `job_id_refs_id_aca84a0b` FOREIGN KEY (`job_id`) REFERENCES `oozie_job` (`id`),
  CONSTRAINT `submitter_id_refs_id_be4aca60` FOREIGN KEY (`submitter_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_hive`
--

DROP TABLE IF EXISTS `oozie_hive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_hive` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `script_path` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_7061d230` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_java`
--

DROP TABLE IF EXISTS `oozie_java`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_java` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `jar_path` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `java_opts` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `main_class` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `capture_output` tinyint(1) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_c5504fe4` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_job`
--

DROP TABLE IF EXISTS `oozie_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_job` (
  `is_shared` tinyint(1) NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `parameters` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deployment_dir` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `schema_version` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_trashed` tinyint(1) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oozie_job_b91b90da` (`is_shared`),
  KEY `oozie_job_5ccb38e5` (`last_modified`),
  KEY `oozie_job_cb902d83` (`owner_id`),
  KEY `oozie_job_863b5435` (`is_trashed`),
  CONSTRAINT `owner_id_refs_id_b9eb9598` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_join`
--

DROP TABLE IF EXISTS `oozie_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_join` (
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_5fe5ad59` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_kill`
--

DROP TABLE IF EXISTS `oozie_kill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_kill` (
  `message` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_6a5609f4` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_link`
--

DROP TABLE IF EXISTS `oozie_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_link` (
  `comment` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oozie_link_410d0aac` (`parent_id`),
  KEY `oozie_link_0b25fb00` (`child_id`),
  CONSTRAINT `child_id_refs_id_4c5f8d9b` FOREIGN KEY (`child_id`) REFERENCES `oozie_node` (`id`),
  CONSTRAINT `parent_id_refs_id_4c5f8d9b` FOREIGN KEY (`parent_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_mapreduce`
--

DROP TABLE IF EXISTS `oozie_mapreduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_mapreduce` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `jar_path` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `node_ptr_id` (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_faafd42d` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_node`
--

DROP TABLE IF EXISTS `oozie_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_node` (
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oozie_node_17b2fdb1` (`workflow_id`),
  CONSTRAINT `workflow_id_refs_job_ptr_id_61733cb8` FOREIGN KEY (`workflow_id`) REFERENCES `oozie_workflow` (`job_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_pig`
--

DROP TABLE IF EXISTS `oozie_pig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_pig` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `script_path` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_3a145eb2` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_shell`
--

DROP TABLE IF EXISTS `oozie_shell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_shell` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `capture_output` tinyint(1) NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `command` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_6a9f9c63` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_sqoop`
--

DROP TABLE IF EXISTS `oozie_sqoop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_sqoop` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `prepares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `script_path` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_51abc83b` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_ssh`
--

DROP TABLE IF EXISTS `oozie_ssh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_ssh` (
  `capture_output` tinyint(1) NOT NULL,
  `host` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  `command` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_e6a21afc` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_start`
--

DROP TABLE IF EXISTS `oozie_start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_start` (
  `node_ptr_id` int(11) NOT NULL,
  UNIQUE KEY `node_ptr_id` (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_ed4928be` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_streaming`
--

DROP TABLE IF EXISTS `oozie_streaming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_streaming` (
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mapper` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `reducer` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archives` longtext COLLATE utf8_unicode_ci NOT NULL,
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  CONSTRAINT `node_ptr_id_refs_id_5857900b` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_subworkflow`
--

DROP TABLE IF EXISTS `oozie_subworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_subworkflow` (
  `propagate_configuration` tinyint(1) NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sub_workflow_id` int(11),
  `node_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`node_ptr_id`),
  KEY `oozie_subworkflow_7c14fdc3` (`sub_workflow_id`),
  CONSTRAINT `node_ptr_id_refs_id_9a2f74e6` FOREIGN KEY (`node_ptr_id`) REFERENCES `oozie_node` (`id`),
  CONSTRAINT `sub_workflow_id_refs_job_ptr_id_b9cfb611` FOREIGN KEY (`sub_workflow_id`) REFERENCES `oozie_workflow` (`job_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oozie_workflow`
--

DROP TABLE IF EXISTS `oozie_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oozie_workflow` (
  `job_xml` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `end_id` int(11) DEFAULT NULL,
  `is_single` tinyint(1) NOT NULL,
  `job_ptr_id` int(11) NOT NULL,
  `job_properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_id` int(11) DEFAULT NULL,
  `managed` tinyint(1) NOT NULL,
  PRIMARY KEY (`job_ptr_id`),
  KEY `oozie_workflow_536e023f` (`end_id`),
  KEY `oozie_workflow_6f89268d` (`start_id`),
  CONSTRAINT `end_id_refs_id_92f16762` FOREIGN KEY (`end_id`) REFERENCES `oozie_node` (`id`),
  CONSTRAINT `job_ptr_id_refs_id_8bb519fb` FOREIGN KEY (`job_ptr_id`) REFERENCES `oozie_job` (`id`),
  CONSTRAINT `start_id_refs_id_92f16762` FOREIGN KEY (`start_id`) REFERENCES `oozie_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pig_document`
--

DROP TABLE IF EXISTS `pig_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pig_document` (
  `owner_id` int(11) NOT NULL,
  `is_design` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `pig_document_cb902d83` (`owner_id`),
  KEY `pig_document_63cbf1fe` (`is_design`),
  CONSTRAINT `owner_id_refs_id_8d390f80` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pig_pigscript`
--

DROP TABLE IF EXISTS `pig_pigscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pig_pigscript` (
  `document_ptr_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`document_ptr_id`),
  CONSTRAINT `document_ptr_id_refs_id_17b4e137` FOREIGN KEY (`document_ptr_id`) REFERENCES `pig_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_collection`
--

DROP TABLE IF EXISTS `search_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_collection` (
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sorting_id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `facets_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_core_only` tinyint(1) NOT NULL,
  `result_id` int(11) NOT NULL,
  `cores` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_collection_1ee0a855` (`sorting_id`),
  KEY `search_collection_be9133f8` (`facets_id`),
  KEY `search_collection_f41c4334` (`result_id`),
  KEY `search_collection_cb902d83` (`owner_id`),
  CONSTRAINT `facets_id_refs_id_109f7b9d` FOREIGN KEY (`facets_id`) REFERENCES `search_facet` (`id`),
  CONSTRAINT `owner_id_refs_id_fb75896c` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `result_id_refs_id_cef2c4d1` FOREIGN KEY (`result_id`) REFERENCES `search_result` (`id`),
  CONSTRAINT `sorting_id_refs_id_63666e75` FOREIGN KEY (`sorting_id`) REFERENCES `search_sorting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_facet`
--

DROP TABLE IF EXISTS `search_facet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_facet` (
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_result`
--

DROP TABLE IF EXISTS `search_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_result` (
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_sorting`
--

DROP TABLE IF EXISTS `search_sorting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_sorting` (
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useradmin_grouppermission`
--

DROP TABLE IF EXISTS `useradmin_grouppermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useradmin_grouppermission` (
  `hue_permission_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `useradmin_grouppermission_9dd0e7a9` (`hue_permission_id`),
  KEY `useradmin_grouppermission_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_d2a5bba4` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `hue_permission_id_refs_id_53ff8024` FOREIGN KEY (`hue_permission_id`) REFERENCES `useradmin_huepermission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useradmin_huepermission`
--

DROP TABLE IF EXISTS `useradmin_huepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useradmin_huepermission` (
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useradmin_ldapgroup`
--

DROP TABLE IF EXISTS `useradmin_ldapgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useradmin_ldapgroup` (
  `group_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `useradmin_ldapgroup_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_23c2c967` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useradmin_userprofile`
--

DROP TABLE IF EXISTS `useradmin_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useradmin_userprofile` (
  `home_directory` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `creation_method` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `first_login` tinyint(1) NOT NULL,
  `last_activity` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `useradmin_userprofile_9cf27b62` (`last_activity`),
  CONSTRAINT `user_id_refs_id_e66f296b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07  8:51:14
