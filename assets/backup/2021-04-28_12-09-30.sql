#
# LONG COIN Database Dump
# Evolution CMS Version:2.0.4
# 
# Host: 
# Generation Time: 28-04-2021 12:09:30
# Server version: 5.6.34
# PHP Version: 7.4.9
# Database: `long`
# Description: 
#

# --------------------------------------------------------

#
# Table structure for table `coin_active_user_locks`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_active_user_locks`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_active_user_locks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `elementType` int(1) NOT NULL DEFAULT '0',
  `elementId` int(10) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COMMENT='Contains data about locked elements.';



# --------------------------------------------------------

#
# Table structure for table `coin_active_user_sessions`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_active_user_sessions`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data about valid user sessions.';

#
# Dumping data for table `coin_active_user_sessions`
#

INSERT INTO `coin_active_user_sessions` VALUES
  ('3c7414a7303fdad28b5c3668185e0ebb','1','1619611769','127.0.0.1');


# --------------------------------------------------------

#
# Table structure for table `coin_active_users`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_active_users`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data about last user action.';

#
# Dumping data for table `coin_active_users`
#

INSERT INTO `coin_active_users` VALUES
  ('3c7414a7303fdad28b5c3668185e0ebb','1','gumoviy','1619611770','93',NULL);


# --------------------------------------------------------

#
# Table structure for table `coin_categories`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_categories`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='Categories to be used snippets,tv,chunks, etc';

#
# Dumping data for table `coin_categories`
#

INSERT INTO `coin_categories` VALUES
  ('1','SEO','0'),
  ('2','Templates','0'),
  ('3','Manager and Admin','0'),
  ('4','Content','0'),
  ('5','Navigation','0'),
  ('6','MultiLang','0'),
  ('7','Files','0'),
  ('8','Links','0');


# --------------------------------------------------------

#
# Table structure for table `coin_document_groups`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_document_groups`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_documentgroup_names`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_documentgroup_names`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_event_log`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_event_log`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Stores event and error logs';



# --------------------------------------------------------

#
# Table structure for table `coin_lexicon`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_lexicon`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_lexicon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `ru` varchar(255) NOT NULL DEFAULT '',
  `en` varchar(255) DEFAULT NULL,
  `sp` varchar(255) DEFAULT NULL,
  `ch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

#
# Dumping data for table `coin_lexicon`
#

INSERT INTO `coin_lexicon` VALUES
  ('3','Описание проекта','Описание проекта','Project description','',''),
  ('6','Дорожная карта','Дорожная карта','','',''),
  ('4','Long network','Long network','Long network','',''),
  ('5','Полезные ссылки','Полезные ссылки','Useful links','',''),
  ('7','Поддержать проект','Поддержать проект','','',''),
  ('8','Лотерея','Лотерея','Lottery','',''),
  ('9','Поддержать проект','Поддержать проект','Support the project','',''),
  ('10','Дорожная карта','Дорожная карта','Roadmap','',''),
  ('11','язык логотипа','ru','en','en','en'),
  ('12','Характеристики','Характеристики','Characteristics','',''),
  ('13','Выберите версию','Выберите версию','select version','',''),
  ('14','Инструкция для','Инструкция для','Instructions for ','',''),
  ('15','Скачать','Скачать','Download','',''),
  ('16','Приложение','Приложение','App','',''),
  ('17','Адрес скопирован','Адрес скопирован','Address copied','',''),
  ('18','Название монеты','Название монеты','','',''),
  ('19','Монетный тикер','Монетный тикер','','',''),
  ('20','Алгоритм хеширования','Алгоритм хеширования','','',''),
  ('21','Алгоритм шифрования сообщений','Алгоритм шифрования сообщений','','',''),
  ('22','Тип монеты','Тип монеты','','',''),
  ('23','Время нахождения блока','Время нахождения блока','','',''),
  ('24','Премайн','Премайн','Premine','',''),
  ('25','Срок подтверждения','Срок подтверждения','','',''),
  ('26','Вознаграждение за блок','Вознаграждение за блок','','',''),
  ('27','Фиксированная комиссия','Фиксированная комиссия','','',''),
  ('28','минуты','минуты','minutes','',''),
  ('29','блоков','блоков','blocks','',''),
  ('30','Название монеты','Название монеты','Coin name','',''),
  ('31','Монетный тикер','Монетный тикер','Coin Ticker','',''),
  ('32','Алгоритм хеширования','Алгоритм хеширования','Hash Algorithm','',''),
  ('33','Алгоритм шифрования сообщений','Алгоритм шифрования сообщений','Message encryption algorithm','',''),
  ('34','Тип монеты','Тип монеты','Coin Type','',''),
  ('35','Время нахождения блока','Время нахождения блока','Block time','',''),
  ('36','Срок подтверждения','Срок подтверждения','Confirmation period','',''),
  ('37','Вознаграждение за блок','Вознаграждение за блок','Block Reward','',''),
  ('38','Фиксированная комиссия','Фиксированная комиссия','Fixed commission','',''),
  ('39','Короткие','Короткие','','',''),
  ('40','Стандартные финансовые транзакции','Стандартные финансовые транзакции','','',''),
  ('41','Ограничение на объем транзакции с данными','','','',''),
  ('42','макс комиссия','макс комиссия','','',''),
  ('43','Ограничение на объем транзакции с данными','Ограничение на объем транзакции с данными','','',''),
  ('44','Мультиадресные транзакции с одновременной передачей монет и сообщений','Мультиадресные транзакции с одновременной передачей монет и сообщений','Multicast transactions with simultaneous transmission of coins and messages','',''),
  ('45','макс комиссия','макс комиссия','max commission','',''),
  ('46','Ограничение на объем транзакции с данными','Ограничение на объем транзакции с данными','Limit on the volume of data transactions','',''),
  ('47','Стандартные финансовые транзакции','Стандартные финансовые транзакции','Standard financial transactions','',''),
  ('48','Короткие','Короткие','','',''),
  ('49','Внимание','Внимание','Attention','',''),
  ('50','Полезные ссылки','Полезные ссылки','','',''),
  ('51','Наши сетевые сервисы','Наши сетевые сервисы','','',''),
  ('52','Полезные ссылки','Полезные ссылки','Links','',''),
  ('53','Наши сетевые сервисы','Наши сетевые сервисы','Services','',''),
  ('54','Готово','Готово','Done','',''),
  ('55','Добавлена строчка в 256 символов в транзакцию','Добавлена строчка в 256 символов в транзакцию','','',''),
  ('56','Создана «Стена» куда может постить любой желающий','','','',''),
  ('57','Добавлена возможность создавать свои приватные чаты','','','',''),
  ('58','В процессе','В процессе','In the process','',''),
  ('59','Создана «Стена» куда может постить любой желающий','Создана «Стена» куда может постить любой желающий','','',''),
  ('60','Добавлена возможность создавать свои приватные чаты','Добавлена возможность создавать свои приватные чаты','','',''),
  ('61','Создание фильтров для контента на стене','Создание фильтров для контента на стене','','',''),
  ('62','Создание паблика Long Tweet — аналога Твиттер на блокчейне, с возможностью регистрации никнеймов','Создание паблика Long Tweet — аналога Твиттер на блокчейне, с возможностью регистрации никнеймов','','',''),
  ('63','Создание простого интерфейса, для управления операциями LONG в 1-2 клика','Создание простого интерфейса, для управления операциями LONG в 1-2 клика','','',''),
  ('64','Распространение LONG среди людей не знакомых с криптовалютой, и считающих, что это сложно','Распространение LONG среди людей не знакомых с криптовалютой, и считающих, что это сложно','','',''),
  ('65','Выход на китайский рынок','Выход на китайский рынок','','',''),
  ('66','Создание первых магазинов на блокчейне LONG','Создание первых магазинов на блокчейне LONG','','',''),
  ('67','В процессе','В процессе','To do','',''),
  ('68','Готово','Готово','What is done','',''),
  ('69','Добавлена строчка в 256 символов в транзакцию','Добавлена строчка в 256 символов в транзакцию','','',''),
  ('70','Создана «Стена» куда может постить любой желающий','Создана «Стена» куда может постить любой желающий','','',''),
  ('71','Добавлена строчка в 256 символов в транзакцию','Добавлена строчка в 256 символов в транзакцию','Added a line of 256 characters to the transaction','',''),
  ('72','Создана «Стена» куда может постить любой желающий','Создана «Стена» куда может постить любой желающий','A \"Wall\" has been created where anyone can post','',''),
  ('73','Добавлена возможность создавать свои приватные чаты','Добавлена возможность создавать свои приватные чаты','Added the ability to create your own private chats','',''),
  ('74','Создание фильтров для контента на стене','Создание фильтров для контента на стене','Creating filters for content on the wall','',''),
  ('75','Создание паблика Long Tweet — аналога Твиттер на блокчейне, с возможностью регистрации никнеймов','Создание паблика Long Tweet — аналога Твиттер на блокчейне, с возможностью регистрации никнеймов','Creating a public Long Tweet - an analogue of Twitter on the blockchain, with the ability registration of nicknames','',''),
  ('76','Создание простого интерфейса, для управления операциями LONG в 1-2 клика','Создание простого интерфейса, для управления операциями LONG в 1-2 клика','Creation of a simple interface so that all operations in LONG can be done in 1-2 clicks','',''),
  ('77','Распространение LONG среди людей не знакомых с криптовалютой, и считающих, что это сложно','Распространение LONG среди людей не знакомых с криптовалютой, и считающих, что это сложно','At this stage, it is planned to distribute LONG among people who are not familiar with cryptocurrency, and who believe that it is difficult','',''),
  ('78','Выход на китайский рынок','Выход на китайский рынок','Entering the Chinese market','',''),
  ('79','Создание первых магазинов на блокчейне LONG','Создание первых магазинов на блокчейне LONG','Creation of the first stores on the LONG blockchain','',''),
  ('80','Поддержать проект','Поддержать проект','Support Project','',''),
  ('81','Все пожертвования идут только и исключительно на развитие LONG NETWORK','Все пожертвования идут только и исключительно на развитие LONG NETWORK','','',''),
  ('82','Все пожертвования принимаются только и исключительно в криптовалюте','Все пожертвования принимаются только и исключительно в криптовалюте','','',''),
  ('83','Кошельки для поддержки','Кошельки для поддержки','','',''),
  ('84','Все пожертвования идут только и исключительно на развитие LONG NETWORK','Все пожертвования идут только и исключительно на развитие LONG NETWORK','All donations go solely and exclusively to the development of LONG NETWORK','',''),
  ('85','Все пожертвования принимаются только и исключительно в криптовалюте','Все пожертвования принимаются только и исключительно в криптовалюте','All donations are accepted only and exclusively in cryptocurrency ','',''),
  ('86','Кошельки для поддержки','Кошельки для поддержки','Support Wallets ','',''),
  ('87','Лотерея','Лотерея','','',''),
  ('88','Честная лотерея на блокчейне LONG','Честная лотерея на блокчейне LONG','','',''),
  ('89','Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом','Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом','','',''),
  ('90','Вам просто нужно угадать последние цифры хеша любого десятитысячного блока','Вам просто нужно угадать последние цифры хеша любого десятитысячного блока','','',''),
  ('91','Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере','Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере','','',''),
  ('92','Преимущества нашей лотереи','Преимущества нашей лотереи','','',''),
  ('93','Любой может иметь шанс на выигрыш','Любой может иметь шанс на выигрыш','','',''),
  ('94','Любой может проверить на честность результат','Любой может проверить на честность результат','','',''),
  ('95','даже тот кто не участвует в лотерее','даже тот кто не участвует в лотерее','','',''),
  ('96','Никто не может подкрутить результаты т.к результат не известен до окончания лотереи','Никто не может подкрутить результаты т.к результат не известен до окончания лотереи','','',''),
  ('97','Подробнее о условиях лотереи вы можете посмотреть на сайте','Подробнее о условиях лотереи вы можете посмотреть на сайте','','',''),
  ('98','Перейти','Перейти','Go to ','',''),
  ('99','Перейти','Перейти','Go to','',''),
  ('100','Лотерея','Лотерея','Lottery','',''),
  ('101','Честная лотерея на блокчейне LONG','Честная лотерея на блокчейне LONG','Fair lottery on the LONG blockchain','',''),
  ('102','Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом','Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом','We propose to test the transparent lottery based on the LONG blockchain, in order to check the honesty of which you do not need to be a specialist','',''),
  ('103','Вам просто нужно угадать последние цифры хеша любого десятитысячного блока','Вам просто нужно угадать последние цифры хеша любого десятитысячного блока','You just have to guess the last hash digits of any 10K block','',''),
  ('104','Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере','Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере','You can check the balance of the lottery wallet at any time in the explorer ','',''),
  ('105','Преимущества нашей лотереи','Преимущества нашей лотереи','','',''),
  ('106','Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере','Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере','You can check the balance of the lottery wallet at any time in the explorer','',''),
  ('107','Вам просто нужно угадать последние цифры хеша любого десятитысячного блока','Вам просто нужно угадать последние цифры хеша любого десятитысячного блока','You just have to guess the last hash digits of any 10K block','',''),
  ('108','Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом','Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом','We propose to test the transparent lottery based on the LONG blockchain, in order to check the honesty of which you do not need to be a specialist','',''),
  ('109','Преимущества нашей лотереи','Преимущества нашей лотереи','Benefits of our lottery','',''),
  ('110','Любой может иметь шанс на выигрыш','Любой может иметь шанс на выигрыш','Anyone can have a chance to win','',''),
  ('111','Любой может проверить на честность результат','Любой может проверить на честность результат','Anyone can check the honesty of the result','',''),
  ('112','даже тот кто не участвует в лотерее','даже тот кто не участвует в лотерее','even someone who does not participate in the lottery','',''),
  ('113','Никто не может подкрутить результаты т.к результат не известен до окончания лотереи','Никто не может подкрутить результаты т.к результат не известен до окончания лотереи','Nobody can tweak the results because the result is not known until the end of the lottery','',''),
  ('114','Подробнее о условиях лотереи вы можете посмотреть на сайте','Подробнее о условиях лотереи вы можете посмотреть на сайте','You can find out more about the conditions of the lottery on the website','',''),
  ('115','parent_info','8','','',''),
  ('116','parent_info','8','10','',''),
  ('117','parent_lang','ru','en','sp','ch'),
  ('118','parent_id','8','15','','');


# --------------------------------------------------------

#
# Table structure for table `coin_manager_log`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_manager_log`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(46) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1768 DEFAULT CHARSET=utf8mb4 COMMENT='Contains a record of user interaction.';

#
# Dumping data for table `coin_manager_log`
#

