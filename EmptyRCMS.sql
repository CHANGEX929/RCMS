/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.27 : Database - mydiningroom
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydiningroom` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydiningroom`;

/*Table structure for table `desk` */

DROP TABLE IF EXISTS `desk`;

CREATE TABLE `desk` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '桌位id',
  `deskCode` varchar(50) NOT NULL COMMENT '桌位编号',
  `status` int(10) NOT NULL COMMENT '1：空 2：点菜未买单',
  `peopleNum` int(10) DEFAULT '0' COMMENT '人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `desk` */

/*Table structure for table `deskbill` */

DROP TABLE IF EXISTS `deskbill`;

CREATE TABLE `deskbill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账单id',
  `deskID` int(10) DEFAULT NULL COMMENT '账单对应的桌位ID',
  `billCode` varchar(50) DEFAULT NULL COMMENT '账单编号',
  `totalMoney` decimal(20,2) DEFAULT '0.00' COMMENT '消费总计',
  `peopleNum` int(10) DEFAULT '0' COMMENT '消费人数',
  `discount` decimal(10,1) DEFAULT '0.0' COMMENT '消费折扣',
  `createDate` datetime DEFAULT NULL COMMENT '消费时间',
  `debtor` varchar(50) DEFAULT NULL COMMENT '挂账人',
  `payType` int(10) DEFAULT NULL COMMENT '结账方式：1.微信2.支付宝3.刷卡4.现金5.挂账',
  `beforeMoney` decimal(20,2) DEFAULT '0.00' COMMENT '折扣前总计',
  `deskCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deskbill` */

/*Table structure for table `deskbill_detail` */

DROP TABLE IF EXISTS `deskbill_detail`;

CREATE TABLE `deskbill_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账单详情ID',
  `deskBillID` int(10) DEFAULT NULL COMMENT '账单ID',
  `dishName` varchar(50) DEFAULT NULL COMMENT '菜品名',
  `dishNum` int(10) DEFAULT NULL COMMENT '菜品数目',
  `cost` decimal(20,2) DEFAULT NULL COMMENT '小计',
  `content` varchar(50) DEFAULT NULL COMMENT '菜品备注',
  `price` double(20,2) DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deskbill_detail` */

/*Table structure for table `dish` */

DROP TABLE IF EXISTS `dish`;

CREATE TABLE `dish` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
  `dishName` varchar(50) DEFAULT NULL COMMENT '菜品名字',
  `price` decimal(20,2) DEFAULT NULL COMMENT '菜品单价',
  `type` int(10) DEFAULT NULL COMMENT '菜品类型1:汤，2：炒菜,3:酒水，4：其它',
  `stock` int(10) DEFAULT NULL COMMENT '菜品库存',
  `fileName` varchar(100) DEFAULT NULL COMMENT '图片名',
  `drinkBillID` int(10) DEFAULT NULL COMMENT '进货ID',
  `drinkBillCode` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dish` */

/*Table structure for table `drink_sell_bill` */

DROP TABLE IF EXISTS `drink_sell_bill`;

CREATE TABLE `drink_sell_bill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '销售信息id',
  `drinkbillID` int(10) DEFAULT NULL COMMENT '对应的酒水进货信息id',
  `sellCount` int(10) DEFAULT NULL COMMENT '销售数目',
  `sellPrice` decimal(20,2) DEFAULT NULL COMMENT '销售单价',
  `DrinkBillCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `drink_sell_bill` */

/*Table structure for table `drinkbill` */

DROP TABLE IF EXISTS `drinkbill`;

CREATE TABLE `drinkbill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '进货信息id',
  `drinbillCode` varchar(100) NOT NULL COMMENT '订单编号',
  `productName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `proCount` int(10) DEFAULT NULL COMMENT '商品数目',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) DEFAULT NULL COMMENT '创建人',
  `providerID` int(10) DEFAULT NULL COMMENT '供应商ID',
  `totalCost` decimal(20,2) DEFAULT NULL COMMENT '订单总价',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品单价',
  `isPay` int(5) DEFAULT '0' COMMENT '是否付款1未付款2已付款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `drinkbill` */

/*Table structure for table `provider` */

DROP TABLE IF EXISTS `provider`;

CREATE TABLE `provider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `proName` varchar(50) DEFAULT NULL COMMENT '供应商名',
  `product` varchar(50) DEFAULT NULL COMMENT '主要供应商品',
  `telNumber` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `contact` varchar(50) DEFAULT NULL COMMENT '主要联系人',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系人手机号码',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `createDate` datetime DEFAULT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `provider` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userCode` varchar(50) NOT NULL COMMENT '用户账号',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `userPassWord` varchar(50) NOT NULL COMMENT '用户密码',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户手机号码',
  `identity` varchar(50) DEFAULT NULL COMMENT '用户身份证号码',
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userCode`,`userName`,`userPassWord`,`phone`,`identity`,`createDate`) values (1,'admin','小明','123456X','13333333333','111111111111111111','2018-05-07 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
