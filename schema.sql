SET SESSION time_zone = '+8:00';
SET NAMES UTF8;

DROP DATABASE IF EXISTS `gold`;
CREATE DATABASE `gold`
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_general_ci;
USE `gold`;

#用户表
CREATE TABLE `user` (
  `id`         INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `username`   VARCHAR(16)      NOT NULL, #用户名
  `password`   VARCHAR(64)      NOT NULL, #密码
  `nickname`   VARCHAR(64)      NOT NULL, #昵称
  `email`      VARCHAR(64)      NOT NULL  DEFAULT '', #邮箱
  `avatar`     VARCHAR(256)     NOT NULL  DEFAULT '', #头像
  `tel`        VARCHAR(11)      NOT NULL  DEFAULT '', #手机
  `job`        VARCHAR(32)      NOT NULL  DEFAULT '', #职位
  `desc`       VARCHAR(255)     NOT NULL  DEFAULT '', #个人描述
  `page`       VARCHAR(255)     NOT NULL  DEFAULT '', #个人主页
  `created_at` TIMESTAMP        NOT NULL  DEFAULT NOW(),
  `updated_at` TIMESTAMP        NOT NULL  DEFAULT NOW(),
  PRIMARY KEY (`id`),
  KEY (`username`, `password`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8
  AUTO_INCREMENT = 10000;

#文章表
CREATE TABLE `article` (
  `id`         INT(10) UNSIGNED     NOT NULL             AUTO_INCREMENT,
  `title`      VARCHAR(64)          NOT NULL             DEFAULT '', #标题
  `content`    TEXT                 NOT NULL             DEFAULT '', #内容
  `desc`       VARCHAR(255)         NOT NULL             DEFAULT '', #描述
  `image`      VARCHAR(255)         NOT NULL             DEFAULT '', #配图
  `catalog`    ENUM (1, 2, 3, 4, 5) NOT NULL             DEFAULT 1, #分类： 1，前端；2，android， 3， ios， 4， 后端， 5，设计， 6:产品
  `type`       ENUM (1, 2, 3, 4)    NOT NULL             DEFAULT 1, #1,原创；2，墙外；3，英文，4，其他
  `tag`        VARCHAR(16)          NOT NULL             DEFAULT '', #标签
  `state`      ENUM (1, 2, 3)       NOT NULL             DEFAULT 1, # '1: 草稿， 2：已发表， 3：已禁用',
  `created_at` TIMESTAMP            NOT NULL             DEFAULT NOW(),
  `updated_at` TIMESTAMP            NOT NULL             DEFAULT NOW(),
  `user_id`    INT(10)              NOT NULL,
  PRIMARY KEY (`id`),
  KEY (`image`, `title`, `created_at`, `user_id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8
  AUTO_INCREMENT = 10000;

#评论表
CREATE TABLE `comment` (
  `id`            INT(10) UNSIGNED NOT NULL             AUTO_INCREMENT,
  `content`       VARCHAR(255)     NOT NULL             DEFAULT '',
  `created_at`    TIMESTAMP        NOT NULL             DEFAULT NOW(),
  `reply_user_id` INT              NOT NULL, #回复用户id
  `article_id`    INT              NOT NULL, #评论文章id
  `user_id`       INT              NOT NULL, #评论人id
  PRIMARY KEY (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8
  AUTO_INCREMENT = 10000;

