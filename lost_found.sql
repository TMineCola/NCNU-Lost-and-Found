-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 18, 2018 at 09:20 AM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

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
-- Table structure for table `classification`
--

CREATE TABLE `classification` (
  `ID` tinyint(4) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf32 COLLATE utf32_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classification`
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
-- Table structure for table `department`
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
-- Dumping data for table `department`
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
-- Table structure for table `property_found`
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

--
-- Dumping data for table `property_found`
--

INSERT INTO `property_found` (`ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `department_id`, `registrant_id`, `description`, `state`, `image`, `deleteHash`) VALUES
(3, '自我文章測試 修改', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, 1526756964111456, '看圖', 2, 'https://i.imgur.com/8yBKvTF.jpg', 'E5lL3QFm387nw1I'),
(4, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, 1526756964111456, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(5, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, 10208434226493678, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(6, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-01-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, 10208434226493678, '看圖', 3, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(7, '李禹叡', 1, '管257', '2018-06-28T13:22:20.416+08:00', '2018-06-14T08:00:00.000+08:00', '2018-06-14T12:00:00.000+08:00', NULL, 10208434226493678, '王俊傑', 0, 'https://i.imgur.com/yuLJrdw.jpg', 'rb04ETuRtPCGgw8'),
(8, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, 10208434226493678, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(9, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, 10208434226493678, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(10, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(11, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-01-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 3, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(12, '李禹叡', 1, '管257', '2018-06-28T13:22:20.416+08:00', '2018-06-14T08:00:00.000+08:00', '2018-06-14T12:00:00.000+08:00', NULL, NULL, '王俊傑', 0, 'https://i.imgur.com/yuLJrdw.jpg', 'rb04ETuRtPCGgw8'),
(13, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(14, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(15, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(16, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-01-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 3, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(17, '李禹叡', 1, '管257', '2018-06-28T13:22:20.416+08:00', '2018-06-14T08:00:00.000+08:00', '2018-06-14T12:00:00.000+08:00', NULL, NULL, '王俊傑', 0, 'https://i.imgur.com/yuLJrdw.jpg', 'rb04ETuRtPCGgw8'),
(18, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(19, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(20, '123', 5, '管237', '2018-01-28T11:39:02.316+08:00', '2018-06-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 1, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(21, '123', 5, '管237', '2018-06-28T11:39:02.316+08:00', '2018-01-28T16:00:00.000+08:00', '2018-06-28T18:00:00.000+08:00', NULL, NULL, '看圖', 3, 'https://i.imgur.com/l9mEGAH.png', '9m4mEnATA7uMAUG'),
(22, '李禹叡', 1, '管257', '2018-06-28T13:22:20.416+08:00', '2018-06-14T08:00:00.000+08:00', '2018-06-14T12:00:00.000+08:00', NULL, NULL, '王俊傑', 0, 'https://i.imgur.com/yuLJrdw.jpg', 'rb04ETuRtPCGgw8'),
(23, '最終測試 慢3G found', 2, 'moli', '2018-06-28T15:00:11.990+08:00', '2018-06-28T22:00:00.000+08:00', '2018-06-28T23:00:00.000+08:00', NULL, NULL, 'test', 0, 'https://i.imgur.com/DCoLzTj.jpg', 'GpV56PT3y6Y99vz'),
(24, 'hk4g4', 1, 'ewsd', '2018-06-28T15:55:27.111+08:00', '2018-06-28T22:00:00.000+08:00', '2018-06-28T23:00:00.000+08:00', NULL, NULL, 'fuck', 0, 'https://i.imgur.com/OVD7W6t.jpg', 'P9A7u6DhaeAFyrs'),
(25, 'Mike Sam', 1, 'MOLi', '2018-06-29T00:08:38.316+08:00', '2018-06-29T12:00:00.000+08:00', '2018-06-29T14:00:00.000+08:00', NULL, 1223101501168152, '123', 0, 'https://i.imgur.com/xE6dlhq.jpg', 'xVwBgnidI86pLwN'),
(27, 'ewerwr', 1, 'www', '2018-07-02T12:28:01.467+08:00', '2018-07-02T20:00:00.000+08:00', '2018-07-02T21:00:00.000+08:00', NULL, 1526756964111456, 'qqq', 5, 'https://i.imgur.com/KcnLtgm.jpg', '3X6mssrm3JsrSUm'),
(28, '測試 slow 3G', 2, '測試', '2018-07-02T13:26:30.276+08:00', '2018-07-02T21:00:00.000+08:00', '2018-07-02T22:00:00.000+08:00', NULL, 1526756964111456, '長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長長度最好87長', 2, 'https://i.imgur.com/Nwk6iDU.jpg', 'bu5jl3Cixvdb8HM');

-- --------------------------------------------------------

--
-- Table structure for table `property_lostwish`
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

--
-- Dumping data for table `property_lostwish`
--

INSERT INTO `property_lostwish` (`ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image`, `deleteHash`) VALUES
(13, '123', 7, '管237', '2018-06-28T11:38:26.825+08:00', '2018-06-28T14:00:00.000+08:00', '2018-06-28T16:00:00.000+08:00', NULL, '看圖', 2, 'https://i.imgur.com/N914CAS.png', 'MPIlKpc4EvVl9yS'),
(14, '123', 1, '管241', '2018-06-28T13:21:22.031+08:00', '2018-06-28T14:00:00.000+08:00', '2018-06-28T16:00:00.000+08:00', NULL, '123', 0, 'https://i.imgur.com/dFk5jOw.png', '3UgciF2rrVYIOWz'),
(15, '操 圖片能夠壓縮', 1, 'moli', '2018-06-28T14:45:38.541+08:00', '2018-06-28T21:00:00.000+08:00', '2018-06-28T22:00:00.000+08:00', NULL, '狗', 0, 'https://i.imgur.com/6kupOPf.jpg', '4VAHeHCs9WLdl1E'),
(16, '最終測試 慢3G Lost', 2, 'moli', '2018-06-28T14:59:01.847+08:00', '2018-06-28T02:00:00.000+08:00', '2018-06-28T03:00:00.000+08:00', NULL, 'test', 0, 'https://i.imgur.com/rqx02ai.jpg', 'vLsnN64qwUSgMct'),
(17, '王俊傑', 2, 'moli', '2018-06-28T23:54:36.899+08:00', '2018-06-28T12:00:00.000+08:00', '2018-06-28T14:00:00.000+08:00', 10208434226493678, '123', 0, 'https://i.imgur.com/877MDIl.jpg', 'EVcWgjpPv5QSh0H'),
(18, '幹 還出bug阿', 2, 'Sam家', '2018-07-02T10:34:52.044+08:00', '2018-07-02T18:00:00.000+08:00', '2018-07-02T19:00:00.000+08:00', 1526756964111456, '還不修好你', 0, 'https://i.imgur.com/FyfeTWX.jpg', 'WonPdrMIVSG2FJN'),
(19, '沒壓縮呢！', 2, '桃南路', '2018-07-02T18:49:20.214+08:00', '2018-07-02T12:00:00.000+08:00', '2018-07-02T13:00:00.000+08:00', 10208434226493678, '測試', 0, 'https://i.imgur.com/jAfchPp.jpg', '5oNGUyoRxBNOpAu'),
(20, '測試3G', 1, '洮南', '2018-07-02T18:50:11.477+08:00', '2018-07-02T12:00:00.000+08:00', '2018-07-02T14:00:00.000+08:00', 10208434226493678, '測試', 0, 'https://i.imgur.com/Kek6guy.jpg', 'e2rZjnHpnid1IH2'),
(21, '新壓縮測試', 3, '測試', '2018-07-02T10:51:14.620+08:00', '2018-07-02T02:00:00.000+08:00', '2018-07-02T03:00:00.000+08:00', 1526756964111456, '測試', 0, 'https://i.imgur.com/0HNspaS.jpg', '5DTgRZi0nU8Ei5r'),
(22, '帶入參數 不唬爛', 1, 'Sam家', '2018-07-02T10:58:03.317+08:00', '2018-07-02T18:00:00.000+08:00', '2018-07-02T19:00:00.000+08:00', 1526756964111456, '修正壓縮不夠', 0, 'https://i.imgur.com/rac84EA.jpg', 'fL2epOAa5mpiBws'),
(23, '這次真的不唬爛 壓縮催下去', 1, '山姆家', '2018-07-02T11:07:07.635+08:00', '2018-07-02T19:00:00.000+08:00', '2018-07-02T20:00:00.000+08:00', 1526756964111456, 'QQ', 0, 'https://i.imgur.com/cd4HJlA.jpg', 'to51LS1C2OqifTp'),
(24, '禹叡說乾話', 9, '不懂', '2018-07-02T19:10:32.493+08:00', '2018-07-02T19:00:00.000+08:00', '2018-07-02T20:00:00.000+08:00', 10208434226493678, '明明就髒', 0, 'https://i.imgur.com/chnQawV.jpg', 'UeA8S6NWnuals1F'),
(25, '禹叡又說幹話', 9, '神奇豆豆', '2018-07-02T19:11:34.623+08:00', '2018-07-02T19:00:00.000+08:00', '2018-07-02T20:00:00.000+08:00', 10208434226493678, '見證正常速度', 0, 'https://i.imgur.com/dZxJvCS.jpg', '3CDAbMpUWuQi3NH'),
(26, 'dddd', 1, 'dddd', '2018-07-02T12:24:42.182+08:00', '2018-07-02T19:00:00.000+08:00', '2018-07-02T19:00:00.000+08:00', 1526756964111456, 'wer', 0, 'https://i.imgur.com/KKfLjXA.jpg', 'DdJYNzRUAy4EaDp'),
(27, '壓到800', 1, '家裡', '2018-07-02T12:30:01.881+08:00', '2018-07-02T20:00:00.000+08:00', '2018-07-02T21:00:00.000+08:00', 1526756964111456, 'QQ', 0, 'https://i.imgur.com/MuyUIto.jpg', '6RIpaPLBcMkp2Ma');

-- --------------------------------------------------------

--
-- Table structure for table `property_state`
--

CREATE TABLE `property_state` (
  `ID` tinyint(2) UNSIGNED NOT NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property_state`
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
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 NOT NULL,
  `departmentID` tinyint(4) DEFAULT NULL,
  `registered_time` varchar(32) CHARACTER SET utf8 NOT NULL,
  `isManager` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`ID`, `email`, `password`, `departmentID`, `registered_time`, `isManager`) VALUES
(1, 'test', '6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d2392593af6a84118090', NULL, '2017-11-25 22:41:42', 0),
(23, 'wang.minecola@gmail.com', '6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d2392593af6a84118090', NULL, '2018-07-03T20:49:53.048+08:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`) VALUES
('10208434226493678', 'Mike Sam', 'samson9565@gmail.com'),
('1223101501168152', 'Wang Jiun-Jie', 'wang.minecola@gmail.com'),
('1526756964111456', '李禹叡', 'felicity332@hotmail.com');

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
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classification`
--
ALTER TABLE `classification`
  MODIFY `ID` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `property_found`
--
ALTER TABLE `property_found`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `property_lostwish`
--
ALTER TABLE `property_lostwish`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `property_state`
--
ALTER TABLE `property_state`
  MODIFY `ID` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
