/*
Navicat MySQL Data Transfer

Source Server         : ddd
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : zs

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2022-02-14 09:36:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_goods`
-- ----------------------------
DROP TABLE IF EXISTS `s_goods`;
CREATE TABLE `s_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(30) NOT NULL COMMENT '商品名',
  `price` double(30,2) NOT NULL COMMENT '商品单价',
  `repertory` int(11) NOT NULL COMMENT '商品库存',
  `type` int(11) NOT NULL,
  `g_delete` int(11) NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_goods
-- ----------------------------
INSERT INTO `s_goods` VALUES ('1', '传颂之物_斩2', '320.50', '20', '1', '1');
INSERT INTO `s_goods` VALUES ('2', '风花雪月', '420.50', '35', '1', '1');
INSERT INTO `s_goods` VALUES ('3', '123', '100.00', '479', '1', '1');
INSERT INTO `s_goods` VALUES ('4', '33', '3.00', '3', '1', '1');

-- ----------------------------
-- Table structure for `s_good_record`
-- ----------------------------
DROP TABLE IF EXISTS `s_good_record`;
CREATE TABLE `s_good_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) NOT NULL COMMENT '出/入 out出in入',
  `uid` int(11) NOT NULL COMMENT '操作者ID',
  `gid` int(11) NOT NULL COMMENT '商品ID',
  `time` datetime NOT NULL COMMENT '操作的时间',
  `num` int(11) NOT NULL COMMENT '操作的数量',
  PRIMARY KEY (`id`),
  KEY `s_user_id` (`uid`),
  KEY `s_good_id` (`gid`),
  CONSTRAINT `s_good_id` FOREIGN KEY (`gid`) REFERENCES `s_goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `s_user_id` FOREIGN KEY (`uid`) REFERENCES `s_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_good_record
-- ----------------------------
INSERT INTO `s_good_record` VALUES ('1', 'in', '1', '3', '2021-07-13 14:57:37', '20');
INSERT INTO `s_good_record` VALUES ('5', 'in', '1', '3', '2021-07-13 16:27:16', '120');
INSERT INTO `s_good_record` VALUES ('6', 'in', '1', '3', '2021-07-13 16:27:39', '100');
INSERT INTO `s_good_record` VALUES ('7', 'in', '1', '3', '2021-07-13 16:29:34', '120');
INSERT INTO `s_good_record` VALUES ('8', 'in', '1', '3', '2021-07-13 16:32:11', '130');
INSERT INTO `s_good_record` VALUES ('9', 'in', '1', '3', '2021-07-13 16:42:38', '100');
INSERT INTO `s_good_record` VALUES ('10', 'out', '1', '3', '2021-07-13 16:42:44', '100');
INSERT INTO `s_good_record` VALUES ('11', 'out', '1', '3', '2021-07-13 16:45:14', '100');
INSERT INTO `s_good_record` VALUES ('12', 'in', '1', '3', '2021-07-13 16:45:22', '119');
INSERT INTO `s_good_record` VALUES ('13', 'in', '3', '1', '2021-07-13 17:31:09', '10');
INSERT INTO `s_good_record` VALUES ('14', 'in', '3', '2', '2021-07-13 17:31:15', '20');
INSERT INTO `s_good_record` VALUES ('15', 'out', '3', '2', '2021-07-13 17:31:21', '5');

-- ----------------------------
-- Table structure for `s_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `u_delete` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `s_user` VALUES ('2', '3', '123', '111', '12345678901', 'ddd', '0', '2');
INSERT INTO `s_user` VALUES ('3', '12345', '123', '5555', '12345678902', 'ewr', '1', '2');

-- ----------------------------
-- Table structure for `tb_account`
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(30) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES ('1', 'lucy', '1500');
INSERT INTO `tb_account` VALUES ('2', 'tom', '500');

-- ----------------------------
-- Table structure for `tb_employee`
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `emp_name` varchar(30) NOT NULL COMMENT '姓名',
  `emp_gender` int(1) DEFAULT NULL COMMENT '0:女 1:男',
  `emp_email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `emp_phone` varchar(30) DEFAULT NULL COMMENT '手机',
  `emp_birthday` varchar(30) DEFAULT NULL COMMENT '生日',
  `hire_date` varchar(30) DEFAULT NULL COMMENT '入职时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------
INSERT INTO `tb_employee` VALUES ('4', 'sun', '1', '1232qq.com', '123', '11', '11', '2021-07-28 22:10:02', '2021-07-17 22:10:05');
INSERT INTO `tb_employee` VALUES ('5', '3', '3', '3', '3', '3', '5', null, null);
INSERT INTO `tb_employee` VALUES ('6', '1', '1', '1', '1', '1', '1', null, '2021-07-08 22:23:29');