INSERT INTO `coin_manager_log` VALUES
  ('1','1618594661','1','gumoviy','58','-','MODX','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('2','1618594664','1','gumoviy','17','-','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('3','1618594686','1','gumoviy','30','-','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('4','1618594747','1','gumoviy','27','1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('5','1618594771','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('6','1618594771','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('7','1618594777','1','gumoviy','112','2','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('8','1618594825','1','gumoviy','112','2','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('9','1618594830','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('10','1618594845','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('11','1618594852','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('12','1618594857','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('13','1618594876','1','gumoviy','22','11','evoBabel','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('14','1618594891','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('15','1618596423','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('16','1618596434','1','gumoviy','5','-','ru','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('17','1618596435','1','gumoviy','27','2','ru','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('18','1618596445','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('19','1618596449','1','gumoviy','5','-','en','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('20','1618596449','1','gumoviy','27','3','en','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('21','1618596451','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('22','1618596457','1','gumoviy','5','-','sp','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('23','1618596457','1','gumoviy','27','4','sp','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('24','1618596460','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('25','1618596463','1','gumoviy','5','-','ch','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('26','1618596463','1','gumoviy','27','5','ch','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('27','1618596485','1','gumoviy','19','-','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('28','1618596530','1','gumoviy','20','-','lang','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('29','1618596531','1','gumoviy','16','4','lang','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('30','1618596560','1','gumoviy','5','2','RU','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('31','1618596560','1','gumoviy','27','2','RU','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('32','1618596567','1','gumoviy','5','3','EN','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('33','1618596567','1','gumoviy','27','3','EN','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('34','1618596573','1','gumoviy','5','4','SP','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('35','1618596574','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('36','1618596580','1','gumoviy','5','5','CH','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('37','1618596580','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('38','1618596588','1','gumoviy','27','2','RU','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('39','1618596590','1','gumoviy','5','2','RU','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('40','1618596591','1','gumoviy','27','2','RU','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('41','1618596595','1','gumoviy','27','3','EN','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('42','1618596597','1','gumoviy','5','3','EN','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('43','1618596597','1','gumoviy','27','3','EN','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('44','1618596606','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('45','1618596608','1','gumoviy','5','4','SP','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('46','1618596609','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('47','1618596613','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('48','1618596615','1','gumoviy','5','5','CH','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('49','1618596616','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('50','1618596646','1','gumoviy','17','-','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('51','1618596664','1','gumoviy','30','-','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('52','1618596699','1','gumoviy','27','2','RU','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('53','1618596725','1','gumoviy','5','2','RU','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('54','1618596725','1','gumoviy','27','2','RU','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('55','1618596744','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('56','1618596810','1','gumoviy','302','5','Языковые связи','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('57','1618596811','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('58','1618596833','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('59','1618596849','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('60','1618596873','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('61','1618596881','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('62','1618596886','1','gumoviy','108','3','evoBabelLexicon','Edit module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('63','1618596912','1','gumoviy','109','3','evoBabelLexicon','Saving module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('64','1618596912','1','gumoviy','108','3','evoBabelLexicon','Edit module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('65','1618596936','1','gumoviy','109','3','evoBabelLexicon','Saving module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('66','1618596937','1','gumoviy','108','3','evoBabelLexicon','Edit module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('67','1618596939','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('68','1618596961','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('69','1618596981','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('70','1618596994','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('71','1618596995','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('72','1618597152','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('73','1618597156','1','gumoviy','108','3','evoBabelLexicon','Edit module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('74','1618597192','1','gumoviy','22','11','evoBabel','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('75','1618597209','1','gumoviy','24','11','evoBabel','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('76','1618597209','1','gumoviy','22','11','evoBabel','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('77','1618597260','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('78','1618597277','1','gumoviy','16','3','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('79','1618597289','1','gumoviy','20','3','Minimal Template','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('80','1618597290','1','gumoviy','16','3','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('81','1618597293','1','gumoviy','24','11','evoBabel','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('82','1618597293','1','gumoviy','22','11','evoBabel','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('83','1618597340','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('84','1618597341','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('85','1618597363','1','gumoviy','20','3','Minimal Template','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('86','1618597363','1','gumoviy','16','3','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('87','1618597443','1','gumoviy','27','2','RU','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('88','1618597445','1','gumoviy','27','3','EN','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('89','1618597453','1','gumoviy','5','3','EN','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('90','1618597453','1','gumoviy','27','3','EN','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('91','1618597455','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('92','1618597462','1','gumoviy','5','4','SP','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('93','1618597463','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('94','1618597464','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('95','1618597470','1','gumoviy','5','5','CH','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('96','1618597471','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('97','1618597498','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('98','1618597502','1','gumoviy','94','1','Копия LONG Coin','Duplicate resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('99','1618597502','1','gumoviy','3','6','Копия LONG Coin','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('100','1618597515','1','gumoviy','27','6','Копия LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('101','1618597531','1','gumoviy','5','6','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('102','1618597531','1','gumoviy','27','6','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('103','1618597534','1','gumoviy','5','6','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('104','1618597535','1','gumoviy','27','6','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('105','1618597547','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('106','1618597551','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('107','1618597553','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('108','1618597561','1','gumoviy','6','6','LONG Coin','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('109','1618597562','1','gumoviy','3','3','EN','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('110','1618597569','1','gumoviy','64','-','-','Removing deleted content','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('111','1618597573','1','gumoviy','27','7','LONG Coin (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('112','1618597579','1','gumoviy','5','7','LONG Coin (English)','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('113','1618597579','1','gumoviy','27','7','LONG Coin (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('114','1618597593','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('115','1618597593','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('116','1618597667','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('117','1618597668','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('118','1618597704','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('119','1618597704','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('120','1618597738','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('121','1618597738','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('122','1618598843','1','gumoviy','102','12','evoBabelPlaceholder','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('123','1618598878','1','gumoviy','22','12','lang','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('124','1618598906','1','gumoviy','22','11','evoBabel','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('125','1618598921','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('126','1618598954','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('127','1618598954','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('128','1618598999','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('129','1618599000','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('130','1618599046','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('131','1618599047','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('132','1618599087','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('133','1618599087','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('134','1618599216','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('135','1618599320','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('136','1618599320','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('137','1618599547','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('138','1618599548','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('139','1618599558','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('140','1618599559','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('141','1618599819','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('142','1618599821','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('143','1618599959','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('144','1618599967','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('145','1618599987','1','gumoviy','16','3','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('146','1618600056','1','gumoviy','20','3','Minimal Template','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('147','1618600056','1','gumoviy','16','3','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('148','1618600065','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('149','1618600229','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('150','1618600230','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('151','1618600236','1','gumoviy','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('152','1618600347','1','gumoviy','79','-','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('153','1618600347','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('154','1618600410','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('155','1618600411','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('156','1618600427','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('157','1618600427','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('158','1618600500','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('159','1618600501','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('160','1618600618','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('161','1618600619','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('162','1618600632','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('163','1618600632','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('164','1618600674','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('165','1618600675','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('166','1618603189','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('167','1618603190','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('168','1618603671','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('169','1618603672','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('170','1618603768','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('171','1618603769','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('172','1618604061','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('173','1618604062','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('174','1618604387','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('175','1618604387','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('176','1618604582','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('177','1618604583','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('178','1618604627','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('179','1618604627','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('180','1618604659','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('181','1618604664','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('182','1618604753','1','gumoviy','102','12','evoBabelPlaceholder','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('183','1618604913','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('184','1618604935','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('185','1618604935','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('186','1618604957','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('187','1618604958','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('188','1618605776','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('189','1618605780','1','gumoviy','108','3','evoBabelLexicon','Edit module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('190','1618605867','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('191','1618605868','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('192','1618606076','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('193','1618606077','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('194','1618606189','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('195','1618606190','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('196','1618606198','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('197','1618606256','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('198','1618606282','1','gumoviy','103','11','evoBabel','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('199','1618606282','1','gumoviy','102','11','evoBabel','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('200','1618606286','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('201','1618606292','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('202','1618606301','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('203','1618606338','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('204','1618606354','1','gumoviy','108','3','evoBabelLexicon','Edit module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('205','1618606416','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('206','1618606437','1','gumoviy','302','5','Языковые связи','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('207','1618606437','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('208','1618606445','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('209','1618606528','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('210','1618606529','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('211','1618606537','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('212','1618606630','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('213','1618606659','1','gumoviy','302','-','zzz','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('214','1618606660','1','gumoviy','301','6','zzz','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('215','1618606667','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('216','1618606679','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('217','1618606679','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('218','1618606681','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('219','1618606688','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('220','1618606688','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('221','1618606716','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('222','1618606722','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('223','1618606821','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('224','1618606853','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('225','1618606854','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('226','1618606865','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('227','1618606922','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('228','1618606922','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('229','1618606937','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('230','1618607139','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('231','1618607140','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('232','1618607152','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('233','1618607153','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('234','1618607154','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('235','1618607160','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('236','1618607161','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('237','1618607169','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('238','1618607174','1','gumoviy','303','6','zzz','Delete Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('239','1618607175','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('240','1618607193','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('241','1618607242','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('242','1618607243','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('243','1618607338','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('244','1618607338','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('245','1618607591','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('246','1618607592','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('247','1618607865','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('248','1618607865','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('249','1618608014','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('250','1618608014','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('251','1618608081','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('252','1618608082','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('253','1618608146','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('254','1618608147','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('255','1618608346','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('256','1618608346','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('257','1618609093','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('258','1618609131','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('259','1618609144','1','gumoviy','302','-','Текст в слайде','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('260','1618609144','1','gumoviy','301','7','Текст в слайде','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('261','1618609157','1','gumoviy','302','7','Текст в слайде','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('262','1618609158','1','gumoviy','301','7','Текст в слайде','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('263','1618609165','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('264','1618609190','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('265','1618609191','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('266','1618609219','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('267','1618609219','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('268','1618609224','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('269','1618609305','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('270','1618609306','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('271','1618609434','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('272','1618609435','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('273','1618609481','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('274','1618609481','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('275','1618609517','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('276','1618609518','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('277','1618609536','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('278','1618609537','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('279','1618609870','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('280','1618609871','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('281','1618610105','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('282','1618610105','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('283','1618610296','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('284','1618610296','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('285','1618610479','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('286','1618610479','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('287','1618610548','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('288','1618610548','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('289','1618611387','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('290','1618611391','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('291','1618611482','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('292','1618611482','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('293','1618611662','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('294','1618611662','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('295','1618611679','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('296','1618611680','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('297','1618829543','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('298','1618829544','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('299','1618829575','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('300','1618829576','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('301','1618829592','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('302','1618829593','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('303','1618830465','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('304','1618830466','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('305','1618830488','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('306','1618830489','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('307','1618830622','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('308','1618830622','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('309','1618830958','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('310','1618830959','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('311','1618831052','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('312','1618831053','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('313','1618831187','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('314','1618831188','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('315','1618831219','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('316','1618831220','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('317','1618831525','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('318','1618831526','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('319','1618843047','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('320','1618843048','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('321','1618843125','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('322','1618843125','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('323','1618843233','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('324','1618843233','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('325','1618843474','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('326','1618843475','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('327','1618843584','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('328','1618843585','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('329','1618844299','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('330','1618844299','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('331','1618844351','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('332','1618844352','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('333','1618844871','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('334','1618844872','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('335','1618844919','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('336','1618844920','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('337','1618844967','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('338','1618844967','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('339','1618845736','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('340','1618845737','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('341','1618845909','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('342','1618845910','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('343','1618846059','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('344','1618846060','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('345','1618846089','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('346','1618846089','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('347','1618846116','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('348','1618846117','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('349','1618846135','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('350','1618846135','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('351','1618846252','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('352','1618846253','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('353','1618846297','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('354','1618846297','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('355','1618846401','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('356','1618846401','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('357','1618846547','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('358','1618846548','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('359','1618846705','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('360','1618846706','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('361','1618846741','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('362','1618846742','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('363','1618847294','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('364','1618847295','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('365','1618847509','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('366','1618847509','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('367','1618847540','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('368','1618847540','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('369','1618847560','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('370','1618847561','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('371','1618847598','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('372','1618847598','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('373','1618847637','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('374','1618847637','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('375','1618847677','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('376','1618847678','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('377','1618847838','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('378','1618847838','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('379','1618847953','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('380','1618847953','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('381','1618847977','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('382','1618847977','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('383','1618848066','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('384','1618848067','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('385','1618848135','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('386','1618848135','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('387','1618848212','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('388','1618848212','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('389','1618848246','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('390','1618848247','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('391','1618848280','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('392','1618848281','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('393','1618848307','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('394','1618848307','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('395','1618848381','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('396','1618848381','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('397','1618848409','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('398','1618848410','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('399','1618848488','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('400','1618848489','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('401','1618848637','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('402','1618848638','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('403','1618848717','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('404','1618848718','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('405','1618848784','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('406','1618848784','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('407','1618848857','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('408','1618848858','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('409','1618908663','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('410','1618908664','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('411','1618908975','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('412','1618908976','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('413','1618909024','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('414','1618909024','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('415','1618909185','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('416','1618909186','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('417','1618909262','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('418','1618909263','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('419','1618909295','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('420','1618909296','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('421','1618909314','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('422','1618909315','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('423','1618909342','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('424','1618909343','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('425','1618909377','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('426','1618909378','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('427','1618909718','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('428','1618909719','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('429','1618909848','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('430','1618909848','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('431','1618910090','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('432','1618910091','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('433','1618910138','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('434','1618910139','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('435','1618910228','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('436','1618910228','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('437','1618910363','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('438','1618910363','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('439','1618910378','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('440','1618910379','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('441','1618910575','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('442','1618910576','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('443','1618910604','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('444','1618910604','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('445','1618910821','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('446','1618910821','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('447','1618910885','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('448','1618910886','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('449','1618911234','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('450','1618911235','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('451','1618911253','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('452','1618911254','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('453','1618911720','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('454','1618911721','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('455','1618911774','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('456','1618911775','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('457','1618911936','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('458','1618911936','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('459','1618911961','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('460','1618911962','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('461','1618912098','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('462','1618912098','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('463','1618912250','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('464','1618912250','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('465','1618912291','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('466','1618912292','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('467','1618912555','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('468','1618912555','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('469','1618912593','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('470','1618912594','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('471','1618912608','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('472','1618912609','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('473','1618912640','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('474','1618912640','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('475','1618926100','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('476','1618926100','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('477','1618926178','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('478','1618926179','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('479','1618926327','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('480','1618926328','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('481','1618926370','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('482','1618926371','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('483','1618926465','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('484','1618926466','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('485','1618926536','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('486','1618926537','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('487','1618926569','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('488','1618926569','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('489','1618926584','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('490','1618926584','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('491','1618926673','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('492','1618926673','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('493','1618926714','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('494','1618926714','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('495','1618926795','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('496','1618926795','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('497','1618926857','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('498','1618926857','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('499','1618926885','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('500','1618926886','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('501','1618926916','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('502','1618926917','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('503','1618926947','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('504','1618926948','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('505','1618927045','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('506','1618927045','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('507','1618927111','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('508','1618927112','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('509','1618927281','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('510','1618927282','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('511','1618927449','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('512','1618927450','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('513','1618927590','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('514','1618927591','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('515','1618927612','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('516','1618927613','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('517','1618927693','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('518','1618927694','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('519','1618927754','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('520','1618927755','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('521','1618927823','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('522','1618927823','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('523','1618927844','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('524','1618927845','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('525','1618927866','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('526','1618927867','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('527','1618928011','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('528','1618928012','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('529','1618928068','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('530','1618928069','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('531','1618928151','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('532','1618928152','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('533','1618928318','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('534','1618928319','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('535','1618928334','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('536','1618928334','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('537','1618928737','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('538','1618928738','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('539','1618928776','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('540','1618928777','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('541','1618928904','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('542','1618928904','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('543','1618929033','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('544','1618929034','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('545','1618929052','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('546','1618929052','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('547','1618929089','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('548','1618929090','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('549','1618929117','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('550','1618929118','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('551','1618929131','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('552','1618929132','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('553','1618929181','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('554','1618929182','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('555','1618929193','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('556','1618929194','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('557','1618929227','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('558','1618929227','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('559','1618929281','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('560','1618929282','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('561','1618929306','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('562','1618929306','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('563','1618929492','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('564','1618929492','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('565','1618929496','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('566','1618929497','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('567','1618931304','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('568','1618931305','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('569','1618931516','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('570','1618931516','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('571','1618931972','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('572','1618931973','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('573','1618931987','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('574','1618931988','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('575','1618933513','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('576','1618933513','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('577','1618933636','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('578','1618933637','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('579','1618933786','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('580','1618933786','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('581','1618933858','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('582','1618933859','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('583','1618934422','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('584','1618934422','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('585','1618934460','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('586','1618934461','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('587','1618934489','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('588','1618934490','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('589','1618934617','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('590','1618934618','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('591','1618934791','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('592','1618934792','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('593','1618938524','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('594','1618938525','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('595','1618938567','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('596','1618938568','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('597','1618938578','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('598','1618938579','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('599','1618939311','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('600','1618939312','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('601','1618940396','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('602','1618940397','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('603','1618940443','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('604','1618940444','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('605','1618940477','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('606','1618940477','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('607','1618940492','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('608','1618940493','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('609','1618940530','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('610','1618940531','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('611','1618940571','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('612','1618940572','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('613','1618940602','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('614','1618940603','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('615','1618940628','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('616','1618940629','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('617','1618940717','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('618','1618940717','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('619','1618940785','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('620','1618940786','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('621','1618940856','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('622','1618940856','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('623','1618940985','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('624','1618940986','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('625','1618941092','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('626','1618941093','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('627','1618941180','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('628','1618941181','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('629','1618941210','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('630','1618941211','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('631','1618941274','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('632','1618941275','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('633','1618941289','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('634','1618941290','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('635','1618941313','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('636','1618941314','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('637','1618941350','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('638','1618941351','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('639','1618941365','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('640','1618941366','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('641','1618941379','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('642','1618941380','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('643','1618941392','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('644','1618941393','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('645','1618941417','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('646','1618941417','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('647','1618941440','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('648','1618941441','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('649','1618941474','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('650','1618941474','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('651','1618941492','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('652','1618941493','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('653','1618941525','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('654','1618941526','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('655','1618941545','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('656','1618941546','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('657','1618941674','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('658','1618941675','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('659','1618941703','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('660','1618941704','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('661','1618999590','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('662','1618999591','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('663','1618999729','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('664','1618999730','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('665','1618999866','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('666','1618999867','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('667','1618999884','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('668','1618999885','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('669','1618999907','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('670','1618999907','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('671','1618999943','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('672','1618999944','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('673','1618999989','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('674','1618999990','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('675','1619000095','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('676','1619000096','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('677','1619000178','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('678','1619000179','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('679','1619000202','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('680','1619000203','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('681','1619000316','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('682','1619000317','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('683','1619000336','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('684','1619000337','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('685','1619000458','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('686','1619000458','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('687','1619000481','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('688','1619000481','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('689','1619000637','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('690','1619000638','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('691','1619000757','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('692','1619000758','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('693','1619000841','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('694','1619000842','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('695','1619000884','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('696','1619000885','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('697','1619003312','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('698','1619003313','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('699','1619003356','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('700','1619003357','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('701','1619003544','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('702','1619003545','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('703','1619003561','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('704','1619003562','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('705','1619003739','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('706','1619003740','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('707','1619003776','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('708','1619003777','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('709','1619003862','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('710','1619003863','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('711','1619004691','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('712','1619004692','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('713','1619004745','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('714','1619004745','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('715','1619004768','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('716','1619004769','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('717','1619005520','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('718','1619005521','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('719','1619005827','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('720','1619005828','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('721','1619005865','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('722','1619005865','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('723','1619006066','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('724','1619006066','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('725','1619006435','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('726','1619006435','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('727','1619006696','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('728','1619006697','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('729','1619006766','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('730','1619006767','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('731','1619007056','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('732','1619007057','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('733','1619007635','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('734','1619007636','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('735','1619007989','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('736','1619007989','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('737','1619008597','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('738','1619008598','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('739','1619008627','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('740','1619008628','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('741','1619008678','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('742','1619008679','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('743','1619008736','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('744','1619008736','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('745','1619008766','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('746','1619008767','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('747','1619008820','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('748','1619008821','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('749','1619008835','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('750','1619008836','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('751','1619008867','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('752','1619008868','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('753','1619008910','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('754','1619008910','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('755','1619008923','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('756','1619008924','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('757','1619008935','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('758','1619008935','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('759','1619008957','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('760','1619008958','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('761','1619009013','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('762','1619009014','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('763','1619009024','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('764','1619009024','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('765','1619009155','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('766','1619009156','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('767','1619009277','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('768','1619009278','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('769','1619009295','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('770','1619009296','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('771','1619009343','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('772','1619009343','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('773','1619009410','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('774','1619009411','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('775','1619016411','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('776','1619016412','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('777','1619016515','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('778','1619016516','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('779','1619016590','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('780','1619016591','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('781','1619016619','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('782','1619016620','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('783','1619017397','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('784','1619017397','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('785','1619017757','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('786','1619017758','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('787','1619019172','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('788','1619019173','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('789','1619019461','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('790','1619019462','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('791','1619022050','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('792','1619022051','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('793','1619022083','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('794','1619022084','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('795','1619022140','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('796','1619022144','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('797','1619022152','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('798','1619022158','1','gumoviy','116','-','-','Delete event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('799','1619022158','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('800','1619022339','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('801','1619022340','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('802','1619022419','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('803','1619022419','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('804','1619022442','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('805','1619022443','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('806','1619022546','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('807','1619022547','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('808','1619022949','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('809','1619022950','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('810','1619023006','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('811','1619023007','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('812','1619023065','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('813','1619023066','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('814','1619087493','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('815','1619087494','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('816','1619087556','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('817','1619087557','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('818','1619087664','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('819','1619087665','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('820','1619087687','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('821','1619087688','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('822','1619098956','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('823','1619098957','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('824','1619099082','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('825','1619099082','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('826','1619099093','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('827','1619099094','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('828','1619099487','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('829','1619099488','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('830','1619099523','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('831','1619099523','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('832','1619099804','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('833','1619099804','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('834','1619099904','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('835','1619099905','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('836','1619099936','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('837','1619099937','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('838','1619099981','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('839','1619099982','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('840','1619100013','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('841','1619100013','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('842','1619100041','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('843','1619100042','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('844','1619100089','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('845','1619100090','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('846','1619100341','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('847','1619100341','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('848','1619100376','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('849','1619100377','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('850','1619100423','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('851','1619100423','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('852','1619100496','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('853','1619100497','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('854','1619100552','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('855','1619100553','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('856','1619100597','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('857','1619100597','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('858','1619100744','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('859','1619100745','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('860','1619101483','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('861','1619101484','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('862','1619101561','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('863','1619101562','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('864','1619101643','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('865','1619101644','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('866','1619101690','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('867','1619101690','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('868','1619101768','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('869','1619101768','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('870','1619101856','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('871','1619101856','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('872','1619101905','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('873','1619101906','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('874','1619101926','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('875','1619101927','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('876','1619102030','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('877','1619102030','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('878','1619102057','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('879','1619102057','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('880','1619102089','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('881','1619102090','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('882','1619102228','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('883','1619102229','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('884','1619102339','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('885','1619102340','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('886','1619102381','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('887','1619102381','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('888','1619102467','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('889','1619102468','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('890','1619102537','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('891','1619102537','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('892','1619102617','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('893','1619102618','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('894','1619102696','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('895','1619102697','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('896','1619102707','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('897','1619102707','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('898','1619102987','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('899','1619102988','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('900','1619103011','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('901','1619103011','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('902','1619107471','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('903','1619107471','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('904','1619107500','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('905','1619107501','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('906','1619107646','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('907','1619107647','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('908','1619107663','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('909','1619107664','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('910','1619108163','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('911','1619108163','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('912','1619108177','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('913','1619108177','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('914','1619108292','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('915','1619108293','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('916','1619108346','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('917','1619108347','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('918','1619108387','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('919','1619108388','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('920','1619108419','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('921','1619108420','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('922','1619108613','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('923','1619108614','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('924','1619108802','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('925','1619108802','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('926','1619108864','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('927','1619108864','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('928','1619120805','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('929','1619120806','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('930','1619120962','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('931','1619120963','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('932','1619121002','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('933','1619121003','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('934','1619121090','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('935','1619121091','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('936','1619121146','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('937','1619121147','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('938','1619121246','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('939','1619121247','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('940','1619121400','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('941','1619121400','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('942','1619510940','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('943','1619510942','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('944','1619511009','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('945','1619511010','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('946','1619511021','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('947','1619511022','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('948','1619511954','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('949','1619511955','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('950','1619512559','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('951','1619512559','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('952','1619512675','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('953','1619512676','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('954','1619514269','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('955','1619514307','1','gumoviy','302','-','Файл для Windows версии','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('956','1619514307','1','gumoviy','301','8','Файл для Windows версии','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('957','1619514313','1','gumoviy','304','8','win-download Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('958','1619514314','1','gumoviy','301','9','Файл для Windows версии Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('959','1619514363','1','gumoviy','302','9','Файл для Linux версии 14.04','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('960','1619514363','1','gumoviy','301','9','Файл для Linux версии 14.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('961','1619514366','1','gumoviy','304','9','lnx-14-download Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('962','1619514366','1','gumoviy','301','10','Файл для Linux версии 14.04 Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('963','1619514379','1','gumoviy','302','10','Файл для Linux версии 16.04','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('964','1619514380','1','gumoviy','301','10','Файл для Linux версии 16.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('965','1619514383','1','gumoviy','304','10','lnx-16-download Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('966','1619514383','1','gumoviy','301','11','Файл для Linux версии 16.04 Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('967','1619514395','1','gumoviy','302','11','Файл для Linux версии 18.04','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('968','1619514395','1','gumoviy','301','11','Файл для Linux версии 18.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('969','1619514399','1','gumoviy','304','11','lnx-18-download Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('970','1619514400','1','gumoviy','301','12','Файл для Linux версии 18.04 Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('971','1619514431','1','gumoviy','302','12','Файл GitHub Full Source','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('972','1619514432','1','gumoviy','301','12','Файл GitHub Full Source','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('973','1619514765','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('974','1619514918','1','gumoviy','17','-','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('975','1619514961','1','gumoviy','30','-','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('976','1619514971','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('977','1619515269','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('978','1619515270','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('979','1619515341','1','gumoviy','301','12','Файл GitHub Full Source','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('980','1619515344','1','gumoviy','304','12','ghb-full-download Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('981','1619515345','1','gumoviy','301','13','Файл GitHub Full Source Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('982','1619515376','1','gumoviy','302','13','Инструкция простая','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('983','1619515376','1','gumoviy','301','13','Инструкция простая','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('984','1619515379','1','gumoviy','304','13','simple-tutorial-download Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('985','1619515379','1','gumoviy','301','14','Инструкция простая Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('986','1619515419','1','gumoviy','302','14','Инструкция полная','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('987','1619515420','1','gumoviy','301','14','Инструкция полная','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('988','1619515426','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('989','1619515787','1','gumoviy','301','14','Инструкция полная','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('990','1619515806','1','gumoviy','302','14','Инструкция по постам LongCoin Network','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('991','1619515806','1','gumoviy','301','14','Инструкция по постам LongCoin Network','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('992','1619515809','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('993','1619515835','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('994','1619515836','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('995','1619515922','1','gumoviy','301','14','Инструкция по постам LongCoin Network','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('996','1619515929','1','gumoviy','302','14','Инструкция по постам Long Network','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('997','1619515930','1','gumoviy','301','14','Инструкция по постам Long Network','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('998','1619515933','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('999','1619515946','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1000','1619515947','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1001','1619515966','1','gumoviy','22','4','DocInfo','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1002','1619516037','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1003','1619516050','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1004','1619516096','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1005','1619516096','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1006','1619516154','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1007','1619516154','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1008','1619516278','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1009','1619516279','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1010','1619516400','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1011','1619516496','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1012','1619516497','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1013','1619517522','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1014','1619517522','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1015','1619517592','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1016','1619517592','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1017','1619517712','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1018','1619517713','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1019','1619517862','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1020','1619517862','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1021','1619518695','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1022','1619518726','1','gumoviy','302','-','Ссылка на Twitter','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1023','1619518727','1','gumoviy','301','15','Ссылка на Twitter','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1024','1619518730','1','gumoviy','304','15','link-twitter Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1025','1619518730','1','gumoviy','301','16','Ссылка на Twitter Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1026','1619518742','1','gumoviy','302','16','Ссылка на Telegram','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1027','1619518743','1','gumoviy','301','16','Ссылка на Telegram','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1028','1619518746','1','gumoviy','304','16','link-telegram Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1029','1619518746','1','gumoviy','301','17','Ссылка на Telegram Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1030','1619518760','1','gumoviy','302','17','Ссылка на Discord','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1031','1619518761','1','gumoviy','301','17','Ссылка на Discord','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1032','1619518766','1','gumoviy','302','17','Ссылка на Discord','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1033','1619518766','1','gumoviy','301','17','Ссылка на Discord','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1034','1619518769','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1035','1619518772','1','gumoviy','301','15','Ссылка на Twitter','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1036','1619518777','1','gumoviy','302','15','Ссылка на Twitter','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1037','1619518777','1','gumoviy','301','15','Ссылка на Twitter','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1038','1619518779','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1039','1619518781','1','gumoviy','301','16','Ссылка на Telegram','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1040','1619518786','1','gumoviy','302','16','Ссылка на Telegram','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1041','1619518786','1','gumoviy','301','16','Ссылка на Telegram','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1042','1619518813','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1043','1619518844','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1044','1619518844','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1045','1619518931','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1046','1619518931','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1047','1619518946','1','gumoviy','22','7','if','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1048','1619519038','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1049','1619519039','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1050','1619519116','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('1051','1619519116','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1052','1619519650','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1053','1619519928','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1054','1619519929','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1055','1619520031','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1056','1619520032','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1057','1619520460','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1058','1619520460','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1059','1619520657','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1060','1619520710','1','gumoviy','302','-','Текст установки кошелька','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1061','1619520711','1','gumoviy','301','18','Текст установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1062','1619520735','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1063','1619520736','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1064','1619520746','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1065','1619520757','1','gumoviy','302','18','Текст установки кошелька','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1066','1619520758','1','gumoviy','301','18','Текст установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1067','1619520761','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1068','1619520779','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1069','1619520780','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1070','1619520782','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1071','1619520806','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1072','1619520807','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1073','1619520818','1','gumoviy','304','18','wallet-instalation Копия','Duplicate Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1074','1619520819','1','gumoviy','301','19','Текст установки кошелька Duplicate ','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1075','1619520840','1','gumoviy','302','19','Текст предупреждения установки кошелька','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1076','1619520840','1','gumoviy','301','19','Текст предупреждения установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1077','1619520843','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1078','1619520895','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1079','1619520895','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1080','1619520902','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1081','1619520918','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1082','1619520919','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1083','1619520962','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1084','1619520963','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1085','1619521089','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1086','1619521090','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1087','1619521140','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1088','1619521143','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1089','1619521150','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1090','1619521153','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1091','1619521205','1','gumoviy','112','2','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1092','1619521239','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1093','1619521277','1','gumoviy','302','-','Полезные ссылки','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1094','1619521277','1','gumoviy','301','20','Полезные ссылки','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1095','1619521486','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1096','1619521487','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1097','1619521622','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1098','1619521622','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1099','1619521639','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1100','1619521691','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1101','1619521692','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1102','1619521726','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1103','1619521727','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1104','1619521837','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1105','1619521837','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1106','1619521875','1','gumoviy','300','-','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1107','1619521912','1','gumoviy','302','-','Полезные ссылки - сервисы','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1108','1619521913','1','gumoviy','301','21','Полезные ссылки - сервисы','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1109','1619521919','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1110','1619521947','1','gumoviy','301','21','Полезные ссылки - сервисы','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1111','1619521951','1','gumoviy','302','21','Полезные ссылки - сервисы','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1112','1619521952','1','gumoviy','301','21','Полезные ссылки - сервисы','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1113','1619521960','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1114','1619522214','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1115','1619522214','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1116','1619522364','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1117','1619522365','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1118','1619522375','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1119','1619522394','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1120','1619522629','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1121','1619522630','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1122','1619522636','1','gumoviy','5','1','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1123','1619522637','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1124','1619522806','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1125','1619522807','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1126','1619523011','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1127','1619523012','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1128','1619523079','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1129','1619523080','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1130','1619523457','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1131','1619523457','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1132','1619523545','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1133','1619523545','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1134','1619524008','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1135','1619524009','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1136','1619524247','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1137','1619524247','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1138','1619524385','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1139','1619524386','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1140','1619524688','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1141','1619524698','1','gumoviy','5','5','CH','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1142','1619524699','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1143','1619524728','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1144','1619524733','1','gumoviy','5','4','SP','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1145','1619524734','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1146','1619524907','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1147','1619524908','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1148','1619524948','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1149','1619524949','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1150','1619525332','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1151','1619525333','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1152','1619525423','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1153','1619525424','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1154','1619526272','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1155','1619526273','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1156','1619526281','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1157','1619526282','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1158','1619526429','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1159','1619526430','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1160','1619526448','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1161','1619526449','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1162','1619526865','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1163','1619526866','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1164','1619526897','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1165','1619526897','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1166','1619526908','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1167','1619526909','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1168','1619527186','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1169','1619527187','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1170','1619527216','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1171','1619527217','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1172','1619527324','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1173','1619527325','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1174','1619527332','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1175','1619527333','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1176','1619527359','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1177','1619527360','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1178','1619527377','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1179','1619527378','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1180','1619527392','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1181','1619527393','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1182','1619527415','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1183','1619527416','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1184','1619527433','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1185','1619527434','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1186','1619527449','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1187','1619527450','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1188','1619527471','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1189','1619527471','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1190','1619527483','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1191','1619527484','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1192','1619527581','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1193','1619527582','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1194','1619527601','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1195','1619527602','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1196','1619527621','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1197','1619527622','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1198','1619527640','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1199','1619527640','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1200','1619527653','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1201','1619527654','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1202','1619527667','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1203','1619527667','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1204','1619527688','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1205','1619527688','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1206','1619527730','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1207','1619527730','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1208','1619527758','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1209','1619527759','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1210','1619527836','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1211','1619527836','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1212','1619527906','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1213','1619527907','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1214','1619527924','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1215','1619527925','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1216','1619527989','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1217','1619527990','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1218','1619528025','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1219','1619528026','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1220','1619528090','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1221','1619528090','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1222','1619528210','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1223','1619528211','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1224','1619528274','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1225','1619528275','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1226','1619528292','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1227','1619528293','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1228','1619528590','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1229','1619528591','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1230','1619528639','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1231','1619528640','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1232','1619528705','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1233','1619528706','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1234','1619528926','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1235','1619528927','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1236','1619528976','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1237','1619528977','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1238','1619529026','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1239','1619529027','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1240','1619529171','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1241','1619529171','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1242','1619529220','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1243','1619529220','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1244','1619529248','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1245','1619529249','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1246','1619529302','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1247','1619529302','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1248','1619529342','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1249','1619529343','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1250','1619529722','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1251','1619529723','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1252','1619529924','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1253','1619529924','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1254','1619530116','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1255','1619530117','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1256','1619530227','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('1257','1619530228','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1258','1619530616','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1259','1619530617','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1260','1619530688','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1261','1619530689','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1262','1619532392','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1263','1619532393','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1264','1619533951','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1265','1619533954','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1266','1619533957','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1267','1619535345','1','gumoviy','53','-','-','Viewing system info','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1268','1619539244','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1269','1619539245','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1270','1619587920','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1271','1619587921','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1272','1619590485','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1273','1619590493','1','gumoviy','305','-','-','Idle (unknown)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1274','1619590499','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1275','1619590505','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1276','1619590508','1','gumoviy','301','12','Файл GitHub Full Source','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1277','1619590517','1','gumoviy','302','12','Файл GitHub Full Source','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1278','1619590517','1','gumoviy','301','12','Файл GitHub Full Source','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1279','1619590520','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1280','1619590525','1','gumoviy','301','9','Файл для Linux версии 14.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1281','1619590529','1','gumoviy','302','9','Файл для Linux версии 14.04','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1282','1619590530','1','gumoviy','301','9','Файл для Linux версии 14.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1283','1619590532','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1284','1619590534','1','gumoviy','301','10','Файл для Linux версии 16.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1285','1619590538','1','gumoviy','302','10','Файл для Linux версии 16.04','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1286','1619590538','1','gumoviy','301','10','Файл для Linux версии 16.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1287','1619590541','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1288','1619590544','1','gumoviy','301','11','Файл для Linux версии 18.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1289','1619590548','1','gumoviy','302','11','Файл для Linux версии 18.04','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1290','1619590548','1','gumoviy','301','11','Файл для Linux версии 18.04','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1291','1619590551','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1292','1619590553','1','gumoviy','301','13','Инструкция простая','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1293','1619590557','1','gumoviy','302','13','Инструкция простая','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1294','1619590558','1','gumoviy','301','13','Инструкция простая','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1295','1619590559','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1296','1619590562','1','gumoviy','301','14','Инструкция по постам Long Network','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1297','1619590565','1','gumoviy','302','14','Инструкция по постам Long Network','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1298','1619590566','1','gumoviy','301','14','Инструкция по постам Long Network','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1299','1619590569','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1300','1619590574','1','gumoviy','301','8','Файл для Windows версии','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1301','1619590578','1','gumoviy','302','8','Файл для Windows версии','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1302','1619590579','1','gumoviy','301','8','Файл для Windows версии','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1303','1619590580','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1304','1619590585','1','gumoviy','301','17','Ссылка на Discord','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1305','1619590597','1','gumoviy','302','17','Ссылка на Discord','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1306','1619590598','1','gumoviy','301','17','Ссылка на Discord','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1307','1619590600','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1308','1619590602','1','gumoviy','301','16','Ссылка на Telegram','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1309','1619590606','1','gumoviy','302','16','Ссылка на Telegram','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1310','1619590607','1','gumoviy','301','16','Ссылка на Telegram','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1311','1619590609','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1312','1619590612','1','gumoviy','301','15','Ссылка на Twitter','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1313','1619590616','1','gumoviy','302','15','Ссылка на Twitter','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1314','1619590616','1','gumoviy','301','15','Ссылка на Twitter','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1315','1619590618','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1316','1619590622','1','gumoviy','301','21','Полезные ссылки - сервисы','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1317','1619590626','1','gumoviy','302','21','Полезные ссылки - сервисы','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1318','1619590627','1','gumoviy','301','21','Полезные ссылки - сервисы','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1319','1619590628','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1320','1619590632','1','gumoviy','301','1','Meta description','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1321','1619590640','1','gumoviy','302','1','Meta description','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1322','1619590640','1','gumoviy','301','1','Meta description','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1323','1619590642','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1324','1619590644','1','gumoviy','301','2','Meta keywords','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1325','1619590649','1','gumoviy','302','2','Meta keywords','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1326','1619590650','1','gumoviy','301','2','Meta keywords','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1327','1619590652','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1328','1619590655','1','gumoviy','301','3','No index page','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1329','1619590661','1','gumoviy','302','3','No index page','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1330','1619590662','1','gumoviy','301','3','No index page','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1331','1619590664','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1332','1619590673','1','gumoviy','301','4','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1333','1619590678','1','gumoviy','302','4','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1334','1619590678','1','gumoviy','301','4','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1335','1619590680','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1336','1619590682','1','gumoviy','301','20','Полезные ссылки','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1337','1619590686','1','gumoviy','302','20','Полезные ссылки','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1338','1619590686','1','gumoviy','301','20','Полезные ссылки','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1339','1619590689','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1340','1619590692','1','gumoviy','301','7','Текст в слайде','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1341','1619590704','1','gumoviy','302','7','Текст в слайде','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1342','1619590705','1','gumoviy','301','7','Текст в слайде','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1343','1619590708','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1344','1619590711','1','gumoviy','301','18','Текст установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1345','1619590715','1','gumoviy','302','18','Текст установки кошелька','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1346','1619590716','1','gumoviy','301','18','Текст установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1347','1619590718','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1348','1619590721','1','gumoviy','301','19','Текст предупреждения установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1349','1619590725','1','gumoviy','302','19','Текст предупреждения установки кошелька','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1350','1619590726','1','gumoviy','301','19','Текст предупреждения установки кошелька','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1351','1619590731','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1352','1619590760','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1353','1619590764','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1354','1619590777','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1355','1619590778','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1356','1619590784','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1357','1619590790','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1358','1619590791','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1359','1619590795','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1360','1619590798','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1361','1619590801','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1362','1619590809','1','gumoviy','106','-','-','Viewing Modules','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1363','1619590814','1','gumoviy','112','2','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1364','1619590832','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1365','1619590909','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1366','1619590910','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1367','1619590913','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1368','1619590926','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1369','1619590926','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1370','1619590929','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1371','1619590959','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1372','1619590965','1','gumoviy','5','4','SP','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1373','1619590966','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1374','1619590968','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1375','1619590971','1','gumoviy','5','5','CH','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1376','1619590972','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1377','1619591043','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1378','1619591053','1','gumoviy','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1379','1619591057','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1380','1619591061','1','gumoviy','19','-','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1381','1619591146','1','gumoviy','20','-','blank','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1382','1619591147','1','gumoviy','16','5','blank','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1383','1619591156','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1384','1619591169','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1385','1619591169','1','gumoviy','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1386','1619591232','1','gumoviy','5','-','Инструкции','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1387','1619591232','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1388','1619591306','1','gumoviy','20','5','instruction-modal','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1389','1619591306','1','gumoviy','16','5','instruction-modal','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1390','1619591404','1','gumoviy','20','5','instruction-modal','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1391','1619591405','1','gumoviy','16','5','instruction-modal','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1392','1619591466','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1393','1619591473','1','gumoviy','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1394','1619591473','1','gumoviy','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1395','1619591574','1','gumoviy','5','-','Установка на Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1396','1619591574','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1397','1619591620','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1398','1619591707','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1399','1619591713','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1400','1619591829','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1401','1619591830','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1402','1619591877','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1403','1619591877','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1404','1619591883','1','gumoviy','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1405','1619591925','1','gumoviy','20','5','instruction-modal','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1406','1619591925','1','gumoviy','16','5','instruction-modal','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1407','1619591952','1','gumoviy','79','-','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1408','1619591953','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1409','1619592003','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1410','1619592003','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1411','1619592027','1','gumoviy','20','5','instruction-content','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1412','1619592028','1','gumoviy','16','5','instruction-content','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1413','1619592068','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1414','1619592086','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1415','1619592100','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1416','1619592101','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1417','1619592117','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1418','1619592117','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1419','1619592147','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1420','1619592147','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1421','1619592291','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1422','1619592291','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1423','1619592370','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1424','1619592370','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1425','1619592377','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1426','1619592378','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1427','1619592492','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1428','1619592493','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1429','1619592552','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1430','1619592581','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1431','1619592582','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1432','1619595512','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1433','1619595513','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1434','1619595771','1','gumoviy','22','12','lang','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1435','1619595804','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1436','1619595804','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1437','1619595819','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1438','1619595820','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1439','1619595839','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1440','1619595839','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1441','1619595894','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1442','1619595894','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1443','1619595940','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1444','1619595941','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1445','1619595975','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1446','1619596017','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1447','1619596018','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1448','1619596021','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1449','1619596043','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1450','1619596260','1','gumoviy','112','3','evoBabelLexicon','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1451','1619596301','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1452','1619596312','1','gumoviy','5','8','Инструкции','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1453','1619596313','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1454','1619596330','1','gumoviy','94','8','Копия Инструкции','Duplicate resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1455','1619596331','1','gumoviy','3','10','Копия Инструкции','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1456','1619596333','1','gumoviy','27','10','Копия Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1457','1619596371','1','gumoviy','5','10','Instructions','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1458','1619596372','1','gumoviy','27','10','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1459','1619596381','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('1460','1619596396','1','gumoviy','5','10','Instructions','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1461','1619596397','1','gumoviy','27','10','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1462','1619596406','1','gumoviy','27','11','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1463','1619596410','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1464','1619596421','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1465','1619596429','1','gumoviy','302','5','Языковые связи','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1466','1619596429','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1467','1619596448','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1468','1619596454','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1469','1619596466','1','gumoviy','27','11','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1470','1619596482','1','gumoviy','5','9','Установка на Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1471','1619596483','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1472','1619596509','1','gumoviy','16','5','instruction-content','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1473','1619596528','1','gumoviy','20','5','instruction-content','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1474','1619596528','1','gumoviy','16','5','instruction-content','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1475','1619596538','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1476','1619596547','1','gumoviy','27','11','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1477','1619596568','1','gumoviy','5','11','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1478','1619596568','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1479','1619596575','1','gumoviy','5','11','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1480','1619596576','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1481','1619596723','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1482','1619596723','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1483','1619596776','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1484','1619596776','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1485','1619597165','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1486','1619597166','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1487','1619597225','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1488','1619597226','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1489','1619597246','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1490','1619597246','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1491','1619597260','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1492','1619597261','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1493','1619597290','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1494','1619597291','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1495','1619597752','1','gumoviy','5','9','Установка на Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1496','1619597752','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1497','1619597763','1','gumoviy','5','11','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1498','1619597764','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1499','1619597791','1','gumoviy','27','10','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1500','1619597794','1','gumoviy','6','10','Instructions','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1501','1619597794','1','gumoviy','3','3','EN','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1502','1619597801','1','gumoviy','64','-','-','Removing deleted content','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1503','1619597957','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1504','1619597957','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1505','1619597974','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1506','1619597975','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1507','1619598013','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1508','1619598014','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1509','1619598067','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1510','1619598087','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1511','1619598087','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1512','1619598133','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1513','1619598134','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1514','1619598157','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1515','1619598172','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1516','1619598173','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1517','1619598264','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1518','1619598265','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1519','1619598287','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1520','1619598312','1','gumoviy','5','11','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1521','1619598313','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1522','1619598370','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1523','1619598395','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1524','1619598396','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1525','1619598444','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1526','1619598445','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1527','1619598773','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1528','1619598779','1','gumoviy','302','5','Языковые связи','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1529','1619598780','1','gumoviy','301','5','Языковые связи','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1530','1619598791','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1531','1619598794','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1532','1619598797','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1533','1619599147','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1534','1619599150','1','gumoviy','94','8','Копия Инструкции','Duplicate resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1535','1619599150','1','gumoviy','3','12','Копия Инструкции','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1536','1619599157','1','gumoviy','27','12','Копия Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1537','1619599207','1','gumoviy','5','12','Instructions','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1538','1619599208','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1539','1619599216','1','gumoviy','16','5','instruction-content','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1540','1619599232','1','gumoviy','20','5','instruction-content','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1541','1619599233','1','gumoviy','16','5','instruction-content','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1542','1619599244','1','gumoviy','20','5','instruction-content','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1543','1619599245','1','gumoviy','16','5','instruction-content','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1544','1619599255','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1545','1619599260','1','gumoviy','5','8','Инструкции','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1546','1619599260','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1547','1619599270','1','gumoviy','27','11','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1548','1619599282','1','gumoviy','6','11','Installation on Windows x64','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1549','1619599282','1','gumoviy','3','8','Инструкции','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1550','1619599285','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1551','1619599294','1','gumoviy','5','9','Установка на Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1552','1619599295','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1553','1619599301','1','gumoviy','27','14','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1554','1619599304','1','gumoviy','27','13','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1555','1619599308','1','gumoviy','6','13','Установка на Windows x64','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1556','1619599308','1','gumoviy','3','12','Instructions','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1557','1619599316','1','gumoviy','64','-','-','Removing deleted content','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1558','1619599332','1','gumoviy','5','14','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1559','1619599333','1','gumoviy','27','14','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1560','1619599368','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1561','1619599373','1','gumoviy','19','-','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1562','1619599412','1','gumoviy','20','-','blank','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1563','1619599413','1','gumoviy','16','6','blank','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1564','1619599434','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1565','1619599439','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1566','1619599441','1','gumoviy','5','8','Инструкции','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1567','1619599441','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1568','1619599443','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1569','1619599451','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1570','1619599453','1','gumoviy','5','12','Instructions','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1571','1619599453','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1572','1619599460','1','gumoviy','76','-','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1573','1619599463','1','gumoviy','16','6','blank','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1574','1619599484','1','gumoviy','20','6','blank','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1575','1619599485','1','gumoviy','16','6','blank','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1576','1619599489','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1577','1619599502','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1578','1619599526','1','gumoviy','6','12','Instructions','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1579','1619599526','1','gumoviy','3','3','EN','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1580','1619599528','1','gumoviy','27','3','EN','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1581','1619599534','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1582','1619599542','1','gumoviy','5','12','Instructions','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1583','1619599543','1','gumoviy','27','12','Instructions','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1584','1619599545','1','gumoviy','27','14','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1585','1619599549','1','gumoviy','5','14','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1586','1619599550','1','gumoviy','27','14','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1587','1619599562','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1588','1619599566','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1589','1619599568','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1590','1619599584','1','gumoviy','27','15','Инструкции (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1591','1619599612','1','gumoviy','5','15','Instructions (English)','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1592','1619599612','1','gumoviy','27','15','Instructions (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1593','1619599619','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1594','1619599623','1','gumoviy','27','15','Instructions (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1595','1619599626','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1596','1619599633','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1597','1619599634','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1598','1619599643','1','gumoviy','27','14','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1599','1619599667','1','gumoviy','27','16','Установка на Windows x64 (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1600','1619599691','1','gumoviy','5','16','Установка на Windows x64 (English)','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1601','1619599692','1','gumoviy','27','16','Установка на Windows x64 (English)','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1602','1619599695','1','gumoviy','27','14','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1603','1619599711','1','gumoviy','5','16','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1604','1619599712','1','gumoviy','27','16','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1605','1619599719','1','gumoviy','5','16','Installation on Windows x64','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1606','1619599720','1','gumoviy','27','16','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1607','1619599723','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1608','1619599727','1','gumoviy','27','16','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1609','1619599732','1','gumoviy','64','-','-','Removing deleted content','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1610','1619599847','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1611','1619599848','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1612','1619599863','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1613','1619599864','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1614','1619600046','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1615','1619600047','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1616','1619600226','1','gumoviy','27','4','SP','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1617','1619600236','1','gumoviy','27','5','CH','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1618','1619600244','1','gumoviy','27','8','Инструкции','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1619','1619600280','1','gumoviy','27','9','Установка на Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1620','1619600304','1','gumoviy','79','3','modalInfoTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1621','1619600305','1','gumoviy','78','3','modalInfoTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1622','1619600590','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1623','1619600593','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1624','1619600602','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1625','1619600605','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1626','1619601608','1','gumoviy','23','-','Новый сниппет','Creating a new Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1627','1619601618','1','gumoviy','24','-','Untitled snippet','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1628','1619601618','1','gumoviy','22','14','Untitled snippet','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1629','1619601687','1','gumoviy','24','14','sizeof','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1630','1619601688','1','gumoviy','22','14','sizeof','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1631','1619601754','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1632','1619601755','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1633','1619601805','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1634','1619601806','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1635','1619601860','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1636','1619601861','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1637','1619601883','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1638','1619601884','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1639','1619601919','1','gumoviy','23','-','Новый сниппет','Creating a new Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1640','1619601958','1','gumoviy','24','-','FileSize','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1641','1619601959','1','gumoviy','22','15','FileSize','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1642','1619601965','1','gumoviy','24','15','FileSize','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1643','1619601966','1','gumoviy','22','15','FileSize','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1644','1619601997','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1645','1619601998','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1646','1619602097','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1647','1619602098','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1648','1619602126','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1649','1619602127','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1650','1619602154','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1651','1619602218','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1652','1619602254','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1653','1619602255','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1654','1619602269','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1655','1619602317','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1656','1619602317','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1657','1619602381','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1658','1619602382','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1659','1619602506','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1660','1619602507','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1661','1619602569','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1662','1619602570','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1663','1619602595','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');

INSERT INTO `coin_manager_log` VALUES
  ('1664','1619602596','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1665','1619602672','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1666','1619602672','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1667','1619602734','1','gumoviy','24','15','FileSize','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1668','1619602735','1','gumoviy','22','15','FileSize','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1669','1619602855','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1670','1619602856','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1671','1619603101','1','gumoviy','22','15','FileSize','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1672','1619603409','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1673','1619603415','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1674','1619603526','1','gumoviy','79','2','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1675','1619603527','1','gumoviy','78','2','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1676','1619603586','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1677','1619603587','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1678','1619603593','1','gumoviy','24','15','FileSize','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1679','1619603593','1','gumoviy','22','15','FileSize','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1680','1619603777','1','gumoviy','22','14','sizeof','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1681','1619604417','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1682','1619604417','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1683','1619604495','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1684','1619604496','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1685','1619604563','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1686','1619604563','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1687','1619604592','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1688','1619604592','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1689','1619604613','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1690','1619604614','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1691','1619604659','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1692','1619604660','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1693','1619604690','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1694','1619604690','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1695','1619604738','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1696','1619604739','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1697','1619604796','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1698','1619604797','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1699','1619604825','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1700','1619604826','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1701','1619604915','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1702','1619604916','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1703','1619604947','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1704','1619604947','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1705','1619605025','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1706','1619605026','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1707','1619605084','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1708','1619605085','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1709','1619605183','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1710','1619605184','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1711','1619605303','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1712','1619605303','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1713','1619605409','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1714','1619605410','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1715','1619605511','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1716','1619605512','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1717','1619605559','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1718','1619605560','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1719','1619605601','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1720','1619605602','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1721','1619605640','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1722','1619605640','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1723','1619605757','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1724','1619605762','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1725','1619605766','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1726','1619606666','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1727','1619606666','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1728','1619606682','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1729','1619606683','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1730','1619609866','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1731','1619609867','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1732','1619610012','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1733','1619610013','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1734','1619610055','1','gumoviy','79','1','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1735','1619610056','1','gumoviy','78','1','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1736','1619610132','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1737','1619610133','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1738','1619610177','1','gumoviy','20','3','index','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1739','1619610177','1','gumoviy','16','3','index','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1740','1619610218','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1741','1619610220','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1742','1619610223','1','gumoviy','116','-','-','Delete event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1743','1619610224','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1744','1619610229','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1745','1619610233','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1746','1619611027','1','gumoviy','27','16','Installation on Windows x64','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1747','1619611030','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1748','1619611034','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1749','1619611077','1','gumoviy','5','7','LONG Coin','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1750','1619611078','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1751','1619611132','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1752','1619611141','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1753','1619611144','1','gumoviy','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1754','1619611542','1','gumoviy','27','7','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1755','1619611561','1','gumoviy','5','7','Cryptocurrency and Social Blockchain Network','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1756','1619611562','1','gumoviy','27','7','Cryptocurrency and Social Blockchain Network','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1757','1619611568','1','gumoviy','27','1','LONG Coin','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1758','1619611589','1','gumoviy','5','1','Криптовалюта и социальная сеть на блокчейне','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1759','1619611589','1','gumoviy','27','1','Криптовалюта и социальная сеть на блокчейне','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1760','1619611624','1','gumoviy','27','7','Cryptocurrency and Social Blockchain Network','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1761','1619611642','1','gumoviy','5','7','Cryptocurrency and Social Blockchain Network','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1762','1619611643','1','gumoviy','27','7','Cryptocurrency and Social Blockchain Network','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1763','1619611691','1','gumoviy','5','7','Cryptocurrency and Social Blockchain Network','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1764','1619611692','1','gumoviy','27','7','Cryptocurrency and Social Blockchain Network','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1765','1619611756','1','gumoviy','114','-','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1766','1619611760','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171'),
  ('1767','1619611762','1','gumoviy','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171');


# --------------------------------------------------------

#
# Table structure for table `coin_manager_users`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_manager_users`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Contains login information for backend users.';

#
# Dumping data for table `coin_manager_users`
#

INSERT INTO `coin_manager_users` VALUES
  ('1','gumoviy','$P$BjjZ14db3glWncVJ/eupksXjq5GPA9.');


# --------------------------------------------------------

#
# Table structure for table `coin_member_groups`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_member_groups`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_membergroup_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_membergroup_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_membergroup_names`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_membergroup_names`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_site_content`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_content`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site document tree.';

#
# Dumping data for table `coin_site_content`
#

INSERT INTO `coin_site_content` VALUES
  ('1','document','text/html','Криптовалюта и социальная сеть на блокчейне','LONG Coin - соцсеть на блокчейне и не только','','index','','1','0','0','2','0','','<p>Мы добавили к блокчейн транзакциям возможность отправлять строку в 256 символов. То есть через блокчейн можно передаватьполучать сообщения (этакий твиттер) и строить более сложные конструкции такие как магазины на блокчейне, соцсети, лотереи, игры и т.д.</p>','1','3','0','1','1','1','1130304721','1','1619611588','0','0','0','1130304721','1','','0','0','0','0','0','1'),
  ('2','document','text/html','RU','Русский','1','ru','','1','0','0','0','1','','','1','4','1','1','1','1','1618596434','1','1618596724','0','0','0','1618596434','1','','0','0','0','0','0','1'),
  ('3','document','text/html','EN','English','','en','','1','0','0','0','1','','','1','4','2','1','1','1','1618596448','1','1618597452','0','0','0','1618596448','1','','0','0','0','0','0','1'),
  ('4','document','text/html','SP','Español','','sp','','0','0','0','0','0','','','1','4','3','1','1','1','1618596456','1','1619590965','0','0','0','0','0','','0','0','0','0','0','1'),
  ('5','document','text/html','CH','中国人','','ch','','0','0','0','0','0','','','1','4','4','1','1','1','1618596462','1','1619590971','0','0','0','0','0','','0','0','0','0','0','1'),
  ('8','document','text/html','Инструкции','Список инструкций','Не виден на сайте и в карте сайта','instructions','','0','0','0','2','1','','','1','6','1','0','1','1','1619591231','1','1619599440','0','0','0','0','0','','0','0','0','0','1','0'),
  ('9','document','text/html','Установка на Windows x64','Установка на Windows x64','','win','','1','0','0','8','0','','<p>Текст описания для Windows пока только на русском</p>','1','5','1','1','1','1','1619591573','1','1619599294','0','0','0','1619591573','1','','0','0','0','0','0','1'),
  ('15','document','text/html','Instructions (English)','Instructions list','Not visible on the site and in the sitemap','instructions','','0','0','0','3','1','','','1','6','1','0','1','1','1619591231','1','1619599611','0','0','0','0','0','','0','0','0','0','1','0'),
  ('7','document','text/html','Cryptocurrency and Social Blockchain Network','LONG Coin - Cryptocurrency and Social Blockchain Network','','index','','1','0','0','3','0','','<p>We have added the ability to send a string of 256 characters to blockchain transactions. That is, through the blockchain, you can send / receive messages (a kind of twitter) and build more complex structures such as blockchain stores, social networks, lotteries, games, etc.</p>','1','3','0','1','1','1','1130304721','1','1619611690','0','0','0','1618597578','1','','0','0','0','0','0','0'),
  ('16','document','text/html','Installation on Windows x64','Installation on Windows x64','','win','','1','0','0','15','0','','<p>English description for Windows x64</p>','1','5','1','1','1','1','1619591573','1','1619599719','0','0','0','1619599719','1','','0','0','0','0','0','1');


# --------------------------------------------------------

#
# Table structure for table `coin_site_htmlsnippets`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_htmlsnippets`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site chunks.';

#
# Dumping data for table `coin_site_htmlsnippets`
#

INSERT INTO `coin_site_htmlsnippets` VALUES
  ('1','header','sample header scripts','2','none','2','0','<!DOCTYPE html> \n<html lang=\"en\"> \n    <head>        \n        <meta charset=\"utf-8\" />\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" />\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n        <title>[*titl*]</title>\n        [*noIndex*]\n		<meta name=\"keywords\" content=\"[*keyw*]\" />\n		<meta name=\"description\" content=\"[*desc*]\" />\n		<base href=\"[(site_url)]\"/>\n		\n		<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"favicon/apple-touch-icon.png\">\n		<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"favicon/favicon-32x32.png\">\n		<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"favicon/favicon-16x16.png\">\n		<link rel=\"manifest\" href=\"favicon/site.webmanifest\">\n		<link rel=\"mask-icon\" href=\"favicon/safari-pinned-tab.svg\" color=\"#555555\">\n		<meta name=\"msapplication-TileColor\" content=\"#cccccc\">\n		<meta name=\"theme-color\" content=\"#ffffff\">\n		\n        <link rel=\"stylesheet\" href=\"assets/templates/long/css/uikit.min.css\" type=\"text/css\" media=\"all\" />\n		<link rel=\"stylesheet\" href=\"assets/templates/long/css/select2.min.css\" type=\"text/css\" media=\"all\" />\n		<link rel=\"stylesheet\" href=\"assets/templates/long/css/style.min.css\" type=\"text/css\" media=\"all\" />\n	</head>\n	<body>\n		<div class=\"uk-height-viewport\">\n			<div class=\"long-header\" id=\"descr\">\n				<div class=\"uk-container uk-container-expand long-lang-line\">\n					<div class=\"uk-grid uk-grid-medium\" uk-grid>\n						<div class=\"uk-width-expand\" uk-scrollspy=\"target: .other_langs > div > *; cls: uk-animation-fade uk-animation-slide-right-small; delay: 200\">[+switchLang+]</div>\n						<div class=\"uk-width-auto\">\n							<ul class=\"long-social uk-flex\" uk-scrollspy=\"target: > li; cls: uk-animation-fade uk-animation-slide-right-small; delay: 200\">\n								<li>\n									[[if? &is=`[[DocInfo? &docid=`[*id*]` &field=`link-twitter`]]:empty` &then=`\n									<a href=\"[[DocInfo? &docid=`1` &field=`link-twitter`]]\" target=\"_blank\"><i class=\"icon-twitter\"></i></a>\n									` &else=`\n									<a href=\"[[DocInfo? &docid=`[*id*]` &field=`link-twitter`]]\" target=\"_blank\"><i class=\"icon-twitter\"></i></a>\n									`]]\n								</li>\n								<li>\n									[[if? &is=`[[DocInfo? &docid=`[*id*]` &field=`link-twitter`]]:empty` &then=`\n									<a href=\"[[DocInfo? &docid=`1` &field=`link-telegram`]]\" target=\"_blank\"><i class=\"icon-telegram\"></i></a>\n									` &else=`\n									<a href=\"[[DocInfo? &docid=`[*id*]` &field=`link-telegram`]]\" target=\"_blank\"><i class=\"icon-telegram\"></i></a>\n									`]]\n								</li>\n								<li>\n									[[if? &is=`[[DocInfo? &docid=`[*id*]` &field=`link-twitter`]]:empty` &then=`\n									<a href=\"[[DocInfo? &docid=`1` &field=`link-discord`]]\" target=\"_blank\"><i class=\"icon-discord\"></i></a>\n									` &else=`\n									<a href=\"[[DocInfo? &docid=`[*id*]` &field=`link-discord`]]\" target=\"_blank\"><i class=\"icon-discord\"></i></a>\n									`]]\n								</li>\n							</ul>\n						</div>\n					</div>\n				</div>\n				<div class=\"uk-container uk-container-expand long-menu-line\" uk-sticky>\n					<div class=\"uk-grid uk-grid-medium\" uk-grid>\n						<div class=\"uk-width-expand\">\n							<a href=\"/\" class=\"uk-logo long-logo-module uk-flex uk-flex-middle\">\n								<span class=\"\"><img src=\"assets/templates/long/images/logo-module-left.png\" /></span>\n								<span class=\"uk-visible@s\"><img src=\"assets/templates/long/images/logo-module-right-[%язык логотипа%].png\" /></span>\n							</a>\n						</div>\n						<div class=\"uk-width-auto uk-visible@l\">\n							<ul class=\"long-menu\" uk-scrollspy-nav=\"closest: li; scroll: true; offset: 0;\">\n								<li class=\"uk-active\"><a href=\"#descr\">[%Описание проекта%]</a></li>\n								<li><a href=\"#app\">[%Long network%]</a></li>\n								<li><a href=\"#links\">[%Полезные ссылки%]</a></li>\n								<li><a href=\"#roadmap\">[%Дорожная карта%]</a></li>\n								<li><a href=\"#donation\">[%Поддержать проект%]</a></li>\n								<li><a href=\"#lottery\">[%Лотерея%]</a></li>\n							</ul>\n						</div>\n						<div class=\"uk-width-auto uk-hidden@l uk-flex uk-flex-middle\">\n							<a href=\"#modile-menu\" class=\"long-mobile-hamburger\" uk-toggle>\n								<span></span>\n							</a>\n						</div>\n					</div>\n				</div>\n				<div class=\"uk-container long-network-line\">\n					<div class=\"uk-grid uk-grid-medium\" uk-grid>\n						<div class=\"uk-width-1-2@m uk-width-1-1 uk-text-center\">\n							<div class=\"uk-margin-small-bottom\">LONG Network</div>\n							<img src=\"assets/templates/long/images/network-logo.png\" />\n							<div class=\"uk-margin-small-top uk-text-center\">\n								[%Выберите версию%]:\n							</div>\n							<div class=\"uk-margin-small-top\">\n								<select data-placeholder=\"[%Выберите версию%]\" class=\"download-select\"></select>\n							</div>\n							<div id=\"status\" class=\"uk-margin-top\" hidden><a href=\"#win-[%parent_lang%]\" uk-toggle>[%Инструкция для%] <span>Windows version 0.7d <span class=\"uk-text-red uk-text-small\">(binaries 64bit)</span></span><i class=\"icon-info\"></i></a></div>\n							<div class=\"uk-margin-top\" id=\"download-link\">\n								<a href=\"[[DocInfo? &docid=`[*id*]` &field=`win-download`]]\" class=\"uk-button uk-button-red\" download><span class=\"uk-button-dragon\"></span>[%Скачать%]</a>\n							</div>\n						</div>\n						<div class=\"uk-width-1-2@m uk-width-1-1\">\n							[*slide-text*]\n						</div>\n					</div>\n				</div>\n				<div class=\"uk-overflow-hidden uk-position-absolute\">\n            		<img src=\"assets/templates/long/images/bg-header.jpg\" class=\"uk-animation-reverse uk-transform-origin-top-right\" uk-scrollspy=\"cls: uk-animation-kenburns; repeat: true\">\n        		</div>\n			</div>','0','0','1619610055','0'),
  ('2','footer','Низ сайта','2','none','2','0','			<div class=\"uk-container uk-container-expand long-footer\"><div class=\"uk-text-center\" uk-scrollspy=\"target: > span; cls: uk-animation-slide-left; delay: 300\"><span></span>© Long Coin, 2021<div></div>\n		</div>\n		\n		<div id=\"modile-menu\" class=\"uk-modal-full\" uk-modal>\n			<div class=\"uk-modal-dialog\">\n				<button class=\"uk-modal-close-full uk-close-large\" type=\"button\" uk-close></button>\n				<div class=\"uk-grid-collapse uk-flex-middle uk-grid uk-grid-medium\" uk-grid>\n					<div class=\"uk-background-cover uk-width-1-2 uk-visible@s uk-flex uk-flex-middle\" style=\"min-height: calc(100vh);\" uk-height-viewport>\n						<img src=\"assets/templates/long/images/dragon.png\" uk-scrollspy=\"cls: uk-animation-slide-left; repeat: true\" />\n					</div>\n					<div class=\"uk-padding-large uk-width-1-2@s uk-width-1-1 uk-flex uk-flex-middle uk-flex-left@s uk-flex-center\" style=\"min-height: calc(100vh);\">\n						<div uk-scrollspy=\"target: > ul > li; cls: uk-animation-slide-right; delay: 150; repeat: true\">\n							<div class=\"uk-text-center uk-margin-medium-bottom uk-hidden@s\">\n								<a href=\"/\" class=\"uk-logo long-logo-module uk-flex uk-flex-middle uk-flex-center\">\n									<img src=\"assets/templates/long/images/logo-module-left.png\" />\n								</a>\n							</div>\n							<ul class=\"uk-text-left@s uk-text-center\" uk-scrollspy-nav=\"closest: li; scroll: true; offset: 0;\">\n								<li><a href=\"#descr\">[%Описание проекта%]</a></li>\n								<li><a href=\"#app\">[%Long network%]</a></li>\n								<li><a href=\"#links\">[%Полезные ссылки%]</a></li>\n								<li><a href=\"#roadmap\">[%Дорожная карта%]</a></li>\n								<li><a href=\"#donation\">[%Поддержать проект%]</a></li>\n								<li><a href=\"#lottery\">[%Лотерея%]</a></li>\n							</ul>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n		\n		[[DocLister? &display=`0` &summary=`notags,len:200` &dateSource=`pub_date` &parents=`[%parent_id%]` &tvList=`img,tag` &id=`info` &tpl=`modalInfoTpl`]]\n		\n		<script type=\"text/javascript\" src=\"assets/templates/long/js/jquery-3.6.0.min.js\"></script>\n		<script type=\"text/javascript\" src=\"assets/templates/long/js/uikit.min.js\"></script>\n		<script type=\"text/javascript\" src=\"assets/templates/long/js/select2.min.js\"></script>\n		<script>\n			$(document).ready(function() {\n				\n				$(\'select.download-select\').select2({\n					placeholder:\'chose one option\',\n					data:[\n						{id:0,text:\'Windows version 0.7d\',html:\'Windows version 0.7d <span class=\"uk-text-red uk-text-small\">(binaries 64bit)</span>\',link:\'#win-[%parent_lang%]\',download:\'[[DocInfo? &docid=`[*id*]` &field=`win-download`]]\'},\n						{id:1,text:\'Linux version 0.7d\',html:\'Linux version 0.7d <span class=\"uk-text-red uk-text-small\">(Ubuntu 14.04 based 64bit)</span>\',link:\'#lin-07-14\',download:\'[[DocInfo? &docid=`[*id*]` &field=`lnx-14-download`]]\'},\n						{id:2,text:\'Linux version 0.7d\',html:\'Linux version 0.7d <span class=\"uk-text-red uk-text-small\">(Ubuntu 16.04 based 64bit)</span>\',link:\'#lin-07-16\',download:\'[[DocInfo? &docid=`[*id*]` &field=`lnx-16-download`]]\'},\n						{id:3,text:\'Linux version 0.7d\',html:\'Linux version 0.7d <span class=\"uk-text-red uk-text-small\">(Ubuntu 18.04 based 64bit)</span>\',link:\'#lin-07-18\',download:\'[[DocInfo? &docid=`[*id*]` &field=`lnx-18-download`]]\'},\n						{id:4,text:\'GitHub Full Sources\',html:\'GitHub Full Sources <span class=\"uk-text-red uk-text-small\">(with cross build tools)</span>\',link:\'#git-full\',download:\'[[DocInfo? &docid=`[*id*]` &field=`ghb-full-download`]]\'},\n						{id:5,text:\'Build from sources Tutorial\',html:\'Build from sources Tutorial <span class=\"uk-text-red uk-text-small\">(very simple)</span>\',link:\'#bld-source\',download:\'[[DocInfo? &docid=`[*id*]` &field=`simple-tutorial-download`]]\'},\n						{id:6,text:\'Posting in LONG NETWORK Tutorial\',html:\'Posting in LONG NETWORK Tutorial\',link:\'#long-tutorial\',download:\'[[DocInfo? &docid=`[*id*]` &field=`network-tutorial-download`]]\'},\n					],\n					escapeMarkup: function(markup) {\n						return markup;\n					},\n					templateResult: function(data) {\n						return data.html;\n					},\n					templateSelection: function(data) {\n						return data.html;\n					},\n					minimumResultsForSearch: -1\n				}).on(\'select2:select\', function (e) {\n					var data = e.params.data;\n					$(this).children(\'[value=\"\'+data[\'id\']+\'\"]\').attr({\n						\'link\':data[\"link\"],\n					}).text(data[\'html\']);\n					$(\'#status a span\').html(data[\'html\']);\n					$(\'#status a\').attr(\"href\", data[\"link\"]);\n					$(\'#download-link a\').attr(\"href\", data[\"download\"]);\n				}).val(0).trigger(\'change\');\n				\n				$(\'#modile-menu ul li a\').click(function() {\n					UIkit.modal(\'#modile-menu\').hide();\n				});\n				\n				$(\".copy\").click(function(event) {\n					var $tempElement = $(\'<input style=\"position: absolute; left: -10000px; top: 0; opacity: 0;\">\');\n					$(\"body\").append($tempElement);\n					$tempElement.val($(this).parent().parent().find(\".address b\").text()).select();\n					//$tempElement.val($(this).parent().parent().closest(\".address\").find(\"b\").text().css(\'color\',\'green\')).select();\n					document.execCommand(\"Copy\");\n					$(this).parent().parent().find(\'.long-copy-address\').append(\"<span class=\'long-text-light uk-flex uk-flex-middle uk-flex-center\'>[%Адрес скопирован%]</span>\");\n					$(\".long-copy-address .long-text-light\").hide().fadeIn(300);\n					setTimeout(function(){\n						$(\'.long-copy-address .long-text-light\').fadeOut(300, function(){\n							$(this).remove();\n						});\n						$tempElement.remove();\n					}, 1000);\n				});\n			});\n		</script>\n	</body>\n</html>','0','1618600347','1619603526','0'),
  ('3','modalInfoTpl','Содержимое модального инструкции','2','none','2','0','<div id=\"[+alias+]-[[lang? &a=`parent_lang`]]\" class=\"uk-modal-container uk-flex-top\" uk-modal>\n    <div class=\"uk-modal-dialog uk-margin-auto-vertical\">\n		<div class=\"uk-modal-header\">\n			<button class=\"uk-modal-close-default\" type=\"button\" uk-close></button>\n			<h2 class=\"uk-modal-title\">[+longtitle+]</h2>\n		</div>\n		<div class=\"uk-modal-body\">\n        	[+content+]\n		</div>\n    </div>\n</div>','0','1619591952','1619600304','0');


# --------------------------------------------------------

#
# Table structure for table `coin_site_module_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_module_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Module users group access permission';



# --------------------------------------------------------

#
# Table structure for table `coin_site_module_depobj`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_module_depobj`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Module Dependencies';

#
# Dumping data for table `coin_site_module_depobj`
#

INSERT INTO `coin_site_module_depobj` VALUES
  ('1','3','11','40'),
  ('2','3','12','40'),
  ('3','3','11','30'),
  ('4','3','12','30');


# --------------------------------------------------------

#
# Table structure for table `coin_site_modules`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_modules`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Site Modules';

#
# Dumping data for table `coin_site_modules`
#

INSERT INTO `coin_site_modules` VALUES
  ('1','Doc Manager','<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions','0','0','3','0','0','','0','','0','0','docman435243542tf542t5t','1','',' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
  ('2','Extras','<strong>0.1.3</strong> first repository for Evolution CMS','0','0','3','0','0','','0','','0','0','store435243542tf542t5t','1','',' \n/**\n * Extras\n * \n * first repository for Evolution CMS\n * \n * @category	module\n * @version 	0.1.3\n * @internal	@properties\n * @internal	@guid store435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/store/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  25/11/2016\n */\n\n//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/store/core.php\');'),
  ('3','evoBabelLexicon','<strong>0.21</strong> manage Lexicon','0','0','6','0','0','','0','','0','1618596936','evobabels','1','{\n  \"lang_template_id\": [\n    {\n      \"label\": \"id шаблона языка\",\n      \"type\": \"text\",\n      \"value\": \"4\",\n      \"default\": \"\",\n      \"desc\": \"\"\n    }\n  ],\n  \"rel_tv_id\": [\n    {\n      \"label\": \"id TV языковых связей\",\n      \"type\": \"text\",\n      \"value\": \"5\",\n      \"default\": \"\",\n      \"desc\": \"\"\n    }\n  ],\n  \"currlang\": [\n    {\n      \"label\": \"язык по умолчанию\",\n      \"type\": \"text\",\n      \"value\": \"ru\",\n      \"default\": \"ru\",\n      \"desc\": \"\"\n    }\n  ],\n  \"show_panel\": [\n    {\n      \"label\": \"Показывать панель\",\n      \"type\": \"text\",\n      \"value\": \"1\",\n      \"default\": \"1\",\n      \"desc\": \"\"\n    }\n  ],\n  \"publish\": [\n    {\n      \"label\": \"Публиковать (0 -нет, 1 - да)\",\n      \"type\": \"text\",\n      \"value\": \"0\",\n      \"default\": \"0\",\n      \"desc\": \"\"\n    }\n  ],\n  \"translate_lang\": [\n    {\n      \"label\": \"язык переводов\",\n      \"type\": \"text\",\n      \"value\": \"ru\",\n      \"default\": \"ru\",\n      \"desc\": \"\"\n    }\n  ]\n}','$actions_path = MODX_BASE_URL . \'assets/snippets/evoBabel/lexicon/actions.php\';\n$lexicon_path = MODX_BASE_URL . \'assets/snippets/evoBabel/lexicon/\';\n$theme = $modx->config[\'manager_theme\'];\n//подгружаем язык\nif (is_file (MODX_BASE_PATH . \'assets/snippets/evoBabel/lang/\' . $translate_lang . \'.php\')) {\n    include_once(MODX_BASE_PATH . \'assets/snippets/evoBabel/lang/\' . $translate_lang . \'.php\');\n} else {\n    include(MODX_BASE_PATH . \'assets/snippets/evoBabel/lang/ru.php\');\n}\n\n\n$sql=\"\nCREATE TABLE IF NOT EXISTS \" . $modx->getFullTableName(\'lexicon\') . \" (\n  `id` int(11) NOT NULL AUTO_INCREMENT,\n  `name` varchar(255) NOT NULL DEFAULT \'\',\n  `ru` varchar(255) NOT NULL DEFAULT \'\',\n  PRIMARY KEY (`id`)\n) ENGINE=MyISAM DEFAULT CHARSET=utf8;\n\";\n$q=$modx->db->query($sql);\n\nif(isset($_POST[\'newlang\'])&&$_POST[\'newlang\'] != \'\'){\n    $newlang = $modx->db->escape($_POST[\'newlang\']);\n    $q = $modx->db->query(\"ALTER TABLE \" . $modx->getFullTableName(\'lexicon\') . \" ADD `\" . $newlang . \"` varchar(255)\");\n}\nif(isset($_POST[\'del_lang\']) && is_array($_POST[\'del_lang\'])){\n    $del_lang = $_POST[\'del_lang\'];\n    foreach ($del_lang as $k) {\n        $q = $modx->db->query(\"ALTER TABLE \" . $modx->getFullTableName(\'lexicon\') . \" DROP `\" . $k . \"`\");\n    }\n}\n\n//получаем названия колонок\n$columns = \'\';\n$langs = \'\';\n$q = $modx->db->query(\"SELECT * FROM \" . $modx->getFullTableName(\'lexicon\') . \" LIMIT 0,1\");\n$cols = $modx->db->getColumnNames($q);\nfor( $i = 0; $i < count( $cols ); $i++ ) { \n    if($cols[$i] != \'name\') {\n        if($cols[$i] == \'id\') {\n            $columns .= \'<th field=\"\' . $cols[$i] . \'\" width=\"50\" editor=\"{}\">\' . $cols[$i] . \'</th> \';\n        }\n        else{\n            $columns .= \'<th field=\"\' . $cols[$i] . \'\" width=\"50\" editor=\"{type:\\\'validatebox\\\',options:{}}\">\' . $cols[$i] . \'</th> \';\n            $langs .= \'<div><input type=\"checkbox\" name=\"del_lang[]\" value=\"\' . $cols[$i] . \'\"> \' . $cols[$i] . \'</div>\';\n        }\n    }\n}\n\n\n$output=<<<OUT\n<!DOCTYPE html>\n<html>\n<head>\n    <meta charset=\"UTF-8\">\n    <title>EVO-LEXICONS</title>\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"media/style/{$theme}/style.css\" />\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"{$lexicon_path}jquery-easyui-1.5.3/themes/default/easyui.css\">\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"{$lexicon_path}jquery-easyui-1.5.3/themes/icon.css\">\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"{$lexicon_path}jquery-easyui-1.5.3/demo/demo.css\">\n    <style>\n        body{padding-top:0;}\n        h1{padding:0.8rem 0;}\n        h1 .fa{color:#39515D;}\n        .panel-header{background:#e9e9e9;}\n        .panel-title{color:#333;text-transform:uppercase;height:auto;padding:5px;font-weight:400;font-size:14px;}\n        .panel-header, .panel-body{border-color:#dddddd;}\n        .datagrid-toolbar{padding-top:5px;padding-bottom:5px;background:#ffffff;}\n        .datagrid-row{color: rgba(0, 0, 0, 0.9);}\n        .datagrid-row-over{background-color: rgba(93, 109, 202, 0.16);}\n        .datagrid-row-selected{background-color: rgba(93, 109, 202, 0.16);}\n    </style>\n    <script type=\"text/javascript\" src=\"{$lexicon_path}jquery-easyui-1.5.3/jquery.min.js\"></script>\n    <script type=\"text/javascript\" src=\"{$lexicon_path}jquery-easyui-1.5.3/jquery.easyui.min.js\"></script>\n    <script type=\"text/javascript\" src=\"{$lexicon_path}jquery-easyui-1.5.3/plugins/jquery.edatagrid.js\"></script>\n    <script type=\"text/javascript\" src=\"{$lexicon_path}datagrid-filter/datagrid-filter.js\"></script>\n    <script type=\"text/javascript\" src=\"{$lexicon_path}jquery-easyui-1.5.3/locale/easyui-lang-ru.js\"></script>\n</head>\n<body>\n<h1><i class=\"fa fa-pencil-square-o\"></i>EVO-LEXICONS</h1>\n\n<div class=\"table\" style=\"width:100%;\">\n    <table id=\"dg\" title=\"{$_eb_lang[\'translation_management\']}\" style=\"min-width:750px;width:auto;height:500px\"\n            toolbar=\"#toolbar\" pagination=\"false\" idField=\"id\"\n            rownumbers=\"true\" fitColumns=\"true\" singleSelect=\"true\">\n        <thead>\n            <tr>\n                <th field=\"name\" width=\"50\" editor=\"{type:\'validatebox\',options:{required:true}}\">{$_eb_lang[\'param_name\']}</th>\n                {$columns}\n            </tr>\n        </thead>\n    </table>\n</div>\n                \n    <div id=\"toolbar\">\n        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" plain=\"true\" onclick=\"javascript:$(\'#dg\').edatagrid(\'addRow\')\"><i class=\"fa fa-plus-square\" aria-hidden=\"true\" style=\"color:#337ab7;\"></i> {$_eb_lang[\'create\']}</a>\n        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" plain=\"true\" onclick=\"javascript:$(\'#dg\').edatagrid(\'saveRow\')\"><i class=\"fa fa-floppy-o\" aria-hidden=\"true\" style=\"color:#5cb85c;\"></i> {$_eb_lang[\'save\']}</a>\n        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" plain=\"true\" onclick=\"javascript:$(\'#dg\').edatagrid(\'cancelRow\')\"><i class=\"fa fa-undo\" aria-hidden=\"true\"></i> {$_eb_lang[\'cancel\']}</a>\n        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" plain=\"true\" onclick=\"javascript:$(\'#dg\').edatagrid(\'destroyRow\')\"><i class=\"fa fa-trash-o\" aria-hidden=\"true\" style=\"color:#e77755;\"></i> {$_eb_lang[\'delete\']}</a>\n    </div>\n    <script type=\"text/javascript\">\n        $(function(){\n            var dg = $(\'#dg\').edatagrid({\n                url: \'{$actions_path}?action=get\',\n                saveUrl: \'{$actions_path}?action=save\',\n                updateUrl: \'{$actions_path}?action=update\',\n                destroyUrl: \'{$actions_path}?action=destroy\'\n            });\n\n            dg.edatagrid(\'enableFilter\');\n\n        });\n    </script>\n    <div class=\"create\" style=\"padding:10px 0;\">\n        <p style=\"text-transform:uppercase;\"><b>{$_eb_lang[\'create_new_language\']}</b></p>\n        <form action=\"\" method=\"post\" id=\"lang_form\">\n            <div>\n                <input type=\"text\" name=\"newlang\" value=\"\" style=\"width:300px\" placeholder=\"{$_eb_lang[\'new_language_name\']}\">\n                <input type=\"submit\" value=\"{$_eb_lang[\'create_new_language\']}\">\n            </div>\n        </form>\n    </div>\n    <hr>\n    <p style=\"text-transform:uppercase;\"><b>{$_eb_lang[\'available_languages\']}</b></p>\n    <form action=\"\" method=\"post\" id=\"del_form\">\n        <div>{$langs}<br><input type=\"submit\" value=\"{$_eb_lang[\'delete_languages\']}\"></div>\n    </form>\n\n</body>\n</html>\n\nOUT;\necho $output;\n');


# --------------------------------------------------------

#
# Table structure for table `coin_site_plugin_events`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_plugin_events`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Links to system events';

#
# Dumping data for table `coin_site_plugin_events`
#

INSERT INTO `coin_site_plugin_events` VALUES
  ('1','24','0'),
  ('1','30','0'),
  ('1','39','0'),
  ('1','45','0'),
  ('1','51','0'),
  ('1','77','0'),
  ('1','94','0'),
  ('2','26','0'),
  ('2','28','0'),
  ('2','41','0'),
  ('2','43','0'),
  ('2','47','0'),
  ('2','49','0'),
  ('2','53','0'),
  ('2','55','0'),
  ('2','59','0'),
  ('2','61','0'),
  ('2','79','0'),
  ('2','81','0'),
  ('2','120','0'),
  ('2','124','0'),
  ('2','125','0'),
  ('3','84','0'),
  ('3','85','0'),
  ('3','104','0'),
  ('4','116','0'),
  ('5','3','0'),
  ('5','13','0'),
  ('5','29','0'),
  ('5','32','0'),
  ('5','101','0'),
  ('6','3','1'),
  ('6','21','0'),
  ('6','89','0'),
  ('6','93','0'),
  ('6','94','1'),
  ('6','100','0'),
  ('6','101','1'),
  ('7','111','0'),
  ('8','74','0'),
  ('8','116','1'),
  ('8','133','0'),
  ('9','4','0'),
  ('9','83','0'),
  ('9','96','0'),
  ('9','133','1'),
  ('13','30','1'),
  ('11','32','1'),
  ('11','96','1'),
  ('11','108','0'),
  ('11','109','0'),
  ('11','119','0'),
  ('11','133','2'),
  ('12','101','2'),
  ('12','103','0'),
  ('13','32','2'),
  ('13','51','1'),
  ('13','53','1'),
  ('13','55','1'),
  ('13','130','0');


# --------------------------------------------------------

#
# Table structure for table `coin_site_plugins`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_plugins`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site plugins.';

#
# Dumping data for table `coin_site_plugins`
#

INSERT INTO `coin_site_plugins` VALUES
  ('1','CodeMirror','<strong>1.5</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)','0','3','0','\n/**\n * CodeMirror\n *\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\n *\n * @category    plugin\n * @version     1.5\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\n * @internal    @modx_category Manager and Admin\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\n * @internal    @installset base\n * @reportissues https://github.com/evolution-cms/evolution/issues/\n * @documentation Official docs https://codemirror.net/doc/manual.html\n * @author      hansek from http://www.modxcms.cz\n * @author      update Mihanik71\n * @author      update Deesen\n * @author      update 64j\n * @lastupdate  08-01-2018\n */\n\n$_CM_BASE = \'assets/plugins/codemirror/\';\n\n$_CM_URL = MODX_SITE_URL . $_CM_BASE;\n\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\n','0','{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}','0','','0','0'),
  ('2','ElementsInTree','<strong>1.5.10</strong> Get access to all Elements and Modules inside Manager sidebar','0','3','0','require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n','0','{\"adminRoleOnly\":[{\"label\":\"Administrators only\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"treeButtonsInTab\":[{\"label\":\"Tree buttons in tab\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}]}','1','','0','0'),
  ('3','Forgot Manager Login','<strong>1.1.7</strong> Resets your manager login when you forget your password via email confirmation','0','3','0','require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';','0','','0','','0','0'),
  ('4','OutdatedExtrasCheck','<strong>1.4.6</strong> Check for Outdated critical extras not compatible with EVO 1.4.6','0','3','0','/**\n * OutdatedExtrasCheck\n *\n * Check for Outdated critical extras not compatible with EVO 1.4.6\n *\n * @category	plugin\n * @version     1.4.6\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @author      Author: Nicola Lambathakis\n * @internal    @events OnManagerWelcomeHome\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\n * @internal    @modx_category Manager and Admin\n * @internal    @installset base\n * @internal    @disabled 0\n */\n\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\n','0','{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','0','0'),
  ('5','Quick Manager+','<strong>1.5.11</strong> Enables QuickManager+ front end content editing support','0','3','0','\n/**\n * Quick Manager+\n *\n * Enables QuickManager+ front end content editing support\n *\n * @category 	plugin\n * @version 	1.5.11\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout\n * @internal	@modx_category Manager and Admin\n * @internal    @legacy_names QM+,QuickEdit\n * @internal    @installset base, sample\n * @internal    @disabled 1\n * @reportissues https://github.com/modxcms/evolution\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\n * @link        http://www.maagit.fi/modx/quickmanager-plus\n * @author      Mikko Lammi\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\n * @lastupdate  19/03/2020\n */\n\n// In manager\nif (!$modx->checkSession()) return;\n\n$show = TRUE;\n\nif ($disabled  != \'\') {\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\n    if (in_array($modx->documentIdentifier, $arr)) {\n        $show = FALSE;\n    }\n}\n\nif ($show) {\n    // Replace [*#tv*] with QM+ edit TV button placeholders\n    if ($tvbuttons == \'true\') {\n        if ($modx->event->name == \'OnParseDocument\') {\n             $output = &$modx->documentOutput;\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\n             $modx->documentOutput = $output;\n         }\n     }\n    include_once MODX_BASE_PATH . \'assets/plugins/qm/qm.inc.php\';\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\n}\n','0','{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}','1','','0','0'),
  ('6','TinyMCE4','<strong>4.9.11</strong> Javascript rich text editor','0','3','0','\n/**\n * TinyMCE4\n *\n * Javascript rich text editor\n *\n * @category    plugin\n * @version     4.9.11\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal    @properties &styleFormats=Custom Style Formats <b>RAW</b><br/><br/><ul><li>leave empty to use below block/inline formats</li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2</i></li><li>Also accepts full JSON-config as per TinyMCE4 docs / configure / content-formating / style_formats</li></ul>;textarea; &styleFormats_inline=Custom Style Formats <b>INLINE</b><br/><br/><ul><li>will wrap selected text with span-tag + css-class</li><li>simple-format only</li></ul>;textarea;InlineTitle,cssClass1|InlineTitle2,cssClass2 &styleFormats_block=Custom Style Formats <b>BLOCK</b><br/><br/><ul><li>will add css-class to selected block-element</li><li>simple-format only</li></ul>;textarea;BlockTitle,cssClass3|BlockTitle2,cssClass4 &customParams=Custom Parameters<br/><b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to \"introtext\";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled &paste_as_text=<b>Force Paste as Text</b>;list;enabled,disabled;disabled\n * @internal    @events OnLoadWebDocument,OnParseDocument,OnWebPagePrerender,OnLoadWebPageCache,OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender\n * @internal    @modx_category Manager and Admin\n * @internal    @legacy_names TinyMCE Rich Text Editor\n * @internal    @installset base\n * @logo        /assets/plugins/tinymce4/tinymce/logo.png\n * @reportissues https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Plugin docs https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Official TinyMCE4-docs https://www.tinymce.com/docs/\n * @author      Deesen\n * @lastupdate  2018-01-17\n */\nif (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");','0','{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}','0','','0','0'),
  ('7','TransAlias','<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides','0','3','0','require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';','0','{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','0','0'),
  ('8','Updater','<strong>0.8.5</strong> show message about outdated CMS version','0','3','0','require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';','0','{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"develop\",\"default\":\"develop\",\"desc\":\"\"}],\"stableOnly\":[{\"label\":\"Offer upgrade to stable version only:\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}]}','0','','0','0'),
  ('9','userHelper','<strong>1.12.1</strong> addition to FormLister','0','4','0','\n/**\n * userHelper\n * \n * addition to FormLister\n * \n * @category    plugin\n * @version     1.12.1\n * @internal    @properties &logoutKey=Request key;text;logout &cookieName=Cookie Name;text;WebLoginPE &cookieLifetime=Cookie Lifetime, seconds;text;157680000 &maxFails=Max failed logins;text;3 &blockTime=Block for, seconds;text;3600 &trackWebUserActivity=Track web user activity;list;No,Yes;No\n * @internal    @events OnWebAuthentication,OnWebPageInit,OnPageNotFound,OnWebLogin\n * @internal    @modx_category Content\n * @internal    @disabled 1\n**/\n\nrequire MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n','0','{\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}],\"trackWebUserActivity\":[{\"label\":\"Track web user activity\",\"type\":\"list\",\"value\":\"No\",\"options\":\"No,Yes\",\"default\":\"No\",\"desc\":\"\"}]}','1','','0','0'),
  ('13','templatesEdit 3','<strong>3.1.6</strong> Кастомизация полей при редактировании документов','0','3','0','require MODX_BASE_PATH.\'assets/plugins/templatesedit/plugin.templatesedit.php\';','0','{\"showTvImage\":[{\"label\":\"Показывать картинки в TV\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"showTvName\":[{\"label\":\"Показывать названия TV\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"excludeTvCategory\":[{\"label\":\"Исключить TV из категорий\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','0','0'),
  ('11','evoBabel','<strong>0.21</strong> plugin for work evoBabel','0','6','0','if (!defined(\'MODX_BASE_PATH\')) {\n    die (\'What are you doing? Get out of here!\');\n}\n\n$e = & $modx->event;\n\n$content_table = $modx->getFullTableName(\'site_content\');\n$tvs_table = $modx->getFullTableName(\'site_tmplvar_contentvalues\');\n\nif (isset($params[\'rel_tv_id\']) && isset($params[\'lang_template_id\'])) {\n    include_once MODX_BASE_PATH . \'assets/snippets/evoBabel/evoBabel.class.php\';\n    $eB=new evoBabel($modx, 0, $params);\n\n    switch ($e->name) {\n        case \'OnPageNotFound\'://переадресация на нужную страницу 404, указать ее в модуле лексикона\n            //$docid = 0;\n            $docid = !empty($modx->config[\'error_page\']) ?  $modx->config[\'error_page\'] : $modx->config[\'site_start\'];\n            if (!isset($_SESSION[\'perevod\'])) {\n                //$docid = $modx->config[\'site_start\'];\n                $modx->sendRedirect($modx->makeUrl($docid), 0, \'REDIRECT_HEADER\', \'HTTP/1.0 404 Not Found\');exit();\n            }\n            $id = $_SESSION[\'perevod\'][\'Страница не найдена\'];\n            $docid = (int)$id;\n            if ($docid == 0) {\n                $id = $_SESSION[\'perevod\'][\'Главная страница\'];\n                $docid = (int)$id;\n                if ($docid == 0) {\n                    $id = $_SESSION[\'perevod\'][\'Корневая папка\'];\n                    $docid = (int)$id;\n                }\n            }\n            if ($docid != 0) {\n                $modx->sendRedirect($modx->makeUrl($docid), 0, \'REDIRECT_HEADER\', \'HTTP/1.0 404 Not Found\');exit();\n            }  else {\n                $docid = !empty($modx->config[\'error_page\']) ?  $modx->config[\'error_page\'] : $modx->config[\'site_start\'];\n            }\n            break ;\n        case \'OnDocFormSave\'://синхронизация выбранных TV на выбранном шаблоне\n            if ($e->params[\'mode\'] == \'upd\' && (isset($synch_template) && $synch_template != \'\') && (isset($synch_TV) && $synch_TV != \'\')) {\n                $eB->synchTVs($synch_TV, $synch_template, $e->params[\'id\']);\n            }\n            break;\n        case \'OnBeforeEmptyTrash\': //собираем связи окончательно удаляемых ресурсов, чтобы потом скорректировать их связанные версии\n            if (isset($ids) && is_array($ids)) {\n                $del_ids = implode(\',\', $ids);\n                $del_array = $eB->makeDelRelsArray($del_ids);\n                $_SESSION[\'del_array\'] = $del_array;\n            }\n            break;\n        case \'OnEmptyTrash\': //корректируем связи языковых версий с учетом окончательного удаления ресурсов\n            $del_array = $_SESSION[\'del_array\'];\n            if (!empty($del_array)) {\n                $eB->updateDeletedRelations($del_array);\n            }\n            break;\n        case \'OnWebPageInit\':\n            // в нужном месте прописываем [+activeLang+] (вывод текущего языка) и [+switchLang+] - вывод переключалки (списка) языков\n            // параметры вызова\n            // &activeLang - шаблон вывода текущего языка (отдельно)\n            // &activeRow - шаблон вывода текущего языка в списке языков\n            // &unactiveRow - шаблон вывода языков в списке (кроме текущего)\n            // &langOuter - шаблон обертки для списка языков\n\n            //шаблоны вывода по умолчанию\n            $tmp = isset($config) ? $config : \'\';\n            if(!empty($config) && file_exists(MODX_BASE_PATH . $config)){\n                include_once (MODX_BASE_PATH . $tmp);\n            }\n            //активный язык отдельно\n            $activeLang = isset($activeLang) ? $activeLang : \'<div id=\"curr_lang\"><a href=\"javascript:;\" title=\"[+name+]\"><img src=\"assets/snippets/evoBabel/config/images/flag_[+alias+].png\"></a></div>\'; \n            //активный язык в списке\n            $activeRow = isset($activeRow) ? $activeRow : \'<div class=\"uk-width-auto uk-active\"><span><img src=\"assets/snippets/evoBabel/config/images/flag_[+alias+].png\"></span></div>\';\n            //неактивный язык списка\n            $unactiveRow = isset($unactiveRow) ? $unactiveRow : \'<div class=\"uk-width-auto\"><a href=\"[+url+]\" title=\"[+name+]\"><img src=\"assets/snippets/evoBabel/config/images/langs/flag_[+alias+].png\"></a></div>\';\n            //обертка списка языков\n            $langOuter = isset($langOuter) ? $langOuter : \'<div class=\"other_langs uk-grid uk-grid-small\" uk-grid>[+wrapper+]</div>\';\n\n        //фикс для OnWebPageInit на несуществующей странице с несуществующим documentIdentifier\n        if (!empty($modx->documentIdentifier)) {\n\n            $out = \'\';\n            $langs = array();\n            $others = array();//массив других языков (кроме текущего)\n            $eB->id = $modx->documentIdentifier;\n            $siteAllLangs = $eB->langs;\n            $siteLangs = $eB->getSiteLangs($eB->lang_template_id);\n            /*$siteAllLangs = $eB->getAllSiteLangs($eB->lang_template_id);*/\n            //если находимся в корневой папке языка, отправляем на главную страницу этого языка (при условии, что она задана и отличается от текущей)\n            if (isset($siteLangs[$eB->id]) && $siteLangs[$eB->id][\'home\'] != \'\' && (int)$siteLangs[$eB->id][\'home\'] != 0 && $siteLangs[$eB->id][\'home\'] != $eB->id) {\n                $modx->sendRedirect($modx->makeUrl((int)$siteLangs[$eB->id][\'home\']));\n            }\n            $curr_lang_id = $eB->getCurLangId($eB->id);\n            if (empty($curr_lang_id)) {//не смогли найти язык\n                if (isset($_SESSION[\'curr_lang_id\'])) {//есть предыдущий, берем его\n                    $curr_lang_id = $_SESSION[\'curr_lang_id\'];\n                } else {//нет предыдущего, берем язык \"домашней страницы\"\n                    $curr_lang_id = $eB->getCurLangId($modx->config[\'site_start\']);\n                    $_SESSION[\'curr_lang_id\'] = $curr_lang_id;\n                }\n            } else {\n                $_SESSION[\'curr_lang_id\'] = $curr_lang_id;\n            }\n            $relations = $eB->getRelations($eB->id);\n            $relArray = $eB->getRelationsArray($relations);\n\n            //устанавливаем текущий язык\n            $currLang = str_replace(array(\'[+alias+]\', \'[+name+]\', \'[+lang+]\'), array($siteLangs[$curr_lang_id][\'alias\'], $siteLangs[$curr_lang_id][\'name\'], $siteLangs[$curr_lang_id][\'lang\']), $activeLang);\n\n            //устанавливаем список языков с учетом активного\n            $langRows = \'\';\n\n            foreach ($siteLangs as $k=>$v) {\n                $tpl = ($k != $curr_lang_id ? $unactiveRow : $activeRow);\n                if (isset($relArray[$v[\'alias\']]) && $eB->checkActivePage($relArray[$v[\'alias\']])) {//если есть связь и эта страница активна\n                    $url = $relArray[$v[\'alias\']];\n                } else {//нет связи либо страница не активна -> проверяем родителя\n                    $parent_id = $modx->db->getValue($modx->db->query(\"SELECT parent FROM {$eB->content_table} WHERE id={$eB->id} AND published=1 AND deleted=0 AND parent!=0 AND template!=$eB->lang_template_id\"));\n                    if (!$parent_id) {//если нет родителя, отправляем на главную страницу языка\n                        $url = ((int)$v[\'home\'] != 0 ? (int)$v[\'home\'] : $k);\n                    } else {//если родитель есть, проверяем его связи\n                        $parent_relations = $eB->getRelations($parent_id);\n                        $relParentArray = $eB->getRelationsArray($parent_relations);\n                        if (isset($relParentArray[$v[\'alias\']]) && $eB->checkActivePage($relParentArray[$v[\'alias\']])) {//у родителя активная связь\n                            $url = $relParentArray[$v[\'alias\']];\n                        } else {//иначе -> на главную страницу языка\n                            $url = ((int)$v[\'home\'] != 0 ? (int)$v[\'home\'] : $k);\n                        }\n                    }\n                }\n                $langRows .= str_replace(array(\'[+alias+]\', \'[+url+]\', \'[+name+]\', \'[+lang+]\'), array($v[\'alias\'], $modx->makeUrl($url), $v[\'name\'], $v[\'lang\']), $tpl);\n            }\n            $langsList .= str_replace(array(\'[+wrapper+]\'), array($langRows), $langOuter);\n\n            // устанавливаем плейсхолдеры [+activeLang+] и [+switchLang+] для вывода активного языка и списка языков соответственно\n            $modx->setPlaceholder(\"activeLang\", $currLang);\n            $modx->setPlaceholder(\"switchLang\", $langsList);\n\n            //получаем массив перевода для чанков в сессию\n            $perevod = array();\n            $cur_lexicon = $siteAllLangs[$curr_lang_id][\'alias\'];\n            if($cur_lexicon == \'\'){\n				$doc = $modx->getDocument($modx->documentIdentifier);\n				$cur_lexicon = $doc[\'alias\'];	\n			} \n            $q = $modx->db->query(\"SELECT * FROM \" . $modx->getFullTableName(\'lexicon\'));\n            while ($row = $modx->db->getRow($q)) {\n                $perevod[$row[\'name\']] = $row[$cur_lexicon];\n            }\n            $_SESSION[\'evoBabel_curLang\'] = $cur_lexicon;\n            $_SESSION[\'perevod\'] = $perevod;\n        }\n            break;\n        case \'OnDocDuplicate\' :\n            if ($e->params[\'new_id\'] && (empty($e->params[\'source\']) || $e->params[\'source\'] != \'evobabel\')) {\n                $q = $modx->db->query(\"DELETE FROM \" . $eB->tvs_table . \" WHERE contentid={$e->params[\'new_id\']} AND tmplvarid={$eB->rel_tv_id}\");\n            }\n            break;\n        default:\n            return ;\n    }\n}\n','0','{\n  \"synch_TV\": [\n    {\n      \"label\": \"ids TV для синхронизации\",\n      \"type\": \"text\",\n      \"value\": \"5\",\n      \"default\": \"\",\n      \"desc\": \"\"\n    }\n  ],\n  \"synch_template\": [\n    {\n      \"label\": \"ids шаблонов для синхронизации\",\n      \"type\": \"text\",\n      \"value\": \"3\",\n      \"default\": \"\",\n      \"desc\": \"\"\n    }\n  ],\n  \"config\": [\n    {\n      \"label\": \"Файл шаблонов\",\n      \"type\": \"text\",\n      \"value\": \"assets/snippets/evoBabel/config/config.php\",\n      \"default\": \"assets/snippets/evoBabel/config/config.php\",\n      \"desc\": \"\"\n    }\n  ]\n}','0','evobabels','0','1618606282'),
  ('12','evoBabelPlaceholder','<strong>0.21</strong> plugin for work evoBabel (use placeholder [%key%] for language versions)','0','6','0','$e =& $modx->event;\nswitch ($e->name) {\n    case \'OnParseDocument\':\n    case \'OnBeforeParseParams\':\n    //	обрабатываем языковые плейсхолдеры вида [%ключ%]\n        $source = $modx->documentOutput;\n        $source = $this->mergeSettingsContent($source);\n        $source = $this->mergeDocumentContent($source);\n        $source = $this->mergeSettingsContent($source);\n        $source = $this->mergeChunkContent($source);\n\n        //$pattern=\'~\\[\\%(.*?)\\%\\]~s\';\n        $pattern=\"/\\[%([^%\\]]*)?%\\]/\";\n\n        preg_match_all($pattern, $source, $matches, PREG_PATTERN_ORDER);\n        if (is_array($matches[0])) {\n            foreach ($matches[0] as $v) {\n                $k = str_replace(\'%]\', \'\', str_replace(\'[%\', \'\', $v));\n                if (isset($_SESSION[\'perevod\'][$k])) {\n                    $source = str_replace($v, $_SESSION[\'perevod\'][$k], $source);\n                }\n            }\n        }\n        $modx->documentOutput = $source;\n        break;\n    default:\n        return ;\n}\n','0','','0','evobabels','0','0');


# --------------------------------------------------------

#
# Table structure for table `coin_site_snippets`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_snippets`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site snippets.';

#
# Dumping data for table `coin_site_snippets`
#

INSERT INTO `coin_site_snippets` VALUES
  ('1','DLCrumbs','<strong>1.2</strong> DLCrumbs','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n','0','','','0','0','0'),
  ('2','DLMenu','<strong>1.4.0</strong> Snippet to build menu with DocLister','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n','0','','','0','0','0'),
  ('3','DLSitemap','<strong>1.0.1</strong> Snippet to build XML sitemap','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n','0','','','0','0','0'),
  ('4','DocInfo','<strong>0.4.1</strong> Take any field from any document (fewer requests than GetField)','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\n','0','','','0','0','0'),
  ('5','DocLister','<strong>2.5.2</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n','0','','','0','0','0'),
  ('6','FormLister','<strong>1.12.1</strong> Form processor','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n','0','','','0','0','0'),
  ('7','if','<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';','0','','','0','0','0'),
  ('8','phpthumb','<strong>1.3.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\n','0','','','0','0','0'),
  ('9','summary','<strong>2.0.2</strong> Truncates the string to the specified length','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';','0','','','0','0','0'),
  ('10','alternate','<strong>0.21</strong> MultiLang alternate links','0','6','0','// используется для вывода ссылок на языковые версии аналогичных страниц\n// https://support.google.com/webmasters/answer/189077?hl=ru\n// https://support.google.com/webmasters/answer/189077?hl=en\n// внести в модуль лексиконов строку hreflang для каждого языка (uk-ua, en-ua и т.п.)\n// не забыть про необходимость заполнения там же строки Язык с алиасами языков\n// вызывать в header в виде [[alternate? &use_default=`1` &default_lang=`ru` &tv=`[*relation*]`]] - чтобы указывать язык по умолчанию\n// либо\n// [[alternate? &tv=`[*relation*]`]] - если не требуется дефолтный язык\n\n$out = \'\';\n$curr_lang = $modx->runSnippet(\"lang\", array(\"a\" => \"Язык\"));\n$curr_lang = !empty($curr_lang) ? $curr_lang : \'ru\';\n$default_lang = isset($default_lang) ? $default_lang : \'ru\';\n$use_default = isset($use_default) && $use_default == \'1\' ? true : false;\n\n$langs = array();\nif ($tv && !empty($tv)) {\n    $tmp = explode(\"||\", $tv);\n    foreach($tmp as $k => $v) {\n        $tmp2 = explode(\":\", $v);\n        $langs[$tmp2[0]] = $tmp2[1];\n    }\n}\n$default_link = \'\';\n$alter_link = \'\';\nif (!empty($langs)) {\n    foreach ($langs as $lang => $docid) {\n        if ($use_default && $default_lang == $lang) {\n            $default_link .= \'<link rel=\"alternate\" hreflang=\"x-default\" href=\"\' . $modx->makeUrl($docid) . \'\" />\';\n        } else {\n            $href_lang = $modx->runSnippet(\"lang\", array(\"a\" => \"hreflang\", \"id\" => $lang));\n            $href_lang = !empty($href_lang) ? $href_lang : $lang;\n            $alter_link .= \'<link rel=\"alternate\" href=\"\' . $modx->makeUrl($docid, \'\', \'\', \'full\') . \'\" hreflang=\"\' . $href_lang . \'\" />\';\n        }\n    }\n}\n$out .= $default_link . $alter_link;\nreturn $out;\n','0','','','0','0','0'),
  ('11','evoBabel','<strong>0.21</strong> MultiLang solution','0','6','0','\nrequire MODX_BASE_PATH . \'assets/snippets/evoBabel/snippet.evoBabel.php\';','0','{}','evobabels','0','1618597208','0'),
  ('12','lang','<strong>0.21</strong> MultiLang output lexicon','0','6','0','//использование в шаблонах чанках и т.п.\n// [[lang? &a=`Главная страница`]] либо просто [%Главная страница%] если установлен плагин evoBabelPlaceholder\n// использование в сниппетах \n// [[DocLister? &parents=`[[lang? &a=`Папка каталог`]]` ...другие параметры ..]]\n// доступны плейсхолдеры вида [%Папка каталог%] - в шаблонах и чанках  если установлен плагин evoBabelPlaceholder\n// [[lang? &a=`Главная страница` &id=`eng`]] Получение главной страницы для eng лексикона\n\nif (!is_scalar($a)) $a = null;\nif (!is_scalar($currlang)) $currlang = null;\n$defLang = $currlang;\nif (!empty($_SESSION[\'evoBabel_curLang\'])) {\n	$currlang = $_SESSION[\'evoBabel_curLang\'];\n}\n$id = isset($id) ? $id : $currlang;\n$out = (!empty($a) && isset($_SESSION[\'perevod\'][$a]) && $currlang == $id) ? $_SESSION[\'perevod\'][$a] : null;	\nif (!empty($a) && !empty($id) && is_null($out)) {\n	$q = $modx->db->query(\"SELECT * FROM \" . $modx->getFullTableName(\'lexicon\').\" WHERE name=\'\".$modx->db->escape($a).\"\' LIMIT 1\");\n	$row = $modx->db->getRow($q);\n	if (isset($row[$id])) {\n		$out = $row[$id];\n	}\n}\nreturn $out;','0','','evobabels','0','0','0'),
  ('13','multiTV','<strong>2.0.16</strong> Custom Template Variabe containing a sortable multi item list or a datatable','0','4','0','return require MODX_BASE_PATH . \'assets/tvs/multitv/multitv.snippet.php\';\n','0','','','0','0','0'),
  ('14','sizeof','<b>Версия 0.1</b> вычисляем размер файла и подставляем удобную метрику.','0','7','0','\n/*      \n* Выводит размер файла\n* \n* version: 0.1\n* \n* Author:\n*       darksmoke from modx.im\n*                       dsmoke@ukr.net\n* \n* Параметры:\n*       &path - путь к файлу\n*\n*\n* Пример [[sizeof? &path=`[*tex-doc*]`]]\n*               [*tex-doc*] - это TV , Тип - File\n*\n*/\nfunction format_size($size)\n{\n        $metrics[0] = \'byte\';\n        $metrics[1] = \'KB\';\n        $metrics[2] = \'MB\';\n        $metrics[3] = \'GB\';\n        $metrics[4] = \'TB\';\n        $metric = 0;\n\n        while(floor($size/1024) > 0)\n        {\n                ++$metric;\n                $size /= 1024;\n        }\n\n        $ret =  round($size,1).\" \".(isset($metrics[$metric])?$metrics[$metric]:\'??\');\n        \n        return $ret;\n}\n\nif (file_exists($path)) \n        $output = format_size( filesize($path) );\n\n\nreturn $output;','0','{}','','1619601617','1619601687','0'),
  ('15','FileSize','Размер файла по ссылке','0','7','0','\n//[[FileSize? &file=`[*file*]`]]\n$filename = MODX_BASE_PATH.$file;\nif (file_exists($filename)) {\n$filesize = number_format(filesize($filename)/1024000 , 2);\necho \'\'. strtoupper(pathinfo($filename, PATHINFO_EXTENSION)) . \', \' . $filesize .\' Mb\';\n}','0','{}','','1619601958','1619603593','0');


# --------------------------------------------------------

#
# Table structure for table `coin_site_templates`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_templates`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `templatealias` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site templates.';

#
# Dumping data for table `coin_site_templates`
#

INSERT INTO `coin_site_templates` VALUES
  ('3','index','index','Основной шаблон сайта','0','2','','0','{{header}}\n<div class=\"uk-section long-characteristic-container\">\n	<div class=\"uk-container\">\n		<div class=\"uk-grid uk-grid-medium\" uk-grid uk-scrollspy=\"target: table > tbody > tr, > div > ul > li; cls: uk-animation-slide-bottom-small; delay: 200\">\n			<div class=\"uk-width-1-2@m uk-width-1-1\">\n				<h3>[%Характеристики%]</h3>\n				<table class=\"uk-width-1-1\">\n					<tr>\n						<td>[%Название монеты%]:</td>\n						<td class=\"uk-text-red uk-text-right\">LONG&nbsp;COIN</td>\n					</tr>\n					<tr>\n						<td>[%Монетный тикер%]:</td>\n						<td class=\"uk-text-red uk-text-right\">LONG</td>\n					</tr>\n					<tr>\n						<td>[%Алгоритм хеширования%]:</td>\n						<td class=\"uk-text-red uk-text-right\">SHA-256</td>\n					</tr>\n					<tr>\n						<td>[%Алгоритм шифрования сообщений%]:</td>\n						<td class=\"uk-text-red uk-text-right\">ecdh и aes&nbsp;cbc</td>\n					</tr>\n					<tr>\n						<td>[%Тип монеты%]:</td>\n						<td class=\"uk-text-red uk-text-right\">POW</td>\n					</tr>\n					<tr>\n						<td>[%Время нахождения блока%]:</td>\n						<td class=\"uk-text-red uk-text-right\">2&nbsp;[%минуты%]</td>\n					</tr>\n					<tr>\n						<td>[%Премайн%]:</td>\n						<td class=\"uk-text-red uk-text-right\">0</td>\n					</tr>\n					<tr>\n						<td>[%Срок подтверждения%]:</td>\n						<td class=\"uk-text-red uk-text-right\">30&nbsp;[%блоков%]</td>\n					</tr>\n					<tr>\n						<td>[%Вознаграждение за блок%]:</td>\n						<td class=\"uk-text-red uk-text-right\">10&nbsp;000</td>\n					</tr>\n					<tr>\n						<td>[%Фиксированная комиссия%]:</td>\n						<td class=\"uk-text-red uk-text-right\">1&nbsp;LONG/Kb</td>\n					</tr>\n				</table>\n			</div>\n			<div class=\"uk-width-1-2@m uk-width-1-1 uk-flex uk-flex-center uk-flex-middle\">\n				<div class=\"uk-position-relative\">\n					<img src=\"assets/templates/long/images/bg-characteristic.jpg\" width=\"504px\" height=\"504px\" style=\"max-width: 504px; min-width: 504px;\" />\n					<img src=\"assets/templates/long/images/characteristic-logo.png\" class=\"long-characteristic-logo\" />\n				</div>\n			</div>\n			<div class=\"uk-width-1-1\">\n				<ul>\n					<li>[%Короткие%] SMS: 1 LONG</li>\n					<li>[%Стандартные финансовые транзакции%] 1 LONG</li>\n					<li>[%Ограничение на объем транзакции с данными%]: 64кБ <span class=\"uk-text-muted\">([%макс комиссия%] 64 LONG)</span></li>\n				</ul>\n				<p>[%Мультиадресные транзакции с одновременной передачей монет и сообщений%]</p>\n			</div>\n		</div>\n	</div>\n</div>\n\n<div class=\"long-dragon-walk\">\n	<span class=\"long-body\" uk-parallax=\"x: -3000,-2600,-1600,0,320,360,380,380;\">\n		<span class=\"long-tail\"></span>\n		<span class=\"long-head\"></span>\n	</span>\n</div>\n\n<div class=\"uk-section long-app-container\" id=\"app\">\n	<div class=\"long-head uk-visible@m\" uk-parallax=\"x: 357,-200,-300,-357;\"></div>\n	<div class=\"uk-container uk-margin-medium-top\">\n		<div class=\"uk-grid uk-grid-medium\" uk-grid>\n			<div class=\"uk-width-4-5@m uk-width-1-1\">\n				<h3>[%Приложение%] Longcoin NETWORK</h3>\n				[*wallet-instalation*]\n			</div>\n			<div class=\"uk-width-1-1 uk-margin-bottom\">\n				<div class=\"long-attention\">\n					<span class=\"uk-text-red\">[%Внимание%]!</span> [*wallet-instalation-attention*]\n				</div>\n			</div>\n			<div class=\"uk-width-1-1 uk-margin-large-top\">\n				<div class=\"uk-grid uk-grid-medium\" uk-grid>\n					<div class=\"uk-width-1-2@m uk-width-1-1\">\n						<dl uk-scrollspy=\"target: > dd; cls: uk-animation-slide-bottom-small; delay: 200\">\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										Windows version 0.7d <span class=\"uk-text-red uk-text-small\">(binaries 64bit)</span>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#win-[%parent_lang%]\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://drive.google.com/open?id=1JbHJIsMI0SlfFKUV5bgCcyG_DDEypyIz\" target=\"_blank\"><span class=\"icon-google-drive\"><span class=\"path1\"></span><span class=\"path2\"></span><span class=\"path3\"></span></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`win-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'win-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										Linux version 0.7d <span class=\"uk-text-red uk-text-small\">(Ubuntu 14.04 based 64bit)</span>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://drive.google.com/open?id=19mksXRbTHxLVQuY2qRTnY2eacjwLlkmD\" target=\"_blank\"><span class=\"icon-google-drive\"><span class=\"path1\"></span><span class=\"path2\"></span><span class=\"path3\"></span></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`lnx-14-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'lnx-14-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										Linux version 0.7d <span class=\"uk-text-red uk-text-small\">(Ubuntu 16.04 based 64bit)</span>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://drive.google.com/open?id=1-i6rGeMOmaiuGSpBYVyLBXOUL8nS9_SM\" target=\"_blank\"><span class=\"icon-google-drive\"><span class=\"path1\"></span><span class=\"path2\"></span><span class=\"path3\"></span></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`lnx-16-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'lnx-16-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										Linux version 0.7d <span class=\"uk-text-red uk-text-small\">(Ubuntu 18.04 based 64bit)</span>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://drive.google.com/open?id=1E3pdb9cR_yrQkcrg2fgJY5LzlAQ7ezpE\" target=\"_blank\"><span class=\"icon-google-drive\"><span class=\"path1\"></span><span class=\"path2\"></span><span class=\"path3\"></span></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`lnx-18-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'lnx-18-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										GitHub Full Sources <span class=\"uk-text-red uk-text-small\">(with cross build tools)</span>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://github.com/longnetwork/LONGNETWORK\" target=\"_blank\"><span class=\"icon-github\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`ghb-full-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'ghb-full-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										Build from sources Tutorial <span class=\"uk-text-red uk-text-small\">(very simple)</span>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://youtu.be/H5FkmPRJiEo\" target=\"_blank\"><span class=\"icon-youtube\"><span class=\"path1\"></span><span class=\"path2\"></span></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`simple-tutorial-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'simple-tutorial-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n							<dd>\n								<div class=\"uk-grid uk-grid-small\" uk-grid>\n									<div class=\"uk-width-expand uk-text-bold\">\n										Posting in LONG NETWORK Tutorial\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\" hidden>\n										<a href=\"#\" uk-toggle><span class=\"icon-info\"></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"https://youtu.be/MjAP4zS61_s\" target=\"_blank\"><span class=\"icon-youtube\"><span class=\"path1\"></span><span class=\"path2\"></span></i></a>\n									</div>\n									<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n										<a href=\"[[DocInfo? &docid=`[*id*]` &field=`network-tutorial-download`]]\" download uk-tooltip=\"title: [[FileSize? &file=`[!DocInfo? &docid=\'[*id*]\' &field=\'network-tutorial-download\'!]`]]; pos: right; animation: uk-animation-slide-left-small\"><span class=\"icon-download uk-text-red\"></i></a>\n									</div>\n								</div>\n							</dd>\n						</dl>\n						\n					</div>\n					<div class=\"uk-width-1-2@m uk-width-1-1\">\n						<div class=\"uk-height-1-1 uk-flex uk-flex-center uk-flex-middle\">\n							<img src=\"assets/templates/long/images/network-logo.png\" />\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"uk-section long-links-container uk-margin-medium-top\" id=\"links\">\n	<div class=\"long-dragon-walk-links\">\n		<span class=\"long-body\" uk-parallax=\"y: -1500,-1100,-700,-300,-0,200,250;\">\n			<span class=\"long-tail\"></span>\n			<span class=\"long-head\"></span>\n		</span>\n	</div>\n	<div class=\"uk-container uk-margin-medium-top uk-margin-medium-bottom\">\n		<div class=\"uk-grid uk-grid-medium\" uk-grid>\n			<div class=\"uk-width-1-1\"><h4>[%Полезные ссылки%]</h4></div>\n			<div class=\"uk-width-1-2@m uk-width-1-1\" uk-scrollspy=\"target: > dl > dt, > dl > dd; cls: uk-animation-slide-bottom-small; delay: 150\">\n				[[multiTV? &tvName=`links` &docid=`[*id*]` &tplConfig=`` &outerTpl=`@CODE: <dl>((wrapper))</dl>` &rowTpl=`@CODE: <dt><a href=\"((link))\" target=\"_blank\">((text))</a></dt><dd>((descr))</dd>` &display=`all` &offset=`0` &rows=`all` &randomize=`0` &reverse=`0` &orderBy=`` &toPlaceholder=`` &toJson=`0` &published=`1` &emptyOutput=`1` &outputSeparator=`` &firstClass=`first` &lastClass=`last` &evenClass=`` &oddClass=`` &paginate=`0` &offsetKey=`page` &iterationStart=`1`]]\n			</div>\n			<div class=\"uk-width-1-2@m uk-width-1-1\" uk-scrollspy=\"target: > dl > dt, > dl > dd; cls: uk-animation-slide-bottom-small; delay: 150\">\n				<p class=\"uk-text-medium\"><b>[%Наши сетевые сервисы%]:</b></p>\n				[[multiTV? &tvName=`links-services` &docid=`[*id*]` &tplConfig=`` &outerTpl=`@CODE: <dl>((wrapper))</dl>` &rowTpl=`@CODE: <dt><a href=\"((link))\" target=\"_blank\">((text))</a></dt><dd>((descr))</dd>` &display=`all` &offset=`0` &rows=`all` &randomize=`0` &reverse=`0` &orderBy=`` &toPlaceholder=`` &toJson=`0` &published=`1` &emptyOutput=`1` &outputSeparator=`` &firstClass=`first` &lastClass=`last` &evenClass=`` &oddClass=`` &paginate=`0` &offsetKey=`page` &iterationStart=`1`]]\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"uk-section long-roadmap-container\" id=\"roadmap\">\n	<div class=\"long-dragon-walk-roadmap\">\n		<span class=\"long-body\" uk-parallax=\"y: -1500,-1100,-700,-300,0,100,150;\">\n			<span class=\"long-tail\"></span>\n			<span class=\"long-head\"></span>\n		</span>\n	</div>\n	<div class=\"uk-container uk-margin-medium-top uk-margin-medium-bottom\">\n		<div class=\"uk-grid uk-grid-medium\" uk-grid>\n			<div class=\"uk-width-1-1 uk-text-center uk-margin-bottom\"><h4>Roadmap</h4></div>\n			<div class=\"uk-width-1-1 long-roadmap-grid\">\n				<div class=\"uk-grid uk-grid-collapse\" uk-scrollspy=\"target: > div > b, > div > .uk-text-small; cls: uk-animation-scale-down; delay: 300\">\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-visible@m\"></div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1\">\n						<span class=\"uk-text-small\">[%Готово%]</span>\n					</div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-right@m uk-text-left\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Добавлена строчка в 256 символов в транзакцию%]</b>\n					</div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-visible@m\"></div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-visible@m\"></div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Создана «Стена» куда может постить любой желающий%]</b>\n					</div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-right@m uk-text-left\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Добавлена возможность создавать свои приватные чаты%]</b>\n					</div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-visible@m\"></div>\n					\n					<div class=\"long-roadmap-item long-roadmap-item-dashed uk-width-1-2@m uk-width-1-1 uk-visible@m\"></div>\n					<div class=\"long-roadmap-item long-roadmap-item-dashed uk-width-1-2@m uk-width-1-1\">\n						<span class=\"uk-text-small uk-text-red\">[%В процессе%]</span>\n					</div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red uk-visible@m\"></div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Создание фильтров для контента на стене%]</b>\n					</div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-right@m uk-text-left uk-text-red\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Создание паблика Long Tweet — аналога Твиттер на блокчейне, с возможностью регистрации никнеймов%]</b>\n					</div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red uk-visible@m\"></div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red uk-visible@m\"></div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Создание простого интерфейса, для управления операциями LONG в 1-2 клика%]</b>\n					</div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-right@m uk-text-left uk-text-red\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Распространение LONG среди людей не знакомых с криптовалютой, и считающих, что это сложно%]</b>\n					</div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red uk-visible@m\"></div>\n					\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red uk-visible@m\"></div>\n					<div class=\"long-roadmap-item uk-width-1-2@m uk-width-1-1 uk-text-red\">\n						<span class=\"long-roadmap-arrow\"></span>\n						<b>[%Выход на китайский рынок%]</b>\n					</div>\n					\n					<div class=\"long-roadmap-item long-roadmap-item-last uk-width-1-1 uk-text-center@m uk-text-left uk-text-red\">\n						<b>[%Создание первых магазинов на блокчейне LONG%]</b>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"uk-section long-donation-container\" id=\"donation\">\n	<div class=\"uk-container uk-margin-medium-top uk-margin-medium-bottom\">\n		<div class=\"uk-grid uk-grid-medium\" uk-grid>\n			<div class=\"uk-width-1-1 uk-text-center uk-margin-bottom\"><h4>[%Поддержать проект%]</h4></div>\n			<div class=\"uk-width-1-2@m uk-width-1-1\">\n				<p>[%Все пожертвования идут только и исключительно на развитие LONG NETWORK%].</p>\n				<p>[%Все пожертвования принимаются только и исключительно в криптовалюте%].</p>\n				<p class=\"uk-text-medium uk-margin-medium-top uk-margin-medium-bottom\"><b>[%Кошельки для поддержки%]:</b></p>\n				<div class=\"uk-grid\" uk-grid uk-scrollspy=\"target: > div; cls: uk-animation-slide-bottom-small; delay: 200\">\n					<div class=\"uk-width-1-1\">\n						<div class=\"uk-grid uk-grid-medium\" uk-grid>\n							<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n								<img src=\"assets/templates/long/images/bitcoin.png\" width=\"50px\" />\n							</div>\n							<div class=\"uk-width-expand uk-flex uk-flex-middle long-copy-address uk-position-relative\">\n								<div>\n									<div class=\"uk-text-small uk-text-red\"><b>Bitcoin (BTC)</b></div>\n									<div class=\"address\"><b>1NbmV7xzXWvnPkYDfx4Vh7hk3LW5237RKR</b></div>\n								</div>\n							</div>\n							<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n								<span class=\"copy\"><i class=\"icon-copy uk-text-red\"></i></span>\n							</div>\n						</div>\n					</div>\n					<div class=\"uk-width-1-1\">\n						<div class=\"uk-grid uk-grid-medium\" uk-grid>\n							<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n								<img src=\"assets/templates/long/images/litecoin.png\" width=\"50px\" />\n							</div>\n							<div class=\"uk-width-expand uk-flex uk-flex-middle long-copy-address uk-position-relative\">\n								<div>\n									<div class=\"uk-text-small uk-text-red\"><b>Litecoin (LTC)</b></div>\n									<div class=\"address\"><b>LR1rNDCgKz5wwWsbyazJ4cddCae8D158B7</b></div>\n								</div>\n							</div>\n							<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n								<span class=\"copy\"><i class=\"icon-copy uk-text-red\"></i></span>\n							</div>\n						</div>\n					</div>\n					<div class=\"uk-width-1-1\">\n						<div class=\"uk-grid uk-grid-medium\" uk-grid>\n							<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n								<img src=\"assets/templates/long/images/longcoin.png\" width=\"50px\" />\n							</div>\n							<div class=\"uk-width-expand uk-flex uk-flex-middle long-copy-address uk-position-relative\">\n								<div>\n									<div class=\"uk-text-small uk-text-red\"><b>Longcoin (LNG)</b></div>\n									<div class=\"address\"><b>162tLYabHPCcqQHgpZ3c89nkMPhZhCkCvR</b></div>\n								</div>\n							</div>\n							<div class=\"uk-width-auto uk-flex uk-flex-middle\">\n								<span class=\"copy\"><i class=\"icon-copy uk-text-red\"></i></span>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class=\"uk-width-1-2@m uk-width-1-1\">\n				<div class=\"uk-height-1-1 uk-flex uk-flex-center uk-flex-middle\">\n					<img src=\"assets/templates/long/images/donation-logo.png\" />\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"uk-section long-lottery-container\" id=\"lottery\">\n	<div class=\"uk-container uk-margin-medium-top uk-margin-large-bottom\">\n		<div class=\"uk-grid uk-grid-medium\" uk-grid>\n			<div class=\"uk-width-1-2@m uk-width-1-1\" style=\"z-index: 1;\">\n				<h4>[%Лотерея%]</h4>\n				<p>[%Честная лотерея на блокчейне LONG%].</p>\n				<p>[%Предлагаем протестировать прозрачную лотерею на базе блокчейна LONG, чтобы проверить её честность не надо быть специалистом%].</p>\n				<p>[%Вам просто нужно угадать последние цифры хеша любого десятитысячного блока%].</p>\n				<p>[%Вы в любой момент можете проверить балланс лотерейного кошелька в эксплорере%].</p>\n				\n				<p class=\"uk-text-medium uk-text-red uk-margin-medium-top uk-margin-medium-bottom\"><b>[%Преимущества нашей лотереи%]:</b></p>\n				<ul uk-scrollspy=\"target: > li; cls: uk-animation-slide-bottom-small; delay: 200\">\n					<li>[%Любой может иметь шанс на выигрыш%]</li>\n					<li>[%Любой может проверить на честность результат%] <span class=\"uk-text-muted\">([%даже тот кто не участвует в лотерее%])</span></li>\n					<li>[%Никто не может подкрутить результаты т.к результат не известен до окончания лотереи%]</li>\n				</ul>\n			</div>\n			<div class=\"uk-width-1-2@m uk-width-1-1 uk-text-center\" style=\"z-index: 0;\">\n				<div class=\"long-lottery-bg\"></div>\n				<div class=\"uk-text-dark uk-margin-medium-bottom\">\n					<b>[%Подробнее о условиях лотереи вы можете посмотреть на сайте%]:</b>\n				</div>\n				<a href=\"https://fairlottery.org\" class=\"uk-button uk-button-red\" target=\"_blank\">\n					<span class=\"uk-margin-large-left uk-margin-large-right\"><span class=\"uk-button-dragon\"></span>[%Перейти%]&nbsp;»</span>\n				</a>\n			</div>\n		</div>\n	</div>\n</div>\n{{footer}}','0','1','0','1619610176'),
  ('4','lang','yazyk','Глобальный шаблон для папки языковой версии сайта','0','6','','0','','0','1','1618596530','1618596530'),
  ('5','instruction-content','instruction-content','Содержимое модального инструкции','0','2','','0','[*content*]','0','1','1619591146','1619599244'),
  ('6','blank','pustoj-shablon','Пустой шаблон для списка инструкций','0','2','','0','','0','1','1619599412','1619599484');


# --------------------------------------------------------

#
# Table structure for table `coin_site_tmplvar_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_tmplvar_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for template variable access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_site_tmplvar_contentvalues`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_tmplvar_contentvalues`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='Site Template Variables Content Values Link Table';

#
# Dumping data for table `coin_site_tmplvar_contentvalues`
#

INSERT INTO `coin_site_tmplvar_contentvalues` VALUES
  ('1','5','1','ru:1||en:7'),
  ('2','5','7','ru:1||en:7'),
  ('5','7','1','<h3>Коротко и просто:</h3>\n<p>LONG NETWORK соцсеть на блокчейне и не только.</p>\n<p>Мы добавили к блокчейн транзакциям возможность отправлять строку в 256 символов. То есть через блокчейн можно передавать\\получать сообщения (этакий твиттер) и строить более сложные конструкции такие как магазины на блокчейне, соцсети, лотереи, игры и т.д.</p>\n<h3>О приватности:</h3>\n<p>Так же все сообщения зашифрованы и никаких ключей у разработчиков нет. Вы шифруете своим приватным ключом и публичным ключом получателя, который является его адресом. Где лучше всего спрятать иголку? В стоге сена? Нет. Лучше всего в стоге других иголок. Весь блокчейн наводнен сообщениями и отследить и расшифровать именно Ваше не представляется возможным. (Алгоритм шифрования сообщений ecdh и aes cbc.)</p>'),
  ('6','7','7','<h3>Brief and simple:</h3>\n<p>LONG COIN - Cryptocurrency and Social Blockchain Network.</p>\n<p>We have added the ability to send a string of 256 characters to blockchain transactions. That is, through the blockchain, you can send / receive messages (a kind of twitter) and build more complex structures such as blockchain stores, social networks, lotteries, games, etc.</p>\n<h3>About privacy:</h3>\n<p>All messages are also encrypted and the developer has no keys. You encrypt with your private key and the recipient\'s public key, which is its address. Where is the best place to hide a needle? In a haystack? No. Best in a stack of other needles. The entire blockchain is flooded with messages and it is not possible to track and decipher yours. (Encryption algorithm - ecdh and aes cbc)</p>'),
  ('7','8','1','assets/files/longcoin0.7d-win64.zip'),
  ('8','9','1','assets/files/longcoin0.7d-ubuntu14.04.tar.gz'),
  ('9','10','1','assets/files/longcoin0.7d-ubuntu16.04.tar.gz'),
  ('10','11','1','assets/files/longcoin0.7d-ubuntu18.04.tar.gz'),
  ('11','12','1','assets/files/longcoin-network-full-sources.zip'),
  ('12','13','1','assets/files/network-build-from-sources.mp4'),
  ('13','14','1','assets/files/posting-in-long-network.mp4'),
  ('14','15','1','https://twitter.com/PepperSteep'),
  ('15','16','1','https://t.me/longcoinofficial'),
  ('16','17','1','https://discord.gg/JjbU47K'),
  ('17','18','1','<p>Для установки кошелька достаточно распаковать архив в каталог longcoinX.XX-win, запустить в этом каталоге longcoin-qt.exe и дождаться завершения синхронизации. Для обновления старой версии кошелька достаточно перенести в каталог longcoinX.XX-win весь каталог data старой версии и запустить longcoin-qt.exe. Или наоборот &mdash; обновить все бинарные файлы (*.exe) старой версии из каталога новой.</p>'),
  ('18','18','7','<p>To install the wallet, it is enough to unzip the archive into the longcoinX.XX-win directory, run longcoin-qt.exe in this directory and wait for the synchronization to complete. To update the old version of the wallet, just transfer the entire data directory of the old version to the longcoinX.XX-win directory and run longcoin-qt.exe. Or vice versa - update all binary files (* .exe) of the old version from the new directory.</p>'),
  ('19','19','1','<p>Главный файл кошелька - это &laquo;wallet.dat&raquo;, расположенный обычно в каталоге data. Там ваши приватные ключи, позволяющие восстановить ваши монеты и сообщения всегда и везде на любых версиях программного обеспечения! Самый надежный способ сделать резервную копию кошелька &mdash; это через меню клиента, выбрав путь для сохранения и введя имя резервной копии кошелька &laquo;wallet.dat&raquo;. В последующем его всегда можно снова импортировать опять же &mdash; через меню клиента longcoin-qt.exe.</p>'),
  ('20','19','7','<p>The main wallet file is &ldquo;wallet.dat&rdquo;, usually located in the data directory. There are your private keys, allowing you to restore your coins and messages anytime, anywhere on any version of the software! The most reliable way to backup your wallet is through the client&rsquo;s menu, choosing the path to save and entering the wallet&rsquo;s backup copy name &ldquo;wallet.dat&rdquo;. In the future, you can always import it again, again - through the client menu longcoin-qt.exe.</p>'),
  ('21','20','7','{\"fieldValue\":[{\"text\":\"Discord\",\"descr\":\"Our Discord group\",\"link\":\"https://discord.gg/JjbU47K\"},{\"text\":\"Telegram\",\"descr\":\"Our Telegram channel\",\"link\":\"https://t.me/longcoinofficial\"},{\"text\":\"Twitter\",\"descr\":\"Our Twitter feed\",\"link\":\"https://twitter.com/PepperSteep\"},{\"text\":\"BitcoinTalk\",\"descr\":\"Discussion on the BitcoinTalk forum\",\"link\":\"https://bitcointalk.org/index.php?topic=5235729\"},{\"text\":\"BitsMedia\",\"descr\":\"Discussion on the Bits.Media forum\",\"link\":\"https://forum.bits.media/index.php?/topic/163664\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
  ('22','20','1','{\"fieldValue\":[{\"text\":\"Discord\",\"descr\":\"Наша группа в Discord\",\"link\":\"https://discord.gg/JjbU47K\"},{\"text\":\"Twitter\",\"descr\":\"Наша лента в Twitter\",\"link\":\"https://twitter.com/PepperSteep\"},{\"text\":\"Telegram\",\"descr\":\"Наш канал в Telegram\",\"link\":\"https://t.me/longcoinofficial\"},{\"text\":\"VK Group\",\"descr\":\"Наша группа Вконтакте\",\"link\":\"https://vk.com/longnetwork\"},{\"text\":\"BitcoinTalk\",\"descr\":\"Обсуждение на форуме BitcoinTalk\",\"link\":\"https://bitcointalk.org/index.php?topic=5235729\"},{\"text\":\"BitsMedia\",\"descr\":\"Обсуждение на форуме Bits.Media\",\"link\":\"https://forum.bits.media/index.php?/topic/163664\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
  ('23','21','1','{\"fieldValue\":[{\"text\":\"altmarkets.io\",\"descr\":\"Обменник Alt Markets\",\"link\":\"https://altmarkets.io/\"},{\"text\":\"trade.multicoins.org\",\"descr\":\"Обменник Open Trade\",\"link\":\"https://trade.multicoins.org/\"},{\"text\":\"ex4ange.org\",\"descr\":\"Обменник Ex4ange\",\"link\":\"https://www.ex4ange.org/\"},{\"text\":\"longchain.crypton.cf\",\"descr\":\"Эксплорер LONG Explorer\",\"link\":\"http://longchain.crypton.cf/\"},{\"text\":\"blocks.crypton.cf\",\"descr\":\"Эксплорер blocks Crypton\",\"link\":\"http://blocks.crypton.cf/\"},{\"text\":\"longnomp.crypton.cf\",\"descr\":\"Пул для майнинга The Long Pool\",\"link\":\"http://longnomp.crypton.cf/\"},{\"text\":\"asicbit-pool.ru\",\"descr\":\"Пул для майнинга Asicbit\",\"link\":\"https://asicbit-pool.ru/\"},{\"text\":\"anomp.com\",\"descr\":\"Пул для майнинга Anomp\",\"link\":\"http://anomp.com/\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
  ('24','21','7','{\"fieldValue\":[{\"text\":\"altmarkets.io\",\"descr\":\"Alt Markets exchanger\",\"link\":\"https://altmarkets.io/\"},{\"text\":\"trade.multicoins.org\",\"descr\":\"Open Trade exchanger\",\"link\":\"http://longchain.crypton.cf/\"},{\"text\":\"ex4ange.org\",\"descr\":\"Ex4ange exchanger\",\"link\":\"https://www.ex4ange.org/\"},{\"text\":\"longchain.crypton.cf\",\"descr\":\"LONG Explorer\",\"link\":\"https://trade.multicoins.org/\"},{\"text\":\"blocks.crypton.cf\",\"descr\":\"Blocks Crypton Explorer\",\"link\":\"http://blocks.crypton.cf/\"},{\"text\":\"longnomp.crypton.cf\",\"descr\":\"Mining pool The Long Pool\",\"link\":\"http://longnomp.crypton.cf/\"},{\"text\":\"asicbit-pool.ru\",\"descr\":\"Mining pool Asicbit\",\"link\":\"https://asicbit-pool.ru/\"},{\"text\":\"anomp.com\",\"descr\":\"Mining pool Anomp\",\"link\":\"http://anomp.com/\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
  ('25','5','8','ru:8||en:15'),
  ('26','5','15','ru:8||en:15'),
  ('27','5','9','ru:9||en:16'),
  ('28','5','16','ru:9||en:16'),
  ('29','8','7','assets/files/longcoin0.7d-win64.zip'),
  ('30','9','7','assets/files/longcoin0.7d-ubuntu14.04.tar.gz'),
  ('31','10','7','assets/files/longcoin0.7d-ubuntu16.04.tar.gz'),
  ('32','11','7','assets/files/longcoin0.7d-ubuntu18.04.tar.gz'),
  ('33','12','7','assets/files/longcoin-network-full-sources.zip'),
  ('34','13','7','assets/files/network-build-from-sources.mp4'),
  ('35','14','7','assets/files/posting-in-long-network.mp4'),
  ('36','4','7','[(site_name)] | [*pagetitle*]'),
  ('37','4','1','[(site_name)] | [*pagetitle*]');


# --------------------------------------------------------

#
# Table structure for table `coin_site_tmplvar_templates`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_tmplvar_templates`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Site Template Variables Templates Link Table';

#
# Dumping data for table `coin_site_tmplvar_templates`
#

INSERT INTO `coin_site_tmplvar_templates` VALUES
  ('1','3','0'),
  ('2','3','0'),
  ('3','3','0'),
  ('4','3','0'),
  ('5','5','1'),
  ('7','3','0'),
  ('8','3','0'),
  ('9','3','0'),
  ('10','3','0'),
  ('11','3','0'),
  ('12','3','0'),
  ('13','3','0'),
  ('14','3','0'),
  ('17','3','0'),
  ('15','3','0'),
  ('16','3','0'),
  ('18','3','0'),
  ('19','3','0'),
  ('20','3','0'),
  ('21','3','0'),
  ('5','3','0'),
  ('5','6','1');


# --------------------------------------------------------

#
# Table structure for table `coin_site_tmplvars`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_site_tmplvars`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='Site Template Variables';

#
# Dumping data for table `coin_site_tmplvars`
#

INSERT INTO `coin_site_tmplvars` VALUES
  ('1','textarea','desc','Meta description','Meta description','0','1','0','','0','','','[*introtext*]','0','0'),
  ('2','text','keyw','Meta keywords','Meta keywords','0','1','0','','0','','','[*pagetitle*]','0','0'),
  ('3','checkbox','noIndex','No index page','Meta robots','0','1','0','Нет==<meta name=\"robots\" content=\"noindex, nofollow\">','0','','','','0','0'),
  ('4','text','titl','Meta title','Meta title','0','1','0','','0','','','[*pagetitle*] - [(site_name)]','0','0'),
  ('5','custom_tv','relation','Языковые связи','Языковые связи','0','6','0','@EVAL return $modx->runSnippet(\"evoBabel\");','0','','','','0','1618606437'),
  ('7','richtext','slide-text','Текст в слайде','','0','4','0','','0','','','','1618609143','1619590704'),
  ('8','file','win-download','Файл для Windows версии','','0','7','0','','0','','','','1619514306','1619590578'),
  ('9','file','lnx-14-download','Файл для Linux версии 14.04','','0','7','0','','0','','','','1619514313','1619590529'),
  ('10','file','lnx-16-download','Файл для Linux версии 16.04','','0','7','0','','0','','','','1619514366','1619590538'),
  ('11','file','lnx-18-download','Файл для Linux версии 18.04','','0','7','0','','0','','','','1619514383','1619590548'),
  ('12','file','ghb-full-download','Файл GitHub Full Source','','0','7','0','','0','','','','1619514399','1619590516'),
  ('13','file','simple-tutorial-download','Инструкция простая','','0','7','0','','0','','','','1619515344','1619590557'),
  ('14','file','network-tutorial-download','Инструкция по постам Long Network','','0','7','0','','0','','','','1619515379','1619590565'),
  ('15','text','link-twitter','Ссылка на Twitter','','0','8','0','','100','','','','1619518726','1619590616'),
  ('16','text','link-telegram','Ссылка на Telegram','','0','8','0','','100','','','','1619518730','1619590606'),
  ('17','text','link-discord','Ссылка на Discord','','0','8','0','','100','','','','1619518746','1619590597'),
  ('18','richtext','wallet-instalation','Текст установки кошелька','','0','4','0','','0','','','','1619520710','1619590715'),
  ('19','richtext','wallet-instalation-attention','Текст предупреждения установки кошелька','','0','4','0','','0','','','','1619520818','1619590725'),
  ('20','custom_tv:multitv','links','Полезные ссылки','','0','8','0','','0','','','','1619521277','1619590686'),
  ('21','custom_tv:multitv','links-services','Полезные ссылки - сервисы','','0','8','0','','0','','','','1619521912','1619590626');


# --------------------------------------------------------

#
# Table structure for table `coin_system_eventnames`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_system_eventnames`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COMMENT='System Event Names.';

#
# Dumping data for table `coin_system_eventnames`
#

INSERT INTO `coin_system_eventnames` VALUES
  ('1','OnDocPublished','5',''),
  ('2','OnDocUnPublished','5',''),
  ('3','OnWebPagePrerender','5',''),
  ('4','OnWebLogin','3',''),
  ('5','OnBeforeWebLogout','3',''),
  ('6','OnWebLogout','3',''),
  ('7','OnWebSaveUser','3',''),
  ('8','OnWebDeleteUser','3',''),
  ('9','OnWebChangePassword','3',''),
  ('10','OnWebCreateGroup','3',''),
  ('11','OnManagerLogin','2',''),
  ('12','OnBeforeManagerLogout','2',''),
  ('13','OnManagerLogout','2',''),
  ('14','OnManagerSaveUser','2',''),
  ('15','OnManagerDeleteUser','2',''),
  ('16','OnManagerChangePassword','2',''),
  ('17','OnManagerCreateGroup','2',''),
  ('18','OnBeforeCacheUpdate','4',''),
  ('19','OnCacheUpdate','4',''),
  ('20','OnMakePageCacheKey','4',''),
  ('21','OnLoadWebPageCache','4',''),
  ('22','OnBeforeSaveWebPageCache','4',''),
  ('23','OnChunkFormPrerender','1','Chunks'),
  ('24','OnChunkFormRender','1','Chunks'),
  ('25','OnBeforeChunkFormSave','1','Chunks'),
  ('26','OnChunkFormSave','1','Chunks'),
  ('27','OnBeforeChunkFormDelete','1','Chunks'),
  ('28','OnChunkFormDelete','1','Chunks'),
  ('29','OnDocFormPrerender','1','Documents'),
  ('30','OnDocFormRender','1','Documents'),
  ('31','OnBeforeDocFormSave','1','Documents'),
  ('32','OnDocFormSave','1','Documents'),
  ('33','OnBeforeDocFormDelete','1','Documents'),
  ('34','OnDocFormDelete','1','Documents'),
  ('35','OnDocFormUnDelete','1','Documents'),
  ('36','onBeforeMoveDocument','1','Documents'),
  ('37','onAfterMoveDocument','1','Documents'),
  ('38','OnPluginFormPrerender','1','Plugins'),
  ('39','OnPluginFormRender','1','Plugins'),
  ('40','OnBeforePluginFormSave','1','Plugins'),
  ('41','OnPluginFormSave','1','Plugins'),
  ('42','OnBeforePluginFormDelete','1','Plugins'),
  ('43','OnPluginFormDelete','1','Plugins'),
  ('44','OnSnipFormPrerender','1','Snippets'),
  ('45','OnSnipFormRender','1','Snippets'),
  ('46','OnBeforeSnipFormSave','1','Snippets'),
  ('47','OnSnipFormSave','1','Snippets'),
  ('48','OnBeforeSnipFormDelete','1','Snippets'),
  ('49','OnSnipFormDelete','1','Snippets'),
  ('50','OnTempFormPrerender','1','Templates'),
  ('51','OnTempFormRender','1','Templates'),
  ('52','OnBeforeTempFormSave','1','Templates'),
  ('53','OnTempFormSave','1','Templates'),
  ('54','OnBeforeTempFormDelete','1','Templates'),
  ('55','OnTempFormDelete','1','Templates'),
  ('56','OnTVFormPrerender','1','Template Variables'),
  ('57','OnTVFormRender','1','Template Variables'),
  ('58','OnBeforeTVFormSave','1','Template Variables'),
  ('59','OnTVFormSave','1','Template Variables'),
  ('60','OnBeforeTVFormDelete','1','Template Variables'),
  ('61','OnTVFormDelete','1','Template Variables'),
  ('62','OnUserFormPrerender','1','Users'),
  ('63','OnUserFormRender','1','Users'),
  ('64','OnBeforeUserFormSave','1','Users'),
  ('65','OnUserFormSave','1','Users'),
  ('66','OnBeforeUserFormDelete','1','Users'),
  ('67','OnUserFormDelete','1','Users'),
  ('68','OnWUsrFormPrerender','1','Web Users'),
  ('69','OnWUsrFormRender','1','Web Users'),
  ('70','OnBeforeWUsrFormSave','1','Web Users'),
  ('71','OnWUsrFormSave','1','Web Users'),
  ('72','OnBeforeWUsrFormDelete','1','Web Users'),
  ('73','OnWUsrFormDelete','1','Web Users'),
  ('74','OnSiteRefresh','1',''),
  ('75','OnFileManagerUpload','1',''),
  ('76','OnModFormPrerender','1','Modules'),
  ('77','OnModFormRender','1','Modules'),
  ('78','OnBeforeModFormDelete','1','Modules'),
  ('79','OnModFormDelete','1','Modules'),
  ('80','OnBeforeModFormSave','1','Modules'),
  ('81','OnModFormSave','1','Modules'),
  ('82','OnBeforeWebLogin','3',''),
  ('83','OnWebAuthentication','3',''),
  ('84','OnBeforeManagerLogin','2',''),
  ('85','OnManagerAuthentication','2',''),
  ('86','OnSiteSettingsRender','1','System Settings'),
  ('87','OnFriendlyURLSettingsRender','1','System Settings'),
  ('88','OnUserSettingsRender','1','System Settings'),
  ('89','OnInterfaceSettingsRender','1','System Settings'),
  ('90','OnSecuritySettingsRender','1','System Settings'),
  ('91','OnFileManagerSettingsRender','1','System Settings'),
  ('92','OnMiscSettingsRender','1','System Settings'),
  ('93','OnRichTextEditorRegister','1','RichText Editor'),
  ('94','OnRichTextEditorInit','1','RichText Editor'),
  ('95','OnManagerPageInit','2',''),
  ('96','OnWebPageInit','5',''),
  ('97','OnLoadDocumentObject','5',''),
  ('98','OnBeforeLoadDocumentObject','5',''),
  ('99','OnAfterLoadDocumentObject','5',''),
  ('100','OnLoadWebDocument','5',''),
  ('101','OnParseDocument','5',''),
  ('102','OnParseProperties','5',''),
  ('103','OnBeforeParseParams','5',''),
  ('104','OnManagerLoginFormRender','2',''),
  ('105','OnWebPageComplete','5',''),
  ('106','OnLogPageHit','5',''),
  ('107','OnBeforeManagerPageInit','2',''),
  ('108','OnBeforeEmptyTrash','1','Documents'),
  ('109','OnEmptyTrash','1','Documents'),
  ('110','OnManagerLoginFormPrerender','2',''),
  ('111','OnStripAlias','1','Documents'),
  ('112','OnMakeDocUrl','5',''),
  ('113','OnBeforeLoadExtension','5',''),
  ('114','OnCreateDocGroup','1','Documents'),
  ('115','OnManagerWelcomePrerender','2',''),
  ('116','OnManagerWelcomeHome','2',''),
  ('117','OnManagerWelcomeRender','2',''),
  ('118','OnBeforeDocDuplicate','1','Documents'),
  ('119','OnDocDuplicate','1','Documents'),
  ('120','OnManagerMainFrameHeaderHTMLBlock','2',''),
  ('121','OnManagerPreFrameLoader','2',''),
  ('122','OnManagerFrameLoader','2',''),
  ('123','OnManagerTreeInit','2',''),
  ('124','OnManagerTreePrerender','2',''),
  ('125','OnManagerTreeRender','2',''),
  ('126','OnManagerNodePrerender','2',''),
  ('127','OnManagerNodeRender','2',''),
  ('128','OnManagerMenuPrerender','2',''),
  ('129','OnManagerTopPrerender','2',''),
  ('130','OnDocFormTemplateRender','1','Documents'),
  ('131','OnBeforeMinifyCss','1',''),
  ('132','OnPageUnauthorized','1',''),
  ('133','OnPageNotFound','1',''),
  ('134','OnFileBrowserUpload','1','File Browser Events'),
  ('135','OnBeforeFileBrowserUpload','1','File Browser Events'),
  ('136','OnFileBrowserDelete','1','File Browser Events'),
  ('137','OnBeforeFileBrowserDelete','1','File Browser Events'),
  ('138','OnFileBrowserInit','1','File Browser Events'),
  ('139','OnFileBrowserMove','1','File Browser Events'),
  ('140','OnBeforeFileBrowserMove','1','File Browser Events'),
  ('141','OnFileBrowserCopy','1','File Browser Events'),
  ('142','OnBeforeFileBrowserCopy','1','File Browser Events'),
  ('143','OnBeforeFileBrowserRename','1','File Browser Events'),
  ('144','OnFileBrowserRename','1','File Browser Events'),
  ('145','OnLogEvent','1','Log Event');


# --------------------------------------------------------

#
# Table structure for table `coin_system_settings`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_system_settings`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains Content Manager settings.';

#
# Dumping data for table `coin_system_settings`
#

INSERT INTO `coin_system_settings` VALUES
  ('settings_version','2.0.4'),
  ('manager_theme','default'),
  ('server_offset_time','0'),
  ('manager_language','russian-UTF8'),
  ('modx_charset','UTF-8'),
  ('site_name','LONG COIN'),
  ('site_start','1'),
  ('error_page','1'),
  ('unauthorized_page','1'),
  ('site_status','1'),
  ('auto_template_logic','sibling'),
  ('default_template','3'),
  ('old_template','3'),
  ('publish_default','1'),
  ('friendly_urls','1'),
  ('friendly_alias_urls','1'),
  ('use_alias_path','1'),
  ('cache_type','2'),
  ('failed_login_attempts','10'),
  ('blocked_minutes','60'),
  ('use_captcha','0'),
  ('emailsender','basya.best@gmail.com'),
  ('use_editor','1'),
  ('use_browser','1'),
  ('fe_editor_lang','russian-UTF8'),
  ('fck_editor_toolbar','standard'),
  ('fck_editor_autolang','0'),
  ('editor_css_path',''),
  ('editor_css_selectors',''),
  ('upload_maxsize','1000485760'),
  ('manager_layout','4'),
  ('auto_menuindex','1'),
  ('session.cookie.lifetime','604800'),
  ('mail_check_timeperiod','600'),
  ('manager_direction','ltr'),
  ('xhtml_urls','0'),
  ('automatic_alias','1'),
  ('datetime_format','dd-mm-YYYY'),
  ('warning_visibility','0'),
  ('remember_last_tab','1'),
  ('enable_bindings','1'),
  ('seostrict','1'),
  ('number_of_results','30'),
  ('theme_refresher',''),
  ('show_picker','0'),
  ('show_newresource_btn','0'),
  ('show_fullscreen_btn','0'),
  ('email_sender_method','1'),
  ('site_id','6079cb576b7b8'),
  ('a','30'),
  ('site_unavailable_page',''),
  ('reload_site_unavailable',''),
  ('siteunavailable_message_default','В настоящее время сайт недоступен.'),
  ('site_unavailable_message','В настоящее время сайт недоступен.'),
  ('chunk_processor','DLTemplate'),
  ('cache_default','1'),
  ('search_default','1'),
  ('custom_contenttype','application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
  ('docid_incrmnt_method','0'),
  ('enable_cache','1'),
  ('minifyphp_incache','0'),
  ('server_protocol','http'),
  ('rss_url_news','http://feeds.feedburner.com/evocms-release-news'),
  ('track_visitors','0'),
  ('friendly_url_prefix',''),
  ('friendly_url_suffix','.html'),
  ('make_folders','0'),
  ('aliaslistingfolder','0'),
  ('allow_duplicate_alias','0'),
  ('manager_theme_mode','3'),
  ('login_logo',''),
  ('login_bg',''),
  ('login_form_position','left'),
  ('login_form_style','dark'),
  ('manager_menu_position','top'),
  ('tree_page_click','27'),
  ('use_breadcrumbs','0'),
  ('global_tabs','1'),
  ('group_tvs','0'),
  ('resource_tree_node_name','pagetitle'),
  ('session_timeout','15'),
  ('tree_show_protected','0'),
  ('datepicker_offset','-10'),
  ('number_of_logs','100'),
  ('number_of_messages','40'),
  ('which_editor','TinyMCE4'),
  ('tinymce4_theme','custom'),
  ('tinymce4_skin','lightgray'),
  ('tinymce4_skintheme','inlite'),
  ('tinymce4_template_docs',''),
  ('tinymce4_template_chunks',''),
  ('tinymce4_entermode','p'),
  ('tinymce4_element_format','xhtml'),
  ('tinymce4_schema','html5'),
  ('tinymce4_custom_plugins','advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
  ('tinymce4_custom_buttons1','undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
  ('tinymce4_custom_buttons2','link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
  ('tinymce4_custom_buttons3',''),
  ('tinymce4_custom_buttons4',''),
  ('tinymce4_blockFormats','Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
  ('use_udperms','1'),
  ('udperms_allowroot','0'),
  ('allow_eval','with_scan'),
  ('safe_functions_at_eval','time,date,strtotime,strftime'),
  ('check_files_onlogin','index.php\n.htaccess\nmanager/index.php\n/core/config/database/connections/default.php'),
  ('validate_referer','1'),
  ('rss_url_security','http://feeds.feedburner.com/evocms-security-news'),
  ('error_reporting','1'),
  ('send_errormail','0'),
  ('pwd_hash_algo','UNCRYPT'),
  ('reload_captcha_words',''),
  ('captcha_words','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
  ('captcha_words_default','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
  ('filemanager_path','D:/OpenServer/domains/media-long-site.test.ru/www/'),
  ('upload_files','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
  ('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
  ('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
  ('upload_flash','fla,flv,swf'),
  ('new_file_permissions','0644'),
  ('new_folder_permissions','0755'),
  ('which_browser','mcpuk'),
  ('rb_webuser','0'),
  ('rb_base_dir','D:/OpenServer/domains/media-long-site.test.ru/www/assets/'),
  ('rb_base_url','assets/'),
  ('clean_uploaded_filename','1'),
  ('strip_image_paths','1'),
  ('maxImageWidth','2600'),
  ('maxImageHeight','2200'),
  ('clientResize','0'),
  ('noThumbnailsRecreation','0'),
  ('thumbWidth','150'),
  ('thumbHeight','150'),
  ('thumbsDir','.thumbs'),
  ('jpegQuality','90'),
  ('denyZipDownload','0'),
  ('denyExtensionRename','0'),
  ('showHiddenFiles','0'),
  ('email_method','mail'),
  ('smtp_auth','0'),
  ('smtp_secure','none'),
  ('smtp_host','smtp.example.com'),
  ('smtp_port','25'),
  ('smtp_username','emailsender'),
  ('reload_emailsubject',''),
  ('emailsubject_default','Данные для авторизации'),
  ('emailsubject','Данные для авторизации'),
  ('reload_websignupemail_message',''),
  ('system_email_websignup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('websignupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('reload_system_email_webreminder_message',''),
  ('system_email_webreminder_default','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
  ('webpwdreminder_message','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
  ('allow_multiple_emails','0'),
  ('lang_code','en'),
  ('sys_files_checksum','a:4:{s:59:\"D:/OpenServer/domains/media-long-site.test.ru/www/index.php\";s:32:\"6daef9ac899a7a01447baa236cf48eda\";s:59:\"D:/OpenServer/domains/media-long-site.test.ru/www/.htaccess\";s:32:\"b12739e14a9d18d7090427db01bd4021\";s:67:\"D:/OpenServer/domains/media-long-site.test.ru/www/manager/index.php\";s:32:\"a03fa8d6548de0562fdebcb67ba0e736\";s:95:\"D:/OpenServer/domains/media-long-site.test.ru/www//core/config/database/connections/default.php\";s:32:\"5ce5aead923ba5e07a081e3be064b13f\";}');


# --------------------------------------------------------

#
# Table structure for table `coin_user_attributes`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_user_attributes`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `verified` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Contains information about the backend users.';

#
# Dumping data for table `coin_user_attributes`
#

INSERT INTO `coin_user_attributes` VALUES
  ('1','1','Admin','1','basya.best@gmail.com','','','0','0','0','1','0','1618594661','0','1','0','0','','','','','','','','','0','0','1');


# --------------------------------------------------------

#
# Table structure for table `coin_user_messages`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_user_messages`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains messages for the Content Manager messaging system.';



# --------------------------------------------------------

#
# Table structure for table `coin_user_roles`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_user_roles`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `category_manager` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Contains information describing the user roles.';

#
# Dumping data for table `coin_user_roles`
#

INSERT INTO `coin_user_roles` VALUES
  ('2','Editor','Limited to managing content','1','1','1','1','1','1','1','0','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','1','0','1','0','1','1','1','1','1','0','1','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','1','0','0','1','1','1'),
  ('3','Publisher','Editor with expanded permissions including manage users, update Elements and site settings','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','0','0','1','1','1','1','1','1','0','0','0','0','1','1','1','1','1','1','1','1','1','0','1','1','1','1','1','1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','1','1','1','1','0','1','0','0','1','1','1'),
  ('1','Administrator','Site administrators have full access to all functions','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1');


# --------------------------------------------------------

#
# Table structure for table `coin_user_settings`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_user_settings`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains backend user settings.';



# --------------------------------------------------------

#
# Table structure for table `coin_web_groups`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_web_groups`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for web access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_web_user_attributes`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_web_user_attributes`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `verified` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains information for web users.';



# --------------------------------------------------------

#
# Table structure for table `coin_web_user_settings`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_web_user_settings`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains web user settings.';



# --------------------------------------------------------

#
# Table structure for table `coin_web_users`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_web_users`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;



# --------------------------------------------------------

#
# Table structure for table `coin_webgroup_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_webgroup_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for web access permissions.';



# --------------------------------------------------------

#
# Table structure for table `coin_webgroup_names`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `coin_webgroup_names`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `coin_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for web access permissions.';

