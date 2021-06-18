-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 08, 2017 lúc 08:45 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phoneshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Điện Thoại', '2017-04-07 04:14:04', '2017-04-07 04:14:04'),
(2, 'Tablet', '2017-04-07 08:27:26', '2017-04-07 08:27:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_04_045147_Create_Categories_Table', 1),
(4, '2017_04_04_045247_Create_Trademarks_Table', 1),
(5, '2017_04_04_045332_Create_Products_Table', 1),
(6, '2017_04_04_050229_Create_Product_Images_Table', 1),
(7, '2017_04_04_050512_Create_Orders_Table', 1),
(8, '2017_04_04_050730_Create_Order_Details_Table', 1),
(9, '2017_04_04_050958_Update_User_Table', 1),
(10, '2017_04_04_051127_Create_News_Table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_date` datetime NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `purchase_date`, `total_price`, `detail`, `status`, `user_id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, '2017-04-09 17:05:39', '54270000.00', 'Không Có', 1, 4, 'member2', 'member2@gmail.com', '01213638036', 'Hội An Quảng Nam', '2017-04-09 10:05:39', '2017-04-12 05:50:26'),
(2, '2017-04-09 17:07:34', '24998000.00', NULL, 1, 0, 'Võ Đông', 'vovandong.online@gmail.com', '0975425847', 'Hội An', '2017-04-09 10:07:34', '2017-04-09 11:17:14'),
(3, '2017-04-09 17:10:51', '75494000.00', NULL, 2, 0, 'Đông Võ', 'vovandong@gmail.com', '01213638036', 'Hội An', '2017-04-09 10:10:51', '2017-04-09 11:18:01'),
(4, '2017-04-12 21:23:29', '86730000.00', NULL, 2, 0, 'văn đông', 'vovandong.online@gmail.com', '01213638036', 'Hội An', '2017-04-12 14:23:29', '2017-04-13 11:15:10'),
(5, '2017-04-13 19:30:12', '89492000.00', NULL, 1, 0, 'don hang moi', 'vovandong.online@gmail.com', '01213638036', 'hội an', '2017-04-13 12:30:12', '2017-04-13 12:30:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `quantity`, `price`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, '18690000.00', 1, 6, '2017-04-09 10:05:39', '2017-04-09 10:05:39'),
(2, 2, '17790000.00', 1, 5, '2017-04-09 10:05:40', '2017-04-09 10:05:40'),
(3, 1, '9999000.00', 2, 2, '2017-04-09 10:07:34', '2017-04-09 10:07:34'),
(4, 1, '14999000.00', 2, 3, '2017-04-09 10:07:34', '2017-04-09 10:07:34'),
(5, 1, '9999000.00', 3, 2, '2017-04-09 10:10:51', '2017-04-09 10:10:51'),
(6, 3, '14999000.00', 3, 3, '2017-04-09 10:10:51', '2017-04-09 10:10:51'),
(7, 1, '13999000.00', 3, 4, '2017-04-09 10:10:51', '2017-04-09 10:10:51'),
(8, 3, '21590000.00', 4, 7, '2017-04-12 14:23:29', '2017-04-12 14:23:29'),
(9, 4, '3990000.00', 4, 16, '2017-04-12 14:23:29', '2017-04-12 14:23:29'),
(10, 4, '1500000.00', 4, 19, '2017-04-12 14:23:29', '2017-04-12 14:23:29'),
(11, 8, '10999000.00', 5, 21, '2017-04-13 12:30:12', '2017-04-13 12:30:12'),
(12, 1, '1500000.00', 5, 19, '2017-04-13 12:30:12', '2017-04-13 12:30:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchases` int(11) NOT NULL,
  `hightlights` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_sale` decimal(10,2) NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trademark_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `detail`, `purchases`, `hightlights`, `quantity`, `price`, `price_sale`, `color`, `images`, `trademark_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 5s 16GB', '<p>Thông số cơ bản Màn hình : 4 inch (640 x 1136 pixels ) Camera : Chính : 8 MP, Phụ 1.2 MP Bộ nhớ trong : 16 GB Hệ điều hành : iOS 9 Chipset : Apple A7 CPU : Dual-core 1.3Ghz GPU : PowerVR G6430 Kích thước : 123.8 x 58.6 x 7.6 mm Màn hình Công nghệ màn hình : IPS LCD Màu màn hình : 16 Triệu màu Chuẩn màn hình : DVGA Độ phân giải màn hình : 640 x 1136 pixels Kích thước màn hình : 4.0 inch Công nghệ cảm ứng : Cảm ứng điện dung, đa điểm Chụp hình &amp; Quay phim Camera sau : 8.0 MP Camera trước : 1.2 MP Đèn Flash : có Tính năng camera : Đèn Led Flash kép Tự động lấy nét, chạm lấy nét Nhận diện khuôn mặt, nụ cười Chống rung Quay Phim : Quay phim FullHD 1080p@30fps Video Call : Có Cấu hình phần cứng Tốc độ CPU : Dual-core 1.3Ghz Số nhân : 2 Nhân Chipset : Apple A7 RAM : 1GB Chip đồ họa (GPU) : PowerVR G6430 Cảm biến : Gia tốc - Con quay hồi chuyển - Tiệm cận - La bàn Bộ nhớ &amp; Lưu trữ Danh bạ lưu trữ : Không giới hạn Bộ nhớ trong : 16 GB Thẻ nhớ ngoài : Không Hỗ trợ thẻ nhớ tối đa : Không Thiết kế &amp; Trọng lượng Kiểu dáng : Thanh (thẳng) + Cảm ứng Kích thước : 123.8 x 58.6 x 7.6 mm Trọng lượng : 112 g Thông tin pin Loại pin : Li-Ion Dung lượng pin : 1560 mAh Pin có thể tháo rời : Không Thời gian chờ : Up to 250 h (2G) / Up to 250 h (3G) Thời gian đàm thoại : Up to 10 h (2G) / Up to 10 h (3G) Kết nối &amp; Cổng giao tiếp Băng tần 2G : GSM 850 / 900 / 1800 / 1900 Băng tần 3G : HSDPA 850 / 900 / 1700 / 1900 / 2100, LTE Băng tần 4G : Có Hỗ trợ SIM : Nano-SIM Khe cắm sim : 1 Sim Wifi : Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot GPS : Có, hỗ trợ A-GPS và GLONASS Bluetooth : Có, v4.0 with A2DP GPRS/EDGE : Có NFC : Không Kết nối USB : Có, microUSB v2.0 Cổng kết nối khác : Không Cổng sạc : iPhone Jack (Input &amp; Output) : 3.5 mm Giải trí &amp; Ứng dụng Xem phim : MP4, WMV, H.263, H.264(MPEG4-AVC) Nghe nhạc : MP3, WAV, WMA, eAAC+ Ghi âm : Có FM radio : Không Chức năng khác : Mạng xã hội ảo Dịch vụ lưu trữ đám mây iCloud Mở khoá bằng dấu vân tay Micro chuyên dụng chống ồn Chỉnh sửa hình ảnh, video</p>', 0, 1, 12, '6499000.00', '0.00', 'White', '635869123783238651_iphone-5s-5.jpg', 1, 1, '2017-04-07 05:08:02', '2017-04-12 14:08:54'),
(2, 'iPhone 6 32GB (2017)', 'Thông số cơ bản\r\nMàn hình :	4.7 inch (1334 x 750 pixels)\r\nCamera :	Chính: 8.0 MP, Phụ: 1.2 MP\r\nRAM :	1 GB\r\nBộ nhớ trong :	32 GB\r\nChipset :	Apple A8\r\nGPU :	PowerVR GX6450\r\nKích thước :	138.1 x 67 x 6.9 mm\r\nMàn hình\r\nCông nghệ màn hình :	LED IPS\r\nChuẩn màn hình :	HD\r\nMàu màn hình :	16 Triệu màu\r\nĐộ phân giải màn hình :	1334 x 750 pixels\r\nKích thước màn hình :	4.7 inch\r\nCông nghệ cảm ứng :	Cảm ứng đa điểm\r\nMặt kính màn hình :	Kính oleophobic (ion cường lực)\r\nChụp hình & Quay phim\r\nCamera sau :	8.0 MP\r\nCamera trước :	1.2 MP\r\nĐèn Flash :	Có\r\nTính năng camera :	Tự động lấy nét, chạm lấy nét Nhận diện khuôn mặt, nụ cười\r\nQuay Phim :	Có\r\nVideo Call :	Có\r\nCấu hình phần cứng\r\nTốc độ CPU :	1.4 GHz\r\nSố nhân :	2 Nhân\r\nChipset :	Apple A8\r\nRAM :	1GB\r\nChip đồ họa (GPU) :	PowerVR GX6450\r\nBộ nhớ & Lưu trữ\r\nDanh bạ lưu trữ :	Không giới hạn\r\nBộ nhớ trong :	32 GB\r\nThẻ nhớ ngoài :	Không\r\nHỗ trợ thẻ nhớ tối đa :	Không\r\nThiết kế & Trọng lượng\r\nKiểu dáng :	Thanh (thẳng) + Cảm ứng\r\nChất liệu :	Hợp kim nhôm\r\nKích thước :	138.1 x 67 x 6.9 mm\r\nTrọng lượng :	124 g\r\nKhả năng chống nước :	Không\r\nThông tin pin\r\nLoại pin :	Lithium - Ion\r\nDung lượng pin :	1810mAh\r\nPin có thể tháo rời :	Không\r\nThời gian chờ :	240 giờ\r\nThời gian đàm thoại :	14 giờ\r\nKết nối & Cổng giao tiếp\r\nBăng tần 2G :	GSM 850/ 900/ 1800/ 1900 MHz\r\nBăng tần 3G :	HSDPA 850/ 900/ 1800/ 1900 MHz\r\nBăng tần 4G :	Có\r\nHỗ trợ SIM :	Nano Sim\r\nKhe cắm sim :	1 Sim\r\nWifi :	802.11a/b/g/n/ac Wi‑Fi\r\nGPS :	A-GPS và GLONASS\r\nBluetooth :	Có,V4.0\r\nGPRS/EDGE :	Có\r\nNFC :	Có\r\nKết nối USB :	Lightning\r\nCổng kết nối khác :	Không\r\nCổng sạc :	Lightning\r\nJack (Input & Output) :	3.5 mm', 0, 0, 20, '9999000.00', '0.00', 'Gold', '636252705107929864_iphone6-32GB-gold (1).jpg', 1, 1, '2017-04-07 05:14:23', '2017-04-07 05:14:23'),
(3, 'iPhone 6s 64GB', '<p>Thông số cơ bản Màn hình : 4.7 inch (1334 x 750 pixels) Camera : Chính: 12.0MP, Phụ: 5.0 MP Bộ nhớ trong : 64 GB Hệ điều hành : iOS 9 Chipset : Apple A9 Kích thước : 138.3 x 67.1 x 7.1 mm Màn hình Công nghệ màn hình : Retina Chuẩn màn hình : HD Màu màn hình : 16 Triệu màu Độ phân giải màn hình : 1334 x 750 pixels Kích thước màn hình : 4.7 inch Công nghệ cảm ứng : 3D Touch Chụp hình &amp; Quay phim Camera sau : 12 MP Camera trước : 5 MP Đèn Flash : Có Tính năng camera : Live Photos, Autofocus with Focus Pixels, Panorama (up to 63 megapixels), Auto HDR for photos, Exposure control, Burst mode , Timer mode Quay Phim : 4K video recording (3840 by 2160) at 30 fps Video Call : 720p HD Cấu hình phần cứng Chipset : A9 Bộ nhớ &amp; Lưu trữ Danh bạ lưu trữ : Không giới hạn Bộ nhớ trong : 64 GB Thẻ nhớ ngoài : Không Hỗ trợ thẻ nhớ tối đa : Không Thiết kế &amp; Trọng lượng Kiểu dáng : Thanh (thẳng) + Cảm ứng Kích thước : 138.3 x 67.1 x 7.1 mm Trọng lượng : 143 g Thông tin pin Loại pin : lithium-ion battery Dung lượng pin : 1715mAh Pin có thể tháo rời : Không Thời gian chờ : 10 ngày Thời gian đàm thoại : lên đến 14 giờ (3G) Kết nối &amp; Cổng giao tiếp Băng tần 2G : GSM / EDGE (850, 900, 1800, 1900 MHz) Băng tần 3G : UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz) Băng tần 4G : TD-LTE (Bands 38, 39, 40, 41) Hỗ trợ SIM : Nano Sim Khe cắm sim : 1 Sim Wifi : 802.11a/b/g/n/ac Wi‑Fi with MIMO GPS : Có Bluetooth : Bluetooth 4.2 wireless technology NFC : Có Cổng sạc : Lightning to USB Cable Jack (Input &amp; Output) : 3.5 mm</p>', 0, 1, 20, '15999000.00', '14999000.00', 'Pink', '635870815572201527_iphone-6s-hong-5.jpg', 1, 1, '2017-04-07 05:17:29', '2017-04-12 14:03:52'),
(4, 'iPhone 6s 32GB', 'Thông số cơ bản\r\nMàn hình :	4.7 inch (1334 x 750 pixels)\r\nCamera :	Chính: 12.0MP, Phụ: 5.0 MP\r\nBộ nhớ trong :	32 GB\r\nHệ điều hành :	IOS\r\nChipset :	Apple A9\r\nKích thước :	138.3 x 67.1 x 7.1 mm\r\nMàn hình\r\nCông nghệ màn hình :	Retina\r\nChuẩn màn hình :	HD\r\nMàu màn hình :	16 Triệu màu\r\nĐộ phân giải màn hình :	1334 x 750 pixels\r\nKích thước màn hình :	4.7 inch\r\nCông nghệ cảm ứng :	3D Touch\r\nChụp hình & Quay phim\r\nCamera sau :	12 MP\r\nCamera trước :	5 MP\r\nĐèn Flash :	Có\r\nTính năng camera :	Live Photos, Autofocus with Focus Pixels, Panorama (up to 63 megapixels), Auto HDR for photos, Exposure control, Burst mode , Timer mode\r\nQuay Phim :	4K video recording (3840 by 2160) at 30 fps\r\nVideo Call :	720p HD\r\nCấu hình phần cứng\r\nChipset :	A9\r\nBộ nhớ & Lưu trữ\r\nDanh bạ lưu trữ :	Không giới hạn\r\nBộ nhớ trong :	32 GB\r\nThẻ nhớ ngoài :	Không\r\nThiết kế & Trọng lượng\r\nKiểu dáng :	Thanh (thẳng)\r\nKích thước :	138.3 x 67.1 x 7.1 mm\r\nTrọng lượng :	143 g\r\nThông tin pin\r\nLoại pin :	lithium-ion battery\r\nDung lượng pin :	1715mAh\r\nPin có thể tháo rời :	Không\r\nThời gian chờ :	10 ngày\r\nThời gian đàm thoại :	lên đến 14 giờ (3G)\r\nKết nối & Cổng giao tiếp\r\nBăng tần 2G :	GSM / EDGE (850, 900, 1800, 1900 MHz)\r\nBăng tần 3G :	UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)\r\nBăng tần 4G :	TD-LTE (Bands 38, 39, 40, 41)\r\nHỗ trợ SIM :	Nano Sim\r\nKhe cắm sim :	1 Sim\r\nWifi :	802.11a/b/g/n/ac Wi‑Fi with MIMO\r\nGPS :	Có\r\nBluetooth :	Bluetooth 4.2 wireless technology\r\nNFC :	Có\r\nCổng sạc :	Lightning to USB Cable\r\nJack (Input & Output) :	3.5 mm', 0, 0, 20, '15999000.00', '13999000.00', 'Gold', '636172339622394948_apple-Iphone-6s-gold-1.jpg', 1, 1, '2017-04-07 05:20:19', '2017-04-07 05:20:19'),
(5, 'iPhone 7 32GB', '<ul>\r\n	<li><strong>Thông số cơ bản</strong></li>\r\n	<li>Màn hình :4.7 inch(1334 x 750 pixel)</li>\r\n	<li>Camera :Chính: 12.0 MP, Phụ: 7.0 MP</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Hệ điều hành :iOS 10</li>\r\n	<li>Chipset :Apple A10</li>\r\n	<li>GPU :M10</li>\r\n	<li>Kích thước :138.3 x 67.1 x 7.1 mm</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><strong>Màn hình</strong></li>\r\n	<li>Công nghệ màn hình :Retina</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Chuẩn HD</li>\r\n	<li>Độ phân giải màn hình :1334 x 750 pixels</li>\r\n	<li>Kích thước màn hình :4.7 inch</li>\r\n	<li>Công nghệ cảm ứng :3D Touch</li>\r\n	<li>Chụp hình &amp; Quay phim</li>\r\n	<li>Camera sau :12.0 MP</li>\r\n	<li>Camera trước :7.0 MP</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Tính năng camera :Ổn định quang học, Panorama, tự động lấy nét, live photos, HDR</li>\r\n	<li>Quay Phim :4K 2160p@30fps</li>\r\n	<li>Video Call :Có</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp; Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Số nhân :4</li>\r\n	<li>Chipset :A10</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Chip đồ họa (GPU) :M10</li>\r\n	<li>Bộ nhớ &amp; Lưu trữ</li>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Thẻ nhớ ngoài :Không</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :Không</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp; Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :138.3 x 67.1 x 7.1 mm</li>\r\n	<li>Trọng lượng :138g</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp; Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Dung lượng pin :7.45 Wh (1960 mAh)</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM / EDGE (850, 900, 1800, 1900 MHz)</li>\r\n	<li>Băng tần 3G :UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :1 Sim</li>\r\n	<li>Wifi :802.11a / b / g / n / ac</li>\r\n	<li>GPS :A-GPS và GLONASS</li>\r\n	<li>Bluetooth :v4.2</li>\r\n	<li>Kết nối USB :Lightning</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Lightning</li>\r\n	<li>Jack (Input &amp; Output) :Lightning</li>\r\n	<li>Giải trí &amp; Ứng dụng</li>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>Chức năng khác :Không</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp; &nbsp;Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 21, '18790000.00', '17790000.00', 'Black', '636159398645952790_ip7-black-1 (1).jpg', 1, 1, '2017-04-07 05:35:42', '2017-04-07 05:35:42'),
(6, 'iPhone 7 128GB', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :4.7 inch (1334 x 750 pixels)</li>\r\n	<li>Camera :Chính: 12.0 MP, Phụ: 7.0 MP</li>\r\n	<li>Bộ nhớ trong :128 GB</li>\r\n	<li>Hệ điều hành :iOS 10</li>\r\n	<li>Chipset :Apple A10</li>\r\n	<li>GPU :M10</li>\r\n	<li>Kích thước :138.3 x 67.1 x 7.1 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :Retina</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Chuẩn HD</li>\r\n	<li>Độ phân giải màn hình :1334 x 750 pixels</li>\r\n	<li>Kích thước màn hình :4.7 inch</li>\r\n	<li>Công nghệ cảm ứng :3D Touch</li>\r\n	<li>Chụp hình &amp; Quay phim</li>\r\n	<li>Camera sau :12.0 MP</li>\r\n	<li>Camera trước :7.0 MP</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Tính năng camera :Ổn định quang học, Panorama, tự động lấy nét, live photos, HDR</li>\r\n	<li>Quay Phim :4K 2160p@30fps</li>\r\n	<li>Video Call :Có</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Số nhân :4</li>\r\n	<li>Chipset :A10</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Chip đồ họa (GPU) :M10</li>\r\n	<li>Bộ nhớ &amp; Lưu trữ</li>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :128 GB</li>\r\n	<li>Thẻ nhớ ngoài :Không</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :không</li>\r\n	<li>Thiết kế &amp; Trọng lượng</li>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :138.3 x 67.1 x 7.1 mm</li>\r\n	<li>Trọng lượng :138g</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Dung lượng pin :7.45 Wh (1960 mAh)</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM / EDGE (850, 900, 1800, 1900 MHz)</li>\r\n	<li>Băng tần 3G :UMTS/HSPA+/DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :1 Sim</li>\r\n	<li>Wifi :802.11a / b / g / n / ac</li>\r\n	<li>GPS :A-GPS và GLONASS</li>\r\n	<li>Bluetooth :v4.2</li>\r\n	<li>Kết nối USB :Lightning</li>\r\n	<li>Cổng kết nối khác :không</li>\r\n	<li>Cổng sạc :Lightning</li>\r\n	<li>Jack (Input &amp; Output) :Lightning</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 Tháng</li>\r\n</ul>', 0, 1, 21, '21690000.00', '18690000.00', 'Red', '636257897438253908_iphone7plus-do-1.jpg', 1, 1, '2017-04-07 05:39:03', '2017-04-12 14:11:25'),
(7, 'iPhone 7 256GB (RED)', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :4.7 inch (1334 x 750 pixels)</li>\r\n	<li>Camera :Chính: 12.0 MP, Phụ: 7.0 MP</li>\r\n	<li>Bộ nhớ trong :256GB</li>\r\n	<li>Hệ điều hành :iOS 10</li>\r\n	<li>Chipset :Apple A10</li>\r\n	<li>GPU :M10</li>\r\n	<li>Kích thước :138.3 x 67.1 x 7.1 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :Retina</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Chuẩn HD</li>\r\n	<li>Độ phân giải màn hình :1334 x 750 pixels</li>\r\n	<li>Kích thước màn hình :4.7 inch</li>\r\n	<li>Công nghệ cảm ứng :3D Touch</li>\r\n	<li>Chụp hình &amp; Quay phim</li>\r\n	<li>Camera sau :13 MP</li>\r\n	<li>Camera trước :7.0 MP</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Tính năng camera :Ổn định quang học, Panorama, tự động lấy nét, live photos, HDR</li>\r\n	<li>Quay Phim :4K 2160p@30fps</li>\r\n	<li>Video Call :Có</li>\r\n	<li>Cấu hình phần cứng</li>\r\n	<li>Số nhân :4</li>\r\n	<li>Chipset :A10</li>\r\n	<li>RAM :2GB</li>\r\n	<li>Chip đồ họa (GPU) :M10</li>\r\n	<li>Bộ nhớ &amp; Lưu trữ</li>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :256 GB</li>\r\n	<li>Thẻ nhớ ngoài :Không</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :Không</li>\r\n	<li>Thiết kế &amp; Trọng lượng</li>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :138.3 x 67.1 x 7.1 mm</li>\r\n	<li>Trọng lượng :138g</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Dung lượng pin :7.45 Wh (1960 mAh)</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM/EDGE (850, 900, 1800, 1900 MHz)</li>\r\n	<li>Băng tần 3G :UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :1 Sim</li>\r\n	<li>Wifi :802.11a / b / g / n / ac</li>\r\n	<li>GPS :A-GPS và GLONASS</li>\r\n	<li>Bluetooth :v4.2</li>\r\n	<li>Kết nối USB :Lightning</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Lightning</li>\r\n	<li>Jack (Input &amp; Output) :Lightning</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 21, '24590000.00', '21590000.00', 'Red', '636257897438253908_iphone7plus-do-1.jpg', 1, 1, '2017-04-07 05:43:50', '2017-04-12 14:21:30'),
(8, 'Samsung Galaxy J5 Prime', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.0 inch 720 x 1280 Pixels</li>\r\n	<li>Camera :Chính: 13.0 MP, Phụ: 5.0 MP</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :Exynos 7570 4 nhân 64-bit</li>\r\n	<li>CPU :Quad-Core 1.4GHz</li>\r\n	<li>GPU :Mali T720</li>\r\n	<li>Kích thước :142.8 x 69.5 x 8.1 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :PLS</li>\r\n	<li>Chuẩn màn hình :HD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Độ phân giải màn hình :720 x 1280 pixels</li>\r\n	<li>Kích thước màn hình :5.0 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung, đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính cường lực</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :13.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chế độ chụp chuyên nghiệp</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :5.0 MP</li>\r\n	<li>Thông tin khác :Chế độ làm đẹp, Quay video Full HD, Camera góc rộng</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :1.4 GHz</li>\r\n	<li>Số nhân :4 nhân</li>\r\n	<li>Chipset :Exynos 7570</li>\r\n	<li>RAM :2GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali T720</li>\r\n	<li>Cảm biến :Vân tay,gia tốc,khoảng cách</li>\r\n	<li>Bộ nhớ &amp; Lưu trữ</li>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Bộ nhớ còn lại :~10 GB</li>\r\n	<li>Thẻ nhớ ngoài :Micro SD</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :256 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Kim loại nguyên khối(mặt kính cong 2,5D)</li>\r\n	<li>Kích thước :142.8 x 69.5 x 8.1 mm</li>\r\n	<li>Trọng lượng :143 g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :2400 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Thời gian đàm thoại :10 giờ</li>\r\n	<li>Chế độ sạc nhanh :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM850, GSM900, DCS1800, PCS1900</li>\r\n	<li>Băng tần 3G :B1(2100), B2(1900), B5(850), B8(900</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :2 Khe</li>\r\n	<li>Wifi :Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</li>\r\n	<li>GPS :GPS, Glonass, Beidou</li>\r\n	<li>Bluetooth :Bluetooth v4.2</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Không</li>\r\n	<li>Kết nối USB :Micro USB</li>\r\n	<li>Cổng kết nối khác :Hỗ trợ OTG</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :MP4, M4V, 3GP, 3G2, WMV, ASF, AVI, FLV, MKV, WEBM</li>\r\n	<li>Nghe nhạc :MP3, M4A, 3GA, AAC, OGG, OGA, WAV, WMA, AMR, AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Không</li>\r\n	<li>Chức năng khác :- Google Search, Maps, Gmail - YouTube, Google Talk - Tích hợp mạng xã hội - Ghi âm bằng giọng nói - Xem văn bản - Nhập liệu đoán trước từ</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 Tháng</li>\r\n</ul>', 0, 1, 12, '4690000.00', '0.00', 'Black', '636155073785868798_j5-prime-den-1.jpg', 2, 1, '2017-04-09 12:08:45', '2017-04-09 12:08:45'),
(9, 'Samsung Galaxy J7 Prime', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch (1080 x 1920 pixels)</li>\r\n	<li>Camera :Chính: 13.0 MP, Phụ: 8.0 MP</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Hệ điều hành :Android Marshmallow 6.0.1</li>\r\n	<li>Chipset :Exynos 7870 8 nhân 64-bit</li>\r\n	<li>CPU :Octa-Core 1.60GHz</li>\r\n	<li>Kích thước :151.5 x 74.9 x 8.1 mm</li>\r\n	<li>GPU :Mali-T830</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :PLS</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1920 x 1080 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Công nghệ cảm ứng :Đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính cường lực Gorilla Glass 4</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :13.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chế độ chụp chuyên nghiệp</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Camera góc rộng, Chế độ làm đẹp, Nhận diện khuôn mặt, Selfie bằng cử chỉ</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :1.60 GHz</li>\r\n	<li>Số nhân :8 nhân</li>\r\n	<li>Chipset :Exynos 7870</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T830</li>\r\n	<li>Cảm biến :Vân tay,gia tốc,khoảng cách</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Bộ nhớ còn lại :~25 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :256 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Hợp kim nhôm nguyên khối (mặt kính cong 2,5D)</li>\r\n	<li>Kích thước :151.5 x 74.9 x 8.1 mm</li>\r\n	<li>Trọng lượng :167g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :3300 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Không</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM 850 / 900 / 1800 / 1900</li>\r\n	<li>Băng tần 3G :WCDMA 850/ 2100 GHz</li>\r\n	<li>Băng tần 4G :LTE Cat 4</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :2 Khe</li>\r\n	<li>Wifi :WiFi b/g/n, Wi-Fi Direct</li>\r\n	<li>GPS :A-GPS, GLONASS</li>\r\n	<li>Bluetooth :v4.1</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Không</li>\r\n	<li>Kết nối USB :Micro USB</li>\r\n	<li>Cổng kết nối khác :Hỗ trợ OTG</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :H.265, 3GP, MP4, AVI, WMV, H.264(MPEG4-AVC), DivX, WMV9, Xvid</li>\r\n	<li>Nghe nhạc :Lossless, MP3, WAV, WMA</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 0, 32, '5990000.00', '0.00', 'Pink', '636183647652760462_Samsung-Galaxy-J7-Prime-Pink-2-1482370627_1200x0.jpg', 2, 1, '2017-04-09 12:14:11', '2017-04-09 12:14:11'),
(10, 'Samsung Galaxy A3 (2017)', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :4.7 inch (1280 x 720 pixels)</li>\r\n	<li>Camera :Chính: 13.0 MP, Phụ: 8.0 MP</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :Exynos 7870 Octa</li>\r\n	<li>CPU :Octa-core 1.6 GHz Cortex-A53</li>\r\n	<li>Kích thước :135.4 x 66.2 x 7.9 mm</li>\r\n	<li>GPU :Mali-T830</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :Super AMOLED</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Chuẩn HD</li>\r\n	<li>Độ phân giải màn hình :1280 x 720 pixels</li>\r\n	<li>Kích thước màn hình :4.7 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung, đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính cường lực Gorilla Glass 4</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :13.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama</li>\r\n	<li>Camera Trước</li>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Nhận diện khuôn mặt</li>\r\n	<li>Cấu hình phần cứng</li>\r\n	<li>Tốc độ CPU :1.60 GHz</li>\r\n	<li>Số nhân :8 nhân</li>\r\n	<li>Chipset :Exynos 7870 Octa</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T830</li>\r\n	<li>Cảm biến :Ánh sáng, tiệm cận, chuyển động, la bàn số, con quay hồi chuyển, từ trường, vân tay</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Bộ nhớ còn lại :~10 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :256 GB</li>\r\n	<li>Thiết kế &amp; Trọng lượng</li>\r\n	<li>Chất liệu :Khung kim loại + mặt kính cường lực (Cong 2,5D)</li>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :135.4 x 66.2 x 7.9 mm</li>\r\n	<li>Trọng lượng :138g</li>\r\n	<li>Khả năng chống nước :Có</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Lithium - Ion</li>\r\n	<li>Dung lượng pin :2350 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM850, GSM900, DCS1800, PCS1900</li>\r\n	<li>Băng tần 3G :B1(2100), B2(1900), B5(850), B8(900)</li>\r\n	<li>Băng tần 4G :4G LTE</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :2 SIM</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</li>\r\n	<li>GPS :BDS, A-GPS, GLONASS</li>\r\n	<li>Bluetooth :v4.2, A2DP, LE</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Có</li>\r\n	<li>Kết nối USB :USB Type-C</li>\r\n	<li>Cổng kết nối khác :Hỗ trợ OTG</li>\r\n	<li>Cổng sạc :USB Type-C</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :MP4, M4V, 3GP, 3G2, WMV, ASF, AVI, FLV, MKV, WEBM</li>\r\n	<li>Nghe nhạc :MP3, M4A, 3GA, AAC, OGG, OGA, WAV, WMA, AMR, AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n	<li>Chức năng khác :Smart Switch, Mở khóa nhanh bằng vân tay</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 12, '6490000.00', '5490000.00', 'Gold', '636198330091946168_samsung-galaxy-a3-gold-2017-1.jpg', 2, 1, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(11, 'Samsung Galaxy A5 (2017)', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.2 inch (1080 x 1920 pixels )</li>\r\n	<li>Camera :Chính: 16.0 MP; Phụ: 16.0 MP</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :Exynos 7880</li>\r\n	<li>CPU :1.9 GHz</li>\r\n	<li>Kích thước :146,1 x 71,4 x 7.9mm</li>\r\n	<li>GPU :Mali-T830MP2</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :Super AMOLED</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.2 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung, đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính cường lực</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :16.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :16.0 MP</li>\r\n	<li>Thông tin khác :Quay video Full HD, Nhận diện khuôn mặt</li>\r\n	<li>Cấu hình phần cứng</li>\r\n	<li>Tốc độ CPU :1.9 GHz</li>\r\n	<li>Số nhân :8 nhân</li>\r\n	<li>Chipset :Exynos 7880</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T830MP2</li>\r\n	<li>Cảm biến :Vân tay,gia tốc, khoảng cách,áp kế,la bàn</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Bộ nhớ còn lại :~23 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :256 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Chất liệu :Khung kim loại + mặt kính cường lực (Cong 2,5D)</li>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :146,1 x 71,4 x 7.9mm</li>\r\n	<li>Trọng lượng :157g</li>\r\n	<li>Khả năng chống nước :Chuẩn IP68</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Pin chuẩn Li-Ion</li>\r\n	<li>Dung lượng pin :3000 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Có</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM 850/900/1800/1900</li>\r\n	<li>Băng tần 3G :HSDPA</li>\r\n	<li>Băng tần 4G :4G LTE Cat 6</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :2 SIM</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</li>\r\n	<li>GPS :BDS, A-GPS, GLONASS</li>\r\n	<li>Bluetooth :v4.2, A2DP, LE, EDR</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Có</li>\r\n	<li>Kết nối USB :USB Type-C</li>\r\n	<li>Cổng kết nối khác :OTG</li>\r\n	<li>Cổng sạc :USB Type-C</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n	<li>Giải trí &amp; Ứng dụng</li>\r\n	<li>Xem phim :3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC), DivX, WMV9, Xvid</li>\r\n	<li>Nghe nhạc :Lossless, Midi, MP3, WAV, WMA, WMA9, AAC, AAC+, AAC++, eAAC+, OGG, AC3, FLAC</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 0, 32, '8990000.00', '0.00', 'Pink', '636223354862200879_samsung-galaxy-a5-rose-1.jpg', 2, 1, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(12, 'Samsung Galaxy A5 (2016)', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.2 inch (1080 x 1920 pixels )</li>\r\n	<li>Camera :Chính: 13.0 MP, Phụ: 5.0 MP</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Hệ điều hành :Android 5.1.1 (Lollipop)</li>\r\n	<li>Chipset :Exynos 7580 8 nhân 64-bit</li>\r\n	<li>CPU :Octa-core 1.6 GHz</li>\r\n	<li>Kích thước :144.8 x 71 x 7.3 mm</li>\r\n	<li>GPU :Mali T720</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :Super AMOLED</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.2 inch</li>\r\n	<li>Công nghệ cảm ứng :Điện dung đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính cường lực Gorilla Glass 4</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :13.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :5.0 MP</li>\r\n	<li>Thông tin khác :Chế độ làm đẹp</li>\r\n	<li>Cấu hình phần cứng</li>\r\n	<li>Tốc độ CPU :Octa-core 1.6 GHz</li>\r\n	<li>Số nhân :8 Nhân</li>\r\n	<li>Chipset :Exynos 7580</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali T720</li>\r\n	<li>Cảm biến :Vân tay, gia tốc, khoảng cách, la bàn</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Bộ nhớ còn lại :~10 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Khung kim loại + mặt kính cường lực (Cong 2,5D)</li>\r\n	<li>Kích thước :144.8 x 71 x 7.3 mm</li>\r\n	<li>Trọng lượng :155g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-ion</li>\r\n	<li>Dung lượng pin :2900 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Có</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>\r\n	<li>Băng tần 3G :HSDPA 850/ 900/ 1900/ 2100 GHz</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano SIM</li>\r\n	<li>Khe cắm sim :2 Sim</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n, dual-band, WiFi Direct, hotspot</li>\r\n	<li>GPS :A-GPS, GLONASS/ BDS</li>\r\n	<li>Bluetooth :v4.1, A2DP, EDR, LE</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Có</li>\r\n	<li>Kết nối USB :MicroUSB</li>\r\n	<li>Cổng kết nối khác :Hỗ trợ OTG</li>\r\n	<li>Cổng sạc :MicroUSB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :MP4/ WMV/ H.264</li>\r\n	<li>Nghe nhạc :MP3/ WAV/ WMA/ eAAC+/ FLAC</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n</ul>', 0, 1, 21, '6790000.00', '5700000.00', 'Gold', '635851640642208217_A5-Gold-1.jpg', 2, 1, '2017-04-09 13:10:20', '2017-04-09 13:10:20'),
(13, 'Huawei P9', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.2 inch (1080 x 1920 pixels )</li>\r\n	<li>Camera :Chính: 12.0 MP, Phụ: 8.0 MP</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :HiSilicon Kirin 955</li>\r\n	<li>CPU :Quad-core 2.5 GHz &amp; Quad-core 1.8 GHz</li>\r\n	<li>GPU :Mali-T880 MP4</li>\r\n	<li>Kích thước :145 x 70.9 x 7 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :IPS-NEO LCD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.2 inch</li>\r\n	<li>Công nghệ cảm ứng :Điện dung đa điểm</li>\r\n	<li>Mặt kính màn hình :Gorilla Glass 4</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :12.0 MP</li>\r\n	<li>Quay phim :1080p@60fps, 1080p@30fps, 720p@120fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Camera góc rộng, Quay video Full HD</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :2.5 GHz &amp; 1.8 GHz</li>\r\n	<li>Số nhân :8 Nhân</li>\r\n	<li>Chipset :HiSilicon Kirin 955</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T880 MP4</li>\r\n	<li>Cảm biến :Vân tay, gia tốc kế, con quay hồi chuyển, khoảng cách, la bàn</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Bộ nhớ còn lại :~20 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Kim loại nguyên khối</li>\r\n	<li>Kích thước :145 x 70.9 x 7 mm</li>\r\n	<li>Trọng lượng :144g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :3000 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Có</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>\r\n	<li>Băng tần 3G :HSDPA 850/ 900/ 1700/ 1900/ 2100 MHz</li>\r\n	<li>Băng tần 4G :LTE</li>\r\n	<li>Hỗ trợ SIM :Nano SIM</li>\r\n	<li>Khe cắm sim :2 SIM</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, WiFi Direct, hotspot</li>\r\n	<li>GPS :A-GPS, GLONASS/ BDS</li>\r\n	<li>Bluetooth :v4.2, A2DP, LE</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Có</li>\r\n	<li>Kết nối USB :MicroUSB</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :MicroUSB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Xvid/ MP4/ H.265</li>\r\n	<li>Nghe nhạc :MP3/ eAAC+/ WAV/ Flac</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Không</li>\r\n	<li>Đèn pin :Có</li>\r\n	<li>Chức năng khác :Camera kép leica</li>\r\n</ul>', 0, 1, 12, '10990000.00', '10000000.00', 'Gold', '636174000002697684_Huawei-p9--gold-1.jpg', 3, 1, '2017-04-09 13:18:58', '2017-04-09 13:18:58'),
(14, 'Huawei GR5 2017 Pro', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch (1080 x 1920 pixels)</li>\r\n	<li>Camera :Chính: Dual 12.0MP + 2.0MP; Phụ: 8.0MP</li>\r\n	<li>RAM :4 GB</li>\r\n	<li>Bộ nhớ trong :64 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :HiSilicon Kirin 655</li>\r\n	<li>CPU :Octa-core(4 x 2.1GHz Cortex-A53 &amp; 4 x 1.7GHz Cortex-A53)</li>\r\n	<li>Kích thước :150.9 x 76.2 x 8.2 mm</li>\r\n	<li>GPU :Mali-T830MP2</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :LTPS IPS LCD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung, đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính chống xước</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :12.0 MP và 2.0 MP (Dual Camera)</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Camera góc rộng, Chế độ làm đẹp, Nhận diện khuôn mặt, Quay video HD</li>\r\n	<li>Cấu hình phần cứng</li>\r\n	<li>Tốc độ CPU :4 x 2.1GHz Cortex-A53 &amp; 4 x 1.7GHz Cortex-A53</li>\r\n	<li>Số nhân :8</li>\r\n	<li>Chipset :HiSilicon Kirin 655</li>\r\n	<li>RAM :4 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T830MP2</li>\r\n	<li>Cảm biến :Vân tay</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :64 GB</li>\r\n	<li>Bộ nhớ còn lại :Đang cập nhật</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Kim loại nguyên khối(mặt kính cong 2,5D)</li>\r\n	<li>Kích thước :150.9 x 76.2 x 8.2 mm</li>\r\n	<li>Trọng lượng :167g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :3340 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :Có</li>\r\n	<li>Băng tần 3G :Có</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :2 SIM Nano (SIM 2 chung khe thẻ nhớ)</li>\r\n	<li>Wifi :Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</li>\r\n	<li>GPS :Có</li>\r\n	<li>Bluetooth :v4.1</li>\r\n	<li>Kết nối USB :microUSB v2.0</li>\r\n	<li>Cổng kết nối khác :Hỗ trợ OTG</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Không</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 0, 21, '7490000.00', '0.00', 'Black', '636232896572010956_Huawei-GR5-2017-Pro-2.png', 3, 1, '2017-04-09 13:21:40', '2017-04-09 13:21:40'),
(15, 'Huawei Gr5 2017', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch (1080 x 1920 pixels)</li>\r\n	<li>Camera :Chính: 12.0 MP và 2.0 MP(Dual camera); Phụ: 8.0MP</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :HiSilicon Kirin 655</li>\r\n	<li>CPU :Quad-Core 1.7GHz &amp; Quad-Core 2.1GHz</li>\r\n	<li>Kích thước :150.9 x 76.2 x 7.9 mm</li>\r\n	<li>GPU :Mali-T830</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :IPS LCD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung, đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính cường lực</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :12.0 MP và 2.0 MP (Dual Camera)</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Camera góc rộng</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :1.7 GHz &amp; 2.1 GHz</li>\r\n	<li>Số nhân :8</li>\r\n	<li>Chipset :HiSilicon Kirin 655</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T830</li>\r\n	<li>Cảm biến :- Cảm biến xoay tự động - Phím điều khiển cảm ứng - Cảm biến ánh sáng - Điều khiển con quay</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Bộ nhớ còn lại :~21 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Kim loại nguyên khối(mặt kính cong 2,5D)</li>\r\n	<li>Kích thước :150.9 x 76.2 x 7.9 mm</li>\r\n	<li>Trọng lượng :167g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :3340 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM: 850/900/1800/1900MHz</li>\r\n	<li>Băng tần 3G :UMTS: 900/850/2100MHz</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Micro SIM</li>\r\n	<li>Khe cắm sim :2 Micro SIM (SIM 2 chung khe thẻ nhớ)</li>\r\n	<li>Wifi :802.11 b/g/n/ac, 2.4 GHz, Wi-Fi hotspot</li>\r\n	<li>GPS :GPS/A-GPS/Glonass/BDS</li>\r\n	<li>Bluetooth :v4.1</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Không</li>\r\n	<li>Kết nối USB :Micro USB</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC), DivX, WMV9, Xvid</li>\r\n	<li>Nghe nhạc :Midi, Lossless, MP3, WAV, WMA9, WMA, AAC, AAC+, AAC++, eAAC+, OGG, AC3, FLAC</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Không</li>\r\n	<li>Đèn pin :Có</li>\r\n	<li>Chức năng khác :Camera kép xóa phông, Đa nhiệm, Cảm biến ảnh sony</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 21, '5990000.00', '0.00', 'Gold', '636174790957063708_Huawei-Gr5-2017-gold-my-tam.jpg', 3, 1, '2017-04-09 13:27:16', '2017-04-09 13:27:16'),
(16, 'Huawei GR5 Mini', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.2 inch (1080 x 1920 pixels )</li>\r\n	<li>Camera :Chính: 13.0 MP, Phụ: 8.0 MP</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :HiSilicon Kirin 650</li>\r\n	<li>CPU :Quad-core 2.0GHz x Quad-core 1.7GHz</li>\r\n	<li>Kích thước :147.1 x 73.76 x 8.3mm</li>\r\n	<li>GPU :Mali-T830</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :IPS LCD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.2 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung, đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính chịu lực</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :13.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Chụp ảnh nâng cao :Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chế độ chụp chuyên nghiệp</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Chế độ làm đẹp, Panorama</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :2.0GHz &amp;1.7GHz()</li>\r\n	<li>Số nhân :8 nhân</li>\r\n	<li>Chipset :HiSilicon Kirin 650</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-T830</li>\r\n	<li>Cảm biến :Accelerometer/Proximity sensor/Ambient light sensor/Digital Compass</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Bộ nhớ còn lại :~10 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Kim loại nguyên khối</li>\r\n	<li>Kích thước :147.1 x 73.76 x 8.3mm</li>\r\n	<li>Trọng lượng :156g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :3000 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Không</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM: 850/900/1800/1900MHz</li>\r\n	<li>Băng tần 3G :UMTS B8/B1/B2</li>\r\n	<li>Băng tần 4G :FDD:B1/B3/B7/B8/B20</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :2 SIM</li>\r\n	<li>Wifi :Wi-Fi 2.4GHz 802.11b/g/n, Wi-Fi Direct</li>\r\n	<li>GPS :Có</li>\r\n	<li>Bluetooth :v4.0</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Không</li>\r\n	<li>Kết nối USB :MicroUSB</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n	<li>Đèn pin :Có</li>\r\n	<li>Chức năng khác :Google Play, Google Search, Google Maps, Gmail, YouTube, Lịch,Facebook,Đoán từ khi nhập liệu, Gõ tiếng Việt</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 21, '3990000.00', '0.00', 'Gold', '635984103966375996_gr5-1o.jpg', 3, 1, '2017-04-09 13:29:47', '2017-04-09 13:29:47');
INSERT INTO `products` (`id`, `name`, `detail`, `purchases`, `hightlights`, `quantity`, `price`, `price_sale`, `color`, `images`, `trademark_id`, `user_id`, `created_at`, `updated_at`) VALUES
(17, 'Huawei Y6 II', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch (720 x 1280 pixels)</li>\r\n	<li>Camera :Chính: 13.0 MP, Phụ: 8.0 MP</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Hệ điều hành :Android 6.0 (Marshmallow)</li>\r\n	<li>Chipset :HiSilicon Kirin 620</li>\r\n	<li>CPU :Octa-core 1.2 GHz</li>\r\n	<li>GPU :Mali 450 MP</li>\r\n	<li>Kích thước :154.3 x 77.1 x 8.45mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :IPS LCD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Chuẩn HD</li>\r\n	<li>Độ phân giải màn hình :720 x 1280 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Công nghệ cảm ứng :Đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính chịu lực</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :13.0 MP</li>\r\n	<li>Quay phim :Full HD 1080p@30fps</li>\r\n	<li>Đèn Flash :Có</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Thông tin khác :Camera góc rộng, Chế độ làm đẹp</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :1.2 GHz</li>\r\n	<li>Số nhân :8 nhân</li>\r\n	<li>Chipset :HiSilicon Kirin 620</li>\r\n	<li>RAM :2 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali 450</li>\r\n	<li>Cảm biến :Vân tay, Con quay hồi chuyển .</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Bộ nhớ còn lại :~10 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Nhựa</li>\r\n	<li>Kích thước :154.3 x 77.1 x 8.45mm</li>\r\n	<li>Trọng lượng :168g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Po</li>\r\n	<li>Dung lượng pin :3000 mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Chế độ sạc nhanh :Không</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM 850/900/1800/1900</li>\r\n	<li>Băng tần 3G :HSDPA 850/900/1900/2100</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Micro SIM</li>\r\n	<li>Khe cắm sim :2 SIM</li>\r\n	<li>Wifi :802.11 b/g/n</li>\r\n	<li>GPS :Có, A-GPS</li>\r\n	<li>Bluetooth :v4.0</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Không</li>\r\n	<li>Kết nối USB :Có,micro USB</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n	<li>Đèn pin :Có</li>\r\n	<li>Chức năng khác :Màn hình lớn, Pin lâu, Đa nhiệm</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 21, '2990000.00', '0.00', 'White', '636056403229655373_Huawei-Y6-II-1-cell.jpg', 3, 1, '2017-04-09 13:32:15', '2017-04-09 13:32:15'),
(18, 'Huawei Y5II', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.0 inch (1280 x 720 Pixel)</li>\r\n	<li>Camera :Chính 8.0 MP, Phụ: 2.0 MP</li>\r\n	<li>RAM :1 GB</li>\r\n	<li>Bộ nhớ trong :8 GB</li>\r\n	<li>Hệ điều hành :Android 5.1</li>\r\n	<li>Chipset :MTK 6582 4 nhân 32-bit</li>\r\n	<li>CPU :Quad-core 1.3 GHz</li>\r\n	<li>GPU :Mali-400</li>\r\n	<li>Kích thước :143.8 x 72 x 8.9 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :IPS LCD</li>\r\n	<li>Chuẩn màn hình :HD</li>\r\n	<li>Độ phân giải màn hình :1280 x 720 pixels</li>\r\n	<li>Kích thước màn hình :5.0 inch</li>\r\n	<li>Công nghệ cảm ứng :Đa điểm</li>\r\n	<li>Mặt kính màn hình :Kính chịu lực</li>\r\n</ul>\r\n\r\n<p><strong>Camera Sau</strong></p>\r\n\r\n<ul>\r\n	<li>Độ phân giải :8.0 MP</li>\r\n	<li>Quay phim :Có</li>\r\n	<li>Đèn Flash :Có</li>\r\n</ul>\r\n\r\n<p><strong>Camera Trước</strong></p>\r\n\r\n<ul>\r\n	<li>Video Call :Có</li>\r\n	<li>Độ phân giải :2.0 MP</li>\r\n	<li>Cấu hình phần cứng</li>\r\n	<li>Tốc độ CPU :1.3 GHz</li>\r\n	<li>Số nhân :4 nhân</li>\r\n	<li>Chipset :MTK 6582</li>\r\n	<li>RAM :1 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-400</li>\r\n	<li>Cảm biến :Vân tay, Con quay hồi chuyển .</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :8 GB</li>\r\n	<li>Bộ nhớ còn lại :~4 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD (T-Flash)</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :32 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Chất liệu :Nhựa</li>\r\n	<li>Kích thước :143.8 x 72 x 8.9 mm</li>\r\n	<li>Trọng lượng :135g</li>\r\n	<li>Khả năng chống nước :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Po</li>\r\n	<li>Dung lượng pin :2200 mAh</li>\r\n	<li>Pin có thể tháo rời :Có</li>\r\n	<li>Chế độ sạc nhanh :Không</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM 850 / 900 / 1800 / 1900</li>\r\n	<li>Băng tần 3G :WCDMA 850/ 2100 GHz</li>\r\n	<li>Băng tần 4G :Không</li>\r\n	<li>Hỗ trợ SIM :Micro SIM</li>\r\n	<li>Khe cắm sim :2 Khe</li>\r\n	<li>Wifi :WiFi b/g/n</li>\r\n	<li>GPS :A-GPS</li>\r\n	<li>Bluetooth :v 4.0</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Không</li>\r\n	<li>Kết nối USB :Micro USB</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Micro USB</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :3GP, MP4, WMV, DivX, WMV9, Xvid</li>\r\n	<li>Nghe nhạc :Midi, MP3, WAV, WMA, AAC++, eAAC+, OGG</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>FM radio :Có</li>\r\n	<li>Đèn pin :Có</li>\r\n	<li>Chức năng khác :Đèn flash trên camera trước, Phím thông minh</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 0, 21, '2169000.00', '0.00', 'White', '636020097090533214_chitreti.jpg', 3, 1, '2017-04-09 13:42:12', '2017-04-09 13:42:12'),
(19, 'Huawei P10 Plus', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch (1440 x 2560 pixels)</li>\r\n	<li>Camera :Chính: 20.0 MP, Phụ: 8.0 MP</li>\r\n	<li>Bộ nhớ trong :64 GB</li>\r\n	<li>Hệ điều hành :Android OS, v7.0 (Nougat)</li>\r\n	<li>Chipset :HiSilicon Kirin 960</li>\r\n	<li>CPU :Octa-core (4x2.4 GHz Cortex-A73 &amp; 4x1.8 GHz Cortex-A53)</li>\r\n	<li>GPU :Mali-G71 MP8</li>\r\n	<li>Kích thước :153.5 x 74.2 x 7 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :IPS-NEO LCD</li>\r\n	<li>Chuẩn màn hình :QHD</li>\r\n	<li>Độ phân giải màn hình :1440 x 2560 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Mặt kính màn hình :Corning Gorilla Glass 5</li>\r\n</ul>\r\n\r\n<p><strong>Chụp hình &amp; Quay phim</strong></p>\r\n\r\n<ul>\r\n	<li>Camera sau :Dual 20 MP + 12 MP</li>\r\n	<li>Camera trước :8.0 MP</li>\r\n	<li>Quay Phim :2160p@30fps, 1080p@60fps</li>\r\n	<li>Video Call :Có</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Tốc độ CPU :4x2.4 GHz Cortex-A73 &amp; 4x1.8 GHz Cortex-A53</li>\r\n	<li>Số nhân :8 Nhân</li>\r\n	<li>Chipset :HiSilicon Kirin 960</li>\r\n	<li>RAM :4 GB</li>\r\n	<li>Chip đồ họa (GPU) :Mali-G71 MP8</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Bộ nhớ trong :64 GB</li>\r\n	<li>Thẻ nhớ ngoài :MicroSD</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :256 GB</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Trọng lượng :165g</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Li-Ion</li>\r\n	<li>Dung lượng pin :3750 mAh</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM 850 / 900 / 1800 / 1900</li>\r\n	<li>Băng tần 3G :HSDPA 800 / 850 / 900 / 1700(AWS) / 1800 / 1900 / 2100</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, WiFi Direct, hotspot</li>\r\n	<li>GPS :A-GPS, GLONASS, BDS, GALILEO</li>\r\n	<li>Bluetooth :v4.2, A2DP, LE</li>\r\n	<li>NFC :Có</li>\r\n	<li>Kết nối USB :USB Type-C</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :USB Type-C</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 Tháng</li>\r\n</ul>', 0, 0, 21, '1500000.00', '0.00', 'Gold', '636238942344739733_huawei-p10-plus-1.jpg', 3, 1, '2017-04-09 13:45:30', '2017-04-09 13:45:30'),
(20, 'iPhone 7 Plus 32GB', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch (1920 x 1080 pixels)</li>\r\n	<li>Camera :Chính: Dual Camera 12.0MP; Phụ: 7.0MP</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Hệ điều hành :iOS 10</li>\r\n	<li>Chipset :Apple A10</li>\r\n	<li>GPU :M10</li>\r\n	<li>Kích thước :158.2 x 77.9 x 7.3 mm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :Retina</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Chuẩn màn hình :Full HD</li>\r\n	<li>Độ phân giải màn hình :1920 x 1080 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Công nghệ cảm ứng :3D Touch</li>\r\n</ul>\r\n\r\n<p><strong>Chụp hình &amp; Quay phim</strong></p>\r\n\r\n<ul>\r\n	<li>Camera sau :Dual Camera: 12.0 MP</li>\r\n	<li>Camera trước :7.0 MP</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Tính năng camera :Ổn định quang học, Panorama, tự động lấy nét, live photos, HDR</li>\r\n	<li>Quay Phim :4K 2160p@30fps</li>\r\n	<li>Video Call :Có</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Số nhân :4</li>\r\n	<li>Chipset :A10</li>\r\n	<li>RAM :3 GB</li>\r\n	<li>Chip đồ họa (GPU) :M10</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :32 GB</li>\r\n	<li>Thẻ nhớ ngoài :Không</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :158.2 x 77.9 x 7.3 mm</li>\r\n	<li>Trọng lượng :188 g</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Dung lượng pin :11.1 Wh (2900 mAh)</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n</ul>\r\n\r\n<p><strong>Kết nối &amp; Cổng giao tiếp</strong></p>\r\n\r\n<ul>\r\n	<li>Băng tần 2G :GSM / EDGE (850, 900, 1800, 1900 MHz)</li>\r\n	<li>Băng tần 3G :UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano SIM</li>\r\n	<li>Khe cắm sim :1 Sim</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac</li>\r\n	<li>GPS :A-GPS và GLONASS</li>\r\n	<li>Bluetooth :v4.2</li>\r\n	<li>Kết nối USB :Lightning</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Cổng sạc :Lightning</li>\r\n	<li>Jack (Input &amp; Output) :Lightning</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :Có</li>\r\n	<li>Nghe nhạc :Có</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>Chức năng khác :không</li>\r\n</ul>\r\n\r\n<p><strong>Bảo hành</strong></p>\r\n\r\n<ul>\r\n	<li>Thời gian bảo hành :12 tháng</li>\r\n</ul>', 0, 1, 21, '22290000.00', '20290000.00', 'White', '636159432318514641_ip7p-silver-1.jpg', 1, 1, '2017-04-09 13:50:00', '2017-04-09 13:50:00'),
(21, 'iPhone 6 Plus 16GB (Gold)', '<p><strong>Thông số cơ bản</strong></p>\r\n\r\n<ul>\r\n	<li>Màn hình :5.5 inch, 1080 x 1920 pixels</li>\r\n	<li>Camera :Chính: 8.0 MP, Phụ: 1.2 MP</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Hệ điều hành :iOs 8</li>\r\n	<li>Chipset :Apple A8</li>\r\n	<li>Kích thước :15,81 x 7,78 x 0,71 cm</li>\r\n</ul>\r\n\r\n<p><strong>Màn hình</strong></p>\r\n\r\n<ul>\r\n	<li>Công nghệ màn hình :LED IPS</li>\r\n	<li>Chuẩn màn hình :Retina HD</li>\r\n	<li>Màu màn hình :16 Triệu màu</li>\r\n	<li>Độ phân giải màn hình :1080 x 1920 pixels</li>\r\n	<li>Kích thước màn hình :5.5 inch</li>\r\n	<li>Công nghệ cảm ứng :Cảm ứng điện dung đa điểm</li>\r\n</ul>\r\n\r\n<p><strong>Chụp hình &amp; Quay phim</strong></p>\r\n\r\n<ul>\r\n	<li>Camera sau :8.0 MP</li>\r\n	<li>Camera trước :1.2 MP</li>\r\n	<li>Đèn Flash :Có</li>\r\n	<li>Tính năng camera :Tự động lấy nét, chạm lấy nét Nhận diện khuôn mặt, nụ cười Chống rung quang học</li>\r\n	<li>Quay Phim :Quay phim FullHD 1080p@60fps</li>\r\n	<li>Video Call :Có</li>\r\n</ul>\r\n\r\n<p><strong>Cấu hình phần cứng</strong></p>\r\n\r\n<ul>\r\n	<li>Số nhân :2 Nhân</li>\r\n	<li>Chipset :Apple A8</li>\r\n	<li>RAM :1 GB</li>\r\n</ul>\r\n\r\n<p><strong>Bộ nhớ &amp; Lưu trữ</strong></p>\r\n\r\n<ul>\r\n	<li>Danh bạ lưu trữ :Không giới hạn</li>\r\n	<li>Bộ nhớ trong :16 GB</li>\r\n	<li>Thẻ nhớ ngoài :Không</li>\r\n	<li>Hỗ trợ thẻ nhớ tối đa :Không</li>\r\n</ul>\r\n\r\n<p><strong>Thiết kế &amp; Trọng lượng</strong></p>\r\n\r\n<ul>\r\n	<li>Kiểu dáng :Thanh (thẳng) + Cảm ứng</li>\r\n	<li>Kích thước :15,81 x 7,78 x 0,71 cm</li>\r\n	<li>Trọng lượng :172 g</li>\r\n</ul>\r\n\r\n<p><strong>Thông tin pin</strong></p>\r\n\r\n<ul>\r\n	<li>Loại pin :Lithium - Ion</li>\r\n	<li>Dung lượng pin :2915mAh</li>\r\n	<li>Pin có thể tháo rời :Không</li>\r\n	<li>Thời gian chờ :384 giờ</li>\r\n	<li>Thời gian đàm thoại :24 giờ</li>\r\n	<li>Kết nối &amp; Cổng giao tiếp</li>\r\n	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>\r\n	<li>Băng tần 3G :HSDPA 850/ 900/ 1800/ 1900 MHz</li>\r\n	<li>Băng tần 4G :Có</li>\r\n	<li>Hỗ trợ SIM :Nano Sim</li>\r\n	<li>Khe cắm sim :1 Sim</li>\r\n	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi hotspot</li>\r\n	<li>GPS :A-GPS và GLONASS</li>\r\n	<li>Bluetooth :Có</li>\r\n	<li>GPRS/EDGE :Có</li>\r\n	<li>NFC :Có</li>\r\n	<li>Kết nối USB :Có</li>\r\n	<li>Cổng kết nối khác :Không</li>\r\n	<li>Jack (Input &amp; Output) :3.5 mm</li>\r\n</ul>\r\n\r\n<p><strong>Giải trí &amp; Ứng dụng</strong></p>\r\n\r\n<ul>\r\n	<li>Xem phim :MP4, AVI, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</li>\r\n	<li>Nghe nhạc :MP3, WAV, WMA, eAAC+, AMR</li>\r\n	<li>Ghi âm :Có</li>\r\n	<li>Chức năng khác :Mạng xã hội ảo Youtube Micro chuyên dụng chống ồn</li>\r\n</ul>', 0, 1, 21, '11999000.00', '10999000.00', 'Gold', '635874987101965222_iphone-6-gold-5.jpg', 1, 1, '2017-04-09 13:53:29', '2017-04-09 13:53:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(13, '636172339622394948_apple-Iphone-6s-gold-1.jpg', 4, '2017-04-07 05:20:19', '2017-04-07 05:20:19'),
(14, '636172339809600948_apple-Iphone-6s-gold-2.jpg', 4, '2017-04-07 05:20:19', '2017-04-07 05:20:19'),
(15, '636172339809912958_apple-Iphone-6s-gold-3.jpg', 4, '2017-04-07 05:20:19', '2017-04-07 05:20:19'),
(16, '636159398645952790_ip7-black-1.jpg', 5, '2017-04-07 05:35:42', '2017-04-07 05:35:42'),
(17, '636159398740350005_ip7-black-2.jpg', 5, '2017-04-07 05:35:42', '2017-04-07 05:35:42'),
(18, '636159398740506008_ip7-black-3.jpg', 5, '2017-04-07 05:35:42', '2017-04-07 05:35:42'),
(19, '636155073962152188_j5-prime-den-2.jpg', 8, '2017-04-09 12:08:45', '2017-04-09 12:08:45'),
(20, '636155073960748161_j5-prime-den-3.jpg', 8, '2017-04-09 12:08:45', '2017-04-09 12:08:45'),
(21, '636198330091946168_samsung-galaxy-a3-gold-2017-1.jpg', 10, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(22, '636198330193183029_samsung-galaxy-a3-gold-2017-2.jpg', 10, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(23, '636198330194118963_samsung-galaxy-a3-gold-2017-4.jpg', 10, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(24, '636198330194274952_samsung-galaxy-a3-gold-2017-3.jpg', 10, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(25, '636198330194274952_samsung-galaxy-a3-gold-2017-6.jpg', 10, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(26, '636198330194430941_samsung-galaxy-a3-gold-2017-5.jpg', 10, '2017-04-09 12:57:50', '2017-04-09 12:57:50'),
(27, '636223354862200879_samsung-galaxy-a5-rose-1.jpg', 11, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(28, '636223355076578300_samsung-galaxy-a5-rose-2.jpg', 11, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(29, '636223355076734301_samsung-galaxy-a5-rose-3.jpg', 11, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(30, '636223355076734301_samsung-galaxy-a5-rose-4.jpg', 11, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(31, '636223355076890302_samsung-galaxy-a5-rose-5.jpg', 11, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(32, '636223355076890302_samsung-galaxy-a5-rose-6.jpg', 11, '2017-04-09 13:03:35', '2017-04-09 13:03:35'),
(33, '635851640642208217_A5-Gold-1.jpg', 12, '2017-04-09 13:10:20', '2017-04-09 13:10:20'),
(34, '635851640637838005_A5-Gold-4.jpg', 12, '2017-04-09 13:10:20', '2017-04-09 13:10:20'),
(35, '635851640643769007_A5-Gold-2.jpg', 12, '2017-04-09 13:10:20', '2017-04-09 13:10:20'),
(36, '635851640640179190_A5-Gold-5.jpg', 12, '2017-04-09 13:10:20', '2017-04-09 13:10:20'),
(37, '636174000002697684_Huawei-p9--gold-1.jpg', 13, '2017-04-09 13:18:59', '2017-04-09 13:18:59'),
(38, '636174000092134188_Huawei-p9--gold-3.jpg', 13, '2017-04-09 13:18:59', '2017-04-09 13:18:59'),
(39, '636174000091666176_Huawei-p9--gold-2.jpg', 13, '2017-04-09 13:18:59', '2017-04-09 13:18:59'),
(40, '636174791341145556_Huawei-Gr5-2017-gold-1.jpg', 15, '2017-04-09 13:27:16', '2017-04-09 13:27:16'),
(41, '636174791435059964_Huawei-Gr5-2017-gold-2.jpg', 15, '2017-04-09 13:27:16', '2017-04-09 13:27:16'),
(42, '636174791435683980_Huawei-Gr5-2017-gold-3.jpg', 15, '2017-04-09 13:27:16', '2017-04-09 13:27:16'),
(43, '636159432318514641_ip7p-silver-1.jpg', 20, '2017-04-09 13:50:00', '2017-04-09 13:50:00'),
(44, '636159432629976746_ip7p-silver-2.jpg', 20, '2017-04-09 13:50:00', '2017-04-09 13:50:00'),
(45, '636159432630288676_ip7p-silver-3.jpg', 20, '2017-04-09 13:50:00', '2017-04-09 13:50:00'),
(46, '635874987101965222_iphone-6-gold-5.jpg', 21, '2017-04-09 13:53:29', '2017-04-09 13:53:29'),
(47, '636233548631279579_iphone-6-gold-3.jpg', 21, '2017-04-09 13:53:29', '2017-04-09 13:53:29'),
(48, '636233548631279579_iphone-6-gold-4.jpg', 21, '2017-04-09 13:53:29', '2017-04-09 13:53:29'),
(64, '636130132109482441_635871547008347243_iphone-6s-gold-5.jpg', 3, '2017-04-12 14:03:52', '2017-04-12 14:03:52'),
(65, '636130132219373429_635871544362734837_iphone-6s-gold-1.jpg', 3, '2017-04-12 14:03:52', '2017-04-12 14:03:52'),
(66, '636130132220553547_635871544367263419_iphone-6s-gold-3.jpg', 3, '2017-04-12 14:03:52', '2017-04-12 14:03:52'),
(67, '636130132220563548_635871544365233365_iphone-6s-gold-2.jpg', 3, '2017-04-12 14:03:52', '2017-04-12 14:03:52'),
(68, '636130132109482441_635871547008347243_iphone-6s-gold-5.jpg', 1, '2017-04-12 14:08:54', '2017-04-12 14:08:54'),
(69, '636168024426680011_635869123778242011_iphone-5s-3.jpg', 1, '2017-04-12 14:08:54', '2017-04-12 14:08:54'),
(70, '636168024426680011_635869123780271896_iphone-5s-4.jpg', 1, '2017-04-12 14:08:54', '2017-04-12 14:08:54'),
(71, '636168024427147996_635869123773869951_iphone-5s-1.jpg', 1, '2017-04-12 14:08:54', '2017-04-12 14:08:54'),
(72, '636168024427147996_635869123776212126_iphone-5s-2.jpg', 1, '2017-04-12 14:08:54', '2017-04-12 14:08:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trademarks`
--

CREATE TABLE `trademarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trademarks`
--

INSERT INTO `trademarks` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Apple(Iphone)', 1, '2017-04-07 04:56:56', '2017-04-07 04:56:56'),
(2, 'SamSung', 1, '2017-04-07 04:57:09', '2017-04-07 04:57:09'),
(3, 'Huawei', 1, '2017-04-07 04:57:21', '2017-04-07 04:57:21'),
(4, 'OPPO', 1, '2017-04-07 04:57:41', '2017-04-07 04:57:41'),
(5, 'Nokia', 1, '2017-04-07 04:57:53', '2017-04-07 04:57:53'),
(6, 'Mobiistar', 1, '2017-04-07 04:58:05', '2017-04-07 04:58:05'),
(7, 'Sony', 1, '2017-04-07 04:58:19', '2017-04-07 04:58:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `gender`, `level`, `phone`, `address`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', '$2y$10$t0/qLU.QT76i6EoYhHCqW.PKrMZ70.SfE6XufdLnp96QqpYhDv8j.', 'iz3StrNZiMsCw6oFcESptmnl09FhIa0rcWGroELG62sY9ZweF04JC148DGct', '2017-04-05 10:50:44', '2017-04-07 04:54:08', 1, 1, '0975425847', 'hội an'),
(3, 'member2r', 'membe2r@gmail.com', '$2y$10$N8STIGiY8LMYCzxk.Ug1P.tfWswJHMGpXwQUivr7h26iBaSzdq2Gu', 'jBMyjWzDXdlHrIS2mj6XPVwvX98TdnTCInyNlaTw', '2017-04-08 06:20:24', '2017-04-08 06:20:24', 0, 0, '123123123', 'An Hội'),
(4, 'member2', 'member2@gmail.com', '$2y$10$dufugfgUyLqzzz6ydDARF.42fMOZFWT67asg4oa8xpn16A/pQ5KgG', 'AVJvkg6WJept9iUH603Vpa4ElWKHjfe8wAP2Q7PaMkZRt3zuhucg0mU0wMMv', '2017-04-08 06:27:20', '2017-04-08 06:27:20', 1, 0, '01213638036', 'Hội An Quảng Nam'),
(5, 'member3', 'member3@gmail.com', '$2y$10$YxutrmyCh/3N5.tAnMqP8erN0Qmuy94tWKQszxV8ewhAKenl8KPKy', 'lPPQLoLZ1FxGdEj5QS5I29XhZWV6Zoe4cWgwM9ORuEMBcFffJphy1CmKhcsp', '2017-04-08 06:42:49', '2017-04-08 06:42:49', 0, 0, '01213638036', 'Hội An Quảng Nam'),
(7, 'Admin', 'admin@gmail.com', '$2y$10$WllTqStVpg1zSrpnmSsZeeKf2sz4Y65Tk3Rg93wr4WqY9jg2YGGnm', 'nItUfD5xDGli2poDfBHzZIIgdfpbXoXuGQQXUWXwHJGLN8iHiWxOHP2g1QZF', '2017-04-08 16:18:03', '2017-04-08 16:18:03', 0, 1, '01213638036', 'Hội An'),
(8, 'member5', 'member5@gmail.com', '$2y$10$vtxD8gq36UzV2dYPmy2i4uwt8iO/4DSYaYMm2eiJp1BQZGZi1k/Em', 'lgiVGTnB3xLKK5BXSdecKaz42LkBkrIWhh4LAhcx', '2017-04-08 16:19:43', '2017-04-08 16:19:43', 1, 0, '01213638036', 'Hội An');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_trademark_id_foreign` (`trademark_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trademarks_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_trademark_id_foreign` FOREIGN KEY (`trademark_id`) REFERENCES `trademarks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  ADD CONSTRAINT `trademarks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
