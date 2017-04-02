-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 01 Avril 2017 à 15:23
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetlaravel`
--
CREATE DATABASE IF NOT EXISTS `projetlaravel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projetlaravel`;

-- --------------------------------------------------------

--
-- Structure de la table `comment_tag`
--

CREATE TABLE `comment_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `comment_tag`
--

INSERT INTO `comment_tag` (`id`, `comment_id`, `tag_id`) VALUES
(6, 5, 3),
(7, 6, 1),
(8, 8, 1),
(9, 9, 1),
(12, 11, 6),
(13, 11, 5);

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `auteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `content`, `user_id`, `active`, `auteur`, `parent_id`, `created_at`, `updated_at`) VALUES
(5, 'test tag2', 42, 0, 'Admin', 0, '2017-03-19 15:12:18', '2017-03-19 15:43:20'),
(6, 'test', 42, 0, 'Elien', 0, '2017-03-25 16:35:21', '2017-03-25 16:35:21'),
(8, 'bonjour', 42, 0, 'Admin', 0, '2017-03-29 13:33:16', '2017-03-29 13:33:16'),
(9, 'test', 1, 0, 'Elien', 0, '2017-03-29 14:22:01', '2017-03-29 14:22:01'),
(11, 'C\'est élève n\'est plus présent à Ingésup', 30, 0, 'Admin', 0, '2017-03-30 18:58:00', '2017-03-30 18:58:00');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2017_03_10_132214_create_notables_table', 1),
(6, '2017_03_15_172848_create_commentaires_table', 2),
(9, '2017_03_15_172931_create_tags_table', 3),
(8, '2017_03_18_181015_create_notes_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note` int(11) NOT NULL,
  `coeff` int(11) NOT NULL,
  `epreuve` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `note`, `coeff`, `epreuve`, `created_at`, `updated_at`) VALUES
(1324, 1, 9, 1, 'laravel', NULL, NULL),
(1325, 1, 12, 1, 'laravel', NULL, NULL),
(1326, 2, 20, 1, 'laravel', NULL, NULL),
(1327, 2, 5, 1, 'laravel', NULL, NULL),
(1328, 3, 10, 1, 'laravel', NULL, NULL),
(1329, 3, 13, 1, 'laravel', NULL, NULL),
(1330, 4, 10, 1, 'laravel', NULL, NULL),
(1331, 4, 9, 1, 'laravel', NULL, NULL),
(1332, 5, 16, 1, 'laravel', NULL, NULL),
(1333, 5, 5, 1, 'laravel', NULL, NULL),
(1334, 6, 5, 1, 'laravel', NULL, NULL),
(1335, 6, 6, 1, 'laravel', NULL, NULL),
(1336, 7, 9, 1, 'laravel', NULL, NULL),
(1337, 7, 14, 1, 'laravel', NULL, NULL),
(1338, 8, 17, 1, 'laravel', NULL, NULL),
(1339, 8, 17, 1, 'laravel', NULL, NULL),
(1340, 9, 15, 1, 'laravel', NULL, NULL),
(1341, 9, 9, 1, 'laravel', NULL, NULL),
(1342, 10, 17, 1, 'laravel', NULL, NULL),
(1343, 10, 8, 1, 'laravel', NULL, NULL),
(1344, 11, 15, 1, 'laravel', NULL, NULL),
(1345, 11, 15, 1, 'laravel', NULL, NULL),
(1346, 12, 17, 1, 'laravel', NULL, NULL),
(1347, 12, 16, 1, 'laravel', NULL, NULL),
(1348, 13, 17, 1, 'laravel', NULL, NULL),
(1349, 13, 19, 1, 'laravel', NULL, NULL),
(1350, 14, 20, 1, 'laravel', NULL, NULL),
(1351, 14, 7, 1, 'laravel', NULL, NULL),
(1352, 15, 6, 1, 'laravel', NULL, NULL),
(1353, 15, 13, 1, 'laravel', NULL, NULL),
(1354, 16, 6, 1, 'laravel', NULL, NULL),
(1355, 16, 18, 1, 'laravel', NULL, NULL),
(1356, 17, 20, 1, 'laravel', NULL, NULL),
(1357, 17, 15, 1, 'laravel', NULL, NULL),
(1358, 18, 10, 1, 'laravel', NULL, NULL),
(1359, 18, 16, 1, 'laravel', NULL, NULL),
(1360, 19, 11, 1, 'laravel', NULL, NULL),
(1361, 19, 19, 1, 'laravel', NULL, NULL),
(1362, 20, 12, 1, 'laravel', NULL, NULL),
(1363, 20, 20, 1, 'laravel', NULL, NULL),
(1364, 21, 18, 1, 'laravel', NULL, NULL),
(1365, 21, 10, 1, 'laravel', NULL, NULL),
(1366, 22, 15, 1, 'laravel', NULL, NULL),
(1367, 22, 14, 1, 'laravel', NULL, NULL),
(1368, 23, 10, 1, 'laravel', NULL, NULL),
(1369, 23, 13, 1, 'laravel', NULL, NULL),
(1370, 24, 15, 1, 'laravel', NULL, NULL),
(1371, 24, 18, 1, 'laravel', NULL, NULL),
(1372, 25, 9, 1, 'laravel', NULL, NULL),
(1373, 25, 15, 1, 'laravel', NULL, NULL),
(1374, 26, 15, 1, 'laravel', NULL, NULL),
(1375, 26, 13, 1, 'laravel', NULL, NULL),
(1376, 27, 14, 1, 'laravel', NULL, NULL),
(1377, 27, 8, 1, 'laravel', NULL, NULL),
(1378, 28, 10, 1, 'laravel', NULL, NULL),
(1379, 28, 6, 1, 'laravel', NULL, NULL),
(1380, 29, 19, 1, 'laravel', NULL, NULL),
(1381, 29, 10, 1, 'laravel', NULL, NULL),
(1382, 30, 5, 1, 'laravel', NULL, NULL),
(1383, 30, 10, 1, 'laravel', NULL, NULL),
(1384, 31, 5, 1, 'laravel', NULL, NULL),
(1385, 31, 15, 1, 'laravel', NULL, NULL),
(1386, 32, 11, 1, 'laravel', NULL, NULL),
(1387, 32, 14, 1, 'laravel', NULL, NULL),
(1388, 33, 13, 1, 'laravel', NULL, NULL),
(1389, 33, 8, 1, 'laravel', NULL, NULL),
(1390, 34, 15, 1, 'laravel', NULL, NULL),
(1391, 34, 16, 1, 'laravel', NULL, NULL),
(1392, 35, 10, 1, 'laravel', NULL, NULL),
(1393, 35, 14, 1, 'laravel', NULL, NULL),
(1394, 36, 12, 1, 'laravel', NULL, NULL),
(1395, 36, 6, 1, 'laravel', NULL, NULL),
(1396, 37, 19, 1, 'laravel', NULL, NULL),
(1397, 37, 20, 1, 'laravel', NULL, NULL),
(1398, 38, 7, 1, 'laravel', NULL, NULL),
(1399, 38, 12, 1, 'laravel', NULL, NULL),
(1400, 39, 8, 1, 'laravel', NULL, NULL),
(1401, 39, 18, 1, 'laravel', NULL, NULL),
(1402, 40, 10, 1, 'laravel', NULL, NULL),
(1403, 40, 9, 1, 'laravel', NULL, NULL),
(1404, 41, 17, 1, 'laravel', NULL, NULL),
(1405, 41, 11, 1, 'laravel', NULL, NULL),
(1406, 42, 10, 1, 'laravel', NULL, NULL),
(1407, 42, 9, 1, 'laravel', NULL, NULL),
(1408, 43, 12, 1, 'laravel', NULL, NULL),
(1409, 43, 7, 1, 'laravel', NULL, NULL),
(1412, 1, 9, 1, 'linux', NULL, NULL),
(1413, 1, 16, 1, 'linux', NULL, NULL),
(1414, 2, 12, 1, 'linux', NULL, NULL),
(1415, 2, 5, 1, 'linux', NULL, NULL),
(1416, 3, 10, 1, 'linux', NULL, NULL),
(1417, 3, 18, 1, 'linux', NULL, NULL),
(1418, 4, 10, 1, 'linux', NULL, NULL),
(1419, 4, 20, 1, 'linux', NULL, NULL),
(1420, 5, 18, 1, 'linux', NULL, NULL),
(1421, 5, 6, 1, 'linux', NULL, NULL),
(1422, 6, 20, 1, 'linux', NULL, NULL),
(1423, 6, 8, 1, 'linux', NULL, NULL),
(1424, 7, 16, 1, 'linux', NULL, NULL),
(1425, 7, 16, 1, 'linux', NULL, NULL),
(1426, 8, 7, 1, 'linux', NULL, NULL),
(1427, 8, 15, 1, 'linux', NULL, NULL),
(1428, 9, 14, 1, 'linux', NULL, NULL),
(1429, 9, 10, 1, 'linux', NULL, NULL),
(1430, 10, 8, 1, 'linux', NULL, NULL),
(1431, 10, 18, 1, 'linux', NULL, NULL),
(1432, 11, 15, 1, 'linux', NULL, NULL),
(1433, 11, 8, 1, 'linux', NULL, NULL),
(1434, 12, 5, 1, 'linux', NULL, NULL),
(1435, 12, 17, 1, 'linux', NULL, NULL),
(1436, 13, 12, 1, 'linux', NULL, NULL),
(1437, 13, 6, 1, 'linux', NULL, NULL),
(1438, 14, 19, 1, 'linux', NULL, NULL),
(1439, 14, 17, 1, 'linux', NULL, NULL),
(1440, 15, 5, 1, 'linux', NULL, NULL),
(1441, 15, 7, 1, 'linux', NULL, NULL),
(1442, 16, 16, 1, 'linux', NULL, NULL),
(1443, 16, 20, 1, 'linux', NULL, NULL),
(1444, 17, 5, 1, 'linux', NULL, NULL),
(1445, 17, 7, 1, 'linux', NULL, NULL),
(1446, 18, 18, 1, 'linux', NULL, NULL),
(1447, 18, 16, 1, 'linux', NULL, NULL),
(1448, 19, 13, 1, 'linux', NULL, NULL),
(1449, 19, 9, 1, 'linux', NULL, NULL),
(1450, 20, 5, 1, 'linux', NULL, NULL),
(1451, 20, 5, 1, 'linux', NULL, NULL),
(1452, 21, 7, 1, 'linux', NULL, NULL),
(1453, 21, 9, 1, 'linux', NULL, NULL),
(1454, 22, 16, 1, 'linux', NULL, NULL),
(1455, 22, 10, 1, 'linux', NULL, NULL),
(1456, 23, 20, 1, 'linux', NULL, NULL),
(1457, 23, 10, 1, 'linux', NULL, NULL),
(1458, 24, 15, 1, 'linux', NULL, NULL),
(1459, 24, 16, 1, 'linux', NULL, NULL),
(1460, 25, 14, 1, 'linux', NULL, NULL),
(1461, 25, 7, 1, 'linux', NULL, NULL),
(1462, 26, 9, 1, 'linux', NULL, NULL),
(1463, 26, 12, 1, 'linux', NULL, NULL),
(1464, 27, 5, 1, 'linux', NULL, NULL),
(1465, 27, 5, 1, 'linux', NULL, NULL),
(1466, 28, 11, 1, 'linux', NULL, NULL),
(1467, 28, 16, 1, 'linux', NULL, NULL),
(1468, 29, 20, 1, 'linux', NULL, NULL),
(1469, 29, 15, 1, 'linux', NULL, NULL),
(1470, 30, 10, 1, 'linux', NULL, NULL),
(1471, 30, 19, 1, 'linux', NULL, NULL),
(1472, 31, 13, 1, 'linux', NULL, NULL),
(1473, 31, 8, 1, 'linux', NULL, NULL),
(1474, 32, 20, 1, 'linux', NULL, NULL),
(1475, 32, 19, 1, 'linux', NULL, NULL),
(1476, 33, 7, 1, 'linux', NULL, NULL),
(1477, 33, 12, 1, 'linux', NULL, NULL),
(1478, 34, 14, 1, 'linux', NULL, NULL),
(1479, 34, 9, 1, 'linux', NULL, NULL),
(1480, 35, 6, 1, 'linux', NULL, NULL),
(1481, 35, 13, 1, 'linux', NULL, NULL),
(1482, 36, 6, 1, 'linux', NULL, NULL),
(1483, 36, 20, 1, 'linux', NULL, NULL),
(1484, 37, 19, 1, 'linux', NULL, NULL),
(1485, 37, 9, 1, 'linux', NULL, NULL),
(1486, 38, 17, 1, 'linux', NULL, NULL),
(1487, 38, 11, 1, 'linux', NULL, NULL),
(1488, 39, 14, 1, 'linux', NULL, NULL),
(1489, 39, 18, 1, 'linux', NULL, NULL),
(1490, 40, 14, 1, 'linux', NULL, NULL),
(1491, 40, 14, 1, 'linux', NULL, NULL),
(1492, 41, 19, 1, 'linux', NULL, NULL),
(1493, 41, 19, 1, 'linux', NULL, NULL),
(1494, 42, 16, 1, 'linux', NULL, NULL),
(1495, 42, 5, 1, 'linux', NULL, NULL),
(1496, 43, 17, 1, 'linux', NULL, NULL),
(1497, 43, 17, 1, 'linux', NULL, NULL),
(1500, 1, 18, 1, 'html', NULL, NULL),
(1501, 1, 8, 1, 'html', NULL, NULL),
(1502, 2, 20, 1, 'html', NULL, NULL),
(1503, 2, 20, 1, 'html', NULL, NULL),
(1504, 3, 19, 1, 'html', NULL, NULL),
(1505, 3, 7, 1, 'html', NULL, NULL),
(1506, 4, 13, 1, 'html', NULL, NULL),
(1507, 4, 16, 1, 'html', NULL, NULL),
(1508, 5, 20, 1, 'html', NULL, NULL),
(1509, 5, 7, 1, 'html', NULL, NULL),
(1510, 6, 17, 1, 'html', NULL, NULL),
(1511, 6, 7, 1, 'html', NULL, NULL),
(1512, 7, 7, 1, 'html', NULL, NULL),
(1513, 7, 16, 1, 'html', NULL, NULL),
(1514, 8, 10, 1, 'html', NULL, NULL),
(1515, 8, 13, 1, 'html', NULL, NULL),
(1516, 9, 18, 1, 'html', NULL, NULL),
(1517, 9, 5, 1, 'html', NULL, NULL),
(1518, 10, 13, 1, 'html', NULL, NULL),
(1519, 10, 16, 1, 'html', NULL, NULL),
(1520, 11, 20, 1, 'html', NULL, NULL),
(1521, 11, 14, 1, 'html', NULL, NULL),
(1522, 12, 20, 1, 'html', NULL, NULL),
(1523, 12, 6, 1, 'html', NULL, NULL),
(1524, 13, 7, 1, 'html', NULL, NULL),
(1525, 13, 13, 1, 'html', NULL, NULL),
(1526, 14, 20, 1, 'html', NULL, NULL),
(1527, 14, 11, 1, 'html', NULL, NULL),
(1528, 15, 8, 1, 'html', NULL, NULL),
(1529, 15, 11, 1, 'html', NULL, NULL),
(1530, 16, 7, 1, 'html', NULL, NULL),
(1531, 16, 5, 1, 'html', NULL, NULL),
(1532, 17, 16, 1, 'html', NULL, NULL),
(1533, 17, 11, 1, 'html', NULL, NULL),
(1534, 18, 17, 1, 'html', NULL, NULL),
(1535, 18, 19, 1, 'html', NULL, NULL),
(1536, 19, 14, 1, 'html', NULL, NULL),
(1537, 19, 5, 1, 'html', NULL, NULL),
(1538, 20, 14, 1, 'html', NULL, NULL),
(1539, 20, 9, 1, 'html', NULL, NULL),
(1540, 21, 9, 1, 'html', NULL, NULL),
(1541, 21, 12, 1, 'html', NULL, NULL),
(1542, 22, 17, 1, 'html', NULL, NULL),
(1543, 22, 20, 1, 'html', NULL, NULL),
(1544, 23, 17, 1, 'html', NULL, NULL),
(1545, 23, 8, 1, 'html', NULL, NULL),
(1546, 24, 7, 1, 'html', NULL, NULL),
(1547, 24, 11, 1, 'html', NULL, NULL),
(1548, 25, 14, 1, 'html', NULL, NULL),
(1549, 25, 11, 1, 'html', NULL, NULL),
(1550, 26, 17, 1, 'html', NULL, NULL),
(1551, 26, 11, 1, 'html', NULL, NULL),
(1552, 27, 15, 1, 'html', NULL, NULL),
(1553, 27, 15, 1, 'html', NULL, NULL),
(1554, 28, 12, 1, 'html', NULL, NULL),
(1555, 28, 9, 1, 'html', NULL, NULL),
(1556, 29, 11, 1, 'html', NULL, NULL),
(1557, 29, 5, 1, 'html', NULL, NULL),
(1558, 30, 11, 1, 'html', NULL, NULL),
(1559, 30, 19, 1, 'html', NULL, NULL),
(1560, 31, 18, 1, 'html', NULL, NULL),
(1561, 31, 6, 1, 'html', NULL, NULL),
(1562, 32, 10, 1, 'html', NULL, NULL),
(1563, 32, 14, 1, 'html', NULL, NULL),
(1564, 33, 12, 1, 'html', NULL, NULL),
(1565, 33, 20, 1, 'html', NULL, NULL),
(1566, 34, 12, 1, 'html', NULL, NULL),
(1567, 34, 8, 1, 'html', NULL, NULL),
(1568, 35, 7, 1, 'html', NULL, NULL),
(1569, 35, 10, 1, 'html', NULL, NULL),
(1570, 36, 13, 1, 'html', NULL, NULL),
(1571, 36, 7, 1, 'html', NULL, NULL),
(1572, 37, 12, 1, 'html', NULL, NULL),
(1573, 37, 7, 1, 'html', NULL, NULL),
(1574, 38, 16, 1, 'html', NULL, NULL),
(1575, 38, 7, 1, 'html', NULL, NULL),
(1576, 39, 10, 1, 'html', NULL, NULL),
(1577, 39, 6, 1, 'html', NULL, NULL),
(1578, 40, 17, 1, 'html', NULL, NULL),
(1579, 40, 15, 1, 'html', NULL, NULL),
(1580, 41, 9, 1, 'html', NULL, NULL),
(1581, 41, 7, 1, 'html', NULL, NULL),
(1582, 42, 19, 1, 'html', NULL, NULL),
(1583, 42, 18, 1, 'html', NULL, '2017-04-01 11:30:01'),
(1584, 43, 7, 1, 'html', NULL, NULL),
(1585, 43, 6, 1, 'html', NULL, NULL),
(1588, 1, 13, 1, 'css', NULL, NULL),
(1589, 1, 18, 1, 'css', NULL, NULL),
(1590, 2, 16, 1, 'css', NULL, NULL),
(1591, 2, 17, 1, 'css', NULL, NULL),
(1592, 3, 10, 1, 'css', NULL, NULL),
(1593, 3, 7, 1, 'css', NULL, NULL),
(1594, 4, 11, 1, 'css', NULL, NULL),
(1595, 4, 13, 1, 'css', NULL, NULL),
(1596, 5, 5, 1, 'css', NULL, NULL),
(1597, 5, 20, 1, 'css', NULL, NULL),
(1598, 6, 5, 1, 'css', NULL, NULL),
(1599, 6, 19, 1, 'css', NULL, NULL),
(1600, 7, 15, 1, 'css', NULL, NULL),
(1601, 7, 20, 1, 'css', NULL, NULL),
(1602, 8, 10, 1, 'css', NULL, NULL),
(1603, 8, 11, 1, 'css', NULL, NULL),
(1604, 9, 13, 1, 'css', NULL, NULL),
(1605, 9, 8, 1, 'css', NULL, NULL),
(1606, 10, 12, 1, 'css', NULL, NULL),
(1607, 10, 16, 1, 'css', NULL, NULL),
(1608, 11, 17, 1, 'css', NULL, NULL),
(1609, 11, 9, 1, 'css', NULL, NULL),
(1610, 12, 9, 1, 'css', NULL, NULL),
(1611, 12, 8, 1, 'css', NULL, NULL),
(1612, 13, 17, 1, 'css', NULL, NULL),
(1613, 13, 10, 1, 'css', NULL, NULL),
(1614, 14, 19, 1, 'css', NULL, NULL),
(1615, 14, 17, 1, 'css', NULL, NULL),
(1616, 15, 14, 1, 'css', NULL, NULL),
(1617, 15, 19, 1, 'css', NULL, NULL),
(1618, 16, 5, 1, 'css', NULL, NULL),
(1619, 16, 17, 1, 'css', NULL, NULL),
(1620, 17, 13, 1, 'css', NULL, NULL),
(1621, 17, 6, 1, 'css', NULL, NULL),
(1622, 18, 20, 1, 'css', NULL, NULL),
(1623, 18, 20, 1, 'css', NULL, NULL),
(1624, 19, 16, 1, 'css', NULL, NULL),
(1625, 19, 13, 1, 'css', NULL, NULL),
(1626, 20, 10, 1, 'css', NULL, NULL),
(1627, 20, 17, 1, 'css', NULL, NULL),
(1628, 21, 13, 1, 'css', NULL, NULL),
(1629, 21, 9, 1, 'css', NULL, NULL),
(1630, 22, 12, 1, 'css', NULL, NULL),
(1631, 22, 5, 1, 'css', NULL, NULL),
(1632, 23, 20, 1, 'css', NULL, NULL),
(1633, 23, 20, 1, 'css', NULL, NULL),
(1634, 24, 20, 1, 'css', NULL, NULL),
(1635, 24, 5, 1, 'css', NULL, NULL),
(1636, 25, 12, 1, 'css', NULL, NULL),
(1637, 25, 15, 1, 'css', NULL, NULL),
(1638, 26, 7, 1, 'css', NULL, NULL),
(1639, 26, 14, 1, 'css', NULL, NULL),
(1640, 27, 6, 1, 'css', NULL, NULL),
(1641, 27, 19, 1, 'css', NULL, NULL),
(1642, 28, 15, 1, 'css', NULL, NULL),
(1643, 28, 8, 1, 'css', NULL, NULL),
(1644, 29, 8, 1, 'css', NULL, NULL),
(1645, 29, 18, 1, 'css', NULL, NULL),
(1646, 30, 17, 1, 'css', NULL, NULL),
(1647, 30, 14, 1, 'css', NULL, NULL),
(1648, 31, 18, 1, 'css', NULL, NULL),
(1649, 31, 6, 1, 'css', NULL, NULL),
(1650, 32, 7, 1, 'css', NULL, NULL),
(1651, 32, 6, 1, 'css', NULL, NULL),
(1652, 33, 11, 1, 'css', NULL, NULL),
(1653, 33, 16, 1, 'css', NULL, NULL),
(1654, 34, 5, 1, 'css', NULL, NULL),
(1655, 34, 14, 1, 'css', NULL, NULL),
(1656, 35, 20, 1, 'css', NULL, NULL),
(1657, 35, 10, 1, 'css', NULL, NULL),
(1658, 36, 8, 1, 'css', NULL, NULL),
(1659, 36, 12, 1, 'css', NULL, NULL),
(1660, 37, 18, 1, 'css', NULL, NULL),
(1661, 37, 5, 1, 'css', NULL, NULL),
(1662, 38, 17, 1, 'css', NULL, NULL),
(1663, 38, 12, 1, 'css', NULL, NULL),
(1664, 39, 7, 1, 'css', NULL, NULL),
(1665, 39, 10, 1, 'css', NULL, NULL),
(1666, 40, 13, 1, 'css', NULL, NULL),
(1667, 40, 5, 1, 'css', NULL, NULL),
(1668, 41, 10, 1, 'css', NULL, NULL),
(1669, 41, 11, 1, 'css', NULL, NULL),
(1670, 42, 15, 1, 'css', NULL, NULL),
(1671, 42, 19, 1, 'css', NULL, NULL),
(1672, 43, 9, 1, 'css', NULL, NULL),
(1673, 43, 19, 1, 'css', NULL, NULL),
(1676, 1, 13, 1, 'android', NULL, NULL),
(1677, 1, 17, 1, 'android', NULL, NULL),
(1678, 2, 13, 1, 'android', NULL, NULL),
(1679, 2, 16, 1, 'android', NULL, NULL),
(1680, 3, 20, 1, 'android', NULL, NULL),
(1681, 3, 15, 1, 'android', NULL, NULL),
(1682, 4, 7, 1, 'android', NULL, NULL),
(1683, 4, 17, 1, 'android', NULL, NULL),
(1684, 5, 7, 1, 'android', NULL, NULL),
(1685, 5, 16, 1, 'android', NULL, NULL),
(1686, 6, 5, 1, 'android', NULL, NULL),
(1687, 6, 14, 1, 'android', NULL, NULL),
(1688, 7, 6, 1, 'android', NULL, NULL),
(1689, 7, 13, 1, 'android', NULL, NULL),
(1690, 8, 19, 1, 'android', NULL, NULL),
(1691, 8, 12, 1, 'android', NULL, NULL),
(1692, 9, 6, 1, 'android', NULL, NULL),
(1693, 9, 6, 1, 'android', NULL, NULL),
(1694, 10, 20, 1, 'android', NULL, NULL),
(1695, 10, 9, 1, 'android', NULL, NULL),
(1696, 11, 9, 1, 'android', NULL, NULL),
(1697, 11, 6, 1, 'android', NULL, NULL),
(1698, 12, 20, 1, 'android', NULL, NULL),
(1699, 12, 11, 1, 'android', NULL, NULL),
(1700, 13, 5, 1, 'android', NULL, NULL),
(1701, 13, 14, 1, 'android', NULL, NULL),
(1702, 14, 6, 1, 'android', NULL, NULL),
(1703, 14, 14, 1, 'android', NULL, NULL),
(1704, 15, 10, 1, 'android', NULL, NULL),
(1705, 15, 8, 1, 'android', NULL, NULL),
(1706, 16, 6, 1, 'android', NULL, NULL),
(1707, 16, 9, 1, 'android', NULL, NULL),
(1708, 17, 15, 1, 'android', NULL, NULL),
(1709, 17, 5, 1, 'android', NULL, NULL),
(1710, 18, 7, 1, 'android', NULL, NULL),
(1711, 18, 8, 1, 'android', NULL, NULL),
(1712, 19, 5, 1, 'android', NULL, NULL),
(1713, 19, 15, 1, 'android', NULL, NULL),
(1714, 20, 20, 1, 'android', NULL, NULL),
(1715, 20, 18, 1, 'android', NULL, NULL),
(1716, 21, 17, 1, 'android', NULL, NULL),
(1717, 21, 6, 1, 'android', NULL, NULL),
(1718, 22, 18, 1, 'android', NULL, NULL),
(1719, 22, 20, 1, 'android', NULL, NULL),
(1720, 23, 5, 1, 'android', NULL, NULL),
(1721, 23, 5, 1, 'android', NULL, NULL),
(1722, 24, 12, 1, 'android', NULL, NULL),
(1723, 24, 19, 1, 'android', NULL, NULL),
(1724, 25, 8, 1, 'android', NULL, NULL),
(1725, 25, 14, 1, 'android', NULL, NULL),
(1726, 26, 5, 1, 'android', NULL, NULL),
(1727, 26, 13, 1, 'android', NULL, NULL),
(1728, 27, 8, 1, 'android', NULL, NULL),
(1729, 27, 8, 1, 'android', NULL, NULL),
(1730, 28, 9, 1, 'android', NULL, NULL),
(1731, 28, 7, 1, 'android', NULL, NULL),
(1732, 29, 14, 1, 'android', NULL, NULL),
(1733, 29, 7, 1, 'android', NULL, NULL),
(1734, 30, 10, 1, 'android', NULL, NULL),
(1735, 30, 15, 1, 'android', NULL, NULL),
(1736, 31, 9, 1, 'android', NULL, NULL),
(1737, 31, 20, 1, 'android', NULL, NULL),
(1738, 32, 6, 1, 'android', NULL, NULL),
(1739, 32, 10, 1, 'android', NULL, NULL),
(1740, 33, 16, 1, 'android', NULL, NULL),
(1741, 33, 15, 1, 'android', NULL, NULL),
(1742, 34, 15, 1, 'android', NULL, NULL),
(1743, 34, 7, 1, 'android', NULL, NULL),
(1744, 35, 19, 1, 'android', NULL, NULL),
(1745, 35, 20, 1, 'android', NULL, NULL),
(1746, 36, 16, 1, 'android', NULL, NULL),
(1747, 36, 9, 1, 'android', NULL, NULL),
(1748, 37, 10, 1, 'android', NULL, NULL),
(1749, 37, 18, 1, 'android', NULL, NULL),
(1750, 38, 14, 1, 'android', NULL, NULL),
(1751, 38, 16, 1, 'android', NULL, NULL),
(1752, 39, 19, 1, 'android', NULL, NULL),
(1753, 39, 20, 1, 'android', NULL, NULL),
(1754, 40, 19, 1, 'android', NULL, NULL),
(1755, 40, 15, 1, 'android', NULL, NULL),
(1756, 41, 7, 1, 'android', NULL, NULL),
(1757, 41, 11, 1, 'android', NULL, NULL),
(1758, 42, 20, 1, 'android', NULL, NULL),
(1759, 42, 6, 1, 'android', NULL, NULL),
(1760, 43, 5, 1, 'android', NULL, NULL),
(1761, 43, 17, 1, 'android', NULL, NULL),
(1764, 1, 5, 1, 'management', NULL, NULL),
(1765, 1, 6, 1, 'management', NULL, NULL),
(1766, 2, 13, 1, 'management', NULL, NULL),
(1767, 2, 6, 1, 'management', NULL, NULL),
(1768, 3, 5, 1, 'management', NULL, NULL),
(1769, 3, 6, 1, 'management', NULL, NULL),
(1770, 4, 20, 1, 'management', NULL, NULL),
(1771, 4, 18, 1, 'management', NULL, NULL),
(1772, 5, 14, 1, 'management', NULL, NULL),
(1773, 5, 16, 1, 'management', NULL, NULL),
(1774, 6, 5, 1, 'management', NULL, NULL),
(1775, 6, 11, 1, 'management', NULL, NULL),
(1776, 7, 15, 1, 'management', NULL, NULL),
(1777, 7, 15, 1, 'management', NULL, NULL),
(1778, 8, 10, 1, 'management', NULL, NULL),
(1779, 8, 6, 1, 'management', NULL, NULL),
(1780, 9, 16, 1, 'management', NULL, NULL),
(1781, 9, 20, 1, 'management', NULL, NULL),
(1782, 10, 7, 1, 'management', NULL, NULL),
(1783, 10, 17, 1, 'management', NULL, NULL),
(1784, 11, 15, 1, 'management', NULL, NULL),
(1785, 11, 9, 1, 'management', NULL, NULL),
(1786, 12, 9, 1, 'management', NULL, NULL),
(1787, 12, 18, 1, 'management', NULL, NULL),
(1788, 13, 5, 1, 'management', NULL, NULL),
(1789, 13, 14, 1, 'management', NULL, NULL),
(1790, 14, 17, 1, 'management', NULL, NULL),
(1791, 14, 5, 1, 'management', NULL, NULL),
(1792, 15, 17, 1, 'management', NULL, NULL),
(1793, 15, 15, 1, 'management', NULL, NULL),
(1794, 16, 12, 1, 'management', NULL, NULL),
(1795, 16, 17, 1, 'management', NULL, NULL),
(1796, 17, 10, 1, 'management', NULL, NULL),
(1797, 17, 11, 1, 'management', NULL, NULL),
(1798, 18, 13, 1, 'management', NULL, NULL),
(1799, 18, 18, 1, 'management', NULL, NULL),
(1800, 19, 16, 1, 'management', NULL, NULL),
(1801, 19, 13, 1, 'management', NULL, NULL),
(1802, 20, 16, 1, 'management', NULL, NULL),
(1803, 20, 15, 1, 'management', NULL, NULL),
(1804, 21, 11, 1, 'management', NULL, NULL),
(1805, 21, 6, 1, 'management', NULL, NULL),
(1806, 22, 9, 1, 'management', NULL, NULL),
(1807, 22, 5, 1, 'management', NULL, NULL),
(1808, 23, 10, 1, 'management', NULL, NULL),
(1809, 23, 16, 1, 'management', NULL, NULL),
(1810, 24, 18, 1, 'management', NULL, NULL),
(1811, 24, 9, 1, 'management', NULL, NULL),
(1812, 25, 20, 1, 'management', NULL, NULL),
(1813, 25, 12, 1, 'management', NULL, NULL),
(1814, 26, 15, 1, 'management', NULL, NULL),
(1815, 26, 9, 1, 'management', NULL, NULL),
(1816, 27, 9, 1, 'management', NULL, NULL),
(1817, 27, 19, 1, 'management', NULL, NULL),
(1818, 28, 12, 1, 'management', NULL, NULL),
(1819, 28, 10, 1, 'management', NULL, NULL),
(1820, 29, 17, 1, 'management', NULL, NULL),
(1821, 29, 8, 1, 'management', NULL, NULL),
(1822, 30, 12, 1, 'management', NULL, NULL),
(1823, 30, 10, 1, 'management', NULL, NULL),
(1824, 31, 10, 1, 'management', NULL, NULL),
(1825, 31, 19, 1, 'management', NULL, NULL),
(1826, 32, 11, 1, 'management', NULL, NULL),
(1827, 32, 15, 1, 'management', NULL, NULL),
(1828, 33, 13, 1, 'management', NULL, NULL),
(1829, 33, 6, 1, 'management', NULL, NULL),
(1830, 34, 12, 1, 'management', NULL, NULL),
(1831, 34, 5, 1, 'management', NULL, NULL),
(1832, 35, 9, 1, 'management', NULL, NULL),
(1833, 35, 11, 1, 'management', NULL, NULL),
(1834, 36, 11, 1, 'management', NULL, NULL),
(1835, 36, 19, 1, 'management', NULL, NULL),
(1836, 37, 6, 1, 'management', NULL, NULL),
(1837, 37, 19, 1, 'management', NULL, NULL),
(1838, 38, 11, 1, 'management', NULL, NULL),
(1839, 38, 5, 1, 'management', NULL, NULL),
(1840, 39, 18, 1, 'management', NULL, NULL),
(1841, 39, 7, 1, 'management', NULL, NULL),
(1842, 40, 7, 1, 'management', NULL, NULL),
(1843, 40, 18, 1, 'management', NULL, NULL),
(1844, 41, 6, 1, 'management', NULL, NULL),
(1845, 41, 10, 1, 'management', NULL, NULL),
(1846, 42, 20, 1, 'management', NULL, NULL),
(1847, 42, 7, 1, 'management', NULL, NULL),
(1848, 43, 17, 1, 'management', NULL, NULL),
(1849, 43, 20, 1, 'management', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `tags`
--

INSERT INTO `tags` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'test', '2017-03-19 09:09:21', '2017-03-19 09:09:21'),
(2, 'test2', '2017-03-19 09:12:56', '2017-03-19 09:12:56'),
(3, 'tag', '2017-03-19 15:12:18', '2017-03-19 15:12:18'),
(4, 'partit', '2017-03-30 18:56:56', '2017-03-30 18:56:56'),
(5, 'adieu', '2017-03-30 18:56:56', '2017-03-30 18:56:56'),
(6, 'parti', '2017-03-30 18:58:00', '2017-03-30 18:58:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `login`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Aguer', 'Julien', 'julien.aquer@ynov.com', 'julienA', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906026.jpg', NULL, NULL, '2017-03-30 18:33:46', 0),
(2, 'Bagneres', 'Raphael', 'raphael.bagneres-pedeboscq@ynov.com', 'raphaelB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906078.jpg', NULL, NULL, '2017-03-30 18:34:38', 0),
(3, 'Baudou', 'Thomas', 'thomas.baudou@ynov.com', 'thomasb', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906817.jpg', NULL, NULL, '2017-03-30 18:46:57', 0),
(4, 'Berque', 'Leila', 'leila.berque@ynov.com', 'leilaB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906825.jpg', NULL, NULL, '2017-03-30 18:47:05', 0),
(5, 'Biron', 'Nolann', 'nolann.biron@ynov.com', 'nolannB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906836.jpg', NULL, NULL, '2017-03-30 18:47:16', 0),
(6, 'Bordas', 'Pierre', 'pierre.bordas@ynov.com', 'pierreB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906867.jpg', NULL, NULL, '2017-03-30 18:47:47', 0),
(7, 'Bouchou', 'Michel', 'michel.bouchou@ynov.com', 'michelB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906877.jpg', NULL, NULL, '2017-03-30 18:47:57', 0),
(8, 'Bourges', 'Pierre', 'pierre.bourges@ynov.com', 'pierreB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906904.jpg', NULL, NULL, '2017-03-30 18:48:24', 0),
(9, 'Bouteiller', 'Aurelien', 'aurelien.bouteiller@ynov.com', 'aurelienB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906915.jpg', NULL, NULL, '2017-03-30 18:48:35', 0),
(10, 'Boutet', 'Loanne', 'loanne.boutet@ynov.com', 'loanneB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906923.jpg', NULL, NULL, '2017-03-30 18:48:43', 0),
(11, 'Broustaut', 'Alexis', 'alexis.broustaut@ynov.com', 'alexisB', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906960.JPG', NULL, NULL, '2017-03-30 18:49:20', 0),
(12, 'Chapeau', 'Stephane', 'stephane.chapeau@ynov.com', 'stephaneC', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906970.jpg', NULL, NULL, '2017-03-30 18:49:31', 0),
(13, 'Courbin', 'Quentin', 'quentin.courbin@ynov.com', 'quentinC', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906984.jpg', NULL, NULL, '2017-03-30 18:49:44', 0),
(14, 'Coutant', 'Alex', 'alex.coutant@ynov.com', 'alexC', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490906993.jpg', NULL, NULL, '2017-03-30 18:49:53', 0),
(15, 'Cransac', 'Florian', 'florian.cransac@ynov.com', 'florianC', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907004.jpg', NULL, NULL, '2017-03-30 18:50:04', 0),
(16, 'Cuvelier', 'Louis', 'louis.cuvelier@ynov.com', 'louisC', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907033.jpg', NULL, NULL, '2017-03-30 18:50:33', 0),
(17, 'Denjean', 'Axel', 'axel.denjean@ynov.com', 'axelD', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907081.jpg', NULL, NULL, '2017-03-30 18:51:21', 0),
(18, 'Descoins', 'Mikael', 'mikael.descoins@ynov.com', 'mikaelD', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907092.jpg', NULL, NULL, '2017-03-30 18:51:32', 0),
(19, 'Estival', 'Benoit', 'benoit.estival@ynov.com', 'benoitE', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907134.jpg', 'QQwxEPVsPmemETGHjXEMBwuufKgaLZoXlSm146zNzytQKHBJX5qNkkCuRbzB', NULL, '2017-03-30 18:52:14', 0),
(20, 'Etoughe', 'Anthony', 'anthony.etoughe@ynov.com', 'anthonyE', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907144.jpg', NULL, NULL, '2017-03-30 18:52:24', 0),
(21, 'Foucaud', 'Josue', 'josue.foucaud@ynov.com', 'josueF', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907151.jpg', NULL, NULL, '2017-03-30 18:52:31', 0),
(22, 'Gbogbohoundada', 'Olivier', 'olivier.gbogbohoundada@ynov.com', 'olivierG', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907158.jpg', NULL, NULL, '2017-03-30 18:52:38', 0),
(23, 'Huet de froberville', 'Aymeric', 'aymeric.huetdefroberville@ynov.com', 'aymericH', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907174.jpg', NULL, NULL, '2017-03-30 18:52:54', 0),
(24, 'Landais', 'David', 'david.landais@ynov.com', 'davidL', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907187.jpg', NULL, NULL, '2017-03-30 18:53:07', 0),
(25, 'Lauga', 'Nathan', 'nathan.lauga@ynov.com', 'nathanL', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907203.jpg', NULL, NULL, '2017-03-30 18:53:23', 0),
(26, 'Lemzaoueq', 'Nabil', 'nabil.lemzaoueq@ynov.com', 'nabilL', '$2y$10$OVoGcSqBLgYPLk.O0wFaIOQTSk5FxVxhl.j.YjyQ4yYGt3JVRfufG', '1490907257.jpg', NULL, NULL, '2017-03-30 18:54:17', 0),
(27, 'Leveque', 'Louis', 'louis.leveque@ynov.com', 'louisL', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907263.jpg', NULL, NULL, '2017-03-30 18:54:24', 0),
(28, 'Lhote', 'Esteban', 'esteban.lhote@ynov.com', 'estebanL', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907278.jpg', NULL, NULL, '2017-03-30 18:54:38', 0),
(29, 'Lummau', 'Jules', 'jules.lummau@ynov.com', 'julesL', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907286.jpg', NULL, NULL, '2017-03-30 18:54:46', 0),
(30, 'Maurin', 'Thomas', 'thomas.maurin@ynov.com', 'thomasM', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907356.jpg', NULL, NULL, '2017-03-30 18:55:56', 0),
(31, 'Mestreau', 'Erwan', 'erwan.mestreau@ynov.com', 'erwanM', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907507.jpg', NULL, NULL, '2017-03-30 18:58:27', 0),
(32, 'Monnier', 'Logann', 'logann.monnier@ynov.com', 'logannM', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907514.jpg', NULL, NULL, '2017-03-30 18:58:34', 0),
(33, 'Nay', 'Ludovic', 'ludovic.nay@ynov.com', 'ludovicN', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907535.jpg', NULL, NULL, '2017-03-30 18:58:55', 0),
(34, 'Payet', 'Quentin', 'quentin.payet@ynov.com', 'quentinP', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907540.jpg', NULL, NULL, '2017-03-30 18:59:00', 0),
(35, 'Persch', 'Jules', 'jules.persch@ynov.com', 'julesP', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907549.jpg', NULL, NULL, '2017-03-30 18:59:09', 0),
(36, 'Pessiot', 'Gregoire', 'gregoire.pessiot@ynov.com', 'gregoireP', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907564.jpg', NULL, NULL, '2017-03-30 18:59:24', 0),
(37, 'Priolot', 'Marc', 'marc.priolot@ynov.com', 'marcP', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907570.jpg', NULL, NULL, '2017-03-30 18:59:30', 0),
(38, 'Provoost Donadeo', 'Joanna', 'joanna.provoostdonadeo@ynov.com', 'joannaP', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907580.jpg', NULL, NULL, '2017-03-30 18:59:41', 0),
(39, 'Ruiz', 'Clement', 'clement.ruiz@ynov.com', 'clementR', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907592.jpg', NULL, NULL, '2017-03-30 18:59:52', 0),
(40, 'Thery', 'Adrien', 'adrien.thery@ynov.com', 'adrienT', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907606.jpg', NULL, NULL, '2017-03-30 19:00:06', 0),
(41, 'Tricaud', 'Alexandre', 'alexandre.tricaud@ynov.com', 'alexandreT', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907618.JPG', NULL, NULL, '2017-03-30 19:00:18', 0),
(42, 'Valleau', 'Elien', 'elien.valleau@ynov.com', 'elienV', '$2y$10$n0lyAojdkOOFz..dDt5ugeQl9deI7jPzixh13ZurT4xDO2V9uc/p2', '1491034580.jpg', 'd6UZ0Swu1wOCnCqoy20NMXXX32gmrFQccGTuHF1YVVU9AFPrnnB6uN0uJxyr', NULL, '2017-04-01 06:27:54', 0),
(43, 'Victoras', 'Nicolas', 'nicolas.victoras@ynov.com', 'nicolasV', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490907639.jpg', NULL, NULL, '2017-03-30 19:00:39', 0),
(44, 'Admin', 'Admin', 'admin@ynov.com', 'adminA', '$2y$10$dRpEoprgwbFUZjF0tNCUKeoV5976Xbd8D7CFMZ6QPEd4u3c0UfUyW', '1490463186.png', 'EfmTNs61HcVOZQcJp9QBJktCspD1VxSNM8p5sRoj2fqxEYFeZM0c33anfdcb', '2017-03-14 07:54:42', '2017-03-25 16:33:06', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `comment_tag`
--
ALTER TABLE `comment_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_tag_comment_id_foreign` (`comment_id`),
  ADD KEY `comment_tag_tag_id_foreign` (`tag_id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentaires_user_id_foreign` (`user_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_foreign` (`user_id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `comment_tag`
--
ALTER TABLE `comment_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1850;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comment_tag`
--
ALTER TABLE `comment_tag`
  ADD CONSTRAINT `comment_tag_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `commentaires` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `commentaires_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
