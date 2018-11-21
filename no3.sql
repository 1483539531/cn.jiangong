/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.40 : Database - no3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`no3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `no3`;

/*Table structure for table `backuser` */

DROP TABLE IF EXISTS `backuser`;

CREATE TABLE `backuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backuser` */

/*Table structure for table `businessobject` */

DROP TABLE IF EXISTS `businessobject`;

CREATE TABLE `businessobject` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(10) DEFAULT NULL COMMENT '产品名称',
  `hangye` int(11) DEFAULT NULL COMMENT '项目行业(链接类别表)',
  `stage` int(11) DEFAULT NULL COMMENT '项目阶段(链接类别表)',
  `position` int(11) DEFAULT NULL COMMENT '在项目里属于哪个职位',
  `content` varchar(10) DEFAULT NULL COMMENT '项目说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `businessobject` */

/*Table structure for table `categorys` */

DROP TABLE IF EXISTS `categorys`;

CREATE TABLE `categorys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `leixing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `categorys` */

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `project_id` int(11) DEFAULT NULL COMMENT '项目信息id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(10) DEFAULT NULL COMMENT '公司名称',
  `position` varchar(10) DEFAULT NULL COMMENT '公司职位',
  `sheng` varchar(10) DEFAULT NULL COMMENT '办公省',
  `city` varchar(10) DEFAULT NULL COMMENT '办公市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `company` */

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) DEFAULT NULL COMMENT '工程职_id',
  `project_info_id` int(11) DEFAULT NULL COMMENT 'project_info_id',
  `position` int(11) DEFAULT NULL COMMENT '职位(业主\\负责人\\电气工程师\\排水等链接联系人职位表)',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(10) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contacts` */

/*Table structure for table `dingyue` */

DROP TABLE IF EXISTS `dingyue`;

CREATE TABLE `dingyue` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `project_stage` int(11) DEFAULT NULL COMMENT '项目阶段',
  `project_hangye` int(11) DEFAULT NULL COMMENT '项目行业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dingyue` */

/*Table structure for table `dingyueaddress` */

DROP TABLE IF EXISTS `dingyueaddress`;

CREATE TABLE `dingyueaddress` (
  `id` int(11) NOT NULL,
  `dingyueid` int(11) DEFAULT NULL COMMENT '订阅表id',
  `sheng` varchar(10) DEFAULT NULL COMMENT '省',
  `city` varchar(10) DEFAULT NULL COMMENT '市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dingyueaddress` */

/*Table structure for table `money_source` */

DROP TABLE IF EXISTS `money_source`;

CREATE TABLE `money_source` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT 'name(国内政府，商业融资)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `money_source` */

/*Table structure for table `project_info` */

DROP TABLE IF EXISTS `project_info`;

CREATE TABLE `project_info` (
  `id` int(11) NOT NULL,
  `titlename` varchar(10) DEFAULT NULL COMMENT '工程信息标题',
  `detailed_address` varchar(10) DEFAULT NULL COMMENT '详细地址',
  `release_date` date DEFAULT NULL COMMENT '发布时间',
  `update_date` date DEFAULT NULL COMMENT '修改时间',
  `info_number` int(11) DEFAULT NULL COMMENT '项目信息编号',
  `owner_type` varchar(10) DEFAULT NULL COMMENT '业主类型(就有俩 一个商业一个政府)01',
  `project_type` varchar(10) DEFAULT NULL COMMENT '工程类型(一个扩建一个新建)01',
  `detailed_type` varchar(10) DEFAULT NULL COMMENT '详细类别(企业自建/自用办公楼/幼儿园,自己填的)',
  `project_area` int(11) DEFAULT NULL COMMENT '建筑面积（游客不可看）',
  `project_describe` varchar(10) DEFAULT NULL COMMENT '项目描述（游客不可看）',
  `predict_cost` int(11) DEFAULT NULL COMMENT '预计成本（游客不可看）',
  `start_date` date DEFAULT NULL COMMENT '开工时间（游客不可看）',
  `over_date` date DEFAULT NULL COMMENT '结束时间（游客不可看）',
  `project_material` varchar(10) DEFAULT NULL COMMENT '项目用材（游客不可看）',
  `project_contacts` int(11) DEFAULT NULL COMMENT '项目联系人(链接联系人表)（游客不可看）',
  `project_hangye` int(11) DEFAULT NULL COMMENT '工程行业(*连接分类表)',
  `stage` int(11) DEFAULT NULL COMMENT '项目阶段(连接分类表)',
  `sheng_address` varchar(10) DEFAULT NULL COMMENT '省地址',
  `city_address` varchar(10) DEFAULT NULL COMMENT '市地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `project_info` */

/*Table structure for table `project_position` */

DROP TABLE IF EXISTS `project_position`;

CREATE TABLE `project_position` (
  `id` int(11) NOT NULL,
  `name` char(10) DEFAULT NULL COMMENT 'name',
  `parent_id` char(10) DEFAULT NULL COMMENT '所属甲乙方id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `project_position` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `zhanghao` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(10) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `phone` varchar(10) DEFAULT NULL COMMENT '电话',
  `businessobject_id` int(11) DEFAULT NULL COMMENT '业务对象id(填写这个，会推荐适合的项目及合作人脉)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `zhaobiao` */

DROP TABLE IF EXISTS `zhaobiao`;

CREATE TABLE `zhaobiao` (
  `id` int(11) NOT NULL,
  `zhaobiao_number` varchar(10) DEFAULT NULL COMMENT '招标编号',
  `zhaobiaoren` varchar(10) DEFAULT NULL COMMENT '招标人      （游客不可看）',
  `title` varchar(10) DEFAULT NULL COMMENT '招标主题',
  `money_source` int(11) DEFAULT NULL COMMENT '资金来源(链接资金来源表)  （游客不可看）',
  `kaibiao_date` date DEFAULT NULL COMMENT '开标时间  （游客不可看）',
  `release_date` date DEFAULT NULL COMMENT '信息发布时间',
  `content` varchar(10) DEFAULT NULL COMMENT '招标主题内容',
  `money` varchar(10) DEFAULT NULL COMMENT '投资金额  （游客不可看）',
  `phone` varchar(10) DEFAULT NULL COMMENT '电话  （游客不可看）',
  `zhaobiao_type` int(11) DEFAULT NULL COMMENT '招标类型(链接分类表)',
  `zhaobiao_hangye` int(11) DEFAULT NULL COMMENT '招标行业(链接分类表)',
  `sheng_address` int(11) DEFAULT NULL COMMENT '省地址(链接分类表)',
  `city_address` int(11) DEFAULT NULL COMMENT '市地址(链接分类表)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zhaobiao` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
