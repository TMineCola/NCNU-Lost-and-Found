-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2018-01-03 01:02:13
-- 伺服器版本: 10.1.16-MariaDB
-- PHP 版本： 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, '校長室', '2', NULL, NULL, NULL, 0),
(2, '副校長室', '2', NULL, NULL, NULL, 0),
(3, '秘書室', '2', NULL, NULL, NULL, 0),
(4, '主計室', '2', NULL, NULL, NULL, 0),
(5, '主計室', '2', NULL, NULL, NULL, 0),
(6, '人事室', '2', NULL, NULL, NULL, 0),
(7, '教務處', '2', NULL, NULL, NULL, 0),
(8, '教務處註冊組', '2', NULL, NULL, NULL, 0),
(9, '教務處課務組', '2', NULL, NULL, NULL, 0),
(10, '教務處招生組', '2', NULL, NULL, NULL, 0),
(11, '教務處資訊服務組', '2', NULL, NULL, NULL, 0),
(12, '教務處教學發展中心', '2', NULL, NULL, NULL, 0),
(13, '學務處', '2', NULL, NULL, NULL, 0),
(14, '學務處諮商中心', '2', NULL, NULL, NULL, 0),
(15, '學務處生輔組', '2', NULL, NULL, NULL, 1),
(16, '學務處課外活動組', '2', NULL, NULL, NULL, 0),
(17, '學務處衛保組', '2', NULL, NULL, NULL, 0),
(18, '學務處住服組', '2', NULL, NULL, NULL, 0),
(19, '學務處校安中心', '2', NULL, NULL, NULL, 0),
(20, '學務處職涯暨校友中心', '2', NULL, NULL, NULL, 0),
(21, '教務處', '2', NULL, NULL, NULL, 0),
(22, '教務處文書組', '2', NULL, NULL, NULL, 0),
(23, '教務處事務組', '2', NULL, NULL, NULL, 0),
(24, '教務處出納組', '2', NULL, NULL, NULL, 0),
(25, '教務處營繕組', '2', NULL, NULL, NULL, 0),
(26, '教務處保管組', '2', NULL, NULL, NULL, 0),
(27, '教務處採購組', '2', NULL, NULL, NULL, 0),
(28, '研發處', '2', NULL, NULL, NULL, 0),
(29, '研發處綜合企劃組', '2', NULL, NULL, NULL, 0),
(30, '研發處學術及推廣服務組', '2', NULL, NULL, NULL, 0),
(31, '研發處創業育成中心', '2', NULL, NULL, NULL, 0),
(32, '國際處', '2', NULL, NULL, NULL, 0),
(33, '國際處國務組', '2', NULL, NULL, NULL, 0),
(34, '國際處僑陸組', '2', NULL, NULL, NULL, 0),
(35, '圖書館', '2', NULL, NULL, NULL, 0),
(36, '圖書館行政組', '2', NULL, NULL, NULL, 0),
(37, '圖書館採編組', '2', NULL, NULL, NULL, 0),
(38, '圖書館系統資訊組', '2', NULL, NULL, NULL, 0),
(39, '圖書館閱覽服務組', '2', NULL, NULL, NULL, 0),
(40, '計網中心', '2', NULL, NULL, NULL, 0),
(41, '計網中心系統組', '2', NULL, NULL, NULL, 0),
(42, '計網中心網路組', '2', NULL, NULL, NULL, 0),
(43, '計網中心綜合業務組', '2', NULL, NULL, NULL, 0),
(44, '計網中心諮詢組', '2', NULL, NULL, NULL, 0),
(45, '環安衛中心', '2', NULL, NULL, NULL, 0),
(46, '環安衛中心環保組', '2', NULL, NULL, NULL, 0),
(47, '環安衛中心安全衛生組', '2', NULL, NULL, NULL, 0),
(48, '人文學院', '2', NULL, NULL, NULL, 0),
(49, '中國語文學系', '2', NULL, NULL, NULL, 0),
(50, '外國語文學系', '2', NULL, NULL, NULL, 0),
(51, '社會政策與社會工作學系', '2', NULL, NULL, NULL, 0),
(52, '公共行政與政策學系', '2', NULL, NULL, NULL, 0),
(53, '歷史學系', '2', NULL, NULL, NULL, 0),
(54, '東南亞學系', '2', NULL, NULL, NULL, 0),
(55, '華語文教學碩士學位學程', '2', NULL, NULL, NULL, 0),
(56, '非營利組織經營管理碩士學位學程', '2', NULL, NULL, NULL, 0),
(57, '原鄉發展跨領域學士學位學程', '2', NULL, NULL, NULL, 0),
(58, '管理學院', '2', NULL, NULL, NULL, 0),
(59, '國際企業學系', '2', NULL, NULL, NULL, 0),
(60, '經濟學系', '2', NULL, NULL, NULL, 0),
(61, '資訊管理學系', '2', NULL, NULL, NULL, 0),
(62, '財務金融系', '2', NULL, NULL, NULL, 0),
(63, '觀光休閒與餐旅管理學系', '2', NULL, NULL, NULL, 0),
(64, '管理學位學程', '2', NULL, NULL, NULL, 0),
(65, '新興產業策略與發展學位學程', '2', NULL, NULL, NULL, 0),
(66, '科技學院', '2', NULL, NULL, NULL, 0),
(67, '土木工程學系', '2', NULL, NULL, NULL, 0),
(68, '資訊工程學系', '2', NULL, NULL, NULL, 0),
(69, '電機工程學系', '2', NULL, NULL, NULL, 0),
(70, '應用化學學系', '2', NULL, NULL, NULL, 0),
(71, '地震與防災工程研究所', '2', NULL, NULL, NULL, 0),
(72, '應用材料及光電工程學系', '2', NULL, NULL, NULL, 0),
(73, '光電科技碩士學位學程', '2', NULL, NULL, NULL, 0),
(74, '教育學院', '2', NULL, NULL, NULL, 0),
(75, '國際文教與比較教育學系', '2', NULL, NULL, NULL, 0),
(76, '教育政策與行政學系', '2', NULL, NULL, NULL, 0),
(77, '諮商心理與人力資源發展學系', '2', NULL, NULL, NULL, 0),
(78, '課程教學與科技研究所', '2', NULL, NULL, NULL, 0),
(79, '終身學習與人力資源發展碩士學位學程', '2', NULL, NULL, NULL, 0),
(80, '心理健康與諮詢碩士學位學程在職專班', '2', NULL, NULL, NULL, 0),
(81, '師資培育中心', '2', NULL, NULL, NULL, 0),
(82, '師資培育中心教學組', '2', NULL, NULL, NULL, 0),
(83, '師資培育中心實習輔導組', '2', NULL, NULL, NULL, 0),
(84, '師資培育中心進修組', '2', NULL, NULL, NULL, 0),
(85, '師資培育中心行政組', '2', NULL, NULL, NULL, 0),
(86, '通識教育中心', '2', NULL, NULL, NULL, 0),
(87, '通識教育中心人文組', '2', NULL, NULL, NULL, 0),
(88, '通識教育中心體育組', '2', NULL, NULL, NULL, 0),
(89, '通識教育中心自然科學組', '2', NULL, NULL, NULL, 0),
(90, '通識教育中心社會科學組', '2', NULL, NULL, NULL, 0),
(91, '東南亞研究中心', '2', NULL, NULL, NULL, 0),
(92, '東南亞研究中心政研組', '2', NULL, NULL, NULL, 0),
(93, '東南亞研究中心經研組', '2', NULL, NULL, NULL, 0),
(94, '東南亞研究中心社研組', '2', NULL, NULL, NULL, 0),
(95, '東南亞研究中心行政組', '2', NULL, NULL, NULL, 0),
(96, '家庭教育研究中心', '2', NULL, NULL, NULL, 0),
(97, '家教中心資訊出版組', '2', NULL, NULL, NULL, 0),
(98, '家教中心進修推廣組', '2', NULL, NULL, NULL, 0),
(99, '家教中心諮詢輔導組', '2', NULL, NULL, NULL, 0),
(100, '家教中心研究發展組', '2', NULL, NULL, NULL, 0),
(101, '語文教學研究中心', '2', NULL, NULL, NULL, 0),
(102, '語文中心語文教學組', '2', NULL, NULL, NULL, 0),
(103, '語文中心外文教學組', '2', NULL, NULL, NULL, 0),
(104, '語文中心中文教學組', '2', NULL, NULL, NULL, 0),
(105, '原住民中心', '2', NULL, NULL, NULL, 0),
(106, '原住民中心文化組', '2', NULL, NULL, NULL, 0),
(107, '原住民中心教育組', '2', NULL, NULL, NULL, 0),
(108, '原民中心生計發展組', '2', NULL, NULL, NULL, 0),
(109, '前瞻性高科技研究中心', '2', NULL, NULL, NULL, 0),
(110, '校務研究中心', '2', NULL, NULL, NULL, 0),
(111, '校務研究中心資料組', '2', NULL, NULL, NULL, 0),
(112, '校務研究中心研究組', '2', NULL, NULL, NULL, 0),
(113, '水沙連人社中心', '2', NULL, NULL, NULL, 0),
(114, '水沙連人社中心綠活產業組', '2', NULL, NULL, NULL, 0),
(115, '水沙連人社中心環境保育組', '2', NULL, NULL, NULL, 0),
(116, '水沙連人社中心協力治理組', '2', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `property_found`
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
-- 資料表的匯出資料 `property_found`
--

INSERT INTO `property_found` (`ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `department_id`, `registrant_id`, `description`, `state`, `image`, `deleteHash`) VALUES
(15, 'RAY!!!', 2, 'Moli', '2017-12-19 00:07:24', '2017-03-31 18:00:00', '2017-03-31 00:00:00', NULL, NULL, '可以更改了', 0, NULL, ''),
(16, 'RAY PIG!!!', 4, 'Moli', '2017-12-19 00:09:56', '2017-03-31 18:00:00', '2017-04-01 00:00:00', NULL, NULL, '很笨', 0, NULL, ''),
(18, '測試', 8, '測試', '2017-12-25 17:11:39', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '測試', 0, 'https://i.imgur.com/r0FqevC.png', ''),
(19, '飲料', 8, '飲料', '2017-12-25 19:29:07', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '飲料好喝', 0, NULL, ''),
(20, 'ewr', 1, 'wer', '2017-12-25 19:30:31', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, 'eweee', 0, NULL, ''),
(22, '外套', 1, '停車場', '2017-12-25 19:35:12', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '黑色', 0, NULL, ''),
(23, '鉛筆', 5, '教室', '2017-12-26 02:04:15', '2017-03-31 10:00:00', '2017-03-31 16:00:00', NULL, NULL, '新的 haha~', 0, NULL, ''),
(24, '時間', 1, '時間', '2017-12-26 06:04:56', '2017-12-14 14:00:00', '2017-12-14 16:00:00', NULL, NULL, 'ISO8601', 0, NULL, ''),
(25, 'sdf', 2, 'sdf', '2017-12-26 06:05:38', '2017-12-13 01:00:00', '2017-12-13 01:00:00', NULL, NULL, '6666666666666666', 0, NULL, ''),
(27, '水壺', 8, '教室', '2017-12-26 08:41:13', '2017-12-26 08:00:00', '2017-12-26 09:00:00', NULL, NULL, 'asd', 0, NULL, ''),
(29, '手機', 5, '教室', '2017-12-27 00:49:21', '2017-12-27 16:00:00', '2017-12-27 17:00:00', NULL, NULL, 'iphone', 0, NULL, ''),
(30, '雨傘', 7, '教室', '2017-12-28 17:44:15', '2017-12-28 16:00:00', '2017-12-28 18:00:00', NULL, NULL, '黃色', 0, 'https://i.imgur.com/kuOTCw9.png', ''),
(31, '女友', 1, 'moli', '2017-12-28 18:48:20', '2017-12-28 16:00:00', '2017-12-28 17:00:00', NULL, NULL, 'cute', 0, 'https://i.imgur.com/6uayW1t.png', ''),
(32, '45', 1, '123', '2017-12-28 22:13:57', '2017-12-01 01:00:00', '2017-12-01 02:00:00', NULL, NULL, '123', 0, 'https://i.imgur.com/tWeR9AX.png', ''),
(33, '234', 1, '234', '2017-12-28 22:14:59', '2017-12-01 01:00:00', '2017-12-01 02:00:00', NULL, NULL, '123', 0, '', ''),
(34, 'QQQ', 2, 'QQQ', '2017-12-28 22:17:21', '2017-12-09 01:00:00', '2017-12-09 12:00:00', NULL, NULL, 'QQQ', 0, '', ''),
(35, '123', 2, '1231', '2017-12-28 22:21:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '123', 0, '123', '123'),
(36, '777', 1, '777', '2018-01-02 22:54:55', '2018-01-01 07:00:00', '2018-01-01 08:00:00', NULL, NULL, '777', 0, '123', 'qqq'),
(37, '777', 1, '777', '2018-01-02 22:56:56', '2018-01-01 07:00:00', '2018-01-01 08:00:00', NULL, NULL, '777', 0, 'https://i.imgur.com/HvjgeNf.png', '7i6J0NlpsrFbIhW'),
(38, 'Sam的很慢的筆電', 4, 'moli', '2018-01-02 22:59:10', '2018-01-02 23:00:00', '2018-01-02 22:00:00', NULL, NULL, '很慢!', 0, 'https://i.imgur.com/5C7SDc1.png', 'g5ZJpi4EaCudHpD'),
(39, 'final', 1, 'final', '2018-01-02 23:33:23', '2018-01-02 02:00:00', '2018-01-02 03:00:00', NULL, NULL, '123', 0, 'https://i.imgur.com/fFW5E1M.png', '7uTfIYIeEHFzzkP');

-- --------------------------------------------------------

--
-- 資料表結構 `property_lostwish`
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
-- 資料表的匯出資料 `property_lostwish`
--

INSERT INTO `property_lostwish` (`ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image`) VALUES
(1, 'tofind1', 5, '宿舍交誼廳', '2017-11-02 00:00:00', '2017-11-03 09:00:00', '2017-11-03 11:00:00', 1, '帽子一頂', 0, NULL),
(2, 'esfsdfsdf', 1, 'asdasdas', '0000-00-00 00:00:00', '2017-11-01 01:00:00', '2017-11-01 13:00:00', 6, 'sdsdfsdfsdf', 1, 'NULL'),
(3, 'qwwww', 5, 'www', '2017-11-02 00:00:00', '2017-11-02 09:00:00', '2017-11-02 13:00:00', 1, '測試', 2, NULL);

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
(3, '拾得人領回'),
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
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- 使用資料表 AUTO_INCREMENT `property_found`
--
ALTER TABLE `property_found`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用資料表 AUTO_INCREMENT `property_lostwish`
--
ALTER TABLE `property_lostwish`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `property_state`
--
ALTER TABLE `property_state`
  MODIFY `ID` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
