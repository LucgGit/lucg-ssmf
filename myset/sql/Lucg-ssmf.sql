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

insert into `user_info`(`user_code`,`user_name`,`user_pwd`,`user_type`,`active_flag`) values ('test','±R','fd869d4a3547b82b2d2adae95d85e09a','1','1');


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
