-- 添加block信息
alter table user_info add user_address varchar(50);


CREATE TABLE `beat_card_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` bigint(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin