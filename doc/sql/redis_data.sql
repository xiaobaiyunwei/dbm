/*
Navicat MySQL Data Transfer

Source Server         : 192.168.192.217-dbm
Source Server Version : 50173
Source Host           : 192.168.192.217:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2020-12-22 14:59:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for redis_data
-- ----------------------------
DROP TABLE IF EXISTS `redis_data`;
CREATE TABLE `redis_data` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
