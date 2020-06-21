/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.24-MariaDB : Database - school_information
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`school_information` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `school_information`;

/*Table structure for table `bus_details` */

DROP TABLE IF EXISTS `bus_details`;

CREATE TABLE `bus_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` set('lady_conductor','driver','male_conductor') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `route_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `lady_cond_id` bigint(20) DEFAULT NULL,
  `male_cond_id` bigint(20) DEFAULT NULL,
  `discription` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BD_BUS_INFO_ID` (`bus_no`),
  KEY `FK_BD_DRIVER_ID` (`driver_id`),
  KEY `FK_BD_MALE_COND_ID` (`male_cond_id`),
  KEY `FK_BD_FEMALE_COND_ID` (`lady_cond_id`),
  CONSTRAINT `FK_BD_DRIVER_ID` FOREIGN KEY (`driver_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BD_FEMALE_COND_ID` FOREIGN KEY (`lady_cond_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BD_MALE_COND_ID` FOREIGN KEY (`male_cond_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bus_details` */

insert  into `bus_details`(`id`,`bus_no`,`type`,`created_at`,`updated_at`,`route_no`,`driver_id`,`lady_cond_id`,`male_cond_id`,`discription`) values 
(12,'MH27AA1234',NULL,'2018-08-31 12:54:14','2018-08-31 12:54:14','Rajapeth',56,58,57,'fewnkj'),
(26,'MH27AB4321',NULL,'2018-08-31 13:06:38','2018-08-31 13:06:38','HVPM',56,58,57,'hgsfjbsk');

/*Table structure for table `bus_info` */

DROP TABLE IF EXISTS `bus_info`;

CREATE TABLE `bus_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `lady_cond_id` bigint(20) DEFAULT NULL,
  `male_cond_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated _at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CK_BINFO_BUSID_DATE` (`bus_id`,`date`),
  KEY `FK_BI_DRIVER_ID` (`driver_id`),
  KEY `FK_BI_FEMALE_COND_ID` (`lady_cond_id`),
  KEY `FK_BI_MALE_COND_ID` (`male_cond_id`),
  CONSTRAINT `FK_BI_BUS_ID` FOREIGN KEY (`bus_id`) REFERENCES `bus_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BI_DRIVER_ID` FOREIGN KEY (`driver_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BI_FEMALE_COND_ID` FOREIGN KEY (`lady_cond_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BI_MALE_COND_ID` FOREIGN KEY (`male_cond_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bus_info` */

/*Table structure for table `bus_stop_details` */

DROP TABLE IF EXISTS `bus_stop_details`;

CREATE TABLE `bus_stop_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) DEFAULT NULL,
  `stop_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stop_time` time DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BSD_BUS_ID` (`bus_id`),
  CONSTRAINT `FK_BSD_BUS_ID` FOREIGN KEY (`bus_id`) REFERENCES `bus_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bus_stop_details` */

insert  into `bus_stop_details`(`id`,`bus_id`,`stop_name`,`stop_time`,`created_at`,`updated_at`,`created_by`,`updated_by`) values 
(17,26,'HVPM','08:00:00','2018-08-31','2018-08-31',NULL,NULL),
(18,12,'Navathe','07:00:00','2018-08-31','2018-08-31',NULL,NULL);

/*Table structure for table `bus_student_linking` */

DROP TABLE IF EXISTS `bus_student_linking`;

CREATE TABLE `bus_student_linking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `stop_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BSL_SDETAILS_ID` (`student_id`),
  KEY `FK_BSL_BINFO_ID` (`bus_id`),
  KEY `bus_student_linling_bus_stop_details_id_fk` (`stop_id`),
  CONSTRAINT `FK_BSL_BINFO_ID` FOREIGN KEY (`bus_id`) REFERENCES `bus_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BSL_STOP_ID` FOREIGN KEY (`stop_id`) REFERENCES `bus_stop_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BSL_STUDENT_ID` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bus_student_linking` */

insert  into `bus_student_linking`(`id`,`bus_id`,`student_id`,`stop_id`,`created_at`,`updated_at`,`created_by`,`updated_by`) values 
(30,26,18,17,'2018-08-31 13:23:27','2018-08-31 13:23:27',NULL,NULL),
(31,26,21,17,'2018-08-31 13:23:27','2018-08-31 13:23:27',NULL,NULL);

/*Table structure for table `bus_teacher_linking` */

DROP TABLE IF EXISTS `bus_teacher_linking`;

CREATE TABLE `bus_teacher_linking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `stop_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BTL_BUS_ID` (`bus_id`),
  KEY `FK_BTL_STAFF_ID` (`staff_id`),
  KEY `FK_BTL_STOP_ID` (`stop_id`),
  CONSTRAINT `FK_BTL_BUS_ID` FOREIGN KEY (`bus_id`) REFERENCES `bus_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BTL_STAFF_ID` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BTL_STOP_ID` FOREIGN KEY (`stop_id`) REFERENCES `bus_stop_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bus_teacher_linking` */

insert  into `bus_teacher_linking`(`id`,`bus_id`,`staff_id`,`stop_id`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(9,26,51,17,NULL,NULL,'2018-08-31 13:24:16','2018-08-31 13:24:16');

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `division` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `school_cat_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CLS_SC_ID` (`school_cat_id`),
  CONSTRAINT `FK_CLS_SC_ID` FOREIGN KEY (`school_cat_id`) REFERENCES `school_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `classes` */

insert  into `classes`(`id`,`class_name`,`division`,`school_cat_id`,`created_at`,`updated_at`) values 
(22,'6','A',1,'2018-07-25 11:40:39','2018-07-25 11:40:39'),
(23,'6','B',1,'2018-07-25 11:40:42','2018-07-25 11:40:42'),
(25,'7','A',2,'2018-07-25 11:41:19','2018-07-25 11:41:19'),
(37,'5','D',2,'2018-08-14 08:10:05','2018-08-14 08:10:05'),
(38,'2','B',NULL,'2019-01-03 06:48:27','2019-01-03 06:48:27'),
(39,'2','C',NULL,'2019-01-03 07:01:25','2019-01-03 07:01:25');

/*Table structure for table `designation` */

DROP TABLE IF EXISTS `designation`;

CREATE TABLE `designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designation` */

insert  into `designation`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'Teacher',NULL,NULL),
(2,'Housekeeper',NULL,NULL),
(3,'Security Guard',NULL,NULL),
(4,'Bus Driver',NULL,NULL),
(5,'Male Conductor',NULL,NULL),
(6,'Female Conductor',NULL,NULL),
(7,'Guest',NULL,NULL),
(8,'Administer',NULL,NULL),
(9,'Bus',NULL,NULL);

/*Table structure for table `guest_details` */

DROP TABLE IF EXISTS `guest_details`;

CREATE TABLE `guest_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guest_first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guest_last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `whom_to_meet` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purpose_of_meet` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arrived_date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `rfid` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `in_statues` tinyint(1) DEFAULT '1',
  `out_statues` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_GD_STAFF_ID` (`created_by`),
  KEY `FK_GUSTD_STAFF_ID` (`updated_by`),
  CONSTRAINT `FK_GD_STAFF_ID` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`),
  CONSTRAINT `FK_GUSTD_STAFF_ID` FOREIGN KEY (`updated_by`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `guest_details` */

insert  into `guest_details`(`id`,`guest_first_name`,`guest_last_name`,`mobile`,`email_id`,`whom_to_meet`,`address`,`city`,`purpose_of_meet`,`arrived_date`,`in_time`,`out_time`,`rfid`,`photo`,`created_at`,`updated_at`,`created_by`,`updated_by`,`in_statues`,`out_statues`) values 
(4,'Rasika','Deshmukh','9898989898',NULL,'Principal','Sadar','Nagpur','Meeting','2018-08-16','17:53:55','17:54:25','0004112039','iSwdC4cp9Tkvt65Nqy64A5Wap1GSpesD7HmDWKFf.jpeg','2018-08-16','2018-08-16',NULL,NULL,1,1),
(5,'Gunjan','Mehta','9799797979',NULL,'Teacher','Rajapeth','Amravati','Complaint','2018-08-16','17:55:56','17:56:19','0004112039','uNdl0M2nRVFgX9UmSCKOwh7XHUBhy54Y9Qk0CiLZ.jpeg','2018-08-16','2018-08-16',NULL,NULL,1,1),
(6,'Prasad','Kadu','9867678657',NULL,'Class Teacher','Nawathe','Amravati','Meeting','2018-08-16','18:21:56','18:27:06','0003995049','QvxQ8oXMDo6daM5kupyhhLpDlDp0OlbvDuXE8MPQ.webp','2018-08-16','2018-08-16',NULL,NULL,1,1),
(7,'Prasad','Kadu','9867678657',NULL,'Teacher','Nawathe','Amaravti','Meeting','2018-08-16','18:46:07','18:49:16','0003995049','ZdnV3jT6SsHCGQunCnrUItiqNpNjUDwgSpNoC6Jb.jpeg','2018-08-16','2018-08-16',NULL,NULL,1,1),
(8,'Rasika','Deshmukh','9898989898',NULL,'Principal','Sadar','Amravati','Meeting','2018-08-17','11:16:02','11:17:24','0004112039','ZJF1ZClVea6Bktk5mhwxRmiEniF2BU8k6M229bHi.jpeg','2018-08-17','2018-08-17',NULL,NULL,1,1),
(9,'Nikhil','Deshmukh','9876543210',NULL,'Teacher(Prasad Kadu)','Ravi nagar, Nagpur','Nagpur','About child','2018-08-18','16:22:35','17:34:11','0003995049','RFLl3JwUuF5dBA8oAuATnRD4BoURB6mwBuUWwnsm.jpeg','2018-08-18','2018-08-18',NULL,NULL,1,1),
(10,'Piyush','Raurase','9856471230',NULL,'Teacher','Shivam colony','Amravati','meeting','2018-08-18','17:46:57',NULL,'003995049','EtlpBGNU2JgVmYkFgFMuUsDJZkRwo6CtgKyu5a5S.jpeg','2018-08-18','2018-08-18',NULL,NULL,1,0);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `designation_id` bigint(20) NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  `gender` set('male','female','others') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_STAFF_DESG_ID` (`designation_id`),
  CONSTRAINT `FK_STAFF_DESG_ID` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `staff` */

insert  into `staff`(`id`,`first_name`,`last_name`,`designation_id`,`date_of_joining`,`gender`,`mobile_no`,`email_id`,`qualification`,`address`,`updated_at`,`created_at`,`password`) values 
(1,'Akshay','Deshmukh',1,'2018-06-02','male','+919405430795','gmail','dfgh','Ghanshyam Nagar, Saturna ,Amravati.','2018-07-11 05:59:03','2018-06-29 19:44:22',NULL),
(2,'Bus','Driver 1',4,'2015-09-24','female','7845165416','asdf','sdf','qwe rty','2018-07-11 12:54:43','2018-07-02 10:54:28',NULL),
(3,'Male','Conductor 1',5,'2018-01-15','male','12345678','sdfgh','asdfgyu','dfghjkl','2018-07-02 10:55:09','2018-07-02 10:55:09',NULL),
(4,'Female','Conductor 1',6,'2015-03-16','female','98765432','lkjhgfds','nbvcx','jhgcxz','2018-07-02 10:55:54','2018-07-02 10:55:54',NULL),
(5,'Teacher','1',1,'2018-06-04','male','65436789','jcfhbt','jhngfv','hjnbgfvc','2018-07-02 10:56:44','2018-07-02 10:56:44',NULL),
(6,'Bus','Driver 2',4,'2018-01-01','male','87654','jhgfds','jhngfvc','jhgfbvd','2018-07-02 10:57:47','2018-07-02 10:57:47',NULL),
(7,'Gaurav','Nakhale',5,'2018-07-03','male','1234567765','hewgh','jgrgr','gejsj','2018-07-14 07:33:16','2018-07-14 07:33:16',NULL),
(10,'Pratyush','Manakar',1,'2018-07-13','male','6656515616','dfghjk','dfghj','fvgbhjk','2018-07-14 08:19:26','2018-07-14 07:52:58',NULL),
(11,'Female','Conductor',6,'2018-07-01','female','1234567890','femaleconductor2@gmail.com','None','new address','2018-07-21 08:35:20','2018-07-21 08:35:20',NULL),
(12,'Abdul','Naim',1,'2018-07-21','male','9665633211','abdulnaim009@gmail.com','B.E.','Habib Nagar','2018-07-21 09:27:24','2018-07-21 09:27:24',NULL);

/*Table structure for table `staff_attendance` */

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) DEFAULT NULL,
  `bus_in` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gate_in` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bus_out` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gate_out` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `statues` bigint(20) DEFAULT NULL,
  `in_statues` bigint(20) DEFAULT NULL,
  `out_statues` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `late_attendance` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CK_SA_STAFF_DATE_ID` (`staff_id`),
  KEY `FK_STAFF_AT_STAFF_ID` (`updated_by`),
  CONSTRAINT `FK_STAFF_AT_STAFF_ID` FOREIGN KEY (`updated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TATTENDANCE_STAFF_ID` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `staff_attendance` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `gender` set('girl','boy') COLLATE utf8_unicode_ci DEFAULT NULL,
  `blood_group` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL,
  `religion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caste` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corr_address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corr_area` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanant_address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `mothers_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aadhar_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_reg_no` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_school` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roll_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_STUD_CLASS_ID` (`class_id`),
  CONSTRAINT `FK_STUD_CLASS_ID` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`class_id`,`first_name`,`last_name`,`gender`,`blood_group`,`dob`,`photo`,`date_of_admission`,`religion`,`caste`,`corr_address`,`corr_area`,`permanant_address`,`created_at`,`updated_at`,`created_by`,`updated_by`,`mothers_name`,`fathers_name`,`category`,`aadhar_no`,`admission_reg_no`,`last_school`,`roll_no`) values 
