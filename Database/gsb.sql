-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 23 sep. 2023 à 17:02
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `sp_select_visiteur`$$
CREATE DEFINER=`babou`@`%` PROCEDURE `sp_select_visiteur` (IN `code` TEXT, IN `passe` TEXT)  begin

select VIS_CODE, VIS_NOM, VIS_PRENOM

from visiteur

where VIS_PASSE = md5(passe) and

VIS_CODE = code;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `DEP_CODE` char(2) NOT NULL,
  `DEP_NOM` varchar(25) NOT NULL,
  `DEP_REG` char(2) NOT NULL,
  `Prefecture` varchar(25) NOT NULL,
  PRIMARY KEY (`DEP_CODE`),
  KEY `fk_DEPREG` (`DEP_REG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`DEP_CODE`, `DEP_NOM`, `DEP_REG`, `Prefecture`) VALUES
('01', 'Ain', 'RA', 'Bourg-en-Bresse'),
('02', 'Aisne', 'PI', 'Laon'),
('03', 'Allier', 'AU', 'Moulins'),
('04', 'Alpes de Hte Provence', 'PA', 'Digne les Bains'),
('05', 'Hautes Alpes', 'PA', 'Gap'),
('06', 'Alpes Maritimes', 'PA', 'Nice'),
('07', 'Ardèche', 'RA', 'Privas'),
('08', 'Ardennes', 'CA', 'Charleville-Mézières'),
('09', 'Ariège', 'MP', 'Foix'),
('10', 'Aube', 'CA', 'Troyes'),
('11', 'Aude', 'LG', 'Carcassonne'),
('12', 'Aveyron', 'MP', 'Rodez'),
('13', 'Bouches du Rhône', 'PA', 'Marseille'),
('14', 'Calvados', 'BN', 'Caen'),
('15', 'Cantal', 'AU', 'Aurillac'),
('16', 'Charente', 'PC', 'Angoulême'),
('17', 'Charente-Maritime', 'PC', 'La Rochelle'),
('18', 'Cher', 'CE', 'Bourges'),
('19', 'Corrèze', 'LI', 'Tulle'),
('21', 'Côte d\'Or', 'BO', 'Dijon'),
('22', 'Côtes du Nord', 'BG', 'St Brieux'),
('23', 'Creuse', 'LI', 'Guéret'),
('24', 'Dordogne', 'AQ', 'Périgueux'),
('25', 'Doubs', 'FC', 'Besançon'),
('26', 'Drôme', 'RA', 'Valence'),
('27', 'Eure', 'HN', 'Evreux'),
('28', 'Eure et Loir', 'CE', 'Chartres'),
('29', 'Finistère', 'BG', 'Quimper'),
('2A', 'Corse du Sud', 'CO', 'Ajaccio'),
('2B', 'Haute Corse', 'CO', 'Bastia'),
('30', 'Gard', 'LG', 'Nîmes'),
('31', 'Haute Garonne', 'MP', 'Toulouse'),
('32', 'Gers', 'MP', 'Auch'),
('33', 'Gironde', 'AQ', 'Bordeaux'),
('34', 'Hérault', 'LG', 'Montpellier'),
('35', 'Ile et Vilaine', 'BG', 'Rennes'),
('36', 'Indre', 'CE', 'Châteauroux'),
('37', 'Indre et Loire', 'CE', 'Tours'),
('38', 'Isère', 'RA', 'Grenoble'),
('39', 'Jura', 'FC', 'Lons le Saunier'),
('40', 'Landes', 'AQ', 'Mont de Marsan'),
('41', 'Loir et Cher', 'CE', 'Blois'),
('42', 'Loire', 'RA', 'St Etienne'),
('43', 'Haute Loire', 'AU', 'Le Puy'),
('44', 'Loire Atlantique', 'PL', 'Nantes'),
('45', 'Loiret', 'CE', 'Orléans'),
('46', 'Lot', 'MP', 'Cahors'),
('47', 'Lot et Garonne', 'AQ', 'Agen'),
('48', 'Lozère', 'LG', 'Mende'),
('49', 'Maine et Loire', 'PL', 'Angers'),
('50', 'Manche', 'BN', 'St-Lô'),
('51', 'Marne', 'CA', 'Châlons en Champagne'),
('52', 'Haute Marne', 'CA', 'Chaumont'),
('53', 'Mayenne', 'PL', 'Laval'),
('54', 'Meurthe et Moselle', 'LO', 'Nancy'),
('55', 'Meuse', 'LO', 'Bar le Duc'),
('56', 'Morbihan', 'BG', 'Vannes'),
('57', 'Moselle', 'LO', 'Metz'),
('58', 'Nièvre', 'BO', 'Nevers'),
('59', 'Nord', 'NP', 'Lille'),
('60', 'Oise', 'PI', 'Beauvais'),
('61', 'Orne', 'BN', 'Alençon'),
('62', 'Pas de Calais', 'NP', 'Arras'),
('63', 'Puy de Dôme', 'AU', 'Clermont Ferrand'),
('64', 'Pyrénées Atlantiques', 'AQ', 'Pau'),
('65', 'Hautes Pyrénées', 'MP', 'Tarbes'),
('66', 'Pyrénées Orientales', 'LG', 'Perpignan'),
('67', 'Bas Rhin', 'AL', 'Strasbourg'),
('68', 'Haut Rhin', 'AL', 'Colmar'),
('69', 'Rhône', 'RA', 'Lyon'),
('70', 'Haute Saône', 'FC', 'Vesoul'),
('71', 'Saône et Loire', 'BO', 'Mâcon'),
('72', 'Sarthe', 'PL', 'Le Mans'),
('73', 'Savoie', 'RA', 'Chambéry'),
('74', 'Haute Savoie', 'RA', 'Annecy'),
('75', 'Paris', 'IF', 'Paris'),
('76', 'Seine Maritime', 'HN', 'Rouen'),
('77', 'Seine et Marne', 'IF', 'Melun'),
('78', 'Yvelines', 'IF', 'Versailles'),
('79', 'Deux Sèvres', 'PC', 'Niort'),
('80', 'Somme', 'PI', 'Amiens'),
('81', 'Tarn', 'MP', 'Albi'),
('82', 'Tarn et Garonne', 'MP', 'Montauban'),
('83', 'Var', 'PA', 'Toulon'),
('84', 'Vaucluse', 'PA', 'Avignon'),
('85', 'Vendée', 'PL', 'La Roche sur Yon'),
('86', 'Vienne', 'PC', 'Poitiers'),
('87', 'Haute Vienne', 'LI', 'Limoges'),
('88', 'Vosges', 'LO', 'Epinal'),
('89', 'Yonne', 'BO', 'Auxerre'),
('90', 'Territoire de Belfort', 'FC', 'Belfort'),
('91', 'Essonne', 'IF', 'Evry'),
('92', 'Hauts de Seine', 'IF', 'Nanterre'),
('93', 'Seine St Denis', 'IF', 'Bobigny'),
('94', 'Val de Marne', 'IF', 'Créteil'),
('95', 'Val d\'Oise', 'IF', 'Pontoise');

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

DROP TABLE IF EXISTS `famille`;
CREATE TABLE IF NOT EXISTS `famille` (
  `FAM_CODE` char(3) NOT NULL,
  `FAM_LIBELLE` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`FAM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`FAM_CODE`, `FAM_LIBELLE`) VALUES
