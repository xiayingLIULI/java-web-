/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2022-05-16 23:42:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `begintime` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '奔迈680', '新低价', '2009-10-09 00:00:00', 'GreetWall');
INSERT INTO `news` VALUES ('2', '奔迈pre', '新宠', '2012-01-10 00:00:00', 'dmy');
INSERT INTO `news` VALUES ('3', 'NokiaE71', '经典', '2012-04-09 00:00:00', 'juk');
INSERT INTO `news` VALUES ('4', 'NokiaE66', '女白领最爱', '2012-09-07 00:00:00', 'abc');
