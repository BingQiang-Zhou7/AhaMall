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

 Date: 25/05/2018 18:57:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commenttime` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userPhoneNum` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commodityid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commenttime`, `userPhoneNum`, `commodityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2017/10/11  18:54:44', '13343214321', 'xiaomi_004', '小米手环可以的，非常的好用，我十分地喜欢，电池也经用的很。照片我是用红米note3拍的，像素不知道给几分呀？');
INSERT INTO `comment` VALUES ('2017/10/19  22:36:22', '13312345678', 'huawei_004', '特别喜欢，很好，没想到像素也超级好');
INSERT INTO `comment` VALUES ('2017/11/28  12:50:07', '13312341234', 'apple_001', '一直在红色和金色中徘徊犹豫，最后还是选择了大红防水逆，哈哈，颜色很好看！速度快啊，用起来舒服，不错不错，绝对好评！');
INSERT INTO `comment` VALUES ('2017/11/3  9:43:44', '13312341234', 'apple_004', '快递速度不错。视频游戏视觉效果好。我充电大约3个半小时左右。有的app耗电量也挺快的，续航时间一般。比较适合办公和学习，画画');
INSERT INTO `comment` VALUES ('2017/12/14  17:51:46', '13312345678', 'huawei_005', '高端大气上档次，低调奢华有内涵');
INSERT INTO `comment` VALUES ('2017/2/20  19:48:02', '13312341234', 'apple_006', '很灵敏！跟我的X很匹配。看了那么久终于入手了！很值得，开车也很方便用，不容易掉出来，跟平时的耳机差不多，就是图个方便。发票是另一个时间到的。很满意！ 噢 安卓机试了一下也能用到也有很多限制的地方。 嘻嘻很满意很满意');
INSERT INTO `comment` VALUES ('2017/3/11  7:10:35', '13343214321', 'oppo_001', '永远都不知道这个解锁速度是多快！还没有意识到就已经解锁了是真的！ 很流畅 一点都不卡 真的太满意了太满意了 这款R15真的让我太意外了太意外！处理器也很好 同时打开很多个软件都没有卡');
INSERT INTO `comment` VALUES ('2017/3/30  12:46:37', '13343214321', 'oppo_002', '宝贝早就收到了，拿到手就迫不及待的试了一下，效果真是好，超快，一个小时就能充满');
INSERT INTO `comment` VALUES ('2017/4/1  9:23:39', '13312341234', 'apple_005', 'Apple Watch作为一款苹果的产品想必不用我多说了吧，各方面都是同行中最高水准，无论是硬件还是软件人家细节的部分都做的很到位！唯一的一点就是充电正常一天下来还剩50%～60%?，还好充电速度挺快的半小时就能100%了！在我眼里它是一款OK的产品！我很满意！希望apple不忘初心再接再厉！！！');
INSERT INTO `comment` VALUES ('2017/4/16  17:35:16', '13312345678', 'huawei_002', '支持国货，收到后发现与官网宣传的非常相符合，体验的感觉，并不是喊口号的那样，真的给国人争脸：手感舒适、性能流畅、智能多样好用、音效棒棒的、拍照美美哒并好玩。');
INSERT INTO `comment` VALUES ('2017/6/25  4:17:14', '13343214321', 'vivo_002', '耳机音质很好轻盈通透，期待后续的音质。');
INSERT INTO `comment` VALUES ('2017/8/13  13:50:26', '13343214321', 'vivo_001', '这个东西已经过时了，商城赶紧把新一代的换上来吧，总觉得有那么一丝丝的不爽，手环没有毛病，但现在就是不值这个钱了');
INSERT INTO `comment` VALUES ('2017/9/14  0:23:14', '13312341234', 'apple_002', '拍照非常好看 胜过7p 人像模式可以自拍 刚开始用不习惯 一两天就ok啦 操作非常方便');
INSERT INTO `comment` VALUES ('2017/9/4  10:39:44', '13312345678', 'huawei_006', '中华之为，国之荣耀');
INSERT INTO `comment` VALUES ('2017/9/9  0:50:19', '13312341234', 'apple_003', 'Touch bar确实名不虚传，使用感超级棒啦，系统还在熟悉中，网上各种教程都有没有什么不能解决的问题');
INSERT INTO `comment` VALUES ('2018/1/30  4:00:22', '13312345678', 'xiaomi_003', '超轻薄，超喜欢。小米，粉你好多年。。。 ');
INSERT INTO `comment` VALUES ('2018/2/12  17:30:02', '13312345678', 'huawei_003', '外观特别漂亮，运行速度超快，特别值的一次购买！');
INSERT INTO `comment` VALUES ('2018/3/5  19:12:05', '13312341234', 'huawei_001', '手感真的不错哦，高端大气上档次。昨天买的今天早上就到了，好快啊');
INSERT INTO `comment` VALUES ('2018/4/25  10:19:54', '13312341234', 'xiaomi_005', '默认好评');
INSERT INTO `comment` VALUES ('2018/4/25  10:19:54', '13343214321', 'xiaomi_005', '客服米妹如面，久迎才女才华横溢，醉翁之意不在酒，节衣缩食只为博才女神复，盼劳指为感 ');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int(8) NULL DEFAULT NULL,
  `addedTime` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addressofimage` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numofcomment` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('apple_001', 'iphone_8', '手机', 6630, '2017-09', 'apple/iphone8p.png', 'Apple/苹果 iPhone 8 Plus 64GB \r\n深空灰色', 1);
