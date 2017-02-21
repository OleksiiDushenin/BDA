DROP DATABASE IF EXISTS `task2`;
CREATE DATABASE `task2`;

USE `task2`;

CREATE TABLE `user_records` (
  `uid`           BIGINT     NOT NULL,
  `statcount`     BIGINT     NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `user_without_stats` (
  `uid`           BIGINT     NOT NULL,
  PRIMARY KEY (`uid`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `no_user_for_stats` (
  `uid`           BIGINT     NOT NULL,
  PRIMARY KEY (`uid`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

