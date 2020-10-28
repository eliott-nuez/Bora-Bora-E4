-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 02 juil. 2020 à 06:43
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE borabora;
use borabora;

--
-- Base de données :  `borabora`
--

-- --------------------------------------------------------

--
-- Structure de la table `brasserie`
--

DROP TABLE IF EXISTS `brasserie`;
CREATE TABLE IF NOT EXISTS `brasserie` (
  `num_plat` int(3) NOT NULL,
  `lib_plat` varchar(50) DEFAULT NULL,
  `prix_plat` float DEFAULT NULL,
  `cat` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`num_plat`),
  KEY `brasserie_ibfk_1` (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `brasserie`
--

INSERT INTO `brasserie` (`num_plat`, `lib_plat`, `prix_plat`, `cat`) VALUES
(1, 'Salade Tahitienne', 2050, 'ENTSAL'),
(2, 'Os à la Moelle au sel de Guérande', 1500, 'ENTSAL'),
(3, 'Salade Tiède au Jarret', 2050, 'ENTSAL'),
(4, 'Tartine au Chèvre Chaud sur Salade', 1750, 'ENTSAL'),
(5, 'Salade Jean Pierre', 2050, 'ENTSAL'),
(6, 'Salade Verte huile olive ou vinaigrette', 800, 'ENTSAL'),
(7, 'Salade Verta Roquefort et Noix', 950, 'ENTSAL'),
(8, 'Crevettes poelées et flambées', 2950, 'CREPAY'),
(9, 'Crevettes poelées au Curry et amandes', 2950, 'CREPAY'),
(10, 'Tartare de Thon à la moutarde et Garniture', 2450, 'PROMER'),
(11, 'Steack de Thon mi-cuit sauce vierge Fruits frais e', 2850, 'PROMER'),
(12, 'Noix d\'Entrecôte 200g', 2850, 'VIANDE'),
(13, 'Noix d\'Entrecôte 350g', 3750, 'VIANDE'),
(14, 'La Churascaia 500g', 5100, 'VIANDE'),
(15, 'Travers de Porc Sauce Barbecue', 3150, 'VIANDE'),
(16, 'Escalope de Veau Normande', 2650, 'VIANDE'),
(17, 'Os à la Moelle en accompagnement', 500, 'VIANDE'),
(18, 'Tartare de Boeuf aux Condiments', 2650, 'VIANDE'),
(19, 'Sauce au choix', 300, 'VIANDE'),
(20, 'Hamburger pur Boeuf Frites à Volonté', 2050, 'HAMBUR'),
(21, 'Tagliatelle Carbonara', 1700, 'PATES'),
(22, 'Tagliatelle au Saumon', 2800, 'PATES'),
(23, 'Tagliatelle Crevttes Décortiquées', 2800, 'PATES'),
(24, 'Flammekueche Formule à Volonté', 2050, 'FLAMME'),
(25, 'La Classique', 1200, 'FLAMME'),
(26, 'La Forestière', 1350, 'FLAMME'),
(27, 'La Gratinée', 1350, 'FLAMME'),
(28, 'La Spéciale', 1500, 'FLAMME'),
(29, 'La Chèvre Chaud', 1600, 'FLAMME'),
(30, 'La Choucroute', 1750, 'FLAMME'),
(31, 'La Napolitaine', 1450, 'FLAMME'),
(32, 'La Saumon', 1800, 'FLAMME'),
(33, 'La Végétarienne', 1500, 'FLAMME'),
(34, 'La Crevette', 1950, 'FLAMME'),
(35, 'Les Trois Fromages', 1700, 'FLAMME'),
(36, 'La Charcutière', 1800, 'FLAMME'),
(37, 'La Pomme', 950, 'FLAMME'),
(38, 'La Pomme Glacée', 1200, 'FLAMME'),
(39, 'La Belle Hélène', 1150, 'FLAMME'),
(40, 'La Ch\'ti', 1200, 'FLAMME'),
(41, 'La Normande', 1200, 'FLAMME'),
(42, 'La Cococ', 1600, 'FLAMME'),
(43, 'La Spéciale Sucrée', 1100, 'FLAMME'),
(44, 'La Tout Chocolat', 1100, 'FLAMME'),
(45, 'La Martiniquaise', 1200, 'FLAMME');

-- --------------------------------------------------------

--
-- Structure de la table `cat_brasserie`
--

DROP TABLE IF EXISTS `cat_brasserie`;
CREATE TABLE IF NOT EXISTS `cat_brasserie` (
  `cat` varchar(6) NOT NULL,
  `lib_cat` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat_brasserie`
--

INSERT INTO `cat_brasserie` (`cat`, `lib_cat`) VALUES
('CREPAY', 'Crevette Pays'),
('ENTSAL', 'Entrées, Salades'),
('FLAMME', 'Flammekueche '),
('HAMBUR', 'Hamburger'),
('PATES', 'Les Pâtes'),
('PROMER', 'Produits de la Mer'),
('VIANDE', 'Les Viandes');

-- --------------------------------------------------------

--
-- Structure de la table `cat_chambre`
--

DROP TABLE IF EXISTS `cat_chambre`;
CREATE TABLE IF NOT EXISTS `cat_chambre` (
  `cat` varchar(6) NOT NULL,
  `lib_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat_chambre`
--

INSERT INTO `cat_chambre` (`cat`, `lib_cat`) VALUES
('1', 'Chambre Classique'),
('2', 'Suite Classique'),
('3', 'Bungalow sur le lagon'),
('4', 'Bungalow jardin');

-- --------------------------------------------------------

--
-- Structure de la table `cat_cons`
--

DROP TABLE IF EXISTS `cat_cons`;
CREATE TABLE IF NOT EXISTS `cat_cons` (
  `cat` varchar(6) NOT NULL,
  `lib_cat` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat_cons`
--

INSERT INTO `cat_cons` (`cat`, `lib_cat`) VALUES
('ALCOOL', 'Alcool'),
('APEBIE', 'Apéritif à la bière'),
('APERIT', 'Apéritif'),
('BIEAMB', 'Bière ambrée'),
('BIEBLA', 'Bière blanche'),
('BIEBLO', 'Bière blonde'),
('BIESCO', 'Bière scotch'),
('BIESPE', 'Bière spéciale'),
('COKBIE', 'Apéritif à la bière'),
('COKTAI', 'Coktail'),
('EAUMIN', 'Eaux minérales'),
('JUSFRA', 'Jus de fruits frais'),
('LACAVE', 'La cave'),
('NECTAR', 'Nectars'),
('SODAS', 'Sodas'),
('WHISKY', 'Whisky');

-- --------------------------------------------------------

--
-- Structure de la table `cat_spa`
--

DROP TABLE IF EXISTS `cat_spa`;
CREATE TABLE IF NOT EXISTS `cat_spa` (
  `cat` varchar(6) NOT NULL,
  `lib_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat_spa`
--

INSERT INTO `cat_spa` (`cat`, `lib_cat`) VALUES
('1', '30min'),
('2', '1h'),
('3', '1h30'),
('4', '2h');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `num_chambre` int(11) NOT NULL,
  `lib_chambre` varchar(50) NOT NULL,
  `prix_chambre` float NOT NULL,
  `cat` varchar(6) NOT NULL,
  PRIMARY KEY (`num_chambre`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`num_chambre`, `lib_chambre`, `prix_chambre`, `cat`) VALUES
(1, 'Chambre Classique', 17000, '1'),
(2, 'Chambre Classique', 17000, '1'),
(3, 'Suite Classique', 37000, '2'),
(4, 'Suite Classique', 37000, '2'),
(5, 'Bungalow sur le lagon', 32000, '3'),
(6, 'Bungalow sur le lagon', 32000, '3'),
(7, 'Bungalow jardin', 26000, '4'),
(8, 'Bungalow jardin', 26000, '4');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_Client`, `Nom`, `Prenom`, `Tel`) VALUES
(1, 'nuez', 'eliott', '951083'),
(2, 'Devellennes', 'Ludovic', '930111'),
(3, 'Bernard', 'Lorenzo', '522205');

-- --------------------------------------------------------

--
-- Structure de la table `comprend_bar`
--

DROP TABLE IF EXISTS `comprend_bar`;
CREATE TABLE IF NOT EXISTS `comprend_bar` (
  `num_fact` int(11) NOT NULL,
  `num_cons` int(3) NOT NULL,
  `qte` tinyint(4) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`num_fact`,`num_cons`,`date`) USING BTREE,
  KEY `fk1_comprend_bar` (`num_cons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comprend_bar`
--

INSERT INTO `comprend_bar` (`num_fact`, `num_cons`, `qte`, `date`) VALUES
(1, 114, 1, '2020-06-24 00:00:00'),
(2, 10, 1, '2020-06-19 00:00:00'),
(4, 76, 2, '2020-07-02 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `comprend_brasserie`
--

DROP TABLE IF EXISTS `comprend_brasserie`;
CREATE TABLE IF NOT EXISTS `comprend_brasserie` (
  `num_fact` int(11) NOT NULL,
  `num_plat` int(3) NOT NULL,
  `qte` tinyint(4) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`num_fact`,`num_plat`,`date`) USING BTREE,
  KEY `comprend_brasseriefk_1` (`num_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comprend_brasserie`
--

INSERT INTO `comprend_brasserie` (`num_fact`, `num_plat`, `qte`, `date`) VALUES
(1, 20, 1, '2020-06-23 00:00:00'),
(1, 20, 1, '2020-06-24 00:00:00'),
(1, 24, 2, '2020-06-23 00:00:00'),
(1, 24, 1, '2020-06-23 16:32:55'),
(2, 43, 2, '2020-06-19 00:00:00'),
(3, 20, 1, '2020-06-22 00:00:00'),
(3, 24, 1, '2020-06-22 00:00:00'),
(4, 21, 1, '2020-07-01 20:00:00'),
(4, 22, 1, '2020-07-01 20:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `comprend_chambre`
--

DROP TABLE IF EXISTS `comprend_chambre`;
CREATE TABLE IF NOT EXISTS `comprend_chambre` (
  `num_fact` int(11) NOT NULL,
  `num_chambre` int(11) NOT NULL,
  `datea` date NOT NULL,
  `dateb` date NOT NULL,
  PRIMARY KEY (`num_fact`,`num_chambre`,`datea`) USING BTREE,
  KEY `num_chambre` (`num_chambre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comprend_chambre`
--

INSERT INTO `comprend_chambre` (`num_fact`, `num_chambre`, `datea`, `dateb`) VALUES
(1, 5, '2020-06-20', '2020-06-24'),
(2, 5, '2020-06-18', '2020-06-20'),
(3, 8, '2020-06-19', '2020-06-24'),
(4, 5, '2020-06-30', '2020-07-03');

-- --------------------------------------------------------

--
-- Structure de la table `comprend_spa`
--

DROP TABLE IF EXISTS `comprend_spa`;
CREATE TABLE IF NOT EXISTS `comprend_spa` (
  `num_fact` int(11) NOT NULL,
  `num_soin` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `qte` int(11) NOT NULL,
  PRIMARY KEY (`num_fact`,`num_soin`,`date`) USING BTREE,
  KEY `num_soin` (`num_soin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comprend_spa`
--

INSERT INTO `comprend_spa` (`num_fact`, `num_soin`, `date`, `qte`) VALUES
(1, 1, '2020-06-24 00:00:00', 1),
(2, 19, '2020-06-19 00:00:00', 1),
(3, 8, '2020-06-21 00:00:00', 1),
(4, 10, '2020-07-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `consommation`
--

DROP TABLE IF EXISTS `consommation`;
CREATE TABLE IF NOT EXISTS `consommation` (
  `num_cons` int(3) NOT NULL,
  `lib_cons` varchar(50) DEFAULT NULL,
  `prix_cons` float DEFAULT NULL,
  `cat` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`num_cons`),
  KEY `consommation_ibfk_1` (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `consommation`
--

INSERT INTO `consommation` (`num_cons`, `lib_cons`, `prix_cons`, `cat`) VALUES
(1, 'Demi 25cl', 700, 'BIEBLA'),
(2, 'Taverne 33cl', 800, 'BIEBLA'),
(3, 'Brasseur 50cl', 1000, 'BIEBLA'),
(4, 'Formidable 100cl', 1900, 'BIEBLA'),
(5, 'Pichet 1,5l', 3200, 'BIEBLA'),
(6, 'Le mètre 25cl *10', 5000, 'BIEBLA'),
(7, 'Demi 25cl', 700, 'BIEBLO'),
(8, 'Taverne 33cl', 800, 'BIEBLO'),
(9, 'Brasseur 50cl', 1000, 'BIEBLO'),
(10, 'Formidable 100cl', 1900, 'BIEBLO'),
(11, 'Pichet 1,5l', 3200, 'BIEBLO'),
(12, 'Le mètre 25cl *10', 5000, 'BIEBLO'),
(13, 'Demi 25cl', 700, 'BIEBLO'),
(14, 'Taverne 33cl', 800, 'BIEBLO'),
(15, 'Brasseur 50cl', 1000, 'BIEBLO'),
(16, 'Formidable 100cl', 1900, 'BIEBLO'),
(17, 'Pichet 1,5l', 3200, 'BIEBLO'),
(18, 'Le mètre 25cl *10', 5000, 'BIEBLO'),
(19, 'Le Panaché 25cl', 650, 'APEBIE'),
(20, 'Le Panaché 33cl', 700, 'APEBIE'),
(21, 'Le Panaché 50cl', 900, 'APEBIE'),
(22, 'Le Panaché 1l', 1500, 'APEBIE'),
(23, 'Le Panaché Pitcher', 3200, 'APEBIE'),
(24, 'Le Tango 25 cl', 700, 'APEBIE'),
(25, 'Le Tango 33 cl', 800, 'APEBIE'),
(26, 'Le Tango 50 cl', 1100, 'APEBIE'),
(27, 'Le Tango 1l', 1100, 'APEBIE'),
(28, 'Le Tango Pitcher', 3200, 'APEBIE'),
(29, 'Le Monaco 25 cl', 700, 'APEBIE'),
(30, 'Le Monaco 33 cl', 800, 'APEBIE'),
(31, 'Le Monaco 50 cl', 1100, 'APEBIE'),
(32, 'Le Monaco 1l', 1100, 'APEBIE'),
(33, 'Le Monaco Pitcher', 3200, 'APEBIE'),
(34, 'Picon Bière 25 cl', 1100, 'APEBIE'),
(35, 'Picon Bière 33 cl', 1350, 'APEBIE'),
(36, 'Picon Bière 50 cl', 1900, 'APEBIE'),
(37, 'Picon Bière 1l', 2400, 'APEBIE'),
(38, 'Picon Bière Pitcher', 4200, 'APEBIE'),
(39, 'Le Nord Express 25 cl', 1100, 'APEBIE'),
(40, 'Le Nord Express 33 cl', 1350, 'APEBIE'),
(41, 'Le Nord Express 50 cl', 1900, 'APEBIE'),
(42, 'Le Nord Express 1l', 2400, 'APEBIE'),
(43, 'Le Nord Express Pitcher', 4200, 'APEBIE'),
(45, 'Le Mexicanos 25 cl', 1100, 'APEBIE'),
(46, 'Le Mexicanos 33 cl', 1350, 'APEBIE'),
(47, 'Le Mexicanos 50 cl', 1900, 'APEBIE'),
(48, 'Le Mexicanos 1l', 2400, 'APEBIE'),
(49, 'Le Mexicanos Pitcher', 4200, 'APEBIE'),
(50, 'Le Habana 25 cl', 1100, 'APEBIE'),
(51, 'Le Habana 33 cl', 1350, 'APEBIE'),
(52, 'Le Habana 50 cl', 1900, 'APEBIE'),
(53, 'Le Habana 1l', 2400, 'APEBIE'),
(54, 'Le Habana Pitcher', 4200, 'APEBIE'),
(55, 'L\'Irlandais 25 cl', 1100, 'APEBIE'),
(56, 'L\'Irlandais 33 cl', 1350, 'APEBIE'),
(57, 'L\'Irlandais 50 cl', 1900, 'APEBIE'),
(58, 'L\'Irlandais 1l', 2400, 'APEBIE'),
(59, 'L\'Irlandais Pitcher', 4200, 'APEBIE'),
(60, 'Le Boucanier 25 cl', 1100, 'APEBIE'),
(61, 'Le Boucanier 33 cl', 1350, 'APEBIE'),
(62, 'Le Boucanier 50 cl', 1900, 'APEBIE'),
(63, 'Le Boucanier 1l', 2400, 'APEBIE'),
(64, 'Le Boucanier', 4200, 'APEBIE'),
(65, 'Campari 2 cl', 1000, 'APERIT'),
(66, 'Martini 2 cl', 1000, 'APERIT'),
(67, 'Ricard 2 cl', 1000, 'APERIT'),
(68, 'Coupe de champagne Taitin', 2100, 'APERIT'),
(69, 'Kir Royal Taitingeri 12 c', 2300, 'APERIT'),
(70, 'Whisky classique', 1050, 'WHISKY'),
(71, 'Bourbon:Jim Beam', 1300, 'WHISKY'),
(72, 'Vieux Scotch Chivas Regal', 1500, 'WHISKY'),
(73, 'Vieux Scotch Johnnie Black Label', 1500, 'WHISKY'),
(74, 'Single Pure Malt Glenfiddich', 1500, 'WHISKY'),
(75, 'Single Pure Malt Glenlivet', 1500, 'WHISKY'),
(76, 'Gin 4cl', 1000, 'ALCOOL'),
(77, 'Vodka 4cl', 1000, 'ALCOOL'),
(78, 'Tequila 4 cl', 1000, 'ALCOOL'),
(79, 'Rhum', 1000, 'ALCOOL'),
(80, 'Vodka Zubrowska 4cl', 1300, 'ALCOOL'),
(81, 'Vodka Absolut 4cl', 1300, 'ALCOOL'),
(82, 'Rhum Damoiseau 4cl', 1300, 'ALCOOL'),
(83, 'Rhum Bacardi 4cl', 1300, 'ALCOOL'),
(84, 'Gin Bombay 4cl', 1300, 'ALCOOL'),
(85, 'Gin Gordon\'s 4cl', 1300, 'ALCOOL'),
(86, 'Vodka Red Bull 4cl', 1500, 'ALCOOL'),
(87, 'Pinacolada', 1500, 'COKTAI'),
(88, 'Planteur', 1500, 'COKTAI'),
(89, 'Punch Coco', 1500, 'COKTAI'),
(90, 'Sancerre Les Montachins Blanc 37,5cl', 3800, 'LACAVE'),
(91, 'Sancerre Les Montachins Blanc 75cl', 6200, 'LACAVE'),
(92, 'Riesling Hugel 37,5cl', 3250, 'LACAVE'),
(93, 'Riesling Hugel 75cl', 5500, 'LACAVE'),
(94, 'Muscadet sur Lie 37,5cl', 2200, 'LACAVE'),
(95, 'Muscadet sur Lie 75cl', 3900, 'LACAVE'),
(96, 'Cristal de Provence Rosé 37,5cl', 2300, 'LACAVE'),
(97, 'Cristal de Provence Rosé 75cl', 4200, 'LACAVE'),
(98, 'Beaujolais Village Georges Duboeuf 37,5cl', 2200, 'LACAVE'),
(99, 'Beaujolais Village Georges Duboeuf 75cl', 3800, 'LACAVE'),
(100, 'Bordeaux Manoir du Passager 75 l', 3900, 'LACAVE'),
(101, 'Clos La Maurasse Graves rouge ou blanc 75cl', 5500, 'LACAVE'),
(102, 'Château Castera Cru Bourgeois Medoc 75 cl', 5900, 'LACAVE'),
(103, 'Riesling Hugel 75cl', 5500, 'LACAVE'),
(104, 'Champagne Taittinger 75 cl', 12500, 'LACAVE'),
(105, 'Bordeaux Manoir du Passager Le Verre Rouge ou Blan', 950, 'LACAVE'),
(106, 'Medoc Château Castera le verre', 1300, 'LACAVE'),
(107, 'Les Nectars Poire 25cl', 700, 'NECTAR'),
(108, 'Les Nectars Abricot 25cl', 700, 'NECTAR'),
(109, 'Les Nectars Tomate 25cl', 700, 'NECTAR'),
(110, 'Coca Cola 33cl', 630, 'SODAS'),
(111, 'Coca Zéro 33cl', 630, 'SODAS'),
(112, 'Orangina 33cl', 630, 'SODAS'),
(113, 'Ice Tea 33cl', 630, 'SODAS'),
(114, '7 Up 33cl', 630, 'SODAS'),
(115, 'Schweppes Tonic 33cl', 630, 'SODAS'),
(116, 'Maxi Soda 50cl', 850, 'SODAS'),
(117, 'Red Bull', 900, 'SODAS'),
(118, 'Mont Dore 50cl', 500, 'EAUMIN'),
(119, 'Mont Dore 1,50l', 650, 'EAUMIN'),
(120, 'San Pellegrino 50cl', 650, 'EAUMIN'),
(121, 'San Pellegrino 75cl', 850, 'EAUMIN'),
(122, 'Perrier boîte 33cl', 630, 'EAUMIN');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `num_fact` int(11) NOT NULL AUTO_INCREMENT,
  `date_fact` date DEFAULT NULL,
  `paye` tinyint(1) NOT NULL,
  `Id_Client` int(11) NOT NULL,
  PRIMARY KEY (`num_fact`),
  KEY `facture_ibfk_1` (`Id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`num_fact`, `date_fact`, `paye`, `Id_Client`) VALUES
(1, NULL, 0, 1),
(2, NULL, 0, 2),
(3, NULL, 0, 3),
(4, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `spa`
--

DROP TABLE IF EXISTS `spa`;
CREATE TABLE IF NOT EXISTS `spa` (
  `num_soin` int(11) NOT NULL,
  `lib_soin` varchar(50) NOT NULL,
  `prix_soin` float NOT NULL,
  `cat` varchar(6) NOT NULL,
  PRIMARY KEY (`num_soin`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `spa`
--

INSERT INTO `spa` (`num_soin`, `lib_soin`, `prix_soin`, `cat`) VALUES
(1, 'SOIN CONTOUR DES YEUX ÉCLAT', 6500, '1'),
(2, 'SOIN ÉCLAT IMMÉDIAT AUX FLEURS', 9500, '2'),
(3, 'SOIN PRODIGIEUX® À L’IMMORTELLE BLEUE', 12500, '2'),
(4, 'SOIN EXPRESS AUX EXTRAITS D’ARBRES - Pour Homme', 9500, '1'),
(5, 'SOIN AROMA-LACTÉ CRÈME FRAÎCHE', 13000, '3'),
(6, 'SOIN AROMA-PERFECTION® AUX PLANTES', 13000, '3'),
(7, 'SOIN ULTRA-RÉCONFORTANT AU MIEL', 13000, '3'),
(8, 'SOIN BEAU JOUEUR - Pour Homme', 13000, '3'),
(9, 'SOIN BIO-BEAUTÉ', 13000, '3'),
(10, 'SOIN NUXELLENCE', 16000, '3'),
(11, 'SOIN NIRVANESQUE', 16000, '3'),
(12, 'SOIN MERVEILLANCE expert', 16000, '3'),
(13, 'ENVELOPPEMENT', 6500, '1'),
(14, 'SOIN RÉVÉLATEUR D’ÉCLAT IMMÉDIAT', 9000, '2'),
(15, 'SOIN «BODY RELAXANT»', 13000, '2'),
(16, 'SOIN du dos', 14000, '3'),
(17, 'SOIN PRODIGIEUX', 14000, '3'),
(18, 'SOIN RÊVE DE MIEL', 15000, '3'),
(19, 'SOIN PURETÉ DU DOS - Pour Homme', 14000, '3'),
(20, 'SOIN RÊVERIE ORIENTALE', 18000, '4');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `brasserie`
--
ALTER TABLE `brasserie`
  ADD CONSTRAINT `brasserie_ibfk_1` FOREIGN KEY (`cat`) REFERENCES `cat_brasserie` (`cat`);

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `chambre_ibfk_1` FOREIGN KEY (`cat`) REFERENCES `cat_chambre` (`cat`);

--
-- Contraintes pour la table `comprend_bar`
--
ALTER TABLE `comprend_bar`
  ADD CONSTRAINT `comprend_baribfk_1` FOREIGN KEY (`num_cons`) REFERENCES `consommation` (`num_cons`),
  ADD CONSTRAINT `comprend_baribfk_2` FOREIGN KEY (`num_fact`) REFERENCES `facture` (`num_fact`);

--
-- Contraintes pour la table `comprend_brasserie`
--
ALTER TABLE `comprend_brasserie`
  ADD CONSTRAINT `comprend_brasseriefk_1` FOREIGN KEY (`num_plat`) REFERENCES `brasserie` (`num_plat`),
  ADD CONSTRAINT `comprend_brasseriefk_2` FOREIGN KEY (`num_fact`) REFERENCES `facture` (`num_fact`);

--
-- Contraintes pour la table `comprend_chambre`
--
ALTER TABLE `comprend_chambre`
  ADD CONSTRAINT `comprend_chambrefk_1` FOREIGN KEY (`num_chambre`) REFERENCES `chambre` (`num_chambre`),
  ADD CONSTRAINT `comprend_chambrefk_2` FOREIGN KEY (`num_fact`) REFERENCES `facture` (`num_fact`);

--
-- Contraintes pour la table `comprend_spa`
--
ALTER TABLE `comprend_spa`
  ADD CONSTRAINT `comprend_spafk_1` FOREIGN KEY (`num_soin`) REFERENCES `spa` (`num_soin`),
  ADD CONSTRAINT `comprend_spafk_2` FOREIGN KEY (`num_fact`) REFERENCES `facture` (`num_fact`);

--
-- Contraintes pour la table `consommation`
--
ALTER TABLE `consommation`
  ADD CONSTRAINT `consommation_ibfk_1` FOREIGN KEY (`cat`) REFERENCES `cat_cons` (`cat`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `client` (`Id_Client`);

--
-- Contraintes pour la table `spa`
--
ALTER TABLE `spa`
  ADD CONSTRAINT `spafk_1` FOREIGN KEY (`cat`) REFERENCES `cat_spa` (`cat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
