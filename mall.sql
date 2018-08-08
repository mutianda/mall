-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-08-08 08:13:17
-- 服务器版本： 10.1.34-MariaDB
-- PHP Version: 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mall`
--

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `ID` int(11) NOT NULL COMMENT '商品ID',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `price` int(11) NOT NULL COMMENT '商品价格',
  `pic` varchar(255) NOT NULL COMMENT '商品图片',
  `des` varchar(200) NOT NULL COMMENT '商品简介',
  `content` longtext NOT NULL COMMENT '商品详情',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `updata_time` int(11) NOT NULL COMMENT '修改时间',
  `view` int(11) NOT NULL COMMENT '浏览次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`ID`, `goodsname`, `price`, `pic`, `des`, `content`, `user_id`, `create_time`, `updata_time`, `view`) VALUES
(19, 'æ°´æ¯', 888, 'http://localhost:63342/mall/static/file/2018/0807/5b696f53f116e5620.jpg', 'æ°´æ¯ ï¼ˆåˆºèƒžåŠ¨ç‰©é—¨é’µæ°´æ¯çº²æµ®æ¸¸ç”Ÿç‰©ï¼‰', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	æ°´æ¯ï¼ˆè‹±æ–‡åç§°ï¼šJelly Fishï¼‰ï¼šæ˜¯æ°´ç”ŸçŽ¯å¢ƒä¸­é‡è¦çš„<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B5%AE%E6%B8%B8%E7%94%9F%E7%89%A9/3031572\">æµ®æ¸¸ç”Ÿç‰©</a>ï¼Œå±žäºŽåˆºä¸èƒžåŠ¨ç‰©é’µæ°´æ¯çº²ã€‚æ°´æ¯æ˜¯ä¸€ç§éžå¸¸æ¼‚äº®çš„æ°´ç”ŸåŠ¨ç‰©ã€‚å®ƒçš„èº«ä½“å¤–å½¢å°±åƒä¸€æŠŠé€æ˜Žä¼žï¼Œä¼žçŠ¶ä½“çš„ç›´å¾„æœ‰å¤§æœ‰å°ï¼Œå¤§æ°´æ¯çš„ä¼žçŠ¶ä½“ç›´å¾„å¯è¾¾2ç±³ã€‚ä¼žçŠ¶ä½“è¾¹ç¼˜é•¿æœ‰ä¸€äº›é¡»çŠ¶çš„è§¦æ‰‹ï¼Œæœ‰çš„è§¦æ‰‹å¯é•¿è¾¾20-30ç±³ã€‚\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	æ°´æ¯èº«ä½“çš„ä¸»è¦æˆåˆ†æ˜¯æ°´ï¼Œå¹¶ç”±å†…å¤–ä¸¤èƒšå±‚æ‰€ç»„æˆï¼Œä¸¤å±‚é—´æœ‰ä¸€ä¸ªå¾ˆåŽšçš„ä¸­èƒ¶å±‚ï¼Œä¸ä½†é€æ˜Žï¼Œè€Œä¸”æœ‰æ¼‚æµ®ä½œç”¨ã€‚å®ƒä»¬åœ¨è¿åŠ¨æ—¶ï¼Œåˆ©ç”¨ä½“å†…å–·æ°´åå°„å‰è¿›ï¼Œè¿œè¿œæœ›åŽ»ï¼Œå°±åƒä¸€é¡¶é¡¶åœ†ä¼žåœ¨æ°´ä¸­è¿…é€Ÿæ¼‚æ¸¸ï¼›æœ‰äº›æ°´æ¯çš„ä¼žçŠ¶ä½“è¿˜å¸¦æœ‰å„è‰²èŠ±çº¹ï¼Œåœ¨è“è‰²çš„æµ·æ´‹é‡Œï¼Œè¿™äº›æ¸¸åŠ¨ç€çš„è‰²å½©å„å¼‚çš„æ°´æ¯æ˜¾å¾—ååˆ†ç¾Žä¸½ã€‚\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	æ— è®ºæ˜¯çƒ­å¸¦çš„æ°´åŸŸï¹‘æ¸©å¸¦çš„æ°´åŸŸï¹‘æµ…æ°´åŒºï¹‘çº¦ç™¾ç±³æ·±çš„æµ·æ´‹ï¼Œç”šè‡³æ˜¯æ·¡æ°´åŒºéƒ½æœ‰å®ƒä»¬çš„å½±è¸ªã€‚æ°´æ¯æ—©åœ¨å…­äº¿äº”åƒä¸‡å¹´å‰å°±å­˜åœ¨äº†ï¼Œå®ƒä»¬çš„å‡ºçŽ°ç”šè‡³æ¯”æé¾™è¿˜æ—©ã€‚å…¨ä¸–ç•Œçš„æ°´åŸŸä¸­æœ‰è¶…è¿‡250ä½™ç§çš„æ°´æ¯ï¼Œå®ƒä»¬åˆ†å¸ƒäºŽå…¨çƒå„åœ°çš„æ°´åŸŸé‡Œã€‚å…¨éƒ¨ç”Ÿæ´»åœ¨æµ·æ´‹ä¸­ã€‚\r\n</div>', 12, 1533636435, 1533636435, 12),
(20, 'èŠèŠ±', 666, 'http://localhost:63342/mall/static/file/2018/0808/5b6a84b03f8ee9535.jpg', 'èŠèŠ± ï¼ˆèŠç§‘èŠå±žå®¿æ ¹è‰æœ¬æ¤ç‰©ï¼‰', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">èŠèŠ±ï¼ˆæ‹‰ä¸å­¦åï¼š<i>Dendranthema morifolium</i>ï¼ˆRamat. ï¼‰Tzvel.ï¼‰ï¼š</span>åœ¨æ¤ç‰©åˆ†ç±»å­¦ä¸­æ˜¯èŠç§‘ã€èŠå±žçš„å¤šå¹´ç”Ÿ<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AE%BF%E6%A0%B9\">å®¿æ ¹</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8D%89%E6%9C%AC%E6%A4%8D%E7%89%A9/719271\">è‰æœ¬æ¤ç‰©</a>ã€‚æŒ‰æ ½åŸ¹å½¢å¼åˆ†ä¸ºå¤šå¤´èŠã€ç‹¬æœ¬èŠã€å¤§ç«‹èŠã€æ‚¬å´–èŠã€è‰ºèŠã€æ¡ˆå¤´èŠç­‰æ ½åŸ¹ç±»åž‹ï¼›æœ‰æŒ‰èŠ±ç“£çš„å¤–è§‚å½¢æ€åˆ†ä¸ºå›­æŠ±ã€é€€æŠ±ã€åæŠ±ã€ä¹±æŠ±ã€éœ²å¿ƒæŠ±ã€é£žåˆæŠ±ç­‰æ ½åŸ¹ç±»åž‹ã€‚ä¸åŒç±»åž‹é‡Œçš„èŠèŠ±åˆå‘½åå„ç§å„æ ·çš„å“ç§åç§°ã€‚\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	èŠèŠ±æ˜¯<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E5%8D%81%E5%A4%A7%E5%90%8D%E8%8A%B1/4824898\">ä¸­å›½åå¤§åèŠ±</a>ä¹‹ä¸‰ï¼Œ<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E4%B8%AD%E5%9B%9B%E5%90%9B%E5%AD%90/2418308\">èŠ±ä¸­å››å›å­</a>ï¼ˆæ¢…å…°ç«¹èŠï¼‰ä¹‹ä¸€ï¼Œä¹Ÿæ˜¯ä¸–ç•Œ<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%9B%9B%E5%A4%A7%E5%88%87%E8%8A%B1\">å››å¤§åˆ‡èŠ±</a>ï¼ˆèŠèŠ±ã€æœˆå­£ã€åº·ä¹ƒé¦¨ã€å”è–è’²ï¼‰ä¹‹ä¸€ï¼Œäº§é‡å±…é¦–ã€‚å› èŠèŠ±å…·æœ‰æ¸…å¯’å‚²é›ªçš„å“æ ¼ï¼Œæ‰æœ‰<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%99%B6%E6%B8%8A%E6%98%8E/53944\">é™¶æ¸Šæ˜Ž</a>çš„â€œé‡‡èŠä¸œç¯±ä¸‹ï¼Œæ‚ ç„¶è§å—å±±â€çš„åå¥ã€‚ä¸­å›½äººæœ‰é‡é˜³èŠ‚èµèŠå’Œé¥®èŠèŠ±é…’çš„ä¹ ä¿—ã€‚å”Â·<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AD%9F%E6%B5%A9%E7%84%B6/28158\">å­Ÿæµ©ç„¶</a>ã€Š<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%BF%87%E6%95%85%E4%BA%BA%E5%BA%84/2800030\">è¿‡æ•…äººåº„</a>ã€‹ï¼šâ€œå¾…åˆ°é‡é˜³æ—¥ï¼Œè¿˜æ¥å°±èŠèŠ±ã€‚â€åœ¨å¤ç¥žè¯ä¼ è¯´ä¸­èŠèŠ±è¿˜è¢«èµ‹äºˆäº†å‰ç¥¥ã€é•¿å¯¿çš„å«ä¹‰ã€‚\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	èŠèŠ±æ˜¯ç»é•¿æœŸäººå·¥é€‰æ‹©åŸ¹è‚²çš„åè´µ<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A7%82%E8%B5%8F%E8%8A%B1%E5%8D%89/719368\">è§‚èµèŠ±å‰</a>ï¼Œå…¬å…ƒå…«ä¸–çºªå‰åŽï¼Œä½œä¸ºè§‚èµçš„èŠèŠ±ç”±ä¸­å›½ä¼ è‡³æ—¥æœ¬ã€‚17ä¸–çºªæœ«å¶è·å…°å•†äººå°†ä¸­å›½èŠèŠ±å¼•å…¥æ¬§æ´²ï¼Œ18ä¸–çºªä¼ å…¥æ³•å›½ï¼Œ19ä¸–çºªä¸­æœŸå¼•å…¥åŒ—ç¾Žã€‚æ­¤åŽä¸­å›½èŠèŠ±éåŠå…¨çƒã€‚\r\n</div>', 12, 1533707440, 1533707440, 0),
(21, 'éƒé‡‘é¦™', 777, 'http://localhost:63342/mall/static/file/2018/0808/5b6a88e3a67741963.jpg', 'éƒé‡‘é¦™ï¼ˆå­¦åï¼šTulipa gesneriana L. ï¼‰æ˜¯ç™¾åˆç§‘éƒé‡‘é¦™å±ž çš„å¤šå¹´ç”Ÿè‰æœ¬æ¤ç‰©ï¼Œå…·çƒèŒŽã€‚', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	éƒé‡‘é¦™ï¼ˆå­¦åï¼š<i>Tulipa gesneriana</i><span class=\"Apple-converted-space\">&nbsp;</span>L.<span class=\"sup--normal\" style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\"><span class=\"Apple-converted-space\">&nbsp;</span>[1]</span><a name=\"ref_[1]_6133937\"></a>&nbsp;<span class=\"Apple-converted-space\">&nbsp;</span>ï¼‰æ˜¯<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%99%BE%E5%90%88%E7%A7%91\">ç™¾åˆç§‘</a>éƒé‡‘é¦™å±ž<span class=\"sup--normal\" style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\"><span class=\"Apple-converted-space\">&nbsp;</span>[2]</span><a name=\"ref_[2]_6133937\"></a>&nbsp;<span class=\"Apple-converted-space\">&nbsp;</span>çš„å¤šå¹´ç”Ÿè‰æœ¬æ¤ç‰©ï¼Œå…·<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%90%83%E8%8C%8E/6733557\">çƒèŒŽ</a>ã€‚è‹±æ–‡åä¸ºâ€œGarden tulipâ€æˆ–â€œDidier\'s tulipâ€ã€‚<span class=\"sup--normal\" style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\"><span class=\"Apple-converted-space\">&nbsp;</span>[3]</span><a name=\"ref_[3]_6133937\"></a>&nbsp;<span class=\"Apple-converted-space\">&nbsp;</span>éƒé‡‘é¦™è¢«å¹¿æ³›è®¤ä¸ºåŽŸäº§äºŽ<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%9C%9F%E8%80%B3%E5%85%B6/198448\">åœŸè€³å…¶</a>ï¼Œ<span class=\"sup--normal\" style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\"><span class=\"Apple-converted-space\">&nbsp;</span>[4]</span><a name=\"ref_[4]_6133937\"></a>&nbsp;<span class=\"Apple-converted-space\">&nbsp;</span>æ˜¯åœŸè€³å…¶ã€<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8D%B7%E5%85%B0/190469\">è·å…°</a>ã€åŒˆç‰™åˆ©<span class=\"sup--normal\" style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\"><span class=\"Apple-converted-space\">&nbsp;</span>[5]</span><a name=\"ref_[5]_6133937\"></a>&nbsp;<span class=\"Apple-converted-space\">&nbsp;</span>ç­‰å›½çš„å›½èŠ±ã€‚\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, å®‹ä½“, sans-serif;background-color:#FFFFFF;\">\r\n	å¶3-5æžšï¼Œæ¡çŠ¶æŠ«é’ˆå½¢è‡³åµçŠ¶æŠ«é’ˆçŠ¶ï¼ŒèŠ±å•æœµé¡¶ç”Ÿï¼Œå¤§åž‹è€Œè‰³ä¸½ï¼Œ<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E8%A2%AB\">èŠ±è¢«</a>ç‰‡çº¢è‰²æˆ–æ‚æœ‰ç™½è‰²å’Œé»„è‰²ï¼Œæœ‰æ—¶ä¸ºç™½è‰²æˆ–é»„è‰²ï¼Œé•¿5-7åŽ˜ç±³ï¼Œå®½2-4åŽ˜ç±³ï¼Œ6æžšé›„è•Šç­‰é•¿ï¼ŒèŠ±ä¸æ— æ¯›ï¼Œæ— èŠ±æŸ±ï¼ŒæŸ±å¤´å¢žå¤§å‘ˆé¸¡å† çŠ¶ï¼ŒèŠ±æœŸ4-5æœˆã€‚<span class=\"sup--normal\" style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\"><span class=\"Apple-converted-space\">&nbsp;</span>[6]</span><a name=\"ref_[6]_6133937\"></a>&nbsp;\r\n</div>', 12, 1533708515, 1533708515, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `create_time` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`ID`, `username`, `password`, `create_time`) VALUES
(12, 'sss', '134194094dd3bca0ae96e54e7aa6b8bc', 1533193294),
(13, 'sss', '134194094dd3bca0ae96e54e7aa6b8bc', 1533193322),
(14, 'mutianda', '134194094dd3bca0ae96e54e7aa6b8bc', 1533193506);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID', AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