INSERT INTO `commodity` VALUES ('apple_002', 'iphone_x', '手机', 8316, '2017-09', 'apple/iphonex.png', 'Apple/苹果 iPhone X 64GB \r\n深空灰色', 1);
INSERT INTO `commodity` VALUES ('apple_003', 'macbook_pro', '笔记本', 14165, '2017-09', 'apple/macpro.jpeg', 'Apple/苹果 \r\n13 英寸 MacBook Pro \r\nMulti-Touch Bar 和 Touch ID 3.1GHz 处理器 256GB 存储容量 深空灰色', 1);
INSERT INTO `commodity` VALUES ('apple_004', 'ipad_pro', '平板', 5134, '2017-09', 'apple/ipadpro.jpg', 'Apple/苹果 10.5 英寸 iPad Pro WLAN 64GB 深空灰色', 1);
INSERT INTO `commodity` VALUES ('apple_005', 'iwatch_3', '智能穿戴', 2565, '2017-09', 'apple/iwatch3.jpg', 'Apple/苹果 Watch Series 3 深空灰色铝金属表壳搭配黑色运动型表带', 1);
INSERT INTO `commodity` VALUES ('apple_006', 'airpods', '配件', 1276, '2016-09', 'apple/airpods.jpg', 'Apple/苹果 AirPods', 1);
INSERT INTO `commodity` VALUES ('hp_001', 'envy x360', '笔记本', 7499, '2018-01', 'hp/envy15x360.png', '惠普薄锐HP ENVY X360 15-bp105tx 笔记本电脑(英特尔8代处理器)', 0);
INSERT INTO `commodity` VALUES ('hp_002', 'elitebook x360', '笔记本', 12999, '2018-03', 'hp/eliteBookx360g2.png', '惠普精英HP EliteBook x360 1030 G2 变形本（能源之星）', 0);
INSERT INTO `commodity` VALUES ('hp_003', 'mouse 200', '配件', 79, '2016-09', 'hp/mouse200.png', '惠普HP 200 无线鼠标', 0);
INSERT INTO `commodity` VALUES ('huawei_001', 'mate rs', '手机', 9999, '2018-04', 'huawei/maters.jpg', 'HUAWEI Mate RS 保时捷设计 6GB+256GB 全网通版（玄黑）', 1);
INSERT INTO `commodity` VALUES ('huawei_002', 'honor 10', '手机', 2599, '2018-04', 'huawei/honor10.jpg', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版', 1);
INSERT INTO `commodity` VALUES ('huawei_003', 'matebook x pro', '笔记本', 12988, '2018-04', 'huawei/matebookxpro.jpg', 'HUAWEI MateBook X Pro 13.9英寸笔记本电脑 深空灰 i7 16GB 512GB 独显', 1);
INSERT INTO `commodity` VALUES ('huawei_004', 'pad m5', '平板', 2888, '2018-04', 'huawei/padm5.jpg', '华为平板 M5 10.8英寸 4GB+64GB WiFi版（深空灰）', 1);
INSERT INTO `commodity` VALUES ('huawei_005', 'smartwatch', '智能穿戴', 4988, '2017-11', 'huawei/smartwatch.jpg', 'PORSCHE DESIGN | HUAWEI Smartwatch 华为智能手表 保时捷联合设计（曜石黑）', 1);
INSERT INTO `commodity` VALUES ('huawei_006', 'mobile charging', '配件', 99, '2016-05', 'huawei/mobilecharging.jpg', '荣耀5000mAh 移动电源（石墨黑）', 1);
INSERT INTO `commodity` VALUES ('oppo_001', 'r15', '手机', 3199, '2018-05', 'oppo/r15.png', 'OPPO R15 星云特别版 全面屏AI智能拍照全网通手机 6+128GB', 1);
INSERT INTO `commodity` VALUES ('oppo_002', 'charging adapter', '配件', 79, '2016-10', 'oppo/chargingadapter.png', '闪充电源适配器 VC54JBCH不带数据线', 1);
INSERT INTO `commodity` VALUES ('vivo_001', 'x21 fifa', '手机', 3698, '2018-06', 'vivo/x21.png', 'X21 FIFA世界杯非凡版【FIFA世界杯官方定制典藏礼盒，预定加赠运动臂带】 礼盒含主题保护壳+vivo蓝定制足球，屏幕指纹解锁，19:9全面屏，128G大内存', 0);
INSERT INTO `commodity` VALUES ('vivo_002', 'mambo hr', '智能穿戴', 199, '2014-12', 'vivo/mambohr.png', '乐心mambo HR版 乐心智能手环mambo HR 24小时连续心率监测 来电显示震动提醒 计步 专业运动手环', 1);
INSERT INTO `commodity` VALUES ('vivo_003', 'xe 1000', '配件', 1999, '2017-08', 'vivo/xe1000.png', 'XE1000头戴式耳机 vivo原装Hi-Fi耳机，XE1000头戴式耳机，高保真音质，德产定制三明治振膜，多金属完美结合；数千人试戴，精巧设计，舒适佩戴体验。 ', 1);
INSERT INTO `commodity` VALUES ('xiaomi_001', 'pad 3', '平板', 1499, '2017-04', 'xiaomi/pad3.jpg', '小米平板 3 6600mAh 轻薄超大电量，精彩海量内容 64GB', 0);
INSERT INTO `commodity` VALUES ('xiaomi_002', 'mix 2s', '手机', 3299, '2018-05', 'xiaomi/mix2s.jpg', '小米MIX 2S 搭载高通骁龙845 年度旗舰处理器 / AI超感光双摄，DxO百分相机 / 艺术品般陶瓷机身', 0);
INSERT INTO `commodity` VALUES ('xiaomi_003', 'notebook pro ', '笔记本', 5599, '2017-09', 'xiaomi/notebookpro.jpg', '小米笔记本Pro 15.6英寸 NVIDIA MX150 2G独显/全金属强化机身/FHD全贴合屏幕 /丰富接口多达7个', 1);
INSERT INTO `commodity` VALUES ('xiaomi_004', 'wristband 2', '智能穿戴', 149, '2018-02', 'xiaomi/wristband2.jpg', '小米手环2 OLED显示屏，时间、步数、心率，触手可及 / 全新腕带设计，升级计步算法 / 精准心率监测，科学运动自主掌握', 1);
INSERT INTO `commodity` VALUES ('xiaomi_005', 'headphones', '配件', 499, '2016-12', 'xiaomi/headphones.jpg', '小米头戴式耳机 升级版 石墨烯发声振膜 / 被动低频辐射器设计 / 封闭式音腔设计 / 手机直推高保真音质', 2);

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
-- Procedure structure for SearchCommodity
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchCommodity`;
delimiter ;;
CREATE PROCEDURE `SearchCommodity`(IN `inputstr` varchar(16))
BEGIN
set sql_mode= 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
		SELECT * FROM commodity
		INNER JOIN `comment`	ON id = `comment`.commodityid
		WHERE POSITION(inputstr in commodity.description)
		or POSITION(inputstr in commodity.type)
		or POSITION(inputstr in commodity.price);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchCommodityComment
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchCommodityComment`;
delimiter ;;
CREATE PROCEDURE `SearchCommodityComment`(IN `inputstr` varchar(16))
BEGIN
		SELECT * FROM `comment`
		INNER JOIN commodity ON id = `comment`.commodityid
		WHERE `comment`.commodityid = inputstr;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SortCommodityByAddedTime
-- ----------------------------
DROP PROCEDURE IF EXISTS `SortCommodityByAddedTime`;
delimiter ;;
CREATE PROCEDURE `SortCommodityByAddedTime`(IN `selectedtype` varchar(16))
BEGIN
IF(selectedtype="全部")
THEN
	SELECT * FROM commodity
	ORDER BY price;
	ELSE 
	SELECT * FROM commodity
	WHERE commodity.type = selectedtype
	ORDER BY price;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SortCommodityByCommentTimes
-- ----------------------------
DROP PROCEDURE IF EXISTS `SortCommodityByCommentTimes`;
delimiter ;;
CREATE PROCEDURE `SortCommodityByCommentTimes`(IN `selectedtype` varchar(16))
BEGIN
IF(selectedtype="全部")
THEN
	SELECT  *  FROM commodity
	ORDER BY numofcomment DESC;
	ELSE 
	SELECT * FROM commodity
	WHERE commodity.type = selectedtype
	ORDER BY numofcomment DESC;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SortCommodityByPrice
-- ----------------------------
DROP PROCEDURE IF EXISTS `SortCommodityByPrice`;
delimiter ;;
CREATE PROCEDURE `SortCommodityByPrice`(IN `selectedtype` varchar(16))
BEGIN
IF(selectedtype="全部")
THEN
	SELECT * FROM commodity
	ORDER BY addedTime DESC;
	ELSE 
	SELECT * FROM commodity
	WHERE commodity.type = selectedtype
	ORDER BY addedTime DESC;
END IF;
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
