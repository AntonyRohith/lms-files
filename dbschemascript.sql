/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : capestart

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2021-02-12 07:36:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `AUTHOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUTHOR_NAME` varchar(45) NOT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  PRIMARY KEY (`AUTHOR_ID`),
  UNIQUE KEY `AUTHOR_NAME_UNIQUE` (`AUTHOR_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `BOOK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BOOK_NAME` varchar(45) NOT NULL,
  `IMAGE_PATH` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `PUBLISHER_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  `IS_AVAILABLE` varchar(1) NOT NULL,
  `AVAILABLE_TIME` date DEFAULT NULL,
  PRIMARY KEY (`BOOK_ID`),
  KEY `AUTHOR_idx` (`AUTHOR_ID`),
  KEY `USER_idx` (`USER_ID`),
  KEY `PUBLISHER_idx` (`PUBLISHER_ID`),
  CONSTRAINT `AUTHOR` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `author` (`AUTHOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `PUBLISHER` FOREIGN KEY (`PUBLISHER_ID`) REFERENCES `publisher` (`PUBLISHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for `publisher`
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher` (
  `PUBLISHER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PUBLISHER_NAME` varchar(45) NOT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  PRIMARY KEY (`PUBLISHER_ID`),
  UNIQUE KEY `PUBLISHER_NAME_UNIQUE` (`PUBLISHER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `IS_ADMIN` varchar(1) NOT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_NAME_UNIQUE` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
