-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: mysql.srkhost.eu
-- Létrehozás ideje: 2023. Már 27. 18:24
-- Kiszolgáló verziója: 5.7.40
-- PHP verzió: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `s23680_strongv2`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `access_tokens`
--

CREATE TABLE `access_tokens` (
  `accountId` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `access_tokens`
--

INSERT INTO `access_tokens` (`accountId`, `token`) VALUES
(1, 'yctslyCVxiKbghe9'),
(3, 'hu6BgghvRnNDwRzx'),
(4, '27Q8oLXWhDoMbvP8'),
(5, 'LU9ePNVp7Bg32yWc'),
(6, 'AUp30NjBaFRRmyfk'),
(7, 'I3eJ31uOuTFqrGih'),
(8, 'xpEFjOJcbBM4aoTI'),
(9, 'xJh2NlqVBkMtQqQi'),
(10, 'g6tZ0kRsitSbUghv'),
(11, 'MP2qyrTDnqZsRdRi');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts`
--

CREATE TABLE `accounts` (
  `accountId` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(1024) COLLATE utf8_hungarian_ci NOT NULL,
  `emailAddress` varchar(64) COLLATE utf8_hungarian_ci NOT NULL,
  `lastLogin` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adminLevel` int(2) NOT NULL DEFAULT '0',
  `adminNick` varchar(64) COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'Admin',
  `serial` varchar(32) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `maximumCharacters` tinyint(2) NOT NULL DEFAULT '1',
  `premiumPoints` int(11) NOT NULL DEFAULT '20000',
  `adminJail` int(11) NOT NULL DEFAULT '0',
  `adminJailBy` varchar(255) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `adminJailTimestamp` int(11) NOT NULL DEFAULT '0',
  `adminJailTime` int(11) NOT NULL DEFAULT '0',
  `adminJailReason` varchar(1000) COLLATE utf8_hungarian_ci NOT NULL,
  `helperLevel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `accounts`
--

INSERT INTO `accounts` (`accountId`, `username`, `password`, `emailAddress`, `lastLogin`, `created`, `adminLevel`, `adminNick`, `serial`, `suspended`, `online`, `maximumCharacters`, `premiumPoints`, `adminJail`, `adminJailBy`, `adminJailTimestamp`, `adminJailTime`, `adminJailReason`, `helperLevel`) VALUES
(1, 'Yeezy123', 'Yeezy123', '@@@@', 1679925845, '2023-03-26 14:35:32', 10, 'yeezy', '99BC809A5B13D8F2EE26D6DDF5021DA2', 0, 0, 1, 4390750, 0, '', 0, 0, '', 0),
(2, 'valami12', 'Valami12', 'valami2004@valami.com', 0, '2023-03-26 15:18:37', 0, 'Admin', '5BC84EDE729055B943B8A83FF92E00A2', 0, 0, 1, 0, 0, '', 0, 0, '', 0),
(3, 'enrxx123', 'Fasz12345', 'asdasdasdsads@]mail.com', 1679934077, '2023-03-26 16:04:42', 10, 'Kevlar', '60260F56409C1861CED6F646E6A59CFE', 0, 0, 1, 9912700, 0, '', 0, 0, '', 0),
(4, 'Reder', 'Patrik2005', 'fafaffa@gagagag', 1679929149, '2023-03-27 12:40:50', 7, 'Ryder', 'B5D00FDBF504A79D34195CB186FF0393', 0, 0, 1, 20000, 0, '', 0, 0, '', 0),
(5, 'Cory', '$2y$10$xrO5M4L51e4.ya0VOljm8.u8JprsMxXUWmgErMuXxitfw/2j15r/6', 'valaki.hu@gmail.com', 1679927994, '2023-03-27 14:11:22', 1, 'Cory', '0BC14BA10C1459EF6EBCF9AF86DC8702', 1, 0, 1, 3050, 0, '', 0, 0, '', 0),
(6, 'Sanyi21', '$2y$10$klLDJidW3LAnCY9xIhyMLuZQh9Vt6wQeJWN0SW82AUrZgPDQVdSF2', 'asd341902@gmail.com', 1679927234, '2023-03-27 14:27:17', 0, 'Admin', '1F7C3F5DD909349682F04286320A96E3', 0, 0, 1, 14080, 0, '', 0, 0, '', 0),
(7, 'Lacii', '$2y$10$514oVXTiRosn9MzmCKCFu.6/CRnMPVxr/OqilDiffiDO2l6BHGfZS', 'nemvalosemail.@gmail.com', 1679927346, '2023-03-27 14:29:08', 6, 'Cocky', '174B9686FE12EA4F9B7BC50D64863E03', 0, 0, 1, 380, 0, '', 0, 0, '', 0),
(8, 'Gubicsalma18', '$2y$10$A2z31F7Y0tPeGUh2XxvcreGx9PeNg8T/o8Pq0REf1SRzaTYjAWiUi', 'senki1978gmail@hu.', 1679927577, '2023-03-27 14:32:32', 0, 'Admin', '96DF24175ADC8CC4945B29AC41B1E0F2', 0, 0, 1, 0, 0, '', 0, 0, '', 0),
(9, 'Franko112', '$2y$10$yCzGxNHLwbAmSqX0WbKYUe8QQfZUamVeADoC3KRhgoJ4XPBlG050q', 'gfdgfdgfd@gmail.com', 1679928344, '2023-03-27 14:45:47', 0, 'Admin', '6A1688AF2A4A527CF089C52E1ADA7C94', 0, 0, 1, 20000, 0, '', 0, 0, '', 0),
(10, 'Dragika112\\', '$2y$10$g8JOD25jHgbyCCYurfG6beyx/vUjhOn.hFa8aBJ8jjvA7kd9KjQ7u', 'Dragoste@dragoste.com', 1679929302, '2023-03-27 15:01:45', 0, 'Admin', '2C0121832182924EAD95F0B01177975E', 0, 0, 1, 20000, 0, '', 0, 0, '', 0),
(11, 'Asd123', '$2y$10$pnGgD7yYJdrUMJtsO3v1TO.8PflwCuLn6dGwR6uBeW642Zf/prxxe', 'Asd123@gmail.com', 1679929854, '2023-03-27 15:10:58', 0, 'Admin', 'D01579A73339113DEFBAFA75C6F8ECE4', 0, 0, 1, 20000, 0, '', 0, 0, '', 0),
(12, 'xyebi', '$2y$10$0blBR5eKGiGp0de8/8LmD.GEteV6mGPjpAnilV9u9jIlJw52vF.8.', 'kriszmeszaros29@gmail.com', 1679933653, '2023-03-27 16:14:17', 1, 'Admin', 'D0E42999169AF18483A59A826D8795E3', 0, 0, 1, 20000, 0, '', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `animals`
--

CREATE TABLE `animals` (
  `animalId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `type` enum('Husky','Rottweiler','Doberman','Bull Terrier','Boxer','Francia Bulldog','Disznó') COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `health` float NOT NULL DEFAULT '100',
  `hunger` float NOT NULL DEFAULT '100',
  `love` float NOT NULL DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `animals`
--

INSERT INTO `animals` (`animalId`, `ownerId`, `type`, `name`, `health`, `hunger`, `love`) VALUES
(1, 3, 'Boxer', 'Wardiss', 0, 99, 99),
(2, 1, 'Bull Terrier', 'boto boti', 78.88, 100, 100);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `atms`
--

CREATE TABLE `atms` (
  `dbID` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `atms`
--

INSERT INTO `atms` (`dbID`, `posX`, `posY`, `posZ`, `rotZ`, `interior`, `dimension`) VALUES
(1, 1041.19, 1011.44, 10.65, 145, 0, 0),
(2, 995.906, 1067.43, 10.4703, 180, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `position` varchar(300) NOT NULL DEFAULT '',
  `type` set('ped','atm') NOT NULL DEFAULT 'ped',
  `skin` int(11) NOT NULL DEFAULT '0',
  `name` varchar(300) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bank_transaction`
--

CREATE TABLE `bank_transaction` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL DEFAULT '',
  `targetnumber` varchar(300) NOT NULL DEFAULT '',
  `ownernumber` varchar(300) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL DEFAULT '0',
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bans`
--

CREATE TABLE `bans` (
  `banId` int(11) NOT NULL,
  `serial` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `playerName` varchar(64) COLLATE utf8_hungarian_ci NOT NULL,
  `playerAccountId` int(11) NOT NULL,
  `adminName` varchar(64) COLLATE utf8_hungarian_ci NOT NULL,
  `adminAccountId` int(11) NOT NULL,
  `banReason` varchar(1024) COLLATE utf8_hungarian_ci NOT NULL,
  `banTimestamp` int(11) NOT NULL,
  `expireTimestamp` int(11) NOT NULL,
  `deactivated` enum('Yes','No') COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'No',
  `deactivatedBy` int(11) NOT NULL DEFAULT '1',
  `deactivateReason` varchar(1024) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `deactivateTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bans`
--

INSERT INTO `bans` (`banId`, `serial`, `playerName`, `playerAccountId`, `adminName`, `adminAccountId`, `banReason`, `banTimestamp`, `expireTimestamp`, `deactivated`, `deactivatedBy`, `deactivateReason`, `deactivateTimestamp`) VALUES
(1, '0BC14BA10C1459EF6EBCF9AF86DC8702', 'Cory', 5, 'Kevlar', 3, 'Állj le.', 1679934229, 1924988399, 'No', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `billiards`
--

CREATE TABLE `billiards` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rz` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `blackjack`
--

CREATE TABLE `blackjack` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rz` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL,
  `minEntry` int(64) NOT NULL,
  `maxEntry` int(64) NOT NULL,
  `credit` bigint(20) NOT NULL DEFAULT '0',
  `creditAll` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `casinopeds`
--

CREATE TABLE `casinopeds` (
  `pedId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL,
  `skinId` int(3) NOT NULL,
  `name` varchar(32) COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'PED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `casinopeds`
--

INSERT INTO `casinopeds` (`pedId`, `posX`, `posY`, `posZ`, `rotZ`, `interior`, `dimension`, `skinId`, `name`) VALUES
(1, 1953.79, 1018.31, 992.469, 269.76, 10, 347, 91, 'Ernesto');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `characters`
--

CREATE TABLE `characters` (
  `characterId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `age` int(2) NOT NULL DEFAULT '18',
  `description` varchar(100) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `weight` int(3) NOT NULL DEFAULT '80',
  `height` int(3) NOT NULL DEFAULT '190',
  `gender` int(1) NOT NULL DEFAULT '1',
  `skin` int(3) NOT NULL DEFAULT '7',
  `posX` double NOT NULL DEFAULT '1689.2677001953',
  `posY` double NOT NULL DEFAULT '1445.9998779297',
  `posZ` double NOT NULL DEFAULT '10.767142295837',
  `rotZ` double NOT NULL DEFAULT '0',
  `interior` int(11) NOT NULL DEFAULT '0',
  `dimension` int(11) NOT NULL DEFAULT '0',
  `health` float NOT NULL DEFAULT '100',
  `armor` float NOT NULL DEFAULT '0',
  `hunger` float NOT NULL DEFAULT '100',
  `thirst` float NOT NULL DEFAULT '100',
  `money` bigint(20) NOT NULL DEFAULT '1000000',
  `slotCoins` bigint(20) DEFAULT '0',
  `lastOnline` timestamp NULL DEFAULT NULL,
  `playedMinutes` int(11) NOT NULL DEFAULT '0',
  `actionBarItems` varchar(128) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `playerRecipes` varchar(1024) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `isPlayerDeath` int(1) NOT NULL DEFAULT '0',
  `bankMoney` bigint(20) NOT NULL DEFAULT '0',
  `maxVehicles` int(3) NOT NULL DEFAULT '2',
  `interiorLimit` int(3) NOT NULL DEFAULT '5',
  `currentInterior` int(11) NOT NULL DEFAULT '0',
  `groups` longtext COLLATE utf8_hungarian_ci NOT NULL,
  `inDuty` int(3) NOT NULL DEFAULT '0',
  `playTimeForPayday` int(2) NOT NULL DEFAULT '60',
  `job` int(2) NOT NULL DEFAULT '0',
  `jail` int(3) NOT NULL DEFAULT '0',
  `jailTimestamp` int(11) NOT NULL DEFAULT '0',
  `jailTime` int(4) NOT NULL DEFAULT '0',
  `jailReason` varchar(1000) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `currentCustomInterior` int(11) NOT NULL DEFAULT '0',
  `radio` int(11) NOT NULL DEFAULT '0',
  `radio2` int(11) NOT NULL DEFAULT '0',
  `weaponSkills` varchar(54) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0',
  `currentClothes` longtext COLLATE utf8_hungarian_ci NOT NULL,
  `boughtClothes` longtext COLLATE utf8_hungarian_ci NOT NULL,
  `clothesLimit` int(11) NOT NULL DEFAULT '2',
  `paintOnPlayerTime` int(11) NOT NULL DEFAULT '0',
  `company` int(111) NOT NULL DEFAULT '0',
  `company_rank` int(11) NOT NULL DEFAULT '0',
  `company_tax_payed` int(255) NOT NULL DEFAULT '0',
  `stock` varchar(1500) COLLATE utf8_hungarian_ci NOT NULL,
  `bulletDamages` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `characters`
--

INSERT INTO `characters` (`characterId`, `accountId`, `name`, `age`, `description`, `weight`, `height`, `gender`, `skin`, `posX`, `posY`, `posZ`, `rotZ`, `interior`, `dimension`, `health`, `armor`, `hunger`, `thirst`, `money`, `slotCoins`, `lastOnline`, `playedMinutes`, `actionBarItems`, `playerRecipes`, `isPlayerDeath`, `bankMoney`, `maxVehicles`, `interiorLimit`, `currentInterior`, `groups`, `inDuty`, `playTimeForPayday`, `job`, `jail`, `jailTimestamp`, `jailTime`, `jailReason`, `currentCustomInterior`, `radio`, `radio2`, `weaponSkills`, `currentClothes`, `boughtClothes`, `clothesLimit`, `paintOnPlayerTime`, `company`, `company_rank`, `company_tax_payed`, `stock`, `bulletDamages`) VALUES
(1, 1, 'Yeezy_Carlos', 24, 'meno mano vagyok', 89, 189, 0, 214, 1638.518555, 1037.983398, 10.820312, 247.457092, 0, 0, 50, 0, 100, 100, 49392400, 0, '2023-03-27 16:23:12', 447, '43;44;40;-;-;-', '', 0, 0, 10002, 5, 0, '[[]]', 0, 27, 0, 0, 0, 0, '', 0, 0, 0, '0,0,1000,0,0,1000,0,0,0,1000,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(2, 2, 'Franklin_Occoner', 18, '99999999999999999999999999999999999v', 50, 165, 0, 1, 1480.7109375, -1781.1949462891, 18.25, 0, 0, 0, 100, 0, 100, 100, 2500, 0, NULL, 0, '', '', 0, 0, 2, 5, 0, '', 0, 60, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,0,0,0', '', '', 2, 0, 0, 0, 0, '', ''),
(3, 3, 'Sipos_Dezso', 34, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 89, 190, 0, 304, 1649.024414, 1038.466797, 10.820312, 123.032959, 0, 0, 0, 0, 100, 100, 499999999999501824, 0, '2023-03-27 16:23:57', 100, '169;121;-;-;-;-', '', 1, 0, 2, 5, 0, '[[]]', 0, 15, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,1000,1000,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(4, 4, 'Hektor_Oak', 25, 'Miva miva ostoba frosti', 46, 177, 0, 161, 60.074219, 2228.927734, 123.655502, 220.974136, 0, 0, 100, 0, 100, 100, 284200, 0, '2023-03-27 15:12:21', 130, '-;-;-;-;-;-', '', 0, 0, 2, 5, 0, '[[]]', 0, 42, 0, 0, 0, 0, '', 0, 0, 0, '0,0,1000,0,0,0,0,0,1000,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(5, 5, 'Cory_Carson', 34, 'cs yeezy mizu van dragam', 40, 230, 0, 287, 1636.246094, 1052.892578, 10.820312, 312.11261, 0, 0, 0, 0, 100, 100, 952400, 0, '2023-03-27 16:23:54', 129, '153;166;167;-;-;137', '', 1, 0, 2, 5, 0, '[[]]', 0, 49, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,1000,0,0,1000,0,1000,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(6, 6, 'Williem_Smithe', 20, 'Hogy elkezdjem az áletemet', 80, 180, 0, 1, 1669.291992, 1804.644531, 10.820312, 169.837524, 0, 0, 52, 0, 100, 100, 58850, 0, '2023-03-27 15:32:49', 65, '160;-;-;-;-;-', '', 0, 0, 5, 5, 0, '[[]]', 0, 54, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,0,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(7, 7, 'Daniel_Fierro', 20, 'Rövid buzzcuttal rendelkező testépítő, businessman, jövendőbeli multibilliárdos', 120, 190, 0, 21, 1665.722656, 1818.03125, 10.820312, 105.775238, 0, 0, 100, 0, 100, 100, 675000, 0, '2023-03-27 15:10:09', 40, '-;-;-;118;-;-', '', 0, 0, 2, 5, 0, '[[]]', 0, 19, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,1000,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(8, 8, 'Carl_Josh', 28, '28 éves férfi Las Venturasban él  , középiskolai végzettségeí.Épület és szerkezet Lakatos ', 90, 200, 0, 1, 1697.535156, 1453.228516, 10.765049, 302.977356, 0, 0, 100, 0, 100, 100, 2500, 0, '2023-03-27 14:34:25', 0, '-;-;-;-;-;-', '', 0, 0, 2, 5, 0, '[[]]', 0, 59, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,0,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(9, 9, 'Frank_Alvaro', 23, 'dfdgfgfdgfdgfdgfdF', 120, 182, 0, 19, -263.488281, 2689.765625, 62.6875, 205.774323, 0, 0, 84, 0, 100, 100, 837400, 0, '2023-03-27 15:04:25', 18, '-;-;-;-;-;-', '', 0, 0, 2, 5, 0, '[[]]', 0, 41, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,1000,0,0,0,0,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(10, 10, 'Matthew_Asked', 22, 'asdű.....................ű', 123, 123, 0, 1, 2115.768555, 1792.950195, 10.20086, 333.230774, 0, 0, 100, 0, 100, 100, 970000, 0, '2023-03-27 15:06:09', 3, '-;-;-;-;-;-', '', 0, 0, 2, 5, 0, '[[]]', 0, 56, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,0,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(11, 11, 'Jonhson_Michael', 24, 'asdasddasddaaddsd', 40, 121, 0, 229, 985.111328, 2562.107422, 10.342291, 51.032959, 0, 0, 0, 0, 100, 100, 984600, 0, '2023-03-27 15:16:16', 4, '-;-;-;-;-;-', '', 1, 0, 2, 5, 0, '[[]]', 0, 55, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,0,0,0', '', '[[]]', 2, 0, 0, 0, 0, '', ''),
(12, 12, 'John_Cg', 69, 'megbasztam dragi anyat hahahahahahahahahahha', 69, 169, 0, 122, 1689.2677001953, 1445.9998779297, 10.767142295837, 0, 0, 0, 100, 0, 100, 100, 1000000, 0, NULL, 0, '', '', 0, 0, 2, 5, 0, '', 0, 60, 0, 0, 0, 0, '', 0, 0, 0, '0,0,0,0,0,0,0,0,0,0,0', '', '', 2, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `companys`
--

CREATE TABLE `companys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Vállakozás',
  `type` int(255) NOT NULL DEFAULT '1' COMMENT '1=Kamion | 2=Repülő',
  `leader` int(255) NOT NULL,
  `balance` int(255) NOT NULL,
  `ranks` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `level` int(255) NOT NULL DEFAULT '1',
  `xp` int(255) NOT NULL DEFAULT '0',
  `memberSlot` int(255) NOT NULL DEFAULT '5',
  `vehicleSlot` int(255) NOT NULL DEFAULT '5',
  `message` varchar(5000) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Nincs megadva üzenet..'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `companytransactions`
--

CREATE TABLE `companytransactions` (
  `dbid` int(11) NOT NULL,
  `companyID` int(255) NOT NULL,
  `time` int(255) NOT NULL DEFAULT '0',
  `text` varchar(9999) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `companyvehicles`
--

CREATE TABLE `companyvehicles` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '-1',
  `color` varchar(100) NOT NULL DEFAULT '[ [ 255,255,255 ] ]',
  `tunings` varchar(255) NOT NULL DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]',
  `stickers` varchar(13000) NOT NULL DEFAULT '[ [ ] ]',
  `airride` int(25) NOT NULL DEFAULT '0',
  `neon` int(25) NOT NULL DEFAULT '0',
  `wheelsFront` varchar(255) NOT NULL DEFAULT '[ { "id": 0, "offset": 0.5, "angle": 0, "color": [ 255, 255, 255 ], "width": 1 } ]',
  `wheelsBack` varchar(255) NOT NULL DEFAULT '[ { "id": 0, "offset": 0.5, "angle": 0, "color": [ 255, 255, 255 ], "width": 1 } ]',
  `licensePlate` varchar(255) NOT NULL DEFAULT 'teszt',
  `plateStyle` int(255) NOT NULL DEFAULT '1',
  `headlight` varchar(255) NOT NULL DEFAULT '[ [ 255,255,255 ] ]',
  `optics` varchar(255) NOT NULL DEFAULT '[ [ ] ]',
  `tiresmokeLeft` varchar(255) NOT NULL DEFAULT '[ [ 170,170,170 ] ]',
  `tiresmokeRight` varchar(255) NOT NULL DEFAULT '[ [ 170,170,170 ] ]',
  `variant` int(255) NOT NULL DEFAULT '0',
  `nitro` varchar(255) NOT NULL DEFAULT '[ [ 0,0 ] ]',
  `steeringLock` int(255) NOT NULL DEFAULT '30',
  `driveType` varchar(255) NOT NULL DEFAULT 'def'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `copiers`
--

CREATE TABLE `copiers` (
  `copierId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(3) NOT NULL,
  `dimension` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `crypto_computers`
--

CREATE TABLE `crypto_computers` (
  `id` int(11) NOT NULL,
  `stack` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `income` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `crypto_desks`
--

CREATE TABLE `crypto_desks` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rot` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `crypto_rigs`
--

CREATE TABLE `crypto_rigs` (
  `id` int(11) NOT NULL,
  `position` text NOT NULL,
  `motherboard` int(11) NOT NULL,
  `supply` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `crypto_stacks`
--

CREATE TABLE `crypto_stacks` (
  `id` int(11) NOT NULL,
  `desk` int(11) NOT NULL,
  `position` text NOT NULL,
  `rot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `farms`
--

CREATE TABLE `farms` (
  `id` int(10) NOT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `rotation` float DEFAULT NULL,
  `owner` int(11) DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `cost` int(15) DEFAULT '0',
  `name` varchar(255) DEFAULT 'Farm',
  `blockTable` mediumtext,
  `permissionTable` mediumtext,
  `rentTime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fortunewheels`
--

CREATE TABLE `fortunewheels` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rz` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gamemachines`
--

CREATE TABLE `gamemachines` (
  `dbId` int(11) NOT NULL,
  `gameType` enum('GOLD_RUSH','GTA','WESTERN','STAR_WARS') NOT NULL DEFAULT 'GOLD_RUSH',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `rotZ` float NOT NULL DEFAULT '0',
  `interior` int(3) NOT NULL DEFAULT '0',
  `dimension` int(5) NOT NULL DEFAULT '0',
  `credit` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `groupmembers`
--

CREATE TABLE `groupmembers` (
  `dbID` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `characterId` int(11) NOT NULL,
  `rank` int(11) DEFAULT '1',
  `isLeader` varchar(1) COLLATE utf8_hungarian_ci DEFAULT 'N',
  `dutySkin` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `groups`
--

CREATE TABLE `groups` (
  `groupId` int(11) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(1024) COLLATE utf8_hungarian_ci NOT NULL,
  `ranks` text COLLATE utf8_hungarian_ci NOT NULL,
  `ranks_pay` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `interiors`
--

CREATE TABLE `interiors` (
  `interiorId` int(11) NOT NULL,
  `flag` enum('static','dynamic') COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'dynamic',
  `deleted` enum('Y','N') COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'N',
  `ownerId` int(11) DEFAULT NULL,
  `gameInterior` int(11) DEFAULT NULL,
  `type` enum('house','business_passive','business_active','building','garage','building2','rentable') COLLATE utf8_hungarian_ci DEFAULT NULL,
  `dummy` enum('Y','N') COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'N',
  `name` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `price` int(22) DEFAULT NULL,
  `entrance_position` varchar(256) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `entrance_rotation` varchar(256) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `entrance_interior` int(11) DEFAULT NULL,
  `entrance_dimension` int(11) DEFAULT NULL,
  `exit_position` varchar(256) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `exit_rotation` varchar(256) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `exit_interior` int(11) DEFAULT NULL,
  `exit_dimension` int(11) DEFAULT NULL,
  `locked` enum('Y','N') COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'N',
  `renewalTime` int(11) DEFAULT '0',
  `lastReport` varchar(255) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '0',
  `editable` varchar(5) COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'N',
  `crypto` varchar(20000) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `interiors`
--

INSERT INTO `interiors` (`interiorId`, `flag`, `deleted`, `ownerId`, `gameInterior`, `type`, `dummy`, `name`, `price`, `entrance_position`, `entrance_rotation`, `entrance_interior`, `entrance_dimension`, `exit_position`, `exit_rotation`, `exit_interior`, `exit_dimension`, `locked`, `renewalTime`, `lastReport`, `editable`, `crypto`) VALUES
(1, 'dynamic', 'N', 0, 113, 'building', 'N', 'Binco', 1, '1655.98828125,1733.5157470703,10.82811164856', '-0,0,269.72213745117', 0, 0, '207.543,-109.004,1005.133', '0,0,0', 15, 1, 'N', 0, '0', 'N', NULL),
(2, 'dynamic', 'N', 0, 38, 'building', 'N', 'Városháza', 1, '1042.8999023438,1011.1130371094,11', '-0,0,147.39016723633', 0, 0, '390.7685546875,173.8505859375,1008.3828125', '0,0,0', 3, 2, 'N', 0, '0', 'N', NULL),
(3, 'dynamic', 'N', 0, 38, 'building', 'N', 'Városháza (Hátsó)', 1, '997.35900878906,1068.0837402344,10.8203125', '-0,0,181.64753723145', 0, 0, '358.06716918945,216.97450256348,1008.3828125', '-0,0,352.70172119141', 3, 2, 'N', 0, '0', 'N', NULL),
(4, 'dynamic', 'Y', 4, 10, 'house', 'N', 'a', 1, '1014.1387939453,2317.7658691406,10.8203125', '-0,0,176.62413024902', 0, 0, '2216.54,-1076.29,1050.484', '0,0,0', 1, 4, 'N', 0, '0', 'N', NULL),
(5, 'dynamic', 'N', 0, 21, 'building', 'N', 'Gyár', 0, '967.67749023438,2160.416015625,10.8203125', '-0,0,49.406074523926', 0, 0, '2541.5400390625,-1303.8642578125,1025.0703125', '0,0,0', 2, 5, 'N', 0, '0', 'N', NULL),
(6, 'dynamic', 'Y', 0, 102, 'building', 'N', 'LVSD', 0, '939.02807617188,1733.1904296875,8.8515625', '-0,0,91.157455444336', 0, 0, '1133.158203125,-15.0625,1000.6796875', '0,0,0', 12, 6, 'N', 0, '0', 'N', NULL),
(7, 'dynamic', 'Y', 0, 35, 'building', 'N', 'LVSD', 0, '939.20831298828,1733.333984375,8.8515625', '-0,0,91.447593688965', 0, 0, '939.38433837891,1736.9754638672,8.8515625', '-0,0,94.629669189453', 0, 0, 'N', 0, '0', 'N', NULL),
(8, 'dynamic', 'Y', 0, 136, 'garage', 'N', 'LVSD Garázs', 1, '956.59796142578,1656.3265380859,8.6484375', '-0,0,85.495460510254', 0, 0, '608.2451171875,-5.7783203125,1000.9193115234', '0,0,270', 1, 8, 'N', 0, '0', 'N', NULL),
(9, 'dynamic', 'Y', 0, 135, 'garage', 'N', 'LVSD Garázs', 1, '954.18572998047,1655.9686279297,8.6484375', '-0,0,357.44668579102', 0, 0, '613.193359375,-76.302734375,998', '0,0,270', 2, 9, 'N', 0, '0', 'N', NULL),
(10, 'dynamic', 'Y', 0, 134, 'garage', 'N', 'LVSD Garázs', 1, '957.88232421875,1656.6458740234,8.6548767089844', '-0,0,349.99914550781', 0, 0, '614.3889,-124.0991,997.995', '0,0,270', 3, 10, 'N', 0, '0', 'N', NULL),
(11, 'dynamic', 'Y', 0, 136, 'garage', 'N', 'Garázs - Nagy', 180000, '953.33599853516,1657.2454833984,8.6484375', '-0,0,37.939601898193', 0, 0, '608.2451171875,-5.7783203125,1000.9193115234', '0,0,270', 1, 11, 'N', 0, '0', 'N', NULL),
(12, 'dynamic', 'N', 0, 35, 'building', 'N', 'LVSD', 0, '939.85919189453,1733.2209472656,8.8515625', '-0,0,91.448867797852', 0, 0, '238.56596374512,139.46188354492,1003.0234375', '-0,0,183.61782836914', 3, 12, 'N', 0, '0', 'N', NULL),
(13, 'dynamic', 'Y', 0, 102, 'building', 'N', 'Lift', 1, '940.05609130859,1736.3309326172,8.8515625', '-0,0,90.195503234863', 0, 0, '1133.158203125,-15.0625,1000.6796875', '0,0,0', 12, 13, 'N', 0, '0', 'N', NULL),
(14, 'dynamic', 'Y', 0, 91, 'building2', 'N', 'The Four Dragons Casino', 1, '2020.6573486328,1007.8120117188,10.8203125', '-0,0,89.204818725586', 0, 0, '2018.384765625,1017.8740234375,996.875', '0,0,0', 10, 14, 'N', 0, '0', 'N', NULL),
(15, 'dynamic', 'N', 3, 121, 'building2', 'N', 'Benzinkút', 1, '2117.4294433594,897.60656738281,11.1796875', '-0,0,180.40643310547', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 15, 'N', 0, '0', 'N', NULL),
(16, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '1600.2213134766,2220.8447265625,11.0625', '-0,0,45.695289611816', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 16, 'N', 0, '0', 'N', NULL),
(17, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '638.51654052734,1683.9675292969,7.1875', '-0,0,223.35694885254', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 17, 'N', 0, '0', 'N', NULL),
(18, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '310.87762451172,2544.1853027344,16.814741134644', '-0,0,1.5147423744202', 0, 0, '310.94104003906,2546.7834472656,16.847999572754', '-0,0,0.8880723118782', 0, 0, 'N', 0, '0', 'N', NULL),
(19, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '-1465.7121582031,1872.9522705078,32.6328125', '-0,0,2.4772865772247', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 19, 'N', 0, '0', 'N', NULL),
(20, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '-1319.9688720703,2697.8071289062,50.26628112793', '-0,0,35.691032409668', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 20, 'N', 0, '0', 'N', NULL),
(21, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '2150.6989746094,2735.0114746094,11.176349639893', '-0,0,177.94564819336', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 21, 'N', 0, '0', 'N', NULL),
(22, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '2188.8044433594,2469.671875,11.2421875', '-0,0,98.068290710449', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 22, 'N', 0, '0', 'N', NULL),
(23, 'dynamic', 'N', 0, 121, 'building2', 'N', 'Benzinkút', 1, '2637.3334960938,1128.5700683594,11.1796875', '-0,0,357.80065917969', 0, 0, '-25.8740234375,-140.95703125,1003.546875', '0,0,0', 16, 23, 'N', 0, '0', 'N', NULL),
(24, 'dynamic', 'N', 4, 10, 'house', 'N', 'Ház', 1, '-377.33117675781,2242.3332519531,42.618461608887', '-0,0,285.91458129883', 0, 0, '2216.54,-1076.29,1050.484', '0,0,0', 1, 24, 'N', 0, '0', 'N', NULL),
(25, 'dynamic', 'N', 0, 10, 'building2', 'N', 'Korház', 1, '1607.2268066406,1817.2518310547,10.8203125', '-0,0,183.80914306641', 0, 0, '1599.1090087891,1812.9360351562,-18.8984375', '-0,0,356.09741210938', 0, 0, 'N', 0, '0', 'N', NULL),
(26, 'dynamic', 'N', 9, 10, 'house', 'N', 'Devinti', 1, '2056.3454589844,2384.0830078125,150.4765625', '-0,0,146.3087310791', 0, 0, '2216.54,-1076.29,1050.484', '0,0,0', 1, 26, 'N', 0, '0', 'N', NULL),
(27, 'dynamic', 'N', 3, 134, 'garage', 'N', 'LVMC - Garázs', 1800, '1642.0263671875,1781.9855957031,-18.8984375', '-0,0,357.99212646484', 0, 0, '1613.6163330078,1721.0423583984,10.8203125', '-0,0,8.9437198638916', 0, 0, 'N', 0, '0', 'N', NULL),
(28, 'dynamic', 'N', 0, 45, 'building', 'N', 'Lottó', 1, '662.53784179688,1717.1005859375,7.1875', '-0,0,218.27629089355', 0, 0, '834.66796875,7.306640625,1004.1870117188', '0,0,0', 3, 28, 'N', 0, '0', 'N', NULL),
(29, 'dynamic', 'N', 0, 35, 'building', 'N', 'LVMPD', 1, '2290.0729980469,2429.7431640625,10.8203125', '-0,0,0.31133118271828', 0, 0, '288.8291015625,166.921875,1007.171875', '0,0,0', 3, 29, 'N', 0, '0', 'N', NULL),
(30, 'dynamic', 'Y', 3, 1, 'house', 'N', '1', 1, '-390.88879394531,2237.763671875,42.4296875', '-0,0,155.8807220459', 0, 0, '49.118408203125,2036.1026297164,51.139388236403', '0,0,270', 1, 30, 'N', 0, '0', '7x7', NULL),
(31, 'dynamic', 'Y', 9, 1, 'house', 'N', 'asd', 1, '-387.2092590332,2234.119140625,42.350250244141', '-0,0,235.46658325195', 0, 0, '52.323665618896,2036.1026297164,51.139388236403', '0,0,270', 1, 31, 'N', 0, '0', '10x10', NULL),
(32, 'dynamic', 'Y', 0, 35, 'building', 'N', 'LVMPD', 1, '-216.78045654297,978.99560546875,19.497980117798', '-0,0,86.216941833496', 0, 0, '288.8291015625,166.921875,1007.171875', '0,0,0', 3, 32, 'N', 0, '0', 'N', NULL),
(33, 'dynamic', 'N', 0, 35, 'building', 'N', 'LVSD', 1, '-216.68238830566,978.91375732422,19.497295379639', '-0,0,297.62298583984', 0, 0, '288.8291015625,166.921875,1007.171875', '0,0,0', 3, 33, 'N', 0, '0', 'N', NULL),
(34, 'dynamic', 'Y', 4, 107, 'garage', 'N', 'Garázs', 1, '-392.52130126953,2247.0297851562,42.422317504883', '-0,0,347.26016235352', 0, 0, '2324.499,-1147.071,1050.71', '0,0,0', 13, 34, 'N', 0, '0', 'N', NULL),
(35, 'dynamic', 'N', 4, 136, 'garage', 'N', 'Garázs - Nagy', 180000, '-392.52258300781,2247.2036132812,42.420791625977', '-0,0,146.0267791748', 0, 0, '608.2451171875,-5.7783203125,1000.9193115234', '0,0,270', 1, 35, 'N', 0, '0', 'N', NULL),
(36, 'dynamic', 'N', 0, 10, 'building', 'N', 'Öltöző', 1, '1025.4217529297,1309.1893310547,10.8203125', '-0,0,178.42294311523', 0, 0, '1025.3438720703,1306.9210205078,10.89999961853', '-0,0,189.70309448242', 0, 0, 'N', 0, '0', 'N', NULL),
(37, 'dynamic', 'Y', 0, 56, 'house', 'N', 'LCN', 0, '1456.9470214844,2773.1479492188,10.8203125', '-0,0,91.141105651855', 0, 0, '1272.9116,-768.9028,1090.5097', '0,0,0', 5, 37, 'N', 0, '0', 'N', NULL),
(38, 'dynamic', 'N', 20, 79, 'house', 'N', 'LCN', 0, '1457.2770996094,2773.326171875,10.8203125', '-0,0,88.455360412598', 0, 0, '234.220703125,1064.42578125,1084.2111816406', '0,0,0', 6, 38, 'N', 0, '0', 'N', NULL),
(39, 'dynamic', 'N', 0, 34, 'building', 'N', 'lift', 1, '235.61628723145,139.21044921875,1003.0234375', '-0,0,178.92004394531', 3, 12, '938.81756591797,1733.2860107422,15.794094085693', '-0,0,91.303916931152', 0, 0, 'N', 0, '0', 'N', NULL),
(40, 'dynamic', 'N', 85, 62, 'house', 'N', 'CDS', 1, '1678.3392333984,2691.5417480469,10.8203125', '-0,0,179.8748626709', 0, 0, '140.5107421875,1365.939453125,1083.859375', '0,0,0', 5, 40, 'N', 0, '0', 'N', NULL),
(41, 'dynamic', 'N', 4, 136, 'garage', 'N', 'Hell Gang', 0, '641.84637451172,1238.2640380859,11.67474937439', '-0,0,122.79293060303', 0, 0, '608.2451171875,-5.7783203125,1000.9193115234', '0,0,270', 1, 41, 'N', 0, '0', 'N', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `interior_datas`
--

CREATE TABLE `interior_datas` (
  `interiorId` int(11) NOT NULL,
  `paidCash` int(11) NOT NULL DEFAULT '0',
  `interiorData` longtext COLLATE utf8_hungarian_ci NOT NULL,
  `dynamicData` varchar(255) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `unlockedPP` varchar(255) COLLATE utf8_hungarian_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `items`
--

CREATE TABLE `items` (
  `dbID` int(11) NOT NULL,
  `itemId` int(3) NOT NULL DEFAULT '1',
  `slot` int(3) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '1',
  `data1` varchar(1024) COLLATE utf8_hungarian_ci DEFAULT '0',
  `data2` varchar(255) COLLATE utf8_hungarian_ci DEFAULT '0',
  `data3` varchar(255) COLLATE utf8_hungarian_ci DEFAULT '0',
  `nameTag` varchar(64) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `serial` int(11) NOT NULL DEFAULT '0',
  `ownerType` varchar(32) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `ownerId` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `items`
--

INSERT INTO `items` (`dbID`, `itemId`, `slot`, `amount`, `data1`, `data2`, `data3`, `nameTag`, `serial`, `ownerType`, `ownerId`) VALUES
(1, 382, 0, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(2, 1, 50, 1, '2', NULL, NULL, NULL, 0, 'player', 1),
(3, 348, 10, 1, '0', NULL, NULL, NULL, 0, 'player', 1),
(4, 385, 1, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(5, 385, 2, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(6, 385, 3, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(7, 385, 4, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(8, 385, 5, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(9, 385, 6, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(11, 193, 7, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(12, 193, 8, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(13, 282, 9, 1, '0', '0', '0', NULL, 1825953, 'player', 1),
(14, 383, 11, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(15, 383, 12, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(16, 383, 13, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(17, 383, 14, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(18, 384, 15, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(19, 384, 16, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(20, 384, 17, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(21, 384, 18, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(22, 384, 19, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(41, 109, 21, 1438, '0', NULL, NULL, NULL, 0, 'player', 1),
(40, 273, 20, 1, '0', NULL, NULL, NULL, 1825958, 'player', 1),
(25, 113, 22, 532, '0', NULL, NULL, NULL, 0, 'player', 1),
(27, 9, 23, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(28, 1, 51, 1, '3', NULL, NULL, NULL, 0, 'player', 1),
(29, 17, 24, 1, NULL, NULL, NULL, NULL, 0, 'player', 1),
(30, 2, 52, 1, '732', NULL, NULL, NULL, 0, 'player', 1),
(31, 1, 53, 1, '4', NULL, NULL, NULL, 0, 'player', 1),
(32, 1, 54, 1, '5', NULL, NULL, NULL, 0, 'player', 1),
(33, 1, 50, 1, '6', NULL, NULL, NULL, 0, 'player', 3),
(43, 86, 25, 1, '0', NULL, NULL, NULL, 1825959, 'player', 1),
(37, 78, 32, 1, NULL, NULL, NULL, NULL, 1825957, 'object', 1),
(38, 109, 22, 105, NULL, NULL, NULL, NULL, 0, 'object', 1),
(44, 81, 26, 1, '6', NULL, NULL, NULL, 1825960, 'player', 1),
(45, 114, 27, 1324, '0', NULL, NULL, NULL, 0, 'player', 1),
(47, 1, 50, 1, '7', NULL, NULL, NULL, 0, 'player', 4),
(162, 280, 4, 1, '0', '0', '0', NULL, 1825977, 'player', 5),
(49, 156, 0, 33, NULL, NULL, NULL, NULL, 0, 'player', 5),
(160, 9, 11, 1, '38763147542', NULL, NULL, NULL, 0, 'player', 6),
(152, 1, 52, 1, '18', NULL, NULL, NULL, 0, 'player', 6),
(52, 1, 51, 1, '8', NULL, NULL, NULL, 0, 'player', 3),
(53, 2, 51, 1, '41', NULL, NULL, NULL, 0, 'player', 4),
(54, 2, 52, 1, '510', NULL, NULL, NULL, 0, 'player', 4),
(144, 110, 4, 1500, '0', NULL, NULL, NULL, 0, 'player', 7),
(56, 1, 50, 1, '9', NULL, NULL, NULL, 0, 'player', 5),
(148, 132, 5, 1, '0', '0', '0', NULL, 0, 'player', 4),
(58, 1, 52, 1, '10', NULL, NULL, NULL, 0, 'player', 3),
(59, 207, 100, 1, '-1;Hektor Oak', '161', '2023.4.27', NULL, 0, 'player', 4),
(149, 135, 6, 1, '0', '0', '0', NULL, 0, 'player', 4),
(61, 207, 101, 1, '-1;Hektor Oak', '161', '2023.4.27', NULL, 0, 'player', 4),
(65, 154, 53, 1, '1', NULL, NULL, NULL, 0, 'player', 4),
(150, 135, 7, 1, '0', '0', '0', NULL, 0, 'player', 4),
(154, 113, 1, 908, '0', NULL, NULL, NULL, 0, 'player', 5),
(71, 156, 40, 41, NULL, NULL, NULL, NULL, 0, 'player', 6),
(73, 85, 0, 1, NULL, NULL, NULL, NULL, 1825962, 'object', 1),
(74, 82, 1, 1, NULL, NULL, NULL, NULL, 1825963, 'object', 1),
(75, 85, 4, 1, '0', '0', '0', NULL, 1825964, 'object', 1),
(76, 85, 20, 1, '0', '0', '0', NULL, 1825965, 'object', 1),
(77, 85, 30, 1, '0', '0', '0', NULL, 1825966, 'object', 1),
(78, 85, 40, 1, '0', '0', '0', NULL, 1825967, 'object', 1),
(79, 82, 11, 1, '0', '0', '0', NULL, 1825968, 'object', 1),
(80, 82, 21, 1, '0', '0', '0', NULL, 1825969, 'object', 1),
(81, 82, 31, 1, '0', '0', '0', NULL, 1825970, 'object', 1),
(82, 82, 41, 1, '0', '0', '0', NULL, 1825971, 'object', 1),
(83, 143, 1, 1, '0', '0', '0', NULL, 0, 'player', 6),
(84, 112, 2, 350, NULL, NULL, NULL, NULL, 0, 'object', 1),
(85, 110, 5, 264, NULL, NULL, NULL, NULL, 0, 'object', 1),
(86, 150, 2, 1, '0', '0', '0', NULL, 0, 'player', 6),
(87, 129, 0, 1, '0', '0', '0', NULL, 0, 'player', 6),
(88, 7, 3, 1, '0', '0', '54', NULL, 0, 'player', 6),
(147, 1, 50, 1, '16', NULL, NULL, NULL, 0, 'player', 7),
(90, 207, 100, 1, '-1;Williem Smithe', '1', '2023.4.27', NULL, 0, 'player', 6),
(91, 265, 0, 1, '15', NULL, NULL, NULL, 1825972, 'player', 3),
(92, 110, 1, 316, NULL, NULL, NULL, NULL, 0, 'player', 3),
(145, 146, 4, 1, '0', '0', '0', NULL, 0, 'player', 4),
(94, 1, 54, 1, '11', NULL, NULL, NULL, 0, 'player', 4),
(161, 8, 3, 1, '0', '0', '57', NULL, 0, 'player', 5),
(102, 1, 56, 1, '13', NULL, NULL, NULL, 0, 'player', 4),
(97, 1, 55, 1, '12', NULL, NULL, NULL, 0, 'player', 4),
(156, 65, 10, 1, '0', NULL, NULL, NULL, 0, 'player', 6),
(104, 86, 0, 1, '0', NULL, NULL, NULL, 1825974, 'vehicle', 10),
(103, 1, 50, 1, '14', NULL, NULL, NULL, 0, 'player', 6),
(105, 113, 1, 10000, '0', NULL, NULL, NULL, 0, 'player', 7),
(106, 1, 50, 1, '15', NULL, NULL, NULL, 0, 'player', 9),
(108, 156, 2, 2, NULL, NULL, NULL, NULL, 0, 'player', 4),
(143, 7, 3, 1, '0', '0', '4', NULL, 0, 'player', 4),
(110, 156, 0, 3, NULL, NULL, NULL, NULL, 0, 'player', 9),
(111, 315, 2, 1, '0', NULL, NULL, NULL, 0, 'player', 7),
(112, 190, 3, 10, '0', NULL, NULL, NULL, 0, 'player', 7),
(113, 7, 4, 1, '0', '0', '39', NULL, 0, 'player', 6),
(146, 2, 51, 1, '903', NULL, NULL, NULL, 0, 'player', 6),
(123, 8, 5, 1, '0', '0', '37', NULL, 0, 'player', 6),
(117, 135, 1, 1, '0', '0', '0', NULL, 0, 'player', 9),
(118, 271, 0, 1, '0', NULL, NULL, 'COCK', 1825975, 'player', 7),
(153, 86, 2, 1, '11', NULL, NULL, NULL, 1825976, 'player', 5),
(151, 1, 50, 1, '17', NULL, NULL, NULL, 0, 'player', 11),
(121, 9, 2, 1, '38763465512', NULL, NULL, NULL, 0, 'player', 3),
(127, 150, 49, 1, NULL, NULL, NULL, NULL, 0, 'player', 4),
(124, 150, 48, 1, '0', '0', '0', NULL, 0, 'player', 4),
(125, 6, 32, 1, '0', '0', '87', NULL, 0, 'player', 1),
(128, 132, 2, 1, '0', '0', '0', NULL, 0, 'player', 9),
(129, 110, 3, 300, NULL, NULL, NULL, NULL, 0, 'object', 1),
(130, 145, 3, 1, '0', '0', '0', NULL, 0, 'player', 9),
(131, 141, 4, 1, '0', '0', '0', NULL, 0, 'player', 9),
(132, 149, 5, 1, '0', '0', '6', NULL, 0, 'player', 9),
(133, 241, 6, 1, '0', '0', '0', NULL, 0, 'player', 9),
(134, 17, 6, 1, '0', NULL, NULL, NULL, 0, 'player', 6),
(135, 150, 7, 1, '0', '0', '0', NULL, 0, 'player', 6),
(136, 2, 51, 1, '452', NULL, NULL, NULL, 0, 'player', 9),
(138, 144, 0, 1, '0', '0', '0', NULL, 0, 'player', 4),
(139, 145, 8, 1, '0', '0', '0', NULL, 0, 'player', 6),
(141, 8, 1, 1, '0', '0', '5', NULL, 0, 'player', 4),
(142, 153, 9, 1, '0', '0', '0', NULL, 0, 'player', 6),
(165, 155, 28, 1, NULL, NULL, NULL, NULL, 1825978, 'player', 1),
(169, 86, 13, 1, '0', NULL, NULL, NULL, 1825979, 'player', 3),
(168, 7, 7, 1, '0', '0', '24', NULL, 0, 'player', 5),
(170, 86, 0, 1, '0', NULL, NULL, NULL, 1825980, 'player', 12),
(171, 113, 5, 392, '0', NULL, NULL, NULL, 0, 'player', 3),
(172, 113, 1, 452, '0', NULL, NULL, NULL, 0, 'player', 12),
(173, 240, 2, 1, '0', NULL, NULL, NULL, 0, 'player', 12);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `log_adminjail`
--

CREATE TABLE `log_adminjail` (
  `logId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountId` int(11) NOT NULL,
  `adminName` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `reason` text COLLATE utf8_hungarian_ci NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `log_command`
--

CREATE TABLE `log_command` (
  `logId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `characterId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `mtaSerial` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `ipAddress` varchar(128) COLLATE utf8_hungarian_ci NOT NULL,
  `command` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `arguments` varchar(512) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `log_command`
--

INSERT INTO `log_command` (`logId`, `date`, `characterId`, `accountId`, `mtaSerial`, `ipAddress`, `command`, `arguments`) VALUES
(1, '2023-03-26 14:43:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'vhspawn', 'Yeezy Carlos'),
(2, '2023-03-26 14:44:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'Admin | 9'),
(3, '2023-03-26 14:44:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminnick', 'Admin | yeezy'),
(4, '2023-03-26 14:50:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(5, '2023-03-26 14:50:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(6, '2023-03-26 14:53:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(7, '2023-03-26 14:53:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(8, '2023-03-26 14:53:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(9, '2023-03-26 14:53:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(10, '2023-03-26 14:53:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(11, '2023-03-26 14:53:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(12, '2023-03-26 14:54:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 382 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(13, '2023-03-26 14:56:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(14, '2023-03-26 14:57:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(15, '2023-03-26 14:59:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'makeveh', '426'),
(16, '2023-03-26 15:04:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(17, '2023-03-26 15:19:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'delveh', '1'),
(18, '2023-03-26 15:19:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(19, '2023-03-26 15:46:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'Yeezy Carlos | 7'),
(20, '2023-03-26 15:55:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Yeezy Carlos'),
(21, '2023-03-26 16:33:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 385 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(22, '2023-03-26 16:33:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 385 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(23, '2023-03-26 16:33:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 385 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(24, '2023-03-26 16:33:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 385 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(25, '2023-03-26 16:33:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 385 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(26, '2023-03-26 16:33:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 385 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(27, '2023-03-26 16:37:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 193 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(28, '2023-03-26 16:37:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 193 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(29, '2023-03-26 16:37:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 383 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(30, '2023-03-26 16:37:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 383 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(31, '2023-03-26 16:37:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 383 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(32, '2023-03-26 16:37:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 383 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(33, '2023-03-26 16:37:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 384 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(34, '2023-03-26 16:37:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 384 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(35, '2023-03-26 16:37:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 384 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(36, '2023-03-26 16:37:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 384 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(37, '2023-03-26 16:37:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 384 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(38, '2023-03-26 17:31:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '2'),
(39, '2023-03-26 17:33:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(40, '2023-03-26 17:43:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(41, '2023-03-26 17:45:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(42, '2023-03-26 17:48:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(43, '2023-03-26 17:48:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(44, '2023-03-26 17:48:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(45, '2023-03-26 17:53:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'yeezy | 11'),
(46, '2023-03-26 17:53:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'yeezy | 10'),
(47, '2023-03-26 17:54:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(48, '2023-03-26 17:55:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(49, '2023-03-26 17:57:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(50, '2023-03-26 17:59:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unflip', 'yeezy | 2'),
(51, '2023-03-26 18:01:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(52, '2023-03-26 18:09:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(53, '2023-03-27 11:38:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '2'),
(54, '2023-03-27 11:39:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(55, '2023-03-27 11:44:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 9 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(56, '2023-03-27 11:54:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'deleteInterior', '13'),
(57, '2023-03-27 12:06:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'akspawn', 'yeezy'),
(58, '2023-03-27 12:41:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'gethere', 'Brown Josh'),
(59, '2023-03-27 12:42:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'Brown Josh | 7'),
(60, '2023-03-27 12:42:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminnick', 'Brown Josh | Ryder'),
(61, '2023-03-27 12:42:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Ryder | 301'),
(62, '2023-03-27 12:42:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Ryder | 300'),
(63, '2023-03-27 12:44:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '2'),
(64, '2023-03-27 12:44:41', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 17 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(65, '2023-03-27 12:46:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(66, '2023-03-27 12:46:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(67, '2023-03-27 12:46:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(68, '2023-03-27 12:47:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(69, '2023-03-27 12:48:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(70, '2023-03-27 12:48:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(71, '2023-03-27 12:48:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(72, '2023-03-27 12:49:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'lockInterior', 'id: 732 | locked: N | adminDuty: 1'),
(73, '2023-03-27 12:49:12', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'yeezy'),
(74, '2023-03-27 12:49:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unfreeze', 'Ryder'),
(75, '2023-03-27 12:49:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unfreeze', 'yeezy'),
(76, '2023-03-27 12:49:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'yeezy'),
(77, '2023-03-27 12:50:46', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '29 | 17 | 1 | player | 4 | player | 1'),
(78, '2023-03-27 12:51:59', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setadminlevel', 'Xi Len | 10'),
(79, '2023-03-27 12:52:28', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'Ryder Oak'),
(80, '2023-03-27 12:52:34', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'unfreeze', 'Xi Len'),
(81, '2023-03-27 12:52:43', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Admin'),
(82, '2023-03-27 12:52:47', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'makeveh', '445'),
(83, '2023-03-27 12:53:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Ryder Oak'),
(84, '2023-03-27 12:54:26', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Ryder'),
(85, '2023-03-27 12:56:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setadminnick', 'Admin | Kevlar'),
(86, '2023-03-27 12:57:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 4'),
(87, '2023-03-27 12:57:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'fixveh', 'Yeezy Carlos | 4'),
(88, '2023-03-27 12:59:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(89, '2023-03-27 12:59:35', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'gethere', 'Yeezy Carlos'),
(90, '2023-03-27 13:01:09', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 262'),
(91, '2023-03-27 13:01:11', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 263'),
(92, '2023-03-27 13:01:12', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 264'),
(93, '2023-03-27 13:01:14', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 265'),
(94, '2023-03-27 13:01:17', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 252'),
(95, '2023-03-27 13:01:21', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 253'),
(96, '2023-03-27 13:01:27', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 250'),
(97, '2023-03-27 13:01:29', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 244'),
(98, '2023-03-27 13:01:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 243'),
(99, '2023-03-27 13:01:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 242'),
(100, '2023-03-27 13:01:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 240'),
(101, '2023-03-27 13:01:34', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 241'),
(102, '2023-03-27 13:01:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 230'),
(103, '2023-03-27 13:01:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 231'),
(104, '2023-03-27 13:01:38', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 233'),
(105, '2023-03-27 13:01:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 234'),
(106, '2023-03-27 13:01:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 235'),
(107, '2023-03-27 13:01:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 234'),
(108, '2023-03-27 13:01:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 235'),
(109, '2023-03-27 13:01:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 234'),
(110, '2023-03-27 13:01:52', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 235'),
(111, '2023-03-27 13:01:54', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 233'),
(112, '2023-03-27 13:01:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 232'),
(113, '2023-03-27 13:01:56', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 232'),
(114, '2023-03-27 13:01:57', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 231'),
(115, '2023-03-27 13:01:58', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 230'),
(116, '2023-03-27 13:02:19', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 229'),
(117, '2023-03-27 13:02:20', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 28'),
(118, '2023-03-27 13:02:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 228'),
(119, '2023-03-27 13:02:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 227'),
(120, '2023-03-27 13:03:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 135'),
(121, '2023-03-27 13:03:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 134'),
(122, '2023-03-27 13:03:34', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 133'),
(123, '2023-03-27 13:03:35', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 132'),
(124, '2023-03-27 13:03:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 132'),
(125, '2023-03-27 13:03:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 131'),
(126, '2023-03-27 13:03:41', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 130'),
(127, '2023-03-27 13:03:44', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 236'),
(128, '2023-03-27 13:03:45', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 237'),
(129, '2023-03-27 13:03:47', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 235'),
(130, '2023-03-27 13:03:53', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 22'),
(131, '2023-03-27 13:03:57', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 27'),
(132, '2023-03-27 13:03:59', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 29'),
(133, '2023-03-27 13:04:02', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 58'),
(134, '2023-03-27 13:04:04', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 60'),
(135, '2023-03-27 13:04:05', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 61'),
(136, '2023-03-27 13:04:06', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 62'),
(137, '2023-03-27 13:04:08', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 63'),
(138, '2023-03-27 13:04:10', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 67'),
(139, '2023-03-27 13:04:11', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 69'),
(140, '2023-03-27 13:04:13', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 77'),
(141, '2023-03-27 13:04:14', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 78'),
(142, '2023-03-27 13:04:15', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 79'),
(143, '2023-03-27 13:04:21', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 80'),
(144, '2023-03-27 13:04:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 81'),
(145, '2023-03-27 13:04:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 82'),
(146, '2023-03-27 13:04:26', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 83'),
(147, '2023-03-27 13:04:27', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 84'),
(148, '2023-03-27 13:04:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 85'),
(149, '2023-03-27 13:04:29', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 86'),
(150, '2023-03-27 13:04:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 87'),
(151, '2023-03-27 13:04:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 88'),
(152, '2023-03-27 13:04:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 89'),
(153, '2023-03-27 13:04:35', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 90'),
(154, '2023-03-27 13:04:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 91'),
(155, '2023-03-27 13:04:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 92'),
(156, '2023-03-27 13:04:38', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 93'),
(157, '2023-03-27 13:04:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 94'),
(158, '2023-03-27 13:04:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 95'),
(159, '2023-03-27 13:04:41', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 96'),
(160, '2023-03-27 13:04:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 97'),
(161, '2023-03-27 13:04:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 98'),
(162, '2023-03-27 13:04:44', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 99'),
(163, '2023-03-27 13:04:46', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 100'),
(164, '2023-03-27 13:04:47', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 101'),
(165, '2023-03-27 13:04:48', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 102'),
(166, '2023-03-27 13:04:50', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 103'),
(167, '2023-03-27 13:04:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 104'),
(168, '2023-03-27 13:04:52', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 105'),
(169, '2023-03-27 13:04:53', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 106'),
(170, '2023-03-27 13:04:56', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 120'),
(171, '2023-03-27 13:04:59', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 121'),
(172, '2023-03-27 13:05:00', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 122'),
(173, '2023-03-27 13:05:01', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 123'),
(174, '2023-03-27 13:05:02', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 124'),
(175, '2023-03-27 13:05:03', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 125'),
(176, '2023-03-27 13:05:05', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 126'),
(177, '2023-03-27 13:05:06', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 125'),
(178, '2023-03-27 13:05:20', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 130'),
(179, '2023-03-27 13:05:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 131'),
(180, '2023-03-27 13:05:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 132'),
(181, '2023-03-27 13:05:25', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 133'),
(182, '2023-03-27 13:05:26', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 138'),
(183, '2023-03-27 13:05:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 140'),
(184, '2023-03-27 13:05:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 141'),
(185, '2023-03-27 13:05:34', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 142'),
(186, '2023-03-27 13:05:35', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 143'),
(187, '2023-03-27 13:05:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 147'),
(188, '2023-03-27 13:05:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 300'),
(189, '2023-03-27 13:05:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 301'),
(190, '2023-03-27 13:05:41', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 302'),
(191, '2023-03-27 13:05:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 303'),
(192, '2023-03-27 13:05:43', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 304'),
(193, '2023-03-27 13:05:44', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 305'),
(194, '2023-03-27 13:05:45', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 30'),
(195, '2023-03-27 13:05:47', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 31'),
(196, '2023-03-27 13:05:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 31'),
(197, '2023-03-27 13:05:53', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 32'),
(198, '2023-03-27 13:05:54', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 33'),
(199, '2023-03-27 13:05:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 34'),
(200, '2023-03-27 13:05:56', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 30'),
(201, '2023-03-27 13:05:58', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 31'),
(202, '2023-03-27 13:06:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(203, '2023-03-27 13:08:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(204, '2023-03-27 13:08:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Yeezy Carlos'),
(205, '2023-03-27 13:08:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Kevlar'),
(206, '2023-03-27 13:11:13', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(207, '2023-03-27 13:12:07', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(208, '2023-03-27 13:12:34', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'getveh', '4'),
(209, '2023-03-27 13:13:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Jessica Oak'),
(210, '2023-03-27 13:13:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 206 | amount: 1 | data1: Yeezy | data2: Botibaszo_egyseg | data3: nil'),
(211, '2023-03-27 13:14:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Jessica Oak'),
(212, '2023-03-27 13:15:49', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 85 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(213, '2023-03-27 13:15:52', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 110 | amount: 60 | data1: nil | data2: nil | data3: nil'),
(214, '2023-03-27 13:16:13', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Yeezy Carlos'),
(215, '2023-03-27 13:17:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'yeezy'),
(216, '2023-03-27 13:17:31', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(217, '2023-03-27 13:17:49', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'yeezy'),
(218, '2023-03-27 13:19:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Xi Len'),
(219, '2023-03-27 13:21:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(220, '2023-03-27 13:22:53', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Jessica Oak'),
(221, '2023-03-27 13:25:04', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'agyogyit', 'Kevlar'),
(222, '2023-03-27 13:25:05', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 78 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(223, '2023-03-27 13:25:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 109 | amount: 125 | data1: nil | data2: nil | data3: nil'),
(224, '2023-03-27 13:25:53', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'sethp', 'Jessica Oak | 0'),
(225, '2023-03-27 13:25:54', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(226, '2023-03-27 13:26:35', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Xi Len'),
(227, '2023-03-27 13:26:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '3'),
(228, '2023-03-27 13:28:46', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 236 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(229, '2023-03-27 13:28:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Jessica Oak'),
(230, '2023-03-27 13:28:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(231, '2023-03-27 13:29:08', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Jessica Oak'),
(232, '2023-03-27 13:29:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unflip', 'yeezy | 3'),
(233, '2023-03-27 13:29:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(234, '2023-03-27 13:29:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(235, '2023-03-27 13:29:38', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Jessica Oak'),
(236, '2023-03-27 13:29:41', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'gethere', 'yeezy'),
(237, '2023-03-27 13:30:58', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Jessica Oak'),
(238, '2023-03-27 13:31:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(239, '2023-03-27 13:32:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(240, '2023-03-27 13:32:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(241, '2023-03-27 13:33:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(242, '2023-03-27 13:34:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(243, '2023-03-27 13:34:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(244, '2023-03-27 13:35:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(245, '2023-03-27 13:35:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(246, '2023-03-27 13:36:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(247, '2023-03-27 13:36:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(248, '2023-03-27 13:38:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(249, '2023-03-27 13:38:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unflip', 'yeezy | 3'),
(250, '2023-03-27 13:38:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 3'),
(251, '2023-03-27 13:39:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'yeezy'),
(252, '2023-03-27 13:39:38', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'unfreeze', 'Jessica Oak'),
(253, '2023-03-27 13:39:48', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(254, '2023-03-27 13:40:27', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Jessica Oak'),
(255, '2023-03-27 13:40:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(256, '2023-03-27 13:40:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(257, '2023-03-27 13:40:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(258, '2023-03-27 13:41:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(259, '2023-03-27 13:42:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 12'),
(260, '2023-03-27 13:42:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 13'),
(261, '2023-03-27 13:42:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 14'),
(262, '2023-03-27 13:42:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 15'),
(263, '2023-03-27 13:42:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 16'),
(264, '2023-03-27 13:42:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 17'),
(265, '2023-03-27 13:42:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 18'),
(266, '2023-03-27 13:42:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 19'),
(267, '2023-03-27 13:42:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 29'),
(268, '2023-03-27 13:42:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 82'),
(269, '2023-03-27 13:42:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 83'),
(270, '2023-03-27 13:43:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 89'),
(271, '2023-03-27 13:43:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 88'),
(272, '2023-03-27 13:43:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 157'),
(273, '2023-03-27 13:43:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 162'),
(274, '2023-03-27 13:43:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 175'),
(275, '2023-03-27 13:43:18', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(276, '2023-03-27 13:43:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 188'),
(277, '2023-03-27 13:43:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 30'),
(278, '2023-03-27 13:43:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 31'),
(279, '2023-03-27 13:43:34', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 32'),
(280, '2023-03-27 13:43:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 34'),
(281, '2023-03-27 13:43:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 35'),
(282, '2023-03-27 13:43:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 1'),
(283, '2023-03-27 13:43:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 2'),
(284, '2023-03-27 13:43:41', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 3'),
(285, '2023-03-27 13:43:43', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 7'),
(286, '2023-03-27 13:43:44', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 8'),
(287, '2023-03-27 13:43:45', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 9'),
(288, '2023-03-27 13:43:46', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 10'),
(289, '2023-03-27 13:43:47', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 11'),
(290, '2023-03-27 13:43:49', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 12'),
(291, '2023-03-27 13:43:50', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 13'),
(292, '2023-03-27 13:43:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 1'),
(293, '2023-03-27 13:43:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 191'),
(294, '2023-03-27 13:43:53', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 14'),
(295, '2023-03-27 13:43:54', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 15'),
(296, '2023-03-27 13:43:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 16'),
(297, '2023-03-27 13:43:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 17'),
(298, '2023-03-27 13:43:56', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 18'),
(299, '2023-03-27 13:43:57', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 19'),
(300, '2023-03-27 13:43:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 199'),
(301, '2023-03-27 13:44:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 198'),
(302, '2023-03-27 13:44:01', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 20'),
(303, '2023-03-27 13:44:03', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 200'),
(304, '2023-03-27 13:44:04', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 201'),
(305, '2023-03-27 13:44:05', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 202'),
(306, '2023-03-27 13:44:06', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 203'),
(307, '2023-03-27 13:44:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 213'),
(308, '2023-03-27 13:44:07', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 204'),
(309, '2023-03-27 13:44:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 214'),
(310, '2023-03-27 13:44:08', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 205'),
(311, '2023-03-27 13:44:09', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 206'),
(312, '2023-03-27 13:44:10', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 207'),
(313, '2023-03-27 13:44:10', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 208'),
(314, '2023-03-27 13:44:11', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 209'),
(315, '2023-03-27 13:44:13', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 210'),
(316, '2023-03-27 13:44:14', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 250'),
(317, '2023-03-27 13:44:15', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 251'),
(318, '2023-03-27 13:44:16', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 252'),
(319, '2023-03-27 13:44:17', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 253'),
(320, '2023-03-27 13:44:18', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 255'),
(321, '2023-03-27 13:44:19', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 256'),
(322, '2023-03-27 13:44:20', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 257'),
(323, '2023-03-27 13:44:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 260'),
(324, '2023-03-27 13:44:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 261'),
(325, '2023-03-27 13:44:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 262'),
(326, '2023-03-27 13:44:35', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Jessica Oak'),
(327, '2023-03-27 13:44:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Jessica Oak'),
(328, '2023-03-27 13:44:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(329, '2023-03-27 13:44:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(330, '2023-03-27 13:44:54', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 31'),
(331, '2023-03-27 13:44:56', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 41'),
(332, '2023-03-27 13:44:58', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 42'),
(333, '2023-03-27 13:45:01', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Jessica Oak | 31'),
(334, '2023-03-27 13:45:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 55'),
(335, '2023-03-27 13:45:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 56'),
(336, '2023-03-27 13:45:25', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 57'),
(337, '2023-03-27 13:45:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 120'),
(338, '2023-03-27 13:45:29', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 121'),
(339, '2023-03-27 13:46:07', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 200'),
(340, '2023-03-27 13:46:08', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 201'),
(341, '2023-03-27 13:46:45', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Hektor Oak'),
(342, '2023-03-27 13:46:48', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Hektor Oak | 230'),
(343, '2023-03-27 13:49:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Hektor Oak'),
(344, '2023-03-27 13:55:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'yeezy'),
(345, '2023-03-27 13:55:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'deleteInterior', '14'),
(346, '2023-03-27 13:56:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'createInterior', '1 | Binco | type: building'),
(347, '2023-03-27 13:57:08', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'sethp', 'Hektor Oak | 99'),
(348, '2023-03-27 13:57:10', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'fixveh', 'Hektor Oak | 7'),
(349, '2023-03-27 13:57:29', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'getveh', '7'),
(350, '2023-03-27 14:05:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'deleteInterior', '14'),
(351, '2023-03-27 14:05:11', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'getveh', '7'),
(352, '2023-03-27 14:08:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'deleteInterior', '13'),
(353, '2023-03-27 14:10:07', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 130'),
(354, '2023-03-27 14:10:09', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 131'),
(355, '2023-03-27 14:10:09', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 132'),
(356, '2023-03-27 14:10:10', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 133'),
(357, '2023-03-27 14:10:12', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 137'),
(358, '2023-03-27 14:10:14', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 140'),
(359, '2023-03-27 14:10:15', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 141'),
(360, '2023-03-27 14:10:16', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 142'),
(361, '2023-03-27 14:10:17', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 147'),
(362, '2023-03-27 14:10:18', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 150'),
(363, '2023-03-27 14:10:19', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 151'),
(364, '2023-03-27 14:10:20', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 154'),
(365, '2023-03-27 14:10:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 156'),
(366, '2023-03-27 14:10:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 159'),
(367, '2023-03-27 14:10:25', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 160'),
(368, '2023-03-27 14:10:26', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 161'),
(369, '2023-03-27 14:10:27', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 162'),
(370, '2023-03-27 14:10:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 163'),
(371, '2023-03-27 14:10:29', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 164'),
(372, '2023-03-27 14:10:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 165'),
(373, '2023-03-27 14:10:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 167'),
(374, '2023-03-27 14:10:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 169'),
(375, '2023-03-27 14:10:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 170'),
(376, '2023-03-27 14:10:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 171'),
(377, '2023-03-27 14:10:43', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 172'),
(378, '2023-03-27 14:10:46', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 167'),
(379, '2023-03-27 14:10:48', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 166'),
(380, '2023-03-27 14:10:49', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 160'),
(381, '2023-03-27 14:10:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setskin', 'Ryder | 161'),
(382, '2023-03-27 14:11:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(383, '2023-03-27 14:12:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'vhspawn', 'Cory Carson'),
(384, '2023-03-27 14:12:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(385, '2023-03-27 14:13:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unfreeze', 'Yeezy Carlos'),
(386, '2023-03-27 14:14:42', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'deleteInterior', '509'),
(387, '2023-03-27 14:15:34', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'vhspawn', 'Ryder'),
(388, '2023-03-27 14:15:48', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'rtc2', '4'),
(389, '2023-03-27 14:16:33', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 156 | amount: 51 | data1: nil | data2: nil | data3: nil'),
(390, '2023-03-27 14:16:43', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '49 | 156 | 50 | player | 4 | player | 5'),
(391, '2023-03-27 14:17:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '50 | 281 | 1 | player | 4 | player | 5'),
(392, '2023-03-27 14:19:10', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'createInterior', '41 | Hell Gang | type: garage'),
(393, '2023-03-27 14:19:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Ernesto D Kevlar'),
(394, '2023-03-27 14:19:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(395, '2023-03-27 14:20:14', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'getveh', '7'),
(396, '2023-03-27 14:20:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'akspawn', 'Cory Carson'),
(397, '2023-03-27 14:21:42', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Ernesto D Kevlar | 304'),
(398, '2023-03-27 14:22:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '3'),
(399, '2023-03-27 14:22:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '3'),
(400, '2023-03-27 14:22:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '2'),
(401, '2023-03-27 14:22:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(402, '2023-03-27 14:24:52', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(403, '2023-03-27 14:25:11', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'makeveh', '445'),
(404, '2023-03-27 14:25:18', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'Cory Carson'),
(405, '2023-03-27 14:25:28', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'makeveh', '445'),
(406, '2023-03-27 14:28:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Williem Smithe'),
(407, '2023-03-27 14:30:08', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'aplatinawardis', '10 | 1'),
(408, '2023-03-27 14:30:29', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(409, '2023-03-27 14:30:31', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Cory Carson'),
(410, '2023-03-27 14:30:39', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'fixveh', 'Ernesto D Kevlar | 10'),
(411, '2023-03-27 14:30:57', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setadminlevel', 'Cory Carson | 1'),
(412, '2023-03-27 14:31:31', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'setadminnick', 'Admin | Cory'),
(413, '2023-03-27 14:32:01', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 162'),
(414, '2023-03-27 14:33:07', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'lockInterior', 'id: 510 | locked: N | adminDuty: 1'),
(415, '2023-03-27 14:33:14', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'unfreeze', 'Ryder'),
(416, '2023-03-27 14:33:54', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'deleteInterior', '14'),
(417, '2023-03-27 14:34:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'lockInterior', 'id: 347 | locked: N | adminDuty: 1'),
(418, '2023-03-27 14:34:16', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'unfreeze', 'Ernesto D Kevlar'),
(419, '2023-03-27 14:34:21', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'unfreeze', 'Daniel Fierro'),
(420, '2023-03-27 14:35:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Williem Smithe'),
(421, '2023-03-27 14:35:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 156 | amount: 50 | data1: nil | data2: nil | data3: nil'),
(422, '2023-03-27 14:35:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 156 | amount: 50 | data1: nil | data2: nil | data3: nil');
INSERT INTO `log_command` (`logId`, `date`, `characterId`, `accountId`, `mtaSerial`, `ipAddress`, `command`, `arguments`) VALUES
(423, '2023-03-27 14:35:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 156 | amount: 50 | data1: nil | data2: nil | data3: nil'),
(424, '2023-03-27 14:35:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 156 | amount: 50 | data1: nil | data2: nil | data3: nil'),
(425, '2023-03-27 14:35:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 156 | amount: 50 | data1: nil | data2: nil | data3: nil'),
(426, '2023-03-27 14:35:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 156 | amount: 50 | data1: nil | data2: nil | data3: nil'),
(427, '2023-03-27 14:35:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '71 | 156 | 50 | player | 1 | player | 6'),
(428, '2023-03-27 14:35:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 85 | amount: 5 | data1: nil | data2: nil | data3: nil'),
(429, '2023-03-27 14:35:37', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 101'),
(430, '2023-03-27 14:35:38', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 140'),
(431, '2023-03-27 14:35:39', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 145'),
(432, '2023-03-27 14:35:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 82 | amount: 5 | data1: nil | data2: nil | data3: nil'),
(433, '2023-03-27 14:35:40', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 147'),
(434, '2023-03-27 14:35:41', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 287'),
(435, '2023-03-27 14:35:42', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 180'),
(436, '2023-03-27 14:35:43', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 190'),
(437, '2023-03-27 14:35:45', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 301'),
(438, '2023-03-27 14:35:46', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 302'),
(439, '2023-03-27 14:35:47', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setskin', 'Kevlar | 304'),
(440, '2023-03-27 14:35:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '73 | 85 | 5 | player | 4 | object | 1'),
(441, '2023-03-27 14:35:52', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '74 | 82 | 5 | player | 4 | object | 1'),
(442, '2023-03-27 14:35:56', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setadminlevel', 'Daniel Fierro | 6'),
(443, '2023-03-27 14:36:03', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 288'),
(444, '2023-03-27 14:36:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc2', '3'),
(445, '2023-03-27 14:36:07', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 286'),
(446, '2023-03-27 14:36:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc2', '4'),
(447, '2023-03-27 14:36:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc2', '5'),
(448, '2023-03-27 14:36:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc2', '6'),
(449, '2023-03-27 14:36:09', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 285'),
(450, '2023-03-27 14:36:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc2', '7'),
(451, '2023-03-27 14:36:12', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 284'),
(452, '2023-03-27 14:36:14', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 283'),
(453, '2023-03-27 14:36:16', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 282'),
(454, '2023-03-27 14:36:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 281'),
(455, '2023-03-27 14:36:23', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 279'),
(456, '2023-03-27 14:36:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 112 | amount: 350 | data1: nil | data2: nil | data3: nil'),
(457, '2023-03-27 14:36:46', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 110 | amount: 300 | data1: nil | data2: nil | data3: nil'),
(458, '2023-03-27 14:36:50', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '84 | 112 | 350 | player | 4 | object | 1'),
(459, '2023-03-27 14:36:52', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '85 | 110 | 300 | player | 4 | object | 1'),
(460, '2023-03-27 14:36:52', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setadminnick', 'Daniel Fierro | Cocky'),
(461, '2023-03-27 14:37:07', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'sethp', 'Hektor Oak | 0'),
(462, '2023-03-27 14:37:09', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Hektor Oak'),
(463, '2023-03-27 14:37:17', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Hektor Oak'),
(464, '2023-03-27 14:37:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '38 | 109 | 105 | player | 4 | object | 1'),
(465, '2023-03-27 14:37:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '37 | 78 | 1 | player | 4 | object | 1'),
(466, '2023-03-27 14:37:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '74 | 82 | 1 | object | 1 | player | 4'),
(467, '2023-03-27 14:37:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '74 | 82 | 1 | player | 4 | object | 1'),
(468, '2023-03-27 14:37:55', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'sethp', 'Daniel Fierro | 100'),
(469, '2023-03-27 14:38:01', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'setarmor', 'Daniel Fierro | 100'),
(470, '2023-03-27 14:38:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Williem Smithe'),
(471, '2023-03-27 14:38:13', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(472, '2023-03-27 14:38:21', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'setskin', 'Daniel Fierro | 2'),
(473, '2023-03-27 14:38:23', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'setskin', 'Daniel Fierro | 21'),
(474, '2023-03-27 14:42:09', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'gethere', 'yeezy'),
(475, '2023-03-27 14:42:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Hektor Oak'),
(476, '2023-03-27 14:42:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(477, '2023-03-27 14:43:08', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'giveitem', 'accountId: 3 | characterId: 3 | itemId: 265 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(478, '2023-03-27 14:43:26', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'giveitem', 'accountId: 3 | characterId: 3 | itemId: 110 | amount: 1000 | data1: nil | data2: nil | data3: nil'),
(479, '2023-03-27 14:44:13', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'makeveh', '567'),
(480, '2023-03-27 14:44:23', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'delveh', '11'),
(481, '2023-03-27 14:44:32', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'makeveh', '477'),
(482, '2023-03-27 14:44:43', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'giveitem', 'accountId: 3 | characterId: 3 | itemId: 239 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(483, '2023-03-27 14:45:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(484, '2023-03-27 14:45:12', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'delveh', '12'),
(485, '2023-03-27 14:45:24', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'getveh', '9'),
(486, '2023-03-27 14:45:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'yeezy | 2'),
(487, '2023-03-27 14:45:34', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'getveh', '7'),
(488, '2023-03-27 14:45:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'makeveh', '502'),
(489, '2023-03-27 14:47:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Ernesto D Kevlar'),
(490, '2023-03-27 14:48:07', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Hektor Oak'),
(491, '2023-03-27 14:48:08', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'fixveh', 'Ernesto D Kevlar | 10'),
(492, '2023-03-27 14:48:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'sethp', 'Cory Carson | 0'),
(493, '2023-03-27 14:48:30', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Cory Carson'),
(494, '2023-03-27 14:48:43', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'sethp', 'Cory Carson | 0'),
(495, '2023-03-27 14:48:44', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Cory Carson'),
(496, '2023-03-27 14:50:48', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'fixveh', 'Daniel Fierro | 10'),
(497, '2023-03-27 14:52:10', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'Hektor Oak'),
(498, '2023-03-27 14:53:21', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Hektor Oak'),
(499, '2023-03-27 14:53:29', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'agyogyit', 'Ernesto D Kevlar'),
(500, '2023-03-27 14:53:37', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Hektor Oak'),
(501, '2023-03-27 14:53:54', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '75 | 85 | 1 | object | 1 | player | 4'),
(502, '2023-03-27 14:53:55', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '85 | 110 | 300 | object | 1 | player | 4'),
(503, '2023-03-27 14:53:59', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'unfreeze', 'Hektor Oak'),
(504, '2023-03-27 14:54:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '110 | 156 | 10 | player | 1 | player | 9'),
(505, '2023-03-27 14:54:27', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 239 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(506, '2023-03-27 14:54:34', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', '@ÄÍÄđđäŁđĐŁ|', '104 | 86 | 1 | player | 7 | vehicle | 10'),
(507, '2023-03-27 14:55:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '108 | 156 | 10 | player | 1 | player | 4'),
(508, '2023-03-27 14:56:59', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'giveitem', 'accountId: 4 | characterId: 4 | itemId: 110 | amount: 300 | data1: nil | data2: nil | data3: nil'),
(509, '2023-03-27 14:57:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Ernesto D Kevlar'),
(510, '2023-03-27 14:57:15', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '129 | 110 | 300 | player | 4 | object | 1'),
(511, '2023-03-27 14:57:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(512, '2023-03-27 14:57:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'akspawn', 'Hektor Oak'),
(513, '2023-03-27 14:57:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'unfreeze', 'Hektor Oak'),
(514, '2023-03-27 14:58:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Cory Carson'),
(515, '2023-03-27 14:58:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'gethere', 'Cory Carson'),
(516, '2023-03-27 14:58:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Cory Carson'),
(517, '2023-03-27 14:58:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(518, '2023-03-27 14:58:25', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(519, '2023-03-27 14:58:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(520, '2023-03-27 14:58:27', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'goto', 'Yeezy Carlos'),
(521, '2023-03-27 14:58:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(522, '2023-03-27 14:59:18', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(523, '2023-03-27 14:59:24', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(524, '2023-03-27 14:59:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Cory Carson'),
(525, '2023-03-27 14:59:41', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory Carson'),
(526, '2023-03-27 14:59:45', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(527, '2023-03-27 14:59:51', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(528, '2023-03-27 14:59:52', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(529, '2023-03-27 15:00:03', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(530, '2023-03-27 15:00:15', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(531, '2023-03-27 15:00:15', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(532, '2023-03-27 15:00:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Hektor Oak'),
(533, '2023-03-27 15:00:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(534, '2023-03-27 15:00:26', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'sethp', 'Cory Carson | 0'),
(535, '2023-03-27 15:00:30', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(536, '2023-03-27 15:00:36', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Hektor Oak'),
(537, '2023-03-27 15:00:39', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(538, '2023-03-27 15:00:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory Carson'),
(539, '2023-03-27 15:00:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(540, '2023-03-27 15:00:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(541, '2023-03-27 15:00:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(542, '2023-03-27 15:01:01', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(543, '2023-03-27 15:01:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(544, '2023-03-27 15:01:08', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(545, '2023-03-27 15:01:08', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'asegit', 'Hektor Oak'),
(546, '2023-03-27 15:01:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(547, '2023-03-27 15:01:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(548, '2023-03-27 15:01:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(549, '2023-03-27 15:01:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(550, '2023-03-27 15:01:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(551, '2023-03-27 15:01:22', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(552, '2023-03-27 15:01:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(553, '2023-03-27 15:01:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(554, '2023-03-27 15:01:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(555, '2023-03-27 15:01:37', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(556, '2023-03-27 15:01:46', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(557, '2023-03-27 15:01:54', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(558, '2023-03-27 15:01:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(559, '2023-03-27 15:02:07', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Cory Carson'),
(560, '2023-03-27 15:02:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(561, '2023-03-27 15:02:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(562, '2023-03-27 15:02:23', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(563, '2023-03-27 15:02:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(564, '2023-03-27 15:02:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(565, '2023-03-27 15:02:26', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(566, '2023-03-27 15:02:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'agyogyit', 'Hektor Oak'),
(567, '2023-03-27 15:02:28', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(568, '2023-03-27 15:02:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(569, '2023-03-27 15:02:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(570, '2023-03-27 15:02:35', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'unfreeze', 'Hektor Oak'),
(571, '2023-03-27 15:02:39', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '75 | 85 | 1 | player | 4 | object | 1'),
(572, '2023-03-27 15:02:39', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(573, '2023-03-27 15:02:40', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', '@ÄÍÄđđäŁđĐŁ|', '85 | 110 | 264 | player | 4 | object | 1'),
(574, '2023-03-27 15:02:43', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(575, '2023-03-27 15:02:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(576, '2023-03-27 15:02:51', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(577, '2023-03-27 15:02:52', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(578, '2023-03-27 15:02:59', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(579, '2023-03-27 15:03:03', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(580, '2023-03-27 15:03:09', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(581, '2023-03-27 15:03:13', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'sethp', 'Cory Carson | 0'),
(582, '2023-03-27 15:03:14', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(583, '2023-03-27 15:03:16', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'sethp', 'Yeezy Carlos | 0'),
(584, '2023-03-27 15:03:17', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(585, '2023-03-27 15:03:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(586, '2023-03-27 15:03:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(587, '2023-03-27 15:03:19', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(588, '2023-03-27 15:03:22', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'sethp', 'Ernesto D Kevlar | 0'),
(589, '2023-03-27 15:03:22', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'goto', 'Yeezy Carlos'),
(590, '2023-03-27 15:03:24', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(591, '2023-03-27 15:03:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(592, '2023-03-27 15:03:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(593, '2023-03-27 15:03:28', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'unfreeze', 'Ryder'),
(594, '2023-03-27 15:03:32', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(595, '2023-03-27 15:03:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(596, '2023-03-27 15:03:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(597, '2023-03-27 15:03:40', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(598, '2023-03-27 15:03:41', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(599, '2023-03-27 15:03:48', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Cory Carson'),
(600, '2023-03-27 15:03:49', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'gethere', 'Yeezy Carlos'),
(601, '2023-03-27 15:03:51', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(602, '2023-03-27 15:03:51', 4, 4, 'B5D00FDBF504A79D34195CB186FF0393', '188.6.35.7', 'gethere', 'Yeezy Carlos'),
(603, '2023-03-27 15:04:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(604, '2023-03-27 15:04:00', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(605, '2023-03-27 15:04:07', 9, 9, '6A1688AF2A4A527CF089C52E1ADA7C94', '217.65.121.133', 'lockInterior', 'id: 452 | locked: N | adminDuty: 0'),
(606, '2023-03-27 15:04:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(607, '2023-03-27 15:05:02', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'sethp', 'Daniel Fierro | 0'),
(608, '2023-03-27 15:05:04', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(609, '2023-03-27 15:05:09', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'agyogyit', 'Daniel Fierro'),
(610, '2023-03-27 15:05:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Williem Smithe'),
(611, '2023-03-27 15:07:20', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'sethp', 'Daniel Fierro | 0'),
(612, '2023-03-27 15:07:22', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'asegit', 'Daniel Fierro'),
(613, '2023-03-27 15:07:55', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory Carson'),
(614, '2023-03-27 15:08:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '144 | 110 | 1500 | player | 1 | player | 7'),
(615, '2023-03-27 15:09:02', 7, 7, '174B9686FE12EA4F9B7BC50D64863E03', '81.182.3.224', 'akspawn', 'Daniel Fierro'),
(616, '2023-03-27 15:11:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Pal Inka'),
(617, '2023-03-27 15:11:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(618, '2023-03-27 15:13:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'akspawn', 'Jonhson Michael'),
(619, '2023-03-27 15:13:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(620, '2023-03-27 15:17:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Williem Smithe'),
(621, '2023-03-27 15:17:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(622, '2023-03-27 15:17:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(623, '2023-03-27 15:17:28', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(624, '2023-03-27 15:17:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(625, '2023-03-27 15:17:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(626, '2023-03-27 15:17:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(627, '2023-03-27 15:17:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(628, '2023-03-27 15:17:53', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(629, '2023-03-27 15:17:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(630, '2023-03-27 15:17:57', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(631, '2023-03-27 15:18:08', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(632, '2023-03-27 15:18:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '155 | 240 | 1 | player | 1 | player | 5'),
(633, '2023-03-27 15:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '153 | 86 | 1 | player | 1 | player | 5'),
(634, '2023-03-27 15:19:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', '@ÄÍÄđđäŁđĐŁ|', '154 | 113 | 1500 | player | 1 | player | 5'),
(635, '2023-03-27 15:20:04', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory Carson'),
(636, '2023-03-27 15:20:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(637, '2023-03-27 15:20:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(638, '2023-03-27 15:21:05', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(639, '2023-03-27 15:21:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(640, '2023-03-27 15:21:16', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(641, '2023-03-27 15:21:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(642, '2023-03-27 15:21:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(643, '2023-03-27 15:21:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'getveh', '2'),
(644, '2023-03-27 15:22:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(645, '2023-03-27 15:22:11', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'fixveh', 'Yeezy Carlos | 2'),
(646, '2023-03-27 15:22:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'rtc', '2'),
(647, '2023-03-27 15:23:32', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'fixveh', 'Yeezy Carlos | 2'),
(648, '2023-03-27 15:23:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(649, '2023-03-27 15:26:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(650, '2023-03-27 15:26:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(651, '2023-03-27 15:26:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Cory Carson'),
(652, '2023-03-27 15:28:39', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(653, '2023-03-27 15:29:15', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(654, '2023-03-27 15:29:21', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Yeezy Carlos | 0'),
(655, '2023-03-27 15:29:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(656, '2023-03-27 15:29:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(657, '2023-03-27 15:30:32', 6, 6, '1F7C3F5DD909349682F04286320A96E3', '46.35.192.207', 'lockInterior', 'id: 903 | locked: N | adminDuty: 0'),
(658, '2023-03-27 15:30:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'unflip', 'Yeezy Carlos | 2'),
(659, '2023-03-27 15:30:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(660, '2023-03-27 15:30:41', 6, 6, '1F7C3F5DD909349682F04286320A96E3', '46.35.192.207', 'lockInterior', 'id: 903 | locked: Y | adminDuty: 0'),
(661, '2023-03-27 15:30:47', 6, 6, '1F7C3F5DD909349682F04286320A96E3', '46.35.192.207', 'lockInterior', 'id: 903 | locked: N | adminDuty: 0'),
(662, '2023-03-27 15:30:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(663, '2023-03-27 15:30:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(664, '2023-03-27 15:30:57', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(665, '2023-03-27 15:31:02', 6, 6, '1F7C3F5DD909349682F04286320A96E3', '46.35.192.207', 'lockInterior', 'id: 903 | locked: Y | adminDuty: 0'),
(666, '2023-03-27 15:31:08', 6, 6, '1F7C3F5DD909349682F04286320A96E3', '46.35.192.207', 'lockInterior', 'id: 903 | locked: N | adminDuty: 0'),
(667, '2023-03-27 15:31:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'fixveh', 'Yeezy Carlos | 2'),
(668, '2023-03-27 15:31:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'vhspawn', 'Williem Smithe'),
(669, '2023-03-27 15:31:59', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'akspawn', 'Williem Smithe'),
(670, '2023-03-27 15:32:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(671, '2023-03-27 15:32:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(672, '2023-03-27 15:32:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(673, '2023-03-27 15:32:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(674, '2023-03-27 15:32:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(675, '2023-03-27 15:32:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(676, '2023-03-27 15:32:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(677, '2023-03-27 15:32:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(678, '2023-03-27 15:32:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(679, '2023-03-27 15:33:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory'),
(680, '2023-03-27 15:34:01', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(681, '2023-03-27 15:34:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'goto', 'Cory Carson'),
(682, '2023-03-27 15:34:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(683, '2023-03-27 15:35:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(684, '2023-03-27 15:35:19', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(685, '2023-03-27 15:35:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory Carson'),
(686, '2023-03-27 15:35:54', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(687, '2023-03-27 15:35:58', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(688, '2023-03-27 15:36:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(689, '2023-03-27 15:37:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(690, '2023-03-27 15:38:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(691, '2023-03-27 15:38:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(692, '2023-03-27 15:41:24', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 162'),
(693, '2023-03-27 15:44:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(694, '2023-03-27 15:44:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(695, '2023-03-27 15:44:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(696, '2023-03-27 15:44:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(697, '2023-03-27 15:44:35', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(698, '2023-03-27 15:44:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(699, '2023-03-27 15:44:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(700, '2023-03-27 15:44:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(701, '2023-03-27 15:44:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(702, '2023-03-27 15:45:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(703, '2023-03-27 15:45:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(704, '2023-03-27 15:45:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(705, '2023-03-27 15:45:14', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(706, '2023-03-27 15:45:22', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(707, '2023-03-27 15:45:32', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Yeezy Carlos'),
(708, '2023-03-27 15:46:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(709, '2023-03-27 15:46:29', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(710, '2023-03-27 15:46:34', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(711, '2023-03-27 15:46:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(712, '2023-03-27 15:46:55', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(713, '2023-03-27 15:46:58', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(714, '2023-03-27 15:47:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(715, '2023-03-27 15:47:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(716, '2023-03-27 15:47:14', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 161'),
(717, '2023-03-27 15:47:20', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 160'),
(718, '2023-03-27 15:47:24', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(719, '2023-03-27 15:47:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(720, '2023-03-27 15:47:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(721, '2023-03-27 15:47:54', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(722, '2023-03-27 15:48:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(723, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(724, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(725, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(726, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(727, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(728, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(729, '2023-03-27 15:48:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(730, '2023-03-27 15:48:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(731, '2023-03-27 15:48:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(732, '2023-03-27 15:48:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(733, '2023-03-27 15:48:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(734, '2023-03-27 15:48:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(735, '2023-03-27 15:48:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(736, '2023-03-27 15:48:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(737, '2023-03-27 15:48:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(738, '2023-03-27 15:48:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(739, '2023-03-27 15:48:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(740, '2023-03-27 15:48:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(741, '2023-03-27 15:48:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(742, '2023-03-27 15:48:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(743, '2023-03-27 15:48:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(744, '2023-03-27 15:48:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(745, '2023-03-27 15:48:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(746, '2023-03-27 15:48:39', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(747, '2023-03-27 15:48:50', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(748, '2023-03-27 15:48:57', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(749, '2023-03-27 15:49:00', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(750, '2023-03-27 15:49:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(751, '2023-03-27 15:49:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(752, '2023-03-27 15:49:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'giveitem', 'accountId: 1 | characterId: 1 | itemId: 155 | amount: 1 | data1: nil | data2: nil | data3: nil'),
(753, '2023-03-27 15:49:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(754, '2023-03-27 15:49:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(755, '2023-03-27 15:50:09', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(756, '2023-03-27 15:50:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(757, '2023-03-27 15:50:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(758, '2023-03-27 15:50:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(759, '2023-03-27 15:50:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(760, '2023-03-27 15:50:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(761, '2023-03-27 15:50:22', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(762, '2023-03-27 15:50:29', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(763, '2023-03-27 15:50:33', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(764, '2023-03-27 15:50:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(765, '2023-03-27 15:50:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(766, '2023-03-27 15:50:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(767, '2023-03-27 15:50:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(768, '2023-03-27 15:50:57', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(769, '2023-03-27 15:51:08', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(770, '2023-03-27 15:51:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(771, '2023-03-27 15:51:26', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(772, '2023-03-27 15:51:53', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(773, '2023-03-27 15:58:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Cory Carson'),
(774, '2023-03-27 16:01:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(775, '2023-03-27 16:01:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(776, '2023-03-27 16:01:28', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(777, '2023-03-27 16:02:14', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(778, '2023-03-27 16:02:19', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(779, '2023-03-27 16:02:25', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(780, '2023-03-27 16:02:30', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Yeezy Carlos | 0'),
(781, '2023-03-27 16:02:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(782, '2023-03-27 16:02:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(783, '2023-03-27 16:02:32', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(784, '2023-03-27 16:02:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(785, '2023-03-27 16:02:50', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(786, '2023-03-27 16:04:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(787, '2023-03-27 16:04:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(788, '2023-03-27 16:04:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(789, '2023-03-27 16:04:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(790, '2023-03-27 16:04:56', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(791, '2023-03-27 16:05:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(792, '2023-03-27 16:05:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(793, '2023-03-27 16:05:14', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(794, '2023-03-27 16:05:19', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'gethere', 'Ernesto D Kevlar'),
(795, '2023-03-27 16:05:22', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(796, '2023-03-27 16:05:30', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'gethere', 'Ernesto D Kevlar'),
(797, '2023-03-27 16:05:36', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'sethp', 'Ernesto D Kevlar | 0'),
(798, '2023-03-27 16:05:38', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(799, '2023-03-27 16:06:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(800, '2023-03-27 16:06:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(801, '2023-03-27 16:06:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(802, '2023-03-27 16:06:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(803, '2023-03-27 16:06:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(804, '2023-03-27 16:06:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(805, '2023-03-27 16:06:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(806, '2023-03-27 16:06:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(807, '2023-03-27 16:06:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(808, '2023-03-27 16:06:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(809, '2023-03-27 16:06:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(810, '2023-03-27 16:06:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(811, '2023-03-27 16:06:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(812, '2023-03-27 16:06:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(813, '2023-03-27 16:06:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'Kevlar | 1'),
(814, '2023-03-27 16:06:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(815, '2023-03-27 16:06:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(816, '2023-03-27 16:06:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Kevlar | 0'),
(817, '2023-03-27 16:06:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(818, '2023-03-27 16:06:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setadminlevel', 'Kevlar | 10'),
(819, '2023-03-27 16:06:52', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Kevlar'),
(820, '2023-03-27 16:06:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(821, '2023-03-27 16:07:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(822, '2023-03-27 16:07:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(823, '2023-03-27 16:07:28', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 288'),
(824, '2023-03-27 16:07:32', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 289'),
(825, '2023-03-27 16:07:37', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 290'),
(826, '2023-03-27 16:07:39', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 291'),
(827, '2023-03-27 16:07:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 292'),
(828, '2023-03-27 16:07:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(829, '2023-03-27 16:07:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(830, '2023-03-27 16:07:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(831, '2023-03-27 16:07:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(832, '2023-03-27 16:07:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(833, '2023-03-27 16:08:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Kevlar | 0'),
(834, '2023-03-27 16:08:06', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Kevlar'),
(835, '2023-03-27 16:08:09', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 287'),
(836, '2023-03-27 16:08:13', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 288'),
(837, '2023-03-27 16:08:15', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 289'),
(838, '2023-03-27 16:08:20', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory Carson | 286'),
(839, '2023-03-27 16:08:23', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(840, '2023-03-27 16:08:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(841, '2023-03-27 16:08:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(842, '2023-03-27 16:08:30', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Kevlar | 0');
INSERT INTO `log_command` (`logId`, `date`, `characterId`, `accountId`, `mtaSerial`, `ipAddress`, `command`, `arguments`) VALUES
(843, '2023-03-27 16:08:33', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Kevlar'),
(844, '2023-03-27 16:08:38', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory'),
(845, '2023-03-27 16:09:04', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 286'),
(846, '2023-03-27 16:09:12', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(847, '2023-03-27 16:09:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(848, '2023-03-27 16:09:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(849, '2023-03-27 16:09:25', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 285'),
(850, '2023-03-27 16:09:28', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 284'),
(851, '2023-03-27 16:09:30', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 283'),
(852, '2023-03-27 16:09:32', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 282'),
(853, '2023-03-27 16:09:34', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 281'),
(854, '2023-03-27 16:09:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(855, '2023-03-27 16:09:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(856, '2023-03-27 16:09:38', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 280'),
(857, '2023-03-27 16:09:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 279'),
(858, '2023-03-27 16:09:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 278'),
(859, '2023-03-27 16:09:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 277'),
(860, '2023-03-27 16:09:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(861, '2023-03-27 16:09:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(862, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(863, '2023-03-27 16:09:53', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'setskin', 'Cory | 287'),
(864, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(865, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(866, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(867, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(868, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(869, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(870, '2023-03-27 16:09:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(871, '2023-03-27 16:09:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(872, '2023-03-27 16:09:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(873, '2023-03-27 16:09:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(874, '2023-03-27 16:09:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(875, '2023-03-27 16:09:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(876, '2023-03-27 16:09:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(877, '2023-03-27 16:10:02', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory'),
(878, '2023-03-27 16:10:11', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Kevlar'),
(879, '2023-03-27 16:10:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(880, '2023-03-27 16:10:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(881, '2023-03-27 16:10:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(882, '2023-03-27 16:10:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(883, '2023-03-27 16:10:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(884, '2023-03-27 16:10:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(885, '2023-03-27 16:10:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(886, '2023-03-27 16:10:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(887, '2023-03-27 16:10:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(888, '2023-03-27 16:10:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(889, '2023-03-27 16:10:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(890, '2023-03-27 16:10:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(891, '2023-03-27 16:10:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(892, '2023-03-27 16:10:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(893, '2023-03-27 16:10:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(894, '2023-03-27 16:10:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(895, '2023-03-27 16:10:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(896, '2023-03-27 16:10:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(897, '2023-03-27 16:10:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(898, '2023-03-27 16:10:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(899, '2023-03-27 16:10:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(900, '2023-03-27 16:10:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(901, '2023-03-27 16:10:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(902, '2023-03-27 16:10:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(903, '2023-03-27 16:10:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(904, '2023-03-27 16:10:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(905, '2023-03-27 16:10:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(906, '2023-03-27 16:10:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(907, '2023-03-27 16:10:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(908, '2023-03-27 16:10:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(909, '2023-03-27 16:10:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(910, '2023-03-27 16:10:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(911, '2023-03-27 16:10:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(912, '2023-03-27 16:10:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(913, '2023-03-27 16:10:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(914, '2023-03-27 16:10:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(915, '2023-03-27 16:10:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(916, '2023-03-27 16:10:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(917, '2023-03-27 16:10:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(918, '2023-03-27 16:10:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(919, '2023-03-27 16:10:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(920, '2023-03-27 16:10:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(921, '2023-03-27 16:10:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(922, '2023-03-27 16:10:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(923, '2023-03-27 16:10:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(924, '2023-03-27 16:10:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(925, '2023-03-27 16:10:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(926, '2023-03-27 16:10:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(927, '2023-03-27 16:10:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(928, '2023-03-27 16:10:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(929, '2023-03-27 16:10:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(930, '2023-03-27 16:10:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(931, '2023-03-27 16:10:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(932, '2023-03-27 16:10:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(933, '2023-03-27 16:10:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(934, '2023-03-27 16:10:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(935, '2023-03-27 16:10:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(936, '2023-03-27 16:10:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(937, '2023-03-27 16:10:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(938, '2023-03-27 16:10:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(939, '2023-03-27 16:10:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(940, '2023-03-27 16:10:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(941, '2023-03-27 16:10:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(942, '2023-03-27 16:10:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(943, '2023-03-27 16:10:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(944, '2023-03-27 16:10:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(945, '2023-03-27 16:10:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(946, '2023-03-27 16:10:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(947, '2023-03-27 16:10:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(948, '2023-03-27 16:10:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(949, '2023-03-27 16:10:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(950, '2023-03-27 16:10:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(951, '2023-03-27 16:10:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(952, '2023-03-27 16:10:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(953, '2023-03-27 16:10:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(954, '2023-03-27 16:10:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(955, '2023-03-27 16:10:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(956, '2023-03-27 16:10:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(957, '2023-03-27 16:10:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(958, '2023-03-27 16:10:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(959, '2023-03-27 16:10:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(960, '2023-03-27 16:10:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(961, '2023-03-27 16:10:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(962, '2023-03-27 16:10:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(963, '2023-03-27 16:10:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(964, '2023-03-27 16:10:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(965, '2023-03-27 16:10:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(966, '2023-03-27 16:10:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(967, '2023-03-27 16:10:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(968, '2023-03-27 16:10:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(969, '2023-03-27 16:10:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(970, '2023-03-27 16:11:24', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory'),
(971, '2023-03-27 16:11:37', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'agyogyit', 'Ernesto D Kevlar'),
(972, '2023-03-27 16:12:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 280'),
(973, '2023-03-27 16:12:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 281'),
(974, '2023-03-27 16:12:40', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 282'),
(975, '2023-03-27 16:12:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 283'),
(976, '2023-03-27 16:12:41', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(977, '2023-03-27 16:12:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 284'),
(978, '2023-03-27 16:12:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 285'),
(979, '2023-03-27 16:12:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 290'),
(980, '2023-03-27 16:12:45', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 291'),
(981, '2023-03-27 16:12:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 292'),
(982, '2023-03-27 16:12:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 224'),
(983, '2023-03-27 16:12:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 225'),
(984, '2023-03-27 16:12:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 223'),
(985, '2023-03-27 16:12:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 223'),
(986, '2023-03-27 16:12:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 214'),
(987, '2023-03-27 16:12:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 215'),
(988, '2023-03-27 16:12:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 2156'),
(989, '2023-03-27 16:12:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 215'),
(990, '2023-03-27 16:13:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 217'),
(991, '2023-03-27 16:13:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 216'),
(992, '2023-03-27 16:13:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 217'),
(993, '2023-03-27 16:13:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 218'),
(994, '2023-03-27 16:13:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 219'),
(995, '2023-03-27 16:13:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 220'),
(996, '2023-03-27 16:13:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 221'),
(997, '2023-03-27 16:13:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 222'),
(998, '2023-03-27 16:13:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 223'),
(999, '2023-03-27 16:13:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 222'),
(1000, '2023-03-27 16:13:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'setskin', 'Yeezy Carlos | 214'),
(1001, '2023-03-27 16:14:17', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'Yeezy Carlos'),
(1002, '2023-03-27 16:15:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'John Cg'),
(1003, '2023-03-27 16:15:13', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1004, '2023-03-27 16:15:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'John Cg'),
(1005, '2023-03-27 16:15:20', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1006, '2023-03-27 16:15:38', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(1007, '2023-03-27 16:15:41', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'John Cg'),
(1008, '2023-03-27 16:15:56', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'agyogyit', 'Cory Carson'),
(1009, '2023-03-27 16:15:57', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1010, '2023-03-27 16:16:51', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'gethere', 'John Cg'),
(1011, '2023-03-27 16:16:54', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', '@ÄÍÄđđäŁđĐŁ|', '170 | 86 | 1 | player | 3 | player | 12'),
(1012, '2023-03-27 16:16:57', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', '@ÄÍÄđđäŁđĐŁ|', '172 | 113 | 500 | player | 3 | player | 12'),
(1013, '2023-03-27 16:17:01', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'unfreeze', 'John Cg'),
(1014, '2023-03-27 16:17:18', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'goto', 'Yeezy Carlos'),
(1015, '2023-03-27 16:18:02', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', '@ÄÍÄđđäŁđĐŁ|', '173 | 240 | 1 | player | 3 | player | 12'),
(1016, '2023-03-27 16:18:09', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'Cory Carson'),
(1017, '2023-03-27 16:18:11', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'gethere', 'John Cg'),
(1018, '2023-03-27 16:18:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(1019, '2023-03-27 16:18:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(1020, '2023-03-27 16:18:23', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1021, '2023-03-27 16:18:23', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(1022, '2023-03-27 16:18:32', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1023, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1024, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1025, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1026, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1027, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1028, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1029, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1030, '2023-03-27 16:18:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1031, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1032, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1033, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1034, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1035, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1036, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1037, '2023-03-27 16:18:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1038, '2023-03-27 16:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1039, '2023-03-27 16:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1040, '2023-03-27 16:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1041, '2023-03-27 16:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1042, '2023-03-27 16:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1043, '2023-03-27 16:18:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1044, '2023-03-27 16:18:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1045, '2023-03-27 16:18:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1046, '2023-03-27 16:18:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1047, '2023-03-27 16:18:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1048, '2023-03-27 16:18:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1049, '2023-03-27 16:18:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1050, '2023-03-27 16:18:54', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(1051, '2023-03-27 16:18:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1052, '2023-03-27 16:18:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1053, '2023-03-27 16:18:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1054, '2023-03-27 16:18:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1055, '2023-03-27 16:18:54', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1056, '2023-03-27 16:18:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(1057, '2023-03-27 16:18:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(1058, '2023-03-27 16:18:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1059, '2023-03-27 16:18:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(1060, '2023-03-27 16:18:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1061, '2023-03-27 16:18:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1062, '2023-03-27 16:18:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1063, '2023-03-27 16:18:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1064, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1065, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1066, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1067, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1068, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1069, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1070, '2023-03-27 16:18:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1071, '2023-03-27 16:18:57', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1072, '2023-03-27 16:18:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1073, '2023-03-27 16:18:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1074, '2023-03-27 16:18:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1075, '2023-03-27 16:18:57', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1076, '2023-03-27 16:18:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1077, '2023-03-27 16:18:57', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1078, '2023-03-27 16:18:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1079, '2023-03-27 16:18:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1080, '2023-03-27 16:18:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1081, '2023-03-27 16:18:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1082, '2023-03-27 16:18:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1083, '2023-03-27 16:18:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1084, '2023-03-27 16:18:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1085, '2023-03-27 16:18:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1086, '2023-03-27 16:18:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1087, '2023-03-27 16:18:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1088, '2023-03-27 16:18:58', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1089, '2023-03-27 16:18:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1090, '2023-03-27 16:18:59', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1091, '2023-03-27 16:18:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1092, '2023-03-27 16:18:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1093, '2023-03-27 16:18:59', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1094, '2023-03-27 16:18:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1095, '2023-03-27 16:18:59', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1096, '2023-03-27 16:18:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1097, '2023-03-27 16:19:00', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1098, '2023-03-27 16:19:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1099, '2023-03-27 16:19:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1100, '2023-03-27 16:19:00', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1101, '2023-03-27 16:19:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1102, '2023-03-27 16:19:00', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1103, '2023-03-27 16:19:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1104, '2023-03-27 16:19:00', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1105, '2023-03-27 16:19:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1106, '2023-03-27 16:19:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1107, '2023-03-27 16:19:01', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1108, '2023-03-27 16:19:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1109, '2023-03-27 16:19:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1110, '2023-03-27 16:19:01', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1111, '2023-03-27 16:19:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1112, '2023-03-27 16:19:01', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1113, '2023-03-27 16:19:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1114, '2023-03-27 16:19:02', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1115, '2023-03-27 16:19:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1116, '2023-03-27 16:19:02', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1117, '2023-03-27 16:19:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1118, '2023-03-27 16:19:02', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1119, '2023-03-27 16:19:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1120, '2023-03-27 16:19:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1121, '2023-03-27 16:19:03', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1122, '2023-03-27 16:19:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1123, '2023-03-27 16:19:03', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1124, '2023-03-27 16:19:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1125, '2023-03-27 16:19:03', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1126, '2023-03-27 16:19:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1127, '2023-03-27 16:19:03', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1128, '2023-03-27 16:19:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1129, '2023-03-27 16:19:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1130, '2023-03-27 16:19:04', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1131, '2023-03-27 16:19:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1132, '2023-03-27 16:19:04', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1133, '2023-03-27 16:19:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1134, '2023-03-27 16:19:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1135, '2023-03-27 16:19:04', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1136, '2023-03-27 16:19:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1137, '2023-03-27 16:19:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1138, '2023-03-27 16:19:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1139, '2023-03-27 16:19:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1140, '2023-03-27 16:19:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1141, '2023-03-27 16:19:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1142, '2023-03-27 16:19:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1143, '2023-03-27 16:19:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1144, '2023-03-27 16:19:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1145, '2023-03-27 16:19:05', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1146, '2023-03-27 16:19:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1147, '2023-03-27 16:19:06', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1148, '2023-03-27 16:19:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1149, '2023-03-27 16:19:06', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1150, '2023-03-27 16:19:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1151, '2023-03-27 16:19:06', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1152, '2023-03-27 16:19:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1153, '2023-03-27 16:19:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1154, '2023-03-27 16:19:06', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1155, '2023-03-27 16:19:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1156, '2023-03-27 16:19:07', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1157, '2023-03-27 16:19:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1158, '2023-03-27 16:19:07', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1159, '2023-03-27 16:19:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1160, '2023-03-27 16:19:07', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1161, '2023-03-27 16:19:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1162, '2023-03-27 16:19:07', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1163, '2023-03-27 16:19:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1164, '2023-03-27 16:19:08', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1165, '2023-03-27 16:19:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1166, '2023-03-27 16:19:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1167, '2023-03-27 16:19:08', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1168, '2023-03-27 16:19:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1169, '2023-03-27 16:19:08', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1170, '2023-03-27 16:19:09', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1171, '2023-03-27 16:19:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1172, '2023-03-27 16:19:09', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1173, '2023-03-27 16:19:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1174, '2023-03-27 16:19:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1175, '2023-03-27 16:19:09', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1176, '2023-03-27 16:19:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1177, '2023-03-27 16:19:09', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1178, '2023-03-27 16:19:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1179, '2023-03-27 16:19:10', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1180, '2023-03-27 16:19:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1181, '2023-03-27 16:19:10', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1182, '2023-03-27 16:19:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1183, '2023-03-27 16:19:10', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1184, '2023-03-27 16:19:10', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1185, '2023-03-27 16:19:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1186, '2023-03-27 16:19:11', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1187, '2023-03-27 16:19:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1188, '2023-03-27 16:19:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1189, '2023-03-27 16:19:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1190, '2023-03-27 16:19:11', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1191, '2023-03-27 16:19:11', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1192, '2023-03-27 16:19:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1193, '2023-03-27 16:19:12', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1194, '2023-03-27 16:19:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1195, '2023-03-27 16:19:12', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1196, '2023-03-27 16:19:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1197, '2023-03-27 16:19:12', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1198, '2023-03-27 16:19:12', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1199, '2023-03-27 16:19:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1200, '2023-03-27 16:19:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1201, '2023-03-27 16:19:13', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1202, '2023-03-27 16:19:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1203, '2023-03-27 16:19:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1204, '2023-03-27 16:19:13', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1205, '2023-03-27 16:19:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1206, '2023-03-27 16:19:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1207, '2023-03-27 16:19:14', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1208, '2023-03-27 16:19:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1209, '2023-03-27 16:19:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1210, '2023-03-27 16:19:14', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1211, '2023-03-27 16:19:14', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1212, '2023-03-27 16:19:15', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1213, '2023-03-27 16:19:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1214, '2023-03-27 16:19:15', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1215, '2023-03-27 16:19:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1216, '2023-03-27 16:19:15', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1217, '2023-03-27 16:19:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1218, '2023-03-27 16:19:15', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1219, '2023-03-27 16:19:15', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1220, '2023-03-27 16:19:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1221, '2023-03-27 16:19:16', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1222, '2023-03-27 16:19:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1223, '2023-03-27 16:19:16', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1224, '2023-03-27 16:19:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1225, '2023-03-27 16:19:16', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1226, '2023-03-27 16:19:16', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1227, '2023-03-27 16:19:16', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1228, '2023-03-27 16:19:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1229, '2023-03-27 16:19:17', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1230, '2023-03-27 16:19:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1231, '2023-03-27 16:19:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1232, '2023-03-27 16:19:17', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1233, '2023-03-27 16:19:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1234, '2023-03-27 16:19:17', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1235, '2023-03-27 16:19:17', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1236, '2023-03-27 16:19:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1237, '2023-03-27 16:19:18', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1238, '2023-03-27 16:19:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1239, '2023-03-27 16:19:18', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1240, '2023-03-27 16:19:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1241, '2023-03-27 16:19:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1242, '2023-03-27 16:19:18', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1243, '2023-03-27 16:19:19', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1244, '2023-03-27 16:19:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1245, '2023-03-27 16:19:19', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1246, '2023-03-27 16:19:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1247, '2023-03-27 16:19:19', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1248, '2023-03-27 16:19:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1249, '2023-03-27 16:19:19', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1250, '2023-03-27 16:19:19', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1251, '2023-03-27 16:19:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1252, '2023-03-27 16:19:20', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1253, '2023-03-27 16:19:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1254, '2023-03-27 16:19:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1255, '2023-03-27 16:19:20', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1256, '2023-03-27 16:19:20', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1257, '2023-03-27 16:19:20', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1258, '2023-03-27 16:19:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1259, '2023-03-27 16:19:21', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1260, '2023-03-27 16:19:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0');
INSERT INTO `log_command` (`logId`, `date`, `characterId`, `accountId`, `mtaSerial`, `ipAddress`, `command`, `arguments`) VALUES
(1261, '2023-03-27 16:19:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1262, '2023-03-27 16:19:21', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1263, '2023-03-27 16:19:21', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1264, '2023-03-27 16:19:21', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1265, '2023-03-27 16:19:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1266, '2023-03-27 16:19:22', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1267, '2023-03-27 16:19:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1268, '2023-03-27 16:19:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1269, '2023-03-27 16:19:22', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1270, '2023-03-27 16:19:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1271, '2023-03-27 16:19:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1272, '2023-03-27 16:19:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1273, '2023-03-27 16:19:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1274, '2023-03-27 16:19:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1275, '2023-03-27 16:19:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1276, '2023-03-27 16:19:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1277, '2023-03-27 16:19:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1278, '2023-03-27 16:19:24', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1279, '2023-03-27 16:19:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1280, '2023-03-27 16:19:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1281, '2023-03-27 16:19:25', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1282, '2023-03-27 16:19:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1283, '2023-03-27 16:19:25', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1284, '2023-03-27 16:19:25', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1285, '2023-03-27 16:19:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1286, '2023-03-27 16:19:26', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1287, '2023-03-27 16:19:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1288, '2023-03-27 16:19:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1289, '2023-03-27 16:19:26', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1290, '2023-03-27 16:19:26', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1291, '2023-03-27 16:19:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1292, '2023-03-27 16:19:27', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1293, '2023-03-27 16:19:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1294, '2023-03-27 16:19:27', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1295, '2023-03-27 16:19:27', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1296, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1297, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1298, '2023-03-27 16:19:28', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1299, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1300, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1301, '2023-03-27 16:19:28', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1302, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1303, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1304, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1305, '2023-03-27 16:19:28', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1306, '2023-03-27 16:19:28', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1307, '2023-03-27 16:19:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1308, '2023-03-27 16:19:29', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1309, '2023-03-27 16:19:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1310, '2023-03-27 16:19:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1311, '2023-03-27 16:19:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1312, '2023-03-27 16:19:29', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1313, '2023-03-27 16:19:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1314, '2023-03-27 16:19:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1315, '2023-03-27 16:19:30', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1316, '2023-03-27 16:19:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1317, '2023-03-27 16:19:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1318, '2023-03-27 16:19:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1319, '2023-03-27 16:19:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1320, '2023-03-27 16:19:31', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1321, '2023-03-27 16:19:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1322, '2023-03-27 16:19:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1323, '2023-03-27 16:19:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1324, '2023-03-27 16:19:32', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1325, '2023-03-27 16:19:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1326, '2023-03-27 16:19:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1327, '2023-03-27 16:19:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1328, '2023-03-27 16:19:33', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1329, '2023-03-27 16:19:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1330, '2023-03-27 16:19:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1331, '2023-03-27 16:19:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1332, '2023-03-27 16:19:34', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1333, '2023-03-27 16:19:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1334, '2023-03-27 16:19:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1335, '2023-03-27 16:19:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1336, '2023-03-27 16:19:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1337, '2023-03-27 16:19:35', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1338, '2023-03-27 16:19:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1339, '2023-03-27 16:19:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1340, '2023-03-27 16:19:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1341, '2023-03-27 16:19:36', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1342, '2023-03-27 16:19:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1343, '2023-03-27 16:19:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1344, '2023-03-27 16:19:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1345, '2023-03-27 16:19:37', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1346, '2023-03-27 16:19:38', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1347, '2023-03-27 16:19:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1348, '2023-03-27 16:19:39', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1349, '2023-03-27 16:19:41', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1350, '2023-03-27 16:19:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1351, '2023-03-27 16:19:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1352, '2023-03-27 16:19:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1353, '2023-03-27 16:19:42', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1354, '2023-03-27 16:19:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1355, '2023-03-27 16:19:43', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1356, '2023-03-27 16:19:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1357, '2023-03-27 16:19:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1358, '2023-03-27 16:19:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1359, '2023-03-27 16:19:43', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1360, '2023-03-27 16:19:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1361, '2023-03-27 16:19:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1362, '2023-03-27 16:19:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1363, '2023-03-27 16:19:44', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1364, '2023-03-27 16:19:45', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1365, '2023-03-27 16:19:45', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1366, '2023-03-27 16:19:45', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1367, '2023-03-27 16:19:45', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1368, '2023-03-27 16:19:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1369, '2023-03-27 16:19:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1370, '2023-03-27 16:19:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1371, '2023-03-27 16:19:46', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1372, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1373, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1374, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1375, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1376, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1377, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1378, '2023-03-27 16:19:47', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1379, '2023-03-27 16:19:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1380, '2023-03-27 16:19:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1381, '2023-03-27 16:19:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1382, '2023-03-27 16:19:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1383, '2023-03-27 16:19:48', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1384, '2023-03-27 16:19:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1385, '2023-03-27 16:19:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1386, '2023-03-27 16:19:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1387, '2023-03-27 16:19:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1388, '2023-03-27 16:19:49', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1389, '2023-03-27 16:19:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1390, '2023-03-27 16:19:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1391, '2023-03-27 16:19:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1392, '2023-03-27 16:19:50', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1393, '2023-03-27 16:19:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1394, '2023-03-27 16:19:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1395, '2023-03-27 16:19:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1396, '2023-03-27 16:19:51', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1397, '2023-03-27 16:19:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1398, '2023-03-27 16:19:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1399, '2023-03-27 16:19:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1400, '2023-03-27 16:19:52', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1401, '2023-03-27 16:19:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1402, '2023-03-27 16:19:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1403, '2023-03-27 16:19:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1404, '2023-03-27 16:19:53', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1405, '2023-03-27 16:19:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1406, '2023-03-27 16:19:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1407, '2023-03-27 16:19:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1408, '2023-03-27 16:19:54', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1409, '2023-03-27 16:19:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1410, '2023-03-27 16:19:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1411, '2023-03-27 16:19:55', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1412, '2023-03-27 16:19:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1413, '2023-03-27 16:19:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1414, '2023-03-27 16:19:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1415, '2023-03-27 16:19:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1416, '2023-03-27 16:19:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1417, '2023-03-27 16:19:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1418, '2023-03-27 16:19:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1419, '2023-03-27 16:19:57', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1420, '2023-03-27 16:19:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1421, '2023-03-27 16:19:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1422, '2023-03-27 16:19:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1423, '2023-03-27 16:19:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1424, '2023-03-27 16:19:58', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1425, '2023-03-27 16:19:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1426, '2023-03-27 16:19:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1427, '2023-03-27 16:19:59', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1428, '2023-03-27 16:20:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1429, '2023-03-27 16:20:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1430, '2023-03-27 16:20:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1431, '2023-03-27 16:20:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1432, '2023-03-27 16:20:00', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1433, '2023-03-27 16:20:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1434, '2023-03-27 16:20:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1435, '2023-03-27 16:20:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1436, '2023-03-27 16:20:01', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1437, '2023-03-27 16:20:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1438, '2023-03-27 16:20:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1439, '2023-03-27 16:20:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(1440, '2023-03-27 16:20:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(1441, '2023-03-27 16:20:02', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'agyogyit', 'Yeezy Carlos'),
(1442, '2023-03-27 16:20:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1443, '2023-03-27 16:20:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1444, '2023-03-27 16:20:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1445, '2023-03-27 16:20:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1446, '2023-03-27 16:20:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1447, '2023-03-27 16:20:03', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1448, '2023-03-27 16:20:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1449, '2023-03-27 16:20:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1450, '2023-03-27 16:20:04', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1451, '2023-03-27 16:20:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1452, '2023-03-27 16:20:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1453, '2023-03-27 16:20:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1454, '2023-03-27 16:20:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1455, '2023-03-27 16:20:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1456, '2023-03-27 16:20:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1457, '2023-03-27 16:20:06', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1458, '2023-03-27 16:20:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1459, '2023-03-27 16:20:07', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'sethp', 'Ernesto D Kevlar | 0'),
(1460, '2023-03-27 16:20:11', 0, 0, '0', '0', 'kick', 'Ernesto D Kevlar | spam'),
(1461, '2023-03-27 16:20:23', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'John Cg'),
(1462, '2023-03-27 16:21:51', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1463, '2023-03-27 16:22:06', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1464, '2023-03-27 16:22:29', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'sethp', 'Ernesto D Kevlar | 0'),
(1465, '2023-03-27 16:22:31', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1466, '2023-03-27 16:22:34', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'goto', 'Cory Carson'),
(1467, '2023-03-27 16:22:45', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Ernesto D Kevlar'),
(1468, '2023-03-27 16:22:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(1469, '2023-03-27 16:22:56', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'John Cg'),
(1470, '2023-03-27 16:23:05', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(1471, '2023-03-27 16:23:09', 1, 1, '99BC809A5B13D8F2EE26D6DDF5021DA2', '145.236.163.147', 'asegit', 'Yeezy Carlos'),
(1472, '2023-03-27 16:23:12', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(1473, '2023-03-27 16:23:20', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1474, '2023-03-27 16:23:22', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'setadminlevel', 'John Cg | 1'),
(1475, '2023-03-27 16:23:23', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1476, '2023-03-27 16:23:27', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Sipos Dezso'),
(1477, '2023-03-27 16:23:30', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'asegit', 'Cory Carson'),
(1478, '2023-03-27 16:23:32', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Sipos Dezso'),
(1479, '2023-03-27 16:23:34', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'John Cg'),
(1480, '2023-03-27 16:23:40', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1481, '2023-03-27 16:23:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1482, '2023-03-27 16:23:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1483, '2023-03-27 16:23:42', 3, 3, '60260F56409C1861CED6F646E6A59CFE', '37.76.37.198', 'asegit', 'Sipos Dezso'),
(1484, '2023-03-27 16:23:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1485, '2023-03-27 16:23:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1486, '2023-03-27 16:23:42', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1487, '2023-03-27 16:23:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1488, '2023-03-27 16:23:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1489, '2023-03-27 16:23:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1490, '2023-03-27 16:23:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1491, '2023-03-27 16:23:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1492, '2023-03-27 16:23:43', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1493, '2023-03-27 16:23:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1494, '2023-03-27 16:23:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1495, '2023-03-27 16:23:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1496, '2023-03-27 16:23:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1497, '2023-03-27 16:23:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1498, '2023-03-27 16:23:44', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1499, '2023-03-27 16:23:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1500, '2023-03-27 16:23:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1501, '2023-03-27 16:23:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1502, '2023-03-27 16:23:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1503, '2023-03-27 16:23:45', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1504, '2023-03-27 16:23:46', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1505, '2023-03-27 16:23:46', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1506, '2023-03-27 16:23:46', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1507, '2023-03-27 16:23:46', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1508, '2023-03-27 16:23:46', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1509, '2023-03-27 16:23:47', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1510, '2023-03-27 16:23:47', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1511, '2023-03-27 16:23:47', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1512, '2023-03-27 16:23:47', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1513, '2023-03-27 16:23:47', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1514, '2023-03-27 16:23:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1515, '2023-03-27 16:23:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1516, '2023-03-27 16:23:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1517, '2023-03-27 16:23:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1518, '2023-03-27 16:23:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1519, '2023-03-27 16:23:48', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1520, '2023-03-27 16:23:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1521, '2023-03-27 16:23:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1522, '2023-03-27 16:23:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1523, '2023-03-27 16:23:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1524, '2023-03-27 16:23:49', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0'),
(1525, '2023-03-27 16:23:50', 5, 5, '0BC14BA10C1459EF6EBCF9AF86DC8702', '94.27.161.191', 'sethp', 'Sipos Dezso | 0');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `log_economy`
--

CREATE TABLE `log_economy` (
  `logId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `characterId` int(11) NOT NULL,
  `economyType` varchar(1024) COLLATE utf8_hungarian_ci NOT NULL,
  `managedAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `log_economy`
--

INSERT INTO `log_economy` (`logId`, `date`, `characterId`, `economyType`, `managedAmount`) VALUES
(1, '2023-03-26 15:05:21', 1, 'give:admingive', 50000000),
(2, '2023-03-26 17:07:03', 1, 'takeex:rentVehicle', -85000),
(3, '2023-03-27 13:03:30', 1, 'take:buyNewCar', -20500),
(4, '2023-03-27 13:04:39', 3, 'setmoney:admingive', 2147483647),
(5, '2023-03-27 13:04:40', 3, 'take:buyNewCar', -20500),
(6, '2023-03-27 13:27:46', 1, 'take:buyColor', -10000),
(7, '2023-03-27 13:40:23', 4, 'give:admingive', 1000000),
(8, '2023-03-27 13:56:36', 4, 'take:buyNewCar', -350000),
(9, '2023-03-27 14:05:35', 4, 'take:buyOpticalTuning', -1000),
(10, '2023-03-27 14:05:54', 4, 'take:buyOpticalTuning', -2000),
(11, '2023-03-27 14:18:15', 3, 'take:buyNewCar', -350000),
(12, '2023-03-27 14:25:39', 4, 'takeex:giveDocument', 0),
(13, '2023-03-27 14:27:14', 4, 'takeex:giveDocument', 0),
(14, '2023-03-27 14:40:10', 6, 'give:admingive', 1000000),
(15, '2023-03-27 14:40:49', 7, 'setmoney:admingive', 500000000),
(16, '2023-03-27 14:41:24', 5, 'give:admingive', 1000000),
(17, '2023-03-27 14:42:03', 7, 'setmoney:admingive', 50000),
(18, '2023-03-27 14:42:27', 7, 'takeex:buySlotCoin', -40000),
(19, '2023-03-27 14:42:32', 6, 'takeex:giveDocument', 0),
(20, '2023-03-27 14:45:16', 6, 'takeex:rentVehicle', -20000),
(21, '2023-03-27 14:45:46', 3, 'takeex:buySlotCoin', -100000),
(22, '2023-03-27 14:46:08', 6, 'takeex:rentVehicle', -30000),
(23, '2023-03-27 14:47:57', 6, 'take:buyNewCar', -240000),
(24, '2023-03-27 14:49:06', 7, 'give:admingive', 1000000),
(25, '2023-03-27 14:51:20', 9, 'take:buyNewCar', -67600),
(26, '2023-03-27 15:00:30', 6, 'take:buyOpticalTuning', -5000),
(27, '2023-03-27 15:00:36', 6, 'take:buyOpticalTuning', -2000),
(28, '2023-03-27 15:01:04', 6, 'take:buyColor', -10000),
(29, '2023-03-27 15:04:21', 10, 'takeex:rentVehicle', -30000),
(30, '2023-03-27 15:05:20', 5, 'take:buyItemFromPed', -50000),
(31, '2023-03-27 15:09:19', 7, 'take:buyNewCar', -340000),
(32, '2023-03-27 15:14:22', 11, 'take:buyNewCar', -15400),
(33, '2023-03-27 15:15:33', 6, 'take:buyNewCar', -300000),
(34, '2023-03-27 15:18:55', 6, 'take:buyOpticalTuning', -1500),
(35, '2023-03-27 15:19:04', 6, 'take:buyOpticalTuning', -5000),
(36, '2023-03-27 15:19:48', 6, 'take:buyColor', -10000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `log_premiumshop`
--

CREATE TABLE `log_premiumshop` (
  `logId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountId` int(11) NOT NULL,
  `characterId` int(11) NOT NULL,
  `itemId` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `oldPP` int(11) NOT NULL,
  `newPP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `log_premiumshop`
--

INSERT INTO `log_premiumshop` (`logId`, `date`, `accountId`, `characterId`, `itemId`, `amount`, `oldPP`, `newPP`) VALUES
(1, '2023-03-26 14:51:25', 1, 1, 'buynewcar', 1, 10010000, 9950000),
(2, '2023-03-26 15:27:32', 1, 1, '348', 1, 9950000, 9830000),
(3, '2023-03-26 16:49:44', 1, 1, '86', 1, 9830000, 9797000),
(4, '2023-03-26 16:49:48', 1, 1, '74', 1, 9797000, 9707000),
(5, '2023-03-26 16:53:05', 1, 1, '113', 1500, 9707000, 9692000),
(6, '2023-03-26 16:53:12', 1, 1, '240', 1, 9692000, 9689900),
(7, '2023-03-27 12:07:06', 1, 1, 'buynewcar', 1, 9689900, 9639900),
(8, '2023-03-27 13:03:26', 1, 1, 'vehicleslot', 10000, 9639900, 4639900),
(9, '2023-03-27 13:17:29', 3, 3, 'pet', 1, 10000000, 9993000),
(10, '2023-03-27 13:18:33', 1, 1, 'pet', 1, 4639900, 4630900),
(11, '2023-03-27 13:20:41', 3, 3, 'petrevive', 1, 9993000, 9992900),
(12, '2023-03-27 13:21:40', 1, 1, 'petrevive', 1, 4630900, 4630800),
(13, '2023-03-27 13:41:28', 1, 1, '273', 1, 4629150, 4587150),
(14, '2023-03-27 13:41:38', 1, 1, '109', 1500, 4587150, 4572150),
(15, '2023-03-27 13:41:42', 1, 1, '236', 1, 4572150, 4569550),
(16, '2023-03-27 13:52:43', 1, 1, '86', 1, 4569550, 4536550),
(17, '2023-03-27 13:52:48', 1, 1, '81', 1, 4536550, 4473550),
(18, '2023-03-27 13:52:54', 1, 1, '114', 1500, 4473550, 4458550),
(19, '2023-03-27 13:52:58', 1, 1, '243', 1, 4458550, 4455850),
(20, '2023-03-27 14:44:21', 5, 5, '83', 1, 35000, 14000),
(21, '2023-03-27 14:44:27', 5, 5, '238', 1, 14000, 11600),
(22, '2023-03-27 14:44:40', 5, 5, '112', 122, 11600, 10380),
(23, '2023-03-27 14:44:43', 5, 5, '112', 122, 10380, 9160),
(24, '2023-03-27 14:44:49', 5, 5, '112', 211, 9160, 7050),
(25, '2023-03-27 14:49:34', 7, 7, '86', 1, 200000, 167000),
(26, '2023-03-27 14:49:42', 7, 7, '113', 10000, 167000, 67000),
(27, '2023-03-27 14:54:09', 7, 7, '315', 1, 67000, 66990),
(28, '2023-03-27 14:54:15', 7, 7, '190', 10, 66990, 56990),
(29, '2023-03-27 14:54:23', 7, 7, '315', 1, 56990, 56980),
(30, '2023-03-27 14:54:56', 7, 7, '271', 1, 56980, 2980),
(31, '2023-03-27 14:55:04', 7, 7, '239', 1, 2980, 380),
(32, '2023-03-27 15:02:37', 6, 6, '17', 1, 18560, 18310),
(33, '2023-03-27 15:08:06', 1, 1, '110', 1500, 4455850, 4440850),
(34, '2023-03-27 15:18:37', 1, 1, '86', 1, 4440850, 4407850),
(35, '2023-03-27 15:18:39', 1, 1, '113', 1500, 4407850, 4392850),
(36, '2023-03-27 15:18:45', 1, 1, '240', 1, 4392850, 4390750),
(37, '2023-03-27 15:22:16', 6, 6, '65', 1, 15780, 15580),
(38, '2023-03-27 15:22:26', 6, 6, '395', 1, 15580, 15080),
(39, '2023-03-27 15:22:27', 6, 6, '395', 1, 15080, 14580),
(40, '2023-03-27 15:22:29', 6, 6, '395', 1, 14580, 14080),
(41, '2023-03-27 15:38:17', 5, 5, '95', 1, 42050, 21050),
(42, '2023-03-27 15:38:54', 5, 5, '94', 1, 21050, 50),
(43, '2023-03-27 15:58:59', 5, 5, '95', 1, 45050, 24050),
(44, '2023-03-27 15:59:02', 5, 5, '93', 1, 24050, 3050),
(45, '2023-03-27 16:16:15', 3, 3, '86', 1, 9992900, 9959900),
(46, '2023-03-27 16:16:17', 3, 3, '86', 1, 9959900, 9926900),
(47, '2023-03-27 16:16:40', 3, 3, '113', 1000, 9926900, 9916900),
(48, '2023-03-27 16:17:52', 3, 3, '240', 1, 9916900, 9914800),
(49, '2023-03-27 16:17:53', 3, 3, '240', 1, 9914800, 9912700);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `log_vehicle`
--

CREATE TABLE `log_vehicle` (
  `logId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vehicleId` int(11) NOT NULL,
  `characterId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `command` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `arguments` varchar(512) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `log_vehicle`
--

INSERT INTO `log_vehicle` (`logId`, `date`, `vehicleId`, `characterId`, `accountId`, `command`, `arguments`) VALUES
(1, '2023-03-26 17:43:28', 2, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(2, '2023-03-26 17:43:29', 2, 1, 1, 'toggleLock', 'locked: false | adminDuty: 0'),
(3, '2023-03-26 17:43:30', 2, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(4, '2023-03-26 17:43:31', 2, 1, 1, 'toggleLock', 'locked: false | adminDuty: 0'),
(5, '2023-03-27 12:08:29', 3, 1, 1, 'toggleLock', 'locked: true | adminDuty: 1'),
(6, '2023-03-27 12:52:52', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(7, '2023-03-27 12:52:53', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(8, '2023-03-27 12:53:56', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(9, '2023-03-27 12:54:16', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(10, '2023-03-27 12:54:17', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(11, '2023-03-27 12:54:22', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(12, '2023-03-27 12:55:36', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(13, '2023-03-27 12:56:49', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(14, '2023-03-27 12:59:50', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(15, '2023-03-27 13:01:10', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(16, '2023-03-27 13:01:11', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(17, '2023-03-27 13:01:12', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(18, '2023-03-27 13:01:13', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(19, '2023-03-27 13:03:00', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(20, '2023-03-27 13:03:04', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(21, '2023-03-27 13:03:06', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(22, '2023-03-27 13:04:08', 5, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(23, '2023-03-27 13:12:36', 4, 3, 3, 'toggleLock', 'locked: true | adminDuty: 1'),
(24, '2023-03-27 13:12:37', 4, 3, 3, 'toggleLock', 'locked: false | adminDuty: 1'),
(25, '2023-03-27 13:34:32', 3, 1, 1, 'toggleLock', 'locked: true | adminDuty: 1'),
(26, '2023-03-27 13:34:35', 3, 1, 1, 'toggleLock', 'locked: false | adminDuty: 1'),
(27, '2023-03-27 14:07:41', 7, 4, 4, 'toggleLock', 'locked: true | adminDuty: 0'),
(28, '2023-03-27 14:21:29', 8, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(29, '2023-03-27 14:28:03', 2, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(30, '2023-03-27 14:33:29', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(31, '2023-03-27 14:33:31', 10, 3, 3, 'toggleLock', 'locked: false | adminDuty: 0'),
(32, '2023-03-27 14:35:08', 2, 1, 1, 'toggleLock', 'locked: false | adminDuty: 0'),
(33, '2023-03-27 14:47:46', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(34, '2023-03-27 14:47:49', 10, 7, 7, 'toggleLock', 'locked: false | adminDuty: 1'),
(35, '2023-03-27 14:47:49', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(36, '2023-03-27 14:47:51', 10, 7, 7, 'toggleLock', 'locked: false | adminDuty: 1'),
(37, '2023-03-27 14:47:57', 2, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(38, '2023-03-27 14:48:05', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(39, '2023-03-27 14:48:09', 10, 3, 3, 'toggleLock', 'locked: false | adminDuty: 0'),
(40, '2023-03-27 14:48:12', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(41, '2023-03-27 14:48:13', 10, 3, 3, 'toggleLock', 'locked: false | adminDuty: 0'),
(42, '2023-03-27 14:48:16', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(43, '2023-03-27 14:48:24', 14, 6, 6, 'toggleLock', 'locked: true | adminDuty: 0'),
(44, '2023-03-27 14:48:45', 13, 4, 4, 'toggleLock', 'locked: true | adminDuty: 0'),
(45, '2023-03-27 14:48:56', 14, 6, 6, 'toggleLock', 'locked: false | adminDuty: 0'),
(46, '2023-03-27 14:48:57', 14, 6, 6, 'toggleLock', 'locked: true | adminDuty: 0'),
(47, '2023-03-27 14:50:08', 13, 4, 4, 'toggleLock', 'locked: false | adminDuty: 0'),
(48, '2023-03-27 14:53:07', 10, 3, 3, 'toggleLock', 'locked: false | adminDuty: 0'),
(49, '2023-03-27 14:53:10', 13, 4, 4, 'toggleLock', 'locked: true | adminDuty: 0'),
(50, '2023-03-27 14:53:12', 10, 3, 3, 'toggleLock', 'locked: true | adminDuty: 0'),
(51, '2023-03-27 14:53:40', 15, 9, 9, 'toggleLock', 'locked: true | adminDuty: 0'),
(52, '2023-03-27 14:53:49', 14, 6, 6, 'toggleLock', 'locked: false | adminDuty: 0'),
(53, '2023-03-27 14:54:23', 15, 9, 9, 'toggleLock', 'locked: false | adminDuty: 0'),
(54, '2023-03-27 14:54:28', 10, 7, 7, 'toggleLock', 'locked: false | adminDuty: 1'),
(55, '2023-03-27 14:54:38', 10, 7, 7, 'toggleLock', 'locked: true | adminDuty: 1'),
(56, '2023-03-27 14:54:45', 14, 6, 6, 'toggleLock', 'locked: true | adminDuty: 0'),
(57, '2023-03-27 14:55:19', 15, 9, 9, 'toggleLock', 'locked: true | adminDuty: 0'),
(58, '2023-03-27 14:57:29', 14, 6, 6, 'toggleLock', 'locked: false | adminDuty: 0'),
(59, '2023-03-27 14:59:27', 15, 9, 9, 'toggleLock', 'locked: false | adminDuty: 0'),
(60, '2023-03-27 15:02:14', 15, 9, 9, 'toggleLock', 'locked: true | adminDuty: 0'),
(61, '2023-03-27 15:08:56', 14, 6, 6, 'toggleLock', 'locked: true | adminDuty: 0'),
(62, '2023-03-27 15:10:04', 14, 6, 6, 'toggleLock', 'locked: false | adminDuty: 0'),
(63, '2023-03-27 15:14:29', 14, 6, 6, 'toggleLock', 'locked: true | adminDuty: 0'),
(64, '2023-03-27 15:21:32', 2, 1, 1, 'toggleLock', 'locked: false | adminDuty: 0'),
(65, '2023-03-27 15:22:58', 2, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(66, '2023-03-27 15:22:58', 2, 1, 1, 'toggleLock', 'locked: false | adminDuty: 0'),
(67, '2023-03-27 15:32:18', 2, 1, 1, 'toggleLock', 'locked: true | adminDuty: 0'),
(68, '2023-03-27 15:33:24', 2, 5, 5, 'toggleLock', 'locked: false | adminDuty: 1');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lottery`
--

CREATE TABLE `lottery` (
  `id` int(11) NOT NULL,
  `nums` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `prize` bigint(22) NOT NULL DEFAULT '5000',
  `selled` int(11) NOT NULL DEFAULT '0',
  `winners` int(11) NOT NULL DEFAULT '0',
  `started` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mdc_accounts`
--

CREATE TABLE `mdc_accounts` (
  `accountId` int(11) NOT NULL,
  `username` varchar(48) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `leader` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mdc_punishedpeople`
--

CREATE TABLE `mdc_punishedpeople` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `ticket` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  `jail` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  `reason` varchar(60) COLLATE utf8_hungarian_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mdc_wantedcars`
--

CREATE TABLE `mdc_wantedcars` (
  `id` int(11) NOT NULL,
  `type` varchar(48) COLLATE utf8_hungarian_ci NOT NULL,
  `plate` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  `reason` varchar(60) COLLATE utf8_hungarian_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mdc_wantedpeople`
--

CREATE TABLE `mdc_wantedpeople` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `reason` varchar(60) COLLATE utf8_hungarian_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_hungarian_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `passcode`
--

CREATE TABLE `passcode` (
  `id` int(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `peds`
--

CREATE TABLE `peds` (
  `pedId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL DEFAULT '-1',
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL,
  `mainType` int(3) NOT NULL,
  `skinId` int(3) NOT NULL,
  `name` varchar(32) COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'PED',
  `balance` bigint(22) NOT NULL DEFAULT '0',
  `itemList` longtext COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `peds`
--

INSERT INTO `peds` (`pedId`, `ownerId`, `posX`, `posY`, `posZ`, `rotZ`, `interior`, `dimension`, `mainType`, `skinId`, `name`, `balance`, `itemList`) VALUES
(1, -1, 637.319, 1680.51, 7.1875, 46.9865, 0, 0, 7, 300, 'Eladó', 0, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `phonemessages`
--

CREATE TABLE `phonemessages` (
  `recievedPhone` int(11) NOT NULL,
  `senderPhone` int(11) NOT NULL,
  `messageData` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pokertables`
--

CREATE TABLE `pokertables` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL,
  `smallBlind` bigint(20) NOT NULL,
  `bigBlind` bigint(20) NOT NULL,
  `minEntry` int(64) NOT NULL,
  `maxEntry` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roulettes`
--

CREATE TABLE `roulettes` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rz` float NOT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roulettes`
--

INSERT INTO `roulettes` (`id`, `x`, `y`, `z`, `rz`, `interior`, `dimension`) VALUES
(1, 1960.94, 1024.99, 992.544, 358.15, 10, 347),
(2, 1961.29, 1011.74, 992.544, 1.77612, 10, 347);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `safes`
--

CREATE TABLE `safes` (
  `dbID` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(3) NOT NULL,
  `dimension` int(5) NOT NULL,
  `ownerGroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `safes`
--

INSERT INTO `safes` (`dbID`, `posX`, `posY`, `posZ`, `rotZ`, `interior`, `dimension`, `ownerGroup`) VALUES
(1, 2318.2, -1212.88, 1048.47, 179.558, 6, 510, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `stocks`
--

CREATE TABLE `stocks` (
  `name` varchar(255) NOT NULL DEFAULT '0',
  `amount` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `trashes`
--

CREATE TABLE `trashes` (
  `trashId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(3) NOT NULL,
  `dimension` int(5) NOT NULL,
  `model` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `trashes`
--

INSERT INTO `trashes` (`trashId`, `posX`, `posY`, `posZ`, `rotZ`, `interior`, `dimension`, `model`) VALUES
(1, 1044.07, 1009.29, 10.7, 143.591, 0, 0, 1359),
(2, 1671.52, 1819.72, 10.5203, 268.892, 0, 0, 1359),
(4, 1059.43, 1363.79, 10.5203, 183.29, 0, 0, 1359),
(5, 886.037, 2006.3, 10.5203, 90.7787, 0, 0, 1359),
(6, 997.255, 2142.88, 10.5203, 352.235, 0, 0, 1359),
(7, 661.442, 1714.88, 6.89489, 195.672, 0, 0, 1359),
(8, 996.996, 1317.74, 10.5203, 229.653, 0, 0, 1359),
(9, 999.364, 1067.49, 10.5203, 185.197, 0, 0, 1359),
(10, 640.292, 1685.23, 6.8875, 223.001, 0, 0, 1359),
(11, 1037.54, 2468.54, 10.5203, 340.667, 0, 0, 1359);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicleId` int(22) NOT NULL,
  `ownerId` int(22) NOT NULL,
  `modelId` int(3) NOT NULL,
  `groupId` int(3) NOT NULL DEFAULT '0',
  `last_position` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `last_rotation` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `last_interior` int(11) NOT NULL,
  `last_dimension` int(11) NOT NULL,
  `park_position` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `park_rotation` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `park_interior` int(11) NOT NULL,
  `park_dimension` int(11) NOT NULL,
  `color1` varchar(7) COLLATE utf8_hungarian_ci NOT NULL,
  `color2` varchar(7) COLLATE utf8_hungarian_ci NOT NULL,
  `color3` varchar(7) COLLATE utf8_hungarian_ci NOT NULL,
  `color4` varchar(7) COLLATE utf8_hungarian_ci NOT NULL,
  `headLightColor` varchar(7) COLLATE utf8_hungarian_ci NOT NULL,
  `wheelStates` varchar(7) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `panelStates` varchar(13) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `doorStates` varchar(11) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `plateText` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  `health` float NOT NULL DEFAULT '1000',
  `engine` int(1) NOT NULL DEFAULT '0',
  `lights` int(1) NOT NULL DEFAULT '0',
  `locked` int(1) NOT NULL DEFAULT '0',
  `handBrake` int(1) NOT NULL DEFAULT '0',
  `fuel` int(4) NOT NULL DEFAULT '100',
  `distance` int(11) NOT NULL DEFAULT '0',
  `impounded` int(1) NOT NULL DEFAULT '0',
  `variant` int(1) NOT NULL DEFAULT '0',
  `handlingFlags` int(16) NOT NULL DEFAULT '0',
  `modelFlags` int(16) NOT NULL DEFAULT '0',
  `tuningEngine` int(1) NOT NULL DEFAULT '0',
  `tuningTurbo` int(1) NOT NULL DEFAULT '0',
  `tuningECU` int(1) NOT NULL DEFAULT '0',
  `tuningTransmission` int(1) NOT NULL DEFAULT '0',
  `tuningSuspension` int(1) NOT NULL DEFAULT '0',
  `tuningBrakes` int(1) NOT NULL DEFAULT '0',
  `tuningTires` int(1) NOT NULL DEFAULT '0',
  `tuningNitroLevel` int(3) NOT NULL DEFAULT '0',
  `tuningWeightReduction` int(1) NOT NULL DEFAULT '0',
  `tuningOptical` tinytext COLLATE utf8_hungarian_ci,
  `tuningNeon` int(5) NOT NULL DEFAULT '0',
  `tuningAirRide` int(1) NOT NULL DEFAULT '0',
  `tuningSpinners` tinytext COLLATE utf8_hungarian_ci,
  `tuningDoorType` tinytext COLLATE utf8_hungarian_ci,
  `tuningPaintjob` int(5) NOT NULL DEFAULT '0',
  `tuningWheelPaintjob` int(5) NOT NULL DEFAULT '0',
  `tuningHeadLight` int(5) NOT NULL DEFAULT '0',
  `tuningDriveType` varchar(3) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `tuningSteeringLock` int(3) NOT NULL DEFAULT '0',
  `airRideMemory` varchar(5) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '8,8',
  `speedoColor` varchar(16) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '#FFFFFF;#FFFFFF',
  `traffipaxRadar` int(1) NOT NULL DEFAULT '0',
  `gpsNavigation` int(1) NOT NULL DEFAULT '0',
  `customHorn` int(2) NOT NULL DEFAULT '0',
  `activeDriveType` varchar(3) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `backFire` int(11) NOT NULL DEFAULT '0',
  `radioVolume` int(11) NOT NULL DEFAULT '100',
  `radioPower` int(11) NOT NULL DEFAULT '0',
  `radioChannel` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vehicles`
--

INSERT INTO `vehicles` (`vehicleId`, `ownerId`, `modelId`, `groupId`, `last_position`, `last_rotation`, `last_interior`, `last_dimension`, `park_position`, `park_rotation`, `park_interior`, `park_dimension`, `color1`, `color2`, `color3`, `color4`, `headLightColor`, `wheelStates`, `panelStates`, `doorStates`, `plateText`, `health`, `engine`, `lights`, `locked`, `handBrake`, `fuel`, `distance`, `impounded`, `variant`, `handlingFlags`, `modelFlags`, `tuningEngine`, `tuningTurbo`, `tuningECU`, `tuningTransmission`, `tuningSuspension`, `tuningBrakes`, `tuningTires`, `tuningNitroLevel`, `tuningWeightReduction`, `tuningOptical`, `tuningNeon`, `tuningAirRide`, `tuningSpinners`, `tuningDoorType`, `tuningPaintjob`, `tuningWheelPaintjob`, `tuningHeadLight`, `tuningDriveType`, `tuningSteeringLock`, `airRideMemory`, `speedoColor`, `traffipaxRadar`, `gpsNavigation`, `customHorn`, `activeDriveType`, `backFire`, `radioVolume`, `radioPower`, `radioChannel`) VALUES
(2, 1, 426, 0, '1222.7333984375,2018.4150390625,6.734375', '0,0,112.41107177734', 0, 0, '1298.4013671875,2537.7294921875,10.456868171692', '0.50537109375,354.75402832031,357.626953125', 0, 0, '7F7F7F', 'FFFFFF', '', '', '', NULL, NULL, NULL, '-AAA-02', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 4, 5, 4, 4, 4, 4, 4, 0, 4, NULL, 0, 0, NULL, NULL, 0, 0, 0, 'awd', 50, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 1, 100, 0, 1),
(3, 1, 549, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#659199', '#079E4F', '#FFFFFF', '#FFFFFF', '', NULL, NULL, NULL, '-AAA-03', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 17412, 0, 4, 4, 4, 4, 4, 4, 4, 0, 4, NULL, 0, 0, NULL, NULL, 0, 0, 0, 'awd', 50, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 1, 100, 0, 1),
(4, 1, 445, 0, '1031.884765625,1024.0625,11', '0,0,169.00250244141', 0, 0, '1031.884765625,1024.0625,11', '0,0,169.00250244141', 0, 0, '7F7F7F', 'FFFFFF', '', '', '', NULL, NULL, NULL, '-AAA-04', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 'awd', 50, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(5, 1, 410, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#6F0205', '#6F0205', '', '', '', NULL, NULL, NULL, '-AAA-05', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(6, 3, 410, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#6A6B6D', '#6A6B6D', '', '', '', NULL, NULL, NULL, '-AAA-06', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(7, 4, 560, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#C81219', '#C81219', '', '', '', NULL, NULL, NULL, '-AAA-07', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 0, 0, '1032,1028,', 0, 0, NULL, NULL, 0, 0, 0, '', 40, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(8, 3, 560, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#C81219', '#C81219', '', '', '', NULL, NULL, NULL, '-AAA-08', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(9, 5, 445, 0, '1663.458984375,1825.802734375,11.424247741699', '0,0,342.75393676758', 0, 0, '1663.458984375,1825.802734375,11.424247741699', '0,0,342.75393676758', 0, 0, '7F7F7F', 'FFFFFF', '', '', '', NULL, NULL, NULL, '-AAA-09', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(10, 3, 445, 0, '1665.3232421875,1825.787109375,10.8203125', '0,0,279.99359130859', 0, 0, '1665.3232421875,1825.787109375,10.8203125', '0,0,279.99359130859', 0, 0, '7F7F7F', 'FFFFFF', '', '', '', NULL, NULL, NULL, '-AAA-10', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 'awd', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(13, 4, 502, 0, '726.4072265625,1250.271484375,18.633146286011', '0,0,182.66970825195', 0, 0, '726.4072265625,1250.271484375,18.633146286011', '0,0,182.66970825195', 0, 0, '7F7F7F', 'FFFFFF', '', '', '', NULL, NULL, NULL, '-AAA-13', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 12600320, 0, 4, 4, 3, 4, 4, 4, 3, 30, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 'awd', 50, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(14, 6, 420, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#191919', '#04509C', '#FFFFFF', '#FFFFFF', '', NULL, NULL, NULL, '-AAA-14', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 94, 0, '1077,1021,', 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(15, 9, 438, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#6F0205', '#6F0205', '', '', '', NULL, NULL, NULL, '-AAA-15', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(16, 7, 566, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#E7741B', '#E7741B', '', '', '', NULL, NULL, NULL, '-AAA-16', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(17, 11, 542, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#FFFFFF', '#FFFFFF', '', '', '', NULL, NULL, NULL, '-AAA-17', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1),
(18, 6, 540, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '1743.9461669922,1858.1097412109,10.8203125', '0,0,0', 0, 0, '#FFFFFF', '#E7741B', '#FFFFFF', '#FFFFFF', '', NULL, NULL, NULL, '-AAA-18', 1000, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 99, 4, '1015,1073,', 0, 0, NULL, NULL, 2, 0, 0, '', 0, '8,8', '#FFFFFF;#FFFFFF', 0, 0, 0, '', 0, 100, 0, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `whitelist`
--

CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `worlditems`
--

CREATE TABLE `worlditems` (
  `itemDbID` int(11) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creatorCharacter` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotX` float NOT NULL,
  `rotY` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(3) NOT NULL,
  `dimension` int(5) NOT NULL,
  `model` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD PRIMARY KEY (`accountId`);

--
-- A tábla indexei `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accountId`);

--
-- A tábla indexei `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`animalId`);

--
-- A tábla indexei `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`dbID`);

--
-- A tábla indexei `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `bank_transaction`
--
ALTER TABLE `bank_transaction`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`banId`);

--
-- A tábla indexei `billiards`
--
ALTER TABLE `billiards`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `blackjack`
--
ALTER TABLE `blackjack`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `casinopeds`
--
ALTER TABLE `casinopeds`
  ADD PRIMARY KEY (`pedId`);

--
-- A tábla indexei `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`characterId`);

--
-- A tábla indexei `companys`
--
ALTER TABLE `companys`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `companytransactions`
--
ALTER TABLE `companytransactions`
  ADD PRIMARY KEY (`dbid`);

--
-- A tábla indexei `companyvehicles`
--
ALTER TABLE `companyvehicles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `copiers`
--
ALTER TABLE `copiers`
  ADD PRIMARY KEY (`copierId`);

--
-- A tábla indexei `crypto_desks`
--
ALTER TABLE `crypto_desks`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `crypto_rigs`
--
ALTER TABLE `crypto_rigs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `crypto_stacks`
--
ALTER TABLE `crypto_stacks`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `farms`
--
ALTER TABLE `farms`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `fortunewheels`
--
ALTER TABLE `fortunewheels`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `gamemachines`
--
ALTER TABLE `gamemachines`
  ADD PRIMARY KEY (`dbId`);

--
-- A tábla indexei `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD PRIMARY KEY (`dbID`);

--
-- A tábla indexei `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupId`);

--
-- A tábla indexei `interiors`
--
ALTER TABLE `interiors`
  ADD PRIMARY KEY (`interiorId`);

--
-- A tábla indexei `interior_datas`
--
ALTER TABLE `interior_datas`
  ADD PRIMARY KEY (`interiorId`);

--
-- A tábla indexei `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`dbID`);

--
-- A tábla indexei `log_adminjail`
--
ALTER TABLE `log_adminjail`
  ADD PRIMARY KEY (`logId`);

--
-- A tábla indexei `log_command`
--
ALTER TABLE `log_command`
  ADD PRIMARY KEY (`logId`);

--
-- A tábla indexei `log_economy`
--
ALTER TABLE `log_economy`
  ADD PRIMARY KEY (`logId`);

--
-- A tábla indexei `log_premiumshop`
--
ALTER TABLE `log_premiumshop`
  ADD PRIMARY KEY (`logId`);

--
-- A tábla indexei `log_vehicle`
--
ALTER TABLE `log_vehicle`
  ADD PRIMARY KEY (`logId`);

--
-- A tábla indexei `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mdc_accounts`
--
ALTER TABLE `mdc_accounts`
  ADD PRIMARY KEY (`accountId`);

--
-- A tábla indexei `mdc_punishedpeople`
--
ALTER TABLE `mdc_punishedpeople`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mdc_wantedcars`
--
ALTER TABLE `mdc_wantedcars`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mdc_wantedpeople`
--
ALTER TABLE `mdc_wantedpeople`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `passcode`
--
ALTER TABLE `passcode`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `peds`
--
ALTER TABLE `peds`
  ADD PRIMARY KEY (`pedId`);

--
-- A tábla indexei `phonemessages`
--
ALTER TABLE `phonemessages`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `pokertables`
--
ALTER TABLE `pokertables`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `roulettes`
--
ALTER TABLE `roulettes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `safes`
--
ALTER TABLE `safes`
  ADD PRIMARY KEY (`dbID`);

--
-- A tábla indexei `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`name`);

--
-- A tábla indexei `trashes`
--
ALTER TABLE `trashes`
  ADD PRIMARY KEY (`trashId`);

--
-- A tábla indexei `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicleId`);

--
-- A tábla indexei `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `worlditems`
--
ALTER TABLE `worlditems`
  ADD PRIMARY KEY (`itemDbID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `accounts`
--
ALTER TABLE `accounts`
  MODIFY `accountId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `animals`
--
ALTER TABLE `animals`
  MODIFY `animalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `atms`
--
ALTER TABLE `atms`
  MODIFY `dbID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `bank_transaction`
--
ALTER TABLE `bank_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `bans`
--
ALTER TABLE `bans`
  MODIFY `banId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `billiards`
--
ALTER TABLE `billiards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `blackjack`
--
ALTER TABLE `blackjack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `casinopeds`
--
ALTER TABLE `casinopeds`
  MODIFY `pedId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `characters`
--
ALTER TABLE `characters`
  MODIFY `characterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `companys`
--
ALTER TABLE `companys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `companytransactions`
--
ALTER TABLE `companytransactions`
  MODIFY `dbid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `companyvehicles`
--
ALTER TABLE `companyvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `copiers`
--
ALTER TABLE `copiers`
  MODIFY `copierId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `crypto_desks`
--
ALTER TABLE `crypto_desks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `crypto_rigs`
--
ALTER TABLE `crypto_rigs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `crypto_stacks`
--
ALTER TABLE `crypto_stacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `farms`
--
ALTER TABLE `farms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `fortunewheels`
--
ALTER TABLE `fortunewheels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `gamemachines`
--
ALTER TABLE `gamemachines`
  MODIFY `dbId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `groupmembers`
--
ALTER TABLE `groupmembers`
  MODIFY `dbID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `groups`
--
ALTER TABLE `groups`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `interiors`
--
ALTER TABLE `interiors`
  MODIFY `interiorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT a táblához `items`
--
ALTER TABLE `items`
  MODIFY `dbID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT a táblához `log_adminjail`
--
ALTER TABLE `log_adminjail`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `log_command`
--
ALTER TABLE `log_command`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1526;

--
-- AUTO_INCREMENT a táblához `log_economy`
--
ALTER TABLE `log_economy`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT a táblához `log_premiumshop`
--
ALTER TABLE `log_premiumshop`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT a táblához `log_vehicle`
--
ALTER TABLE `log_vehicle`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT a táblához `lottery`
--
ALTER TABLE `lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mdc_accounts`
--
ALTER TABLE `mdc_accounts`
  MODIFY `accountId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mdc_punishedpeople`
--
ALTER TABLE `mdc_punishedpeople`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mdc_wantedcars`
--
ALTER TABLE `mdc_wantedcars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mdc_wantedpeople`
--
ALTER TABLE `mdc_wantedpeople`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `passcode`
--
ALTER TABLE `passcode`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `peds`
--
ALTER TABLE `peds`
  MODIFY `pedId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `phonemessages`
--
ALTER TABLE `phonemessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pokertables`
--
ALTER TABLE `pokertables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `roulettes`
--
ALTER TABLE `roulettes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `safes`
--
ALTER TABLE `safes`
  MODIFY `dbID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `trashes`
--
ALTER TABLE `trashes`
  MODIFY `trashId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicleId` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `whitelist`
--
ALTER TABLE `whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
