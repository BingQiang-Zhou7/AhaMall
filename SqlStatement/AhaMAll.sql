/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : ahamall

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 08/06/2018 11:27:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `orderID` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commodityid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commenttime` datetime(0) NULL DEFAULT NULL,
  `numberOfCommodity` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`, `commodityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('115281026920103312341234', 'apple_001', '2018-06-04 23:59:53', 1, '苹果的产品还是真心不错！');
INSERT INTO `comment` VALUES ('115281026920103312341234', 'apple_003', NULL, 1, NULL);
INSERT INTO `comment` VALUES ('115281026920103312341234', 'huawei_003', '2018-06-05 00:01:44', 1, '苹果的产品还是真的不错！');
INSERT INTO `comment` VALUES ('115281164548753312341234', 'apple_005', '2018-06-04 22:42:17', 1, 'wow wonderful！');
INSERT INTO `comment` VALUES ('115282510543075222222222', 'apple_005', NULL, 1, NULL);
INSERT INTO `comment` VALUES ('133115281596414032341234', 'apple_003', '2018-06-05 08:47:55', 2, '131312313');
INSERT INTO `comment` VALUES ('133121528113044110341234', 'apple_003', '2018-06-05 00:08:26', 1, 'nice 很不错。');
INSERT INTO `comment` VALUES ('133152811061698512341234', 'apple_004', NULL, 1, NULL);
INSERT INTO `comment` VALUES ('133152811061698512341234', 'apple_005', NULL, 1, NULL);
INSERT INTO `comment` VALUES ('152215282509667822222222', 'apple_003', NULL, 2, NULL);
INSERT INTO `comment` VALUES ('152215282509667822222222', 'apple_004', NULL, 2, NULL);
INSERT INTO `comment` VALUES ('152215282509667822222222', 'apple_005', NULL, 2, NULL);
INSERT INTO `comment` VALUES ('152221528251123418222222', 'apple_005', '2018-06-06 10:17:14', 1, 'nice 很不错。');
INSERT INTO `comment` VALUES ('152222221528197476452222', 'apple_003', NULL, 1, NULL);
INSERT INTO `comment` VALUES ('152222221528197476452222', 'apple_004', NULL, 1, NULL);
INSERT INTO `comment` VALUES ('187731152816135749368322', 'huawei_004', '2018-06-05 09:16:10', 1, 'nice 很不错。');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int(8) NULL DEFAULT NULL,
  `addedTime` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addressofimage` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numofcomment` int(8) NULL DEFAULT NULL,
  `isRecommend` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('apple_001', 'iphone_8', 'iphone 8', '手机', 6630, '2017-09', 'apple/iphone8p.png', 'Apple/苹果 iPhone 8 Plus 64GB \r\n深空灰色', 3, 1);
INSERT INTO `commodity` VALUES ('apple_002', 'iphone_x', 'iphone X', '手机', 8316, '2017-09', 'apple/iphonex.png', 'Apple/苹果 iPhone X 64GB \r\n深空灰色', 0, 1);
INSERT INTO `commodity` VALUES ('apple_003', 'macbook_pro', 'MacBook Pro', '笔记本', 14165, '2017-09', 'apple/macpro.jpeg', 'Apple/苹果 \r\n13 英寸 MacBook Pro \r\nMulti-Touch Bar 和 Touch ID 3.1GHz 处理器 256GB 存储容量 深空灰色', 2, 1);
INSERT INTO `commodity` VALUES ('apple_004', 'ipad_pro', 'iPad Pro', '平板', 5134, '2017-09', 'apple/ipadpro.jpg', 'Apple/苹果 10.5 英寸 iPad Pro WLAN 64GB 深空灰色', 0, 1);
INSERT INTO `commodity` VALUES ('apple_005', 'iwatch_3', 'Watch Series 3', '智能穿戴', 2565, '2017-09', 'apple/iwatch3.jpg', 'Apple/苹果 Watch Series 3 深空灰色铝金属表壳搭配黑色运动型表带', 4, 1);
INSERT INTO `commodity` VALUES ('apple_006', 'airpods', 'AirPods', '配件', 1276, '2016-09', 'apple/airpods.jpg', 'Apple/苹果 AirPods', 0, 1);
INSERT INTO `commodity` VALUES ('hp_001', 'envy_x360', 'HP ENVY X360 15-bp105tx', '笔记本', 7499, '2018-01', 'hp/envy15x360.png', '惠普薄锐HP ENVY X360 15-bp105tx 笔记本电脑(英特尔8代处理器)', 0, 1);
INSERT INTO `commodity` VALUES ('hp_002', 'elitebook x360', 'HP EliteBook x360 1030 G2', '笔记本', 12999, '2018-03', 'hp/eliteBookx360g2.png', '惠普精英HP EliteBook x360 1030 G2 变形本（能源之星）', 0, 1);
INSERT INTO `commodity` VALUES ('hp_003', 'mouse_200', 'HP 200', '配件', 79, '2016-09', 'hp/mouse200.png', '惠普HP 200 无线鼠标', 0, 1);
INSERT INTO `commodity` VALUES ('huawei_001', 'mate_rs', 'HUAWEI Mate RS', '手机', 9999, '2018-04', 'huawei/maters.jpg', 'HUAWEI Mate RS 保时捷设计 6GB+256GB 全网通版（玄黑）', 0, 0);
INSERT INTO `commodity` VALUES ('huawei_002', 'honor_10', '荣耀10', '手机', 2599, '2018-04', 'huawei/honor10.jpg', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版', 0, 0);
INSERT INTO `commodity` VALUES ('huawei_003', 'matebook_x_pro', 'HUAWEI MateBook X Pro', '笔记本', 12988, '2018-04', 'huawei/matebookxpro.jpg', 'HUAWEI MateBook X Pro 13.9英寸笔记本电脑 深空灰 i7 16GB 512GB 独显', 1, 0);
INSERT INTO `commodity` VALUES ('huawei_004', 'pad_m5', '华为平板 M5', '平板', 2888, '2018-04', 'huawei/padm5.jpg', '华为平板 M5 10.8英寸 4GB+64GB WiFi版（深空灰）', 1, 0);
INSERT INTO `commodity` VALUES ('huawei_005', 'smartwatch', 'HUAWEI Smartwatch', '智能穿戴', 4988, '2017-11', 'huawei/smartwatch.jpg', 'PORSCHE DESIGN | HUAWEI Smartwatch 华为智能手表 保时捷联合设计（曜石黑）', 0, 0);
INSERT INTO `commodity` VALUES ('huawei_006', 'mobile_charging', '移动电源', '配件', 99, '2016-05', 'huawei/mobilecharging.jpg', '荣耀5000mAh 移动电源（石墨黑）', 0, 0);
INSERT INTO `commodity` VALUES ('oppo_001', 'r15', 'OPPO R15 星云特别版', '手机', 3199, '2018-05', 'oppo/r15.png', 'OPPO R15 星云特别版 全面屏AI智能拍照全网通手机 6+128GB', 0, 0);
INSERT INTO `commodity` VALUES ('oppo_002', 'charging_adapter', '闪充电源适配器', '配件', 79, '2016-10', 'oppo/chargingadapter.png', '闪充电源适配器 VC54JBCH不带数据线', 0, 0);
INSERT INTO `commodity` VALUES ('vivo_001', 'x21_fifa', 'VIVO X21 FIFA世界杯非凡版', '手机', 3698, '2018-06', 'vivo/x21.png', 'VIVO X21 FIFA世界杯非凡版【FIFA世界杯官方定制典藏礼盒，预定加赠运动臂带】 礼盒含主题保护壳+vivo蓝定制足球，屏幕指纹解锁，19:9全面屏，128G大内存', 0, 0);
INSERT INTO `commodity` VALUES ('vivo_002', 'mambo_hr', '乐心mambo HR版', '智能穿戴', 199, '2014-12', 'vivo/mambohr.png', '乐心mambo HR版 乐心智能手环mambo HR 24小时连续心率监测 来电显示震动提醒 计步 专业运动手环', 0, 0);
INSERT INTO `commodity` VALUES ('vivo_003', 'xe_1000', 'XE1000头戴式耳机', '配件', 1999, '2017-08', 'vivo/xe1000.png', 'XE1000头戴式耳机 vivo原装Hi-Fi耳机，XE1000头戴式耳机，高保真音质，德产定制三明治振膜，多金属完美结合；数千人试戴，精巧设计，舒适佩戴体验。 ', 0, 0);
INSERT INTO `commodity` VALUES ('xiaomi_001', 'pad_3', '小米平板 3', '平板', 1499, '2017-04', 'xiaomi/pad3.jpg', '小米平板 3 6600mAh 轻薄超大电量，精彩海量内容 64GB', 0, 0);
INSERT INTO `commodity` VALUES ('xiaomi_002', 'mix_2s', '小米MIX 2S', '手机', 3299, '2018-05', 'xiaomi/mix2s.jpg', '小米MIX 2S 搭载高通骁龙845 年度旗舰处理器 / AI超感光双摄，DxO百分相机 / 艺术品般陶瓷机身', 0, 0);
INSERT INTO `commodity` VALUES ('xiaomi_003', 'notebook_pro ', '小米笔记本Pro', '笔记本', 5599, '2017-09', 'xiaomi/notebookpro.jpg', '小米笔记本Pro 15.6英寸 NVIDIA MX150 2G独显/全金属强化机身/FHD全贴合屏幕 /丰富接口多达7个', 0, 0);
INSERT INTO `commodity` VALUES ('xiaomi_004', 'wristband_2', '小米手环2', '智能穿戴', 149, '2018-02', 'xiaomi/wristband2.jpg', '小米手环2 OLED显示屏，时间、步数、心率，触手可及 / 全新腕带设计，升级计步算法 / 精准心率监测，科学运动自主掌握', 0, 0);
INSERT INTO `commodity` VALUES ('xiaomi_005', 'headphones', '小米头戴式耳机', '配件', 499, '2016-12', 'xiaomi/headphones.jpg', '小米头戴式耳机 升级版 石墨烯发声振膜 / 被动低频辐射器设计 / 封闭式音腔设计 / 手机直推高保真音质', 0, 0);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderID` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `buytime` datetime(0) NULL DEFAULT NULL,
  `userPhoneNum` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('115281026920103312341234', '2018-06-04 16:58:12', '13312341234');
