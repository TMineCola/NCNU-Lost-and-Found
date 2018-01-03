-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-01-03 16:50:46
-- 服务器版本： 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lost_found`
--

-- --------------------------------------------------------

--
-- 表的结构 `classification`
--

CREATE TABLE `classification` (
  `ID` tinyint(4) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf32 COLLATE utf32_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `classification`
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
-- 表的结构 `department`
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
-- 转存表中的数据 `department`
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
-- 表的结构 `property_found`
--

CREATE TABLE `property_found` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `classification_id` int(11) NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `registered_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_interval_LB` datetime NOT NULL,
  `time_interval_UB` datetime NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `registrant_id` bigint(20) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `image` text,
  `deleteHash` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `property_found`
--

INSERT INTO `property_found` (`ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `department_id`, `registrant_id`, `description`, `state`, `image`, `deleteHash`) VALUES
(15, 'RAY!!!', 2, 'Moli', '2017-12-19 00:07:24', '2017-03-31 18:00:00', '2017-03-31 00:00:00', NULL, NULL, '可以更改了', 0, 'http://localhost:3000/img/null.jpg', ''),
(16, 'RAY PIG!!!', 4, 'Moli', '2017-12-19 00:09:56', '2017-03-31 18:00:00', '2017-04-01 00:00:00', NULL, NULL, '很笨', 0, 'http://localhost:3000/img/null.jpg', ''),
(18, '測試', 8, '測試', '2017-12-25 17:11:39', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '測試', 0, 'https://i.imgur.com/r0FqevC.png', ''),
(19, '飲料', 8, '飲料', '2017-12-25 19:29:07', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '飲料好喝', 0, 'http://localhost:3000/img/null.jpg', ''),
(20, 'ewr', 1, 'wer', '2017-12-25 19:30:31', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, 'eweee', 0, 'http://localhost:3000/img/null.jpg', ''),
(22, '外套', 1, '停車場', '2017-12-25 19:35:12', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '黑色', 0, 'http://localhost:3000/img/null.jpg', ''),
(23, '鉛筆', 5, '教室', '2017-12-26 02:04:15', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '新的 haha~', 0, 'http://localhost:3000/img/null.jpg', ''),
(24, '時間', 1, '時間', '2017-12-26 06:04:56', '2017-12-14 14:00:00', '2017-12-14 16:00:00', NULL, NULL, 'ISO8601', 0, 'http://localhost:3000/img/null.jpg', ''),
(25, 'sdf', 2, 'sdf', '2017-12-26 06:05:38', '2017-12-13 01:00:00', '2017-12-13 01:00:00', NULL, NULL, '6666666666666666', 0, 'http://localhost:3000/img/null.jpg', ''),
(27, '水壺', 8, '教室', '2017-12-26 08:41:13', '2017-12-26 08:00:00', '2017-12-26 09:00:00', NULL, NULL, 'asd', 0, 'http://localhost:3000/img/null.jpg', ''),
(29, '手機', 5, '教室', '2017-12-27 00:49:21', '2017-12-27 16:00:00', '2017-12-27 17:00:00', NULL, NULL, 'iphone', 0, 'http://localhost:3000/img/null.jpg', ''),
(30, '雨傘', 7, '教室', '2017-12-28 17:44:15', '2017-12-28 16:00:00', '2017-12-28 18:00:00', NULL, NULL, '黃色', 0, 'https://i.imgur.com/kuOTCw9.png', ''),
(31, '女友', 1, 'moli', '2017-12-28 18:48:20', '2017-12-28 16:00:00', '2017-12-28 17:00:00', NULL, NULL, 'cute', 0, 'https://i.imgur.com/6uayW1t.png', ''),
(32, '45', 1, '123', '2017-12-28 22:13:57', '2017-12-01 01:00:00', '2017-12-01 02:00:00', NULL, NULL, '123', 0, 'https://i.imgur.com/tWeR9AX.png', ''),
(33, '234', 1, '234', '2017-12-28 22:14:59', '2017-12-01 01:00:00', '2017-12-01 02:00:00', NULL, NULL, '123', 0, 'http://localhost:3000/img/null.jpg', ''),
(34, 'QQQ', 2, 'QQQ', '2017-12-28 22:17:21', '2017-12-09 01:00:00', '2017-12-09 12:00:00', NULL, NULL, 'QQQ', 0, 'http://localhost:3000/img/null.jpg', ''),
(35, '123', 2, '1231', '2017-12-28 22:21:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '123', 0, 'http://localhost:3000/img/null.jpg', '123'),
(36, '777', 1, '777', '2018-01-02 22:54:55', '2018-01-01 07:00:00', '2018-01-01 08:00:00', NULL, NULL, '777', 0, 'http://localhost:3000/img/null.jpg', 'qqq'),
(37, '777', 1, '777', '2018-01-02 22:56:56', '2018-01-01 07:00:00', '2018-01-01 08:00:00', NULL, NULL, '777', 0, 'https://i.imgur.com/HvjgeNf.png', '7i6J0NlpsrFbIhW'),
(38, 'Sam的很慢的筆電', 4, 'moli', '2018-01-02 22:59:10', '2018-01-02 23:00:00', '2018-01-02 22:00:00', NULL, NULL, '很慢!', 0, 'https://i.imgur.com/5C7SDc1.png', 'g5ZJpi4EaCudHpD'),
(39, 'final', 1, 'final', '2018-01-02 23:33:23', '2018-01-02 02:00:00', '2018-01-02 03:00:00', NULL, NULL, '123', 0, 'https://i.imgur.com/fFW5E1M.png', '7uTfIYIeEHFzzkP');

-- --------------------------------------------------------

--
-- 表的结构 `property_lostwish`
--

CREATE TABLE `property_lostwish` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `classification_id` int(11) NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `registered_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_interval_LB` datetime DEFAULT NULL,
  `time_interval_UB` datetime DEFAULT NULL,
  `wisher_id` bigint(20) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `property_lostwish`
--

INSERT INTO `property_lostwish` (`ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image`) VALUES
(1, 'tofind1', 5, '宿舍交誼廳', '2017-11-02 00:00:00', '2017-11-03 09:00:00', '2017-11-03 11:00:00', 1, '帽子一頂', 0, 'http://localhost:3000/img/null.jpg'),
(2, 'esfsdfsdf', 1, 'asdasdas', '0000-00-00 00:00:00', '2017-11-01 01:00:00', '2017-11-01 13:00:00', 6, 'sdsdfsdfsdf', 1, 'http://localhost:3000/img/null.jpg'),
(3, 'qwwww', 5, 'www', '2017-11-02 00:00:00', '2017-11-02 09:00:00', '2017-11-02 13:00:00', 1, '測試', 2, 'http://localhost:3000/img/null.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `property_state`
--

CREATE TABLE `property_state` (
  `ID` tinyint(2) UNSIGNED NOT NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `property_state`
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
-- 表的结构 `register`
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
-- 转存表中的数据 `register`
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
-- 表的结构 `student`
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
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`ID`, `register_id`, `department_id`, `grade`, `name`, `contact_info`, `contact_info2`, `contact_info3`, `image`, `info_check`) VALUES
(1, 6, 49, 11, 'testname', 'tset', '', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `teacher_staff`
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
-- 转存表中的数据 `teacher_staff`
--

INSERT INTO `teacher_staff` (`ID`, `register_id`, `department_id`, `name`, `contact_info`, `contact_info2`, `contact_info3`, `image`, `info_check`) VALUES
(1, 3, 1, '丁乙己', '0912345678', NULL, NULL, NULL, 0),
(2, 5, -1, '未填寫', '未填寫', NULL, NULL, NULL, 0),
(3, 9, 1, '未填寫', '未填寫', NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `property_found`
--
ALTER TABLE `property_found`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `property_lostwish`
--
ALTER TABLE `property_lostwish`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `property_state`
--
ALTER TABLE `property_state`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `teacher_staff`
--
ALTER TABLE `teacher_staff`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `classification`
--
ALTER TABLE `classification`
  MODIFY `ID` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- 使用表AUTO_INCREMENT `property_found`
--
ALTER TABLE `property_found`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用表AUTO_INCREMENT `property_lostwish`
--
ALTER TABLE `property_lostwish`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `property_state`
--
ALTER TABLE `property_state`
  MODIFY `ID` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `teacher_staff`
--
ALTER TABLE `teacher_staff`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
