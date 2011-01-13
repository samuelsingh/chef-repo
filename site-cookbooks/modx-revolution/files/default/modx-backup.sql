-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: modx
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.8

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
-- Table structure for table `modx_access_actiondom`
--

DROP TABLE IF EXISTS `modx_access_actiondom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_actiondom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_actiondom`
--

LOCK TABLES `modx_access_actiondom` WRITE;
/*!40000 ALTER TABLE `modx_access_actiondom` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_actiondom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_actions`
--

DROP TABLE IF EXISTS `modx_access_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_actions`
--

LOCK TABLES `modx_access_actions` WRITE;
/*!40000 ALTER TABLE `modx_access_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_category`
--

DROP TABLE IF EXISTS `modx_access_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`),
  KEY `context_key` (`context_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_category`
--

LOCK TABLES `modx_access_category` WRITE;
/*!40000 ALTER TABLE `modx_access_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_context`
--

DROP TABLE IF EXISTS `modx_access_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_context` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_context`
--

LOCK TABLES `modx_access_context` WRITE;
/*!40000 ALTER TABLE `modx_access_context` DISABLE KEYS */;
INSERT INTO `modx_access_context` VALUES (1,'web','modUserGroup',0,9999,3),(2,'mgr','modUserGroup',1,0,2),(3,'web','modUserGroup',1,0,2);
/*!40000 ALTER TABLE `modx_access_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_elements`
--

DROP TABLE IF EXISTS `modx_access_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`),
  KEY `context_key` (`context_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_elements`
--

LOCK TABLES `modx_access_elements` WRITE;
/*!40000 ALTER TABLE `modx_access_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_menus`
--

DROP TABLE IF EXISTS `modx_access_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_menus`
--

LOCK TABLES `modx_access_menus` WRITE;
/*!40000 ALTER TABLE `modx_access_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_permissions`
--

DROP TABLE IF EXISTS `modx_access_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `value` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `template` (`template`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_permissions`
--

LOCK TABLES `modx_access_permissions` WRITE;
/*!40000 ALTER TABLE `modx_access_permissions` DISABLE KEYS */;
INSERT INTO `modx_access_permissions` VALUES (1,1,'about','perm.about_desc',1),(2,1,'access_permissions','perm.access_permissions_desc',1),(3,1,'actions','perm.actions_desc',1),(4,1,'change_password','perm.change_password_desc',1),(5,1,'change_profile','perm.change_profile_desc',1),(6,1,'charsets','perm.charsets_desc',1),(7,1,'class_map','perm.class_map_desc',1),(8,1,'components','perm.components_desc',1),(9,1,'content_types','perm.content_types_desc',1),(10,1,'countries','perm.countries_desc',1),(11,1,'create','perm.create_desc',1),(12,1,'credits','perm.credits_desc',1),(13,1,'customize_forms','perm.customize_forms_desc',1),(14,1,'database','perm.database_desc',1),(15,1,'database_truncate','perm.database_truncate_desc',1),(16,1,'delete_category','perm.delete_category_desc',1),(17,1,'delete_chunk','perm.delete_chunk_desc',1),(18,1,'delete_context','perm.delete_context_desc',1),(19,1,'delete_document','perm.delete_document_desc',1),(20,1,'delete_eventlog','perm.delete_eventlog_desc',1),(21,1,'delete_plugin','perm.delete_plugin_desc',1),(22,1,'delete_propertyset','perm.delete_propertyset_desc',1),(23,1,'delete_snippet','perm.delete_snippet_desc',1),(24,1,'delete_template','perm.delete_template_desc',1),(25,1,'delete_tv','perm.delete_tv_desc',1),(26,1,'delete_role','perm.delete_role_desc',1),(27,1,'delete_user','perm.delete_user_desc',1),(28,1,'directory_chmod','perm.directory_chmod_desc',1),(29,1,'directory_create','perm.directory_create_desc',1),(30,1,'directory_list','perm.directory_list_desc',1),(31,1,'directory_remove','perm.directory_remove_desc',1),(32,1,'directory_update','perm.directory_update_desc',1),(33,1,'edit_category','perm.edit_category_desc',1),(34,1,'edit_chunk','perm.edit_chunk_desc',1),(35,1,'edit_context','perm.edit_context_desc',1),(36,1,'edit_document','perm.edit_document_desc',1),(37,1,'edit_locked','perm.edit_locked_desc',1),(38,1,'edit_plugin','perm.edit_plugin_desc',1),(39,1,'edit_propertyset','perm.edit_propertyset_desc',1),(40,1,'edit_role','perm.edit_role_desc',1),(41,1,'edit_snippet','perm.edit_snippet_desc',1),(42,1,'edit_template','perm.edit_template_desc',1),(43,1,'edit_tv','perm.edit_tv_desc',1),(44,1,'edit_user','perm.edit_user_desc',1),(45,1,'element_tree','perm.element_tree_desc',1),(46,1,'empty_cache','perm.empty_cache_desc',1),(47,1,'error_log_erase','perm.error_log_erase_desc',1),(48,1,'error_log_view','perm.error_log_view_desc',1),(49,1,'export_static','perm.export_static_desc',1),(50,1,'file_list','perm.file_list_desc',1),(51,1,'file_manager','perm.file_manager_desc',1),(52,1,'file_remove','perm.file_remove_desc',1),(53,1,'file_tree','perm.file_tree_desc',1),(54,1,'file_update','perm.file_update_desc',1),(55,1,'file_upload','perm.file_upload_desc',1),(56,1,'file_view','perm.file_view_desc',1),(57,1,'flush_sessions','perm.flush_sessions_desc',1),(58,1,'frames','perm.frames_desc',1),(59,1,'help','perm.help_desc',1),(60,1,'home','perm.home_desc',1),(61,1,'import_static','perm.import_static_desc',1),(62,1,'languages','perm.languages_desc',1),(63,1,'lexicons','perm.lexicons_desc',1),(64,1,'list','perm.list_desc',1),(65,1,'load','perm.load_desc',1),(66,1,'logout','perm.logout_desc',1),(67,1,'logs','perm.logs_desc',1),(68,1,'menus','perm.menus_desc',1),(69,1,'messages','perm.messages_desc',1),(70,1,'namespaces','perm.namespaces_desc',1),(71,1,'new_category','perm.new_category_desc',1),(72,1,'new_chunk','perm.new_chunk_desc',1),(73,1,'new_context','perm.new_context_desc',1),(74,1,'new_document','perm.new_document_desc',1),(75,1,'new_document_in_root','perm.new_document_in_root_desc',1),(76,1,'new_plugin','perm.new_plugin_desc',1),(77,1,'new_propertyset','perm.new_propertyset_desc',1),(78,1,'new_role','perm.new_role_desc',1),(79,1,'new_snippet','perm.new_snippet_desc',1),(80,1,'new_template','perm.new_template_desc',1),(81,1,'new_tv','perm.new_tv_desc',1),(82,1,'new_user','perm.new_user_desc',1),(83,1,'packages','perm.packages_desc',1),(84,1,'property_sets','perm.property_sets_desc',1),(85,1,'providers','perm.providers_desc',1),(86,1,'publish_document','perm.publish_document_desc',1),(87,1,'purge_deleted','perm.purge_deleted_desc',1),(88,1,'remove','perm.remove_desc',1),(89,1,'remove_locks','perm.remove_locks_desc',1),(90,1,'resource_tree','perm.resource_tree_desc',1),(91,1,'save','perm.save_desc',1),(92,1,'save_category','perm.save_category_desc',1),(93,1,'save_chunk','perm.save_chunk_desc',1),(94,1,'save_context','perm.save_context_desc',1),(95,1,'save_document','perm.save_document_desc',1),(96,1,'save_plugin','perm.save_plugin_desc',1),(97,1,'save_propertyset','perm.save_propertyset_desc',1),(98,1,'save_role','perm.save_role_desc',1),(99,1,'save_snippet','perm.save_snippet_desc',1),(100,1,'save_template','perm.save_template_desc',1),(101,1,'save_tv','perm.save_tv_desc',1),(102,1,'save_user','perm.save_user_desc',1),(103,1,'search','perm.search_desc',1),(104,1,'settings','perm.settings_desc',1),(105,1,'steal_locks','perm.steal_locks_desc',1),(106,1,'undelete_document','perm.undelete_document_desc',1),(107,1,'unpublish_document','perm.unpublish_document_desc',1),(108,1,'unlock_element_properties','perm.unlock_element_properties_desc',1),(109,1,'view','perm.view_desc',1),(110,1,'view_category','perm.view_category_desc',1),(111,1,'view_chunk','perm.view_chunk_desc',1),(112,1,'view_context','perm.view_context_desc',1),(113,1,'view_document','perm.view_document_desc',1),(114,1,'view_element','perm.view_element_desc',1),(115,1,'view_eventlog','perm.view_eventlog_desc',1),(116,1,'view_offline','perm.view_offline_desc',1),(117,1,'view_plugin','perm.view_plugin_desc',1),(118,1,'view_propertyset','perm.view_propertyset_desc',1),(119,1,'view_role','perm.view_role_desc',1),(120,1,'view_snippet','perm.view_snippet_desc',1),(121,1,'view_sysinfo','perm.view_sysinfo_desc',1),(122,1,'view_template','perm.view_template_desc',1),(123,1,'view_tv','perm.view_tv_desc',1),(124,1,'view_user','perm.view_user_desc',1),(125,1,'view_unpublished','perm.view_unpublished_desc',1),(126,1,'workspaces','perm.workspaces_desc',1),(127,2,'add_children','perm.add_children_desc',1),(128,2,'copy','perm.copy_desc',1),(129,2,'create','perm.create_desc',1),(130,2,'delete','perm.delete_desc',1),(131,2,'list','perm.list_desc',1),(132,2,'load','perm.load_desc',1),(133,2,'move','perm.move_desc',1),(134,2,'publish','perm.publish_desc',1),(135,2,'remove','perm.remove_desc',1),(136,2,'save','perm.save_desc',1),(137,2,'steal_lock','perm.steal_lock_desc',1),(138,2,'undelete','perm.undelete_desc',1),(139,2,'unpublish','perm.unpublish_desc',1),(140,2,'view','perm.view_desc',1),(141,3,'load','perm.load_desc',1),(142,3,'list','perm.list_desc',1),(143,3,'view','perm.view_desc',1),(144,3,'save','perm.save_desc',1),(145,3,'remove','perm.remove_desc',1),(146,4,'add_children','perm.add_children_desc',1),(147,4,'create','perm.create_desc',1),(148,4,'copy','perm.copy_desc',1),(149,4,'delete','perm.delete_desc',1),(150,4,'list','perm.list_desc',1),(151,4,'load','perm.load_desc',1),(152,4,'remove','perm.remove_desc',1),(153,4,'save','perm.save_desc',1),(154,4,'view','perm.view_desc',1);
/*!40000 ALTER TABLE `modx_access_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_policies`
--

DROP TABLE IF EXISTS `modx_access_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_policies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext,
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `template` int(10) unsigned NOT NULL DEFAULT '0',
  `class` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `lexicon` varchar(255) NOT NULL DEFAULT 'permissions',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `parent` (`parent`),
  KEY `class` (`class`),
  KEY `template` (`template`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_policies`
--

LOCK TABLES `modx_access_policies` WRITE;
/*!40000 ALTER TABLE `modx_access_policies` DISABLE KEYS */;
INSERT INTO `modx_access_policies` VALUES (1,'Resource','MODx Resource Policy with all attributes.',0,2,'','{\"add_children\":true,\"create\":true,\"copy\":true,\"delete\":true,\"list\":true,\"load\":true,\"move\":true,\"publish\":true,\"remove\":true,\"save\":true,\"steal_lock\":true,\"undelete\":true,\"unpublish\":true,\"view\":true}','permissions'),(2,'Administrator','Context administration policy with all permissions.',0,1,'','{\"about\":true,\"access_permissions\":true,\"actions\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"database\":true,\"database_truncate\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_snippet\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_role\":true,\"delete_user\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"export_static\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_update\":true,\"file_upload\":true,\"file_view\":true,\"flush_sessions\":true,\"frames\":true,\"help\":true,\"home\":true,\"import_static\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"logs\":true,\"menus\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"packages\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"remove_locks\":true,\"resource_tree\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_role\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"settings\":true,\"steal_locks\":true,\"undelete_document\":true,\"unpublish_document\":true,\"unlock_element_properties\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_user\":true,\"view_unpublished\":true,\"workspaces\":true}','permissions'),(3,'Load Only','A minimal policy with permission to load an object.',0,3,'','{\"load\":true}','permissions'),(4,'Load, List and View','Provides load, list and view permissions only.',0,3,'','{\"load\":true,\"list\":true,\"view\":true}','permissions'),(5,'Object','An Object policy with all permissions.',0,3,'','{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true}','permissions'),(6,'Element','MODx Element policy with all attributes.',0,4,'','{\"add_children\":true,\"create\":true,\"delete\":true,\"list\":true,\"load\":true,\"remove\":true,\"save\":true,\"view\":true,\"copy\":true}','permissions'),(7,'Content Editor','Context administration policy with limited, content-editing related Permissions.',0,1,'','{\"change_profile\":true,\"class_map\":true,\"countries\":true,\"edit_document\":true,\"frames\":true,\"help\":true,\"home\":true,\"load\":true,\"list\":true,\"logout\":true,\"resource_tree\":true,\"save_document\":true,\"view\":true,\"view_document\":true,\"new_document\":true,\"delete_document\":true}','permissions');
/*!40000 ALTER TABLE `modx_access_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_policy_template_groups`
--

DROP TABLE IF EXISTS `modx_access_policy_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_policy_template_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_policy_template_groups`
--

LOCK TABLES `modx_access_policy_template_groups` WRITE;
/*!40000 ALTER TABLE `modx_access_policy_template_groups` DISABLE KEYS */;
INSERT INTO `modx_access_policy_template_groups` VALUES (1,'Admin','All admin policy templates.'),(2,'Object','All Object-based policy templates.'),(3,'Resource','All Resource-based policy templates.'),(4,'Element','All Element-based policy templates.');
/*!40000 ALTER TABLE `modx_access_policy_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_policy_templates`
--

DROP TABLE IF EXISTS `modx_access_policy_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_policy_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_group` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `lexicon` varchar(255) NOT NULL DEFAULT 'permissions',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_policy_templates`
--

LOCK TABLES `modx_access_policy_templates` WRITE;
/*!40000 ALTER TABLE `modx_access_policy_templates` DISABLE KEYS */;
INSERT INTO `modx_access_policy_templates` VALUES (1,1,'AdministratorTemplate','Context administration policy template with all permissions.','permissions'),(2,3,'ResourceTemplate','Resource Policy Template with all attributes.','permissions'),(3,2,'ObjectTemplate','Object Policy Template with all attributes.','permissions'),(4,4,'ElementTemplate','Element Policy Template with all attributes.','permissions');
/*!40000 ALTER TABLE `modx_access_policy_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_resource_groups`
--

DROP TABLE IF EXISTS `modx_access_resource_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_resource_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`),
  KEY `context_key` (`context_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_resource_groups`
--

LOCK TABLES `modx_access_resource_groups` WRITE;
/*!40000 ALTER TABLE `modx_access_resource_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_resource_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_resources`
--

DROP TABLE IF EXISTS `modx_access_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`),
  KEY `context_key` (`context_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_resources`
--

LOCK TABLES `modx_access_resources` WRITE;
/*!40000 ALTER TABLE `modx_access_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_access_templatevars`
--

DROP TABLE IF EXISTS `modx_access_templatevars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_access_templatevars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'modPrincipal',
  `principal` int(10) unsigned NOT NULL DEFAULT '0',
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  `policy` int(10) unsigned NOT NULL DEFAULT '0',
  `context_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `principal_class` (`principal_class`),
  KEY `principal` (`principal`),
  KEY `authority` (`authority`),
  KEY `policy` (`policy`),
  KEY `context_key` (`context_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_access_templatevars`
--

LOCK TABLES `modx_access_templatevars` WRITE;
/*!40000 ALTER TABLE `modx_access_templatevars` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_access_templatevars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_actiondom`
--

DROP TABLE IF EXISTS `modx_actiondom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_actiondom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `set` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `xtype` varchar(100) NOT NULL DEFAULT '',
  `container` varchar(255) NOT NULL DEFAULT '',
  `rule` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `constraint` varchar(255) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `for_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `set` (`set`),
  KEY `action` (`action`),
  KEY `name` (`name`),
  KEY `active` (`active`),
  KEY `for_parent` (`for_parent`),
  KEY `rank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_actiondom`
--

LOCK TABLES `modx_actiondom` WRITE;
/*!40000 ALTER TABLE `modx_actiondom` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_actiondom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_actions`
--

DROP TABLE IF EXISTS `modx_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) NOT NULL DEFAULT 'core',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `controller` varchar(255) NOT NULL,
  `haslayout` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lang_topics` text NOT NULL,
  `assets` text NOT NULL,
  `help_url` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `namespace` (`namespace`),
  KEY `parent` (`parent`),
  KEY `controller` (`controller`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_actions`
--

LOCK TABLES `modx_actions` WRITE;
/*!40000 ALTER TABLE `modx_actions` DISABLE KEYS */;
INSERT INTO `modx_actions` VALUES (1,'core',0,'welcome',1,'welcome,configcheck','',''),(2,'core',0,'system',0,'','',''),(3,'core',0,'browser',0,'file','',''),(4,'core',6,'context/create',1,'context,setting,access,policy,user','','http://rtfm.modx.com/display/revolution20/Contexts'),(5,'core',6,'context/update',1,'context,setting,access,policy,user','','http://rtfm.modx.com/display/revolution20/Contexts'),(6,'core',6,'context/view',1,'context','','http://rtfm.modx.com/display/revolution20/Contexts'),(7,'core',0,'element',1,'element','',''),(8,'core',10,'element/chunk',1,'chunk,category,propertyset,element','','http://rtfm.modx.com/display/revolution20/Chunks'),(9,'core',11,'element/chunk/create',1,'chunk,category,propertyset,element','','http://rtfm.modx.com/display/revolution20/Chunks'),(10,'core',11,'element/chunk/update',1,'chunk,category,propertyset,element','','http://rtfm.modx.com/display/revolution20/Chunks'),(11,'core',10,'element/plugin',1,'plugin,category,system_events,propertyset,element','','http://rtfm.modx.com/display/revolution20/Plugins'),(12,'core',20,'element/plugin/create',1,'plugin,category,system_events,propertyset,element','','http://rtfm.modx.com/display/revolution20/Plugins'),(13,'core',20,'element/plugin/update',1,'plugin,category,system_events,propertyset,element','','http://rtfm.modx.com/display/revolution20/Plugins'),(14,'core',10,'element/snippet',1,'snippet,propertyset,element','','http://rtfm.modx.com/display/revolution20/Snippets'),(15,'core',25,'element/snippet/create',1,'snippet,propertyset,element','','http://rtfm.modx.com/display/revolution20/Snippets'),(16,'core',25,'element/snippet/update',1,'snippet,propertyset,element','','http://rtfm.modx.com/display/revolution20/Snippets'),(17,'core',10,'element/template',1,'template,propertyset,element','','http://rtfm.modx.com/display/revolution20/Templates'),(18,'core',28,'element/template/create',1,'template,propertyset,element','','http://rtfm.modx.com/display/revolution20/Templates'),(19,'core',28,'element/template/update',1,'template,propertyset,element','','http://rtfm.modx.com/display/revolution20/Templates'),(20,'core',28,'element/template/tvsort',1,'template,tv,propertyset,element','',''),(21,'core',10,'element/tv',1,'tv,propertyset,element','','http://rtfm.modx.com/display/revolution20/Template+Variables'),(22,'core',32,'element/tv/create',1,'tv,tv_widget,propertyset,element','','http://rtfm.modx.com/display/revolution20/Template+Variables'),(23,'core',32,'element/tv/update',1,'tv,tv_widget,propertyset,element','','http://rtfm.modx.com/display/revolution20/Template+Variables'),(24,'core',10,'element/view',1,'element','',''),(25,'core',0,'resource',1,'','',''),(26,'core',46,'security/usergroup/create',1,'user,access,policy,context','','http://rtfm.modx.com/display/revolution20/User+Groups'),(27,'core',46,'security/usergroup/update',1,'user,access,policy,context','','http://rtfm.modx.com/display/revolution20/User+Groups'),(28,'core',36,'resource/data',1,'resource','','http://rtfm.modx.com/display/revolution20/Resource'),(29,'core',36,'resource/empty_recycle_bin',1,'resource','',''),(30,'core',36,'resource/update',1,'resource','','http://rtfm.modx.com/display/revolution20/Resource'),(31,'core',0,'security',1,'user','',''),(32,'core',46,'security/role',1,'user','','http://rtfm.modx.com/display/revolution20/Roles'),(33,'core',53,'security/user/create',1,'user,setting,access','','http://rtfm.modx.com/display/revolution20/Users'),(34,'core',53,'security/user/update',1,'user,setting,access','','http://rtfm.modx.com/display/revolution20/Users'),(35,'core',46,'security/login',1,'login','',''),(36,'core',57,'system/event/details',1,'','',''),(37,'core',3,'system/refresh_site',1,'','',''),(38,'core',3,'system/phpinfo',1,'','',''),(39,'core',36,'resource/tvs',0,'','',''),(40,'core',3,'system/file',1,'file','',''),(41,'core',70,'system/file/edit',1,'file','',''),(42,'core',65,'security/access/policy/update',1,'user,policy','','http://rtfm.modx.com/display/revolution20/Policies'),(43,'core',212,'workspaces/package/view',1,'workspace,namespace','','http://rtfm.modx.com/display/revolution20/Package+Management'),(44,'core',65,'security/access/policy/template/update',1,'user,policy','','http://rtfm.modx.com/display/revolution20/PolicyTemplates'),(45,'core',46,'security/forms/profile/update',1,'formcustomization,user,access,policy','','http://rtfm.modx.com/display/revolution20/Form+Customization+Profiles'),(46,'core',46,'security/forms/set/update',1,'formcustomization,user,access,policy','','http://rtfm.modx.com/display/revolution20/Form+Customization+Sets'),(47,'core',0,'search',1,'','',''),(48,'core',36,'resource/create',1,'resource','','http://rtfm.modx.com/display/revolution20/Resource'),(49,'core',46,'security/user',1,'user','','http://rtfm.modx.com/display/revolution20/Users'),(50,'core',46,'security/permission',1,'user,access,policy','','http://rtfm.modx.com/display/revolution20/Security'),(51,'core',46,'security/resourcegroup/index',1,'resource,user,access','','http://rtfm.modx.com/display/revolution20/Resource+Groups'),(52,'core',46,'security/forms',1,'formcustomization,user,access,policy','','http://rtfm.modx.com/display/revolution20/Customizing+The+Manager'),(53,'core',3,'system/import',1,'import','',''),(54,'core',59,'system/import/html',1,'import','',''),(55,'core',10,'element/propertyset/index',1,'element,category,propertyset','','http://rtfm.modx.com/display/revolution20/Properties+and+Property+Sets'),(56,'core',36,'resource/site_schedule',1,'resource','',''),(57,'core',0,'system/logs/index',1,'manager_log','',''),(58,'core',3,'system/event',1,'system_events','',''),(59,'core',3,'system/info',1,'system_info','',''),(60,'core',0,'help',1,'about','',''),(61,'core',3,'workspaces',1,'workspace','','http://rtfm.modx.com/display/revolution20/Package+Management'),(62,'core',3,'system/settings',1,'setting','','http://rtfm.modx.com/display/revolution20/Settings'),(63,'core',68,'workspaces/lexicon',1,'package_builder,lexicon,namespace','','http://rtfm.modx.com/display/revolution20/Internationalization'),(64,'core',3,'system/contenttype',1,'content_type','','http://rtfm.modx.com/display/revolution20/Content+Types'),(65,'core',0,'context',1,'context','','http://rtfm.modx.com/display/revolution20/Contexts'),(66,'core',3,'system/action',1,'action,menu,namespace','','http://rtfm.modx.com/display/revolution20/Actions+and+Menus'),(67,'core',68,'workspaces/namespace',1,'workspace,package_builder,lexicon,namespace','','http://rtfm.modx.com/display/revolution20/Namespaces'),(68,'core',46,'security/profile',1,'user','',''),(69,'core',46,'security/message',1,'messages','','');
/*!40000 ALTER TABLE `modx_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_actions_fields`
--

DROP TABLE IF EXISTS `modx_actions_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_actions_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT 'field',
  `tab` varchar(255) NOT NULL DEFAULT '',
  `form` varchar(255) NOT NULL DEFAULT '',
  `other` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `action` (`action`),
  KEY `type` (`type`),
  KEY `tab` (`tab`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_actions_fields`
--

LOCK TABLES `modx_actions_fields` WRITE;
/*!40000 ALTER TABLE `modx_actions_fields` DISABLE KEYS */;
INSERT INTO `modx_actions_fields` VALUES (1,30,'modx-resource-settings','tab','','modx-panel-resource','',0),(2,30,'id','field','modx-resource-settings','modx-panel-resource','',0),(3,30,'template','field','modx-resource-settings','modx-panel-resource','',1),(4,30,'published','field','modx-resource-settings','modx-panel-resource','',2),(5,30,'pagetitle','field','modx-resource-settings','modx-panel-resource','',3),(6,30,'longtitle','field','modx-resource-settings','modx-panel-resource','',4),(7,30,'description','field','modx-resource-settings','modx-panel-resource','',5),(8,30,'alias','field','modx-resource-settings','modx-panel-resource','',6),(9,30,'link_attributes','field','modx-resource-settings','modx-panel-resource','',7),(10,30,'introtext','field','modx-resource-settings','modx-panel-resource','',8),(11,30,'parent-cmb','field','modx-resource-settings','modx-panel-resource','',9),(12,30,'menutitle','field','modx-resource-settings','modx-panel-resource','',10),(13,30,'menuindex','field','modx-resource-settings','modx-panel-resource','',11),(14,30,'hidemenu','field','modx-resource-settings','modx-panel-resource','',12),(15,30,'modx-page-settings','tab','','modx-panel-resource','',1),(16,30,'isfolder','field','modx-page-settings','modx-panel-resource','',0),(17,30,'richtext','field','modx-page-settings','modx-panel-resource','',1),(18,30,'publishedon','field','modx-page-settings','modx-panel-resource','',2),(19,30,'pub_date','field','modx-page-settings','modx-panel-resource','',3),(20,30,'unpub_date','field','modx-page-settings','modx-panel-resource','',4),(21,30,'searchable','field','modx-page-settings','modx-panel-resource','',5),(22,30,'cacheable','field','modx-page-settings','modx-panel-resource','',6),(23,30,'syncsite','field','modx-page-settings','modx-panel-resource','',7),(24,30,'deleted','field','modx-page-settings','modx-panel-resource','',8),(25,30,'content_type','field','modx-page-settings','modx-panel-resource','',9),(26,30,'content_dispo','field','modx-page-settings','modx-panel-resource','',10),(27,30,'class_key','field','modx-page-settings','modx-panel-resource','',11),(28,30,'modx-panel-resource-tv','tab','','modx-panel-resource','tv',2),(29,30,'modx-resource-access-permissions','tab','','modx-panel-resource','',3),(30,30,'modx-resource-content','field','modx-resource-content','modx-panel-resource','',0),(31,48,'modx-resource-settings','tab','','modx-panel-resource','',0),(32,48,'template','field','modx-resource-settings','modx-panel-resource','',0),(33,48,'published','field','modx-resource-settings','modx-panel-resource','',1),(34,48,'pagetitle','field','modx-resource-settings','modx-panel-resource','',2),(35,48,'longtitle','field','modx-resource-settings','modx-panel-resource','',3),(36,48,'description','field','modx-resource-settings','modx-panel-resource','',4),(37,48,'alias','field','modx-resource-settings','modx-panel-resource','',5),(38,48,'link_attributes','field','modx-resource-settings','modx-panel-resource','',6),(39,48,'introtext','field','modx-resource-settings','modx-panel-resource','',7),(40,48,'parent-cmb','field','modx-resource-settings','modx-panel-resource','',8),(41,48,'menutitle','field','modx-resource-settings','modx-panel-resource','',9),(42,48,'menuindex','field','modx-resource-settings','modx-panel-resource','',10),(43,48,'hidemenu','field','modx-resource-settings','modx-panel-resource','',11),(44,48,'modx-page-settings','tab','','modx-panel-resource','',1),(45,48,'isfolder','field','modx-page-settings','modx-panel-resource','',0),(46,48,'richtext','field','modx-page-settings','modx-panel-resource','',1),(47,48,'publishedon','field','modx-page-settings','modx-panel-resource','',2),(48,48,'pub_date','field','modx-page-settings','modx-panel-resource','',3),(49,48,'unpub_date','field','modx-page-settings','modx-panel-resource','',4),(50,48,'searchable','field','modx-page-settings','modx-panel-resource','',5),(51,48,'cacheable','field','modx-page-settings','modx-panel-resource','',6),(52,48,'syncsite','field','modx-page-settings','modx-panel-resource','',7),(53,48,'deleted','field','modx-page-settings','modx-panel-resource','',8),(54,48,'content_type','field','modx-page-settings','modx-panel-resource','',9),(55,48,'content_dispo','field','modx-page-settings','modx-panel-resource','',10),(56,48,'class_key','field','modx-page-settings','modx-panel-resource','',11),(57,48,'modx-panel-resource-tv','tab','','modx-panel-resource','tv',2),(58,48,'modx-resource-access-permissions','tab','','modx-panel-resource','',3),(59,48,'modx-resource-content','field','modx-resource-content','modx-panel-resource','',0);
/*!40000 ALTER TABLE `modx_actions_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_active_users`
--

DROP TABLE IF EXISTS `modx_active_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_active_users`
--

LOCK TABLES `modx_active_users` WRITE;
/*!40000 ALTER TABLE `modx_active_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_active_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_categories`
--

DROP TABLE IF EXISTS `modx_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT '0',
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_categories`
--

LOCK TABLES `modx_categories` WRITE;
/*!40000 ALTER TABLE `modx_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_categories_closure`
--

DROP TABLE IF EXISTS `modx_categories_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_categories_closure` (
  `ancestor` int(10) unsigned NOT NULL DEFAULT '0',
  `descendant` int(10) unsigned NOT NULL DEFAULT '0',
  `depth` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ancestor`,`descendant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_categories_closure`
--

LOCK TABLES `modx_categories_closure` WRITE;
/*!40000 ALTER TABLE `modx_categories_closure` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_categories_closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_class_map`
--

DROP TABLE IF EXISTS `modx_class_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_class_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(120) NOT NULL DEFAULT '',
  `parent_class` varchar(120) NOT NULL DEFAULT '',
  `name_field` varchar(255) NOT NULL DEFAULT 'name',
  `path` tinytext,
  `lexicon` varchar(255) NOT NULL DEFAULT 'core:resource',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`),
  KEY `parent_class` (`parent_class`),
  KEY `name_field` (`name_field`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_class_map`
--

LOCK TABLES `modx_class_map` WRITE;
/*!40000 ALTER TABLE `modx_class_map` DISABLE KEYS */;
INSERT INTO `modx_class_map` VALUES (1,'modDocument','modResource','pagetitle','','core:resource'),(2,'modWebLink','modResource','pagetitle','','core:resource'),(3,'modSymLink','modResource','pagetitle','','core:resource'),(4,'modStaticResource','modResource','pagetitle','','core:resource'),(5,'modTemplate','modElement','templatename','','core:resource'),(6,'modTemplateVar','modElement','name','','core:resource'),(7,'modChunk','modElement','name','','core:resource'),(8,'modSnippet','modElement','name','','core:resource'),(9,'modPlugin','modElement','name','','core:resource');
/*!40000 ALTER TABLE `modx_class_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_content_type`
--

DROP TABLE IF EXISTS `modx_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_content_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` tinytext,
  `mime_type` tinytext,
  `file_extensions` tinytext,
  `headers` mediumtext,
  `binary` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_content_type`
--

LOCK TABLES `modx_content_type` WRITE;
/*!40000 ALTER TABLE `modx_content_type` DISABLE KEYS */;
INSERT INTO `modx_content_type` VALUES (1,'HTML','HTML content','text/html','.html',NULL,0),(2,'XML','XML content','text/xml','.xml',NULL,0),(3,'text','plain text content','text/plain','.txt',NULL,0),(4,'CSS','CSS content','text/css','.css',NULL,0),(5,'javascript','javascript content','text/javascript','.js',NULL,0),(6,'RSS','For RSS feeds','application/rss+xml','.rss',NULL,0);
/*!40000 ALTER TABLE `modx_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_context`
--

DROP TABLE IF EXISTS `modx_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_context` (
  `key` varchar(100) NOT NULL,
  `description` tinytext,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_context`
--

LOCK TABLES `modx_context` WRITE;
/*!40000 ALTER TABLE `modx_context` DISABLE KEYS */;
INSERT INTO `modx_context` VALUES ('web','The default front-end context for your web site.'),('mgr','The default manager or administration context for content management activity.');
/*!40000 ALTER TABLE `modx_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_context_resource`
--

DROP TABLE IF EXISTS `modx_context_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_context_resource` (
  `context_key` varchar(255) NOT NULL,
  `resource` int(11) unsigned NOT NULL,
  PRIMARY KEY (`context_key`,`resource`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_context_resource`
--

LOCK TABLES `modx_context_resource` WRITE;
/*!40000 ALTER TABLE `modx_context_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_context_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_context_setting`
--

DROP TABLE IF EXISTS `modx_context_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_context_setting` (
  `context_key` varchar(255) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` mediumtext,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`context_key`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_context_setting`
--

LOCK TABLES `modx_context_setting` WRITE;
/*!40000 ALTER TABLE `modx_context_setting` DISABLE KEYS */;
INSERT INTO `modx_context_setting` VALUES ('mgr','allow_tags_in_post','1','combo-boolean','core','system','0000-00-00 00:00:00'),('mgr','modRequest.class','modManagerRequest','textfield','core','system','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `modx_context_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_document_groups`
--

DROP TABLE IF EXISTS `modx_document_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_document_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document_group` (`document_group`),
  KEY `document` (`document`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_document_groups`
--

LOCK TABLES `modx_document_groups` WRITE;
/*!40000 ALTER TABLE `modx_document_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_document_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_documentgroup_names`
--

DROP TABLE IF EXISTS `modx_documentgroup_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_documentgroup_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `private_webgroup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_documentgroup_names`
--

LOCK TABLES `modx_documentgroup_names` WRITE;
/*!40000 ALTER TABLE `modx_documentgroup_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_documentgroup_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_element_property_sets`
--

DROP TABLE IF EXISTS `modx_element_property_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_element_property_sets` (
  `element` int(10) unsigned NOT NULL DEFAULT '0',
  `element_class` varchar(100) NOT NULL DEFAULT '',
  `property_set` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`element`,`element_class`,`property_set`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_element_property_sets`
--

LOCK TABLES `modx_element_property_sets` WRITE;
/*!40000 ALTER TABLE `modx_element_property_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_element_property_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_event_log`
--

DROP TABLE IF EXISTS `modx_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_event_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `user` int(11) NOT NULL DEFAULT '0',
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_event_log`
--

LOCK TABLES `modx_event_log` WRITE;
/*!40000 ALTER TABLE `modx_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_fc_profiles`
--

DROP TABLE IF EXISTS `modx_fc_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_fc_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `rank` (`rank`),
  KEY `active` (`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_fc_profiles`
--

LOCK TABLES `modx_fc_profiles` WRITE;
/*!40000 ALTER TABLE `modx_fc_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_fc_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_fc_profiles_usergroups`
--

DROP TABLE IF EXISTS `modx_fc_profiles_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_fc_profiles_usergroups` (
  `usergroup` int(11) NOT NULL DEFAULT '0',
  `profile` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usergroup`,`profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_fc_profiles_usergroups`
--

LOCK TABLES `modx_fc_profiles_usergroups` WRITE;
/*!40000 ALTER TABLE `modx_fc_profiles_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_fc_profiles_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_fc_sets`
--

DROP TABLE IF EXISTS `modx_fc_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_fc_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `template` int(11) NOT NULL DEFAULT '0',
  `constraint` varchar(255) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `profile` (`profile`),
  KEY `action` (`action`),
  KEY `active` (`active`),
  KEY `template` (`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_fc_sets`
--

LOCK TABLES `modx_fc_sets` WRITE;
/*!40000 ALTER TABLE `modx_fc_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_fc_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_keyword_xref`
--

DROP TABLE IF EXISTS `modx_keyword_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`,`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_keyword_xref`
--

LOCK TABLES `modx_keyword_xref` WRITE;
/*!40000 ALTER TABLE `modx_keyword_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_keyword_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_lexicon_entries`
--

DROP TABLE IF EXISTS `modx_lexicon_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_lexicon_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `topic` varchar(255) NOT NULL DEFAULT 'default',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `language` varchar(20) NOT NULL DEFAULT 'en',
  `createdon` datetime DEFAULT NULL,
  `editedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `topic` (`topic`),
  KEY `namespace` (`namespace`),
  KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_lexicon_entries`
--

LOCK TABLES `modx_lexicon_entries` WRITE;
/*!40000 ALTER TABLE `modx_lexicon_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_lexicon_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_manager_log`
--

DROP TABLE IF EXISTS `modx_manager_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_manager_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `occurred` datetime DEFAULT '0000-00-00 00:00:00',
  `action` varchar(100) NOT NULL DEFAULT '',
  `classKey` varchar(100) NOT NULL DEFAULT '',
  `item` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_manager_log`
--

LOCK TABLES `modx_manager_log` WRITE;
/*!40000 ALTER TABLE `modx_manager_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_manager_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_member_groups`
--

DROP TABLE IF EXISTS `modx_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_member_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_group` int(10) unsigned NOT NULL DEFAULT '0',
  `member` int(10) unsigned NOT NULL DEFAULT '0',
  `role` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_member_groups`
--

LOCK TABLES `modx_member_groups` WRITE;
/*!40000 ALTER TABLE `modx_member_groups` DISABLE KEYS */;
INSERT INTO `modx_member_groups` VALUES (1,1,1,2);
/*!40000 ALTER TABLE `modx_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_membergroup_names`
--

DROP TABLE IF EXISTS `modx_membergroup_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_membergroup_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_membergroup_names`
--

LOCK TABLES `modx_membergroup_names` WRITE;
/*!40000 ALTER TABLE `modx_membergroup_names` DISABLE KEYS */;
INSERT INTO `modx_membergroup_names` VALUES (1,'Administrator',0);
/*!40000 ALTER TABLE `modx_membergroup_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_menus`
--

DROP TABLE IF EXISTS `modx_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_menus` (
  `text` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `menuindex` int(11) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `handler` text NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`text`),
  KEY `parent` (`parent`),
  KEY `action` (`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_menus`
--

LOCK TABLES `modx_menus` WRITE;
/*!40000 ALTER TABLE `modx_menus` DISABLE KEYS */;
INSERT INTO `modx_menus` VALUES ('site','',0,'','images/misc/logo_tbar.gif',0,'','',''),('preview','site',0,'preview_desc','images/icons/show.gif',0,'','MODx.preview(); return false;',''),('refresh_site','site',0,'refresh_site_desc','images/icons/refresh.png',1,'','MODx.clearCache(); return false;','empty_cache'),('remove_locks','site',0,'remove_locks_desc','images/ext/default/grid/hmenu-unlock.png',2,'','\nMODx.msg.confirm({\n    title: _(\'remove_locks\')\n    ,text: _(\'confirm_remove_locks\')\n    ,url: MODx.config.connectors_url+\'system/remove_locks.php\'\n    ,params: {\n        action: \'remove\'\n    }\n    ,listeners: {\n        \'success\': {fn:function() { Ext.getCmp(\"modx-resource-tree\").refresh(); },scope:this}\n    }\n});','remove_locks'),('search','site',47,'search_desc','images/icons/context_view.gif',3,'','','search'),('new_document','site',48,'new_document_desc','images/icons/folder_page_add.png',4,'','','new_document'),('new_weblink','site',48,'new_weblink_desc','images/icons/link_add.png',5,'&class_key=modWebLink','','new_document'),('new_symlink','site',48,'new_symlink_desc','images/icons/link_add.png',6,'&class_key=modSymLink','','new_document'),('new_static_resource','site',48,'new_static_resource_desc','images/icons/link_add.png',7,'&class_key=modStaticResource','','new_document'),('logout','site',0,'logout_desc','images/misc/logo_tbar.gif',8,'','MODx.logout(); return false;',''),('components','',0,'','images/icons/plugin.gif',1,'','','components'),('security','',0,'','images/icons/lock.gif',2,'','','access_permissions'),('user_management','security',49,'user_management_desc','images/icons/user.gif',0,'','','view_user'),('user_group_management','security',50,'user_group_management_desc','images/icons/mnu_users.gif',1,'','','access_permissions'),('resource_groups','security',51,'resource_groups_desc','',2,'','','access_permissions'),('form_customization','security',52,'form_customization_desc','images/misc/logo_tbar.gif',3,'','','customize_forms'),('flush_access','security',0,'flush_access_desc','images/icons/unzip.gif',4,'','MODx.msg.confirm({\n    title: _(\'flush_access\')\n    ,text: _(\'flush_access_confirm\')\n    ,url: MODx.config.connectors_url+\'security/access/index.php\'\n    ,params: {\n        action: \'flush\'\n    }\n    ,listeners: {\n        \'success\': {fn:function() { location.href = \'./\'; },scope:this}\n    }\n});','access_permissions'),('flush_sessions','security',0,'flush_sessions_desc','images/icons/unzip.gif',5,'','MODx.msg.confirm({\n    title: _(\'flush_sessions\')\n    ,text: _(\'flush_sessions_confirm\')\n    ,url: MODx.config.connectors_url+\'security/flush.php\'\n    ,params: {\n        action: \'flush\'\n    }\n    ,listeners: {\n        \'success\': {fn:function() { location.href = \'./\'; },scope:this}\n    }\n});','flush_sessions'),('tools','',0,'','images/icons/menu_settings.gif',3,'','',''),('import_resources','tools',53,'import_resources_desc','images/icons/application_side_contract.png',0,'','','import_static'),('import_site','tools',54,'import_site_desc','images/icons/application_side_contract.png',1,'','','import_static'),('propertysets','tools',55,'propertysets_desc','images/misc/logo_tbar.gif',2,'','','property_sets'),('reports','',0,'','images/icons/menu_settings16.gif',4,'','',''),('site_schedule','reports',56,'site_schedule_desc','images/icons/cal.gif',0,'','',''),('view_logging','reports',57,'view_logging_desc','',1,'','','logs'),('eventlog_viewer','reports',58,'eventlog_viewer_desc','images/icons/comment.gif',2,'','','view_eventlog'),('view_sysinfo','reports',59,'view_sysinfo_desc','images/icons/logging.gif',3,'','','view_sysinfo'),('about','reports',60,'about_desc','images/icons/information.png',4,'','','about'),('system','',0,'','images/misc/logo_tbar.gif',5,'','',''),('manage_workspaces','system',61,'manage_workspaces_desc','images/icons/sysinfo.gif',0,'','','packages'),('system_settings','system',62,'system_settings_desc','images/icons/sysinfo.gif',1,'','','settings'),('lexicon_management','system',63,'lexicon_management_desc','images/icons/logging.gif',2,'','','lexicons'),('content_types','system',64,'content_types_desc','images/icons/logging.gif',3,'','','content_types'),('contexts','system',65,'contexts_desc','images/icons/sysinfo.gif',4,'','','view_context'),('edit_menu','system',66,'edit_menu_desc','images/icons/sysinfo.gif',5,'','','menus,actions'),('namespaces','system',67,'namespaces_desc','',6,'','','namespaces'),('user','',0,'','images/icons/user_go.png',6,'','',''),('profile','user',68,'profile_desc','',0,'','',''),('messages','user',69,'messages_desc','images/icons/messages.gif',1,'','','messages'),('support','',0,'support_desc','images/icons/sysinfo.gif',7,'','',''),('forums','support',0,'forums_desc','images/icons/sysinfo.gif',0,'','window.open(\"http://modxcms.com/forums\");',''),('wiki','support',0,'wiki_desc','images/icons/sysinfo.gif',1,'','window.open(\"http://rtfm.modx.com/\");',''),('jira','support',0,'jira_desc','images/icons/sysinfo.gif',2,'','window.open(\"http://bugs.modx.com/projects/revo/issues\");',''),('api_docs','support',0,'api_docs_desc','images/icons/sysinfo.gif',3,'','window.open(\"http://api.modxcms.com/\");','');
/*!40000 ALTER TABLE `modx_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_namespaces`
--

DROP TABLE IF EXISTS `modx_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_namespaces` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `path` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_namespaces`
--

LOCK TABLES `modx_namespaces` WRITE;
/*!40000 ALTER TABLE `modx_namespaces` DISABLE KEYS */;
INSERT INTO `modx_namespaces` VALUES ('core','{core_path}');
/*!40000 ALTER TABLE `modx_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_property_set`
--

DROP TABLE IF EXISTS `modx_property_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_property_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `category` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `properties` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_property_set`
--

LOCK TABLES `modx_property_set` WRITE;
/*!40000 ALTER TABLE `modx_property_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_property_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_register_messages`
--

DROP TABLE IF EXISTS `modx_register_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_register_messages` (
  `topic` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `valid` datetime NOT NULL,
  `accessed` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `accesses` int(10) unsigned NOT NULL DEFAULT '0',
  `expires` int(20) NOT NULL DEFAULT '0',
  `payload` mediumtext NOT NULL,
  `kill` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic`,`id`),
  KEY `created` (`created`),
  KEY `valid` (`valid`),
  KEY `accessed` (`accessed`),
  KEY `accesses` (`accesses`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_register_messages`
--

LOCK TABLES `modx_register_messages` WRITE;
/*!40000 ALTER TABLE `modx_register_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_register_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_register_queues`
--

DROP TABLE IF EXISTS `modx_register_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_register_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `options` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_register_queues`
--

LOCK TABLES `modx_register_queues` WRITE;
/*!40000 ALTER TABLE `modx_register_queues` DISABLE KEYS */;
INSERT INTO `modx_register_queues` VALUES (1,'locks','a:1:{s:9:\"directory\";s:5:\"locks\";}');
/*!40000 ALTER TABLE `modx_register_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_register_topics`
--

DROP TABLE IF EXISTS `modx_register_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_register_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `options` mediumtext,
  PRIMARY KEY (`id`),
  KEY `queue` (`queue`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_register_topics`
--

LOCK TABLES `modx_register_topics` WRITE;
/*!40000 ALTER TABLE `modx_register_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_register_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_session`
--

DROP TABLE IF EXISTS `modx_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_session` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `access` int(20) unsigned DEFAULT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_session`
--

LOCK TABLES `modx_session` WRITE;
/*!40000 ALTER TABLE `modx_session` DISABLE KEYS */;
INSERT INTO `modx_session` VALUES ('452be7ed25361970266497053bc2a30a',1294681085,'modx.user.contextTokens|a:0:{}modx.user..attributes|a:1:{s:3:\"mgr\";a:3:{s:16:\"modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:22:\"modAccessResourceGroup\";a:0:{}s:17:\"modAccessCategory\";a:0:{}}}mgrDocgroups|a:0:{}');
/*!40000 ALTER TABLE `modx_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_content`
--

DROP TABLE IF EXISTS `modx_site_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `introtext` text,
  `content` mediumtext,
  `richtext` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cacheable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0',
  `publishedby` int(10) NOT NULL DEFAULT '0',
  `menutitle` varchar(255) NOT NULL DEFAULT '',
  `donthit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `haskeywords` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hasmetatags` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `privateweb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `privatemgr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0',
  `class_key` varchar(100) NOT NULL DEFAULT 'modDocument',
  `context_key` varchar(100) NOT NULL DEFAULT 'web',
  `content_type` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`),
  KEY `published` (`published`),
  KEY `pub_date` (`pub_date`),
  KEY `unpub_date` (`unpub_date`),
  KEY `parent` (`parent`),
  KEY `isfolder` (`isfolder`),
  KEY `template` (`template`),
  KEY `menuindex` (`menuindex`),
  KEY `searchable` (`searchable`),
  KEY `cacheable` (`cacheable`),
  KEY `hidemenu` (`hidemenu`),
  KEY `class_key` (`class_key`),
  KEY `context_key` (`context_key`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`longtitle`,`description`,`introtext`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_content`
--

LOCK TABLES `modx_site_content` WRITE;
/*!40000 ALTER TABLE `modx_site_content` DISABLE KEYS */;
INSERT INTO `modx_site_content` VALUES (1,'document','text/html','Home','','','','',1,0,0,0,0,NULL,'',1,1,0,1,1,1,1294680951,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,'modDocument','web',1);
/*!40000 ALTER TABLE `modx_site_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_content_metatags`
--

DROP TABLE IF EXISTS `modx_site_content_metatags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`,`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_content_metatags`
--

LOCK TABLES `modx_site_content_metatags` WRITE;
/*!40000 ALTER TABLE `modx_site_content_metatags` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_content_metatags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_htmlsnippets`
--

DROP TABLE IF EXISTS `modx_site_htmlsnippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_htmlsnippets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0',
  `snippet` mediumtext,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `properties` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`),
  KEY `locked` (`locked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_htmlsnippets`
--

LOCK TABLES `modx_site_htmlsnippets` WRITE;
/*!40000 ALTER TABLE `modx_site_htmlsnippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_htmlsnippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_keywords`
--

DROP TABLE IF EXISTS `modx_site_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_keywords`
--

LOCK TABLES `modx_site_keywords` WRITE;
/*!40000 ALTER TABLE `modx_site_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_metatags`
--

DROP TABLE IF EXISTS `modx_site_metatags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_metatags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_metatags`
--

LOCK TABLES `modx_site_metatags` WRITE;
/*!40000 ALTER TABLE `modx_site_metatags` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_metatags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_plugin_events`
--

DROP TABLE IF EXISTS `modx_site_plugin_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL DEFAULT '0',
  `event` varchar(255) NOT NULL DEFAULT '',
  `priority` int(10) NOT NULL DEFAULT '0',
  `propertyset` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pluginid`,`event`),
  KEY `priority` (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_plugin_events`
--

LOCK TABLES `modx_site_plugin_events` WRITE;
/*!40000 ALTER TABLE `modx_site_plugin_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_plugin_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_plugins`
--

DROP TABLE IF EXISTS `modx_site_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0',
  `plugincode` mediumtext NOT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `properties` text,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`),
  KEY `locked` (`locked`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_plugins`
--

LOCK TABLES `modx_site_plugins` WRITE;
/*!40000 ALTER TABLE `modx_site_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_snippets`
--

DROP TABLE IF EXISTS `modx_site_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_snippets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0',
  `snippet` mediumtext,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `properties` text,
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`),
  KEY `locked` (`locked`),
  KEY `moduleguid` (`moduleguid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_snippets`
--

LOCK TABLES `modx_site_snippets` WRITE;
/*!40000 ALTER TABLE `modx_site_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_templates`
--

DROP TABLE IF EXISTS `modx_site_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `template_type` int(11) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `properties` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templatename` (`templatename`),
  KEY `category` (`category`),
  KEY `locked` (`locked`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_templates`
--

LOCK TABLES `modx_site_templates` WRITE;
/*!40000 ALTER TABLE `modx_site_templates` DISABLE KEYS */;
INSERT INTO `modx_site_templates` VALUES (1,'BaseTemplate','Template',0,0,'',0,'<html>\n<head>\n<title>[[++site_name]] - [[*pagetitle]]</title>\n<base href=\"[[++site_url]]\" />\n</head>\n<body>\n[[*content]]\n</body>\n</html>',0,NULL);
/*!40000 ALTER TABLE `modx_site_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_tmplvar_access`
--

DROP TABLE IF EXISTS `modx_site_tmplvar_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_tmplvar_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_tmplvar_access`
--

LOCK TABLES `modx_site_tmplvar_access` WRITE;
/*!40000 ALTER TABLE `modx_site_tmplvar_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_tmplvar_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_tmplvar_contentvalues`
--

DROP TABLE IF EXISTS `modx_site_tmplvar_contentvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_tmplvar_contentvalues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `contentid` int(10) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tmplvarid` (`tmplvarid`),
  KEY `contentid` (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_tmplvar_contentvalues`
--

LOCK TABLES `modx_site_tmplvar_contentvalues` WRITE;
/*!40000 ALTER TABLE `modx_site_tmplvar_contentvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_tmplvar_contentvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_tmplvar_templates`
--

DROP TABLE IF EXISTS `modx_site_tmplvar_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_tmplvar_templates`
--

LOCK TABLES `modx_site_tmplvar_templates` WRITE;
/*!40000 ALTER TABLE `modx_site_tmplvar_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_tmplvar_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_site_tmplvars`
--

DROP TABLE IF EXISTS `modx_site_tmplvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_site_tmplvars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '',
  `display_params` text,
  `default_text` text,
  `properties` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`),
  KEY `locked` (`locked`),
  KEY `rank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_site_tmplvars`
--

LOCK TABLES `modx_site_tmplvars` WRITE;
/*!40000 ALTER TABLE `modx_site_tmplvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_tmplvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_system_eventnames`
--

DROP TABLE IF EXISTS `modx_system_eventnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_system_eventnames` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_system_eventnames`
--

LOCK TABLES `modx_system_eventnames` WRITE;
/*!40000 ALTER TABLE `modx_system_eventnames` DISABLE KEYS */;
INSERT INTO `modx_system_eventnames` VALUES ('OnPluginEventBeforeSave',1,'Plugin Events'),('OnPluginEventSave',1,'Plugin Events'),('OnPluginEventBeforeRemove',1,'Plugin Events'),('OnPluginEventRemove',1,'Plugin Events'),('OnResourceGroupSave',1,'Security'),('OnResourceGroupBeforeSave',1,'Security'),('OnResourceGroupRemove',1,'Security'),('OnResourceGroupBeforeRemove',1,'Security'),('OnSnippetBeforeSave',1,'Snippets'),('OnSnippetSave',1,'Snippets'),('OnSnippetBeforeRemove',1,'Snippets'),('OnSnippetRemove',1,'Snippets'),('OnSnipFormPrerender',1,'Snippets'),('OnSnipFormRender',1,'Snippets'),('OnBeforeSnipFormSave',1,'Snippets'),('OnSnipFormSave',1,'Snippets'),('OnBeforeSnipFormDelete',1,'Snippets'),('OnSnipFormDelete',1,'Snippets'),('OnTemplateBeforeSave',1,'Templates'),('OnTemplateSave',1,'Templates'),('OnTemplateBeforeRemove',1,'Templates'),('OnTemplateRemove',1,'Templates'),('OnTempFormPrerender',1,'Templates'),('OnTempFormRender',1,'Templates'),('OnBeforeTempFormSave',1,'Templates'),('OnTempFormSave',1,'Templates'),('OnBeforeTempFormDelete',1,'Templates'),('OnTempFormDelete',1,'Templates'),('OnTemplateVarBeforeSave',1,'Template Variables'),('OnTemplateVarSave',1,'Template Variables'),('OnTemplateVarBeforeRemove',1,'Template Variables'),('OnTemplateVarRemove',1,'Template Variables'),('OnTVFormPrerender',1,'Template Variables'),('OnTVFormRender',1,'Template Variables'),('OnBeforeTVFormSave',1,'Template Variables'),('OnTVFormSave',1,'Template Variables'),('OnBeforeTVFormDelete',1,'Template Variables'),('OnTVFormDelete',1,'Template Variables'),('OnTVInputRenderList',1,'Template Variables'),('OnTVOutputRenderList',1,'Template Variables'),('OnTVOutputRenderPropertiesList',1,'Template Variables'),('OnUserGroupBeforeSave',1,'User Groups'),('OnUserGroupSave',1,'User Groups'),('OnUserGroupBeforeRemove',1,'User Groups'),('OnUserGroupRemove',1,'User Groups'),('OnDocFormPrerender',1,'Resources'),('OnDocFormRender',1,'Resources'),('OnBeforeDocFormSave',1,'Resources'),('OnDocFormSave',1,'Resources'),('OnBeforeDocFormDelete',1,'Resources'),('OnDocFormDelete',1,'Resources'),('OnDocPublished',5,'Resources'),('OnDocUnPublished',5,'Resources'),('OnBeforeEmptyTrash',1,'Resources'),('OnEmptyTrash',1,'Resources'),('OnResourceTVFormPrerender',1,'Resources'),('OnResourceTVFormRender',1,'Resources'),('OnResourceDelete',1,'Resources'),('OnResourceUndelete',1,'Resources'),('OnResourceBeforeSort',1,'Resources'),('OnResourceSort',1,'Resources'),('OnResourceDuplicate',1,'Resources'),('OnResourceToolbarLoad',1,'Resources'),('OnRichTextEditorRegister',1,'RichText Editor'),('OnRichTextEditorInit',1,'RichText Editor'),('OnRichTextBrowserInit',1,'RichText Editor'),('OnWebLogin',3,'Security'),('OnBeforeWebLogout',3,'Security'),('OnWebLogout',3,'Security'),('OnManagerLogin',2,'Security'),('OnBeforeManagerLogout',2,'Security'),('OnManagerLogout',2,'Security'),('OnBeforeWebLogin',3,'Security'),('OnWebAuthentication',3,'Security'),('OnBeforeManagerLogin',2,'Security'),('OnManagerAuthentication',2,'Security'),('OnManagerLoginFormRender',2,'Security'),('OnManagerLoginFormPrerender',2,'Security'),('OnPageUnauthorized',1,'Security'),('OnUserFormPrerender',1,'Users'),('OnUserFormRender',1,'Users'),('OnBeforeUserFormSave',1,'Users'),('OnUserFormSave',1,'Users'),('OnBeforeUserFormDelete',1,'Users'),('OnUserFormDelete',1,'Users'),('OnUserNotFound',1,'Users'),('OnBeforeUserActivate',1,'Users'),('OnUserActivate',1,'Users'),('OnUserChangePassword',1,'Users'),('OnUserBeforeRemove',1,'Users'),('OnUserBeforeSave',1,'Users'),('OnUserSave',1,'Users'),('OnUserRemove',1,'Users'),('OnWebPagePrerender',5,'System'),('OnBeforeCacheUpdate',4,'System'),('OnCacheUpdate',4,'System'),('OnLoadWebPageCache',4,'System'),('OnBeforeSaveWebPageCache',4,'System'),('OnSiteRefresh',1,'System'),('OnFileManagerUpload',1,'System'),('OnFileEditFormPrerender',1,'System'),('OnManagerPageInit',2,'System'),('OnWebPageInit',5,'System'),('OnLoadWebDocument',5,'System'),('OnParseDocument',5,'System'),('OnWebPageComplete',5,'System'),('OnBeforeManagerPageInit',2,'System'),('OnPageNotFound',1,'System'),('OnHandleRequest',5,'System'),('OnSiteSettingsRender',1,'Settings'),('OnInitCulture',3,'Internationalization'),('OnCategorySave',1,'Categories'),('OnCategoryBeforeSave',1,'Categories'),('OnCategoryRemove',1,'Categories'),('OnCategoryBeforeRemove',1,'Categories'),('OnChunkSave',1,'Chunks'),('OnChunkBeforeSave',1,'Chunks'),('OnChunkRemove',1,'Chunks'),('OnChunkBeforeRemove',1,'Chunks'),('OnChunkFormPrerender',1,'Chunks'),('OnChunkFormRender',1,'Chunks'),('OnBeforeChunkFormSave',1,'Chunks'),('OnChunkFormSave',1,'Chunks'),('OnBeforeChunkFormDelete',1,'Chunks'),('OnChunkFormDelete',1,'Chunks'),('OnContextSave',1,'Contexts'),('OnContextBeforeSave',1,'Contexts'),('OnContextRemove',1,'Contexts'),('OnContextBeforeRemove',1,'Contexts'),('OnContextFormPrerender',2,'Contexts'),('OnContextFormRender',2,'Contexts'),('OnPluginSave',1,'Plugins'),('OnPluginBeforeSave',1,'Plugins'),('OnPluginRemove',1,'Plugins'),('OnPluginBeforeRemove',1,'Plugins'),('OnPluginFormPrerender',1,'Plugins'),('OnPluginFormRender',1,'Plugins'),('OnBeforePluginFormSave',1,'Plugins'),('OnPluginFormSave',1,'Plugins'),('OnBeforePluginFormDelete',1,'Plugins'),('OnPluginFormDelete',1,'Plugins'),('OnPropertySetSave',1,'Property Sets'),('OnPropertySetBeforeSave',1,'Property Sets'),('OnPropertySetRemove',1,'Property Sets'),('OnPropertySetBeforeRemove',1,'Property Sets');
/*!40000 ALTER TABLE `modx_system_eventnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_system_settings`
--

DROP TABLE IF EXISTS `modx_system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_system_settings` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_system_settings`
--

LOCK TABLES `modx_system_settings` WRITE;
/*!40000 ALTER TABLE `modx_system_settings` DISABLE KEYS */;
INSERT INTO `modx_system_settings` VALUES ('allow_tags_in_post','1','combo-boolean','core','system','0000-00-00 00:00:00'),('allow_duplicate_alias','','combo-boolean','core','furls','0000-00-00 00:00:00'),('allow_multiple_emails','1','combo-boolean','core','authentication','0000-00-00 00:00:00'),('archive_with','','combo-boolean','core','system','0000-00-00 00:00:00'),('auto_menuindex','1','combo-boolean','core','site','0000-00-00 00:00:00'),('auto_check_pkg_updates','1','combo-boolean','core','system','0000-00-00 00:00:00'),('auto_check_pkg_updates_cache_expire','15','textfield','core','system','0000-00-00 00:00:00'),('automatic_alias','0','combo-boolean','core','furls','0000-00-00 00:00:00'),('blocked_minutes','60','textfield','core','authentication','0000-00-00 00:00:00'),('cache_action_map','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_context_settings','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_db','0','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_db_expires','0','textfield','core','caching','0000-00-00 00:00:00'),('cache_default','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_disabled','0','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_expires','0','textfield','core','caching','0000-00-00 00:00:00'),('cache_json','0','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_json_expires','0','textfield','core','caching','0000-00-00 00:00:00'),('cache_handler','xPDOFileCache','textfield','core','caching','0000-00-00 00:00:00'),('cache_lang_js','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_lexicon_topics','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_noncore_lexicon_topics','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_resource','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_resource_expires','0','textfield','core','caching','0000-00-00 00:00:00'),('cache_scripts','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('cache_system_settings','1','combo-boolean','core','caching','0000-00-00 00:00:00'),('clear_cache_refresh_trees','0','combo-boolean','core','caching','0000-00-00 00:00:00'),('compress_css','1','combo-boolean','core','manager','2011-01-10 17:35:51'),('compress_js','1','combo-boolean','core','manager','2011-01-10 17:35:51'),('concat_js','1','combo-boolean','core','manager','2011-01-10 17:35:51'),('container_suffix','/','textfield','core','furls','0000-00-00 00:00:00'),('cultureKey','en','modx-combo-language','core','language','0000-00-00 00:00:00'),('custom_resource_classes','','textfield','core','system','0000-00-00 00:00:00'),('default_per_page','20','textfield','core','manager','0000-00-00 00:00:00'),('default_template','1','modx-combo-template','core','site','0000-00-00 00:00:00'),('editor_css_path','','textfield','core','editor','0000-00-00 00:00:00'),('editor_css_selectors','','textfield','core','editor','0000-00-00 00:00:00'),('emailsender','modx-admin@mapofmedicine.com','textfield','core','authentication','2011-01-10 17:35:51'),('emailsubject','Your login details','textfield','core','authentication','0000-00-00 00:00:00'),('enable_dragdrop','1','combo-boolean','core','manager','0000-00-00 00:00:00'),('error_page','1','textfield','core','site','0000-00-00 00:00:00'),('failed_login_attempts','5','textfield','core','authentication','0000-00-00 00:00:00'),('fe_editor_lang','en','modx-combo-language','core','language','0000-00-00 00:00:00'),('feed_modx_news','http://feeds.feedburner.com/modx-announce','textfield','core','system','0000-00-00 00:00:00'),('feed_modx_news_enabled','1','combo-boolean','core','system','0000-00-00 00:00:00'),('feed_modx_security','http://feeds.feedburner.com/modxsecurity','textfield','core','system','0000-00-00 00:00:00'),('feed_modx_security_enabled','1','combo-boolean','core','system','0000-00-00 00:00:00'),('filemanager_path','','textfield','core','file','0000-00-00 00:00:00'),('filemanager_path_relative','1','combo-boolean','core','file','0000-00-00 00:00:00'),('filemanager_url','','textfield','core','file','0000-00-00 00:00:00'),('filemanager_url_relative','1','combo-boolean','core','file','0000-00-00 00:00:00'),('forgot_login_email','<p>Hello [[+username]],</p>\n<p>A request for a password reset has been issued for your MODx user. If you sent this, you may follow this link and use this password to login. If you did not send this request, please ignore this email.</p>\n\n<p>\n    <strong>Activation Link:</strong> [[+url_scheme]][[+http_host]][[+manager_url]]?modahsh=[[+hash]]<br />\n    <strong>Username:</strong> [[+username]]<br />\n    <strong>Password:</strong> [[+password]]<br />\n</p>\n\n<p>After you log into the MODx Manager, you can change your password again, if you wish.</p>\n\n<p>Regards,<br />Site Administrator</p>','textarea','core','authentication','0000-00-00 00:00:00'),('forward_merge_excludes','type,published,class_key,context_key','textfield','core','core','0000-00-00 00:00:00'),('friendly_alias_lowercase_only','1','combo-boolean','core','furls','0000-00-00 00:00:00'),('friendly_alias_max_length','0','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_restrict_chars','pattern','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_restrict_chars_pattern','/[\\0\\x0B\\t\\n\\r\\f\\a&=+%#<>\"~:`@\\?\\[\\]\\{\\}\\|\\^\'\\\\]/','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_strip_element_tags','1','combo-boolean','core','furls','0000-00-00 00:00:00'),('friendly_alias_translit','none','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_translit_class','translit.modTransliterate','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_translit_class_path','{core_path}components/','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_trim_chars','/.-_','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_urls','1','combo-boolean','core','furls','0000-00-00 00:00:00'),('friendly_alias_word_delimiter','-','textfield','core','furls','0000-00-00 00:00:00'),('friendly_alias_word_delimiters','-_','textfield','core','furls','0000-00-00 00:00:00'),('friendly_urls','0','combo-boolean','core','furls','0000-00-00 00:00:00'),('hidemenu_default','0','combo-boolean','core','site','0000-00-00 00:00:00'),('mail_charset','UTF-8','modx-combo-charset','core','mail','0000-00-00 00:00:00'),('mail_encoding','8bit','textfield','core','mail','0000-00-00 00:00:00'),('mail_use_smtp','','combo-boolean','core','mail','0000-00-00 00:00:00'),('mail_smtp_auth','','combo-boolean','core','mail','0000-00-00 00:00:00'),('mail_smtp_helo','','textfield','core','mail','0000-00-00 00:00:00'),('mail_smtp_hosts','localhost','textfield','core','mail','0000-00-00 00:00:00'),('mail_smtp_keepalive','','combo-boolean','core','mail','0000-00-00 00:00:00'),('mail_smtp_pass','','textfield','core','mail','0000-00-00 00:00:00'),('mail_smtp_port','587','textfield','core','mail','0000-00-00 00:00:00'),('mail_smtp_prefix','','textfield','core','mail','0000-00-00 00:00:00'),('mail_smtp_single_to','','combo-boolean','core','mail','0000-00-00 00:00:00'),('mail_smtp_timeout','10','textfield','core','mail','0000-00-00 00:00:00'),('mail_smtp_user','','textfield','core','mail','0000-00-00 00:00:00'),('manager_date_format','Y-m-d','textfield','core','manager','0000-00-00 00:00:00'),('manager_time_format','g:i a','textfield','core','manager','0000-00-00 00:00:00'),('manager_direction','ltr','textfield','core','language','0000-00-00 00:00:00'),('manager_lang_attribute','en','textfield','core','language','0000-00-00 00:00:00'),('manager_language','en','modx-combo-language','core','language','0000-00-00 00:00:00'),('manager_theme','default','textfield','core','manager','0000-00-00 00:00:00'),('manager_use_tabs','1','combo-boolean','core','manager','0000-00-00 00:00:00'),('modx_charset','UTF-8','modx-combo-charset','core','language','0000-00-00 00:00:00'),('proxy_auth_type','BASIC','textfield','core','proxy','0000-00-00 00:00:00'),('proxy_host','','textfield','core','proxy','0000-00-00 00:00:00'),('proxy_password','','textfield','core','proxy','0000-00-00 00:00:00'),('proxy_port','','textfield','core','proxy','0000-00-00 00:00:00'),('proxy_username','','textfield','core','proxy','0000-00-00 00:00:00'),('password_generated_length','8','textfield','core','authentication','0000-00-00 00:00:00'),('password_min_length','8','textfield','core','authentication','0000-00-00 00:00:00'),('phpthumb_allow_src_above_docroot','','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_cache_maxage','30','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_cache_maxsize','100','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_cache_maxfiles','10000','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_cache_source_enabled','','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_error_bgcolor','CCCCFF','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_error_textcolor','FF0000','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_error_fontsize','1','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_far','C','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_imagemagick_path','','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nohotlink_enabled','1','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nohotlink_erase_image','1','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nohotlink_valid_domains','{http_host}','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nohotlink_text_message','Off-server thumbnailing is not allowed','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nooffsitelink_enabled','','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nooffsitelink_erase_image','1','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nooffsitelink_require_refer','','combo-boolean','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nooffsitelink_text_message','Off-server linking is not allowed','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nooffsitelink_valid_domains','{http_host}','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_nooffsitelink_watermark_src','','textfield','core','phpthumb','0000-00-00 00:00:00'),('phpthumb_zoomcrop','0','textfield','core','phpthumb','0000-00-00 00:00:00'),('publish_default','','combo-boolean','core','site','0000-00-00 00:00:00'),('rb_base_dir','','textfield','core','file','0000-00-00 00:00:00'),('rb_base_url','','textfield','core','file','0000-00-00 00:00:00'),('request_controller','index.php','textfield','core','gateway','0000-00-00 00:00:00'),('request_param_alias','q','textfield','core','gateway','0000-00-00 00:00:00'),('request_param_id','id','textfield','core','gateway','0000-00-00 00:00:00'),('resolve_hostnames','0','combo-boolean','core','system','0000-00-00 00:00:00'),('resource_tree_node_name','pagetitle','textfield','core','manager','0000-00-00 00:00:00'),('richtext_default','1','combo-boolean','core','manager','0000-00-00 00:00:00'),('search_default','1','combo-boolean','core','site','0000-00-00 00:00:00'),('server_offset_time','0','textfield','core','system','0000-00-00 00:00:00'),('server_protocol','http','textfield','core','system','0000-00-00 00:00:00'),('session_cookie_lifetime','604800','textfield','core','session','0000-00-00 00:00:00'),('session_cookie_secure','','combo-boolean','core','session','0000-00-00 00:00:00'),('session_handler_class','modSessionHandler','textfield','core','session','0000-00-00 00:00:00'),('set_header','1','combo-boolean','core','system','0000-00-00 00:00:00'),('signupemail_message','<p>Hello [[+uid]],</p>\n    <p>Here are your login details for the [[+sname]] MODx Manager:</p>\n\n    <p>\n        <strong>Username:</strong> [[+uid]]<br />\n        <strong>Password:</strong> [[+pwd]]<br />\n    </p>\n\n    <p>Once you log into the MODx Manager at [[+surl]], you can change your password.</p>\n\n    <p>Regards,<br />Site Administrator</p>','textarea','core','authentication','0000-00-00 00:00:00'),('site_name','MODx Revolution','textfield','core','site','0000-00-00 00:00:00'),('site_start','1','textfield','core','site','0000-00-00 00:00:00'),('site_status','1','combo-boolean','core','site','0000-00-00 00:00:00'),('site_unavailable_message','The site is currently unavailable','textfield','core','site','0000-00-00 00:00:00'),('site_unavailable_page','0','textfield','core','site','0000-00-00 00:00:00'),('strip_image_paths','1','combo-boolean','core','file','0000-00-00 00:00:00'),('symlink_merge_fields','1','combo-boolean','core','site','0000-00-00 00:00:00'),('topmenu_show_descriptions','1','combo-boolean','core','manager','0000-00-00 00:00:00'),('tree_default_sort','menuindex','textfield','core','manager','0000-00-00 00:00:00'),('tree_root_id','0','numberfield','core','manager','0000-00-00 00:00:00'),('udperms_allowroot','','combo-boolean','core','authentication','0000-00-00 00:00:00'),('unauthorized_page','1','textfield','core','site','0000-00-00 00:00:00'),('upload_files','txt,html,htm,xml,js,css,zip,gz,rar,z,tgz,tar,htaccess,mp3,mp4,aac,wav,au,wmv,avi,mpg,mpeg,pdf,doc,xls,txt','textfield','core','file','0000-00-00 00:00:00'),('upload_flash','swf,fla','textfield','core','file','0000-00-00 00:00:00'),('upload_images','jpg,jpeg,png,gif,psd,ico,bmp','textfield','core','file','0000-00-00 00:00:00'),('upload_maxsize','1048576','textfield','core','file','0000-00-00 00:00:00'),('upload_media','mp3,wav,au,wmv,avi,mpg,mpeg','textfield','core','file','0000-00-00 00:00:00'),('use_alias_path','0','combo-boolean','core','furls','0000-00-00 00:00:00'),('use_browser','1','combo-boolean','core','file','0000-00-00 00:00:00'),('use_editor','1','combo-boolean','core','editor','0000-00-00 00:00:00'),('use_multibyte','1','combo-boolean','core','language','2011-01-10 17:35:51'),('webpwdreminder_message','<p>Hello [[+uid]],</p>\n\n    <p>To activate your new password click the following link:</p>\n\n    <p>[[+surl]]</p>\n\n    <p>If successful you can use the following password to login:</p>\n\n    <p><strong>Password:</strong> [[+pwd]]</p>\n\n    <p>If you did not request this email then please ignore it.</p>\n\n    <p>Regards,<br />\n    Site Administrator</p>','textarea','core','authentication','0000-00-00 00:00:00'),('websignupemail_message','<p>Hello [[+uid]],</p>\n\n    <p>Here are your login details for [[+sname]]:</p>\n\n    <p><strong>Username:</strong> [[+uid]]<br />\n    <strong>Password:</strong> [[+pwd]]</p>\n\n    <p>Once you log into [[+sname]] at [[+surl]], you can change your password.</p>\n\n    <p>Regards,<br />\n    Site Administrator</p>','textarea','core','authentication','0000-00-00 00:00:00'),('welcome_screen','','combo-boolean','core','manager','2011-01-10 17:36:14'),('welcome_screen_url','http://misc.modx.com/revolution/welcome.20.html','textfield','core','manager','0000-00-00 00:00:00'),('which_editor','','modx-combo-rte','core','editor','0000-00-00 00:00:00'),('which_element_editor','','modx-combo-rte','core','editor','0000-00-00 00:00:00'),('xhtml_urls','1','combo-boolean','core','site','0000-00-00 00:00:00'),('settings_version','2.0.6-pl2','textfield','core','system','0000-00-00 00:00:00'),('settings_distro','traditional','textfield','core','system','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `modx_system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_transport_packages`
--

DROP TABLE IF EXISTS `modx_transport_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_transport_packages` (
  `signature` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `installed` datetime DEFAULT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workspace` int(10) unsigned NOT NULL DEFAULT '0',
  `provider` int(10) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `source` tinytext,
  `manifest` text,
  `attributes` mediumtext,
  `package_name` varchar(255) NOT NULL,
  `metadata` text,
  `version_major` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `version_minor` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `version_patch` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `release` varchar(100) NOT NULL DEFAULT '',
  `release_index` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`signature`),
  KEY `workspace` (`workspace`),
  KEY `provider` (`provider`),
  KEY `disabled` (`disabled`),
  KEY `package_name` (`package_name`),
  KEY `version_major` (`version_major`),
  KEY `version_minor` (`version_minor`),
  KEY `version_patch` (`version_patch`),
  KEY `release` (`release`),
  KEY `release_index` (`release_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_transport_packages`
--

LOCK TABLES `modx_transport_packages` WRITE;
/*!40000 ALTER TABLE `modx_transport_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_transport_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_transport_providers`
--

DROP TABLE IF EXISTS `modx_transport_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_transport_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext,
  `service_url` tinytext,
  `api_key` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `api_key` (`api_key`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_transport_providers`
--

LOCK TABLES `modx_transport_providers` WRITE;
/*!40000 ALTER TABLE `modx_transport_providers` DISABLE KEYS */;
INSERT INTO `modx_transport_providers` VALUES (1,'modxcms.com','The official MODx transport facility for 3rd party components.','http://rest.modxcms.com/extras/','','2011-01-06 10:59:49',NULL);
/*!40000 ALTER TABLE `modx_transport_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_user_attributes`
--

DROP TABLE IF EXISTS `modx_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_user_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0',
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `website` varchar(255) NOT NULL DEFAULT '',
  `extended` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `internalKey` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_user_attributes`
--

LOCK TABLES `modx_user_attributes` WRITE;
/*!40000 ALTER TABLE `modx_user_attributes` DISABLE KEYS */;
INSERT INTO `modx_user_attributes` VALUES (1,1,'Default Admin User',1,'modx-admin@mapofmedicine.com','','',0,0,0,1,0,1294680974,0,'e456e3e56ca0f6423935b8c918692eb9',0,0,'','','','','','','','','',NULL);
/*!40000 ALTER TABLE `modx_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_user_group_roles`
--

DROP TABLE IF EXISTS `modx_user_group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_user_group_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext,
  `authority` int(10) unsigned NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `authority` (`authority`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_user_group_roles`
--

LOCK TABLES `modx_user_group_roles` WRITE;
/*!40000 ALTER TABLE `modx_user_group_roles` DISABLE KEYS */;
INSERT INTO `modx_user_group_roles` VALUES (1,'Member',NULL,9999),(2,'Super User',NULL,0);
/*!40000 ALTER TABLE `modx_user_group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_user_messages`
--

DROP TABLE IF EXISTS `modx_user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_user_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `date_sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_user_messages`
--

LOCK TABLES `modx_user_messages` WRITE;
/*!40000 ALTER TABLE `modx_user_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_user_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_user_roles`
--

DROP TABLE IF EXISTS `modx_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_user_roles`
--

LOCK TABLES `modx_user_roles` WRITE;
/*!40000 ALTER TABLE `modx_user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_user_settings`
--

DROP TABLE IF EXISTS `modx_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_user_settings` (
  `user` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_user_settings`
--

LOCK TABLES `modx_user_settings` WRITE;
/*!40000 ALTER TABLE `modx_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_users`
--

DROP TABLE IF EXISTS `modx_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '',
  `class_key` varchar(100) NOT NULL DEFAULT 'modUser',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remote_key` varchar(255) DEFAULT NULL,
  `remote_data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `class_key` (`class_key`),
  KEY `remote_key` (`remote_key`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_users`
--

LOCK TABLES `modx_users` WRITE;
/*!40000 ALTER TABLE `modx_users` DISABLE KEYS */;
INSERT INTO `modx_users` VALUES (1,'admin','caab4cc01a52524be8b676357e525c7a','','modUser',1,NULL,NULL);
/*!40000 ALTER TABLE `modx_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modx_workspaces`
--

DROP TABLE IF EXISTS `modx_workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modx_workspaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attributes` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `name` (`name`),
  KEY `sctive` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modx_workspaces`
--

LOCK TABLES `modx_workspaces` WRITE;
/*!40000 ALTER TABLE `modx_workspaces` DISABLE KEYS */;
INSERT INTO `modx_workspaces` VALUES (1,'Default MODx workspace','/usr/local/modx-2.0.6-pl2/core/','2011-01-10 17:35:50',1,NULL);
/*!40000 ALTER TABLE `modx_workspaces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-13 15:20:50