INSERT INTO `order` VALUES ('115281164548753312341234', '2018-06-04 20:47:34', '13312341234');
INSERT INTO `order` VALUES ('115282510543075222222222', '2018-06-06 10:10:54', '15222222222');
INSERT INTO `order` VALUES ('133115281596414032341234', '2018-06-05 08:47:21', '13312341234');
INSERT INTO `order` VALUES ('133121528113044110341234', '2018-06-04 19:50:44', '13312341234');
INSERT INTO `order` VALUES ('133123412152811288375734', '2018-06-04 19:48:03', '13312341234');
INSERT INTO `order` VALUES ('133152811061698512341234', '2018-06-04 19:10:16', '13312341234');
INSERT INTO `order` VALUES ('133152811281182212341234', '2018-06-04 19:46:51', '13312341234');
INSERT INTO `order` VALUES ('152215282509667822222222', '2018-06-06 10:09:26', '15222222222');
INSERT INTO `order` VALUES ('152221528251013177222222', '2018-06-06 10:10:13', '15222222222');
INSERT INTO `order` VALUES ('152221528251123418222222', '2018-06-06 10:12:03', '15222222222');
INSERT INTO `order` VALUES ('152222221528197476452222', '2018-06-05 19:17:56', '15222222222');
INSERT INTO `order` VALUES ('187731152816135749368322', '2018-06-05 09:15:57', '18773168322');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `userPhoneNum` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commodityID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numOfCommodity` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userPhoneNum`, `commodityID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('13312341234', 'apple_004', '2');

-- ----------------------------
-- Table structure for tableuser
-- ----------------------------
DROP TABLE IF EXISTS `tableuser`;
CREATE TABLE `tableuser`  (
  `userPhoneNum` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userID` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userName` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userPassword` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userPhoneNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tableuser
