CREATE TABLE `second_student` (
  `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引',
  `id` varchar(255) NOT NULL COMMENT '考生編號',
  `name` varchar(255) NOT NULL COMMENT '考生姓名',
  `sex` varchar(255) NOT NULL COMMENT '考生性別',
  `year` smallint(5) UNSIGNED NOT NULL COMMENT '出生年',
  `month` smallint(5) UNSIGNED NOT NULL COMMENT '出生月',
  `day` smallint(5) UNSIGNED NOT NULL COMMENT '出生日',
  `school` varchar(255) NOT NULL COMMENT '就讀學校',
  `class` varchar(255) NOT NULL COMMENT '班級',
  `phone` varchar(255) NOT NULL COMMENT '聯絡電話',
  `note` varchar(255) NOT NULL COMMENT '備註',
  `place` smallint(5) UNSIGNED NOT NULL COMMENT '考場編號',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM;

CREATE TABLE `second_check1` (
  `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引',
  `right_num1` smallint(5) UNSIGNED NOT NULL COMMENT '答對題數',
  `T1` smallint(5) UNSIGNED NOT NULL COMMENT 'T分數',
  `PR1` smallint(5) UNSIGNED NOT NULL COMMENT 'PR值',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM;

CREATE TABLE `second_check2` (
  `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引',
  `right_num2` smallint(5) UNSIGNED NOT NULL COMMENT '答對題數',
  `T2` smallint(5) UNSIGNED NOT NULL COMMENT 'T分數',
  `PR2` smallint(5) UNSIGNED NOT NULL COMMENT 'PR值',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM;

CREATE TABLE `second_check3` (
  `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引',
  `right_num3` smallint(5) UNSIGNED NOT NULL COMMENT '答對題數',
  `T3` smallint(5) UNSIGNED NOT NULL COMMENT 'T分數',
  `PR3` smallint(5) UNSIGNED NOT NULL COMMENT 'PR值',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM;

CREATE TABLE `second_check4` (
  `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引',
  `right_num4` smallint(5) UNSIGNED NOT NULL COMMENT '答對題數',
  `T4` smallint(5) UNSIGNED NOT NULL COMMENT 'T分數',
  `PR4` smallint(5) UNSIGNED NOT NULL COMMENT 'PR值',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM;

CREATE TABLE `second_grade` (
  `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引',
  `place` smallint(5) UNSIGNED NOT NULL COMMENT '試場編號',
  `id` varchar(255) NOT NULL COMMENT '考生編號',
  `test1` smallint(5) UNSIGNED NOT NULL COMMENT '測驗一',
  `t1` smallint(5) UNSIGNED NOT NULL COMMENT '測驗一T分數',
  `test2` smallint(6) NOT NULL COMMENT '測驗二',
  `t2` smallint(6) NOT NULL COMMENT '測驗二T分數',
  `test3` smallint(6) NOT NULL COMMENT '測驗三',
  `t3` smallint(6) NOT NULL COMMENT '測驗三T分數',
  `tall` smallint(5) UNSIGNED NOT NULL COMMENT 'T分數總分',
  `allt` smallint(5) UNSIGNED NOT NULL COMMENT '總分T分數',
  `PR` smallint(5) UNSIGNED NOT NULL COMMENT 'PR值',
  `note` varchar(255) NOT NULL COMMENT '缺考',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM;