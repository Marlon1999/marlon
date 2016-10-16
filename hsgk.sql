/*
Navicat MySQL Data Transfer

Source Server         : tz_mysql6.0
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : hsgk

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-10-05 14:35:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_admin
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin`;
CREATE TABLE `tm_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `rolse` int(1) DEFAULT NULL COMMENT '角色（1管理员2超级管理员）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin
-- ----------------------------
INSERT INTO `tm_admin` VALUES ('1', 'marlon', '马龙', '123456', '1');

-- ----------------------------
-- Table structure for tm_score
-- ----------------------------
DROP TABLE IF EXISTS `tm_score`;
CREATE TABLE `tm_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `math` int(3) DEFAULT NULL,
  `english` int(3) DEFAULT NULL,
  `chinese` int(3) DEFAULT NULL,
  `c_course` int(11) DEFAULT NULL COMMENT '选修课id',
  `score` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2012013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_score
-- ----------------------------
INSERT INTO `tm_score` VALUES ('2012001', '90', '120', '110', '69', '389');
INSERT INTO `tm_score` VALUES ('2012002', '112', '128', '99', '87', '426');
INSERT INTO `tm_score` VALUES ('2012003', '100', '128', '119', '76', '423');
INSERT INTO `tm_score` VALUES ('2012004', '97', '136', '127', '79', '439');
INSERT INTO `tm_score` VALUES ('2012005', '138', '129', '118', '59', '444');
INSERT INTO `tm_score` VALUES ('2012006', '117', '50', '120', '70', '357');
INSERT INTO `tm_score` VALUES ('2012007', '109', '120', '103', '80', '412');
INSERT INTO `tm_score` VALUES ('2012008', '99', '95', '131', '86', '411');
INSERT INTO `tm_score` VALUES ('2012009', '92', '141', '121', '91', '445');
INSERT INTO `tm_score` VALUES ('2012010', '88', '120', '134', '77', '419');
INSERT INTO `tm_score` VALUES ('2012011', '79', '133', '112', '88', '412');
INSERT INTO `tm_score` VALUES ('2012012', '100', '141', '131', '79', '451');

-- ----------------------------
-- Table structure for tm_score_choose
-- ----------------------------
DROP TABLE IF EXISTS `tm_score_choose`;
CREATE TABLE `tm_score_choose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014012 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_score_choose
-- ----------------------------
INSERT INTO `tm_score_choose` VALUES ('2014001', 'java程序设计语言');
INSERT INTO `tm_score_choose` VALUES ('2014002', 'php程序设计语言');
INSERT INTO `tm_score_choose` VALUES ('2014003', 'c++程序设计语言');
INSERT INTO `tm_score_choose` VALUES ('2014004', '深入理解Spring');
INSERT INTO `tm_score_choose` VALUES ('2014005', '大学体育');
INSERT INTO `tm_score_choose` VALUES ('2014006', '武术');
INSERT INTO `tm_score_choose` VALUES ('2014007', '漫画');
INSERT INTO `tm_score_choose` VALUES ('2014008', 'Japanese');
INSERT INTO `tm_score_choose` VALUES ('2014009', '音乐');
INSERT INTO `tm_score_choose` VALUES ('2014010', '历史文化学');
INSERT INTO `tm_score_choose` VALUES ('2014011', 'UI设计');

-- ----------------------------
-- Table structure for tm_user
-- ----------------------------
DROP TABLE IF EXISTS `tm_user`;
CREATE TABLE `tm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '性别（0女1男2保密）',
  `join_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入学日期',
  `u_id` int(11) DEFAULT NULL COMMENT '课程编号',
  `is_delete` int(1) DEFAULT '1' COMMENT '是否存在 1存在 0不存在',
  `c_id` int(11) DEFAULT NULL COMMENT '选修课id',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user
-- ----------------------------
INSERT INTO `tm_user` VALUES ('1', '张三', '21', '1', '2016-10-04 20:37:10', '2012001', '1', '2014008', '1995-06-02');
INSERT INTO `tm_user` VALUES ('2', '张鹏', '26', '1', '2016-10-04 20:37:53', '2012004', '1', '2014009', '1989-01-23');
INSERT INTO `tm_user` VALUES ('3', '张小红', '18', '0', '2016-10-04 20:38:15', '2012003', '1', '2014010', '1998-04-12');
INSERT INTO `tm_user` VALUES ('4', '牛飞芸', '20', '1', '2016-10-04 20:38:31', '2012005', '1', '2014004', '1996-12-22');
INSERT INTO `tm_user` VALUES ('5', '李小璐', '21', '2', '2016-10-04 20:38:51', '2012007', '1', '2014005', '1995-08-18');
INSERT INTO `tm_user` VALUES ('6', '小龙女', '20', '0', '2016-10-04 20:38:56', '2012008', '1', '2014006', '1996-11-11');
INSERT INTO `tm_user` VALUES ('7', '范冰冰', '23', '0', '2016-10-04 20:39:09', '2012009', '1', '2014007', '1993-05-20');
INSERT INTO `tm_user` VALUES ('8', '李小龙', '32', '1', '2016-10-05 11:30:53', '2012010', '1', '2014003', '1984-07-07');
INSERT INTO `tm_user` VALUES ('9', '刘德华', '45', '2', '2016-10-05 11:58:18', '2012011', '1', '2014001', '1971-09-12');
INSERT INTO `tm_user` VALUES ('10', '李连杰', '38', '1', '2016-10-05 12:03:49', '2012012', '1', '2014006', '1978-08-08');
INSERT INTO `tm_user` VALUES ('11', '袁敏垠', '20', '0', '2016-10-05 12:06:33', '2012002', '1', '2014011', '1996-12-22');
INSERT INTO `tm_user` VALUES ('12', '张海娜', '20', '0', '2016-10-05 12:09:06', '2012006', '1', '2014011', '1996-12-22');
