CREATE DATABASE faq;
USE faq;
Drop TABLE question;
CREATE TABLE IF NOT EXISTS `question` (
   `id` INT UNSIGNED,
   `language` VARCHAR(24) NOT NULL,
   `title` VARCHAR(1000) NOT NULL,
   `content` VARCHAR(10000),
   `date_added` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `question_counter` (
  `counter_id` int(11) NOT NULL COMMENT '标识不同的数据表',
  `max_id` int(11) NOT NULL COMMENT '每个索引表的最大ID,会实时更新',
  PRIMARY KEY (`counter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;