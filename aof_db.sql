-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 08 Haz 2018, 10:19:08
-- Sunucu sürümü: 5.6.38-log
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `aof_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_ad` text NOT NULL,
  `admin_ka` text NOT NULL,
  `admin_sifre` text NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_ad`, `admin_ka`, `admin_sifre`) VALUES
(1, 'Gulsum BALCI', 'gulsum', '123');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dersler`
--

DROP TABLE IF EXISTS `dersler`;
CREATE TABLE IF NOT EXISTS `dersler` (
  `ders_id` int(11) NOT NULL AUTO_INCREMENT,
  `ders_ad` text NOT NULL,
  PRIMARY KEY (`ders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `dersler`
--

INSERT INTO `dersler` (`ders_id`, `ders_ad`) VALUES
(1, 'Matematik I'),
(2, 'Matematik 2'),
(3, 'Sunucu Yazılımları '),
(4, 'Web Programlama'),
(6, 'Veri Yapilari');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hocalar`
--

DROP TABLE IF EXISTS `hocalar`;
CREATE TABLE IF NOT EXISTS `hocalar` (
  `hoca_id` int(11) NOT NULL AUTO_INCREMENT,
  `hoca_ad` text NOT NULL,
  `hoca_bolum` text NOT NULL,
  `mail` text NOT NULL,
  `tel` text NOT NULL,
  `hoca_ka` text NOT NULL,
  `hoca_sifre` text NOT NULL,
  PRIMARY KEY (`hoca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `hocalar`
--

INSERT INTO `hocalar` (`hoca_id`, `hoca_ad`, `hoca_bolum`, `mail`, `tel`, `hoca_ka`, `hoca_sifre`) VALUES
(1, 'Kemal akyol', 'Bilgisayar Muhendisligi', 'kl@kastamonu.edu.tr', '2213333', 'kemal', 'akyol'),
(3, 'Rumeysa Demiroglu', 'Genetik Muhendisi', 'rmysdmrglu@gmail.com', '58555', 'rumeysa', '1314'),
(5, 'gfdg', 'gfshsfg', 'gfsnfg', '8585', 'gf', 'fghgfhö');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenciler`
--

DROP TABLE IF EXISTS `ogrenciler`;
CREATE TABLE IF NOT EXISTS `ogrenciler` (
  `ogr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ogr_ad` text NOT NULL,
  `ogr_tc` text NOT NULL,
  `ogr_bolum` text NOT NULL,
  `ogr_ka` text NOT NULL,
  `ogr_sifre` text NOT NULL,
  PRIMARY KEY (`ogr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ogrenciler`
--

INSERT INTO `ogrenciler` (`ogr_id`, `ogr_ad`, `ogr_tc`, `ogr_bolum`, `ogr_ka`, `ogr_sifre`) VALUES
(1, 'Gulsum Balci', '11111111', 'bilgisayar muhendisligi', 'gulsum', '1234'),
(2, 'Ayse Balci', '11111112222', 'Kamu Yönetimi', 'ayse', '123'),
(3, 'Rumeysa Demiroglu', '256565556', 'Genetik ve Biyomuhendislik', 'rumeysa', '1415'),
(5, 'Hilal Zengin', '252554', 'Genetik', 'hilal', '5555');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogr_al_ders`
--

DROP TABLE IF EXISTS `ogr_al_ders`;
CREATE TABLE IF NOT EXISTS `ogr_al_ders` (
  `ogr_id` int(11) NOT NULL,
  `ders_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ogr_al_ders`
--

INSERT INTO `ogr_al_ders` (`ogr_id`, `ders_id`) VALUES
(4, 3),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 6),
(1, 1),
(1, 4),
(1, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru`
--

DROP TABLE IF EXISTS `soru`;
CREATE TABLE IF NOT EXISTS `soru` (
  `soru_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `a` text NOT NULL,
  `b` text NOT NULL,
  `c` text NOT NULL,
  `d` text NOT NULL,
  `hoca_id` int(11) NOT NULL,
  `ders_id` int(11) NOT NULL,
  PRIMARY KEY (`soru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `soru`
--

INSERT INTO `soru` (`soru_id`, `text`, `a`, `b`, `c`, `d`, `hoca_id`, `ders_id`) VALUES
(1, 'Türkiyenin baskenti neresidir?', 'Ankara', 'Istanbul', 'Samsun', 'Sakarya', 1, 4),
(3, '5+6=?', '5', '6', '11', '15', 3, 1),
(4, '2\'nin küpü?', '4', '16', '32', '8', 1, 1),
(5, '4+8=?', '4', '5', '8', '7', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
