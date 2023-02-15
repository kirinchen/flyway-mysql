/*
 Navicat Premium Data Transfer

 Source Server         : AIRLINE_EDI_TASK_DB
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : afwprd.cctwl58vu3o3.us-west-2.rds.amazonaws.com:3306
 Source Schema         : cw1edi

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 13/02/2023 11:39:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_ccs
-- ----------------------------
DROP TABLE IF EXISTS `config_ccs`;
CREATE TABLE `config_ccs`  (
  `STATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CCS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AIRLINE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EDI_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GO_LIVE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`STATION`, `CCS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_cncircular
-- ----------------------------
DROP TABLE IF EXISTS `config_cncircular`;
CREATE TABLE `config_cncircular`  (
  `CTRY_CODE` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CIRCULAR_TYPE` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CIRCULAR_DESCP` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CW1_CODE` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_destination
-- ----------------------------
DROP TABLE IF EXISTS `config_destination`;
CREATE TABLE `config_destination`  (
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_host` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_path_template` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_email
-- ----------------------------
DROP TABLE IF EXISTS `config_email`;
CREATE TABLE `config_email`  (
  `STATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ALERT_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SERVER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SENDER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSCODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RECEIVER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BCC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_pima
-- ----------------------------
DROP TABLE IF EXISTS `config_pima`;
CREATE TABLE `config_pima`  (
  `STATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CCS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AIRLINE_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AIRLINE_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PIMA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_setting
-- ----------------------------
DROP TABLE IF EXISTS `config_setting`;
CREATE TABLE `config_setting`  (
  `config_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'data group',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'like key to value',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'value of code in the type',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'desc the purpose',
  PRIMARY KEY (`config_type`, `code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edi_diff_file
-- ----------------------------
DROP TABLE IF EXISTS `edi_diff_file`;
CREATE TABLE `edi_diff_file`  (
  `created_at_utc` datetime NULL DEFAULT NULL,
  `created_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at_utc` datetime NULL DEFAULT NULL,
  `updated_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(11) NULL DEFAULT NULL,
  `batch_uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cw1_file_path` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `prolink_file_path` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mawb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `awb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `format_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lost_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `station` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `airline` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destination` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cw1_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `prolink_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edi_diff_section
-- ----------------------------
DROP TABLE IF EXISTS `edi_diff_section`;
CREATE TABLE `edi_diff_section`  (
  `created_at_utc` datetime NULL DEFAULT NULL,
  `created_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at_utc` datetime NULL DEFAULT NULL,
  `updated_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(11) NULL DEFAULT NULL,
  `batch_uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mawb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `awb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `format_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ratio` float NULL DEFAULT NULL,
  `station` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `airline` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destination` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `section` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cw1_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `prolink_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edi_file
-- ----------------------------
DROP TABLE IF EXISTS `edi_file`;
CREATE TABLE `edi_file`  (
  `created_at_utc` datetime NULL DEFAULT NULL,
  `created_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at_utc` datetime NULL DEFAULT NULL,
  `updated_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `jk_pk` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `js_pk` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mawb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `awb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `station` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destination` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `airline` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `format_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT ' FHL FWB ',
  `file_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `s3_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ftp_file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `raw_data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT 'db 打包原始資料 ',
  `edi_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ftp_upload_exception` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edi_job
-- ----------------------------
DROP TABLE IF EXISTS `edi_job`;
CREATE TABLE `edi_job`  (
  `created_at_utc` datetime NULL DEFAULT NULL,
  `created_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at_utc` datetime NULL DEFAULT NULL,
  `updated_by` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jk_pk` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mawb_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `station` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `airline` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destination` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edi_process_status` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'PENDING_TO_QUEUE , FILE_CREATING , FILE_CREATE_FAIL , FTP_RETRYING , FTP_UPLOAD_FAIL,FTP_UPLOADED',
  `queue_added_at_utc` datetime NULL DEFAULT NULL,
  `message_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'SQS message id',
  `generator_log_stream_name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'cloud watch log_stream_name',
  `generator_edi_exception` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT '建立 edi 如果發生錯誤將會記錄一筆 exception ',
  `s3_upload_at_utc` datetime NULL DEFAULT NULL,
  `ftp_upload_first_at_utc` datetime NULL DEFAULT NULL,
  `ftp_upload_last_at_utc` datetime NULL DEFAULT NULL,
  `ftp_upload_success_at_utc` datetime NULL DEFAULT NULL,
  `ftp_retry_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