(7,8,'Uddeshya','Aharwar','boy','AB+','1998-03-04','C:\\xampp\\tmp\\phpAE2.tmp','2018-07-16','Hindu','Maratha','kjhgfd','Nawathe','jhgfd','2018-07-06 08:04:34','2018-07-21 20:21:14',NULL,NULL,'Babita','Ravi','SC','1234567','6461','1fghtgh','1'),
(8,4,'Yash','Shinde','boy','AB-','2018-07-11','C:\\xampp\\tmp\\php9F91.tmp','2018-07-18','Hindu','Brahmin','zxcv erty','Sainagar','cvbn dfrgty','2018-07-13 14:48:34','2018-07-13 14:48:34',NULL,NULL,'iuy','asd','OPEN','1235646889','23456','sdfghj','2'),
(9,5,'Gaurav','Dhanuka','boy','A+','2018-07-01','C:\\xampp\\tmp\\php9925.tmp','2018-07-03','Hindu','Brahmin','vdh,','Sainagar','vhdsb','2018-07-13 20:02:01','2018-07-13 20:03:43',NULL,NULL,'sdfghj','qwerty','OPEN','466464644484','5526','shfjja','3'),
(10,4,'Akshay','Deshmukh','boy','AB+','2018-07-13','C:\\xampp\\tmp\\php7C7A.tmp','2018-07-04','Hindu','gfgyu','Ghanshyam Nagar, Saturna ,Amravati.','hvpm','Ghanshyam Nagar, Saturna ,Amravati.','2018-07-21 13:55:47','2018-07-21 13:55:47',NULL,NULL,'nvcm','sfhff','OBC','123456789552','42254284','Manibai','4');

/*Table structure for table `student_class_attendance` */

DROP TABLE IF EXISTS `student_class_attendance`;

CREATE TABLE `student_class_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `statues` bigint(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CK_SCA_DATE_ID` (`student_id`,`date`),
  KEY `FK_SCA_CLASS_ID` (`class_id`),
  KEY `FK_SCA_STU_DETAILS_ID` (`student_id`),
  KEY `FK_SCA_STAFF_ID` (`staff_id`),
  CONSTRAINT `FK_SCA_CLASS_ID` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SCA_STAFF_ID` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SCA_STU_DETAILS_ID` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `student_class_attendance` */

/*Table structure for table `student_details` */

DROP TABLE IF EXISTS `student_details`;

CREATE TABLE `student_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL,
  `guardian_first_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `guardian_last_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `relation_with_child` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` set('male','female','others') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_prefered` set('hindi','english','marathi') COLLATE utf8_unicode_ci DEFAULT NULL,
  `proffesion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landline_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `office_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_mobile_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_mobile_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aadhar_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SD_STUD_ID` (`student_id`),
  CONSTRAINT `FK_SD_STUD_ID` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `student_details` */

insert  into `student_details`(`id`,`student_id`,`guardian_first_name`,`guardian_last_name`,`relation_with_child`,`gender`,`mobile_no`,`email_id`,`language_prefered`,`proffesion`,`landline_no`,`created_by`,`updated_by`,`created_at`,`updated_at`,`office_address`,`fathers_mobile_no`,`mothers_mobile_no`,`aadhar_no`) values 
(5,7,'zxcv','asd','Uncle',NULL,NULL,'sdfgyhji','marathi','edrfghujk',NULL,NULL,NULL,'2018-07-06 08:04:34','2018-07-21 20:23:11','ds','23456','2345678','1234567'),
(6,8,'zxc','zxcv','Father',NULL,NULL,'asdfg','hindi','sdfghj','1234',NULL,NULL,'2018-07-13 14:48:35','2018-07-13 14:48:35','zxcv','2345678','123456','452354'),
(7,9,'feag','gyums','Father',NULL,NULL,'skfkjfs@jf.','hindi','gjhygjhg','46666',NULL,NULL,'2018-07-13 20:02:02','2018-07-13 20:23:33','sdf','6646684651','4646846468','466464644484'),
(8,10,'Akshay','deshmukh','Father',NULL,NULL,'akshay@gmail.com','hindi','gduufy','Mahārāshtra',NULL,NULL,'2018-07-21 13:55:47','2018-07-21 13:55:47','Ghanshyam Nagar, Saturna ,Amravati.','9405430795','9405430795','123456789123');

/*Table structure for table `student_entry_attendance` */

