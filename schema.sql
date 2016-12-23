SET SESSION time_zone = '+8:00';
SET NAMES UTF8;

DROP DATABASE IF EXISTS `shop`;
CREATE DATABASE `shop`
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_general_ci;
USE `shop`;

#用户表
CREATE TABLE `user` (
  `id`         INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `username`   VARCHAR(16)      NOT NULL,
  `password`   VARCHAR(64)      NOT NULL,
  `nickname`   VARCHAR(64)      NOT NULL,
  `tel`        VARCHAR(11)      NOT NULL  DEFAULT '',
  `email`      VARCHAR(64)      NOT NULL  DEFAULT '',
  `avatar`     VARCHAR(256)     NOT NULL  DEFAULT '',
  `created_at` TIMESTAMP        NOT NULL  DEFAULT NOW(),
  `updated_at` TIMESTAMP        NOT NULL  DEFAULT NOW(),
  PRIMARY KEY (`id`),
  KEY (`username`, `password`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8
  AUTO_INCREMENT = 10000;

#商品表
CREATE TABLE `goods` (
  `id`   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64)      NOT NULL DEFAULT '',
  `desc` VARCHAR(256)     NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8
  AUTO_INCREMENT = 10000;