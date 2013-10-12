/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : eventsaroundu

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2013-10-12 15:33:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_ID` int(10) NOT NULL auto_increment,
  `user_name` char(10) NOT NULL,
  `user_password` char(20) NOT NULL,
  `user_username` char(20) NOT NULL,
  `user_email` char(30) default NULL,
  `user_gender` binary(1) default NULL,
  `user_phone` char(20) default NULL,
  `user_address` char(50) default NULL,
  `user_picture` char(100) default NULL,
  `user_register_time` datetime NOT NULL,
  PRIMARY KEY  (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', 'aaa', 'aaa', null, null, null, null, null, '2013-10-07 17:37:22');
