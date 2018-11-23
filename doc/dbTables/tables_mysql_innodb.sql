/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : kettle

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 23/11/2018 23:08:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for COMPARE_SQL
-- ----------------------------
DROP TABLE IF EXISTS `COMPARE_SQL`;
CREATE TABLE `COMPARE_SQL`  (
  `ID_COMPARE_SQL` bigint(64) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源库ID',
  `ID_DATABASE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ID in r_databsae table',
  `ID_REFERENCE_DB` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参考sql数据库ID',
  `ID_COMPARE_TABLE_GROUP` bigint(64) NULL DEFAULT NULL COMMENT 'ID in profile_table_group',
  `COMPARE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'profile_name',
  `COMPARE_DESC` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'compare desc',
  `COMPARE_TYPE` int(11) NULL DEFAULT 1 COMMENT '1 for one value compare, 2 for multi-value compare, default 1',
  `SQL` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `REFERENCE_SQL` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `USER_ID` bigint(64) NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_COMPARE_SQL`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for COMPARE_SQL_COLUMN
-- ----------------------------
DROP TABLE IF EXISTS `COMPARE_SQL_COLUMN`;
CREATE TABLE `COMPARE_SQL_COLUMN`  (
  `ID_COMPARE_SQL_COLUMN` bigint(64) NOT NULL AUTO_INCREMENT,
  `COLUMN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `COLUMN_TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `REFERENCE_COLUMN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `COLUMN_DESC` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_COMPARE_SQL` bigint(64) NOT NULL DEFAULT 0,
  `COMPARE_STYLE` int(11) NULL DEFAULT NULL COMMENT '0 等值比较，1 范围比较',
  `MIN_RATIO` decimal(20, 5) NULL DEFAULT NULL,
  `MAX_RATIO` decimal(20, 5) NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_COMPARE_SQL_COLUMN`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for COMPARE_SQL_RESULT
-- ----------------------------
DROP TABLE IF EXISTS `COMPARE_SQL_RESULT`;
CREATE TABLE `COMPARE_SQL_RESULT`  (
  `ID_COMPARE_SQL_RESULT` bigint(64) NOT NULL AUTO_INCREMENT,
  `ID_COMPARE_SQL_COLUMN` bigint(64) NULL DEFAULT NULL,
  `COLUMN_VALUE` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `REFERENCE_COLUMN_VALUE` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `COMPARE_RESULT` int(11) NULL DEFAULT NULL COMMENT '1 equals,   0  not equals',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_COMPARE_SQL_RESULT`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASERVICE_AUTH
-- ----------------------------
DROP TABLE IF EXISTS `DATASERVICE_AUTH`;
CREATE TABLE `DATASERVICE_AUTH`  (
  `AUTH_ID` bigint(64) NOT NULL,
  `USER_ID` bigint(64) NULL DEFAULT NULL,
  `SERVICE_ID` bigint(64) NULL DEFAULT NULL,
  `AUTH_IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USE_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USE_DEPT` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`AUTH_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASERVICE_INTERFACE
-- ----------------------------
DROP TABLE IF EXISTS `DATASERVICE_INTERFACE`;
CREATE TABLE `DATASERVICE_INTERFACE`  (
  `SERVICE_ID` bigint(64) NOT NULL,
  `SERVICE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SERVICE_IDENTIFY` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Client调用时唯一识别的标示',
  `SERVICE_URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_TYPE` int(11) NULL DEFAULT NULL COMMENT '1表示job，2表示trans，3表示自定义',
  `TRANS_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `RETURN_TYPE` int(11) NULL DEFAULT NULL COMMENT '用户可以自己选的，只支持FTP和Webservice\r\n            1表示FTP，2表示Webservice\r\n            ',
  `DATASOURCE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TIMEOUT` int(11) NULL DEFAULT NULL COMMENT '服务接口生成的结果数据超时时间，超过这个时间就要删除数据，单位分钟',
  `IS_COMPRESS` int(11) NULL DEFAULT NULL COMMENT '1表示压缩，0表示不压缩',
  `TABLENAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DELIMITER` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FIELDS` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CONDITIONS` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `INTERFACE_DESC` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_DATABASE` bigint(20) NULL DEFAULT NULL,
  `job_Config_Id` int(11) NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`SERVICE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASERVICE_JOB_LOG
-- ----------------------------
DROP TABLE IF EXISTS `DATASERVICE_JOB_LOG`;
CREATE TABLE `DATASERVICE_JOB_LOG`  (
  `ID_JOB` bigint(64) NOT NULL,
  `MONITOR_ID` bigint(64) NULL DEFAULT NULL,
  `JOB_CONFIG_ID` bigint(64) NULL DEFAULT NULL COMMENT '对应r_job表中的ID_JOB主键',
  `CHANNEL_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '唯一，通UUID表示\r\n            ',
  `JOBName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_CN_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LINES_READ` bigint(20) NULL DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) NULL DEFAULT NULL,
  `LINES_UPDATED` bigint(20) NULL DEFAULT NULL,
  `LINES_INPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_REJECTED` bigint(20) NULL DEFAULT NULL,
  `ERRORS` bigint(20) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `LOGDATE` datetime(0) NULL DEFAULT NULL,
  `DEPDATE` datetime(0) NULL DEFAULT NULL,
  `REPLAYDATE` datetime(0) NULL DEFAULT NULL,
  `LOG_FIELD` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `EXECUTING_SERVER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EXECUTING_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EXCUTOR_TYPE` tinyint(4) NULL DEFAULT NULL COMMENT '1:表示本地，2表示远程，3表示集群',
  `JOB_LOG` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_JOB`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASERVICE_MONITOR
-- ----------------------------
DROP TABLE IF EXISTS `DATASERVICE_MONITOR`;
CREATE TABLE `DATASERVICE_MONITOR`  (
  `MONITOR_ID` bigint(64) NOT NULL,
  `SERVICE_ID` bigint(64) NULL DEFAULT NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `systemName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`MONITOR_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASERVICE_MONITOR_STEP_INFO
-- ----------------------------
DROP TABLE IF EXISTS `DATASERVICE_MONITOR_STEP_INFO`;
CREATE TABLE `DATASERVICE_MONITOR_STEP_INFO`  (
  `STEP_ID` bigint(64) NOT NULL,
  `MONITOR_ID` bigint(64) NULL DEFAULT NULL,
  `STEPNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `READRECORDCOUNT` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `RETURNRECORDCOUNT` bit(20) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `COSTTIME` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `LOGINFO` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`STEP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASERVICE_USER
-- ----------------------------
DROP TABLE IF EXISTS `DATASERVICE_USER`;
CREATE TABLE `DATASERVICE_USER`  (
  `USER_ID` bigint(64) NOT NULL,
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SYSTEM_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SYSTEM_IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SYSTEM_DESC` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASOURCE_FTP
-- ----------------------------
DROP TABLE IF EXISTS `DATASOURCE_FTP`;
CREATE TABLE `DATASOURCE_FTP`  (
  `ID_FTP` bigint(64) NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `HOST_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PORT` int(11) NULL DEFAULT NULL,
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_ID` bigint(20) NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_FTP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'FTP管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATASOURCE_HADOOP
-- ----------------------------
DROP TABLE IF EXISTS `DATASOURCE_HADOOP`;
CREATE TABLE `DATASOURCE_HADOOP`  (
  `ID` bigint(11) NOT NULL,
  `SERVER` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PORT` int(11) NULL DEFAULT NULL,
  `USERID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_ID` bigint(20) NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'HADOOP管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for HA_CLUSTER
-- ----------------------------
DROP TABLE IF EXISTS `HA_CLUSTER`;
CREATE TABLE `HA_CLUSTER`  (
  `ID_CLUSTER` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `BASE_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SOCKETS_BUFFER_SIZE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SOCKETS_FLUSH_INTERVAL` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SOCKETS_COMPRESSED` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DYNAMIC_CLUSTER` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HA_CLUSTER
-- ----------------------------
INSERT INTO `HA_CLUSTER` VALUES (95956437, 'AB', '', '', '', '0', '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for HA_CLUSTER_SLAVE
-- ----------------------------
DROP TABLE IF EXISTS `HA_CLUSTER_SLAVE`;
CREATE TABLE `HA_CLUSTER_SLAVE`  (
  `ID_CLUSTER_SLAVE` bigint(20) NOT NULL,
  `ID_CLUSTER` int(11) NULL DEFAULT NULL,
  `ID_SLAVE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HA_CLUSTER_SLAVE
-- ----------------------------
INSERT INTO `HA_CLUSTER_SLAVE` VALUES (82233787, 95956437, 21834816);
INSERT INTO `HA_CLUSTER_SLAVE` VALUES (95219815, 95956437, 72721548);

-- ----------------------------
-- Table structure for HA_SLAVE
-- ----------------------------
DROP TABLE IF EXISTS `HA_SLAVE`;
CREATE TABLE `HA_SLAVE`  (
  `ID_SLAVE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `WEB_APP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROXY_HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROXY_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NON_PROXY_HOSTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MASTER` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HA_SLAVE
-- ----------------------------
INSERT INTO `HA_SLAVE` VALUES (21834816, 'bb', '127.0.0.1', '9090', '', 'cluster', 'cluster', '', '', '0', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `HA_SLAVE` VALUES (72721548, 'aa', '127.0.0.1', '8080', '', 'cluster', 'cluster', '', '', '0', '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for HA_SLAVE_STATUS
-- ----------------------------
DROP TABLE IF EXISTS `HA_SLAVE_STATUS`;
CREATE TABLE `HA_SLAVE_STATUS`  (
  `ID_STATUS` int(11) NULL DEFAULT NULL,
  `ID_SLAVE` int(11) NULL DEFAULT NULL,
  `IS_RUNING` int(11) NULL DEFAULT NULL,
  `CPU_USAGE` float NULL DEFAULT NULL,
  `MEMORY_USAGE` float NULL DEFAULT NULL,
  `RUNING_JOBS_NUM` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HA_SLAVE_STATUS
-- ----------------------------
INSERT INTO `HA_SLAVE_STATUS` VALUES (NULL, 72721548, 0, 0, 0, 0);
INSERT INTO `HA_SLAVE_STATUS` VALUES (NULL, 21834816, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for LOG_JOB
-- ----------------------------
DROP TABLE IF EXISTS `LOG_JOB`;
CREATE TABLE `LOG_JOB`  (
  `LOG_JOB_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_CONFIG_ID` bigint(20) NULL DEFAULT NULL COMMENT '对应r_job表中的ID_JOB主键',
  `CHANNEL_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '唯一，通UUID表示\r\n            ',
  `JOB_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_CN_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STATUS` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LINES_READ` bigint(20) NULL DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) NULL DEFAULT NULL,
  `LINES_UPDATED` bigint(20) NULL DEFAULT NULL,
  `LINES_INPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_REJECTED` bigint(20) NULL DEFAULT NULL,
  `ERRORS` bigint(20) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `LOGDATE` datetime(0) NULL DEFAULT NULL,
  `DEPDATE` datetime(0) NULL DEFAULT NULL,
  `REPLAYDATE` datetime(0) NULL DEFAULT NULL,
  `LOG_FIELD` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `EXECUTING_SERVER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EXECUTING_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EXCUTOR_TYPE` tinyint(4) NULL DEFAULT NULL COMMENT '1:表示本地，2表示远程，3表示集群',
  `JOB_LOG` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`LOG_JOB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for LOG_JOB_STEP
-- ----------------------------
DROP TABLE IF EXISTS `LOG_JOB_STEP`;
CREATE TABLE `LOG_JOB_STEP`  (
  `LOG_JOB_STEP_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LOG_JOB_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CHANNEL_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LOG_DATE` datetime(0) NULL DEFAULT NULL,
  `JOBNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '父JOB的名称',
  `STEPNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LINES_READ` bigint(20) NULL DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) NULL DEFAULT NULL,
  `LINES_UPDATED` bigint(20) NULL DEFAULT NULL,
  `LINES_INPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_REJECTED` bigint(20) NULL DEFAULT NULL,
  `ERRORS` bigint(20) NULL DEFAULT NULL,
  `RESULT` bigint(20) NULL DEFAULT NULL,
  `NR_RESULT_ROWS` tinyint(4) NULL DEFAULT NULL,
  `NR_RESULT_FILES` bigint(20) NULL DEFAULT NULL,
  `LOG_FIELD` bigint(20) NULL DEFAULT NULL COMMENT '日志字段为这个特定的工作条目包含错误日志日志LOG_FIELD',
  `COPY_NR` bigint(20) NULL DEFAULT NULL,
  `SETP_LOG` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`LOG_JOB_STEP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for LOG_TRANS
-- ----------------------------
DROP TABLE IF EXISTS `LOG_TRANS`;
CREATE TABLE `LOG_TRANS`  (
  `LOG_TRANS_ID` bigint(64) NOT NULL,
  `TRANS_CONFIG_ID` bigint(20) NOT NULL COMMENT '对应转换表 R_TRANSFORMATION 中的ID_TRANSFORMATION 字段',
  `CHANNEL_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRANSNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LINES_READ` bigint(20) NULL DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) NULL DEFAULT NULL,
  `LINES_UPDATED` bigint(20) NULL DEFAULT NULL,
  `LINES_INPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_REJECTED` bigint(20) NULL DEFAULT NULL,
  `ERRORS` bigint(20) NULL DEFAULT NULL,
  `STARTDATE` datetime(0) NULL DEFAULT NULL,
  `ENDDATE` datetime(0) NULL DEFAULT NULL,
  `LOGDATE` datetime(0) NULL DEFAULT NULL,
  `DEPDATE` datetime(0) NULL DEFAULT NULL,
  `REPLAYDATE` datetime(0) NULL DEFAULT NULL,
  `LOG_FIELD` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `EXECUTING_SERVER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EXECUTING_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EXCUTOR_TYPE` tinyint(4) NULL DEFAULT NULL COMMENT '1:表示本地，2表示远程，3表示集群',
  `LOGINFO` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `TRANS_CN_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LOG_TRANS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of LOG_TRANS
-- ----------------------------
INSERT INTO `LOG_TRANS` VALUES (1064177910896152578, 3, '04f9cecba05b4da5ad5bc2811e5bd551', 'test', 'end', 0, NULL, NULL, 0, 0, NULL, 0, NULL, '2018-11-18 23:26:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018/11/18 23:18:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:19:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:20:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:21:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:22:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:23:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:24:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:25:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:26:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:26:00 - test - 为了转换解除补丁开始  [test]\n2018/11/18 23:26:01 - 生成记录.0 - 行号: 50000\n2018/11/18 23:26:02 - 生成记录.0 - 行号: 100000\n2018/11/18 23:26:03 - 文本文件输出.0 - linenr 50000\n2018/11/18 23:26:03 - 文本文件输出.1 - linenr 50000\n2018/11/18 23:26:04 - 生成记录.0 - 行号: 150000\n2018/11/18 23:26:05 - 生成记录.0 - 行号: 200000\n2018/11/18 23:26:06 - 文本文件输出.0 - linenr 100000\n2018/11/18 23:26:06 - 文本文件输出.1 - linenr 100000\n2018/11/18 23:26:07 - 生成记录.0 - 行号: 250000\n2018/11/18 23:26:08 - 生成记录.0 - 行号: 300000\n2018/11/18 23:26:09 - 文本文件输出.0 - linenr 150000\n2018/11/18 23:26:09 - 文本文件输出.1 - linenr 150000\n2018/11/18 23:26:09 - 生成记录.0 - 行号: 350000\n2018/11/18 23:26:11 - 生成记录.0 - 行号: 400000\n2018/11/18 23:26:12 - 文本文件输出.1 - linenr 200000\n2018/11/18 23:26:12 - 文本文件输出.0 - linenr 200000\n2018/11/18 23:26:12 - 生成记录.0 - 行号: 450000\n2018/11/18 23:26:14 - 生成记录.0 - 行号: 500000\n2018/11/18 23:26:15 - 文本文件输出.1 - linenr 250000\n2018/11/18 23:26:15 - 文本文件输出.0 - linenr 250000\n2018/11/18 23:26:15 - 生成记录.0 - 行号: 550000\n2018/11/18 23:26:17 - 生成记录.0 - 行号: 600000\n2018/11/18 23:26:18 - 文本文件输出.1 - linenr 300000\n2018/11/18 23:26:18 - 文本文件输出.0 - linenr 300000\n2018/11/18 23:26:18 - 生成记录.0 - 行号: 650000\n2018/11/18 23:26:20 - 生成记录.0 - 行号: 700000\n2018/11/18 23:26:21 - 文本文件输出.1 - linenr 350000\n2018/11/18 23:26:21 - 文本文件输出.0 - linenr 350000\n2018/11/18 23:26:22 - 生成记录.0 - 行号: 750000\n2018/11/18 23:26:23 - 生成记录.0 - 行号: 800000\n2018/11/18 23:26:24 - 文本文件输出.1 - linenr 400000\n2018/11/18 23:26:24 - 文本文件输出.0 - linenr 400000\n2018/11/18 23:26:25 - 生成记录.0 - 行号: 850000\n2018/11/18 23:26:26 - 生成记录.0 - 行号: 900000\n2018/11/18 23:26:27 - 文本文件输出.1 - linenr 450000\n2018/11/18 23:26:27 - 文本文件输出.0 - linenr 450000\n2018/11/18 23:26:28 - 生成记录.0 - 行号: 950000\n2018/11/18 23:26:30 - 生成记录.0 - 行号: 1000000\n2018/11/18 23:26:30 - 生成记录.0 - 完成处理 (I=0, O=0, R=0, W=1000000, U=0, E=0)\n2018/11/18 23:26:30 - 文本文件输出.1 - linenr 500000\n2018/11/18 23:26:30 - 文本文件输出.1 - 完成处理 (I=0, O=500000, R=500000, W=500000, U=0, E=0)\n2018/11/18 23:26:30 - 文本文件输出.0 - linenr 500000\n2018/11/18 23:26:30 - 文本文件输出.0 - 完成处理 (I=0, O=500000, R=500000, W=500000, U=0, E=0)\n', 'test');
INSERT INTO `LOG_TRANS` VALUES (1064178162978017281, 3, 'e894f4bfcc23496cb910e346056b2512', 'test', 'end', 0, NULL, NULL, 0, 0, NULL, 0, NULL, '2018-11-18 23:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018/11/18 23:18:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:19:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:20:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:21:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:22:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:23:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:24:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:25:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:26:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:27:00 - TransExecutor - !Pan.Log.Loglevel!\n2018/11/18 23:27:00 - test - 为了转换解除补丁开始  [test]\n2018/11/18 23:27:01 - 生成记录.0 - 行号: 50000\n2018/11/18 23:27:02 - 生成记录.0 - 行号: 100000\n2018/11/18 23:27:03 - 文本文件输出.1 - linenr 50000\n2018/11/18 23:27:03 - 文本文件输出.0 - linenr 50000\n2018/11/18 23:27:04 - 生成记录.0 - 行号: 150000\n2018/11/18 23:27:05 - 生成记录.0 - 行号: 200000\n2018/11/18 23:27:06 - 文本文件输出.1 - linenr 100000\n2018/11/18 23:27:06 - 文本文件输出.0 - linenr 100000\n2018/11/18 23:27:07 - 生成记录.0 - 行号: 250000\n2018/11/18 23:27:08 - 生成记录.0 - 行号: 300000\n2018/11/18 23:27:09 - 文本文件输出.1 - linenr 150000\n2018/11/18 23:27:09 - 文本文件输出.0 - linenr 150000\n2018/11/18 23:27:10 - 生成记录.0 - 行号: 350000\n2018/11/18 23:27:11 - 生成记录.0 - 行号: 400000\n2018/11/18 23:27:12 - 文本文件输出.1 - linenr 200000\n2018/11/18 23:27:12 - 文本文件输出.0 - linenr 200000\n2018/11/18 23:27:13 - 生成记录.0 - 行号: 450000\n2018/11/18 23:27:14 - 生成记录.0 - 行号: 500000\n2018/11/18 23:27:15 - 文本文件输出.1 - linenr 250000\n2018/11/18 23:27:15 - 文本文件输出.0 - linenr 250000\n2018/11/18 23:27:16 - 生成记录.0 - 行号: 550000\n2018/11/18 23:27:17 - 生成记录.0 - 行号: 600000\n2018/11/18 23:27:18 - 文本文件输出.1 - linenr 300000\n2018/11/18 23:27:18 - 文本文件输出.0 - linenr 300000\n2018/11/18 23:27:19 - 生成记录.0 - 行号: 650000\n2018/11/18 23:27:20 - 生成记录.0 - 行号: 700000\n2018/11/18 23:27:21 - 文本文件输出.1 - linenr 350000\n2018/11/18 23:27:21 - 文本文件输出.0 - linenr 350000\n2018/11/18 23:27:22 - 生成记录.0 - 行号: 750000\n2018/11/18 23:27:23 - 生成记录.0 - 行号: 800000\n2018/11/18 23:27:24 - 文本文件输出.1 - linenr 400000\n2018/11/18 23:27:24 - 文本文件输出.0 - linenr 400000\n2018/11/18 23:27:25 - 生成记录.0 - 行号: 850000\n2018/11/18 23:27:26 - 生成记录.0 - 行号: 900000\n2018/11/18 23:27:27 - 文本文件输出.1 - linenr 450000\n2018/11/18 23:27:27 - 文本文件输出.0 - linenr 450000\n2018/11/18 23:27:28 - 生成记录.0 - 行号: 950000\n2018/11/18 23:27:29 - 生成记录.0 - 行号: 1000000\n2018/11/18 23:27:29 - 生成记录.0 - 完成处理 (I=0, O=0, R=0, W=1000000, U=0, E=0)\n2018/11/18 23:27:30 - 文本文件输出.1 - linenr 500000\n2018/11/18 23:27:30 - 文本文件输出.1 - 完成处理 (I=0, O=500000, R=500000, W=500000, U=0, E=0)\n2018/11/18 23:27:30 - 文本文件输出.0 - linenr 500000\n2018/11/18 23:27:30 - 文本文件输出.0 - 完成处理 (I=0, O=500000, R=500000, W=500000, U=0, E=0)\n', 'test');

-- ----------------------------
-- Table structure for LOG_TRANS_STEP
-- ----------------------------
DROP TABLE IF EXISTS `LOG_TRANS_STEP`;
CREATE TABLE `LOG_TRANS_STEP`  (
  `LOG_TRANS_ID` bigint(64) NULL DEFAULT NULL,
  `LOG_STEP_ID` bigint(20) NOT NULL,
  `CHANNEL_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LOG_DATE` datetime(0) NULL DEFAULT NULL,
  `TRANSNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STEPNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STEP_COPY` int(11) NULL DEFAULT NULL,
  `LINES_READ` bigint(20) NULL DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) NULL DEFAULT NULL,
  `LINES_UPDATED` bigint(20) NULL DEFAULT NULL,
  `LINES_INPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) NULL DEFAULT NULL,
  `LINES_REJECTED` bigint(20) NULL DEFAULT NULL,
  `ERRORS` bigint(20) NULL DEFAULT NULL,
  `SETP_LOG` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `COSTTIME` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SPEED` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STATUS` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`LOG_STEP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of LOG_TRANS_STEP
-- ----------------------------
INSERT INTO `LOG_TRANS_STEP` VALUES (1064177910896152578, 1064177952847581186, '04f9cecba05b4da5ad5bc2811e5bd551', NULL, 'test', '生成记录', 0, 0, 1000000, 0, 0, 0, 0, 0, NULL, '30.0s', ' 33,380', '已完成');
INSERT INTO `LOG_TRANS_STEP` VALUES (1064177910896152578, 1064177952956633090, '04f9cecba05b4da5ad5bc2811e5bd551', NULL, 'test', '文本文件输出', 0, 500000, 500000, 0, 0, 500000, 0, 0, NULL, '30.6s', ' 16,336', '已完成');
INSERT INTO `LOG_TRANS_STEP` VALUES (1064177910896152578, 1064177953095045121, '04f9cecba05b4da5ad5bc2811e5bd551', NULL, 'test', '文本文件输出', 1, 500000, 500000, 0, 0, 500000, 0, 0, NULL, '30.6s', ' 16,348', '已完成');
INSERT INTO `LOG_TRANS_STEP` VALUES (1064178162978017281, 1064178204963000321, 'e894f4bfcc23496cb910e346056b2512', NULL, 'test', '生成记录', 0, 0, 1000000, 0, 0, 0, 0, 0, NULL, '29.4s', ' 34,056', '已完成');
INSERT INTO `LOG_TRANS_STEP` VALUES (1064178162978017281, 1064178205151744001, 'e894f4bfcc23496cb910e346056b2512', NULL, 'test', '文本文件输出', 0, 500000, 500000, 0, 0, 500000, 0, 0, NULL, '30.0s', ' 16,693', '已完成');
INSERT INTO `LOG_TRANS_STEP` VALUES (1064178162978017281, 1064178205365653505, 'e894f4bfcc23496cb910e346056b2512', NULL, 'test', '文本文件输出', 1, 500000, 500000, 0, 0, 500000, 0, 0, NULL, '29.9s', ' 16,709', '已完成');

-- ----------------------------
-- Table structure for MDM_DATA_CLEAN
-- ----------------------------
DROP TABLE IF EXISTS `MDM_DATA_CLEAN`;
CREATE TABLE `MDM_DATA_CLEAN`  (
  `ID` bigint(64) NOT NULL,
  `ID_MODEL` bigint(64) NULL DEFAULT NULL,
  `ATTRIBUTE_MODEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `REPOSITORY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MDM_ID_DATABASE` bigint(20) NULL DEFAULT NULL,
  `MDM_SCHEMA_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MDM_TABLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MDM_PRIMARY_KEY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MDM_COLUMN_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MDM_WHERE_CONDITION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MAPING_MODE` int(11) NULL DEFAULT NULL,
  `MAPING_ID_DATABASE` bigint(20) NULL DEFAULT NULL,
  `MAPING_SCHEMA_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MAPING_TABLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据映射' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for MDM_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `MDM_MODEL`;
CREATE TABLE `MDM_MODEL`  (
  `ID_MODEL` bigint(64) NOT NULL DEFAULT 0,
  `MODEL_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODEL_DESC` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODEL_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODEL_AUTHOR` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODEL_NOTE` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODEL_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_MODEL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '主数据模型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for MDM_MODEL_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `MDM_MODEL_ATTRIBUTE`;
CREATE TABLE `MDM_MODEL_ATTRIBUTE`  (
  `ID_ATTRIBUTE` bigint(64) NOT NULL DEFAULT 0,
  `ID_MODEL` bigint(64) NULL DEFAULT NULL,
  `ATTRIBUTE_ORDER` int(11) NULL DEFAULT NULL,
  `ATTRIBUTE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STATISTIC_TYPE` int(11) NULL DEFAULT NULL COMMENT '1.枚举，2.计算数值 3非结构化文本 4其它',
  `FIELD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字段名称',
  `FIELD_TYPE` int(11) NULL DEFAULT NULL COMMENT 'kettle 里的数据类型编码',
  `FIELD_LENGTH` int(11) NULL DEFAULT NULL COMMENT '字段长度',
  `IS_PRIMARY` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FIELD_PRECISION` int(11) NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_ATTRIBUTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '主数据模型属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for MDM_MODEL_CONSTAINT
-- ----------------------------
DROP TABLE IF EXISTS `MDM_MODEL_CONSTAINT`;
CREATE TABLE `MDM_MODEL_CONSTAINT`  (
  `ID_CONSTAINT` bigint(64) NOT NULL DEFAULT 0,
  `CONSTAINT_ORDER` int(11) NULL DEFAULT NULL,
  `CONSTAINT_TYPE` int(11) NULL DEFAULT NULL COMMENT '1 唯一  2 非空  3外键',
  `CONSTAINT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '约束名称',
  `ID_ATTRIBUTE` bigint(64) NULL DEFAULT NULL,
  `REFERENCE_ID_MODEL` bigint(64) NULL DEFAULT NULL,
  `REFERENCE_ID_ATTRIBUTE` bigint(64) NULL DEFAULT NULL,
  `ALIAS_TABLE_FLAG` int(11) NULL DEFAULT 0 COMMENT '是否为字符类型的唯一约束数据，创建别名表（0否   1 是）',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_CONSTAINT`) USING BTREE,
  INDEX `mdm_model_constaint1`(`ID_ATTRIBUTE`) USING BTREE,
  CONSTRAINT `mdm_model_constaint1` FOREIGN KEY (`ID_ATTRIBUTE`) REFERENCES `MDM_MODEL_ATTRIBUTE` (`ID_ATTRIBUTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '主数据模型属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for MDM_REL_CONS_ATTR
-- ----------------------------
DROP TABLE IF EXISTS `MDM_REL_CONS_ATTR`;
CREATE TABLE `MDM_REL_CONS_ATTR`  (
  `ID_REL_CONS_ATTR` bigint(64) NOT NULL AUTO_INCREMENT,
  `ID_CONSTAINT` bigint(64) NULL DEFAULT NULL,
  `ID_ATTRIBUTE` bigint(64) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_REL_CONS_ATTR`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for MDM_TABLE
-- ----------------------------
DROP TABLE IF EXISTS `MDM_TABLE`;
CREATE TABLE `MDM_TABLE`  (
  `ID_TABLE` bigint(64) NOT NULL DEFAULT 0,
  `ID_MODEL` bigint(64) NULL DEFAULT NULL COMMENT 'ID in model table',
  `REPOSITORY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源库名称',
  `ID_DATABASE` bigint(20) NULL DEFAULT NULL COMMENT 'ID in r_databsae table',
  `SCHEMA_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TABLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_TABLE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '主数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PROFILE_TABLE
-- ----------------------------
DROP TABLE IF EXISTS `PROFILE_TABLE`;
CREATE TABLE `PROFILE_TABLE`  (
  `ID_PROFILE_TABLE` bigint(64) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源库名称',
  `ID_DATABASE` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ID in r_databsae table',
  `ID_PROFIEL_TABLE_GROUP` bigint(64) NULL DEFAULT NULL COMMENT 'ID in profile_table_group',
  `PROFIEL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'profile_name',
  `PROFIEL_DESC` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'profile_name',
  `SCHEMA_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TABLE_NAME` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `CONDITION` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `USER_ID` bigint(64) NULL DEFAULT NULL,
  `TABLE_NAME_TAG` int(11) NULL DEFAULT NULL COMMENT '1:表示TABLE_NAME为表名 2：TABLE_NAME为sql',
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_PROFILE_TABLE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PROFILE_TABLE_COLUMN
-- ----------------------------
DROP TABLE IF EXISTS `PROFILE_TABLE_COLUMN`;
CREATE TABLE `PROFILE_TABLE_COLUMN`  (
  `ID_PROFILE_TABLE_COLUMN` bigint(64) NOT NULL AUTO_INCREMENT,
  `ID_PROFILE_TABLE` bigint(64) NOT NULL DEFAULT 0,
  `PROFILE_TABLE_COLUMN_NAME` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROFILE_TABLE_COLUMN_TYPE` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字段类型',
  `PROFILE_TABLE_COLUMN_SIZE` int(11) NULL DEFAULT NULL,
  `PROFILE_TABLE_COLUMN_PRECISION` int(11) NULL DEFAULT NULL COMMENT '精度',
  `PROFILE_TABLE_COLUMN_DESC` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROFILE_TABLE_COLUMN_ORDER` int(11) NULL DEFAULT NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_PROFILE_TABLE_COLUMN`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PROFILE_TABLE_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `PROFILE_TABLE_GROUP`;
CREATE TABLE `PROFILE_TABLE_GROUP`  (
  `ID_PROFIEL_TABLE_GROUP` bigint(64) NOT NULL AUTO_INCREMENT,
  `PROFIEL_TABLE_GROUP_NAME` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROFIEL_TABLE_GROUP_DESC` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_PROFIEL_TABLE_GROUP`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PROFILE_TABLE_GROUP
-- ----------------------------
INSERT INTO `PROFILE_TABLE_GROUP` VALUES (1, 'A', 'A', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for PROFILE_TABLE_RESULT
-- ----------------------------
DROP TABLE IF EXISTS `PROFILE_TABLE_RESULT`;
CREATE TABLE `PROFILE_TABLE_RESULT`  (
  `ID_PROFILE_TABLE_RESULT` bigint(64) NOT NULL AUTO_INCREMENT,
  `ID_PROFILE_TABLE_COLUMN` bigint(64) NOT NULL COMMENT 'COLUMN ID',
  `INDICATOR_DATA_TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `INDICATOR_DATA_LENGTH` int(11) NULL DEFAULT NULL,
  `INDICATOR_DATA_PRECISION` int(11) NULL DEFAULT NULL,
  `INDICATOR_DATA_SCALE` int(11) NULL DEFAULT NULL,
  `INDICATOR_ALL_COUNT` int(11) NULL DEFAULT NULL,
  `INDICATOR_DISTINCT_COUNT` int(11) NULL DEFAULT NULL,
  `INDICATOR_NULL_COUNT` int(11) NULL DEFAULT NULL,
  `INDICATOR_ZERO_COUNT` int(11) NULL DEFAULT NULL,
  `INDICATOR_AGG_AVG` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `INDICATOR_AGG_MAX` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `INDICATOR_AGG_MIN` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `EXECUTE_SQL` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` int(11) NULL DEFAULT NULL COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_PROFILE_TABLE_RESULT`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_GROUP`;
CREATE TABLE `QRTZ_GROUP`  (
  `ID_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分组ID',
  `ORGANIZER_ID` bigint(20) NOT NULL COMMENT '组织ID',
  `GROUP_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分组名称',
  `DESCRIPTION` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '分组描述',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '调度分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_GROUP
-- ----------------------------
INSERT INTO `QRTZ_GROUP` VALUES ('1065155930591145986', 2, '默认分组', '默认分组', 'admin', 'admin', '2018-11-21 16:12:18', '2018-11-21 16:35:11', 1);
INSERT INTO `QRTZ_GROUP` VALUES ('1065160967417577473', 2, '测试分组', '测试分组', 'admin', 'admin', '2018-11-21 16:32:19', '2018-11-23 16:41:02', 0);
INSERT INTO `QRTZ_GROUP` VALUES ('1065967071038812161', 2, '默认分组', '默认分组', 'admin', 'admin', '2018-11-23 21:55:29', '2018-11-23 21:55:29', 0);

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_JOB_ORGANIZER
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_ORGANIZER`;
CREATE TABLE `QRTZ_JOB_ORGANIZER`  (
  `ORGANIZER_ID` bigint(64) NOT NULL COMMENT '组织ID',
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度分组名称',
  PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`, `ORGANIZER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '调度用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_CLUSTER
-- ----------------------------
DROP TABLE IF EXISTS `R_CLUSTER`;
CREATE TABLE `R_CLUSTER`  (
  `ID_CLUSTER` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `BASE_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SOCKETS_BUFFER_SIZE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SOCKETS_FLUSH_INTERVAL` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SOCKETS_COMPRESSED` tinyint(1) NULL DEFAULT NULL,
  `DYNAMIC_CLUSTER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_CLUSTER_SLAVE
-- ----------------------------
DROP TABLE IF EXISTS `R_CLUSTER_SLAVE`;
CREATE TABLE `R_CLUSTER_SLAVE`  (
  `ID_CLUSTER_SLAVE` bigint(20) NOT NULL,
  `ID_CLUSTER` int(11) NULL DEFAULT NULL,
  `ID_SLAVE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_CONDITION
-- ----------------------------
DROP TABLE IF EXISTS `R_CONDITION`;
CREATE TABLE `R_CONDITION`  (
  `ID_CONDITION` bigint(20) NOT NULL,
  `ID_CONDITION_PARENT` int(11) NULL DEFAULT NULL,
  `NEGATED` tinyint(1) NULL DEFAULT NULL,
  `OPERATOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LEFT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CONDITION_FUNCTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `RIGHT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_VALUE_RIGHT` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CONDITION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_DATABASE
-- ----------------------------
DROP TABLE IF EXISTS `R_DATABASE`;
CREATE TABLE `R_DATABASE`  (
  `ID_DATABASE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_DATABASE_TYPE` int(11) NULL DEFAULT NULL,
  `ID_DATABASE_CONTYPE` int(11) NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DATABASE_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `PORT` int(11) NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SERVERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DATA_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `INDEX_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_ID` bigint(64) NOT NULL COMMENT '组织ID',
  `CREATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_DATABASE
-- ----------------------------
INSERT INTO `R_DATABASE` VALUES (1, 'a', 19, 1, 'a', 'a', 1433, 'a', 'Encrypted 2be98afc86aa7f2e4cb79ce10bef2cfdb', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for R_DATABASE_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `R_DATABASE_ATTRIBUTE`;
CREATE TABLE `R_DATABASE_ATTRIBUTE`  (
  `ID_DATABASE_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_DATABASE_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RDAT`(`ID_DATABASE`, `CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_DATABASE_ATTRIBUTE
-- ----------------------------
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (1, 1, 'MSSQL_DOUBLE_DECIMAL_SEPARATOR', 'N');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (2, 1, 'USE_POOLING', 'N');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (3, 1, 'PRESERVE_RESERVED_WORD_CASE', 'Y');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (4, 1, 'IS_CLUSTERED', 'N');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (5, 1, 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (6, 1, 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (7, 1, 'PORT_NUMBER', '1433');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (8, 1, 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (9, 1, 'PREFERRED_SCHEMA_NAME', NULL);
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (10, 1, 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (11, 1, 'SQL_CONNECT', NULL);
INSERT INTO `R_DATABASE_ATTRIBUTE` VALUES (12, 1, 'QUOTE_ALL_FIELDS', 'N');

-- ----------------------------
-- Table structure for R_DATABASE_CONTYPE
-- ----------------------------
DROP TABLE IF EXISTS `R_DATABASE_CONTYPE`;
CREATE TABLE `R_DATABASE_CONTYPE`  (
  `ID_DATABASE_CONTYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_CONTYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_DATABASE_CONTYPE
-- ----------------------------
INSERT INTO `R_DATABASE_CONTYPE` VALUES (1, 'Native', 'Native (JDBC)');
INSERT INTO `R_DATABASE_CONTYPE` VALUES (2, 'ODBC', 'ODBC');
INSERT INTO `R_DATABASE_CONTYPE` VALUES (3, 'OCI', 'OCI');
INSERT INTO `R_DATABASE_CONTYPE` VALUES (4, 'Plugin', 'Plugin specific access method');
INSERT INTO `R_DATABASE_CONTYPE` VALUES (5, 'JNDI', 'JNDI');
INSERT INTO `R_DATABASE_CONTYPE` VALUES (6, ',', 'Custom');

-- ----------------------------
-- Table structure for R_DATABASE_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `R_DATABASE_TYPE`;
CREATE TABLE `R_DATABASE_TYPE`  (
  `ID_DATABASE_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_DATABASE_TYPE
-- ----------------------------
INSERT INTO `R_DATABASE_TYPE` VALUES (1, 'INGRES', 'Ingres');
INSERT INTO `R_DATABASE_TYPE` VALUES (2, 'MARIADB', 'MariaDB');
INSERT INTO `R_DATABASE_TYPE` VALUES (3, 'INTERBASE', 'Borland Interbase');
INSERT INTO `R_DATABASE_TYPE` VALUES (4, 'INFOBRIGHT', 'Infobright');
INSERT INTO `R_DATABASE_TYPE` VALUES (5, 'HIVE', 'Hadoop Hive');
INSERT INTO `R_DATABASE_TYPE` VALUES (6, 'ORACLE', 'Oracle');
INSERT INTO `R_DATABASE_TYPE` VALUES (7, 'EXTENDB', 'ExtenDB');
INSERT INTO `R_DATABASE_TYPE` VALUES (8, 'MSACCESS', 'MS Access');
INSERT INTO `R_DATABASE_TYPE` VALUES (9, 'SYBASE', 'Sybase');
INSERT INTO `R_DATABASE_TYPE` VALUES (10, 'PALO', 'Palo MOLAP Server');
INSERT INTO `R_DATABASE_TYPE` VALUES (11, 'INFORMIX', 'Informix');
INSERT INTO `R_DATABASE_TYPE` VALUES (12, 'LucidDB', 'LucidDB');
INSERT INTO `R_DATABASE_TYPE` VALUES (13, 'SPARKSIMBA', 'SparkSQL');
INSERT INTO `R_DATABASE_TYPE` VALUES (14, 'TERADATA', 'Teradata');
INSERT INTO `R_DATABASE_TYPE` VALUES (15, 'UNIVERSE', 'UniVerse database');
INSERT INTO `R_DATABASE_TYPE` VALUES (16, 'HIVE2', 'Hadoop Hive 2');
INSERT INTO `R_DATABASE_TYPE` VALUES (17, 'MONETDB', 'MonetDB');
INSERT INTO `R_DATABASE_TYPE` VALUES (18, 'CACHE', 'Intersystems Cache');
INSERT INTO `R_DATABASE_TYPE` VALUES (19, 'MSSQL', 'MS SQL Server');
INSERT INTO `R_DATABASE_TYPE` VALUES (20, 'GREENPLUM', 'Greenplum');
INSERT INTO `R_DATABASE_TYPE` VALUES (21, 'GENERIC', 'Generic database');
INSERT INTO `R_DATABASE_TYPE` VALUES (22, 'SQLITE', 'SQLite');
INSERT INTO `R_DATABASE_TYPE` VALUES (23, 'REMEDY-AR-SYSTEM', 'Remedy Action Request System');
INSERT INTO `R_DATABASE_TYPE` VALUES (24, 'MONDRIAN', 'Native Mondrian');
INSERT INTO `R_DATABASE_TYPE` VALUES (25, 'NETEZZA', 'Netezza');
INSERT INTO `R_DATABASE_TYPE` VALUES (26, 'VERTICA5', 'Vertica 5+');
INSERT INTO `R_DATABASE_TYPE` VALUES (27, 'POSTGRESQL', 'PostgreSQL');
INSERT INTO `R_DATABASE_TYPE` VALUES (28, 'KettleThin', 'Pentaho Data Services');
INSERT INTO `R_DATABASE_TYPE` VALUES (29, 'EXASOL4', 'Exasol 4');
INSERT INTO `R_DATABASE_TYPE` VALUES (30, 'HYPERSONIC', 'Hypersonic');
INSERT INTO `R_DATABASE_TYPE` VALUES (31, 'AS/400', 'AS/400');
INSERT INTO `R_DATABASE_TYPE` VALUES (32, 'ORACLERDB', 'Oracle RDB');
INSERT INTO `R_DATABASE_TYPE` VALUES (33, 'DBASE', 'dBase III, IV or 5');
INSERT INTO `R_DATABASE_TYPE` VALUES (34, 'KINGBASEES', 'KingbaseES');
INSERT INTO `R_DATABASE_TYPE` VALUES (35, 'SAPR3', 'SAP ERP System');
INSERT INTO `R_DATABASE_TYPE` VALUES (36, 'SQLBASE', 'Gupta SQL Base');
INSERT INTO `R_DATABASE_TYPE` VALUES (37, 'DERBY', 'Apache Derby');
INSERT INTO `R_DATABASE_TYPE` VALUES (38, 'VERTICA', 'Vertica');
INSERT INTO `R_DATABASE_TYPE` VALUES (39, 'INFINIDB', 'Calpont InfiniDB');
INSERT INTO `R_DATABASE_TYPE` VALUES (40, 'MYSQL', 'MySQL');
INSERT INTO `R_DATABASE_TYPE` VALUES (41, 'MSSQLNATIVE', 'MS SQL Server (Native)');
INSERT INTO `R_DATABASE_TYPE` VALUES (42, 'H2', 'H2');
INSERT INTO `R_DATABASE_TYPE` VALUES (43, 'IMPALA', 'Impala');
INSERT INTO `R_DATABASE_TYPE` VALUES (44, 'SAPDB', 'MaxDB (SAP DB)');
INSERT INTO `R_DATABASE_TYPE` VALUES (45, 'VECTORWISE', 'Ingres VectorWise');
INSERT INTO `R_DATABASE_TYPE` VALUES (46, 'DB2', 'IBM DB2');
INSERT INTO `R_DATABASE_TYPE` VALUES (47, 'NEOVIEW', 'Neoview');
INSERT INTO `R_DATABASE_TYPE` VALUES (48, 'IMPALASIMBA', 'Cloudera Impala');
INSERT INTO `R_DATABASE_TYPE` VALUES (49, 'SYBASEIQ', 'SybaseIQ');
INSERT INTO `R_DATABASE_TYPE` VALUES (50, 'REDSHIFT', 'Redshift');
INSERT INTO `R_DATABASE_TYPE` VALUES (51, 'FIREBIRD', 'Firebird SQL');
INSERT INTO `R_DATABASE_TYPE` VALUES (52, 'OpenERPDatabaseMeta', 'OpenERP Server');
INSERT INTO `R_DATABASE_TYPE` VALUES (53, 'GOOGLEBIGQUERY', 'Google BigQuery');

-- ----------------------------
-- Table structure for R_DEPENDENCY
-- ----------------------------
DROP TABLE IF EXISTS `R_DEPENDENCY`;
CREATE TABLE `R_DEPENDENCY`  (
  `ID_DEPENDENCY` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  `TABLE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FIELD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENDENCY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_DIRECTORY
-- ----------------------------
DROP TABLE IF EXISTS `R_DIRECTORY`;
CREATE TABLE `R_DIRECTORY`  (
  `ID_DIRECTORY` bigint(20) NOT NULL,
  `ID_DIRECTORY_PARENT` int(11) NULL DEFAULT NULL,
  `DIRECTORY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DIRECTORY`) USING BTREE,
  UNIQUE INDEX `IDX_RDIR`(`ID_DIRECTORY_PARENT`, `DIRECTORY_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_DIRECTORY
-- ----------------------------
INSERT INTO `R_DIRECTORY` VALUES (1, 0, 'test');

-- ----------------------------
-- Table structure for R_ELEMENT
-- ----------------------------
DROP TABLE IF EXISTS `R_ELEMENT`;
CREATE TABLE `R_ELEMENT`  (
  `ID_ELEMENT` bigint(20) NOT NULL,
  `ID_ELEMENT_TYPE` int(11) NULL DEFAULT NULL,
  `NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_ELEMENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_ELEMENT_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `R_ELEMENT_ATTRIBUTE`;
CREATE TABLE `R_ELEMENT_ATTRIBUTE`  (
  `ID_ELEMENT_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_ELEMENT` int(11) NULL DEFAULT NULL,
  `ID_ELEMENT_ATTRIBUTE_PARENT` int(11) NULL DEFAULT NULL,
  `ATTR_KEY` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ATTR_VALUE` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_ELEMENT_ATTRIBUTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_ELEMENT_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `R_ELEMENT_TYPE`;
CREATE TABLE `R_ELEMENT_TYPE`  (
  `ID_ELEMENT_TYPE` bigint(20) NOT NULL,
  `ID_NAMESPACE` int(11) NULL DEFAULT NULL,
  `NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_ELEMENT_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOB
-- ----------------------------
DROP TABLE IF EXISTS `R_JOB`;
CREATE TABLE `R_JOB`  (
  `ID_JOB` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `EXTENDED_DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `JOB_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JOB_STATUS` int(11) NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime(0) NULL DEFAULT NULL,
  `MODIFIED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime(0) NULL DEFAULT NULL,
  `USE_BATCH_ID` tinyint(1) NULL DEFAULT NULL,
  `PASS_BATCH_ID` tinyint(1) NULL DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) NULL DEFAULT NULL,
  `SHARED_FILE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOBENTRY
-- ----------------------------
DROP TABLE IF EXISTS `R_JOBENTRY`;
CREATE TABLE `R_JOBENTRY`  (
  `ID_JOBENTRY` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_JOBENTRY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOBENTRY_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `R_JOBENTRY_ATTRIBUTE`;
CREATE TABLE `R_JOBENTRY_ATTRIBUTE`  (
  `ID_JOBENTRY_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_NUM` double NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_JOBENTRY_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RJEA`(`ID_JOBENTRY_ATTRIBUTE`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOBENTRY_COPY
-- ----------------------------
DROP TABLE IF EXISTS `R_JOBENTRY_COPY`;
CREATE TABLE `R_JOBENTRY_COPY`  (
  `ID_JOBENTRY_COPY` bigint(20) NOT NULL,
  `ID_JOBENTRY` int(11) NULL DEFAULT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_X` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) NULL DEFAULT NULL,
  `GUI_DRAW` tinyint(1) NULL DEFAULT NULL,
  `PARALLEL` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_COPY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOBENTRY_DATABASE
-- ----------------------------
DROP TABLE IF EXISTS `R_JOBENTRY_DATABASE`;
CREATE TABLE `R_JOBENTRY_DATABASE`  (
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY` int(11) NULL DEFAULT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  INDEX `IDX_RJD1`(`ID_JOB`) USING BTREE,
  INDEX `IDX_RJD2`(`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOBENTRY_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `R_JOBENTRY_TYPE`;
CREATE TABLE `R_JOBENTRY_TYPE`  (
  `ID_JOBENTRY_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_JOBENTRY_TYPE
-- ----------------------------
INSERT INTO `R_JOBENTRY_TYPE` VALUES (1, 'HadoopTransJobExecutorPlugin', 'Pentaho MapReduce');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (2, 'WEBSERVICE_AVAILABLE', '检查web服务是否可用');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (3, 'MYSQL_BULK_FILE', '从 Mysql 批量导出到文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (4, 'COPY_MOVE_RESULT_FILENAMES', '复制/移动结果文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (5, 'XSD_VALIDATOR', 'XSD Validator');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (6, 'SparkSubmit', 'Spark Submit');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (7, 'OozieJobExecutor', 'Oozie Job Executor');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (8, 'SPECIAL', '特殊作业项');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (9, 'FILE_COMPARE', '比较文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (10, 'CREATE_FOLDER', '创建一个目录');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (11, 'MAIL_VALIDATOR', '邮件验证');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (12, 'PALO_CUBE_DELETE', 'Palo Cube Delete');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (13, 'MAIL', '发送邮件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (14, 'TRUNCATE_TABLES', '清空表');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (15, 'MSGBOX_INFO', '显示消息对话框');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (16, 'WAIT_FOR_SQL', '等待SQL');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (17, 'FTPS_GET', 'FTPS 下载');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (18, 'FTP_DELETE', 'FTP 删除');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (19, 'COLUMNS_EXIST', '检查列是否存在');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (20, 'CHECK_FILES_LOCKED', '检查文件是否被锁');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (21, 'UNZIP', '解压缩文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (22, 'JOB', '作业');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (23, 'SqoopImport', 'Sqoop Import');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (24, 'DELETE_FILE', '删除一个文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (25, 'SHELL', 'Shell');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (26, 'ABORT', '中止作业');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (27, 'HiveJobExecutorPlugin', 'Amazon Hive Job Executor');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (28, 'XML_WELL_FORMED', 'Check if XML file is well formed');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (29, 'SFTP', 'SFTP 下载');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (30, 'HTTP', 'HTTP');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (31, 'HadoopCopyFilesPlugin', 'Hadoop Copy Files');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (32, 'FTP_PUT', 'FTP 上传');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (33, 'SQL', 'SQL');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (34, 'WRITE_TO_FILE', '写入文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (35, 'PGP_VERIFY_FILES', '用PGP验证文件签名');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (36, 'DOS_UNIX_CONVERTER', 'DOS和UNIX之间的文本转换');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (37, 'PGP_DECRYPT_FILES', '用PGP解密文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (38, 'TALEND_JOB_EXEC', 'Talend 作业执行');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (39, 'EVAL', '使用 JavaScript 脚本验证');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (40, 'HadoopPigScriptExecutorPlugin', 'Pig Script Executor');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (41, 'DELAY', '等待');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (42, 'HL7MLLPAcknowledge', 'HL7 MLLP Acknowledge');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (43, 'PALO_CUBE_CREATE', 'Palo Cube Create');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (44, 'FTP', 'FTP 下载');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (45, 'DATASOURCE_PUBLISH', 'Publish Model');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (46, 'FOLDERS_COMPARE', '比较目录');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (47, 'HadoopJobExecutorPlugin', 'Hadoop Job Executor ');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (48, 'ZIP_FILE', 'Zip 压缩文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (49, 'GET_POP', 'POP 收信');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (50, 'TRANS', '转换');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (51, 'SEND_NAGIOS_PASSIVE_CHECK', '发送Nagios 被动检查');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (52, 'SET_VARIABLES', '设置变量');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (53, 'MS_ACCESS_BULK_LOAD', 'MS Access Bulk Load');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (54, 'DummyJob', 'Example Job');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (55, 'COPY_FILES', '复制文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (56, 'EVAL_FILES_METRICS', '计算文件大小或个数');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (57, 'DataRefineryBuildModel', 'Build Model');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (58, 'PING', 'Ping 一台主机');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (59, 'ADD_RESULT_FILENAMES', '添加文件到结果文件中');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (60, 'DELETE_FOLDERS', '删除目录');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (61, 'CHECK_DB_CONNECTIONS', '检查数据库连接');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (62, 'FILE_EXISTS', '检查一个文件是否存在');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (63, 'EVAL_TABLE_CONTENT', '计算表中的记录数');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (64, 'FILES_EXIST', '检查多个文件是否存在');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (65, 'SFTPPUT', 'SFTP 上传');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (66, 'FTPS_PUT', 'FTPS 上传');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (67, 'DELETE_RESULT_FILENAMES', '从结果文件中删除文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (68, 'DELETE_FILES', '删除多个文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (69, 'PGP_ENCRYPT_FILES', '用PGP加密文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (70, 'SqoopExport', 'Sqoop Export');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (71, 'WRITE_TO_LOG', '写日志');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (72, 'SUCCESS', '成功');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (73, 'WAIT_FOR_FILE', '等待文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (74, 'MSSQL_BULK_LOAD', 'SQLServer 批量加载');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (75, 'TELNET', '远程登录一台主机');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (76, 'MOVE_FILES', '移动文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (77, 'XSLT', 'XSL Transformation');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (78, 'EMRJobExecutorPlugin', 'Amazon EMR Job Executor');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (79, 'DTD_VALIDATOR', 'DTD Validator');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (80, 'HL7MLLPInput', 'HL7 MLLP Input');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (81, 'FOLDER_IS_EMPTY', '检查目录是否为空');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (82, 'SIMPLE_EVAL', '检验字段的值');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (83, 'EXPORT_REPOSITORY', '导出资源库到XML文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (84, 'TABLE_EXISTS', '检查表是否存在');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (85, 'SYSLOG', '用 Syslog 发送信息');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (86, 'MYSQL_BULK_LOAD', 'Mysql 批量加载');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (87, 'CREATE_FILE', '创建文件');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (88, 'SNMP_TRAP', '发送 SNMP 自陷');
INSERT INTO `R_JOBENTRY_TYPE` VALUES (89, 'CONNECTED_TO_REPOSITORY', '检查是否连接到资源库');

-- ----------------------------
-- Table structure for R_JOB_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `R_JOB_ATTRIBUTE`;
CREATE TABLE `R_JOB_ATTRIBUTE`  (
  `ID_JOB_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint(20) NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_JOB_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_JATT`(`ID_JOB`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOB_HOP
-- ----------------------------
DROP TABLE IF EXISTS `R_JOB_HOP`;
CREATE TABLE `R_JOB_HOP`  (
  `ID_JOB_HOP` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_COPY_FROM` int(11) NULL DEFAULT NULL,
  `ID_JOBENTRY_COPY_TO` int(11) NULL DEFAULT NULL,
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  `EVALUATION` tinyint(1) NULL DEFAULT NULL,
  `UNCONDITIONAL` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_HOP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOB_LOCK
-- ----------------------------
DROP TABLE IF EXISTS `R_JOB_LOCK`;
CREATE TABLE `R_JOB_LOCK`  (
  `ID_JOB_LOCK` bigint(20) NOT NULL,
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_USER` int(11) NULL DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `LOCK_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_LOCK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_JOB_NOTE
-- ----------------------------
DROP TABLE IF EXISTS `R_JOB_NOTE`;
CREATE TABLE `R_JOB_NOTE`  (
  `ID_JOB` int(11) NULL DEFAULT NULL,
  `ID_NOTE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_LOG
-- ----------------------------
DROP TABLE IF EXISTS `R_LOG`;
CREATE TABLE `R_LOG`  (
  `ID_LOG` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_LOGLEVEL` int(11) NULL DEFAULT NULL,
  `LOGTYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FILEEXTENTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ADD_DATE` tinyint(1) NULL DEFAULT NULL,
  `ADD_TIME` tinyint(1) NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_LOGLEVEL
-- ----------------------------
DROP TABLE IF EXISTS `R_LOGLEVEL`;
CREATE TABLE `R_LOGLEVEL`  (
  `ID_LOGLEVEL` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOGLEVEL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_LOGLEVEL
-- ----------------------------
INSERT INTO `R_LOGLEVEL` VALUES (1, 'Error', '错误日志');
INSERT INTO `R_LOGLEVEL` VALUES (2, 'Minimal', '最小日志');
INSERT INTO `R_LOGLEVEL` VALUES (3, 'Basic', '基本日志');
INSERT INTO `R_LOGLEVEL` VALUES (4, 'Detailed', '详细日志');
INSERT INTO `R_LOGLEVEL` VALUES (5, 'Debug', '调试');
INSERT INTO `R_LOGLEVEL` VALUES (6, 'Rowlevel', '行级日志(非常详细)');

-- ----------------------------
-- Table structure for R_NAMESPACE
-- ----------------------------
DROP TABLE IF EXISTS `R_NAMESPACE`;
CREATE TABLE `R_NAMESPACE`  (
  `ID_NAMESPACE` bigint(20) NOT NULL,
  `NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_NAMESPACE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_NOTE
-- ----------------------------
DROP TABLE IF EXISTS `R_NOTE`;
CREATE TABLE `R_NOTE`  (
  `ID_NOTE` bigint(20) NOT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `GUI_LOCATION_X` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_WIDTH` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_HEIGHT` int(11) NULL DEFAULT NULL,
  `FONT_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `FONT_SIZE` int(11) NULL DEFAULT NULL,
  `FONT_BOLD` tinyint(1) NULL DEFAULT NULL,
  `FONT_ITALIC` tinyint(1) NULL DEFAULT NULL,
  `FONT_COLOR_RED` int(11) NULL DEFAULT NULL,
  `FONT_COLOR_GREEN` int(11) NULL DEFAULT NULL,
  `FONT_COLOR_BLUE` int(11) NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_RED` int(11) NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_GREEN` int(11) NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_BLUE` int(11) NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_RED` int(11) NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_GREEN` int(11) NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_BLUE` int(11) NULL DEFAULT NULL,
  `DRAW_SHADOW` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_NOTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_PARTITION
-- ----------------------------
DROP TABLE IF EXISTS `R_PARTITION`;
CREATE TABLE `R_PARTITION`  (
  `ID_PARTITION` bigint(20) NOT NULL,
  `ID_PARTITION_SCHEMA` int(11) NULL DEFAULT NULL,
  `PARTITION_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_PARTITION_SCHEMA
-- ----------------------------
DROP TABLE IF EXISTS `R_PARTITION_SCHEMA`;
CREATE TABLE `R_PARTITION_SCHEMA`  (
  `ID_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DYNAMIC_DEFINITION` tinyint(1) NULL DEFAULT NULL,
  `PARTITIONS_PER_SLAVE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION_SCHEMA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_REPOSITORY_LOG
-- ----------------------------
DROP TABLE IF EXISTS `R_REPOSITORY_LOG`;
CREATE TABLE `R_REPOSITORY_LOG`  (
  `ID_REPOSITORY_LOG` bigint(20) NOT NULL,
  `REP_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LOG_DATE` datetime(0) NULL DEFAULT NULL,
  `LOG_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `OPERATION_DESC` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_REPOSITORY_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_REPOSITORY_LOG
-- ----------------------------
INSERT INTO `R_REPOSITORY_LOG` VALUES (1, '5.0', '2018-08-21 16:48:34', 'admin', 'Creation of the Kettle repository');
INSERT INTO `R_REPOSITORY_LOG` VALUES (2, '5.0', '2018-08-29 00:00:44', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (3, '5.0', '2018-08-29 00:01:17', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (4, '5.0', '2018-10-19 16:14:55', 'admin', 'add: Fri Oct 19 16:14:55 CST 2018');
INSERT INTO `R_REPOSITORY_LOG` VALUES (5, '5.0', '2018-10-19 16:14:55', 'admin', 'save transformation \'a\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (6, '5.0', '2018-11-17 13:54:28', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (7, '5.0', '2018-11-17 13:54:30', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (8, '5.0', '2018-11-17 13:54:50', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (9, '5.0', '2018-11-17 13:54:53', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (10, '5.0', '2018-11-17 13:55:43', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (11, '5.0', '2018-11-17 13:56:14', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (12, '5.0', '2018-11-17 14:41:17', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (13, '5.0', '2018-11-17 14:52:20', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (14, '5.0', '2018-11-17 17:44:21', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (15, '5.0', '2018-11-17 22:17:01', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (16, '5.0', '2018-11-17 22:17:12', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (17, '5.0', '2018-11-17 22:17:12', 'admin', 'save transformation \'test\'');
INSERT INTO `R_REPOSITORY_LOG` VALUES (18, '5.0', '2018-11-17 22:17:13', 'admin', 'save transformation \'test\'');

-- ----------------------------
-- Table structure for R_SLAVE
-- ----------------------------
DROP TABLE IF EXISTS `R_SLAVE`;
CREATE TABLE `R_SLAVE`  (
  `ID_SLAVE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `WEB_APP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROXY_HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PROXY_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NON_PROXY_HOSTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MASTER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_STEP
-- ----------------------------
DROP TABLE IF EXISTS `R_STEP`;
CREATE TABLE `R_STEP`  (
  `ID_STEP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ID_STEP_TYPE` int(11) NULL DEFAULT NULL,
  `DISTRIBUTE` tinyint(1) NULL DEFAULT NULL,
  `COPIES` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_X` int(11) NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) NULL DEFAULT NULL,
  `GUI_DRAW` tinyint(1) NULL DEFAULT NULL,
  `COPIES_STRING` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STEP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_STEP
-- ----------------------------
INSERT INTO `R_STEP` VALUES (1, 1, '表输入', NULL, 140, 1, 1, 224, 240, 1, '1');
INSERT INTO `R_STEP` VALUES (2, 3, '文本文件输出', NULL, 4, 1, 2, 416, 224, 1, '2');
INSERT INTO `R_STEP` VALUES (3, 3, '生成记录', NULL, 111, 1, 1, 192, 224, 1, '1');

-- ----------------------------
-- Table structure for R_STEP_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `R_STEP_ATTRIBUTE`;
CREATE TABLE `R_STEP_ATTRIBUTE`  (
  `ID_STEP_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint(20) NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_STEP_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RSAT`(`ID_STEP`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_STEP_ATTRIBUTE
-- ----------------------------
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (1, 1, 1, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (2, 1, 1, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (3, 1, 1, 0, 'id_connection', 1, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (4, 1, 1, 0, 'sql', 0, 'SELECT <values> FROM <table name> WHERE <conditions>');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (5, 1, 1, 0, 'limit', 0, '0');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (6, 1, 1, 0, 'lookup', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (7, 1, 1, 0, 'execute_each_row', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (8, 1, 1, 0, 'variables_active', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (9, 1, 1, 0, 'lazy_conversion_active', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (10, 1, 1, 0, 'cluster_schema', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (11, 1, 1, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (12, 3, 2, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (13, 3, 2, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (14, 3, 2, 0, 'separator', 0, ';');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (15, 3, 2, 0, 'enclosure', 0, '\"');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (16, 3, 2, 0, 'enclosure_forced', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (17, 3, 2, 0, 'enclosure_fix_disabled', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (18, 3, 2, 0, 'header', 0, 'Y');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (19, 3, 2, 0, 'footer', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (20, 3, 2, 0, 'format', 0, 'DOS');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (21, 3, 2, 0, 'compression', 0, 'None');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (22, 3, 2, 0, 'encoding', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (23, 3, 2, 0, 'file_name', 0, 'C:\\Users\\Tony\\Desktop\\temp\\test');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (24, 3, 2, 0, 'file_servlet_output', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (25, 3, 2, 0, 'do_not_open_new_file_init', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (26, 3, 2, 0, 'file_extention', 0, 'txt');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (27, 3, 2, 0, 'file_append', 0, 'Y');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (28, 3, 2, 0, 'file_split', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (29, 3, 2, 0, 'file_add_stepnr', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (30, 3, 2, 0, 'file_add_partnr', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (31, 3, 2, 0, 'file_add_date', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (32, 3, 2, 0, 'date_time_format', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (33, 3, 2, 0, 'create_parent_folder', 0, 'Y');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (34, 3, 2, 0, 'SpecifyFormat', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (35, 3, 2, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (36, 3, 2, 0, 'file_add_time', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (37, 3, 2, 0, 'file_pad', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (38, 3, 2, 0, 'file_fast_dump', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (39, 3, 2, 0, 'fileNameInField', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (40, 3, 2, 0, 'fileNameField', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (41, 3, 2, 0, 'endedLine', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (42, 3, 2, 0, 'cluster_schema', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (43, 3, 2, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (44, 3, 3, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (45, 3, 3, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (46, 3, 3, 0, 'field_name', 0, 'A');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (47, 3, 3, 0, 'field_type', 0, 'String');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (48, 3, 3, 0, 'field_format', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (49, 3, 3, 0, 'field_currency', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (50, 3, 3, 0, 'field_decimal', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (51, 3, 3, 0, 'field_group', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (52, 3, 3, 0, 'field_nullif', 0, 'aaa');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (53, 3, 3, 0, 'field_length', 10, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (54, 3, 3, 0, 'field_precision', -1, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (55, 3, 3, 0, 'set_empty_string', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (56, 3, 3, 1, 'field_name', 0, 'B');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (57, 3, 3, 1, 'field_type', 0, 'String');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (58, 3, 3, 1, 'field_format', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (59, 3, 3, 1, 'field_currency', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (60, 3, 3, 1, 'field_decimal', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (61, 3, 3, 1, 'field_group', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (62, 3, 3, 1, 'field_nullif', 0, 'bbb');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (63, 3, 3, 1, 'field_length', 10, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (64, 3, 3, 1, 'field_precision', -1, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (65, 3, 3, 1, 'set_empty_string', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (66, 3, 3, 2, 'field_name', 0, 'C');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (67, 3, 3, 2, 'field_type', 0, 'String');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (68, 3, 3, 2, 'field_format', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (69, 3, 3, 2, 'field_currency', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (70, 3, 3, 2, 'field_decimal', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (71, 3, 3, 2, 'field_group', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (72, 3, 3, 2, 'field_nullif', 0, 'ccc');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (73, 3, 3, 2, 'field_length', 10, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (74, 3, 3, 2, 'field_precision', -1, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (75, 3, 3, 2, 'set_empty_string', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (76, 3, 3, 0, 'limit', 0, '1000000');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (77, 3, 3, 0, 'never_ending', 0, 'N');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (78, 3, 3, 0, 'interval_in_ms', 0, '5000');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (79, 3, 3, 0, 'row_time_field', 0, 'now');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (80, 3, 3, 0, 'last_time_field', 0, 'FiveSecondsAgo');
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (81, 3, 3, 0, 'cluster_schema', 0, NULL);
INSERT INTO `R_STEP_ATTRIBUTE` VALUES (82, 3, 3, 0, 'row_distribution_code', 0, NULL);

-- ----------------------------
-- Table structure for R_STEP_DATABASE
-- ----------------------------
DROP TABLE IF EXISTS `R_STEP_DATABASE`;
CREATE TABLE `R_STEP_DATABASE`  (
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP` int(11) NULL DEFAULT NULL,
  `ID_DATABASE` int(11) NULL DEFAULT NULL,
  INDEX `IDX_RSD1`(`ID_TRANSFORMATION`) USING BTREE,
  INDEX `IDX_RSD2`(`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_STEP_DATABASE
-- ----------------------------
INSERT INTO `R_STEP_DATABASE` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for R_STEP_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `R_STEP_TYPE`;
CREATE TABLE `R_STEP_TYPE`  (
  `ID_STEP_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `HELPTEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STEP_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_STEP_TYPE
-- ----------------------------
INSERT INTO `R_STEP_TYPE` VALUES (1, 'Delete', '删除', '基于关键字删除记录');
INSERT INTO `R_STEP_TYPE` VALUES (2, 'WriteToLog', '写日志', 'Write data to log');
INSERT INTO `R_STEP_TYPE` VALUES (3, 'SyslogMessage', '发送信息至Syslog', 'Send message to Syslog server');
INSERT INTO `R_STEP_TYPE` VALUES (4, 'TextFileOutput', '文本文件输出', '写记录到一个文本文件.');
INSERT INTO `R_STEP_TYPE` VALUES (5, 'MultiwayMergeJoin', 'Multiway Merge Join', 'Multiway Merge Join');
INSERT INTO `R_STEP_TYPE` VALUES (6, 'LDAPOutput', 'LDAP 输出', 'Perform Insert, upsert, update, add or delete operations on records based on their DN (Distinguished  Name).');
INSERT INTO `R_STEP_TYPE` VALUES (7, 'SAPINPUT', 'SAP Input', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `R_STEP_TYPE` VALUES (8, 'AccessInput', 'Access 输入', 'Read data from a Microsoft Access file');
INSERT INTO `R_STEP_TYPE` VALUES (9, 'HBaseInput', 'HBase Input', 'Reads data from a HBase table according to a mapping ');
INSERT INTO `R_STEP_TYPE` VALUES (10, 'JoinRows', '记录关联 (笛卡尔输出)', '这个步骤的输出是输入流的笛卡尔的结果.{0} 输出结果的记录数是输入流记录之间的乘积.');
INSERT INTO `R_STEP_TYPE` VALUES (11, 'JsonInput', 'JSON Input', 'Extract relevant portions out of JSON structures (file or incoming field) and output rows');
INSERT INTO `R_STEP_TYPE` VALUES (12, 'TableOutput', '表输出', '写信息到一个数据库表');
INSERT INTO `R_STEP_TYPE` VALUES (13, 'MySQLBulkLoader', 'MySQL 批量加载', 'MySQL bulk loader step, loading data over a named pipe (not available on MS Windows)');
INSERT INTO `R_STEP_TYPE` VALUES (14, 'SingleThreader', 'Single Threader', 'Executes a transformation snippet in a single thread.  You need a standard mapping or a transformation with an Injector step where data from the parent transformation will arive in blocks.');
INSERT INTO `R_STEP_TYPE` VALUES (15, 'HL7Input', 'HL7 Input', 'Reads and parses HL7 messages and outputs a series of values from the messages');
INSERT INTO `R_STEP_TYPE` VALUES (16, 'RandomCCNumberGenerator', '生成随机的信用卡号', 'Generate random valide (luhn check) credit card numbers');
INSERT INTO `R_STEP_TYPE` VALUES (17, 'RegexEval', '正则表达式', 'Regular expression Evaluation\nThis step uses a regular expression to evaluate a field. It can also extract new fields out of an existing field with capturing groups.');
INSERT INTO `R_STEP_TYPE` VALUES (18, 'HadoopEnterPlugin', 'MapReduce Input', 'Enter a Hadoop Mapper or Reducer transformation');
INSERT INTO `R_STEP_TYPE` VALUES (19, 'PaloDimOutput', 'Palo Dim Output', 'Writes data to defined Palo Dimension');
INSERT INTO `R_STEP_TYPE` VALUES (20, 'S3FileOutputPlugin', 'S3 File Output', 'Create files in an S3 location');
INSERT INTO `R_STEP_TYPE` VALUES (21, 'IfNull', '替换NULL值', 'Sets a field value to a constant if it is null.');
INSERT INTO `R_STEP_TYPE` VALUES (22, 'ColumnExists', '检查表里的列是否存在', 'Check if a column exists in a table on a specified connection.');
INSERT INTO `R_STEP_TYPE` VALUES (23, 'FileLocked', '检查文件是否已被锁定', 'Check if a file is locked by another process');
INSERT INTO `R_STEP_TYPE` VALUES (24, 'SocketWriter', 'Socket 写', 'Socket writer.  A socket server that can send rows of data to a socket reader.');
INSERT INTO `R_STEP_TYPE` VALUES (25, 'ExcelInput', 'Excel输入', '从一个微软的Excel文件里读取数据. 兼容Excel 95, 97 and 2000.');
INSERT INTO `R_STEP_TYPE` VALUES (26, 'TeraFast', 'Teradata Fastload 批量加载', 'The Teradata Fastload Bulk loader');
INSERT INTO `R_STEP_TYPE` VALUES (27, 'DataGrid', '自定义常量数据', 'Enter rows of static data in a grid, usually for testing, reference or demo purpose');
INSERT INTO `R_STEP_TYPE` VALUES (28, 'DetectLastRow', '识别流的最后一行', 'Last row will be marked');
INSERT INTO `R_STEP_TYPE` VALUES (29, 'TypeExitEdi2XmlStep', 'Edi to XML', 'Converts Edi text to generic XML');
INSERT INTO `R_STEP_TYPE` VALUES (30, 'SortRows', '排序记录', '基于字段值把记录排序(升序或降序)');
INSERT INTO `R_STEP_TYPE` VALUES (31, 'FieldsChangeSequence', '根据字段值来改变序列', 'Add sequence depending of fields value change.\nEach time value of at least one field change, PDI will reset sequence. ');
INSERT INTO `R_STEP_TYPE` VALUES (32, 'RowsFromResult', '从结果获取记录', '这个允许你从同一个任务的前一个条目里读取记录.');
INSERT INTO `R_STEP_TYPE` VALUES (33, 'JobExecutor', '执行作业', 'This step executes a Pentaho Data Integration job, sets parameters and passes rows.');
INSERT INTO `R_STEP_TYPE` VALUES (34, 'BlockUntilStepsFinish', '阻塞数据直到步骤都完成', 'Block this step until selected steps finish.');
INSERT INTO `R_STEP_TYPE` VALUES (35, 'AutoDoc', '自动文档输出', 'This step automatically generates documentation based on input in the form of a list of transformations and jobs');
INSERT INTO `R_STEP_TYPE` VALUES (36, 'SFTPPut', 'SFTP Put', 'Upload a file or a stream file to remote host via SFTP');
INSERT INTO `R_STEP_TYPE` VALUES (37, 'ProcessFiles', '处理文件', 'Process one file per row (copy or move or delete).\nThis step only accept filename in input.');
INSERT INTO `R_STEP_TYPE` VALUES (38, 'HadoopFileOutputPlugin', 'Hadoop File Output', 'Create files in an HDFS location ');
INSERT INTO `R_STEP_TYPE` VALUES (39, 'RuleAccumulator', 'Rules Accumulator', 'Rules Accumulator Step');
INSERT INTO `R_STEP_TYPE` VALUES (40, 'DimensionLookup', '维度查询/更新', '在一个数据仓库里更新一个渐变维 {0} 或者在这个维里查询信息.');
INSERT INTO `R_STEP_TYPE` VALUES (41, 'TypeExitGoogleAnalyticsInputStep', 'Google Analytics', 'Fetches data from google analytics account');
INSERT INTO `R_STEP_TYPE` VALUES (42, 'PaloCellInput', 'Palo Cell Input', 'Reads data from a defined Palo Cube ');
INSERT INTO `R_STEP_TYPE` VALUES (43, 'Append', '追加流', 'Append 2 streams in an ordered way');
INSERT INTO `R_STEP_TYPE` VALUES (44, 'ZipFile', 'Zip 文件', 'Zip a file.\nFilename will be extracted from incoming stream.');
INSERT INTO `R_STEP_TYPE` VALUES (45, 'StringCut', '剪切字符串', 'Strings cut (substring).');
INSERT INTO `R_STEP_TYPE` VALUES (46, 'MergeRows', '合并记录', '合并两个数据流, 并根据某个关键字排序.  这两个数据流被比较，以标识相等的、变更的、删除的和新建的记录.');
INSERT INTO `R_STEP_TYPE` VALUES (47, 'Validator', '数据检验', 'Validates passing data based on a set of rules');
INSERT INTO `R_STEP_TYPE` VALUES (48, 'SSTableOutput', 'SSTable Output', 'Writes to a filesystem directory as a Cassandra SSTable');
INSERT INTO `R_STEP_TYPE` VALUES (49, 'MemoryGroupBy', '在内存中分组', 'Builds aggregates in a group by fashion.\nThis step doesn\'t require sorted input.');
INSERT INTO `R_STEP_TYPE` VALUES (50, 'SystemInfo', '获取系统信息', '获取系统信息，例如时间、日期.');
INSERT INTO `R_STEP_TYPE` VALUES (51, 'Denormaliser', '列转行', 'Denormalises rows by looking up key-value pairs and by assigning them to new fields in the输出 rows.{0}This method aggregates and needs the输入 rows to be sorted on the grouping fields');
INSERT INTO `R_STEP_TYPE` VALUES (52, 'ExcelOutput', 'Excel输出', 'Stores records into an Excel (XLS) document with formatting information.');
INSERT INTO `R_STEP_TYPE` VALUES (53, 'OlapInput', 'OLAP 输入', 'Execute and retrieve data using an MDX query against any XML/A OLAP datasource using olap4j');
INSERT INTO `R_STEP_TYPE` VALUES (54, 'Delay', '延迟行', 'Output each input row after a delay');
INSERT INTO `R_STEP_TYPE` VALUES (55, 'NullIf', '设置值为NULL', '如果一个字段值等于某个固定值，那么把这个字段值设置成null');
INSERT INTO `R_STEP_TYPE` VALUES (56, 'SalesforceInput', 'Salesforce Input', 'Extract data from Salesforce');
INSERT INTO `R_STEP_TYPE` VALUES (57, 'CallEndpointStep', 'Call endpoint', 'Call an endpoint of the Pentaho Server.');
INSERT INTO `R_STEP_TYPE` VALUES (58, 'SocketReader', 'Socket 读', 'Socket reader.  A socket client that connects to a server (Socket Writer step).');
INSERT INTO `R_STEP_TYPE` VALUES (59, 'CombinationLookup', '联合查询/更新', '更新数据仓库里的一个junk维 {0} 可选的, 科研查询维里的信息.{1}junk维的主键是所有的字段.');
INSERT INTO `R_STEP_TYPE` VALUES (60, 'FilesToResult', '复制文件到结果', 'This step allows you to set filenames in the result of this transformation.\nSubsequent job entries can then use this information.');
INSERT INTO `R_STEP_TYPE` VALUES (61, 'GPBulkLoader', 'Greenplum Bulk Loader', 'Greenplum Bulk Loader');
INSERT INTO `R_STEP_TYPE` VALUES (62, 'VerticaBulkLoader', 'Vertica Bulk Loader', 'Bulk load data into a Vertica database table');
INSERT INTO `R_STEP_TYPE` VALUES (63, 'SalesforceDelete', 'Salesforce Delete', 'Delete records in Salesforce module.');
INSERT INTO `R_STEP_TYPE` VALUES (64, 'HTTP', 'HTTP client', 'Call a web service over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `R_STEP_TYPE` VALUES (65, 'XSDValidator', 'XSD Validator', 'Validate XML source (files or streams) against XML Schema Definition.');
INSERT INTO `R_STEP_TYPE` VALUES (66, 'SetValueConstant', '将字段值设置为常量', 'Set value of a field to a constant');
INSERT INTO `R_STEP_TYPE` VALUES (67, 'ScriptValueMod', 'JavaScript代码', 'This is a modified plugin for the Scripting Values with improved interface and performance.\nWritten & donated to open source by Martin Lange, Proconis : http://www.proconis.de');
INSERT INTO `R_STEP_TYPE` VALUES (68, 'CassandraInput', 'Cassandra Input', 'Reads data from a Cassandra table');
INSERT INTO `R_STEP_TYPE` VALUES (69, 'SwitchCase', 'Switch / Case', 'Switch a row to a certain target step based on the case value in a field.');
INSERT INTO `R_STEP_TYPE` VALUES (70, 'DBLookup', '数据库查询', '使用字段值在数据库里查询值');
INSERT INTO `R_STEP_TYPE` VALUES (71, 'FuzzyMatch', '模糊匹配', 'Finding approximate matches to a string using matching algorithms.\nRead a field from a main stream and output approximative value from lookup stream.');
INSERT INTO `R_STEP_TYPE` VALUES (72, 'TeraDataBulkLoader', 'Teradata TPT Bulk Loader', 'Teradata TPT bulkloader, using tbuild command');
INSERT INTO `R_STEP_TYPE` VALUES (73, 'TextFileInput', '文本文件输入', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `R_STEP_TYPE` VALUES (74, 'SalesforceInsert', 'Salesforce Insert', 'Insert records in Salesforce module.');
INSERT INTO `R_STEP_TYPE` VALUES (75, 'CouchDbInput', 'CouchDb Input', 'Reads from a Couch DB view');
INSERT INTO `R_STEP_TYPE` VALUES (76, 'ShapeFileReader', 'ESRI Shapefile Reader', 'Reads shape file data from an ESRI shape file and linked DBF file');
INSERT INTO `R_STEP_TYPE` VALUES (77, 'RssInput', 'RSS 输入', 'Read RSS feeds');
INSERT INTO `R_STEP_TYPE` VALUES (78, 'Unique', '去除重复记录', '去除重复的记录行，保持记录唯一{0}这个仅仅基于一个已经排好序的输入.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `R_STEP_TYPE` VALUES (79, 'InfobrightOutput', 'Infobright 批量加载', 'Load data to an Infobright database table');
INSERT INTO `R_STEP_TYPE` VALUES (80, 'MongoDbInput', 'MongoDB Input', 'Reads from a Mongo DB collection');
INSERT INTO `R_STEP_TYPE` VALUES (81, 'UserDefinedJavaClass', 'Java 代码', 'This step allows you to program a step using Java code');
INSERT INTO `R_STEP_TYPE` VALUES (82, 'OraBulkLoader', 'Oracle 批量加载', 'Use Oracle Bulk Loader to load data');
INSERT INTO `R_STEP_TYPE` VALUES (83, 'StepsMetrics', '转换步骤信息统计', 'Return metrics for one or several steps');
INSERT INTO `R_STEP_TYPE` VALUES (84, 'AvroInput', 'Avro Input', 'Reads data from an Avro file');
INSERT INTO `R_STEP_TYPE` VALUES (85, 'GetTableNames', '获取表名', 'Get table names from database connection and send them to the next step');
INSERT INTO `R_STEP_TYPE` VALUES (86, 'SetSessionVariableStep', 'Set session variables', 'Set session variables in the current user session.');
INSERT INTO `R_STEP_TYPE` VALUES (87, 'MappingInput', '映射输入规范', '指定一个映射的字段输入');
INSERT INTO `R_STEP_TYPE` VALUES (88, 'Abort', '中止', 'Abort a transformation');
INSERT INTO `R_STEP_TYPE` VALUES (89, 'MetaInject', 'ETL Metadata Injection', 'ETL元数据注入');
INSERT INTO `R_STEP_TYPE` VALUES (90, 'PropertyOutput', '配置文件输出', 'Write data to properties file');
INSERT INTO `R_STEP_TYPE` VALUES (91, 'JsonOutput', 'JSON Output', 'Create JSON block and output it in a field or a file.');
INSERT INTO `R_STEP_TYPE` VALUES (92, 'TableExists', '检查表是否存在', 'Check if a table exists on a specified connection');
INSERT INTO `R_STEP_TYPE` VALUES (93, 'DetectEmptyStream', '检测空流', 'This step will output one empty row if input stream is empty\n(ie when input stream does not contain any row)');
INSERT INTO `R_STEP_TYPE` VALUES (94, 'GPLoad', 'Greenplum Load', 'Greenplum Load');
INSERT INTO `R_STEP_TYPE` VALUES (95, 'PaloDimInput', 'Palo Dim Input', 'Reads data from a defined Palo Dimension');
INSERT INTO `R_STEP_TYPE` VALUES (96, 'Normaliser', '行转列', 'De-normalised information can be normalised using this step type.');
INSERT INTO `R_STEP_TYPE` VALUES (97, 'SelectValues', '字段选择', '选择或移除记录里的字。{0}此外，可以设置字段的元数据: 类型, 长度和精度.');
INSERT INTO `R_STEP_TYPE` VALUES (98, 'XMLInputStream', 'XML Input Stream (StAX)', 'This step is capable of processing very large and complex XML files very fast.');
INSERT INTO `R_STEP_TYPE` VALUES (99, 'Flattener', '行扁平化', 'Flattens consequetive rows based on the order in which they appear in the输入 stream');
INSERT INTO `R_STEP_TYPE` VALUES (100, 'InsertUpdate', '插入 / 更新', '基于关键字更新或插入记录到数据库.');
INSERT INTO `R_STEP_TYPE` VALUES (101, 'MondrianInput', 'Mondrian 输入', 'Execute and retrieve data using an MDX query against a Pentaho Analyses OLAP server (Mondrian)');
INSERT INTO `R_STEP_TYPE` VALUES (102, 'SQLFileOutput', 'SQL 文件输出', 'Output SQL INSERT statements to file');
INSERT INTO `R_STEP_TYPE` VALUES (103, 'ReplaceString', '字符串替换', 'Replace all occurences a word in a string with another word.');
INSERT INTO `R_STEP_TYPE` VALUES (104, 'CubeInput', 'Cube 文件输入', '从一个cube读取记录.');
INSERT INTO `R_STEP_TYPE` VALUES (105, 'WebServiceLookup', 'Web 服务查询', '使用 Web 服务查询信息');
INSERT INTO `R_STEP_TYPE` VALUES (106, 'TableCompare', '比较表', 'Compares 2 tables and gives back a list of differences');
INSERT INTO `R_STEP_TYPE` VALUES (107, 'MongoDbOutput', 'MongoDB Output', 'Writes to a Mongo DB collection');
INSERT INTO `R_STEP_TYPE` VALUES (108, 'HBaseOutput', 'HBase Output', 'Writes data to an HBase table according to a mapping');
INSERT INTO `R_STEP_TYPE` VALUES (109, 'MailValidator', '检验邮件地址', 'Check if an email address is valid.');
INSERT INTO `R_STEP_TYPE` VALUES (110, 'OpenERPObjectOutputImport', 'OpenERP Object Output', 'Writes data into OpenERP objects using the object import procedure');
INSERT INTO `R_STEP_TYPE` VALUES (111, 'RowGenerator', '生成记录', '产生一些空记录或相等的行.');
INSERT INTO `R_STEP_TYPE` VALUES (112, 'DBJoin', '数据库连接', '使用数据流里的值作为参数执行一个数据库查询');
INSERT INTO `R_STEP_TYPE` VALUES (113, 'RuleExecutor', 'Rules Executor', 'Rules Executor Step');
INSERT INTO `R_STEP_TYPE` VALUES (114, 'MergeJoin', '记录集连接', 'Joins two streams on a given key and outputs a joined set. The input streams must be sorted on the join key');
INSERT INTO `R_STEP_TYPE` VALUES (115, 'OpenERPObjectInput', 'OpenERP Object Input', 'Reads data from OpenERP objects');
INSERT INTO `R_STEP_TYPE` VALUES (116, 'SalesforceUpdate', 'Salesforce Update', 'Update records in Salesforce module.');
INSERT INTO `R_STEP_TYPE` VALUES (117, 'XMLJoin', 'XML Join', 'Joins a stream of XML-Tags into a target XML string');
INSERT INTO `R_STEP_TYPE` VALUES (118, 'GetVariable', '获取变量', 'Determine the values of certain (environment or Kettle) variables and put them in field values.');
INSERT INTO `R_STEP_TYPE` VALUES (119, 'DBProc', '调用DB存储过程', '通过调用数据库存储过程获得返回值.');
INSERT INTO `R_STEP_TYPE` VALUES (120, 'RssOutput', 'RSS 输出', 'Read RSS stream.');
INSERT INTO `R_STEP_TYPE` VALUES (121, 'CreateSharedDimensions', 'Shared Dimension', 'Create shared dimensions for use with Streamlined Data Refinery.');
INSERT INTO `R_STEP_TYPE` VALUES (122, 'S3CSVINPUT', 'S3 CSV Input', 'Is capable of reading CSV data stored on Amazon S3 in parallel');
INSERT INTO `R_STEP_TYPE` VALUES (123, 'SimpleMapping', 'Simple Mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface.  This is the simplified version only allowing one input and one output data set.');
INSERT INTO `R_STEP_TYPE` VALUES (124, 'OpenERPObjectDelete', 'OpenERP Object Delete', 'Deletes OpenERP objects');
INSERT INTO `R_STEP_TYPE` VALUES (125, 'LDAPInput', 'LDAP 输入', 'Read data from LDAP host');
INSERT INTO `R_STEP_TYPE` VALUES (126, 'XBaseInput', 'XBase输入', '从一个XBase类型的文件(DBF)读取记录');
INSERT INTO `R_STEP_TYPE` VALUES (127, 'FieldMetadataAnnotation', 'Annotate Stream', 'Add more details to describe data for published models used by the Streamlined Data Refinery.');
INSERT INTO `R_STEP_TYPE` VALUES (128, 'CheckSum', '增加校验列', 'Add a checksum column for each input row');
INSERT INTO `R_STEP_TYPE` VALUES (129, 'ParallelGzipCsvInput', 'GZIP CSV Input', 'Parallel GZIP CSV file input reader');
INSERT INTO `R_STEP_TYPE` VALUES (130, 'SortedMerge', '排序合并', 'Sorted Merge');
INSERT INTO `R_STEP_TYPE` VALUES (131, 'ChangeFileEncoding', '改变文件编码', 'Change file encoding and create a new file');
INSERT INTO `R_STEP_TYPE` VALUES (132, 'LoadFileInput', '文件内容加载至内存', 'Load file content in memory');
INSERT INTO `R_STEP_TYPE` VALUES (133, 'Janino', '利用Janino计算Java表达式', 'Calculate the result of a Java Expression using Janino');
INSERT INTO `R_STEP_TYPE` VALUES (134, 'getXMLData', 'Get data from XML', 'Get data from XML file by using XPath.\n This step also allows you to parse XML defined in a previous field.');
INSERT INTO `R_STEP_TYPE` VALUES (135, 'LDIFInput', 'LDIF 输入', 'Read data from LDIF files');
INSERT INTO `R_STEP_TYPE` VALUES (136, 'PGBulkLoader', 'PostgreSQL 批量加载', 'PostgreSQL Bulk Loader');
INSERT INTO `R_STEP_TYPE` VALUES (137, 'CubeOutput', 'Cube输出', '把数据写入一个cube');
INSERT INTO `R_STEP_TYPE` VALUES (138, 'SymmetricCryptoTrans', '对称加密', 'Encrypt or decrypt a string using symmetric encryption.\nAvailable algorithms are DES, AES, TripleDES.');
INSERT INTO `R_STEP_TYPE` VALUES (139, 'AddXML', 'Add XML', 'Encode several fields into an XML fragment');
INSERT INTO `R_STEP_TYPE` VALUES (140, 'TableInput', '表输入', '从数据库表里读取信息.');
INSERT INTO `R_STEP_TYPE` VALUES (141, 'SASInput', 'SAS 输入', 'This step reads files in sas7bdat (SAS) native format');
INSERT INTO `R_STEP_TYPE` VALUES (142, 'AccessOutput', 'Access 输出', 'Stores records into an MS-Access database table.');
INSERT INTO `R_STEP_TYPE` VALUES (143, 'ElasticSearchBulk', 'ElasticSearch Bulk Insert', 'Performs bulk inserts into ElasticSearch');
INSERT INTO `R_STEP_TYPE` VALUES (144, 'GetFileNames', '获取文件名', 'Get file names from the operating system and send them to the next step.');
INSERT INTO `R_STEP_TYPE` VALUES (145, 'StringOperations', '字符串操作', 'Apply certain operations like trimming, padding and others to string value.');
INSERT INTO `R_STEP_TYPE` VALUES (146, 'SetVariable', '设置变量', 'Set environment variables based on a single input row.');
INSERT INTO `R_STEP_TYPE` VALUES (147, 'RandomValue', '生成随机数', 'Generate random value');
INSERT INTO `R_STEP_TYPE` VALUES (148, 'GetSessionVariableStep', 'Get session variables', 'Get session variables from the current user session.');
INSERT INTO `R_STEP_TYPE` VALUES (149, 'FieldSplitter', '拆分字段', '当你想把一个字段拆分成多个时，使用这个类型.');
INSERT INTO `R_STEP_TYPE` VALUES (150, 'BlockingStep', '阻塞数据', 'This step blocks until all incoming rows have been processed.  Subsequent steps only recieve the last input row to this step.');
INSERT INTO `R_STEP_TYPE` VALUES (151, 'CsvInput', 'CSV文件输入', 'Simple CSV file input');
INSERT INTO `R_STEP_TYPE` VALUES (152, 'PropertyInput', '配置文件输入', 'Read data (key, value) from properties files.');
INSERT INTO `R_STEP_TYPE` VALUES (153, 'HadoopExitPlugin', 'MapReduce Output', 'Exit a Hadoop Mapper or Reducer transformation ');
INSERT INTO `R_STEP_TYPE` VALUES (154, 'SynchronizeAfterMerge', '数据同步', 'This step perform insert/update/delete in one go based on the value of a field. ');
INSERT INTO `R_STEP_TYPE` VALUES (155, 'StreamLookup', '流查询', '从转换中的其它流里查询值.');
INSERT INTO `R_STEP_TYPE` VALUES (156, 'Dummy', '空操作 (什么也不做)', '这个步骤类型什么都不作.{0} 当你想测试或拆分数据流的时候有用.');
INSERT INTO `R_STEP_TYPE` VALUES (157, 'PGPEncryptStream', 'PGP Encrypt stream', 'Encrypt data stream with PGP');
INSERT INTO `R_STEP_TYPE` VALUES (158, 'GetFilesRowsCount', '获取文件行数', 'Returns rows count for text files.');
INSERT INTO `R_STEP_TYPE` VALUES (159, 'SetValueField', '设置字段值', 'Set value of a field with another value field');
INSERT INTO `R_STEP_TYPE` VALUES (160, 'PGPDecryptStream', 'PGP Decrypt stream', 'Decrypt data stream with PGP');
INSERT INTO `R_STEP_TYPE` VALUES (161, 'Mapping', '映射 (子转换)', '运行一个映射 (子转换), 使用MappingInput和MappingOutput来指定接口的字段');
INSERT INTO `R_STEP_TYPE` VALUES (162, 'DynamicSQLRow', '执行Dynamic SQL', 'Execute dynamic SQL statement build in a previous field');
INSERT INTO `R_STEP_TYPE` VALUES (163, 'Update', '更新', '基于关键字更新记录到数据库');
INSERT INTO `R_STEP_TYPE` VALUES (164, 'UniqueRowsByHashSet', '唯一行 (哈希值)', 'Remove double rows and leave only unique occurrences by using a HashSet.');
INSERT INTO `R_STEP_TYPE` VALUES (165, 'Formula', '公式', '使用 Pentaho 的公式库来计算公式');
INSERT INTO `R_STEP_TYPE` VALUES (166, 'WebServiceAvailable', '检查web服务是否可用', 'Check if a webservice is available');
INSERT INTO `R_STEP_TYPE` VALUES (167, 'ExecProcess', '启动一个进程', 'Execute a process and return the result');
INSERT INTO `R_STEP_TYPE` VALUES (168, 'Injector', '记录注射', 'Injector step to allow to inject rows into the transformation through the java API');
INSERT INTO `R_STEP_TYPE` VALUES (169, 'SampleRows', '样本行', 'Filter rows based on the line number.');
INSERT INTO `R_STEP_TYPE` VALUES (170, 'DummyStep', 'Example Step', 'This is a plugin example step');
INSERT INTO `R_STEP_TYPE` VALUES (171, 'GetSlaveSequence', 'Get ID from slave server', 'Retrieves unique IDs in blocks from a slave server.  The referenced sequence needs to be configured on the slave server in the XML configuration file.');
INSERT INTO `R_STEP_TYPE` VALUES (172, 'MappingOutput', '映射输出规范', '指定一个映射的字段输出');
INSERT INTO `R_STEP_TYPE` VALUES (173, 'FileExists', '检查文件是否存在', 'Check if a file exists');
INSERT INTO `R_STEP_TYPE` VALUES (174, 'Script', 'Script', 'Calculate values by scripting in Ruby, Python, Groovy, JavaScript, ... (JSR-223)');
INSERT INTO `R_STEP_TYPE` VALUES (175, 'GroupBy', '分组', '以分组的形式创建聚合.{0}这个仅仅在一个已经排好序的输入有效.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `R_STEP_TYPE` VALUES (176, 'GetRepositoryNames', '获取资源库配置', 'Lists detailed information about transformations and/or jobs in a repository');
INSERT INTO `R_STEP_TYPE` VALUES (177, 'PaloCellOutput', 'Palo Cell Output', 'Writes data to a defined Palo Cube');
INSERT INTO `R_STEP_TYPE` VALUES (178, 'ClosureGenerator', 'Closure Generator', 'This step allows you to generates a closure table using parent-child relationships.');
INSERT INTO `R_STEP_TYPE` VALUES (179, 'Sequence', '增加序列', '从序列获取下一个值');
INSERT INTO `R_STEP_TYPE` VALUES (180, 'FilterRows', '过滤记录', '使用简单的相等来过滤记录');
INSERT INTO `R_STEP_TYPE` VALUES (181, 'VectorWiseBulkLoader', 'Ingres VectorWise 批量加载', 'This step interfaces with the Ingres VectorWise Bulk Loader \"COPY TABLE\" command.');
INSERT INTO `R_STEP_TYPE` VALUES (182, 'ConcatFields', 'Concat Fields', 'Concat fields together into a new field (similar to the Text File Output step)');
INSERT INTO `R_STEP_TYPE` VALUES (183, 'TypeExitExcelWriterStep', 'Microsoft Excel 输出', 'Writes or appends data to an Excel file');
INSERT INTO `R_STEP_TYPE` VALUES (184, 'OldTextFileInput', 'Old Text file input', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `R_STEP_TYPE` VALUES (185, 'AnalyticQuery', '分析查询', 'Execute analytic queries over a sorted dataset (LEAD/LAG/FIRST/LAST)');
INSERT INTO `R_STEP_TYPE` VALUES (186, 'FixedInput', '固定宽度文件输入', 'Fixed file input');
INSERT INTO `R_STEP_TYPE` VALUES (187, 'PrioritizeStreams', '数据流优先级排序', 'Prioritize streams in an order way.');
INSERT INTO `R_STEP_TYPE` VALUES (188, 'CassandraOutput', 'Cassandra Output', 'Writes to a Cassandra table');
INSERT INTO `R_STEP_TYPE` VALUES (189, 'ValueMapper', '值映射', 'Maps values of a certain field from one value to another');
INSERT INTO `R_STEP_TYPE` VALUES (190, 'Constant', '增加常量', '给记录增加一到多个常量');
INSERT INTO `R_STEP_TYPE` VALUES (191, 'ExecSQLRow', '执行SQL脚本(字段流替换)', 'Execute SQL script extracted from a field\ncreated in a previous step.');
INSERT INTO `R_STEP_TYPE` VALUES (192, 'JavaFilter', '根据Java代码过滤记录', 'Filter rows using java code');
INSERT INTO `R_STEP_TYPE` VALUES (193, 'XMLOutput', 'XML Output', 'Write data to an XML file');
INSERT INTO `R_STEP_TYPE` VALUES (194, 'ReservoirSampling', '数据采样', '[Transform] Samples a fixed number of rows from the incoming stream');
INSERT INTO `R_STEP_TYPE` VALUES (195, 'SalesforceUpsert', 'Salesforce Upsert', 'Insert or update records in Salesforce module.');
INSERT INTO `R_STEP_TYPE` VALUES (196, 'RowsToResult', '复制记录到结果', '使用这个步骤把记录写到正在执行的任务.{0}信息将会被传递给同一个任务里的下一个条目.');
INSERT INTO `R_STEP_TYPE` VALUES (197, 'MonetDBAgileMart', 'MonetDB Agile Mart', 'Load data into MonetDB for Agile BI use cases');
INSERT INTO `R_STEP_TYPE` VALUES (198, 'ExecSQL', '执行SQL脚本', '执行一个SQL脚本, 另外，可以使用输入的记录作为参数');
INSERT INTO `R_STEP_TYPE` VALUES (199, 'Rest', 'REST Client', 'Consume RESTfull services.\nREpresentational State Transfer (REST) is a key design idiom that embraces a stateless client-server\narchitecture in which the web services are viewed as resources and can be identified by their URLs');
INSERT INTO `R_STEP_TYPE` VALUES (200, 'LucidDBStreamingLoader', 'LucidDB Streaming Loader', 'Load data into LucidDB by using Remote Rows UDX.');
INSERT INTO `R_STEP_TYPE` VALUES (201, 'TransExecutor', 'Transformation Executor', 'This step executes a Pentaho Data Integration transformation, sets parameters and passes rows.');
INSERT INTO `R_STEP_TYPE` VALUES (202, 'StepMetastructure', '流的元数据', 'This is a step to read the metadata of the incoming stream.');
INSERT INTO `R_STEP_TYPE` VALUES (203, 'Calculator', '计算器', '通过执行简单的计算创建一个新字段');
INSERT INTO `R_STEP_TYPE` VALUES (204, 'SplitFieldToRows3', '列拆分为多行', 'Splits a single string field by delimiter and creates a new row for each split term');
INSERT INTO `R_STEP_TYPE` VALUES (205, 'YamlInput', 'Yaml 输入', 'Read YAML source (file or stream) parse them and convert them to rows and writes these to one or more output. ');
INSERT INTO `R_STEP_TYPE` VALUES (206, 'FilesFromResult', '从结果获取文件', 'This step allows you to read filenames used or generated in a previous entry in a job.');
INSERT INTO `R_STEP_TYPE` VALUES (207, 'UnivariateStats', '单变量统计', 'This step computes some simple stats based on a single input field');
INSERT INTO `R_STEP_TYPE` VALUES (208, 'SSH', '运行SSH命令', 'Run SSH commands and returns result.');
INSERT INTO `R_STEP_TYPE` VALUES (209, 'XSLT', 'XSL Transformation', 'Make an XSL Transformation');
INSERT INTO `R_STEP_TYPE` VALUES (210, 'MailInput', '邮件信息输入', 'Read POP3/IMAP server and retrieve messages');
INSERT INTO `R_STEP_TYPE` VALUES (211, 'CloneRow', '克隆行', 'Clone a row as many times as needed');
INSERT INTO `R_STEP_TYPE` VALUES (212, 'HTTPPOST', 'HTTP Post', 'Call a web service request over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `R_STEP_TYPE` VALUES (213, 'TableAgileMart', 'Table Agile Mart', 'Load data into a table for Agile BI use cases');
INSERT INTO `R_STEP_TYPE` VALUES (214, 'GetSubFolders', '获取子目录名', 'Read a parent folder and return all subfolders');
INSERT INTO `R_STEP_TYPE` VALUES (215, 'NumberRange', '数值范围', 'Create ranges based on numeric field');
INSERT INTO `R_STEP_TYPE` VALUES (216, 'CreditCardValidator', '检验信用卡号码是否有效', 'The Credit card validator step will help you tell:\n(1) if a credit card number is valid (uses LUHN10 (MOD-10) algorithm)\n(2) which credit card vendor handles that number\n(VISA, MasterCard, Diners Club, EnRoute, American Express (AMEX),...)');
INSERT INTO `R_STEP_TYPE` VALUES (217, 'HadoopFileInputPlugin', 'Hadoop File Input', 'Process files from an HDFS location');
INSERT INTO `R_STEP_TYPE` VALUES (218, 'MonetDBBulkLoader', 'MonetDB 批量加载', 'Load data into MonetDB by using their bulk load command in streaming mode.');
INSERT INTO `R_STEP_TYPE` VALUES (219, 'Mail', '发送邮件', 'Send eMail.');
INSERT INTO `R_STEP_TYPE` VALUES (220, 'SecretKeyGenerator', '生成密钥', 'Generate secret key for algorithms such as DES, AES, TripleDES.');
INSERT INTO `R_STEP_TYPE` VALUES (221, 'PentahoReportingOutput', 'Pentaho 报表输出', 'Executes an existing report (PRPT)');
INSERT INTO `R_STEP_TYPE` VALUES (222, 'HBaseRowDecoder', 'HBase Row Decoder', 'Decodes an incoming key and HBase result object according to a mapping ');
INSERT INTO `R_STEP_TYPE` VALUES (223, 'SapInput', 'SAP ??', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `R_STEP_TYPE` VALUES (224, 'AvroInputNew', 'Avro Input', 'Reads data from Avro file');
INSERT INTO `R_STEP_TYPE` VALUES (225, 'AvroOutput', 'Avro Output', 'Writes data to an Avro file according to a mapping');
INSERT INTO `R_STEP_TYPE` VALUES (226, 'RecordsFromStream', 'Get records from stream', 'This step allows you to read records from a streaming step.');
INSERT INTO `R_STEP_TYPE` VALUES (227, 'Jms2Consumer', 'JMS Consumer', 'JmsConsumerDialog.TypeLongDesc');
INSERT INTO `R_STEP_TYPE` VALUES (228, 'Jms2Producer', 'JMS Producer', 'JmsProducerDialog.TypeLongDesc');
INSERT INTO `R_STEP_TYPE` VALUES (229, 'KafkaConsumerInput', 'Kafka Consumer', 'Consume messages from a Kafka topic');
INSERT INTO `R_STEP_TYPE` VALUES (230, 'KafkaProducerOutput', 'Kafka Producer', 'Produce messages to a Kafka topic');
INSERT INTO `R_STEP_TYPE` VALUES (231, 'MQTTConsumer', 'MQTT Consumer', 'Subscribes and streams an MQTT Topic');
INSERT INTO `R_STEP_TYPE` VALUES (232, 'MQTTProducer', 'MQTT Producer', 'Produce messages to a MQTT Topic');
INSERT INTO `R_STEP_TYPE` VALUES (233, 'OrcInput', 'ORC Input', 'Reads data from ORC file');
INSERT INTO `R_STEP_TYPE` VALUES (234, 'OrcOutput', 'ORC Output', 'Writes data to an Orc file according to a mapping');
INSERT INTO `R_STEP_TYPE` VALUES (235, 'ParquetInput', 'Parquet Input', 'Reads data from a Parquet file.');
INSERT INTO `R_STEP_TYPE` VALUES (236, 'ParquetOutput', 'Parquet Output', 'Writes data to a Parquet file according to a mapping.');
INSERT INTO `R_STEP_TYPE` VALUES (237, 'TextFileOutputLegacy', 'Text file output (legacy)', '写记录到一个文本文件.');

-- ----------------------------
-- Table structure for R_TRANSFORMATION
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANSFORMATION`;
CREATE TABLE `R_TRANSFORMATION`  (
  `ID_TRANSFORMATION` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `EXTENDED_DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `TRANS_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TRANS_STATUS` int(11) NULL DEFAULT NULL,
  `ID_STEP_READ` int(11) NULL DEFAULT NULL,
  `ID_STEP_WRITE` int(11) NULL DEFAULT NULL,
  `ID_STEP_INPUT` int(11) NULL DEFAULT NULL,
  `ID_STEP_OUTPUT` int(11) NULL DEFAULT NULL,
  `ID_STEP_UPDATE` int(11) NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USE_BATCHID` tinyint(1) NULL DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) NULL DEFAULT NULL,
  `ID_DATABASE_MAXDATE` int(11) NULL DEFAULT NULL,
  `TABLE_NAME_MAXDATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FIELD_NAME_MAXDATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `OFFSET_MAXDATE` double NULL DEFAULT NULL,
  `DIFF_MAXDATE` double NULL DEFAULT NULL,
  `CREATED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime(0) NULL DEFAULT NULL,
  `MODIFIED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime(0) NULL DEFAULT NULL,
  `SIZE_ROWSET` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSFORMATION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_TRANSFORMATION
-- ----------------------------
INSERT INTO `R_TRANSFORMATION` VALUES (1, 0, '转换 1', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-08-28 23:59:28', 'admin', '2018-08-29 00:01:17', 10000);
INSERT INTO `R_TRANSFORMATION` VALUES (2, 0, 'a', NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-10-19 16:14:55', '-', '2018-10-19 16:14:55', 10000);
INSERT INTO `R_TRANSFORMATION` VALUES (3, 1, 'test', NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, 1, -1, NULL, NULL, 0, 0, '-', '2018-11-17 13:53:12', 'admin', '2018-11-17 22:17:13', 10000);

-- ----------------------------
-- Table structure for R_TRANS_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_ATTRIBUTE`;
CREATE TABLE `R_TRANS_ATTRIBUTE`  (
  `ID_TRANS_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `NR` int(11) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint(20) NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`ID_TRANS_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_TATT`(`ID_TRANSFORMATION`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_TRANS_ATTRIBUTE
-- ----------------------------
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (1, 1, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (2, 1, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (3, 1, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (4, 1, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (5, 1, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (6, 1, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (7, 1, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (8, 1, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (9, 1, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (10, 1, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (11, 1, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (12, 1, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (13, 1, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (14, 1, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (15, 1, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (16, 1, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (17, 1, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (18, 1, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (19, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (20, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (21, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (22, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (23, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (24, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (25, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (26, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (27, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (28, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (29, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (30, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (31, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (32, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (33, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (34, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (35, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (36, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (37, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (38, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (39, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (40, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (41, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (42, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (43, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (44, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (45, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (46, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (47, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (48, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (49, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (50, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (51, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (52, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (53, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (54, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (55, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (56, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (57, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (58, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (59, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (60, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (61, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (62, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (63, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (64, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (65, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (66, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (67, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (68, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (69, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (70, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (71, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (72, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (73, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (74, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (75, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (76, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (77, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (78, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (79, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (80, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (81, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (82, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (83, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (84, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (85, 1, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (86, 1, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (87, 1, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (88, 1, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (89, 1, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (90, 1, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (91, 1, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (92, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (93, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (94, 1, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (95, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (96, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (97, 1, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (98, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (99, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (100, 1, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (101, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (102, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (103, 1, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (104, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (105, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (106, 1, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (107, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (108, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (109, 1, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (110, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (111, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (112, 1, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (113, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (114, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (115, 1, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (116, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (117, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (118, 1, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (119, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (120, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (121, 1, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (122, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (123, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (124, 1, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (125, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (126, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (127, 1, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (128, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (129, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (130, 1, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (131, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (132, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (133, 1, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (134, 1, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (135, 1, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (136, 1, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (137, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (138, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (139, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (140, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (141, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (142, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (143, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (144, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (145, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (146, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (147, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (148, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (149, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (150, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (151, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (152, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (153, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (154, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (155, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (156, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (157, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (158, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (159, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (160, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (161, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (162, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (163, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (164, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (165, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (166, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (167, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (168, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (169, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (170, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (171, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (172, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (173, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (174, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (175, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (176, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (177, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (178, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (179, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (180, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (181, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (182, 1, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (183, 1, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (184, 1, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (185, 1, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (186, 1, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (187, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (188, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (189, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (190, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (191, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (192, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (193, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (194, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (195, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (196, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (197, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (198, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (199, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (200, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (201, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (202, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (203, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (204, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (205, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (206, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (207, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (208, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (209, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (210, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (211, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (212, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (213, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (214, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (215, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (216, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (217, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (218, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (219, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (220, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (221, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (222, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (223, 2, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (224, 2, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (225, 2, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (226, 2, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (227, 2, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (228, 2, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (229, 2, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (230, 2, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (231, 2, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (232, 2, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (233, 2, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (234, 2, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (235, 2, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (236, 2, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (237, 2, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (238, 2, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (239, 2, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (240, 2, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (241, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (242, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (243, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (244, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (245, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (246, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (247, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (248, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (249, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (250, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (251, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (252, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (253, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (254, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (255, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (256, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (257, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (258, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (259, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (260, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (261, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (262, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (263, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (264, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (265, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (266, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (267, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (268, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (269, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (270, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (271, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (272, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (273, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (274, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (275, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (276, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (277, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (278, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (279, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (280, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (281, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (282, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (283, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (284, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (285, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (286, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (287, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (288, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (289, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (290, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (291, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (292, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (293, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (294, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (295, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (296, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (297, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (298, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (299, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (300, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (301, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (302, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (303, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (304, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (305, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (306, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (307, 2, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (308, 2, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (309, 2, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (310, 2, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (311, 2, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (312, 2, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (313, 2, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (314, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (315, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (316, 2, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (317, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (318, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (319, 2, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (320, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (321, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (322, 2, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (323, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (324, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (325, 2, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (326, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (327, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (328, 2, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (329, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (330, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (331, 2, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (332, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (333, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (334, 2, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (335, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (336, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (337, 2, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (338, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (339, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (340, 2, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (341, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (342, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (343, 2, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (344, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (345, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (346, 2, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (347, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (348, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (349, 2, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (350, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (351, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (352, 2, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (353, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (354, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (355, 2, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (356, 2, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (357, 2, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (358, 2, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (359, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (360, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (361, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (362, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (363, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (364, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (365, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (366, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (367, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (368, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (369, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (370, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (371, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (372, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (373, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (374, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (375, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (376, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (377, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (378, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (379, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (380, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (381, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (382, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (383, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (384, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (385, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (386, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (387, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (388, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (389, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (390, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (391, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (392, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (393, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (394, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (395, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (396, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (397, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (398, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (399, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (400, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (401, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (402, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (403, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (404, 2, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (405, 2, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (406, 2, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (407, 2, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (408, 2, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (409, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (410, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (411, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (412, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (413, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (414, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (415, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (416, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (417, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (418, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (419, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (420, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (421, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (422, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (423, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (424, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (425, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (426, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (427, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (428, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (429, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (430, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (431, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (432, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (433, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (434, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (435, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (436, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (437, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (438, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (439, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (440, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (441, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (442, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (443, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (444, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (445, 3, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (446, 3, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (447, 3, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (448, 3, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (449, 3, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (450, 3, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (451, 3, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (452, 3, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (453, 3, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (454, 3, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (455, 3, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (456, 3, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (457, 3, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (458, 3, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (459, 3, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (460, 3, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (461, 3, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (462, 3, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (463, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (464, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (465, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (466, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (467, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (468, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (469, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (470, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (471, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (472, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (473, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (474, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (475, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (476, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (477, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (478, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (479, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (480, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (481, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (482, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (483, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (484, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (485, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (486, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (487, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (488, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (489, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (490, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (491, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (492, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (493, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (494, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (495, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (496, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (497, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (498, 3, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (499, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (500, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (501, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (502, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (503, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (504, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (505, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (506, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (507, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (508, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (509, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (510, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (511, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (512, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (513, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (514, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (515, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (516, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (517, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (518, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (519, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (520, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (521, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (522, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (523, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (524, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (525, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (526, 3, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (527, 3, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (528, 3, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (529, 3, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (530, 3, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (531, 3, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (532, 3, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (533, 3, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (534, 3, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (535, 3, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (536, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (537, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (538, 3, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (539, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (540, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (541, 3, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (542, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (543, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (544, 3, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (545, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (546, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (547, 3, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (548, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (549, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (550, 3, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (551, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (552, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (553, 3, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (554, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (555, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (556, 3, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (557, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (558, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (559, 3, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (560, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (561, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (562, 3, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (563, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (564, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (565, 3, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (566, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (567, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (568, 3, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (569, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (570, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (571, 3, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (572, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (573, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (574, 3, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (575, 3, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (576, 3, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (577, 3, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (578, 3, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (579, 3, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (580, 3, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (581, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (582, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (583, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (584, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (585, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (586, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (587, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (588, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (589, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (590, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (591, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (592, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (593, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (594, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (595, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (596, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (597, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (598, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (599, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (600, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (601, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (602, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (603, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (604, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (605, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (606, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (607, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (608, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (609, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (610, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (611, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (612, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (613, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (614, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (615, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (616, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (617, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (618, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (619, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (620, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (621, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (622, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (623, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (624, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (625, 3, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (626, 3, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (627, 3, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (628, 3, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (629, 3, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (630, 3, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (631, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (632, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (633, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (634, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (635, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (636, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (637, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (638, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (639, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (640, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (641, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (642, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (643, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (644, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (645, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (646, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (647, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (648, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (649, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (650, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (651, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (652, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (653, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (654, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (655, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (656, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (657, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (658, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (659, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (660, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (661, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (662, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (663, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (664, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (665, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `R_TRANS_ATTRIBUTE` VALUES (666, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');

-- ----------------------------
-- Table structure for R_TRANS_CLUSTER
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_CLUSTER`;
CREATE TABLE `R_TRANS_CLUSTER`  (
  `ID_TRANS_CLUSTER` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_CLUSTER` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_TRANS_HOP
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_HOP`;
CREATE TABLE `R_TRANS_HOP`  (
  `ID_TRANS_HOP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP_FROM` int(11) NULL DEFAULT NULL,
  `ID_STEP_TO` int(11) NULL DEFAULT NULL,
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_HOP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_TRANS_HOP
-- ----------------------------
INSERT INTO `R_TRANS_HOP` VALUES (1, 3, 3, 2, 1);

-- ----------------------------
-- Table structure for R_TRANS_LOCK
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_LOCK`;
CREATE TABLE `R_TRANS_LOCK`  (
  `ID_TRANS_LOCK` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_USER` int(11) NULL DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `LOCK_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_LOCK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_TRANS_NOTE
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_NOTE`;
CREATE TABLE `R_TRANS_NOTE`  (
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_NOTE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_TRANS_PARTITION_SCHEMA
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_PARTITION_SCHEMA`;
CREATE TABLE `R_TRANS_PARTITION_SCHEMA`  (
  `ID_TRANS_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_PARTITION_SCHEMA` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_PARTITION_SCHEMA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_TRANS_SLAVE
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_SLAVE`;
CREATE TABLE `R_TRANS_SLAVE`  (
  `ID_TRANS_SLAVE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_SLAVE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_TRANS_STEP_CONDITION
-- ----------------------------
DROP TABLE IF EXISTS `R_TRANS_STEP_CONDITION`;
CREATE TABLE `R_TRANS_STEP_CONDITION`  (
  `ID_TRANSFORMATION` int(11) NULL DEFAULT NULL,
  `ID_STEP` int(11) NULL DEFAULT NULL,
  `ID_CONDITION` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_USER
-- ----------------------------
DROP TABLE IF EXISTS `R_USER`;
CREATE TABLE `R_USER`  (
  `ID_USER` bigint(20) NOT NULL,
  `LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ENABLED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_USER
-- ----------------------------
INSERT INTO `R_USER` VALUES (1, 'admin', '2be98afc86aa7f2e4cb79ce71da9fa6d4', 'Administrator', 'User manager', 1);
INSERT INTO `R_USER` VALUES (2, 'guest', '2be98afc86aa7f2e4cb79ce77cb97bcce', 'Guest account', 'Read-only guest account', 1);

-- ----------------------------
-- Table structure for R_VALUE
-- ----------------------------
DROP TABLE IF EXISTS `R_VALUE`;
CREATE TABLE `R_VALUE`  (
  `ID_VALUE` bigint(20) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALUE_STR` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `IS_NULL` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VALUE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for R_VERSION
-- ----------------------------
DROP TABLE IF EXISTS `R_VERSION`;
CREATE TABLE `R_VERSION`  (
  `ID_VERSION` bigint(20) NOT NULL,
  `MAJOR_VERSION` int(11) NULL DEFAULT NULL,
  `MINOR_VERSION` int(11) NULL DEFAULT NULL,
  `UPGRADE_DATE` datetime(0) NULL DEFAULT NULL,
  `IS_UPGRADE` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VERSION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of R_VERSION
-- ----------------------------
INSERT INTO `R_VERSION` VALUES (1, 5, 0, '2018-08-21 16:48:35', 0);

-- ----------------------------
-- Table structure for SYS_MENU
-- ----------------------------
DROP TABLE IF EXISTS `SYS_MENU`;
CREATE TABLE `SYS_MENU`  (
  `MENU_ID` bigint(64) NOT NULL,
  `PARENT_ID` bigint(64) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `PERMS` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `TYPE` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'NULL' COMMENT '菜单图标',
  `ORDER_NUM` int(11) NULL DEFAULT NULL COMMENT '排序',
  `STATUS` int(1) NULL DEFAULT NULL COMMENT '状态  0：正常   1：禁用\n',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SYS_ORGANIZER
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ORGANIZER`;
CREATE TABLE `SYS_ORGANIZER`  (
  `ORGANIZER_ID` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `ORGANIZER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组织名称',
  `ORGANIZER_CONTACT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_EMAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_TELPHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_MOBILE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_ADDRESS` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_VERIFY_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORGANIZER_STATUS` int(11) NULL DEFAULT 0 COMMENT '0 已注册未验证通过，1已注册并验证通过， 2 注销',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ORGANIZER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '组织信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_ORGANIZER
-- ----------------------------
INSERT INTO `SYS_ORGANIZER` VALUES (2, '北京傲飞商智软件有限公司', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for SYS_PLATFORM_LOG
-- ----------------------------
DROP TABLE IF EXISTS `SYS_PLATFORM_LOG`;
CREATE TABLE `SYS_PLATFORM_LOG`  (
  `PLATFORM_LOG_ID` bigint(64) NOT NULL,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `MODULE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  `OPERATION` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户操作',
  `METHOD` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '请求方法',
  `PARAMS` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '请求参数',
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`PLATFORM_LOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_PLATFORM_LOG
-- ----------------------------
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047126820316602370, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538489463255,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-02 22:11:03', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047130982085398529, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538490455479,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-02 22:27:35', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047134021630382082, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538491180186,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-02 22:39:40', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047310300077948930, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538533208239,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-03 10:20:08', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047316902172463105, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538534782303,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-03 10:46:22', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047422932600512513, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538560061928,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-03 17:47:41', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1047425141744648193, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"loginIp\":\"0:0:0:0:0:0:0:1\",\"loginTime\":1538560588628,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-03 17:56:28', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1056515443927379970, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1540727885547,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-28 19:58:05', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1056523079691317249, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1540729706033,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-28 20:28:26', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1056540947191476226, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1540733966048,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-10-28 21:39:26', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059803061188341762, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 21:41:54', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059803264570142722, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 21:42:43', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059804634945728513, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 21:48:09', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059807051926003714, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 21:57:46', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059807564398649345, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 21:59:48', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059808294660530178, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 22:02:42', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059808688971243521, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string.ktr\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 22:04:16', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059809585365311489, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string.ktr\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 22:07:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1059810132902350849, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":2,\"cycleNum\":\"10\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"string2.ktr\",\"filePath\":\"string\",\"fileType\":\"string\",\"group\":\"string\",\"jobName\":\"string2.ktr\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"kettle\",\"rows\":15,\"startDate\":\"2018-11-06\",\"startTime\":\"21:42:59\",\"version\":\"3.9\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-06 22:10:00', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983132095385601, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031483999,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:44', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983148226678786, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031487886,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:47', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983152664252418, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031488945,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:48', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983156921470977, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031489959,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:49', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983157693222914, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031490144,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983158469169153, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031490328,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983159173812225, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031490496,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983159912009729, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031490673,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983160587292673, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031490833,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983161291935745, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031491002,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:51', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983162030133250, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031491178,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:51', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983163930152962, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031491631,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:51', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983164756430850, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031491828,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:51', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061983183496581121, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031496295,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:04:56', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1061984211893805057, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542031741435,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-12 22:09:01', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063084431100702721, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542294054146,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-15 23:00:54', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063084431914397697, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542294054378,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-15 23:00:54', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063674416435142657, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":3,\"cycleNum\":\"1\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"endDate\":\"string\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"test.ktr\",\"filePath\":\"/test\",\"fileType\":\"ktr\",\"group\":\"test\",\"jobName\":\"test\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"string\",\"rows\":15,\"startDate\":\"string\",\"startTime\":\"string\",\"version\":\"string\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-17 14:05:18', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063674805653970945, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":3,\"cycleNum\":\"1\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"endDate\":\"2018-11-18\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"test.ktr\",\"filePath\":\"/test\",\"fileType\":\"ktr\",\"group\":\"test\",\"jobName\":\"test\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"string\",\"rows\":15,\"startDate\":\"2018-11-17\",\"startTime\":\"14:08:00\",\"version\":\"string\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-17 14:06:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063675835485626369, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542435055971,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-17 14:10:56', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063676315490164738, 'admin', '普通调度', '删除调度信息', 'removeJob', '\"test\"', '0:0:0:0:0:0:0:1', '2018-11-17 14:12:50', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063677266204622850, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":3,\"cycleNum\":\"1\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"endDate\":\"2018-11-18\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"test\",\"filePath\":\"/test\",\"fileType\":\"transformation\",\"group\":\"test\",\"jobName\":\"test\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"string\",\"rows\":15,\"startDate\":\"2018-11-17\",\"startTime\":\"14:17:00\",\"version\":\"string\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-17 14:16:37', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063677485168263169, NULL, '普通调度', '删除调度信息', 'removeJob', '\"test\"', '0:0:0:0:0:0:0:1', '2018-11-17 14:17:29', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063677831554883586, NULL, '普通调度', '创建调度信息', 'create', '{\"cycle\":3,\"cycleNum\":\"1\",\"dayNum\":0,\"dayType\":0,\"description\":\"string\",\"endDate\":\"2018-11-18\",\"errorNoticeUser\":\"string\",\"execType\":0,\"file\":\"test\",\"filePath\":\"/test\",\"fileType\":\"transformation\",\"group\":\"test\",\"jobName\":\"test\",\"monthNum\":0,\"monthType\":0,\"page\":1,\"repository\":\"string\",\"rows\":15,\"startDate\":\"2018-11-17\",\"startTime\":\"14:20:00\",\"version\":\"string\",\"weekNum\":0,\"yearType\":0}', '0:0:0:0:0:0:0:1', '2018-11-17 14:18:52', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063678219402174465, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542435624341,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-17 14:20:24', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063683742470037506, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542436941097,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-17 14:42:21', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063684380385955842, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542437093186,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-17 14:44:53', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1063686447997419522, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542437586145,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-17 14:53:06', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1064435697467342850, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542616221089,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-19 16:30:21', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1064886415793963010, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542723680727,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-20 22:21:21', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065155930381430785, 'admin', '调度分组管理', '新建调度分组信息', 'save', '{\"groupName\":\"111\",\"organizerId\":2,\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:12:18', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065157891872862210, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591146000\",\"groupName\":\"111\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:20:06', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065158547337760769, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591145986\",\"groupName\":\"111\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:22:42', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065158764577542146, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591145986\",\"groupName\":\"111\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:23:34', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065159429274025986, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591145986\",\"groupName\":\"111\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:26:12', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065159508668006401, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591145986\",\"groupName\":\"默认分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:26:31', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065160032708542465, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591145986\",\"groupName\":\"默认分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:28:36', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065160032771457025, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"\",\"groupId\":\"1065155930591145986\",\"groupName\":\"默认分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:28:36', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065160079814770689, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"默认分组\",\"groupId\":\"1065155930591145986\",\"groupName\":\"默认分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:28:47', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065160530471763969, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"默认分组\",\"groupId\":\"1065155930591145986\",\"groupName\":\"默认分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:30:35', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065160966914260994, 'admin', '调度分组管理', '新建调度分组信息', 'save', '{\"description\":\"测试分组\",\"groupName\":\"测试分组\",\"organizerId\":2,\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:32:19', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065161688829476866, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"默认分组\",\"groupId\":\"1065155930591145986\",\"groupName\":\"默认分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:35:11', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065161776813391873, 'admin', '调度分组管理', '新建调度分组信息', 'save', '{\"description\":\"啊啊\",\"groupName\":\"aa\",\"organizerId\":2,\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-21 16:35:32', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065885614769549314, 'admin', '系统用户', '用户登录', 'updateLogin', '{\"lastLoginIp\":\"0:0:0:0:0:0:0:1\",\"lastLoginTime\":1542961908293,\"page\":1,\"rows\":15,\"userId\":1}', '0:0:0:0:0:0:0:1', '2018-11-23 16:31:48', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065885929753391105, NULL, '调度分组管理', '删除调度分组信息', 'del', '1065155930591145986', '0:0:0:0:0:0:0:1', '2018-11-23 16:33:04', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065887919547985922, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"测试分组\",\"groupId\":\"1065160967417577473\",\"groupName\":\"测试分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-23 16:40:58', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065887936241315841, NULL, '调度分组管理', '修改调度分组信息', 'update', '{\"description\":\"测试分组\",\"groupId\":\"1065160967417577473\",\"groupName\":\"测试分组\",\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-23 16:41:02', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065965809610285057, 'admin', '调度分组管理', '新建调度分组信息', 'save', '{\"description\":\"默认分组\",\"groupName\":\"默认分组\",\"organizerId\":2,\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-23 21:50:28', 0);
INSERT INTO `SYS_PLATFORM_LOG` VALUES (1065967070854262785, 'admin', '调度分组管理', '新建调度分组信息', 'save', '{\"description\":\"默认分组\",\"groupName\":\"默认分组\",\"organizerId\":2,\"page\":1,\"rows\":15}', '0:0:0:0:0:0:0:1', '2018-11-23 21:55:29', 0);

-- ----------------------------
-- Table structure for SYS_REPOSITORY
-- ----------------------------
DROP TABLE IF EXISTS `SYS_REPOSITORY`;
CREATE TABLE `SYS_REPOSITORY`  (
  `ID_REPOSITORY` bigint(64) NOT NULL COMMENT '资源库ID',
  `ID_REPOSITORY_CONNECTION` bigint(64) NOT NULL COMMENT '资源数据库链接ID',
  `REPOSITORY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源库名称',
  `IS_DEFAULT` int(11) NULL DEFAULT NULL COMMENT '是否默认资源库 0:否 1:是',
  `ORGANIZER_ID` bigint(64) NULL DEFAULT NULL,
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_REPOSITORY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '资源库管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_REPOSITORY
-- ----------------------------
INSERT INTO `SYS_REPOSITORY` VALUES (1, 1043540675649384450, 'kettle', 0, 1, 'admin', 'admin', '2018-10-09 15:36:24', '2018-10-09 15:36:16', 0);

-- ----------------------------
-- Table structure for SYS_REPOSITORY_DATABASE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_REPOSITORY_DATABASE`;
CREATE TABLE `SYS_REPOSITORY_DATABASE`  (
  `ID_REPOSITORY_CONNECTION` bigint(64) NOT NULL COMMENT '资源数据库链接ID',
  `REPOSITORY_CONNECTION_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '资源数据库链接名称',
  `DATABASE_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `DATABASE_CONTYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据库连接方式',
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主机名',
  `DATABASE_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '数据库名',
  `PORT` int(11) NULL DEFAULT NULL COMMENT '端口',
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `SERVERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '服务器名',
  `DATA_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据表空间',
  `INDEX_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '索引表空间',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`ID_REPOSITORY_CONNECTION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '资源库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_REPOSITORY_DATABASE
-- ----------------------------
INSERT INTO `SYS_REPOSITORY_DATABASE` VALUES (1043540675649384450, 'localhost', 'MYSQL', '0', 'localhost', 'kettle', 3306, 'root', 'Encrypted 2be98afc86aa7f2e4cb79ff228dc6fa8c', NULL, NULL, NULL, NULL, NULL, '2018-09-23 00:40:59', '2018-09-23 00:40:59', 0);

-- ----------------------------
-- Table structure for SYS_REPOSITORY_DATABASE_ATTRIBUTE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_REPOSITORY_DATABASE_ATTRIBUTE`;
CREATE TABLE `SYS_REPOSITORY_DATABASE_ATTRIBUTE`  (
  `ID_REPOSITORY_DATABASE_ATTRIBUTE` bigint(64) NOT NULL COMMENT '资源库属性ID',
  `ID_REPOSITORY_CONNECTION` bigint(64) NOT NULL COMMENT '资源库ID',
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '属性名',
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '属性值',
  PRIMARY KEY (`ID_REPOSITORY_DATABASE_ATTRIBUTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '资源库链接属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE`;
CREATE TABLE `SYS_ROLE`  (
  `C_ROLE_ID` bigint(64) NOT NULL,
  `C_ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `C_DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `C_ORGANIZER_ID` bigint(64) NULL DEFAULT NULL,
  `C_PRIVILEDGES` bigint(20) NULL DEFAULT NULL COMMENT '设计器权限',
  `C_ISSYSTEMROLE` int(11) NULL DEFAULT NULL COMMENT '是否是系统保留权限',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`C_ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SYS_ROLE_MENU
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_MENU`;
CREATE TABLE `SYS_ROLE_MENU`  (
  `ROLE_ID` bigint(64) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(64) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ROLE_ID`, `MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SYS_ROLE_OPERATION
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_OPERATION`;
CREATE TABLE `SYS_ROLE_OPERATION`  (
  `ID_OPERATION` bigint(64) NOT NULL COMMENT '操作ID',
  `OPERATION_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作名称',
  PRIMARY KEY (`ID_OPERATION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '设计器操作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_ROLE_OPERATION
-- ----------------------------
INSERT INTO `SYS_ROLE_OPERATION` VALUES (1, '新建');
INSERT INTO `SYS_ROLE_OPERATION` VALUES (2, '删除');
INSERT INTO `SYS_ROLE_OPERATION` VALUES (4, '修改');
INSERT INTO `SYS_ROLE_OPERATION` VALUES (8, '执行');
INSERT INTO `SYS_ROLE_OPERATION` VALUES (16, '浏览');

-- ----------------------------
-- Table structure for SYS_ROLE_PRIVILEDGE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_PRIVILEDGE`;
CREATE TABLE `SYS_ROLE_PRIVILEDGE`  (
  `ID_PRIVILEDGE` bigint(64) NOT NULL COMMENT '权限ID',
  `ID_RESOURCE_TYPE` bigint(64) NOT NULL COMMENT '类型ID',
  `ID_OPERATION` bigint(64) NOT NULL COMMENT '操作ID',
  PRIMARY KEY (`ID_PRIVILEDGE`, `ID_RESOURCE_TYPE`, `ID_OPERATION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '设计器权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_ROLE_PRIVILEDGE
-- ----------------------------
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (1, 1, 1);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (2, 1, 4);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (4, 1, 2);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (8, 1, 16);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (16, 1, 8);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (32, 2, 1);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (64, 2, 4);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (128, 2, 2);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (256, 2, 16);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (512, 4, 1);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (1024, 4, 4);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (2048, 4, 2);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (4096, 8, 1);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (8192, 8, 4);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (16384, 8, 2);
INSERT INTO `SYS_ROLE_PRIVILEDGE` VALUES (32768, 8, 16);

-- ----------------------------
-- Table structure for SYS_ROLE_RESOURCE_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_RESOURCE_TYPE`;
CREATE TABLE `SYS_ROLE_RESOURCE_TYPE`  (
  `ID_RESOURCE_TYPE` bigint(64) NOT NULL COMMENT '设计器资源ID',
  `RESOURCE_TYPE_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '设计器资源名称(文件 数据库连接等)',
  PRIMARY KEY (`ID_RESOURCE_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '设计器权限类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_ROLE_RESOURCE_TYPE
-- ----------------------------
INSERT INTO `SYS_ROLE_RESOURCE_TYPE` VALUES (1, '文件');
INSERT INTO `SYS_ROLE_RESOURCE_TYPE` VALUES (2, '目录');
INSERT INTO `SYS_ROLE_RESOURCE_TYPE` VALUES (4, '集群');
INSERT INTO `SYS_ROLE_RESOURCE_TYPE` VALUES (8, '数据源');

-- ----------------------------
-- Table structure for SYS_USER
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER`;
CREATE TABLE `SYS_USER`  (
  `C_USER_ID` bigint(64) NOT NULL COMMENT '主键',
  `C_USER_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `C_PASSWORD` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `C_NICK_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '昵称（名称）',
  `C_EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `C_MOBILEPHONE` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `C_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `C_IS_SYSTEM_USER` int(11) NULL DEFAULT NULL COMMENT '系统用户',
  `C_ORGANIZER_ID` bigint(64) NULL DEFAULT NULL COMMENT '组织ID',
  `C_USER_STATUS` int(11) NULL DEFAULT NULL COMMENT '用户状态',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `LAST_LOGIN_IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后一次登录IP',
  `CREATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最后修改用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后时间更新',
  `DEL_FLAG` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`C_USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO `SYS_USER` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '381906259@qq.com', '13614019065', NULL, NULL, 2, 0, '2018-11-23 16:31:48', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for SYS_USER_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER_ROLE`;
CREATE TABLE `SYS_USER_ROLE`  (
  `C_USER_ID` bigint(64) NOT NULL DEFAULT 0,
  `C_ROLE_ID` bigint(64) NOT NULL DEFAULT 0,
  PRIMARY KEY (`C_USER_ID`, `C_ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
