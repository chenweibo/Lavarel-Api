/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 100130
Source Host           : localhost:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 100130
File Encoding         : 65001

Date: 2018-09-26 16:51:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2018_09_10_082332_create_permission_tables', '2');

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------

-- ----------------------------
-- Table structure for navigations
-- ----------------------------
DROP TABLE IF EXISTS `navigations`;
CREATE TABLE `navigations` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `redirect` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `meta` text,
  `pid` int(255) DEFAULT NULL,
  `hidden` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigations
-- ----------------------------
INSERT INTO `navigations` VALUES ('1', '/website', 'Layout', 'noredirect', 'website', '{\"title\":\"站点设置\",\"icon\":\"setup\",\"roles\":[\"editor\"]}', '0', null);
INSERT INTO `navigations` VALUES ('2', '/baseSets', 'BaseSets', '#', 'BaseSets', '{\"title\":\"基础设置\",\"icon\":\"set\"}', '1', null);
INSERT INTO `navigations` VALUES ('3', 'tree', '', '#', 'Tree', '{\"title\":\"Tree\",\"icon\":\"tree\",\"roles\":[\"editor\"]}', '1', null);
INSERT INTO `navigations` VALUES ('4', '/users', '', '', '', '{\"title\":\"用户管理\",\"icon\":\"user\"}', '0', null);
INSERT INTO `navigations` VALUES ('5', 'permissiom', '', '', 'Permission', '{\"title\":\"权限管理\",\"icon\":\"lock\"}', '0', null);
INSERT INTO `navigations` VALUES ('6', '/gbook', '', null, 'Gbook', '{\"title\":\"留言管理\",\"icon\":\"gbook\"}', '0', null);
INSERT INTO `navigations` VALUES ('7', '/page', '', null, 'Page', '{\"title\":\"单页管理\",\"icon\":\"page\"}', '0', null);
INSERT INTO `navigations` VALUES ('8', '/article', null, null, 'Article', '{\"title\":\"文章管理\",\"icon\":\"article\"}', '0', null);
INSERT INTO `navigations` VALUES ('9', '/project', null, null, null, '{\"title\":\"产品管理\",\"icon\":\"project\"}', '0', null);
INSERT INTO `navigations` VALUES ('10', '/file', null, null, null, '{\"title\":\"文件系统\",\"icon\":\"file\"}', '0', null);
INSERT INTO `navigations` VALUES ('11', '/wechat', null, null, null, '{\"title\":\"微信管理\",\"icon\":\"wechat\"}', '0', null);
INSERT INTO `navigations` VALUES ('12', '/system', null, null, null, '{\"title\":\"系统设置\",\"icon\":\"system\"}', '0', null);
INSERT INTO `navigations` VALUES ('13', 'other', null, null, null, '{\"title\":\"其他设置\",\"icon\":\"other\"}', '0', null);
INSERT INTO `navigations` VALUES ('14', 'pay', null, null, null, '{\"title\":\"支付系统\",\"icon\":\"pay\"}', '0', null);
INSERT INTO `navigations` VALUES ('15', '/user/list', 'User', null, 'User', '{\"title\":\"用户列表\",\"icon\":\"adduser\"}', '4', null);
INSERT INTO `navigations` VALUES ('16', '/user/info', 'Person', null, 'Person', '{\"title\":\"个人中心\",\"icon\":\"person\"}', '4', null);
INSERT INTO `navigations` VALUES ('17', '/permissiom/list', 'Permissionlist', null, 'Permissionlist', '{\"title\":\"角色管理\",\"icon\":\"permission\"}', '5', null);
INSERT INTO `navigations` VALUES ('18', '/permissiom/role', 'Roles', 'Roles', 'Roles', '{\"title\":\"权限管理\",\"icon\":\"role\"}', '5', null);
INSERT INTO `navigations` VALUES ('19', 'message', 'Message', 'Message', 'Message', '{\"title\":\"留言列表\",\"icon\":\"message\"}', '6', null);
INSERT INTO `navigations` VALUES ('20', 'Pagelist', null, 'page/list', 'Page', '{\"title\":\"单篇列表\",\"icon\":\"page\"}', '7', null);
INSERT INTO `navigations` VALUES ('21', 'create', null, null, 'PageCreate', '{\"title\":\"单篇添加\",\"icon\":\"page\"}', '7', 'true');
INSERT INTO `navigations` VALUES ('22', 'edit/:id(\\\\d+)', null, null, 'PageEdit', '{\"title\":\"单篇编辑\",\"icon\":\"page\"}', '7', 'true');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'weibo', '563960993@qq.com', '$2y$10$7wmVhnS5BZdtzWRrfJNV2.FlV5QG5WJQB1IeSINXLAZ0akK1LaWxK', null, '2018-09-08 01:28:13', '2018-09-08 01:28:13');
INSERT INTO `users` VALUES ('2', 'bo', '123456@qq.com', '$2y$10$s8Qaefup0kI5p85DPosuXuNyLrkL83C6S8CA6IZaabG3/E3FG/ilm', null, '2018-09-08 02:02:42', '2018-09-08 02:02:42');
