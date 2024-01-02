/*
 Navicat Premium Data Transfer

 Source Server         : play.qics.top_3306
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : play.qics.top:3306
 Source Schema         : pickstar

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 11/10/2023 19:09:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for box
-- ----------------------------
DROP TABLE IF EXISTS `box`;
CREATE TABLE `box`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'box主键',
  `symbol` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对',
  `time_frame` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期',
  `box_config_id` bigint(20) NOT NULL COMMENT 'box配置主键',
  `start_ohlc_id` bigint(20) NOT NULL COMMENT '矩形开始的ohcl主键',
  `end_ohlc_id` bigint(20) NULL DEFAULT NULL COMMENT '矩形结束的ohcl主键',
  `border_low` double(9, 5) NULL DEFAULT NULL COMMENT '矩形底值',
  `border_high` double(9, 5) NULL DEFAULT NULL COMMENT '矩形顶值',
  `score` float(8, 4) NULL DEFAULT NULL COMMENT '矩形得分：(高 - 低) / 高 / sqrt(长)',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_key`(`symbol`, `time_frame`, `box_config_id`, `start_ohlc_id`, `end_ohlc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for box_config
-- ----------------------------
DROP TABLE IF EXISTS `box_config`;
CREATE TABLE `box_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'box配置主键',
  `time_frame` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期',
  `retrospect_bar_num` int(8) NULL DEFAULT NULL COMMENT '回顾bar个数，用于计算最大振幅',
  `max_high_rate` float NULL DEFAULT NULL COMMENT '矩形高度比最大振幅的最大值。大于该值，矩形会被丢弃。默认0.15',
  `min_bar_num` int(8) NULL DEFAULT NULL COMMENT '矩形最少的bar个数，即长。比如6天。该字段可以过滤横盘时间',
  `min_score` float NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of box_config
-- ----------------------------
INSERT INTO `box_config` VALUES (1, 'H4', 100, 0.15, 20, 0.002, '2022-02-09 15:36:36', NULL);

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_type` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `dic_key` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典键',
  `dic_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字典键',
  `dic_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字典键',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fractal
-- ----------------------------
DROP TABLE IF EXISTS `fractal`;
CREATE TABLE `fractal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ohlc_id` bigint(20) NOT NULL COMMENT 'ohcl主键',
  `symbol` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对',
  `time_frame` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期',
  `fractal_config_id` bigint(20) NOT NULL COMMENT '分型主键',
  `start_ohlc_id` bigint(20) NULL DEFAULT NULL COMMENT '分形开始ohlc_id',
  `fractal_value` float(10, 5) NULL DEFAULT NULL COMMENT '分形值',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`ohlc_id`) USING BTREE,
  INDEX `idx_symbol`(`symbol`) USING BTREE,
  INDEX `idx_frame`(`time_frame`) USING BTREE,
  INDEX `idx_start_id`(`start_ohlc_id`) USING BTREE,
  INDEX `idx_fractal_value`(`fractal_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kama
-- ----------------------------
DROP TABLE IF EXISTS `kama`;
CREATE TABLE `kama`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ohlc_id` bigint(20) NOT NULL COMMENT 'ohcl主键',
  `symbol` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对',
  `time_frame` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期',
  `kama_config_id` bigint(20) NOT NULL COMMENT 'ohcl主键',
  `kama_value` float(10, 5) NULL DEFAULT NULL COMMENT 'kama值',
  `color` tinyint(2) NULL DEFAULT NULL COMMENT '颜色 -1=蓝色，0=无色，1=红色',
  `color_change` tinyint(4) NULL DEFAULT 0 COMMENT 'kama颜色是否改变。-1变蓝，0未改变，1变红',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_key`(`ohlc_id`, `symbol`, `time_frame`, `kama_config_id`) USING BTREE,
  INDEX `idx_ohlcid`(`ohlc_id`) USING BTREE,
  INDEX `idx_symbol`(`symbol`) USING BTREE,
  INDEX `idx_timeframe`(`time_frame`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kama_config
-- ----------------------------
DROP TABLE IF EXISTS `kama_config`;
CREATE TABLE `kama_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'kama配置主键',
  `periods` int(8) NOT NULL,
  `fast` int(8) NOT NULL,
  `slow` int(8) NOT NULL,
  `point_times` double(9, 5) NOT NULL DEFAULT 2.00000 COMMENT '点值阈值。当5位小数报价，点值为0.00001，如果点值阈值point_times=2.0，则abs(kama1-kama0) >2.0 * point时变色 ',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kama_config
-- ----------------------------
INSERT INTO `kama_config` VALUES (1, 9, 2, 30, 0.00002, '2022-02-09 13:23:37', NULL);

-- ----------------------------
-- Table structure for market_order
-- ----------------------------
DROP TABLE IF EXISTS `market_order`;
CREATE TABLE `market_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `symbol` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对',
  `order_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易类型',
  `open_time` datetime(0) NULL,
  `price_open` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '价格',
  `volume` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数量',
  `stop_loss` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '止损',
  `profit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收益',
  `graph` longblob NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notify_message
-- ----------------------------
DROP TABLE IF EXISTS `notify_message`;
CREATE TABLE `notify_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `symbol` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对',
  `time_frame` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期',
  `bar_time` datetime(0) NULL DEFAULT NULL,
  `notify_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型',
  `notify_content` varchar(4192) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知内容',
  `status` int(16) NOT NULL DEFAULT 0 COMMENT '状态',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_key`(`symbol`, `time_frame`, `bar_time`, `notify_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ohlc
-- ----------------------------
DROP TABLE IF EXISTS `ohlc`;
CREATE TABLE `ohlc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `symbol` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对',
  `time_frame` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期',
  `bar_time` datetime(0) NULL DEFAULT NULL,
  `open` double(9, 5) NULL DEFAULT NULL,
  `high` double(9, 5) NULL DEFAULT NULL,
  `low` double(9, 5) NULL DEFAULT NULL,
  `close` double(9, 5) NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_bar`(`symbol`, `time_frame`, `bar_time`) USING BTREE,
  INDEX `idx_timeframe`(`time_frame`) USING BTREE,
  INDEX `idx_bartime`(`bar_time`) USING BTREE,
  INDEX `idx_symbol`(`symbol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for symbol
-- ----------------------------
DROP TABLE IF EXISTS `symbol`;
CREATE TABLE `symbol`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `symbol_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币对名称',
  `min_point` double(9, 5) NULL DEFAULT NULL COMMENT '最小单位',
  `digit` int(8) NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '注释',
  `status` bigint(16) NULL DEFAULT 1 COMMENT '状态：0=不启用，1=启用',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of symbol
-- ----------------------------
INSERT INTO `symbol` VALUES (1, 'USDSEK', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (2, 'USDNOK', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (3, 'USDMXN', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (4, 'USDZAR', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (5, 'USDHKD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (6, 'USDTRY', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (7, 'NZDCHF', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (8, 'USDCNH', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (9, 'XAUUSD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (10, 'XAGUSD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (11, 'GBPUSD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (12, 'EURUSD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (13, 'USDCHF', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (14, 'USDJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (15, 'AUDCAD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (16, 'AUDCHF', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (17, 'AUDJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (18, 'AUDNZD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (19, 'AUDUSD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (20, 'CADCHF', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (21, 'CADJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (22, 'CHFJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (23, 'EURAUD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (24, 'EURCAD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (25, 'EURCHF', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (26, 'EURGBP', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (27, 'EURJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (28, 'EURNOK', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (29, 'EURNZD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (30, 'EURSEK', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (31, 'EURTRY', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (32, 'GBPAUD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (33, 'GBPCAD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (34, 'GBPCHF', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (35, 'GBPJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (36, 'GBPNZD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (37, 'NZDCAD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (38, 'NZDJPY', 0.00100, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (39, 'NZDUSD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (40, 'USDCAD', 0.00001, NULL, NULL, 1, '2022-02-16 11:00:00', NULL);
INSERT INTO `symbol` VALUES (41, 'USDHUF', 0.00100, NULL, NULL, 1, '2023-10-06 18:18:38', NULL);
INSERT INTO `symbol` VALUES (42, 'USDPLN', 0.00001, 5, NULL, 1, '2023-10-10 20:17:42', NULL);

SET FOREIGN_KEY_CHECKS = 1;
