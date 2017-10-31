CREATE DATABASE IF NOT EXISTS realestate;

USE realestate;

CREATE USER IF NOT EXISTS 'admin'@'realestate' IDENTIFIED BY 'admin';

GRANT ALL PRIVILEGES ON * . * TO 'admin'@'realestate';

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `Roles`;
CREATE TABLE `Roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Roles` (`name`) VALUES ('ROLE_ADMIN');
INSERT INTO `Roles` (`name`) VALUES ('ROLE_OWNER');
INSERT INTO `Roles` (`name`) VALUES ('ROLE_BUYER');

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(128) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`roleId`) REFERENCES `Roles`(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Users` (`login`, `password`, `roleId`) VALUES ('admin', 'admin', (SELECT id
                                                            FROM `Roles`
                                                            WHERE `name` = 'ROLE_ADMIN'));

INSERT INTO `Users` (`login`, `password`, `roleId`) VALUES ('owner', 'owner', (SELECT id
                                                            FROM `Roles`
                                                            WHERE `name` = 'ROLE_OWNER'));

INSERT INTO `Users` (`login`, `password`, `roleId`) VALUES ('buyer', 'buyer', (SELECT id
                                                            FROM `Roles`
                                                            WHERE `name` = 'ROLE_BUYER'));

DROP TABLE IF EXISTS `RealEstateStatus`;
CREATE TABLE `RealEstateStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `RealEstateStatus` (`name`) VALUES ('NEW');
INSERT INTO `RealEstateStatus` (`name`) VALUES ('APPROVED');
INSERT INTO `RealEstateStatus` (`name`) VALUES ('DELETED');

DROP TABLE IF EXISTS `RealEstates`;
CREATE TABLE `RealEstates` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(512) NOT NULL,
  `description` VARCHAR(1024) NOT NULL,
  `ownerId` INT(11) NOT NULL,
  `statusId` INT(11) NOT NULL,
  `adminNote` VARCHAR(512) NULL,
  `address` VARCHAR(512) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `nearbyLocations` VARCHAR(512) NULL,
  `lat` FLOAT(10, 6) NOT NULL,
  `lng` FLOAT(10, 6) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`ownerId`) REFERENCES `Users`(id) ON UPDATE CASCADE,
  FOREIGN KEY (`statusId`) REFERENCES `RealEstateStatus`(id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Messages`;
CREATE TABLE `Messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `senderId` INT(11) NOT NULL,
  `recipientId` INT(11) NOT NULL,
  `message` VARCHAR(512) NOT NULL,
  `statusId` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`recipientId`) REFERENCES `Users`(id),
  FOREIGN KEY (`senderId`) REFERENCES `Users`(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET foreign_key_checks = 1;


