/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : cj

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2022-05-13 19:12:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `number` int(20) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `result` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('1001', '大学英语', '80');
INSERT INTO `result` VALUES ('1001', '计算机应用基础', '95');
INSERT INTO `result` VALUES ('1001', 'JSP动态Web开发技术', '90');
INSERT INTO `result` VALUES ('1002', '大学英语', '81');
INSERT INTO `result` VALUES ('1002', '计算机应用基础', '100');