DROP TABLE IF EXISTS `student_entry_attendance`;

CREATE TABLE `student_entry_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bus_in` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gate_in` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bus_out` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gate_out` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `in_statues` bigint(20) DEFAULT NULL,
  `out_statues` bigint(20) DEFAULT NULL,
  `late_attendance` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CK_SEA_STUD_DATE_ID` (`student_id`,`date`),
  KEY `FK_SEA_STUDENT_ID` (`student_id`),
  KEY `FK_SEA_STAFF_ID` (`update_by`),
  CONSTRAINT `FK_SEA_STAFF_ID` FOREIGN KEY (`update_by`) REFERENCES `staff` (`id`),
  CONSTRAINT `FK_SEA_STUDENT_ID` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `student_entry_attendance` */

/*Table structure for table `time_dimension` */

DROP TABLE IF EXISTS `time_dimension`;

CREATE TABLE `time_dimension` (
  `id` int(11) NOT NULL,
  `db_date` date NOT NULL,
  `YEAR` int(11) NOT NULL,
  `MONTH` int(11) NOT NULL,
  `DAY` int(11) NOT NULL,
  `QUARTER` int(11) NOT NULL,
  `WEEK` int(11) NOT NULL,
  `day_name` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `month_name` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `holiday_flag` char(1) COLLATE utf8_unicode_ci DEFAULT 'f',
  `weekend_flag` char(1) COLLATE utf8_unicode_ci DEFAULT 'f',
  `EVENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `td_ymd_idx` (`YEAR`,`MONTH`,`DAY`),
  UNIQUE KEY `td_dbdate_idx` (`db_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `time_dimension` */

insert  into `time_dimension`(`id`,`db_date`,`YEAR`,`MONTH`,`DAY`,`QUARTER`,`WEEK`,`day_name`,`month_name`,`holiday_flag`,`weekend_flag`,`EVENT`,`updated_at`,`created_at`) values 
(20180101,'2018-01-01',2018,1,1,1,1,'Monday','January','f','f',NULL,NULL,NULL),
(20180102,'2018-01-02',2018,1,2,1,1,'Tuesday','January','f','f',NULL,NULL,NULL),
(20180103,'2018-01-03',2018,1,3,1,1,'Wednesday','January','f','f',NULL,NULL,NULL),
(20180104,'2018-01-04',2018,1,4,1,1,'Thursday','January','f','f',NULL,NULL,NULL),
(20180105,'2018-01-05',2018,1,5,1,1,'Friday','January','f','f',NULL,NULL,NULL),
(20180106,'2018-01-06',2018,1,6,1,1,'Saturday','January','f','f',NULL,NULL,NULL),
(20180107,'2018-01-07',2018,1,7,1,1,'Sunday','January','f','t',NULL,NULL,NULL),
(20180108,'2018-01-08',2018,1,8,1,2,'Monday','January','f','f',NULL,NULL,NULL),
(20180109,'2018-01-09',2018,1,9,1,2,'Tuesday','January','f','f',NULL,NULL,NULL),
(20180110,'2018-01-10',2018,1,10,1,2,'Wednesday','January','f','f',NULL,NULL,NULL),
(20180111,'2018-01-11',2018,1,11,1,2,'Thursday','January','f','f',NULL,NULL,NULL),
(20180112,'2018-01-12',2018,1,12,1,2,'Friday','January','f','f',NULL,NULL,NULL),
(20180113,'2018-01-13',2018,1,13,1,2,'Saturday','January','f','f',NULL,NULL,NULL),
(20180114,'2018-01-14',2018,1,14,1,2,'Sunday','January','f','t',NULL,NULL,NULL),
(20180115,'2018-01-15',2018,1,15,1,3,'Monday','January','f','f',NULL,NULL,NULL),
(20180116,'2018-01-16',2018,1,16,1,3,'Tuesday','January','f','f',NULL,NULL,NULL),
(20180117,'2018-01-17',2018,1,17,1,3,'Wednesday','January','f','f',NULL,NULL,NULL),
(20180118,'2018-01-18',2018,1,18,1,3,'Thursday','January','f','f',NULL,NULL,NULL),
(20180119,'2018-01-19',2018,1,19,1,3,'Friday','January','f','f',NULL,NULL,NULL),
(20180120,'2018-01-20',2018,1,20,1,3,'Saturday','January','f','f',NULL,NULL,NULL),
(20180121,'2018-01-21',2018,1,21,1,3,'Sunday','January','f','t',NULL,NULL,NULL),
(20180122,'2018-01-22',2018,1,22,1,4,'Monday','January','f','f',NULL,NULL,NULL),
(20180123,'2018-01-23',2018,1,23,1,4,'Tuesday','January','f','f',NULL,NULL,NULL),
(20180124,'2018-01-24',2018,1,24,1,4,'Wednesday','January','f','f',NULL,NULL,NULL),
(20180125,'2018-01-25',2018,1,25,1,4,'Thursday','January','f','f',NULL,NULL,NULL),
(20180126,'2018-01-26',2018,1,26,1,4,'Friday','January','f','f',NULL,NULL,NULL),
(20180127,'2018-01-27',2018,1,27,1,4,'Saturday','January','f','f',NULL,NULL,NULL),
(20180128,'2018-01-28',2018,1,28,1,4,'Sunday','January','f','t',NULL,NULL,NULL),
(20180129,'2018-01-29',2018,1,29,1,5,'Monday','January','f','f',NULL,NULL,NULL),
(20180130,'2018-01-30',2018,1,30,1,5,'Tuesday','January','f','f',NULL,NULL,NULL),
(20180131,'2018-01-31',2018,1,31,1,5,'Wednesday','January','f','f',NULL,NULL,NULL),
(20180201,'2018-02-01',2018,2,1,1,5,'Thursday','February','f','f',NULL,NULL,NULL),
(20180202,'2018-02-02',2018,2,2,1,5,'Friday','February','f','f',NULL,NULL,NULL),
(20180203,'2018-02-03',2018,2,3,1,5,'Saturday','February','f','f',NULL,NULL,NULL),
(20180204,'2018-02-04',2018,2,4,1,5,'Sunday','February','f','t',NULL,NULL,NULL),
(20180205,'2018-02-05',2018,2,5,1,6,'Monday','February','f','f',NULL,NULL,NULL),
(20180206,'2018-02-06',2018,2,6,1,6,'Tuesday','February','f','f',NULL,NULL,NULL),
(20180207,'2018-02-07',2018,2,7,1,6,'Wednesday','February','f','f',NULL,NULL,NULL),
(20180208,'2018-02-08',2018,2,8,1,6,'Thursday','February','f','f',NULL,NULL,NULL),
(20180209,'2018-02-09',2018,2,9,1,6,'Friday','February','f','f',NULL,NULL,NULL),
(20180210,'2018-02-10',2018,2,10,1,6,'Saturday','February','f','f',NULL,NULL,NULL),
(20180211,'2018-02-11',2018,2,11,1,6,'Sunday','February','f','t',NULL,NULL,NULL),
(20180212,'2018-02-12',2018,2,12,1,7,'Monday','February','f','f',NULL,NULL,NULL),
(20180213,'2018-02-13',2018,2,13,1,7,'Tuesday','February','f','f',NULL,NULL,NULL),
(20180214,'2018-02-14',2018,2,14,1,7,'Wednesday','February','f','f',NULL,NULL,NULL),
(20180215,'2018-02-15',2018,2,15,1,7,'Thursday','February','f','f',NULL,NULL,NULL),
(20180216,'2018-02-16',2018,2,16,1,7,'Friday','February','f','f',NULL,NULL,NULL),
(20180217,'2018-02-17',2018,2,17,1,7,'Saturday','February','f','f',NULL,NULL,NULL),
(20180218,'2018-02-18',2018,2,18,1,7,'Sunday','February','f','t',NULL,NULL,NULL),
(20180219,'2018-02-19',2018,2,19,1,8,'Monday','February','f','f',NULL,NULL,NULL),
(20180220,'2018-02-20',2018,2,20,1,8,'Tuesday','February','f','f',NULL,NULL,NULL),
(20180221,'2018-02-21',2018,2,21,1,8,'Wednesday','February','f','f',NULL,NULL,NULL),
(20180222,'2018-02-22',2018,2,22,1,8,'Thursday','February','f','f',NULL,NULL,NULL),
(20180223,'2018-02-23',2018,2,23,1,8,'Friday','February','f','f',NULL,NULL,NULL),
(20180224,'2018-02-24',2018,2,24,1,8,'Saturday','February','f','f',NULL,NULL,NULL),
(20180225,'2018-02-25',2018,2,25,1,8,'Sunday','February','f','t',NULL,NULL,NULL),
(20180226,'2018-02-26',2018,2,26,1,9,'Monday','February','f','f',NULL,NULL,NULL),
(20180227,'2018-02-27',2018,2,27,1,9,'Tuesday','February','f','f',NULL,NULL,NULL),
(20180228,'2018-02-28',2018,2,28,1,9,'Wednesday','February','f','f',NULL,NULL,NULL),
(20180301,'2018-03-01',2018,3,1,1,9,'Thursday','March','f','f',NULL,NULL,NULL),
(20180302,'2018-03-02',2018,3,2,1,9,'Friday','March','f','f',NULL,NULL,NULL),
(20180303,'2018-03-03',2018,3,3,1,9,'Saturday','March','f','f',NULL,NULL,NULL),
(20180304,'2018-03-04',2018,3,4,1,9,'Sunday','March','f','t',NULL,NULL,NULL),
(20180305,'2018-03-05',2018,3,5,1,10,'Monday','March','f','f',NULL,NULL,NULL),
(20180306,'2018-03-06',2018,3,6,1,10,'Tuesday','March','f','f',NULL,NULL,NULL),
(20180307,'2018-03-07',2018,3,7,1,10,'Wednesday','March','f','f',NULL,NULL,NULL),
(20180308,'2018-03-08',2018,3,8,1,10,'Thursday','March','f','f',NULL,NULL,NULL),
(20180309,'2018-03-09',2018,3,9,1,10,'Friday','March','f','f',NULL,NULL,NULL),
(20180310,'2018-03-10',2018,3,10,1,10,'Saturday','March','f','f',NULL,NULL,NULL),
(20180311,'2018-03-11',2018,3,11,1,10,'Sunday','March','f','t',NULL,NULL,NULL),
(20180312,'2018-03-12',2018,3,12,1,11,'Monday','March','f','f',NULL,NULL,NULL),
(20180313,'2018-03-13',2018,3,13,1,11,'Tuesday','March','f','f',NULL,NULL,NULL),
(20180314,'2018-03-14',2018,3,14,1,11,'Wednesday','March','f','f',NULL,NULL,NULL),
(20180315,'2018-03-15',2018,3,15,1,11,'Thursday','March','f','f',NULL,NULL,NULL),
(20180316,'2018-03-16',2018,3,16,1,11,'Friday','March','f','f',NULL,NULL,NULL),
(20180317,'2018-03-17',2018,3,17,1,11,'Saturday','March','f','f',NULL,NULL,NULL),
(20180318,'2018-03-18',2018,3,18,1,11,'Sunday','March','f','t',NULL,NULL,NULL),
(20180319,'2018-03-19',2018,3,19,1,12,'Monday','March','f','f',NULL,NULL,NULL),
(20180320,'2018-03-20',2018,3,20,1,12,'Tuesday','March','f','f',NULL,NULL,NULL),
(20180321,'2018-03-21',2018,3,21,1,12,'Wednesday','March','f','f',NULL,NULL,NULL),
(20180322,'2018-03-22',2018,3,22,1,12,'Thursday','March','f','f',NULL,NULL,NULL),
(20180323,'2018-03-23',2018,3,23,1,12,'Friday','March','f','f',NULL,NULL,NULL),
(20180324,'2018-03-24',2018,3,24,1,12,'Saturday','March','f','f',NULL,NULL,NULL),
(20180325,'2018-03-25',2018,3,25,1,12,'Sunday','March','f','t',NULL,NULL,NULL),
(20180326,'2018-03-26',2018,3,26,1,13,'Monday','March','f','f',NULL,NULL,NULL),
(20180327,'2018-03-27',2018,3,27,1,13,'Tuesday','March','f','f',NULL,NULL,NULL),
(20180328,'2018-03-28',2018,3,28,1,13,'Wednesday','March','f','f',NULL,NULL,NULL),
(20180329,'2018-03-29',2018,3,29,1,13,'Thursday','March','f','f',NULL,NULL,NULL),
(20180330,'2018-03-30',2018,3,30,1,13,'Friday','March','f','f',NULL,NULL,NULL),
(20180331,'2018-03-31',2018,3,31,1,13,'Saturday','March','f','f',NULL,NULL,NULL),
(20180401,'2018-04-01',2018,4,1,2,13,'Sunday','April','f','t',NULL,NULL,NULL),
(20180402,'2018-04-02',2018,4,2,2,14,'Monday','April','f','f',NULL,NULL,NULL),
(20180403,'2018-04-03',2018,4,3,2,14,'Tuesday','April','f','f',NULL,NULL,NULL),
(20180404,'2018-04-04',2018,4,4,2,14,'Wednesday','April','f','f',NULL,NULL,NULL),
(20180405,'2018-04-05',2018,4,5,2,14,'Thursday','April','f','f',NULL,NULL,NULL),
(20180406,'2018-04-06',2018,4,6,2,14,'Friday','April','f','f',NULL,NULL,NULL),
(20180407,'2018-04-07',2018,4,7,2,14,'Saturday','April','f','f',NULL,NULL,NULL),
(20180408,'2018-04-08',2018,4,8,2,14,'Sunday','April','f','t',NULL,NULL,NULL),
(20180409,'2018-04-09',2018,4,9,2,15,'Monday','April','f','f',NULL,NULL,NULL),
(20180410,'2018-04-10',2018,4,10,2,15,'Tuesday','April','f','f',NULL,NULL,NULL),
(20180411,'2018-04-11',2018,4,11,2,15,'Wednesday','April','f','f',NULL,NULL,NULL),
(20180412,'2018-04-12',2018,4,12,2,15,'Thursday','April','f','f',NULL,NULL,NULL),
(20180413,'2018-04-13',2018,4,13,2,15,'Friday','April','f','f',NULL,NULL,NULL),
(20180414,'2018-04-14',2018,4,14,2,15,'Saturday','April','f','f',NULL,NULL,NULL),
(20180415,'2018-04-15',2018,4,15,2,15,'Sunday','April','f','t',NULL,NULL,NULL),
(20180416,'2018-04-16',2018,4,16,2,16,'Monday','April','f','f',NULL,NULL,NULL),
(20180417,'2018-04-17',2018,4,17,2,16,'Tuesday','April','f','f',NULL,NULL,NULL),
(20180418,'2018-04-18',2018,4,18,2,16,'Wednesday','April','f','f',NULL,NULL,NULL),
(20180419,'2018-04-19',2018,4,19,2,16,'Thursday','April','f','f',NULL,NULL,NULL),
(20180420,'2018-04-20',2018,4,20,2,16,'Friday','April','f','f',NULL,NULL,NULL),
(20180421,'2018-04-21',2018,4,21,2,16,'Saturday','April','f','f',NULL,NULL,NULL),
(20180422,'2018-04-22',2018,4,22,2,16,'Sunday','April','f','t',NULL,NULL,NULL),
(20180423,'2018-04-23',2018,4,23,2,17,'Monday','April','f','f',NULL,NULL,NULL),
(20180424,'2018-04-24',2018,4,24,2,17,'Tuesday','April','f','f',NULL,NULL,NULL),
(20180425,'2018-04-25',2018,4,25,2,17,'Wednesday','April','f','f',NULL,NULL,NULL),
(20180426,'2018-04-26',2018,4,26,2,17,'Thursday','April','f','f',NULL,NULL,NULL),
(20180427,'2018-04-27',2018,4,27,2,17,'Friday','April','f','f',NULL,NULL,NULL),
(20180428,'2018-04-28',2018,4,28,2,17,'Saturday','April','f','f',NULL,NULL,NULL),
(20180429,'2018-04-29',2018,4,29,2,17,'Sunday','April','f','t',NULL,NULL,NULL),
(20180430,'2018-04-30',2018,4,30,2,18,'Monday','April','f','f',NULL,NULL,NULL),
(20180501,'2018-05-01',2018,5,1,2,18,'Tuesday','May','f','f',NULL,NULL,NULL),
(20180502,'2018-05-02',2018,5,2,2,18,'Wednesday','May','f','f',NULL,NULL,NULL),
(20180503,'2018-05-03',2018,5,3,2,18,'Thursday','May','f','f',NULL,NULL,NULL),
(20180504,'2018-05-04',2018,5,4,2,18,'Friday','May','f','f',NULL,NULL,NULL),
(20180505,'2018-05-05',2018,5,5,2,18,'Saturday','May','f','f',NULL,NULL,NULL),
(20180506,'2018-05-06',2018,5,6,2,18,'Sunday','May','f','t',NULL,NULL,NULL),
(20180507,'2018-05-07',2018,5,7,2,19,'Monday','May','f','f',NULL,NULL,NULL),
(20180508,'2018-05-08',2018,5,8,2,19,'Tuesday','May','f','f',NULL,NULL,NULL),
(20180509,'2018-05-09',2018,5,9,2,19,'Wednesday','May','f','f',NULL,NULL,NULL),
(20180510,'2018-05-10',2018,5,10,2,19,'Thursday','May','f','f',NULL,NULL,NULL),
(20180511,'2018-05-11',2018,5,11,2,19,'Friday','May','f','f',NULL,NULL,NULL),
(20180512,'2018-05-12',2018,5,12,2,19,'Saturday','May','f','f',NULL,NULL,NULL),
(20180513,'2018-05-13',2018,5,13,2,19,'Sunday','May','f','t',NULL,NULL,NULL),
(20180514,'2018-05-14',2018,5,14,2,20,'Monday','May','f','f',NULL,NULL,NULL),
(20180515,'2018-05-15',2018,5,15,2,20,'Tuesday','May','f','f',NULL,NULL,NULL),
(20180516,'2018-05-16',2018,5,16,2,20,'Wednesday','May','f','f',NULL,NULL,NULL),
(20180517,'2018-05-17',2018,5,17,2,20,'Thursday','May','f','f',NULL,NULL,NULL),
(20180518,'2018-05-18',2018,5,18,2,20,'Friday','May','f','f',NULL,NULL,NULL),
(20180519,'2018-05-19',2018,5,19,2,20,'Saturday','May','f','f',NULL,NULL,NULL),
(20180520,'2018-05-20',2018,5,20,2,20,'Sunday','May','f','t',NULL,NULL,NULL),
(20180521,'2018-05-21',2018,5,21,2,21,'Monday','May','f','f',NULL,NULL,NULL),
(20180522,'2018-05-22',2018,5,22,2,21,'Tuesday','May','f','f',NULL,NULL,NULL),
(20180523,'2018-05-23',2018,5,23,2,21,'Wednesday','May','f','f',NULL,NULL,NULL),
(20180524,'2018-05-24',2018,5,24,2,21,'Thursday','May','f','f',NULL,NULL,NULL),
(20180525,'2018-05-25',2018,5,25,2,21,'Friday','May','f','f',NULL,NULL,NULL),
(20180526,'2018-05-26',2018,5,26,2,21,'Saturday','May','f','f',NULL,NULL,NULL),
(20180527,'2018-05-27',2018,5,27,2,21,'Sunday','May','f','t',NULL,NULL,NULL),
(20180528,'2018-05-28',2018,5,28,2,22,'Monday','May','f','f',NULL,NULL,NULL),
(20180529,'2018-05-29',2018,5,29,2,22,'Tuesday','May','f','f',NULL,NULL,NULL),
(20180530,'2018-05-30',2018,5,30,2,22,'Wednesday','May','f','f',NULL,NULL,NULL),
(20180531,'2018-05-31',2018,5,31,2,22,'Thursday','May','f','f',NULL,NULL,NULL),
(20180601,'2018-06-01',2018,6,1,2,22,'Friday','June','f','f',NULL,NULL,NULL),
(20180602,'2018-06-02',2018,6,2,2,22,'Saturday','June','f','f',NULL,NULL,NULL),
(20180603,'2018-06-03',2018,6,3,2,22,'Sunday','June','f','t',NULL,NULL,NULL),
(20180604,'2018-06-04',2018,6,4,2,23,'Monday','June','f','f',NULL,NULL,NULL),
(20180605,'2018-06-05',2018,6,5,2,23,'Tuesday','June','f','f',NULL,NULL,NULL),
(20180606,'2018-06-06',2018,6,6,2,23,'Wednesday','June','f','f',NULL,NULL,NULL),
(20180607,'2018-06-07',2018,6,7,2,23,'Thursday','June','f','f',NULL,NULL,NULL),
(20180608,'2018-06-08',2018,6,8,2,23,'Friday','June','f','f',NULL,NULL,NULL),
(20180609,'2018-06-09',2018,6,9,2,23,'Saturday','June','f','f',NULL,NULL,NULL),
(20180610,'2018-06-10',2018,6,10,2,23,'Sunday','June','f','t',NULL,NULL,NULL),
(20180611,'2018-06-11',2018,6,11,2,24,'Monday','June','f','f',NULL,NULL,NULL),
(20180612,'2018-06-12',2018,6,12,2,24,'Tuesday','June','f','f',NULL,NULL,NULL),
(20180613,'2018-06-13',2018,6,13,2,24,'Wednesday','June','f','f',NULL,NULL,NULL),
(20180614,'2018-06-14',2018,6,14,2,24,'Thursday','June','f','f',NULL,NULL,NULL),
(20180615,'2018-06-15',2018,6,15,2,24,'Friday','June','f','f',NULL,NULL,NULL),
(20180616,'2018-06-16',2018,6,16,2,24,'Saturday','June','f','f',NULL,NULL,NULL),
(20180617,'2018-06-17',2018,6,17,2,24,'Sunday','June','f','t',NULL,NULL,NULL),
(20180618,'2018-06-18',2018,6,18,2,25,'Monday','June','f','f',NULL,NULL,NULL),
(20180619,'2018-06-19',2018,6,19,2,25,'Tuesday','June','f','f',NULL,NULL,NULL),
(20180620,'2018-06-20',2018,6,20,2,25,'Wednesday','June','f','f',NULL,NULL,NULL),
(20180621,'2018-06-21',2018,6,21,2,25,'Thursday','June','f','f',NULL,NULL,NULL),
(20180622,'2018-06-22',2018,6,22,2,25,'Friday','June','f','f',NULL,NULL,NULL),
(20180623,'2018-06-23',2018,6,23,2,25,'Saturday','June','f','f',NULL,NULL,NULL),
(20180624,'2018-06-24',2018,6,24,2,25,'Sunday','June','f','t',NULL,NULL,NULL),
(20180625,'2018-06-25',2018,6,25,2,26,'Monday','June','f','f',NULL,NULL,NULL),
(20180626,'2018-06-26',2018,6,26,2,26,'Tuesday','June','f','f',NULL,NULL,NULL),
(20180627,'2018-06-27',2018,6,27,2,26,'Wednesday','June','f','f',NULL,NULL,NULL),
(20180628,'2018-06-28',2018,6,28,2,26,'Thursday','June','f','f',NULL,NULL,NULL),
(20180629,'2018-06-29',2018,6,29,2,26,'Friday','June','f','f',NULL,NULL,NULL),
(20180630,'2018-06-30',2018,6,30,2,26,'Saturday','June','f','f',NULL,NULL,NULL),
(20180701,'2018-07-01',2018,7,1,3,26,'Sunday','July','f','t',NULL,NULL,NULL),
(20180702,'2018-07-02',2018,7,2,3,27,'Monday','July','f','f',NULL,NULL,NULL),
(20180703,'2018-07-03',2018,7,3,3,27,'Tuesday','July','f','f',NULL,NULL,NULL),
(20180704,'2018-07-04',2018,7,4,3,27,'Wednesday','July','f','f',NULL,NULL,NULL),
(20180705,'2018-07-05',2018,7,5,3,27,'Thursday','July','f','f',NULL,NULL,NULL),
(20180706,'2018-07-06',2018,7,6,3,27,'Friday','July','f','f',NULL,NULL,NULL),
(20180707,'2018-07-07',2018,7,7,3,27,'Saturday','July','f','f',NULL,NULL,NULL),
(20180708,'2018-07-08',2018,7,8,3,27,'Sunday','July','f','t',NULL,NULL,NULL),
(20180709,'2018-07-09',2018,7,9,3,28,'Monday','July','f','f',NULL,NULL,NULL),
(20180710,'2018-07-10',2018,7,10,3,28,'Tuesday','July','f','f',NULL,NULL,NULL),
(20180711,'2018-07-11',2018,7,11,3,28,'Wednesday','July','f','f',NULL,NULL,NULL),
(20180712,'2018-07-12',2018,7,12,3,28,'Thursday','July','f','f',NULL,NULL,NULL),
(20180713,'2018-07-13',2018,7,13,3,28,'Friday','July','f','f',NULL,NULL,NULL),
(20180714,'2018-07-14',2018,7,14,3,28,'Saturday','July','f','f',NULL,NULL,NULL),
(20180715,'2018-07-15',2018,7,15,3,28,'Sunday','July','f','t',NULL,NULL,NULL),
(20180716,'2018-07-16',2018,7,16,3,29,'Monday','July','f','f',NULL,NULL,NULL),
(20180717,'2018-07-17',2018,7,17,3,29,'Tuesday','July','f','f',NULL,NULL,NULL),
(20180718,'2018-07-18',2018,7,18,3,29,'Wednesday','July','f','f',NULL,NULL,NULL),
(20180719,'2018-07-19',2018,7,19,3,29,'Thursday','July','f','f',NULL,NULL,NULL),
(20180720,'2018-07-20',2018,7,20,3,29,'Friday','July','f','f',NULL,NULL,NULL),
(20180721,'2018-07-21',2018,7,21,3,29,'Saturday','July','f','f',NULL,NULL,NULL),
(20180722,'2018-07-22',2018,7,22,3,29,'Sunday','July','f','t',NULL,NULL,NULL),
(20180723,'2018-07-23',2018,7,23,3,30,'Monday','July','f','f',NULL,NULL,NULL),
(20180724,'2018-07-24',2018,7,24,3,30,'Tuesday','July','f','f',NULL,NULL,NULL),
(20180725,'2018-07-25',2018,7,25,3,30,'Wednesday','July','f','f',NULL,NULL,NULL),
(20180726,'2018-07-26',2018,7,26,3,30,'Thursday','July','f','f',NULL,NULL,NULL),
(20180727,'2018-07-27',2018,7,27,3,30,'Friday','July','f','f',NULL,NULL,NULL),
(20180728,'2018-07-28',2018,7,28,3,30,'Saturday','July','f','f',NULL,NULL,NULL),
(20180729,'2018-07-29',2018,7,29,3,30,'Sunday','July','f','t',NULL,NULL,NULL),
(20180730,'2018-07-30',2018,7,30,3,31,'Monday','July','f','f',NULL,NULL,NULL),
(20180731,'2018-07-31',2018,7,31,3,31,'Tuesday','July','f','f',NULL,NULL,NULL),
(20180801,'2018-08-01',2018,8,1,3,31,'Wednesday','August','f','f',NULL,NULL,NULL),
(20180802,'2018-08-02',2018,8,2,3,31,'Thursday','August','f','f',NULL,NULL,NULL),
(20180803,'2018-08-03',2018,8,3,3,31,'Friday','August','f','f',NULL,NULL,NULL),
(20180804,'2018-08-04',2018,8,4,3,31,'Saturday','August','f','f',NULL,NULL,NULL),
(20180805,'2018-08-05',2018,8,5,3,31,'Sunday','August','f','t',NULL,NULL,NULL),
(20180806,'2018-08-06',2018,8,6,3,32,'Monday','August','f','f',NULL,NULL,NULL),
(20180807,'2018-08-07',2018,8,7,3,32,'Tuesday','August','f','f',NULL,NULL,NULL),
(20180808,'2018-08-08',2018,8,8,3,32,'Wednesday','August','f','f',NULL,NULL,NULL),
(20180809,'2018-08-09',2018,8,9,3,32,'Thursday','August','f','f',NULL,NULL,NULL),
(20180810,'2018-08-10',2018,8,10,3,32,'Friday','August','f','f',NULL,NULL,NULL),
(20180811,'2018-08-11',2018,8,11,3,32,'Saturday','August','f','f',NULL,NULL,NULL),
(20180812,'2018-08-12',2018,8,12,3,32,'Sunday','August','f','t',NULL,NULL,NULL),
(20180813,'2018-08-13',2018,8,13,3,33,'Monday','August','f','f',NULL,NULL,NULL),
(20180814,'2018-08-14',2018,8,14,3,33,'Tuesday','August','f','f',NULL,NULL,NULL),
(20180815,'2018-08-15',2018,8,15,3,33,'Wednesday','August','f','f',NULL,NULL,NULL),
(20180816,'2018-08-16',2018,8,16,3,33,'Thursday','August','f','f',NULL,NULL,NULL),
(20180817,'2018-08-17',2018,8,17,3,33,'Friday','August','f','f',NULL,NULL,NULL),
(20180818,'2018-08-18',2018,8,18,3,33,'Saturday','August','f','f',NULL,NULL,NULL),
(20180819,'2018-08-19',2018,8,19,3,33,'Sunday','August','f','t',NULL,NULL,NULL),
(20180820,'2018-08-20',2018,8,20,3,34,'Monday','August','f','f',NULL,NULL,NULL),
(20180821,'2018-08-21',2018,8,21,3,34,'Tuesday','August','f','f',NULL,NULL,NULL),
(20180822,'2018-08-22',2018,8,22,3,34,'Wednesday','August','f','f',NULL,NULL,NULL),
(20180823,'2018-08-23',2018,8,23,3,34,'Thursday','August','f','f',NULL,NULL,NULL),
(20180824,'2018-08-24',2018,8,24,3,34,'Friday','August','f','f',NULL,NULL,NULL),
(20180825,'2018-08-25',2018,8,25,3,34,'Saturday','August','f','f',NULL,NULL,NULL),
(20180826,'2018-08-26',2018,8,26,3,34,'Sunday','August','f','t',NULL,NULL,NULL),
(20180827,'2018-08-27',2018,8,27,3,35,'Monday','August','f','f',NULL,NULL,NULL),
(20180828,'2018-08-28',2018,8,28,3,35,'Tuesday','August','f','f',NULL,NULL,NULL),
(20180829,'2018-08-29',2018,8,29,3,35,'Wednesday','August','f','f',NULL,NULL,NULL),
(20180830,'2018-08-30',2018,8,30,3,35,'Thursday','August','f','f',NULL,NULL,NULL),
(20180831,'2018-08-31',2018,8,31,3,35,'Friday','August','f','f',NULL,NULL,NULL),
(20180901,'2018-09-01',2018,9,1,3,35,'Saturday','September','f','f',NULL,NULL,NULL),
(20180902,'2018-09-02',2018,9,2,3,35,'Sunday','September','f','t',NULL,NULL,NULL),
(20180903,'2018-09-03',2018,9,3,3,36,'Monday','September','f','f',NULL,NULL,NULL),
(20180904,'2018-09-04',2018,9,4,3,36,'Tuesday','September','f','f',NULL,NULL,NULL),
(20180905,'2018-09-05',2018,9,5,3,36,'Wednesday','September','f','f',NULL,NULL,NULL),
(20180906,'2018-09-06',2018,9,6,3,36,'Thursday','September','f','f',NULL,NULL,NULL),
(20180907,'2018-09-07',2018,9,7,3,36,'Friday','September','f','f',NULL,NULL,NULL),
(20180908,'2018-09-08',2018,9,8,3,36,'Saturday','September','f','f',NULL,NULL,NULL),
(20180909,'2018-09-09',2018,9,9,3,36,'Sunday','September','f','t',NULL,NULL,NULL),
(20180910,'2018-09-10',2018,9,10,3,37,'Monday','September','f','f',NULL,NULL,NULL),
(20180911,'2018-09-11',2018,9,11,3,37,'Tuesday','September','f','f',NULL,NULL,NULL),
(20180912,'2018-09-12',2018,9,12,3,37,'Wednesday','September','f','f',NULL,NULL,NULL),
(20180913,'2018-09-13',2018,9,13,3,37,'Thursday','September','f','f',NULL,NULL,NULL),
(20180914,'2018-09-14',2018,9,14,3,37,'Friday','September','f','f',NULL,NULL,NULL),
(20180915,'2018-09-15',2018,9,15,3,37,'Saturday','September','f','f',NULL,NULL,NULL),
(20180916,'2018-09-16',2018,9,16,3,37,'Sunday','September','f','t',NULL,NULL,NULL),
(20180917,'2018-09-17',2018,9,17,3,38,'Monday','September','f','f',NULL,NULL,NULL),
(20180918,'2018-09-18',2018,9,18,3,38,'Tuesday','September','f','f',NULL,NULL,NULL),
(20180919,'2018-09-19',2018,9,19,3,38,'Wednesday','September','f','f',NULL,NULL,NULL),
(20180920,'2018-09-20',2018,9,20,3,38,'Thursday','September','f','f',NULL,NULL,NULL),
(20180921,'2018-09-21',2018,9,21,3,38,'Friday','September','f','f',NULL,NULL,NULL),
(20180922,'2018-09-22',2018,9,22,3,38,'Saturday','September','f','f',NULL,NULL,NULL),
(20180923,'2018-09-23',2018,9,23,3,38,'Sunday','September','f','t',NULL,NULL,NULL),
(20180924,'2018-09-24',2018,9,24,3,39,'Monday','September','f','f',NULL,NULL,NULL),
(20180925,'2018-09-25',2018,9,25,3,39,'Tuesday','September','f','f',NULL,NULL,NULL),
(20180926,'2018-09-26',2018,9,26,3,39,'Wednesday','September','f','f',NULL,NULL,NULL),
(20180927,'2018-09-27',2018,9,27,3,39,'Thursday','September','f','f',NULL,NULL,NULL),
(20180928,'2018-09-28',2018,9,28,3,39,'Friday','September','f','f',NULL,NULL,NULL),
(20180929,'2018-09-29',2018,9,29,3,39,'Saturday','September','f','f',NULL,NULL,NULL),
(20180930,'2018-09-30',2018,9,30,3,39,'Sunday','September','f','t',NULL,NULL,NULL),
(20181001,'2018-10-01',2018,10,1,4,40,'Monday','October','f','f',NULL,NULL,NULL),
(20181002,'2018-10-02',2018,10,2,4,40,'Tuesday','October','f','f',NULL,NULL,NULL),
(20181003,'2018-10-03',2018,10,3,4,40,'Wednesday','October','f','f',NULL,NULL,NULL),
(20181004,'2018-10-04',2018,10,4,4,40,'Thursday','October','f','f',NULL,NULL,NULL),
(20181005,'2018-10-05',2018,10,5,4,40,'Friday','October','f','f',NULL,NULL,NULL),
(20181006,'2018-10-06',2018,10,6,4,40,'Saturday','October','f','f',NULL,NULL,NULL),
(20181007,'2018-10-07',2018,10,7,4,40,'Sunday','October','f','t',NULL,NULL,NULL),
(20181008,'2018-10-08',2018,10,8,4,41,'Monday','October','f','f',NULL,NULL,NULL),
(20181009,'2018-10-09',2018,10,9,4,41,'Tuesday','October','f','f',NULL,NULL,NULL),
(20181010,'2018-10-10',2018,10,10,4,41,'Wednesday','October','f','f',NULL,NULL,NULL),
(20181011,'2018-10-11',2018,10,11,4,41,'Thursday','October','f','f',NULL,NULL,NULL),
(20181012,'2018-10-12',2018,10,12,4,41,'Friday','October','f','f',NULL,NULL,NULL),
(20181013,'2018-10-13',2018,10,13,4,41,'Saturday','October','f','f',NULL,NULL,NULL),
(20181014,'2018-10-14',2018,10,14,4,41,'Sunday','October','f','t',NULL,NULL,NULL),
(20181015,'2018-10-15',2018,10,15,4,42,'Monday','October','f','f',NULL,NULL,NULL),
(20181016,'2018-10-16',2018,10,16,4,42,'Tuesday','October','f','f',NULL,NULL,NULL),
(20181017,'2018-10-17',2018,10,17,4,42,'Wednesday','October','f','f',NULL,NULL,NULL),
(20181018,'2018-10-18',2018,10,18,4,42,'Thursday','October','f','f',NULL,NULL,NULL),
(20181019,'2018-10-19',2018,10,19,4,42,'Friday','October','f','f',NULL,NULL,NULL),
(20181020,'2018-10-20',2018,10,20,4,42,'Saturday','October','f','f',NULL,NULL,NULL),
(20181021,'2018-10-21',2018,10,21,4,42,'Sunday','October','f','t',NULL,NULL,NULL),
(20181022,'2018-10-22',2018,10,22,4,43,'Monday','October','f','f',NULL,NULL,NULL),
(20181023,'2018-10-23',2018,10,23,4,43,'Tuesday','October','f','f',NULL,NULL,NULL),
(20181024,'2018-10-24',2018,10,24,4,43,'Wednesday','October','f','f',NULL,NULL,NULL),
(20181025,'2018-10-25',2018,10,25,4,43,'Thursday','October','f','f',NULL,NULL,NULL),
(20181026,'2018-10-26',2018,10,26,4,43,'Friday','October','f','f',NULL,NULL,NULL),
(20181027,'2018-10-27',2018,10,27,4,43,'Saturday','October','f','f',NULL,NULL,NULL),
(20181028,'2018-10-28',2018,10,28,4,43,'Sunday','October','f','t',NULL,NULL,NULL),
(20181029,'2018-10-29',2018,10,29,4,44,'Monday','October','f','f',NULL,NULL,NULL),
(20181030,'2018-10-30',2018,10,30,4,44,'Tuesday','October','f','f',NULL,NULL,NULL),
(20181031,'2018-10-31',2018,10,31,4,44,'Wednesday','October','f','f',NULL,NULL,NULL),
(20181101,'2018-11-01',2018,11,1,4,44,'Thursday','November','f','f',NULL,NULL,NULL),
(20181102,'2018-11-02',2018,11,2,4,44,'Friday','November','f','f',NULL,NULL,NULL),
(20181103,'2018-11-03',2018,11,3,4,44,'Saturday','November','f','f',NULL,NULL,NULL),
(20181104,'2018-11-04',2018,11,4,4,44,'Sunday','November','f','t',NULL,NULL,NULL),
(20181105,'2018-11-05',2018,11,5,4,45,'Monday','November','f','f',NULL,NULL,NULL),
(20181106,'2018-11-06',2018,11,6,4,45,'Tuesday','November','f','f',NULL,NULL,NULL),
(20181107,'2018-11-07',2018,11,7,4,45,'Wednesday','November','f','f',NULL,NULL,NULL),
(20181108,'2018-11-08',2018,11,8,4,45,'Thursday','November','f','f',NULL,NULL,NULL),
(20181109,'2018-11-09',2018,11,9,4,45,'Friday','November','f','f',NULL,NULL,NULL),
(20181110,'2018-11-10',2018,11,10,4,45,'Saturday','November','f','f',NULL,NULL,NULL),
(20181111,'2018-11-11',2018,11,11,4,45,'Sunday','November','f','t',NULL,NULL,NULL),
(20181112,'2018-11-12',2018,11,12,4,46,'Monday','November','f','f',NULL,NULL,NULL),
(20181113,'2018-11-13',2018,11,13,4,46,'Tuesday','November','f','f',NULL,NULL,NULL),
(20181114,'2018-11-14',2018,11,14,4,46,'Wednesday','November','f','f',NULL,NULL,NULL),
(20181115,'2018-11-15',2018,11,15,4,46,'Thursday','November','f','f',NULL,NULL,NULL),
(20181116,'2018-11-16',2018,11,16,4,46,'Friday','November','f','f',NULL,NULL,NULL),
(20181117,'2018-11-17',2018,11,17,4,46,'Saturday','November','f','f',NULL,NULL,NULL),
(20181118,'2018-11-18',2018,11,18,4,46,'Sunday','November','f','t',NULL,NULL,NULL),
(20181119,'2018-11-19',2018,11,19,4,47,'Monday','November','f','f',NULL,NULL,NULL),
(20181120,'2018-11-20',2018,11,20,4,47,'Tuesday','November','f','f',NULL,NULL,NULL),
(20181121,'2018-11-21',2018,11,21,4,47,'Wednesday','November','f','f',NULL,NULL,NULL),
(20181122,'2018-11-22',2018,11,22,4,47,'Thursday','November','f','f',NULL,NULL,NULL),
(20181123,'2018-11-23',2018,11,23,4,47,'Friday','November','f','f',NULL,NULL,NULL),
(20181124,'2018-11-24',2018,11,24,4,47,'Saturday','November','f','f',NULL,NULL,NULL),
(20181125,'2018-11-25',2018,11,25,4,47,'Sunday','November','f','t',NULL,NULL,NULL),
(20181126,'2018-11-26',2018,11,26,4,48,'Monday','November','f','f',NULL,NULL,NULL),
(20181127,'2018-11-27',2018,11,27,4,48,'Tuesday','November','f','f',NULL,NULL,NULL),
(20181128,'2018-11-28',2018,11,28,4,48,'Wednesday','November','f','f',NULL,NULL,NULL),
(20181129,'2018-11-29',2018,11,29,4,48,'Thursday','November','f','f',NULL,NULL,NULL),
(20181130,'2018-11-30',2018,11,30,4,48,'Friday','November','f','f',NULL,NULL,NULL),
(20181201,'2018-12-01',2018,12,1,4,48,'Saturday','December','f','f',NULL,NULL,NULL),
(20181202,'2018-12-02',2018,12,2,4,48,'Sunday','December','f','t',NULL,NULL,NULL),
(20181203,'2018-12-03',2018,12,3,4,49,'Monday','December','f','f',NULL,NULL,NULL),
(20181204,'2018-12-04',2018,12,4,4,49,'Tuesday','December','f','f',NULL,NULL,NULL),
(20181205,'2018-12-05',2018,12,5,4,49,'Wednesday','December','f','f',NULL,NULL,NULL),
(20181206,'2018-12-06',2018,12,6,4,49,'Thursday','December','f','f',NULL,NULL,NULL),
(20181207,'2018-12-07',2018,12,7,4,49,'Friday','December','f','f',NULL,NULL,NULL),
(20181208,'2018-12-08',2018,12,8,4,49,'Saturday','December','f','f',NULL,NULL,NULL),
(20181209,'2018-12-09',2018,12,9,4,49,'Sunday','December','f','t',NULL,NULL,NULL),
(20181210,'2018-12-10',2018,12,10,4,50,'Monday','December','f','f',NULL,NULL,NULL),
(20181211,'2018-12-11',2018,12,11,4,50,'Tuesday','December','f','f',NULL,NULL,NULL),
(20181212,'2018-12-12',2018,12,12,4,50,'Wednesday','December','f','f',NULL,NULL,NULL),
(20181213,'2018-12-13',2018,12,13,4,50,'Thursday','December','f','f',NULL,NULL,NULL),
(20181214,'2018-12-14',2018,12,14,4,50,'Friday','December','f','f',NULL,NULL,NULL),
(20181215,'2018-12-15',2018,12,15,4,50,'Saturday','December','f','f',NULL,NULL,NULL),
(20181216,'2018-12-16',2018,12,16,4,50,'Sunday','December','f','t',NULL,NULL,NULL),
(20181217,'2018-12-17',2018,12,17,4,51,'Monday','December','f','f',NULL,NULL,NULL),
(20181218,'2018-12-18',2018,12,18,4,51,'Tuesday','December','f','f',NULL,NULL,NULL),
(20181219,'2018-12-19',2018,12,19,4,51,'Wednesday','December','f','f',NULL,NULL,NULL),
(20181220,'2018-12-20',2018,12,20,4,51,'Thursday','December','f','f',NULL,NULL,NULL),
(20181221,'2018-12-21',2018,12,21,4,51,'Friday','December','f','f',NULL,NULL,NULL),
(20181222,'2018-12-22',2018,12,22,4,51,'Saturday','December','f','f',NULL,NULL,NULL),
(20181223,'2018-12-23',2018,12,23,4,51,'Sunday','December','f','t',NULL,NULL,NULL),
(20181224,'2018-12-24',2018,12,24,4,52,'Monday','December','f','f',NULL,NULL,NULL),
(20181225,'2018-12-25',2018,12,25,4,52,'Tuesday','December','f','f',NULL,NULL,NULL),
(20181226,'2018-12-26',2018,12,26,4,52,'Wednesday','December','f','f',NULL,NULL,NULL),
(20181227,'2018-12-27',2018,12,27,4,52,'Thursday','December','f','f',NULL,NULL,NULL),
(20181228,'2018-12-28',2018,12,28,4,52,'Friday','December','f','f',NULL,NULL,NULL),
(20181229,'2018-12-29',2018,12,29,4,52,'Saturday','December','f','f',NULL,NULL,NULL),
(20181230,'2018-12-30',2018,12,30,4,52,'Sunday','December','f','t',NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation_id` bigint(20) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `FK_USER_DESG_ID` (`designation_id`),
  CONSTRAINT `FK_USER_DESG_ID` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`,`api_token`,`designation_id`,`username`) values 
(1,'admin','admin@gmail.com','$2y$10$W2GQw.i/wHFLvNonh.mDAOLl.bjKankt65ydUDX8FMrvGcvOfnYny','pqPDG8SyL7QpcBcQRb30rxt3D0NpFGF5CHlA80IotTYqiPXpD1rPdIJ6UOg1','2018-06-27 10:22:03','2018-06-27 10:22:03',NULL,8,'admin@gmail.com'),
(2,'Abdul Naim','abdulnaim009@gmail.com','$2y$10$GmWs1DTUqW0OJ5LS7YpAs.hpighPSxl9S9gNyCMj5LkBe08cnxLaC','c0VQMu3qYHSkvFRuNIAG4v03mZ1cu2QyHqU2wajlHxfM3vklHzE2oU5PFLjN','2018-07-21 09:27:24','2018-07-21 12:40:14',NULL,1,'abdulnaim009@gmail.com'),
(13,'MH27AA1234',NULL,'$2y$10$r/oLyN2/qYnE4eo4FiO92eB60sR8SUGt3IpNWKKJJnmGkUDTaOI1C',NULL,'2018-07-21 12:00:58','2018-07-21 12:00:58',NULL,9,'MH27AA1234'),
(14,'MH27AB4567',NULL,'$2y$10$vRt4AObtvXsQ7kSVMoqbu.ZA9XKBKY9U1//J7CznjZLUtdz6EBZ/2',NULL,'2018-07-21 12:01:22','2018-07-21 12:40:39','tjP29r1fGrx5FVL86fl4SbXxmxsvV4LsbwyfIrH1kdz5ekcipwPmQvKIrDgO',9,'MH27AB4567'),
(15,'mh27ab3210',NULL,'$2y$10$4D5vhsHiWk/MtkXy4miJRuMkm/xACI2kBKF.IwCVZIHKZ3MG8Gs7O',NULL,'2018-07-21 13:57:20','2018-07-21 13:57:20',NULL,9,'mh27ab3210');

/* Procedure structure for procedure `busInAttendance` */

/*!50003 DROP PROCEDURE IF EXISTS  `busInAttendance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `busInAttendance`(IN tempRfid VARCHAR(20),IN tempTime VARCHAR(20),IN tempDate VARCHAR(20))
BEGIN
DECLARE tempType VARCHAR(16);
DECLARE typeId VARCHAR(16);
SELECT  rfid_type,type_id
	INTO tempType,typeId
	FROM rfid_details WHERE rfid_no = tempRfid;
IF tempType = "staff" 
THEN
INSERT INTO staff_attendance(staff_id,bus_in,DATE,in_statues) VALUES(typeId,tempTime,tempDate,"1");
ELSEIF tempType = "student"
THEN 
INSERT INTO student_entry_attendance(student_id,bus_in,DATE,in_statues) VALUES(typeId,tempTime,tempDate,"1");
ELSEIF tempType = "guest"
THEN
INSERT INTO guest_details(id,in_time,arrived_date,in_statues) VALUES(typeId,tempTime,tempDate,"1");
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `busOutAttendance` */

/*!50003 DROP PROCEDURE IF EXISTS  `busOutAttendance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `busOutAttendance`(IN tempRfid VARCHAR(20),IN tempTime VARCHAR(20),IN tempDate VARCHAR(20))
BEGIN
DECLARE tempType VARCHAR(16);
DECLARE typeId VARCHAR(16);
SELECT  rfid_type,type_id
	INTO tempType,typeId
	FROM rfid_details WHERE rfid_no=tempRfid;
IF tempType = "staff" 
THEN

INSERT INTO staff_attendance(staff_id,bus_out,DATE,out_statues) VALUES(typeId,tempTime,tempDate,"1") 
ON DUPLICATE KEY UPDATE bus_out=tempTime, out_statues = 1 ;

ELSEIF tempType = "student"
THEN 

INSERT INTO student_entry_attendance(student_id,bus_out,DATE,out_statues) VALUES(typeId,tempTime,tempDate,"1") 
ON DUPLICATE KEY UPDATE bus_out=tempTime, out_statues = 1 ;

ELSEIF tempType = "guest"
THEN
UPDATE guest_details SET in_statues = 1,out_time = tempTime WHERE id = typeId;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `classattendance` */

/*!50003 DROP PROCEDURE IF EXISTS  `classattendance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `classattendance`(IN tempRfid VARCHAR(20),IN tempStaffID VARCHAR(20),IN tempDate VARCHAR(20),IN tempClassId VARCHAR(20))
BEGIN
DECLARE typeId VARCHAR(16);
SELECT  type_id INTO typeId
	FROM rfid_details WHERE rfid_no = tempRfid;
INSERT INTO `student_class_attendance`(class_id,student_id,DATE,staff_id,statues) 
VALUES(tempClassId,typeID,tempDate,tempStaffID,"1");
END */$$
DELIMITER ;

/* Procedure structure for procedure `Late_attendance` */

/*!50003 DROP PROCEDURE IF EXISTS  `Late_attendance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Late_attendance`(IN tempRfid VARCHAR(20),IN tempTime VARCHAR(20),IN tempDate VARCHAR(20))
BEGIN
DECLARE tempType VARCHAR(16);
DECLARE typeId VARCHAR(16);
SELECT  rfid_type,type_id
	INTO tempType,typeId
	FROM rfid_details WHERE rfid_no=tempRfid;
IF tempType = "staff" 
THEN
UPDATE `staff_attendance` SET late_attendance = 1 WHERE gate_in > '08:20:00' AND staff_id = typeId;

ELSEIF tempType = "student"
THEN 
UPDATE `student_entry_attendance` SET late_attendance = 1 WHERE gate_in > '08:20:00' AND student_id = typeId;

END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `fill_date_dimension` */

/*!50003 DROP PROCEDURE IF EXISTS  `fill_date_dimension` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_date_dimension`(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO time_dimension VALUES (
                        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        currentdate,
                        YEAR(currentdate),
                        MONTH(currentdate),
                        DAY(currentdate),
                        QUARTER(currentdate),
                        WEEKOFYEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DATE_FORMAT(currentdate,'%M'),
                        'f',
                        CASE DAYOFWEEK(currentdate) WHEN 1 THEN 't' ELSE 'f' END,
                        NULL);
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `gateInAttendance` */

/*!50003 DROP PROCEDURE IF EXISTS  `gateInAttendance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gateInAttendance`(IN tempRfid VARCHAR(20),IN tempTime VARCHAR(20),IN tempDate VARCHAR(20))
BEGIN
DECLARE tempType VARCHAR(16);
DECLARE typeId VARCHAR(16);
SELECT  rfid_type,type_id
	INTO tempType,typeId
	FROM rfid_details WHERE rfid_no = tempRfid;
IF tempType = "staff" 
THEN

INSERT INTO staff_attendance(staff_id,gate_in,DATE,in_statues) VALUES(typeId,tempTime,tempDate,"1") 
ON DUPLICATE KEY UPDATE gate_in=tempTime, in_statues = 1 ;

ELSEIF tempType = "student"
THEN 

INSERT INTO student_entry_attendance(student_id,gate_in,DATE,in_statues) VALUES(typeId,tempTime,tempDate,"1") 
ON DUPLICATE KEY UPDATE gate_in=tempTime, in_statues = 1 ;

ELSEIF tempType = "guest"
THEN

INSERT INTO guest_details(id,in_time,arrived_date,in_statues) VALUES(typeId,tempTime,tempDate,"1");

END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `gateOutAttendance` */

/*!50003 DROP PROCEDURE IF EXISTS  `gateOutAttendance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gateOutAttendance`(IN tempRfid VARCHAR(20),IN tempTime VARCHAR(20),IN tempDate VARCHAR(20))
BEGIN
DECLARE tempType VARCHAR(16);
DECLARE typeId VARCHAR(16);
SELECT  rfid_type,type_id
	INTO tempType,typeId
	FROM rfid_details WHERE rfid_no=tempRfid;
IF tempType = "staff" 
THEN

INSERT INTO staff_attendance(staff_id,gate_out,DATE,out_statues) VALUES(typeId,tempTime,tempDate,"1") 
ON DUPLICATE KEY UPDATE gate_out=tempTime, out_statues = 1 ;

ELSEIF tempType = "student"
THEN 

INSERT INTO student_entry_attendance(student_id,gate_out,DATE,out_statues) VALUES(typeId,tempTime,tempDate,"1") 
ON DUPLICATE KEY UPDATE gate_out=tempTime, out_statues = 1 ;

ELSEIF tempType = "guest"
THEN

UPDATE guest_details SET in_statues = 1,out_time = tempTime WHERE id = typeId;

END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
