-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2019 at 06:38 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `author` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  `love` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `cmtId` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `detailpicture1` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `detailpicture2` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `price`, `author`, `detail`, `picture`, `likes`, `amount`, `love`, `cid`, `active`, `cmtId`, `view`, `detailpicture1`, `detailpicture2`) VALUES
(1, 'Lập trình JAVA ', 58000, 'Trần Thị Ngân', '<p>Cuốn s&aacute;ch Java: Hướng dẫn cho người mới học &ndash; Lập tr&igrave;nh Java l&agrave; một trong hai tập s&aacute;ch về Java, với tựa gốc l&agrave; Java: A Beginer&rsquo;s Guide.<br />\r\n<br />\r\nHọc những nguy&ecirc;n l&yacute; căn bản về lập tr&igrave;nh hướng đối tượng trong Java từ chuy&ecirc;n gia nổi tiếng thế giới Herbert Schildt, t&aacute;c giả của những tựa s&aacute;ch lập tr&igrave;nh thuộc h&agrave;ng bestseller. Java: Hướng dẫn cho người mới học &ndash; Lập tr&igrave;nh Java l&agrave; tập sau của bộ s&aacute;ch gồm 2 tập về lập tr&igrave;nh Java ( Lập tr&igrave;nh hướng đối tượng v&agrave; lập tr&igrave;nh Java), được Trường Đại học FPT mua bản quyền chuyển ngữ sang tiếng Việt từ nh&agrave; xuất bản MCGraw-Hill danh tiếng. Sau c&aacute;c nội dung cơ sở về lập tr&igrave;nh hướng đối tượng ở cuốn Java: Hướng dẫn cho người mới học &ndash; Lập tr&igrave;nh hướng đối tượng, cuốn s&aacute;ch n&agrave;y tiếp tục hướng dẫn về c&aacute;c t&iacute;nh năng quan trọng v&agrave; những&nbsp;</p>\r\n', 'ltjava-3302333071525943-3302333072475702.jpg', 9, 20, 27, 3, 1, 1, 30, '', ''),
(3, 'Cảm Ơn Người Lớn (Bìa Mềm)', 93500, 'Nguyễn Nhật Ánh', '<h2><span style=\"font-size:16px\">- Một &aacute;ng văn l&atilde;ng mạn trong giọng h&agrave;i hước đặc biệt &ldquo;d&agrave;nh cho trẻ em, v&agrave; những ai từng l&agrave; trẻ em&rdquo;.</span></h2>\r\n\r\n<p>Bạn sẽ gặp lại M&ugrave;i, Tủn, T&iacute; s&uacute;n, Hải c&ograve;&hellip; của Cho t&ocirc;i xin một v&eacute; đi tuổi thơ, c&ugrave;ng chơi những tr&ograve; chơi quen thuộc, v&agrave; được đắm m&igrave;nh v&agrave;o những ước mơ đi&ecirc;n rồ, ngốc nghếch nhưng trong veo của tuổi mới lớn hồn nhi&ecirc;n v&agrave; đầy ắp dự định.</p>\r\n\r\n<p>V&agrave; cả khi họ đ&atilde; trưởng th&agrave;nh, bạo ch&uacute;a thời gian đ&atilde; v&ugrave;ng vẫy thế n&agrave;o trong cuộc đời của những nh&acirc;n vật m&agrave; bạn y&ecirc;u qu&yacute;&hellip;</p>\r\n\r\n<p>H&atilde;y bắt đầu đọc từ bất cứ trang n&agrave;o, c&oacute; thể đọc bất cứ l&uacute;c n&agrave;o, v&agrave; c&ugrave;ng với bất cứ ai. Bạn sẽ nhận được m&oacute;n qu&agrave; &ldquo;n trong 1&rdquo; của nh&agrave; văn Nguyễn Nhật &Aacute;nh: sẽ n lần thổn thức qua 1 cuốn s&aacute;ch 19 chương đầy ắp t&igrave;nh bạn ng&acirc;y thơ, t&igrave;nh x&oacute;m giềng tốt l&agrave;nh nh&acirc;n &aacute;i, t&igrave;nh y&ecirc;u đắm đuối ngọt ng&agrave;o&hellip;</p>\r\n\r\n<p>Cảm ơn người lớn được Nguyễn Nhật &Aacute;nh đặt b&uacute;t viết đ&uacute;ng sau 10 năm ra đời Cho t&ocirc;i xin một v&eacute; đi tuổi thơ &ndash; cuốn s&aacute;ch b&aacute;n chạy tới nay đ&atilde; 400.000 bản.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Tr&iacute;ch đoạn hay trong s&aacute;ch:</p>\r\n\r\n<p>&ldquo;T&ocirc;i viết cuốn s&aacute;ch n&agrave;y kh&ocirc;ng d&agrave;nh cho trẻ em.</p>\r\n\r\n<p>T&ocirc;i viết cho những ai từng l&agrave; trẻ em.&rdquo;</p>\r\n\r\n<p>(CHO T&Ocirc;I XIN MỘT V&Eacute; ĐI TUỔI THƠ)</p>\r\n\r\n<p>---o0o---</p>\r\n\r\n<p>So với trẻ con, người lớn lu&ocirc;n cảm thấy thiếu thốn v&agrave; lu&ocirc;n cảm thấy đau khổ. &ldquo;&Ocirc;i, đời t&ocirc;i sao khổ thế n&agrave;y!&rdquo; - đ&oacute; l&agrave; c&acirc;u người lớn hay than, từ người kh&ocirc;ng đủ tiền mua một tấm &aacute;o đến người thiếu một khoản tiền nhỏ để c&oacute; thể mua một ng&ocirc;i nh&agrave; lớn.</p>\r\n\r\n<p>Trẻ con kh&ocirc;ng bao giờ than như thế, v&igrave; bọn t&ocirc;i cả đời chỉ cần đủ tiền mua b&aacute;nh kẹo, c&agrave; rem, xi-r&ocirc;, ổi xo&agrave;i (tất nhi&ecirc;n cuộc đời trẻ con chỉ k&eacute;o d&agrave;i đến chừng n&agrave;o trở th&agrave;nh người lớn). Đang đ&oacute;i bụng m&agrave; c&oacute; tiền mua một ổ b&aacute;nh m&igrave; l&agrave; cuộc sống bọn t&ocirc;i lập tức biến th&agrave;nh m&agrave;u hồng d&ugrave; trước đ&oacute; n&oacute; được vẽ bằng gam m&agrave;u nhem nhuốc g&igrave; đi nữa.</p>\r\n\r\n<p>T&oacute;m lại, trẻ con chẳng c&oacute; mơ ước g&igrave; cao xa. Nhờ vậy bọn trẻ kh&ocirc;ng c&oacute; nhiều khổ n&atilde;o, thất vọng hay bất đắc ch&iacute; như người lớn. Người lớn cũng biết thế n&ecirc;n họ tự đặt ra c&aacute;c c&acirc;u danh ng&ocirc;n để tự răn m&igrave;nh. Lớn l&ecirc;n t&ocirc;i đọc được c&acirc;u &ldquo;tri t&uacute;c tiện t&uacute;c đ&atilde;i t&uacute;c h&agrave; thời t&uacute;c&rdquo; &ndash; &ldquo;biết đủ th&igrave; ắt thấy đủ, c&ograve;n đợi cho đủ sẽ chẳng bao giờ thấy đủ&rdquo;. C&acirc;u n&oacute;i rất hay (người lớn bao giờ cũng n&oacute;i hay) nhưng sau khi gật g&ugrave; khen hay, người lớn thường l&agrave;m ngược lại.</p>\r\n', 'conl-3302312778556254-3302312779354547.jpg', 3, 60, 20, 2, 1, 0, 18, '', ''),
(4, 'Lập Trình Web Bằng PHP 5.3 Và Cơ Sở Dữ Liệu MySQL 5.1 ', 64500, 'Phạm Hữu Khang (Chủ Biên', '<p><a href=\"http://bookbuy.vn/sach.html\">S&aacute;ch</a>&nbsp;gồm<strong>&nbsp;7 chương</strong>&nbsp;v&agrave; ứng dụng đ&iacute;nh k&egrave;m.</p>\r\n\r\n<p><strong>Chương 1</strong>&nbsp;cung cấp cho bạn kiến thức từ&nbsp;<strong>chức năng của Website</strong>,&nbsp;<strong>c&agrave;i đặt g&oacute;i WampServer 2.0&nbsp;</strong>v&agrave;&nbsp;<strong>cấu h&igrave;nh&nbsp;</strong>để c&oacute; thể vận h&agrave;nh ứng dụng Web bằng PHP, MySQL v&agrave; Apache Web Server.</p>\r\n\r\n<p><strong>Sang chương 2</strong>, bạn tiếp tục t&igrave;m hiểu c&aacute;ch<strong><a href=\"http://bookbuy.vn/pc/#!/?tt=lap-trinh-web&amp;ct=320&amp;ps=20&amp;or=IsNew&amp;ls=1&amp;p=1\">&nbsp;lập tr&igrave;nh&nbsp;Website</a>&nbsp;v&agrave; thiết kế cấu tr&uacute;c&nbsp;</strong>d&ugrave;ng cho doanh nghiệp bằng hệ quản trị nội dung m&atilde; nguồn mở Joomla. Nhằm thỏa m&atilde;n nội dung tr&igrave;nh b&agrave;y, bạn tiếp tục t&igrave;m hiểu c&aacute;ch thiết kế trang Web tĩnh hay động bằng m&atilde; tự sinh PHP với phần mềm Dreamweaver CS trong&nbsp;<strong>chương 3 v&agrave; thẻ HTML trong chương 4.</strong></p>\r\n\r\n<p>Tiếp theo, bạn c&oacute; thể t&igrave;m hiểu<strong>&nbsp;c&uacute; ph&aacute;p của kịch bản PHP&nbsp;</strong>trong&nbsp;<strong>chương 5</strong>&nbsp;v&agrave; học&nbsp;<strong>c&aacute;ch sử dụng ứng dụng PHPMyAdmin để quản trị cơ sở dữ liệu MySQL</strong>&nbsp;trong&nbsp;<strong>chương 6</strong>.<strong>&nbsp;Sang chương 7</strong>&nbsp;bạn t&igrave;m hiểu&nbsp;<strong>ph&aacute;t biểu SQL của cơ sở dữ liệu MySQL</strong>&nbsp;d&ugrave;ng để x&acirc;y dựng ứng dụng b&aacute;n h&agrave;ng trực tuyến.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; t&agrave;i liệu hữu &iacute;ch cho những ai muốn t&igrave;m hiểu về<a href=\"http://bookbuy.vn/pc/#!/?tt=tin-hoc&amp;ct=70&amp;ps=20&amp;or=IsNew&amp;ls=1&amp;p=1\">&nbsp;tin học</a>&nbsp;- c&ocirc;ng nghệ th&ocirc;ng tin.</p>\r\n', 'lyphp-3302284971604492-3302284972101985.jpg', 0, 50, 0, 12, 1, 0, 2, '', ''),
(5, 'Lập Trình Android', 76500, 'Ths Trương Thị Ngọc Phượng', '<p><strong>Cuốn&nbsp;<a href=\"http://bookbuy.vn/sach.html\">s&aacute;ch</a></strong>&nbsp;cung cấp cho người đọc<strong>&nbsp;những th&ocirc;ng tin chi tiết về nền tảng Android&nbsp;</strong>v&agrave; c&aacute;c kĩ năng lập tr&igrave;nh tr&ecirc;n nền tảng n&agrave;y. Cuốn s&aacute;ch thật sự rất ph&ugrave; hợp cho những ai y&ecirc;u th&iacute;ch<a href=\"http://bookbuy.vn/pc/#!/?tt=lap-trinh-phan-mem-ung-dung&amp;ct=319&amp;ps=20&amp;or=IsNew&amp;ls=1&amp;p=1\">&nbsp;lập tr&igrave;nh</a>, đặc biệt l&agrave; lập tr&igrave;nh cho c&aacute;c thiết bị di động v&agrave; c&oacute; mong muốn x&acirc;y dựng ứng dụng ri&ecirc;ng cho m&igrave;nh. To&agrave;n bộ nội dung s&aacute;ch được chia l&agrave;m<strong>&nbsp;4 phần</strong>, mỗi phần đều c&oacute; những v&iacute; dụ minh họa thực tế, gi&uacute;p cho người đọc, d&ugrave; chưa quen với lập tr&igrave;nh, vẫn c&oacute; thể tiếp cận t&igrave;m hiểu dễ d&agrave;ng.</p>\r\n\r\n<p><strong>Phấn 1:</strong>&nbsp;Tổng quan về hệ điều h&agrave;nh Android, cung cấp th&ocirc;ng tin chi tiết về kiến tr&uacute;c nền tảng, kiến tr&uacute;c bảo mật, nguy&ecirc;n l&iacute; hoạt động v&agrave; c&aacute;c thư viện hỗ trợ lập tr&igrave;nh trong hệ điều h&agrave;nh Android.</p>\r\n\r\n<p><strong>Phấn 2:</strong>&nbsp;Cấu tr&uacute;c v&agrave; c&aacute;c th&agrave;nh phần cơ bản của một ứng dụng Android, cung cấp th&ocirc;ng tin về cấu tr&uacute;c tổng quan v&agrave; c&aacute;c th&agrave;nh phần cơ bản m&agrave; bất k&igrave; ứng dụng Android n&agrave;o cũng phải c&oacute;. Ngo&agrave;i ra, phần n&agrave;y c&ograve;n cung cấp kiến thức về thiết kế giao diện cho c&aacute;c ứng dụng Android. C&oacute; thể n&oacute;i, đ&acirc;y l&agrave; phấn cốt l&otilde;i của một ứng dụng Android cơ bản. Hiểu được ch&uacute;ng, bạn ho&agrave;n to&agrave;n c&oacute; thể x&acirc;y dựng được một ứng dụng với những chức năng đơn giản cũng như phức tạp theo mong muốn.</p>\r\n\r\n<p><strong>Phấn 3:</strong>&nbsp;Một số loại đối tượng điều khiển d&ugrave;ng trong thiết kế giao diện ứng dụng, giới thiệu chi tiết c&aacute;c th&agrave;nh phần m&agrave; bạn c&oacute; thể sử dụng để ho&agrave;n thiện hơn giao diện cũng như t&iacute;nh năng cho ứng dụng của m&igrave;nh.</p>\r\n\r\n<p><strong>Phần 4:</strong>&nbsp;Trao đổi v&agrave; lưu trữ th&ocirc;ng tin giữa c&aacute;c ứng dụng Android, giới thiệu c&aacute;ch thức để trao đổi th&ocirc;ng tin qua lại giữa c&aacute;c th&agrave;nh phần trong ứng dụng v&agrave; trao đổi th&ocirc;ng tin qua lại giữa c&aacute;c ứng dụng trong c&ugrave;ng hệ thống hoặc kh&aacute;c hệ thống. Từ đ&acirc;y, bạn c&oacute; thể tạo ra được những ứng dụng c&oacute; lưu trữ khối lượng th&ocirc;ng tin lớn như: từ điển, danh bạ, v.v&hellip; hoặc chia sẻ dữ liệu với c&aacute;c ứng dụng tr&ecirc;n thiết bị Android kh&aacute;c.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'ltandroid-3302257984567473-3302257985175473.jpg', 0, 15, 4, 3, 1, 0, 10, '', ''),
(6, 'Tớ Học Lập Trình', 67000, 'Louie Stowell   Rosie Dickins   Jonathan Melmoth', '<h2><span style=\"font-size:14px\">Cẩm nang hướng dẫn ho&agrave;n chỉnh v&agrave; đơn giản nhất d&agrave;nh cho bạn trẻ bắt đầu học lập tr&igrave;nh</span></h2>\r\n\r\n<p>Ng&ocirc;n ngữ lập tr&igrave;nh Scratch đặc biệt ph&ugrave; hợp cho bạn trẻ mới học, v&igrave; t&iacute;nh tương t&aacute;c trực quan, đồ họa sống động, ra sản phẩm liền tay m&agrave; vẫn đảm bảo khoa học v&agrave; li&ecirc;n th&ocirc;ng tri thức sau n&agrave;y.</p>\r\n\r\n<p>Chỉ cần nắm v&agrave; k&eacute;o c&aacute;c khối lệnh đầy m&agrave;u sắc c&oacute; sẵn để lắp gh&eacute;p th&agrave;nh một kịch bản điều khiển c&aacute;c đối tượng tr&ecirc;n m&agrave;n h&igrave;nh.</p>\r\n\r\n<p>Kh&ocirc;ng c&oacute; những d&ograve;ng lệnh logic kh&ocirc; cứng v&agrave; dễ lỗi, những kh&aacute;i niệm kỹ thuật kh&oacute; hiểu, những quy tắc luật lệ chằng chịt v&agrave; mệt mỏi trong c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh kiểu người lớn.</p>\r\n', 'thlt-3302226149145536-3302226152261908.jpg', 0, 23, 0, 11, 1, 0, 1, '', ''),
(7, 'Sách Giáo Khoa Toán Lớp 5', 107000, 'Bộ Giáo dục và Đào tạo', '', 'toan-3301891775724469-3301891778395401.jpg', 0, 100, 0, 5, 1, 0, 1, '', ''),
(8, 'Giáo Dục An Toàn Giao Thông Lớp 3', 10000, 'Đỗ Thành Trung   Nguyễn Nguyệt Hồng', '<p>Bộ&nbsp;<a href=\"http://bookbuy.vn/sach.html\">s&aacute;ch</a>&nbsp;<strong>Gi&aacute;o Dục An To&agrave;n Giao Th&ocirc;ng&nbsp;</strong>được bi&ecirc;n soạn nhằm g&oacute;p phần n&acirc;ng cao &yacute; thức, học tập về an to&agrave;n giao th&ocirc;ng. Bộ s&aacute;ch gồm 5 cuốn, từ lớp 1 đến lớp 5, mỗi cuốn được bi&ecirc;n soạn theo chủ đề với nội dung ph&ugrave; hợp với từng lứa tuổi học sinh. Mỗi chủ đề, b&agrave;i học đều c&oacute; h&igrave;nh ảnh ti&ecirc;u biểu để c&aacute;c em học sinh nh&igrave;n nhận, đ&aacute;nh gi&aacute;, mục đ&iacute;ch để c&aacute;c em tự nhận thức. Dưới mỗi h&igrave;nh ảnh l&agrave; c&acirc;u hỏi trắc nghiệm để học sinh trả lời. Sau những h&igrave;nh ảnh trực quan, học sinh t&igrave;m hiểu trả lời l&agrave; phần ghi nhớ, ở phần n&agrave;y c&aacute;c em củng cố lại kiến thức cơ bản về trật tự, an to&agrave;n giao th&ocirc;ng v&agrave; học sinh c&oacute; thể kiểm tra xem c&acirc;u trả lời của m&igrave;nh l&agrave; đ&uacute;ng hay sai. Từ đ&oacute; học sinh c&oacute; thể r&uacute;t ra được b&agrave;i học về an to&agrave;n v&agrave; kh&ocirc;ng an to&agrave;n.</p>\r\n\r\n<p>Với nội dung v&agrave; cấu tr&uacute;c như tr&ecirc;n, gi&aacute;o vi&ecirc;n&nbsp;<a href=\"http://bookbuy.vn/sach/sach-giao-khoa-cap-1\">Tiểu học</a>&nbsp;v&agrave; c&aacute;c bậc phụ huynh cũng c&oacute; thể sử dụng t&agrave;i liệu n&agrave;y để gi&aacute;o dục &yacute; thức tham giao th&ocirc;ng an to&agrave;n cho con em m&igrave;nh.</p>\r\n', 'gdatgt-3301864896484310-3301864896964737.jpg', 0, 15, 0, 5, 1, 0, 2, '', ''),
(9, 'Đề Thi Trắc Nghiệm Tiếng Anh Cho Học Sinh Trung Học Cơ Sở', 38000, 'Tuấn Anh', '<div class=\"des-des\" style=\"-webkit-text-stroke-width:0px; padding-left:10px; padding-top:15px; text-align:start\">\r\n<p style=\"margin-left:0px; margin-right:0px\"><span style=\"font-size:12px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#333333\"><span style=\"background-color:#ffffff\"><span style=\"font-size:small\"><span style=\"font-family:arial,helvetica,sans-serif\">Bao g&ocirc;̀m 25 đ&ecirc;̀ thi, m&ocirc;̃i đ&ecirc;̀ thi g&ocirc;̀m nhi&ecirc;̀u dạng bài khác nhau, t&ocirc;̉ng hợp t&acirc;́t cà các bài hi&ecirc;̣n tượng ngữ pháp trong chương trình học, giúp học sinh rèn luy&ecirc;̣n ngữ pháp,củng c&ocirc;́ từ vựng và khả năng tư duy.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0px; margin-right:0px\"><span style=\"font-size:12px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#333333\"><span style=\"background-color:#ffffff\"><span style=\"font-size:small\"><span style=\"font-family:arial,helvetica,sans-serif\">Các đ&ecirc;̀ thi được trình bày rõ ràng, d&ecirc;̃ hi&ecirc;̉u, hợp lý giúp học sinh có th&ecirc;̉ tự học và thực hành các bài t&acirc;̣p v&ecirc;̀ ngữ pháp và luy&ecirc;̣n vi&ecirc;́t Ti&ecirc;́ng anh có hi&ecirc;̣u quả.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0px; margin-right:0px\"><span style=\"font-size:12px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#333333\"><span style=\"background-color:#ffffff\"><strong><span style=\"font-size:small\"><span style=\"font-family:arial,helvetica,sans-serif\">Mời bạn đón đọc.</span></span></strong></span></span></span></span></p>\r\n</div>\r\n\r\n<div class=\"cl\" style=\"-webkit-text-stroke-width:0px; text-align:start\">&nbsp;</div>\r\n\r\n<p>&nbsp;</p>\r\n', 'dttn-3301841292100569-3301841292605742.jpg', 7, 25, 5, 6, 1, 0, 1, '', ''),
(10, 'Một Số Quy Định Hướng Dẫn Thi Hành Luật Đất Đai - Tập 1: Cấp Giấy Chứng Nhận Quyền Sử Dụng Đất Và Bồi Thường, Hỗ Trợ, Tái Định Cư Khi Nhà Nước Thu Hồi Đất', 45500, 'Tuấn Anh', '<p>&nbsp;Nhằm tạo điều kiện thuận lợi cho đ&ocirc;ng đảo bạn đọc t&igrave;m hiểu một c&aacute;ch c&oacute; hệ thồng c&aacute;c quy định về bồi thường, hỗ trợ, t&aacute;i định cư khi Nh&agrave; nước thu hồi đất v&agrave; cấp Giấy chứng nhận quyền sử dụng đất, Nh&agrave; xuất bản Tư ph&aacute;p xuấn bản cuốn s&aacute;ch&nbsp;<strong>&quot;Một số quy định hướng dẫn thi h&agrave;nh Luật Đất đai - Tập 1: Cấp Giấy chứng nhận quyền sử dụng đất v&agrave; bồi thường, hỗ trợ, t&aacute;i định cư khi Nh&agrave; nước thu hồi đất&quot;.</strong><br />\r\n<strong>Nội dung cuốn s&aacute;ch gồm hai phần:</strong><br />\r\n<br />\r\n<strong>Phần I</strong>: C&aacute;c quy định ph&aacute;p luật về bồi thường, hỗ trợ v&agrave; t&aacute;i định cư khi Nh&agrave; nước thu hồi đất.</p>\r\n\r\n<p><strong>Phần II</strong>: C&aacute;c quy định ph&aacute;p luật về cấp Giấy chứng nhận quyền sử dụng đất</p>\r\n', 'quydinhdat-3301815212046416-3301815212800336.jpg', 0, 25, 0, 8, 1, 0, 0, '', ''),
(11, 'Cố Định Một Đám Mây', 82000, 'Nguyễn Ngọc Tư', '<h2><em>&ldquo;<strong>Cố định một đ&aacute;m m&acirc;y</strong>&rdquo;</em>&nbsp;l&agrave; tập&nbsp;<a href=\"https://bookbuy.vn/sach/vhvn-truyen-ngan\">truyện ngắn</a>&nbsp;với 10 truyện mới, d&agrave;y hơn 180 trang.</h2>\r\n\r\n<p>Nh&agrave; văn đưa độc giả bước v&agrave;o một kh&ocirc;ng gian mới trong chuyến viễn h&agrave;nh văn chương &acirc;m thầm nhưng đầy dấu ấn c&aacute; nh&acirc;n.</p>\r\n\r\n<p>Ở đ&oacute;, độc giả sẽ nhận ra Nguyễn Ngọc Tư kh&ocirc;ng c&ograve;n ở lại trong v&ugrave;ng quan s&aacute;t thực tế quen thuộc đ&atilde; l&agrave;m n&ecirc;n sự ổn định của một phong c&aacute;ch văn chương v&agrave; đồng thời &ldquo;đ&oacute;ng đinh&rdquo; một c&aacute;i t&ecirc;n trong l&ograve;ng người đọc, m&agrave; đặt m&igrave;nh v&agrave;o một cuộc ra đi th&uacute; vị v&agrave; kh&ocirc;ng k&eacute;m thử th&aacute;ch.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ở đ&oacute;, nh&agrave; văn cho thấy những nỗ lực (hay tự tr&agrave;o?) trong việc &ldquo;<strong>cố định đ&aacute;m m&acirc;y</strong>&rdquo; thực tại đầy xao l&atilde;ng tr&ecirc;n trang viết.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nh&acirc;n vật của chị trong tập truyện n&agrave;y c&oacute; thể l&agrave; người đ&agrave;n b&agrave; chơi vơi tr&ecirc;n b&atilde;i biển, đợi tin của người chồng đột ngột &ldquo;lặn&rdquo; mất. L&agrave; cư d&acirc;n ngay một b&igrave;a Nước Mặn n&agrave;o đ&oacute;, đang n&iacute;u k&eacute;o trong v&ocirc; vọng một chốn sinh tồn, hay những con người đang lần t&igrave;m sợi d&acirc;y t&igrave;nh cảm mất dấu. Cũng c&oacute; thể l&agrave; chuyện một g&aacute;nh h&aacute;t kh&ocirc;ng ngủ với những cuộc đời b&eacute; mọn tựa v&agrave;o nhau, rồi nhận ra sự tan r&atilde;, tan biến trong thế giới được r&agrave;ng buộc bởi những &acirc;n t&igrave;nh mong manh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&ocirc;i khi, chỉ l&agrave; một t&igrave;nh tiết ngỡ như nh&acirc;n vật phụ tưởng chỉ tho&aacute;ng qua nhưng rồi dẫn ta đi m&atilde;i tr&ecirc;n trang viết, như chuyến lạc nẻo t&iacute;t m&ugrave; mấy mươi năm của kẻ đuổi t&igrave;m &ocirc;ng Sơn Đ&ocirc;ng m&atilde;i v&otilde; mua thuốc ghẻ hay những &yacute; tưởng &ldquo;k&yacute; qu&aacute;i&rdquo; để ph&aacute; vỡ nhịp đời đơn điệu của hai anh l&iacute;nh tr&ecirc;n đảo đ&atilde; đưa đẩy mọi thứ đến một cảnh huống nghi&ecirc;m trọng kh&aacute;c&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Những t&igrave;nh huống đời sống ngẫu nhi&ecirc;n tạo ra những bước chuyển domino đầy bất ngờ tr&ecirc;n trang văn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tập truyện được viết với một văn phong đi&ecirc;u luyện, đủ dửng dưng v&agrave; lạnh l&ugrave;ng để tạo ra sự thử th&aacute;ch v&agrave; quyến rũ, g&acirc;y cho&aacute;ng ngợp cho người đọc.</p>\r\n', 'cdum-3301798328222153-3301798328936819.jpg', 0, 10, 0, 13, 1, 0, 0, '', ''),
(12, 'Học Thế Nào Bây Giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II', 118000, 'André Giordan', '', 'htn-3301776121005601-3301776121681441.jpg', 0, 5, 0, 6, 1, 0, 0, '', ''),
(13, 'Có Người Sực Tỉnh Cơn Mơ (Phiên Bản Mùa Lễ Hội) - Thơ Nguyễn Thiên Ngân', 79000, 'Nguyễn Thiên Ngân', '<h2><span style=\"color:null\"><span style=\"font-size:11px\"><em>C&oacute; người sực tỉnh cơn mơ</em></span></span></h2>\r\n\r\n<p><span style=\"color:null\"><span style=\"font-size:11px\"><em>Nằm tr&ocirc;ng&nbsp;b&oacute;ng tối,</em></span></span></p>\r\n\r\n<p><span style=\"color:null\"><span style=\"font-size:11px\"><em>Im chờ ban mai.</em></span></span></p>\r\n\r\n<p><span style=\"color:null\">Tập thơ thứ 4 v&agrave; t&aacute;c phẩm thứ 12 của t&aacute;c giả&nbsp;<em><strong>Nguyễn Thi&ecirc;n Ng&acirc;n</strong></em>, l&agrave; những nốt thăng trầm rất ch&acirc;n thật trong t&igrave;nh y&ecirc;u v&agrave; trong ch&iacute;nh cuộc sống của t&aacute;c giả. Sau những mất m&aacute;t v&agrave; tổn thương, điều c&ograve;n lại, vẫn lu&ocirc;n l&agrave; sự trưởng th&agrave;nh, v&agrave; niềm hy vọng.&nbsp;</span></p>\r\n\r\n<p><span style=\"color:null\">B&igrave;a in bằng giấy mỹ thuật, k&eacute;o lụa thủ c&ocirc;ng c&aacute;c chi tiết, &eacute;p kim tựa s&aacute;ch. Phục Hưng Books v&agrave; t&aacute;c giả Nguyễn Thi&ecirc;n Ng&acirc;n mong muốn tạo ra một m&oacute;n qu&agrave; tinh tế để bạn đọc trao nhau nh&acirc;n m&ugrave;a lễ hội.&nbsp;<br />\r\nTặng k&egrave;m mỗi quyển s&aacute;ch một postcard c&oacute; thơ viết tay của Nguyễn Thi&ecirc;n Ng&acirc;n.</span></p>\r\n\r\n<p><br />\r\n<span style=\"color:null\">Tranh minh hoạ b&igrave;a v&agrave; tranh tr&ecirc;n postcard l&agrave; của hoạ sỹ Eric Nguyễn.</span></p>\r\n\r\n<p><span style=\"color:null\">2 c&acirc;u thơ tr&ecirc;n postcard:<br />\r\n&ldquo;Đ&atilde; liều đổi hết kh&ocirc;n may<br />\r\nĐể về khờ dại trong v&ograve;ng tay nhau&rdquo;.<br />\r\n&ldquo;C&aacute;ch người xiết khẽ b&agrave;n tay<br />\r\nRu ta ngu&ocirc;i bớt th&aacute;ng ng&agrave;y b&atilde;o gi&ocirc;ng&rdquo;.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><span style=\"color:null\">Em thương mến,</span></p>\r\n\r\n<p><span style=\"color:null\">Kh&ocirc;ng c&oacute; g&igrave; để vội.</span></p>\r\n\r\n<p><span style=\"color:null\">L&aacute; vẫn xanh thanh thản h&aacute;t tr&ecirc;n c&agrave;nh</span></p>\r\n\r\n<p><span style=\"color:null\">C&oacute; những l&uacute;c ta chỉ cần phải đợi</span></p>\r\n\r\n<p><span style=\"color:null\">Kẻo vội v&agrave;ng, đ&ocirc;i l&uacute;c h&oacute;a mong manh.</span></p>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><span style=\"color:null\">Ở sai chỗ, với sai người,</span></p>\r\n\r\n<p><span style=\"color:null\">C&oacute; cố gắng mấy cũng th&agrave;nh sai.</span></p>\r\n\r\n<p><span style=\"color:null\">Chọn đ&uacute;ng nơi, chọn đ&uacute;ng người,</span></p>\r\n\r\n<p><span style=\"color:null\">Chỉ cần l&agrave;-m&igrave;nh th&ocirc;i đ&atilde; đ&uacute;ng.</span></p>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><span style=\"color:null\">Xin ch&agrave;o c&acirc;y b&aacute;ch c&ocirc; đơn</span></p>\r\n\r\n<p><span style=\"color:null\">H&igrave;nh như m&igrave;nh c&oacute; nỗi buồn giống nhau.</span></p>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><span style=\"color:null\">BIỆT CA</span></p>\r\n\r\n<p><span style=\"color:null\">Mỗi nắng xuống l&agrave; một lần chia biệt</span></p>\r\n\r\n<p><span style=\"color:null\">Mỗi mai l&ecirc;n lại một cuộc bắt đầu</span></p>\r\n\r\n<p><span style=\"color:null\">Đời lu&acirc;n chuyển, ta l&agrave;m g&igrave; kh&aacute;c được</span></p>\r\n\r\n<p><span style=\"color:null\">Chẳng thể n&agrave;o dừng m&atilde;i để chờ nhau.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:null\">N&uacute;i xưa đ&atilde; bạc đầu năm th&aacute;ng đợi</span></p>\r\n\r\n<p><span style=\"color:null\">L&ograve;ng s&ocirc;ng kia cũng h&eacute;o cạn mong chờ</span></p>\r\n\r\n<p><span style=\"color:null\">Người ngỡ sẽ c&oacute; đường trong tử địa</span></p>\r\n\r\n<p><span style=\"color:null\">Bỗng một ng&agrave;y gục ng&atilde; dưới d&ograve;ng mưa.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:null\">V&ograve;ng tay b&eacute; th&ocirc;i xiết gh&igrave; hy vọng</span></p>\r\n\r\n<p><span style=\"color:null\">Quả tim run kh&ocirc;ng đựng nổi b&atilde;o b&ugrave;ng</span></p>\r\n\r\n<p><span style=\"color:null\">Th&ocirc;i bu&ocirc;ng hết nghe gi&oacute; luồn tay rỗng</span></p>\r\n\r\n<p><span style=\"color:null\">Một bước l&ugrave;i,</span></p>\r\n\r\n<p><span style=\"color:null\">L&agrave; trời biển bao dung.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:null\">Người sẽ lại trở về năm th&aacute;ng cũ</span></p>\r\n\r\n<p><span style=\"color:null\">Sống y&ecirc;n vui, trang đời mới kh&ocirc;ng ngờ</span></p>\r\n\r\n<p><span style=\"color:null\">Bước quả cảm như chưa từng vỡ vụn</span></p>\r\n\r\n<p><span style=\"color:null\">Mắt dịu d&agrave;ng khi nhớ chuyện h&ocirc;m xưa.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:null\">Mỗi nắng xuống l&agrave; một lần chia biệt</span></p>\r\n\r\n<p><span style=\"color:null\">Mỗi mai l&ecirc;n lại một cuộc bắt đầu</span></p>\r\n\r\n<p><span style=\"color:null\">Người sẽ bước một m&igrave;nh qua b&oacute;ng tối</span></p>\r\n\r\n<p><span style=\"color:null\">Dưới trời n&agrave;y,</span></p>\r\n\r\n<p><span style=\"color:null\">Sao s&aacute;ng cũng v&igrave; nhau.</span></p>\r\n</blockquote>\r\n', 'cnst-4074702558900241-4074702559496721.jpg', 0, 12, 1, 2, 1, 0, 4, 'stum-4074702559975441-4074702560345787.jpg', ''),
(14, 'Quốc Văn Giáo Khoa Thư - Lớp Sơ Đẳng', 25500, 'Nguyễn Văn Ngọc   Trần Trọng Kim   Đặng Đình Phúc   Đỗ Thận', '<h2><strong>&nbsp;</strong>Xu&acirc;n đi học coi người hớn hở,<br />\r\nGặp cậu Thu đi ở giữa đ&agrave;ng,<br />\r\nHỏi rằng: &ldquo;Sao đ&atilde; vội v&agrave;ng,<br />\r\nTrống chưa nghe đ&aacute;nh,<br />\r\nđến tr&agrave;ng l&agrave;m chi?<br />\r\nTh&ocirc;i, h&atilde;y hượm, đừng đi, anh ạ.<br />\r\nN&agrave;y con khăng t&ocirc;i đ&atilde; sẵn rồi.<br />\r\nC&ugrave;ng nhau ta h&atilde;y đ&aacute;nh chơi.<br />\r\nL&aacute;t rồi ta sẽ tới nơi cũng vừa.&rdquo;<br />\r\nThu đ&aacute;p lại: &ldquo;Dẫu giờ c&ograve;n sớm,<br />\r\nCũng n&ecirc;n đi, kẻo chậm l&agrave;m sao?<br />\r\nNếu chờ khi đ&aacute;nh trống v&agrave;o,<br />\r\nDẫu ta rảo bước, t&agrave;i n&agrave;o kịp cho.<br />\r\nTrễ giờ ta phải n&ecirc;n lo.&rdquo;<br />\r\n(Đi học phải đ&uacute;ng giờ, Quốc Văn Gi&aacute;o Khoa Thư, lớp Sơ đẳng)</h2>\r\n\r\n<p>Quốc Văn Gi&aacute;o Khoa Thư từ l&acirc;u đ&atilde; được coi l&agrave; bộ s&aacute;ch gi&aacute;o khoa Tiếng Việt đầu ti&ecirc;n của Việt Nam. Bộ s&aacute;ch do Nha học ch&iacute;nh Đ&ocirc;ng Ph&aacute;p xuất bản v&agrave;o khoảng những năm 20, đầu thế kỉ 20, với sự tham gia của c&aacute;c soạn giả t&ecirc;n tuổi, đều tốt nghiệp trường Th&ocirc;ng ng&ocirc;n: Trần Trọng Kim, Nguyễn Văn Ngọc, Đặng Đ&igrave;nh Ph&uacute;c v&agrave; Đỗ Thận. Ra đời với mục đ&iacute;ch dạy chữ quốc ngữ cho học sinh cấp Sơ học yếu lược (tương đương với ba năm đầu tiểu học ng&agrave;y nay) từ Bắc v&agrave;o Nam, bộ s&aacute;ch gồm ba quyển:<br />\r\n- Quyển d&agrave;nh cho lớp Năm (&ETH;ồng ấu - Cours Enfantin): 34 b&agrave;i đầu dạy trẻ c&aacute;c chữ c&aacute;i v&agrave; đ&aacute;nh vần, 55 b&agrave;i sau l&agrave; c&aacute;c b&agrave;i tập đọc.<br />\r\n- Quyển d&agrave;nh cho lớp Tư (Dự bị - Cours Pr&eacute;paratoire) gồm 120 b&agrave;i tập đọc.<br />\r\n- Quyển d&agrave;nh cho lớp Ba (Sơ đẳng - Cours El&eacute;mentaire) gồm 84 b&agrave;i tập đọc.<br />\r\nC&aacute;c b&agrave;i tập đọc lu&ocirc;n lồng gh&eacute;p nội dung về lu&acirc;n l&iacute;, lịch sử, địa l&iacute;, vệ sinh, tự nhi&ecirc;n&hellip; k&egrave;m theo phần giải th&iacute;ch từ ngữ, b&agrave;i tập v&agrave; tập viết. Mỗi b&agrave;i đều c&oacute; h&igrave;nh minh họa, theo lối tranh khắc gỗ hồn nhi&ecirc;n, ch&acirc;n phương m&agrave; c&oacute; t&agrave;i liệu cho l&agrave; của họa sĩ Nam Sơn Nguyễn Văn Thọ.<br />\r\nGần một thế kỉ đ&atilde; tr&ocirc;i qua, nhưng những b&agrave;i học trong Quốc Văn Gi&aacute;o Khoa Thư vẫn c&ograve;n nguy&ecirc;n gi&aacute; trị, đọng lại rất nhiều ấn tượng v&agrave; t&igrave;nh cảm đẹp trong l&ograve;ng người học nhờ t&iacute;nh gi&aacute;o dục v&agrave; sư phạm cao, ng&ocirc;n ngữ ngắn gọn, dễ hiểu, gần gũi với t&acirc;m l&iacute; trẻ em. Một số b&agrave;i tập đọc vẫn được d&ugrave;ng l&agrave;m ngữ liệu cho một số s&aacute;ch gi&aacute;o khoa v&agrave; t&agrave;i liệu gi&aacute;o dục sau n&agrave;y.<br />\r\nTrong lần t&aacute;i bản n&agrave;y, ch&uacute;ng t&ocirc;i chủ yếu dựa v&agrave;o bản in năm 1935, kể cả phần học vần v&agrave; tập viết của quyển d&agrave;nh cho lớp Đồng ấu m&agrave; một số bản in kh&aacute;c đ&atilde; lược bỏ. Một số b&agrave;i c&oacute; nội dung kh&ocirc;ng c&ograve;n ph&ugrave; hợp, ch&uacute;ng t&ocirc;i xin ph&eacute;p lược bỏ. Với phần tranh minh họa, ch&uacute;ng t&ocirc;i đồ lại v&agrave; l&agrave;m cho r&otilde; n&eacute;t hơn. Những c&aacute;ch viết theo kiểu cũ đều được chữa cho ph&ugrave; hợp với c&aacute;ch viết của tiếng Việt hiện tại, chẳng hạn, kh&ocirc;ng d&ugrave;ng dấu gạch nối giữa c&aacute;c từ gh&eacute;p; những lỗi in sai, nhầm lẫn đều được chỉnh sửa. Những ch&uacute; th&iacute;ch của bi&ecirc;n tập vi&ecirc;n được để trong ngoặc vu&ocirc;ng để ph&acirc;n biệt với ch&uacute; th&iacute;ch của t&aacute;c giả.&nbsp;Về c&aacute;c địa danh nhắc đến trong s&aacute;ch, ch&uacute;ng t&ocirc;i để nguy&ecirc;n theo c&aacute;ch gọi cũ.<br />\r\nXin tr&acirc;n trọng giới thiệu c&ugrave;ng bạn đọc!<br />\r\nNh&agrave; xuất bản Kim Đồng</p>\r\n', 'quocvan-3301617376209332-3301617376769546.jpg', 2, 12, 4, 8, 1, 0, 7, '', ''),
(15, 'Thám Tử Lừng Danh Conan ', 18000, 'Aoyama Gosho', '', 'conan-4074599579361886-4074599580883378.jpg', 3, 25, 8, 14, 1, 0, 21, 'sauconan-4074599581935965-4074599582250418.jpg', ''),
(16, 'Shin - Cậu Bé Bút Chì - Truyện Dài - Tập 8 (Tái Bản 2019)', 20000, 'Yoshito Usui - Takata Mirei', '<h2>Với t&agrave;i năng kể chuyện hấp dẫn, t&aacute;c giả đ&atilde; biến c&aacute;c trang s&aacute;ch của m&igrave;nh th&agrave;nh những s&acirc;n chơi ngập tr&agrave;n tiếng cười của những c&ocirc; b&eacute;, cậu b&eacute; hồn nhi&ecirc;n v&agrave; một thế giới tuổi thơ đa sắc m&agrave;u. Những b&agrave;i học gi&aacute;o dục nhẹ nh&agrave;ng, thấm th&iacute;a cũng được lồng gh&eacute;p một c&aacute;ch kh&eacute;o l&eacute;o trong từng t&igrave;nh huống truyện. C&oacute; thể Shin l&agrave; một cậu b&eacute; c&aacute; t&iacute;nh, hiếu động. C&oacute; thể những tr&ograve; tinh nghịch của Shin đ&ocirc;i khi qu&aacute; trớn, chẳng chừa một ai. Nhưng sau những &quot;sự cố&quot; do Shin g&acirc;y ra, người lớn thấy m&igrave;nh cần &quot;quan t&acirc;m&quot; đến trẻ con nhiều hơn nữa, c&aacute;c bạn đọc nhỏ tuổi chắc hẳn cũng được dịp nh&igrave;n nhận lại bản th&acirc;n, để ph&acirc;n biệt điều tốt điều xấu trong cuộc sống.</h2>\r\n', 'shine-3301464817007011-3301464833155484.jpg', 5, 100, 12, 14, 1, 0, 16, '', ''),
(20, 'Đắc nhân tâm', 98000, 'Dale Carnegie', '<p>Đắc Nh&acirc;n T&acirc;m (B&igrave;a Cứng)</p>\r\n\r\n<p>Đắc Nh&acirc;n T&acirc;m - Được l&ograve;ng người, l&agrave; cuốn s&aacute;ch đưa ra c&aacute;c lời khuy&ecirc;n về c&aacute;ch thức cư xử, ứng xử v&agrave; giao tiếp với mọi người để đạt được th&agrave;nh c&ocirc;ng trong cuộc sống. Gần 80 năm kể từ khi ra đời, Đắc Nh&acirc;n T&acirc;m l&agrave; cuốn s&aacute;ch gối đầu giường của nhiều thế hệ lu&ocirc;n muốn ho&agrave;n thiện ch&iacute;nh m&igrave;nh để vươn tới một cuộc sống tốt đẹp v&agrave; th&agrave;nh c&ocirc;ng.</p>\r\n\r\n<p>Đắc Nh&acirc;n T&acirc;m&nbsp;cụ thể v&agrave; chi tiết với những chỉ dẫn để dẫn đạo người, để g&acirc;y thiện cảm v&agrave; dẫn dắt người kh&aacute;c,... những hướng dẫn ấy, qua thời gian, c&oacute; thể kh&ocirc;ng c&ograve;n th&iacute;ch hợp trong cuộc sống hiện đại nhưng nếu người đọc c&oacute; thể cảm v&agrave; hiểu được những th&ocirc;ng điệp t&aacute;c giả muốn truyền đạt th&igrave; việc &aacute;p dụng n&oacute; v&agrave;o cuộc sống trở n&ecirc;n dễ d&agrave;ng v&agrave; hiệu quả.</p>\r\n\r\n<p>Đắc Nh&acirc;n T&acirc;m, từ một cuốn s&aacute;ch, h&ocirc;m nay đ&atilde; trở th&agrave;nh một danh từ để chỉ một lối sống m&agrave; ở đ&oacute; con người ta cư xử linh hoạt v&agrave; thấu t&igrave;nh đạt l&yacute;. L&yacute; thuyết mu&ocirc;n thuở vẫn l&agrave; những quy tắc chết, nhưng Nh&acirc;n T&acirc;m l&agrave; sống, l&agrave; biến đổi. Bạn h&atilde;y thử đọc &quot;Đắc Nh&acirc;n t&acirc;m&quot; v&agrave; tự m&igrave;nh chi&ecirc;m nghiệm những c&aacute;i đang diễn ra trong đời thực hiện hữu, chắc chắn bạn sẽ c&oacute; những b&agrave;i học cho ri&ecirc;ng m&igrave;nh.</p>\r\n\r\n<p>Đắc Nh&acirc;n T&acirc;m l&agrave; nghệ thuật thu phục l&ograve;ng người, l&agrave; l&agrave;m cho tất cả mọi người y&ecirc;u mến m&igrave;nh. &quot;Đắc nh&acirc;n t&acirc;m&quot; v&agrave; c&aacute;i T&agrave;i trong mỗi người ch&uacute;ng ta. &quot;Đắc Nh&acirc;n T&acirc;m&quot; trong &yacute; nghĩa đ&oacute; cần được thụ đắc bằng sự hiểu r&otilde; bản th&acirc;n, th&agrave;nh thật với ch&iacute;nh m&igrave;nh, hiểu biết v&agrave; quan t&acirc;m đến những người xung quanh để nh&igrave;n ra v&agrave; khơi gợi những tiềm năng ẩn khuất nơi họ, gi&uacute;p họ ph&aacute;t triển l&ecirc;n một tầm cao mới. Đ&acirc;y ch&iacute;nh l&agrave; nghệ thuật cao nhất về con người v&agrave; ch&iacute;nh l&agrave; &yacute; nghĩa s&acirc;u sắc nhất đ&uacute;c kết từ những nguy&ecirc;n tắc v&agrave;ng của Dale Carnegie.S&aacute;ch đ&atilde; được chuyển ngữ sang hầu hết c&aacute;c thứ tiếng tr&ecirc;n thế giới v&agrave; c&oacute; mặt ở h&agrave;ng trăm quốc gia. Đ&acirc;y l&agrave; cuốn s&aacute;ch li&ecirc;n tục đứng đầu danh mục s&aacute;ch b&aacute;n chạy nhất do thời b&aacute;o NewYork Times b&igrave;nh chọn suốt 10 năm liền.</p>\r\n', 'dacnhantam-4074905811550800-4074905812007333.jpg', 1, 100, 1, 13, 1, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `pro_id`, `quantity`, `order_id`) VALUES
(2, 15, 1, 4),
(3, 16, 1, 5),
(4, 15, 1, 5),
(7, 20, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE `cat` (
  `cid` int(11) NOT NULL,
  `cname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `scid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat`
--

INSERT INTO `cat` (`cid`, `cname`, `scid`) VALUES
(1, 'Sách giáo khoa', 0),
(2, 'Truyện tranh', 0),
(3, 'Sách lập trình', 0),
(5, 'Sách tiểu học', 1),
(6, 'Sách trung học cơ sở', 1),
(7, 'Sách trung học phổ thông', 1),
(8, 'Giáo trình đại học', 0),
(9, 'Sách Ngữ văn', 6),
(10, 'Sách Toán', 7),
(11, 'Lập trình Java', 3),
(12, 'Lập trình PHP', 3),
(13, 'Truyện tiểu thuyết', 2),
(14, 'Truyện tranh Manga, comic', 2),
(15, 'Ngữ văn 12', 9);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `cmtId` int(11) NOT NULL,
  `cmt_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`cmtId`, `cmt_name`, `id`, `content`, `email`) VALUES
(1, 'admin', 1, 'bài test cho chức năng cmt', 'ngan@gmail.com'),
(2, 'bfedwd', 5, 'fewgwegwe', 'ngan12091998t3@gmail.com'),
(3, 'k', 16, 'kkkkkkk', 'ngan12091998t3@gmail.com'),
(4, 'ngân', 16, 'Test chức năng comment', 'ngan12091998t3@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `active`) VALUES
(1, 'admin', 'ngan12@gmail.com', '0397303999', 'Phạm NHư Xương, Đà Nẵng', 'Test', 'Test contact', 1),
(2, 'Trần Thị Ngân', 'ngan12091998t3@gmail.com', '0397303999', 'K157/24 Pham Như Xương', 'Test', 'Test contact', 1),
(5, 'Trần Thị Ngân', 'ngan12091998t3@gmail.com', '0397303999', 'K157/24 Pham Như Xương', 'Video', 'Video phần contact', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `payments` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `checked` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `name`, `phone`, `address`, `payments`, `status`, `date`, `paid`, `checked`) VALUES
(4, 'Vinaenter', '0999745432', 'K157/24 Pham Như Xương', 'Giao hàng tại nhà', '', '2019-06-01 01:18:04', '0', '0'),
(5, 'Trần Thị Ngân', '0397303999', 'K157/24 Pham Như Xương', 'Giao hàng tại nhà', '', '2019-06-01 01:18:45', '0', '0'),
(9, 'fffff', '0999745432', 'K157/24 Pham Như Xương', 'Paypal', '', '2019-06-01 04:35:25', '0', '0'),
(10, 'ffff', '0999745432', 'K157/24 Pham Như Xương', 'Paypal', '', '2019-06-01 04:42:13', '0', '0'),
(11, 'Trần Thị Ngân', '0397303999', 'K157/24 Pham Như Xương', 'Paypal', '', '2019-06-04 16:09:12', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `payId` int(11) NOT NULL,
  `payName` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`payId`, `payName`) VALUES
(1, 'Thanh toán trực tiếp'),
(2, 'Paypal');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleId` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleId`, `name`) VALUES
(1, 'ADMIN'),
(2, 'EDITOR'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE `sex` (
  `sId` int(11) NOT NULL,
  `sname` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`sId`, `sname`) VALUES
(1, 'Nam'),
(2, 'Nữ'),
(3, 'LGBT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` datetime NOT NULL,
  `sId` int(11) NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `avatar` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `birthday`, `sId`, `password`, `roleId`, `active`, `avatar`) VALUES
(1, 'admin', 'Trần Thị Ngân', 'ngan12@gmail.com', '1998-09-12 00:00:00', 2, '$2a$10$5MUFCohon6oe2LSLYSkM4eJUgLEen3satUnlljtfSM7ewJMHxfwXy', 1, 1, 'images-4075041642332312-4075041643132739.jpg'),
(2, 'User', 'Trần A', 'aspring@gmail.com', '1998-09-12 00:00:00', 1, '$2a$10$FpUs6K8Y.2bTmBoSNALjMeEJg9W68nGofae.p8AhNxhDdrrbkbRUK', 3, 1, 'avme-2185905153229161-2185905157332413.jpg'),
(4, 'ngantran', 'Trần Thị Ngân', 'ngan12091998t3@gmail.com', '1998-09-12 00:00:00', 2, '$2a$10$rqdQiHrh95GFdkeZtDSo2unjLFs43aEIkol0KQT1iIR8KNeJeWdx2', 2, 1, 'FILE-20170128-2130R1GBA1L34M4H-2261500715183481-2261500716028281.jpg'),
(5, 'vinaenter', 'VinaEnter Edu', 'vinaenteredu@gmail.com', '2017-05-14 00:00:00', 1, '$2a$10$tVFkLwvCmOMllObwVJL27OP40IFoXGXI.38Jq6fjtgq19ZfTvAtlW', 2, 1, 'avtsm-4075015720775799-4075015721554465.png'),
(6, 'mod', 'Mod', 'spring@gmail.com', '2001-02-01 00:00:00', 2, '$2a$10$.UKKI.YtS5kRIy1yDtfNeOgJJf7y.D5Dj.NptHYGVvZ8XBBwNsmIW', 2, 1, 'images (1)-4076175822204662-4076175822778529.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cmtId`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`payId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cat`
--
ALTER TABLE `cat`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `cmtId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `payId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `sId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
