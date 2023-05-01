-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 05 juil. 2021 à 13:37
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `project`
--

-- --------------------------------------------------------

--
-- Structure de la table `médecin`
--

DROP TABLE IF EXISTS `médecin`;
CREATE TABLE IF NOT EXISTS `médecin` (
  `Id_med` int(10) NOT NULL,
  `Nom_med` text NOT NULL,
  `Tél_med` text NOT NULL,
  `Spécialité` text NOT NULL,
  `Montant` float NOT NULL,
  `Sexe` text NOT NULL,
  `Horaire` time NOT NULL,
  PRIMARY KEY (`Id_med`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `médecin`
--

INSERT INTO `médecin` (`Id_med`, `Nom_med`, `Tél_med`, `Spécialité`, `Montant`, `Sexe`, `Horaire`) VALUES
(3, 'Dr Hanane Elfatmi', '065892415', 'Orto-rhino-laryngologiste', 400, 'Femme', '15:30:00'),
(4, 'Dr hassan Souissi', '0600256652', 'Psychologue', 650, 'Homme', '14:30:00'),
(9, 'Dr karim Mahsoun', '0659874125', 'Orto-rhino-laryngologiste', 450, 'Homme', '10:00:00'),
(10, 'Dr Mohamed Kardoud', '061542558', 'Orto-rhino-laryngologiste', 500, 'Homme', '11:00:00'),
(11, 'Dr Ikram Mafdoul', '061548755', 'Psychologue', 600, 'Femme', '08:30:00'),
(12, 'Dr Mohammed Berrada', '0615487522', 'Psychologue', 500, 'Homme', '17:30:00'),
(13, 'Dr Fatema Mafhoum', '065487554', 'Neurologue', 450, 'Femme', '11:30:00'),
(14, 'Dr Hanaa salim', '0658974455', 'Pédiatre', 300, 'Femme', '11:00:00'),
(18, 'Dr Kawtar Halim', '0654875544', 'Neurologue', 600, 'Femme', '16:00:00'),
(19, 'Dr Yassine Maarouf', '0658471544', 'Pédiatre', 450, 'Homme', '12:00:00'),
(25, 'Dr Mohammed Karim', '654875963', 'Neurologue', 800, 'Homme', '09:00:00'),
(56, 'Dr Hajar Abaakil', '0654875200', 'Pédiatre', 300, 'Femme', '16:00:00'),
(88, 'Ihssan HANAFI', '0612354855', 'Cardiologue', 10000, 'femelle', '09:00:00'),
(154, 'Dr Amina Raghib', '0654875965', 'Neurologue', 500, 'Femme', '08:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patientID` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contactNumber` varchar(10) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `bloodGroup` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `anyMajorDisease` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`patientID`, `name`, `contactNumber`, `age`, `gender`, `bloodGroup`, `address`, `anyMajorDisease`) VALUES
('1', 'AHMED Ali', '0612134569', '30', ' Mâle', 'o-', 'Agadir', 'non');

-- --------------------------------------------------------

--
-- Structure de la table `patientreport`
--

DROP TABLE IF EXISTS `patientreport`;
CREATE TABLE IF NOT EXISTS `patientreport` (
  `patientid` varchar(10) DEFAULT NULL,
  `symptom` varchar(200) DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `medicines` varchar(200) DEFAULT NULL,
  `wardReq` varchar(5) DEFAULT NULL,
  `typeWard` varchar(10) DEFAULT NULL,
  KEY `FK` (`patientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patientreport`
--

INSERT INTO `patientreport` (`patientid`, `symptom`, `diagnosis`, `medicines`, `wardReq`, `typeWard`) VALUES
('1', 'symp1', 'diag1', 'med1', 'Oui', 'Général');

-- --------------------------------------------------------

--
-- Structure de la table `rendez-vous`
--

DROP TABLE IF EXISTS `rendez-vous`;
CREATE TABLE IF NOT EXISTS `rendez-vous` (
  `id_rdv` int(11) NOT NULL,
  `Id_med` int(11) NOT NULL,
  `Date` date NOT NULL,
  `horaire` time NOT NULL,
  PRIMARY KEY (`id_rdv`),
  KEY `Id_med` (`Id_med`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `rendez-vous`
--
ALTER TABLE `rendez-vous`
  ADD CONSTRAINT `Id` FOREIGN KEY (`Id_med`) REFERENCES `médecin` (`Id_med`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
