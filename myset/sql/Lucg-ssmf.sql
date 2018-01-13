DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) NOT NULL,
  `user_name` varchar(120) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `user_type` varchar(2) NOT NULL,
  `active_flag` varchar(2) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO `user_info`(`user_code`,`user_name`,`user_pwd`,`user_type`,`active_flag`) values ('test','盧','fd869d4a3547b82b2d2adae95d85e09a','1','1');


DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) DEFAULT NULL,
  `user_name` varchar(120) DEFAULT NULL,
  `user_ip` varchar(32) DEFAULT NULL,
  `session_id` varchar(64) DEFAULT NULL,
  `login_status` varchar(2) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `img_info`;
CREATE TABLE `img_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img_code` varchar(20) NOT NULL COMMENT '图片编号',
  `img_name` varchar(80) COMMENT '图片名称',
  `img_type` varchar(4) COMMENT '图片分类',
  `img_order` int(4) NOT NULL COMMENT '图片序号',
  `img_path` varchar(200) NOT NULL COMMENT '图片路径',
  `img_remark` varchar(200) DEFAULT NULL COMMENT '图片描述信息',
  `aos_effect` varchar(100) COMMENT 'aos动画效果显示',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00001','about_01.jpg','I001',0,'static/img/I001/about_01.jpg','fade-up','aos=\"fade-up\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00002','about_02.jpg','I001',1,'static/img/I001/about_02.jpg','fade-down','aos=\"fade-down\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00003','about_03.jpg','I001',2,'static/img/I001/about_03.jpg','fade-right','aos=\"fade-right\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00004','about_04.jpg','I001',3,'static/img/I001/about_04.jpg','fade-left','aos=\"fade-left\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00005','about_05.jpg','I001',4,'static/img/I001/about_05.jpg','fade-up-right','aos=\"fade-up-right\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00006','about_06.jpg','I001',5,'static/img/I001/about_06.jpg','fade-up-left','aos=\"fade-up-left\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00007','about_07.jpg','I001',6,'static/img/I001/about_07.jpg','fade-down-right','aos=\"fade-down-right\"');
INSERT INTO `img_info`(`img_code`,`img_name`,`img_type`,`img_order`,`img_path`,`img_remark`,`aos_effect`) values ('IMG00008','about_08.jpg','I001',7,'static/img/I001/about_08.jpg','fade-down-left','aos=\"fade-down-left\"');

