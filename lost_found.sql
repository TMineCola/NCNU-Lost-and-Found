-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018 年 01 月 04 日 23:54
-- 伺服器版本: 10.1.25-MariaDB
-- PHP 版本： 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `lost_found`
--

-- --------------------------------------------------------

--
-- 資料表結構 `classification`
--

CREATE TABLE `classification` (
  `ID` tinyint(4) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf32 COLLATE utf32_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `classification`
--

INSERT INTO `classification` (`ID`, `name`, `description`) VALUES
(1, '衣物及鞋子', NULL),
(2, '現金', NULL),
(3, '書', NULL),
(4, '電子產品', NULL),
(5, '文具', NULL),
(6, '卡片', NULL),
(7, '雨具', NULL),
(8, '生活用品', NULL),
(9, '其他', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `department`
--

CREATE TABLE `department` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_info2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `contact_info3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `isManagement` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `department`
--

INSERT INTO `department` (`ID`, `name`, `contact_info`, `contact_info2`, `contact_info3`, `description`, `isManagement`) VALUES
(1, '校長室（工友）陳琪瑜', '2002', NULL, NULL, NULL, 0),
(2, '秘書室（專任助理）尤傑', '2106', NULL, NULL, NULL, 0),
(3, '主計室（約用助理員）陳熙文', '2528', NULL, NULL, NULL, 0),
(4, '人事室（工友）李秋菊', '2513', NULL, NULL, NULL, 0),
(5, '教務處（專任助理）劉凱婷', '2264', NULL, NULL, NULL, 0),
(6, '教務處註冊組（組員）葉宜冬', '2212', NULL, NULL, NULL, 0),
(7, '教務處課務組（專任助理）何慶興', '2222', NULL, NULL, NULL, 0),
(8, '教務處招生組（約用助理員）李貞慧', '2233', NULL, NULL, NULL, 0),
(9, '教務處教學發展中心（專任助理）游郁雯', '2282', NULL, NULL, NULL, 0),
(10, '學務處（約用組員）	鄭亦軫', '2302', NULL, NULL, NULL, 0),
(11, '學務處諮商中心(專任助理）柯文惠', '2392', NULL, NULL, NULL, 0),
(12, '學務處生輔組（約用助理員）楊琇婷', '2313', NULL, NULL, NULL, 0),
(13, '學務處課外活動組（約用助理員）陳思媛', '2324', NULL, NULL, NULL, 0),
(14, '學務處衛保組(護理師）許秋純', '2750', NULL, NULL, NULL, 0),
(15, '學務處住服組（約用助理員）張家銘', '5200', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `property_found`
--

CREATE TABLE `property_found` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `classification_id` int(11) NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `registered_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_interval_LB` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_interval_UB` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `registrant_id` bigint(20) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `image` text,
  `deleteHash` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `property_lostwish`
--

CREATE TABLE `property_lostwish` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `classification_id` int(11) NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `registered_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_interval_LB` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_interval_UB` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `wisher_id` bigint(20) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `image` text,
  `deleteHash` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `property_state`
--

CREATE TABLE `property_state` (
  `ID` tinyint(2) UNSIGNED NOT NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `property_state`
--

INSERT INTO `property_state` (`ID`, `state`) VALUES
(0, '待送行政'),
(1, '找尋失主'),
(2, '失主領回'),
(3, '待拾得人領'),
(4, '拾得人領回'),
(5, '公開招領'),
(6, '已認領'),
(7, '行政處置');

-- --------------------------------------------------------

--
-- 資料表結構 `register`
--

CREATE TABLE `register` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `identity` tinyint(4) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `registered_time` datetime NOT NULL,
  `isManager` tinyint(1) NOT NULL,
  `isMaintainer` tinyint(1) NOT NULL,
  `register_check` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `register`
--

INSERT INTO `register` (`ID`, `identity`, `email`, `password`, `registered_time`, `isManager`, `isMaintainer`, `register_check`) VALUES
(1, 2, 'test', 'test', '2017-11-25 22:41:42', 0, 0, 0),
(2, 3, 'test2', 'test2', '2017-11-25 22:44:01', 0, 0, 0),
(3, 3, 'test@mail.com', 'test', '2017-11-26 23:34:33', 0, 0, 0),
(6, 3, 'test2@gmail.com', 'test', '2017-11-27 22:24:12', 0, 0, 0),
(8, 2, 'test1@mail.com', 'test', '2017-11-28 00:08:28', 0, 0, 0),
(9, 2, 'test3@gmail.com', 'test', '2017-11-28 00:09:06', 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `register_id` bigint(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `grade` tinyint(4) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_info2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `contact_info3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `image` text,
  `info_check` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `student`
--

INSERT INTO `student` (`ID`, `register_id`, `department_id`, `grade`, `name`, `contact_info`, `contact_info2`, `contact_info3`, `image`, `info_check`) VALUES
(1, 6, 49, 11, 'testname', 'tset', '', '', '', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `teacher_staff`
--

CREATE TABLE `teacher_staff` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `register_id` bigint(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_info2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `contact_info3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `image` text,
  `info_check` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `teacher_staff`
--

INSERT INTO `teacher_staff` (`ID`, `register_id`, `department_id`, `name`, `contact_info`, `contact_info2`, `contact_info3`, `image`, `info_check`) VALUES
(1, 3, 1, '丁乙己', '0912345678', NULL, NULL, NULL, 0),
(2, 5, -1, '未填寫', '未填寫', NULL, NULL, NULL, 0),
(3, 9, 1, '未填寫', '未填寫', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `session_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `property_found`
--
ALTER TABLE `property_found`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `property_lostwish`
--
ALTER TABLE `property_lostwish`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `property_state`
--
ALTER TABLE `property_state`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `teacher_staff`
--
ALTER TABLE `teacher_staff`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `classification`
--
ALTER TABLE `classification`
  MODIFY `ID` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用資料表 AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用資料表 AUTO_INCREMENT `property_found`
--
ALTER TABLE `property_found`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `property_lostwish`
--
ALTER TABLE `property_lostwish`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用資料表 AUTO_INCREMENT `property_state`
--
ALTER TABLE `property_state`
  MODIFY `ID` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用資料表 AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `teacher_staff`
--
ALTER TABLE `teacher_staff`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
