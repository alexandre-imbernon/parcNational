-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 16 sep. 2024 à 08:42
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `parcnational`
--

-- --------------------------------------------------------

--
-- Structure de la table `points_interet`
--

DROP TABLE IF EXISTS `points_interet`;
CREATE TABLE IF NOT EXISTS `points_interet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `sentier_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sentier_id` (`sentier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sentiers_calanques`
--

DROP TABLE IF EXISTS `sentiers_calanques`;
CREATE TABLE IF NOT EXISTS `sentiers_calanques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `latitude` decimal(8,5) NOT NULL,
  `longitude` decimal(8,5) NOT NULL,
  `difficulte` varchar(50) NOT NULL,
  `longueur_km` decimal(4,2) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sentiers_calanques`
--

INSERT INTO `sentiers_calanques` (`id`, `name`, `latitude`, `longitude`, `difficulte`, `longueur_km`, `description`, `image_url`) VALUES
(1, 'Sentier de la Calanque de Sugiton', 43.21600, 5.44600, 'Moyenne', 5.00, 'Le sentier de la Calanque de Sugiton est l’un des plus populaires et accessible depuis le campus universitaire de Luminy. Il traverse des paysages spectaculaires et offre une vue magnifique sur les eaux cristallines. Le sentier est bien balisé mais comporte quelques portions escarpées, notamment en descente vers la calanque.', 'https://unpieddanslesnuages.com/wp-content/uploads/2015/06/randonn%C3%A9e-sugiton-marseille.jpg'),
(2, 'Sentier de la Calanque d\'En-Vau', 43.20400, 5.51400, 'Difficile', 8.00, 'Ce sentier, particulièrement exigeant, mène à l\'une des plus belles calanques de Marseille, la Calanque d’En-Vau. Il offre des vues époustouflantes sur les falaises blanches et les eaux turquoise. Le chemin est escarpé avec des passages techniques, surtout sur la dernière descente vers la plage.', 'https://madeinmarseille.net/actualites-marseille/2016/03/plage-en-vau.jpg'),
(3, 'Sentier du Cap Canaille (Route des Crêtes)', 43.20100, 5.54800, 'Facile', 3.50, 'Ce sentier longe les falaises du Cap Canaille, les plus hautes d\'Europe, et offre un panorama spectaculaire sur la mer Méditerranée et les Calanques. Le sentier est relativement facile, bien qu\'il y ait quelques montées. Parfait pour une balade familiale ou pour débutants.', 'https://img-4.linternaute.com/ij_vK7RdkFMh8omXPdfPhPt2nuw=/fit-in/630x420/smart/filters:fill(efefef)/b9a1d7aaff2e472986a674745d882246/ccmcms-linternaute/10768508.jpg'),
(4, 'Sentier de la Calanque de Morgiou', 43.21400, 5.42900, 'Moyenne', 6.00, 'Ce sentier traverse un superbe paysage méditerranéen jusqu\'à la Calanque de Morgiou, une ancienne crique de pêcheurs. Il offre une belle diversité de paysages avec une alternance de passages ombragés et ensoleillés. Le sentier est modérément escarpé avec quelques sections rocheuses.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Callanque_Morgiou-4.JPG/1280px-Callanque_Morgiou-4.JPG'),
(5, 'Sentier du Belvédère de Sormiou', 43.21600, 5.41000, 'Moyenne à difficile', 4.50, 'Ce sentier offre des vues spectaculaires sur la Calanque de Sormiou depuis le belvédère. Il nécessite une bonne condition physique, surtout en montée, mais les efforts sont largement récompensés par les panoramas magnifiques sur la mer et les falaises environnantes.', 'https://madeinmarseille.net/actualites-marseille/2015/08/calanque-sormiou-plage.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