-- ----------------------------
INSERT INTO `tableuser` VALUES ('13312341234', '123456123456123456', '张三', '12344321');
INSERT INTO `tableuser` VALUES ('13312345678', '123234234234212312', '李四', '12345678');
INSERT INTO `tableuser` VALUES ('13343214321', '131312313123131231', '王五', '12345678');
INSERT INTO `tableuser` VALUES ('15222222222', '111111111111111111', '小强', '22222222');
INSERT INTO `tableuser` VALUES ('15244444444', '123242342342424234', '小周', '123123123');
INSERT INTO `tableuser` VALUES ('18773168322', '111111111111111111', '小花', '12345678');

-- ----------------------------
-- Procedure structure for BuyCommodity
-- ----------------------------
DROP PROCEDURE IF EXISTS `BuyCommodity`;
delimiter ;;
CREATE PROCEDURE `BuyCommodity`(IN `OrderID` varchar(24),IN `PhoneNum` varchar(11),IN `CommodityID` varchar(16))
BEGIN
IF NOT EXISTS(SELECT * FROM `order` WHERE `order`.orderID = orderID)
THEN
INSERT INTO `order`
VALUES(OrderID,NOW(),PhoneNum);
END IF;

INSERT INTO `comment`(`comment`.orderID,`comment`.commodityid,`comment`.numberOfCommodity)
SELECT OrderID,shoppingcart.commodityID,shoppingcart.numOfCommodity FROM shoppingcart
INNER JOIN commodity ON commodity.id = shoppingcart.commodityID
WHERE shoppingcart.commodityID = CommodityID AND shoppingcart.userPhoneNum = PhoneNum;

