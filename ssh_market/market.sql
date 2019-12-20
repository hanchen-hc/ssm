/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : market

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售单',
  `card_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT '总价',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', '1', '1', '1', '3.5', null);
INSERT INTO `bill` VALUES ('2', '2', '2', '2', '10', null);
INSERT INTO `bill` VALUES ('3', '3', '3', '3', '38.4', null);
INSERT INTO `bill` VALUES ('4', '4', '4', '4', '84.4', null);
INSERT INTO `bill` VALUES ('5', '4', '6', '2', '15.6', null);

-- ----------------------------
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float DEFAULT NULL,
  `total_vip` varchar(20) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `vip_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('1', '5.6', null, now(), null, null, null);
INSERT INTO `card` VALUES ('2', '10', '9', now(), '2', null, null);
INSERT INTO `card` VALUES ('3', '38.4', null, now(), null, '5', null);
INSERT INTO `card` VALUES ('4', '100', '80', now(), '4', '5', null);

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '1', '1', '1', '1', '34', '12312341234', '经理');
INSERT INTO `emp` VALUES ('2', '2', '2', '2', '1', '24', '12312341234', '库管');
INSERT INTO `emp` VALUES ('5', '3', '3', '3', '0', '24', '12312341234', '员工');

-- ----------------------------
-- Table structure for `factory`
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货商',
  `name` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory
-- ----------------------------
INSERT INTO `factory` VALUES ('1', '上好佳食品', '张', '12312341122', '北京市朝阳区朝外大街', '长期合作');
INSERT INTO `factory` VALUES ('2', '王老吉凉茶', '王', '12312341666', '北京市朝阳区朝外大街', '长期合作');
INSERT INTO `factory` VALUES ('3', '肉食类专供', '李', '12312341234', '北京市朝阳区朝外大街', '临时合作');
INSERT INTO `factory` VALUES ('4', '蛋奶类专供', '赵', '12312341234', '北京市朝阳区朝外大街', '临时合作');
INSERT INTO `factory` VALUES ('5', '服装类专供', '周', '12312341234', '北京市朝阳区朝外大街', '临时合作');
INSERT INTO `factory` VALUES ('6', '日用品专供', '郑', '12312341234', '北京市朝阳区朝外大街', '临时合作');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL COMMENT '生产日期',
  `keep` varchar(255) DEFAULT NULL COMMENT '保质期',
  `place` varchar(255) DEFAULT NULL COMMENT '产地',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `factory_id` int(11) DEFAULT NULL COMMENT '进货商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '上好佳薯片', '食品', '3.5', now(), '24', '北京', null, '1');
INSERT INTO `goods` VALUES ('2', '王老吉凉茶', '食品', '5', now(), '24', '广州', null, '2');
INSERT INTO `goods` VALUES ('3', '双汇冷鲜肉', '食品', '12.8', now(), '6', '上海', null, '3');
INSERT INTO `goods` VALUES ('4', '咯咯哒鸡蛋', '食品', '21.1', now(), '6', '沈阳', '按斤计价', '4');
INSERT INTO `goods` VALUES ('5', '男士牛仔裤', '服饰', '128', now(), '36', '杭州', null, '5');
INSERT INTO `goods` VALUES ('6', '雕牌洗衣粉', '日用', '7.8', now(), '36', '天津', null, '6');

-- ----------------------------
-- Table structure for `sell`
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出货表',
  `goods_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '出货数量',
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `emp_id` int(11) DEFAULT NULL COMMENT '经手人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES ('1', '1', '20', now(), null, '2');
INSERT INTO `sell` VALUES ('2', '2', '20', now(), null, '2');
INSERT INTO `sell` VALUES ('3', '3', '20', now(), null, '2');
INSERT INTO `sell` VALUES ('4', '4', '20', now(), null, '2');
INSERT INTO `sell` VALUES ('5', '5', '20', now(), null, '2');

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货表',
  `goods_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `emp_id` int(11) DEFAULT NULL COMMENT '经手人',
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '进货日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', '1', '100', null, '2', now());
INSERT INTO `stock` VALUES ('2', '2', '100', null, '2', now());
INSERT INTO `stock` VALUES ('3', '3', '100', null, '2', now());
INSERT INTO `stock` VALUES ('4', '4', '100', '按斤计价', '2', now());
INSERT INTO `stock` VALUES ('5', '5', '100', null, '2', now());
INSERT INTO `stock` VALUES ('6', '6', '100', null, '2', now());

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存表',
  `goods_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '1', '80', '14');
INSERT INTO `store` VALUES ('2', '2', '80', '10');
INSERT INTO `store` VALUES ('3', '3', '80', '10');
INSERT INTO `store` VALUES ('4', '4', '80', '10');
INSERT INTO `store` VALUES ('5', '5', '80', '10');
INSERT INTO `store` VALUES ('6', '6', '80', '10');

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT '0' COMMENT '总积分',
  `level` int(11) DEFAULT '1' COMMENT '会员级别',
  `rebate` float DEFAULT '0.95' COMMENT '折扣',
  `ident` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `birthday` varchar(255) DEFAULT NULL,
  `sex` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('1', 'vip1', '12312341234', '136', '1', '0.95', '522723198802145095', '19880214', '1', '北京市海淀区中关村');
INSERT INTO `vip` VALUES ('2', 'vip2', '12312341234', '1024', '2', '0.9', '522723198802145095', '19880214', '1', '北京市海淀区中关村');
INSERT INTO `vip` VALUES ('3', 'vip3', '12312341234', '2048', '3', '0.85', '522723198802145095', '19880214', '1', '北京市海淀区中关村');
INSERT INTO `vip` VALUES ('4', 'vip4', '12312341234', '3072', '4', '0.8', '522723198802145095', '19880214', '0', '北京市海淀区中关村');
INSERT INTO `vip` VALUES ('5', 'vip5', '12312341234', '4096', '5', '0.75', '522723198802145095', '19880214', '0', '北京市海淀区中关村');
