CREATE DATABASE IF NOT EXISTS sample DEFAULT character set utf8;
CREATE USER 'tester'@'%' IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'tester'@'%';

use sample;

create table IF not exists `tester` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(128) NOT NULL,
    `role` set('member','admin','owner') DEFAULT 'member',
    `created_at` datetime NOT NULL,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tester` VALUES
(
    1,
    'tester_01',
    'owner',
    '2018-11-02 19:58:11',
    '2018-11-02 19:58:11'
);
