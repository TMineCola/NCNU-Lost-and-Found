-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2018-01-04 22:19:07
-- 服务器版本： 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, '測試', 1, '測試', '2018-01-04 18:50:59', '2018-01-04 10:00:00', '2018-01-04 12:00:00', 1, 1, '1', 5, 'data:image/jpeg;base64,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', NULL);

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
  `image` text,
  `deleteHash` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `session_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `access_token`, `name`, `email`, `session_key`) VALUES
('10208434226493678', NULL, 'Mike Sam', 'samson9565@gmail.com', NULL),
('1223101501168152', 'EAACFNzrJs4MBADGBwlVia5Sz3gtTPg0HIWgaJpG4UjBom1Er4mGnxabogyqD82i5F0bZBChtzq7EkxvnJRteDUrFRMDLG44zeft7YYqNmt9SbDKjAfCZAD0hfQZBSSdY0ufZAqxsJfRxfS3LSqDzETpzUlgA401wGvnCOZAy8ggZDZD', 'Wang Jiun-Jie', 'wang.minecola@gmail.com', NULL);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `property_found`
--
ALTER TABLE `property_found`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `property_lostwish`
--
ALTER TABLE `property_lostwish`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `property_state`
--
ALTER TABLE `property_state`
  MODIFY `ID` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
