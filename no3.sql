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

/*Table structure for table `aa` */

DROP TABLE IF EXISTS `aa`;

CREATE TABLE `aa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xuehao` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `biaohao` varchar(255) DEFAULT NULL,
  `ke` varchar(255) DEFAULT NULL,
  `fen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `aa` */

insert  into `aa`(`id`,`xuehao`,`name`,`biaohao`,`ke`,`fen`) values (1,'2005001','张三','0001','数学',69),(2,'2005002','李四','0001','数学',89),(3,'2005001','张三','0001','数学',69),(4,'2005001','张三','0001','数学',69);

/*Table structure for table `backuser` */

DROP TABLE IF EXISTS `backuser`;

CREATE TABLE `backuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `logindate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `backuser` */

insert  into `backuser`(`id`,`zhanghao`,`password`,`state`,`logindate`) values (1,'admin','1234561',1,'2018-12-08 13:57:50'),(3,'admin1','123456',1,'2018-12-04 10:00:21'),(4,'admin2','123456',1,'2018-12-03 19:47:43'),(5,'wangyeu','123456',1,'2018-12-06 09:04:44'),(6,'wangwang','123456',1,'2018-12-10 06:31:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=820405 DEFAULT CHARSET=utf8;

/*Data for the table `categorys` */

insert  into `categorys`(`id`,`value`,`parent_id`,`leixing`) values (1,'招标信息',0,'fen'),(2,'工程信息',0,'fen'),(3,'采购信息',0,'fen'),(4,'信用查询',0,'fen'),(5,'交通运输',1,'fen'),(6,'能源化工',1,'fen'),(7,'市政房地产建筑',1,'fen'),(8,'水利桥梁',1,'fen'),(9,'机械电子电器',1,'fen'),(10,'环保',1,'fen'),(11,'网络通讯计算机',1,'fen'),(12,'冶金矿产原材料',1,'fen'),(13,'农林牧渔   园林绿化',1,'fen'),(14,'商业服务',1,'fen'),(15,'医疗   轻工  出版  科技',1,'fen'),(16,'高速公路',5,'fen'),(17,'检测',5,'fen'),(18,'安全设施',5,'fen'),(19,'沥青',5,'fen'),(20,'甲供',5,'fen'),(21,'水泥',5,'fen'),(22,'道路',5,'fen'),(23,'公路',5,'fen'),(24,'路面',5,'fen'),(25,'城市道路',5,'fen'),(26,'BT',5,'fen'),(27,'路养护',5,'fen'),(28,'路检测',5,'fen'),(29,'信号',5,'fen'),(30,'铁路',5,'fen'),(31,'高铁',5,'fen'),(32,'铁路物资',5,'fen'),(33,'地铁',5,'fen'),(34,'轨道',5,'fen'),(35,'交通',5,'fen'),(36,'立交桥',5,'fen'),(37,'机场',5,'fen'),(38,'航道',5,'fen'),(39,'水里枢纽',5,'fen'),(40,'港口',5,'fen'),(41,'码头',5,'fen'),(42,'泊位',5,'fen'),(43,'渔港',5,'fen'),(44,'客运站',5,'fen'),(45,'交通枢纽',5,'fen'),(46,'隧道',5,'fen'),(47,'物流',5,'fen'),(48,'运输',5,'fen'),(49,'配送',5,'fen'),(50,'仓储',5,'fen'),(51,'包装',5,'fen'),(52,'养护',5,'fen'),(53,'标识牌',5,'fen'),(54,'伸缩缝',5,'fen'),(55,'防水板',5,'fen'),(56,'止水带',5,'fen'),(57,'丝网',5,'fen'),(58,'火电',6,'fen'),(59,'核电',6,'fen'),(60,'水电',6,'fen'),(61,'风电',6,'fen'),(62,'电网建设',6,'fen'),(63,'太阳能',6,'fen'),(64,'光伏发电',6,'fen'),(65,'垃圾焚烧',6,'fen'),(66,'新能源',6,'fen'),(67,'节能改造',6,'fen'),(68,'输气管道',6,'fen'),(69,'煤炭',6,'fen'),(70,'石油',6,'fen'),(71,'天然气',6,'fen'),(72,'石化',6,'fen'),(73,'石油化工',6,'fen'),(74,'煤化工',6,'fen'),(75,'辅机',6,'fen'),(76,'绝缘子',6,'fen'),(77,'国网',6,'fen'),(78,'电力公司',6,'fen'),(79,'电厂',6,'fen'),(80,'电网',6,'fen'),(81,'南方电网',6,'fen'),(82,'尿素',6,'fen'),(83,'合成氨',6,'fen'),(84,'大唐',6,'fen'),(85,'神华',6,'fen'),(86,'华能',6,'fen'),(87,'华电',6,'fen'),(88,'电力投资',6,'fen'),(89,'国投电力',6,'fen'),(90,'国华电力',6,'fen'),(91,'华润电力',6,'fen'),(92,'中广核',6,'fen'),(93,'二氧化碳',6,'fen'),(94,'东北电网',6,'fen'),(95,'金具',6,'fen'),(96,'自动化',6,'fen'),(97,'公共厕所',7,'fen'),(98,'化粪池',7,'fen'),(99,'供热',7,'fen'),(100,'供水',7,'fen'),(101,'排水',7,'fen'),(102,'幕墙',7,'fen'),(103,'桩基',7,'fen'),(104,'拆除',7,'fen'),(105,'管道',7,'fen'),(106,'取暖',7,'fen'),(107,'空调',7,'fen'),(108,'消防',7,'fen'),(109,'安装',7,'fen'),(110,'装饰',7,'fen'),(111,'装修',7,'fen'),(112,'门窗',7,'fen'),(113,'灯具',7,'fen'),(114,'砌砖',7,'fen'),(115,'钢材',7,'fen'),(116,'水泥',7,'fen'),(117,'砂石',7,'fen'),(118,'梯',7,'fen'),(119,'总承包',7,'fen'),(120,'基础设施',7,'fen'),(121,'改扩建',7,'fen'),(122,'管网',7,'fen'),(123,'通风工程',7,'fen'),(124,'安置房',7,'fen'),(125,'铺装',7,'fen'),(126,'防水',7,'fen'),(127,'灾后重建',7,'fen'),(128,'景观',7,'fen'),(129,'地下工程',7,'fen'),(130,'公共服务',7,'fen'),(131,'土地复垦',7,'fen'),(132,'管材',7,'fen'),(133,'管件',7,'fen'),(134,'PE',7,'fen'),(135,'PVC',7,'fen'),(136,'农田灌溉',8,'fen'),(137,'防护堤',8,'fen'),(138,'防洪堤',8,'fen'),(139,'水库',8,'fen'),(140,'引水',8,'fen'),(141,'蓄水',8,'fen'),(142,'提水',8,'fen'),(143,'南水北调',8,'fen'),(144,'三峡',8,'fen'),(145,'丹江口',8,'fen'),(146,'桥梁',8,'fen'),(147,'河道治理',8,'fen'),(148,'除险加固',8,'fen'),(149,'山洪',8,'fen'),(150,'水电站',8,'fen'),(151,'水利',8,'fen'),(152,'桥',8,'fen'),(153,'饮水安全',8,'fen'),(154,'闸门',8,'fen'),(155,'监测',8,'fen'),(156,'启闭机',8,'fen'),(157,'河池',8,'fen'),(158,'水泵',8,'fen'),(159,'灌区',8,'fen'),(160,'水土保持',8,'fen'),(161,'水电',8,'fen'),(162,'交通桥',8,'fen'),(163,'堤防',8,'fen'),(164,'泄洪',8,'fen'),(165,'防洪',8,'fen'),(166,'防涝',8,'fen'),(167,'桥梁检测',8,'fen'),(168,'护岸',8,'fen'),(169,'水利工程',8,'fen'),(170,'洪渠',8,'fen'),(171,'围堰',8,'fen'),(172,'供水管网',8,'fen'),(173,'防渗渠',8,'fen'),(174,'分水闸',8,'fen'),(175,'水利设施',8,'fen'),(176,'机械',9,'fen'),(177,'锅炉',9,'fen'),(178,'阀',9,'fen'),(179,'压缩机',9,'fen'),(180,'轴承',9,'fen'),(181,'齿轮',9,'fen'),(182,'风机',9,'fen'),(183,'衡器',9,'fen'),(184,'车',9,'fen'),(185,'电机',9,'fen'),(186,'弱电',9,'fen'),(187,'照明',9,'fen'),(188,'电线',9,'fen'),(189,'电缆',9,'fen'),(190,'光缆',9,'fen'),(191,'电池',9,'fen'),(192,'LED',9,'fen'),(193,'机电',9,'fen'),(194,'电梯',9,'fen'),(195,'变压器',9,'fen'),(196,'起重机',9,'fen'),(197,'监控',9,'fen'),(198,'无功补偿',9,'fen'),(199,'电力',9,'fen'),(200,'空调',9,'fen'),(201,'机床',9,'fen'),(202,'梯',9,'fen'),(203,'舞台',9,'fen'),(204,'发电机',9,'fen'),(205,'扶梯',9,'fen'),(206,'风电',9,'fen'),(207,'阀门',9,'fen'),(208,'发电机组',9,'fen'),(209,'空压机',9,'fen'),(210,'换热器',9,'fen'),(211,'开关柜',9,'fen'),(212,'水泵',9,'fen'),(213,'柴油发电机组',9,'fen'),(214,'仪器',9,'fen'),(215,'仪表',9,'fen'),(216,'风机',9,'fen'),(217,'医疗器械',9,'fen'),(218,'交换机',9,'fen'),(219,'引风机',9,'fen'),(220,'数控机床',9,'fen'),(221,'冷却塔',9,'fen'),(222,'伸缩缝',9,'fen'),(223,'电源',9,'fen'),(224,'启闭机',9,'fen'),(225,'冷凝器',9,'fen'),(226,'压力容器',9,'fen'),(227,'互感器',9,'fen'),(228,'母线',9,'fen'),(229,'封闭母线',9,'fen'),(230,'机电安装',9,'fen'),(231,'船舶',9,'fen'),(232,'塔筒',9,'fen'),(233,'污水',10,'fen'),(234,'饮用水',10,'fen'),(235,'净化',10,'fen'),(236,'水处理',10,'fen'),(237,'固体废物',10,'fen'),(238,'危险废物',10,'fen'),(239,'生活垃圾',10,'fen'),(240,'烟气在线监测',10,'fen'),(241,'污水处理厂',10,'fen'),(242,'除尘器',10,'fen'),(243,'垃圾填埋',10,'fen'),(244,'餐厨',10,'fen'),(245,'垃圾桶',10,'fen'),(246,'过滤器',10,'fen'),(247,'在线监测',10,'fen'),(248,'垃圾填埋场',10,'fen'),(249,'污水处理',10,'fen'),(250,'脱硫',10,'fen'),(251,'脱硝',10,'fen'),(252,'除尘',10,'fen'),(253,'除渣',10,'fen'),(254,'排水',10,'fen'),(255,'垃圾车',10,'fen'),(256,'环境监测',10,'fen'),(257,'垃圾压缩机',10,'fen'),(258,'垃圾运输',10,'fen'),(259,'渗滤液处理',10,'fen'),(260,'环评',10,'fen'),(261,'垃圾分类',10,'fen'),(262,'烟气',10,'fen'),(263,'环境整治',10,'fen'),(264,'垃圾整治',10,'fen'),(265,'垃圾清运',10,'fen'),(266,'防渗',10,'fen'),(267,'移动',11,'fen'),(268,'联通',11,'fen'),(269,'电信',11,'fen'),(270,'互联网',11,'fen'),(271,'网络',11,'fen'),(272,'接入',11,'fen'),(273,'机柜',11,'fen'),(274,'通信',11,'fen'),(275,'基站',11,'fen'),(276,'广电',11,'fen'),(277,'光缆',11,'fen'),(278,'软件',11,'fen'),(279,'开发',11,'fen'),(280,'系统集成',11,'fen'),(281,'技术咨询',11,'fen'),(282,'数据处理',11,'fen'),(283,'数据储存',11,'fen'),(284,'集成电路',11,'fen'),(285,'电脑',11,'fen'),(286,'台式机',11,'fen'),(287,'笔记本',11,'fen'),(288,'硬盘',11,'fen'),(289,'U盘',11,'fen'),(290,'打印机',11,'fen'),(291,'复印机',11,'fen'),(292,'扫描仪',11,'fen'),(293,'键盘',11,'fen'),(294,'鼠标',11,'fen'),(295,'服务器',11,'fen'),(296,'交换机',11,'fen'),(297,'天线',11,'fen'),(298,'电话',11,'fen'),(299,'铁塔',11,'fen'),(300,'网络改造',11,'fen'),(301,'系统维护',11,'fen'),(302,'机房设备',11,'fen'),(303,'多媒体',11,'fen'),(304,'视频监控',11,'fen'),(305,'选煤厂',12,'fen'),(306,'煤矿',12,'fen'),(307,'尾矿',12,'fen'),(308,'矿山',12,'fen'),(309,'矿产',12,'fen'),(310,'矿石',12,'fen'),(311,'水泥生产线',12,'fen'),(312,'混凝土',12,'fen'),(313,'金属',12,'fen'),(314,'冶金',12,'fen'),(315,'黑色金属',12,'fen'),(316,'有色金属',12,'fen'),(317,'稀土',12,'fen'),(318,'钢',12,'fen'),(319,'钢厂',12,'fen'),(320,'钢结构',12,'fen'),(321,'玻璃',12,'fen'),(322,'铁矿',12,'fen'),(323,'金矿',12,'fen'),(324,'铝',12,'fen'),(325,'煤',12,'fen'),(326,'水泥',12,'fen'),(327,'钢铁',12,'fen'),(328,'监理',12,'fen'),(329,'钢材',12,'fen'),(330,'昆钢',12,'fen'),(331,'铜',12,'fen'),(332,'钢球',12,'fen'),(333,'除尘器',12,'fen'),(334,'白银',12,'fen'),(335,'冶金',12,'fen'),(336,'石材',12,'fen'),(337,'不锈钢',12,'fen'),(338,'锌',12,'fen'),(339,'合金',12,'fen'),(340,'原材料',12,'fen'),(341,'洗煤',12,'fen'),(342,'辅料',12,'fen'),(343,'石灰',12,'fen'),(344,'碳钎维',12,'fen'),(345,'原料',12,'fen'),(346,'太钢',12,'fen'),(347,'晋煤',12,'fen'),(348,'钢管',12,'fen'),(349,'钢板',12,'fen'),(350,'种植',13,'fen'),(351,'烟草',13,'fen'),(352,'农药',13,'fen'),(353,'防疫',13,'fen'),(354,'有机肥',13,'fen'),(355,'肥料',13,'fen'),(356,'喷灌',13,'fen'),(357,'滴灌',13,'fen'),(358,'节水增粮',13,'fen'),(359,'苗木',13,'fen'),(360,'林木',13,'fen'),(361,'造林',13,'fen'),(362,'木材',13,'fen'),(363,'畜牧',13,'fen'),(364,'狩猎',13,'fen'),(365,'水产',13,'fen'),(366,'养殖',13,'fen'),(367,'土地整理',13,'fen'),(368,'节水',13,'fen'),(369,'罗山县',13,'fen'),(370,'林州',13,'fen'),(371,'农业',13,'fen'),(372,'灌溉',13,'fen'),(373,'退耕还林',13,'fen'),(374,'化肥',13,'fen'),(375,'草原',13,'fen'),(376,'牧场',13,'fen'),(377,'大棚',13,'fen'),(378,'水稻',13,'fen'),(379,'种子',13,'fen'),(380,'农场',13,'fen'),(381,'地膜',13,'fen'),(382,'农田',13,'fen'),(383,'绿化',13,'fen'),(384,'公园',13,'fen'),(385,'花园',13,'fen'),(386,'景观',13,'fen'),(387,'森林',13,'fen'),(388,'喷泉',13,'fen'),(389,'雕塑',13,'fen'),(390,'抗旱设备',13,'fen'),(391,'修理',14,'fen'),(392,'清洁',14,'fen'),(393,'保洁',14,'fen'),(394,'保安',14,'fen'),(395,'安保',14,'fen'),(396,'租凭',14,'fen'),(397,'后勤',14,'fen'),(398,'咨询',14,'fen'),(399,'调查',14,'fen'),(400,'广告',14,'fen'),(401,'中介',14,'fen'),(402,'会议',14,'fen'),(403,'展览',14,'fen'),(404,'包装',14,'fen'),(405,'保险',14,'fen'),(406,'地质勘查',14,'fen'),(407,'招标代理',14,'fen'),(408,'培训',14,'fen'),(409,'物业',14,'fen'),(410,'外包',14,'fen'),(411,'造价',14,'fen'),(412,'食堂',14,'fen'),(413,'规划',14,'fen'),(414,'审计',14,'fen'),(415,'银行',14,'fen'),(416,'酒店',14,'fen'),(417,'中国银行',14,'fen'),(418,'评估',14,'fen'),(419,'金融',14,'fen'),(420,'物业管理',14,'fen'),(421,'财务',14,'fen'),(422,'快递',14,'fen'),(423,'监理',14,'fen'),(424,'设计',14,'fen'),(425,'医院',15,'fen'),(426,'制药',15,'fen'),(427,'制剂',15,'fen'),(428,'出版',15,'fen'),(429,'印刷',15,'fen'),(430,'服装',15,'fen'),(431,'工作服',15,'fen'),(432,'窗帘',15,'fen'),(433,'鞋',15,'fen'),(434,'制服',15,'fen'),(435,'服饰',15,'fen'),(436,'食品',15,'fen'),(437,'办公用品',15,'fen'),(438,'家具',15,'fen'),(439,'医疗器械',15,'fen'),(440,'中烟',15,'fen'),(441,'疾控中心',15,'fen'),(442,'医用电梯',15,'fen'),(443,'医疗设备',15,'fen'),(444,'疫苗',15,'fen'),(445,'彩超',15,'fen'),(446,'心电图',15,'fen'),(447,'超声侦测',15,'fen'),(448,'呼吸机',15,'fen'),(449,'加压氧舱',15,'fen'),(450,'细胞分析仪',15,'fen'),(451,'教学设备',15,'fen'),(452,'化学发光',15,'fen'),(453,'pcr',15,'fen'),(454,'蛋白纯化',15,'fen'),(455,'基因扩增',15,'fen'),(456,'脉冲场电泳',15,'fen'),(457,'高效液相',15,'fen'),(458,'层析',15,'fen'),(459,'血红蛋白',15,'fen'),(460,'试用会员',0,'huiyuan'),(461,'高级会员',0,'huiyuan'),(462,'黄金会员',0,'huiyuan'),(463,'铂金会员',0,'huiyuan'),(464,'钻石会员',0,'huiyuan'),(465,'甲方',0,'zhiwei'),(466,'承包商',0,'zhiwei'),(467,'设计院',0,'zhiwei'),(468,'老板/业主',465,'zhiwei'),(469,'项目负责人',465,'zhiwei'),(470,'总工',465,'zhiwei'),(471,'采购负责人',465,'zhiwei'),(472,'工程负责人',465,'zhiwei'),(473,'设计负责人',465,'zhiwei'),(474,'预算负责人',465,'zhiwei'),(475,'财务负责人',465,'zhiwei'),(476,'前期负责人',465,'zhiwei'),(477,'机电负责人',465,'zhiwei'),(478,'装修负责人',465,'zhiwei'),(479,'弱电负责人',465,'zhiwei'),(480,'酒店管理公司',465,'zhiwei'),(481,'其他',465,'zhiwei'),(482,'总包负责人',466,'zhiwei'),(483,'总包项目经理',466,'zhiwei'),(484,'总包采购',466,'zhiwei'),(485,'土建总包商',466,'zhiwei'),(486,'钢结构总包商',466,'zhiwei'),(487,'幕墙总包商',466,'zhiwei'),(488,'机电总包商',466,'zhiwei'),(489,'消防总包商',466,'zhiwei'),(490,'弱电集成商',466,'zhiwei'),(491,'装饰总包商',466,'zhiwei'),(492,'景观总包商',466,'zhiwei'),(493,'灯光总包商',466,'zhiwei'),(494,'市政工程商',466,'zhiwei'),(495,'其他',466,'zhiwei'),(496,'院长',467,'zhiwei'),(497,'总工',467,'zhiwei'),(498,'项目经理',467,'zhiwei'),(499,'建筑设计师',467,'zhiwei'),(500,'结构设计师',467,'zhiwei'),(501,'机电工程师',467,'zhiwei'),(502,'暖通工程师',467,'zhiwei'),(503,'弱电设计师',467,'zhiwei'),(504,'给排水工程师',467,'zhiwei'),(505,'装修设计师',467,'zhiwei'),(506,'景观设计师',467,'zhiwei'),(507,'其他',467,'zhiwei'),(512,'商业',0,'yezhu'),(513,'政府',0,'yezhu'),(514,'国内融资',0,'laiyuan'),(515,'商业融资',0,'laiyuan'),(110000,'北京市',0,'dizhi'),(120000,'天津市',0,'dizhi'),(130000,'河北省',0,'dizhi'),(140000,'山西省',0,'dizhi'),(150000,'内蒙古自治区',0,'dizhi'),(210000,'辽宁省',0,'dizhi'),(220000,'吉林省',0,'dizhi'),(230000,'黑龙江省',0,'dizhi'),(310000,'上海市',0,'dizhi'),(320000,'江苏省',0,'dizhi'),(330000,'浙江省',0,'dizhi'),(340000,'安徽省',0,'dizhi'),(350000,'福建省',0,'dizhi'),(360000,'江西省',0,'dizhi'),(370000,'山东省',0,'dizhi'),(410000,'河南省',0,'dizhi'),(420000,'湖北省',0,'dizhi'),(430000,'湖南省',0,'dizhi'),(440000,'广东省',0,'dizhi'),(450000,'广西壮族自治区',0,'dizhi'),(460000,'海南省',0,'dizhi'),(500000,'重庆市',0,'dizhi'),(510000,'四川省',0,'dizhi'),(520000,'贵州省',0,'dizhi'),(530000,'云南省',0,'dizhi'),(540000,'西藏自治区',0,'dizhi'),(610000,'陕西省',0,'dizhi'),(620000,'甘肃省',0,'dizhi'),(630000,'青海省',0,'dizhi'),(640000,'宁夏回族自治区',0,'dizhi'),(650000,'新疆维吾尔自治区',0,'dizhi'),(710000,'台湾省',0,'dizhi'),(810000,'香港特别行政区',0,'dizhi'),(820000,'澳门特别行政区',0,'dizhi'),(820001,'市辖区',110000,'dizhi'),(820002,'东城区',110000,'dizhi'),(820003,'西城区',110000,'dizhi'),(820004,'朝阳区',110000,'dizhi'),(820005,'丰台区',110000,'dizhi'),(820006,'石景山区',110000,'dizhi'),(820007,'海淀区',110000,'dizhi'),(820008,'门头沟区',110000,'dizhi'),(820009,'房山区',110000,'dizhi'),(820010,'通州区',110000,'dizhi'),(820011,'顺义区',110000,'dizhi'),(820012,'昌平区',110000,'dizhi'),(820013,'大兴区',110000,'dizhi'),(820014,'怀柔区',110000,'dizhi'),(820015,'平谷区',110000,'dizhi'),(820016,'和平区',120000,'dizhi'),(820017,'河东区',120000,'dizhi'),(820018,'河西区',120000,'dizhi'),(820019,'南开区',120000,'dizhi'),(820020,'河北区',120000,'dizhi'),(820021,'红桥区',120000,'dizhi'),(820022,'东丽区',120000,'dizhi'),(820023,'西青区',120000,'dizhi'),(820024,'津南区',120000,'dizhi'),(820025,'北辰区',120000,'dizhi'),(820026,'武清区',120000,'dizhi'),(820027,'宝坻区',120000,'dizhi'),(820028,'滨海新区',120000,'dizhi'),(820029,'宁河县',120000,'dizhi'),(820030,'静海县',120000,'dizhi'),(820031,'蓟县',120000,'dizhi'),(820069,'石家庄市',130000,'dizhi'),(820070,'唐山市',130000,'dizhi'),(820071,'秦皇岛市',130000,'dizhi'),(820072,'邯郸市',130000,'dizhi'),(820073,'邢台市',130000,'dizhi'),(820074,'保定市',130000,'dizhi'),(820075,'张家口市',130000,'dizhi'),(820076,'承德市',130000,'dizhi'),(820077,'沧州市',130000,'dizhi'),(820078,'廊坊市',130000,'dizhi'),(820079,'衡水市',130000,'dizhi'),(820080,'太原市',140000,'dizhi'),(820081,'大同市',140000,'dizhi'),(820082,'阳泉市',140000,'dizhi'),(820083,'长治市',140000,'dizhi'),(820084,'晋城市',140000,'dizhi'),(820085,'朔州市',140000,'dizhi'),(820086,'晋中市',140000,'dizhi'),(820087,'运城市',140000,'dizhi'),(820088,'忻州市',140000,'dizhi'),(820089,'临汾市',140000,'dizhi'),(820090,'吕梁市',140000,'dizhi'),(820091,'呼和浩特市',150000,'dizhi'),(820092,'包头市',150000,'dizhi'),(820093,'乌海市',150000,'dizhi'),(820094,'赤峰市',150000,'dizhi'),(820095,'通辽市',150000,'dizhi'),(820096,'鄂尔多斯市',150000,'dizhi'),(820097,'呼伦贝尔市',150000,'dizhi'),(820098,'巴彦淖尔市',150000,'dizhi'),(820099,'乌兰察布市',150000,'dizhi'),(820100,'兴安盟',150000,'dizhi'),(820101,'锡林郭勒盟',150000,'dizhi'),(820102,'阿拉善盟',150000,'dizhi'),(820103,'沈阳市',210000,'dizhi'),(820104,'大连市',210000,'dizhi'),(820105,'鞍山市',210000,'dizhi'),(820106,'抚顺市',210000,'dizhi'),(820107,'本溪市',210000,'dizhi'),(820108,'丹东市',210000,'dizhi'),(820109,'锦州市',210000,'dizhi'),(820110,'营口市',210000,'dizhi'),(820111,'阜新市',210000,'dizhi'),(820112,'辽阳市',210000,'dizhi'),(820113,'盘锦市',210000,'dizhi'),(820114,'铁岭市',210000,'dizhi'),(820115,'朝阳市',210000,'dizhi'),(820116,'葫芦岛市',210000,'dizhi'),(820117,'长春市',220000,'dizhi'),(820118,'吉林市',220000,'dizhi'),(820119,'四平市',220000,'dizhi'),(820120,'辽源市',220000,'dizhi'),(820121,'通化市',220000,'dizhi'),(820122,'白山市',220000,'dizhi'),(820123,'松原市',220000,'dizhi'),(820124,'白城市',220000,'dizhi'),(820125,'延边朝鲜族自治州',220000,'dizhi'),(820126,'哈尔滨市',230000,'dizhi'),(820127,'齐齐哈尔市',230000,'dizhi'),(820128,'鸡西市',230000,'dizhi'),(820129,'鹤岗市',230000,'dizhi'),(820130,'双鸭山市',230000,'dizhi'),(820131,'大庆市',230000,'dizhi'),(820132,'伊春市',230000,'dizhi'),(820133,'佳木斯市',230000,'dizhi'),(820134,'七台河市',230000,'dizhi'),(820135,'牡丹江市',230000,'dizhi'),(820136,'黑河市',230000,'dizhi'),(820137,'绥化市',230000,'dizhi'),(820138,'大兴安岭地区',230000,'dizhi'),(820139,'市辖区',310000,'dizhi'),(820140,'南京市',320000,'dizhi'),(820141,'无锡市',320000,'dizhi'),(820142,'徐州市',320000,'dizhi'),(820143,'常州市',320000,'dizhi'),(820144,'苏州市',320000,'dizhi'),(820145,'南通市',320000,'dizhi'),(820146,'连云港市',320000,'dizhi'),(820147,'淮安市',320000,'dizhi'),(820148,'盐城市',320000,'dizhi'),(820149,'镇江市',320000,'dizhi'),(820150,'泰州市',320000,'dizhi'),(820151,'宿迁市',320000,'dizhi'),(820152,'杭州市',330000,'dizhi'),(820153,'宁波市',330000,'dizhi'),(820154,'温州市',330000,'dizhi'),(820155,'嘉兴市',330000,'dizhi'),(820156,'湖州市',330000,'dizhi'),(820157,'绍兴市',330000,'dizhi'),(820158,'金华市',330000,'dizhi'),(820159,'衢州市',330000,'dizhi'),(820160,'舟山市',330000,'dizhi'),(820161,'台州市',330000,'dizhi'),(820162,'丽水市',330000,'dizhi'),(820163,'合肥市',340000,'dizhi'),(820164,'芜湖市',340000,'dizhi'),(820165,'蚌埠市',340000,'dizhi'),(820166,'淮南市',340000,'dizhi'),(820167,'马鞍山市',340000,'dizhi'),(820168,'淮北市',340000,'dizhi'),(820169,'铜陵市',340000,'dizhi'),(820170,'安庆市',340000,'dizhi'),(820171,'黄山市',340000,'dizhi'),(820172,'滁州市',340000,'dizhi'),(820173,'阜阳市',340000,'dizhi'),(820174,'宿州市',340000,'dizhi'),(820175,'六安市',340000,'dizhi'),(820176,'亳州市',340000,'dizhi'),(820177,'池州市',340000,'dizhi'),(820178,'宣城市',340000,'dizhi'),(820179,'福州市',350000,'dizhi'),(820180,'厦门市',350000,'dizhi'),(820181,'莆田市',350000,'dizhi'),(820182,'三明市',350000,'dizhi'),(820183,'泉州市',350000,'dizhi'),(820184,'漳州市',350000,'dizhi'),(820185,'南平市',350000,'dizhi'),(820186,'龙岩市',350000,'dizhi'),(820187,'宁德市',350000,'dizhi'),(820188,'南昌市',360000,'dizhi'),(820189,'景德镇市',360000,'dizhi'),(820190,'萍乡市',360000,'dizhi'),(820191,'九江市',360000,'dizhi'),(820192,'新余市',360000,'dizhi'),(820193,'鹰潭市',360000,'dizhi'),(820194,'赣州市',360000,'dizhi'),(820195,'吉安市',360000,'dizhi'),(820196,'宜春市',360000,'dizhi'),(820197,'抚州市',360000,'dizhi'),(820198,'上饶市',360000,'dizhi'),(820199,'济南市',370000,'dizhi'),(820200,'青岛市',370000,'dizhi'),(820201,'淄博市',370000,'dizhi'),(820202,'枣庄市',370000,'dizhi'),(820203,'东营市',370000,'dizhi'),(820204,'烟台市',370000,'dizhi'),(820205,'潍坊市',370000,'dizhi'),(820206,'济宁市',370000,'dizhi'),(820207,'泰安市',370000,'dizhi'),(820208,'威海市',370000,'dizhi'),(820209,'日照市',370000,'dizhi'),(820210,'莱芜市',370000,'dizhi'),(820211,'临沂市',370000,'dizhi'),(820212,'德州市',370000,'dizhi'),(820213,'聊城市',370000,'dizhi'),(820214,'滨州市',370000,'dizhi'),(820215,'菏泽市',370000,'dizhi'),(820216,'郑州市',410000,'dizhi'),(820217,'开封市',410000,'dizhi'),(820218,'洛阳市',410000,'dizhi'),(820219,'平顶山市',410000,'dizhi'),(820220,'安阳市',410000,'dizhi'),(820221,'鹤壁市',410000,'dizhi'),(820222,'新乡市',410000,'dizhi'),(820223,'焦作市',410000,'dizhi'),(820224,'濮阳市',410000,'dizhi'),(820225,'许昌市',410000,'dizhi'),(820226,'漯河市',410000,'dizhi'),(820227,'三门峡市',410000,'dizhi'),(820228,'南阳市',410000,'dizhi'),(820229,'商丘市',410000,'dizhi'),(820230,'信阳市',410000,'dizhi'),(820231,'周口市',410000,'dizhi'),(820232,'驻马店市',410000,'dizhi'),(820233,'省直辖县级行政区划',410000,'dizhi'),(820234,'武汉市',420000,'dizhi'),(820235,'黄石市',420000,'dizhi'),(820236,'十堰市',420000,'dizhi'),(820237,'宜昌市',420000,'dizhi'),(820238,'襄阳市',420000,'dizhi'),(820239,'鄂州市',420000,'dizhi'),(820240,'荆门市',420000,'dizhi'),(820241,'孝感市',420000,'dizhi'),(820242,'荆州市',420000,'dizhi'),(820243,'黄冈市',420000,'dizhi'),(820244,'咸宁市',420000,'dizhi'),(820245,'随州市',420000,'dizhi'),(820246,'恩施土家族苗族自治州',420000,'dizhi'),(820247,'省直辖县级行政区划',420000,'dizhi'),(820248,'长沙市',430000,'dizhi'),(820249,'株洲市',430000,'dizhi'),(820250,'湘潭市',430000,'dizhi'),(820251,'衡阳市',430000,'dizhi'),(820252,'邵阳市',430000,'dizhi'),(820253,'岳阳市',430000,'dizhi'),(820254,'常德市',430000,'dizhi'),(820255,'张家界市',430000,'dizhi'),(820256,'益阳市',430000,'dizhi'),(820257,'郴州市',430000,'dizhi'),(820258,'永州市',430000,'dizhi'),(820259,'怀化市',430000,'dizhi'),(820260,'娄底市',430000,'dizhi'),(820261,'湘西土家族苗族自治州',430000,'dizhi'),(820262,'广州市',440000,'dizhi'),(820263,'韶关市',440000,'dizhi'),(820264,'深圳市',440000,'dizhi'),(820265,'珠海市',440000,'dizhi'),(820266,'汕头市',440000,'dizhi'),(820267,'佛山市',440000,'dizhi'),(820268,'江门市',440000,'dizhi'),(820269,'湛江市',440000,'dizhi'),(820270,'茂名市',440000,'dizhi'),(820271,'肇庆市',440000,'dizhi'),(820272,'惠州市',440000,'dizhi'),(820273,'梅州市',440000,'dizhi'),(820274,'汕尾市',440000,'dizhi'),(820275,'河源市',440000,'dizhi'),(820276,'阳江市',440000,'dizhi'),(820277,'清远市',440000,'dizhi'),(820278,'东莞市',440000,'dizhi'),(820279,'中山市',440000,'dizhi'),(820280,'潮州市',440000,'dizhi'),(820281,'揭阳市',440000,'dizhi'),(820282,'云浮市',440000,'dizhi'),(820283,'南宁市',450000,'dizhi'),(820284,'柳州市',450000,'dizhi'),(820285,'桂林市',450000,'dizhi'),(820286,'梧州市',450000,'dizhi'),(820287,'北海市',450000,'dizhi'),(820288,'防城港市',450000,'dizhi'),(820289,'钦州市',450000,'dizhi'),(820290,'贵港市',450000,'dizhi'),(820291,'玉林市',450000,'dizhi'),(820292,'百色市',450000,'dizhi'),(820293,'贺州市',450000,'dizhi'),(820294,'河池市',450000,'dizhi'),(820295,'来宾市',450000,'dizhi'),(820296,'崇左市',450000,'dizhi'),(820297,'海口市',460000,'dizhi'),(820298,'三亚市',460000,'dizhi'),(820299,'三沙市',460000,'dizhi'),(820300,'省直辖县级行政区划',460000,'dizhi'),(820301,'市辖区',500000,'dizhi'),(820302,'成都市',510000,'dizhi'),(820303,'自贡市',510000,'dizhi'),(820304,'攀枝花市',510000,'dizhi'),(820305,'泸州市',510000,'dizhi'),(820306,'德阳市',510000,'dizhi'),(820307,'绵阳市',510000,'dizhi'),(820308,'广元市',510000,'dizhi'),(820309,'遂宁市',510000,'dizhi'),(820310,'内江市',510000,'dizhi'),(820311,'乐山市',510000,'dizhi'),(820312,'南充市',510000,'dizhi'),(820313,'眉山市',510000,'dizhi'),(820314,'宜宾市',510000,'dizhi'),(820315,'广安市',510000,'dizhi'),(820316,'达州市',510000,'dizhi'),(820317,'雅安市',510000,'dizhi'),(820318,'巴中市',510000,'dizhi'),(820319,'资阳市',510000,'dizhi'),(820320,'阿坝藏族羌族自治州',510000,'dizhi'),(820321,'甘孜藏族自治州',510000,'dizhi'),(820322,'凉山彝族自治州',510000,'dizhi'),(820323,'贵阳市',520000,'dizhi'),(820324,'六盘水市',520000,'dizhi'),(820325,'遵义市',520000,'dizhi'),(820326,'安顺市',520000,'dizhi'),(820327,'毕节市',520000,'dizhi'),(820328,'铜仁市',520000,'dizhi'),(820329,'黔西南布依族苗族自治州',520000,'dizhi'),(820330,'黔东南苗族侗族自治州',520000,'dizhi'),(820331,'黔南布依族苗族自治州',520000,'dizhi'),(820332,'昆明市',530000,'dizhi'),(820333,'曲靖市',530000,'dizhi'),(820334,'玉溪市',530000,'dizhi'),(820335,'保山市',530000,'dizhi'),(820336,'丽江市',530000,'dizhi'),(820337,'普洱市',530000,'dizhi'),(820338,'临沧市',530000,'dizhi'),(820339,'楚雄彝族自治州',530000,'dizhi'),(820340,'红河哈尼族彝族自治州',530000,'dizhi'),(820341,'文山壮族苗族自治州',530000,'dizhi'),(820342,'西双版纳傣族自治州',530000,'dizhi'),(820343,'大理白族自治州',530000,'dizhi'),(820344,'德宏傣族景颇族自治州',530000,'dizhi'),(820345,'怒江傈僳族自治州',530000,'dizhi'),(820346,'迪庆藏族自治州',530000,'dizhi'),(820347,'拉萨市',540000,'dizhi'),(820348,'日喀则市',540000,'dizhi'),(820349,'昌都地区',540000,'dizhi'),(820350,'山南地区',540000,'dizhi'),(820351,'那曲地区',540000,'dizhi'),(820352,'阿里地区',540000,'dizhi'),(820353,'林芝地区',540000,'dizhi'),(820354,'西安市',610000,'dizhi'),(820355,'铜川市',610000,'dizhi'),(820356,'宝鸡市',610000,'dizhi'),(820357,'咸阳市',610000,'dizhi'),(820358,'渭南市',610000,'dizhi'),(820359,'延安市',610000,'dizhi'),(820360,'汉中市',610000,'dizhi'),(820361,'榆林市',610000,'dizhi'),(820362,'安康市',610000,'dizhi'),(820363,'商洛市',610000,'dizhi'),(820364,'兰州市',620000,'dizhi'),(820365,'嘉峪关市',620000,'dizhi'),(820366,'金昌市',620000,'dizhi'),(820367,'白银市',620000,'dizhi'),(820368,'天水市',620000,'dizhi'),(820369,'武威市',620000,'dizhi'),(820370,'张掖市',620000,'dizhi'),(820371,'平凉市',620000,'dizhi'),(820372,'酒泉市',620000,'dizhi'),(820373,'庆阳市',620000,'dizhi'),(820374,'定西市',620000,'dizhi'),(820375,'陇南市',620000,'dizhi'),(820376,'临夏回族自治州',620000,'dizhi'),(820377,'甘南藏族自治州',620000,'dizhi'),(820378,'西宁市',630000,'dizhi'),(820379,'海东市',630000,'dizhi'),(820380,'海北藏族自治州',630000,'dizhi'),(820381,'黄南藏族自治州',630000,'dizhi'),(820382,'海南藏族自治州',630000,'dizhi'),(820383,'果洛藏族自治州',630000,'dizhi'),(820384,'玉树藏族自治州',630000,'dizhi'),(820385,'海西蒙古族藏族自治州',630000,'dizhi'),(820386,'银川市',640000,'dizhi'),(820387,'石嘴山市',640000,'dizhi'),(820388,'吴忠市',640000,'dizhi'),(820389,'固原市',640000,'dizhi'),(820390,'乌鲁木齐市',650000,'dizhi'),(820391,'克拉玛依市',650000,'dizhi'),(820392,'吐鲁番地区',650000,'dizhi'),(820393,'哈密地区',650000,'dizhi'),(820394,'昌吉回族自治州',650000,'dizhi'),(820395,'博尔塔拉蒙古自治州',650000,'dizhi'),(820396,'巴音郭楞蒙古自治州',650000,'dizhi'),(820397,'阿克苏地区',650000,'dizhi'),(820398,'克孜勒苏柯尔克孜自治州',650000,'dizhi'),(820399,'喀什地区',650000,'dizhi'),(820400,'和田地区',650000,'dizhi'),(820401,'伊犁哈萨克自治州',650000,'dizhi'),(820402,'塔城地区',650000,'dizhi'),(820403,'阿勒泰地区',650000,'dizhi'),(820404,'自治区直辖县级行政区划',650000,'dizhi');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(10) DEFAULT NULL COMMENT '公司名称',
  `position` varchar(10) DEFAULT NULL COMMENT '公司职位',
  `sheng` varchar(10) DEFAULT NULL COMMENT '办公省',
  `city` varchar(10) DEFAULT NULL COMMENT '办公市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`id`,`userid`,`name`,`position`,`sheng`,`city`) values (1,19,NULL,'采购经理1','安徽省','安抚市'),(7,24,'11SD','11',NULL,NULL),(8,25,'asdsa','采购经理',NULL,NULL),(15,18,'DFSS','SFD ',NULL,NULL);

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

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `ctypeno` int(11) DEFAULT NULL,
  `cname` varchar(200) DEFAULT NULL,
  `cmoney` double DEFAULT NULL,
  `ctiao` int(11) DEFAULT NULL,
  `cqixian` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `dictionary` */

insert  into `dictionary`(`cid`,`ctypeno`,`cname`,`cmoney`,`ctiao`,`cqixian`) values (1,0,'7日会员',0,20,NULL),(2,1,'高级会员',500,20,NULL),(3,2,'白金会员',100,50,NULL),(4,3,'钻石会员',2000,100,NULL);

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

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`url`,`parent_id`,`level`) values (1,'招标管理',NULL,0,1),(2,'产品管理',NULL,0,1),(3,'轮播管理',NULL,0,1),(4,'订单管理',NULL,0,1),(5,'分类管理','',0,1),(6,'评论管理',NULL,0,1),(7,'会员管理',NULL,0,1),(8,'管理员管理',NULL,0,1),(9,'系统统计',NULL,0,1),(10,'系统设置',NULL,0,1),(19,'招标列表','/zhaobiaoListPage',1,2),(20,'删除问题',NULL,1,2),(21,'产品列表',NULL,2,2),(22,'品牌管理',NULL,2,2),(23,'类型管理',NULL,2,2),(24,'类型属性',NULL,2,2),(25,'轮播列表',NULL,3,2),(26,'订单列表',NULL,4,2),(27,'分类列表','/categoryPage',5,2),(28,'评论列表',NULL,6,2),(29,'意见反馈',NULL,6,2),(30,'会员列表','/memberListPage',7,2),(31,'删除会员','/memberDelPage',7,2),(32,'等级管理','/memberLevelPage',7,2),(33,'积分管理','/memberKissPage',7,2),(34,'浏览记录','/memberViewPage',7,2),(35,'分享记录','/memberViewPage',7,2),(36,'拆线图',NULL,9,2),(37,'柱状图',NULL,9,2),(38,'地图',NULL,9,2),(39,'饼图',NULL,9,2),(40,'雷达图',NULL,9,2),(41,'k线图',NULL,9,2),(42,'热力图',NULL,9,2),(43,'仪表图',NULL,9,2),(44,'更多案例',NULL,9,2),(45,'系统设置',NULL,10,2),(46,'数字字典',NULL,10,2),(47,'屏蔽词',NULL,10,2),(48,'系统日志',NULL,10,2),(49,'友情链接',NULL,10,2),(50,'第三方登陆',NULL,10,2),(51,'管理员列表','/adminListPage',8,2),(52,'角色管理','/adminRolePage',8,2),(53,'权限管理','/adminMenuPage',8,2);

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

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`comment`) values (1,'超级管理员','至高无上的权限1'),(10,'测试管理员','没有管理员管理权限');

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

/*Data for the table `role_menu` */

insert  into `role_menu`(`id`,`role_id`,`menu_id`) values (64,10,27),(153,1,19),(154,1,27),(155,1,30),(156,1,32),(157,1,51),(158,1,52),(159,1,53);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(10) DEFAULT NULL,
  `uname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(10) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `phone` varchar(222) DEFAULT NULL COMMENT '电话',
  `businessobject_id` int(11) DEFAULT NULL COMMENT '业务对象id(填写这个，会推荐适合的项目及合作人脉)',
  `email` varchar(200) DEFAULT NULL,
  `dengji` int(3) DEFAULT NULL COMMENT '会员等级',
  `umoney` float DEFAULT NULL,
  `usertime` date DEFAULT NULL,
  `dengjiover` int(11) DEFAULT NULL COMMENT '会员权限判断',
  `tiaoshu` int(5) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`zhanghao`,`uname`,`password`,`company_id`,`phone`,`businessobject_id`,`email`,`dengji`,`umoney`,`usertime`,`dengjiover`,`tiaoshu`,`login`) values (18,'wangxiao2','aaaa','111111',NULL,'13231339879',NULL,'455@qq.com',2,23500,'2019-03-03',0,0,'2018-12-08 15:26:39'),(24,'aaaaaa','gggw','123456789',NULL,'13231339879',NULL,'13231339879',0,100,'2018-12-10',0,0,'2018-12-08 15:26:42'),(27,NULL,'111111','123123',NULL,'15831810656',NULL,'wqe@163.com',NULL,NULL,NULL,NULL,NULL,'2018-12-29 13:27:11'),(28,'123456','123456','111111',NULL,'15831810656',NULL,'sd@163.com',NULL,NULL,NULL,NULL,NULL,'2018-12-09 13:27:14'),(29,'21312323','123123','111111',NULL,'15831810656',NULL,'sdd@163.com',NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-07 13:27:17');

/*Table structure for table `user_privilege` */

DROP TABLE IF EXISTS `user_privilege`;

CREATE TABLE `user_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `user_privilege` */

insert  into `user_privilege`(`id`,`user_id`,`menu_id`) values (23,4,0),(24,3,1),(30,5,10),(31,6,1),(32,7,10),(39,1,0);

/*Table structure for table `xiaofei` */

DROP TABLE IF EXISTS `xiaofei`;

CREATE TABLE `xiaofei` (
  `xid` int(11) NOT NULL AUTO_INCREMENT,
  `dingdanhao` char(200) NOT NULL,
  `createtime` date NOT NULL,
  `cmoney` char(200) NOT NULL,
  `stic` int(2) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`xid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `xiaofei` */

insert  into `xiaofei`(`xid`,`dingdanhao`,`createtime`,`cmoney`,`stic`,`id`) values (1,'20181121141845135','2018-11-21','200.00',1,18),(2,'20181121142839470','2018-11-21','200.00',1,0),(3,'20181121143024831','2018-11-21','200.00',1,0),(4,'20181121143319496','2018-11-21','200.00',1,18),(5,'20181121143740142','2018-11-21','200.00',1,20),(6,'20181121161821954','2018-11-21','200.00',1,18),(7,'20181121191712672','2018-11-21','200.00',1,18),(8,'2018112211471117','2018-11-22','200.00',1,18),(9,'2018112684522129','2018-11-26','200.00',1,18),(10,'2018112695151932','2018-11-26','200.00',1,18),(11,'2018112617134768','2018-11-26','200.00',1,18),(12,'20181126172046758','2018-11-26','200.00',1,18),(13,'2018112617224191','2018-11-26','20000.00',1,18),(14,'20181130151549550','2018-11-30','200.00',1,18),(15,'2018123191052918','2018-12-03','100.00',1,18),(16,'2018123192533574','2018-12-03','2000.00',1,18),(17,'201812319309317','2018-12-03','100.00',1,18),(18,'201812319338509','2018-12-03','100.00',1,18),(19,'2018124201444501','2018-12-04','2000.00',1,25),(20,'2018124202448972','2018-12-04','2000.00',1,25),(21,'201812420272968','2018-12-04','100.00',1,25),(22,'2018125183641709','2018-12-05','100.00',1,18),(23,'2018125183752268','2018-12-05','100.00',1,18),(24,'2018125184028820','2018-12-05','100.00',1,18),(25,'201812518430843','2018-12-05','100.00',1,18);

/*Table structure for table `zhaobiao` */

DROP TABLE IF EXISTS `zhaobiao`;

CREATE TABLE `zhaobiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhaobiao_number` varchar(10) DEFAULT NULL COMMENT '招标编号',
  `zhaobiaoren` varchar(10) DEFAULT NULL COMMENT '招标人      （游客不可看）',
  `title` varchar(50) DEFAULT NULL COMMENT '招标主题',
  `money_source` int(11) DEFAULT NULL COMMENT '资金来源(链接资金来源表)  （游客不可看）',
  `release_date` date DEFAULT NULL COMMENT '信息发布时间',
  `content` text COMMENT '招标主题内容',
  `money` varchar(10) DEFAULT NULL COMMENT '投资金额  （游客不可看）',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话  （游客不可看）',
  `zhaobiao_type` varchar(11) DEFAULT NULL COMMENT '招标阶段(链接分类表)',
  `zhaobiao_hangye` int(11) DEFAULT NULL COMMENT '招标行业(链接分类表)',
  `sheng_address` int(11) DEFAULT NULL COMMENT '省地址(链接分类表)',
  `city_address` int(11) DEFAULT NULL COMMENT '市地址(链接分类表)',
  `fenlei_2` int(2) DEFAULT NULL COMMENT '分类2',
  `user_id` int(3) DEFAULT NULL COMMENT '用户id',
  `zhaobiao_daili` varchar(11) DEFAULT NULL COMMENT '招标代理',
  `name` varchar(11) DEFAULT NULL COMMENT '联系人姓名',
  `zbgg` text COMMENT '中标公告',
  `zbbm` varchar(11) DEFAULT NULL COMMENT '中标编码',
  `cs` varchar(11) DEFAULT '0' COMMENT '点击次数',
  `jzrq` date DEFAULT NULL,
  `zhuangtai` int(11) DEFAULT '1',
  `zbgs` text,
  `Submission` date DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `zhaobiao` */

insert  into `zhaobiao`(`id`,`zhaobiao_number`,`zhaobiaoren`,`title`,`money_source`,`release_date`,`content`,`money`,`phone`,`zhaobiao_type`,`zhaobiao_hangye`,`sheng_address`,`city_address`,`fenlei_2`,`user_id`,`zhaobiao_daili`,`name`,`zbgg`,`zbbm`,`cs`,`jzrq`,`zhuangtai`,`zbgs`,`Submission`) values (1,'3838438','王强','就是舔',516,'2018-03-23','<p>\r\n	<span background-color:=\"\" microsoft=\"\" style=\"color: rgb(51, 51, 51); font-family: \">招标代理公司（********） 受业主单位（********） 委托，于</span><span background-color:=\"\" microsoft=\"\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: \">2018-12-03</span><span background-color:=\"\" microsoft=\"\" style=\"color: rgb(51, 51, 51); font-family: \">在采购与招标网发布&nbsp;</span><span background-color:=\"\" microsoft=\"\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: \">中央司法警官学院审计处招标采购工程造价咨询审计服务入围项目竞争性磋商采购公告。</span><span background-color:=\"\" microsoft=\"\" style=\"color: rgb(51, 51, 51); font-family: \">现邀请全国供应商参与投标，有意向的单位请及时联系项目联系人参与投标。 采购项目：中央X审计处X造价咨询审计服务入围项目采购项目编号XXFWZBX采购人名称：中央X采购人联系方式：高老师联系电话X-X采购代理机构全称：X采购代XXX号采购代理机构负责人：X理机构联系方式：张帅、吴学军电话X-X采购内容：审计处X造价咨询审计服务入围采购方式：竞争性磋商项目实施地点：中央X服务期限X年投标人的资格要求：（1）具备独立法人资格及有效的营业执照（营业执照体现相关范围）；（2）投标供应X造价咨询乙级及以上资质；（3）近三年内，在经营活动中没有重大违法记录的声明函（格式自拟）；（4）投标单位未被列入政府采购严X截图证明）；（4）通X站X的查询。报名及磋商文件发售时间X年X月3日~X月7日（上午9X-XX，下午XX-XX）磋商文XXXXX西）X室磋商文件发售方式：有意向的投标申请人请携带法定代表人授权委托书、委托代理人身份证、营业执照、资质证书、近三年内，在经营活动中没有重大违法记录的声明函、违法失信行为记录名单截图、信用中国查询截图，以上原件及加盖公章复印件一套，报名并领取磋商文件。磋商文件售价X套投标截止时间X年X月X日XX开标时间X年X月X日XX会议室。项目联系人：X军联系方式X-X、中国采购与</span><a background-color:=\"\" href=\"https://www.chinabidding.cn/\" microsoft=\"\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: blue; outline: 0px; font-family: \" target=\"_blank\">招标</a><span background-color:=\"\" microsoft=\"\" style=\"color: rgb(51, 51, 51); font-family: \">网XXXXXXX</span></p>\r\n','8888','17603260042','820417',6,440000,820262,58,NULL,'强强科技','师泽华',NULL,NULL,'2','2018-03-23',NULL,NULL,'2018-12-05'),(2,'10000002','王晓龙','大幅度的',514,'2018-08-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','1','15631199396','820417',7,97,130000,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,'2018-12-05'),(3,'10000003','王晓龙','阿斯顿发射点',516,'2018-08-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','2','15631199396','820417',9,176,140000,NULL,NULL,NULL,NULL,NULL,NULL,'45',NULL,NULL,NULL,'2018-12-05'),(4,'10000004','王晓龙','广泛广泛共识是官方',515,'2018-11-19','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','3','15631199396','820417',6,58,120000,NULL,NULL,NULL,NULL,NULL,NULL,'525',NULL,NULL,NULL,'2018-12-05'),(5,'10000005','王晓龙','打法的说法上的',515,'2018-11-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','3','15631199396','820417',7,97,130000,NULL,NULL,NULL,NULL,NULL,NULL,'4',NULL,NULL,NULL,'2018-12-05'),(6,'10000006','王晓龙','更好更好的',514,'2018-11-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','5','15631199396','820417',8,136,140000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(7,'10000007','王晓龙','双方的敢死队风格',514,'2018-10-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','6','15631199396','820417',9,176,130000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(8,'10000008','王晓龙','萨尔特瑞特',514,'2018-03-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','7','15631199396','820417',15,425,350000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(9,'10000009','王晓龙','士大夫赶紧干活吧',514,'2018-10-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','8','15631199396','820417',14,391,430000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(10,'10000010','王晓龙','房地产',514,'2018-08-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','2','15631199396','820417',7,97,370000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(11,'10000011','王晓龙','电力',514,'2018-09-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','3','15631199396','820417',9,193,640000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(12,'10000012','王晓龙','种植',514,'2018-10-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','4','15631199396','820417',13,350,150000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(13,'10000013','王晓龙','吃饭',514,'2018-02-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','5','15631199396','820417',14,412,320000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(14,'10000014','王晓龙','道路',514,'2018-05-01','却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法却认为打法的说法','32','15631199396','820417',5,16,410000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(15,'10000015','王晓龙','修理',514,'2018-08-01','阿凡达撒手动阀第三方','3','15631199396','820417',14,391,420000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(16,'10000016','王晓龙','风车',514,'2018-08-01','阿凡达撒手动阀第三方','32','15631199396','820417',6,61,110000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(17,'10000017','王晓龙','污水',514,'2018-08-01','阿凡达撒手动阀第三方','23','15631199396','820417',10,233,120000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(18,'10000018','王晓龙','矿山',516,'2018-08-01','阿凡达撒手动阀第三方','324','15631199396','820417',12,308,370000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(19,'10000019','王晓龙','提水',514,'2018-08-01','阿凡达撒手动阀第三方','324','15631199396','820417',8,142,420000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(20,'10000020','王晓龙','提水',514,'2018-08-01','阿凡达撒手动阀第三方','34','15631199396','820417',8,142,440000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(22,'10000021','王晓龙','环保',514,'2018-08-01','阿凡达撒手动阀第三方','32','15631199396','820417',10,233,310000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(23,'10000022','王晓龙','广告',514,'2018-08-01','阿凡达撒手动阀第三方','32','15631199396','820417',14,400,140000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(25,'10000023','王晓龙','移动',514,'2018-08-01','阿凡达撒手动阀第三方','34','15631199396','820417',11,267,330000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(26,'10000024','王晓龙','养殖',514,'2018-08-01','阿凡达撒手动阀第三方','3442','15631199396','820417',13,366,130000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(27,'10000025','王晓龙','农田灌溉',514,'2018-08-01','阿凡达撒手动阀第三方','34','15631199396','820417',8,136,440000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(28,'1','1','1',515,'2015-08-01','擦的身份','1','1','820418',6,58,120000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(29,'1','1','1',515,'2015-08-01','擦的身份','1','1','820418',6,58,120000,820016,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-05'),(31,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	发布招标信息、</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息</p>\r\n','7777','17603260042',NULL,6,440000,820262,58,1,'强强科技','师泽华','<p>\n	操你大爷的</p>',NULL,'0','2018-03-23',2,'招标代理公司（********） 受业主单位（********） 委托的项目评审工作已圆满结束，于2018-11-28在采购与招标网发布 安阳市殷都区2018年省级水土保持财政资金项目施工中标公示，现将成交供应商名单公告。 委托，就施工项目按规定程序进行公开招标，现就本次招标的中标结果公布如下： 一、项目信息 　　项目名称：施工 项目编号：HNTY-X-X 资金来源： 控制价：X.6X 二、评审信息 　　评标日期：2X8年X月X日 　　评标地点： 　 评审专家小成员：靳巧玲、牛广伟、户和国、申艳荣、李洪斌 三、中标信息 统一社会信用代码：XM 中标金额：X.XX 质量：合格 工期：X日历天 四、中标公示媒体 本次中标公示在《中国采购与招标网》、《河南招标采购综合网》上发布。 五、结果公示期限 　　自本公示发布之日起3个工作日。 六、本次招标联系事项 招 标 人： 联 系 人：Xn>苏先生 联系电话：X-X 招标代理机X 联 系 人：Xn>张先生 联系电话：X 水行政监督部门： 联系电话：X—X 各有关当事人对成交结果有异议的，可以在结果公示期满后三个工作日内，以书面形式同时向招标人和招标代理机构提出质疑(法人签字盖章并加盖单位公章)，由法定代表人或其授权代表携带营业执照副本（原件）及本人身份证（原件）一并提交（邮寄、传真件等不予受理），逾期未提交或未按照要求提交的质疑函将不予受理。','2018-12-05'),(32,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	发布招标信息、</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息</p>\r\n','8888','17603260042',NULL,6,440000,820262,58,1,'强强科技','师泽华','',NULL,'0','2018-03-23',2,'','2018-12-05'),(33,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	发布招标信息、</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息发布招标信息</p>\r\n<p>\r\n	发布招标信息</p>\r\n','8888','17603260042',NULL,6,440000,820262,58,1,'强强科技','师泽华',NULL,NULL,'0','2018-03-23',2,NULL,'2018-12-05'),(34,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	a</p>\r\n<p>\r\n	a</p>\r\n<p>\r\n	a</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	aa</p>\r\n<p>\r\n	&nbsp;</p>\r\n','8888','17603260042',NULL,6,420000,820234,58,1,'强强科技','师泽华','<p>\n	啊</p>',NULL,'0','2018-03-23',4,'招标代理公司（********） 受业主单位（********） 委托的项目评审工作已圆满结束，于2018-11-28在采购与招标网发布 安阳市殷都区2018年省级水土保持财政资金项目施工中标公示，现将成交供应商名单公告。 委托，就施工项目按规定程序进行公开招标，现就本次招标的中标结果公布如下： 一、项目信息 　　项目名称：施工 项目编号：HNTY-X-X 资金来源： 控制价：X.6X 二、评审信息 　　评标日期：2X8年X月X日 　　评标地点： 　 评审专家小成员：靳巧玲、牛广伟、户和国、申艳荣、李洪斌 三、中标信息 统一社会信用代码：XM 中标金额：X.XX 质量：合格 工期：X日历天 四、中标公示媒体 本次中标公示在《中国采购与招标网》、《河南招标采购综合网》上发布。 五、结果公示期限 　　自本公示发布之日起3个工作日。 六、本次招标联系事项 招 标 人： 联 系 人：Xn>苏先生 联系电话：X-X 招标代理机X 联 系 人：Xn>张先生 联系电话：X 水行政监督部门： 联系电话：X—X 各有关当事人对成交结果有异议的，可以在结果公示期满后三个工作日内，以书面形式同时向招标人和招标代理机构提出质疑(法人签字盖章并加盖单位公章)，由法定代表人或其授权代表携带营业执照副本（原件）及本人身份证（原件）一并提交（邮寄、传真件等不予受理），逾期未提交或未按照要求提交的质疑函将不予受理。','2018-12-05'),(35,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	就是舔</p>\r\n','8888','17603260042',NULL,6,460000,820297,60,1,'枸杞吧','师泽华',NULL,NULL,'0','2018-03-23',1,NULL,'2018-12-05'),(36,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	就是舔</p>\r\n','8888','17603260042',NULL,7,140000,820080,97,1,'枸杞吧','师泽华',NULL,NULL,'0','2018-03-23',1,NULL,'2018-12-05'),(37,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	啊啊啊啊啊啊啊啊啊啊啊啊啊</p>\r\n','8888','17603260042',NULL,6,440000,820262,58,1,'枸杞吧','师泽华',NULL,NULL,'0','2018-03-23',1,NULL,'2018-12-05'),(38,'3838438','王强','就是舔',NULL,'2018-03-23','<p>\r\n	9999</p>\r\n','99999','17603260042',NULL,6,430000,820248,58,1,'强强科技','师泽华',NULL,NULL,'0','2018-03-23',1,NULL,'2018-12-05'),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