DELETE FROM shoppingcart
WHERE shoppingcart.commodityID = CommodityID AND shoppingcart.userPhoneNum = PhoneNum;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for CommentCommodity
-- ----------------------------
DROP PROCEDURE IF EXISTS `CommentCommodity`;
delimiter ;;
CREATE PROCEDURE `CommentCommodity`(IN `orderID` varchar(24),IN `content` varchar(255),IN `CommodityID` varchar(16))
BEGIN
UPDATE `comment` SET `comment`.commenttime = NOW() ,`comment`.content = content
WHERE `comment`.OrderID = orderID AND `comment`.commodityid = CommodityID;

UPDATE commodity SET commodity.numofcomment = commodity.numofcomment+1
WHERE commodity.id = CommodityID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DeleteCommodityToShoppingCart
-- ----------------------------
DROP PROCEDURE IF EXISTS `DeleteCommodityToShoppingCart`;
delimiter ;;
CREATE PROCEDURE `DeleteCommodityToShoppingCart`(IN `PhoneNum` varchar(11),IN `CommodityID` varchar(16))
BEGIN
IF CommodityID = "all" 
THEN
	DELETE FROM shoppingcart
	WHERE shoppingcart.userPhoneNum = PhoneNum;
ELSE
	DELETE FROM shoppingcart
	WHERE shoppingcart.commodityID = CommodityID AND shoppingcart.userPhoneNum = PhoneNum;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertCommodityToShoppingCart
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertCommodityToShoppingCart`;
delimiter ;;
CREATE PROCEDURE `InsertCommodityToShoppingCart`(IN `PhoneNum` varchar(11),IN `CommodityID` varchar(16),IN `NumOfCommodity` varchar(16))
BEGIN
DECLARE i int ;
select @i := COUNT(*) from shoppingcart where shoppingcart.userPhoneNum = PhoneNum AND shoppingcart.commodityID = CommodityID;
IF @i>0 THEN
	UPDATE shoppingcart SET shoppingcart.numOfCommodity=NumOfCommodity + shoppingcart.numOfCommodity
	WHERE shoppingcart.userPhoneNum = PhoneNum AND shoppingcart.commodityID = CommodityID;
	ELSE
	INSERT INTO shoppingcart(shoppingcart.userPhoneNum,shoppingcart.commodityID,shoppingcart.numOfCommodity)
	VALUES(PhoneNum,CommodityID,NumOfCommodity);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertUserInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertUserInfo`;
