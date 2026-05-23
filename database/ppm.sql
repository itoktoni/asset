/*
 Navicat Premium Data Transfer

 Source Server         : Ryzen
 Source Server Type    : MariaDB
 Source Server Version : 100527 (10.5.27-MariaDB-log)
 Source Host           : localhost:3306
 Source Schema         : ppm

 Target Server Type    : MariaDB
 Target Server Version : 100527 (10.5.27-MariaDB-log)
 File Encoding         : 65001

 Date: 23/05/2026 08:53:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, 'Gedung A');
INSERT INTO `area` VALUES (2, 'Gedung B');
INSERT INTO `area` VALUES (3, 'Gd. Radiologi & Kedokteran Nuklir');
INSERT INTO `area` VALUES (4, 'Gd. Prof. Dr. dr. Mangli');
INSERT INTO `area` VALUES (5, 'Gd. Administratif');
INSERT INTO `area` VALUES (6, 'Gd. IPSRS');
INSERT INTO `area` VALUES (7, 'Gd. Parkir');

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
  `asset_sertifikat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`asset_id`) USING BTREE,
  UNIQUE INDEX `asset_serial_number`(`asset_serial_number`) USING BTREE,
  INDEX `asset_ibfk_1`(`asset_id_penamaan`) USING BTREE,
  INDEX `asset_id_department`(`asset_id_department`) USING BTREE,
  INDEX `asset_id_lokasi`(`asset_id_lokasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asset
-- ----------------------------
INSERT INTO `asset` VALUES (4, 'Bedside Monitor ~  ( Samsung ) Z-001 | 123', '123', '202502090000001', 'BAIK', 'Yes', 'Garansi', NULL, '1739073199.jpg', 3, 1, 1, 1, 1, 1, 6, 'keterangan', '2025-02-09 10:52:05', '2025-02-20 10:25:58', '2025-02-20 10:25:58', 1, 1, 1, 90000000, 2001, '2025-02-09', '2025-08-21', '2025-02-20', 'Inspeksi', 'APBN', 'AKD 10902110256', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (5, 'Coagulation Instrument ~  ( Samsung ) Z-001 | 1123', '1123', '202502130000001', NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, 1, 1, NULL, 'test', '2025-02-13 08:16:32', '2025-02-20 10:26:07', '2025-02-20 10:26:07', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (6, 'CT-SCAN ~  ( Samsung ) Z-001 | 1234567', '1234567', '202502170000001', 'MAINTENANCE', 'Yes', NULL, NULL, '1739954110.jpg', 5, NULL, 1, 2, 1, 1, 6, NULL, '2025-02-17 10:14:40', '2025-02-20 19:57:07', '2025-02-20 19:57:07', 1, 1, 1, NULL, NULL, '2025-02-16', '2026-02-19', NULL, 'Inventaris', 'BLU', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (7, 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80-ECO | 13030688', '13030688', '2035286', 'BAIK', 'Yes', 'Internal', 'Internal', '1753067432.jpg', 1131, 6, NULL, NULL, 22, 5, 7, NULL, '2025-02-20 19:56:56', '2025-07-24 09:04:36', '2025-07-24 09:04:36', 1, 1, 1, NULL, NULL, '2025-07-08', '2025-07-08', '2024-02-25', 'Inventaris', NULL, 'AKD 20903700359', NULL, NULL, '2025-02-25', 'sertif001.pdf');
INSERT INTO `asset` VALUES (8, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3207', 'VGSNE3207', '2033998', 'BAIK', 'Yes', 'Internal', 'Internal', '1753068642.jpg', 893, 2, NULL, NULL, 15, 2, 6, NULL, '2025-02-20 20:06:26', '2025-07-24 08:42:22', '2025-07-24 08:42:22', 1, 1, 1, NULL, NULL, '2025-07-23', '2026-01-22', '2024-12-05', 'Preventif', NULL, 'AKL 20502714778', NULL, NULL, '2025-12-05', 'sertif001.pdf');
INSERT INTO `asset` VALUES (9, 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453201', 'CPN23453201', '202502210000001', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753156006.jpg', 1172, 9, NULL, NULL, 53, 68, 11, NULL, '2025-02-21 00:01:45', '2025-07-24 09:11:26', '2025-07-24 09:11:26', 1, 1, 1, NULL, NULL, '2024-11-22', '2024-11-22', '2024-12-04', 'Inventaris', NULL, 'AKD 21501520070', NULL, NULL, '2025-12-04', 'sertif002.pdf');
INSERT INTO `asset` VALUES (10, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE4818', 'VGSNE4818', '2035422', 'BAIK', 'Yes', 'Internal', 'Internal', '1753258305.jpg', 893, 19, NULL, NULL, 15, 2, 6, NULL, '2025-02-21 00:04:25', '2025-07-24 08:47:42', '2025-07-24 08:47:42', 1, 1, 1, NULL, NULL, '2025-07-23', '2026-01-22', '2024-12-05', 'Preventif', NULL, 'AKL 20502714778', NULL, NULL, '2025-12-05', 'sertif005.pdf');
INSERT INTO `asset` VALUES (11, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Riester ) RBP-100 | RN-92827', 'RN-92827', '202502210000003', 'BAIK', 'Yes', 'Internal', 'Internal', '1753231986.jpg', 1147, 12, NULL, NULL, 55, 75, 6, NULL, '2025-02-21 00:06:38', '2025-07-24 10:45:34', '2025-07-24 10:45:34', 1, 1, 1, NULL, NULL, '2024-08-23', '2024-08-23', '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05', 'sertif006.pdf');
INSERT INTO `asset` VALUES (12, 'Mikroskop Binocular ~  ( Olympus ) CX21 | Oly0928CX', 'Oly0928CX', '202502210000004', 'BAIK', 'Yes', 'Internal', 'Internal', '1753232116.jpg', 1051, 2, NULL, NULL, 34, 77, 6, NULL, '2025-02-21 00:08:41', '2025-07-24 11:00:57', '2025-07-24 11:00:57', 1, 1, 1, NULL, NULL, '2024-02-13', '2024-02-13', '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05', 'sertif004.pdf');
INSERT INTO `asset` VALUES (13, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Elitech ) PM Pro3 | PM10228A00345', 'PM10228A00345', '202502210000005', 'BAIK', 'Yes', 'Internal', 'Internal', '1753232327.jpg', 893, 9, NULL, NULL, 23, 3, 6, NULL, '2025-02-21 00:18:42', '2025-07-24 11:03:07', '2025-07-24 11:03:07', 1, 1, 1, NULL, NULL, '2025-01-29', '2025-07-31', '2024-12-06', 'Preventif', NULL, NULL, NULL, NULL, '2025-12-06', 'sertif009.pdf');
INSERT INTO `asset` VALUES (14, 'Oxygen Concentrator/Portable Oxygen Generator ~  ( Burtons ) Oxi-Gen10 | BRTN09279010', 'BRTN09279010', '202502210000006', 'BAIK', 'Yes', 'Internal', 'Internal', '1753232726.png', 1072, 2, NULL, NULL, 54, 68, 6, NULL, '2025-02-21 00:21:23', '2025-07-24 11:29:39', '2025-07-24 11:29:39', 1, 1, 1, NULL, NULL, '2024-09-11', '2025-09-11', '2024-12-06', 'Preventif', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (15, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Elitech ) PM Pro3 | PM10228A00040', 'PM10228A00040', '202502210000007', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 18, NULL, NULL, 23, 4, 6, NULL, '2025-02-21 00:27:36', '2025-07-24 08:37:20', '2025-07-24 08:37:20', 1, 1, 1, NULL, NULL, '2025-01-28', '2025-07-30', '2024-12-06', 'Preventif', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (16, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Nihon Kohden ) BSM-6701 | NKBM2345', 'NKBM2345', '202502210000008', 'BAIK', 'Yes', 'Internal', 'Internal', '1753320911.jpg', 893, 9, NULL, NULL, 148, 8, NULL, NULL, '2025-02-21 00:31:26', '2025-07-24 11:27:48', '2025-07-24 11:27:48', 1, 1, 1, NULL, NULL, '2025-04-17', '2025-10-17', '2024-12-06', 'Preventif', NULL, 'AKL 20502910063', NULL, NULL, '2025-12-06', 'sertif008.pdf');
INSERT INTO `asset` VALUES (17, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2980', 'VGSNE2980', '202502210000009', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, NULL, NULL, '2025-02-21 07:29:39', '2025-07-24 08:37:20', '2025-07-24 08:37:20', 1, 1, 1, NULL, NULL, '2025-07-30', '2026-01-29', '2024-12-05', 'Preventif', NULL, NULL, NULL, NULL, '2025-12-05', NULL);
INSERT INTO `asset` VALUES (18, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE2952', 'VGSNE2952', '202502210000010', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 5, NULL, NULL, '2025-02-21 07:38:10', '2025-07-24 08:37:20', '2025-07-24 08:37:20', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (19, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE4814', 'VGSNE4814', '202502210000011', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, NULL, NULL, '2025-02-21 07:41:43', '2025-07-24 08:37:20', '2025-07-24 08:37:20', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05', NULL);
INSERT INTO `asset` VALUES (20, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0102', 'VTSLC0102', '202502210000012', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 07:43:39', '2025-02-22 07:20:46', '2025-02-22 07:20:46', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (21, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLM0029', 'VTSLM0029', '202502210000013', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 07:45:20', '2025-07-24 08:37:20', '2025-07-24 08:37:20', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (22, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSN3266', 'VGSN3266', '202502210000014', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 07:51:30', '2025-07-24 08:37:21', '2025-07-24 08:37:21', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (23, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0181', 'VTSLC0181', '202502210000015', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 2, NULL, NULL, '2025-02-21 08:24:12', '2025-07-24 08:37:21', '2025-07-24 08:37:21', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05', NULL);
INSERT INTO `asset` VALUES (24, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLC0170', 'VTSLC0170', '202502210000016', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 5, NULL, NULL, '2025-02-21 08:32:37', '2025-07-24 08:37:21', '2025-07-24 08:37:21', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (25, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3268', 'VGSNE3268', '202502210000017', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 08:34:01', '2025-07-24 08:37:21', '2025-07-24 08:37:21', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (26, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VTSLM3212', 'VTSLM3212', '202502210000018', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 08:42:26', '2025-07-24 08:37:21', '2025-07-24 08:37:21', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (27, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3270', 'VGSNE3270', '202502210000019', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 893, 2, NULL, NULL, 15, 3, NULL, NULL, '2025-02-21 08:43:35', '2025-07-24 08:37:21', '2025-07-24 08:37:21', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (28, 'Brachiterapy ~  ( Varian ) Bravos | VTSLC0093', 'VTSLC0093', '202502210000020', 'BAIK', 'Yes', 'Internal', 'Internal', '1753318294.jpg', 910, 17, NULL, NULL, 137, 112, 6, NULL, '2025-02-21 13:35:42', '2025-07-24 11:36:14', '2025-07-24 11:36:14', 1, 1, 1, NULL, NULL, '2025-07-23', '2026-01-22', '2024-12-05', 'Inspeksi', NULL, 'AKL 21502420030', NULL, NULL, '2025-12-05', 'sertif002.pdf');
INSERT INTO `asset` VALUES (29, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US92144751', 'US92144751', '202502210000021', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 3, NULL, NULL, '2025-02-21 13:43:27', '2025-07-24 11:29:53', '2025-07-24 11:29:53', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (30, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US51941979', 'US51941979', '202502210000022', 'BAIK', 'Yes', 'Internal', 'Internal', '1753068747.jpg', 950, 9, NULL, NULL, 12, 68, NULL, NULL, '2025-02-21 15:10:13', '2025-07-24 11:30:16', '2025-07-24 11:30:16', 1, 1, 1, NULL, NULL, '2025-07-03', NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', 'sertif003.pdf');
INSERT INTO `asset` VALUES (31, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US82144640', 'US82144640', '202502210000023', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 5, NULL, NULL, '2025-02-21 15:11:54', '2025-07-24 11:30:24', '2025-07-24 11:30:24', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (32, 'Electrocardiograph (ECG/EKG) 3 CH ~  ( Endo ) EL-ECG3CH | ECG31P21230345', 'ECG31P21230345', '202502210000024', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1192, 2, NULL, NULL, 27, 3, NULL, NULL, '2025-02-21 15:13:45', '2025-07-24 11:36:25', '2025-07-24 11:36:25', 1, 1, 1, NULL, NULL, '2025-07-23', '2025-07-23', '2024-12-06', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-06', NULL);
INSERT INTO `asset` VALUES (33, 'CT-Scan 64 Slices ~  ( GE ) Revolution EVO | RE36A2200104YC', 'RE36A2200104YC', '202502210000025', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 939, 2, NULL, NULL, 25, 6, NULL, NULL, '2025-02-21 15:19:09', '2025-07-24 11:36:56', '2025-07-24 11:36:56', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-05', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-05', NULL);
INSERT INTO `asset` VALUES (34, 'Electrocardiograph (ECG/EKG) Monitor ~  ( Philips ) TC50 | US52042973', 'US52042973', '202502210000026', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 950, 2, NULL, NULL, 12, 7, NULL, NULL, '2025-02-21 15:22:04', '2025-07-24 11:36:56', '2025-07-24 11:36:56', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-04', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-04', NULL);
INSERT INTO `asset` VALUES (35, 'Ultrasonography (USG) 4D ~  ( GE ) Versana Premier | TDN00010', 'TDN00010', '202502210000027', 'BAIK', 'Yes', 'Internal', 'Internal', '1753068882.jpg', 1173, 2, NULL, NULL, 29, 16, NULL, NULL, '2025-02-21 15:24:49', '2025-07-24 11:37:23', '2025-07-24 11:37:23', 1, 1, 1, NULL, NULL, '2024-08-23', '2024-08-23', '2024-12-11', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-11', NULL);
INSERT INTO `asset` VALUES (36, 'Spirometer ~  ( Fukuda ) ST-170 | 87050197', '87050197', '202502210000028', 'BAIK', 'Yes', 'Internal', 'Internal', '1753068931.jpg', 1128, 2, NULL, NULL, 30, 45, NULL, NULL, '2025-02-21 15:27:25', '2025-07-24 11:37:49', '2025-07-24 11:37:49', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-13', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-13', NULL);
INSERT INTO `asset` VALUES (37, 'Ultrasonography (USG) 3D ~  ( GE ) LOGIQ e | 6077254WXO', '6077254WXO', '202502210000029', 'BAIK', 'Yes', 'Internal', 'Internal', '1753069073.jpg', 1172, 2, NULL, NULL, 31, 9, NULL, NULL, '2025-02-21 19:33:53', '2025-07-24 11:37:52', '2025-07-24 11:37:52', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-19', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-19', NULL);
INSERT INTO `asset` VALUES (38, 'Ultrasonography (USG) 4D ~  ( Philips ) EPIQ 5G | US517C1416', 'US517C1416', '202502210000030', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1173, 2, NULL, NULL, 32, 9, NULL, NULL, '2025-02-21 20:03:34', '2025-07-24 11:37:56', '2025-07-24 11:37:56', 1, 1, 1, NULL, NULL, '2025-07-28', '2025-07-28', '2024-12-19', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-19', NULL);
INSERT INTO `asset` VALUES (39, 'Phototherapy Unit ~  ( Bistos ) BT-400 | BL02222A0005', 'BL02222A0005', '202502210000031', 'BAIK', 'Yes', 'Internal', 'Internal', '1753256404.jpg', 1096, 2, NULL, NULL, 57, 4, NULL, NULL, '2025-02-21 20:14:40', '2025-07-24 11:38:58', '2025-07-24 11:38:58', 1, 1, 1, NULL, NULL, '2025-07-23', '2026-01-22', '2024-12-18', 'Preventif', NULL, NULL, NULL, NULL, '2025-12-18', 'sertif008.pdf');
INSERT INTO `asset` VALUES (40, 'Mikroskop Binocular ~  ( Olympus ) CX21 | 9M81880', '9M81880', '202502210000032', 'BAIK', 'Yes', 'Internal', 'Internal', '1753069173.jpg', 1051, 2, NULL, NULL, 34, 46, NULL, NULL, '2025-02-21 20:21:54', '2025-07-24 11:39:31', '2025-07-24 11:39:31', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-12-18', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-18', NULL);
INSERT INTO `asset` VALUES (41, 'USG ~  ( ASun ) AS1211 | SNT4090', 'SNT4090', '202502220000001', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1196, NULL, NULL, NULL, 35, NULL, NULL, NULL, '2025-02-22 06:50:05', '2025-02-22 11:18:25', '2025-02-22 11:18:25', 1, 1, 1, NULL, NULL, '2024-10-02', NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (42, 'USG ~  ( ASun ) AS1211 | SNT4091', 'SNT4091', '202502220000002', 'MAINTENANCE', 'Yes', 'Garansi', 'Internal', NULL, 1196, NULL, NULL, NULL, 35, 13, NULL, NULL, '2025-02-22 06:51:05', '2025-02-22 12:44:41', '2025-02-22 12:44:41', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-01-02', 'Inventaris', NULL, NULL, NULL, NULL, '2025-01-02', NULL);
INSERT INTO `asset` VALUES (43, 'Acupunture Therapy/Electro Acupuncture (EAT) | 456', '456', '202502220000003', NULL, NULL, NULL, NULL, NULL, 860, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '2025-02-22 07:20:09', '2025-02-22 11:16:29', '2025-02-22 11:16:29', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (44, 'Acupunture Therapy/Electro Acupuncture (EAT) ~  ( GE ) VVIDE95 | 123456', '123456', '202502220000004', 'BAIK', NULL, 'Internal', 'Internal', NULL, 860, NULL, NULL, NULL, 17, 14, NULL, NULL, '2025-02-22 11:29:20', '2025-02-22 12:45:02', '2025-02-22 12:45:02', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (45, 'kursi roda ~  ( GE ) VVIDE95', NULL, '202502220000005', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1197, NULL, NULL, NULL, 17, 14, NULL, NULL, '2025-02-22 11:51:57', '2025-02-22 12:44:56', '2025-02-22 12:44:56', 1, 3, 1, NULL, NULL, NULL, NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (46, 'Dental Unit ~  ( Belmont ) Clesta | AD14J0176', 'AD14J0176', '2034134', 'BAIK', 'Yes', 'Internal', 'Internal', '1753069322.jpg', 944, NULL, NULL, NULL, 49, 10, NULL, NULL, '2025-02-25 12:06:08', '2025-07-24 11:39:31', '2025-07-24 11:39:31', 1, 1, 502, NULL, NULL, '2025-01-02', '2025-07-04', '2024-12-10', 'Preventif', NULL, NULL, NULL, NULL, '2025-12-10', NULL);
INSERT INTO `asset` VALUES (47, 'Automated Blood Culture System ~  ( Versatek ) 240 | 1169446001180710', '1169446001180710', '2033638', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 877, 2, NULL, NULL, 51, 46, 6, NULL, '2025-02-25 15:48:15', '2025-07-24 11:40:13', '2025-07-24 11:40:13', 1, 507, 507, NULL, NULL, NULL, NULL, '2024-12-18', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-18', NULL);
INSERT INTO `asset` VALUES (48, 'Endoscopy ~  ( FujiFilm ) 4400 | 15088A539', '15088A539', '2035147', 'BAIK', 'Yes', 'Internal', 'Internal', '1753069457.jpg', 959, 2, NULL, NULL, 52, 48, NULL, NULL, '2025-02-25 16:13:21', '2025-07-24 11:41:21', '2025-07-24 11:41:21', 1, 1, 507, NULL, NULL, NULL, NULL, '2024-12-23', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-23', NULL);
INSERT INTO `asset` VALUES (49, 'Centrifuge, Cyto Centrifuge ~  ( Eppendorf ) 5702 | 5702CQ734497', '5702CQ734497', '2033988', 'BAIK', 'Yes', 'Internal', 'Internal', '1753069510.jpg', 917, 2, NULL, NULL, 45, 40, 6, NULL, '2025-02-25 16:20:23', '2025-07-24 11:41:21', '2025-07-24 11:41:21', 1, 1, 507, NULL, NULL, NULL, NULL, '2024-12-19', 'Inventaris', NULL, NULL, NULL, NULL, '2025-12-19', NULL);
INSERT INTO `asset` VALUES (50, 'Ventilator Non-Invasif Anak/Dewasa ~  ( Drager ) Vista XL | drgr1234', 'drgr1234', '202507220000001', 'BAIK', 'Yes', 'Garansi', 'Internal', NULL, 1183, NULL, NULL, NULL, 16, 2, NULL, NULL, '2025-07-22 11:06:39', '2025-07-24 11:40:13', '2025-07-24 11:40:13', 1, 1, 1, NULL, NULL, '2025-05-13', '2025-11-12', NULL, 'Inspeksi', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (51, 'Ventilator Konvensional Anak/Dewasa ~  ( Drager ) Vista 120 | drgr123433', 'drgr123433', '202507220000002', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 1182, NULL, NULL, NULL, 15, 2, NULL, NULL, '2025-07-22 11:07:59', '2025-07-24 11:40:13', '2025-07-24 11:40:13', 1, 1, 1, NULL, NULL, '2025-07-22', '2026-01-21', NULL, 'Inspeksi', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (52, 'Brachiterapy ~  ( Elekta ) FLexitron | sss', 'sss', '202507230000001', 'BAIK', 'Yes', 'Internal', 'Internal', NULL, 910, 2, NULL, NULL, 138, 112, NULL, NULL, '2025-07-23 09:37:43', '2025-07-24 11:41:21', '2025-07-24 11:41:21', 1, 1, 1, NULL, NULL, '2025-07-02', '2026-01-01', NULL, 'Inspeksi', NULL, 'AKL 21502615840', NULL, NULL, NULL, 'sertif001.pdf');
INSERT INTO `asset` VALUES (53, 'Demo Hitungan ~  ( DEMO ) DEMO | 11111111', '11111111', '202507230000002', 'BAIK', 'No', NULL, NULL, '1753240132.png', 1199, NULL, NULL, NULL, 56, 105, NULL, NULL, '2025-07-23 10:08:53', '2025-07-23 11:00:58', '2025-07-23 11:00:58', 1, 1, 1, NULL, NULL, '2025-06-23', NULL, NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (54, 'Demo Hitungan ~  ( DEMO ) DEMO | 11111', '11111', '202507230000003', 'BAIK', NULL, NULL, NULL, '1753241845.png', 1199, NULL, NULL, NULL, 56, 105, NULL, NULL, '2025-07-23 10:37:25', '2025-07-23 11:00:58', '2025-07-23 11:00:58', 1, 1, 1, NULL, NULL, '2025-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (55, 'Acupunture Therapy/Electro Acupuncture (EAT) | 55555', '55555', '202507230000004', NULL, NULL, NULL, NULL, NULL, 860, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '2025-07-23 10:44:09', '2025-07-24 11:40:13', '2025-07-24 11:40:13', 1, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (56, 'Agregometer | 34242', '34242', '202507230000005', NULL, NULL, NULL, NULL, NULL, 861, NULL, NULL, NULL, NULL, 12, NULL, 'test', '2025-07-23 10:46:45', '2025-07-24 11:04:47', '2025-07-24 11:04:47', 1, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (57, 'Air Warming Blanket ~  ( Prufen ) LS601 | SNR0000192', 'SNR0000192', '202507230000006', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753323637.jpg', 862, 9, 13, NULL, 149, 33, 7, 'test', '2025-07-23 10:49:39', '2025-07-24 16:10:08', NULL, NULL, 1, 3, NULL, NULL, '2025-07-24', '2026-01-22', '2025-03-05', 'Inspeksi', NULL, 'AKD 20505420017', NULL, NULL, '2026-03-05', 'sertif003.pdf');
INSERT INTO `asset` VALUES (58, 'Demo Hitungan ~  ( DEMO ) DEMO | 11111a', '11111a', '202507230000007', NULL, NULL, NULL, NULL, NULL, 1199, NULL, NULL, NULL, 56, 105, NULL, NULL, '2025-07-23 10:57:59', '2025-07-23 11:00:38', '2025-07-23 11:00:38', 1, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (59, 'Demo Hitungan ~  ( DEMO ) DEMO | 23444', '23444', '202507230000008', 'BAIK', 'Yes', NULL, 'Lainnya', '1753323001.png', 1199, 5, 6, NULL, 56, 105, 7, NULL, '2025-07-23 10:58:32', '2025-07-24 09:23:42', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2026-01-22', '2025-07-23', 'Inspeksi', NULL, NULL, '2025-07-23', '2025-07-23', '2026-07-23', 'Qurban 2026 by Hewanpilihan ID_Final.pdf');
INSERT INTO `asset` VALUES (60, 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80A | 23030688', '23030688', '202507230000009', 'BAIK', 'Yes', 'Internal', 'Internal', '1753256984.jpg', 1131, 9, 31, NULL, 20, 5, 6, NULL, '2025-07-23 14:48:40', '2025-07-24 16:08:44', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', '2025-01-13', 'Inventaris', NULL, 'AKD 20903700359', NULL, '2025-07-23', '2026-01-13', 'sertif001.pdf');
INSERT INTO `asset` VALUES (61, 'Agregometer ~  ( Terumo ) SS-700 | 14241214', '14241214', '202507230000010', 'BAIK', 'Yes', NULL, 'Internal', NULL, 861, NULL, NULL, NULL, 10, 40, NULL, NULL, '2025-07-23 21:37:14', '2025-07-24 11:40:13', '2025-07-24 11:40:13', 1, 1, 1, NULL, NULL, '2024-06-12', '2024-06-12', NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (62, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE3209', 'VGSNE3209', '202507240000001', 'BAIK', 'Yes', 'Internal', 'Internal', '1753321313.jpg', 893, 15, 30, NULL, 15, 2, 6, NULL, '2025-07-24 08:40:08', '2025-07-24 16:07:58', NULL, NULL, 1, 1, NULL, NULL, '2025-07-23', '2026-01-22', '2024-06-24', 'Preventif', NULL, 'AKL 20502714778', NULL, NULL, '2025-06-24', 'sertif004.pdf');
INSERT INTO `asset` VALUES (63, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Drager ) Vista 120 | VGSNE4819', 'VGSNE4819', '202507240000002', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753321531.jpg', 893, 9, 30, NULL, 15, 7, 7, NULL, '2025-07-24 08:45:31', '2025-07-24 16:07:22', NULL, NULL, 1, 1, NULL, NULL, '2024-07-17', '2025-01-16', '2024-08-16', 'Preventif', NULL, 'AKL 20502714778', NULL, NULL, '2025-08-16', 'sertif001.pdf');
INSERT INTO `asset` VALUES (64, 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453207', 'CPN23453207', '202507240000003', 'BAIK', 'Yes', 'Internal', 'Internal', '1753322863.jpg', 1172, 11, 29, NULL, 53, 16, 6, NULL, '2025-07-24 09:07:44', '2025-07-24 16:06:25', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', '2025-02-06', 'Inventaris', NULL, 'AKD 21501520070', NULL, NULL, '2026-02-06', 'sertif004.pdf');
INSERT INTO `asset` VALUES (65, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Riester ) RBP-100 | RN-92828', 'RN-92828', '202507240000004', 'BAIK', 'Yes', 'Internal', 'Internal', '1753328648.jpg', 1147, 9, 28, NULL, 55, 374, 6, NULL, '2025-07-24 10:44:08', '2025-07-27 13:19:20', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', '2025-01-21', 'Inventaris', NULL, 'AKL 20501918258', NULL, NULL, '2026-01-21', 'sertif007.pdf');
INSERT INTO `asset` VALUES (66, 'Mikroskop Binocular ~  ( Olympus ) CX23 | OLY01928CX', 'OLY01928CX', '202507240000005', 'BAIK', 'Yes', 'Internal', 'Internal', '1753329642.jpg', 1051, 9, NULL, NULL, 34, 46, 6, NULL, '2025-07-24 11:00:42', '2025-07-24 11:05:15', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', '2025-07-24', 'Inventaris', NULL, 'AKL 10203220073', NULL, NULL, '2026-07-24', 'sertif003.pdf');
INSERT INTO `asset` VALUES (67, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Nihon Kohden ) BSM-6701 | NKBM0823', 'NKBM0823', '202507240000006', 'BAIK', 'Yes', 'Internal', 'Internal', '1753331018.jpg', 893, 9, 27, NULL, 148, 7, 6, NULL, '2025-07-24 11:23:38', '2025-07-24 16:04:24', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2026-01-23', '2024-07-25', 'Preventif', NULL, 'AKL 20502910063', NULL, NULL, '2025-07-25', 'sertif001.pdf');
INSERT INTO `asset` VALUES (68, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor ~  ( Nihon Kohden ) BSM-6701 | NKBM08299', 'NKBM08299', '202507240000007', 'BAIK', 'Yes', 'Internal', 'Internal', '1753331071.jpg', 893, NULL, NULL, NULL, 148, 7, 6, NULL, '2025-07-24 11:24:31', '2025-07-24 11:25:50', '2025-07-24 11:25:50', 1, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', NULL, NULL, NULL, 'AKL 20502910063', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (69, 'Brachiterapy ~  ( Varian ) Bravos | VTSLC0091', 'VTSLC0091', '202507240000008', 'BAIK', 'Yes', 'Kontrak', 'KSO', '1753331730.jpg', 910, NULL, 26, NULL, 137, 112, 9, NULL, '2025-07-24 11:35:31', '2025-07-24 16:02:30', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2026-01-23', NULL, 'Inspeksi', NULL, 'AKL 21502420030', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (70, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12214', 'OMR12214', '202507240000009', 'BAIK', 'Yes', 'Internal', 'Internal', '1753343932.jpg', 1147, 9, 25, NULL, 208, 68, 11, NULL, '2025-07-24 14:58:52', '2025-07-24 15:50:44', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', NULL, 'Inventaris', NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (71, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-7320 | OMR90244', 'OMR90244', '202507240000010', 'BAIK', 'Yes', 'Internal', 'Internal', '1753344074.jpg', 1147, 9, 25, NULL, 209, 68, 6, NULL, '2025-07-24 15:01:14', '2025-07-24 15:50:12', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2025-07-24', NULL, 'Inventaris', NULL, 'AKL 20501817806', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (72, 'Suction, Suction Pump/Pompa Vakum /Vacuum-Powered Body Fluid Suction Apparatus; Suction Pump Mobile ~  ( AFA ) AC 500 | AFA01294', 'AFA01294', '202507240000011', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753360600.jpg', 1143, NULL, 16, NULL, 210, 69, 11, NULL, '2025-07-24 19:36:40', '2025-07-25 07:44:02', NULL, NULL, 1, 1, NULL, NULL, '2025-07-24', '2026-07-24', NULL, 'Preventif', NULL, 'AKL 21603913742', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (73, 'Acupunture Therapy/Electro Acupuncture (EAT) | 12', '12', '202507250000001', NULL, NULL, NULL, NULL, NULL, 860, NULL, NULL, NULL, NULL, 343, NULL, NULL, '2025-07-25 07:29:03', '2025-07-25 07:42:23', '2025-07-25 07:42:23', 1, 1, 1, NULL, NULL, '2025-07-25', '2025-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (74, 'Dental Unit ~  ( Smic ) TJ-2688 | SMIC1234', 'SMIC1234', '202507250000002', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753406590.webp', 944, NULL, NULL, NULL, 211, 70, NULL, NULL, '2025-07-25 08:23:10', '2025-07-25 08:23:10', NULL, NULL, 1, 1, NULL, NULL, '2025-07-25', '2025-07-25', NULL, NULL, NULL, 'AKL 10605702507', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (75, 'Pesawat Sinar-X, X-Ray Mobile Analog ~  ( Siemens ) Multimobil 2.5 | SIEM9272', 'SIEM9272', '202507260000001', 'BAIK', 'Yes', 'Internal', 'Internal', '1753482739.jpg', 1093, NULL, 32, NULL, 212, 9, 6, NULL, '2025-07-26 05:29:43', '2025-07-26 05:32:40', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2026-01-25', NULL, 'Preventif', NULL, 'AKL 21501700588', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (76, 'CT-Scan 16 Slices ~  ( Siemens ) Somatom Emotion 16 | SIEM8778', 'SIEM8778', '202507260000002', 'BAIK', NULL, 'Kontrak', 'Internal', '1753483635.jpg', 935, NULL, NULL, NULL, 213, 368, NULL, NULL, '2025-07-26 05:47:15', '2025-07-26 05:47:15', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 21501804926', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (77, 'Pesawat Sinar-X, Mammografi ~  ( Siemens ) Mammomat 1000 | SIEM87921', 'SIEM87921', '202507260000003', 'BAIK', 'Yes', NULL, NULL, '1753483962.jpg', 1087, NULL, NULL, NULL, 214, 369, NULL, NULL, '2025-07-26 05:52:42', '2025-07-26 07:42:06', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2026-01-25', NULL, 'Preventif', NULL, 'AKL 21501011807', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (78, 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80 | 23030684', '23030684', '202507260000004', 'BAIK', NULL, 'Kontrak', 'Internal', '1753484899.jpg', 1131, NULL, NULL, NULL, 19, 268, NULL, NULL, '2025-07-26 06:08:19', '2025-07-26 06:08:19', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKD 20903700359', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (79, 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453209', 'CPN23453209', '202507260000005', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753488280.jpg', 1172, NULL, NULL, NULL, 53, 330, NULL, NULL, '2025-07-26 07:04:40', '2025-07-26 14:26:44', NULL, NULL, 505, 1, NULL, NULL, '2025-07-26', '2026-07-26', NULL, 'Preventif', NULL, 'AKD 21501520070', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (80, 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453213', 'CPN23453213', '202507260000006', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753488478.jpg', 1172, 9, NULL, NULL, 53, 259, NULL, NULL, '2025-07-26 07:07:58', '2025-07-29 22:59:33', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2026-07-29', '2024-08-30', 'Preventif', NULL, 'AKD 21501520070', NULL, NULL, '2025-08-30', 'sertif001.jpg');
INSERT INTO `asset` VALUES (81, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Riester ) RBP-100 | RN-92829', 'RN-92829', '202507260000007', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753488699.jpg', 1147, NULL, NULL, NULL, 55, 68, NULL, NULL, '2025-07-26 07:11:39', '2025-07-26 07:14:28', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, 'Inventaris', NULL, 'AKL 20501918258', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (82, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Riester ) RBP-100 | RN-92830', 'RN-92830', '202507260000008', 'MAINTENANCE', 'Yes', 'Internal', 'Internal', '1753488888.jpg', 1147, NULL, NULL, NULL, 55, 68, NULL, NULL, '2025-07-26 07:13:07', '2025-07-26 07:44:30', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, 'Inventaris', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (83, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Riester ) RBP-100 | RN-92831', 'RN-92831', '202507260000009', 'RUSAK', 'Yes', 'Internal', 'Internal', '1753488846.jpg', 1147, NULL, NULL, NULL, 55, 68, NULL, NULL, '2025-07-26 07:14:06', '2025-07-26 07:43:00', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, 'Inventaris', NULL, 'AKL 20501918258', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (84, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12215', 'OMR12215', '202507260000010', 'BAIK', NULL, 'Kontrak', 'Internal', '1753489791.jpg', 1147, NULL, NULL, NULL, 208, 126, NULL, NULL, '2025-07-26 07:29:51', '2025-07-26 07:29:51', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (85, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12216', 'OMR12216', '202507260000011', NULL, 'Yes', 'Garansi', 'Internal', '1753489851.jpg', 1147, 9, NULL, NULL, 208, 126, NULL, NULL, '2025-07-26 07:30:51', '2025-07-29 22:37:36', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', '2024-07-29', 'Inventaris', NULL, 'AKL 20501511091', NULL, NULL, '2025-07-29', 'sertif003.jpg');
INSERT INTO `asset` VALUES (86, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12217', 'OMR12217', '202507260000012', 'BAIK', 'Yes', 'Garansi', 'Internal', '1753490142.jpg', 1147, NULL, NULL, NULL, 208, 126, NULL, NULL, '2025-07-26 07:32:04', '2025-07-26 07:35:42', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, 'Inventaris', NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (87, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12218', 'OMR12218', '202507260000013', 'BAIK', NULL, 'Garansi', 'Internal', '1753489994.jpg', 1147, NULL, NULL, NULL, 208, 126, NULL, NULL, '2025-07-26 07:33:15', '2025-07-26 07:33:15', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (88, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12219', 'OMR12219', '202507260000014', 'BAIK', 'Yes', 'Garansi', 'Internal', '1753490119.jpg', 1147, NULL, NULL, NULL, 208, 127, NULL, NULL, '2025-07-26 07:34:47', '2025-07-26 07:35:19', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, 'Inventaris', NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (89, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12220', 'OMR12220', '202507260000015', 'BAIK', NULL, 'Garansi', 'Internal', '1753490298.jpg', 1147, NULL, NULL, NULL, 208, 140, NULL, NULL, '2025-07-26 07:38:18', '2025-07-26 07:38:18', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (90, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12221', 'OMR12221', '202507260000016', 'BAIK', NULL, 'Garansi', 'Internal', '1753490381.jpg', 1147, NULL, NULL, NULL, 208, 137, NULL, NULL, '2025-07-26 07:39:41', '2025-07-26 07:39:41', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (91, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12222', 'OMR12222', '202507260000017', 'BAIK', NULL, 'Garansi', 'Internal', '1753490505.jpg', 1147, NULL, NULL, NULL, 208, 139, NULL, NULL, '2025-07-26 07:41:45', '2025-07-26 07:41:45', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (92, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12223', 'OMR12223', '202507260000018', 'BAIK', NULL, 'Internal', 'Internal', '1753490847.jpg', 1147, NULL, NULL, NULL, 208, 147, NULL, NULL, '2025-07-26 07:47:27', '2025-07-26 07:47:27', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501511091', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (93, 'Dental Unit ~  ( Smic ) TJ-2688 | SMIC1235', 'SMIC1235', '202507260000019', 'BAIK', NULL, 'Kontrak', 'Internal', '1753490998.webp', 944, NULL, NULL, NULL, 211, 148, NULL, NULL, '2025-07-26 07:49:58', '2025-07-26 07:49:58', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 10605702507', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (94, 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80 | 23030685', '23030685', '202507260000020', 'BAIK', NULL, 'Kontrak', 'Internal', '1753491231.jpg', 1131, NULL, NULL, NULL, 19, 148, NULL, NULL, '2025-07-26 07:53:51', '2025-07-26 07:53:51', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKD 20903700359', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (95, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-7320 | OMR90245', 'OMR90245', '202507260000021', 'BAIK', NULL, 'Garansi', 'Internal', '1753491341.jpg', 1147, NULL, NULL, NULL, 209, 146, NULL, NULL, '2025-07-26 07:55:41', '2025-07-26 07:55:41', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501817806', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (96, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-7320 | OMR90246', 'OMR90246', '202507260000022', 'BAIK', NULL, 'Garansi', 'Internal', '1753491405.jpg', 1147, NULL, NULL, NULL, 209, 147, NULL, NULL, '2025-07-26 07:56:45', '2025-07-26 07:56:45', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20501817806', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (97, 'Inkubator Bayi ~  ( Serenity ) Chello S3000 | SBI0987', 'SBI0987', '202507260000023', 'BAIK', NULL, 'Garansi', 'Internal', '1753491881.jpg', 1005, NULL, NULL, NULL, 215, 154, NULL, NULL, '2025-07-26 08:04:41', '2025-07-26 08:04:41', NULL, NULL, 1, 1, NULL, NULL, '2025-07-26', '2025-07-26', NULL, NULL, NULL, 'AKL 20902712796', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (98, 'Electrocardiograph (ECG/EKG) 3 CH ~  ( Cardioline ) ECG100L | CARECG001', 'CARECG001', '202507260000024', 'BAIK', 'Yes', 'Kontrak', 'Internal', '1753492978.webp', 1192, NULL, NULL, NULL, 216, 127, NULL, NULL, '2025-07-26 08:22:58', '2025-07-30 10:53:09', NULL, NULL, 1, 1, NULL, NULL, '2025-07-30', '2025-07-30', NULL, 'Inventaris', NULL, 'AKL 20502910757', NULL, NULL, NULL, NULL);
INSERT INTO `asset` VALUES (99, 'Electrocardiograph (ECG/EKG) 3 CH ~  ( Cardioline ) ECG100L | CARECG002', 'CARECG002', '202507270000001', 'BAIK', 'Yes', 'Internal', 'Internal', '1753562699.webp', 1192, NULL, NULL, NULL, 216, 371, NULL, NULL, '2025-07-27 03:44:59', '2025-07-27 03:45:36', NULL, NULL, 1, 1, NULL, NULL, '2025-07-27', '2025-07-27', NULL, 'Inventaris', NULL, 'AKL 20502910757', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 264 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (107, '3M');
INSERT INTO `brand` VALUES (197, 'A&D');
INSERT INTO `brand` VALUES (9, 'Abbott');
INSERT INTO `brand` VALUES (208, 'ABMed');
INSERT INTO `brand` VALUES (10, 'Acoma');
INSERT INTO `brand` VALUES (11, 'Acutome');
INSERT INTO `brand` VALUES (118, 'ADE');
INSERT INTO `brand` VALUES (95, 'Aesculap');
INSERT INTO `brand` VALUES (158, 'Aesculape');
INSERT INTO `brand` VALUES (263, 'AFA');
INSERT INTO `brand` VALUES (186, 'AFI');
INSERT INTO `brand` VALUES (134, 'Airtech');
INSERT INTO `brand` VALUES (170, 'Akayasa');
INSERT INTO `brand` VALUES (12, 'Alcon');
INSERT INTO `brand` VALUES (150, 'Allsheng');
INSERT INTO `brand` VALUES (159, 'Alltech');
INSERT INTO `brand` VALUES (161, 'Alltion');
INSERT INTO `brand` VALUES (250, 'Ampall');
INSERT INTO `brand` VALUES (13, 'Analog Medical');
INSERT INTO `brand` VALUES (173, 'Analytik Jena');
INSERT INTO `brand` VALUES (14, 'AND Medical');
INSERT INTO `brand` VALUES (106, 'ApexBio');
INSERT INTO `brand` VALUES (15, 'Ardo');
INSERT INTO `brand` VALUES (17, 'Arnez');
INSERT INTO `brand` VALUES (206, 'Asacare');
INSERT INTO `brand` VALUES (117, 'Asano');
INSERT INTO `brand` VALUES (19, 'Atmos');
INSERT INTO `brand` VALUES (20, 'Atom');
INSERT INTO `brand` VALUES (132, 'Autobio');
INSERT INTO `brand` VALUES (188, 'Avalenz');
INSERT INTO `brand` VALUES (253, 'Axceltech');
INSERT INTO `brand` VALUES (160, 'Basda');
INSERT INTO `brand` VALUES (114, 'Baxter');
INSERT INTO `brand` VALUES (193, 'Baymedika');
INSERT INTO `brand` VALUES (21, 'BBraun');
INSERT INTO `brand` VALUES (96, 'BD');
INSERT INTO `brand` VALUES (185, 'Beckman Coulter');
INSERT INTO `brand` VALUES (22, 'BELA');
INSERT INTO `brand` VALUES (23, 'Belmont');
INSERT INTO `brand` VALUES (213, 'Bestera');
INSERT INTO `brand` VALUES (24, 'Bestman');
INSERT INTO `brand` VALUES (225, 'Beurer');
INSERT INTO `brand` VALUES (25, 'Biobase');
INSERT INTO `brand` VALUES (184, 'Biocare');
INSERT INTO `brand` VALUES (127, 'Bionet');
INSERT INTO `brand` VALUES (162, 'Biotech');
INSERT INTO `brand` VALUES (166, 'Bipmed');
INSERT INTO `brand` VALUES (209, 'Bisamed');
INSERT INTO `brand` VALUES (210, 'Bisatech');
INSERT INTO `brand` VALUES (26, 'Bistos');
INSERT INTO `brand` VALUES (27, 'BK Medical');
INSERT INTO `brand` VALUES (28, 'Bluecross');
INSERT INTO `brand` VALUES (139, 'Bohui');
INSERT INTO `brand` VALUES (207, 'BTF Medical');
INSERT INTO `brand` VALUES (29, 'BTL');
INSERT INTO `brand` VALUES (190, 'Burtons');
INSERT INTO `brand` VALUES (120, 'Camry');
INSERT INTO `brand` VALUES (163, 'Caprico');
INSERT INTO `brand` VALUES (30, 'Cardioline');
INSERT INTO `brand` VALUES (196, 'Caretris');
INSERT INTO `brand` VALUES (31, 'Carl Zeiss');
INSERT INTO `brand` VALUES (136, 'Cellnovte');
INSERT INTO `brand` VALUES (195, 'Chronalifemed');
INSERT INTO `brand` VALUES (189, 'Ciptanas');
INSERT INTO `brand` VALUES (32, 'Clyde-Apac');
INSERT INTO `brand` VALUES (245, 'Codan Argus');
INSERT INTO `brand` VALUES (33, 'Comeg');
INSERT INTO `brand` VALUES (34, 'Comen');
INSERT INTO `brand` VALUES (256, 'Contec');
INSERT INTO `brand` VALUES (226, 'Contect');
INSERT INTO `brand` VALUES (35, 'Covidien');
INSERT INTO `brand` VALUES (7, 'CSA');
INSERT INTO `brand` VALUES (8, 'CSI');
INSERT INTO `brand` VALUES (215, 'Customed');
INSERT INTO `brand` VALUES (179, 'Cybow');
INSERT INTO `brand` VALUES (129, 'd3TEKS1');
INSERT INTO `brand` VALUES (243, 'Daiken Medical');
INSERT INTO `brand` VALUES (113, 'danaher');
INSERT INTO `brand` VALUES (140, 'Darui');
INSERT INTO `brand` VALUES (2, 'Datex-Ohmeda');
INSERT INTO `brand` VALUES (191, 'DEMO');
INSERT INTO `brand` VALUES (229, 'Dialab');
INSERT INTO `brand` VALUES (121, 'Dimed');
INSERT INTO `brand` VALUES (181, 'Dirui');
INSERT INTO `brand` VALUES (122, 'Dixion');
INSERT INTO `brand` VALUES (37, 'DPMMed');
INSERT INTO `brand` VALUES (3, 'Drager');
INSERT INTO `brand` VALUES (149, 'Dynamica');
INSERT INTO `brand` VALUES (203, 'EastTech');
INSERT INTO `brand` VALUES (217, 'Edan');
INSERT INTO `brand` VALUES (242, 'Elekta');
INSERT INTO `brand` VALUES (6, 'Elitech');
INSERT INTO `brand` VALUES (240, 'Emed');
INSERT INTO `brand` VALUES (39, 'Endo');
INSERT INTO `brand` VALUES (40, 'Enraf');
INSERT INTO `brand` VALUES (41, 'Eppendorf');
INSERT INTO `brand` VALUES (42, 'Erbe');
INSERT INTO `brand` VALUES (168, 'Ersa');
INSERT INTO `brand` VALUES (258, 'Esatech');
INSERT INTO `brand` VALUES (76, 'Eternity');
INSERT INTO `brand` VALUES (130, 'Everlife');
INSERT INTO `brand` VALUES (219, 'Falcon');
INSERT INTO `brand` VALUES (244, 'Fert Medical');
INSERT INTO `brand` VALUES (58, 'Fisher Paykel');
INSERT INTO `brand` VALUES (111, 'Fresenius');
INSERT INTO `brand` VALUES (145, 'Froilabo');
INSERT INTO `brand` VALUES (44, 'FujiFilm');
INSERT INTO `brand` VALUES (43, 'Fukuda');
INSERT INTO `brand` VALUES (4, 'GE');
INSERT INTO `brand` VALUES (64, 'GEA');
INSERT INTO `brand` VALUES (85, 'Gemmy');
INSERT INTO `brand` VALUES (137, 'Genedian');
INSERT INTO `brand` VALUES (83, 'GerLink');
INSERT INTO `brand` VALUES (237, 'Gina');
INSERT INTO `brand` VALUES (235, 'Glory');
INSERT INTO `brand` VALUES (238, 'Greemed');
INSERT INTO `brand` VALUES (201, 'Hamco');
INSERT INTO `brand` VALUES (252, 'Hawkmed');
INSERT INTO `brand` VALUES (152, 'Healforce');
INSERT INTO `brand` VALUES (249, 'Hedy');
INSERT INTO `brand` VALUES (257, 'Hepho');
INSERT INTO `brand` VALUES (233, 'Heto');
INSERT INTO `brand` VALUES (144, 'Hirayama');
INSERT INTO `brand` VALUES (214, 'Huntleigh');
INSERT INTO `brand` VALUES (115, 'Intuitive');
INSERT INTO `brand` VALUES (192, 'Invo');
INSERT INTO `brand` VALUES (88, 'Ivy Biomedical');
INSERT INTO `brand` VALUES (224, 'Jenco');
INSERT INTO `brand` VALUES (174, 'JMS');
INSERT INTO `brand` VALUES (101, 'JMS Medical');
INSERT INTO `brand` VALUES (109, 'Johnson&Johnson');
INSERT INTO `brand` VALUES (216, 'Jotatec');
INSERT INTO `brand` VALUES (54, 'Karl Storz');
INSERT INTO `brand` VALUES (255, 'Kellymed');
INSERT INTO `brand` VALUES (45, 'Kenz');
INSERT INTO `brand` VALUES (91, 'Kirsch');
INSERT INTO `brand` VALUES (204, 'Kreuz Medical');
INSERT INTO `brand` VALUES (153, 'Labex');
INSERT INTO `brand` VALUES (142, 'Labguard');
INSERT INTO `brand` VALUES (218, 'Labtech');
INSERT INTO `brand` VALUES (46, 'Laica');
INSERT INTO `brand` VALUES (47, 'Leica');
INSERT INTO `brand` VALUES (60, 'LG');
INSERT INTO `brand` VALUES (99, 'Litmann');
INSERT INTO `brand` VALUES (239, 'M. Technology');
INSERT INTO `brand` VALUES (177, 'MAK');
INSERT INTO `brand` VALUES (171, 'Marlip');
INSERT INTO `brand` VALUES (75, 'Masimo SET');
INSERT INTO `brand` VALUES (36, 'McDavid');
INSERT INTO `brand` VALUES (261, 'Medcaptain');
INSERT INTO `brand` VALUES (90, 'Medela');
INSERT INTO `brand` VALUES (260, 'Medinov');
INSERT INTO `brand` VALUES (48, 'Medison');
INSERT INTO `brand` VALUES (202, 'Medlink');
INSERT INTO `brand` VALUES (110, 'Medtronic');
INSERT INTO `brand` VALUES (156, 'Membrane Solution');
INSERT INTO `brand` VALUES (59, 'Memert');
INSERT INTO `brand` VALUES (183, 'Merck');
INSERT INTO `brand` VALUES (77, 'Merivaara');
INSERT INTO `brand` VALUES (151, 'Microdigital');
INSERT INTO `brand` VALUES (78, 'Microlife');
INSERT INTO `brand` VALUES (154, 'Micros');
INSERT INTO `brand` VALUES (65, 'Miki');
INSERT INTO `brand` VALUES (141, 'Milwaukee');
INSERT INTO `brand` VALUES (49, 'Mindray');
INSERT INTO `brand` VALUES (138, 'Motic');
INSERT INTO `brand` VALUES (143, 'N-Biotek');
INSERT INTO `brand` VALUES (133, 'Nera');
INSERT INTO `brand` VALUES (108, 'Nesco');
INSERT INTO `brand` VALUES (211, 'Neshema');
INSERT INTO `brand` VALUES (223, 'Nicosh');
INSERT INTO `brand` VALUES (97, 'Nihon Kohden');
INSERT INTO `brand` VALUES (182, 'Nipro');
INSERT INTO `brand` VALUES (61, 'Nonin');
INSERT INTO `brand` VALUES (51, 'OG Giken');
INSERT INTO `brand` VALUES (176, 'Olympic');
INSERT INTO `brand` VALUES (50, 'Olympus');
INSERT INTO `brand` VALUES (52, 'Omron');
INSERT INTO `brand` VALUES (172, 'One Med');
INSERT INTO `brand` VALUES (194, 'OneHealth');
INSERT INTO `brand` VALUES (100, 'OneMed');
INSERT INTO `brand` VALUES (53, 'Philips');
INSERT INTO `brand` VALUES (221, 'Poly Medical');
INSERT INTO `brand` VALUES (220, 'Precisionmed');
INSERT INTO `brand` VALUES (70, 'Primedic');
INSERT INTO `brand` VALUES (128, 'Prufen');
INSERT INTO `brand` VALUES (81, 'Pulmo Aide');
INSERT INTO `brand` VALUES (231, 'Raynusa Diagnostic');
INSERT INTO `brand` VALUES (205, 'Remedi');
INSERT INTO `brand` VALUES (131, 'Respomed');
INSERT INTO `brand` VALUES (198, 'RGB Medical');
INSERT INTO `brand` VALUES (178, 'Riele');
INSERT INTO `brand` VALUES (103, 'Riester');
INSERT INTO `brand` VALUES (169, 'Rigel Medical');
INSERT INTO `brand` VALUES (98, 'Roche');
INSERT INTO `brand` VALUES (200, 'Sani');
INSERT INTO `brand` VALUES (155, 'Satake');
INSERT INTO `brand` VALUES (157, 'Schiller');
INSERT INTO `brand` VALUES (167, 'Schonerde');
INSERT INTO `brand` VALUES (62, 'Seca');
INSERT INTO `brand` VALUES (247, 'Serenity');
INSERT INTO `brand` VALUES (175, 'Shimadzu');
INSERT INTO `brand` VALUES (222, 'Shinetech');
INSERT INTO `brand` VALUES (63, 'Siemens');
INSERT INTO `brand` VALUES (234, 'Sigo');
INSERT INTO `brand` VALUES (248, 'Sino MDT');
INSERT INTO `brand` VALUES (67, 'SLE');
INSERT INTO `brand` VALUES (126, 'Smic');
INSERT INTO `brand` VALUES (259, 'SMW');
INSERT INTO `brand` VALUES (105, 'Socorex');
INSERT INTO `brand` VALUES (89, 'Sonoscape');
INSERT INTO `brand` VALUES (148, 'Spectrolab');
INSERT INTO `brand` VALUES (230, 'Starr Lab');
INSERT INTO `brand` VALUES (112, 'Stryker');
INSERT INTO `brand` VALUES (165, 'Superyears');
INSERT INTO `brand` VALUES (79, 'Suzuken');
INSERT INTO `brand` VALUES (180, 'Sysmex');
INSERT INTO `brand` VALUES (246, 'Szosen');
INSERT INTO `brand` VALUES (147, 'Taitec');
INSERT INTO `brand` VALUES (71, 'Tanita');
INSERT INTO `brand` VALUES (212, 'Telesano');
INSERT INTO `brand` VALUES (66, 'Tende');
INSERT INTO `brand` VALUES (55, 'Terumo');
INSERT INTO `brand` VALUES (124, 'Tesena');
INSERT INTO `brand` VALUES (87, 'ThermoScientific');
INSERT INTO `brand` VALUES (56, 'Thomas');
INSERT INTO `brand` VALUES (73, 'Toitu');
INSERT INTO `brand` VALUES (262, 'TOP');
INSERT INTO `brand` VALUES (5, 'Topcon');
INSERT INTO `brand` VALUES (94, 'Toshiba');
INSERT INTO `brand` VALUES (251, 'Touren');
INSERT INTO `brand` VALUES (102, 'TransMed');
INSERT INTO `brand` VALUES (199, 'Trimed');
INSERT INTO `brand` VALUES (241, 'Varian');
INSERT INTO `brand` VALUES (125, 'Versatek');
INSERT INTO `brand` VALUES (82, 'VersaTrek');
INSERT INTO `brand` VALUES (236, 'Vitrolabs');
INSERT INTO `brand` VALUES (164, 'Wellgrow');
INSERT INTO `brand` VALUES (86, 'WTB Binder');
INSERT INTO `brand` VALUES (146, 'Yamato');
INSERT INTO `brand` VALUES (135, 'Yidi');
INSERT INTO `brand` VALUES (254, 'Zede');
INSERT INTO `brand` VALUES (187, 'Zeiss');
INSERT INTO `brand` VALUES (232, 'Zenix');
INSERT INTO `brand` VALUES (228, 'Zera');
INSERT INTO `brand` VALUES (227, 'ZOI Einthoven');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_notification` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Alkes Elektromedik Non-Radiasi', NULL);
INSERT INTO `category` VALUES (2, 'Alkes Non-Elektromedik Non-Steril', NULL);
INSERT INTO `category` VALUES (3, 'Alkes Diagnostik in Vitro', NULL);
INSERT INTO `category` VALUES (4, 'Alkes Elektromedik Radiasi', NULL);
INSERT INTO `category` VALUES (5, 'Non Alkes', NULL);
INSERT INTO `category` VALUES (18, 'Demo', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (6, 'IPSRS', NULL);
INSERT INTO `group` VALUES (7, 'PPM-IPSRS', 'Untuk peralatan:\r\na.\r\nb.\r\nc.\r\ndst...');
INSERT INTO `group` VALUES (8, 'Garansi', 'Untuk peralatan:\r\na.\r\nb.\r\nc.\r\ndst...');
INSERT INTO `group` VALUES (9, 'KSO', 'Untuk peralatan:\r\na.\r\nb.\r\nc.\r\ndst...');
INSERT INTO `group` VALUES (10, 'Kontrak-Service', 'Untuk peralatan:\r\na.\r\nb.\r\nc.\r\ndst...');
INSERT INTO `group` VALUES (11, 'PPM-RMC', NULL);
INSERT INTO `group` VALUES (12, 'RMC-DINKES', NULL);

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
  `job_type` enum('Preventif','Korektif','Inspeksi','Kalibrasi','Inventaris') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE,
  INDEX `job_id_tiket`(`job_id_tiket`) USING BTREE,
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`job_id_tiket`) REFERENCES `tiket` (`tiket_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `job` VALUES (47, '30cf890b-e060-4983-90e8-64b65d4ddb36', NULL, 54, 105, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-23 10:37:25', '2025-07-23 10:37:25', NULL, 1, 1, NULL, NULL, NULL, '1753241845.png', 'Inventaris');
INSERT INTO `job` VALUES (48, 'bcd80461-f58e-4ee9-9331-e94011b6020e', NULL, 55, NULL, NULL, 3, NULL, NULL, 'test', 'Selesai', '2025-07-23 10:44:09', '2025-07-23 10:44:09', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (49, '94292d86-3b79-434d-89c7-4fa6a066f3b5', NULL, 56, 12, NULL, 3, NULL, NULL, 'test', 'Selesai', '2025-07-23 10:46:45', '2025-07-23 10:46:45', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (50, 'c85b119d-e51b-40f7-9a0c-a48ef02aa2bb', NULL, 57, 11, NULL, 3, NULL, NULL, 'test', 'Selesai', '2025-07-23 10:49:39', '2025-07-23 10:49:39', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (51, 'ad0de093-7f22-4890-ab2a-689d7553ef5a', NULL, 58, 105, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-23 10:57:59', '2025-07-23 10:57:59', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (52, '1f8f95a6-3af4-4527-9232-94920261f74e', NULL, 59, 105, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-23 10:58:32', '2025-07-23 10:58:32', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (53, 'fb48570e-17cb-4b16-8e42-e3d7a08850b1', 76, 57, 11, NULL, 3, NULL, NULL, 'Blanket tidak panas', 'Ambil', '2025-07-23 11:36:43', '2025-07-26 08:30:56', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (54, '160eaa6c-0754-4b92-b69a-d23d36d4eda3', 79, 59, 105, 5, 3, 'selesai', 'telah selesai', 'Sudah waktunya Kalibrasi\r\nTanggal Kalibrasi 23/08/2025', 'Selesai', '2025-07-23 11:44:24', '2025-07-23 13:26:33', NULL, 3, 510, NULL, '2025-07-23 13:26:33', NULL, NULL, 'Kalibrasi');
INSERT INTO `job` VALUES (55, '9e515c07-15ad-4344-9c15-10a086733c01', 79, 59, 105, 3, 510, 'ok', 'ok', 'Sudah waktunya Kalibrasi\r\nTanggal Kalibrasi 23/08/2025', 'Selesai', '2025-07-23 11:58:02', '2025-07-23 13:25:09', NULL, 510, 510, NULL, '2025-07-23 13:25:09', NULL, NULL, 'Kalibrasi');
INSERT INTO `job` VALUES (56, '33cb1ebd-5e36-4ce5-8f44-2f4d7056ee07', NULL, 60, 5, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-23 14:48:40', '2025-07-23 14:48:40', NULL, 1, 1, NULL, NULL, NULL, '1753256920.jpg', 'Inventaris');
INSERT INTO `job` VALUES (57, 'c09f7218-9f55-4d06-90b3-79ac7fabf43b', NULL, 61, 40, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-23 21:37:14', '2025-07-23 21:37:14', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (58, '076b288d-5ac7-4854-b162-22d90d462b6f', NULL, 62, 2, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 08:40:09', '2025-07-24 08:40:09', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (59, 'cb1a2418-c91d-44f2-969b-413767663935', NULL, 63, 7, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 08:45:31', '2025-07-24 08:45:31', NULL, 1, 1, NULL, NULL, NULL, '1753321531.jpg', 'Inventaris');
INSERT INTO `job` VALUES (60, '82224702-9c04-4b23-8cbb-3b183c065fdc', 76, 57, 11, 5, 1, 'kesimpulan', 'analisan', 'Penjadwalan otomatis untuk pekerjaan', 'Proses', '2025-07-24 08:53:25', '2025-07-26 12:55:39', NULL, 1, 1, NULL, '2025-07-26 12:55:39', NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (61, '225aaf8b-324d-4f3c-9525-fbcf12fefef9', 77, 58, 105, NULL, 1, NULL, NULL, 'Penjadwalan otomatis untuk pekerjaan ', 'Ambil', '2025-07-24 08:55:27', '2025-07-24 08:55:27', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (62, 'dab8f43c-9155-44b4-8235-58180e794899', 79, 59, 105, NULL, 1, NULL, NULL, 'Sudah waktunya Kalibrasi\r\nTanggal Kalibrasi 23/08/2025', 'Ambil', '2025-07-24 08:56:44', '2025-07-24 08:56:44', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Kalibrasi');
INSERT INTO `job` VALUES (63, '642c6117-a85b-4be0-8682-479ebb3f6e11', 80, 60, 5, NULL, 1, NULL, NULL, 'Penjadwalan otomatis untuk pekerjaan ', 'Ambil', '2025-07-24 08:57:11', '2025-07-24 08:57:11', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (64, 'ad0fd628-cf73-4891-b34a-e655a279b1ae', NULL, 64, 16, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 09:07:44', '2025-07-24 09:07:44', NULL, 1, 1, NULL, NULL, NULL, '1753322864.jpg', 'Inventaris');
INSERT INTO `job` VALUES (65, 'bb553b2e-2cee-43aa-b8be-00cbdf731c6a', NULL, 65, 3, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 10:44:08', '2025-07-24 10:44:08', NULL, 1, 1, NULL, NULL, NULL, '1753328648.jpg', 'Inventaris');
INSERT INTO `job` VALUES (66, '371e76da-ec0b-42a6-bcb1-6002b23dfdb4', NULL, 66, 46, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 11:00:42', '2025-07-24 11:00:42', NULL, 1, 1, NULL, NULL, NULL, '1753329642.jpg', 'Inventaris');
INSERT INTO `job` VALUES (67, 'df238d0e-7102-4ae4-ac92-582aa04dc91e', NULL, 67, 7, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 11:23:38', '2025-07-24 11:23:38', NULL, 1, 1, NULL, NULL, NULL, '1753331018.jpg', 'Inventaris');
INSERT INTO `job` VALUES (68, 'b9722b14-aa00-42c1-ad4e-0a21c3d4f22a', NULL, 68, 7, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 11:24:31', '2025-07-24 11:24:31', NULL, 1, 1, NULL, NULL, NULL, '1753331071.jpg', 'Inventaris');
INSERT INTO `job` VALUES (69, '763ee90f-59d2-4b13-a4b8-1d240bd4cb2f', NULL, 69, 112, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 11:35:31', '2025-07-24 11:35:31', NULL, 1, 1, NULL, NULL, NULL, '1753331731.jpg', 'Inventaris');
INSERT INTO `job` VALUES (70, '6ed1af93-7ccf-4799-827b-a4068e191f68', NULL, 70, 68, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 14:58:52', '2025-07-24 14:58:52', NULL, 1, 1, NULL, NULL, NULL, '1753343932.jpg', 'Inventaris');
INSERT INTO `job` VALUES (71, 'dac147d3-4620-46d5-8b9b-470f9ff496cd', NULL, 71, 68, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 15:01:15', '2025-07-24 15:01:15', NULL, 1, 1, NULL, NULL, NULL, '1753344075.jpg', 'Inventaris');
INSERT INTO `job` VALUES (72, 'cd2dd9f6-155e-4ec3-96c3-19765c309d3a', NULL, 72, 75, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-24 19:36:40', '2025-07-24 19:36:40', NULL, 1, 1, NULL, NULL, NULL, '1753360600.jpg', 'Inventaris');
INSERT INTO `job` VALUES (73, 'f0b29cd3-8dcd-441f-b63f-dc2a5f080302', 80, 60, 5, 1, 504, 'perlu diganti', 'lampu sudah tidak bisa dipakai', 'Lampu mati', 'Proses', '2025-07-24 22:46:52', '2025-07-26 09:00:56', NULL, 504, 504, NULL, '2025-07-26 09:00:55', NULL, '1753495256.jpg', 'Korektif');
INSERT INTO `job` VALUES (74, '0863fce4-3b50-434c-b097-09bf824ab044', 81, 60, 5, NULL, 3, NULL, NULL, 'Test Tiket', 'Ambil', '2025-07-25 00:29:49', '2025-07-25 00:29:49', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (75, 'ae6b1085-e6cd-4d49-ab04-642e16adca6c', 80, 60, 5, NULL, 3, NULL, NULL, 'Lampu mati', 'Ambil', '2025-07-25 00:29:55', '2025-07-25 00:29:55', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (76, '3a9f14e4-2cb2-4422-a058-0bc095c4c756', NULL, 73, 343, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-25 07:29:03', '2025-07-25 07:29:03', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (77, '684b5f6a-3e0c-41e5-a0a8-09f1a0d2af66', NULL, 74, 70, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-25 08:23:10', '2025-07-25 08:23:10', NULL, 1, 1, NULL, NULL, NULL, '1753406590.webp', 'Inventaris');
INSERT INTO `job` VALUES (78, '5fd9cd1b-bac3-44f5-9c23-818d89e5f3c1', NULL, 75, 9, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 05:29:43', '2025-07-26 05:29:43', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (79, '04e6f381-1805-48a8-b57a-7f306aad4dc5', NULL, 76, 368, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 05:47:15', '2025-07-26 05:47:15', NULL, 1, 1, NULL, NULL, NULL, '1753483635.jpg', 'Inventaris');
INSERT INTO `job` VALUES (80, 'f203c1d1-9ff6-42bd-9a0c-a5ea80806b5a', NULL, 77, 369, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 05:52:42', '2025-07-26 05:52:42', NULL, 1, 1, NULL, NULL, NULL, '1753483962.jpg', 'Inventaris');
INSERT INTO `job` VALUES (81, 'ababf3f6-ad33-457f-8e3b-d89e0e7cf7c4', NULL, 78, 268, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 06:08:19', '2025-07-26 06:08:19', NULL, 1, 1, NULL, NULL, NULL, '1753484899.jpg', 'Inventaris');
INSERT INTO `job` VALUES (82, '707001bf-df98-4aaa-b0c0-88935e70ec49', NULL, 79, 330, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:04:40', '2025-07-26 07:04:40', NULL, 1, 1, NULL, NULL, NULL, '1753488280.jpg', 'Inventaris');
INSERT INTO `job` VALUES (83, '164f702a-576c-4950-a6c4-b255e6779483', NULL, 80, 259, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:07:58', '2025-07-26 07:07:58', NULL, 1, 1, NULL, NULL, NULL, '1753488478.jpg', 'Inventaris');
INSERT INTO `job` VALUES (84, '4f9b87de-426e-4dab-9fbb-8dca029138de', NULL, 81, 68, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:11:39', '2025-07-26 07:11:39', NULL, 1, 1, NULL, NULL, NULL, '1753488699.jpg', 'Inventaris');
INSERT INTO `job` VALUES (85, '92931f2f-f678-43ce-b054-3464c17a0630', NULL, 82, 68, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:13:07', '2025-07-26 07:13:07', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (86, '35b294a1-be7d-46a4-9f37-2e2cd5127a66', NULL, 83, 68, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:14:06', '2025-07-26 07:14:06', NULL, 1, 1, NULL, NULL, NULL, '1753488846.jpg', 'Inventaris');
INSERT INTO `job` VALUES (87, '8c3920a2-17ad-4361-b11c-40cf0de75dc9', NULL, 84, 126, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:29:52', '2025-07-26 07:29:52', NULL, 1, 1, NULL, NULL, NULL, '1753489792.jpg', 'Inventaris');
INSERT INTO `job` VALUES (88, '33cea6b6-3a29-4e0a-89e6-4bbb9f6e537f', NULL, 85, 126, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:30:51', '2025-07-26 07:30:51', NULL, 1, 1, NULL, NULL, NULL, '1753489851.jpg', 'Inventaris');
INSERT INTO `job` VALUES (89, '7101d6c0-aadc-4b8e-aab4-74aa95c1fa52', NULL, 86, 126, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:32:04', '2025-07-26 07:32:04', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (90, 'f049c909-7473-4e75-91ff-5019c6874eb9', NULL, 87, 126, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:33:15', '2025-07-26 07:33:15', NULL, 1, 1, NULL, NULL, NULL, '1753489995.jpg', 'Inventaris');
INSERT INTO `job` VALUES (91, '9d377eef-bc62-4a06-ab96-ecd6d944df2d', NULL, 88, 127, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:34:47', '2025-07-26 07:34:47', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Inventaris');
INSERT INTO `job` VALUES (92, 'd84ac4e5-0d3f-457c-9b55-c1decd831bea', NULL, 89, 140, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:38:18', '2025-07-26 07:38:18', NULL, 1, 1, NULL, NULL, NULL, '1753490298.jpg', 'Inventaris');
INSERT INTO `job` VALUES (93, 'f25a0efb-74fb-4031-ac7b-df82b7b6adc1', NULL, 90, 137, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:39:41', '2025-07-26 07:39:41', NULL, 1, 1, NULL, NULL, NULL, '1753490381.jpg', 'Inventaris');
INSERT INTO `job` VALUES (94, '58bf7abd-8148-4a40-bfc1-17d222331cde', NULL, 91, 139, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:41:45', '2025-07-26 07:41:45', NULL, 1, 1, NULL, NULL, NULL, '1753490505.jpg', 'Inventaris');
INSERT INTO `job` VALUES (95, 'c39effd1-fdc1-4f5f-8f67-04e48b2cf177', NULL, 92, 147, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:47:27', '2025-07-26 07:47:27', NULL, 1, 1, NULL, NULL, NULL, '1753490847.jpg', 'Inventaris');
INSERT INTO `job` VALUES (96, '7fd04b31-c275-4d33-981b-38879173a564', NULL, 93, 148, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:49:58', '2025-07-26 07:49:58', NULL, 1, 1, NULL, NULL, NULL, '1753490998.webp', 'Inventaris');
INSERT INTO `job` VALUES (97, 'ebd27667-287d-4b73-aa9f-6aa680846adb', NULL, 94, 148, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:53:51', '2025-07-26 07:53:51', NULL, 1, 1, NULL, NULL, NULL, '1753491231.jpg', 'Inventaris');
INSERT INTO `job` VALUES (98, '7660b638-fd6d-490e-b098-f4b32154f7fe', NULL, 95, 146, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:55:41', '2025-07-26 07:55:41', NULL, 1, 1, NULL, NULL, NULL, '1753491341.jpg', 'Inventaris');
INSERT INTO `job` VALUES (99, 'a9f42b19-8a81-4151-a137-f41bd5d59fc7', NULL, 96, 147, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 07:56:45', '2025-07-26 07:56:45', NULL, 1, 1, NULL, NULL, NULL, '1753491405.jpg', 'Inventaris');
INSERT INTO `job` VALUES (100, 'f398ba42-a577-487e-b270-33c0ee3d111e', 82, 79, 330, NULL, 3, NULL, NULL, 'keluhan', 'Ambil', '2025-07-26 07:59:36', '2025-07-26 07:59:36', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (101, '22e76953-2ab6-4c0b-a507-13c52d78053f', NULL, 97, 154, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 08:04:41', '2025-07-26 08:04:41', NULL, 1, 1, NULL, NULL, NULL, '1753491881.jpg', 'Inventaris');
INSERT INTO `job` VALUES (102, '53272066-38f4-4545-94f5-a47408b9ef53', NULL, 98, 127, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-26 08:22:58', '2025-07-26 08:22:58', NULL, 1, 1, NULL, NULL, NULL, '1753492978.webp', 'Inventaris');
INSERT INTO `job` VALUES (103, 'bced111d-30a9-41b6-a890-14eb144e8041', 85, 79, 330, 5, 1, 'kesimpulan', 'analisa', 'test', 'Selesai', '2025-07-26 14:20:04', '2025-07-26 14:26:44', NULL, 1, 505, NULL, '2025-07-26 14:27:29', '2025-07-26 14:26:44', NULL, 'Korektif');
INSERT INTO `job` VALUES (104, 'a1d830a8-b939-4cee-86af-0a9fe46686b5', NULL, 99, 371, NULL, 1, NULL, NULL, NULL, 'Selesai', '2025-07-27 03:44:59', '2025-07-27 03:44:59', NULL, 1, 1, NULL, NULL, NULL, '1753562699.webp', 'Inventaris');
INSERT INTO `job` VALUES (105, 'dec5bc3b-0e3a-4a6c-9d6d-382f6b0d78f6', 85, 79, 330, NULL, 3, NULL, NULL, 'test', 'Ambil', '2025-07-27 11:03:34', '2025-07-27 11:03:34', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (106, 'e0b7c25d-10f0-4616-b65c-778026d10c06', 90, 80, 259, NULL, 1, NULL, NULL, 'Alat rusak', 'Ambil', '2025-08-10 21:47:16', '2025-08-10 21:47:16', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (107, 'eaaf6426-3f78-4390-a54f-66a1fb49d65f', 89, 80, 259, NULL, 1, NULL, NULL, 'Alat rusak', 'Ambil', '2025-08-10 21:47:49', '2025-08-10 21:47:49', NULL, 1, 1, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (108, 'bc03bd21-b2b5-4f17-a646-92e3e0d8d315', 90, 80, 259, NULL, 502, NULL, NULL, 'Alat rusak', 'Ambil', '2025-09-26 18:25:00', '2025-09-26 18:25:00', NULL, 502, 502, NULL, NULL, NULL, NULL, 'Korektif');
INSERT INTO `job` VALUES (109, 'acdea9f0-a43d-43fd-b41e-ae2b8f8cac28', 90, 80, 259, NULL, 3, NULL, NULL, 'Alat rusak', 'Ambil', '2025-10-07 13:21:36', '2025-10-07 13:21:36', NULL, 3, 3, NULL, NULL, NULL, NULL, 'Korektif');

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
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

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
INSERT INTO `level1` VALUES ('LV1000000000001', 'RS - YANMED & KEPERAWATAN', NULL);
INSERT INTO `level1` VALUES ('LV1000000000002', 'RS - JANGMED', NULL);
INSERT INTO `level1` VALUES ('LV1000000000003', 'RS - UMUM & ADM.', NULL);
INSERT INTO `level1` VALUES ('LV1000000000004', 'RS - JANG NONMED', NULL);
INSERT INTO `level1` VALUES ('LV1000000000006', 'DINKES', NULL);
INSERT INTO `level1` VALUES ('LV1000000000007', 'RMC', NULL);
INSERT INTO `level1` VALUES ('LV1000000000008', 'PUSKESMAS', NULL);
INSERT INTO `level1` VALUES ('LV1000000000009', 'LABKESDA', NULL);
INSERT INTO `level1` VALUES ('LV1000000000010', 'KLINIK', NULL);
INSERT INTO `level1` VALUES ('LV1000000000011', 'UTD', NULL);
INSERT INTO `level1` VALUES ('LV1000000000012', 'TPMD/TPMDG', NULL);
INSERT INTO `level1` VALUES ('LV1000000000013', 'RSUD PRATAMA', NULL);
INSERT INTO `level1` VALUES ('LV1000000000014', 'LAB. KLINIK', NULL);
INSERT INTO `level1` VALUES ('LV1000000000015', 'FARMASI', NULL);
INSERT INTO `level1` VALUES ('LV1000000000016', 'DEMO', NULL);

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
INSERT INTO `level2` VALUES ('LV2000000000002', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000008');
INSERT INTO `level2` VALUES ('LV2000000000022', 'DINKES Boyolali, Kab.', NULL, 'LV1000000000008');
INSERT INTO `level2` VALUES ('LV2000000000032', 'DINKES Surakarta, Kota', NULL, 'LV1000000000008');
INSERT INTO `level2` VALUES ('LV2000000000033', 'DEMO', NULL, 'LV1000000000016');
INSERT INTO `level2` VALUES ('LV2000000000034', 'DINKES Salatiga, Kota', NULL, 'LV1000000000008');
INSERT INTO `level2` VALUES ('LV2000000000035', 'DINKES Sukoharjo, Kab.', NULL, 'LV1000000000008');
INSERT INTO `level2` VALUES ('LV2000000000036', 'DINKES Bukittinggi, Kota', NULL, 'LV1000000000008');
INSERT INTO `level2` VALUES ('LV2000000000037', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000009');
INSERT INTO `level2` VALUES ('LV2000000000038', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000015');
INSERT INTO `level2` VALUES ('LV2000000000039', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000011');
INSERT INTO `level2` VALUES ('LV2000000000040', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000010');
INSERT INTO `level2` VALUES ('LV2000000000041', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000014');
INSERT INTO `level2` VALUES ('LV2000000000042', 'DINKES Trenggalek, Kab.', NULL, 'LV1000000000012');
INSERT INTO `level2` VALUES ('LV2000000000043', '11. INSTALASI RAWAT JALAN', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000044', '12. INSTALASI GAWAT DARURAT', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000045', '1256. INSTALASI RAWAT INTENSIF BAYI', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000046', '1271. INSTALASI RAWAT INTENSIF ANAK', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000047', '13. INSTALASI RAWAT INAP', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000048', '1391. INSTALASI RAWAT TINGKA TINGGI', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000049', '14. INSTALASI BEDAH SENTRAL', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000050', '1432. INSTALASI PROSEDUR DIAGNOSTIK', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000051', '1484. INSTALASI DETEKSI DINI KANKER', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000052', '15. INSTALASI RAWAT INTENSIF', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000053', '1525. INSTALASI CATHLAB', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000054', '1532. INSTALASI TEKNOLOGI REPRODUKSI BERBANTU', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000055', '1535. INSTALASI RAWAT INAP KHUSUS', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000056', '20195. INSTALASI KHUSUS INTERNASIONAL', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000057', '587. INSTALASI JANTUNG TERPADU', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000058', '621. INSTALASI KEBIDANAN & PENYAKIT KANDUNGAN (VK)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000059', '636. INSTALASI BAYI', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000060', '90012. INSTALASI RAWAT INTENSIF JIWA (UPIP)', NULL, 'LV1000000000001');
INSERT INTO `level2` VALUES ('LV2000000000061', '1502. BAGIAN PENELITIAN & PENGEMBANGAN', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000062', '1001. INSTALASI KEDOKTERAN NUKLIR', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000063', '1235. INSTALASI RADIODIAGNOSTIK', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000064', '1362. INSTALASI PATOLGI KLINIK', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000065', '1363. INSTALASI PATOLOGI ANATOMI', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000066', '16. INSTALASI RADIOLOGI', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000067', '17. INSTALASI FARMASI', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000068', '19. INSTALASI LABORATORIUM', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000069', '20. INSTALASI REHABILITASI MEDIK', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000070', '23. INSTALASI PEMULASARAN JENAZAH', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000071', '37. INSTALASI RADIOTERAPI', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000072', '90020. INSTALASI PUSAT JANTUNG TERPADU', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000073', '90021. INSTALASI BANK DARAH', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000074', '1210. UNIT HEMODIALISA', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000075', '24. BANK DARAH RUMAH SAKIT', NULL, 'LV1000000000002');
INSERT INTO `level2` VALUES ('LV2000000000076', '1166. INSTALASI SANITASI', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000077', '1523. INSTALASI PEMELIHARAAN SARANA MEDIS', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000078', '1524. INSTALASI PEMELIHARAAN SARANA NON-MEDIS', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000079', '39. INSTALASI DAPUR UTAMA & GIZI', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000080', '40. INSTALASI PENCUCIAN LINEN (LAUNDRI)', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000081', '41. INSTALASI PEMELIHARAAN SARANA (WORKSHOP)', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000082', '51. INSTALASI STERILISASI PUSAT (CSSD)', NULL, 'LV1000000000004');
INSERT INTO `level2` VALUES ('LV2000000000083', '1302. BAGIAN SUMBER DAYA MANUSIA', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('LV2000000000084', '28. BAGIAN KEUANGAN & PROGRAM', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('LV2000000000085', '29. BAGIAN KESEKRETARIATAN & REKAM MEDIS', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('LV2000000000086', '34. BAGIAN PENDIDIKAN & PELATIHAN', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('LV2000000000087', '32. BIDANG PELAYANAN MEDIS', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('LV2000000000088', '33. BIDANG KEPERAWATAN', NULL, 'LV1000000000003');
INSERT INTO `level2` VALUES ('LV2000000000089', '68. BIDANG PENUNJANG MEDIS', NULL, 'LV1000000000003');

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
INSERT INTO `level3` VALUES ('LV3000000000001', 'PKM Trenggalek', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000002', 'PKM Panggul', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000003', 'PKM Bodag', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000004', 'PKM Baruharjo', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000005', 'PKM Munjungan', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000006', 'PKM Watulimo', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000007', 'PKM Slawe', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000008', 'PKM Kampak', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000009', 'PKM Dongko', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000010', 'PKM Rejowinangun', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000011', 'PKM Pandean', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000012', 'PKM Pule', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000013', 'PKM Ngulankulon', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000014', 'PKM Karangan', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000015', 'PKM Suruh', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000016', 'PKM Tugu', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000017', 'PKM Gandusari', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000018', 'PKM Karanganyar', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000019', 'PKM Durenan', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000020', 'PKM Pogalan', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000021', 'PKM Pucanganak', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000022', 'PKM Bendungan', NULL, 'LV2000000000002', NULL);
INSERT INTO `level3` VALUES ('LV3000000000023', 'PKM Selo', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000024', 'PKM Ampel', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000025', 'PKM Gladaksari', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000026', 'PKM Cepogo', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000027', 'PKM Tamansari', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000028', 'PKM Musuk', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000029', 'PKM Boyolali I', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000030', 'PKM Boyolali II', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000032', 'PKM Mojosongo', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000033', 'PKM Teras', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000034', 'PKM Sawit', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000035', 'PKM Banyudono I', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000036', 'PKM Banyudono II', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000037', 'PKM Sambi', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000038', 'PKM Ngemplak', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000039', 'PKM Nogosari', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000040', 'PKM Simo', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000041', 'PKM Karanggede', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000042', 'PKM Klego I', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000043', 'PKM Klego II', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000044', 'PKM Andong', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000045', 'PKM Kemusu', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000046', 'PKM Wonosegoro', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000047', 'PKM Wonosamodro', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000048', 'PKM Juwangi', NULL, 'LV2000000000022', NULL);
INSERT INTO `level3` VALUES ('LV3000000000067', 'PKM Pajang', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000070', 'PKM Penumping', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000073', 'PKM Purwosari', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000076', 'PKM Kratonan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000079', 'PKM Jayengan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000082', 'PKM Gajahan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000085', 'PKM Sangkrah', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000088', 'PKM Sibela', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000091', 'PKM Purwodiningratan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000094', 'PKM Ngoresan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000097', 'PKM Pucangsawit', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000100', 'PKM Banyuanyar', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000103', 'PKM Manahan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000106', 'PKM Nusukan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000109', 'PKM Gilingan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000112', 'PKM Setabelan', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000115', 'PKM Gambir Sari', NULL, 'LV2000000000032', NULL);
INSERT INTO `level3` VALUES ('LV3000000000117', 'PKM PerKotaan Rasimah Ahmad', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000119', 'PKM Guguk Panjang', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000122', 'PKM Mandiangin', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000125', 'PKM Nilam Sari', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000128', 'PKM Gulai Bancah', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000131', 'PKM Mandiangin Plus', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000134', 'PKM Tigo Baleh', NULL, 'LV2000000000036', NULL);
INSERT INTO `level3` VALUES ('LV3000000000143', 'PKM Sidorejo Kidul', NULL, 'LV2000000000034', NULL);
INSERT INTO `level3` VALUES ('LV3000000000146', 'PKM Mangunsari', NULL, 'LV2000000000034', NULL);
INSERT INTO `level3` VALUES ('LV3000000000149', 'PKM Kalicacing', NULL, 'LV2000000000034', NULL);
INSERT INTO `level3` VALUES ('LV3000000000152', 'PKM Sidorejo Lor', NULL, 'LV2000000000034', NULL);
INSERT INTO `level3` VALUES ('LV3000000000155', 'PKM Cebongan', NULL, 'LV2000000000034', NULL);
INSERT INTO `level3` VALUES ('LV3000000000158', 'PKM Tegalrejo', NULL, 'LV2000000000034', NULL);
INSERT INTO `level3` VALUES ('LV3000000000161', 'PKM Tawangsari', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000164', 'PKM Sukoharjo', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000167', 'PKM Nguter', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000168', 'PKM Weru', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000169', 'PKM Bulu', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000170', 'PKM Bendosari', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000171', 'PKM Polokarto', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000172', 'PKM Mojolaban', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000173', 'PKM Grogol', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000174', 'PKM Baki', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000175', 'PKM Gatak', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000176', 'PKM Kartasura', NULL, 'LV2000000000035', NULL);
INSERT INTO `level3` VALUES ('LV3000000000179', 'LABKESDA Trenggalek', NULL, 'LV2000000000037', NULL);
INSERT INTO `level3` VALUES ('LV3000000000180', 'Inst. Farmasi Trenggalek', NULL, 'LV2000000000038', NULL);
INSERT INTO `level3` VALUES ('LV3000000000181', 'PMI Kab. Trenggalek', NULL, 'LV2000000000039', NULL);
INSERT INTO `level3` VALUES ('LV3000000000182', 'Rutan Kelas II B  Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000183', 'KP Harapan Sehat BNNK  Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000184', 'KP Polkes 05.09.08  Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000185', 'Klinik Sidokkes Polres Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000186', 'KPRI An-Nisa Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000187', 'Klinik Wijaya Kusuma Medika Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000188', 'KP ABA Husada  Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000189', 'KPRI Dewasaka Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000190', 'Klinik Rejowinangun Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000191', 'KPRI Nurmedika  Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000192', 'KRI Afiah Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000193', 'KP Prasetya Husada Watulimo  Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000194', 'Lab. Medis Dia Medika Trenggalek', NULL, 'LV2000000000041', NULL);
INSERT INTO `level3` VALUES ('LV3000000000195', 'Klinik Romo Wijoyo Trenggalek', NULL, 'LV2000000000040', NULL);
INSERT INTO `level3` VALUES ('LV3000000000196', 'Klinik Tinspardi Medika Trenggalek', NULL, 'LV2000000000042', NULL);
INSERT INTO `level3` VALUES ('LV3000000000197', '102. Klinik Spesialis Penyakit Dalam', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000198', '103.  Klinik Spesialis Kesehatan Anak', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000199', '104.  Klinik Spesialis Bedah', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000200', '105. Klinik Spesialis Kebidanan & Kandungan', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000201', '106. Klinik Spesialis Mata & Sub Spesialistik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000202', '107. Klinik Spesialis THT', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000203', '108. Klinik Gigi Umum, Spesialis & Sub Spesialistik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000204', '128. Klinik Spesialis Jantung, Pembuluh Darah & Sub Spesialistik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000205', '129. Klinik Spesialis Paru & Pernafasan', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000206', '130. Klinik Spesialis Kedokteran Jiwa/ Psikiatri', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000207', '131. Klinik Spesialis Saraf/ Neurologi & Sub Spesialistik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000208', '132. Klinik Spesialis Kulit & Kelamin', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000209', '133. Klinik Spesialis Bedah Orthopaedi Umum & Sub Spesialistik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000210', '134. Klinik Spesialis Bedah Plastik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000211', '135. Klinik Spesialis Bedah Syaraf', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000212', '136. Klinik Spesialis Urologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000213', '137. Klinik Spesialis Onkologi Radiasi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000214', '138. Klinik Spesialis Anestesiologi & Terapi Intensif', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000215', '139. Klinik Spesialis Gizi Klinik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000216', '140. Klinik Spesialis Geriatri', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000217', '141. Klinik Spesialis Akupuntur Klinik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000218', '200. Klinik Spesialis Kedokteran Fisik & Rehabilitasi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000219', '896. Klinik Spesialis Kedokteran Okupasi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000220', '897. Klinik Spesialis Andrologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000221', '898. Klinik Spesialis Bedah Anak', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000222', '899. Klinik Spesialis Bedah Mulut & Maksilofasial', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000223', '900. Klinik Spesialis Bedah Plastik Rekonstruksi & Estetik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000224', '900. Klinik Spesialis Bedah Toraks Kardiovaskuler', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000225', '902. Klinik Spesialis Kedokteran Forensik & Medikolegal', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000226', '903. Klinik Spesialis Farmokologi Klinik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000227', '904. Klinik Spesialis Konservasi Gigi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000228', '905. Klinik Spesialis Kedokteran Gigi Anak', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000229', '907. Klinik Spesialis Kedokteran Nuklir', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000230', '908. Klinik Spesialis Kedokteran Olahraga', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000231', '909. Klinik Spesialis Ortodonsia', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000232', '910. Klinik Spesialis Penyakit Mulut', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000233', '911. Klinik Spesialis Prostodonsia', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000234', '913. Klinik Spesialis Radiologi Kedokteran Gigi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000235', '914. Klinik Spesialis Mikrobiologi Klinik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000236', '915. Klinik Spesialis Parasitologi Klinik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000237', '916. Klinik Spesialis Periodonsia', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000238', '917. Klinik Spesialis Patologi Anatomi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000239', '918. Klinik Spesialis Patologi Klinik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000240', '930. Klinik Spesialis Radiologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000241', '933. Klinik Spesialis Kedokteran Penerbangan', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000242', '20217. Klinik Spesialis Bedah Urology', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000243', '20218. Klinik Spesialis Bedah Digestif', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000244', '90419. Klinik Spesialis Mata Umum', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000245', '90421. Klinik Spesialis Rekontruksi Okuloplasti & Onkologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000246', '90424. Klinik Spesialis Vitreo-Retina', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000247', '90425. Klinik Spesialis Glaukoma', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000248', '90426. Klinik Spesialis Katarak & Bedah Refraktif', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000249', '90427. Klinik Spesialis Refraksi & Low Vision', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000250', '90428. Klinik Spesialis Mata Anak & Strabismus', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000251', '11. IRJA', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000252', '1349. Klinik Umum', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000253', '90148. Poli Khsusu', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000254', '1351. Klinik Kusta', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000255', '1352. Klinik VCT', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000256', '1353. Klinik CST', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000257', '1443. Klinik Onkologi Medik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000258', '1446. Klinik Onkologi Bedah', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000259', '1447. Klinik Onkologi THT', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000260', '1449. Klinik Kulit Kelamin', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000261', '1452. Klinik Paru Onkologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000262', '1455. Klinik Digestif Onkologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000263', '1457. Klinik Neurologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000264', '1459. Klinik Bedah Saraf', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000265', '1461. Klinik Anak', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000266', '1541. Klinik Tumbuh Kembang (Psiakitri) Anak & Remaja', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000267', '1555. Klinik Psikogeriatri', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000268', '1559. Klinik Psikometri', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000269', '1560. Klinik Gangguan Mental Organik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000270', '1561. Klinik Ketergantungan Obat/NAPZA', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000271', '1567. Klinik Kesehatan Jiwa Masyarakat', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000272', '1858. Klinik Psikologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000273', '20214. Klinik Hiperbarik', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000274', '20215. Klinik Rabies', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000275', '20216. Klinik Diabetic', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000276', '20223. Klinik Nyeri', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000277', '90009. Klinik Psikososial', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000278', '90048. Klinik Penyakit Infeksi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000279', '90049. Klinik Orthopedi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000280', '90197. Klinik Kosmetik & Anti Aging', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000281', '90215. Klinik Vaksin', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000282', '90377. Klinik Nefrologi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000283', '90420. Klinik Infeksi  & Imunologi Mata', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000284', '90427. Klinik Refraksi & Low Vision', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000285', '91243. Klinik Vaskuler', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000286', '91244. Klinik Ginjal Hipertensi', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000287', '923. Klinik Medical CHeck Up', NULL, 'LV2000000000043', NULL);
INSERT INTO `level3` VALUES ('LV3000000000288', '12. IGD', NULL, 'LV2000000000044', NULL);
INSERT INTO `level3` VALUES ('LV3000000000289', '1256. NICU', NULL, 'LV2000000000045', NULL);
INSERT INTO `level3` VALUES ('LV3000000000290', '1271. PICU', NULL, 'LV2000000000046', NULL);
INSERT INTO `level3` VALUES ('LV3000000000291', '13. IRNA', NULL, 'LV2000000000047', NULL);
INSERT INTO `level3` VALUES ('LV3000000000292', '1391. HCU', NULL, 'LV2000000000048', NULL);
INSERT INTO `level3` VALUES ('LV3000000000293', '14. IBS', NULL, 'LV2000000000049', NULL);
INSERT INTO `level3` VALUES ('LV3000000000294', '1432. Inst. Diagnostik', NULL, 'LV2000000000050', NULL);
INSERT INTO `level3` VALUES ('LV3000000000295', '1484. Inst. Deteksi Dini Kanker', NULL, 'LV2000000000051', NULL);
INSERT INTO `level3` VALUES ('LV3000000000296', '15. ICU', NULL, 'LV2000000000052', NULL);
INSERT INTO `level3` VALUES ('LV3000000000297', '1525. Inst. Cathlab', NULL, 'LV2000000000053', NULL);
INSERT INTO `level3` VALUES ('LV3000000000298', '1532. ITRB', NULL, 'LV2000000000054', NULL);
INSERT INTO `level3` VALUES ('LV3000000000299', '1535. IRNA Khusus', NULL, 'LV2000000000055', NULL);
INSERT INTO `level3` VALUES ('LV3000000000300', '20195. Inst. Khusus Internasional', NULL, 'LV2000000000056', NULL);
INSERT INTO `level3` VALUES ('LV3000000000301', '587. Inst. Jantung Terpadu', NULL, 'LV2000000000057', NULL);
INSERT INTO `level3` VALUES ('LV3000000000302', '621. Inst. VK', NULL, 'LV2000000000058', NULL);
INSERT INTO `level3` VALUES ('LV3000000000303', '636. Inst. Neonatus', NULL, 'LV2000000000059', NULL);
INSERT INTO `level3` VALUES ('LV3000000000304', '90012. Inst. Rawat Intensif Jiwa', NULL, 'LV2000000000060', NULL);
INSERT INTO `level3` VALUES ('LV3000000000305', '1502. Bag. Litbang', NULL, 'LV2000000000061', NULL);
INSERT INTO `level3` VALUES ('LV3000000000306', '1001. Inst. Kedokteran Nuklir', NULL, 'LV2000000000062', NULL);
INSERT INTO `level3` VALUES ('LV3000000000307', '1235. Inst. Radiodiagnostik', NULL, 'LV2000000000063', NULL);
INSERT INTO `level3` VALUES ('LV3000000000308', '1362. Inst. Lab. PK', NULL, 'LV2000000000064', NULL);
INSERT INTO `level3` VALUES ('LV3000000000309', '1363. Inst. Lab. PA', NULL, 'LV2000000000065', NULL);
INSERT INTO `level3` VALUES ('LV3000000000310', '16. Inst. Radiologi', NULL, 'LV2000000000066', NULL);
INSERT INTO `level3` VALUES ('LV3000000000311', '17. Inst. Farmasi', NULL, 'LV2000000000067', NULL);
INSERT INTO `level3` VALUES ('LV3000000000312', '19. Inst. Laboratorium', NULL, 'LV2000000000068', NULL);
INSERT INTO `level3` VALUES ('LV3000000000313', '20. Inst. Rehab Medik', NULL, 'LV2000000000069', NULL);
INSERT INTO `level3` VALUES ('LV3000000000314', '23. Inst. Jenazah', NULL, 'LV2000000000070', NULL);
INSERT INTO `level3` VALUES ('LV3000000000315', '37. Inst. Radioterapi', NULL, 'LV2000000000071', NULL);
INSERT INTO `level3` VALUES ('LV3000000000316', '90002. Inst. Pusat Jantung Terpadu', NULL, 'LV2000000000072', NULL);
INSERT INTO `level3` VALUES ('LV3000000000317', '37. Inst. Bank Darah', NULL, 'LV2000000000073', NULL);
INSERT INTO `level3` VALUES ('LV3000000000318', '1210. Unit Hemodialisa', NULL, 'LV2000000000074', NULL);
INSERT INTO `level3` VALUES ('LV3000000000319', '1166. Inst. Sanitasi', NULL, 'LV2000000000076', NULL);
INSERT INTO `level3` VALUES ('LV3000000000320', '1523. IPSM', NULL, 'LV2000000000077', NULL);
INSERT INTO `level3` VALUES ('LV3000000000321', '1524. IPSNM', NULL, 'LV2000000000078', NULL);
INSERT INTO `level3` VALUES ('LV3000000000322', '39. Inst. Gizi', NULL, 'LV2000000000079', NULL);
INSERT INTO `level3` VALUES ('LV3000000000323', '40. Inst. Laundry', NULL, 'LV2000000000080', NULL);
INSERT INTO `level3` VALUES ('LV3000000000324', '41. IPS (Workshop)', NULL, 'LV2000000000081', NULL);
INSERT INTO `level3` VALUES ('LV3000000000325', '51. CSSD', NULL, 'LV2000000000082', NULL);
INSERT INTO `level3` VALUES ('LV3000000000326', '1302. Bag. SDM', NULL, 'LV2000000000083', NULL);
INSERT INTO `level3` VALUES ('LV3000000000327', '28. Bag. Keu & Program', NULL, 'LV2000000000084', NULL);
INSERT INTO `level3` VALUES ('LV3000000000328', '29. Bag. Sekreatiat & Rekmed', NULL, 'LV2000000000085', NULL);
INSERT INTO `level3` VALUES ('LV3000000000329', '34. Bag. Diklat', NULL, 'LV2000000000086', NULL);
INSERT INTO `level3` VALUES ('LV3000000000330', '32. Bid. Yanmed', NULL, 'LV2000000000087', NULL);
INSERT INTO `level3` VALUES ('LV3000000000331', '33. Bid. Kep.', NULL, 'LV2000000000088', NULL);
INSERT INTO `level3` VALUES ('LV3000000000332', '68. Bid. Jangmed', NULL, 'LV2000000000089', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 545 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lokasi
-- ----------------------------
INSERT INTO `lokasi` VALUES (115, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000001', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (116, 'Gudang Obat', NULL, NULL, NULL, 'LV3000000000001', 'Gudang Obat');
INSERT INTO `lokasi` VALUES (117, 'Gudang Barang', NULL, NULL, NULL, 'LV3000000000001', 'Gudang Barang');
INSERT INTO `lokasi` VALUES (118, 'Garasi Ambulance', NULL, NULL, NULL, 'LV3000000000001', 'Garasi Ambulance');
INSERT INTO `lokasi` VALUES (119, 'Toilet Pengunjung', NULL, NULL, NULL, 'LV3000000000001', 'Toilet Pengunjung');
INSERT INTO `lokasi` VALUES (120, 'Toilet Karyawan', NULL, NULL, NULL, 'LV3000000000001', 'Toilet Karyawan');
INSERT INTO `lokasi` VALUES (121, 'Sampah Non-Medis', NULL, NULL, NULL, 'LV3000000000001', 'Sampah Non-Medis');
INSERT INTO `lokasi` VALUES (122, 'Sampah Medis', NULL, NULL, NULL, 'LV3000000000001', 'Sampah Medis');
INSERT INTO `lokasi` VALUES (123, 'Parkir', NULL, NULL, NULL, 'LV3000000000001', 'Parkir');
INSERT INTO `lokasi` VALUES (124, 'Mushola', NULL, NULL, NULL, 'LV3000000000001', 'Mushola');
INSERT INTO `lokasi` VALUES (125, 'Rumdin Nakes', NULL, NULL, NULL, 'LV3000000000001', 'Rumdin Nakes');
INSERT INTO `lokasi` VALUES (126, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000002', 'Poli Umum');
INSERT INTO `lokasi` VALUES (127, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000002', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (128, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000002', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (129, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000002', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (130, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000002', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (131, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000002', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (132, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000002', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (133, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000002', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (134, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000002', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (135, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000002', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (136, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000003', 'Poli Umum');
INSERT INTO `lokasi` VALUES (137, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000003', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (138, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000003', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (139, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000003', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (140, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000003', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (141, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000003', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (142, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000003', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (143, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000003', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (144, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000003', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (145, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000003', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (146, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000004', 'Poli Umum');
INSERT INTO `lokasi` VALUES (147, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000004', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (148, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000004', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (149, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000004', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (150, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000004', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (151, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000004', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (152, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000004', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (153, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000004', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (154, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000004', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (155, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000004', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (156, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000005', 'Poli Umum');
INSERT INTO `lokasi` VALUES (157, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000005', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (158, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000005', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (159, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000005', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (160, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000005', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (161, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000005', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (162, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000005', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (163, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000005', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (164, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000005', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (165, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000005', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (166, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000006', 'Poli Umum');
INSERT INTO `lokasi` VALUES (167, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000006', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (168, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000006', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (169, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000006', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (170, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000006', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (171, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000006', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (172, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000006', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (173, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000006', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (174, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000006', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (175, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000006', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (176, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000007', 'Poli Umum');
INSERT INTO `lokasi` VALUES (177, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000007', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (178, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000007', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (179, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000007', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (180, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000007', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (181, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000007', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (182, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000007', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (183, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000007', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (184, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000007', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (185, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000007', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (186, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000008', 'Poli Umum');
INSERT INTO `lokasi` VALUES (187, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000008', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (188, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000008', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (189, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000008', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (190, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000008', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (191, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000008', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (192, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000008', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (193, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000008', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (194, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000008', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (195, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000008', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (196, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000009', 'Poli Umum');
INSERT INTO `lokasi` VALUES (197, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000009', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (198, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000009', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (199, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000009', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (200, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000009', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (201, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000009', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (202, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000009', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (203, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000009', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (204, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000009', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (205, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000009', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (206, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000010', 'Poli Umum');
INSERT INTO `lokasi` VALUES (207, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000010', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (208, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000010', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (209, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000010', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (210, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000010', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (211, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000010', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (212, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000010', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (213, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000010', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (214, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000010', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (215, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000010', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (216, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000011', 'Poli Umum');
INSERT INTO `lokasi` VALUES (217, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000011', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (218, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000011', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (219, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000011', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (220, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000011', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (221, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000011', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (222, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000011', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (223, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000011', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (224, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000011', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (225, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000011', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (226, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000012', 'Poli Umum');
INSERT INTO `lokasi` VALUES (227, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000012', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (228, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000012', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (229, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000012', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (230, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000012', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (231, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000012', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (232, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000012', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (233, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000012', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (234, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000012', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (235, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000012', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (236, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000013', 'Poli Umum');
INSERT INTO `lokasi` VALUES (237, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000013', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (238, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000013', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (239, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000013', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (240, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000013', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (241, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000013', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (242, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000013', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (243, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000013', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (244, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000013', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (245, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000013', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (246, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000014', 'Poli Umum');
INSERT INTO `lokasi` VALUES (247, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000014', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (248, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000014', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (249, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000014', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (250, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000014', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (251, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000014', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (252, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000014', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (253, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000014', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (254, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000014', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (255, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000014', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (256, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000015', 'Poli Umum');
INSERT INTO `lokasi` VALUES (257, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000015', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (258, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000015', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (259, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000015', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (260, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000015', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (261, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000015', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (262, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000015', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (263, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000015', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (264, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000015', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (265, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000015', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (266, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000016', 'Poli Umum');
INSERT INTO `lokasi` VALUES (267, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000016', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (268, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000016', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (269, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000016', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (270, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000016', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (271, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000016', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (272, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000016', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (273, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000016', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (274, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000016', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (275, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000016', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (276, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000017', 'Poli Umum');
INSERT INTO `lokasi` VALUES (277, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000017', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (278, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000017', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (279, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000017', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (280, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000017', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (281, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000017', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (282, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000017', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (283, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000017', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (284, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000017', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (285, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000017', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (286, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000018', 'Poli Umum');
INSERT INTO `lokasi` VALUES (287, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000018', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (288, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000018', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (289, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000018', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (290, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000018', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (291, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000018', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (292, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000018', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (293, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000018', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (294, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000018', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (295, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000018', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (296, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000019', 'Poli Umum');
INSERT INTO `lokasi` VALUES (297, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000019', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (298, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000019', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (299, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000019', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (300, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000019', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (301, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000019', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (302, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000019', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (303, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000019', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (304, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000019', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (305, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000019', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (306, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000020', 'Poli Umum');
INSERT INTO `lokasi` VALUES (307, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000020', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (308, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000020', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (309, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000020', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (310, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000020', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (311, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000020', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (312, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000020', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (313, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000020', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (314, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000020', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (315, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000020', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (316, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000021', 'Poli Umum');
INSERT INTO `lokasi` VALUES (317, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000021', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (318, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000021', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (319, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000021', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (320, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000021', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (321, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000021', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (322, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000021', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (323, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000021', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (324, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000021', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (325, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000021', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (326, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000021', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (327, 'Poli Umum', NULL, NULL, NULL, 'LV3000000000022', 'Poli Umum');
INSERT INTO `lokasi` VALUES (328, 'R. Tindakan/UGD', NULL, NULL, NULL, 'LV3000000000022', 'R. Tindakan/UGD');
INSERT INTO `lokasi` VALUES (329, 'R. Kesgilut', NULL, NULL, NULL, 'LV3000000000022', 'R. Kesgilut');
INSERT INTO `lokasi` VALUES (330, 'R. Bersalin', NULL, NULL, NULL, 'LV3000000000022', 'R. Bersalin');
INSERT INTO `lokasi` VALUES (331, 'R. Pendaftaran & RM', NULL, NULL, NULL, 'LV3000000000022', 'R. Pendaftaran & RM');
INSERT INTO `lokasi` VALUES (332, 'R. Farmasi/Kamar-Obat', NULL, NULL, NULL, 'LV3000000000022', 'R. Farmasi/Kamar-Obat');
INSERT INTO `lokasi` VALUES (333, 'R. Laboratorium', NULL, NULL, NULL, 'LV3000000000022', 'R. Laboratorium');
INSERT INTO `lokasi` VALUES (334, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000022', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (335, 'R. Rawat Inap', NULL, NULL, NULL, 'LV3000000000022', 'R. Rawat Inap');
INSERT INTO `lokasi` VALUES (336, 'Penyimpanan Vaksin', NULL, NULL, NULL, 'LV3000000000022', 'Penyimpanan Vaksin');
INSERT INTO `lokasi` VALUES (337, 'R. Penerimaan Sampel', NULL, NULL, NULL, 'LV3000000000179', 'R. Penerimaan Sampel');
INSERT INTO `lokasi` VALUES (338, 'R. Pemeriksaan & Analisis', NULL, NULL, NULL, 'LV3000000000179', 'R. Pemeriksaan & Analisis');
INSERT INTO `lokasi` VALUES (339, 'R. Pengambilan Sampel', NULL, NULL, NULL, 'LV3000000000179', 'R. Pengambilan Sampel');
INSERT INTO `lokasi` VALUES (340, 'R. Kimia Darah', NULL, NULL, NULL, 'LV3000000000179', 'R. Kimia Darah');
INSERT INTO `lokasi` VALUES (341, 'R. Darah Rutin', NULL, NULL, NULL, 'LV3000000000179', 'R. Darah Rutin');
INSERT INTO `lokasi` VALUES (342, 'R. Mikrobiologi', NULL, NULL, NULL, 'LV3000000000179', 'R. Mikrobiologi');
INSERT INTO `lokasi` VALUES (343, 'R. Molekuler', NULL, NULL, NULL, 'LV3000000000179', 'R. Molekuler');
INSERT INTO `lokasi` VALUES (344, 'R. Serologi', NULL, NULL, NULL, 'LV3000000000179', 'R. Serologi');
INSERT INTO `lokasi` VALUES (345, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000179', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (346, 'Penyimpanan Bahan Kimia & Reagent', NULL, NULL, NULL, 'LV3000000000179', 'Penyimpanan Bahan Kimia & Reagent');
INSERT INTO `lokasi` VALUES (347, 'Penyimpanan Sampel', NULL, NULL, NULL, 'LV3000000000179', 'Penyimpanan Sampel');
INSERT INTO `lokasi` VALUES (348, 'R. Adm. & Data Entry', NULL, NULL, NULL, 'LV3000000000179', 'R. Adm. & Data Entry');
INSERT INTO `lokasi` VALUES (349, 'R. Kepala Labkesda', NULL, NULL, NULL, 'LV3000000000179', 'R. Kepala Labkesda');
INSERT INTO `lokasi` VALUES (350, 'R. Rapat/Meeting', NULL, NULL, NULL, 'LV3000000000179', 'R. Rapat/Meeting');
INSERT INTO `lokasi` VALUES (351, 'Toilet Karyawan', NULL, NULL, NULL, 'LV3000000000179', 'Toilet Karyawan');
INSERT INTO `lokasi` VALUES (352, 'Toilet Pasien/Pengunjung', NULL, NULL, NULL, 'LV3000000000179', 'Toilet Pasien/Pengunjung');
INSERT INTO `lokasi` VALUES (353, 'R. Cold Chain', NULL, NULL, NULL, 'LV3000000000180', 'R. Cold Chain');
INSERT INTO `lokasi` VALUES (354, 'R. Tranfusi Darah', NULL, NULL, NULL, 'LV3000000000181', 'R. Tranfusi Darah');
INSERT INTO `lokasi` VALUES (355, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000182', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (356, 'R. Pengambilan Sampel', NULL, NULL, NULL, 'LV3000000000183', 'R. Pengambilan Sampel');
INSERT INTO `lokasi` VALUES (357, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000184', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (358, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000185', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (359, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000186', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (360, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000187', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (361, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000188', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (362, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000189', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (363, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000190', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (364, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000191', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (365, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000192', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (366, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000193', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (367, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000194', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (370, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000195', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (371, 'R. Pemeriksaan Fisik', NULL, NULL, NULL, 'LV3000000000196', 'R. Pemeriksaan Fisik');
INSERT INTO `lokasi` VALUES (373, 'Klinik Umum', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Umum');
INSERT INTO `lokasi` VALUES (374, 'Klinik Penyakit Dalam', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Penyakit Dalam');
INSERT INTO `lokasi` VALUES (375, 'Klinik Kesehatan Anak', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Kesehatan Anak');
INSERT INTO `lokasi` VALUES (376, 'Klinik Kebidanan & Kandungan', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Kebidanan & Kandungan');
INSERT INTO `lokasi` VALUES (377, 'Klinik Mata', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Mata');
INSERT INTO `lokasi` VALUES (378, 'Klinik Gigi', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Gigi');
INSERT INTO `lokasi` VALUES (379, 'Klinik THT', NULL, NULL, NULL, 'LV3000000000251', 'Klinik THT');
INSERT INTO `lokasi` VALUES (380, 'Klinik Jantung', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Jantung');
INSERT INTO `lokasi` VALUES (381, 'Klinik Paru', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Paru');
INSERT INTO `lokasi` VALUES (382, 'Klinik Syaraf', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Syaraf');
INSERT INTO `lokasi` VALUES (383, 'Klinik Kulit & Kelamin', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Kulit & Kelamin');
INSERT INTO `lokasi` VALUES (384, 'Klinik Urologi', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Urologi');
INSERT INTO `lokasi` VALUES (385, 'Klinik Bedah', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Bedah');
INSERT INTO `lokasi` VALUES (386, 'Klinik Bedah Syaraf', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Bedah Syaraf');
INSERT INTO `lokasi` VALUES (387, 'Klinik Bedah Ortopedi', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Bedah Ortopedi');
INSERT INTO `lokasi` VALUES (388, 'Klinik Mata', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Mata');
INSERT INTO `lokasi` VALUES (389, 'Klinik Orthopedi', NULL, NULL, NULL, 'LV3000000000251', 'Klinik Orthopedi');
INSERT INTO `lokasi` VALUES (390, 'R. Triase', NULL, NULL, NULL, 'LV3000000000288', 'R. Triase');
INSERT INTO `lokasi` VALUES (391, 'R. Tindakan', NULL, NULL, NULL, 'LV3000000000288', 'R. Tindakan');
INSERT INTO `lokasi` VALUES (392, 'R. Bedah', NULL, NULL, NULL, 'LV3000000000288', 'R. Bedah');
INSERT INTO `lokasi` VALUES (393, 'Radiologi Cito', NULL, NULL, NULL, 'LV3000000000288', 'Radiologi Cito');
INSERT INTO `lokasi` VALUES (394, 'Laboratorium Standar', NULL, NULL, NULL, 'LV3000000000288', 'Laboratorium Standar');
INSERT INTO `lokasi` VALUES (395, 'R. Pediatry', NULL, NULL, NULL, 'LV3000000000288', 'R. Pediatry');
INSERT INTO `lokasi` VALUES (396, 'R. Kebidanan & Kandungan', NULL, NULL, NULL, 'LV3000000000288', 'R. Kebidanan & Kandungan');
INSERT INTO `lokasi` VALUES (397, 'HCU', NULL, NULL, NULL, 'LV3000000000288', 'HCU');
INSERT INTO `lokasi` VALUES (398, 'R. Resusitasi', NULL, NULL, NULL, 'LV3000000000288', 'R. Resusitasi');
INSERT INTO `lokasi` VALUES (399, 'R. Strectcher/Brangkar', NULL, NULL, NULL, 'LV3000000000288', 'R. Strectcher/Brangkar');
INSERT INTO `lokasi` VALUES (400, 'R. Dekontaminasi', NULL, NULL, NULL, 'LV3000000000288', 'R. Dekontaminasi');
INSERT INTO `lokasi` VALUES (401, 'R. Observasi', NULL, NULL, NULL, 'LV3000000000288', 'R. Observasi');
INSERT INTO `lokasi` VALUES (402, 'R. Gas Medis', NULL, NULL, NULL, 'LV3000000000288', 'R. Gas Medis');
INSERT INTO `lokasi` VALUES (403, 'R. Isolasi tipe S', NULL, NULL, NULL, 'LV3000000000288', 'R. Isolasi tipe S');
INSERT INTO `lokasi` VALUES (404, 'R. Isolasi tipe P', NULL, NULL, NULL, 'LV3000000000288', 'R. Isolasi tipe P');
INSERT INTO `lokasi` VALUES (405, 'R. Isolasai tipe N', NULL, NULL, NULL, 'LV3000000000288', 'R. Isolasai tipe N');
INSERT INTO `lokasi` VALUES (406, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000288', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (407, 'R. Penyimpanan Alat Medik', NULL, NULL, NULL, 'LV3000000000288', 'R. Penyimpanan Alat Medik');
INSERT INTO `lokasi` VALUES (408, 'R. Parkir Troli/ Kursi Roda', NULL, NULL, NULL, 'LV3000000000288', 'R. Parkir Troli/ Kursi Roda');
INSERT INTO `lokasi` VALUES (409, 'R. Perawatan Umum', NULL, NULL, NULL, 'LV3000000000291', 'R. Perawatan Umum');
INSERT INTO `lokasi` VALUES (410, 'R. Rawat Anak', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Anak');
INSERT INTO `lokasi` VALUES (411, 'R. Rawat Bayi', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Bayi');
INSERT INTO `lokasi` VALUES (412, 'R. Rawat Paru + Pernafasan', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Paru + Pernafasan');
INSERT INTO `lokasi` VALUES (413, 'R. Rawat Jantung & Pembuluh Darah', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Jantung & Pembuluh Darah');
INSERT INTO `lokasi` VALUES (414, 'R. Rawat Orthopedi', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Orthopedi');
INSERT INTO `lokasi` VALUES (415, 'R, Rawat Obstetri & Ginekologi', NULL, NULL, NULL, 'LV3000000000291', 'R, Rawat Obstetri & Ginekologi');
INSERT INTO `lokasi` VALUES (416, 'R. Rawat Penyakit Dalam', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Penyakit Dalam');
INSERT INTO `lokasi` VALUES (417, 'R. Rawat Penyakit Dalam', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Penyakit Dalam');
INSERT INTO `lokasi` VALUES (418, 'R. Rawat Jiwa/ Psikiatri', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Jiwa/ Psikiatri');
INSERT INTO `lokasi` VALUES (419, 'R. Rawat Mata', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Mata');
INSERT INTO `lokasi` VALUES (420, 'R. Rawat Isolasi', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Isolasi');
INSERT INTO `lokasi` VALUES (421, 'R. Rawat Obstetri & Ginekologi', NULL, NULL, NULL, 'LV3000000000291', 'R. Rawat Obstetri & Ginekologi');
INSERT INTO `lokasi` VALUES (422, 'R. HCU', NULL, NULL, NULL, 'LV3000000000291', 'R. HCU');
INSERT INTO `lokasi` VALUES (423, 'R. Stasi Perawat/Nurse Station', NULL, NULL, NULL, 'LV3000000000291', 'R. Stasi Perawat/Nurse Station');
INSERT INTO `lokasi` VALUES (424, 'R. Rawat ICU', NULL, NULL, NULL, 'LV3000000000296', 'R. Rawat ICU');
INSERT INTO `lokasi` VALUES (425, 'R. Rawat Isolasi kelas S', NULL, NULL, NULL, 'LV3000000000296', 'R. Rawat Isolasi kelas S');
INSERT INTO `lokasi` VALUES (426, 'R. Rawat Isolasi kelas P', NULL, NULL, NULL, 'LV3000000000296', 'R. Rawat Isolasi kelas P');
INSERT INTO `lokasi` VALUES (427, 'R. Rawat Isolasi kelas N', NULL, NULL, NULL, 'LV3000000000296', 'R. Rawat Isolasi kelas N');
INSERT INTO `lokasi` VALUES (428, 'R. ICCU', NULL, NULL, NULL, 'LV3000000000296', 'R. ICCU');
INSERT INTO `lokasi` VALUES (429, 'R. HCU', NULL, NULL, NULL, 'LV3000000000296', 'R. HCU');
INSERT INTO `lokasi` VALUES (430, 'R. Rawat Luka Bakar', NULL, NULL, NULL, 'LV3000000000296', 'R. Rawat Luka Bakar');
INSERT INTO `lokasi` VALUES (431, 'R. Rawat Stroke', NULL, NULL, NULL, 'LV3000000000296', 'R. Rawat Stroke');
INSERT INTO `lokasi` VALUES (432, 'R. Sentral Monitoring / Nurse STation', NULL, NULL, NULL, 'LV3000000000296', 'R. Sentral Monitoring / Nurse STation');
INSERT INTO `lokasi` VALUES (433, 'Gudang Alat Medik', NULL, NULL, NULL, 'LV3000000000296', 'Gudang Alat Medik');
INSERT INTO `lokasi` VALUES (434, 'R. Rawat PICU', NULL, NULL, NULL, 'LV3000000000290', 'R. Rawat PICU');
INSERT INTO `lokasi` VALUES (435, 'R. Rawat NICU', NULL, NULL, NULL, 'LV3000000000289', 'R. Rawat NICU');
INSERT INTO `lokasi` VALUES (436, 'R. Bedah Minor / Endoscopy', NULL, NULL, NULL, 'LV3000000000293', 'R. Bedah Minor / Endoscopy');
INSERT INTO `lokasi` VALUES (437, 'R. Bedah Mayor', NULL, NULL, NULL, 'LV3000000000293', 'R. Bedah Mayor');
INSERT INTO `lokasi` VALUES (438, 'R. Cathlab', NULL, NULL, NULL, 'LV3000000000293', 'R. Cathlab');
INSERT INTO `lokasi` VALUES (439, 'Scrub Station', NULL, NULL, NULL, 'LV3000000000293', 'Scrub Station');
INSERT INTO `lokasi` VALUES (440, 'R. Sterilisasi', NULL, NULL, NULL, 'LV3000000000293', 'R. Sterilisasi');
INSERT INTO `lokasi` VALUES (441, 'R. Tindakan / Bersalin', NULL, NULL, NULL, 'LV3000000000302', 'R. Tindakan / Bersalin');
INSERT INTO `lokasi` VALUES (442, 'R. USG', NULL, NULL, NULL, 'LV3000000000302', 'R. USG');
INSERT INTO `lokasi` VALUES (443, 'R. Rawat Post Partum', NULL, NULL, NULL, 'LV3000000000302', 'R. Rawat Post Partum');
INSERT INTO `lokasi` VALUES (444, 'R. Bayi Normal', NULL, NULL, NULL, 'LV3000000000302', 'R. Bayi Normal');
INSERT INTO `lokasi` VALUES (445, 'R. Menyusui / Laktasi / ASI', NULL, NULL, NULL, 'LV3000000000302', 'R. Menyusui / Laktasi / ASI');
INSERT INTO `lokasi` VALUES (446, 'R. Kardiologi', NULL, NULL, NULL, 'LV3000000000294', 'R. Kardiologi');
INSERT INTO `lokasi` VALUES (447, 'R. Ginekologi', NULL, NULL, NULL, 'LV3000000000294', 'R. Ginekologi');
INSERT INTO `lokasi` VALUES (448, 'R. Saluran Cerna', NULL, NULL, NULL, 'LV3000000000294', 'R. Saluran Cerna');
INSERT INTO `lokasi` VALUES (449, 'R. Saluran Napas', NULL, NULL, NULL, 'LV3000000000294', 'R. Saluran Napas');
INSERT INTO `lokasi` VALUES (450, 'R. Jaringan Lunak', NULL, NULL, NULL, 'LV3000000000294', 'R. Jaringan Lunak');
INSERT INTO `lokasi` VALUES (451, 'R. ICCU', NULL, NULL, NULL, 'LV3000000000316', 'R. ICCU');
INSERT INTO `lokasi` VALUES (452, 'R. Bedah Jantung', NULL, NULL, NULL, 'LV3000000000316', 'R. Bedah Jantung');
INSERT INTO `lokasi` VALUES (453, 'R. Cathlab', NULL, NULL, NULL, 'LV3000000000316', 'R. Cathlab');
INSERT INTO `lokasi` VALUES (454, 'R. Echo', NULL, NULL, NULL, 'LV3000000000316', 'R. Echo');
INSERT INTO `lokasi` VALUES (455, 'R. Emergency Jantung', NULL, NULL, NULL, 'LV3000000000316', 'R. Emergency Jantung');
INSERT INTO `lokasi` VALUES (456, 'R. Treadmill', NULL, NULL, NULL, 'LV3000000000316', 'R. Treadmill');
INSERT INTO `lokasi` VALUES (457, 'R. General X-ray', NULL, NULL, NULL, 'LV3000000000307', 'R. General X-ray');
INSERT INTO `lokasi` VALUES (458, 'R. Fluoroskopi', NULL, NULL, NULL, 'LV3000000000307', 'R. Fluoroskopi');
INSERT INTO `lokasi` VALUES (459, 'R. Mammografi', NULL, NULL, NULL, 'LV3000000000307', 'R. Mammografi');
INSERT INTO `lokasi` VALUES (460, 'R. Ultra Sonografi / USG', NULL, NULL, NULL, 'LV3000000000307', 'R. Ultra Sonografi / USG');
INSERT INTO `lokasi` VALUES (461, 'R. CT-Scan', NULL, NULL, NULL, 'LV3000000000307', 'R. CT-Scan');
INSERT INTO `lokasi` VALUES (462, 'R. Mobil X-Ray', NULL, NULL, NULL, 'LV3000000000307', 'R. Mobil X-Ray');
INSERT INTO `lokasi` VALUES (463, 'R. Dental X-Ray + Panoramic', NULL, NULL, NULL, 'LV3000000000307', 'R. Dental X-Ray + Panoramic');
INSERT INTO `lokasi` VALUES (464, 'R. Cath Lab', NULL, NULL, NULL, 'LV3000000000307', 'R. Cath Lab');
INSERT INTO `lokasi` VALUES (465, 'R. MRI', NULL, NULL, NULL, 'LV3000000000307', 'R. MRI');
INSERT INTO `lokasi` VALUES (466, 'Kamar Processing Film', NULL, NULL, NULL, 'LV3000000000307', 'Kamar Processing Film');
INSERT INTO `lokasi` VALUES (467, 'R. RIRA', NULL, NULL, NULL, 'LV3000000000307', 'R. RIRA');
INSERT INTO `lokasi` VALUES (468, 'R. Hot Lab', NULL, NULL, NULL, 'LV3000000000307', 'R. Hot Lab');
INSERT INTO `lokasi` VALUES (469, 'R. Gamma Camera', NULL, NULL, NULL, 'LV3000000000307', 'R. Gamma Camera');
INSERT INTO `lokasi` VALUES (470, 'R. PET-CT', NULL, NULL, NULL, 'LV3000000000307', 'R. PET-CT');
INSERT INTO `lokasi` VALUES (471, 'R. Microselectron', NULL, NULL, NULL, 'LV3000000000315', 'R. Microselectron');
INSERT INTO `lokasi` VALUES (472, 'R. Isotop', NULL, NULL, NULL, 'LV3000000000315', 'R. Isotop');
INSERT INTO `lokasi` VALUES (473, 'R. Blood Iradiator', NULL, NULL, NULL, 'LV3000000000315', 'R. Blood Iradiator');
INSERT INTO `lokasi` VALUES (474, 'R. CT Planning', NULL, NULL, NULL, 'LV3000000000315', 'R. CT Planning');
INSERT INTO `lokasi` VALUES (475, 'R. Cyclotron (Siklotron)', NULL, NULL, NULL, 'LV3000000000315', 'R. Cyclotron (Siklotron)');
INSERT INTO `lokasi` VALUES (476, 'R. Kemoterapi', NULL, NULL, NULL, 'LV3000000000315', 'R. Kemoterapi');
INSERT INTO `lokasi` VALUES (477, 'R. Simulator', NULL, NULL, NULL, 'LV3000000000315', 'R. Simulator');
INSERT INTO `lokasi` VALUES (478, 'R. Kimia Klinik', NULL, NULL, NULL, 'LV3000000000308', 'R. Kimia Klinik');
INSERT INTO `lokasi` VALUES (479, 'R. Hematologi', NULL, NULL, NULL, 'LV3000000000308', 'R. Hematologi');
INSERT INTO `lokasi` VALUES (480, 'R. Mikrobiologi', NULL, NULL, NULL, 'LV3000000000308', 'R. Mikrobiologi');
INSERT INTO `lokasi` VALUES (481, 'R. Flowcytometri', NULL, NULL, NULL, 'LV3000000000308', 'R. Flowcytometri');
INSERT INTO `lokasi` VALUES (482, 'R. Diagnostik Molekuler', NULL, NULL, NULL, 'LV3000000000308', 'R. Diagnostik Molekuler');
INSERT INTO `lokasi` VALUES (483, 'Gudang Alkes Reagensia', NULL, NULL, NULL, 'LV3000000000308', 'Gudang Alkes Reagensia');
INSERT INTO `lokasi` VALUES (484, 'R. Histopatologi', NULL, NULL, NULL, 'LV3000000000309', 'R. Histopatologi');
INSERT INTO `lokasi` VALUES (485, 'R. Citologi', NULL, NULL, NULL, 'LV3000000000309', 'R. Citologi');
INSERT INTO `lokasi` VALUES (486, 'R. Potong Jaringan', NULL, NULL, NULL, 'LV3000000000309', 'R. Potong Jaringan');
INSERT INTO `lokasi` VALUES (487, 'R. Patologi Molekuler', NULL, NULL, NULL, 'LV3000000000309', 'R. Patologi Molekuler');
INSERT INTO `lokasi` VALUES (488, 'R. Imuno Histokimia', NULL, NULL, NULL, 'LV3000000000309', 'R. Imuno Histokimia');
INSERT INTO `lokasi` VALUES (489, 'Gudang Alkes Reagensia', NULL, NULL, NULL, 'LV3000000000309', 'Gudang Alkes Reagensia');
INSERT INTO `lokasi` VALUES (490, 'R. Lab. Kultur', NULL, NULL, NULL, 'LV3000000000305', 'R. Lab. Kultur');
INSERT INTO `lokasi` VALUES (491, 'R. Kultur Sel', NULL, NULL, NULL, 'LV3000000000305', 'R. Kultur Sel');
INSERT INTO `lokasi` VALUES (492, 'R. Lab. RNA', NULL, NULL, NULL, 'LV3000000000305', 'R. Lab. RNA');
INSERT INTO `lokasi` VALUES (493, 'R. Analisis', NULL, NULL, NULL, 'LV3000000000305', 'R. Analisis');
INSERT INTO `lokasi` VALUES (494, 'R. Cold Room', NULL, NULL, NULL, 'LV3000000000305', 'R. Cold Room');
INSERT INTO `lokasi` VALUES (495, 'R. AHU', NULL, NULL, NULL, 'LV3000000000305', 'R. AHU');
INSERT INTO `lokasi` VALUES (496, 'R. Lab. Mikrobiologi', NULL, NULL, NULL, 'LV3000000000305', 'R. Lab. Mikrobiologi');
INSERT INTO `lokasi` VALUES (497, 'R. Biologi Molekuler', NULL, NULL, NULL, 'LV3000000000305', 'R. Biologi Molekuler');
INSERT INTO `lokasi` VALUES (498, 'R. Pembuatan Air Aquadest', NULL, NULL, NULL, 'LV3000000000305', 'R. Pembuatan Air Aquadest');
INSERT INTO `lokasi` VALUES (499, 'R. Elektroforesis', NULL, NULL, NULL, 'LV3000000000305', 'R. Elektroforesis');
INSERT INTO `lokasi` VALUES (500, 'R. Bank Sample', NULL, NULL, NULL, 'LV3000000000305', 'R. Bank Sample');
INSERT INTO `lokasi` VALUES (501, 'Gudang Alkes & Reagent', NULL, NULL, NULL, 'LV3000000000305', 'Gudang Alkes & Reagent');
INSERT INTO `lokasi` VALUES (502, 'R.  Fisioterapi Aktif', NULL, NULL, NULL, 'LV3000000000313', 'R.  Fisioterapi Aktif');
INSERT INTO `lokasi` VALUES (503, 'R. Fisioterapi Pasif', NULL, NULL, NULL, 'LV3000000000313', 'R. Fisioterapi Pasif');
INSERT INTO `lokasi` VALUES (504, 'R. Hidroterapi', NULL, NULL, NULL, 'LV3000000000313', 'R. Hidroterapi');
INSERT INTO `lokasi` VALUES (505, 'R. Terapi Okupasi', NULL, NULL, NULL, 'LV3000000000313', 'R. Terapi Okupasi');
INSERT INTO `lokasi` VALUES (506, 'R. Terapi Wicara Vokasional', NULL, NULL, NULL, 'LV3000000000313', 'R. Terapi Wicara Vokasional');
INSERT INTO `lokasi` VALUES (507, 'R. Terapi Wicara Audiometer', NULL, NULL, NULL, 'LV3000000000313', 'R. Terapi Wicara Audiometer');
INSERT INTO `lokasi` VALUES (508, 'R. GIP (OP)', NULL, NULL, NULL, 'LV3000000000313', 'R. GIP (OP)');
INSERT INTO `lokasi` VALUES (509, 'R. Terapi Psikologi', NULL, NULL, NULL, 'LV3000000000313', 'R. Terapi Psikologi');
INSERT INTO `lokasi` VALUES (510, 'R. Senam / Gymnasium', NULL, NULL, NULL, 'LV3000000000313', 'R. Senam / Gymnasium');
INSERT INTO `lokasi` VALUES (511, 'R. Sensori Intergrasi (SI) Anak', NULL, NULL, NULL, 'LV3000000000313', 'R. Sensori Intergrasi (SI) Anak');
INSERT INTO `lokasi` VALUES (512, 'R. Relaksasi/ Perangsangan Audio-Visual', NULL, NULL, NULL, 'LV3000000000313', 'R. Relaksasi/ Perangsangan Audio-Visual');
INSERT INTO `lokasi` VALUES (513, 'R. Peracikan Obat', NULL, NULL, NULL, 'LV3000000000311', 'R. Peracikan Obat');
INSERT INTO `lokasi` VALUES (514, 'Konter Apotek', NULL, NULL, NULL, 'LV3000000000311', 'Konter Apotek');
INSERT INTO `lokasi` VALUES (515, 'R. Pendingin Jenazah', NULL, NULL, NULL, 'LV3000000000314', 'R. Pendingin Jenazah');
INSERT INTO `lokasi` VALUES (516, 'Lab. Otopsi', NULL, NULL, NULL, 'LV3000000000314', 'Lab. Otopsi');
INSERT INTO `lokasi` VALUES (517, 'R. Penyimpanan Darah (Blood Bank Room)', NULL, NULL, NULL, 'LV3000000000317', 'R. Penyimpanan Darah (Blood Bank Room)');
INSERT INTO `lokasi` VALUES (518, 'Lab. Skrining Darah', NULL, NULL, NULL, 'LV3000000000317', 'Lab. Skrining Darah');
INSERT INTO `lokasi` VALUES (519, 'R. Donor Darah', NULL, NULL, NULL, 'LV3000000000317', 'R. Donor Darah');
INSERT INTO `lokasi` VALUES (520, 'R. Cross Matching', NULL, NULL, NULL, 'LV3000000000317', 'R. Cross Matching');
INSERT INTO `lokasi` VALUES (521, 'Lab. Cryogenic', NULL, NULL, NULL, 'LV3000000000317', 'Lab. Cryogenic');
INSERT INTO `lokasi` VALUES (522, 'Area Pengolahan Air Limbah', NULL, NULL, NULL, 'LV3000000000319', 'Area Pengolahan Air Limbah');
INSERT INTO `lokasi` VALUES (523, 'Area Pengelolaan Limbah Padat', NULL, NULL, NULL, 'LV3000000000319', 'Area Pengelolaan Limbah Padat');
INSERT INTO `lokasi` VALUES (524, 'Area TPS', NULL, NULL, NULL, 'LV3000000000319', 'Area TPS');
INSERT INTO `lokasi` VALUES (525, 'Dapur / Kitchen', NULL, NULL, NULL, 'LV3000000000322', 'Dapur / Kitchen');
INSERT INTO `lokasi` VALUES (526, 'R. Nutrisionis', NULL, NULL, NULL, 'LV3000000000322', 'R. Nutrisionis');
INSERT INTO `lokasi` VALUES (527, 'Inst. Laundry', NULL, NULL, NULL, 'LV3000000000323', 'Inst. Laundry');
INSERT INTO `lokasi` VALUES (528, 'R. Mesin Sterilisasi', NULL, NULL, NULL, 'LV3000000000325', 'R. Mesin Sterilisasi');
INSERT INTO `lokasi` VALUES (529, 'Bengkel Peralatan Medik (Optik, Elektromedik, Mekanik)', NULL, NULL, NULL, 'LV3000000000324', 'Bengkel Peralatan Medik (Optik, Elektromedik, Mekanik)');
INSERT INTO `lokasi` VALUES (530, 'Bengkel Bangunan / Kayu', NULL, NULL, NULL, 'LV3000000000324', 'Bengkel Bangunan / Kayu');
INSERT INTO `lokasi` VALUES (531, 'Bengkel Metal / Logam', NULL, NULL, NULL, 'LV3000000000324', 'Bengkel Metal / Logam');
INSERT INTO `lokasi` VALUES (532, 'R. Studio Gambar & Arsip Teknis', NULL, NULL, NULL, 'LV3000000000324', 'R. Studio Gambar & Arsip Teknis');
INSERT INTO `lokasi` VALUES (533, 'R. Panel Listrik', NULL, NULL, NULL, 'LV3000000000324', 'R. Panel Listrik');
INSERT INTO `lokasi` VALUES (534, 'R. Trafo', NULL, NULL, NULL, 'LV3000000000324', 'R. Trafo');
INSERT INTO `lokasi` VALUES (535, 'R. Genset', NULL, NULL, NULL, 'LV3000000000324', 'R. Genset');
INSERT INTO `lokasi` VALUES (536, 'R. Pompa', NULL, NULL, NULL, 'LV3000000000324', 'R. Pompa');
INSERT INTO `lokasi` VALUES (537, 'R. Boiler', NULL, NULL, NULL, 'LV3000000000324', 'R. Boiler');
INSERT INTO `lokasi` VALUES (538, 'Gudang Spare-Part', NULL, NULL, NULL, 'LV3000000000324', 'Gudang Spare-Part');
INSERT INTO `lokasi` VALUES (539, 'Gudang Alat Rusak', NULL, NULL, NULL, 'LV3000000000324', 'Gudang Alat Rusak');
INSERT INTO `lokasi` VALUES (540, 'Sentra Gas Medis', NULL, NULL, NULL, 'LV3000000000324', 'Sentra Gas Medis');
INSERT INTO `lokasi` VALUES (541, 'Sentra Oksigen Cair', NULL, NULL, NULL, 'LV3000000000324', 'Sentra Oksigen Cair');
INSERT INTO `lokasi` VALUES (542, 'Sentra Air Bersih', NULL, NULL, NULL, 'LV3000000000324', 'Sentra Air Bersih');
INSERT INTO `lokasi` VALUES (543, 'Sentra Hidran', NULL, NULL, NULL, 'LV3000000000324', 'Sentra Hidran');
INSERT INTO `lokasi` VALUES (544, 'Sentra Gas LPG', NULL, NULL, NULL, 'LV3000000000324', 'Sentra Gas LPG');

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
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `model` VALUES (34, 'CX23', 50);
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
INSERT INTO `model` VALUES (53, 'CUUDA5', 189);
INSERT INTO `model` VALUES (54, 'Oxi-Gen10', 190);
INSERT INTO `model` VALUES (55, 'RBP-100', 103);
INSERT INTO `model` VALUES (56, 'DEMO', 191);
INSERT INTO `model` VALUES (57, 'BT-400', 26);
INSERT INTO `model` VALUES (58, 'Tensi-Q', 6);
INSERT INTO `model` VALUES (59, 'Tensi 202', 172);
INSERT INTO `model` VALUES (60, 'BPM PRO', 198);
INSERT INTO `model` VALUES (61, 'P-900 Plus', 192);
INSERT INTO `model` VALUES (62, 'BPM-80', 212);
INSERT INTO `model` VALUES (63, 'P300', 192);
INSERT INTO `model` VALUES (64, 'ASI-300', 212);
INSERT INTO `model` VALUES (65, 'BPM-120', 212);
INSERT INTO `model` VALUES (66, 'NESA-EC02 TD', 211);
INSERT INTO `model` VALUES (67, 'BTM-02', 210);
INSERT INTO `model` VALUES (68, 'BSM-TMD02', 209);
INSERT INTO `model` VALUES (69, 'DS001', 198);
INSERT INTO `model` VALUES (70, 'ABM-TMD01', 208);
INSERT INTO `model` VALUES (71, 'BTF 01 BPM', 207);
INSERT INTO `model` VALUES (72, 'MLTM-02', 202);
INSERT INTO `model` VALUES (73, 'ASC-TMP', 206);
INSERT INTO `model` VALUES (74, 'RMT TP 02', 205);
INSERT INTO `model` VALUES (75, 'KTM-02', 204);
INSERT INTO `model` VALUES (76, 'EST-018 BPM', 203);
INSERT INTO `model` VALUES (77, 'MLHS-08C', 202);
INSERT INTO `model` VALUES (78, 'SN-TM-24', 200);
INSERT INTO `model` VALUES (79, 'UA-711', 197);
INSERT INTO `model` VALUES (80, 'LP110', 214);
INSERT INTO `model` VALUES (81, 'Custo ec3000e', 215);
INSERT INTO `model` VALUES (82, 'Taurus Touch', 216);
INSERT INTO `model` VALUES (83, 'SE-1515', 217);
INSERT INTO `model` VALUES (84, 'EC-12S', 218);
INSERT INTO `model` VALUES (85, 'ECG - 2350', 97);
INSERT INTO `model` VALUES (86, 'Custo Cardio 100BT', 215);
INSERT INTO `model` VALUES (87, 'EI.HM', 39);
INSERT INTO `model` VALUES (88, 'TEC 301', 219);
INSERT INTO `model` VALUES (89, 'TEC 501', 219);
INSERT INTO `model` VALUES (90, 'Accuread 10', 220);
INSERT INTO `model` VALUES (91, 'Accuread 20', 220);
INSERT INTO `model` VALUES (92, 'Accuread 30', 220);
INSERT INTO `model` VALUES (93, 'POLY 100', 221);
INSERT INTO `model` VALUES (94, 'POLY 101', 221);
INSERT INTO `model` VALUES (95, 'POLY 102 A', 221);
INSERT INTO `model` VALUES (96, 'EI.HM12Ch', 39);
INSERT INTO `model` VALUES (97, 'POLY 102 B', 221);
INSERT INTO `model` VALUES (98, 'Shine - 30E', 222);
INSERT INTO `model` VALUES (99, 'NC 2206-ECG', 223);
INSERT INTO `model` VALUES (100, 'NC 2212-ECG', 223);
INSERT INTO `model` VALUES (101, 'NC 2203-ECG', 223);
INSERT INTO `model` VALUES (102, 'Wijdan 02-02-02', 224);
INSERT INTO `model` VALUES (103, 'Wijdan 02-02-01', 224);
INSERT INTO `model` VALUES (104, 'Wijdan 02-02-03', 224);
INSERT INTO `model` VALUES (105, 'EC-12R/S', 218);
INSERT INTO `model` VALUES (106, 'HEM-7530T', 52);
INSERT INTO `model` VALUES (107, 'BM 96', 225);
INSERT INTO `model` VALUES (108, 'TLC6000', 226);
INSERT INTO `model` VALUES (109, 'CONTEC8000S', 226);
INSERT INTO `model` VALUES (110, 'ZOI-ECG-EN-003', 227);
INSERT INTO `model` VALUES (111, 'ZOI-ECG-EN-006', 227);
INSERT INTO `model` VALUES (112, 'EM-1200', 227);
INSERT INTO `model` VALUES (113, 'EST-12 CH', 203);
INSERT INTO `model` VALUES (114, 'BTF 1203 B', 207);
INSERT INTO `model` VALUES (115, 'DTN-510K', 229);
INSERT INTO `model` VALUES (116, '5010 V5+', 178);
INSERT INTO `model` VALUES (117, 'Chem 5V3', 166);
INSERT INTO `model` VALUES (118, 'Chem 7', 166);
INSERT INTO `model` VALUES (119, 'FTM-100C', 230);
INSERT INTO `model` VALUES (120, 'RN-100C', 231);
INSERT INTO `model` VALUES (121, 'ZN-188C Plus', 232);
INSERT INTO `model` VALUES (122, 'HT B101', 233);
INSERT INTO `model` VALUES (123, 'PTM-100C', 234);
INSERT INTO `model` VALUES (124, 'GI - 70', 235);
INSERT INTO `model` VALUES (125, 'HT B60', 234);
INSERT INTO `model` VALUES (126, 'VF100', 236);
INSERT INTO `model` VALUES (127, 'GINA 100 C', 237);
INSERT INTO `model` VALUES (128, 'SAFIR 100', 238);
INSERT INTO `model` VALUES (129, 'EI.CA.3', 39);
INSERT INTO `model` VALUES (130, 'BSM-100C', 209);
INSERT INTO `model` VALUES (131, 'UP210', 54);
INSERT INTO `model` VALUES (132, 'YBDX-23B', 126);
INSERT INTO `model` VALUES (133, 'MS-30', 239);
INSERT INTO `model` VALUES (134, 'E341', 19);
INSERT INTO `model` VALUES (135, 'C341', 19);
INSERT INTO `model` VALUES (136, '020-100', 240);
INSERT INTO `model` VALUES (137, 'Bravos', 241);
INSERT INTO `model` VALUES (138, 'FLexitron', 242);
INSERT INTO `model` VALUES (139, 'Xoft', 242);
INSERT INTO `model` VALUES (140, 'Unity', 242);
INSERT INTO `model` VALUES (141, 'Evo', 242);
INSERT INTO `model` VALUES (142, 'Versa HD', 242);
INSERT INTO `model` VALUES (143, 'Harmony', 242);
INSERT INTO `model` VALUES (144, 'Infinity', 242);
INSERT INTO `model` VALUES (145, 'Edge', 241);
INSERT INTO `model` VALUES (146, 'TrueBeam', 241);
INSERT INTO `model` VALUES (147, 'VitalBeam', 241);
INSERT INTO `model` VALUES (148, 'BSM-6701', 97);
INSERT INTO `model` VALUES (149, 'LS601', 128);
INSERT INTO `model` VALUES (150, 'Synchromed II', 110);
INSERT INTO `model` VALUES (151, 'Coopdech Syringjector 60', 243);
INSERT INTO `model` VALUES (152, 'SZB-CX', 244);
INSERT INTO `model` VALUES (153, 'SZB-CZ', 244);
INSERT INTO `model` VALUES (154, 'A718V', 245);
INSERT INTO `model` VALUES (155, '8712212', 21);
INSERT INTO `model` VALUES (156, 'BeneFusion VP3', 49);
INSERT INTO `model` VALUES (157, 'BeneFusion VP1', 49);
INSERT INTO `model` VALUES (158, 'SK-600 I', 49);
INSERT INTO `model` VALUES (159, 'SK-600 II', 49);
INSERT INTO `model` VALUES (160, 'OIP-900', 246);
INSERT INTO `model` VALUES (161, 'TE-LM835', 55);
INSERT INTO `model` VALUES (162, 'TE-LM730', 55);
INSERT INTO `model` VALUES (163, 'TE-LM830', 55);
INSERT INTO `model` VALUES (164, 'Ip 60', 247);
INSERT INTO `model` VALUES (165, 'TE-LM800', 55);
INSERT INTO `model` VALUES (166, 'SN-1500H', 248);
INSERT INTO `model` VALUES (167, 'OT-701', 174);
INSERT INTO `model` VALUES (168, 'HealFusion i7', 249);
INSERT INTO `model` VALUES (169, 'A 717V', 245);
INSERT INTO `model` VALUES (170, 'TE-135', 55);
INSERT INTO `model` VALUES (171, 'SN-1600V', 248);
INSERT INTO `model` VALUES (172, 'IP 7700', 250);
INSERT INTO `model` VALUES (173, 'CBI+PCA Type', 251);
INSERT INTO `model` VALUES (174, 'Hawk-I1', 252);
INSERT INTO `model` VALUES (175, 'SPRD-i7', 249);
INSERT INTO `model` VALUES (176, '999-603BDEN', 96);
INSERT INTO `model` VALUES (177, 'ME660A', 34);
INSERT INTO `model` VALUES (178, 'XT-Fusion 10', 253);
INSERT INTO `model` VALUES (179, 'BeneFusion nVP', 49);
INSERT INTO `model` VALUES (180, 'SY-1200L', 254);
INSERT INTO `model` VALUES (181, 'KL-8052N', 255);
INSERT INTO `model` VALUES (182, 'SP750', 256);
INSERT INTO `model` VALUES (183, 'TE-18', 55);
INSERT INTO `model` VALUES (184, 'SN-S1', 248);
INSERT INTO `model` VALUES (185, 'HF-710A', 257);
INSERT INTO `model` VALUES (186, 'IN-1', 65);
INSERT INTO `model` VALUES (187, 'IN-2', 65);
INSERT INTO `model` VALUES (188, 'INP 100', 258);
INSERT INTO `model` VALUES (189, 'SW-IP02', 259);
INSERT INTO `model` VALUES (190, 'Fusionpro IP-01', 260);
INSERT INTO `model` VALUES (191, 'CIP27 Plus', 189);
INSERT INTO `model` VALUES (192, 'HP-60', 261);
INSERT INTO `model` VALUES (193, '5520', 262);
INSERT INTO `model` VALUES (194, 'SN-50C6T', 248);
INSERT INTO `model` VALUES (195, 'HealFusion S7', 249);
INSERT INTO `model` VALUES (196, 'TE-SS800', 55);
INSERT INTO `model` VALUES (197, 'BeneFusion SP1 Ex', 49);
INSERT INTO `model` VALUES (198, 'SK-500 I', 49);
INSERT INTO `model` VALUES (199, 'SK-500 II', 49);
INSERT INTO `model` VALUES (200, 'A616S TCI', 245);
INSERT INTO `model` VALUES (201, 'SK-500 III', 49);
INSERT INTO `model` VALUES (202, 'OSP 500', 246);
INSERT INTO `model` VALUES (203, 'HS-60E', 64);
INSERT INTO `model` VALUES (204, 'GEA LS 35LJ', 64);
INSERT INTO `model` VALUES (205, 'YP 910', 64);
INSERT INTO `model` VALUES (206, 'RVS-100', 103);
INSERT INTO `model` VALUES (207, 'Ri-fox N', 103);
INSERT INTO `model` VALUES (208, 'HEM-8712', 52);
INSERT INTO `model` VALUES (209, 'HEM-7320', 52);
INSERT INTO `model` VALUES (210, 'AC 500', 263);
INSERT INTO `model` VALUES (211, 'TJ-2688', 126);
INSERT INTO `model` VALUES (212, 'Multimobil 2.5', 63);
INSERT INTO `model` VALUES (213, 'Somatom Emotion 16', 63);
INSERT INTO `model` VALUES (214, 'Mammomat 1000', 63);
INSERT INTO `model` VALUES (215, 'Chello S3000', 247);
INSERT INTO `model` VALUES (216, 'ECG100L', 30);

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
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (74, 'Telegram', 'Itok toni laksono', '843133427', 'Tiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nKeterangan : Sudah waktunya Kalibrasi\nTanggal Kalibrasi 23/08/2025\n\nLink : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:35:34', 3, '2025-07-23 11:36:03', '3', '2025-07-23', 'Selesai', '{\"message_id\":136,\"from\":{\"id\":8123614272,\"is_bot\":true,\"first_name\":\"Notifikasi Asset Management\",\"username\":\"AssetNotificationBot\"},\"chat\":{\"id\":843133427,\"first_name\":\"Itok Toni\",\"last_name\":\"Laksono\",\"username\":\"itoktoni\",\"type\":\"private\"},\"date\":1753245297,\"text\":\"Tiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\\nRuangan : DEMO\\nKeterangan : Sudah waktunya Kalibrasi\\nTanggal Kalibrasi 23\\/08\\/2025\\n\\nLink : https:\\/\\/ppm.mang-li.com\\/admin\\/tiket\\/default\\/tiket_app\\/code\\/4db7e89e-9bde-4c71-af04-3bff72a3925e\",\"entities\":[{\"offset\":182,\"length\":95,\"type\":\"url\"}],\"link_preview_options\":{\"url\":\"https:\\/\\/ppm.mang-li.com\\/admin\\/tiket\\/default\\/tiket_app\\/code\\/4db7e89e-9bde-4c71-af04-3bff72a3925e\"}}', NULL);
INSERT INTO `notification` VALUES (75, 'Telegram', 'Ady Sunanto', '79417929', 'Tiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nKeterangan : Sudah waktunya Kalibrasi\nTanggal Kalibrasi 23/08/2025\n\nLink : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:35:34', 502, '2025-07-23 11:36:08', '502', '2025-07-23', 'Selesai', '{\"message_id\":137,\"from\":{\"id\":8123614272,\"is_bot\":true,\"first_name\":\"Notifikasi Asset Management\",\"username\":\"AssetNotificationBot\"},\"chat\":{\"id\":79417929,\"first_name\":\"Ady\",\"last_name\":\"SUNANTO\",\"username\":\"ASunDevice\",\"type\":\"private\"},\"date\":1753245303,\"text\":\"Tiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\\nRuangan : DEMO\\nKeterangan : Sudah waktunya Kalibrasi\\nTanggal Kalibrasi 23\\/08\\/2025\\n\\nLink : https:\\/\\/ppm.mang-li.com\\/admin\\/tiket\\/default\\/tiket_app\\/code\\/4db7e89e-9bde-4c71-af04-3bff72a3925e\",\"entities\":[{\"offset\":182,\"length\":95,\"type\":\"url\"}]}', NULL);
INSERT INTO `notification` VALUES (76, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:46:07', 3, '2025-07-23 11:46:07', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (77, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:46:07', 3, '2025-07-23 11:46:07', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (78, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:46:08', 3, '2025-07-23 11:46:08', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (79, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:46:08', 3, '2025-07-23 11:46:08', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (80, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:50', 3, '2025-07-23 11:47:50', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (81, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:50', 3, '2025-07-23 11:47:50', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (82, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:50', 3, '2025-07-23 11:47:50', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (83, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:50', 3, '2025-07-23 11:47:50', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (84, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:53', 3, '2025-07-23 11:47:53', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (85, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:53', 3, '2025-07-23 11:47:53', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (86, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:58', 3, '2025-07-23 11:47:58', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (87, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:58', 3, '2025-07-23 11:47:58', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (88, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:59', 3, '2025-07-23 11:47:59', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (89, NULL, 'Itok toni laksono', '08111040159', 'PEKERJAAN SELESAI\n\nTeknisi : Itok toni laksono\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\nRuangan : DEMO\nSelesai : https://ppm.mang-li.com/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 11:47:59', 3, '2025-07-23 11:47:59', '3', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (90, NULL, 'kalibrasi', '08111040159', 'PEKERJAAN SELESAI\r\n\r\nTeknisi : kalibrasi\r\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\r\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\r\nRuangan : DEMO\r\nSelesai : http://asset.test/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 13:13:17', 510, '2025-07-23 13:13:17', '510', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (91, NULL, 'kalibrasi', '08111040159', 'PEKERJAAN SELESAI\r\n\r\nTeknisi : kalibrasi\r\nTiket : 4db7e89e-9bde-4c71-af04-3bff72a3925e\r\nAsset : Demo Hitungan ~  ( DEMO ) DEMO | 23444\r\nRuangan : DEMO\r\nSelesai : http://asset.test/admin/tiket/default/tiket_app/code/4db7e89e-9bde-4c71-af04-3bff72a3925e', '2025-07-23 13:21:35', 510, '2025-07-23 13:21:35', '510', NULL, NULL, NULL, NULL);
INSERT INTO `notification` VALUES (92, 'Telegram', 'Itok toni laksono', '843133427', 'Tiket : 15c22999-c48e-48a3-aa11-b7c6382eac16\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80A | 23030688\nRuangan : Bangsal Anak\nKeterangan : Test Tiket\n\nLink : https://ppm.mang-li.com/admin/pengguna/default/tiket_user/code/15c22999-c48e-48a3-aa11-b7c6382eac16', '2025-07-24 23:43:45', 3, '2025-07-24 23:43:45', '3', '2025-07-24', NULL, NULL, 'https://ppm.mang-li.com/storage/app/public/files/tiket/1753375425.jpg');
INSERT INTO `notification` VALUES (93, 'Telegram', 'Ady Sunanto', '79417929', 'Tiket : 15c22999-c48e-48a3-aa11-b7c6382eac16\nAsset : Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80A | 23030688\nRuangan : Bangsal Anak\nKeterangan : Test Tiket\n\nLink : https://ppm.mang-li.com/admin/pengguna/default/tiket_user/code/15c22999-c48e-48a3-aa11-b7c6382eac16', '2025-07-24 23:43:45', 502, '2025-07-24 23:43:45', '502', '2025-07-24', NULL, NULL, 'https://ppm.mang-li.com/storage/app/public/files/tiket/1753375425.jpg');
INSERT INTO `notification` VALUES (94, 'Telegram', 'Itok toni laksono', '843133427', 'Tiket : d764362f-b7db-40c7-a33b-7fec5431edbb\r\nAsset : Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453209\r\nLokasi : R. Bersalin\r\nKeterangan : keluhan\r\n\r\nLink : http://asset.test/admin/aplikasi/default/tiket/code/d764362f-b7db-40c7-a33b-7fec5431edbb', '2025-07-26 07:59:22', 3, '2025-07-26 07:59:22', '3', '2025-07-26', NULL, NULL, NULL);
INSERT INTO `notification` VALUES (95, 'Telegram', 'Itok toni laksono', '843133427', 'Tiket : 5dbfa67d-8f42-4bee-8f53-3d799d894262\nAsset : Pesawat Sinar-X, Mammografi ~  ( Siemens ) Mammomat 1000 | SIEM87921\nRuangan : R. Mamography\nKeterangan : test keluhan\n\nLink : https://ppm.mang-li.com/admin/aplikasi/default/tiket/code/5dbfa67d-8f42-4bee-8f53-3d799d894262', '2025-07-26 08:31:35', 3, '2025-07-26 08:31:35', '3', '2025-07-26', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1204 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `penamaan` VALUES (893, 'Bedside Monitor/Bed-Patient Monitor/Patient Monitor/Vitalsign Monitor', '1740056722.jpg', '10901002', NULL, 1, NULL, NULL, 7, 3, 4, 'Yes');
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
INSERT INTO `penamaan` VALUES (910, 'Brachiterapy', '1753233623.png', '21502015', 'UNIT', 4, 'TINGGI', NULL, 10, 5, 5, 'Yes');
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
INSERT INTO `penamaan` VALUES (1147, 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer', '1753231290.png', '10901017', 'PCS', 1, 'SEDERHANA', NULL, 7, 3, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1148, 'Tensimeter Automatic Digital/Blood Pressure Meter Digital', '1753231713.png', '10901018', 'PCS', 1, 'SEDERHANA', NULL, 7, 3, 3, 'Yes');
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
INSERT INTO `penamaan` VALUES (1172, 'Ultrasonography (USG) 3D', '1740586379.png', '21102019', 'UNIT', 1, 'TINGGI', NULL, 6, 3, 3, 'Yes');
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
INSERT INTO `penamaan` VALUES (1195, 'Magnetic Resonance Imaging (MRI) 7 Tesla', '1740065934.jpg', '21501001-7', 'UNIT', 4, 'TINGGI', NULL, 7, 3, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1199, 'Demo Hitungan', '1753405681.png', '00000000', NULL, 18, 'MENENGAH', NULL, 9, 4, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1200, 'Demo P1', NULL, NULL, 'UNIT', 18, 'MENENGAH', NULL, 10, 5, 1, 'Yes');
INSERT INTO `penamaan` VALUES (1201, 'Demo P2', NULL, NULL, 'UNIT', 18, 'MENENGAH', NULL, 10, 2, 4, 'Yes');
INSERT INTO `penamaan` VALUES (1202, 'Demo I2', NULL, NULL, 'UNIT', NULL, 'TINGGI', NULL, 10, 5, 3, 'Yes');
INSERT INTO `penamaan` VALUES (1203, 'Demo I3', NULL, NULL, 'UNIT', NULL, 'TINGGI', NULL, 10, 5, 5, 'Yes');

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
INSERT INTO `responsible_category` VALUES (1, 2);
INSERT INTO `responsible_category` VALUES (17, 2);
INSERT INTO `responsible_category` VALUES (21, 2);
INSERT INTO `responsible_category` VALUES (1, 3);
INSERT INTO `responsible_category` VALUES (17, 3);

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
INSERT INTO `responsible_group` VALUES (7, 1);
INSERT INTO `responsible_group` VALUES (7, 3);
INSERT INTO `responsible_group` VALUES (7, 502);
INSERT INTO `responsible_group` VALUES (8, 1);
INSERT INTO `responsible_group` VALUES (8, 3);
INSERT INTO `responsible_group` VALUES (8, 502);
INSERT INTO `responsible_group` VALUES (9, 1);
INSERT INTO `responsible_group` VALUES (9, 3);
INSERT INTO `responsible_group` VALUES (9, 502);
INSERT INTO `responsible_group` VALUES (10, 1);
INSERT INTO `responsible_group` VALUES (10, 3);
INSERT INTO `responsible_group` VALUES (10, 502);

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
INSERT INTO `system_group` VALUES ('aplikasi', 'Aplikasi', 2, 1, NULL, 'window-sidebar', NULL);
INSERT INTO `system_group` VALUES ('apps', 'Apps', NULL, 1, NULL, 'rocket-takeoff', NULL);
INSERT INTO `system_group` VALUES ('ebook', 'Ebook', NULL, 1, 'https://ppm.mang-li.com/storage/app/public/ebook.pdf', 'book', NULL);
INSERT INTO `system_group` VALUES ('kalibrasi', 'Kalibrasi', NULL, 1, NULL, 'rocket-takeoff', NULL);
INSERT INTO `system_group` VALUES ('master', 'Master', 7, 1, NULL, 'database', NULL);
INSERT INTO `system_group` VALUES ('pengguna', 'Pengguna', NULL, 1, NULL, 'rocket-takeoff', NULL);
INSERT INTO `system_group` VALUES ('printer_bluetooth', 'Printer Bluetooth', NULL, 1, 'https://ppm.mang-li.com/storage/app/public/rawbt.apk', 'bluetooth', NULL);
INSERT INTO `system_group` VALUES ('report', 'Report', 1, 1, NULL, 'printer', NULL);
INSERT INTO `system_group` VALUES ('report_enginer', 'Report Enginer', NULL, 1, NULL, 'printer-fill', NULL);
INSERT INTO `system_group` VALUES ('setting', 'System', -1, 1, NULL, 'wrench-adjustable-circle', NULL);

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
INSERT INTO `system_group_connection_menu` VALUES ('aplikasi', 'job_admin');
INSERT INTO `system_group_connection_menu` VALUES ('aplikasi', 'notification');
INSERT INTO `system_group_connection_menu` VALUES ('aplikasi', 'tiket');
INSERT INTO `system_group_connection_menu` VALUES ('apps', 'asset_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('apps', 'job');
INSERT INTO `system_group_connection_menu` VALUES ('apps', 'tiket_teknisi');
INSERT INTO `system_group_connection_menu` VALUES ('kalibrasi', 'job_kalibrasi');
INSERT INTO `system_group_connection_menu` VALUES ('kalibrasi', 'report_kalibrasi_user');
INSERT INTO `system_group_connection_menu` VALUES ('kalibrasi', 'tiket_kalibrasi');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'asset');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'brand');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'category');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'gedung');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'level1');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'level2');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'level3');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'model');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'pemeliharaan');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'penamaan');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'ruangan');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'saran');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'satuan');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'status');
INSERT INTO `system_group_connection_menu` VALUES ('master', 'vendor');
INSERT INTO `system_group_connection_menu` VALUES ('pengguna', 'asset_user');
INSERT INTO `system_group_connection_menu` VALUES ('pengguna', 'report_tiket_user');
INSERT INTO `system_group_connection_menu` VALUES ('pengguna', 'tiket_user');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_asset_admin');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_jadwal_admin');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_job_admin');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_kalibrasi_admin');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_tiket_admin');
INSERT INTO `system_group_connection_menu` VALUES ('report', 'report_user');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_asset');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_jadwal');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_job');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_kalibrasi');
INSERT INTO `system_group_connection_menu` VALUES ('report_enginer', 'report_tiket');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'groups');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'link');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'menu');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'permission');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'roles');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'setting');
INSERT INTO `system_group_connection_menu` VALUES ('setting', 'user');

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
INSERT INTO `system_group_connection_role` VALUES ('admin', 'aplikasi');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'ebook');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'master');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'printer_bluetooth');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'report');
INSERT INTO `system_group_connection_role` VALUES ('admin', 'setting');
INSERT INTO `system_group_connection_role` VALUES ('kalibrasi', 'ebook');
INSERT INTO `system_group_connection_role` VALUES ('kalibrasi', 'kalibrasi');
INSERT INTO `system_group_connection_role` VALUES ('kalibrasi', 'printer_bluetooth');
INSERT INTO `system_group_connection_role` VALUES ('management', 'report');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'apps');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'ebook');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'printer_bluetooth');
INSERT INTO `system_group_connection_role` VALUES ('teknisi', 'report_enginer');
INSERT INTO `system_group_connection_role` VALUES ('user', 'ebook');
INSERT INTO `system_group_connection_role` VALUES ('user', 'pengguna');
INSERT INTO `system_group_connection_role` VALUES ('user', 'printer_bluetooth');

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
INSERT INTO `system_menu` VALUES ('groups', 'Group', 'groups', 'App\\Http\\Controllers\\Core\\GroupsController', 'groups.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('menu', 'Menu', 'menu', 'App\\Http\\Controllers\\Core\\MenuController', 'menu.getTable', 1, 8, '', NULL, 1);
INSERT INTO `system_menu` VALUES ('link', 'Link', 'link', 'App\\Http\\Controllers\\Core\\LinkController', 'link.getTable', 1, 7, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('permission', 'Permission', 'permission', 'App\\Http\\Controllers\\Core\\PermissionController', 'permission.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_user', 'Report User', 'report_user', 'App\\Http\\Controllers\\ReportUserController', 'report_user.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('brand', 'Merek', 'brand', 'App\\Http\\Controllers\\BrandController', 'brand.getTable', 1, 19, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('category', 'Katagori', 'category', 'App\\Http\\Controllers\\CategoryController', 'category.getTable', 1, 14, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('ruangan', 'Ruangan', 'ruangan', 'App\\Http\\Controllers\\LokasiController', 'ruangan.getTable', 1, 15, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('satuan', 'Satuan', 'satuan', 'App\\Http\\Controllers\\SatuanController', 'satuan.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('penamaan', 'Nomenklatur', 'penamaan', 'App\\Http\\Controllers\\PenamaanController', 'penamaan.getTable', 1, 20, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('asset_user', 'Asset User', 'asset_user', 'App\\Http\\Controllers\\AssetController', 'asset_user.getTable', 1, 20, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket', 'Tiket', 'tiket', 'App\\Http\\Controllers\\TiketController', 'tiket.getTable', 1, 1, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('job', 'Pekerjaan', 'job', 'App\\Http\\Controllers\\JobController', 'job.getTable', 1, 1, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('pemeliharaan', 'Pemeliharaan', 'pemeliharaan', 'App\\Http\\Controllers\\GroupController', 'pemeliharaan.getTable', 1, 3, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('model', 'Model', 'model', 'App\\Http\\Controllers\\ModelController', 'model.getTable', 1, 18, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('saran', 'Saran', 'saran', 'App\\Http\\Controllers\\SaranController', 'saran.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('gedung', 'Gedung', 'gedung', 'App\\Http\\Controllers\\AreaController', 'gedung.getTable', 1, 16, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('notification', 'Notification', 'notification', 'App\\Http\\Controllers\\NotificationController', 'notification.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_job', 'Report Pekerjaan', 'report_pekerjaan', 'App\\Http\\Controllers\\ReportJobController', 'report_job.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_tiket', 'Report Tiket', 'report_tiket', 'App\\Http\\Controllers\\ReportTiketController', 'report_tiket.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('level1', 'Level 1', 'level1', 'App\\Http\\Controllers\\Level1Controller', 'level1.getTable', 1, 9, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('level2', 'Level 2', 'level2', 'App\\Http\\Controllers\\Level2Controller', 'level2.getTable', 1, 8, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('level3', 'Level 3', 'level3', 'App\\Http\\Controllers\\Level3Controller', 'level3.getTable', 1, 7, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_jadwal', 'Report Jadwal', 'report_jadwal', 'App\\Http\\Controllers\\ReportJadwalController', 'report_jadwal.getCreate', 1, 4, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('vendor', 'Vendor', 'vendor', 'App\\Http\\Controllers\\VendorController', 'vendor.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_asset', 'Report Asset', 'report_asset', 'App\\Http\\Controllers\\ReportAssetController', 'report_asset.getCreate', 1, 5, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_kalibrasi', 'Report Kalibrasi', 'report_kalibrasi', 'App\\Http\\Controllers\\ReportKalibrasiController', 'report_kalibrasi.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket_teknisi', 'List Tiket', 'tiket_teknisi', 'App\\Http\\Controllers\\TiketController', 'tiket_teknisi.getTable', 1, 2, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('status', 'Status', 'status', 'App\\Http\\Controllers\\StatusController', 'status.getTable', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket_user', 'Tiket User', 'tiket_user', 'App\\Http\\Controllers\\TiketController', 'tiket_user.getTable', 1, 1, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('asset', 'Asset', 'asset', 'App\\Http\\Controllers\\AssetController', 'asset.getTable', 1, 20, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_tiket_user', 'Report Tiket User', 'report_tiket_user', 'App\\Http\\Controllers\\ReportTiketController', 'report_tiket_user.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('asset_teknisi', 'List Asset', 'asset_teknisi', 'App\\Http\\Controllers\\AssetController', 'asset_teknisi.getTable', 1, 3, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('tiket_kalibrasi', 'Tiket Kalibrasi', 'tiket_kalibrasi', 'App\\Http\\Controllers\\TiketController', 'tiket_kalibrasi.getTable', 1, 2, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('job_admin', 'Data Pekerjaan', 'job_admin', 'App\\Http\\Controllers\\JobController', 'job_admin.getTable', 1, 1, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_kalibrasi_user', 'Report Kalibrasi Teknisi', 'report_kalibrasi_user', 'App\\Http\\Controllers\\ReportKalibrasiController', 'report_kalibrasi_user.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('job_kalibrasi', 'Kalibrasi', 'job_kalibrasi', 'App\\Http\\Controllers\\JobController', 'job_kalibrasi.getTable', 1, 1, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_jadwal_admin', 'Report Data Jadwal', 'report_jadwal_admin', 'App\\Http\\Controllers\\ReportJadwalController', 'report_jadwal_admin.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_asset_admin', 'Report Data Asset', 'report_asset_admin', 'App\\Http\\Controllers\\ReportAssetController', 'report_asset_admin.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_kalibrasi_admin', 'Report Data Kalibrasi', 'report_kalibrasi_admin', 'App\\Http\\Controllers\\ReportKalibrasiController', 'report_kalibrasi_admin.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_job_admin', 'Report Data Pekerjaan', 'report_job_admin', 'App\\Http\\Controllers\\ReportJobController', 'report_job_admin.getCreate', 1, NULL, NULL, NULL, 1);
INSERT INTO `system_menu` VALUES ('report_tiket_admin', 'Report Data Tiket', 'report_tiket_admin', 'App\\Http\\Controllers\\ReportTiketController', 'report_tiket_admin.getCreate', 1, NULL, NULL, NULL, 1);

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
INSERT INTO `system_role` VALUES ('kalibrasi', 'Kalibrasi', 'Kalibrasi', 11);
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
INSERT INTO `telegraph_bots` VALUES (1, '8123614272:AAFVjWZ8FMalTu_hNRQkajIIBvKV9sQKNuY', 'Notification Assets', '2025-02-17 18:42:28', '2025-02-17 18:42:31');

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
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tiket` VALUES (76, '524902bc-dd84-4e1d-ae16-9c825aa0f064', 'Korektif', 'Air Warming Blanket | r32r23r2', 'Blanket tidak panas', NULL, '2025-07-23', 'System', 11, 57, '2025-07-23 10:52:26', '2025-07-26 08:30:56', NULL, 1, 3, NULL, 3);
INSERT INTO `tiket` VALUES (77, '44a74088-2c0f-4e4a-8c80-2521c0f461c9', 'Korektif', 'Demo Hitungan ~  ( DEMO ) DEMO | 23444', 'test-korektif', NULL, '2025-07-23', 'System', 105, 59, '2025-07-23 10:58:01', '2025-07-24 08:56:15', NULL, 1, 1, NULL, 1);
INSERT INTO `tiket` VALUES (79, '4db7e89e-9bde-4c71-af04-3bff72a3925e', 'Kalibrasi', 'Demo Hitungan ~  ( DEMO ) DEMO | 23444', 'Sudah waktunya Kalibrasi (test)\r\nTanggal Kalibrasi 23/08/2025', NULL, '2025-07-23', 'System', 105, 59, '2025-07-23 11:35:34', '2025-07-24 08:56:46', NULL, 1, 1, NULL, 1);
INSERT INTO `tiket` VALUES (80, '68ca32f7-422a-4263-a897-e97dfd286a36', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80A | 23030688', 'Lampu mati', NULL, '2025-07-23', 'System', 5, 60, '2025-07-23 14:49:02', '2025-07-25 00:29:55', NULL, 1, 3, NULL, 3);
INSERT INTO `tiket` VALUES (81, '15c22999-c48e-48a3-aa11-b7c6382eac16', 'Korektif', 'Sterilisator Suhu Rendah ~  ( Elitech ) ZTP80A | 23030688', 'Test Tiket', '1753375425.jpg', '2025-07-24', 'User', 5, 60, '2025-07-24 23:43:45', '2025-07-25 00:29:49', NULL, 505, 3, NULL, 3);
INSERT INTO `tiket` VALUES (82, 'd764362f-b7db-40c7-a33b-7fec5431edbb', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453209', 'keluhan', NULL, '2025-07-26', 'Itok toni laksono', 330, 79, '2025-07-26 07:59:21', '2025-07-26 07:59:35', NULL, 3, 3, NULL, 3);
INSERT INTO `tiket` VALUES (83, '5dbfa67d-8f42-4bee-8f53-3d799d894262', 'Korektif', 'Pesawat Sinar-X, Mammografi ~  ( Siemens ) Mammomat 1000 | SIEM87921', 'test keluhan', '1753493577.jpg', '2025-07-26', 'Itok toni laksono', 369, 77, '2025-07-26 08:31:35', '2025-07-26 08:32:57', NULL, 3, 3, NULL, NULL);
INSERT INTO `tiket` VALUES (84, '1c8206ed-dc61-4e07-80f9-7da794299082', 'Korektif', 'Tensimeter Manual/Anaeroid, Digital/Sphygmomanometer ~  ( Omron ) HEM-8712 | OMR12214', 'Monitor burem', '1753493967.jpg', '2025-07-26', 'PKM Trenggalek', 68, 70, '2025-07-26 08:39:28', '2025-07-26 08:39:28', NULL, 511, 511, NULL, NULL);
INSERT INTO `tiket` VALUES (85, 'c982c93b-6861-42b3-9d8a-c025a2ef5cc4', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453209', 'test', '1753514315.jpg', '2025-07-26', 'User', 330, 79, '2025-07-26 14:18:35', '2025-07-27 11:03:34', NULL, 505, 3, NULL, 3);
INSERT INTO `tiket` VALUES (86, '83e3f7f6-e7fa-4d6f-b4e6-9696c7017569', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453213', 'Monitor buram', '1753802955.jpg', '2025-07-29', 'Admin', 259, 80, '2025-07-29 22:29:17', '2025-07-29 22:29:17', NULL, 1, 1, NULL, NULL);
INSERT INTO `tiket` VALUES (87, '41e6a888-4c6f-4d9e-9fed-045e5fb40e75', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453213', 'Alat rusak', '1754837049.jpg', '2025-08-10', 'PKM Suruh', 259, 80, '2025-08-10 21:44:10', '2025-08-10 21:44:10', NULL, 521, 521, NULL, NULL);
INSERT INTO `tiket` VALUES (88, 'd18e9790-352d-4462-ac1b-361ce6aad26e', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453213', 'Alat rusak', '1754837057.jpg', '2025-08-10', 'PKM Suruh', 259, 80, '2025-08-10 21:44:18', '2025-08-10 21:44:18', NULL, 521, 521, NULL, NULL);
INSERT INTO `tiket` VALUES (89, '12c6fc03-a5ce-4eec-9a0e-454b32fc059f', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453213', 'Alat rusak', '1754837060.jpg', '2025-08-10', 'PKM Suruh', 259, 80, '2025-08-10 21:44:21', '2025-08-10 21:47:49', NULL, 521, 1, NULL, 1);
INSERT INTO `tiket` VALUES (90, '9ea2d511-7e63-43a2-ab23-fcdf1a2473f5', 'Korektif', 'Ultrasonography (USG) 3D ~  ( Ciptanas ) CUUDA5 | CPN23453213', 'Alat rusak', NULL, '2025-08-10', 'PKM Suruh', 259, 80, '2025-08-10 21:44:37', '2025-10-07 13:21:44', NULL, 521, 3, NULL, 3);

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
  `level3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `level2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 549 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin', '08111040159', 'admin@gmail.com', '2022-12-13 18:51:38', '$2y$10$ZUtVNCFONgdD2LZAo1KynuaACVCt/KX2bG4WWVQ9TUMbBXaNHz3Ji', 'admin', 100, 1, NULL, NULL, '2025-07-17 10:12:34', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'Itok toni laksono', 'itoktoni', '08111040159', 'itok.toni@gmail.com', '2024-10-13 16:43:38', '$2y$10$rxbaKdP5R3anQc3hJLRX4Otzwzgv/Cl0IQsZG0S4qku/gGKdn3vdC', 'admin', 100, 1, 'LRi91YjgVd', '2024-10-13 16:44:03', '2025-07-27 11:12:54', NULL, '843133427', NULL, NULL, 'LV2000000000002');
INSERT INTO `users` VALUES (502, 'Ady Sunanto', 'asun', '08561117174', 'asun.movenshare@gmail.com', NULL, '$2y$10$PepyUhQAnHfUz3iFwqNslu5vcu2UWM57ghNB/zeMUm2UFs3iQgZiG', 'admin', 30, 1, NULL, '2025-02-22 14:10:43', '2025-02-25 08:47:52', NULL, '79417929', NULL, NULL, NULL);
INSERT INTO `users` VALUES (504, 'Teknisi', 'teknisi', '083807879510', 'teknisi@gmail.com', NULL, '$2y$10$VSAvFe9pPFFZhudk.skThuStnnDpJX1laDQea8nfH6AtjVLNQFjwy', 'teknisi', 10, 1, NULL, '2025-02-22 16:23:44', '2025-07-28 05:48:09', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (505, 'User', 'user', NULL, 'user@gmail.com', NULL, '$2y$10$RiAZQPuCP5PnhKjgz5bLwOQ0Vsa1uGxvt6tZqvajujL9dX8ZJSbf2', 'user', 1, 1, NULL, '2025-02-22 16:29:52', '2025-07-26 07:35:54', NULL, NULL, NULL, 'LV3000000000022', NULL);
INSERT INTO `users` VALUES (506, 'Management', 'management', NULL, 'management@gmail.com', NULL, '$2y$10$tiMW.2dnm9iflaNBTKKpxue2Eef/dGiLC45LQ84Lvt7cO94FB8sEu', 'management', 40, 1, NULL, '2025-02-22 16:30:29', '2025-02-22 16:30:29', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (508, 'RMC', 'rmc', NULL, 'rmc@mang-li.com', NULL, '$2y$10$udq2wF3zU4Zim1s6t7ax5uRcKWMzbiy3jPEYdqftJPT0Zf2eyj6ka', 'management', 100, 1, NULL, '2025-07-22 00:52:13', '2025-07-27 03:06:19', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (509, 'DINKES', 'dinkes', NULL, 'dinkes@mang-li.com', NULL, '$2y$10$6nKWFWhERN4N41SoG30fNOuHfgdXgTj2xbnkRz3XtFpKPsE7fxmri', 'management', 30, 1, NULL, '2025-07-22 00:53:08', '2025-07-26 14:28:26', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (510, 'kalibrasi', 'kalibrasi', NULL, 'kalibrasi@gmail.com', NULL, '$2y$10$Kp0iT2Z.77ttzxAqb1Kp/.Z4F/fBSBsmZ9MEjCUH9MTiyCw5OWbT6', 'kalibrasi', 11, 1, NULL, '2025-07-23 11:50:33', '2025-07-25 00:21:28', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (511, 'PKM Trenggalek', 'pkmtrenggalek', NULL, 'pkmtrenggalek@gmail.com', NULL, '$2y$10$9ybVtFcUpF.PPWoOyd4f7uu9ksPTnbmCA7rJoWtmJzVPzzRPgnSyu', 'user', 10, 1, NULL, '2025-07-26 07:20:02', '2025-07-26 08:25:39', NULL, NULL, NULL, 'LV3000000000001', NULL);
INSERT INTO `users` VALUES (512, 'PKM Panggul', 'pkmpanggul', NULL, 'pkmpanggul@gmail.com', NULL, '$2y$10$Eim8GypZgObXdXOPQrNYDeSszTgaWdiM3mFvzwhUsvPMN/3zPEUVm', 'user', 1, 1, NULL, '2025-07-26 08:29:18', '2025-07-26 08:29:18', NULL, NULL, NULL, 'LV3000000000002', NULL);
INSERT INTO `users` VALUES (513, 'PKM Bodag', 'pkmbodag', NULL, 'pkmbodag@gmail.com', NULL, '$2y$10$zLJIvVDOV2l56JjYSffKN.sVlGxz7sSpmzayEjfAKvcDDMIuIlM9W', 'user', 1, 1, NULL, '2025-07-26 08:30:12', '2025-07-26 08:30:12', NULL, NULL, NULL, 'LV3000000000003', NULL);
INSERT INTO `users` VALUES (514, 'PKM Munjungan', 'pkmmunjungan', NULL, 'pkmmunjungan@gmail.com', NULL, '$2y$10$ryNfmKLeBL76Ob0mpkenV.oKudnMGXj64gEGVRDNPWtLL2qrs.VIi', 'user', 1, 1, NULL, '2025-07-26 08:31:09', '2025-07-26 08:31:09', NULL, NULL, NULL, 'LV3000000000005', NULL);
INSERT INTO `users` VALUES (515, 'PKM Watulimo', 'pkmwatulimo', NULL, 'pkmwatulimo@gmail.com', NULL, '$2y$10$S7NmU8YycYeZhyr.IRmeh.vCdl5jhPmHoSExKOsPmWMy.WHu.pVoi', 'user', 1, 1, NULL, '2025-07-26 14:25:06', '2025-07-26 14:25:06', NULL, NULL, NULL, 'LV3000000000006', NULL);
INSERT INTO `users` VALUES (516, 'PKM Slawe', 'pkmslawe', NULL, 'pkmslawe@gmail.com', NULL, '$2y$10$3bkrpg5uzQ136p9.uCxfuOImBdcukRrq/kzJ0GCpP2ajaWlQ4WvNC', 'user', 1, 1, NULL, '2025-07-26 14:25:49', '2025-07-26 14:25:49', NULL, NULL, NULL, 'LV3000000000007', NULL);
INSERT INTO `users` VALUES (517, 'PKM Kampak', 'pkmkampak', NULL, 'pkmkampak@gmail.com', NULL, '$2y$10$DK2rCSqe.zdrQo2AHiOvoe13LiaplyjlVN3FX49otBrkymL.XujzK', 'user', 1, 1, NULL, '2025-07-26 14:26:42', '2025-07-26 14:26:42', NULL, NULL, NULL, 'LV3000000000008', NULL);
INSERT INTO `users` VALUES (518, 'PKM Dongko', 'pkmdongko', NULL, 'pkmdongko@gmail.com', NULL, '$2y$10$qjNS/Rkyz.fCj7pIKI2CgumbaODN7JTrrMiT/eUuefkmzANsXDDRW', 'user', 1, 1, NULL, '2025-07-26 14:27:35', '2025-07-26 14:27:35', NULL, NULL, NULL, 'LV3000000000009', NULL);
INSERT INTO `users` VALUES (519, 'PKM Pule', 'pkmpule', NULL, 'pkmpule@gmail.com', NULL, '$2y$10$pfbq6GtueGtzuWfdMbA7keL60Ftx8TbG04jgXfJJ/47FYFP9vIM3u', 'user', 1, 1, NULL, '2025-07-27 02:45:23', '2025-07-27 02:45:23', NULL, NULL, NULL, 'LV3000000000012', NULL);
INSERT INTO `users` VALUES (520, 'PKM Karangan', 'pkmkarangan', NULL, 'pkmkarangan@gmail.com', NULL, '$2y$10$nNzsi3tR2jupW4xxJym41e1VUuFcni7/xJLYsD8RVPS6ewCLs2rIq', 'user', 1, 1, NULL, '2025-07-27 02:46:20', '2025-07-27 02:46:20', NULL, NULL, NULL, 'LV3000000000014', NULL);
INSERT INTO `users` VALUES (521, 'PKM Suruh', 'pkmsuruh', NULL, 'pkmsuruh@gmail.com', NULL, '$2y$10$WxwtWZWApuilkQT/skvW/eL/WdSgUlQ1ZbsVU8DTsquvBGydQR6PK', 'user', 1, 1, NULL, '2025-07-27 02:46:59', '2025-07-27 02:46:59', NULL, NULL, NULL, 'LV3000000000015', NULL);
INSERT INTO `users` VALUES (522, 'PKM Gandusari', 'pkmgandusari', NULL, 'pkmgandusari@gmail.com', NULL, '$2y$10$5VO9sdmMaDCs4UpG/aes5.omPmLunkOGAllcd1MV3Pmh9vP8sCn8m', 'user', 1, 1, NULL, '2025-07-27 02:47:48', '2025-07-27 02:47:48', NULL, NULL, NULL, 'LV3000000000017', NULL);
INSERT INTO `users` VALUES (523, 'PKM Karanganyar', 'pkmkaranganyar', NULL, 'pkmkaranganyar@gmail.com', NULL, '$2y$10$PQD0pVzWapJt0Y0Bfwii2OA3Gr8vq/V689tj68VgyexrfQChwfnd.', 'user', 1, 1, NULL, '2025-07-27 02:48:32', '2025-07-27 02:48:32', NULL, NULL, NULL, 'LV3000000000018', NULL);
INSERT INTO `users` VALUES (524, 'PKM Durenan', 'pkmdurenan', NULL, 'pkmdurenan@gmail.com', NULL, '$2y$10$zDfiaEyDxYME00WdzFZFL.X3dIBlOfem8R.6IDqCOD2Tnk.Mt/QRC', 'user', 1, 1, NULL, '2025-07-27 02:49:07', '2025-07-27 02:49:07', NULL, NULL, NULL, 'LV3000000000019', NULL);
INSERT INTO `users` VALUES (525, 'PKM Baruharjo', 'pkmbaruharjo', NULL, 'pkmbaruharjo@gmail.com', NULL, '$2y$10$oLjWC8.ZENA1nuAF4g5zOunMbZEb4aduHF4xfPVpQre8e1eAOMB/W', 'user', 1, 1, NULL, '2025-07-27 03:07:47', '2025-07-27 03:07:47', NULL, NULL, NULL, 'LV3000000000004', NULL);
INSERT INTO `users` VALUES (526, 'PKM Pogalan', 'pkmpogalan', NULL, 'pkmpogalan@gmail.com', NULL, '$2y$10$FHiM9j82.tHlyqYc3duwieHf6/tkeeu8OAX4sL9xsPKwWHt3TkXRS', 'user', 1, 1, NULL, '2025-07-27 03:08:41', '2025-07-27 03:08:41', NULL, NULL, NULL, 'LV3000000000020', NULL);
INSERT INTO `users` VALUES (527, 'PKM Ngulankulon', 'pkmngulankulon', NULL, 'pkmngulankulon@gmail.com', NULL, '$2y$10$Zi2a6qoqZDinFBaviNDfLOfVIhNsLSBoFOzVai21yxvMcYgTi95hG', 'user', 1, 1, NULL, '2025-07-27 03:09:19', '2025-07-27 03:09:19', NULL, NULL, NULL, 'LV3000000000013', NULL);
INSERT INTO `users` VALUES (528, 'PKM Rejowinangun', 'pkmrejowinangun', NULL, 'pkmrejowinangun@gmail.com', NULL, '$2y$10$NY0LytcMWd7bauHtPf1I5.e9OLg6hE7m/TNOFXWoxsKhoU6JlDoQK', 'user', 1, 1, NULL, '2025-07-27 03:10:05', '2025-07-27 03:10:05', NULL, NULL, NULL, 'LV3000000000010', NULL);
INSERT INTO `users` VALUES (529, 'PKM Tugu', 'pkmtugu', NULL, 'pkmtugu@gmail.com', NULL, '$2y$10$.iuxSkPVRrUZ2ctrSzz1QOB907ggBD3S.3XsMvnt8S4MVMUha4Uqi', 'user', 1, 1, NULL, '2025-07-27 03:10:43', '2025-07-27 03:10:43', NULL, NULL, NULL, 'LV3000000000016', NULL);
INSERT INTO `users` VALUES (530, 'PKM Pucanganak', 'pkmpucanganak', NULL, 'pkmpucanganak@gmail.com', NULL, '$2y$10$n4rYogsGQ4yGB8c1pqSIvOttoOCxw14Q8y4quGi9dZsSHCAaQ4..i', 'user', 1, 1, NULL, '2025-07-27 03:11:24', '2025-07-27 03:11:24', NULL, NULL, NULL, 'LV3000000000021', NULL);
INSERT INTO `users` VALUES (531, 'PKM Bendungan', 'pkmbendungan', NULL, 'pkmbendungan@gmail.com', NULL, NULL, 'user', 1, 1, NULL, '2025-07-27 03:12:13', '2025-07-27 03:12:13', NULL, NULL, NULL, 'LV3000000000022', NULL);
INSERT INTO `users` VALUES (532, 'Lab. Medis Dia Medika - Trenggalek', 'diamedika', NULL, 'diamedika@gmail.com', NULL, '$2y$10$LWx5uU8HLZKSASOpj.jjKe.ZwENMepfpNC9ZUYI3EXyUHHcryuKd.', 'user', 1, 1, NULL, '2025-07-27 03:13:27', '2025-07-27 03:15:40', NULL, NULL, NULL, 'LV3000000000194', NULL);
INSERT INTO `users` VALUES (533, 'Klinik Rutan Trenggalek', 'rutantrenggalek', NULL, 'rutantrenggalek@gmail.com', NULL, '$2y$10$fRQeXhUwX3cLyIbxzkoNV./hbn8kbXWOjwKf/4nLIsxsmFvIUmNMC', 'user', 1, 1, NULL, '2025-07-27 03:14:31', '2025-07-27 03:14:31', NULL, NULL, NULL, 'LV3000000000182', NULL);
INSERT INTO `users` VALUES (534, 'Klinik BBN Kab. Trenggalek', 'bnntrenggalek', NULL, 'bnntrenggalek@gmail.com', NULL, '$2y$10$GR9kYp0OfuLuZu4oaAvbH.BG55Res7twCJB6Ii1R7M43jVUMNUG.K', 'user', 1, 1, NULL, '2025-07-27 03:15:24', '2025-07-27 03:15:24', NULL, NULL, NULL, 'LV3000000000183', NULL);
INSERT INTO `users` VALUES (535, 'Klinik Kodim Trenggalek', 'klinikkodim', NULL, 'klinikkodim@gmail.com', NULL, '$2y$10$pt3XkYp02ZEo37A0pLQFKe9ZREx9H0wdwDtrE9wZr336Tqx6NcC4e', 'user', 1, 1, NULL, '2025-07-27 03:16:48', '2025-07-27 03:16:48', NULL, NULL, NULL, 'LV3000000000184', NULL);
INSERT INTO `users` VALUES (536, 'Klinik Polres Trenggalek', 'klinikpolres', NULL, 'klinikpolres@gmail.com', NULL, '$2y$10$/6xCeiuskQbzVFGE.XeFBuBY.WOBUPKwON21KYMGX2CDhiXbRRb16', 'user', 1, 1, NULL, '2025-07-27 03:17:37', '2025-07-27 03:17:37', NULL, NULL, NULL, 'LV3000000000185', NULL);
INSERT INTO `users` VALUES (537, 'Klinik An-Nisa Trenggalek', 'annisa', NULL, 'annisa@gmail.com', NULL, '$2y$10$.aZpLtkWTgq1irDphKyDaO.ZppvpNPHed.vPEjLJKYL0vIiR4eFTi', 'user', 1, 1, NULL, '2025-07-27 03:19:05', '2025-07-27 03:19:05', NULL, NULL, NULL, 'LV3000000000186', NULL);
INSERT INTO `users` VALUES (538, 'Klinik Wijaya Kusuma Medika Trenggalek', 'wijayakusuma', NULL, 'wijayakusuma@gmail.com', NULL, '$2y$10$gjZFQ1bkNS9ny52Aa6bKV.0LVxJULdjMeS7AQ1SHYQCUdSeYSvHwu', 'user', 1, 1, NULL, '2025-07-27 03:19:50', '2025-07-27 03:19:50', NULL, NULL, NULL, 'LV3000000000187', NULL);
INSERT INTO `users` VALUES (539, 'Klinik Romo Wijoyo  Trenggalek', 'romowijoyo', NULL, 'romowijoyo@gmail.com', NULL, '$2y$10$lkp.ycmrB8KByckX0z4kGujdMXIzQwbIyYqwhq4pzGsBu1YCd0zvy', 'user', 1, 1, NULL, '2025-07-27 03:20:57', '2025-07-27 03:23:28', NULL, NULL, NULL, 'LV3000000000195', NULL);
INSERT INTO `users` VALUES (540, 'Klinik ABA Husada  Trenggalek', 'abahusada', NULL, 'abahusada@gmail.com', NULL, '$2y$10$MfPIx6tTwY7aRKzs6eVcVuHBl0Vl2ImkxhQs9XTm1zw6eElWdPkxO', 'user', 1, 1, NULL, '2025-07-27 03:24:24', '2025-07-27 03:24:24', NULL, NULL, NULL, 'LV3000000000188', NULL);
INSERT INTO `users` VALUES (541, 'Klinik Tinspardi Medika Trenggalek', 'tinspardi', NULL, 'tinspardi@gmail.com', NULL, '$2y$10$QUVSUcbdF0SzkrlYdWsDweYq3P3cvXoHT83684Nyqi80VYeEdfXZa', 'user', 1, 1, NULL, '2025-07-27 03:25:39', '2025-07-27 03:31:08', NULL, NULL, NULL, 'LV3000000000196', NULL);
INSERT INTO `users` VALUES (542, 'Klinik Dewasaka Trenggalek', 'dewasaka', NULL, 'dewasaka@gmail.com', NULL, '$2y$10$PnrZMkS8Wat2FeqQ1gO8VOKqAvmtRqhA4aVvkzH9E2Fh9KVLEATHa', 'user', 1, 1, NULL, '2025-07-27 03:26:19', '2025-07-27 03:26:19', NULL, NULL, NULL, 'LV3000000000189', NULL);
INSERT INTO `users` VALUES (543, 'Klinik RejowinangunTrenggalek', 'rejowinangun', NULL, 'rejowinangun@gmail.com', NULL, '$2y$10$b1QRARy0ROcaJNcE6JRFYuu2XEA88f.6MZRVMMo8nlNNpkoDpFkhO', 'user', 1, 1, NULL, '2025-07-27 03:26:57', '2025-07-27 03:26:57', NULL, NULL, NULL, 'LV3000000000190', NULL);
INSERT INTO `users` VALUES (544, 'Klinik Nurmedika  Trenggalek', 'nurmedika', NULL, 'nurmedika@gmail.com', NULL, '$2y$10$oWlMCVNcqejOtmSsiqvr9.KQ8W.z444J17zWFqaA8lA7hHMeVe/wK', 'user', 1, 1, NULL, '2025-07-27 03:27:36', '2025-07-27 03:27:36', NULL, NULL, NULL, 'LV3000000000191', NULL);
INSERT INTO `users` VALUES (545, 'Klinik Afiah Trenggalek', 'afiah', NULL, 'afiah@gmail.com', NULL, '$2y$10$kP6V2v.Iz1yCBuZoTPRC4e5WF9073wguOOAFKfxKQxSwOZBBZXYxu', 'user', 1, 1, NULL, '2025-07-27 03:28:14', '2025-07-27 03:28:14', NULL, NULL, NULL, 'LV3000000000192', NULL);
INSERT INTO `users` VALUES (546, 'Klinik Prasetya Husada Watulimo  Trenggalek', 'prasetya', NULL, 'prasetya@gmail.com', NULL, '$2y$10$YfgYu//nCa/eNKrgfPFy/OS4JOTXEfJpxW5LBQg5p5CvPwGFSoHEq', 'user', 1, 1, NULL, '2025-07-27 03:28:55', '2025-07-27 03:28:55', NULL, NULL, NULL, 'LV3000000000193', NULL);
INSERT INTO `users` VALUES (547, 'Klinik UTD PMI Trenggalek', 'pmitrenggalek', NULL, 'pmitrenggalek@gmail.com', NULL, '$2y$10$AFmmDPVuFAotk1ntfwSRmOobl5mu3OTfgFdg2oD5ktfJPvAhMlRGa', 'user', 1, 1, NULL, '2025-07-27 03:31:53', '2025-07-27 03:31:53', NULL, NULL, NULL, 'LV3000000000181', NULL);
INSERT INTO `users` VALUES (548, 'teknisi RMC', 'rmc1', NULL, 'rmc1@gmail.com', NULL, '$2y$10$F/sBy9sxiW.JCaSsaMxm4u8Y5.l4k425UhqHYno4MVgsAf4IXs8Z6', NULL, NULL, 1, NULL, '2025-07-28 05:50:02', '2025-07-28 05:50:02', NULL, NULL, NULL, NULL, 'LV2000000000002');

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO `vendor` VALUES (2, 'PT. Elsyahfi Calibratech Mandiri', 'Ari Firmansyah, S.T.Tr., M.Si.', '081226421421', NULL, 'Perumahan Nuansa Mandiri Permai No. B4 Cubadak Air Jl. Perkutut RT. 02/04 Kel, Tigo Koto Di ate, Kec. Payakumbuh Utara, Kota Payakumbuh, Sumatera Barat 26216', NULL);
INSERT INTO `vendor` VALUES (5, 'PT. Mangli Software', 'Itok Toni Laksono', '08111040159', NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (6, 'PT. Adisaha Solusi Nusantara', 'Ady Sunanto', '08561117174', NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (8, 'PT. Fania Ersa Pratama', 'Asep Adipurna, S.Si.', '081586079276', NULL, 'Ruko Graha Depok Mas\r\nJl. Arif Rahman Hakim No. 3 Blok A6 Pancoran Mas\r\nKota Depok - Jawa Barat 16431', NULL);
INSERT INTO `vendor` VALUES (9, 'PT. Erha Kalibrasi Indonesia', 'Haidar Hijri Maghriby, S.T.Tr.', '085156528345', NULL, 'Pasar Tradisional Segar Depok, Ruko RA-1\r\nJl. Tole Iskandar No. 2 Pancoran Mas\r\nKota Depok - Jawa Barat 16431', NULL);
INSERT INTO `vendor` VALUES (10, 'PT. Aksa Jaya Mitrautama', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (11, 'PT. Iscen Labways Indohitek', 'Muhammat Solihan, S.Kom.', '081315149848', NULL, 'Jl. Irida Barat 19 Blok E1 No. 21 Bekasi Jaya Indah, Bekasi Timur\r\nKota Bekasi - Jawa Barat 17112', NULL);
INSERT INTO `vendor` VALUES (12, 'PT. Rajawali Nusindo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (13, 'PT. Sansico Natura Resources', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (14, 'PT. Bumi Indah Putera', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (15, 'PT. Attekno Solusi Nusantara', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (16, 'PT. Esa Medika Mandiri', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (17, 'PT. Aksa Jaya Mitrautama', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (18, 'PT. Aksa Jaya Sentosa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (19, 'PT. Darya Harja Sentosa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (20, 'PT. Bangak Manufaktur Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (21, 'PT. Bina Sarana Medika', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (22, 'PT. Satria Kencana Medika', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (23, 'PT. Pratita Prama Nugraha', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (24, 'PT. Luhur Wiratama', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (25, 'PT. Omron Healthcare Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (26, 'PT. Murti Indah Sentosa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (27, 'PT. Indomedik Niaga Perkasa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (28, 'PT. Labora Mandiri Indo Tama', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (29, 'PT. Cipta Nasional Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (30, 'PT. Drager Medical Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (31, 'PT. Sinko Prima Alloy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (32, 'PT. Siemens Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (33, 'PT. Serenity Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vendor` VALUES (34, 'PT. Indoprima Bionet', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- View structure for view_role
-- ----------------------------
DROP VIEW IF EXISTS `view_role`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_role` AS select `system_menu`.`system_menu_code` AS `system_menu_code`,`system_menu`.`system_menu_name` AS `system_menu_name`,`system_menu`.`system_menu_url` AS `system_menu_url`,`system_menu`.`system_menu_controller` AS `system_menu_controller`,`system_menu`.`system_menu_action` AS `system_menu_action`,`system_menu`.`system_menu_type` AS `system_menu_type`,`system_menu`.`system_menu_sort` AS `system_menu_sort`,`system_menu`.`system_menu_description` AS `system_menu_description`,`system_menu`.`system_menu_enable` AS `system_menu_enable`,`system_menu`.`system_menu_can_delete` AS `system_menu_can_delete`,`system_group_connection_role`.`system_role_code` AS `system_role_code` from (((`system_role` join `system_group_connection_role` on(`system_role`.`system_role_code` = `system_group_connection_role`.`system_role_code`)) join `system_group_connection_menu` on(`system_group_connection_menu`.`system_group_code` = `system_group_connection_role`.`system_group_code`)) join `system_menu` on(`system_menu`.`system_menu_code` = `system_group_connection_menu`.`system_menu_code`));

SET FOREIGN_KEY_CHECKS = 1;