('AA', 'Antalgiques en association'),
('AAA', 'Antalgiques antipyrétiques en association'),
('AAC', 'Antidépresseur d\'action centrale'),
('AAH', 'Antivertigineux antihistaminique H1'),
('ABA', 'Antibiotique antituberculeux'),
('ABC', 'Antibiotique antiacnéique local'),
('ABP', 'Antibiotique de la famille des béta-lactamines (pénicilline A)'),
('AFC', 'Antibiotique de la famille des cyclines'),
('AFM', 'Antibiotique de la famille des macrolides'),
('AH', 'Antihistaminique H1 local'),
('AIM', 'Antidépresseur imipraminique (tricyclique)'),
('AIN', 'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),
('ALO', 'Antibiotique local (ORL)'),
('ANS', 'Antidépresseur IMAO non sélectif'),
('AO', 'Antibiotique ophtalmique'),
('AP', 'Antipsychotique normothymique'),
('AUM', 'Antibiotique urinaire minute'),
('CRT', 'Corticoïde, antibiotique et antifongique à  usage local'),
('HYP', 'Hypnotique antihistaminique'),
('PSA', 'Psychostimulant, antiasthénique');

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

DROP TABLE IF EXISTS `laboratoire`;
CREATE TABLE IF NOT EXISTS `laboratoire` (
  `LAB_CODE` char(2) NOT NULL,
  `LAB_NOM` varchar(15) DEFAULT NULL,
  `LAB_CHEFVENTE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LAB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `laboratoire`
--

INSERT INTO `laboratoire` (`LAB_CODE`, `LAB_NOM`, `LAB_CHEFVENTE`) VALUES
('BC', 'Bichat', 'Suzanne Terminus'),
('GY', 'Gyverny', 'Marcel MacDouglas'),
('SW', 'Swiss Kane', 'Alain Poutre');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `MED_CODE` char(10) NOT NULL,
  `MED_NOM` varchar(25) DEFAULT NULL,
  `MED_LABO` char(2) DEFAULT NULL,
  `MED_FAMILLE` char(3) DEFAULT NULL,
  `MED_COMPO` varchar(255) DEFAULT NULL,
  `MED_EFFETS` varchar(255) DEFAULT NULL,
  `MED_CONTREINDIC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MED_CODE`),
  KEY `fk_MEDLAB` (`MED_LABO`),
  KEY `fk_MEDFAM` (`MED_FAMILLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`MED_CODE`, `MED_NOM`, `MED_LABO`, `MED_FAMILLE`, `MED_COMPO`, `MED_EFFETS`, `MED_CONTREINDIC`) VALUES
('3MYC7', 'TRIMYCINE', 'SW', 'CRT', 'Triamcinolone (acétonide) + Néomycine + Nystatine', 'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'infections de la peau ou de parasitisme non traités, d\'acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.'),
('ADIMOL9', 'ADIMOL', 'SW', 'ABP', 'Amoxicilline + Acide clavulanique', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines ou aux céphalosporines.'),
('AMOPIL7', 'AMOPIL', 'GY', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.'),
('AMOX45', 'AMOXAR', 'GY', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.'),
('AMOXIG12', 'AMOXI Gé', 'SW', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.'),
('APATOUX22', 'APATOUX Vitamine C', 'GY', 'ALO', 'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, en cas de phénylcétonurie et chez l\'enfant de moins de 6 ans.'),
('BACTIG10', 'BACTIGEL', 'GY', 'ABC', 'Erythromycine', 'Ce médicament est utilisé en application locale pour traiter l\'acné et les infections cutanées bactériennes associées.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.'),
('BACTIV13', 'BACTIVIL', 'SW', 'AFM', 'Erythromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).'),
('BITALV', 'BIVALIC', 'SW', 'AAA', 'Dextropropoxyphène + Paracétamol', 'Ce médicament est utilisé pour traiter les douleurs d\'intensité modérée ou intense.', 'Ce médicament est contre-indiqué en cas d\'allergie aux médicaments de cette famille, d\'insuffisance hépatique ou d\'insuffisance rénale.'),
('CARTION6', 'CARTION', 'GY', 'AAA', 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d\'ulcère gastroduodénal, maladies graves du foie.'),
('CLAZER6', 'CLAZER', 'GY', 'AFM', 'Clarithromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l\'ulcère gastro-duodénal, en association avec d\'autres médicaments.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).'),
('DEPRIL9', 'DEPRAMIL', 'SW', 'AIM', 'Clomipramine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l\'enfant.', 'Ce médicament est contre-indiqué en cas de glaucome ou d\'adénome de la prostate, d\'infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d\'allergie aux antidépresseurs imipraminiques.'),
('DIMIRTAM6', 'DIMIRTAM', 'SW', 'AAC', 'Mirtazapine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', 'La prise de ce produit est contre-indiquée en cas de d\'allergie à  l\'un des constituants.'),
('DOLRIL7', 'DOLORIL', 'SW', 'AAA', 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas d\'allergie au paracétamol ou aux salicylates.'),
('DORNOM8', 'NORMADOR', 'GY', 'HYP', 'Doxylamine', 'Ce médicament est utilisé pour traiter l\'insomnie chez l\'adulte.', 'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l\'enfant de moins de 15 ans.'),
('EQUILARX6', 'EQUILAR', 'SW', 'AAH', 'Méclozine', 'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', 'Ce médicament ne doit pas être utilisé en cas d\'allergie au produit, en cas de glaucome ou de rétention urinaire.'),
('EVILR7', 'EVEILLOR', 'GY', 'PSA', 'Adrafinil', 'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.'),
('INSXT5', 'INSECTIL', 'SW', 'AH', 'Diphénydramine', 'Ce médicament est utilisé en application locale sur les piqûres d\'insecte et l\'urticaire.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antihistaminiques.'),
('JOVAI8', 'JOVENIL', 'SW', 'AFM', 'Josamycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).'),
('LIDOXY23', 'LIDOXYTRACINE', 'GY', 'AFC', 'Oxytétracycline +Lidocaïne', 'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants. Il ne doit pas être associé aux rétinoïdes.'),
('LITHOR12', 'LITHORINE', 'SW', 'AP', 'Lithium', 'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', 'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d\'insuffisance rénale, ou si vous avez un régime sans sel.'),
('PARMOL16', 'PARMOCODEINE', 'GY', 'AA', 'Codéine + Paracétamol', 'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance hépatique ou respiratoire, d\'asthme, de phénylcétonurie et chez la femme qui allaite.'),
('PHYSOI8', 'PHYSICOR', 'SW', 'PSA', 'Sulbutiamine', 'Ce médicament est utilisé pour traiter les baisses d\'activité physique ou psychique, souvent dans un contexte de dépression.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.'),
('PIRIZ8', 'PIRIZAN', 'GY', 'ABA', 'Pyrazinamide', 'Ce médicament est utilisé, en association à  d\'autres antibiotiques, pour traiter la tuberculose.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'insuffisance rénale ou hépatique, d\'hyperuricémie ou de porphyrie.'),
('POMDI20', 'POMADINE', 'SW', 'AO', 'Bacitracine', 'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l\'oeil.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques appliqués localement.'),
('TROXT21', 'TROXADET', 'SW', 'AIN', 'Paroxétine', 'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', 'Ce médicament est contre-indiqué en cas d\'allergie au produit.'),
('TXISOL22', 'TOUXISOL Vitamine C', 'GY', 'ALO', 'Tyrothricine + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants et chez l\'enfant de moins de 6 ans.'),
('URIEG6', 'URIREGUL', 'GY', 'AUM', 'Fosfomycine trométamol', 'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', 'La prise de ce médicament est contre-indiquée en cas d\'allergie à  l\'un des constituants et d\'insuffisance rénale.');

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

DROP TABLE IF EXISTS `offre`;
CREATE TABLE IF NOT EXISTS `offre` (
  `OFF_VIS` char(5) NOT NULL DEFAULT '',
  `OFF_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OFF_PRA` int(11) DEFAULT NULL,
  `OFF_MED` char(10) NOT NULL DEFAULT '',
  `OFF_QTE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`OFF_VIS`,`OFF_DATE`,`OFF_MED`),
  KEY `OFF_VIS` (`OFF_VIS`,`OFF_DATE`),
  KEY `fk_OFFPRA` (`OFF_PRA`),
  KEY `fk_OFFMED` (`OFF_MED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `offre`
--

INSERT INTO `offre` (`OFF_VIS`, `OFF_DATE`, `OFF_PRA`, `OFF_MED`, `OFF_QTE`) VALUES
('a131', '2014-06-11 07:00:00', 62, 'LITHOR12', 5),
('a131', '2014-06-19 07:00:00', 83, 'DEPRIL9', 5),
('a131', '2014-06-19 09:00:00', 93, 'DEPRIL9', 5),
('a17', '2014-06-10 07:00:00', 106, 'APATOUX22', 4),
('a17', '2014-06-19 07:00:00', 94, 'PARMOL16', 3),
('a17', '2014-06-19 09:00:00', 99, 'PARMOL16', 3),
('c14', '2014-06-11 07:00:00', 103, 'DEPRIL9', 3),
('c14', '2014-06-19 09:00:00', 15, 'PHYSOI8', 5),
('c14', '2014-06-20 07:00:00', 16, 'PHYSOI8', 3),
('c54', '2016-09-14 06:51:19', 11, 'AMOX45', NULL),
('c54', '2016-09-14 06:51:19', 11, 'APATOUX22', 2),
('c54', '2016-09-14 06:51:19', 11, 'BACTIV13', 4),
('c54', '2016-09-14 06:51:19', 11, 'DIMIRTAM6', NULL),
('e22', '2014-06-12 07:00:00', 74, 'CARTION6', 4),
('e22', '2014-06-19 09:00:00', 87, 'CARTION6', 4),
('e22', '2014-06-20 07:00:00', 88, 'APATOUX22', 3),
('m45', '2016-09-14 07:10:56', 62, 'DIMIRTAM6', 8),
('m45', '2016-09-14 07:10:56', 62, 'EQUILARX6', NULL),
('m45', '2016-09-14 07:10:56', 62, 'TROXT21', 9),
('m45', '2016-09-14 07:10:56', 62, 'URIEG6', 5);

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
CREATE TABLE IF NOT EXISTS `praticien` (
  `PRA_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `PRA_NOM` varchar(25) DEFAULT NULL,
  `PRA_PRENOM` varchar(30) DEFAULT NULL,
  `PRA_ADRESSE` varchar(50) DEFAULT NULL,
  `PRA_CP` char(5) DEFAULT NULL,
  `PRA_VILLE` varchar(25) DEFAULT NULL,
  `PRA_COEF` float DEFAULT NULL,
  `PRA_TYPE` char(2) NOT NULL,
  `PRA_ZONE` char(2) NOT NULL,
  PRIMARY KEY (`PRA_NUM`),
  KEY `fk_PRATYPE` (`PRA_TYPE`),
  KEY `fk_PRAZONE` (`PRA_ZONE`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`PRA_NUM`, `PRA_NOM`, `PRA_PRENOM`, `PRA_ADRESSE`, `PRA_CP`, `PRA_VILLE`, `PRA_COEF`, `PRA_TYPE`, `PRA_ZONE`) VALUES
(1, 'Notini', 'Alain', '114 rue Authie', '85000', 'LA ROCHE SUR YON', 290.03, 'MH', 'PL'),
(2, 'Gosselin', 'Albert', '13 rue Devon', '41000', 'BLOIS', 307.49, 'MV', 'CE'),
(3, 'Delahaye', 'André', '36 avenue du 6 Juin', '25000', 'BESANCON', 185.79, 'PS', 'FC'),
(4, 'Leroux', 'André', '47 avenue Robert Schuman', '60000', 'BEAUVAIS', 172.04, 'PH', 'PI'),
(5, 'Desmoulins', 'Anne', '31 rue St Jean', '30000', 'NIMES', 94.75, 'PO', 'LG'),
(6, 'Mouel', 'Anne', '27 rue Auvergne', '80000', 'AMIENS', 45.2, 'MH', 'PI'),
(7, 'Desgranges-Lentz', 'Antoine', '1 rue Albert de Mun', '29000', 'MORLAIX', 20.07, 'MV', 'BG'),
(8, 'Martin', 'Arnaud', '31 rue St Jean', '68000', 'MULHOUSE', 396.52, 'PS', 'AL'),
(9, 'Dupuy', 'Benoit', '9 rue Demolombe', '34000', 'MONTPELLIER', 395.66, 'PH', 'LG'),
(10, 'Lerat', 'Bernard', '31 rue St Jean', '59000', 'LILLE', 257.79, 'PO', 'NP'),
(11, 'Marçais-Lefebvre', 'Bertrand', '86Bis rue Basse', '67000', 'STRASBOURG', 450.96, 'MH', 'AL'),
(12, 'Boscher', 'Bruno', '94 rue Falaise', '10000', 'TROYES', 356.14, 'MV', 'CA'),
(13, 'Morel', 'Catherine', '21 rue Chateaubriand', '75000', 'PARIS', 379.57, 'PS', 'IF'),
(14, 'Guivarch', 'Chantal', '4 avenue du Général Laperrine', '45000', 'ORLEANS', 114.56, 'PH', 'CE'),
(15, 'Bessin-Grosdoit', 'Christophe', '92 rue Falaise', '06000', 'NICE', 222.06, 'PO', 'PA'),
(16, 'Rossa', 'Claire', '14 avenue  Thiès', '06000', 'NICE', 529.78, 'MH', 'PA'),
(17, 'Cauchy', 'Denis', '5 avenue  Ste Thérèse', '11000', 'NARBONNE', 458.82, 'MV', 'LG'),
(18, 'Gaffé', 'Dominique', '9 avenue  1ère Armée Française', '35000', 'RENNES', 213.4, 'PS', 'BG'),
(19, 'Guenon', 'Dominique', '98 bd Maréchal Lyautey', '44000', 'NANTES', 175.89, 'PH', 'PL'),
(20, 'Prévot', 'Dominique', '29 rue Lucien Nelle', '87000', 'LIMOGES', 151.36, 'PO', 'LI'),
(21, 'Houchard', 'Eliane', '9 rue Demolombe', '49100', 'ANGERS', 436.96, 'MH', 'PL'),
(22, 'Desmons', 'Elisabeth', '51 rue Bernières', '29000', 'QUIMPER', 281.17, 'MV', 'BG'),
(23, 'Flament', 'Elisabeth', '11 rue Pasteur', '35000', 'RENNES', 315.6, 'PS', 'BG'),
(24, 'Goussard', 'Emmanuel', '9 rue Demolombe', '41000', 'BLOIS', 40.72, 'PH', 'PL'),
(25, 'Desprez', 'Eric', '9 rue Vaucelles', '33000', 'BORDEAUX', 406.85, 'PO', 'AQ'),
(26, 'Coste', 'Evelyne', '29 rue Lucien Nelle', '19000', 'TULLE', 441.87, 'MH', 'LI'),
(27, 'Lefebvre', 'Frédéric', '2 pl Wurzburg', '55000', 'VERDUN', 573.63, 'MV', 'LO'),
(28, 'Lemée', 'Frédéric', '29 avenue du 6 Juin', '56000', 'VANNES', 326.4, 'PS', 'BG'),
(29, 'Martin', 'Frédéric', 'Bât A 90 rue de Bayeux', '70000', 'VESOUL', 506.06, 'PH', 'FC'),
(30, 'Marie', 'Frédérique', '172 rue Caponière', '70000', 'VESOUL', 313.31, 'PO', 'FC'),
(31, 'Rosenstech', 'Geneviève', '27 rue Auvergne', '75000', 'PARIS', 366.82, 'MH', 'IF'),
(32, 'Pontavice', 'Ghislaine', '8 rue Gaillon', '86000', 'POITIERS', 265.58, 'MV', 'PL'),
(33, 'Leveneur-Mosquet', 'Guillaume', '47 avenue  Robert Schuman', '64000', 'PAU', 184.97, 'PS', 'AQ'),
(34, 'Blanchais', 'Guy', '30 rue Authie', '08000', 'SEDAN', 502.48, 'PH', 'CA'),
(35, 'Leveneur', 'Hugues', '7 place St Gilles', '62000', 'ARRAS', 7.39, 'PO', 'NP'),
(36, 'Mosquet', 'Isabelle', '22 rue Jules Verne', '76000', 'ROUEN', 77.1, 'MH', 'HN'),
(37, 'Giraudon', 'Jean-Christophe', '1 rue Albert de Mun', '38200', 'VIENNE', 92.62, 'MV', 'RA'),
(38, 'Marie', 'Jean-Claude', '26 rue Hérouville', '69000', 'LYON', 120.1, 'PS', 'RA'),
(39, 'Maury', 'Jean-François', '5 rue Pierre Girard', '71000', 'CHALON SUR SAONE', 13.73, 'PH', 'BO'),
(40, 'Dennel', 'Jean-Louis', '7 pl St Gilles', '28000', 'CHARTRES', 550.69, 'PO', 'CE'),
(41, 'Ain', 'Jean-Pierre', '4 résidence Olympia', '02000', 'LAON', 5.59, 'MH', 'PI'),
(42, 'Chemery', 'Jean-Pierre', '51 pl Ancienne Boucherie', '14000', 'CAEN', 396.58, 'MV', 'BN'),
(43, 'Comoz', 'Jean-Pierre', '35 rue Auguste Lechesne', '18000', 'BOURGES', 340.35, 'PS', 'CE'),
(44, 'Desfaudais', 'Jean-Pierre', '7 pl St Gilles', '29000', 'BREST', 71.76, 'PH', 'BG'),
(45, 'Phan', 'Jérôme', '9 rue Clos Caillet', '79000', 'NIORT', 451.61, 'PO', 'PC'),
(46, 'Riou', 'Line', '43 bd Gén Vanier', '77000', 'MARNE LA VALLEE', 193.25, 'MH', 'IF'),
(47, 'Chubilleau', 'Louis', '46 rue Eglise', '17000', 'SAINTES', 202.07, 'MV', 'PC'),
(48, 'Lebrun', 'Lucette', '178 rue Auge', '54000', 'NANCY', 410.41, 'PS', 'AL'),
(49, 'Goessens', 'Marc', '6 avenue du 6 Juin', '39000', 'DOLE', 548.57, 'PH', 'FC'),
(50, 'Laforge', 'Marc', '5 résid Prairie', '50000', 'SAINT LO', 265.05, 'PO', 'BN'),
(51, 'Millereau', 'Marc', '36 avenue du 6 Juin', '72000', 'LA FERTE BERNARD', 430.42, 'MH', 'PL'),
(52, 'Dauverne', 'Marie-Christine', '69 avenue Charlemagne', '21000', 'DIJON', 281.05, 'MV', 'BO'),
(53, 'Vittorio', 'Myriam', '3 place Champlain', '94000', 'BOISSY SAINT LEGER', 356.23, 'PS', 'IF'),
(54, 'Lapasset', 'Nhieu', '31 avenue du 6 Juin', '52000', 'CHAUMONT', 107, 'PH', 'CA'),
(55, 'Plantet-Besnier', 'Nicole', '10 avenue de la 1ère Armée Française', '86000', 'CHATELLEREAULT', 369.94, 'PO', 'PC'),
(56, 'Chubilleau', 'Pascal', '3 rue Hastings', '15000', 'AURILLAC', 290.75, 'MH', 'AU'),
(57, 'Robert', 'Pascal', '31 rue St Jean', '93000', 'BOBIGNY', 162.41, 'MV', 'IF'),
(58, 'Jean', 'Pascale', '114 rue Authie', '49100', 'SAUMUR', 375.52, 'PS', 'PL'),
(59, 'Chanteloube', 'Patrice', '14 avenue Thiès', '34000', 'MONTPELLIER', 478.01, 'PH', 'PA'),
(60, 'Lecuirot', 'Patrice', 'résidence St Pères 55 rue Pigacière', '54000', 'NANCY', 239.66, 'PO', 'AL'),
(61, 'Gandon', 'Patrick', '47 avenue Robert Schuman', '37000', 'TOURS', 599.06, 'MH', 'PL'),
(62, 'Mirouf', 'Patrick', '22 rue Puits Picard', '74000', 'ANNECY', 458.42, 'MV', 'RA'),
(63, 'Boireaux', 'Philippe', '14 avenue Thiès', '51000', 'CHALONS EN CHAMPAGNE', 454.48, 'PS', 'CA'),
(64, 'Cendrier', 'Philippe', '7 pl St Gilles', '12000', 'RODEZ', 164.16, 'PH', 'MP'),
(65, 'Duhamel', 'Philippe', '114 rue Authie', '34000', 'MONTPELLIER', 98.62, 'PO', 'LG'),
(66, 'Grigy', 'Philippe', '15 rue Mélingue', '44000', 'CLISSON', 285.1, 'MH', 'PL'),
(67, 'Linard', 'Philippe', '1 rue Albert de Mun', '81000', 'ALBI', 486.3, 'MV', 'MP'),
(68, 'Lozier', 'Philippe', '8 rue Gaillon', '31000', 'TOULOUSE', 48.4, 'PS', 'MP'),
(69, 'Dechâtre', 'Pierre', '63 avenue Thiès', '23000', 'MONTLUCON', 253.75, 'PH', 'LI'),
(70, 'Goessens', 'Pierre', '22 rue Jean Romain', '40000', 'MONT DE MARSAN', 426.19, 'PO', 'AQ'),
(71, 'Leménager', 'Pierre', '39 avenue du 6 Juin', '57000', 'METZ', 118.7, 'MH', 'LO'),
(72, 'Née', 'Pierre', '39 avenue  6 Juin', '82000', 'MONTAUBAN', 72.54, 'MV', 'MP'),
(73, 'Guyot', 'Pierre-Laurent', '43 bd Général Vanier', '48000', 'MENDE', 352.31, 'PS', 'LG'),
(74, 'Chauchard', 'Roger', '9 rue Vaucelles', '13001', 'MARSEILLE', 552.19, 'PH', 'PA'),
(75, 'Mabire', 'Roland', '11 rue Boutiques', '67000', 'STRASBOURG', 422.39, 'PO', 'AL'),
(76, 'Leroy', 'Soazig', '45 rue Boutiques', '61000', 'ALENCON', 570.67, 'MH', 'BN'),
(77, 'Guyot', 'Stéphane', '26 rue Hérouville', '46000', 'FIGEAC', 28.85, 'MV', 'MP'),
(78, 'Delposen', 'Sylvain', '39 avenue du 6 Juin', '27000', 'DREUX', 292.01, 'PS', 'HN'),
(79, 'Rault', 'Sylvie', '15 bd Richemond', '02000', 'SOISSON', 526.6, 'PH', 'PI'),
(80, 'Renouf', 'Sylvie', '98 bd Maréchal Lyautey', '88000', 'EPINAL', 425.24, 'PO', 'AL'),
(81, 'Alliet-Grach', 'Thierry', '14 avenue Thiès', '07000', 'PRIVAS', 451.31, 'MH', 'RA'),
(82, 'Bayard', 'Thierry', '92 rue Falaise', '42000', 'SAINT ETIENNE', 271.71, 'MV', 'RA'),
(83, 'Gauchet', 'Thierry', '7 rue Desmoueux', '38100', 'GRENOBLE', 406.1, 'PS', 'RA'),
(84, 'Bobichon', 'Tristan', '219 rue Caponière', '09000', 'FOIX', 218.36, 'PH', 'MP'),
(85, 'Duchemin-Laniel', 'Véronique', '130 rue St Jean', '33000', 'LIBOURNE', 265.61, 'PO', 'AQ'),
(86, 'Younès', 'Laurent', '34 rue Demolombe', '53000', 'MAYENNE', 496.1, 'MH', 'PL'),
(87, 'Delétoile', 'André', '14, rue Bédarride', '13100', 'AIX EN PROVENCE', 456.1, 'MV', 'PA'),
(88, 'Azrayan', 'Malik', '56, rue Nationale', '13770', 'VENELLES', 456.1, 'MV', 'PA'),
(89, 'Artières', 'Antoine', '454, Cours de Arts et métiers', '13100', 'AIX EN PROVENCE', 34.1, 'MV', 'PA'),
(90, 'Dacosta', 'Michèle', '34 boulevard des Lices', '13200', 'ARLES', 460.2, 'MV', 'PA'),
(91, 'Demar', 'Alexandre', '35 bd du Théâtre', '13500', 'MARTIQUES', 300.1, 'MV', 'PA'),
(92, 'Mazetta', 'Léon', '450, Le Prado', '13008', 'MARSEILLE', 456.1, 'MV', 'PA'),
(93, 'Garnier', 'Alexandre', '450, Quai de l\'Isère', '38000', 'GRENOBRE', 300.1, 'MV', 'RA'),
(94, 'Chautard', 'Léon', '3 rue Chataing', '38580', 'ALLEVARD', 409.1, 'MV', 'RA'),
(95, 'Bunisset', 'Francis', '10 rue Nicolas Chorier', '85000', 'LA ROCHE SUR YON', 110, 'MV', 'PL'),
(96, 'Cacheux', 'Bernard', '114 rue Authie', '34000', 'MONTPELLIER', 160, 'MV', 'LG'),
(97, 'Clepkens', 'Christophe', '12 rue Fédérico Garcia Lorca', '13009', 'MARSEILLE', 150, 'MV', 'PA'),
(98, 'Debelle', 'Jeanne', '134 rue Stalingrad', '25000', 'BESANCON', 340, 'MV', 'FC'),
(99, 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', 300, 'MV', 'RA'),
(100, 'Gest', 'Alain', '30 rue Authie', '46000', 'FIGEAC', 200, 'MV', 'MP'),
(101, 'Gheysen', 'Galassus', '32 avenue Foch', '75000', 'PARIS', 500, 'MV', 'IF'),
(102, 'Lanne', 'Bernard', '4 rue Bayeux', '30000', 'NIMES', 150, 'MV', 'LG'),
(103, 'Legendre', 'Jean', '39 rue Raspail', '83000', 'AVIGNON', 250, 'MV', 'PA'),
(104, 'Pernot', 'Claude-Noël', '6 rue Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', 220, 'MV', 'LG'),
(105, 'Marcouiller', 'Gérard', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', 120, 'MV', 'IF'),
(106, 'Quiquandon', 'Joël', '7 rue Ernest Renan', '78000', 'CHAMBERY', 300, 'MV', 'RA'),
(107, 'Tréhet', 'Alain', '7D chem Barral', '12000', 'RODEZ', 200, 'MV', 'MP'),
(108, 'Loirat', 'Didier', 'Les Pêchers cité Bourg la Croix', '89000', 'AUXERRE', 310, 'MV', 'BO'),
(109, 'Sartin', 'Robert', '48 Quai de la Saône', '71000', 'MACON', 250, 'MV', 'BO'),
(110, 'Ribaud', 'Jean', '8, bd de la République', '71000', 'MACON', 250, 'MV', 'BO'),
(111, 'Lefebvre', 'Marcel', '4 rue de la basilique', '58000', 'NEVERS', 350, 'MV', 'BO'),
(112, 'Martin', 'Adéline', '49 rue Neuve', '89100', 'SENS', 150, 'MV', 'BO'),
(113, 'Allemand', 'Régine', '6 grand rue', '89200', 'AVALLON', 280, 'MV', 'BO'),
(114, 'LeDantec', 'Yves', '45, place de la République', '89000', 'COSNE SUR LOIRE', 310, 'MV', 'BO'),
(115, 'Grebert', 'Lucie', '48, bd de la Gare', '89000', 'TOURNUS', 310, 'MV', 'BO'),
(116, 'Leveque', 'Serge', '8 des Aiguilles', '46000', 'CAHORS', 310, 'MV', 'MP'),
(117, 'Demarets', 'Andrée', 'Chemin de Bonne', '65000', 'TARBES', 110, 'MV', 'MP'),
(118, 'Delassus', 'Daniel', '4, Bd national', '77300', 'FONTAINEBLEAU', 350, 'MV', 'IF'),
(119, 'Morel', 'Georges', '56, rue des Alouettes', '91150', 'ETAMPES', 310, 'MV', 'IF'),
(120, 'Bouquet', 'Jeanne', '34 rue Victor Hugo', '77000', 'MEAUX', 310, 'MV', 'IF'),
(121, 'Fabre', 'Antoinette', '60, bd des remparts', '11000', 'CARCASSONNE', 380, 'MV', 'LG'),
(122, 'Blanchard', 'Raymond', '35, rue haute', '11400', 'CASTELNAUDARY', 210, 'MV', 'LG'),
(123, 'Campani', 'Lucien', '456, rue Georges', '39000', 'LONS LE SAULNIER', 310, 'MV', 'FC'),
(124, 'Couderc', 'Antoine', '8, place des Trés', '25300', 'PONTARLIER', 140, 'MV', 'FC'),
(125, 'Freymann', 'Jean', '51, rue de l\'Egalité', '25200', 'MONTBELIARD', 340, 'MV', 'FC'),
(126, 'Bonnefond', 'Jean-Pierre', '34 rue de Berne', '70120', 'GRANDECOURT', 500, 'MV', 'FC'),
(127, 'Chenel', 'Lucie', '78, rue des Salines', '25610', 'ARC ET SENANS', 360, 'MV', 'FC');

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

DROP TABLE IF EXISTS `rapport`;
CREATE TABLE IF NOT EXISTS `rapport` (
  `RAP_VIS` char(5) NOT NULL DEFAULT '',
  `RAP_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RAP_PRA` int(11) DEFAULT NULL,
  `RAP_PRATINI` int(11) DEFAULT NULL,
  `RAP_MOTIF` varchar(25) DEFAULT NULL,
  `RAP_BILAN` varchar(255) DEFAULT NULL,
  `RAP_REMONT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RAP_VIS`,`RAP_DATE`),
  KEY `fk_RAPPRA` (`RAP_PRA`),
  KEY `fk_RAPPRATINI` (`RAP_PRATINI`),
  KEY `RAP_VIS` (`RAP_VIS`,`RAP_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rapport`
--

INSERT INTO `rapport` (`RAP_VIS`, `RAP_DATE`, `RAP_PRA`, `RAP_PRATINI`, `RAP_MOTIF`, `RAP_BILAN`, `RAP_REMONT`) VALUES
('a131', '2014-06-11 07:00:00', 28, 28, NULL, 'TEST2', NULL),
('a131', '2014-06-19 07:00:00', 18, 18, NULL, NULL, NULL),
('a131', '2014-06-19 09:00:00', 22, 22, NULL, NULL, NULL),
('a131', '2016-05-10 06:00:00', 28, 28, 'Actualisation', 'Rendes-Vous accpetable ', NULL),
('a131', '2018-12-25 08:30:00', 22, 22, 'Autre', NULL, NULL),
('a131', '2023-10-16 06:00:00', 23, 23, 'Actualisation', NULL, NULL),
('a17', '2014-06-10 07:00:00', 106, 106, NULL, NULL, NULL),
('a17', '2014-06-19 07:00:00', 94, 94, NULL, NULL, NULL),
('a17', '2014-06-19 09:00:00', 99, 99, NULL, NULL, NULL),
('a93', '2016-09-14 07:27:26', 55, 55, ' ', NULL, NULL),
('b16', '2016-09-07 09:24:43', 7, 7, NULL, NULL, NULL),
('c14', '2014-06-11 07:00:00', 103, 103, NULL, NULL, NULL),
('c14', '2014-06-19 09:00:00', 15, 15, NULL, NULL, NULL),
('c14', '2014-06-20 07:00:00', 16, 16, NULL, NULL, NULL),
('c54', '2016-09-14 06:51:19', 11, 11, 'motif du rapport', 'bilan du rapport', NULL),
('e22', '2014-06-12 07:00:00', 74, 74, NULL, NULL, NULL),
('e22', '2014-06-19 09:00:00', 87, 87, NULL, NULL, NULL),
('e22', '2014-06-20 07:00:00', 88, 88, NULL, NULL, NULL),
('m45', '2016-09-14 07:10:56', 87, NULL, 'Relance', 'La relance de la balle de baseball lol', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `REG_CODE` char(2) NOT NULL,
  `REG_NOM` varchar(25) NOT NULL,
  PRIMARY KEY (`REG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`REG_CODE`, `REG_NOM`) VALUES
('AL', 'Alsace'),
('AQ', 'Aquitaine'),
('AU', 'Auvergne'),
('BG', 'Bretagne'),
('BN', 'Basse Normandie'),
('BO', 'Bourgogne'),
('CA', 'Champagne-Ardennes'),
('CE', 'Centre'),
('CO', 'Corse'),
('FC', 'Franche-Comté'),
('HN', 'Haute Normandie'),
('IF', 'Ile de France'),
('LG', 'Languedoc-Roussillon'),
('LI', 'Limousin'),
('LO', 'Lorraine'),
('MP', 'Midi-Pyrénées'),
('NP', 'Nord-Pas de Calais'),
('PA', 'Provence-Côte d\'Azur'),
('PC', 'Poitou-Charentes'),
('PI', 'Picardie'),
('PL', 'Pays de la Loire'),
('RA', 'Rhône-Alpes');

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

DROP TABLE IF EXISTS `travail`;
CREATE TABLE IF NOT EXISTS `travail` (
  `TRA_VIS` char(5) NOT NULL DEFAULT '',
  `TRA_DATAFF` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TRA_REG` char(2) NOT NULL,
  `TRA_ROLE` char(11) NOT NULL,
  PRIMARY KEY (`TRA_VIS`,`TRA_DATAFF`),
  KEY `fk_TRAREG` (`TRA_REG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `travail`
--

INSERT INTO `travail` (`TRA_VIS`, `TRA_DATAFF`, `TRA_REG`, `TRA_ROLE`) VALUES
('a131', '1992-12-10 23:00:00', 'BG', 'Visiteur'),
('a17', '1991-08-25 22:00:00', 'RA', 'Visiteur'),
('a17', '2012-09-18 22:00:00', 'RA', 'Délégué'),
('a55', '2002-08-20 22:00:00', 'MP', 'Délégué'),
('a55', '2007-07-16 22:00:00', 'MP', 'Visiteur'),
('a93', '1999-11-01 23:00:00', 'PC', 'Visiteur'),
('b13', '1996-03-10 23:00:00', 'AL', 'Visiteur'),
('b16', '2007-03-20 23:00:00', 'BG', 'Visiteur'),
('b25', '1994-07-02 22:00:00', 'PL', 'Visiteur'),
('b25', '1999-12-31 23:00:00', 'PL', 'Délégué'),
('b34', '1993-12-05 23:00:00', 'CE', 'Délégué'),
('b34', '2000-12-31 23:00:00', 'CE', 'Responsable'),
('b4', '1997-09-24 22:00:00', 'AQ', 'Visiteur'),
('b59', '1995-10-20 22:00:00', 'RA', 'Visiteur'),
('b59', '2004-12-31 23:00:00', 'RA', 'Responsable'),
('babs', '2016-09-28 08:54:28', 'PA', ''),
('c14', '1989-01-31 23:00:00', 'PA', 'Visiteur'),
('c14', '1997-01-31 23:00:00', 'PA', 'Délégué'),
('c14', '2000-12-31 23:00:00', 'PA', 'Responsable'),
('c3', '1992-05-04 22:00:00', 'CA', 'Visiteur'),
('c54', '1991-03-31 22:00:00', 'AL', 'Visiteur'),
('d51', '1997-11-17 23:00:00', 'FC', 'Délégué'),
('d51', '2001-12-31 23:00:00', 'FC', 'Responsable'),
('e22', '1989-03-23 23:00:00', 'PA', 'Visiteur'),
('e24', '1993-04-30 22:00:00', 'PA', 'Délégué'),
('e24', '2000-02-28 23:00:00', 'AL', 'Responsable'),
('e39', '2008-04-25 22:00:00', 'IF', 'Visiteur'),
('e49', '1996-02-18 23:00:00', 'MP', 'Visiteur'),
('e5', '1990-11-26 23:00:00', 'AQ', 'Visiteur'),
('e5', '1992-10-31 23:00:00', 'AQ', 'Délégué'),
('e5', '2005-10-31 23:00:00', 'AQ', 'Responsable'),
('e52', '1991-10-30 23:00:00', 'HN', 'Visiteur'),
('f39', '1997-02-14 23:00:00', 'RA', 'Visiteur'),
('f39', '2007-02-14 23:00:00', 'RA', 'Responsable'),
('g30', '2004-12-31 23:00:00', 'PI', 'Délégué'),
('g30', '2005-02-28 23:00:00', 'PI', 'Responsable'),
('g53', '2005-10-04 22:00:00', 'BG', 'Visiteur'),
('g7', '2005-01-14 23:00:00', 'LI', 'Visiteur'),
('h13', '2001-05-07 22:00:00', 'LI', 'Visiteur'),
('h30', '1999-04-25 22:00:00', 'IF', 'Visiteur'),
('h35', '2004-08-19 22:00:00', 'AU', 'Visiteur'),
('h40', '2003-02-28 23:00:00', 'CA', 'Visiteur'),
('j45', '2004-02-24 23:00:00', 'CA', 'Responsable'),
('j50', '1992-11-30 23:00:00', 'NP', 'Visiteur'),
('j8', '2005-05-31 22:00:00', 'IF', 'Responsable'),
('k53', '0000-00-00 00:00:00', 'AL', 'Délégué'),
('k53', '1983-03-19 23:00:00', 'AL', 'Visiteur'),
('l23', '2006-05-31 22:00:00', 'CE', 'Visiteur'),
('l46', '2003-12-31 23:00:00', 'PL', 'Visiteur'),
('l56', '2001-02-09 23:00:00', 'FC', 'Visiteur'),
('m35', '2007-10-05 22:00:00', 'MP', 'Visiteur'),
('m45', '2016-03-17 13:36:47', 'PA', 'Visiteur'),
('n42', '1996-02-29 23:00:00', 'HN', 'Visiteur'),
('n59', '1994-11-30 23:00:00', 'PI', 'Visiteur'),
('o26', '2006-12-31 23:00:00', 'LG', 'Visiteur'),
('p40', '1992-12-02 23:00:00', 'BN', 'Visiteur'),
('p40', '1999-07-16 22:00:00', 'BN', 'Responsable'),
('p40', '2003-11-30 23:00:00', 'BN', 'Délégué'),
('p41', '2005-07-19 22:00:00', 'PC', 'Visiteur'),
('p42', '1994-11-30 23:00:00', 'PI', 'Visiteur'),
('p49', '2001-09-30 22:00:00', 'CE', 'Visiteur'),
('p6', '2003-02-28 23:00:00', 'LG', 'Visiteur'),
('p8', '2006-05-31 22:00:00', 'BO', 'Visiteur'),
('q17', '2007-08-31 22:00:00', 'BN', 'Visiteur'),
('r24', '0000-00-00 00:00:00', 'BN', 'Responsable'),
('r24', '2004-07-28 22:00:00', 'BN', 'Visiteur'),
('s10', '2011-10-31 23:00:00', 'FC', 'Visiteur'),
('s21', '2008-08-31 22:00:00', 'LI', 'Visiteur'),
('t43', '2005-02-28 23:00:00', 'BO', 'Visiteur'),
('t47', '2009-07-31 22:00:00', 'NP', 'Visiteur'),
('t60', '1991-03-18 23:00:00', 'LG', 'Visiteur');

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

DROP TABLE IF EXISTS `type_praticien`;
CREATE TABLE IF NOT EXISTS `type_praticien` (
  `TYP_CODE` char(2) NOT NULL,
  `TYP_LIBELLE` varchar(25) NOT NULL,
  `TYP_LIEU` varchar(25) NOT NULL,
  PRIMARY KEY (`TYP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_praticien`
--

INSERT INTO `type_praticien` (`TYP_CODE`, `TYP_LIBELLE`, `TYP_LIEU`) VALUES
('MH', 'Médecin hospitalier', 'Hopital ou clinique'),
('MV', 'Médecine de Ville', 'Cabinet'),
('PH', 'Pharmacien hospitalier', 'Hopital ou clinique'),
('PO', 'Pharmacien d\'officine', 'Pharmacie'),
('PS', 'Personnel de santé', 'Centre paramédical');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
CREATE TABLE IF NOT EXISTS `visiteur` (
  `VIS_CODE` char(5) NOT NULL,
  `VIS_PASSE` char(32) DEFAULT NULL,
  `VIS_NOM` varchar(25) DEFAULT NULL,
  `VIS_PRENOM` varchar(30) DEFAULT NULL,
  `VIS_ADRESSE` varchar(50) DEFAULT NULL,
  `VIS_CP` char(5) DEFAULT NULL,
  `VIS_VILLE` varchar(25) DEFAULT NULL,
  `VIS_DATEMB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VIS_LAB` char(2) DEFAULT NULL,
  PRIMARY KEY (`VIS_CODE`),
  KEY `fk_VISLAB` (`VIS_LAB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`VIS_CODE`, `VIS_PASSE`, `VIS_NOM`, `VIS_PRENOM`, `VIS_ADRESSE`, `VIS_CP`, `VIS_VILLE`, `VIS_DATEMB`, `VIS_LAB`) VALUES
('a131', '0e0ac76991751dda5daed9843b831c09', 'Villechalane', 'Louis', '8 cours Lafontaine', '69000', 'LYON', '2023-09-23 16:48:37', 'SW'),
('a155', '882baf28143fb700b388a87ef561a6e5', 'Gosioso', 'Lucas', '61 Avenue de l\'Elephant Rose', '13013', 'Marseille', '2015-09-16 08:19:46', 'GY'),
('a17', '924278e00ade1aac2b7f0e39a8c608ea', 'Andres', 'David', '1 rue Aimon de Chissée', '38000', 'GRENOBLE', '1991-08-25 22:00:00', 'GY'),
('a55', '09b35d77b1c3afa2f3d3beef8366f25f', 'Bedos', 'Christian', '1 rue Bénédictins', '65000', 'TARBES', '1987-07-16 22:00:00', 'GY'),
('a93', '29003b76d525b60dc7bda037ad3d5f4e', 'Tusseau', 'Louis', '22 rue Renou', '86000', 'POITIERS', '1999-01-01 23:00:00', 'SW'),
('b13', '201f14f2ab22f3190df17b5a21951a3b', 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', '1996-03-10 23:00:00', 'GY'),
('b16', '91cb7485e51e5ec7dcf22dd60db0b5a3', 'Bioret', 'Luc', '1 rue Linne', '35000', 'RENNES', '2007-03-20 23:00:00', 'SW'),
('b25', '3129b5407df9a172659d5681b32cdce4', 'Bunisset', 'Denise', '1 rue Lionne', '49100', 'ANGERS', '1994-07-02 22:00:00', 'SW'),
('b34', '5dc911dd2e627fb22d2360d5a712e4e5', 'Cadic', 'Eric', '123 rue Caponière', '41000', 'BLOIS', '1993-12-05 23:00:00', 'SW'),
('b4', '8caaa6ccd377d7d984675d75dc2f0194', 'Charoze', 'Catherine', '100 pl Géants', '33000', 'BORDEAUX', '1997-09-24 22:00:00', 'SW'),
('b59', 'a92109d06702e010d843db84b32b7ea4', 'Cottin', 'Vincent', '36 sq Capucins', '05000', 'GAP', '1995-10-20 22:00:00', 'GY'),
('babs', '788d3ea9d0a1e692b54c51f2d1f2dbe3', 'Babou', 'Houdhaïfa', 'La Soude', '13009', 'Marseille', '2016-04-27 06:51:50', 'BC'),
('c14', 'a30b7af7ad6fd12c7d0335ed0b749cbc', 'Daburon', 'François', '13 promenade des Anglais', '06000', 'NICE', '1989-01-31 23:00:00', 'SW'),
('c3', '662d1f9f74614ff5d15e9b4fa6f3afef', 'Delrieux', 'Philippe', '13 rue Charles Peguy', '10000', 'TROYES', '1992-05-04 22:00:00', 'SW'),
('c54', '5e6dbf80eeabe4414b76dccda28484c5', 'Debelle', 'Michel', '181 rue Caponière', '88000', 'EPINAL', '1991-03-31 22:00:00', 'SW'),
('d51', '8d4da03218a694b86667e748c62711d0', 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', '1997-11-17 23:00:00', 'GY'),
('e22', 'eae78466e4c74eec6339669dbdf55e49', 'Desmarquest', 'Nathalie', '14 rue Fédérico Garcia Lorca', '13005', 'MARSEILLE', '1989-03-23 23:00:00', 'GY'),
('e24', '9754cd85275c1345e91dae5f6902b3d3', 'Desnost', 'Pierre', '16 rue Barral de Montferrat', '13006', 'MARSEILLE', '1993-04-30 22:00:00', 'SW'),
('e39', '11745ad620a4b2e918e1670134d6646d', 'Dudouit', 'Frédéric', '18 quai Xavier Jouvin', '75000', 'PARIS', '2008-04-25 22:00:00', 'GY'),
('e49', 'e633b65405d435ba0980cd7b1fcd2364', 'Duncombe', 'Claude', '19 av Alsace Lorraine', '09000', 'FOIX', '1996-02-18 23:00:00', 'GY'),
('e5', 'b6f5c405b38371ffb649bf83257b891f', 'Enault-Pascreau', 'Céline', '25B rue Stalingrad', '40000', 'MONT DE MARSAN', '1990-11-26 23:00:00', 'GY'),
('e52', '1de5bdb3b1877d42f1cf506197042d72', 'Eynde', 'Valérie', '3 rue Henri Moissan', '76000', 'ROUEN', '1991-10-30 23:00:00', 'GY'),
('f39', '1a7d018035b0e4022ef856131c8fe633', 'Frémont', 'Fernand', '4 rue Jean Giono', '69000', 'LYON', '1997-02-14 23:00:00', 'GY'),
('g30', 'd9815ae0882c2593cf2b79abc0054249', 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', '2000-03-19 23:00:00', 'GY'),
('g53', '28694be41fe17667bb27dabad97b5ab9', 'Gombert', 'Luc', '32 rue Emile Gueymard', '56000', 'VANNES', '1995-10-02 22:00:00', 'GY'),
('g7', '7843a3376c16bb67c154fddd8eb1158b', 'Guindon', 'Caroline', '40 rue Maréchal Montgomery', '87000', 'LIMOGES', '2005-01-14 23:00:00', 'GY'),
('h13', 'c4c61fd0ca02bfab4f031dceecd6b22d', 'Guindon', 'François', '44 rue Picotière', '19000', 'TULLE', '2011-05-07 22:00:00', 'SW'),
('h30', '71f0dc050f6ede4adebc880278277db2', 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', '1999-04-25 22:00:00', 'SW'),
('h35', '9bd259de6b04447d6fadaab731586416', 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURILLAC', '2004-08-19 22:00:00', 'GY'),
('h40', 'a92c5df585c44f560c8776bef2edea4c', 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaurès', '08000', 'SEDAN', '2003-02-28 23:00:00', 'GY'),
('j45', 'd0b3edba3b917a06e637b618a59f1081', 'Labouré-Morel', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', '1998-01-31 23:00:00', 'SW'),
('j50', 'e344682442916c4f5f2fe68017e362b6', 'Landré', 'Philippe', '4 av Gén Laperrine', '59000', 'LILLE', '1992-11-30 23:00:00', 'GY'),
('j8', 'a95a3ce5556e0edd31dc9306d971aabd', 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', '1998-06-17 22:00:00', 'GY'),
('k53', '238c171c8ca8a5f721f2b3c9f5b39481', 'Lemoine', 'Noël', '4 av Beauvert', '68000', 'MULHOUSE', '1983-03-19 23:00:00', 'SW'),
('kevin', '3901066adddaf4c9c6d36a0f2648a7fe', 'Traoret', 'Kevin', 'Konoha', '13', 'Marseille', '2016-04-27 07:33:33', 'BC'),
('l23', '0ac21de9f2d27660f856f174f683128d', 'Leclercq', 'Servane', '11 rue Quinconce', '18000', 'BOURGES', '2006-05-31 22:00:00', 'SW'),
('l46', 'b3f4508a2f13b4f90b151fa742cfd7e7', 'Lecornu', 'Jean-Bernard', '4 bd Maréchal Foch', '72000', 'LA FERTE BERNARD', '2003-12-31 23:00:00', 'GY'),
('l56', '41332885301569cf06e6502e06c80770', 'Lecornu', 'Ludovic', '4 rue Abel Servien', '25000', 'BESANCON', '2001-02-09 23:00:00', 'SW'),
('m35', 'cdd958b6b06153fcdfc2743d69a65bfe', 'Lejard', 'Agnès', '4 rue Anthoard', '82000', 'MONTAUBAN', '1987-09-30 22:00:00', 'SW'),
('m45', '84e693b8786364bdc4f59f271e66cf0a', 'Lesaulnier', 'Pascal', '47 rue Thiers', '13100', 'AIX EN PROVENCE', '1990-09-30 22:00:00', 'SW'),
('n42', 'f397ecd22277886688cb037b898b0b72', 'Letessier', 'Stéphane', '5 chem Capuche', '27000', 'EVREUX', '1996-02-29 23:00:00', 'GY'),
('n59', '5af49c7f32c45175f503c4c84932ea8a', 'Maffezzoli', 'Thibaud', '5 rue Chateaubriand', '02000', 'LAON', '1994-11-30 23:00:00', 'SW'),
('o26', '832418e10f30867fe6a0621985828ceb', 'Mancini', 'Anne', '5 rue D\'Agier', '48000', 'MENDE', '2006-12-31 23:00:00', 'GY'),
('p40', '3ba5263746c13038b235bcc07d4a8d58', 'Michel', 'Jean-Claude', '5 rue Gabriel Péri', '61000', 'FLERS', '1992-12-02 23:00:00', 'SW'),
('p41', 'f6a3b2883751ae24ea665a8a5289d894', 'Montecot', 'François', '6 rue Paul Valéry', '17000', 'SAINTES', '2005-07-19 22:00:00', 'GY'),
('p42', 'de879880cbea027feecd5a65b8e0e782', 'Notini', 'Veronique', '5 rue Lieut Chabal', '60000', 'BEAUVAIS', '1994-11-30 23:00:00', 'SW'),
('p49', 'c88dd90516218942d33f7be6842e6361', 'Onfroy', 'Den', '5 rue Sidonie Jacolin', '37000', 'TOURS', '2001-09-30 22:00:00', 'GY'),
('p6', '228c3e8583a8102725d90d6fb70c09e4', 'Pascreau', 'Charles', '57 bd Maréchal Foch', '11100', 'NARBONNE', '2003-02-28 23:00:00', 'SW'),
('p8', '841c88377acb5fd62ee3ff3a5f23ba8b', 'Perrier', 'Maître', '6 rue Aubert Dubayet', '71000', 'CHALON SUR SAONE', '2006-05-31 22:00:00', 'GY'),
('q17', '58357efc48595686d3b515eb0baa2fec', 'Petit', 'Jean-Louis', '7 rue Ernest Renan', '50000', 'SAINT LO', '2007-08-31 22:00:00', 'GY'),
('r24', 'd4a60d01161a1883cc7c8b4728d3f1ba', 'Piquery', 'Patrick', '9 rue Vaucelles', '14000', 'CAEN', '1984-07-28 22:00:00', 'GY'),
('s10', 'b5d9c778b7aa58cae174494b3d27a402', 'Retailleau', 'Josselin', '88Bis rue Saumuroise', '39000', 'DOLE', '2011-10-31 23:00:00', 'GY'),
('s21', 'db0cfe32177e6129aa1b02710043b8dd', 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', '2008-08-31 22:00:00', 'SW'),
('t322', '649532c3e84a0a1ab8ac5267124ea754', 'TEILLER', 'Guillaume', '550 Avenue Jean DALMAS', '13090', 'Aix en Provence', '2015-10-07 08:28:22', 'BC'),
('t43', 'c2d3826c8ad09a16668d68c7293e8473', 'Souron', 'Maryse', '7B rue Gay Lussac', '21000', 'DIJON', '2005-02-28 23:00:00', 'SW'),
('t47', 'e33a9cf086aea63cfdd552d67f766567', 'Tiphagne', 'Patrick', '7B rue Gay Lussac', '62000', 'ARRAS', '2009-07-31 22:00:00', 'SW'),
('t60', '5ba75b8e264e33574078ff20e6aff4dd', 'Tusseau', 'Josselin', '63 rue Bon Repos', '34000', 'MONTPELLIER', '1991-03-18 23:00:00', 'GY');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_region_visiteur`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_region_visiteur`;
CREATE TABLE IF NOT EXISTS `v_region_visiteur` (
`TRA_VIS` char(5)
,`TRA_REG` char(2)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_region_visiteur`
--
DROP TABLE IF EXISTS `v_region_visiteur`;

DROP VIEW IF EXISTS `v_region_visiteur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`portable-bts-ig` SQL SECURITY DEFINER VIEW `v_region_visiteur`  AS  select `t1`.`TRA_VIS` AS `TRA_VIS`,`t1`.`TRA_REG` AS `TRA_REG` from `travail` `t1` where (`t1`.`TRA_DATAFF` = (select max(`t2`.`TRA_DATAFF`) from `travail` `t2` where (`t2`.`TRA_VIS` = `t1`.`TRA_VIS`))) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `fk_DEPREG` FOREIGN KEY (`DEP_REG`) REFERENCES `region` (`REG_CODE`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `fk_MEDFAM` FOREIGN KEY (`MED_FAMILLE`) REFERENCES `famille` (`FAM_CODE`),
  ADD CONSTRAINT `fk_MEDLAB` FOREIGN KEY (`MED_LABO`) REFERENCES `laboratoire` (`LAB_CODE`);

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `FK_OFFVIS` FOREIGN KEY (`OFF_VIS`) REFERENCES `visiteur` (`VIS_CODE`),
  ADD CONSTRAINT `fk_OFFMED` FOREIGN KEY (`OFF_MED`) REFERENCES `medicament` (`MED_CODE`),
  ADD CONSTRAINT `fk_OFFPRA` FOREIGN KEY (`OFF_PRA`) REFERENCES `praticien` (`PRA_NUM`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `fk_PRATYPE` FOREIGN KEY (`PRA_TYPE`) REFERENCES `type_praticien` (`TYP_CODE`),
  ADD CONSTRAINT `fk_PRAZONE` FOREIGN KEY (`PRA_ZONE`) REFERENCES `region` (`REG_CODE`);

--
-- Contraintes pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD CONSTRAINT `fk_RAPPRA` FOREIGN KEY (`RAP_PRA`) REFERENCES `praticien` (`PRA_NUM`),
  ADD CONSTRAINT `fk_RAPPRATINI` FOREIGN KEY (`RAP_PRATINI`) REFERENCES `praticien` (`PRA_NUM`),
  ADD CONSTRAINT `fk_RAPVIS` FOREIGN KEY (`RAP_VIS`) REFERENCES `visiteur` (`VIS_CODE`);

--
-- Contraintes pour la table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `fk_TRAREG` FOREIGN KEY (`TRA_REG`) REFERENCES `region` (`REG_CODE`),
  ADD CONSTRAINT `fk_TRAVIS` FOREIGN KEY (`TRA_VIS`) REFERENCES `visiteur` (`VIS_CODE`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `fk_VISLAB` FOREIGN KEY (`VIS_LAB`) REFERENCES `laboratoire` (`LAB_CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