delimiter ;;
CREATE PROCEDURE `InsertUserInfo`(IN `PhoneNum` varchar(11),IN `ID` varchar(18),IN `Name` varchar(16),IN `Password` varchar(16))
BEGIN
DECLARE i INT ;
SELECT @i := COUNT(*) FROM tableuser WHERE tableuser.userPhoneNum = PhoneNum;
IF @i=0 THEN
	INSERT INTO tableuser(tableuser.userPhoneNum,tableuser.userID,tableuser.userName,tableuser.userPassword)
	VALUES(PhoneNum,ID,`Name`,`Password`);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchCommodityByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchCommodityByID`;
delimiter ;;
CREATE PROCEDURE `SearchCommodityByID`(IN `commodityid` varchar(16),IN `orderID` varchar(24))
BEGIN
		SELECT * FROM `comment`
		INNER JOIN commodity ON id = `comment`.commodityid
		WHERE `comment`.commodityid = commodityid and `comment`.orderID = orderID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchCommodityComment
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchCommodityComment`;
delimiter ;;
CREATE PROCEDURE `SearchCommodityComment`(IN `commodityid` varchar(16))
BEGIN
		SELECT * FROM `comment`
		INNER JOIN commodity ON id = `comment`.commodityid
		INNER JOIN `order` ON `comment`.orderID = `order`.OrderID
		WHERE `comment`.commodityid = commodityid AND `comment`.content IS NOT NULL;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchOrders
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchOrders`;
delimiter ;;
CREATE PROCEDURE `SearchOrders`(IN `PhoneNum` varchar(16))
BEGIN
		SELECT * FROM `order`
		INNER JOIN `comment` ON `order`.orderID = `comment`.orderID
		INNER JOIN commodity ON commodity.id = `comment`.commodityid
		WHERE `order`.userPhoneNum = PhoneNum
		ORDER BY `order`.buytime DESC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SortCommodityInShoppingCart
-- ----------------------------
DROP PROCEDURE IF EXISTS `SortCommodityInShoppingCart`;
delimiter ;;
CREATE PROCEDURE `SortCommodityInShoppingCart`(IN `PhoneNum` varchar(11))
BEGIN
	SELECT * FROM shoppingcart
	INNER JOIN commodity ON commodity.id = shoppingcart.commodityID
	WHERE shoppingcart.userPhoneNum = PhoneNum;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SortCommodityWithTypeAndSort
-- ----------------------------
DROP PROCEDURE IF EXISTS `SortCommodityWithTypeAndSort`;
delimiter ;;
CREATE PROCEDURE `SortCommodityWithTypeAndSort`(IN `selectedtype` varchar(16),IN `wayofsort` varchar(16),IN `fuzzy` varchar(16))
BEGIN
IF (fuzzy = "false")
THEN
	IF(selectedtype="全部")
	THEN
		CASE wayofsort
			WHEN "价格" 
			THEN
				SELECT * FROM commodity
				ORDER BY commodity.price;
			WHEN "评价数" 
			THEN
				SELECT * FROM commodity
				ORDER BY commodity.numofcomment DESC;
			WHEN "上架时间" 
			THEN
				SELECT * FROM commodity
				ORDER BY commodity.addedTime DESC;
			ELSE -- “默认”
				SELECT * FROM commodity;
		END CASE;
	ELSE 
		CASE wayofsort
			WHEN "价格" 
			THEN
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype
				ORDER BY commodity.price;
			WHEN "评价数" 
			THEN
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype
				ORDER BY commodity.numofcomment DESC;
			WHEN "上架时间" 
			THEN
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype
				ORDER BY commodity.addedTime DESC;
			ELSE -- “默认”
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype;
		END CASE;
	END IF;
ELSE
		IF(selectedtype="全部")
	THEN
		CASE wayofsort
			WHEN "价格" 
			THEN
				SELECT * FROM commodity
				WHERE POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.`name`)
				OR POSITION(fuzzy in commodity.id)
				ORDER BY commodity.price;
			WHEN "评价数" 
			THEN
				SELECT * FROM commodity
				WHERE POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.`name`)
				OR POSITION(fuzzy in commodity.id)
				ORDER BY commodity.numofcomment DESC;
			WHEN "上架时间" 
			THEN
				SELECT * FROM commodity
				WHERE POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.`name`)
				OR POSITION(fuzzy in commodity.id)
				ORDER BY commodity.addedTime DESC;
			ELSE -- “默认”
				SELECT * FROM commodity
				WHERE POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.id)
				OR POSITION(fuzzy in commodity.`name`);
		END CASE;
	ELSE 
		CASE wayofsort
			WHEN "价格" 
			THEN
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype 
				AND(POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.id)
				OR POSITION(fuzzy in commodity.`name`))
				ORDER BY commodity.price;
			WHEN "评价数" 
			THEN
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype
				AND(POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.id)
				OR POSITION(fuzzy in commodity.`name`))
				ORDER BY commodity.numofcomment DESC;
			WHEN "上架时间" 
			THEN
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype
				AND(POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.id)
				OR POSITION(fuzzy in commodity.`name`))
				ORDER BY commodity.addedTime DESC;
			ELSE -- “默认”
				SELECT * FROM commodity
				WHERE commodity.type = selectedtype
				AND(POSITION(fuzzy in commodity.description)
				OR POSITION(fuzzy in commodity.type)
				OR POSITION(fuzzy in commodity.price)
				OR POSITION(fuzzy in commodity.id)
				OR POSITION(fuzzy in commodity.`name`));
		END CASE;
	END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for UpdateCommodityToShoppingCart
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateCommodityToShoppingCart`;
delimiter ;;
CREATE PROCEDURE `UpdateCommodityToShoppingCart`(IN `PhoneNum` varchar(11),IN `CommodityID` varchar(16),IN `NumOfCommodity` varchar(16))
BEGIN
	UPDATE shoppingcart SET shoppingcart.numOfCommodity=NumOfCommodity
	WHERE shoppingcart.userPhoneNum = PhoneNum AND shoppingcart.commodityID = CommodityID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for UpdateUserPassword
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateUserPassword`;
delimiter ;;
CREATE PROCEDURE `UpdateUserPassword`(IN `ID` varchar(18),IN `PhoneNum` varchar(11),IN `newPassword` varchar(16))
BEGIN
DECLARE i int ;
select @i := COUNT(*) from tableuser where tableuser.userID = ID AND tableuser.userPhoneNum = PhoneNum;
IF @i>0 THEN
	UPDATE tableuser SET tableuser.userPassword=newPassword
	WHERE tableuser.userID = ID AND tableuser.userPhoneNum = PhoneNum;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for VerifyLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `VerifyLogin`;
delimiter ;;
CREATE PROCEDURE `VerifyLogin`(IN `phoneNum` varchar(11),IN `loginPassword` varchar(16))
BEGIN
SELECT * FROM tableuser
WHERE tableuser.userPassword = loginPassword AND tableuser.userPhoneNum = phoneNum;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
