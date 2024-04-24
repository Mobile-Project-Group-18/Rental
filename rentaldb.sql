/*
Navicat MySQL Data Transfer

Source Server         : mydata
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : rentaldb

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2024-04-19 11:08:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for applymsg
-- ----------------------------
DROP TABLE IF EXISTS `applymsg`;
CREATE TABLE `applymsg` (
  `applyId` int(50) NOT NULL AUTO_INCREMENT,
  `applyUserId` varchar(100) DEFAULT NULL,
  `applyUserName` varchar(255) DEFAULT NULL,
  `applyHouseId` varchar(100) DEFAULT NULL,
  `applyHouseName` varchar(255) DEFAULT NULL,
  `applyHouseMoney` varchar(255) DEFAULT NULL,
  `applyHouseUserId` varchar(100) DEFAULT NULL,
  `applyTime` varchar(100) DEFAULT NULL,
  `applyState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`applyId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applymsg
-- ----------------------------
INSERT INTO `applymsg` VALUES ('9', '23', 'pan zhenni', '38', 'APT. A', '1000', '17', '2024-04-19 05:56', '2');
INSERT INTO `applymsg` VALUES ('10', '23', 'pan zhenni', '40', 'APT. B', '800', '17', '2024-04-19 05:57', '3');
INSERT INTO `applymsg` VALUES ('11', '23', 'pan zhenni', '40', 'APT. B', '800', '17', '2024-04-19 05:58', '3');

-- ----------------------------
-- Table structure for housemsg
-- ----------------------------
DROP TABLE IF EXISTS `housemsg`;
CREATE TABLE `housemsg` (
  `houseId` int(50) NOT NULL AUTO_INCREMENT,
  `houseName` varchar(100) NOT NULL,
  `houseMoney` int(100) NOT NULL,
  `housePhone` varchar(100) NOT NULL,
  `houseMessage` varchar(100) NOT NULL,
  `houseImage` varchar(500) NOT NULL,
  `houseCreatime` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `houseState` varchar(50) NOT NULL,
  `houseCategory` varchar(100) NOT NULL,
  `houseCategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`houseId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of housemsg
-- ----------------------------
INSERT INTO `housemsg` VALUES ('38', 'APT. A', '1000', '15249243002', 'a nice apartment', '47a8390db83685f6.jpg', '2024-04-16 14:02', '17', '1', '8', null);
INSERT INTO `housemsg` VALUES ('39', 'hostel', '800', '15249241234', 'come and have a look', 'f2c497d0e46743c.jpg', '2024-04-16 14:04', '17', '1', '8', null);
INSERT INTO `housemsg` VALUES ('40', 'APT. B', '800', '15249245656', 'a cozy place', '-57d96d65d69c5253.jpg', '2024-04-16 17:18', '17', '1', '9', null);
INSERT INTO `housemsg` VALUES ('41', 'house', '1500', '15249242080', 'a nice hotel', '-536dd72de1f920cb.jpg', '2024-04-16 17:23', '17', '1', '11', null);

-- ----------------------------
-- Table structure for newsmessage
-- ----------------------------
DROP TABLE IF EXISTS `newsmessage`;
CREATE TABLE `newsmessage` (
  `newsId` int(100) NOT NULL AUTO_INCREMENT,
  `newsTitle` varchar(255) DEFAULT NULL,
  `newsContent` varchar(500) DEFAULT NULL,
  `newsTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsmessage
-- ----------------------------
INSERT INTO `newsmessage` VALUES ('31', '', '', '');
INSERT INTO `newsmessage` VALUES ('32', '', '', '');
INSERT INTO `newsmessage` VALUES ('33', '', '', '');
INSERT INTO `newsmessage` VALUES ('34', '', '', '');
INSERT INTO `newsmessage` VALUES ('35', '', '', '');
INSERT INTO `newsmessage` VALUES ('36', '', '', '');

-- ----------------------------
-- Table structure for typemsg
-- ----------------------------
DROP TABLE IF EXISTS `typemsg`;
CREATE TABLE `typemsg` (
  `typeId` int(50) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) DEFAULT NULL,
  `typeTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typemsg
-- ----------------------------
INSERT INTO `typemsg` VALUES ('8', 'one living room with one bedroom', '2024-03-29 11:06');
INSERT INTO `typemsg` VALUES ('9', 'one living room with one bedroom', '2024-03-29 11:06');
INSERT INTO `typemsg` VALUES ('10', 'two living rooms with two bedrooms', '2024-03-29 11:06');
INSERT INTO `typemsg` VALUES ('11', 'one living room with three bedrooms', '2024-03-29 11:06');
INSERT INTO `typemsg` VALUES ('12', 'one living room with four bedrooms', '2024-03-29 11:07');
INSERT INTO `typemsg` VALUES ('13', 'three living room with five bedrooms', '2024-03-29 18:30');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(50) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `uphone` varchar(100) NOT NULL,
  `upswd` varchar(100) NOT NULL,
  `utime` varchar(100) NOT NULL,
  `utype` varchar(255) DEFAULT NULL,
  `applyTypeId` varchar(100) DEFAULT NULL,
  `applyTypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('17', 'wang kui', '123', '123', '2024-3-23 11:00', '1', null, null);
INSERT INTO `user` VALUES ('23', 'pan zhenni', '1234', '1234', '2024-04-19 04:04', '2', '8', 'one living room with one bedroom');
