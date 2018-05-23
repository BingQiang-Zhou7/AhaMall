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

 Date: 23/05/2018 16:19:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `tableuser` VALUES ('13312341234', '123456123456123456', '周哈哈哈', '12344321');
INSERT INTO `tableuser` VALUES ('13312345678', '123234234234212312', '12345678', '12345678');
INSERT INTO `tableuser` VALUES ('13343214321', '131312313123131231', '1234', '12345678');

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
