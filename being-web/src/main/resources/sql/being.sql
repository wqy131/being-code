/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 5.7.11-log : Database - being
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `coin`;

/*Table structure for table `contact_info` */

DROP TABLE IF EXISTS `contact_info`;

CREATE TABLE `contact_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `subject` varchar(200) DEFAULT NULL COMMENT '标题',
  `message` varchar(1024) DEFAULT NULL COMMENT '内容',
  `status` char(5) DEFAULT NULL COMMENT '审核状态，1=审核,2=有效，3=无效',
  `remark` varchar(1024) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `contact_info` */

insert  into `contact_info`(`id`,`name`,`tel`,`email`,`subject`,`message`,`status`,`remark`) values (1,'王五','13111111111','wangwu@qq.com','购买ETH','购买ETH购买ETH购买ETH购买ETH购买ETH',NULL,NULL),(2,'test1','13122222222','test1@qq.com','test','test',NULL,NULL);

/*Table structure for table `crm_attachment` */

DROP TABLE IF EXISTS `crm_attachment`;

CREATE TABLE `crm_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `att_type` varchar(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mo4u1f5i9c0uq531tkeqaw5kd` (`file_path`),
  KEY `FKmkoq53o6qwxpmiyerl1vm7vus` (`member_id`),
  CONSTRAINT `FKmkoq53o6qwxpmiyerl1vm7vus` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `crm_attachment` */

/*Table structure for table `crm_member` */

DROP TABLE IF EXISTS `crm_member`;

CREATE TABLE `crm_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `real_name` varchar(64) NOT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3w4x463xehrckku45kvs911ml` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `crm_member` */

insert  into `crm_member`(`id`,`password`,`user_name`,`status`,`email`,`gender`,`hiredate`,`real_name`,`telephone`,`avatar`) values (1,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','admin','','768870379@qq.com','GIRL','2017-06-29 00:00:00','管理员','18676037292',NULL),(31,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','gson','\0','zhangsan@126.com','BOY','2017-05-07 00:00:00','张三','13203314875',NULL);

/*Table structure for table `crm_member_role` */

DROP TABLE IF EXISTS `crm_member_role`;

CREATE TABLE `crm_member_role` (
  `member_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKb17jj8ou6rp2lkxb5xen5tixe` (`role_id`),
  KEY `FK76a8mc5mub4tu1gndxph4ypls` (`member_id`),
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `crm_member_role` */

insert  into `crm_member_role`(`member_id`,`role_id`) values (31,1),(1,1);

/*Table structure for table `crm_resource` */

DROP TABLE IF EXISTS `crm_resource`;

CREATE TABLE `crm_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fun_urls` varchar(1024) DEFAULT NULL,
  `menu_url` varchar(128) DEFAULT NULL,
  `res_key` varchar(128) NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_type` varchar(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ic22mdco0hjpt8qjosdnyhxcx` (`res_key`),
  KEY `FKo4megp72bdlng5bpjmo56v1wk` (`parent_id`),
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `crm_resource` */

insert  into `crm_resource`(`id`,`fun_urls`,`menu_url`,`res_key`,`res_name`,`res_type`,`status`,`parent_id`,`weight`) values (1,'','','system','系统管理','MENU','',NULL,0),(3,'/system/member/list','/system/member','system-member','用户管理','MENU','',1,NULL),(10,'/system/role/list,/system/role/resource/tree','/system/role','system-role','角色管理','MENU','',1,NULL),(11,'/system/resource/list','/system/resource','system-resource','资源管理','MENU','',1,NULL),(12,'','','role-create','创建角色','FUNCTION','',10,NULL),(13,'','/system/role/delete','role-delete','删除角色','FUNCTION','',10,NULL),(14,'/system/role/update,/system/role/save','','role-save','保存编辑','FUNCTION','',10,NULL),(17,'/system/role/resource/save','','reole-resource-save','分配资源','FUNCTION','',10,NULL),(18,'/system/resource/form,/system/resource/parent/tree,/system/resource/save','','resource-create','创建资源','FUNCTION','',11,NULL),(19,'/system/resource/form,/system/resource/parent/tree,/system/resource/save','','resource-edit','编辑','FUNCTION','',11,NULL),(20,'/system/resource/delete','','resource-delete','删除','FUNCTION','',11,NULL),(21,'/system/member/form,/system/member/save','','member-create','创建用户','FUNCTION','',3,NULL),(22,'/system/member/delete','','member-delete','删除用户','FUNCTION','',3,NULL),(23,'/system/member/form,/system/member/update','','member-edit','编辑用户','FUNCTION','',3,NULL),(26,'/system/member/password/reset','','member-reset-password','重置密码','FUNCTION','',3,NULL),(28,'','/system/contact','system-contact','合同管理','MENU','',1,NULL),(29,'/system/contact/update','','contact-edit','编辑合同','FUNCTION','',28,NULL),(30,'','/system/userInfo','system-user','客户管理','MENU','',1,NULL),(31,'/system/userInfo/update','','userInfo-edit','编辑客户资料','FUNCTION','',30,NULL);

/*Table structure for table `crm_role` */

DROP TABLE IF EXISTS `crm_role`;

CREATE TABLE `crm_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL,
  `role_name` varchar(30) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r0jsnwb00o0n376ghyuahuqfg` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `crm_role` */

insert  into `crm_role`(`id`,`description`,`role_name`,`status`) values (1,'有系统所有权限','管理员',''),(8,'','普通用户','');

/*Table structure for table `crm_role_resource` */

DROP TABLE IF EXISTS `crm_role_resource`;

CREATE TABLE `crm_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  KEY `FKjwyt61kixx52wper9y0li38c2` (`resource_id`),
  KEY `FKasi3s87a7p562cyw0jt3m0isf` (`role_id`),
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `crm_role_resource` */

insert  into `crm_role_resource`(`role_id`,`resource_id`) values (1,1),(1,3),(1,21),(1,22),(1,23),(1,10),(1,12),(1,13),(1,14),(1,17),(1,11),(1,18),(1,19),(1,20),(1,28),(1,29),(1,30),(1,31);

/*Table structure for table `file_info` */

DROP TABLE IF EXISTS `file_info`;

CREATE TABLE `file_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '文件路径',
  `file_type` char(5) CHARACTER SET latin1 DEFAULT NULL COMMENT '文件类型,1=身份证件',
  `status` char(5) CHARACTER SET latin1 DEFAULT NULL COMMENT '文件状态，1=初审，2初审失败，3=复审，4=复审失败，5审核通过',
  `external_id` bigint(11) DEFAULT NULL COMMENT '关联id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(11) DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime DEFAULT NULL,
  `update_id` bigint(20) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET latin1 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `file_info` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET latin1 DEFAULT NULL COMMENT '密码',
  `gender` char(5) CHARACTER SET latin1 DEFAULT NULL COMMENT '性别，1=男，2=女',
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '邮箱',
  `cellphone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `full_name` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `id_type` char(5) CHARACTER SET latin1 DEFAULT NULL COMMENT '证件类型1=身份证件',
  `id_num` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '证件号',
  `status` char(5) CHARACTER SET latin1 DEFAULT '1' COMMENT '状态,1=可用，2=不可用',
  `source` char(5) CHARACTER SET latin1 DEFAULT NULL COMMENT '来源',
  `avater_path` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '头像路径',
  `reg_channel` char(5) CHARACTER SET latin1 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_id` bigint(20) DEFAULT NULL,
  `num_auth_flog` tinyint(1) DEFAULT '0' COMMENT '身份证是否已认证,1=是，0=否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`name`,`password`,`gender`,`email`,`cellphone`,`full_name`,`id_type`,`id_num`,`status`,`source`,`avater_path`,`reg_channel`,`create_time`,`create_id`,`update_time`,`update_id`,`num_auth_flog`) values (1,'admin','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','0','131@qq.com','13100000000',NULL,'1','310108194910197357','1',NULL,NULL,NULL,'2018-08-19 18:46:29',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
