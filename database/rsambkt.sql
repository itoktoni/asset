/*
 Navicat Premium Data Transfer

 Source Server         : ECM
 Source Server Type    : MariaDB
 Source Server Version : 100527 (10.5.27-MariaDB-log)
 Source Host           : localhost:3306
 Source Schema         : rsambkt

 Target Server Type    : MariaDB
 Target Server Version : 100527 (10.5.27-MariaDB-log)
 File Encoding         : 65001

 Date: 23/05/2026 09:12:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absen
-- ----------------------------
DROP TABLE IF EXISTS `absen`;
CREATE TABLE `absen`  (
  `absen_id` int(11) NOT NULL AUTO_INCREMENT,
  `absen_user` int(11) NULL DEFAULT NULL,
  `absen_tanggal` date NULL DEFAULT NULL,
  `absen_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `absen_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`absen_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of absen
-- ----------------------------

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject`(`subject_type`, `subject_id`) USING BTREE,
  INDEX `causer`(`causer_type`, `causer_id`) USING BTREE,
  INDEX `activity_log_log_name_index`(`log_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_log
-- ----------------------------

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `area_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, 'Gedung A');
INSERT INTO `area` VALUES (2, 'Gedung B');

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset`  (
  `asset_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_serial_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_status_kalibrasi` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_status_maintenance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_status_kepemilikan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_id_penamaan` bigint(20) NULL DEFAULT NULL,
  `asset_id_kalibrasi` bigint(20) NULL DEFAULT NULL,
  `asset_id_vendor` bigint(20) NULL DEFAULT NULL,
  `asset_id_department` bigint(20) NULL DEFAULT NULL,
  `asset_id_model` bigint(20) NULL DEFAULT NULL,
  `asset_id_lokasi` bigint(20) NULL DEFAULT NULL,
  `asset_id_group` bigint(20) NULL DEFAULT NULL,
  `asset_keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_created_at` datetime NULL DEFAULT NULL,
  `asset_updated_at` datetime NULL DEFAULT NULL,
  `asset_deleted_at` datetime NULL DEFAULT NULL,
  `asset_deleted_by` int(11) NULL DEFAULT NULL,
  `asset_updated_by` int(11) NULL DEFAULT NULL,
  `asset_created_by` int(11) NULL DEFAULT NULL,
  `asset_harga_perolehan` int(11) NULL DEFAULT NULL,
  `asset_tahun_pengadaan` year NULL DEFAULT NULL,
  `asset_tanggal_diakui` date NULL DEFAULT NULL,
  `asset_tanggal_kunjungan` date NULL DEFAULT NULL,
  `asset_tanggal_expired` date NULL DEFAULT NULL,
  `asset_status_kunjungan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_pendanaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_akl_akd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `asset_cek_kalibrasi` date NULL DEFAULT NULL,
  `asset_cek_jadwal` date NULL DEFAULT NULL,
  `asset_next_expired` date NULL DEFAULT NULL,
  PRIMARY KEY (`asset_id`) USING BTREE,
  UNIQUE INDEX `asset_serial_number`(`asset_serial_number`) USING BTREE,
  INDEX `asset_ibfk_1`(`asset_id_penamaan`) USING BTREE,
  INDEX `asset_id_department`(`asset_id_department`) USING BTREE,
  INDEX `asset_id_lokasi`(`asset_id_lokasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asset
-- ----------------------------
INSERT INTO `asset` VALUES (4, 'Bedside Monitor ~  ( Samsung ) Z-001 | 123', '123', '202502090000001', 'BAIK', 'Yes', 'Garansi', NULL, '1739073199.jpg', 3, 1, 1, 1, 1, 1, 6, 'keterangan', '2025-02-09 10:52:05', '2025-02-20 10:25:58', '2025-02-20 10:25:58', 1, 1, 1, 90000000, 2001, '2025-02-09', '2025-08-21', '2025-02-20', 'Inspeksi', 'APBN', 'AKD 10902110256', NULL, NULL, NULL);
INSERT INTO `asset` VALUES (5, 'Coagulation Instrument ~  ( Samsung ) Z-001 | 1123', '1123', '202502130000001', NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, 1, 1, NULL, 'test', '2025-02-13 08:16:32', '2025-02-20 10:26:07', '2025-02-20 10:26:07', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (6, 'CT-SCAN ~  ( Samsung ) Z-001 | 1234567', '1234567', '202502170000001', 'RUSAK RINGAN', 'Yes', NULL, NULL, '1739954110.jpg', 5, NULL, 1, 2, 1, 1, 6, NULL, '2025-02-17 10:14:40', '2025-02-20 19:57:07', '2025-02-20 19:57:07', 1, 1, 1, NULL, NULL, '2025-02-16', '2026-02-19', NULL, 'Inventaris', 'BLU', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (7, 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', '13030688', '2035286', 'BAIK', 'Yes', 'Internal', 'Internal', '1764384208.jpg', 1131, 2, NULL, NULL, 22, 5, 6, NULL, '2025-02-20 19:56:56', '2025-11-29 09:43:28', NULL, NULL, 3, 1, NULL, NULL, '2025-07-22', '2025-07-22', '2024-12-24', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-24');
INSERT INTO `asset` VALUES (8, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3207', 'VGSNE3207', '2033998', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-20 20:06:26', '2025-02-25 12:12:56', NULL, NULL, 502, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (9, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'VGSN3201', '202502210000001', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 00:01:45', '2025-11-24 11:26:28', NULL, NULL, 3, 1, NULL, NULL, NULL, '2026-05-26', '2024-12-04', 'Inspeksi', NULL, NULL, NULL, NULL, '2025-12-04');
INSERT INTO `asset` VALUES (10, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE4818', 'VGSNE4818', '2035422', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 00:04:25', '2025-02-25 15:53:52', NULL, NULL, 507, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (11, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSM0033', 'VTSM0033', '202502210000003', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 00:06:38', '2025-02-25 09:37:33', NULL, NULL, 502, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (12, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3220', 'VGSNE3220', '202502210000004', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 00:08:41', '2025-02-25 09:38:15', NULL, NULL, 502, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (13, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Elitech ) PM Pro3 | PM10228A00021', 'PM10228A00021', '202502210000005', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 23, 3, 6, NULL, '2025-02-21 00:18:42', '2025-02-25 09:38:34', NULL, NULL, 502, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (14, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTLSC0058', 'VTLSC0058', '202502210000006', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 00:21:23', '2025-02-25 09:39:52', NULL, NULL, 502, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (15, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Elitech ) PM Pro3 | PM10228A00040', 'PM10228A00040', '202502210000007', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 23, 4, NULL, NULL, '2025-02-21 00:27:36', '2025-02-22 15:13:22', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (16, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLM0039', 'VTSLM0039', '202502210000008', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 00:31:26', '2025-02-22 15:13:07', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (17, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2980', 'VGSNE2980', '202502210000009', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, NULL, NULL, '2025-02-21 07:29:39', '2025-02-22 15:12:51', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (18, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2952', 'VGSNE2952', '202502210000010', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 5, NULL, NULL, '2025-02-21 07:38:10', '2025-02-22 15:12:38', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (19, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE4814', 'VGSNE4814', '202502210000011', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, NULL, NULL, '2025-02-21 07:41:43', '2025-02-22 15:12:26', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (20, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0102', 'VTSLC0102', '202502210000012', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 07:43:39', '2025-02-22 07:20:46', '2025-02-22 07:20:46', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (21, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLM0029', 'VTSLM0029', '202502210000013', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 07:45:20', '2025-02-22 15:12:14', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (22, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3266', 'VGSN3266', '202502210000014', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 07:51:30', '2025-02-22 15:11:57', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (23, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0181', 'VTSLC0181', '202502210000015', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, NULL, NULL, '2025-02-21 08:24:12', '2025-02-22 15:11:44', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (24, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0170', 'VTSLC0170', '202502210000016', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 5, NULL, NULL, '2025-02-21 08:32:37', '2025-02-22 15:19:38', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (25, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3268', 'VGSNE3268', '202502210000017', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 08:34:01', '2025-02-22 15:11:14', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (26, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLM3212', 'VTSLM3212', '202502210000018', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 08:42:26', '2025-02-22 15:10:59', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (27, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3270', 'VGSNE3270', '202502210000019', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 08:43:35', '2025-02-22 15:10:48', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (28, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0093', 'VTSLC0093', '202502210000020', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 13:35:42', '2025-02-25 09:35:03', NULL, NULL, 502, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (29, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US92144751', 'US92144751', '202502210000021', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 3, NULL, NULL, '2025-02-21 13:43:27', '2025-02-22 15:15:47', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (30, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US51941979', 'US51941979', '202502210000022', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 3, NULL, NULL, '2025-02-21 15:10:13', '2025-02-22 15:16:22', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (31, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US82144640', 'US82144640', '202502210000023', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 5, NULL, NULL, '2025-02-21 15:11:54', '2025-02-22 15:16:36', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (32, 'Electrocardiograph (ECG/EKG) 3 CH ~  ( Endo ) EL-ECG3CH | ECG31P21230345', 'ECG31P21230345', '202502210000024', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1192, 2, NULL, NULL, 27, 3, NULL, NULL, '2025-02-21 15:13:45', '2025-02-22 15:17:03', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06');
INSERT INTO `asset` VALUES (33, 'CT-Scan 64 Slices ~  ( GE ) Revolution EVO | RE36A2200104YC', 'RE36A2200104YC', '202502210000025', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 939, 2, NULL, NULL, 25, 6, NULL, NULL, '2025-02-21 15:19:09', '2025-02-22 15:17:28', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05');
INSERT INTO `asset` VALUES (34, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US52042973', 'US52042973', '202502210000026', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 7, NULL, NULL, '2025-02-21 15:22:04', '2025-02-22 15:17:53', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-04', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-04');
INSERT INTO `asset` VALUES (35, 'Ultrasonography (USG) 4D ~  ( GE ) Versana Premier | TDN00010', 'TDN00010', '202502210000027', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1173, 2, NULL, NULL, 29, 16, NULL, NULL, '2025-02-21 15:24:49', '2025-02-22 16:04:17', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-11', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-11');
INSERT INTO `asset` VALUES (36, 'Spirometer ~  ( Fukuda ) ST-170 | 87050197', '87050197', '202502210000028', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1128, 2, NULL, NULL, 30, 45, NULL, NULL, '2025-02-21 15:27:25', '2025-02-22 16:03:27', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-13', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-13');
INSERT INTO `asset` VALUES (37, 'Ultrasonography (USG) 3D ~  ( GE ) LOGIQ e | 6077254WXO', '6077254WXO', '202502210000029', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1172, 2, NULL, NULL, 31, 9, NULL, NULL, '2025-02-21 19:33:53', '2025-02-22 15:19:54', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-19', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-19');
INSERT INTO `asset` VALUES (38, 'Ultrasonography (USG) 4D ~  ( Philips ) EPIQ 5G | US517C1416', 'US517C1416', '202502210000030', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1173, 2, NULL, NULL, 32, 9, NULL, NULL, '2025-02-21 20:03:34', '2025-02-22 15:18:57', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-19', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-19');
INSERT INTO `asset` VALUES (39, 'Phototherapy Unit ~  ( Elitech ) BL-50B | BL02222A0005', 'BL02222A0005', '202502210000031', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1096, 2, NULL, NULL, 33, 4, NULL, NULL, '2025-02-21 20:14:40', '2025-02-22 15:18:41', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-18', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-18');
INSERT INTO `asset` VALUES (40, 'Mikroskop Binocular ~  ( Olympus ) CX21 | 9M81880', '9M81880', '202502210000032', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1051, 2, NULL, NULL, 34, 46, NULL, NULL, '2025-02-21 20:21:54', '2025-02-22 15:14:33', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-12-18', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-18');
INSERT INTO `asset` VALUES (41, 'USG ~  ( ASun ) AS1211 | SNT4090', 'SNT4090', '202502220000001', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1196, NULL, NULL, NULL, 35, NULL, NULL, NULL, '2025-02-22 06:50:05', '2025-02-22 11:18:25', '2025-02-22 11:18:25', 1, 1, 1, NULL, NULL, '2024-10-02', NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (42, 'USG ~  ( ASun ) AS1211 | SNT4091', 'SNT4091', '202502220000002', 'RUSAK RINGAN', 'Yes', 'Garansi', 'Internal', NULL, 1196, NULL, NULL, NULL, 35, 13, NULL, NULL, '2025-02-22 06:51:05', '2025-02-22 12:44:41', '2025-02-22 12:44:41', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-01-02', 'Inventaris', NULL, NULL, NULL, NULL, '2025-01-02');
INSERT INTO `asset` VALUES (43, 'Acupunture Therapy/Electro Acupuncture (EAT) | 456', '456', '202502220000003', NULL, NULL, NULL, NULL, NULL, 860, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '2025-02-22 07:20:09', '2025-02-22 11:16:29', '2025-02-22 11:16:29', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (44, 'Acupunture Therapy/Electro Acupuncture (EAT) ~  ( GE ) VVIDE95 | 123456', '123456', '202502220000004', 'BAIK', NULL, 'Internal', 'Internal', NULL, 860, NULL, NULL, NULL, 17, 14, NULL, NULL, '2025-02-22 11:29:20', '2025-02-22 12:45:02', '2025-02-22 12:45:02', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (45, 'kursi roda ~  ( GE ) VVIDE95', NULL, '202502220000005', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1197, NULL, NULL, NULL, 17, 14, NULL, NULL, '2025-02-22 11:51:57', '2025-02-22 12:44:56', '2025-02-22 12:44:56', 1, 3, 1, NULL, NULL, NULL, NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (46, 'Dental Unit ~  ( Belmont ) Clesta | AD14J0176', 'AD14J0176', '2034134', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 944, NULL, NULL, NULL, 49, 10, NULL, NULL, '2025-02-25 12:06:08', '2025-07-03 06:00:01', NULL, NULL, 507, 502, NULL, NULL, '2025-01-02', '2025-07-04', '2024-12-10', 'Preventif', NULL, NULL, NULL, '2025-07-03', '2025-12-10');
INSERT INTO `asset` VALUES (47, 'Automated Blood Culture System ~  ( Versatek ) 240 | 1169446001180710', '1169446001180710', '2033638', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 877, 2, NULL, NULL, 51, 46, 6, NULL, '2025-02-25 15:48:15', '2025-02-25 15:56:37', NULL, NULL, 507, 507, NULL, NULL, NULL, NULL, '2024-12-18', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-18');
INSERT INTO `asset` VALUES (48, 'Endoscopy ~  ( FujiFilm ) 4400 | 15088A539', '15088A539', '2035147', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 959, 2, NULL, NULL, 52, 48, NULL, NULL, '2025-02-25 16:13:21', '2025-02-25 16:15:41', NULL, NULL, 507, 507, NULL, NULL, NULL, NULL, '2024-12-23', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-23');
INSERT INTO `asset` VALUES (49, 'Centrifuge, Cyto Centrifuge ~  ( Eppendorf ) 5702 | 5702CQ734497', '5702CQ734497', '2033988', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 917, 2, NULL, NULL, 45, 40, 6, NULL, '2025-02-25 16:20:23', '2025-02-25 16:22:32', NULL, NULL, 507, 507, NULL, NULL, NULL, NULL, '2024-12-19', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-19');

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributable_id` bigint(20) UNSIGNED NOT NULL,
  `attributable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attributes
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`) USING BTREE,
  UNIQUE INDEX `brand_nama`(`brand_nama`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (107, '3M');
INSERT INTO `brand` VALUES (9, 'Abbott');
INSERT INTO `brand` VALUES (10, 'Acoma');
INSERT INTO `brand` VALUES (11, 'Acutome');
INSERT INTO `brand` VALUES (118, 'ADE');
INSERT INTO `brand` VALUES (95, 'Aesculap');
INSERT INTO `brand` VALUES (12, 'Alcon');
INSERT INTO `brand` VALUES (13, 'Analog Medical');
INSERT INTO `brand` VALUES (14, 'AND Medical');
INSERT INTO `brand` VALUES (106, 'ApexBio');
INSERT INTO `brand` VALUES (15, 'Ardo');
INSERT INTO `brand` VALUES (17, 'Arnez');
INSERT INTO `brand` VALUES (117, 'Asano');
INSERT INTO `brand` VALUES (19, 'Atmos');
INSERT INTO `brand` VALUES (20, 'Atom');
INSERT INTO `brand` VALUES (114, 'Baxter');
INSERT INTO `brand` VALUES (21, 'BBraun');
INSERT INTO `brand` VALUES (96, 'BD');
INSERT INTO `brand` VALUES (22, 'BELA');
INSERT INTO `brand` VALUES (23, 'Belmont');
INSERT INTO `brand` VALUES (24, 'Bestman');
INSERT INTO `brand` VALUES (25, 'Biobase');
INSERT INTO `brand` VALUES (26, 'Bistos');
INSERT INTO `brand` VALUES (27, 'BK Medical');
INSERT INTO `brand` VALUES (28, 'Bluecross');
INSERT INTO `brand` VALUES (29, 'BTL');
INSERT INTO `brand` VALUES (120, 'Camry');
INSERT INTO `brand` VALUES (30, 'Cardioline');
INSERT INTO `brand` VALUES (31, 'Carl Zeiss');
INSERT INTO `brand` VALUES (32, 'Clyde-Apac');
INSERT INTO `brand` VALUES (33, 'Comeg');
INSERT INTO `brand` VALUES (34, 'Comen');
INSERT INTO `brand` VALUES (35, 'Covidien');
INSERT INTO `brand` VALUES (7, 'CSA');
INSERT INTO `brand` VALUES (8, 'CSI');
INSERT INTO `brand` VALUES (113, 'danaher');
INSERT INTO `brand` VALUES (2, 'Datex-Ohmeda');
INSERT INTO `brand` VALUES (121, 'Dimed');
INSERT INTO `brand` VALUES (122, 'Dixion');
INSERT INTO `brand` VALUES (37, 'DPMMed');
INSERT INTO `brand` VALUES (3, 'Drager');
INSERT INTO `brand` VALUES (6, 'Elitech');
INSERT INTO `brand` VALUES (39, 'Endo');
INSERT INTO `brand` VALUES (40, 'Enraf');
INSERT INTO `brand` VALUES (41, 'Eppendorf');
INSERT INTO `brand` VALUES (42, 'Erbe');
INSERT INTO `brand` VALUES (76, 'Eternity');
INSERT INTO `brand` VALUES (58, 'Fisher Paykel');
INSERT INTO `brand` VALUES (111, 'Fresenius');
INSERT INTO `brand` VALUES (44, 'FujiFilm');
INSERT INTO `brand` VALUES (43, 'Fukuda');
INSERT INTO `brand` VALUES (4, 'GE');
INSERT INTO `brand` VALUES (64, 'GEA');
INSERT INTO `brand` VALUES (85, 'Gemmy');
INSERT INTO `brand` VALUES (83, 'GerLink');
INSERT INTO `brand` VALUES (115, 'Intuitive');
INSERT INTO `brand` VALUES (88, 'Ivy Biomedical');
INSERT INTO `brand` VALUES (101, 'JMS Medical');
INSERT INTO `brand` VALUES (109, 'Johnson&Johnson');
INSERT INTO `brand` VALUES (45, 'Kenz');
INSERT INTO `brand` VALUES (91, 'Kirsch');
INSERT INTO `brand` VALUES (46, 'Laica');
INSERT INTO `brand` VALUES (47, 'Leica');
INSERT INTO `brand` VALUES (60, 'LG');
INSERT INTO `brand` VALUES (99, 'Litmann');
INSERT INTO `brand` VALUES (75, 'Masimo SET');
INSERT INTO `brand` VALUES (36, 'McDavid');
INSERT INTO `brand` VALUES (90, 'Medela');
INSERT INTO `brand` VALUES (48, 'Medison');
INSERT INTO `brand` VALUES (110, 'Medtronic');
INSERT INTO `brand` VALUES (59, 'Memert');
INSERT INTO `brand` VALUES (77, 'Merivaara');
INSERT INTO `brand` VALUES (78, 'Microlife');
INSERT INTO `brand` VALUES (65, 'Miki');
INSERT INTO `brand` VALUES (49, 'Mindray');
INSERT INTO `brand` VALUES (108, 'Nesco');
INSERT INTO `brand` VALUES (97, 'Nihon Kohden');
INSERT INTO `brand` VALUES (61, 'Nonin');
INSERT INTO `brand` VALUES (51, 'OG Giken');
INSERT INTO `brand` VALUES (50, 'Olympus');
INSERT INTO `brand` VALUES (52, 'Omron');
INSERT INTO `brand` VALUES (100, 'OneMed');
INSERT INTO `brand` VALUES (53, 'Philips');
INSERT INTO `brand` VALUES (70, 'Primedic');
INSERT INTO `brand` VALUES (81, 'Pulmo Aide');
INSERT INTO `brand` VALUES (103, 'Riester');
INSERT INTO `brand` VALUES (98, 'Roche');
INSERT INTO `brand` VALUES (62, 'Seca');
INSERT INTO `brand` VALUES (63, 'Siemens');
INSERT INTO `brand` VALUES (67, 'SLE');
INSERT INTO `brand` VALUES (105, 'Socorex');
INSERT INTO `brand` VALUES (89, 'Sonoscape');
INSERT INTO `brand` VALUES (54, 'Storz');
INSERT INTO `brand` VALUES (112, 'Stryker');
INSERT INTO `brand` VALUES (79, 'Suzuken');
INSERT INTO `brand` VALUES (71, 'Tanita');
INSERT INTO `brand` VALUES (66, 'Tende');
INSERT INTO `brand` VALUES (55, 'Terumo');
INSERT INTO `brand` VALUES (124, 'Tesena');
INSERT INTO `brand` VALUES (87, 'ThermoScientific');
INSERT INTO `brand` VALUES (56, 'Thomas');
INSERT INTO `brand` VALUES (73, 'Toitu');
INSERT INTO `brand` VALUES (5, 'Topcon');
INSERT INTO `brand` VALUES (94, 'Toshiba');
INSERT INTO `brand` VALUES (102, 'TransMed');
INSERT INTO `brand` VALUES (125, 'Versatek');
INSERT INTO `brand` VALUES (82, 'VersaTrek');
INSERT INTO `brand` VALUES (86, 'WTB Binder');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_notification` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Alkes Elektromedik Non-Radiasi', NULL);
INSERT INTO `category` VALUES (2, 'Alkes Non-Elektromedik Non-Steril', NULL);
INSERT INTO `category` VALUES (3, 'Alkes Diagnostik in Vitro', NULL);
INSERT INTO `category` VALUES (4, 'Alkes Elektromedik Radiasi', NULL);
INSERT INTO `category` VALUES (5, 'Non Alkes', NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_notification` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'Bagian Umum', 'Pak Joni', 'Yes', NULL);
INSERT INTO `department` VALUES (2, 'Departemen Medis', 'Pak Badu', NULL, NULL);
INSERT INTO `department` VALUES (3, 'Departemen Konstruksi', 'Pak Paijo', NULL, NULL);
INSERT INTO `department` VALUES (4, 'Departemen Pantry', 'Pak Romli', NULL, NULL);
INSERT INTO `department` VALUES (5, 'Departemen IT', 'Pak Seto', NULL, NULL);
INSERT INTO `department` VALUES (7, 'ruang kanwa', NULL, NULL, NULL);
INSERT INTO `department` VALUES (8, 'ruang tantular', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `detail_rfid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail_id_ruangan` int(11) NULL DEFAULT NULL,
  `detail_id_jenis` int(11) NULL DEFAULT NULL,
  `detail_status_linen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`detail_rfid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail
-- ----------------------------

-- ----------------------------
-- Table structure for distributor
-- ----------------------------
DROP TABLE IF EXISTS `distributor`;
CREATE TABLE `distributor`  (
  `distributor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `distributor_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distributor_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distributor_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distributor_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distributor_alamat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distributor_keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`distributor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of distributor
-- ----------------------------
INSERT INTO `distributor` VALUES (1, 'PT. Alphara Labways Teknologi', 'Itok', '0811040159', 'itok.toni@gmail.com', NULL, NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for features
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resettable_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `resettable_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `sort_order` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `features_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of features
-- ----------------------------

-- ----------------------------
-- Table structure for filters
-- ----------------------------
DROP TABLE IF EXISTS `filters`;
CREATE TABLE `filters`  (
  `filter_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `filter_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_function` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filter_from_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`filter_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filters
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (6, 'Elektromedis IPSRS', NULL);
INSERT INTO `group` VALUES (7, 'Kontrak PPM', NULL);
INSERT INTO `group` VALUES (8, 'Garansi PT. Elsyahfi Calibratech Mandiri', 'Untuk peralatan:\r\na.\r\nb.\r\nc.\r\ndst...');
INSERT INTO `group` VALUES (9, 'KSO PT. Elsyahfi Calibratech Mandiri', NULL);
INSERT INTO `group` VALUES (10, 'PT. Elsyahfi Calibratech Mandiri (Komisaris)', NULL);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id_tiket` bigint(20) NULL DEFAULT NULL,
  `job_id_asset` bigint(20) NULL DEFAULT NULL,
  `job_id_location` bigint(20) NULL DEFAULT NULL,
  `job_id_saran` bigint(20) NULL DEFAULT NULL,
  `job_id_assign` bigint(20) NULL DEFAULT NULL,
  `job_kesimpulan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_analisa` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_keterangan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_status` enum('Ambil','Proses','Selesai') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_created_at` datetime NULL DEFAULT NULL,
  `job_updated_at` datetime NULL DEFAULT NULL,
  `job_deleted_at` datetime NULL DEFAULT NULL,
  `job_created_by` bigint(20) NULL DEFAULT NULL,
  `job_updated_by` bigint(20) NULL DEFAULT NULL,
  `job_deleted_by` bigint(20) NULL DEFAULT NULL,
  `job_checked_at` datetime NULL DEFAULT NULL,
  `job_finished_at` datetime NULL DEFAULT NULL,
  `job_gambar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_type` enum('Preventif','Korektif','Inspeksi','Kalibrasi') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE,
  INDEX `job_id_tiket`(`job_id_tiket`) USING BTREE,
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`job_id_tiket`) REFERENCES `tiket` (`tiket_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (40, '3d9ad3b6-6bdd-4b82-a383-6ceae6aa2cf6', 51, 4, 1, 1, 1, 'nanti akan dibelikan suku cadang nya', 'rusak dibagian bearing', 'test', 'Ambil', '2025-02-12 14:01:57', '2025-02-14 09:04:33', '2025-02-14 09:04:33', 1, 1, 1, '2025-02-13 08:48:42', NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (41, '2626363b-3823-4f1a-8ddd-e166b04213f5', 52, 4, 1, NULL, 1, NULL, NULL, 'baru', 'Ambil', '2025-02-13 11:40:33', '2025-02-14 09:04:33', '2025-02-14 09:04:33', 1, 1, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (42, '087e804d-802a-4389-9e60-5f6ca62a673d', 52, 4, 1, 1, 1, 'perlu ganti suku cadang', 'analisa internal', 'baru', 'Selesai', '2025-02-14 09:04:36', '2025-02-17 14:52:08', '2025-02-17 14:52:08', 1, 1, 1, '2025-02-14 09:04:58', '2025-02-14 09:20:09', NULL, 'Korektif');
INSERT INTO `job` VALUES (43, '12868901-a0b9-4807-99be-259375dee4b1', 70, 6, 1, 1, 1, 'ok', 'ok', 'CT scan errror', 'Proses', '2025-02-17 15:44:23', '2025-02-21 00:16:38', '2025-02-21 00:16:38', 1, 1, 1, '2025-02-19 15:36:58', NULL, '1739954188.jpg', 'Korektif');
INSERT INTO `job` VALUES (44, '3a12cce2-fbad-4692-af34-1ea52fa88747', 71, 4, 1, NULL, 1, NULL, NULL, 'keluhan', 'Ambil', '2025-02-19 15:09:44', '2025-02-21 00:16:33', '2025-02-21 00:16:33', 1, 1, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (45, 'd7636e97-f1ea-4ff5-b667-37e480d0cf41', 72, 6, 1, NULL, 1, NULL, NULL, 'test', 'Ambil', '2025-02-19 15:36:10', '2025-02-21 00:16:30', '2025-02-21 00:16:30', 1, 1, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (46, '0506ab78-44ac-4b7e-b01b-122aa617bca8', 75, 7, 5, 5, 504, 'Jati hati', 'Kabel putus', 'Matot', 'Proses', '2025-02-23 22:53:13', '2025-02-25 06:00:33', '2025-02-25 06:00:33', 504, 504, 1, '2025-02-23 22:55:02', NULL, '1740326102.jpg', 'Korektif');
INSERT INTO `job` VALUES (47, 'c59b73dc-8a6b-4dc1-864e-67ac6fbf3d1f', 78, 9, 2, NULL, 3, NULL, NULL, 'ini keluhan', 'Ambil', '2025-11-22 18:09:28', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 3, 3, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (48, '893427f0-b5fe-4c57-8d01-7bc39814708f', 79, 10, 2, NULL, 3, NULL, NULL, 'test', 'Ambil', '2025-11-22 19:05:28', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 3, 3, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (49, 'df01b13f-f7dc-46f3-981f-ea0742ba8865', 80, 9, 2, NULL, 3, NULL, NULL, 'test', 'Ambil', '2025-11-22 19:18:17', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 3, 3, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (50, 'a6bfa2f5-e8ed-464e-a7e7-fc82dbc6e1b5', 85, 18, 5, NULL, 504, NULL, NULL, 'ada yang rusak', 'Ambil', '2025-11-24 10:48:56', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 504, 504, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (51, 'a89120b3-795f-47e6-8314-eea66ad0452e', 84, 9, 2, NULL, 504, NULL, NULL, 'tiket', 'Ambil', '2025-11-24 10:52:37', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 504, 504, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (52, 'c7bd8255-98bc-42cb-81f5-bfc0439bbae1', 86, 9, 2, 1, 504, 'menunggu suku cadang', 'kabel putuh', 'test buat tiket', 'Selesai', '2025-11-24 11:19:54', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 504, 3, 1, '2025-11-24 11:23:02', '2025-11-24 11:26:28', '1763958182.jpg', 'Korektif');
INSERT INTO `job` VALUES (53, '3d5be37c-746e-4415-a15f-66de633a4f35', 86, 9, 2, NULL, 3, NULL, NULL, 'test buat tiket', 'Ambil', '2025-11-24 11:26:24', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 3, 3, 1, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (54, '8c3e8c33-e132-485f-b182-598997d733e3', 95, 7, 5, NULL, 508, NULL, NULL, 'test', 'Ambil', '2025-11-27 19:50:28', '2025-11-27 19:56:48', '2025-11-27 19:56:48', 508, 508, 508, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (55, '4577afd6-fbb0-4895-934f-197596dd8296', 91, 24, 5, NULL, 508, NULL, NULL, 'test 3', 'Ambil', '2025-11-27 19:53:29', '2025-11-27 19:56:48', '2025-11-27 19:56:48', 508, 508, 508, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (56, '686332be-b5af-4eb9-b50b-ee75f5648df6', 96, 7, 5, NULL, 508, NULL, NULL, 'test tiket', 'Ambil', '2025-11-27 19:56:35', '2025-11-27 19:56:48', '2025-11-27 19:56:48', 508, 508, 508, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (57, '06e128da-13a0-4915-a8cb-59dd99b9a6be', 96, 7, 5, 1, 508, 'menuggu sparepart', 'kabel putus', 'test tiket', 'Proses', '2025-11-27 19:56:53', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 508, 508, 1, '2025-11-27 19:57:38', NULL, '1764248258.png', 'Korektif');
INSERT INTO `job` VALUES (58, '24b98229-ff25-4a0a-bcbf-45c89b9042d4', 97, 7, 5, 1, 508, 'suku cadang', 'analisa', 'test', 'Selesai', '2025-11-27 19:59:10', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 508, 505, 1, '2025-11-27 19:59:32', '2025-11-27 20:00:01', '1764248372.jpg', 'Korektif');
INSERT INTO `job` VALUES (59, '515626b3-89cc-49a7-8a3c-638adf690706', 98, 7, 5, 1, 508, 'gerre', 'ana', '1', 'Selesai', '2025-11-27 20:01:17', '2025-11-27 20:07:47', '2025-11-27 20:07:47', 508, 505, 1, '2025-11-27 20:01:52', '2025-11-27 20:03:47', '1764248512.png', 'Korektif');
INSERT INTO `job` VALUES (60, '7972fdc7-9d7e-4ec1-98f9-eeb6e8563e94', 99, 7, 5, 1, 508, 'kesimpulan', 'analsia', '1', 'Proses', '2025-11-27 20:08:31', '2025-11-27 20:18:13', '2025-11-27 20:18:13', 508, 508, 508, '2025-11-27 20:16:26', NULL, '1764249386.jpg', 'Korektif');
INSERT INTO `job` VALUES (61, '6e5c601d-694b-4cb8-8898-163a0435729f', 99, 7, 5, 1, 508, 'kesimpulan', 'analsi', '1', 'Proses', '2025-11-27 20:18:15', '2025-11-27 20:20:43', '2025-11-27 20:20:43', 508, 508, 508, '2025-11-27 20:18:34', NULL, '1764249514.png', 'Korektif');
INSERT INTO `job` VALUES (62, 'c91d1717-de70-499e-a084-e562fad8dd68', 99, 7, 5, 1, 508, 'kesimpulan', 'analis', '1', 'Proses', '2025-11-27 20:20:45', '2025-11-27 20:24:26', '2025-11-27 20:24:26', 508, 508, 508, '2025-11-27 20:21:07', NULL, '1764249667.jpg', 'Korektif');
INSERT INTO `job` VALUES (63, '29746599-4a01-4c33-ac35-527f33c17740', 99, 7, 5, 1, 508, 'kesimpulan', 'analsia', '1', 'Proses', '2025-11-27 20:24:38', '2025-11-27 20:47:38', '2025-11-27 20:47:38', 508, 505, 508, '2025-11-27 20:28:57', '2025-11-27 20:31:28', NULL, 'Korektif');
INSERT INTO `job` VALUES (64, '9aaf3d0a-6761-4610-8dca-83a15335e5f7', 99, 7, 5, 1, 508, 'kesimpulan', 'analisa', '1', 'Selesai', '2025-11-27 20:47:49', '2025-11-27 20:56:01', NULL, 508, 505, NULL, '2025-11-27 20:49:43', '2025-11-27 20:56:01', NULL, 'Korektif');
INSERT INTO `job` VALUES (65, '105fd231-c335-4a38-bb04-34e148bc75cf', 99, 7, 5, NULL, 1, NULL, NULL, '1', 'Ambil', '2025-11-29 08:16:14', '2025-11-29 08:16:14', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (66, '3fdbfd93-9b03-44bc-987c-811decb34618', 100, 7, 5, 1, 508, 'menunggu suku cadang', 'kabel putus', 'testing keluhan', 'Selesai', '2025-11-29 09:57:06', '2025-11-29 09:59:31', NULL, 508, 505, NULL, '2025-11-29 09:58:20', '2025-11-29 09:59:31', NULL, 'Korektif');

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cancelled_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
INSERT INTO `job_batches` VALUES ('9d4bce09-d834-4913-9abc-d37c24d5b69c', 'Export Users', 151, 0, 0, '[]', 'a:4:{s:4:\"then\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:893:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:2:{s:4:\"name\";s:62:\"public/files/export/report_rekap_kotor-2024-10-21-12-37-28.csv\";s:7:\"user_id\";i:1;}s:8:\"function\";s:565:\"function (\\Illuminate\\Bus\\Batch $batch) use ($name, $user_id) {\r\n                \\Illuminate\\Support\\Facades\\Storage::put($name, file_get_contents($name));\r\n\r\n                $notification = new \\MBarlow\\Megaphone\\Types\\NewFeature(\r\n                    \'Download File Success\',\r\n                    \'File Ready to download\',\r\n                    asset(str_replace(\'public/\', \'\', $name)),\r\n                    \'Download\'\r\n                );\r\n\r\n                sendNotification($notification, \\App\\Dao\\Enums\\Core\\NotificationType::Success, $user_id);\r\n\r\n            }\";s:5:\"scope\";s:47:\"App\\Http\\Controllers\\ReportRekapKotorController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000025780000000000000000\";}\";s:4:\"hash\";s:44:\"V8ukQLL4qdlwmeoXT6yt/hQl3Cpm3r9lPE3fnKYAsTM=\";}}}s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:620:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:7:\"user_id\";i:1;}s:8:\"function\";s:373:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use ($user_id) {\r\n\r\n                $notification = new \\MBarlow\\Megaphone\\Types\\Important(\r\n                    \'Download File Error\',\r\n                    $e->getMessage(),\r\n                );\r\n\r\n                sendNotification($notification, \\App\\Dao\\Enums\\Core\\NotificationType::Error, $user_id);\r\n\r\n            }\";s:5:\"scope\";s:47:\"App\\Http\\Controllers\\ReportRekapKotorController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000025750000000000000000\";}\";s:4:\"hash\";s:44:\"KV63Tzd8DIWYNcdPTM8aGxaWxNDYV0jXMxyjOj3XEes=\";}}}s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:462:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"name\";s:62:\"public/files/export/report_rekap_kotor-2024-10-21-12-37-28.csv\";}s:8:\"function\";s:152:\"function (\\Illuminate\\Bus\\Batch $batch) use ($name) {\r\n                \\Illuminate\\Support\\Facades\\Storage::disk(\'local\')->delete($name);\r\n            }\";s:5:\"scope\";s:47:\"App\\Http\\Controllers\\ReportRekapKotorController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000025720000000000000000\";}\";s:4:\"hash\";s:44:\"oF8NvvkD1xXfyFjkc38uTeOTcP+AioC1+/6og7sAKoU=\";}}}s:5:\"queue\";s:6:\"export\";}', NULL, 1729489048, 1729489100);

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (152, 'default', '{\"uuid\":\"7a5b60dd-0030-400c-8a10-e4f68ac02713\",\"displayName\":\"App\\\\Notifications\\\\VerifyUserQueue\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:24:\\\"App\\\\Dao\\\\Models\\\\Core\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:510;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:33:\\\"App\\\\Notifications\\\\VerifyUserQueue\\\":1:{s:2:\\\"id\\\";s:36:\\\"5014c9e1-809c-46ac-8634-ca0fb17eb54a\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1765641541, 1765641541);
INSERT INTO `jobs` VALUES (153, 'default', '{\"uuid\":\"b2a2bf3d-e40c-4ac4-add2-e2b67b8ed24f\",\"displayName\":\"App\\\\Notifications\\\\VerifyUserQueue\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:24:\\\"App\\\\Dao\\\\Models\\\\Core\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:511;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:33:\\\"App\\\\Notifications\\\\VerifyUserQueue\\\":1:{s:2:\\\"id\\\";s:36:\\\"32ae8286-4a8f-44cb-adc4-4a9192c3f94f\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1766453663, 1766453663);
INSERT INTO `jobs` VALUES (154, 'default', '{\"uuid\":\"6a7babdd-8cd8-40ed-8376-f88af326a935\",\"displayName\":\"App\\\\Notifications\\\\VerifyUserQueue\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:24:\\\"App\\\\Dao\\\\Models\\\\Core\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:512;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:33:\\\"App\\\\Notifications\\\\VerifyUserQueue\\\":1:{s:2:\\\"id\\\";s:36:\\\"a72bf770-b4b2-4190-b3a4-2caa70e82aee\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1768019270, 1768019270);

-- ----------------------------
-- Table structure for level1
-- ----------------------------
DROP TABLE IF EXISTS `level1`;
CREATE TABLE `level1`  (
  `level1_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level1_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level1_keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`level1_code`) USING BTREE,
  INDEX `level1_id`(`level1_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level1
-- ----------------------------
INSERT INTO `level1` VALUES ('LV1000000000001', 'Pelayanan Medik & Keperawatan', NULL);
INSERT INTO `level1` VALUES ('LV1000000000002', 'Penunjang Medik RS', NULL);
INSERT INTO `level1` VALUES ('LV1000000000003', 'Area Penunjang Umum & Administrasi RS', NULL);
INSERT INTO `level1` VALUES ('LV1000000000004', 'Penunjang Non Medik RS', NULL);

-- ----------------------------
-- Table structure for level2
-- ----------------------------
DROP TABLE IF EXISTS `level2`;
CREATE TABLE `level2`  (
  `level2_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level2_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level2_keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level2_code_level1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`level2_code`) USING BTREE,
  INDEX `level2_code`(`level2_code`) USING BTREE,
  INDEX `level2_code_level1`(`level2_code_level1`) USING BTREE,
  CONSTRAINT `level2_ibfk_1` FOREIGN KEY (`level2_code_level1`) REFERENCES `level1` (`level1_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level2
-- ----------------------------
INSERT INTO `level2` VALUES ('1001', 'Instalasi Kedokteran Nuklir', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('11', 'Pelayanan Rawat Jalan', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1166', 'Instalasi Sanitasi', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('1178', 'Laboratorium Kedokteran Foerensik & Medikolegal', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('1181', 'Ruangan Sekretaris Direktur', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1182', 'Ruangan Rapat & Diskusi', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('12', 'Pelayanan Gawat Darurat', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1210', 'Unit Hemodialisa', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('1235', 'Instalasi Radiodiagnostik', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('1256', 'Pelayanan Perawatan Intensif  Bayi (NICU)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1271', 'Pelayanan Perawatan Intensif Anak (PICU)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('13', 'Pelayanan Rawat Inap', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1302', 'Ruangan bagian SDM', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1310', 'Ruangan SPI (Satuan Pengawas Internal)', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1311', 'Ruangan Arsip/file', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1312', 'Ruangan Tunggu', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1314', 'Janitor', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1315', 'Dapur Kecil (pantry)', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1317', 'Toilet', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('1362', 'Instalasi Patologi Klinik', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('1363', 'Instalasi Patologi Anatomi', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('1391', 'Pelayanan Perawatan Tingkat Tinggi (HCU)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('14', 'Pelayanan Bedah Sentral (OK)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1432', 'Pelayanan Prosedur Diagnostik', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1484', 'Pelayanan Deteksi Dini Kanker & PKRS', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('15', 'Pelayanan Rawat Intensif (ICU)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1502', 'Bagian Litbang', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('1523', 'Instalasi Pemeliharaan Sarana Medis', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('1525', 'Pelayanan Cathlab', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1532', 'Pelayanan Teknologi Reproduksi Berbantu', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('1535', 'Pelayanan Rawat Inap Khusus', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('16', 'Instalasi Radiologi', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('17', 'Instalasi Farmasi', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('182', 'Asrama / Wisma', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('19', 'Instalasi Laboratorium', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('20', 'Instalasi Rehabilitasi Medik', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('20195', 'Pelayanan Khusus International', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('23', 'Instalasi Pemulasaraan Jenazah', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('24', 'Bank Darah/ Unit Transfusi Darah (BDRS/UTDRS)', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('25', 'Ruangan Direksi', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('28', 'Ruangan bagian Keuangan & Program', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('29', 'Ruangan bagian Kesekretariatan & Rekam Medis beserta Sub Bagian-bagiannya', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('30001', 'Selasar', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('32', 'Ruangan bidang pelayanan medis beserta seksi-seksinya', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('33', 'Ruangan Bidang Keperawatan beserta Seksi-seksinya', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('34', 'Ruangan Bagian Pendidikan & Pelatihan beserta Seksi-seksinya', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('35', 'Ruangan Komite Medis', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('37', 'Instalasi Radioterapi', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('39', 'Instalasi Dapur Utama dan Gizi Klinik', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('40', 'Instalasi Pencucian Linen/ Laundri', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('41', 'Instalasi Pemeliharaan Sarana (Workshop)', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('51', 'Instalasi Sterilisasi Pusat / CSSD', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('52', 'Boiler', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('54', 'Listrik', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('55', 'Sentra Air Bersih', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('56', 'Sentra Gas Medis', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('57', 'Sentra Oksigen Cair', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('58', 'Sentra Hidran', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('587', 'Pelayanan Jantung Terpadu', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('59', 'Asrama / Wisma', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('61', 'Sentra Gas LPG', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('621', 'Pelayanan Kebidanan & Penyakit Kandungan', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('63', 'Kantin', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('636', 'Pelayanan Neonatus (Bayi)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('68', 'Ruangan Bidang Pelayanan Penunjang Medik & Seksinya', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('90012', 'Pelayanan Rawat Intensif Jiwa (UPIP)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('90021', 'Instalasi Bank Darah', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('947', 'Rumah Tunggu', NULL, 'LV1000000000004');

-- ----------------------------
-- Table structure for level3
-- ----------------------------
DROP TABLE IF EXISTS `level3`;
CREATE TABLE `level3`  (
  `level3_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level3_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level3_keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level3_code_level2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level3_id_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`level3_code`) USING BTREE,
  INDEX `level3_code`(`level3_code`) USING BTREE,
  INDEX `level3_code_level2`(`level3_code_level2`) USING BTREE,
  CONSTRAINT `level3_ibfk_1` FOREIGN KEY (`level3_code_level2`) REFERENCES `level2` (`level2_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level3
-- ----------------------------
INSERT INTO `level3` VALUES ('1000', 'Ruangan Ganti Pakaian/loker', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1002', 'Ruangan Resepsionis/Pendaftaran/Kasir/Pengambilan Hasil', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1003', 'Ruangan Administrasi', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1004', 'Ruangan Tunggu Pasien & Pengantar Pasien', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1005', 'Ruangan Preparasi', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1006', 'Ruangan Administrasi & Pendaftaran', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1007', 'Ruangan Isolasi', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1008', 'Ruangan Hot Lab', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1009', 'Ruangan Arsip & Rekam Medis', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1010', 'Ruangan Konsultasi Dokter', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1011', 'Ruangan Pemberian Dosis/Radiofarmaka', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1012', 'Ruangan Tunggu Pasien setelah pemberian Radiofarmaka', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1013', 'Toilet Pasien yang sudah mendapat Radiofarmaka', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1014', 'Ruang Persiapan Bersalin (Observasi) dengan komplikasi (pre-eclamsy labour)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1015', 'Ruangan Radioassay', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1016', 'Ruangan Thyroid Uptake/Gamma Probe', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1017', 'Ruangan Gamma Kamera (dilengkapi Ruang Operator)', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1018', 'Ruangan Pembacaan Hasil', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1019', 'Gudang Umum', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('102', 'Ruangan Klinik Sp. Penyakit Dalam', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1020', 'Ruangan Laktasi + KIE', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1021', 'Ruangan Dekontaminasi', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1022', 'Ruangan Perawatan (Post Partum)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1023', 'Ruangan Istirahat Dokter & Petugas', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1024', 'Ruang Perawatan Isolasi tipe tekanan standar (kelas S)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1026', 'Toilet Pasien (umum)', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1027', 'Ruangan Dokter', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1028', 'Toilet Pimpinan & Staf', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1029', 'Gudang Kotor (Spoolhoek/Dirty Utility)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('103', 'Ruangan Klinik Sp. Kesehatan Anak', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1030', 'Loker (Ruang Ganti)', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1031', 'Ruangan Perawat ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1032', 'Ruangan Kepala Perawat ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1033', 'Ruangan rawat pasien non isolasi ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1034', 'Ruangan Peracikan Obat', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1035', 'Depo/ ruang bahan baku obat', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1036', 'Gudang alat medik', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1037', 'Depo/ ruang obat jadi', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1038', 'Ruangan Administrasi (Penerimaan & Distribusi Obat)', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1039', 'Pantry', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('104', 'Ruangan Klinik Sp. Bedah', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1041', 'Konter Apotik Utama (Loket Penerimaan Resep, Loket Pembayaran, & Loket Pengambilan Obat)', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1042', 'Ruangan Loker Petugas (Pria & Wanita dipisah)', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1044', 'Ruangan Arsip Dokumen & Perpustakaan)', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1046', 'Ruangan Kepala Instalasi Farmasi', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1047', 'Ruangan Petugas', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1048', 'Ruangan Tunggu', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('105', 'Ruangan Klinik Sp. Kebidanan & Kandungan', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1050', 'Dapur Kecil (Pantry)', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1052', 'KM/WC Petugas', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1054', 'Unit Apotik Satelit', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1055', 'Ruangan Apoteker', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1057', 'Ruangan parkir brankar', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('106', 'Ruangan Klinik Sp. Mata & Sub Spesialistik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1064', 'Ruangan Penerimaan & Penimbangan Bahan Makanan', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1065', 'Ruangan Penyimpanan bahan makanan basah', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1067', 'Ruangan penyimpanan bahan makanan kering', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1068', 'Ruang / Area Persiapan', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1069', 'Ruangan Pengolahan/ Memasak & Penghangatan Makanan', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('107', 'Ruangan Klinik Sp. THT & THT', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1070', 'Ruangan Cuci', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1071', 'Ruangan Penyimpanan Troli Gizi', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1072', 'Ruangan Penyimpanan Peralatan Dapur', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1073', 'Ruangan Administrasi', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1074', 'Ruangan Tunggu Keluarga Jenazah', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1075', 'Ruangan Ganti Alat Pelindung Diri (APD) & Loker', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1076', 'Ruangan Duka (Dilengkapi Toilet)', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1077', 'Ruangan Administrasi', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1078', 'Gudang Perlengkapan Ruang Duka', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1079', 'Ruangan Dekontaminasi & Pemulasaraan Jenazah', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('108', 'Ruangan Klinik dr. Gigi umum, Gigi Spesialis & Gigi Sub Spesialis', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1080', 'Ruangan Kepala Instalasi Gizi', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1081', 'Janitor', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1082', 'Laboratorium Otopsi', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1083', 'Ruangan Pendingin Jenazah', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1084', 'Ruangan Tunggu Pasien & Pengantar Pasien', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1085', 'Ruangan Pengaturan & Penyimpanan Tabung Gas Elpiji', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1086', 'Ruangan Ganti Pakaian APD (Dilengkapi Toilet)', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1087', 'Ruangan Administrasi & Rekam Medis', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1088', 'Gudang Alat', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1089', 'Ruangan Kepala Instalasi Pemulasaraan Jenazah', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('109', 'Umum', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1090', 'Ruangan Pengambilan/Penerimaan Bahan/Sampel', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1092', 'Ruangan Jemur Alat', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1093', 'Ruangan Flebotomi', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1094', 'Gudang Instalasi Forensik', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1095', 'Ruangan Petugas Jaga Dapur', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1096', 'KM/WC (Toilet Petugas)', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1097', 'Ruangan Sputum/Dahak', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1098', 'KM/WC (Toilet Pengunjung)', NULL, '23', NULL);
INSERT INTO `level3` VALUES ('1099', 'Ruangan Urin/Tinja', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('110', 'Ruangan Triase', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1100', 'Ruangan Nutrisionis', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1101', 'Ruangan Spesimen Lain (Pus, Kerokan Kulit, dll)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1102', 'KM/WC petugas', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1103', 'Ruangan Spesimen Genital', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1104', 'Ruangan Pengolahan Sampel', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1106', 'Ruangan Bank Darah', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1107', 'Ruangan Konsultasi', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1109', 'Ruangan Imunologi (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('111', 'Ruangan Bedah', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1110', 'Ruangan Penyimpanan Sementara Limbah Radioaktif Padat', NULL, '1001', NULL);
INSERT INTO `level3` VALUES ('1111', 'Ruangan Kimia Klinik (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1112', 'Ruangan Urin/Tinja (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1113', 'Ruangan Hematologi (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1114', 'Ruangan Mikrobiologi (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1115', 'Gudang Perbekalan & Alat Kesehatan', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1116', 'Depo/ Ruang Obat Khusus', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1117', 'Ruangan Patologi Anatomi (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1118', 'Ruangan Biologi Molekuler (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1119', 'Ruangan Penyimpanan Bahan Habis Pakai & Reagen (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('112', 'Medical', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1120', 'Ruangan IT, Server (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1121', 'Ruangan Arsip (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1122', 'Ruangan Administrasi Hasil (Ruang Pemeriksaan)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1123', 'Ruangan Kerja Dokter (Ruang Pemeriksa Hasil)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1124', 'Ruangan Administrasi & Pencatatan', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1125', 'Ruangan Kepala Laundri', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1126', 'Ruangan Penerimaan & Sortir', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1127', 'Ruangan Pembagian/ Penyajian Makanan', NULL, '39', NULL);
INSERT INTO `level3` VALUES ('1128', 'Ruangan Setrika & Pengeringan Laundri', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1129', 'Ruangan Perbaikan Linen / Jahit', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('113', 'Ruangan Pediatry/Anak', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1130', 'Ruangan Penyimpanan Linen', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1132', 'Ruangan Cuci Linen', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1133', 'Ruangan Pengeringan Linen', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1134', 'Ruangan Produksi (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1135', 'Ruangan Dekontaminasi Troli', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1136', 'Ruang Administrasi', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1137', 'Ruangan Penanaman Kuman TB (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1138', 'Loket Permintaan Darah', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1139', 'Loket Pengambilan Darah', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('114', 'Ruangan Kebidanan & Kandungan', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1140', 'Ruangan Potong Jaringan Patologi Anatomik (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1141', 'Loket Pembayaran', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1142', 'Ruangan Penyimpanan Jaringan Patologi Anatomik (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1143', 'Ruangan Tunggu', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1144', 'Ruangan Mikrotom (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1145', 'Ruangan Histologi (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1146', 'Ruangan Penyimpanan Darah (Blood Bank Room)', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1148', 'Ruangan Penyimpanan Troli', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1149', 'Laboratorium Skrining Darah (Blood Screening Lab.)/Pemeriksaan Pra Transfusi', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('115', 'Supporting', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1150', 'Ruangan Imuno Histokimia (Ruang Khusus)', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1151', 'Gudang Bahan Kimia', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1152', 'Ruangan Penyimpanan  & Ganti Pakaian Staf', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1153', 'KM/WC Petugas', NULL, '40', NULL);
INSERT INTO `level3` VALUES ('1154', 'Ruangan Donor Darah', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1155', 'Ruangan Makan/Pantry Staf', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1156', 'Ruangan Pemberian Makanan Pasca Donor', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1157', 'Ruangan Cuci Peralatan', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1158', 'Ruangan Kepala Laboratorium Medik', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1159', 'Ruangan Kepala & Staf BDRS/UTDRS', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('116', 'Intermediate Word', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1160', 'Ruangan Distribusi', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1161', 'Ruangan Diskusi/Rapat', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1162', 'KM/WC Petugas', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1163', 'KM/WC Pendonor', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1164', 'Ruangan Koordinator Laboratorium', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1165', 'Ruangan Petugas Laboratorium', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1167', 'Ruangan Musholla', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1168', 'Ruang Kerja & Arsip', NULL, '1166', NULL);
INSERT INTO `level3` VALUES ('1169', 'Toilet Staf', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('117', 'High Care Unit', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1170', 'Ruangan Kepala IPSRS', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1171', 'Toilet Pasien', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1173', 'Ruangan Administrasi (Pencatatan) & Ruang Kerja Staf', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1174', 'Ruangan Rapat/ Pertemuan Teknis', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1175', 'Ruangan Studio Gambar & Arsip Teknis', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1177', 'Bengkel/ Work Shop', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('118', 'Oneday Care', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1180', 'Ruangan Pemeriksaan/Penilaian Dokter', NULL, '1178', NULL);
INSERT INTO `level3` VALUES ('1183', 'Ruang Pendaftaran & Pendataan', NULL, '1178', NULL);
INSERT INTO `level3` VALUES ('1184', 'Bengkel/ Worshop Bangunan/ Kayu', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1185', 'Ruangan Administrasi, Keuangan & Personalia', NULL, '1178', NULL);
INSERT INTO `level3` VALUES ('1186', 'Bengkel/ Workshop metal/logam', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1187', 'Bengkel/ Workshop Peralatan Medik (Optik, Elektromedik, Mekanik)', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1188', 'Bengkel/ Workshop penunjang medik', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1189', 'Ruang Panel Listrik', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('119', 'Ruangan Bagian Keuangan & Program beserta Sub Bagian-bagiannya', NULL, '28', NULL);
INSERT INTO `level3` VALUES ('1190', 'Ruang Trafo', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1191', 'Ruangan Genset', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1192', 'Ruang Pompa', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1193', 'Ruang Boiler', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1194', 'Gudang Spare Part', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1195', 'Gudang Alat Rusak', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1196', 'KM/WC Petugas', NULL, '41', NULL);
INSERT INTO `level3` VALUES ('1197', 'Ruangan Tunggu Pasien & Pengantar Pasien', NULL, '1178', NULL);
INSERT INTO `level3` VALUES ('1198', 'Ruangan Penerimaan', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1199', 'Ruangan Dekontaminasi', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('120', 'Ruangan Bagian Rekam Medis', NULL, '29', NULL);
INSERT INTO `level3` VALUES ('1200', 'Ruangan Mesin Sterilisasi', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1201', 'Ruangan Pengemasan/ Persiapan Alat', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1202', 'Gudang Steril', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1203', 'Ruangan Penerimaan Linen Bersih Siap Sterilisasi', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1204', 'Ruangan Kepala Instalasi CSSD', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1205', 'Ruangan Ganti Petugas (Loker)', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1206', 'Ruangan Staf/ Petugas', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1207', 'KM/WC Petugas', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1208', 'Ruangan Kepala Bidang Keperawatan', NULL, '33', NULL);
INSERT INTO `level3` VALUES ('1209', 'Ruangan Bidang Keperawatan', NULL, '33', NULL);
INSERT INTO `level3` VALUES ('121', 'Ruangan Radiodiagnostik', NULL, '16', NULL);
INSERT INTO `level3` VALUES ('1211', 'Ruangan Kepala Bidang Pelayanan', NULL, '32', NULL);
INSERT INTO `level3` VALUES ('1212', 'Ruangan Administrasi', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1213', 'Ruangan Kepala Komite Medis', NULL, '35', NULL);
INSERT INTO `level3` VALUES ('1214', 'Ruangan Tunggu', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1215', 'Ruangan Cuci Darah', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1216', 'Ruangan Isolasi Cuci Darah', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1217', 'Ruangan Stasi Perawat (Nurse Station)', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1218', 'Ruangan Konsultasi/ Pemeriksaan', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1219', 'Ruangan Reverse Osmosis (RO) & Sterilisasi UV', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1220', 'Ruangan Tangki Harian (Ready to Use Tank)', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1221', 'Ruangan Pencucian Filter (Reuse Filter Cleaning)', NULL, '1210', NULL);
INSERT INTO `level3` VALUES ('1222', 'Ruangan Perawatan Dewasa Laki-Laki', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1223', 'Ruangan Perawatan Dewasa Perempuan', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1224', 'Ruangan Perawat', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1225', 'Ruangan Kepala Instalasi Rawat Inap', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1226', 'Ruangan Loker', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1227', 'Dapur Kecil (Pantry)', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1228', 'Gudang Bersih', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1229', 'High Care Unit (HCU)', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('123', 'ICCU Jantung & Pembuluh Darah', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1230', 'Ruangan Perawatan Isolasi tipe tekanan standar (kelas S)', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1231', 'Area Pengolahan Air Limbah', NULL, '1166', NULL);
INSERT INTO `level3` VALUES ('1232', 'Area Pengelolaan Limbah Padat', NULL, '1166', NULL);
INSERT INTO `level3` VALUES ('1233', 'Area TPS', NULL, '1166', NULL);
INSERT INTO `level3` VALUES ('1234', 'KM/WC Petugas', NULL, '1166', NULL);
INSERT INTO `level3` VALUES ('1236', 'Ruangan Tunggu Pasien & Pengantar Pasien', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1237', 'Ruangan Administrasi & Rekam Medik', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1238', 'Loket Pendaftaran, pembayaran & pengambilan hasil', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1239', 'Ruangan Konsultasi Dokter', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1240', 'Ruangan Ahli Fisika Medik', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1241', 'Ruangan General X-ray (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1242', 'Ruangan Fluoroskopi (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1243', 'Ruangan Mammografi (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1244', 'Ruangan Ultra Sonografi/ USG (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1245', 'Ruangan CT-Scan (R.Operator, R.Mesin, R.Ganti) ; Ruang Pemeriksaan/ Diagnostik', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1246', 'Ruangan Mobil X-Ray (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1247', 'Ruangan Dental X-Ray + Panoramic (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1248', 'Ruangan Pemeriksaan/ Diagnostik Sp. Jantung & Pembuluh Darah (Tindakan)/ Kamar Cath Lab', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1249', 'Ruangan MRI (Ruang Pemeriksaan/ Diagnostik)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1250', 'KM/ WC Pasien', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1251', 'Kamar Processing Film (digital ataupun AFP Kering)', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1252', 'Ruangan Jaga Radiografer', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1253', 'Gudang penyimpanan berkas', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1254', 'Gu&g penyimpanan Film & Non Film', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1255', 'KM/WC Petugas', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1257', 'Loker (Ruang Ganti)', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1258', 'Ruangan Perawat NICU', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1259', 'Ruangan Dokter NICU', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('126', 'Ruangan Operasi Minor', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1260', 'Ruang Rawat Pasien/ NICU', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1261', 'Sentral Monitoring/Nurse Station NICU', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1262', 'Gudang Alat Medik', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1263', 'Gudang Bersih (Clean Utility)', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1264', 'Gudang Kotor (Ruangan Spoel Hoek/ Dirty Utility)', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1265', 'Ruangan Tunggu Keluarga Pasien', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1266', 'Ruangan Administrasi', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1267', 'Janitor / Ruang Cleaning Service', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1268', 'Toilet Pengunjung', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1269', 'Toilet Petugas', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('127', 'Ruangan Operasi Besar', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1270', 'Ruangan Kepala Perawat', NULL, '1256', NULL);
INSERT INTO `level3` VALUES ('1272', 'Loker (Ruang Ganti)', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1274', 'Ruangan Perawat PICU', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1275', 'Ruangan Kepala Perawat', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1276', 'Ruangan Dokter', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1277', 'Ruangan Perawatan Pasien PICU', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1278', 'Sentral Monitoring/Nurse Station PICU', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1279', 'Ruangan Bidang Pelayanan', NULL, '32', NULL);
INSERT INTO `level3` VALUES ('128', 'Ruangan Klinik Sp. Jantung & Pembuluh Darah, Sub Spesialis', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1280', 'Gudang Alat Medik', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1281', 'Gudang Bersih (Clean Utility)', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1282', 'Gudang Kotor (Ruangan Spoel Hoek/ Dirty Utility)', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1283', 'Ruangan Tunggu Keluarga Pasien', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1284', 'Ruangan Administrasi', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1285', 'Janitor / Ruang Cleaning Service', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1286', 'Toilet Pengunjung', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1287', 'Toilet Petugas', NULL, '1271', NULL);
INSERT INTO `level3` VALUES ('1288', 'Ruangan Kepala Bagian Keuangan & Program', NULL, '28', NULL);
INSERT INTO `level3` VALUES ('1289', 'Ruangan Kepala Bidang Pelayanan Penunjang Medik', NULL, '68', NULL);
INSERT INTO `level3` VALUES ('129', 'Ruangan Klinik Sp. Paru + Pernafasan', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1290', 'Ruangan Bidang Pelayanan Penunjang Medik', NULL, '68', NULL);
INSERT INTO `level3` VALUES ('1291', 'Ruangan Pemeriksaan/ Penilaian Dokter', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1292', 'Ruangan Kepala Bagian Pendidikan & Pelatihan', NULL, '34', NULL);
INSERT INTO `level3` VALUES ('1294', 'Loket Pendaftaran & Pendataan', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1295', 'Ruangan Administrasi, Keuangan & Personalia', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1297', 'Ruangan Bagian Pendidikan & Pelatihan', NULL, '34', NULL);
INSERT INTO `level3` VALUES ('1298', 'Ruangan Tunggu Pasien & Pengantar Pasien', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1299', 'Ruangan Diagnostik Dokter', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('130', 'Ruangan Klinik Sp. Kedokteran Jiwa/ Psikiatri', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1300', 'Ruangan Terapi Psikologi', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1301', 'Ruangan Fisioterapi Pasif', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1303', 'Ruangan Fisioterapi Aktif', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1304', 'Ruangan Kepala Bagian SDM', NULL, '1302', NULL);
INSERT INTO `level3` VALUES ('1305', 'Ruangan Bagian SDM', NULL, '1302', NULL);
INSERT INTO `level3` VALUES ('1306', 'Ruangan Senam (Gymnasium)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1307', 'Ruangan Hidroterapi (Incl R. Ganti, Toilet)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1308', 'Ruangan Kepala Bagian Kesekretariatan beserta seksi-seksinya', NULL, '29', NULL);
INSERT INTO `level3` VALUES ('1309', 'Ruangan Terapi Okupasi', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('131', 'Ruangan Klinik Sp. Saraf/ Neurologi & Sub Spesialistik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1313', 'Ruangan Sensori Intergrasi (SI) Anak', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1316', 'Ruangan Relaksasi/ Perangsangan Audio-Visual', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1318', 'Ruangan Terapi Wicara Vokasional', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1319', 'Ruangan Terapi Wicara Audiometer', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('132', 'Ruangan Klinik Sp. Kulit & Kelamin', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1320', 'Ruangan GIP (OP)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1321', 'Loker Petugas Bengkel OP', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1322', 'Ruangan Bengkel Halus/ Kerja Kayu', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1323', 'Ruangan Bengkel Kasar/ kerja pembuatan', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1324', 'Ruangan Jahit/ Kulit (OP)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1325', 'Ruangan Penyimpanan Barang Jadi (OP)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1326', 'Ruangan Sekretaris Direktur', NULL, '1181', NULL);
INSERT INTO `level3` VALUES ('1327', 'Ruangan Penyetelan/ Fitting Room; (OP)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1328', 'Ruangan Rapat & Diskusi', NULL, '1182', NULL);
INSERT INTO `level3` VALUES ('1329', 'Ruangan SPI (Satuan Pengawas Internal)', NULL, '1310', NULL);
INSERT INTO `level3` VALUES ('133', 'Ruangan Klinik Sp. Bedah Orthopaedi Umum & Sub Spesialistik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1330', 'Ruangan PSM', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1331', 'Ruangan Arsip/file', NULL, '1311', NULL);
INSERT INTO `level3` VALUES ('1332', 'Ruangan Tunggu', NULL, '1312', NULL);
INSERT INTO `level3` VALUES ('1333', 'Gudang Peralatan Rehab Medik', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1334', 'Janitor', NULL, '1314', NULL);
INSERT INTO `level3` VALUES ('1335', 'Gudang Linen & Farmasi', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1336', 'Dapur Kecil (pantry)', NULL, '1315', NULL);
INSERT INTO `level3` VALUES ('1337', 'Toilet', NULL, '1317', NULL);
INSERT INTO `level3` VALUES ('1338', 'Gudang Kotor', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1339', 'Ruangan Kepala IRM', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('134', 'Ruangan Klinik SP. Bedah Plastik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1340', 'Ruangan Petugas RM', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1341', 'Dapur Kecil (Pantry)', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1342', 'KM/WC Petugas', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1343', 'KM/WC Pasien', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1344', 'Loket Pendaftaran, Pembayaran & Pengambilan Hasil', NULL, '16', NULL);
INSERT INTO `level3` VALUES ('1346', 'Mushola', NULL, '182', NULL);
INSERT INTO `level3` VALUES ('1349', 'Ruangan Klinik Umum', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('135', 'Ruangan Klinik Sp. Bedah Syaraf', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1351', 'Ruangan Klinik Kusta', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1352', 'Ruangan Klinik VCT', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1353', 'Ruangan Klinik CST', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1356', 'Ruangan Fisioterapi Rawat Inap', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1357', 'Ruangan Fisioterapi Rawat Jalan', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1358', 'Ruangan Psikiatri', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1359', 'Ruangan Rohaniawan', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('136', 'Ruangan Klinik Sp. Urologi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1360', 'Ruangan Dokter', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1361', 'Ruangan Diskusi', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1364', 'Ruangan Administrasi Pendaftaran', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1365', 'Ruangan Pengambilan Hasil', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1366', 'Ruangan Persiapan Sampel', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1367', 'Ruangan Mikrobiologi', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1368', 'Ruangan Hematologi', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1369', 'Ruangan Kimia Klinik', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('137', 'Ruangan Sp. Onkologi Radiasi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1370', 'Ruangan Diagnostik Molekuler', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1371', 'Ruangan Flowcytometri', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1372', 'Gudang Alkes Reagensia', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1373', 'Ruangan Cuci Alkes Habis Pakai', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1374', 'Ruangan Kepala Instalasi', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1375', 'Ruangan Staf Dokter', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1376', 'Ruang Rapat Instalasi', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1377', 'Ruangan Arsip', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1378', 'Pantry', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('1379', 'Toilet Petugas', NULL, '1362', NULL);
INSERT INTO `level3` VALUES ('138', 'Ruangan Sp. Anestesiologi & Terapi Intensif', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1380', 'Ruangan Administrasi', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1381', 'Ruangan Rapat', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1382', 'Gudang Obat 1', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1383', 'Gudang Obat 2', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1384', 'Gudang Obat 3', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1385', 'Gudang Infus', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1386', 'Gudang Bahan B3', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1387', 'Gudang Penyimpanan Cetakan', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1388', 'Apotik Rawat Inap', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1389', 'Apotik Rawat Jalan', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('139', 'Ruangan Sp. Gizi Klinik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1390', 'Apotik Obat Tradisional', NULL, '17', NULL);
INSERT INTO `level3` VALUES ('1392', 'Ruangan Perawatan HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1393', 'Ruangan Kepala HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1394', 'Ruangan Tindakan HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1395', 'Ruangan Perawat HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1396', 'Ruangan Cuci Spoel Hok HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1397', 'Gudang HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1398', 'Ruangan Tunggu HCU', NULL, '1391', NULL);
INSERT INTO `level3` VALUES ('1399', 'Ruangan Kepala Instalasi', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('140', 'Ruangan Sp. Geriatri', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1400', 'Gudang Alkes Reagensia', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1401', 'Ruangan Citologi', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1402', 'Ruangan Histopatologi', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1403', 'Ruang Potong Jaringan', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1404', 'Ruangan Arsip', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1405', 'Pantry', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1406', 'Ruangan Patologi Molekuler', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1407', 'Ruangan Administrasi', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1408', 'Ruangan Dokter', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1409', 'Ruangan Imuno Histokimia', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('141', 'Ruangan Sp. Akupuntur Klinik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1410', 'Toilet Petugas', NULL, '1363', NULL);
INSERT INTO `level3` VALUES ('1411', 'Ruangan Kepala', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1412', 'Ruangan Kepala Instalasi', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1413', 'Pantry', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1414', 'Ruang Penjelasan', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1415', 'Gudang 1', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1416', 'Gudang 2', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1417', 'Gudang 3', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1418', 'Ruangan Diskusi', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1419', 'Ruangan Monitor', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1420', 'Ruangan Cross Matching', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1421', 'Laboratorium Cryogenic', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1422', 'Gudang', NULL, '24', NULL);
INSERT INTO `level3` VALUES ('1423', 'Ruangan DOA', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1424', 'Toilet Pasien', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1425', 'Ruangan Kepala', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1426', 'Ruangan Dokter Jaga', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1428', 'Depo Farmasi', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1429', 'Ruangan Kepala', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('143', 'Bangsal', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1430', 'Ruangan RIIM', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1431', 'Ruangan RIRA', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1433', 'Ruangan Administrasi', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1434', 'Ruangan Ginekologi', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1435', 'Ruangan Ginekologi Tindakan', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1436', 'Ruangan Saluran Cerna', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1437', 'Ruangan Saluran Napas', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1438', 'Ruangan Tindakan BMP', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1439', 'Ruangan Jaringan Lunak', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('144', 'Rawat Inap Kelas III', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1440', 'Ruangan Kardiologi', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1441', 'Ruang Tunggu Pasien R.Jalan', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1442', 'Ruang Tunggu Pasien R.Inap', NULL, '1432', NULL);
INSERT INTO `level3` VALUES ('1443', 'Ruangan Klinik Onkologi Medik A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1444', 'Ruangan Klinik Onkologi Medik B', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1445', 'Ruangan Klinik Onkologi Medik C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1446', 'Ruangan Klinik Onkologi Bedah A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1447', 'Ruangan Klinik THT Onkologi A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1448', 'Ruangan Klinik THT Onkologi C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1449', 'Ruangan Klinik Kulit Kelamin A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('145', 'Rawat Inap Kelas II', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1450', 'Ruangan Klinik Kulit Kelamin B', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1451', 'Ruangan Klinik Kulit Kelamin C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1452', 'Ruangan Klinik Paru Onkologi A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1453', 'Ruangan Klinik Paru Onkologi B', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1454', 'Ruangan Klinik Paru Onkologi C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1455', 'Ruangan Klinik Digestif Onkologi A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1456', 'Ruangan Klinik Digestif Onkologi C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1457', 'Ruangan Klinik Neurologi A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1458', 'Ruangan Klinik Neurologi C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1459', 'Ruangan Klinik Bedah Saraf A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('146', 'Rawat Inap Kelas I', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1460', 'Ruangan Klinik Bedah Saraf B', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1461', 'Ruangan Klinik Anak A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1462', 'Ruangan Klinik Anak B', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1463', 'Ruangan Klinik Anak C', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1464', 'Ruangan Pemeriksaan EKG A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1465', 'Ruangan Klinik Lab A', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1466', 'Ruangan Dokter', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1467', 'Ruangan Kepala Instalasi', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1468', 'Ruangan Petugas Radiografer', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1469', 'Ruangan Sekretariat', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('147', 'Rawat Utama / VIP / VVIP', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1470', 'Ruang Periksa 1', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1471', 'Ruang Periksa 2', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1472', 'Ruang Periksa 3', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1473', 'Ruangan Microselectron', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1474', 'Ruang Aplikasi', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1475', 'Ruangan Scrup up', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1476', 'Nurse Station', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1477', 'Ruang Bilas', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1478', 'Ruangan Isotop', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1479', 'Ruang Gelap', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1480', 'Ruangan Blood Iradiator', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1481', 'Ruang CT Planning', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1482', 'Ruangan Masker', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('1483', 'Ruangan Kepala', NULL, '51', NULL);
INSERT INTO `level3` VALUES ('1485', 'Ruangan Periksa 1', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1486', 'Ruangan Periksa 2', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1487', 'Ruangan Periksa 3', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1488', 'Ruang Periksa 4', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1489', 'Ruangan Dokter', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1490', 'Ruangan Kepala Instalasi', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1491', 'Ruangan Pendaftaran', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1492', 'Ruangan Konsultasi', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1493', 'Ruang Tunggu', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1494', 'Ruang Ganti Pasien', NULL, '1484', NULL);
INSERT INTO `level3` VALUES ('1495', 'Ruangan Hot Lab', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1496', 'Ruangan Penyuntikan', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1497', 'Ruangan Gamma Kamera', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1498', 'Ruangan Dokter', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1499', 'Ruang Arsip', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('150', 'Ruangan Resusitasi', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1500', 'Ruangan PET-CT', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1501', 'Ruangan Alkes & Farmasi', NULL, '1235', NULL);
INSERT INTO `level3` VALUES ('1503', 'Ruangan Kepala', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1504', 'Ruangan Administrasi', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1505', 'Ruangan Rapat', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1506', 'Ruangan Registrasi', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1507', 'Ruang Penyimpanan Dokumen', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1508', 'Ruang Penyimpanan Obat', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1509', 'Ruangan Lab Kultur', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('151', 'Perawatan Intensif Luka Bakar (Burn ICU)', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('1510', 'Ruangan Kultur Sel', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1511', 'Ruangan Lab RNA', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1512', 'Ruangan Analisis', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1513', 'Ruangan Cold Room', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1514', 'Ruangan AHU', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1515', 'Ruangan Lab Mikrobiologi', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1516', 'Ruangan Biologi Molekuler', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1517', 'Ruangan Bank Sample', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1518', 'Gudang Alkes & Reagent', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1519', 'Ruangan Pembuatan Air Aquadest', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1520', 'Ruangan Elektroforesis', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1521', 'Gudang ATK', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1522', 'Gudang 1', NULL, '1502', NULL);
INSERT INTO `level3` VALUES ('1526', 'Diagnostik Invasif, INB', NULL, '1525', NULL);
INSERT INTO `level3` VALUES ('1527', 'ICVCU', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('153', 'Operasi Kateterisasi Jantung (Cathlab)', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1531', 'Ruangan USG', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1533', 'Ruang Periksa', NULL, '1532', NULL);
INSERT INTO `level3` VALUES ('1534', 'Lab IVF', NULL, '1532', NULL);
INSERT INTO `level3` VALUES ('1536', 'Ruang HCU', NULL, '1535', NULL);
INSERT INTO `level3` VALUES ('1537', 'Ruang Perawatan VIP', NULL, '1535', NULL);
INSERT INTO `level3` VALUES ('1538', 'Ruangan Jiwa', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1539', 'Ruangan Fisik', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1540', 'Ruangan Psikiatri anak & remaja', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1541', 'Ruangan Tumbuh Kembang(Psiakitri) anak & remaja', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1542', 'Ruangan Kepala Instalasi', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1543', 'Ruangan Workshop', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1544', 'Ruangan Administrasi/Kantor', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1545', 'Toilet Petugas', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1546', 'Ruangan Istirahat', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1547', 'Ruangan Kepala Instalasi', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1548', 'Ruangan Workshop', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1549', 'Ruangan Administrasi/Kantor', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('155', 'Laboratorium', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('1550', 'Ruangan Istirahat', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1551', 'Toilet Petugas', NULL, '1523', NULL);
INSERT INTO `level3` VALUES ('1555', 'Ruangan Klinik Psikogeriatri', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1559', 'Ruangan Klinik Psikometri', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('156', 'Rehabilitasi Medik', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1560', 'Ruangan Klinik Gangguan Mental Organik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1561', 'Ruangan Klinik Ketergantungan Obat/NAPZA', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1563', 'Ruangan Konseling', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1564', 'Ruangan Rawat Inap Forensik', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1565', 'Ruangan Rawat Jiwa Intensif', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('1566', 'Ruangan Rehabilitasi Mental & Sosial', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('1567', 'Ruangan Kesehatan Jiwa Masyarakat', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1569', 'Ruangan Penyuluhan PKMRS', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('160', 'Ruangan rawat pasien Isolasi tipe tekanan standar (kelas S) ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('163', 'Ruangan Persiapan', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('165', 'Ruangan Recovery/Pemulihan', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('1707', 'Ruangan Penyimpanan Linen', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('1708', 'Gudang Bahan Baku', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('172', 'Boiler', NULL, '52', NULL);
INSERT INTO `level3` VALUES ('173', 'Genset', NULL, '54', NULL);
INSERT INTO `level3` VALUES ('174', 'UPS', NULL, '54', NULL);
INSERT INTO `level3` VALUES ('175', 'Trafo Isolasi', NULL, '54', NULL);
INSERT INTO `level3` VALUES ('1753', 'Peralatan Ambulance Transport II', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1754', 'Peralatan Ambulance Transport III', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1755', 'Peralatan Ambulance Transport IV', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1756', 'Peralatan Ambulance Gawat Darurat I', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1757', 'Peralatan Ambulance Gawat Darurat II', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1759', 'Peralatan Ambulance Gawat Darurat III', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('176', 'Trafo Distribusi', NULL, '54', NULL);
INSERT INTO `level3` VALUES ('1760', 'Peralatan Ambulance Gawat Darurat IV', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('178', 'Sentra Gas Medis', NULL, '56', NULL);
INSERT INTO `level3` VALUES ('179', 'Sentra Hidran', NULL, '58', NULL);
INSERT INTO `level3` VALUES ('180', 'Sentra Oksigen Cair', NULL, '57', NULL);
INSERT INTO `level3` VALUES ('181', 'Asrama', NULL, '59', NULL);
INSERT INTO `level3` VALUES ('1814', 'Ruang Jantung Anak', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1815', 'Ruang ICCU Jantung & Pembuluh Darah', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1816', 'Ruang ICCU Jantung & Pembuluh Darah VIP', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1817', 'Ruang Bedah Jantung', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1818', 'Ruang Cathlab', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1819', 'Ruang Echo', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('182', 'Wisma', NULL, '182', NULL);
INSERT INTO `level3` VALUES ('1820', 'Ruang Emergency Jantung', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1821', 'Ruang Intermediet Regular', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1822', 'Ruang Intermediet VIP', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1823', 'Ruang Dokter', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1824', 'Ruang Dokter Jaga', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1825', 'Ruang Farmasi', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1826', 'Ruang Ganti Pasien', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1827', 'Ruang Klinik Spesialis Jantung & Pembuluh Darah, Sub Spesialis', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1828', 'Ruang Konseling', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1829', 'Ruang Kepala Instalasi', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('183', 'Masjid', NULL, '182', NULL);
INSERT INTO `level3` VALUES ('1830', 'Ruang Pemulihan', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1831', 'Ruang Peralihan', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1832', 'Ruang Perawat', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1833', 'Ruang Persiapan', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1834', 'Ruang Treadmill', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1835', 'Ruang Tunggu', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1836', 'Ruang Tunggu VIP', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1837', 'Ruang Ganti Petugas/Loker', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1838', 'Ruang Pendaftaran', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1839', 'Ruang Administrasi', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('184', 'Gereja', NULL, '182', NULL);
INSERT INTO `level3` VALUES ('1840', 'Ruang Alat', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1841', 'Nurse Station / Central Monitoring', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1842', 'Ruang Rekam Medis', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1843', 'Ruang Inventaris', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1844', 'Ruang Gas Center', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1845', 'Toilet Pasien', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1846', 'Toilet Pengunjung', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1847', 'Toilet Petugas', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1848', 'Toilet Pegawai', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1849', 'Ruang Kepala Staf Medik Fungsional', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('185', 'Sentra Gas LPG', NULL, '61', NULL);
INSERT INTO `level3` VALUES ('1850', 'Ruang Sekretariat Staf Medik Fungsional (SMF)', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1851', 'Gudang Alat Medis', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1852', 'Gu&g Instrumen & Linen Bersih', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1853', 'Gudang Kotor (Spoelhock/Dirty Utility)', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1854', 'Gudang Maintenance', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1855', 'Ruang Resident', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1856', 'Pantry', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('1858', 'Ruangan Klinik Psikologi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('1859', 'Ruang Rawat Inap NAPZA', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('188', 'Sterilisasi', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('189', 'Kantin', NULL, '63', NULL);
INSERT INTO `level3` VALUES ('1958', 'Peralatan Mobil Jenazah I', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('1959', 'Peralatan Mobil Jenazah II', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('196', 'Ruangan Komite Medis', NULL, '35', NULL);
INSERT INTO `level3` VALUES ('199', 'Bedah Central', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('200', 'Ruangan Sp. Kedokteran Fisik & Rehabilitasi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('201', 'Rawat Inap', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('20193', 'Ruangan Tindakan 2', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('20196', 'Cafetaria', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20197', 'Admision', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20198', 'Bank', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20199', 'Depo Obat (Satelit)', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('202', 'HCU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('20200', 'ESWL', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20201', 'Ruangan Klinik Sp. Jantung', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20202', 'Ruangan Klinik Sp. Kebidanan & Kandungan', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20203', 'Ruangan Klinik Sp. Bedah', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20204', 'Ruangan Klinik Sp. Mata', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20205', 'Ruangan Klinik Sp. Orthopedi', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20206', 'Ruangan Triage', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20207', 'Ruangan Ganti/Loker Laki-Laki', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20208', 'Ruangan Ganti/Loker Perempuan', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20209', 'Ruangan Tindakan Sp. Bedah Umum', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20210', 'Ruangan Pemulihan', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20211', 'Ruangan Jaga Perawat', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20212', 'Toilet Pasien', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20213', 'Toilet Petugas', NULL, '20195', NULL);
INSERT INTO `level3` VALUES ('20214', 'Ruangan Klinik Hiperbarik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20215', 'Ruangan Klinik Rabies', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20216', 'Ruangan Klinik Diabetic', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20217', 'Ruangan Klinik Sp. Bedah Urology', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20218', 'Ruangan Klinik Sp. Bedah Digestif', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20219', 'Ruangan Lab Elektro Phisiology (EP)', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('20223', 'Ruangan Klinik Nyeri', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20229', 'Ruangan CVC', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('20230', 'Ruangan CVC', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('204', 'Unit Stroke', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('208', 'Endoscopy', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('30001', 'Selasar', NULL, '30001', NULL);
INSERT INTO `level3` VALUES ('30003', 'Ruangan Gaduh Gelisah', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('30004', 'Ruangan Perawatan Umum', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('30005', 'Ruangan Bayi', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('588', 'Ruangan Perawatan Obstetri & Ginekologi', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('589', 'Syaraf', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('591', 'Ruangan Perawatan Penyakit Dalam/ Sp. THT/ Sp. Syaraf', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('599', 'Ruangan Bedah Minor/endoscopy', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('600', 'Ruangan Bedah Besar/Mayor', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('606', 'Ruangan Perawatan Anak', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('607', 'Ruang Radioterapi', NULL, '16', NULL);
INSERT INTO `level3` VALUES ('608', 'Ruang Kedokteran Nuklir', NULL, '16', NULL);
INSERT INTO `level3` VALUES ('609', 'Ruangan Bedah Umum', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('617', 'Ruangan Perawatan Paru + Pernafasan', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('618', 'Ruangan Perawatan Jiwa/ Psikiatri', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('620', 'Ruangan Perawatan Sp. Jantung & Pembuluh Darah', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('622', 'Ruangan Persiapan Bersalin (Observasi) Tanpa Komplikasi/Kala II-III (labour)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('623', 'Ruang Bersalin Tanpa Komplikasi (VK/delivery)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('624', 'Pemulihan/Recovery', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('625', 'Tindakan', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('626', 'Periksa/Triage', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('627', 'Ruang Scrub/Cuci Tangan', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('628', 'Ruang Menyusui & KIE', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('629', 'Ruang Ganti Pakaian/ Loker', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('630', 'Gudang Barang Bersih', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('631', 'Ruangan Janitor/ Utilitas Kotor', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('632', 'Ruang Tunggu Pengantar Pasien', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('633', 'Pos Jaga Perawat/Nurse Station', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('634', 'Ruang Perawat/Petugas', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('635', 'Ruang Bayi Normal/Transisi', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('637', 'Ruangan Neonatus Level I', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('638', 'Ruangan Neonatus Level II', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('639', 'Ruangan Neonatus Level III', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('640', 'Ruangan Isolasi Neonatus', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('641', 'Ruangan Tindakan', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('642', 'Ruangan Loker/Ganti', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('643', 'Ruangan Laktasi/Menyusui', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('644', 'Ruangan Petugas', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('645', 'Pos Jaga Perawat/Nurse Station', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('646', 'Ruangan Cuci Alat', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('647', 'Gudang Barang Bersih', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('648', 'Ruangan Utilitas Kotor', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('649', 'Ruangan Tunggu', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('723', 'Ruangan Perawatan Bedah Umum/ Sp. Bedah Syaraf/ Sp. Ortopedi Umum/ Ortopedi Spesialistik', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('739', 'Ruangan Perawatan Perinatologi', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('844', 'Ruangan Tunggu Pengantar/Keluarga', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('845', 'Ruangan Ganti Pakaian Petugas', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('846', 'Ruangan Dokter/Staf', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('847', 'Area Scrub Station', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('848', 'Ruangan Spoel Hoek', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('849', 'Ruangan Linen/Alat Steril', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('850', 'Ruangan Janitor', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('851', 'Ruangan Administrasi', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('852', 'Sentral Monitoring/ Nurse Station ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('853', 'Gudang Bersih (Clean Utility)', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('854', 'Ruangan Administrasi', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('855', 'Ruangan Dokter ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('856', 'Loker/ Ruangan Ganti Pakaian Petugas', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('857', 'Gudang Kotor (Spoelhoek/ dirty ultility)', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('858', 'Toilet Petugas', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('859', 'Toilet Petugas', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('860', 'Ruangan Ganti Pakaian Petugas ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('861', 'Ruangan Tunggu Pengantar/Keluarga pasien ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('862', 'Toilet Pengunjung', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('863', 'Ruangan Janitor/ ruangan cleaning service', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('864', 'Ruangan Diskusi Medis', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('865', 'Ruangan Tunggu Pengantar Pasien/Keluarga', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('866', 'Ruangan Administrasi & Pendaftaran', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('867', 'Ruangan Strectcher/Brangkar', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('868', 'Ruangan Dekontaminasi', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('869', 'Ruangan non Bedah', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('870', 'Ruangan Observasi', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('871', 'Ruangan Pos Perawat/Nurse Station', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('872', 'Area/ Ruangan/ Depo Obat (Satelit)', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('873', 'Area Penyimpanan Linen Bersih', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('874', 'Area Penyimpanan Alat Medik', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('875', 'Ruangan Radiologi Cito', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('876', 'Ruangan Laboratorium Standar', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('877', 'Ruangan Petugas/Staf/Perawat', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('878', 'Gudang Kotor (Ruangan Spoel Hoek/ Dirty Utility)', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('879', 'Toilet Petugas', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('880', 'Toilet Pengantar/Keluarga Pasien', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('881', 'Ruangan Sterilisasi', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('882', 'Ruangan Loker Petugas/Staf', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('883', 'Ruangan Janitor', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('884', 'Ruangan Stasi Perawat/Nurse Station', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('885', 'Ruangan Linen Bersih', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('886', 'Ruangan Linen Kotor', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('887', 'Konsultasi', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('888', 'Tindakan', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('889', 'Ruangan Administrasi & pendaftaran', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('890', 'Ruangan Dokter Jaga', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('892', 'Toilet Petugas/ Pengunjung', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('893', 'Toilet Pasien', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('894', 'Gudang Kotor (Spoel Hoek/ Dirty Utility) + Janitor/ Ruang Petugas Kebersihan', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('895', 'Janitor/ Ruang Petugas Kebersihan', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('896', 'Ruangan Sp. Kedokteran Okupasi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('897', 'Ruangan Sp. Andrologi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('898', 'Ruangan Sp. Bedah Anak', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('899', 'Ruangan Sp. Bedah Mulut & Maksilofasial', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('900', 'Ruangan SP. Bedah Plastik Rekonstruksi & Estetik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90009', 'Ruangan Klinik Psikososial', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90010', 'Ruangan Terapi Rumatan Metadon', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90011', 'Ruangan Terapi Rumatan', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90013', 'Ruangan Rawat Intensive Pasien Jiwa Non Isolasi', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90014', 'Ruangan Rawat Intensive Pasien Jiwa Isolasi', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90015', 'Ruangan Dokter UPIP', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90016', 'Ruangan Perawat UPIP', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90017', 'Ruangan Administrasi', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90018', 'Gudang/Tempat Alat Medik', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90019', 'Toilet Petugas', NULL, '90012', NULL);
INSERT INTO `level3` VALUES ('90020', 'Instalasi Pusat Jantung Terpadu', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('90021', 'Instalasi Bank Darah', NULL, '90021', NULL);
INSERT INTO `level3` VALUES ('90048', 'Ruangan Klinik Penyakit Infeksi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90049', 'Ruangan Klinik Orthopedi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90080', 'Ruangan Tindakan Sp. Bedah Orthopedi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('901', 'Ruangan Sp. Bedah Toraks Kardiovaskuler', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90139', 'Ruangan Perawatan Mata', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('90148', 'Ruangan Poli Khusus', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90149', 'Rawat Inap Kelas I Utama', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('90191', 'Ruangan  Tindakan Sp. Bedah Urology', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90197', 'Ruangan Klinik Kosmetik & Anti Aging', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('902', 'Ruangan Sp. Kedokteran Forensik & Medikolegal', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90200', 'Ruangan Pelayanan Hiperbarik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90201', 'Ruangan Perawatan Isolasi tipe tekanan negative (Kelas N)', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('90202', 'Ruangan Perawatan Isolasi tipe tekanan positive (kelas P)', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('90203', 'Ruangan Isolasi tipe tekanan positif (kelas P)', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('90204', 'Ruangan Isolasi tipe tekanan negatif (kelas N)', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('90205', 'Ruangan rawat pasien Isolasi tipe tekanan positif (kelas P) ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('90206', 'Ruangan rawat pasien Isolasi tipe tekanan negatif (kelas N) ICU', NULL, '15', NULL);
INSERT INTO `level3` VALUES ('90207', 'Ruang Perawatan Isolasi tipe tekanan positif (kelas P)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('90208', 'Ruang Perawatan Isolasi tipe tekanan negatif (kelas N)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('90209', 'Ruangan Akupuntur', NULL, '20', NULL);
INSERT INTO `level3` VALUES ('90215', 'Ruangan Klinik Vaksin', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90295', 'Ruangan Anteroom', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('903', 'Ruangan Sp. Farmokologi Klinik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90309', 'Laboratorium Teknik Gigi', NULL, '19', NULL);
INSERT INTO `level3` VALUES ('90363', 'Ruangan Intermediate', NULL, '1535', NULL);
INSERT INTO `level3` VALUES ('90377', 'Ruangan Klinik Nefrologi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90379', 'Ruangan Cyclotron(Siklotron)', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('904', 'Ruangan Sp. Konservasi Gigi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90418', 'Ruangan Refraksi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90419', 'Ruangan Klinik Sp. Mata Umum', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90420', 'Ruangan Klinik Infeksi  & Imunologi Mata', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90421', 'Ruangan Klinik Sp. Rekontruksi Okuloplasti & Onkologi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90422', 'Ruangan Pemeriksaan Diagnostik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90423', 'Ruangan Penjadwalan & Post Operasi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90424', 'Klinik Sp. Vitreo-Retina', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90425', 'Ruangan Klinik Sp. Glaukoma', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90426', 'Ruangan Klinik Sp. Katarak & Bedah Refraktif', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90427', 'Ruangan Klinik Refraksi & Low Vision', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('90428', 'Ruangan Klinik Sp. Mata Anak & Strabismus', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('905', 'Ruangan Sp. Kedokteran Gigi Anak', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('907', 'Ruangan Sp. Kedokteran Nuklir', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('908', 'Ruangan Sp. Kedokteran Olahraga', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('909', 'Ruangan Sp. Ortodonsia', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('910', 'Ruangan Sp. Penyakit Mulut', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('911', 'Ruangan Sp. Prostodonsia', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('91241', 'Ruangan Nurse Station Rawat Jalan', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('91242', 'Ruangan TB MDR', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('91243', 'Ruangan Klinik Vaskuler', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('91244', 'Ruangan Klinik Ginjal Hipertensi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('913', 'Ruangan Sp. Radiologi Kedokteran Gigi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('914', 'Ruangan Sp. Mikrobiologi Klinik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('915', 'Ruangan Sp. Parasitologi Klinik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('916', 'Ruangan Sp. Periodonsia', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('917', 'Ruangan Sp. Patologi Anatomi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('918', 'Ruangan Sp. Patologi Klinik', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('919', 'Ruangan Tunggu', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('920', 'Ruangan Administrasi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('922', 'Ruangan Rekam Medis', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('923', 'Ruang Medical Check-up', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('924', 'Ruangan Laktasi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('925', 'Toilet Petugas', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('926', 'Toilet Pasien', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('927', 'Ruangan Janitor', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('928', 'Ruangan Kepala IRJ', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('929', 'Ruangan JKN/Askes', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('930', 'Ruangan Sp. Radiologi', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('931', 'Ruangan Administrasi', NULL, '16', NULL);
INSERT INTO `level3` VALUES ('932', 'Ruangan Tunggu', NULL, '16', NULL);
INSERT INTO `level3` VALUES ('933', 'Ruangan Sp. Kedokteran Penerbangan', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('934', 'Toilet( Petugas, Pasien, Pengunjung)', NULL, '621', NULL);
INSERT INTO `level3` VALUES ('935', 'Toilet Petugas', NULL, '636', NULL);
INSERT INTO `level3` VALUES ('938', 'Rawat Inap Kelas III Pria', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('947', 'Rumah Tunggu', NULL, '947', NULL);
INSERT INTO `level3` VALUES ('954', 'Ruangan Tindakan', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('955', 'Pelayanan Jantung Terpadu', NULL, '587', NULL);
INSERT INTO `level3` VALUES ('956', 'Rawat Inap Kelas III Wanita', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('957', 'Ruangan Pelayanan Hemodialisa', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('958', 'Rawat Inap Kelas II Pria', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('959', 'Rawat Inap Kelas II Wanita', NULL, '13', NULL);
INSERT INTO `level3` VALUES ('960', 'Ruangan Rekam Medik', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('961', 'Ruangan Persiapan Bencana Massal', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('962', 'Ruangan Isolasi tipe tekanan standar (kelas S)', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('963', 'Ruangan Linen Steril', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('964', 'Ruangan Dokter Konsulen', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('965', 'Ruangan Kepala IGD', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('967', 'Ruangan Gas Medis', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('968', 'Ruangan Parkir Troli/ Kursi Roda', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('969', 'Peralatan Ambulance Transport I', NULL, '12', NULL);
INSERT INTO `level3` VALUES ('970', 'Ruangan Penerimaan, Pendaftaran, Pembayaran & Pengambilan Hasil', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('971', 'Ruangan Administrasi', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('972', 'Ruangan Arsip & Rekam Medik', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('973', 'Ruangan Pemeriksaan & Konsultasi', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('974', 'Ruang Pendaftaran', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('975', 'Ruangan Tunggu Pasien', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('976', 'Ruang Tunggu', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('977', 'Ruangan Tindakan Sp. Penyakit Dalam', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('978', 'Ruangan Tindakan Sp. Paru & Pernafasan', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('979', 'Ruangan Tunggu Pasien Tirah Baring', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('980', 'Ruangan Tindakan Sp. THT', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('981', 'Ruangan Tindakan Sp. Bedah Syaraf', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('982', 'Ruangan Tindakan Sp. Kulit & Kelamin', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('983', 'Ruangan Tindakan Sp. Bedah Umum/ Bedah', NULL, '11', NULL);
INSERT INTO `level3` VALUES ('984', 'Ruangan Moulding', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('985', 'Ruangan Kemoterapi', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('986', 'Ruangan Simulator', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('987', 'Ruangan Terapi Penyinaran (Treatment Room)/Theraphy', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('988', 'Ruangan Kontrol Kualitas (Quality Control)', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('989', 'Ruangan Fisikawan Medik', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('990', 'Ruangan Petugas', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('991', 'Pantri', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('992', 'Ruangan Perawat', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('993', 'Ruangan Ganti Petugas', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('994', 'Ruangan Ganti Pasien', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('995', 'Ruangan Diskusi', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('996', 'Depo Farmasi (Satelit)', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('997', 'Toilet Petugas/Pasien', NULL, '37', NULL);
INSERT INTO `level3` VALUES ('998', 'Ruang Transfer (Ganti Brankar) + Parkir Brankar', NULL, '14', NULL);
INSERT INTO `level3` VALUES ('999', 'Gudang Steril (Clean Utility)', NULL, '14', NULL);

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location_keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, 'IGD', NULL);
INSERT INTO `location` VALUES (2, 'OK', NULL);

-- ----------------------------
-- Table structure for lokasi
-- ----------------------------
DROP TABLE IF EXISTS `lokasi`;
CREATE TABLE `lokasi`  (
  `lokasi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lokasi_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lokasi_keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lokasi_id_user` bigint(20) NULL DEFAULT NULL,
  `lokasi_id_area` bigint(20) NULL DEFAULT NULL,
  `lokasi_code_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lokasi_gabungan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`lokasi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lokasi
-- ----------------------------
INSERT INTO `lokasi` VALUES (2, 'ICU Lantai 3', NULL, NULL, NULL, '1033', 'ICU Lantai 3');
INSERT INTO `lokasi` VALUES (3, 'IGD', NULL, NULL, NULL, '109', 'IGD');
INSERT INTO `lokasi` VALUES (4, 'Perinatologi', NULL, NULL, NULL, '739', 'Perinatologi');
INSERT INTO `lokasi` VALUES (5, 'Bangsal Anak', NULL, NULL, NULL, '143', 'Bangsal Anak');
INSERT INTO `lokasi` VALUES (6, 'IGD Radiologi', NULL, NULL, NULL, '875', 'IGD Radiologi');
INSERT INTO `lokasi` VALUES (7, 'ICU', NULL, NULL, NULL, '1033', 'ICU');
INSERT INTO `lokasi` VALUES (8, 'ICU 1', NULL, NULL, NULL, '1033', 'ICU 1');
INSERT INTO `lokasi` VALUES (9, 'Radiologi', NULL, NULL, NULL, '121', 'Radiologi');
INSERT INTO `lokasi` VALUES (10, 'Poli Gigi & Mulut', NULL, NULL, NULL, '108', 'Poli Gigi & Mulut');
INSERT INTO `lokasi` VALUES (11, 'Poli Mata', NULL, NULL, NULL, '90419', 'Poli Mata');
INSERT INTO `lokasi` VALUES (12, 'Poli THT', NULL, NULL, NULL, '107', 'Poli THT');
INSERT INTO `lokasi` VALUES (13, 'Poli Gizi', NULL, NULL, NULL, '139', 'Poli Gizi');
INSERT INTO `lokasi` VALUES (14, 'Poli Jiwa', NULL, NULL, NULL, '1567', 'Poli Jiwa');
INSERT INTO `lokasi` VALUES (15, 'Poli MPK', NULL, NULL, NULL, '103', 'Poli MPK');
INSERT INTO `lokasi` VALUES (16, 'Poli Kebidanan', NULL, NULL, NULL, '105', 'Poli Kebidanan');
INSERT INTO `lokasi` VALUES (17, 'Bangsal Kebidanan', NULL, NULL, NULL, '143', 'Bangsal Kebidanan');
INSERT INTO `lokasi` VALUES (18, 'Bangsal Jantung', NULL, NULL, NULL, '143', 'Bangsal Jantung');
INSERT INTO `lokasi` VALUES (19, 'Poli Anak', NULL, NULL, NULL, '1461', 'Poli Anak');
INSERT INTO `lokasi` VALUES (20, 'Poli Jantung', NULL, NULL, NULL, '128', 'Poli Jantung');
INSERT INTO `lokasi` VALUES (21, 'Poli Kulit & Kelamin', NULL, NULL, NULL, '1449', 'Poli Kulit & Kelamin');
INSERT INTO `lokasi` VALUES (22, 'Poli Anestesi', NULL, NULL, NULL, '138', 'Poli Anestesi');
INSERT INTO `lokasi` VALUES (23, 'UTD RS', NULL, NULL, NULL, '1421', 'UTD RS');
INSERT INTO `lokasi` VALUES (24, 'Cathlab', NULL, NULL, NULL, '1818', 'Cathlab');
INSERT INTO `lokasi` VALUES (26, 'Rawat Inap Bedah', NULL, NULL, NULL, '723', 'Rawat Inap Bedah');
INSERT INTO `lokasi` VALUES (27, 'Bangsal Paru', NULL, NULL, NULL, '143', 'Bangsal Paru');
INSERT INTO `lokasi` VALUES (28, 'Bangsal Neurologi', NULL, NULL, NULL, '143', 'Bangsal Neurologi');
INSERT INTO `lokasi` VALUES (29, 'Fisioterapi', NULL, NULL, NULL, '1357', 'Fisioterapi');
INSERT INTO `lokasi` VALUES (30, 'HD', NULL, NULL, NULL, '1215', 'HD');
INSERT INTO `lokasi` VALUES (31, 'OK', NULL, NULL, NULL, '199', 'OK');
INSERT INTO `lokasi` VALUES (32, 'OK 1', NULL, NULL, NULL, '199', 'OK 1');
INSERT INTO `lokasi` VALUES (33, 'OK 2', NULL, NULL, NULL, '199', 'OK 2');
INSERT INTO `lokasi` VALUES (34, 'OK 3', NULL, NULL, NULL, '199', 'OK 3');
INSERT INTO `lokasi` VALUES (35, 'OK 4', NULL, NULL, NULL, '199', 'OK 4');
INSERT INTO `lokasi` VALUES (36, 'OK 5', NULL, NULL, NULL, '199', 'OK 5');
INSERT INTO `lokasi` VALUES (37, 'OK 6', NULL, NULL, NULL, '199', 'OK 6');
INSERT INTO `lokasi` VALUES (38, 'OK 7', NULL, NULL, NULL, '199', 'OK 7');
INSERT INTO `lokasi` VALUES (39, 'OK 8', NULL, NULL, NULL, '199', 'OK 8');
INSERT INTO `lokasi` VALUES (40, 'Laboratorium IGD', NULL, NULL, NULL, '876', 'Laboratorium IGD');
INSERT INTO `lokasi` VALUES (41, 'Bank Darah', NULL, NULL, NULL, '90021', 'Bank Darah');
INSERT INTO `lokasi` VALUES (42, 'KB IGD', NULL, NULL, NULL, '114', 'KB IGD');
INSERT INTO `lokasi` VALUES (43, 'ESWL', NULL, NULL, NULL, '20200', 'ESWL');
INSERT INTO `lokasi` VALUES (44, 'Kemoterapi', NULL, NULL, NULL, '985', 'Kemoterapi');
INSERT INTO `lokasi` VALUES (45, 'Poli Paru', NULL, NULL, NULL, '129', 'Poli Paru');
INSERT INTO `lokasi` VALUES (46, 'Lab. Klinik', NULL, NULL, NULL, '155', 'Lab. Klinik');
INSERT INTO `lokasi` VALUES (47, 'Gudang Farmasi', NULL, NULL, NULL, '1115', 'Gudang Farmasi');
INSERT INTO `lokasi` VALUES (48, 'Ranap Interne', NULL, NULL, NULL, '591', 'Ranap Interne');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_08_08_100000_create_telescope_entries_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_08_04_155610_create_attributes_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_01_05_183248_create_filter_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_01_05_183248_create_system_group_connection_menu_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_01_05_183248_create_system_group_connection_role_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_01_05_183248_create_system_group_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_01_05_183248_create_system_link_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_01_05_183248_create_system_menu_connection_link_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_01_05_183248_create_system_menu_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_01_05_183248_create_system_permision_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_01_05_183248_create_system_role_table', 1);
INSERT INTO `migrations` VALUES (15, '2023_01_05_183248_create_users_table', 1);
INSERT INTO `migrations` VALUES (16, '2023_01_05_183249_add_foreign_keys_to_system_group_connection_menu_table', 1);
INSERT INTO `migrations` VALUES (17, '2023_01_05_183249_add_foreign_keys_to_system_group_connection_role_table', 1);
INSERT INTO `migrations` VALUES (18, '2023_01_05_183249_add_foreign_keys_to_system_menu_connection_link_table', 1);
INSERT INTO `migrations` VALUES (19, '2023_06_07_000001_create_pulse_tables', 1);
INSERT INTO `migrations` VALUES (20, '2024_08_05_013044_create_teams_table', 1);
INSERT INTO `migrations` VALUES (21, '2024_08_05_013045_create_team_user_table', 1);
INSERT INTO `migrations` VALUES (22, '2024_08_08_134153_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (23, '2024_08_12_234452_create_plans_table', 1);
INSERT INTO `migrations` VALUES (24, '2024_08_12_234453_create_plan_features_table', 1);
INSERT INTO `migrations` VALUES (25, '2024_08_12_234454_create_plan_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (26, '2024_08_12_234455_create_plan_subscription_usage_table', 1);
INSERT INTO `migrations` VALUES (27, '2024_08_13_001558_create_activity_log_table', 1);
INSERT INTO `migrations` VALUES (28, '2024_08_13_001559_add_event_column_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (29, '2024_08_13_001600_add_batch_uuid_column_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (30, '2025_02_17_183839_create_telegraph_bots_table', 2);
INSERT INTO `migrations` VALUES (31, '2025_02_17_183840_create_telegraph_chats_table', 2);

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `model_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model_id_brand` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE INDEX `model_nama`(`model_nama`) USING BTREE,
  INDEX `model_id_brand`(`model_id_brand`) USING BTREE,
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`model_id_brand`) REFERENCES `brand` (`brand_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES (2, 'TEC-7', 2);
INSERT INTO `model` VALUES (3, 'Aespire', 2);
INSERT INTO `model` VALUES (4, 'Aestiva/5', 2);
INSERT INTO `model` VALUES (5, 'Whitestar', 9);
INSERT INTO `model` VALUES (6, 'TE-172', 55);
INSERT INTO `model` VALUES (7, 'TE-112', 55);
INSERT INTO `model` VALUES (8, 'TE-331', 55);
INSERT INTO `model` VALUES (9, 'TE-LF600', 55);
INSERT INTO `model` VALUES (10, 'SS-700', 55);
INSERT INTO `model` VALUES (11, 'SSU-2', 50);
INSERT INTO `model` VALUES (12, 'TC50', 53);
INSERT INTO `model` VALUES (13, 'TE-SS700', 55);
INSERT INTO `model` VALUES (14, 'Thermoflator', 54);
INSERT INTO `model` VALUES (15, 'Vista 120', 3);
INSERT INTO `model` VALUES (16, 'Vista XL', 3);
INSERT INTO `model` VALUES (17, 'VVIDE95', 4);
INSERT INTO `model` VALUES (18, 'Xenon Nova', 54);
INSERT INTO `model` VALUES (19, 'ZTP80', 6);
INSERT INTO `model` VALUES (20, 'ZTP80A', 6);
INSERT INTO `model` VALUES (22, 'ZTP80-ECO', 6);
INSERT INTO `model` VALUES (23, 'PM Pro3', 6);
INSERT INTO `model` VALUES (24, 'Dash 5000', 4);
INSERT INTO `model` VALUES (25, 'Revolution EVO', 4);
INSERT INTO `model` VALUES (27, 'EL-ECG3CH', 39);
INSERT INTO `model` VALUES (28, 'RE-17C', 55);
INSERT INTO `model` VALUES (29, 'Versana Premier', 4);
INSERT INTO `model` VALUES (30, 'ST-170', 43);
INSERT INTO `model` VALUES (31, 'LOGIQ e', 4);
INSERT INTO `model` VALUES (32, 'EPIQ 5G', 53);
INSERT INTO `model` VALUES (34, 'CX21', 50);
INSERT INTO `model` VALUES (38, 'BL-50B', 6);
INSERT INTO `model` VALUES (39, 'BB200', 6);
INSERT INTO `model` VALUES (40, 'SLE1000', 6);
INSERT INTO `model` VALUES (41, 'Vanward', 6);
INSERT INTO `model` VALUES (42, 'Pocket', 6);
INSERT INTO `model` VALUES (44, 'Sonoplus 590', 40);
INSERT INTO `model` VALUES (45, '5702', 41);
INSERT INTO `model` VALUES (46, 'Vio50C', 42);
INSERT INTO `model` VALUES (47, '259CK', 4);
INSERT INTO `model` VALUES (48, '5/5 Aespire', 4);
INSERT INTO `model` VALUES (49, 'Clesta', 23);
INSERT INTO `model` VALUES (50, 'EPIQ SG', 53);
INSERT INTO `model` VALUES (51, '240', 125);
INSERT INTO `model` VALUES (52, '4400', 44);

-- ----------------------------
-- Table structure for nomenklatur
-- ----------------------------
DROP TABLE IF EXISTS `nomenklatur`;
CREATE TABLE `nomenklatur`  (
  `nomenklatur_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nomenklatur_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nomenklatur_keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nomenklatur_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nomenklatur
-- ----------------------------
INSERT INTO `nomenklatur` VALUES ('10102003', 'Centrifuge, Low Speed Centrifuge (Darah & Urin)', NULL);
INSERT INTO `nomenklatur` VALUES ('10102018', 'Fluorometer for Clinical use', NULL);
INSERT INTO `nomenklatur` VALUES ('10102024', 'Pipetting & Diluting System for Clinical use', NULL);
INSERT INTO `nomenklatur` VALUES ('10102028', 'Automated Urinalysis System', NULL);
INSERT INTO `nomenklatur` VALUES ('10203004', 'Centrifuge, Cyto Centrifuge', NULL);
INSERT INTO `nomenklatur` VALUES ('10203006', 'Mikroskop Elektron', NULL);
INSERT INTO `nomenklatur` VALUES ('10203010', 'Mikroskop Binocular', NULL);
INSERT INTO `nomenklatur` VALUES ('10203012', 'Mikroskop Fluoresens', NULL);
INSERT INTO `nomenklatur` VALUES ('10203013', 'Mikroskop Cahaya', NULL);
INSERT INTO `nomenklatur` VALUES ('10203018', 'Analytical Balance', NULL);
INSERT INTO `nomenklatur` VALUES ('10203019', 'Mikroskop Stereo', NULL);
INSERT INTO `nomenklatur` VALUES ('10203024', 'Biosafety Cabinet (BSC) Class II Type A2', NULL);
INSERT INTO `nomenklatur` VALUES ('10203033', 'Centrifuge, Cyto Spin Centrifuge', NULL);
INSERT INTO `nomenklatur` VALUES ('10203034', 'Automatic Tissue Processing', NULL);
INSERT INTO `nomenklatur` VALUES ('10203035', 'Manual Tissue Processing', NULL);
INSERT INTO `nomenklatur` VALUES ('10203038', 'Embedding Center', NULL);
INSERT INTO `nomenklatur` VALUES ('10203040', 'Teaching Mikroskop', NULL);
INSERT INTO `nomenklatur` VALUES ('10203043', 'Biosafety Cabinet (BSC) Class II Type B2', NULL);
INSERT INTO `nomenklatur` VALUES ('10203044', 'Alat Pengukur Berat (Timbangan) < 1 Kg', NULL);
INSERT INTO `nomenklatur` VALUES ('10203045', 'Alat Pengukur Berat (Timbangan) > 1 Kg', NULL);
INSERT INTO `nomenklatur` VALUES ('10203048', 'Fume Hood / Lemari Asam', NULL);
INSERT INTO `nomenklatur` VALUES ('10203050', 'Biosafety Cabinet', NULL);
INSERT INTO `nomenklatur` VALUES ('10205016', 'Laminary Air FLow (LAF)', NULL);
INSERT INTO `nomenklatur` VALUES ('10302018', 'Microbiological Inkubator', NULL);
INSERT INTO `nomenklatur` VALUES ('10302028', 'Liquid Base Cytology (LBC) Automatic  / Machine', NULL);
INSERT INTO `nomenklatur` VALUES ('10302030', 'Imunohistokimia (IHK) Set', NULL);
INSERT INTO `nomenklatur` VALUES ('10302031', 'Manual Microtome', NULL);
INSERT INTO `nomenklatur` VALUES ('10302032', 'Cryostat', NULL);
INSERT INTO `nomenklatur` VALUES ('10302033', 'Fully Motorize Rotary Microtome', NULL);
INSERT INTO `nomenklatur` VALUES ('10302037', 'Centrifuge, Refrigerated Centrifuge', NULL);
INSERT INTO `nomenklatur` VALUES ('10401036', 'Blood Gas Analyzer (BGA / AGD)', NULL);
INSERT INTO `nomenklatur` VALUES ('10401037', 'Spirometer', NULL);
INSERT INTO `nomenklatur` VALUES ('10403079', 'Ventilator Konvensional Anak / Dewasa', NULL);
INSERT INTO `nomenklatur` VALUES ('10403081', 'Mesin Anestesi Ventilator', NULL);
INSERT INTO `nomenklatur` VALUES ('10403084', 'Oxygen Set + Flowmeter', NULL);
INSERT INTO `nomenklatur` VALUES ('10403085', 'Ventilator Infant (Ventilator Konvensional Bayi)', NULL);
INSERT INTO `nomenklatur` VALUES ('10403086', 'Nebulizer Jet', NULL);
INSERT INTO `nomenklatur` VALUES ('10403087', 'Nebulizer Ultrasound', NULL);
INSERT INTO `nomenklatur` VALUES ('10605017', 'Dental Unit', NULL);
INSERT INTO `nomenklatur` VALUES ('10704002', 'THT Unit / ENT Diagnostik Unit / ENT Examination Set / ENT Treatment', NULL);
INSERT INTO `nomenklatur` VALUES ('10704008', 'Brain Evoke Respon Audiometer (BERA / ABR)', NULL);
INSERT INTO `nomenklatur` VALUES ('10804015', 'Urologi Instrumen Set', NULL);
INSERT INTO `nomenklatur` VALUES ('10901002', 'Bedside Monitor / Bed-Patient Monitor / Patient Monitor / Vitalsign Monitor', NULL);
INSERT INTO `nomenklatur` VALUES ('10901006', 'Timbangan Dewasa', NULL);
INSERT INTO `nomenklatur` VALUES ('10901017', 'Tensimeter Anaeroid / Sphygmomanometer', NULL);
INSERT INTO `nomenklatur` VALUES ('10901018', 'Tensimeter Digital / Blood Pressure Meter Digital', NULL);
INSERT INTO `nomenklatur` VALUES ('10901019', 'Timbangan Anak', NULL);
INSERT INTO `nomenklatur` VALUES ('10901020', 'Timbangan Bayi', NULL);
INSERT INTO `nomenklatur` VALUES ('10903020', 'Lampu Periksa Halogen', NULL);
INSERT INTO `nomenklatur` VALUES ('10903021', 'Examination Light / Examination Lamp / Lampu Periksa / Hanging Lamp', NULL);
INSERT INTO `nomenklatur` VALUES ('10903100', 'Alat Pemanas / Warmer', NULL);
INSERT INTO `nomenklatur` VALUES ('10903136', 'Shaking Waterbath', NULL);
INSERT INTO `nomenklatur` VALUES ('10903137', 'Lampu Operasi Kepala / Operating Head Lamp', NULL);
INSERT INTO `nomenklatur` VALUES ('11001037', 'Brainmaping 32 Channels', NULL);
INSERT INTO `nomenklatur` VALUES ('11104024', 'Lampu Ginekolog', NULL);
INSERT INTO `nomenklatur` VALUES ('11201069', 'Lensmeter / Lensometer', NULL);
INSERT INTO `nomenklatur` VALUES ('11201074', 'Slit Lamp', NULL);
INSERT INTO `nomenklatur` VALUES ('11201083', 'Snellen Test Projector', NULL);
INSERT INTO `nomenklatur` VALUES ('11401014', 'Inclinometer', NULL);
INSERT INTO `nomenklatur` VALUES ('11401015', 'Handgrip Streght Dynamometer', NULL);
INSERT INTO `nomenklatur` VALUES ('11403038', 'Electro Convulsion Therapy (ECT)', NULL);
INSERT INTO `nomenklatur` VALUES ('11403040', 'Ultrasound Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('11403041', 'Treadmill', NULL);
INSERT INTO `nomenklatur` VALUES ('11503001', 'Personnel Protective Shield', NULL);
INSERT INTO `nomenklatur` VALUES ('11603038', 'Mikroskop Operasi', NULL);
INSERT INTO `nomenklatur` VALUES ('11603050', 'Meja Operasi Electric', NULL);
INSERT INTO `nomenklatur` VALUES ('11603063', 'Monitor for Laparoscopy', NULL);
INSERT INTO `nomenklatur` VALUES ('1801041', 'Real Time PCR', NULL);
INSERT INTO `nomenklatur` VALUES ('20101159', 'Centrifuge, Microcentrifuge', NULL);
INSERT INTO `nomenklatur` VALUES ('20101161', 'Centrifuge, Ultracentrifuge', NULL);
INSERT INTO `nomenklatur` VALUES ('20102020', 'Electrolyte Analyzer', NULL);
INSERT INTO `nomenklatur` VALUES ('20205007', 'Coagulation Instrument', NULL);
INSERT INTO `nomenklatur` VALUES ('20205010', 'Automated Hemoglobin System', NULL);
INSERT INTO `nomenklatur` VALUES ('20205017', 'Analisa Hb (POCT Methode)', NULL);
INSERT INTO `nomenklatur` VALUES ('20205018', 'FLow Cytometri (FCM)', NULL);
INSERT INTO `nomenklatur` VALUES ('20205019', 'Agregometer', NULL);
INSERT INTO `nomenklatur` VALUES ('20205023', 'Mesin Pembaca Produk PCR / PCR Plate Reader', NULL);
INSERT INTO `nomenklatur` VALUES ('20209009', 'Blood & Plasma Warming Device', NULL);
INSERT INTO `nomenklatur` VALUES ('20209021', 'Blood Storage Refrigerator & Blood Storage Freezer', NULL);
INSERT INTO `nomenklatur` VALUES ('20301003', 'Mesin Identifikasi & Uji Kepekaan Otomatik / Microba Analyzer', NULL);
INSERT INTO `nomenklatur` VALUES ('20304008', 'Imunologi Analyzer', NULL);
INSERT INTO `nomenklatur` VALUES ('20403030', 'Oxygen Concentrator / Portable Oxygen Generator ', NULL);
INSERT INTO `nomenklatur` VALUES ('20403044', 'Nebulizer', NULL);
INSERT INTO `nomenklatur` VALUES ('20403065', 'Autotransfusion Apparatus', NULL);
INSERT INTO `nomenklatur` VALUES ('20403078', 'Mesin Anestesi', NULL);
INSERT INTO `nomenklatur` VALUES ('20403081', 'Resusitator Dewasa', NULL);
INSERT INTO `nomenklatur` VALUES ('20403083', 'Resusitator Bayi / Neonatus', NULL);
INSERT INTO `nomenklatur` VALUES ('20403089', 'Resusitator Anak', NULL);
INSERT INTO `nomenklatur` VALUES ('20403090', 'Resusitation Set / Resusitation Bay / Resusitation Kit', NULL);
INSERT INTO `nomenklatur` VALUES ('20501039', 'Intra-Aortic Ballon Pump (IABP)', NULL);
INSERT INTO `nomenklatur` VALUES ('20501040', 'Vena Section', NULL);
INSERT INTO `nomenklatur` VALUES ('20502008', 'Echocardiograph', NULL);
INSERT INTO `nomenklatur` VALUES ('20502020', 'Pulse Oxymeter / Oximeter / Oksigen Saturasi / SPO2', NULL);
INSERT INTO `nomenklatur` VALUES ('20502037', 'Electrocardiograph (ECG/EKG) Monitor', NULL);
INSERT INTO `nomenklatur` VALUES ('20502039', 'Cardiotocograph (CTG)', NULL);
INSERT INTO `nomenklatur` VALUES ('20502040', 'Pocket Oximetry', NULL);
INSERT INTO `nomenklatur` VALUES ('20505007', 'Defibrilator', NULL);
INSERT INTO `nomenklatur` VALUES ('20601006', 'Pesawat Sinar-X, Dental Panoramic', NULL);
INSERT INTO `nomenklatur` VALUES ('20601007', 'Pesawat Sinar-X, Dental', NULL);
INSERT INTO `nomenklatur` VALUES ('20701001', 'Audiometer', NULL);
INSERT INTO `nomenklatur` VALUES ('20801004', 'Endoscopy', NULL);
INSERT INTO `nomenklatur` VALUES ('20801009', 'Endoscopy, Video Monitor', NULL);
INSERT INTO `nomenklatur` VALUES ('20804017', 'Endoscopy, Lightsource', NULL);
INSERT INTO `nomenklatur` VALUES ('20805022', 'Hemodialisa', NULL);
INSERT INTO `nomenklatur` VALUES ('20901011', 'Thermometer Digital', NULL);
INSERT INTO `nomenklatur` VALUES ('20901013', 'Thermometer Rectal', NULL);
INSERT INTO `nomenklatur` VALUES ('20901014', 'Thermometer Axial', NULL);
INSERT INTO `nomenklatur` VALUES ('20901015', 'Central Monitor', NULL);
INSERT INTO `nomenklatur` VALUES ('20902005', 'Electric Bed Patient', NULL);
INSERT INTO `nomenklatur` VALUES ('20902008', 'Infant Warmer', NULL);
INSERT INTO `nomenklatur` VALUES ('20902018', 'Inkubator Bayi', NULL);
INSERT INTO `nomenklatur` VALUES ('20902019', 'Inkubator Bayi Transpor', NULL);
INSERT INTO `nomenklatur` VALUES ('20902034', 'Phototherapy Unit', NULL);
INSERT INTO `nomenklatur` VALUES ('20902035', 'Infusion Pump', NULL);
INSERT INTO `nomenklatur` VALUES ('20902045', 'ICU Bed Electric', NULL);
INSERT INTO `nomenklatur` VALUES ('20902046', 'Syringe Pump', NULL);
INSERT INTO `nomenklatur` VALUES ('20903026', 'UV Sterilizer', NULL);
INSERT INTO `nomenklatur` VALUES ('20903029', 'Suction, Suction Pump / Pompa Vakum  / Vacuum-Powered Body Fluid Suction Apparatus; Suction Pump Mobile', NULL);
INSERT INTO `nomenklatur` VALUES ('20903037', 'Autoclave Kering', NULL);
INSERT INTO `nomenklatur` VALUES ('20903038', 'Steam Sterilizer', NULL);
INSERT INTO `nomenklatur` VALUES ('20903050', 'Sterilisator / Sterilisator Basah', NULL);
INSERT INTO `nomenklatur` VALUES ('20903053', 'Suction, Suction Thorax', NULL);
INSERT INTO `nomenklatur` VALUES ('20903055', 'Suction, Baby Suction Pump', NULL);
INSERT INTO `nomenklatur` VALUES ('20903101', 'Sterilisator Suhu Rendah', NULL);
INSERT INTO `nomenklatur` VALUES ('20903102', 'Autoclave Table Top', NULL);
INSERT INTO `nomenklatur` VALUES ('20903115', 'Air Warming Blanket', NULL);
INSERT INTO `nomenklatur` VALUES ('20903119', 'FLowmeter Oksigen', NULL);
INSERT INTO `nomenklatur` VALUES ('21001011', 'Electroencephalograph (EEG)', NULL);
INSERT INTO `nomenklatur` VALUES ('21102006', 'Fetal Doppler', NULL);
INSERT INTO `nomenklatur` VALUES ('21102019', 'Ultrasonography (USG) 3D', NULL);
INSERT INTO `nomenklatur` VALUES ('21102020', 'Ultrasonography (USG) 4D', NULL);
INSERT INTO `nomenklatur` VALUES ('21102025', 'Ultrasonography (USG) 2D', NULL);
INSERT INTO `nomenklatur` VALUES ('21105027', 'Laser Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21201006', 'Autorefraktometer', NULL);
INSERT INTO `nomenklatur` VALUES ('21201008', 'Refrakto Keratometer', NULL);
INSERT INTO `nomenklatur` VALUES ('21201068', 'Tonometer Non-Kontak  / Non-Contact Tonometer (NCT)', NULL);
INSERT INTO `nomenklatur` VALUES ('21201074', 'Biometer A-scan', NULL);
INSERT INTO `nomenklatur` VALUES ('21201075', 'Ultrasonography (USG) Mata', NULL);
INSERT INTO `nomenklatur` VALUES ('21201076', 'Retinometer', NULL);
INSERT INTO `nomenklatur` VALUES ('21201078', 'Optical Coherent Tomography (OCT)', NULL);
INSERT INTO `nomenklatur` VALUES ('21201087', 'Mikroskop Spekular', NULL);
INSERT INTO `nomenklatur` VALUES ('21201090', 'Chart Projector', NULL);
INSERT INTO `nomenklatur` VALUES ('21203030', 'Fakoemulsifikasi Unit', NULL);
INSERT INTO `nomenklatur` VALUES ('21203039', 'Laser Fotocoagulasi Retina Set', NULL);
INSERT INTO `nomenklatur` VALUES ('21203040', 'Laser Fotocoagulasi Glaukoma Set', NULL);
INSERT INTO `nomenklatur` VALUES ('21203041', 'YAG Laser Set', NULL);
INSERT INTO `nomenklatur` VALUES ('21401003', 'Electromyograph (EMG)', NULL);
INSERT INTO `nomenklatur` VALUES ('21401011', 'Ultrasonography (USG) Muskuloskeletal', NULL);
INSERT INTO `nomenklatur` VALUES ('21402027', 'Kursi Roda Elektrik / Powered Wheelchair', NULL);
INSERT INTO `nomenklatur` VALUES ('21403003', 'Parafin Bath', NULL);
INSERT INTO `nomenklatur` VALUES ('21403011', 'Microwave Diathermy (MWD)', NULL);
INSERT INTO `nomenklatur` VALUES ('21403012', 'Shortwave Diathermy (SWD)', NULL);
INSERT INTO `nomenklatur` VALUES ('21403019', 'Infrared Lamp', NULL);
INSERT INTO `nomenklatur` VALUES ('21403033', 'Traction Unit', NULL);
INSERT INTO `nomenklatur` VALUES ('21403035', 'LF Electro Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21403036', 'Faradic-Galvanic Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21403037', 'Compression Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21403038', 'Acupunture Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21403039', 'Hidro Therapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21403040', 'Bath Whirl Pool', NULL);
INSERT INTO `nomenklatur` VALUES ('21403041', 'Pulse Erator Unit', NULL);
INSERT INTO `nomenklatur` VALUES ('21403043', 'Lymphatic Physiotherapy', NULL);
INSERT INTO `nomenklatur` VALUES ('21403046', 'Rowing Machine', NULL);
INSERT INTO `nomenklatur` VALUES ('21403047', 'Exercise Bicycle', NULL);
INSERT INTO `nomenklatur` VALUES ('21403048', 'Electro Stimulation & Analgesia', NULL);
INSERT INTO `nomenklatur` VALUES ('21403055', 'Ergocycle', NULL);
INSERT INTO `nomenklatur` VALUES ('21501001', 'Magnetic Resonance Imaging (MRI) 1,5 Tesla', NULL);
INSERT INTO `nomenklatur` VALUES ('21501023', 'Ultrasonic Pulsed Echo Imaging System', NULL);
INSERT INTO `nomenklatur` VALUES ('21501025', 'Pesawat Sinar-X, Single Plane Angiographic X-Ray System / Cathlab', NULL);
INSERT INTO `nomenklatur` VALUES ('21501028', 'Pesawat Sinar-X, Computed Radiography (CR) / Cine (Spot Fluorographic X-Ray Camera)', NULL);
INSERT INTO `nomenklatur` VALUES ('21501030', 'Pesawat Sinar-X, Image-Intensified Fluoroscopic X-Ray System ', NULL);
INSERT INTO `nomenklatur` VALUES ('21501033', 'Pesawat Sinar-X, Stationer / Fixed Table X-Ray System, General X-Ray, Pesawat Rontgen', NULL);
INSERT INTO `nomenklatur` VALUES ('21501035', 'Pesawat Sinar-X, Mammografi', NULL);
INSERT INTO `nomenklatur` VALUES ('21501037', 'Pesawat Sinar-X, X-Ray Mobile Digital', NULL);
INSERT INTO `nomenklatur` VALUES ('21501065', 'Pesawat Sinar-X, C-Arm', NULL);
INSERT INTO `nomenklatur` VALUES ('21501068', 'CT-Scan 64 Slices', NULL);
INSERT INTO `nomenklatur` VALUES ('21501072', 'Pesawat Sinar-X, Radiographic System, Digital (DR)', NULL);
INSERT INTO `nomenklatur` VALUES ('21603016', 'Cryosurgical Unit & Accessories', NULL);
INSERT INTO `nomenklatur` VALUES ('21603019', 'Electrosurgical Unit (ESU)', NULL);
INSERT INTO `nomenklatur` VALUES ('21603031', 'Lampu Operasi (Ceyling Type)', NULL);
INSERT INTO `nomenklatur` VALUES ('21603063', 'Microsurgery w/ Dermatome', NULL);
INSERT INTO `nomenklatur` VALUES ('21603064', 'Rectosigmoidoscopy', NULL);
INSERT INTO `nomenklatur` VALUES ('21603065', 'Colonoscopy', NULL);
INSERT INTO `nomenklatur` VALUES ('21603066', 'Gastroscopy', NULL);
INSERT INTO `nomenklatur` VALUES ('21603070', 'Laser CO2', NULL);
INSERT INTO `nomenklatur` VALUES ('21603071', 'Dioda Laser Surgical', NULL);
INSERT INTO `nomenklatur` VALUES ('21603075', 'Laparoscopy', NULL);
INSERT INTO `nomenklatur` VALUES ('21701026', 'Autopsy Table', NULL);
INSERT INTO `nomenklatur` VALUES ('21701030', 'Refrigerated Mortuary Cabinet', NULL);
INSERT INTO `nomenklatur` VALUES ('21701043', 'Laser Nd YAG', NULL);
INSERT INTO `nomenklatur` VALUES ('21702035', 'Komputer & Printer', NULL);
INSERT INTO `nomenklatur` VALUES ('31302058', 'Caspar Microlumbar Discectomy', NULL);

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_category` enum('WhatsApp','Telegram') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_alamat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_pesan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_created_at` datetime NULL DEFAULT NULL,
  `notification_created_by` int(11) NULL DEFAULT NULL,
  `notification_updated_at` datetime NULL DEFAULT NULL,
  `notification_updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_tanggal` date NULL DEFAULT NULL,
  `notification_status` enum('Ambil','Proses','Selesai') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_response` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_gambar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (108, NULL, 'teknisi', '8271064825', 'PEKERJAAN SELESAI\r\n\r\nTeknisi : teknisi\r\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\r\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\r\nRuangan : Bangsal Anak\r\nSelesai : http://asset.test/admin/aplikasi/default/tiket_teknisi/code/6a0b40a4-dc78-4094-a088-e307509f07e6', '2025-11-27 20:28:58', 508, '2025-11-27 20:28:56', '508', '2025-11-27', 'Selesai', '{\"message_id\":79,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":8271064825,\"first_name\":\"toni\",\"username\":\"tonijambo\",\"type\":\"private\"},\"date\":1764250136,\"text\":\"PEKERJAAN SELESAI\\n\\nTeknisi : teknisi\\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : http:\\/\\/asset.test\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/6a0b40a4-dc78-4094-a088-e307509f07e6\",\"entities\":[{\"offset\":184,\"length\":96,\"type\":\"url\"}],\"link_preview_options\":{\"url\":\"http:\\/\\/asset.test\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/6a0b40a4-dc78-4094-a088-e307509f07e6\"}}', NULL);
INSERT INTO `notification` VALUES (109, NULL, 'teknisi', '843133427', 'PEKERJAAN SELESAI\r\n\r\nTeknisi : teknisi\r\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\r\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\r\nRuangan : Bangsal Anak\r\nSelesai : http://asset.test/admin/aplikasi/default/tiket_teknisi/code/6a0b40a4-dc78-4094-a088-e307509f07e6', '2025-11-27 20:28:58', 508, '2025-11-27 20:29:01', '508', '2025-11-27', 'Selesai', '{\"message_id\":80,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1764250141,\"text\":\"PEKERJAAN SELESAI\\n\\nTeknisi : teknisi\\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : http:\\/\\/asset.test\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/6a0b40a4-dc78-4094-a088-e307509f07e6\",\"entities\":[{\"offset\":184,\"length\":96,\"type\":\"url\"}]}', NULL);
INSERT INTO `notification` VALUES (110, NULL, 'teknisi', '8271064825', 'APPROVAL PEKERJAAN\r\n\r\nTeknisi : teknisi\r\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\r\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\r\nRuangan : Bangsal Anak\r\nSelesai : http://asset.test/admin/aplikasi/default/tiket_teknisi/code/6a0b40a4-dc78-4094-a088-e307509f07e6', '2025-11-27 20:49:44', 508, '2025-11-27 20:49:42', '508', '2025-11-27', 'Selesai', '{\"message_id\":81,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":8271064825,\"first_name\":\"toni\",\"username\":\"tonijambo\",\"type\":\"private\"},\"date\":1764251382,\"text\":\"APPROVAL PEKERJAAN\\n\\nTeknisi : teknisi\\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : http:\\/\\/asset.test\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/6a0b40a4-dc78-4094-a088-e307509f07e6\",\"entities\":[{\"offset\":185,\"length\":96,\"type\":\"url\"}]}', NULL);
INSERT INTO `notification` VALUES (111, NULL, 'teknisi', '843133427', 'APPROVAL PEKERJAAN\r\n\r\nTeknisi : teknisi\r\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\r\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\r\nRuangan : Bangsal Anak\r\nSelesai : http://asset.test/admin/aplikasi/default/tiket_teknisi/code/6a0b40a4-dc78-4094-a088-e307509f07e6', '2025-11-27 20:49:44', 508, '2025-11-27 20:49:47', '508', '2025-11-27', 'Selesai', '{\"message_id\":82,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1764251387,\"text\":\"APPROVAL PEKERJAAN\\n\\nTeknisi : teknisi\\nTiket : 6a0b40a4-dc78-4094-a088-e307509f07e6\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : http:\\/\\/asset.test\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/6a0b40a4-dc78-4094-a088-e307509f07e6\",\"entities\":[{\"offset\":185,\"length\":96,\"type\":\"url\"}]}', NULL);
INSERT INTO `notification` VALUES (112, 'Telegram', 'User', '8271064825', 'Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nLokasi : Bangsal Anak\nKeterangan : testing keluhan\n\nLink : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:55:47', 505, '2025-11-29 09:55:52', '505', '2025-11-29', 'Selesai', '{\"message_id\":83,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":8271064825,\"first_name\":\"toni\",\"username\":\"tonijambo\",\"type\":\"private\"},\"date\":1764384952,\"photo\":[{\"file_id\":\"AgACAgUAAxkDAANTaSpgt4WRD04wNia8HX8v3tZ9uOQAAuYPaxvLtlFVL28pA2Tpp8ABAAMCAANzAAM2BA\",\"file_unique_id\":\"AQAD5g9rG8u2UVV4\",\"file_size\":1474,\"width\":90,\"height\":68},{\"file_id\":\"AgACAgUAAxkDAANTaSpgt4WRD04wNia8HX8v3tZ9uOQAAuYPaxvLtlFVL28pA2Tpp8ABAAMCAANtAAM2BA\",\"file_unique_id\":\"AQAD5g9rG8u2UVVy\",\"file_size\":9436,\"width\":300,\"height\":226}],\"caption\":\"Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nLokasi : Bangsal Anak\\nKeterangan : testing keluhan\\n\\nLink : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"caption_entities\":[{\"offset\":173,\"length\":107,\"type\":\"url\"}]}', 'https://rsambkt.elsycalitech.co.id/storage/files/tiket/1764384947.jpg');
INSERT INTO `notification` VALUES (113, 'Telegram', 'Itok toni laksono', '843133427', 'Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nLokasi : Bangsal Anak\nKeterangan : testing keluhan\n\nLink : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:55:47', 3, '2025-11-29 09:55:54', '3', '2025-11-29', 'Selesai', '{\"message_id\":84,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1764384954,\"photo\":[{\"file_id\":\"AgACAgUAAxkDAANTaSpgt4WRD04wNia8HX8v3tZ9uOQAAuYPaxvLtlFVL28pA2Tpp8ABAAMCAANzAAM2BA\",\"file_unique_id\":\"AQAD5g9rG8u2UVV4\",\"file_size\":1474,\"width\":90,\"height\":68},{\"file_id\":\"AgACAgUAAxkDAANTaSpgt4WRD04wNia8HX8v3tZ9uOQAAuYPaxvLtlFVL28pA2Tpp8ABAAMCAANtAAM2BA\",\"file_unique_id\":\"AQAD5g9rG8u2UVVy\",\"file_size\":9436,\"width\":300,\"height\":226}],\"caption\":\"Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nLokasi : Bangsal Anak\\nKeterangan : testing keluhan\\n\\nLink : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"caption_entities\":[{\"offset\":173,\"length\":107,\"type\":\"url\"}]}', 'https://rsambkt.elsycalitech.co.id/storage/files/tiket/1764384947.jpg');
INSERT INTO `notification` VALUES (114, 'Telegram', 'Ady Sunanto', '79417929', 'Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nLokasi : Bangsal Anak\nKeterangan : testing keluhan\n\nLink : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:55:47', 502, '2025-11-29 09:55:58', '502', '2025-11-29', 'Selesai', 'Bad Request: chat not found', 'https://rsambkt.elsycalitech.co.id/storage/files/tiket/1764384947.jpg');
INSERT INTO `notification` VALUES (115, 'Telegram', 'Farizal Elsyahfi', '6634742831', 'Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nLokasi : Bangsal Anak\nKeterangan : testing keluhan\n\nLink : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:55:47', 507, '2025-11-29 09:56:01', '507', '2025-11-29', 'Selesai', 'Bad Request: chat not found', 'https://rsambkt.elsycalitech.co.id/storage/files/tiket/1764384947.jpg');
INSERT INTO `notification` VALUES (116, 'Telegram', 'teknisi', '843133427', 'Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nLokasi : Bangsal Anak\nKeterangan : testing keluhan\n\nLink : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:55:47', 508, '2025-11-29 09:56:03', '508', '2025-11-29', 'Selesai', '{\"message_id\":85,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1764384963,\"photo\":[{\"file_id\":\"AgACAgUAAxkDAANTaSpgt4WRD04wNia8HX8v3tZ9uOQAAuYPaxvLtlFVL28pA2Tpp8ABAAMCAANzAAM2BA\",\"file_unique_id\":\"AQAD5g9rG8u2UVV4\",\"file_size\":1474,\"width\":90,\"height\":68},{\"file_id\":\"AgACAgUAAxkDAANTaSpgt4WRD04wNia8HX8v3tZ9uOQAAuYPaxvLtlFVL28pA2Tpp8ABAAMCAANtAAM2BA\",\"file_unique_id\":\"AQAD5g9rG8u2UVVy\",\"file_size\":9436,\"width\":300,\"height\":226}],\"caption\":\"Tiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nLokasi : Bangsal Anak\\nKeterangan : testing keluhan\\n\\nLink : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"caption_entities\":[{\"offset\":173,\"length\":107,\"type\":\"url\"}]}', 'https://rsambkt.elsycalitech.co.id/storage/files/tiket/1764384947.jpg');
INSERT INTO `notification` VALUES (117, NULL, 'teknisi', '8271064825', 'APPROVAL PEKERJAAN\n\nTeknisi : teknisi\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nRuangan : Bangsal Anak\nSelesai : https://rsambkt.elsycalitech.co.id/admin/aplikasi/default/tiket_teknisi/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:58:20', 508, '2025-11-29 09:58:21', '508', '2025-11-29', 'Selesai', '{\"message_id\":86,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":8271064825,\"first_name\":\"toni\",\"username\":\"tonijambo\",\"type\":\"private\"},\"date\":1764385101,\"text\":\"APPROVAL PEKERJAAN\\n\\nTeknisi : teknisi\\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"entities\":[{\"offset\":185,\"length\":113,\"type\":\"url\"}],\"link_preview_options\":{\"url\":\"https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\"}}', NULL);
INSERT INTO `notification` VALUES (118, NULL, 'teknisi', '843133427', 'APPROVAL PEKERJAAN\n\nTeknisi : teknisi\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nRuangan : Bangsal Anak\nSelesai : https://rsambkt.elsycalitech.co.id/admin/aplikasi/default/tiket_teknisi/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:58:20', 508, '2025-11-29 09:58:24', '508', '2025-11-29', 'Selesai', '{\"message_id\":87,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1764385104,\"text\":\"APPROVAL PEKERJAAN\\n\\nTeknisi : teknisi\\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"entities\":[{\"offset\":185,\"length\":113,\"type\":\"url\"}],\"link_preview_options\":{\"url\":\"https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/aplikasi\\/default\\/tiket_teknisi\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\"}}', NULL);
INSERT INTO `notification` VALUES (119, NULL, 'teknisi', '8271064825', 'PEKERJAAN SELESAI\n\nTeknisi : teknisi\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nRuangan : Bangsal Anak\nSelesai : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:59:31', 505, '2025-11-29 09:59:34', '505', '2025-11-29', 'Selesai', '{\"message_id\":88,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":8271064825,\"first_name\":\"toni\",\"username\":\"tonijambo\",\"type\":\"private\"},\"date\":1764385173,\"text\":\"PEKERJAAN SELESAI\\n\\nTeknisi : teknisi\\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"entities\":[{\"offset\":184,\"length\":107,\"type\":\"url\"}],\"link_preview_options\":{\"url\":\"https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\"}}', NULL);
INSERT INTO `notification` VALUES (120, NULL, 'teknisi', '843133427', 'PEKERJAAN SELESAI\n\nTeknisi : teknisi\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\nRuangan : Bangsal Anak\nSelesai : https://rsambkt.elsycalitech.co.id/admin/tiket/default/tiket_user/code/09398442-7aac-4841-bc8c-5c6581cbdf13', '2025-11-29 09:59:31', 505, '2025-11-29 09:59:37', '505', '2025-11-29', 'Selesai', '{\"message_id\":89,\"from\":{\"id\":8398783819,\"is_bot\":true,\"first_name\":\"Asset Management ECM\",\"username\":\"ecm_asset_bot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1764385176,\"text\":\"PEKERJAAN SELESAI\\n\\nTeknisi : teknisi\\nTiket : 09398442-7aac-4841-bc8c-5c6581cbdf13\\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688\\nRuangan : Bangsal Anak\\nSelesai : https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\",\"entities\":[{\"offset\":184,\"length\":107,\"type\":\"url\"}],\"link_preview_options\":{\"url\":\"https:\\/\\/rsambkt.elsycalitech.co.id\\/admin\\/tiket\\/default\\/tiket_user\\/code\\/09398442-7aac-4841-bc8c-5c6581cbdf13\"}}', NULL);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('08f8a898-6451-4035-b35f-bfc33fd3f0fc', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:54', '2025-02-17 17:25:56', '2025-05-22 11:13:54');
INSERT INTO `notifications` VALUES ('2e987df2-1cc8-4b6c-a646-1acd29509c97', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:58', '2025-02-17 14:48:36', '2025-05-22 11:13:58');
INSERT INTO `notifications` VALUES ('32eeb584-a1cc-4e6c-951e-b8babd25a4a8', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:57', '2025-02-17 16:50:50', '2025-05-22 11:13:57');
INSERT INTO `notifications` VALUES ('343856eb-593b-4e56-a428-28121dad6a79', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:55', '2025-02-17 17:22:47', '2025-05-22 11:13:55');
INSERT INTO `notifications` VALUES ('425de696-2950-4d51-8c1b-0d26bae30cec', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:57', '2025-02-17 17:11:14', '2025-05-22 11:13:57');
INSERT INTO `notifications` VALUES ('757fe58c-82f4-4678-a94f-93df3daa38d0', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:52', '2025-02-17 17:39:58', '2025-05-22 11:13:52');
INSERT INTO `notifications` VALUES ('76fa0faf-622c-4e2b-a364-dd71d3444087', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:53', '2025-02-17 17:34:42', '2025-05-22 11:13:53');
INSERT INTO `notifications` VALUES ('a4257e1c-7bee-4c17-9171-6918ae017760', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:56', '2025-02-17 17:21:21', '2025-05-22 11:13:56');
INSERT INTO `notifications` VALUES ('a52360ae-fd15-4190-b1af-d5c4aee7ab9c', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:56', '2025-02-17 17:21:18', '2025-05-22 11:13:56');
INSERT INTO `notifications` VALUES ('a93416a7-816f-41ea-9b5f-0e63e2deeee0', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:54', '2025-02-17 17:26:50', '2025-05-22 11:13:54');
INSERT INTO `notifications` VALUES ('be0a0fa7-7eca-4f70-85ef-4d9491bd43ac', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:58', '2025-02-17 16:42:14', '2025-05-22 11:13:58');
INSERT INTO `notifications` VALUES ('cf90ed1b-2b24-4b71-8562-5ff41408b1bf', 'MBarlow\\Megaphone\\Types\\Important', 'App\\Dao\\Models\\Core\\User', 3, '{\"title\":\"Telegram\",\"body\":\"Pendaftaran Telegram Berhasil\",\"link\":\"\",\"linkText\":\"\"}', '2025-05-22 11:13:54', '2025-02-17 17:25:57', '2025-05-22 11:13:54');
INSERT INTO `notifications` VALUES ('ea586494-9342-4e36-a45b-f24fb8047353', 'MBarlow\\Megaphone\\Types\\NewFeature', 'App\\Dao\\Models\\Core\\User', 1, '{\"title\":\"Download File Success\",\"body\":\"File Ready to download\",\"link\":\"http:\\/\\/newcore.test\\/files\\/export\\/report_rekap_kotor-2024-10-21-12-37-28.csv\",\"linkText\":\"Download\"}', '2025-02-20 20:09:53', '2024-10-21 12:38:21', '2025-02-20 20:09:53');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for penamaan
-- ----------------------------
DROP TABLE IF EXISTS `penamaan`;
CREATE TABLE `penamaan`  (
  `penamaan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `penamaan_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `penamaan_gambar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `penamaan_code_nomenklatur` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `penamaan_id_satuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `penamaan_id_category` bigint(20) NULL DEFAULT NULL,
  `penamaan_tech` enum('SEDERHANA','MENENGAH','TINGGI') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `penamaan_keterangan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `penamaan_angka_fungsi` int(11) NULL DEFAULT NULL,
  `penamaan_angka_aplikasi` int(11) NULL DEFAULT NULL,
  `penamaan_angka_maintenance` int(11) NULL DEFAULT NULL,
  `penamaan_kalibrasi` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`penamaan_id`) USING BTREE,
  UNIQUE INDEX `model_nama`(`penamaan_nama`) USING BTREE,
  INDEX `model_id`(`penamaan_id`) USING BTREE,
  INDEX `penamaan_id_category`(`penamaan_id_category`) USING BTREE,
  INDEX `penamaan_id_satuan`(`penamaan_id_satuan`) USING BTREE,
  CONSTRAINT `penamaan_ibfk_3` FOREIGN KEY (`penamaan_id_category`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penamaan_ibfk_4` FOREIGN KEY (`penamaan_id_satuan`) REFERENCES `satuan` (`satuan_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1199 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penamaan
-- ----------------------------
INSERT INTO `penamaan` VALUES (860, 'Acupunture Therapy/Electro Acupuncture (EAT)', '1740057723.jpg', '21403038', NULL, 1, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (861, 'Agregometer', '1740056436.jpg', '20205019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes');
INSERT INTO `penamaan` VALUES (862, 'Air Warming Blanket', '1740062317.jpg', '20903115', 'SET', 1, 'MENENGAH', NULL, 8, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (866, 'Alat Pengukur Lingkar Pinggang (Metline)', NULL, '10903161', NULL, 2, NULL, NULL, 6, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (867, 'Alat Pengukur Panjang Bayi', '1740063332.webp', '10903152', NULL, 2, NULL, NULL, 6, 1, 1, 'Yes');
INSERT INTO `penamaan` VALUES (868, 'Ambulatoir & Hospital Blood Pressure Monitoring (ABPM & HBPM)', '1740062475.jpg', '10901035', NULL, 1, NULL, NULL, 6, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (869, 'Analisa Hb (POCT Methode)', '1740062532.jpg', '20205017', NULL, 3, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (870, 'Analytical Balance', '1740062599.jpg', '10203018', NULL, 3, NULL, NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (871, 'Anesthetic Vaporizer', '1740062682.jpg', '20403068', NULL, 1, NULL, NULL, 10, 5, 4, 'Yes');
INSERT INTO `penamaan` VALUES (872, 'Antidecubitus Matras', '1740062754.jpg', '10902018', 'SET', 1, 'SEDERHANA', NULL, 8, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (873, 'Audiometer', '1740062823.jpg', '20701001', 'SET', 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (874, 'Autoclave Kering', '1740062887.jpg', '20903037', 'UNIT', 1, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (875, 'Autoclave Table Top', '1740062948.webp', '20903102', 'UNIT', 1, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (876, 'Automated Blood Cell Separator', '1740063023.jpg', '20209011', 'UNIT', 3, 'TINGGI', NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (877, 'Automated Blood Culture System', '1740063102.jpg', '21702064', 'UNIT', 3, 'TINGGI', NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (878, 'Automated Cell Counter', '1740063160.jpg', '20205001', 'UNIT', 3, 'MENENGAH', NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (879, 'Automated Colony Counter', '1740063221.jpg', '10302004', NULL, 3, 'MENENGAH', NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (880, 'Automated External Defibrilator (AED) system', '1740063393.jpg', '20505008', 'UNIT', 1, 'MENENGAH', NULL, 10, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (881, 'Automated Hematocrit Instrument', '1740063448.png', '20205009', NULL, 3, 'TINGGI', NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (882, 'Automated Hemoglobin System', '1740063650.jpg', '20205010', NULL, 3, NULL, NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (883, 'Automated Platelet Aggregation System', '1740063726.webp', '20205012', NULL, 3, NULL, NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (884, 'Automated Tissue Processor', '1740063780.jpg', '10203008', NULL, 3, 'MENENGAH', NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (885, 'Automated Urinalysis System', '1740063850.png', '10102028', NULL, 3, NULL, NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (886, 'Automatic Film Processor', '1740063933.jpg', '21501051', NULL, 1, NULL, NULL, 2, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (887, 'Automatic Staining Machine', '1740578884.png', '10203036', NULL, 3, NULL, NULL, 4, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (888, 'Automatic Tissue Processing', '1740578935.png', '10203034', 'UNIT', 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (889, 'Autopsy Table', '1740578992.png', '21701026', 'UNIT', 1, NULL, NULL, 4, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (890, 'Autorefraktometer', '1740579138.jpg', '21201006', NULL, 1, NULL, NULL, 1, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (891, 'Autotransfusion Apparatus', '1740579241.jpg', '20403065', NULL, 1, NULL, NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (892, 'Bath Whirl Pool', '1740579312.jpg', '21403040', NULL, 1, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (893, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor', '1740056722.jpg', '10901002', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (894, 'Bilirubin In  Vitro (POCT Methode)', '1740579545.jpg', '10101019', NULL, 3, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (895, 'Bilirubinmeter', '1740579622.png', '20101018', NULL, 3, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (896, 'Bioelectrical Impedance Analysis (BIA)', '1740579691.webp', '10901034', NULL, 1, NULL, NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (897, 'Biometer A-scan', '1740579750.jpg', '21201074', NULL, 1, NULL, NULL, NULL, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (898, 'Biosafety Cabinet', '1740579837.jpg', '10203050', NULL, 3, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (899, 'Biosafety Cabinet (BSC) Class II Type A2', '1740579908.jpg', '10203024', NULL, 3, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (900, 'Biosafety Cabinet (BSC) Class II Type B2', '1740579962.jpg', '10203043', NULL, 3, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (901, 'Blood & Plasma Warming Device/Blood Solution Warmer', '1740580064.jpg', '20209009', NULL, 1, NULL, NULL, 5, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (902, 'Blood Bank Refrigerator', '1740580115.jpg', '200109', NULL, 3, NULL, NULL, 2, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (903, 'Blood Freezer', NULL, '200209', NULL, 3, NULL, NULL, 2, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (904, 'Blood Gas Analyzer (BGA/AGD)', NULL, '10401036', NULL, 3, NULL, NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (905, 'Blood Storage Refrigerator & Blood Storage Freezer', NULL, '20209021', NULL, 3, NULL, NULL, 2, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (906, 'Blood Volume Measuring Device', NULL, '20205015', NULL, 3, NULL, NULL, 2, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (907, 'Body Fat Analyzer', NULL, '10101156', NULL, 1, NULL, NULL, 7, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (908, 'Boor Ortopedi', NULL, '11303030', NULL, 1, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (909, 'Boor, electric', NULL, '11303031', NULL, 1, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (910, 'Brachiterapy', NULL, '21502015', NULL, 4, NULL, NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (911, 'Brain Evoke Respon Audiometer (BERA/ABR)', NULL, '10704008', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (912, 'Brainmaping 32 Channels', NULL, '11001037', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (913, 'Cardiotocograph (CTG)', NULL, '20502039', NULL, 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (914, 'Caspar Microlumbar Discectomy', NULL, '31302058', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (915, 'Central Monitor', NULL, '20901015', NULL, 1, NULL, NULL, 7, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (916, 'Centrifuge, Blood Bank Centrifuge for IVD use', NULL, '10209012', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (917, 'Centrifuge, Cyto Centrifuge', NULL, '10203004', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (918, 'Centrifuge, Cyto Spin Centrifuge', NULL, '10203033', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (919, 'Centrifuge, Hematokrit Centrifuge', NULL, '10205015', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (920, 'Centrifuge, Low Speed Centrifuge (Darah & Urin)', NULL, '10102003', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (921, 'Centrifuge, Microcentrifuge', NULL, '20101159', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (922, 'Centrifuge, Refrigerated Centrifuge', NULL, '10302037', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (923, 'Centrifuge, Ultracentrifuge', NULL, '20101161', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (924, 'Chart Projector', NULL, '21201090', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (925, 'Clinical Chemistry Analyzer', NULL, '10102050', NULL, 3, NULL, NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (926, 'Coagulation Instrument', NULL, '20205007', NULL, 3, NULL, NULL, 5, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (927, 'Cobal Unit', NULL, '21502014', NULL, 4, NULL, NULL, 10, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (928, 'Colonoscopy', NULL, '21603065', NULL, 1, NULL, NULL, 7, 4, 0, NULL);
INSERT INTO `penamaan` VALUES (929, 'Compression Therapy', NULL, '21403037', NULL, 1, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (930, 'Continuous positive airway pressure (CPAP)', NULL, '20403075', NULL, 1, NULL, NULL, 10, 5, 4, 'Yes');
INSERT INTO `penamaan` VALUES (931, 'Cryophthalmic Unit', NULL, '21203005', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (932, 'Cryostat', NULL, '10302032', NULL, 3, NULL, NULL, 4, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (933, 'Cryosurgical Unit & Accessories', NULL, '21603016', NULL, 1, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (934, 'CT-Scan 128 Slices', '1740064680.jpg', '21501069', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (935, 'CT-Scan 16 Slices', '1740064748.jpg', '21501066', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (936, 'CT-Scan 256 Slices', '1740065004.jpg', '21501070', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (937, 'CT-Scan 32 Slices', '1740065046.jpg', '21501067', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (938, 'CT-Scan 512 slice', '1740065081.jpg', '21501077', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (939, 'CT-Scan 64 Slices', '1740065112.jpg', '21501068', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (940, 'CT-Scan 8 Slices', '1740065146.jpg', '21501080', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (941, 'CT-Scan Single Slices', '1740064835.webp', '21501081', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (942, 'Defibrilator', NULL, '20505007', NULL, 1, 'MENENGAH', NULL, 10, 5, 3, 'Yes');
INSERT INTO `penamaan` VALUES (943, 'Densitometer', NULL, '20501027', NULL, 1, NULL, NULL, 7, 3, 5, 'Yes');
INSERT INTO `penamaan` VALUES (944, 'Dental Unit', '1740070449.jpg', '10605017', 'SET', 1, 'MENENGAH', NULL, 7, 3, 5, 'Yes');
INSERT INTO `penamaan` VALUES (945, 'Dioda Laser Surgical', NULL, '21603071', NULL, 4, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (946, 'Echocardiograph', NULL, '20502008', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (947, 'Electric Bed Patient', NULL, '20902005', NULL, 1, NULL, NULL, 2, 2, 4, NULL);
INSERT INTO `penamaan` VALUES (948, 'Electro Convulsion Therapy (ECT)', NULL, '11403038', NULL, 1, NULL, NULL, 10, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (949, 'Electro Stimulation & Analgesia', NULL, '21403048', NULL, 1, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (950, 'Electrocardiograph (ECG/EKG) Monitor', '1740060841.jpg', '20502037', NULL, 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (951, 'Electroencephalograph (EEG)', NULL, '21001011', NULL, 1, 'TINGGI', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (952, 'Electrolyte Analyzer', NULL, '20102020', NULL, 3, NULL, NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (953, 'Electromyograph (EMG)', NULL, '21401003', NULL, 1, 'TINGGI', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (954, 'Electrosurgical Unit (ESU)', NULL, '21603019', NULL, 1, 'TINGGI', NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (955, 'Elektric Scaler', NULL, '10102035', NULL, 1, NULL, NULL, 8, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (956, 'Elektroretinogram (ERG)', NULL, '21201082', NULL, 1, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (957, 'Embedding Center', NULL, '10203038', NULL, 3, NULL, NULL, 4, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (958, 'Endolaser Unit', NULL, '21203038', NULL, 4, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (959, 'Endoscopy', NULL, '20801004', NULL, 1, NULL, NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (960, 'Endoscopy THT', NULL, '20703028', NULL, 1, NULL, NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (961, 'Endoscopy, Lightsource', NULL, '20804017', NULL, 1, NULL, NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (962, 'Endoscopy, Video Monitor', NULL, '20801009', NULL, 1, NULL, NULL, 7, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (963, 'ENT Examination Instrument Set', NULL, '20701025', NULL, 1, NULL, NULL, 7, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (964, 'Ergocycle', NULL, '21403055', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (965, 'Examination Light/Examination Lamp/Lampu Periksa/Hanging Lamp', NULL, '10903021', NULL, 1, NULL, NULL, 7, 1, 1, 'Yes');
INSERT INTO `penamaan` VALUES (966, 'Exercise Bicycle', NULL, '21403047', NULL, 1, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (967, 'Extracorporeal Shock Wave Lithotripsy (ESWL)', NULL, '20805034', NULL, 4, NULL, NULL, 10, 4, 5, 'Yes');
INSERT INTO `penamaan` VALUES (968, 'Extracorporeal Shock Wave Treatment', NULL, '21403068', NULL, 4, NULL, NULL, 10, 4, 5, 'Yes');
INSERT INTO `penamaan` VALUES (969, 'Fakoemulsifikasi Unit', NULL, '21203030', NULL, NULL, NULL, NULL, 0, 0, 0, 'Yes');
INSERT INTO `penamaan` VALUES (970, 'Faradic-Galvanic Therapy', NULL, '21403036', NULL, NULL, NULL, NULL, 10, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (971, 'Fetal Doppler', NULL, '21102006', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (972, 'Fibroscan', NULL, '21501079', NULL, 1, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (973, 'Film Dryer', NULL, '11503007', NULL, 1, NULL, NULL, 2, 1, 4, NULL);
INSERT INTO `penamaan` VALUES (974, 'FLow Cytometri (FCM)', NULL, '20205018', NULL, 3, NULL, NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (975, 'FLowmeter Oksigen', NULL, '20903119', NULL, 1, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (976, 'Fluorometer for Clinical use', NULL, '10102018', NULL, NULL, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (977, 'Freezer', NULL, '1801075', NULL, 3, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (978, 'Fully Motorize Rotary Microtome', NULL, '10302033', NULL, 3, NULL, NULL, 4, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (979, 'Fume Hood/Lemari Asam', NULL, '10203048', NULL, 3, NULL, NULL, 2, 1, 4, 'No');
INSERT INTO `penamaan` VALUES (980, 'Fundus Camera + FFA', NULL, '21201077', NULL, 1, NULL, NULL, 7, 2, 4, NULL);
INSERT INTO `penamaan` VALUES (981, 'Furnace Mufle', NULL, '1801028', NULL, 3, NULL, NULL, 2, 1, 4, NULL);
INSERT INTO `penamaan` VALUES (982, 'Gamma Camera/Kamera Gamma/Scintillation (gamma) Camera', NULL, '11501002', NULL, NULL, NULL, NULL, 10, 4, 5, NULL);
INSERT INTO `penamaan` VALUES (983, 'Gastroscopy', NULL, '21603066', NULL, 1, NULL, NULL, 7, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (984, 'Glukometer', NULL, '10901022', NULL, 3, NULL, NULL, 5, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (985, 'Handgrip Streght Dynamometer', NULL, '11401015', NULL, NULL, NULL, NULL, 7, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (986, 'Hematology Analyzer', NULL, '20205002', NULL, 3, NULL, NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (987, 'Hemodialisa', NULL, '20805022', NULL, NULL, NULL, NULL, 10, 5, 5, NULL);
INSERT INTO `penamaan` VALUES (988, 'Hemoglobin Meter', NULL, '200101', NULL, 3, NULL, NULL, 5, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (989, 'Hidro Therapy', NULL, '21403039', NULL, NULL, NULL, NULL, 8, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (990, 'High Flow Nasal Cannula (HFNC)', NULL, '30403081', NULL, NULL, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (991, 'Holter Monitor', NULL, '20502038', NULL, 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (992, 'Hot Plate', NULL, '10203041', NULL, 3, NULL, NULL, 4, 1, 4, NULL);
INSERT INTO `penamaan` VALUES (993, 'Humidifier', NULL, '20403031', NULL, NULL, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (994, 'Hygrometer', NULL, '20903098', NULL, NULL, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (995, 'Hyperbaric Chamber', NULL, '20403033', NULL, NULL, NULL, NULL, 10, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (996, 'ICU Bed Electric', NULL, '20902045', NULL, NULL, NULL, NULL, 2, 2, 4, NULL);
INSERT INTO `penamaan` VALUES (997, 'ID Printer/Camera; Marker Radiografi; Marker Timbal/Radiographic Film Marking System', NULL, '11501029', NULL, NULL, NULL, NULL, 3, 1, 1, 'No');
INSERT INTO `penamaan` VALUES (998, 'Imunohistokimia (IHK) Set', NULL, '10302030', NULL, 3, NULL, NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (999, 'Imunologi Analyzer', NULL, '20304008', NULL, 3, NULL, NULL, 5, 3, 4, NULL);
INSERT INTO `penamaan` VALUES (1000, 'Incenerator', NULL, '21702048', NULL, NULL, NULL, NULL, 1, 1, 5, 'No');
INSERT INTO `penamaan` VALUES (1001, 'Inclinometer', NULL, '11401014', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (1002, 'Infant Warmer', NULL, '20902008', NULL, NULL, NULL, NULL, 10, 5, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1003, 'Infrared Lamp', NULL, '21403019', NULL, NULL, NULL, NULL, 8, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (1004, 'Infusion Pump', '1740056553.png', '20902035', NULL, 1, 'MENENGAH', NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1005, 'Inkubator Bayi', NULL, '20902018', NULL, 1, 'MENENGAH', NULL, 10, 5, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1006, 'Inkubator Bayi Transpor', NULL, '20902019', NULL, 1, 'MENENGAH', NULL, 10, 5, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1007, 'Inkubator CO2', NULL, '1801035', NULL, 3, NULL, NULL, 5, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1008, 'Instalasi Pengolahan Air Limbah (IPAL)', NULL, '21702047', NULL, 5, NULL, NULL, 1, 1, 5, 'No');
INSERT INTO `penamaan` VALUES (1009, 'Intra-Aortic Ballon Pump (IABP)', '1740061152.jpg', '20501039', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Yes');
INSERT INTO `penamaan` VALUES (1010, 'Komputer & Printer', NULL, '21702035', NULL, 5, NULL, NULL, 3, 1, 1, 'No');
INSERT INTO `penamaan` VALUES (1011, 'Kursi Roda Elektrik/Powered Wheelchair', NULL, '21402027', NULL, 2, NULL, NULL, 2, 2, 1, 'No');
INSERT INTO `penamaan` VALUES (1012, 'Laminary Air FLow (LAF)', NULL, '10205016', NULL, 3, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1013, 'Lampu Ginekolog', NULL, '11104024', NULL, NULL, NULL, NULL, 6, 1, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1014, 'Lampu Operasi (Ceyling Type)', NULL, '21603031', NULL, 1, NULL, NULL, 6, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1015, 'Lampu Operasi Kepala/Operating Head Lamp', NULL, '10903137', NULL, 1, NULL, NULL, 6, 1, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1016, 'Lampu Periksa Halogen', NULL, '10903020', NULL, 1, NULL, NULL, 6, 1, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1017, 'Laparoscopy', NULL, '21603075', NULL, 1, NULL, NULL, 7, 4, 3, NULL);
INSERT INTO `penamaan` VALUES (1018, 'Laser CO2', NULL, '21603070', NULL, 4, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (1019, 'Laser Fotocoagulasi Glaukoma Set', NULL, '21203040', NULL, 4, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (1020, 'Laser Fotocoagulasi Retina Set', NULL, '21203039', NULL, 4, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (1021, 'Laser Nd YAG', NULL, '21701043', NULL, 4, NULL, NULL, 9, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1022, 'Laser Therapy', NULL, '21105027', NULL, 4, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (1023, 'Lensmeter/Lensometer', '1740586890.jpg', '11201069', NULL, NULL, NULL, NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1024, 'LF Electro Therapy', '1740587512.jpg', '21403035', 'UNIT', NULL, 'MENENGAH', NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1025, 'Liquid Base Cytology (LBC) Automatic /Machine', '1740587637.jpg', '10302028', 'UNIT', 3, 'MENENGAH', NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1026, 'Low Laser Therapy', '1740587234.jpg', '21403070', 'UNIT', 4, 'SEDERHANA', NULL, 10, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1027, 'Magnetic Resonance Imaging (MRI) 1,5 Tesla', '1740065861.webp', '21501001', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1028, 'Magnetic Stirer w/ Hotplate', '1740587830.jpg', '1801036', 'UNIT', 3, 'SEDERHANA', NULL, 4, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1029, 'Manual Microtome', '1740587923.jpg', '10302031', 'UNIT', 3, 'SEDERHANA', NULL, 4, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1030, 'Manual Staining', '1740587325.jpg', '10203037', 'UNIT', 3, 'SEDERHANA', NULL, 4, 3, 3, 'No');
INSERT INTO `penamaan` VALUES (1031, 'Manual Tissue Processing', '1740587750.jpg', '10203035', 'UNIT', 3, 'SEDERHANA', NULL, 4, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1032, 'Mass spectrometer MALDI-TOF', '1740608795.png', '10102027', 'UNIT', 3, 'TINGGI', NULL, 4, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1033, 'Medical Saw', '1740608961.webp', '11303032', 'UNIT', 2, 'SEDERHANA', NULL, 9, 4, 3, 'No');
INSERT INTO `penamaan` VALUES (1034, 'Medical Saw, Electrical', '1740608879.jpg', '11303033', 'PCS', 1, 'SEDERHANA', NULL, 9, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1035, 'Medical Ultraviolet Water Purifier', '1740609061.jpg', '20903027', 'UNIT', 4, 'SEDERHANA', NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1036, 'Meja Operasi Electric', '1740609135.jpg', '11603050', 'UNIT', 1, 'SEDERHANA', NULL, 2, 2, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1037, 'Meja Operasi Gynecolog', '1740609208.jpg', '11603052', 'UNIT', 1, 'SEDERHANA', NULL, 2, 2, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1038, 'Meja Operasi Manual', '1740608498.jpg', '11603049', NULL, NULL, NULL, NULL, 2, 2, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1039, 'Mesin Anestesi', '1740070152.jpg', '20403078', 'UNIT', 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1040, 'Mesin Anestesi Ventilator', '1740069900.jpg', '10403081', NULL, 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1041, 'Mesin Identifikasi & Uji Kepekaan Otomatik/Microba Analyzer', '1740587143.jpg', '20301003', NULL, NULL, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1042, 'Mesin Pembaca Produk PCR/PCR Plate Reader', '1740586971.jpg', '20205023', 'UNIT', 3, 'MENENGAH', NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1043, 'Mesin Tes Cepat Molekuler (TCM)', NULL, '10302039', NULL, NULL, NULL, NULL, 5, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (1044, 'Micro Chemistry Aanalyzer for Clinical use', NULL, '10102006', NULL, NULL, NULL, NULL, 5, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1045, 'Microbiological Inkubator', NULL, '10302018', NULL, NULL, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1046, 'Microbiology Air Sampler', NULL, '1801061', NULL, NULL, NULL, NULL, 2, 1, 3, NULL);
INSERT INTO `penamaan` VALUES (1047, 'Micropipet', NULL, '10102036', NULL, NULL, NULL, NULL, 4, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1048, 'Microsurgery w/ Dermatome', NULL, '21603063', NULL, NULL, NULL, NULL, 8, 4, 2, NULL);
INSERT INTO `penamaan` VALUES (1049, 'Microwave Ablation (MWA)', NULL, '21604007', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (1050, 'Microwave Diathermy (MWD)', NULL, '21403011', NULL, NULL, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1051, 'Mikroskop Binocular', NULL, '10203010', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1052, 'Mikroskop Cahaya', NULL, '10203013', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1053, 'Mikroskop Double Head', NULL, '10203011', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1054, 'Mikroskop Elektron', NULL, '10203006', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1055, 'Mikroskop Fluoresens', NULL, '10203012', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1056, 'Mikroskop Imunofluoresence', NULL, '10203029', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1057, 'Mikroskop Inverte', NULL, '1801040', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1058, 'Mikroskop Klinis PA', NULL, '10203009', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1059, 'Mikroskop Operasi', NULL, '11603038', NULL, NULL, NULL, NULL, 7, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1060, 'Mikroskop Spekular', NULL, '21201087', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1061, 'Mikroskop Stereo', NULL, '10203019', NULL, NULL, NULL, NULL, 5, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1062, 'Monitor for Laparoscopy', NULL, '11603063', NULL, NULL, NULL, NULL, 7, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1063, 'Nebulizer', NULL, '20403044', NULL, NULL, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1064, 'Nebulizer Jet', NULL, '10403086', NULL, NULL, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1065, 'Nebulizer Ultrasound', NULL, '10403087', NULL, NULL, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1066, 'Non-Incenerator', NULL, '21702049', NULL, 5, NULL, NULL, 1, 1, 3, NULL);
INSERT INTO `penamaan` VALUES (1067, 'Ophthalmic laser', NULL, '21203016', NULL, 4, NULL, NULL, 9, 4, 4, NULL);
INSERT INTO `penamaan` VALUES (1068, 'Opthalmic Camera', NULL, '21201005', NULL, NULL, NULL, NULL, 7, 1, 0, NULL);
INSERT INTO `penamaan` VALUES (1069, 'Optical Coherent Tomography (OCT)', NULL, '21201078', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (1070, 'Oven', NULL, '10203021', NULL, NULL, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1071, 'Oven Inkubator', NULL, '1801084', NULL, NULL, NULL, NULL, 2, 1, 3, 'No');
INSERT INTO `penamaan` VALUES (1072, 'Oxygen Concentrator/Portable Oxygen Generator', '1740070521.webp', '20403030', 'UNIT', 1, 'MENENGAH', NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1073, 'Oxygen Set + Flowmeter', NULL, '10403084', NULL, NULL, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1074, 'Pacemaker', NULL, '20503024', NULL, 1, 'MENENGAH', NULL, 10, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1075, 'Parafin Bath', NULL, '21403003', NULL, NULL, NULL, NULL, 8, 4, 0, NULL);
INSERT INTO `penamaan` VALUES (1076, 'Pemeriksaan Gula Darah, Kolestrol & Asam Urat ( 3 in 1)', NULL, '20101162', NULL, 3, NULL, NULL, 5, 3, 1, NULL);
INSERT INTO `penamaan` VALUES (1077, 'Pengukur lingkar kepala', NULL, '10903153', NULL, 2, NULL, NULL, 6, 3, 1, NULL);
INSERT INTO `penamaan` VALUES (1078, 'Pengukur Tinggi Badan (Microtoise, stadiometer)', NULL, '10903160', NULL, 2, NULL, NULL, 6, 3, 1, NULL);
INSERT INTO `penamaan` VALUES (1079, 'Pengukur tinggi badan anak', NULL, '10903154', NULL, 2, NULL, NULL, 6, 3, 1, NULL);
INSERT INTO `penamaan` VALUES (1080, 'Pesawat Sinar-X, C-Arm', '1740067007.jpg', '21501065', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1081, 'Pesawat Sinar-X, Computed Radiography (CR)/Cine (Spot Fluorographic X-Ray Camera)', '1740068190.jpg', '21501028', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1082, 'Pesawat Sinar-X, Dental', '1740068233.jpg', '20601007', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1083, 'Pesawat Sinar-X, Dental Panoramic', '1740068266.jpg', '20601006', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1084, 'Pesawat Sinar-X, Digital Mammography system/Pesawat Mammografi Digital', '1740068302.jpg', '21501036', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1085, 'Pesawat Sinar-X, Fluoroscopy', '1740068381.png', '21501038', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1086, 'Pesawat Sinar-X, Image-Intensified Fluoroscopic X-Ray System', '1740068416.jpg', '21501030', NULL, 4, 'TINGGI', NULL, 9, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1087, 'Pesawat Sinar-X, Mammografi', '1740068453.jpg', '21501035', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1088, 'Pesawat Sinar-X, Medical Linear Accelerator (LINAC)', '1740068500.jpg', '21502001', NULL, 4, 'TINGGI', NULL, 10, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1089, 'Pesawat Sinar-X, Multislice Computed Tomography (MSCT)', '1740068532.jpg', '21501073', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1090, 'Pesawat Sinar-X, Radiographic System, Digital (DR)', '1740068587.png', '21501072', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1091, 'Pesawat Sinar-X, Single Plane Angiographic X-Ray System/Cathlab', '1740068630.jpg', '21501025', NULL, 4, 'TINGGI', NULL, 10, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1092, 'Pesawat Sinar-X, Stationer/Fixed Table X-Ray System, General X-Ray, Pesawat Rontgen', '1740068670.jpg', '21501033', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1093, 'Pesawat Sinar-X, X-Ray Mobile Analog', '1740066940.jpg', '21501041', NULL, 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1094, 'Pesawat Sinar-X, X-Ray Mobile Digital', '1740066863.jpg', '21501037', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1095, 'Phonocardiograph', NULL, '10502013', NULL, NULL, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1096, 'Phototherapy Unit', NULL, '20902034', NULL, NULL, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1097, 'Pipetting & Diluting System for Clinical use', NULL, '10102024', NULL, NULL, NULL, NULL, 4, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1098, 'Pita Pengukur Lingkar Kepala', NULL, '10903169', NULL, NULL, NULL, NULL, 6, 3, 1, NULL);
INSERT INTO `penamaan` VALUES (1099, 'Platelet Aggregometer', NULL, '20206008', NULL, NULL, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1100, 'Platelet Agitator w/ Inkubator', NULL, '200219', NULL, NULL, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1101, 'Pocket Oximetry', NULL, '20502040', NULL, 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1102, 'Portable Air Compressor', NULL, '20404004', NULL, 1, NULL, NULL, 9, 4, 3, NULL);
INSERT INTO `penamaan` VALUES (1103, 'Pulse Erator Unit', NULL, '21403041', NULL, 1, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (1104, 'Pulse Oxymeter/Oximeter/Oksigen Saturasi/SPO2', NULL, '20502020', NULL, 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1105, 'Radio Frequency Ablation', NULL, '21604008', NULL, NULL, NULL, NULL, 0, 0, 0, 'Yes');
INSERT INTO `penamaan` VALUES (1106, 'Real Time PCR', NULL, '1801041', NULL, NULL, NULL, NULL, 5, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (1107, 'Rectosigmoidoscopy', NULL, '21603064', NULL, NULL, NULL, NULL, 7, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (1108, 'Refrakto Keratometer', NULL, '21201008', NULL, NULL, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1109, 'Refrigerated Mortuary Cabinet', NULL, '21701030', NULL, NULL, NULL, NULL, 1, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1110, 'Refrigerator Laboratory Grade (Reagen)', NULL, '1801087', NULL, 3, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1111, 'Refrigerator Laboratory Grade (Sampel Lingkungan & Makanan)', NULL, '21702075', NULL, 3, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1112, 'Refrigerator Laboratory Grade (Specimen)', NULL, '1801054', NULL, 3, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1113, 'Refrigerator Reagensia', NULL, '200221', NULL, 3, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1114, 'Resusitator Anak', NULL, '20403089', NULL, 1, 'SEDERHANA', NULL, 10, 5, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1115, 'Resusitator Bayi/Neonatus', NULL, '20403083', NULL, 1, NULL, NULL, 10, 5, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1116, 'Resusitator Dewasa', NULL, '20403081', NULL, 1, NULL, NULL, 10, 5, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1117, 'Retinometer', NULL, '21201076', NULL, 1, NULL, NULL, 7, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (1118, 'Rotator Plate', NULL, '1801042', NULL, 3, NULL, NULL, 4, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1119, 'Rowing Machine', NULL, '21403046', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `penamaan` VALUES (1120, 'Scrub Up Unit', NULL, '20903121', NULL, 3, NULL, NULL, 2, 1, 3, NULL);
INSERT INTO `penamaan` VALUES (1121, 'Shaker', NULL, '1801044', NULL, 3, NULL, NULL, 4, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (1122, 'Shaking Waterbath', NULL, '10903136', NULL, 3, NULL, NULL, 4, 3, 3, NULL);
INSERT INTO `penamaan` VALUES (1123, 'Shortwave Diathermy (SWD)', NULL, '21403012', NULL, 1, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1124, 'Slide Scanner', NULL, '10203007', NULL, 1, NULL, NULL, 7, 3, 2, NULL);
INSERT INTO `penamaan` VALUES (1125, 'Slit Lamp', NULL, '11201074', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1126, 'Snellen Test Projector', NULL, '11201083', NULL, 1, NULL, NULL, 7, 3, 2, NULL);
INSERT INTO `penamaan` VALUES (1127, 'Spektrofotometer, UV visible', NULL, '1801045', NULL, 3, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1128, 'Spirometer', NULL, '10401037', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1129, 'Steam Sterilizer', NULL, '20903038', NULL, 1, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1130, 'Sterilisator/Sterilisator Basah', NULL, '20903050', NULL, 1, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1131, 'Sterilisator Suhu Rendah', NULL, '20903101', NULL, 1, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1132, 'Stetoskop Anak', NULL, '20902047', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1133, 'Stetoskop Bayi', NULL, '20902048', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1134, 'Stetoskop Dewasa', NULL, '20501033', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1135, 'Stetoskop Duplex/Simplex', NULL, '20902054', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1136, 'Stetoskop Duplex Neonatus', NULL, '20902055', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1137, 'Stetoskop Infant', NULL, '20902050', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1138, 'Stetoskop Pediatric', NULL, '20902053', NULL, 1, NULL, NULL, 6, 3, 1, 'No');
INSERT INTO `penamaan` VALUES (1139, 'Stimulator Elektrik/Elektro Stimulator/TENS', NULL, '21403030', NULL, 1, NULL, NULL, 8, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1140, 'Stirrer, Magnetic', NULL, '1801046', NULL, 3, NULL, NULL, 4, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1141, 'Suction, Aspirator/Vacuum/Suction pump portable', '1740061210.jpg', '20903052', NULL, 1, 'SEDERHANA', NULL, 9, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1142, 'Suction, Baby Suction Pump', '1740061324.jpg', '20903055', NULL, 1, 'SEDERHANA', NULL, 9, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1143, 'Suction, Suction Pump/Pompa Vakum /Vacuum-Powered Body Fluid Suction Apparatus; Suction Pump Mobile', '1740061443.jpg', '20903029', NULL, 1, 'SEDERHANA', NULL, 9, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1144, 'Suction, Suction Thorax', '1740070649.jpg', '20903053', 'UNIT', 1, 'SEDERHANA', NULL, 9, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1145, 'Syringe Pump', '1740061020.jpg', '20902046', 'UNIT', 1, 'MENENGAH', NULL, 8, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1146, 'Teaching Mikroskop', NULL, '10203040', NULL, 3, NULL, NULL, 5, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1147, 'Tensimeter Anaeroid/Sphygmomanometer', '1740070308.jpg', '10901017', 'PCS', 1, 'SEDERHANA', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1148, 'Tensimeter Digital/Blood Pressure Meter Digital', '1740070350.jpg', '10901018', 'PCS', 1, 'SEDERHANA', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1149, 'Thermohygrometer', NULL, '200214', NULL, 1, NULL, NULL, 7, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1150, 'Thermometer Axial', NULL, '20901014', NULL, 1, NULL, NULL, 6, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1151, 'Thermometer Dahi/IR Thermometer/Thermogun', NULL, '20901018', NULL, 1, NULL, NULL, 6, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1152, 'Thermometer Dewasa', NULL, '20901020', NULL, 1, NULL, NULL, 6, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1153, 'Thermometer Digital', NULL, '20901011', NULL, 1, NULL, NULL, 7, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1154, 'Thermometer Infant', NULL, '20901021', NULL, 1, NULL, NULL, 6, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1155, 'Thermometer Rectal', NULL, '20901013', NULL, 1, NULL, NULL, 6, 3, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1156, 'THT Unit/ENT Diagnostik Unit/ENT Examination Set/ENT Treatment', NULL, '10704002', NULL, 1, NULL, NULL, 7, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1157, 'Timbangan Anak', NULL, '10901019', NULL, 1, NULL, NULL, 6, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1158, 'Timbangan Bayi', NULL, '10901020', NULL, 1, NULL, NULL, 6, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1159, 'Timbangan Dewasa', NULL, '10901006', NULL, 1, NULL, NULL, 6, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1160, 'Tissue Processing Equipment/Peralatan Prosesing Jaringan', NULL, '10203001', NULL, 3, NULL, NULL, 4, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1161, 'Tonometer Non-Kontak /Non-Contact Tonometer (NCT)', NULL, '21201068', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1162, 'Torniquet', NULL, '10903144', NULL, 1, NULL, NULL, 8, 2, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1163, 'Tourniquet Non-Pneumatic', '1740581511.jpg', '11604006', NULL, 1, NULL, NULL, 8, 2, 1, 'No');
INSERT INTO `penamaan` VALUES (1164, 'Tourniquet Pneumatic', '1740581552.jpg', '11604007', NULL, 1, 'SEDERHANA', NULL, 8, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1165, 'Traction Unit', '1740585291.jpg', '21403033', NULL, 1, NULL, NULL, 8, 2, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1166, 'Treadmill', '1740585377.webp', '11403041', NULL, 1, 'SEDERHANA', NULL, 8, 2, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1167, 'Ultrasonic Cleaner for medical instruments', '1740585515.jpg', '10903009', NULL, 1, NULL, NULL, 2, 1, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1168, 'Ultrasonic Diathermy', '1740586573.jpg', '21403013', NULL, 1, NULL, NULL, 8, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1169, 'Ultrasonic Pulsed Echo Imaging System', '1740586531.png', '21501023', NULL, 1, NULL, NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1170, 'Ultrasonic Scaler', '1740586465.jpg', '20603014', NULL, 1, NULL, NULL, 7, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1171, 'Ultrasonography (USG) 2D', '1740586417.png', '21102025', NULL, 1, 'TINGGI', NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1172, 'Ultrasonography (USG) 3D', '1740586379.png', '21102019', NULL, 1, 'TINGGI', NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1173, 'Ultrasonography (USG) 4D', '1740586329.jpg', '21102020', NULL, 1, 'TINGGI', NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1174, 'Ultrasonography (USG) Mata', '1740585565.webp', '21201075', NULL, 1, 'TINGGI', NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1175, 'Ultrasonography (USG) Muskuloskeletal', '1740586215.png', '21401011', NULL, 1, 'TINGGI', NULL, 6, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1176, 'Ultrasound Therapy', '1740586661.jpg', '11403040', NULL, 1, NULL, NULL, 8, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1177, 'UV Sterilizer', '1740586752.webp', '20903026', NULL, 4, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1178, 'Vaccine Carrier', '1740581452.png', '10903156', NULL, 3, NULL, NULL, 2, 1, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1179, 'Vaccine Refrigerator', '1740581397.webp', '10903155', NULL, 3, NULL, NULL, 2, 1, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1180, 'Vena Section', '1740581314.webp', '20501040', NULL, 1, NULL, NULL, 7, 2, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1181, 'Ventilator Infant (Ventilator Konvensional Bayi)', '1740069937.jpg', '10403085', NULL, 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1182, 'Ventilator Konvensional Anak/Dewasa', '1740069963.jpg', '10403079', NULL, 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1183, 'Ventilator Non-Invasif Anak/Dewasa', '1740069988.jpg', '20403070', NULL, 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1184, 'Ventilator Transport Neonatus', '1740070011.webp', '20403072', NULL, 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1185, 'Ventilator Transport, Portabel', '1740070041.jpg', '10403080', NULL, 1, 'TINGGI', NULL, 10, 5, 5, 'Yes');
INSERT INTO `penamaan` VALUES (1186, 'Vitrectomy unit', '1740580169.jpg', '21203036', NULL, 1, 'TINGGI', NULL, NULL, NULL, NULL, 'Yes');
INSERT INTO `penamaan` VALUES (1187, 'Vortex', '1740580225.webp', '10302026', NULL, 3, NULL, NULL, 4, 3, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1188, 'Water bath', '1740580308.png', '10903135', NULL, 1, NULL, NULL, 4, 1, 2, 'Yes');
INSERT INTO `penamaan` VALUES (1189, 'X-Ray Film Viewer', '1740203230.png', '11501050', 'PCS', 4, 'SEDERHANA', NULL, 2, 1, 1, 'No');
INSERT INTO `penamaan` VALUES (1190, 'YAG Laser Set', '1740070794.webp', '21203041', 'UNIT', 4, 'MENENGAH', NULL, 9, 4, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1191, 'Electrocardiograph (ECG/EKG) 12 CH', '1740060418.jpg', '2050200912ch', 'UNIT', 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1192, 'Electrocardiograph (ECG/EKG) 3 CH', '1740060546.jpg', '205020093ch', 'UNIT', 1, 'MENENGAH', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1193, 'Electrocardiograph (ECG/EKG) 6 CH', '1740060736.jpg', '205020096ch', 'UNIT', 1, 'SEDERHANA', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1194, 'Magnetic Resonance Imaging (MRI) 3 Tesla', '1740065434.jpg', '21501001-3', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1195, 'Magnetic Resonance Imaging (MRI) 7 Tesla', '1740065934.jpg', '21501001-7', 'UNIT', NULL, 'TINGGI', NULL, 7, 3, 4, 'Yes');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(8, 2) NOT NULL DEFAULT 0.00,
  `signup_fee` decimal(8, 2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `trial_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `invoice_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `grace_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `grace_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `prorate_day` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `prorate_period` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `prorate_extend_due` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `active_subscribers_limit` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `plans_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plans
-- ----------------------------

-- ----------------------------
-- Table structure for responsible_category
-- ----------------------------
DROP TABLE IF EXISTS `responsible_category`;
CREATE TABLE `responsible_category`  (
  `category_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of responsible_category
-- ----------------------------
INSERT INTO `responsible_category` VALUES (21, 1);
INSERT INTO `responsible_category` VALUES (17, 2);
INSERT INTO `responsible_category` VALUES (21, 2);
INSERT INTO `responsible_category` VALUES (1, 3);
INSERT INTO `responsible_category` VALUES (17, 3);
INSERT INTO `responsible_category` VALUES (1, 503);

-- ----------------------------
-- Table structure for responsible_department
-- ----------------------------
DROP TABLE IF EXISTS `responsible_department`;
CREATE TABLE `responsible_department`  (
  `department_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`, `department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of responsible_department
-- ----------------------------
INSERT INTO `responsible_department` VALUES (21, 1);
INSERT INTO `responsible_department` VALUES (1, 2);
INSERT INTO `responsible_department` VALUES (1, 4);

-- ----------------------------
-- Table structure for responsible_group
-- ----------------------------
DROP TABLE IF EXISTS `responsible_group`;
CREATE TABLE `responsible_group`  (
  `group_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of responsible_group
-- ----------------------------
INSERT INTO `responsible_group` VALUES (4, 2);
INSERT INTO `responsible_group` VALUES (4, 3);
INSERT INTO `responsible_group` VALUES (5, 2);
INSERT INTO `responsible_group` VALUES (5, 3);
INSERT INTO `responsible_group` VALUES (6, 1);
INSERT INTO `responsible_group` VALUES (6, 3);
INSERT INTO `responsible_group` VALUES (6, 502);
INSERT INTO `responsible_group` VALUES (6, 503);
INSERT INTO `responsible_group` VALUES (6, 507);
INSERT INTO `responsible_group` VALUES (6, 508);
INSERT INTO `responsible_group` VALUES (7, 3);
INSERT INTO `responsible_group` VALUES (7, 503);
INSERT INTO `responsible_group` VALUES (8, 3);
INSERT INTO `responsible_group` VALUES (9, 3);
INSERT INTO `responsible_group` VALUES (9, 502);
INSERT INTO `responsible_group` VALUES (9, 503);
INSERT INTO `responsible_group` VALUES (10, 1);
INSERT INTO `responsible_group` VALUES (10, 507);

-- ----------------------------
-- Table structure for saran
-- ----------------------------
DROP TABLE IF EXISTS `saran`;
CREATE TABLE `saran`  (
  `saran_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `saran_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`saran_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of saran
-- ----------------------------
INSERT INTO `saran` VALUES (1, 'Perlu penggantian suku cadang');
INSERT INTO `saran` VALUES (2, 'Alat membahayakan, tidak layak dioperasikan');
INSERT INTO `saran` VALUES (3, 'Alat sudah tidak layak dioperasikan, usul penghapusan');
INSERT INTO `saran` VALUES (4, 'Dilakukan Penarikan/Recall');
INSERT INTO `saran` VALUES (5, 'Alat tidak perlu penggantian suku cadang, dapat digunakan');
INSERT INTO `saran` VALUES (6, 'Perlu perbaikan pihak ke 3');
INSERT INTO `saran` VALUES (7, 'Beli baru');

-- ----------------------------
-- Table structure for satuan
-- ----------------------------
DROP TABLE IF EXISTS `satuan`;
CREATE TABLE `satuan`  (
  `satuan_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`satuan_code`) USING BTREE,
  INDEX `satuan_code`(`satuan_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of satuan
-- ----------------------------
INSERT INTO `satuan` VALUES ('PCS', 'pcs');
INSERT INTO `satuan` VALUES ('SET', 'set');
INSERT INTO `satuan` VALUES ('UNIT', 'unit');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `status_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`status_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('BAIK', 'Baik');
INSERT INTO `status` VALUES ('MAINTENANCE', 'Sedang di Maintenance');
INSERT INTO `status` VALUES ('RUSAK', 'Rusak');

-- ----------------------------
-- Table structure for subscription_usage
-- ----------------------------
DROP TABLE IF EXISTS `subscription_usage`;
CREATE TABLE `subscription_usage`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `used` smallint(5) UNSIGNED NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `valid_until` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscription_usage
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscriber_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trial_ends_at` datetime NULL DEFAULT NULL,
  `starts_at` datetime NULL DEFAULT NULL,
  `ends_at` datetime NULL DEFAULT NULL,
  `cancels_at` datetime NULL DEFAULT NULL,
  `canceled_at` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `subscriptions_slug_unique`(`slug`) USING BTREE,
  INDEX `subscriptions_subscriber_type_subscriber_id_index`(`subscriber_type`, `subscriber_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for system_group
-- ----------------------------
DROP TABLE IF EXISTS `system_group`;
CREATE TABLE `system_group`  (
  `system_group_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_group_sort` int(11) NULL DEFAULT 0,
  `system_group_enable` tinyint(1) NULL DEFAULT 1,
  `system_group_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_group_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_group_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`system_group_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_group
-- ----------------------------
INSERT INTO `system_group` VALUES ('aplikasi', 'Aplikasi', NULL, 1, NULL, 'rocket-takeoff', NULL);
INSERT INTO `system_group` VALUES ('app_admin', 'Transaksi', 2, 1, NULL, 'window-sidebar', NULL);
INSERT INTO `system_group` VALUES ('master', 'Master', 7, 1, NULL, 'database', NULL);
INSERT INTO `system_group` VALUES ('printer', 'Printer', 0, 1, 'https://rsambkt.elsycalitech.co.id/rawbt.apk', 'bluetooth', NULL);
INSERT INTO `system_group` VALUES ('report', 'Report', 1, 1, NULL, 'printer', NULL);
INSERT INTO `system_group` VALUES ('report_enginer', 'Report Enginer', NULL, 1, NULL, 'printer-fill', NULL);
INSERT INTO `system_group` VALUES ('setting', 'System', -1, 1, NULL, 'wrench-adjustable-circle', NULL);
INSERT INTO `system_group` VALUES ('tiket', 'Tiket', NULL, 1, NULL, 'wrench-adjustable', NULL);

-- ----------------------------
-- Table structure for system_group_connection_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_group_connection_menu`;
CREATE TABLE `system_group_connection_menu`  (
  `system_group_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_menu_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`system_group_code`, `system_menu_code`) USING BTREE,
  INDEX `system_menu_code`(`system_menu_code`) USING BTREE,
  CONSTRAINT `system_group_connection_menu_ibfk_1` FOREIGN KEY (`system_group_code`) REFERENCES `system_group` (`system_group_code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `system_group_connection_menu_ibfk_2` FOREIGN KEY (`system_menu_code`) REFERENCES `system_menu` (`system_menu_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_group_connection_menu
-- ----------------------------
INSERT INTO `system_group_connection_menu` VALUES ('aplikasi', 'asset_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('aplikasi', 'job_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('aplikasi', 'tiket_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('app_admin', 'job');
INSERT INTO `system_group_connection_menu` VALUES ('app_admin', 'notification');
INSERT INTO `system_group_connection_menu` VALUES ('app_admin', 'tiket');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'area');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'asset');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'brand');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'category');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'group');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'level1');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'level2');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'level3');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'lokasi');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'model');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'penamaan');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'saran');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'satuan');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'vendor');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_asset');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_jadwal');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_job');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_kalibrasi');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_tiket');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_user');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_asset_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_jadwal_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_job_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_kalibrasi_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_tiket_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'groups');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'link');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'menu');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'permission');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'roles');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'setting');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'user');
INSERT INTO `system_group_connection_menu` VALUES ('tiket', 'asset_user');
INSERT INTO `system_group_connection_menu` VALUES ('tiket', 'report_asset_user');
INSERT INTO `system_group_connection_menu` VALUES ('tiket', 'tiket_user');

-- ----------------------------
-- Table structure for system_group_connection_role
-- ----------------------------
DROP TABLE IF EXISTS `system_group_connection_role`;
CREATE TABLE `system_group_connection_role`  (
  `system_role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_group_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`system_role_code`, `system_group_code`) USING BTREE,
  INDEX `system_group_connection_role_ibfk_2`(`system_group_code`) USING BTREE,
  CONSTRAINT `system_group_connection_role_ibfk_1` FOREIGN KEY (`system_role_code`) REFERENCES `system_role` (`system_role_code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `system_group_connection_role_ibfk_2` FOREIGN KEY (`system_group_code`) REFERENCES `system_group` (`system_group_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_group_connection_role
-- ----------------------------
INSERT INTO `system_group_connection_role` VALUES ('admin', 'app_admin');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'master');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'printer');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'report');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'setting');
INSERT INTO `system_group_connection_role` VALUES ('management', 'report');
INSERT INTO `system_group_connection_role` VALUES ('management', 'tiket');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'aplikasi');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'printer');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'report_enginer');
INSERT INTO `system_group_connection_role` VALUES ('user', 'tiket');

-- ----------------------------
-- Table structure for system_link
-- ----------------------------
DROP TABLE IF EXISTS `system_link`;
CREATE TABLE `system_link`  (
  `system_link_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_link_action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_link_controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_link_sort` tinyint(4) NULL DEFAULT 0,
  `system_link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_link_enable` tinyint(4) NULL DEFAULT NULL,
  `system_link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_link_type` tinyint(4) NULL DEFAULT NULL,
  INDEX `system_menu_code`(`system_link_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_link
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `system_menu_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_menu_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_menu_controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_menu_action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_menu_type` tinyint(4) NULL DEFAULT 5,
  `system_menu_sort` tinyint(4) NULL DEFAULT NULL,
  `system_menu_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_menu_enable` tinyint(1) NULL DEFAULT NULL,
  `system_menu_can_delete` tinyint(1) NULL DEFAULT 1,
  INDEX `system_menu_code`(`system_menu_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('roles', 'Roles', 'roles', 'App\\Http\\Controllers\\Core\\RolesController', 'roles.getTable', 1, 9, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('user', 'User', 'user', 'App\\Http\\Controllers\\Core\\UserController', 'user.getTable', 1, NULL, '', NULL, 1);
INSERT INTO `system_menu` VALUES ('master', 'Master', 'master', NULL, NULL, 2, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('setting', 'Setting Website', 'pengaturan', 'App\\Http\\Controllers\\Core\\SettingController', 'setting.getCreate', 1, NULL, '', NULL, 1);
INSERT INTO `system_menu` VALUES ('groups', 'Group', 'groups', 'App\\Http\\Controllers\\Core\\GroupsController', 'groups.getTable', 1, 10, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('menu', 'Menu', 'menu', 'App\\Http\\Controllers\\Core\\MenuController', 'menu.getTable', 1, 8, '', NULL, 1);
INSERT INTO `system_menu` VALUES ('link', 'Link', 'link', 'App\\Http\\Controllers\\Core\\LinkController', 'link.getTable', 1, 7, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('permission', 'Permission', 'permission', 'App\\Http\\Controllers\\Core\\PermissionController', 'permission.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_user', 'Report User', 'report_user', 'App\\Http\\Controllers\\ReportUserController', 'report_user.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('brand', 'Merek', 'brand', 'App\\Http\\Controllers\\BrandController', 'brand.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('category', 'Katagori', 'category', 'App\\Http\\Controllers\\CategoryController', 'category.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('lokasi', 'Ruangan', 'ruangan', 'App\\Http\\Controllers\\LokasiController', 'lokasi.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('satuan', 'Satuan', 'satuan', 'App\\Http\\Controllers\\SatuanController', 'satuan.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('penamaan', 'Nomenklatur', 'penamaan', 'App\\Http\\Controllers\\PenamaanController', 'penamaan.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('asset', 'Asset', 'asset', 'App\\Http\\Controllers\\AssetController', 'asset.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket', 'Tiket Admin', 'tiket', 'App\\Http\\Controllers\\TiketController', 'tiket.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('job', 'Pekerjaan Teknisi', 'job', 'App\\Http\\Controllers\\JobController', 'job.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('group', 'Pemeliharaan', 'pemeliharaan', 'App\\Http\\Controllers\\GroupController', 'group.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('model', 'Model', 'model', 'App\\Http\\Controllers\\ModelController', 'model.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('saran', 'Saran', 'saran', 'App\\Http\\Controllers\\SaranController', 'saran.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('area', 'Gedung', 'gedung', 'App\\Http\\Controllers\\AreaController', 'area.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('notification', 'Notification', 'notification', 'App\\Http\\Controllers\\NotificationController', 'notification.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_job', 'Report Pekerjaan', 'report_pekerjaan', 'App\\Http\\Controllers\\ReportJobController', 'report_job.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_tiket', 'Report Tiket', 'report_tiket', 'App\\Http\\Controllers\\ReportTiketController', 'report_tiket.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('level1', 'Level 1', 'level1', 'App\\Http\\Controllers\\Level1Controller', 'level1.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('level2', 'Level 2', 'level2', 'App\\Http\\Controllers\\Level2Controller', 'level2.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('level3', 'Level 3', 'level3', 'App\\Http\\Controllers\\Level3Controller', 'level3.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_jadwal', 'Report Jadwal', 'report_jadwal', 'App\\Http\\Controllers\\ReportJadwalController', 'report_jadwal.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('vendor', 'Vendor', 'vendor', 'App\\Http\\Controllers\\VendorController', 'vendor.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_asset', 'Report Asset', 'report_asset', 'App\\Http\\Controllers\\ReportAssetController', 'report_asset.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_kalibrasi', 'Report Kalibrasi', 'report_kalibrasi', 'App\\Http\\Controllers\\ReportKalibrasiController', 'report_kalibrasi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket_teknisi', 'Tiket Teknisi', 'tiket_teknisi', 'App\\Http\\Controllers\\TiketController', 'tiket_teknisi.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('job_teknisi', 'Pekerjaan', 'job_teknisi', 'App\\Http\\Controllers\\JobController', 'job_teknisi.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket_user', 'Tiket User', 'tiket_user', 'App\\Http\\Controllers\\TiketController', 'tiket_user.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_tiket_teknisi', 'Report Tiket', 'report_tiket_teknisi', 'App\\Http\\Controllers\\ReportTiketController', 'report_tiket_teknisi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_job_teknisi', 'Report Pekerjaan', 'report_job_teknisi', 'App\\Http\\Controllers\\ReportJobController', 'report_job_teknisi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('asset_teknisi', 'Data Peralatan', 'asset_teknisi', 'App\\Http\\Controllers\\AssetController', 'asset_teknisi.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_kalibrasi_teknisi', 'Report Kalibrasi Teknisi', 'report_kalibrasi_teknisi', 'App\\Http\\Controllers\\ReportKalibrasiController', 'report_kalibrasi_teknisi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_jadwal_teknisi', 'Report Jadwal Kunjungan', 'report_jadwal_teknisi', 'App\\Http\\Controllers\\ReportJadwalController', 'report_jadwal_teknisi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_asset_teknisi', 'Report Asset', 'report_asset_teknisi', 'App\\Http\\Controllers\\ReportAssetController', 'report_asset_teknisi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('asset_user', 'Asset', 'asset_user', 'App\\Http\\Controllers\\AssetController', 'asset_user.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_asset_user', 'Report Asset', 'report_asset_user', 'App\\Http\\Controllers\\ReportAssetController', 'report_asset_user.getCreate', 1, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for system_menu_connection_link
-- ----------------------------
DROP TABLE IF EXISTS `system_menu_connection_link`;
CREATE TABLE `system_menu_connection_link`  (
  `system_menu_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_link_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `system_menu_connection_link_ibfk_1`(`system_menu_code`) USING BTREE,
  INDEX `system_menu_connection_link_ibfk_2`(`system_link_code`) USING BTREE,
  CONSTRAINT `system_menu_connection_link_ibfk_1` FOREIGN KEY (`system_menu_code`) REFERENCES `system_menu` (`system_menu_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `system_menu_connection_link_ibfk_2` FOREIGN KEY (`system_link_code`) REFERENCES `system_link` (`system_link_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu_connection_link
-- ----------------------------

-- ----------------------------
-- Table structure for system_permision
-- ----------------------------
DROP TABLE IF EXISTS `system_permision`;
CREATE TABLE `system_permision`  (
  `system_permision_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_permision_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_permision_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_permision_controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_permision_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1',
  `system_permision_user` int(11) NULL DEFAULT NULL,
  `system_permision_level` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`system_permision_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_permision
-- ----------------------------

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `system_role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_role_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_role_level` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`system_role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('admin', 'Admin', 'ini buat seluruh system untuk mengatur', 100);
INSERT INTO `system_role` VALUES ('management', 'Management', NULL, 40);
INSERT INTO `system_role` VALUES ('teknisi', 'Teknisi', NULL, 10);
INSERT INTO `system_role` VALUES ('user', 'User', 'pengguna', 1);

-- ----------------------------
-- Table structure for team_user
-- ----------------------------
DROP TABLE IF EXISTS `team_user`;
CREATE TABLE `team_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `team_user_team_id_id_unique`(`team_id`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_user
-- ----------------------------

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `team_user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`team_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teams
-- ----------------------------

-- ----------------------------
-- Table structure for telegraph_bots
-- ----------------------------
DROP TABLE IF EXISTS `telegraph_bots`;
CREATE TABLE `telegraph_bots`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `telegraph_bots_token_unique`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telegraph_bots
-- ----------------------------

-- ----------------------------
-- Table structure for telegraph_chats
-- ----------------------------
DROP TABLE IF EXISTS `telegraph_chats`;
CREATE TABLE `telegraph_chats`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telegraph_bot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `telegraph_chats_chat_id_telegraph_bot_id_unique`(`chat_id`, `telegraph_bot_id`) USING BTREE,
  INDEX `telegraph_chats_telegraph_bot_id_foreign`(`telegraph_bot_id`) USING BTREE,
  CONSTRAINT `telegraph_chats_telegraph_bot_id_foreign` FOREIGN KEY (`telegraph_bot_id`) REFERENCES `telegraph_bots` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telegraph_chats
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries`  (
  `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sequence`) USING BTREE,
  UNIQUE INDEX `telescope_entries_uuid_unique`(`uuid`) USING BTREE,
  INDEX `telescope_entries_batch_id_index`(`batch_id`) USING BTREE,
  INDEX `telescope_entries_family_hash_index`(`family_hash`) USING BTREE,
  INDEX `telescope_entries_created_at_index`(`created_at`) USING BTREE,
  INDEX `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_entries
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags`  (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`) USING BTREE,
  INDEX `telescope_entries_tags_tag_index`(`tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_entries_tags
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring`  (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_monitoring
-- ----------------------------

-- ----------------------------
-- Table structure for tiket
-- ----------------------------
DROP TABLE IF EXISTS `tiket`;
CREATE TABLE `tiket`  (
  `tiket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tiket_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiket_type` enum('Preventif','Korektif','Inspeksi','Inventaris','Promotif','Kalibrasi') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiket_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiket_keterangan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiket_gambar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiket_tanggal` date NULL DEFAULT NULL,
  `tiket_pelapor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiket_id_location` bigint(20) NULL DEFAULT NULL,
  `tiket_id_asset` bigint(20) NULL DEFAULT NULL,
  `tiket_created_at` datetime NULL DEFAULT NULL,
  `tiket_updated_at` datetime NULL DEFAULT NULL,
  `tiket_deleted_at` datetime NULL DEFAULT NULL,
  `tiket_created_by` bigint(20) NULL DEFAULT NULL,
  `tiket_updated_by` bigint(20) NULL DEFAULT NULL,
  `tiket_deleted_by` bigint(20) NULL DEFAULT NULL,
  `tiket_taked_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`tiket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiket
-- ----------------------------
INSERT INTO `tiket` VALUES (51, '9c88ec3c-809b-44a1-b211-79a9d4638cbe', 'Korektif', 'BEDSIDE MONITOR SAMSUNG Z-001 IGD - Gedung A ( Pelayanan Medik ) - 123', 'test', '1739339684.png', '2024-05-21', 'Admin', 1, 4, '2025-02-12 12:35:08', '2025-02-17 14:52:13', '2025-02-17 14:52:13', 1, 1, 1, 1);
INSERT INTO `tiket` VALUES (52, '43302a9e-57ff-4dab-bad6-de79b994cdfe', 'Korektif', 'BEDSIDE MONITOR SAMSUNG Z-001 SAMSUNG Z-001 ~ IGD @ Gedung A ( Lantai 2 ) - 123', 'baru', '1739760404.png', '2025-02-16', '2024-08-12', 1, 4, '2025-02-13 11:30:32', '2025-02-17 14:52:13', '2025-02-17 14:52:13', 1, 1, 1, 1);
INSERT INTO `tiket` VALUES (53, '14cae870-3c1e-44bd-8b9d-59205c3dcc7f', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'CT scan rusak', '1739778712.jpg', '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:51:52', '2025-02-17 14:45:23', '2025-02-17 14:45:23', 1, 1, 1, NULL);
INSERT INTO `tiket` VALUES (54, '2b283c8e-397c-4f72-a963-89bc02789def', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'city scan rusak', '1739778344.jpg', '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:45:44', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (55, 'fb86933c-5991-4ac2-9984-9b434b19de0f', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'lagi lagi', '1739778409.jpg', '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:46:49', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (56, '595fe8fd-5c16-4c4e-b186-46747d4d541f', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:48:31', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (57, '4dd7e221-770f-4b34-bb9f-31843193bb56', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:50:17', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (58, 'd9a7b3af-f071-4428-8a2c-56adbf9ef5c8', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:50:33', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (59, '9270f2be-d349-4fa2-9be2-21748b5176e3', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:50:59', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (60, 'fc22757f-b368-4d19-a86d-f49a06202ae3', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:52:24', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (61, 'ced7be23-dbc6-4974-b758-11ba95b000ef', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:52:44', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (62, 'ffccbb2f-5142-44f8-bd90-be010ba3069d', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:52:59', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (63, 'ed32fdcd-c53b-42a6-9679-11b0f7a58fb9', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:53:16', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (64, '705282b6-0b4b-4f6a-848a-0820f2f334b0', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:53:34', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (65, 'f2ba9afd-e4ad-4276-9909-3dc3161958a0', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:55:37', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (66, '5a1c08b2-a921-4f78-9fda-b6a455106e90', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', NULL, '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:56:53', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (67, 'd52ac6ec-b565-447a-8a6a-a2943deaf5fb', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'test', '1739779157.png', '2025-02-17', 'Admin', 1, 6, '2025-02-17 14:59:17', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (68, '2af0810b-81da-458b-90da-9d2ce567296d', 'Korektif', 'BEDSIDE MONITOR SAMSUNG Z-001 ~ IGD @ Gedung A ( Lantai 2 ) - 123', 'ttest', '1739779326.jpg', '2025-02-17', 'Admin', 1, 4, '2025-02-17 15:02:06', '2025-02-17 15:15:04', '2025-02-17 15:15:04', 1, 1, 3, NULL);
INSERT INTO `tiket` VALUES (69, '91d4a374-5adf-4dee-a4eb-bc27b2551bc5', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'CT scan rusak engselnya', '1739780121.jpg', '2025-02-17', 'Itok toni laksono', 1, 6, '2025-02-17 15:15:21', '2025-02-17 15:17:47', '2025-02-17 15:17:47', 3, 3, 3, NULL);
INSERT INTO `tiket` VALUES (70, '970d063a-376c-4196-827d-d52a029e9ca8', 'Korektif', 'CT-SCAN SAMSUNG ~ IGD @ Gedung A ( Lantai 2 ) - 1234567', 'CT scan errror', '1739780279.jpg', '2025-02-17', 'Itok toni laksono', 1, 6, '2025-02-17 15:17:59', '2025-02-19 15:09:15', '2025-02-19 15:09:15', 3, 1, 1, 1);
INSERT INTO `tiket` VALUES (71, '1450c7df-88a9-4689-ae01-9a6f319acd6a', 'Korektif', 'Bedside Monitor ~  ( Samsung ) Z-001 | 123', 'keluhan', NULL, '2025-02-19', 'Admin', 1, 4, '2025-02-19 15:09:30', '2025-02-21 00:15:30', '2025-02-21 00:15:30', 1, 1, 1, 1);
INSERT INTO `tiket` VALUES (72, '68a19e75-7a44-4a9d-81cd-da4c473ca237', 'Korektif', 'CT-SCAN ~  ( Samsung ) Z-001 | 1234567', 'test', '1739954142.jpg', '2025-02-19', 'Admin', 1, 6, '2025-02-19 15:35:42', '2025-02-21 00:15:48', '2025-02-21 00:15:48', 1, 1, 1, 1);
INSERT INTO `tiket` VALUES (73, 'c47e5654-12f1-4dd4-bc73-53ab3f8e7484', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test', NULL, '2025-02-21', 'Admin', 2, 7, '2025-02-21 00:57:19', '2025-02-21 08:50:12', '2025-02-21 08:50:12', 1, 1, 1, NULL);
INSERT INTO `tiket` VALUES (74, '81f1e6a9-23c6-47e7-9e5d-96ff2908fd25', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'nyoba apps', NULL, '2025-02-23', 'Admin', 5, 7, '2025-02-23 22:40:45', '2025-02-25 06:01:09', '2025-02-25 06:01:09', 1, 1, 1, NULL);
INSERT INTO `tiket` VALUES (75, '8da3acc2-ad2d-4a49-b3e7-ff68f32f2129', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'Matot', NULL, '2025-02-23', 'Ady Sunanto', 5, 7, '2025-02-23 22:51:36', '2025-02-25 06:01:09', '2025-02-25 06:01:09', 502, 504, 1, 504);
INSERT INTO `tiket` VALUES (76, 'c9f0e38f-9f8a-42ac-b53f-ead588728f0b', 'Preventif', 'Dental Unit ~  ( Belmont ) Clesta | AD14J0176', 'Penjadwalan otomatis untuk pekerjaan Preventif', NULL, '2025-07-03', 'System', 10, 46, '2025-07-03 06:00:01', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 1, NULL, 1, NULL);
INSERT INTO `tiket` VALUES (77, '738f1896-2bca-424b-91ae-604b9a28fc4e', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3207', 'Monitor Mati', NULL, '2025-07-17', 'Ady Sunanto', 2, 8, '2025-07-17 12:45:08', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 502, 502, 1, NULL);
INSERT INTO `tiket` VALUES (78, '9ec2313e-c909-4b0b-a995-a2d73bb43fa9', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'ini keluhan', '1763810229.png', '2025-11-22', 'Itok toni laksono', 2, 9, '2025-11-22 18:09:04', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 3, 3, 1, 3);
INSERT INTO `tiket` VALUES (79, 'e2ac2457-16fb-49a3-be42-1fd29b4bd5d0', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE4818', 'test', '1763813037.png', '2025-11-22', 'Itok toni laksono', 2, 10, '2025-11-22 19:03:57', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 3, 3, 1, 3);
INSERT INTO `tiket` VALUES (80, 'f6b02eb3-090d-4335-9c1b-d331ce7cae2e', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'test', '1763813582.png', '2025-11-22', 'Itok toni laksono', 2, 9, '2025-11-22 19:13:03', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 3, 3, 1, 3);
INSERT INTO `tiket` VALUES (81, '8a9a2a3c-d899-473c-abd8-5256a5a8e5ff', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3207', 'test', '1763813927.png', '2025-11-22', 'Itok toni laksono', 2, 8, '2025-11-22 19:18:47', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 3, 3, 1, NULL);
INSERT INTO `tiket` VALUES (82, '6a4d4c28-7e09-436f-a460-793fa54420e6', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0170', 'test', '1763814253.png', '2025-11-22', 'User', 5, 24, '2025-11-22 19:24:14', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 505, 1, NULL);
INSERT INTO `tiket` VALUES (83, 'ac14cc37-0a05-4656-bfc7-fe8ef87d7b6a', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0170', 'test tiket', '1763815528.jpg', '2025-11-22', 'User', 5, 24, '2025-11-22 19:45:28', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 505, 1, NULL);
INSERT INTO `tiket` VALUES (84, '970e4324-855b-4f56-9a07-3737d80e15d5', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'tiket', '1763815592.png', '2025-11-22', 'Itok toni laksono', 2, 9, '2025-11-22 19:46:32', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 3, 504, 1, 504);
INSERT INTO `tiket` VALUES (85, 'd547d38d-5ebe-4a96-a8af-fa865d861ced', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2952', 'ada yang rusak', '1763956053.png', '2025-11-24', 'User', 5, 18, '2025-11-24 10:47:33', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 504, 1, 504);
INSERT INTO `tiket` VALUES (86, 'c7dfdad5-a697-4209-86e3-7420fa25e02a', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'test buat tiket', '1763983513.png', '2025-11-24', 'Itok toni laksono', 2, 9, '2025-11-24 11:16:06', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 3, 3, 1, 3);
INSERT INTO `tiket` VALUES (87, '082361ff-d084-4f64-92f0-04d8a550d585', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2952', 'test tiket 1', '1764244898.png', '2025-11-27', 'User', 5, 18, '2025-11-27 19:01:38', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 505, 1, NULL);
INSERT INTO `tiket` VALUES (88, 'dba895e6-5baa-486f-bcc4-247cc464b92e', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2952', 'test 2', '1764245621.png', '2025-11-27', 'User', 5, 18, '2025-11-27 19:13:41', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 505, 1, NULL);
INSERT INTO `tiket` VALUES (89, '5d6defd4-9d0a-4cfe-9a18-ac26b6f7c180', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'test', NULL, '2025-11-27', 'teknisi', 2, 9, '2025-11-27 19:19:30', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 508, 508, 1, NULL);
INSERT INTO `tiket` VALUES (90, '8bec6178-44d4-422b-9df7-0a95499dfa88', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3201', 'test', NULL, '2025-11-27', 'teknisi', 2, 9, '2025-11-27 19:25:14', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 508, 508, 1, NULL);
INSERT INTO `tiket` VALUES (91, 'babae47c-4742-44a0-b803-a5f62a4fad6b', 'Korektif', 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0170', 'test 3', '1764246637.jpg', '2025-11-27', 'User', 5, 24, '2025-11-27 19:30:38', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 508, 1, 508);
INSERT INTO `tiket` VALUES (92, 'eeaaa168-0a4e-49c7-b6b2-68019b057f36', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test', NULL, '2025-11-27', 'User', 5, 7, '2025-11-27 19:40:19', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 505, 1, NULL);
INSERT INTO `tiket` VALUES (93, 'e5579459-e7c3-4afc-9fa9-98686ab85c69', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test', '1764247437.jpg', '2025-11-27', 'Admin', 5, 7, '2025-11-27 19:43:57', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 1, 1, 1, NULL);
INSERT INTO `tiket` VALUES (94, 'beaf1205-f9a4-41b7-91df-f1bdd740ab85', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test', '1764247529.jpg', '2025-11-27', 'Admin', 5, 7, '2025-11-27 19:45:29', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 1, 1, 1, NULL);
INSERT INTO `tiket` VALUES (95, '244ceef2-773d-4886-bc6e-9067f9378a5a', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test', '1764247565.jpg', '2025-11-27', 'User', 5, 7, '2025-11-27 19:46:05', '2025-11-27 19:55:18', '2025-11-27 19:55:18', 505, 508, 1, 508);
INSERT INTO `tiket` VALUES (96, 'c5947332-7628-4545-8805-9f6abd7b3aa1', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test tiket', '1764248138.jpg', '2025-11-27', 'Admin', 5, 7, '2025-11-27 19:55:38', '2025-11-27 20:07:55', '2025-11-27 20:07:55', 1, 508, 1, 508);
INSERT INTO `tiket` VALUES (97, '29fe9622-89c7-4910-a674-1945bf7b0b6c', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'test', '1764248341.jpg', '2025-11-27', 'User', 5, 7, '2025-11-27 19:59:01', '2025-11-27 20:07:55', '2025-11-27 20:07:55', 505, 508, 1, 508);
INSERT INTO `tiket` VALUES (98, 'aba01062-59cc-4cd1-89ea-2991c130235d', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', '1', '1764248468.jpg', '2025-11-27', 'User', 5, 7, '2025-11-27 20:01:08', '2025-11-27 20:07:55', '2025-11-27 20:07:55', 505, 508, 1, 508);
INSERT INTO `tiket` VALUES (99, '6a0b40a4-dc78-4094-a088-e307509f07e6', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', '1', NULL, '2025-11-27', 'User', 5, 7, '2025-11-27 20:08:15', '2025-11-29 08:16:14', NULL, 505, 1, NULL, 1);
INSERT INTO `tiket` VALUES (100, '09398442-7aac-4841-bc8c-5c6581cbdf13', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', 'testing keluhan', '1764384947.jpg', '2025-11-29', 'User', 5, 7, '2025-11-29 09:55:47', '2025-11-29 09:57:06', NULL, 505, 508, NULL, 508);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `level` tinyint(4) NULL DEFAULT NULL,
  `active` tinyint(4) NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor` int(11) NULL DEFAULT NULL,
  `telegram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lokasi` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 513 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin', '08111040159', 'admin@gmail.com', '2022-12-13 18:51:38', '$2y$10$5QfpNOOqhLMoP/kXmrxDa.CS5VIWq/cgESgOnWfvFfE71d3a1P0By', 'admin', 100, 1, NULL, NULL, '2024-11-07 22:59:34', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'Itok toni laksono', 'itoktoni', '08111040159', 'itok.toni@gmail.com', '2024-10-13 16:43:38', '$2y$10$rxbaKdP5R3anQc3hJLRX4Otzwzgv/Cl0IQsZG0S4qku/gGKdn3vdC', 'admin', 100, 1, 'LRi91YjgVd', '2024-10-13 16:44:03', '2025-02-17 14:48:35', NULL, '843133427', NULL);
INSERT INTO `users` VALUES (502, 'Ady Sunanto', 'asun', '08561117174', 'asun.movenshare@gmail.com', NULL, '$2y$10$PepyUhQAnHfUz3iFwqNslu5vcu2UWM57ghNB/zeMUm2UFs3iQgZiG', 'admin', 30, 1, NULL, '2025-02-22 14:10:43', '2025-02-25 08:47:52', NULL, '79417929', NULL);
INSERT INTO `users` VALUES (503, 'Ari Firmansyah', 'Arie Firmansyah', '081226421421', 'elsyahficalibratechmandiri@gmail.com', NULL, '$2y$10$se.d7eDd31sNDxzqOgSaIOfj1bflRNzUbf4qS7G80yGqYhMC6gn1a', 'admin', NULL, 1, NULL, '2025-02-22 14:52:18', '2025-07-09 08:57:15', NULL, NULL, NULL);
INSERT INTO `users` VALUES (504, 'Teknisi', 'bersedekahlah1000', NULL, 'teknisi@gmail.com', NULL, '$2y$10$FCC8OI/SYz7wUSWMeuU2h./J2vkfij6mmQbnkOd2Xhn3GhxjdEdRq', 'teknisi', 10, 1, NULL, '2025-02-22 16:23:44', '2025-11-24 11:15:39', NULL, '1925206875', NULL);
INSERT INTO `users` VALUES (505, 'User', 'userecm123', NULL, 'user@gmail.com', NULL, '$2y$10$FCC8OI/SYz7wUSWMeuU2h./J2vkfij6mmQbnkOd2Xhn3GhxjdEdRq', 'user', 1, 1, NULL, '2025-02-22 16:29:52', '2025-11-27 18:39:45', NULL, '8271064825', 5);
INSERT INTO `users` VALUES (506, 'Management', 'management', NULL, 'management@gmail.com', NULL, '$2y$10$tiMW.2dnm9iflaNBTKKpxue2Eef/dGiLC45LQ84Lvt7cO94FB8sEu', 'management', 40, 1, NULL, '2025-02-22 16:30:29', '2025-02-22 16:30:29', NULL, NULL, NULL);
INSERT INTO `users` VALUES (507, 'Farizal Elsyahfi', 'Elsyahfi', '082172494107', 'farizaelsyahfi@gmail.com', NULL, '$2y$10$96F.L6sXcbYrChNITZikLuSs28h4MuQ9C.5L5iKRCux8kkzSkEW7W', 'admin', 30, 1, NULL, '2025-02-25 14:58:00', '2025-02-25 15:07:14', NULL, '6634742831', NULL);
INSERT INTO `users` VALUES (508, 'teknisi', 'teknisi', '423432', 'teknisi@gmail.com.com', NULL, '$2y$10$GBh0wgtj1y0lqA8ElaPQ1.XbTJYrNaRBQ7bWm0sxQnJ4GLoAhsLN.', 'teknisi', 10, 1, NULL, '2025-11-27 17:33:32', '2025-11-27 17:33:32', NULL, '843133427', NULL);
INSERT INTO `users` VALUES (510, 'Muhlis', NULL, NULL, 'muhlisluawo@gmail.com', NULL, '$2y$10$ma8nBj3P3YAx2rgi2cLBT.x5GhDHrhQvXvczi9KMg.mYNUBwAMYs6', NULL, NULL, 0, NULL, '2025-12-13 22:59:01', '2026-01-10 11:35:33', NULL, '1555841008', NULL);
INSERT INTO `users` VALUES (511, 'ARI FIRMANSYAH', NULL, NULL, 'ptcalibratech@gmail.com', NULL, '$2y$10$bABzlcVBreA2zY98GaAoyOivfbgKM5kRf8BrEFCYlMuVk7pfvGswC', NULL, NULL, 0, NULL, '2025-12-23 08:34:23', '2025-12-23 08:34:23', NULL, NULL, NULL);
INSERT INTO `users` VALUES (512, 'ari', NULL, NULL, 'masarifirmansyah@gmail.com', NULL, '$2y$10$FYS/dFFE5xzTNuGESmf3kurGWqJLSJkhAh7RJU2m2VeR8Ts.cBMpa', NULL, NULL, 0, NULL, '2026-01-10 11:27:50', '2026-01-10 11:27:50', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor`  (
  `vendor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_alamat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_id`) USING BTREE,
  INDEX `vendor_id`(`vendor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO `vendor` VALUES (2, 'PT. Elsyahfi Calibratech Mandiri', 'Ari Firmansyah, S.T.Tr.', '081226421421', 'elsyahficalibratechmandiri@gmail.com', 'Perumahan Nuansa Mandiri Permai No. B4 Cubadak Air Jl. Perkutut RT. 02/04 Kel, Tigo Koto Di ate, Kec. Payakumbuh Utara, Kota Payakumbuh, Sumatera Barat 26216', NULL);
INSERT INTO `vendor` VALUES (5, 'ECM Software', 'Itok Toni Laksono', '08111040159', NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (6, 'ECM Medical Device Management', 'Ady Sunanto', '08561117174', NULL, NULL, NULL);

-- ----------------------------
-- View structure for view_role
-- ----------------------------
DROP VIEW IF EXISTS `view_role`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_role` AS select `system_menu`.`system_menu_code` AS `system_menu_code`,`system_menu`.`system_menu_name` AS `system_menu_name`,`system_menu`.`system_menu_url` AS `system_menu_url`,`system_menu`.`system_menu_controller` AS `system_menu_controller`,`system_menu`.`system_menu_action` AS `system_menu_action`,`system_menu`.`system_menu_type` AS `system_menu_type`,`system_menu`.`system_menu_sort` AS `system_menu_sort`,`system_menu`.`system_menu_description` AS `system_menu_description`,`system_menu`.`system_menu_enable` AS `system_menu_enable`,`system_menu`.`system_menu_can_delete` AS `system_menu_can_delete`,`system_group_connection_role`.`system_role_code` AS `system_role_code` from (((`system_role` join `system_group_connection_role` on(`system_role`.`system_role_code` = `system_group_connection_role`.`system_role_code`)) join `system_group_connection_menu` on(`system_group_connection_menu`.`system_group_code` = `system_group_connection_role`.`system_group_code`)) join `system_menu` on(`system_menu`.`system_menu_code` = `system_group_connection_menu`.`system_menu_code`));

SET FOREIGN_KEY_CHECKS = 1;
