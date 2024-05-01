/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50735
Source Host           : localhost:3306
Source Database       : online_shopping_platform

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2022-07-08 14:39:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `addresses`
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `A_addressno` char(7) NOT NULL,
  `A_addressee` char(8) NOT NULL,
  `A_phone` char(11) NOT NULL,
  `A_address` char(25) NOT NULL,
  `A_default` char(3) NOT NULL DEFAULT 'no',
  `Mem_no` char(7) NOT NULL,
  PRIMARY KEY (`A_addressno`),
  UNIQUE KEY `addressno` (`A_addressno`),
  KEY `Mem_no` (`Mem_no`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`Mem_no`) REFERENCES `member` (`Mem_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('DZ001', '张三', '12312312301', '广东省广州市', 'Yes', 'YH003');
INSERT INTO `addresses` VALUES ('DZ002', '李四', '12312323402', '广东省珠海市', 'No', 'YH001');
INSERT INTO `addresses` VALUES ('DZ003', '王五', '12312334503', '广东省湛江市', 'No', 'YH001');
INSERT INTO `addresses` VALUES ('DZ004', '马六', '12312345604', '广东省东莞市', 'No', 'YH006');

-- ----------------------------
-- Table structure for `browse`
-- ----------------------------
DROP TABLE IF EXISTS `browse`;
CREATE TABLE `browse` (
  `Brow_time` datetime NOT NULL,
  `Mem_no` char(7) NOT NULL,
  `Com_no` char(7) NOT NULL,
  PRIMARY KEY (`Brow_time`),
  KEY `Mem_no` (`Mem_no`),
  KEY `Com_no` (`Com_no`),
  CONSTRAINT `browse_ibfk_1` FOREIGN KEY (`Mem_no`) REFERENCES `member` (`Mem_no`),
  CONSTRAINT `browse_ibfk_2` FOREIGN KEY (`Com_no`) REFERENCES `commodity` (`Com_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of browse
-- ----------------------------
INSERT INTO `browse` VALUES ('2022-02-05 00:00:00', 'YH001', 'SP002');
INSERT INTO `browse` VALUES ('2022-02-14 00:00:00', 'YH002', 'SP004');
INSERT INTO `browse` VALUES ('2022-06-01 00:00:00', 'YH007', 'SP001');

-- ----------------------------
-- Table structure for `buy`
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `Buy_no` char(7) NOT NULL,
  `Com_no` char(7) NOT NULL,
  `Ord_no` char(7) NOT NULL,
  `Mem_no` char(7) NOT NULL,
  PRIMARY KEY (`Buy_no`),
  KEY `Com_no` (`Com_no`),
  KEY `Ord_no` (`Ord_no`),
  KEY `Mem_no` (`Mem_no`),
  CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`Com_no`) REFERENCES `commodity` (`Com_no`),
  CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`Ord_no`) REFERENCES `orders` (`Ord_no`),
  CONSTRAINT `buy_ibfk_3` FOREIGN KEY (`Mem_no`) REFERENCES `member` (`Mem_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES ('GM001', 'SP003', 'DD001', 'YH003');
INSERT INTO `buy` VALUES ('GM002', 'SP001', 'DD003', 'YH002');
INSERT INTO `buy` VALUES ('GM003', 'SP005', 'DD001', 'YH003');
INSERT INTO `buy` VALUES ('GM004', 'SP002', 'DD001', 'YH003');
INSERT INTO `buy` VALUES ('GM005', 'SP004', 'DD004', 'YH002');
INSERT INTO `buy` VALUES ('GM006', 'SP008', 'DD002', 'YH006');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `Cart_joinno` char(7) NOT NULL,
  `Cart_jointime` datetime NOT NULL,
  `Cart_depreciate` char(3) NOT NULL,
  `Cart_instore` char(3) NOT NULL,
  `Com_no` char(7) NOT NULL,
  PRIMARY KEY (`Cart_joinno`),
  KEY `Com_no` (`Com_no`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Com_no`) REFERENCES `commodity` (`Com_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('GWC001', '2020-06-01 00:00:00', 'No', 'Yes', 'SP001');
INSERT INTO `cart` VALUES ('GWC002', '2021-06-18 00:00:00', 'Yes', 'No', 'SP004');
INSERT INTO `cart` VALUES ('GWC003', '2021-11-11 00:00:00', 'Yes', 'Yes', 'SP006');
INSERT INTO `cart` VALUES ('GWC004', '2021-12-12 00:00:00', 'Yes', 'No', 'SP002');

-- ----------------------------
-- Table structure for `classify`
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `Cla_no` char(7) NOT NULL,
  `Cla_name` char(10) NOT NULL,
  PRIMARY KEY (`Cla_no`),
  UNIQUE KEY `classify_no` (`Cla_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('FL001', '文具');
INSERT INTO `classify` VALUES ('FL002', '乐器');
INSERT INTO `classify` VALUES ('FL003', '眼镜');
INSERT INTO `classify` VALUES ('FL004', '帽子');
INSERT INTO `classify` VALUES ('FL005', '衣服');
INSERT INTO `classify` VALUES ('FL006', '书刊');
INSERT INTO `classify` VALUES ('FL007', '电脑');

-- ----------------------------
-- Table structure for `commodity`
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `Com_no` char(7) NOT NULL,
  `Com_name` char(12) NOT NULL,
  `Com_profile` char(30) DEFAULT NULL,
  `Com_inventory` int(11) NOT NULL,
  `Com_bprice` char(8) NOT NULL,
  `Com_price` char(8) NOT NULL,
  `Com_freight` int(11) NOT NULL,
  `Com_evaluate` char(30) DEFAULT NULL,
  `Cla_no` char(7) DEFAULT NULL,
  `Shop_no` char(7) NOT NULL,
  PRIMARY KEY (`Com_no`),
  UNIQUE KEY `Commodity_no` (`Com_no`),
  KEY `Shop_no` (`Shop_no`),
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`Shop_no`) REFERENCES `shop` (`Shop_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('SP001', '钢笔', '笔', '200', '8', '8', '0', '好评', 'FL001', 'DP004');
INSERT INTO `commodity` VALUES ('SP002', '贝斯', '乐器', '0', '2800', '2500', '15', '', 'FL002', 'DP001');
INSERT INTO `commodity` VALUES ('SP003', '墨镜', '', '5', '120', '120', '5', '', 'FL003', 'DP003');
INSERT INTO `commodity` VALUES ('SP004', 'teamwang帽子', '', '0', '156', '140', '8', '好评', 'FL004', 'DP006');
INSERT INTO `commodity` VALUES ('SP005', 'CLOT上衣', '', '58', '220', '190', '12', '', 'FL005', 'DP002');
INSERT INTO `commodity` VALUES ('SP006', '《活着》', '书籍', '24', '36', '32', '0', '', 'FL006', 'DP005');
INSERT INTO `commodity` VALUES ('SP007', '尤克里里', '乐器', '11', '700', '650', '15', '差评', 'FL002', 'DP001');
INSERT INTO `commodity` VALUES ('SP008', '活页本', '本子', '60', '12', '12', '0', '差评', '文具', 'DP004');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `Mem_no` char(7) NOT NULL,
  `Mem_name` char(4) NOT NULL,
  `Mem_nickname` char(8) NOT NULL,
  `Mem_number` char(12) NOT NULL,
  `Mem_password` char(12) NOT NULL,
  `Mem_phone` char(11) NOT NULL,
  `Shop_no` char(7) DEFAULT NULL,
  PRIMARY KEY (`Mem_no`),
  UNIQUE KEY `Member_no` (`Mem_no`),
  KEY `Shop_no` (`Shop_no`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Shop_no`) REFERENCES `shop` (`Shop_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('YH001', '王嘉尔', 'jackson', '100001', 'wje.mm', '12345678901', 'DP006');
INSERT INTO `member` VALUES ('YH002', '陈冠希', 'edison', '100002', 'cgx.mm', '12345678902', 'DP002');
INSERT INTO `member` VALUES ('YH003', '刘亦菲', '茜茜', '100003', 'lyf.mm', '12345678903', 'DP003');
INSERT INTO `member` VALUES ('YH004', '陈晓', '小米', '100004', 'cx.mm', '12345678904', 'DP004');
INSERT INTO `member` VALUES ('YH005', '林子祥', 'lam', '100005', 'lzx.mm', '12345678905', 'DP005');
INSERT INTO `member` VALUES ('YH006', '叶倩文', 'sally', '100006', 'yqw.mm', '12345678906', 'DP005');
INSERT INTO `member` VALUES ('YH007', '彭磊', 'peng', '100007', 'pl.mm', '12345678907', 'DP001');
INSERT INTO `member` VALUES ('YH008', '赵梦', 'kelsey', '100008', 'zm.mm', '12345678908', 'DP001');

-- ----------------------------
-- Table structure for `orderitems`
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems` (
  `Delivertime` datetime NOT NULL,
  `Ord_state` char(20) NOT NULL,
  `Comedays` char(4) NOT NULL,
  `Ord_no` char(7) NOT NULL,
  PRIMARY KEY (`Delivertime`),
  KEY `Ord_no` (`Ord_no`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`Ord_no`) REFERENCES `orders` (`Ord_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES ('2022-06-02 00:00:00', '已发货', '6天', 'DD002');
INSERT INTO `orderitems` VALUES ('2022-06-05 00:00:00', '揽件', '1天', 'DD003');
INSERT INTO `orderitems` VALUES ('2022-06-06 00:00:00', '未发货', '3天', 'DD001');
INSERT INTO `orderitems` VALUES ('2022-06-08 00:00:00', '已发货', '3天', 'DD004');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `Ord_no` char(7) NOT NULL,
  `Ord_paytype` char(10) NOT NULL,
  `Ord_time` datetime NOT NULL,
  `A_addressno` char(7) NOT NULL,
  PRIMARY KEY (`Ord_no`),
  UNIQUE KEY `Order_no` (`Ord_no`),
  KEY `A_addressno` (`A_addressno`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`A_addressno`) REFERENCES `addresses` (`A_addressno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('DD001', '微信', '2022-06-01 00:00:00', 'DZ001');
INSERT INTO `orders` VALUES ('DD002', '支付宝', '2022-06-03 00:00:00', 'DZ004');
INSERT INTO `orders` VALUES ('DD003', '支付宝', '2022-06-05 00:00:00', 'DZ001');
INSERT INTO `orders` VALUES ('DD004', '银行卡', '2022-06-07 00:00:00', 'DZ003');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `Shop_no` char(7) NOT NULL,
  `Shop_name` char(10) NOT NULL,
  `Shop_profile` char(30) DEFAULT NULL,
  `Shop_star` char(8) NOT NULL,
  `Shop_address` char(25) NOT NULL,
  `Shop_focus` char(8) DEFAULT NULL,
  `Shop_brand` char(10) DEFAULT NULL,
  PRIMARY KEY (`Shop_no`),
  UNIQUE KEY `shop_no` (`Shop_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('DP001', '乐器', '专卖各种乐器', '2星', '北京', '50', '');
INSERT INTO `shop` VALUES ('DP002', 'CLOT', '潮牌', '3星', '香港', '300', 'CLOT');
INSERT INTO `shop` VALUES ('DP003', '眼镜店', '眼镜相关用品', '4星', '武汉', '678', '');
INSERT INTO `shop` VALUES ('DP004', '文具小店', '各种文具', '1星', '台湾', '90', '');
INSERT INTO `shop` VALUES ('DP005', '书店', '售卖书刊', '3星', '澳门', '369', '');
INSERT INTO `shop` VALUES ('DP006', 'teamwang', '自创潮牌', '5星', '广州', '888', 'team wang');

-- ----------------------------
-- View structure for `aview`
-- ----------------------------
DROP VIEW IF EXISTS `aview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aview` AS select `addresses`.`A_addressno` AS `编号`,`addresses`.`A_addressee` AS `姓名`,`addresses`.`A_phone` AS `手机`,`addresses`.`A_address` AS `地址`,`addresses`.`A_default` AS `默认`,`addresses`.`Mem_no` AS `用户` from `addresses` ;

-- ----------------------------
-- View structure for `browview`
-- ----------------------------
DROP VIEW IF EXISTS `browview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `browview` AS select `browse`.`Brow_time` AS `时间`,`browse`.`Mem_no` AS `用户编号`,`browse`.`Com_no` AS `商品编号` from `browse` ;

-- ----------------------------
-- View structure for `buyview`
-- ----------------------------
DROP VIEW IF EXISTS `buyview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buyview` AS select `buy`.`Buy_no` AS `编号`,`buy`.`Com_no` AS `商品`,`buy`.`Ord_no` AS `订单`,`buy`.`Mem_no` AS `用户` from `buy` ;

-- ----------------------------
-- View structure for `cartview`
-- ----------------------------
DROP VIEW IF EXISTS `cartview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview` AS select `cart`.`Cart_joinno` AS `编号`,`cart`.`Cart_jointime` AS `加购时间`,`cart`.`Cart_depreciate` AS `是否降价`,`cart`.`Cart_instore` AS `是否有货`,`cart`.`Com_no` AS `商品编号` from `cart` ;

-- ----------------------------
-- View structure for `claview`
-- ----------------------------
DROP VIEW IF EXISTS `claview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `claview` AS select `classify`.`Cla_no` AS `编号`,`classify`.`Cla_name` AS `类名` from `classify` ;

-- ----------------------------
-- View structure for `comview`
-- ----------------------------
DROP VIEW IF EXISTS `comview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comview` AS select `commodity`.`Com_no` AS `编号`,`commodity`.`Com_name` AS `名称`,`commodity`.`Com_profile` AS `简介`,`commodity`.`Com_inventory` AS `库存`,`commodity`.`Com_bprice` AS `原价`,`commodity`.`Com_price` AS `售价`,`commodity`.`Com_freight` AS `运费`,`commodity`.`Com_evaluate` AS `评价`,`commodity`.`Shop_no` AS `店铺编号`,`commodity`.`Cla_no` AS `分类编号` from `commodity` ;

-- ----------------------------
-- View structure for `memview`
-- ----------------------------
DROP VIEW IF EXISTS `memview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `memview` AS select `member`.`Mem_no` AS `编号`,`member`.`Mem_name` AS `姓名`,`member`.`Mem_nickname` AS `昵称`,`member`.`Mem_number` AS `账号`,`member`.`Mem_password` AS `密码`,`member`.`Mem_phone` AS `手机`,`member`.`Shop_no` AS `开店编号` from `member` ;

-- ----------------------------
-- View structure for `oiview`
-- ----------------------------
DROP VIEW IF EXISTS `oiview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `oiview` AS select `orderitems`.`Delivertime` AS `寄件时间`,`orderitems`.`Ord_state` AS `订单状态`,`orderitems`.`Comedays` AS `到达天数`,`orderitems`.`Ord_no` AS `订单编号` from `orderitems` ;

-- ----------------------------
-- View structure for `ordview`
-- ----------------------------
DROP VIEW IF EXISTS `ordview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordview` AS select `orders`.`Ord_no` AS `编号`,`orders`.`Ord_paytype` AS `支付方式`,`orders`.`Ord_time` AS `时间`,`orders`.`A_addressno` AS `地址编号` from `orders` ;

-- ----------------------------
-- View structure for `shopview`
-- ----------------------------
DROP VIEW IF EXISTS `shopview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shopview` AS select `shop`.`Shop_no` AS `编号`,`shop`.`Shop_name` AS `店名`,`shop`.`Shop_profile` AS `简介`,`shop`.`Shop_star` AS `星级`,`shop`.`Shop_address` AS `地址`,`shop`.`Shop_focus` AS `关注量`,`shop`.`Shop_brand` AS `品牌` from `shop` ;

-- ----------------------------
-- Procedure structure for `p10_Buy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p10_Buy`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p10_Buy`()
BEGIN
SELECT * from buy;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p1_Member`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p1_Member`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p1_Member`()
BEGIN
SELECT * from member;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p2_Shop`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p2_Shop`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p2_Shop`()
BEGIN
SELECT * from shop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p3_Commodity`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p3_Commodity`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p3_Commodity`()
BEGIN
SELECT * from commodity;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p4_Classify`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p4_Classify`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p4_Classify`()
BEGIN
SELECT * from classify;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `P4_Classify_Insert`
-- ----------------------------
DROP PROCEDURE IF EXISTS `P4_Classify_Insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P4_Classify_Insert`(
Cla_no char(7),
Cla_name char(10))
BEGIN
INSERT INTO classify(Cla_no,Cla_name)
VALUES(Cla_no,Cla_name);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p5_Cart`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p5_Cart`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p5_Cart`()
BEGIN
SELECT * from cart;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p6_Orders`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p6_Orders`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p6_Orders`()
BEGIN
SELECT * from orders;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p7_Orderitems`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p7_Orderitems`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p7_Orderitems`()
BEGIN
SELECT * from orderitems;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p8_Addresses`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p8_Addresses`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p8_Addresses`()
BEGIN
SELECT * from addresses;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p9_Browse`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p9_Browse`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p9_Browse`()
BEGIN
SELECT * from browse;
END
;;
DELIMITER ;
