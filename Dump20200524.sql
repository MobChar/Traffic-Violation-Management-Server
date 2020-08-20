-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: cnpm_qlvpgt
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bbvphc`
--

DROP TABLE IF EXISTS `bbvphc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bbvphc` (
  `soBBVPHC` int NOT NULL AUTO_INCREMENT,
  `maCanBo` int NOT NULL,
  `ngayLap` date NOT NULL,
  `soCMND` varchar(12) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `moTaHanhVi` varchar(300) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  PRIMARY KEY (`soBBVPHC`),
  KEY `fk_maCanBo_idx` (`maCanBo`),
  KEY `fk_soCMND_idx` (`soCMND`),
  CONSTRAINT `fk_BBVPHC_maCanBo` FOREIGN KEY (`maCanBo`) REFERENCES `canbo` (`maCanBo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_BBVPHC_soCMND` FOREIGN KEY (`soCMND`) REFERENCES `nguoivipham` (`soCMND`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbvphc`
--

LOCK TABLES `bbvphc` WRITE;
/*!40000 ALTER TABLE `bbvphc` DISABLE KEYS */;
INSERT INTO `bbvphc` VALUES (15,27,'2020-05-17','333333123','Tổ lái không có bằng lái xe, nẹt bô, bốc đầu'),(16,27,'2020-05-21','333333123','Đạp xe công an 2 lần'),(17,27,'2020-05-12','678678678','Vượt đèn đỏ'),(18,27,'2020-03-18','123123123','Vượt đèn đỏ'),(19,33,'2019-08-05','123123124','Chở quá số người quy định'),(20,27,'2020-05-22','123123124','Tổ lái'),(21,27,'2020-05-24','124567345235','Vượt đèn đỏ không chấp hành người thi hành công vụ');
/*!40000 ALTER TABLE `bbvphc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbvphc_qdxphc`
--

DROP TABLE IF EXISTS `bbvphc_qdxphc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bbvphc_qdxphc` (
  `soBBVPHC` int NOT NULL,
  `soQDXPHC` int NOT NULL,
  PRIMARY KEY (`soBBVPHC`,`soQDXPHC`),
  KEY `fk_BBVPHC-QDXPHC_soQDXPHC_idx` (`soQDXPHC`),
  CONSTRAINT `fk_BBVPHC-QDXPHC_soBBVPHC` FOREIGN KEY (`soBBVPHC`) REFERENCES `bbvphc` (`soBBVPHC`),
  CONSTRAINT `fk_BBVPHC-QDXPHC_soQDXPHC` FOREIGN KEY (`soQDXPHC`) REFERENCES `qdxphc` (`soQDXPHC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbvphc_qdxphc`
--

LOCK TABLES `bbvphc_qdxphc` WRITE;
/*!40000 ALTER TABLE `bbvphc_qdxphc` DISABLE KEYS */;
INSERT INTO `bbvphc_qdxphc` VALUES (15,47),(17,50),(19,54),(18,56),(16,59),(20,60);
/*!40000 ALTER TABLE `bbvphc_qdxphc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bienlainopphat`
--

DROP TABLE IF EXISTS `bienlainopphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bienlainopphat` (
  `maBienLai` int NOT NULL AUTO_INCREMENT,
  `soQDXPHC` int NOT NULL,
  `hoTen` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `ngayLapBienLai` date NOT NULL,
  `lyDoNopPhat` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `soTienNop` int NOT NULL,
  `maCanBo` int NOT NULL,
  PRIMARY KEY (`maBienLai`),
  KEY `fk_BienLaiNopPhat_1_idx` (`soQDXPHC`),
  KEY `fk_BLXPHC_maCanBo_idx` (`maCanBo`),
  CONSTRAINT `fk_BDXPHC_soQDXPHC` FOREIGN KEY (`soQDXPHC`) REFERENCES `qdxphc` (`soQDXPHC`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_BLXPHC_maCanBo` FOREIGN KEY (`maCanBo`) REFERENCES `canbo` (`maCanBo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bienlainopphat`
--

LOCK TABLES `bienlainopphat` WRITE;
/*!40000 ALTER TABLE `bienlainopphat` DISABLE KEYS */;
INSERT INTO `bienlainopphat` VALUES (5,47,'Bùi Bình Vip','2020-05-22','Đóng tiền ngu lần 2',5080000,35),(6,49,'Bùi Bình','2020-05-21','123',22000,27),(7,48,'Bùi Bình','2020-05-24','Đong tiền vi phạm',1080000,27),(8,56,'Nguyễn Văn A','2020-05-24','Đóng tiền vi phạm',600000,27),(9,54,'Nguyễn Văn A','2020-05-24','Đóng tiền vi phạm',100000,27);
/*!40000 ALTER TABLE `bienlainopphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canbo`
--

DROP TABLE IF EXISTS `canbo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canbo` (
  `maCanBo` int NOT NULL AUTO_INCREMENT,
  `soCMND` varchar(12) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `hoTen` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `maQueQuan` int NOT NULL,
  `chucVu` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `maDonVi` int NOT NULL,
  `ghiChu` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  PRIMARY KEY (`maCanBo`,`soCMND`),
  KEY `fk_maDonVi_idx` (`maDonVi`),
  KEY `fk_CanBo_queQuan_idx` (`maQueQuan`),
  CONSTRAINT `fk_CanBo_maDonVi` FOREIGN KEY (`maDonVi`) REFERENCES `donvi` (`maDonVi`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_CanBo_queQuan` FOREIGN KEY (`maQueQuan`) REFERENCES `quequan` (`maQueQuan`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canbo`
--

LOCK TABLES `canbo` WRITE;
/*!40000 ALTER TABLE `canbo` DISABLE KEYS */;
INSERT INTO `canbo` VALUES (27,'123123123','Bùi Bá Bình','2021-11-05',48,'ADMIN',9,'ADMIN'),(29,'321321321','Lê Văn Dũng','1999-02-02',49,'Thiếu tá',2,''),(30,'999999998','Bùi Gia Bảo','2002-10-02',48,'Trung tá',3,NULL),(33,'111111111','Nguyễn Văn D','1990-02-03',50,'Nhân Viên',3,'Bộ phận lập biên bản'),(34,'222233233','Bành Cẩm V','1992-10-03',52,'Nhân Viên',6,'Bộ phận lập quyết định'),(35,'999999999','Hồ Chí Minh','2001-11-11',52,'Nhân Viên',7,'Kế toán'),(36,'999999990','Bùi Lê Min Ho','2020-05-17',51,'Nhân Viên',2,'Quản lý nhân sự'),(40,'909999123','Hồ Minh Quốc Bảo','2020-05-21',48,'Nhân viên',1,''),(41,'777777777','Lưu Quang Huy','2020-05-21',48,'Thiếu tá',1,''),(42,'555555555','Lê Bảo Bình','2020-05-21',48,'Nhân Viên',1,''),(44,'432432432','Nguyễn Anh Dũng','2020-05-21',48,'Thiếu tá',1,''),(47,'890890890','Nguyễn Mạnh Bình','2020-05-04',48,'Nhân Viên',1,''),(48,'580580580','Châu Tinh Trì','2020-05-21',48,'Nhân Viên',1,''),(49,'145145145','Mai Trí Cường','2020-05-21',48,'Nhân Viên',1,''),(51,'456456459','Hello Java','2020-05-24',51,'Nhân Viên',1,''),(52,'567567567','Hello Python','2020-05-24',48,'Thiếu tá',4,''),(53,'546546768','Ngô Bá Khá','2020-05-24',48,'Nhân Viên',1,''),(55,'967967967','Huấn Hoa Hồng','2020-05-24',48,'Nhân Viên',1,''),(56,'234524151','Lê Văn Cô Nan','2020-05-24',48,'Nhân Viên',1,''),(60,'999999888','Sơn Tùng','2020-05-03',48,'Thiếu tá',1,''),(62,'777777776','Cao Thị H','2020-05-24',51,'Nhân Viên',4,'');
/*!40000 ALTER TABLE `canbo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cosoluutrutangvat`
--

DROP TABLE IF EXISTS `cosoluutrutangvat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cosoluutrutangvat` (
  `maCoSo` int NOT NULL AUTO_INCREMENT,
  `tenCoSo` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  PRIMARY KEY (`maCoSo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cosoluutrutangvat`
--

LOCK TABLES `cosoluutrutangvat` WRITE;
/*!40000 ALTER TABLE `cosoluutrutangvat` DISABLE KEYS */;
INSERT INTO `cosoluutrutangvat` VALUES (1,'Trụ sở CA TP HN'),(2,'Trại giam tự do'),(3,'Trụ sở CA TP HCM');
/*!40000 ALTER TABLE `cosoluutrutangvat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diem`
--

DROP TABLE IF EXISTS `diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diem` (
  `maDiem` int NOT NULL,
  `maKhoan` int NOT NULL,
  `moTa` varchar(300) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `maDieuLuat` int NOT NULL,
  PRIMARY KEY (`maDiem`,`maKhoan`,`maDieuLuat`),
  KEY `fk_dieu_idx` (`maDieuLuat`),
  KEY `fk_khoan_idx` (`maKhoan`),
  CONSTRAINT `fk_dieu` FOREIGN KEY (`maDieuLuat`) REFERENCES `dieuluat` (`maDieuLuat`),
  CONSTRAINT `fk_khoan` FOREIGN KEY (`maKhoan`) REFERENCES `khoan` (`maKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diem`
--

LOCK TABLES `diem` WRITE;
/*!40000 ALTER TABLE `diem` DISABLE KEYS */;
INSERT INTO `diem` VALUES (1,1,'Người điều khiển xe máy chuyên dùng không đúng độ tuổi hoặc tuổi không phù hợp với ngành nghề theo quy định;',25),(1,2,'Người điều khiển xe mô tô, xe gắn máy, các loại xe tương tự mô tô và các loại xe tương tự xe gắn máy không có hoặc không mang theo Giấy chứng nhận bảo hiểm trách nhiệm dân sự của chủ xe cơ giới còn hiệu lực;',24),(1,3,'Người điều khiển xe mô tô, các loại xe tương tự mô tô không có Giấy chứng nhận kiểm định an toàn kỹ thuật và bảo vệ môi trường (nếu có quy định phải kiểm định) hoặc có nhưng đã hết hạn;',24),(1,4,'Người từ đủ 16 tuổi đến dưới 18 tuổi điều khiển xe mô tô có dung tích xi lanh từ 50 cm3 trở lên;',24),(1,7,'Có Giấy phép lái xe nhưng không phù hợp với loại xe đang điều khiển hoặc đã hết hạn sử dụng từ 6 (sáu) tháng trở lên;',24),(2,1,'Người điều khiển xe máy chuyên dùng không mang theo bằng (hoặc chứng chỉ) điều khiển và chứng chỉ bồi dưỡng kiến thức pháp luật về giao thông đường bộ.',25),(2,2,'Người điều khiển xe mô tô, xe gắn máy, các loại xe tương tự mô tô và các loại xe tương tự xe gắn máy không mang theo Giấy đăng ký xe, Giấy chứng nhận kiểm định an toàn kỹ thuật và bảo vệ môi trường (nếu có quy định phải kiểm định);',24),(2,3,'Người điều khiển xe ô tô, máy kéo không mang theo Giấy đăng ký xe, Giấy phép lái xe, Giấy chứng nhận kiểm định an toàn kỹ thuật và bảo vệ môi trường (nếu có quy định phải kiểm định).',24),(2,4,'Người điều khiển xe ô tô, máy kéo và các loại xe tương tự ô tô không có hoặc không mang theo Giấy chứng nhận bảo hiểm trách nhiệm dân sự của chủ xe cơ giới còn hiệu lực;',24),(2,7,'Không có Giấy phép lái xe hoặc sử dụng Giấy phép lái xe không do cơ quan có thẩm quyền cấp, Giấy phép lái xe bị tẩy xóa.',24),(3,2,'Người điều khiển xe mô tô không mang theo Giấy phép lái xe.',24),(3,4,'Người điều khiển xe ô tô, máy kéo và các loại xe tương tự ô tô có Giấy phép lái xe nhưng đã hết hạn sử dụng dưới 6 (sáu) tháng.',24);
/*!40000 ALTER TABLE `diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieuluat`
--

DROP TABLE IF EXISTS `dieuluat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieuluat` (
  `maDieuLuat` int NOT NULL AUTO_INCREMENT,
  `tenDieuLuat` varchar(300) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  PRIMARY KEY (`maDieuLuat`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieuluat`
--

LOCK TABLES `dieuluat` WRITE;
/*!40000 ALTER TABLE `dieuluat` DISABLE KEYS */;
INSERT INTO `dieuluat` VALUES (24,'Xử phạt các hành vi vi phạm quy định về điều kiện của người điều khiển xe cơ giới'),(25,'Xử phạt các hành vi vi phạm quy định về điều kiện của người điều khiển xe máy chuyên dùng');
/*!40000 ALTER TABLE `dieuluat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donvi`
--

DROP TABLE IF EXISTS `donvi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donvi` (
  `maDonVi` int NOT NULL AUTO_INCREMENT,
  `maKhuVuc` int NOT NULL,
  `tenDonVi` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `ghiChu` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  PRIMARY KEY (`maDonVi`),
  KEY `fk_maCoSo_idx` (`maKhuVuc`),
  CONSTRAINT `fk_maCoSo` FOREIGN KEY (`maKhuVuc`) REFERENCES `khuvuc` (`maKhuVuc`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donvi`
--

LOCK TABLES `donvi` WRITE;
/*!40000 ALTER TABLE `donvi` DISABLE KEYS */;
INSERT INTO `donvi` VALUES (1,1,'Đơn vị tiên phong',''),(2,2,'Đơn vị phòng CPX-02',''),(3,2,'Đơn vị bồ câu',NULL),(4,2,'Đơn vị tuần tra',NULL),(5,3,'Đơn vị đặc nhiệm',NULL),(6,3,'Đơn vị vip',NULL),(7,4,'Đơn vị không vip',NULL),(8,1,'Đơn vị siêu vip',NULL),(9,2,'Đơn vị đặc vụ',NULL),(10,1,'Đơn vị cùi bắp',NULL),(11,2,'Đơn vị bắp cải',NULL),(12,3,'Đơn vị hello',NULL);
/*!40000 ALTER TABLE `donvi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoan`
--

DROP TABLE IF EXISTS `khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoan` (
  `maKhoan` int NOT NULL,
  `moTa` varchar(300) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `maDieuLuat` int NOT NULL,
  PRIMARY KEY (`maKhoan`,`maDieuLuat`),
  KEY `fk_maDieuKhoan_idx` (`maDieuLuat`),
  CONSTRAINT `fk_maDieuKhoan` FOREIGN KEY (`maDieuLuat`) REFERENCES `dieuluat` (`maDieuLuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoan`
--

LOCK TABLES `khoan` WRITE;
/*!40000 ALTER TABLE `khoan` DISABLE KEYS */;
INSERT INTO `khoan` VALUES (1,'Phạt tiền từ 100.000 đồng đến 200.000 đồng đối với một trong các hành vi vi phạm sau đây:',25),(2,'Phạt tiền từ 80.000 đồng đến 120.000 đồng đối với một trong các hành vi vi phạm sau đây:',24),(2,'Phạt tiền từ 600.000 đồng đến 1.000.000 đồng đối với người điều khiển xe máy chuyên dùng không có bằng (hoặc chứng chỉ) điều khiển và chứng chỉ bồi dưỡng kiến thức pháp luật về giao thông đường bộ.',25),(3,'Phạt tiền từ 200.000 đồng đến 400.000 đồng đối với một trong các hành vi vi phạm sau đây:',24),(4,'Phạt tiền từ 400.000 đồng đến 600.000 đồng đối với một trong các hành vi vi phạm sau đây:',24),(7,'Phạt tiền từ 4.000.000 đồng đến 6.000.000 đồng đối với người điều khiển xe mô tô có dung tích xi lanh từ 175 cm3 trở lên, xe ô tô, máy kéo và các loại xe tương tự ô tô vi phạm một trong các hành vi sau đây:',24);
/*!40000 ALTER TABLE `khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuvuc`
--

DROP TABLE IF EXISTS `khuvuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuvuc` (
  `maKhuVuc` int NOT NULL AUTO_INCREMENT,
  `tenKhuVuc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`maKhuVuc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuvuc`
--

LOCK TABLES `khuvuc` WRITE;
/*!40000 ALTER TABLE `khuvuc` DISABLE KEYS */;
INSERT INTO `khuvuc` VALUES (1,'TP HCM'),(2,'Hà Nội'),(3,'Hải Phòng'),(4,'Đà Nẵng');
/*!40000 ALTER TABLE `khuvuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoivipham`
--

DROP TABLE IF EXISTS `nguoivipham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoivipham` (
  `soCMND` varchar(12) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `hoTen` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `diaChi` varchar(140) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `sdt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`soCMND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoivipham`
--

LOCK TABLES `nguoivipham` WRITE;
/*!40000 ALTER TABLE `nguoivipham` DISABLE KEYS */;
INSERT INTO `nguoivipham` VALUES ('123123123','Lê Văn Luyện','2020-05-20','Q','191919198'),('123123124','Trần Đăng Khoa','2020-05-22','Hà Nội','0369730111'),('123123129','Nguyễn Văn A','2020-05-22','Hồ Gươm, Hà Nội','123123123'),('123123132','Nguyễn Anh Minh','2020-05-22','Q8, TP HCM','1234124'),('124567345235','Bùi Gia Bảo','2020-05-24','Cà Mau','123455678'),('333333123','Bùi Bá Bình','2020-05-11','97 Man Thiên, Quận 9,  TPHCM','08989898989'),('345345345','Lê Nin','2020-05-22','Quận 1, TP HCM','1241241'),('456789123','Nguyễn Nhật Minh','2020-05-24','Hà Nội','2342134'),('678678675','Uchiha Sasuke','2020-05-22','Quận 3,  TP HCM','31424123'),('678678678','Nguyễn Trần Trung Quân','2020-05-20','Lấp Vò','1231312313'),('765765765','Bùi Nhât Minh','2020-05-22','Trụ sở google','31241234234'),('999999999','Nguuyễn Dũng','2020-05-24','Bạc Liêu','123123123123');
/*!40000 ALTER TABLE `nguoivipham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qdxphc`
--

DROP TABLE IF EXISTS `qdxphc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qdxphc` (
  `soQDXPHC` int NOT NULL AUTO_INCREMENT,
  `maCanBo` int NOT NULL,
  `ngayLap` date NOT NULL,
  `soCMND` varchar(12) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `hanNopPhat` date DEFAULT NULL,
  `ghiChu` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'Chưa nôp phạt',
  PRIMARY KEY (`soQDXPHC`),
  KEY `fk_soCMND_idx` (`soCMND`),
  KEY `fk_QDXPHC_maCanBo_idx` (`maCanBo`),
  CONSTRAINT `fk_QDXPHC_maCanBo` FOREIGN KEY (`maCanBo`) REFERENCES `canbo` (`maCanBo`),
  CONSTRAINT `fk_QDXPHC_soCMND` FOREIGN KEY (`soCMND`) REFERENCES `nguoivipham` (`soCMND`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qdxphc`
--

LOCK TABLES `qdxphc` WRITE;
/*!40000 ALTER TABLE `qdxphc` DISABLE KEYS */;
INSERT INTO `qdxphc` VALUES (47,27,'2020-05-17','333333123','2020-05-24','Đã nộp tiền'),(48,27,'2020-05-17','333333123','2020-05-24','Đã nộp tiền'),(49,27,'2020-05-21','123123123','2020-05-28','Đã nộp tiền'),(50,27,'2020-05-21','678678678','2020-05-28','Chưa nộp phạt'),(51,27,'2020-05-22','765765765','2020-05-29','Chưa nôp phạt'),(52,34,'2020-05-22','678678675','2020-05-29','Chưa nộp phạt'),(53,34,'2020-05-22','123123123','2020-05-29','Chưa nôp phạt'),(54,27,'2020-05-22','123123124','2020-05-29','Đã nộp tiền'),(55,27,'2020-05-22','123123129','2020-05-29','Chưa nôp phạt'),(56,27,'2020-05-24','123123123','2020-05-31','Đã nộp tiền'),(57,27,'2020-05-24','999999999','2020-05-31','Chưa nôp phạt'),(58,27,'2020-05-24','124567345235','2020-05-31','Chưa nôp phạt'),(59,27,'2020-05-24','333333123','2020-05-31','Chưa nôp phạt'),(60,27,'2017-05-15','123123124','2017-05-22','Chưa nôp phạt'),(61,27,'2019-06-07','123123123','2019-06-14','Chưa nôp phạt');
/*!40000 ALTER TABLE `qdxphc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quequan`
--

DROP TABLE IF EXISTS `quequan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quequan` (
  `maQueQuan` int NOT NULL,
  `tenQueQuan` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  PRIMARY KEY (`maQueQuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quequan`
--

LOCK TABLES `quequan` WRITE;
/*!40000 ALTER TABLE `quequan` DISABLE KEYS */;
INSERT INTO `quequan` VALUES (48,'Đăk Nông'),(49,'Bạc Liêu'),(50,'Bình Định'),(51,'Quảng Ngãi'),(52,'Nam Định');
/*!40000 ALTER TABLE `quequan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoancanbo`
--

DROP TABLE IF EXISTS `taikhoancanbo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoancanbo` (
  `taiKhoan` varchar(45) NOT NULL,
  `matKhau` varchar(45) NOT NULL,
  `maCanBo` int NOT NULL,
  `quyen` varchar(100) NOT NULL,
  PRIMARY KEY (`taiKhoan`),
  KEY `TKCB_maCanBo_idx` (`maCanBo`),
  CONSTRAINT `TKCB_maCanBo` FOREIGN KEY (`maCanBo`) REFERENCES `canbo` (`maCanBo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoancanbo`
--

LOCK TABLES `taikhoancanbo` WRITE;
/*!40000 ALTER TABLE `taikhoancanbo` DISABLE KEYS */;
INSERT INTO `taikhoancanbo` VALUES ('admin','admin',27,'CB:r-w NVP:r-w TV:r-w BL:r-w QD:r-w BB:r-w TK:r-w'),('canbo_30','123456',30,'CB:r-w NVP:r TV:r BL:r QD:r BB:r TK:r-w'),('canbo_33','123456',33,'CB:r NVP:r-w TV:r-w BL:r QD:r BB:r-w TK:r-w'),('canbo_34','123456',34,'CB:r NVP:r-w TV:r-w BL:r QD:r-w BB:r-w TK:r-w'),('canbo_35','123456',35,'CB:r NVP:r TV:r-w BL:r-w QD:r BB:r TK:r-w'),('canbo_36','123456',36,'CB:r-w NVP:r TV:r BL:r QD:r BB:r TK:r-w');
/*!40000 ALTER TABLE `taikhoancanbo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tangvat`
--

DROP TABLE IF EXISTS `tangvat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tangvat` (
  `maTangVat` int NOT NULL AUTO_INCREMENT,
  `tenTangVat` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `soLuong` int NOT NULL,
  `trangThai` varchar(40) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `coSoLuuTru` int NOT NULL,
  `ghiChu` varchar(150) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  PRIMARY KEY (`maTangVat`),
  KEY `FK_TangVat_coSoLuTru_idx` (`coSoLuuTru`),
  CONSTRAINT `FK_TangVat_coSoLuTru` FOREIGN KEY (`coSoLuuTru`) REFERENCES `cosoluutrutangvat` (`maCoSo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tangvat`
--

LOCK TABLES `tangvat` WRITE;
/*!40000 ALTER TABLE `tangvat` DISABLE KEYS */;
INSERT INTO `tangvat` VALUES (35,'Xe Honda',2,'Còn tốt',1,''),(39,'Bằng lái xe',1,'Còn tốt',3,''),(40,'Serius',1,'Còn tốt',3,'Xe không có cà vẹt'),(41,'AB',1,'Tốt',1,''),(42,'Xe Ben',1,'Còn tốt',3,'Tang vật nhập lậu');
/*!40000 ALTER TABLE `tangvat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tangvatbbvphc`
--

DROP TABLE IF EXISTS `tangvatbbvphc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tangvatbbvphc` (
  `maTangVat` int NOT NULL AUTO_INCREMENT,
  `soBBVPHC` int NOT NULL,
  PRIMARY KEY (`maTangVat`,`soBBVPHC`),
  KEY `fk_soBBVPHC_idx` (`soBBVPHC`),
  CONSTRAINT `fk_TangVat_BBVPHC` FOREIGN KEY (`soBBVPHC`) REFERENCES `bbvphc` (`soBBVPHC`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_TangVat_maTangVat` FOREIGN KEY (`maTangVat`) REFERENCES `tangvat` (`maTangVat`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tangvatbbvphc`
--

LOCK TABLES `tangvatbbvphc` WRITE;
/*!40000 ALTER TABLE `tangvatbbvphc` DISABLE KEYS */;
INSERT INTO `tangvatbbvphc` VALUES (41,19),(42,21);
/*!40000 ALTER TABLE `tangvatbbvphc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tangvatqdxphc`
--

DROP TABLE IF EXISTS `tangvatqdxphc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tangvatqdxphc` (
  `maTangVat` int NOT NULL AUTO_INCREMENT,
  `soQDXPHC` int NOT NULL,
  PRIMARY KEY (`maTangVat`,`soQDXPHC`),
  KEY `fk_TangVatQDXPHC_soQDXPHC_idx` (`soQDXPHC`),
  CONSTRAINT `fk_TangVatQDXPHC_maTangVat` FOREIGN KEY (`maTangVat`) REFERENCES `tangvat` (`maTangVat`) ON DELETE CASCADE,
  CONSTRAINT `fk_TangVatQDXPHC_soQDXPHC` FOREIGN KEY (`soQDXPHC`) REFERENCES `qdxphc` (`soQDXPHC`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tangvatqdxphc`
--

LOCK TABLES `tangvatqdxphc` WRITE;
/*!40000 ALTER TABLE `tangvatqdxphc` DISABLE KEYS */;
INSERT INTO `tangvatqdxphc` VALUES (35,48),(40,48),(39,52);
/*!40000 ALTER TABLE `tangvatqdxphc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuphat`
--

DROP TABLE IF EXISTS `xuphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xuphat` (
  `maXuPhat` int NOT NULL AUTO_INCREMENT,
  `soQDXPHC` int NOT NULL,
  `diem` int DEFAULT NULL,
  `khoan` int DEFAULT NULL,
  `dieu` int NOT NULL,
  `mucPhat` int NOT NULL,
  PRIMARY KEY (`maXuPhat`,`soQDXPHC`),
  KEY `fk_soQDXPHC_idx` (`soQDXPHC`),
  KEY `fk_diem_idx` (`diem`),
  KEY `fk_khoan_idx` (`khoan`),
  KEY `fk_dieu_idx` (`dieu`),
  CONSTRAINT `fk_diemVP` FOREIGN KEY (`diem`) REFERENCES `diem` (`maDiem`),
  CONSTRAINT `fk_dieuVP` FOREIGN KEY (`dieu`) REFERENCES `dieuluat` (`maDieuLuat`),
  CONSTRAINT `fk_khoanVP` FOREIGN KEY (`khoan`) REFERENCES `khoan` (`maKhoan`),
  CONSTRAINT `fk_soQDXPHC` FOREIGN KEY (`soQDXPHC`) REFERENCES `qdxphc` (`soQDXPHC`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuphat`
--

LOCK TABLES `xuphat` WRITE;
/*!40000 ALTER TABLE `xuphat` DISABLE KEYS */;
INSERT INTO `xuphat` VALUES (41,47,1,2,24,80000),(42,47,1,4,24,5000000),(43,48,1,1,25,1000000),(44,48,1,2,24,80000),(45,49,1,2,24,22000),(46,50,2,1,25,2000),(47,50,2,1,25,2000),(48,50,2,1,25,2000),(49,51,1,1,25,100000),(50,52,2,1,25,1000000),(51,52,1,1,25,1000000),(52,52,1,2,25,1000000),(53,53,1,1,25,100000),(54,53,2,1,25,100000),(55,53,1,2,25,100000),(56,54,1,2,24,100000),(57,56,2,3,24,200000),(58,56,2,1,25,200000),(59,56,2,2,25,200000),(60,57,1,2,24,100000),(61,57,2,2,24,100000),(62,58,2,2,24,20000),(63,59,2,1,25,100000),(64,60,1,1,25,100000),(65,61,1,1,25,20000);
/*!40000 ALTER TABLE `xuphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cnpm_qlvpgt'
--
/*!50003 DROP PROCEDURE IF EXISTS `CapNhatNguoiViPham` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CapNhatNguoiViPham`(
	in  nguoi_vi_pham_moi bool,
    in  so_cmnd varchar(12),
    in ho_ten varchar(150),
    in ngay_sinh date,
    in dia_chi varchar(140),
    in so_dien_thoai varchar(20)
)
BEGIN
	IF nguoi_vi_pham_moi THEN 
		INSERT INTO nguoivipham VALUES(so_cmnd, ho_ten, ngay_sinh, dia_chi, so_dien_thoai);
	else
		UPDATE nguoivipham
        SET
			hoTen=ho_ten,
            ngaySinh=ngay_sinh,
            diaChi=dia_chi,
            sdt=so_dien_thoai
		WHERE soCMND=so_cmnd;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HieuChinhBBVPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HieuChinhBBVPHC`(
	in so_bbvphc int,
	in ma_can_bo int,
    in ngay_lap date,
    in so_cmnd varchar(12),
    in mo_ta_hanh_vi varchar(300)
)
BEGIN
	UPDATE bbvphc 
		SET maCanBo=ma_can_bo,
			ngayLap=ngay_lap,
            soCMND=so_cmnd,
            moTaHanhVi=mo_ta_hanh_vi
	WHERE soBBVPHC=so_bbvphc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HieuChinhBienBan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HieuChinhBienBan`(
	in ma_can_bo int,
    in ngay_lap date,
    in so_cmnd varchar(12),
    in mo_ta_hanh_vi varchar(300),
    in so_bbvphc int
)
BEGIN
	UPDATE bbvphc 
		SET maCanBo=ma_can_bo,
			ngayLap=ngay_lap,
			soCMND=so_cmnd,
            moTaHanhVi=mo_ta_hanh_vi
	WHERE bbvphc.soBBVPHC=so_bbvphc;
            
            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HieuChinhBienLai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HieuChinhBienLai`(
	in ma_bien_lai int,
	in so_qdxphc int,
    in ma_can_bo int,
    in ho_ten varchar(150),
    in ngay_lap_bien_lai date,
    in ly_do_nop_phat varchar(150),
    in so_tien_nop int
)
BEGIN
	UPDATE qdxphc 
    SET 
		ghiChu="Chưa nộp phạt"
	WHERE soQDXPHC IN (SELECT soQDXPHC FROM bienlainopphat WHERE maBienLai=ma_bien_lai);
    
    UPDATE bienlainopphat
    SET 
		soQDXPHC=so_qdxphc,
        maCanBo=ma_can_bo,
        hoTen=ho_ten,
        ngayLapBienLai=ngay_lap_bien_lai,
        lyDoNopPhat=ly_do_nop_phat,
        soTienNop=so_tien_nop
	WHERE maBienLai=ma_bien_lai;
     UPDATE qdxphc 
		SET ghiChu='Đã nộp tiền'
	WHERE soQDXPHC=so_qdxphc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HieuChinhCanBo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HieuChinhCanBo`(
	in ma_can_bo int,
	in so_cmnd varchar(12),
    in ho_ten varchar(150),
    in ngay_sinh date,
    in chuc_vu varchar(150),
    in ghi_chu varchar(150),
    in ma_que_quan int,
    in ma_don_vi int
)
BEGIN
		UPDATE canbo 
			SET hoTen=ho_ten,
                ngaySinh=ngay_sinh,
                chucVu=chuc_vu,
                ghiChu=ghi_chu,
                maQueQuan=ma_que_quan,
                maDonVi=ma_don_vi,
				soCMND=so_cmnd
		WHERE maCanBo=ma_can_bo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HieuChinhTangVatBBVPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HieuChinhTangVatBBVPHC`(
	in ma_tang_vat int,
	in so_bbvphc int,
    in ten_tang_vat varchar(150),
	in so_luong int,
    in trang_thai varchar(40),
    in co_so_luu_tru int,
    in ghi_chu varchar(150)
)
BEGIN
	UPDATE tangvatbbvphc 
		SET soBBVPHC=so_bbvphc
	WHERE maTangVat=ma_tang_vat;
	UPDATE tangvat
		SET tenTangVat=ten_tang_vat,
			soLuong=so_luong,
            trangThai=trang_thai,
			coSoLuuTru=co_so_luu_tru,
            ghiChu=ghi_chu
	WHERE maTangVat=ma_tang_vat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HieuChinhTangVatQDXPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HieuChinhTangVatQDXPHC`(
	in ma_tang_vat int,
	in so_qdxphc int,
    in ten_tang_vat varchar(150),
	in so_luong int,
    in trang_thai varchar(40),
    in co_so_luu_tru int,
    in ghi_chu varchar(150)
)
BEGIN
	
	UPDATE tangvatqdxphc 
		SET soQDXPHC=so_qdxphc
	WHERE maTangVat=ma_tang_vat;
	UPDATE tangvat
		SET tenTangVat=ten_tang_vat,
			soLuong=so_luong,
            trangThai=trang_thai,
			coSoLuuTru=co_so_luu_tru,
            ghiChu=ghi_chu
	WHERE maTangVat=ma_tang_vat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LayThongTinTaiKhoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LayThongTinTaiKhoan`(
	in tai_khoan varchar(45),
    in mat_khau varchar(45)
)
BEGIN
	SELECT * FROM taikhoancanbo, canbo ,donvi
    WHERE taiKhoan=tai_khoan
    AND matKhau=mat_khau
    AND taikhoancanbo.maCanBo=canbo.maCanBo
    AND canbo.maDonVi=donvi.maDonVi;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QDXPHC_DuaVaoBienBan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QDXPHC_DuaVaoBienBan`(
	in so_bbvphc int,
	in ma_can_bo int,
    in ngay_lap date,
    in han_nop_phat date,
	out so_qdxphc int
)
BEGIN
    DECLARE so_cmnd varchar(12);
    
    SET so_cmnd=(SELECT soCMND FROM bbvphc WHERE soBBVPHC=so_bbvphc);
    
	CALL QDXPHC_KhongDuaVaoBienBan(ma_can_bo, ngay_lap, so_cmnd, han_nop_phat,so_qdxphc);
    INSERT INTO bbvphc_qdxphc VALUES (so_bbvphc,so_qdxphc);
    
     SET so_qdxphc=(SELECT MAX(soQDXPHC) FROM qdxphc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QDXPHC_KhongDuaVaoBienBan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QDXPHC_KhongDuaVaoBienBan`(
	in ma_can_bo int,
    in ngay_lap date,
    in so_cmnd varchar(12),
    in han_nop_phat date,
    out so_qdxphc int
)
BEGIN
	INSERT INTO qdxphc (maCanBo, ngayLap, soCMND, hanNopPhat)
    VALUES (ma_can_bo, ngay_lap, so_cmnd, han_nop_phat);
    SET so_qdxphc=(SELECT MAX(soQDXPHC) FROM qdxphc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemBBVPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemBBVPHC`(
    in ma_can_bo int,
    in ngay_lap date,
    in so_cmnd varchar(12),
    in mo_ta_hanh_vi varchar(300),
    out so_bbvphc int
)
BEGIN
    INSERT INTO bbvphc(maCanBo, ngayLap, soCMND, moTaHanhVi) 
    VALUES (ma_can_bo, ngay_lap, so_cmnd, mo_ta_hanh_vi);
    SET so_bbvphc=(SELECT MAX(soBBVPHC) FROM bbvphc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemBienLaiNopPhat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemBienLaiNopPhat`(
	in so_qdxphc int,
    in ma_can_bo int,
    in ho_ten varchar(150),
    in ngay_lap_bien_lai date,
    in ly_do_nop_phat varchar(150),
    in so_tien_nop int
)
BEGIN
	INSERT INTO bienlainopphat(soQDXPHC,maCanBo, hoTen, ngayLapBienLai, lyDoNopPhat, soTienNop)
    VALUES( so_qdxphc,ma_can_bo, ho_ten, ngay_lap_bien_lai, ly_do_nop_phat, so_tien_nop);
    UPDATE qdxphc 
		SET ghiChu='Đã nộp tiền'
	WHERE soQDXPHC=so_qdxphc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemCanBo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemCanBo`(
    in so_cmnd varchar(12),
    in ho_ten varchar(150),
    in ngay_sinh date,
    in chuc_vu varchar(150),
    in ghi_chu varchar(150),
    in ma_que_quan int,
    in ma_don_vi int
)
BEGIN
	INSERT INTO canbo(soCMND, hoTen, ngaySinh, chucVu, ghiChu, maQueQuan, maDonVi)
    VALUES(so_cmnd, ho_ten,ngay_sinh,chuc_vu,ghi_chu, ma_que_quan, ma_don_vi);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemTangVat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemTangVat`(
	in ten_tang_vat varchar(150),
    in so_luong int,
    in trang_thai varchar(40),
    in co_so_luu_tru int,
    in ghi_chu varchar(150),
    out ma_tang_vat int
)
BEGIN
	INSERT INTO tangvat (tenTangVat,soLuong,trangThai,coSoLuuTru,ghiChu)
    VALUES (ten_tang_vat,so_luong,trang_thai,co_so_luu_tru,ghi_chu);
    
    SET ma_tang_vat=(SELECT MAX(maTangVat) FROM tangvat);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemTangVatBBVPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemTangVatBBVPHC`(
	in so_bbvphc int,
    in ten_tang_vat varchar(150),
	in so_luong int,
    in trang_thai varchar(40),
    in co_so_luu_tru int,
    in ghi_chu varchar(150)
)
BEGIN
	DECLARE ma_tang_vat int;
	CALL ThemTangVat(ten_tang_vat,so_luong,trang_thai,co_so_luu_tru,ghi_chu,ma_tang_vat);
    INSERT INTO tangvatbbvphc VALUES(ma_tang_vat,so_bbvphc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemTangVatQDXPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemTangVatQDXPHC`(
	in so_qdxphc int,
    in ten_tang_vat varchar(150),
	in so_luong int,
    in trang_thai varchar(40),
    in co_so_luu_tru int,
    in ghi_chu varchar(150)
)
BEGIN
	DECLARE ma_tang_vat int;
	CALL ThemTangVat(ten_tang_vat,so_luong,trang_thai,co_so_luu_tru,ghi_chu,ma_tang_vat);
    INSERT INTO tangvatqdxphc VALUES(ma_tang_vat,so_qdxphc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ThemXuPhat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemXuPhat`(
	in so_qdxphc int,
    in diem_vp int,
    in khoan_vp int,
    in dieu_luat_vp int,
    in muc_phat int
    
)
BEGIN
	INSERT INTO XuPhat(soQDXPHC,diem, khoan, dieu,mucPhat)
    VALUES (so_qdxphc, diem_vp, khoan_vp, dieu_luat_vp, muc_phat);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TiemKiemBienBanTheoCMND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiemKiemBienBanTheoCMND`(
	in so_cmnd varchar(12),
    in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(soBBVPHC) FROM bbvphc WHERE soCMND LIKE CONCAT(so_cmnd,'%'));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT 
    soBBVPHC,
    canbo.maCanBo,
    canbo.hoTen as hoTenCanBo,
    ngayLap,
    moTaHanhVi,
    nguoivipham.soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh,
    nguoivipham.diaChi,
    nguoivipham.sdt
    FROM bbvphc,nguoivipham,canbo WHERE 
    bbvphc.soCMND LIKE CONCAT(so_cmnd,'%')
    AND bbvphc.soCMND=nguoivipham.soCMND
    AND bbvphc.maCanBo=canbo.maCanBo
	ORDER BY nguoivipham.soCMND
    LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TiemKiemBienBanTheoSoBBVPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiemKiemBienBanTheoSoBBVPHC`(
	in so_bbvphc varchar(12),
    in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(soBBVPHC) FROM bbvphc WHERE soBBVPHC LIKE CONCAT(so_bbvphc,'%'));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT 
    soBBVPHC,
    canbo.maCanBo,
    canbo.hoTen as hoTenCanBo,
    ngayLap,
    moTaHanhVi,
    nguoivipham.soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh,
    nguoivipham.diaChi,
    nguoivipham.sdt
    FROM bbvphc,nguoivipham,canbo WHERE 
    bbvphc.soBBVPHC LIKE CONCAT(so_bbvphc,'%')
    AND bbvphc.soCMND=nguoivipham.soCMND
    AND bbvphc.maCanBo=canbo.maCanBo
	ORDER BY nguoivipham.soCMND
    LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TiemKiemQuyetDinhCBB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiemKiemQuyetDinhCBB`(
	in so_qdxphc varchar(10),
    in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    
    SET count=(SELECT COUNT(qdxphc.soQDXPHC)FROM qdxphc,bbvphc_qdxphc
    WHERE CONVERT(qdxphc.soQDXPHC,CHAR(10)) LIKE CONCAT(so_qdxphc,'%')
     AND  bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC);
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
    SELECT
    qdxphc.soQDXPHC as soQDXPHC,
    bbvphc_qdxphc.soBBVPHC as soBBVPHC,
    canbo.maCanBo as maCanBo,
    canbo.hoTen as hoTenCanBo,
    nguoivipham.soCMND as soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh as ngaySinhNguoiViPham,
    nguoivipham.diaChi as diaChi,
    nguoivipham.sdt as sdt,
    qdxphc.ngayLap as ngayLap,
    qdxphc.hanNopPhat as hanNopPhat,
    diem,
    khoan,
    dieu,
    mucPhat,
    qdxphc.ghiChu
    FROM qdxphc,canbo,bbvphc_qdxphc,nguoivipham,xuphat
    WHERE CONVERT(qdxphc.soQDXPHC,CHAR(10)) LIKE CONCAT(so_qdxphc,'%')
    AND qdxphc.maCanBo=canbo.maCanBo
    AND qdxphc.soQDXPHC=xuPhat.soQDXPHC
    AND qdxphc.soCMND=nguoivipham.soCMND
    AND  bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC
	ORDER BY qdxphc.soQDXPHC
    LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TiemKiemQuyetDinhKCBB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TiemKiemQuyetDinhKCBB`(	
	in so_qdxphc varchar(10),
	in page_offset int,
	out count int
)
BEGIN
	DECLARE des int;
    
    SET count=(SELECT COUNT(qdxphc.soQDXPHC)FROM qdxphc,bbvphc_qdxphc
    WHERE CONVERT(qdxphc.soQDXPHC,CHAR(10)) LIKE CONCAT(so_qdxphc,'%')
     AND NOT EXISTS ( SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT 
    qdxphc.soQDXPHC as soQDXPHC,
    canbo.maCanBo as maCanBo,
    canbo.hoTen as hoTenCanBo,
    nguoivipham.soCMND as soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh as ngaySinhNguoiViPham,
    nguoivipham.diaChi as diaChi,
    nguoivipham.sdt as sdt,
    qdxphc.ngayLap as ngayLap,
    qdxphc.hanNopPhat as hanNopPhat,
    diem,
    khoan,
    dieu,
    mucPhat,
    qdxphc.ghiChu
    FROM qdxphc,canbo,nguoivipham,xuphat
    WHERE CONVERT(qdxphc.soQDXPHC,CHAR(10)) LIKE CONCAT(so_qdxphc,'%')
	AND qdxphc.maCanBo=canbo.maCanBo
    AND qdxphc.soQDXPHC=xuPhat.soQDXPHC
    AND qdxphc.soCMND=nguoivipham.soCMND
    AND NOT EXISTS ( SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    ORDER BY qdxphc.soQDXPHC
    LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemBienLaiTheoHoTenNguoiLap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemBienLaiTheoHoTenNguoiLap`(
	in ho_ten varchar(150),
	in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(bienlainopphat.maCanBo)   FROM bienlainopphat,canbo WHERE
    bienlainopphat.maCanBo=canbo.maCanBo
    AND canbo.hoTen LIKE CONCAT(ho_ten,'%'));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT maBienLai,
    soQDXPHC,
	bienlainopphat.ngayLapBienLai,
    canbo.maCanBo,
    canbo.hoTen as hoTenCanBo,
    bienlainopphat.hoTen as hoTenNguoiNopTien,
	lyDoNopPhat,
    soTienNop
    FROM bienlainopphat,canbo WHERE
    bienlainopphat.maCanBo=canbo.maCanBo
    AND canbo.hoTen LIKE CONCAT(ho_ten,'%')
    ORDER BY canbo.hoTen
    LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemCanBoTheoTenCanBo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemCanBoTheoTenCanBo`(
	in ten_can_bo varchar(150),
    in page_offset int,
    out count int
)
BEGIN
    DECLARE des int;
    SET count=(SELECT COUNT(maCanBo) FROM  canbo WHERE canbo.hoTen LIKE CONCAT(ten_can_bo,'%'));
   
	IF page_offset*20>= count THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT maCanBo,soCMND,hoTen,ngaySinh,chucVu,canbo.maQueQuan,canbo.maDonVi,canbo.ghiChu,
    tenQueQuan,tenDonVi
    FROM canbo, donvi, quequan
    WHERE canbo.maDonVi=donvi.maDonVi
    AND canbo.maQueQuan=queQuan.maQueQuan
    AND canbo.hoTen LIKE CONCAT(ten_can_bo,'%')
    ORDER BY canbo.hoTen
	LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemCoSoLuuTru` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemCoSoLuuTru`(
	in ten_co_so varchar(150)
)
BEGIN
	SELECT * FROM cosoluutrutangvat WHERE tenCoSo LIKE CONCAT(ten_co_so,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemDonViTheoTenDonVi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemDonViTheoTenDonVi`(
	in ten_don_vi varchar(150)
)
BEGIN
	SELECT * FROM donvi,khuvuc WHERE donvi.maKhuVuc=khuvuc.maKhuVuc
    AND	tenDonVi LIKE CONCAT(ten_don_vi,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemKhuVuc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemKhuVuc`(
	in ten_khu_vuc varchar(150)
)
BEGIN
	SELECT * FROM khuvuc WHERE tenKhuVuc LIKE CONCAT(ten_khu_vuc,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemKhuVucTheoTenKhuVuc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemKhuVucTheoTenKhuVuc`(
	in ten_khu_vuc varchar(150)
)
BEGIN
		SELECT * FROM khuvuc WHERE tenKhuVuc LIKE CONCAT(ten_khu_vuc,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemNguoiViPhamTheoCMND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemNguoiViPhamTheoCMND`(
	in so_cmnd varchar(12),
    in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(soCMND) FROM nguoivipham WHERE CONVERT(soCMND,CHAR(12)) LIKE CONCAT(so_cmnd,'%'));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
	SELECT * FROM nguoivipham WHERE CONVERT(soCMND,CHAR(12)) LIKE CONCAT(so_cmnd,'%')
    ORDER BY soCMND
    LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemNguoiViPhamTheoTen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemNguoiViPhamTheoTen`(
	in ho_ten varchar(150)
)
BEGIN
	SELECT * FROM nguoivipham WHERE hoTen LIKE CONCAT(ho_ten,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemQueQuanTheoTenVung` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemQueQuanTheoTenVung`(
	in ten_que_quan varchar(150)
)
BEGIN
	SELECT * FROM quequan WHERE tenQueQuan LIKE CONCAT(ten_que_quan,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemQuyetDinhTheoCMND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemQuyetDinhTheoCMND`(
	in so_cmnd varchar(12),
	in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    
    SET count=(SELECT COUNT(qdxphc.soQDXPHC)  FROM qdxphc,bbvphc_qdxphc
    WHERE qdxphc.soCMND LIKE CONCAT(so_cmnd,'%')
    AND  bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    +
    (SELECT 
    COUNT(qdxphc.soQDXPHC) 
     FROM qdxphc
    WHERE qdxphc.soCMND LIKE CONCAT(so_cmnd,'%')
    AND NOT EXISTS ( SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    );
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	(SELECT
    qdxphc.soQDXPHC as soQDXPHC,
    bbvphc_qdxphc.soBBVPHC as soBBVPHC,
    canbo.maCanBo as maCanBo,
    canbo.hoTen as hoTenCanBo,
    nguoivipham.soCMND as soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh as ngaySinhNguoiViPham,
    nguoivipham.diaChi as diaChi,
    nguoivipham.sdt as sdt,
    qdxphc.ngayLap as ngayLap,
    qdxphc.hanNopPhat as hanNopPhat,
    diem,
    khoan,
    dieu,
    mucPhat,
    qdxphc.ghiChu
    FROM qdxphc,canbo,bbvphc_qdxphc,nguoivipham,xuphat
    WHERE qdxphc.soCMND LIKE CONCAT(so_cmnd,'%')
    AND qdxphc.maCanBo=canbo.maCanBo
    AND qdxphc.soQDXPHC=xuPhat.soQDXPHC
    AND qdxphc.soCMND=nguoivipham.soCMND
    AND  bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC
	)
    UNION
    (SELECT 
    qdxphc.soQDXPHC as soQDXPHC,
    null as soBBVPHC,
    canbo.maCanBo as maCanBo,
    canbo.hoTen as hoTenCanBo,
    nguoivipham.soCMND as soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh as ngaySinhNguoiViPham,
    nguoivipham.diaChi as diaChi,
    nguoivipham.sdt as sdt,
    qdxphc.ngayLap as ngayLap,
    qdxphc.hanNopPhat as hanNopPhat,
    diem,
    khoan,
    dieu,
    mucPhat,
    qdxphc.ghiChu
    FROM qdxphc,canbo,nguoivipham,xuphat
    WHERE qdxphc.soCMND LIKE CONCAT(so_cmnd,'%')
	AND qdxphc.maCanBo=canbo.maCanBo
    AND qdxphc.soQDXPHC=xuPhat.soQDXPHC
    AND qdxphc.soCMND=nguoivipham.soCMND
    AND NOT EXISTS ( SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    )
    ORDER BY soCMND
    LIMIT des,20
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemQuyetDinhTheoSoQDXPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemQuyetDinhTheoSoQDXPHC`(
	in so_qdxphc varchar(12),
	in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    
    SET count=(SELECT COUNT(qdxphc.soQDXPHC)  FROM qdxphc,bbvphc_qdxphc
    WHERE qdxphc.soQDXPHC LIKE CONCAT(so_qdxphc,'%')
    AND  bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    +
    (SELECT 
    COUNT(qdxphc.soQDXPHC) 
     FROM qdxphc
   WHERE qdxphc.soQDXPHC LIKE CONCAT(so_qdxphc,'%')
    AND NOT EXISTS ( SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    );
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	(SELECT
    qdxphc.soQDXPHC as soQDXPHC,
    bbvphc_qdxphc.soBBVPHC as soBBVPHC,
    canbo.maCanBo as maCanBo,
    canbo.hoTen as hoTenCanBo,
    nguoivipham.soCMND as soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh as ngaySinhNguoiViPham,
    nguoivipham.diaChi as diaChi,
    nguoivipham.sdt as sdt,
    qdxphc.ngayLap as ngayLap,
    qdxphc.hanNopPhat as hanNopPhat,
    diem,
    khoan,
    dieu,
    mucPhat,
    qdxphc.ghiChu
    FROM qdxphc,canbo,bbvphc_qdxphc,nguoivipham,xuphat
    WHERE qdxphc.soQDXPHC LIKE CONCAT(so_qdxphc,'%')
    AND qdxphc.maCanBo=canbo.maCanBo
    AND qdxphc.soQDXPHC=xuPhat.soQDXPHC
    AND qdxphc.soCMND=nguoivipham.soCMND
    AND  bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC
	)
    UNION
    (SELECT 
    qdxphc.soQDXPHC as soQDXPHC,
    null as soBBVPHC,
    canbo.maCanBo as maCanBo,
    canbo.hoTen as hoTenCanBo,
    nguoivipham.soCMND as soCMND,
    nguoivipham.hoTen as hoTenNguoiViPham,
    nguoivipham.ngaySinh as ngaySinhNguoiViPham,
    nguoivipham.diaChi as diaChi,
    nguoivipham.sdt as sdt,
    qdxphc.ngayLap as ngayLap,
    qdxphc.hanNopPhat as hanNopPhat,
    diem,
    khoan,
    dieu,
    mucPhat,
    qdxphc.ghiChu
    FROM qdxphc,canbo,nguoivipham,xuphat
   WHERE qdxphc.soQDXPHC LIKE CONCAT(so_qdxphc,'%')
	AND qdxphc.maCanBo=canbo.maCanBo
    AND qdxphc.soQDXPHC=xuPhat.soQDXPHC
    AND qdxphc.soCMND=nguoivipham.soCMND
    AND NOT EXISTS ( SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=qdxphc.soQDXPHC)
    )
    ORDER BY soQDXPHC
    LIMIT des,20
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemTangVatTheoBBVPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemTangVatTheoBBVPHC`(
	in so_bbvphc varchar(10),
    in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(soBBVPHC) FROM tangvatbbvphc
    WHERE  CONVERT(soBBVPHC,CHAR(10)) = CONVERT(so_bbvphc,CHAR(10)));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT * FROM tangvatbbvphc,tangvat,cosoluutrutangvat
    WHERE CONVERT(tangvatbbvphc.soBBVPHC,CHAR(10)) = CONVERT(so_bbvphc,CHAR(10))
    AND tangvatbbvphc.maTangVat=tangVat.maTangVat
    AND tangvat.coSoLuuTru=cosoluutrutangvat.maCoSo
    ORDER BY soBBVPHC
	LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemTangVatTheoQDXPHC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemTangVatTheoQDXPHC`(
	in so_qdxphc varchar(10),
	in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(soQDXPHC) FROM tangvatqdxphc
    WHERE  CONVERT(soQDXPHC,CHAR(10)) = CONVERT(so_qdxphc,CHAR(10)));
   
	IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT * FROM tangvatqdxphc,tangvat,cosoluutrutangvat
    WHERE  CONVERT(tangvatqdxphc.soQDXPHC,CHAR(10))= CONVERT(so_qdxphc,CHAR(10))
    AND tangvatqdxphc.maTangVat=tangVat.maTangVat
    AND tangvat.coSoLuuTru=cosoluutrutangvat.maCoSo
    ORDER BY soQDXPHC
	LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimKiemTatCaTangVat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemTatCaTangVat`(
	 in page_offset int,
    out count int
)
BEGIN
	DECLARE des int;
    SET count=(SELECT COUNT(maTangVat) FROM tangvat);
    
    IF page_offset*20> FLOOR(count/20)*20 THEN SET des=FLOOR(count/20)*20;
    ELSE SET des=page_offset*20;
    END IF;
    
	SELECT * FROM tangvat,cosoluutrutangvat
    WHERE maTangVat=tangVat.maTangVat
    AND tangvat.coSoLuuTru=cosoluutrutangvat.maCoSo
    ORDER BY tenTangVat
	LIMIT des,20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TongMucPhat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TongMucPhat`(
	in so_qdxphc int
)
BEGIN
	SELECT SUM(mucPhat) as tongMucPhat FROM xuphat WHERE soQDXPHC=so_qdxphc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XoaCanBo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XoaCanBo`(
	in ma_can_bo int
)
BEGIN
	DELETE FROM canbo WHERE maCanBo=ma_can_bo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XoaNguoiViPham` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XoaNguoiViPham`(
	in so_cmnd varchar(12)
)
BEGIN
	DELETE FROM nguoivipham WHERE soCMND=so_cmnd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XoaTangVat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XoaTangVat`(
	in ma_tang_vat int
)
BEGIN
	DELETE FROM tangvat WHERE maTangVat=ma_tang_vat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24 22:12:35
