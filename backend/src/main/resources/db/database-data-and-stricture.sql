-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 26, 2024 at 03:07 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zyn`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_permission`
--

CREATE TABLE `action_permission` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action_permission`
--

INSERT INTO `action_permission` (`createdon`, `id`, `updatedon`, `createdby`, `libelle`, `reference`, `updatedby`) VALUES
('2024-05-17 20:53:10.730215', 1, NULL, '', NULL, 'list', ''),
('2024-05-17 20:53:10.755298', 2, NULL, '', NULL, 'create', ''),
('2024-05-17 20:53:10.767206', 3, NULL, '', NULL, 'delete', ''),
('2024-05-17 20:53:10.795214', 4, NULL, '', NULL, 'edit', ''),
('2024-05-17 20:53:10.813219', 5, NULL, '', NULL, 'view', ''),
('2024-05-17 20:53:10.835207', 6, NULL, '', NULL, 'duplicate', '');

-- --------------------------------------------------------

--
-- Table structure for table `action_permission_seq`
--

CREATE TABLE `action_permission_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action_permission_seq`
--

INSERT INTO `action_permission_seq` (`next_val`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `categorie_prof`
--

CREATE TABLE `categorie_prof` (
  `lesson_rate` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_prof`
--

INSERT INTO `categorie_prof` (`lesson_rate`, `createdon`, `id`, `updatedon`, `code`, `createdby`, `level`, `updatedby`) VALUES
('4.00', NULL, 1, NULL, 'c1', NULL, 'Junior', NULL),
('4.50', NULL, 2, NULL, 'c2', NULL, 'Middle', NULL),
('6.00', NULL, 3, NULL, 'c3', NULL, 'Senior', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categorie_prof_seq`
--

CREATE TABLE `categorie_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_prof_seq`
--

INSERT INTO `categorie_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `class_average_bonus`
--

CREATE TABLE `class_average_bonus` (
  `nombre_session` int(11) DEFAULT NULL,
  `prix` decimal(38,2) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_average_bonus_prof`
--

CREATE TABLE `class_average_bonus_prof` (
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_average_bonus_prof_seq`
--

CREATE TABLE `class_average_bonus_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_average_bonus_prof_seq`
--

INSERT INTO `class_average_bonus_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `class_average_bonus_seq`
--

CREATE TABLE `class_average_bonus_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_average_bonus_seq`
--

INSERT INTO `class_average_bonus_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `collaborator`
--

CREATE TABLE `collaborator` (
  `id` bigint(20) NOT NULL,
  `type_collaborator` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_token`
--

CREATE TABLE `confirmation_token` (
  `confirmed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_token_seq`
--

CREATE TABLE `confirmation_token_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `confirmation_token_seq`
--

INSERT INTO `confirmation_token_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `replied` bit(1) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_contact` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `set_from` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_seq`
--

CREATE TABLE `contact_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_seq`
--

INSERT INTO `contact_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `content_type`
--

CREATE TABLE `content_type` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_type`
--

INSERT INTO `content_type` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
('2024-05-21 14:34:54.917506', 1, NULL, 'IMAGE', '', 'Image', ''),
('2024-05-21 14:34:54.964516', 2, NULL, 'MULTI_IMAGE', '', 'Multi-Image', ''),
('2024-05-21 14:34:54.972468', 3, NULL, 'VIDEO', '', 'Video', ''),
('2024-05-21 14:34:54.976472', 4, NULL, 'CONTENT', '', 'Content', ''),
('2024-05-21 16:05:23.350993', 52, NULL, 'QUIZ', '', 'Quiz', '');

-- --------------------------------------------------------

--
-- Table structure for table `content_type_seq`
--

CREATE TABLE `content_type_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_type_seq`
--

INSERT INTO `content_type_seq` (`next_val`) VALUES
(151);

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `nombre_link_en_cours` int(11) DEFAULT NULL,
  `nombre_link_finalise` int(11) DEFAULT NULL,
  `nombre_section_en_cours` int(11) DEFAULT NULL,
  `nombre_section_finalise` int(11) DEFAULT NULL,
  `numero_order` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`nombre_link_en_cours`, `nombre_link_finalise`, `nombre_section_en_cours`, `nombre_section_finalise`, `numero_order`, `createdon`, `id`, `parcours`, `updatedon`, `code`, `createdby`, `description`, `image`, `libelle`, `updatedby`) VALUES
(0, 0, 0, 3, 0, '2024-05-19 19:00:08.749835', 1, 1, NULL, 'C', 'collaborator', 'this is course number one', 'http://localhost:8036/app/images/5zxf8Je0un/5zxf8Je0un.jpg', 'course number one ', ''),
(0, 0, 0, 2, 0, '2024-05-19 19:23:20.328304', 2, 1, NULL, 'C', 'collaborator', NULL, 'http://localhost:8036/app/images/FCDLCm1Dba/FCDLCm1Dba.jpg', 'course number two', ''),
(0, 0, 0, 6, 0, '2024-05-19 19:34:57.037698', 3, 1, '2024-05-29 21:08:40.528438', 'C', 'collaborator', 'Sunt fugiat numquam ', NULL, 'Cumque minus recusan', 'collaborator'),
(0, 0, 0, 0, 0, '2024-05-19 19:38:34.998696', 4, 1, NULL, 'P', 'collaborator', 'desc for hfad ford', NULL, 'Proident minim agord fard bitin', ''),
(0, 0, 0, 0, 0, '2024-05-19 19:41:17.202630', 5, 1, NULL, 'F', 'collaborator', 'did for vvahu fgphl firl valhab gihm', 'http://localhost:8036/app/images/LfJY2xyH1b/LfJY2xyH1b.jpg', 'forid sasdib bid for tha did', ''),
(0, 0, 0, 0, 0, '2024-05-24 15:19:19.815809', 52, 1, NULL, 'C', 'collaborator', 'dsc', NULL, 'course number 10', ''),
(0, 0, 0, 1, 0, '2024-05-29 21:11:10.681956', 102, 102, '2024-05-29 21:11:51.601745', 'U', 'collaborator', 'learn numbers and letters', 'http://localhost:8036/app/images/UsAKkUYh1W/UsAKkUYh1W.jpg', 'Unit one', 'collaborator'),
(0, 0, 0, 2, 0, '2024-06-04 16:18:32.590890', 152, 1, '2024-06-04 16:21:17.929629', 'T', 'collaborator', NULL, 'http://localhost:8036/app/images/P9Sa7iDgxv/P9Sa7iDgxv.jpg', 'test', 'collaborator'),
(0, 0, 0, 1, 0, '2024-06-26 14:35:48.089419', 202, 4, '2024-06-26 14:36:12.462736', 'C', 'collaborator', NULL, NULL, 'course1', 'collaborator');

-- --------------------------------------------------------

--
-- Table structure for table `cours_seq`
--

CREATE TABLE `cours_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cours_seq`
--

INSERT INTO `cours_seq` (`next_val`) VALUES
(301);

-- --------------------------------------------------------

--
-- Table structure for table `dictionary`
--

CREATE TABLE `dictionary` (
  `learned` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dictionary_seq`
--

CREATE TABLE `dictionary_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dictionary_seq`
--

INSERT INTO `dictionary_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

CREATE TABLE `etablissement` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement_seq`
--

CREATE TABLE `etablissement_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etablissement_seq`
--

INSERT INTO `etablissement_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `etat_inscription`
--

CREATE TABLE `etat_inscription` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etat_inscription`
--

INSERT INTO `etat_inscription` (`createdon`, `id`, `updatedon`, `createdby`, `libelle`, `ref`, `updatedby`) VALUES
(NULL, 1, '2024-06-01 17:44:50.152649', NULL, 'Pending', 'E1', 'collaborator'),
(NULL, 2, NULL, NULL, 'Validated', 'E2', NULL),
(NULL, 3, NULL, NULL, 'refused', 'E3', NULL),
(NULL, 4, NULL, NULL, 'PAID', 'E4', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `etat_inscription_seq`
--

CREATE TABLE `etat_inscription_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etat_inscription_seq`
--

INSERT INTO `etat_inscription_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `subscribe` bit(1) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `fonction` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `interet_etudiant` bigint(20) DEFAULT NULL,
  `langue` bigint(20) DEFAULT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `pack_student` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `skill` bigint(20) DEFAULT NULL,
  `statut_social` bigint(20) DEFAULT NULL,
  `teacher_locality` bigint(20) DEFAULT NULL,
  `group_option` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_review`
--

CREATE TABLE `etudiant_review` (
  `review` int(11) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_review` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_review_seq`
--

CREATE TABLE `etudiant_review_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etudiant_review_seq`
--

INSERT INTO `etudiant_review_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exercice`
--

CREATE TABLE `exercice` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `content` longtext,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `content_type` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exercice`
--

INSERT INTO `exercice` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `content`, `description`, `libelle`, `numero`, `content_type`, `quiz`, `section`) VALUES
(2, 'collaborator', '2024-05-22 18:00:24.196037', '', NULL, ';http://localhost:8036/app/images/7INE1zNAz7/7INE1zNAz7.jpg;http://localhost:8036/app/images/8nEW3jgOHN/8nEW3jgOHN.jpg', ';legend for first image;null', 'exerise disc', 2, 2, NULL, 1),
(3, 'collaborator', '2024-05-22 21:35:41.642014', '', NULL, ';http://localhost:8036/app/images/LYTgA3hCNH/LYTgA3hCNH.jpg', ';null', 'lorim ipsul di for thatsgood morning ajiftar formad. forstan ajikak holmod avidal kik fastar mornif difod smark for jik.', 2, 1, NULL, 1),
(4, 'collaborator', '2024-05-22 22:02:35.837226', '', NULL, 'https://www.youtube.com/watch?v=gA4RCQhQeCo', 'some text here,some text here and fo lhshd fwjkef wenfj woedihq qwdgq', 'Video title', 3, 3, NULL, 1),
(5, 'collaborator', '2024-05-22 22:20:22.738599', '', NULL, '<p><u>Lorem ipsum dolor</u> sit amet, consectetur adipiscing elit. Donec lorem turpis, suscipit ac nulla eget, porttitor tincidunt neque. Nam tincidunt, sapien non congue fringilla, mi sapien molestie mi, id egestas tortor turpis finibus augue. Proin interdum interdum sem, sit amet ultricies massa sollicitudin in. Curabitur nec porttitor mauris, sit amet condimentum diam. Phasellus sagittis, velit in aliquam viverra, ipsum mauris blandit lorem, in maximus quam lectus in risus. Ut eget efficitur elit, eget sagittis purus. Nulla at risus nec orci eleifend elementum at at arcu.</p><h2>Nullam in massa quam. Vestibulum vulputate libero eget nisi mollis, vel convallis nisi convallis. Mauris in risus ante. Donec sit amet sollicitudin nibh. Vivamus quis tristique massa. Sed sed orci erat. Aliquam congue ex sed turpis cursus cursus. Vestibulum rhoncus mauris tristique porta accumsan. Aenean mattis dolor leo, ac finibus magna condimentum id. Etiam mattis lorem ut velit vulputate, ut egestas lectus maximus. Maecenas ligula nisl, eleifend sit amet arcu vitae, imperdiet interdum augue. Aenean congue ante sit amet risus consequat, malesuada tincidunt est porta. Nullam eget diam in augue maximus luctus. Sed sed turpis non urna pulvinar condimentum.</h2>', NULL, 'my title for text', 4, 4, NULL, 1),
(52, 'collaborator', '2024-05-23 12:02:28.507822', '', NULL, '<ul><ul><li><b>Lorem ipsum</b><span> dolor sit amet consectetur adipiscing elit ligula morbi ultricies, in tristique nec congue sociosqu laoreet sodales lobortis quam nisl, class consequat leo praesent ante massa ac feugiat aptent. Dapibus scelerisque egestas neque porta dui ridiculus, nunc cursus morbi luctus proin viverra, nisl lectus vehicula aptent nibh. Orci cursus odio quam dictumst donec faucibus magnis etiam aliquam luctus, nascetur vivamus ridiculus ullamcorper elementum auctor fringilla vel scelerisque potenti libero, nisl integer montes vestibulum pellentesque pretium mus porta natoque. Lacus natoque ac faucibus tempus orci porttitor id cum molestie donec vulputate accumsan, quisque phasellus lobortis rutrum fringilla hac ultrices eget ante dui volutpat congue aliquet, mi sollicitudin rhoncus tortor mauris eu malesuada fermentum nibh vehicula suscipit. Cras integer aptent dapibus habitant risus duis facilisi, feugiat tristique fringilla ridiculus placerat nostra, primis convallis vehicula netus&#160;</span></li><li>&#160;1- faucibus arcu. Malesuada proin vestibulum convallis</li><li>&#160;2- nunc pulvinar mattis parturient rhoncus, accumsan</li><li>&#160;3- nisl non tincidunt tristique curabitur mi, penatibus&#160;</li><li>&#160;4- integer aliquam himenaeos at dis cubilia. Suspendisse</li><li>&#160;5- ridiculus tortor aptent magna diam risus duis</li><li>&#160;6- himenaeos natoque nec, semper blandit vel&#160;</li><li>&#160;7- ante platea vitae varius feugiat cum, suscipit egestas tincidunt neque tempus ad nibh quam cras.</li></ul></ul>', NULL, 'Lorem ipsum', NULL, 4, NULL, 2),
(53, 'collaborator', '2024-05-24 15:21:26.510493', '', NULL, ';http://localhost:8036/app/images/nBY4cPuxKB/nBY4cPuxKB.jpg;http://localhost:8036/app/images/Qk0J6Kfoe1/Qk0J6Kfoe1.jpg;http://localhost:8036/app/images/zBxUYV8X2U/zBxUYV8X2U.jpg', ';Quisque eu morbi nam nisi, vivamus elementum mattis.;null;null', 'Lorem ipsum dolor', NULL, 1, NULL, 52),
(54, 'collaborator', '2024-05-24 15:24:32.317583', '', NULL, 'https://www.youtube.com/watch?v=TtjUM2AKyf8', NULL, 'Lorem ipsum dolor', 2, 3, NULL, 52),
(55, 'collaborator', '2024-05-24 15:26:08.139455', '', NULL, '<span><b>Lorem ipsum</b> dolor sit amet consectetur adipiscing elit erat, mus malesuada vulputate convallis euismod consequat morbi fermentum laoreet, ac nostra dui in natoque feugiat sodales. Duis volutpat curabitur pulvinar nostra nam accumsan placerat urna venenatis id eros, aenean enim felis et eget dapibus laoreet vehicula mauris nisi, pharetra in habitasse rhoncus imperdiet quis nullam odio aliquam turpis. Curabitur rhoncus volutpat congue inceptos at turpis conubia mus habitant nec, taciti montes mollis velit et tellus quam est egestas. Sociis faucibus sociosqu ridiculus mattis tempor interdum mus erat, nullam elementum dictumst hendrerit venenatis facilisis class consequat pretium, natoque ut urna mi porta cursus quam. Erat mi pretium accumsan porta euismod ante leo interdum mus, a consequat aenean elementum venenatis cursus malesuada eu. Magnis parturient massa sem risus scelerisque rhoncus hac, mauris pellentesque feugiat integer per nam iaculis ridiculus, gravida curae ultrices arcu fermentum class. Metus cras maecenas ut sollicitudin vulputate cursus dictumst per vitae, aenean id dis pulvinar ad nostra hendrerit felis.</span>', NULL, 'Lorem ipsum dolor', 3, 4, NULL, 52),
(102, 'collaborator', '2024-05-27 23:53:11.168588', 'collaborator', '2024-05-29 12:08:41.473359', NULL, NULL, NULL, 1, 52, 1, 102),
(204, 'collaborator', '2024-05-28 00:29:40.593331', 'collaborator', '2024-05-28 15:13:50.433977', ';http://localhost:8036/app/images/Fz7ewrhbBY/Fz7ewrhbBY.jpg;http://localhost:8036/app/images/A6Ka6PwMYi/A6Ka6PwMYi.jpg', ';null;tilist donzar', 'Lorem Ipsul dvd', 2, 1, NULL, 102),
(252, 'collaborator', '2024-05-28 01:10:38.972104', 'collaborator', '2024-05-29 12:09:04.967764', '<span>Lorem ipsum dolor sit amet consectetur adipiscing elit, porttitor non fermentum litora cum ante, molestie vulputate nullam tortor est dignissim. Dignissim duis ad nibh rhoncus mauris augue sapien ullamcorper mi quis, arcu maecenas per pretium id accumsan urna himenaeos nam. Malesuada semper purus nulla posuere magna laoreet auctor egestas donec scelerisque mi, commodo eleifend in senectus non et turpis tellus leo. Vel lacus felis ultrices libero parturient, proin lectus arcu platea ullamcorper ornare, pharetra viverra metus porta. Per fringilla lobortis morbi orci nisi non varius urna, praesent nulla aenean ligula quam mus magna. Curae dictum luctus integer proin quam tempor velit pulvinar turpis, class imperdiet faucibus ligula ut eget nisi accumsan feugiat,</span><div><ol><li><span>&#160;etiam senectus aenean neque nunc penatibus fames leo.</span></li></ol></div>', NULL, 'Lorem ipsum ', 3, 4, NULL, 102),
(253, 'collaborator', '2024-05-28 01:11:54.263869', 'collaborator', '2024-05-28 14:33:50.026613', 'https://www.youtube.com/watch?v=JeaX4SaJcJE', 'Nostra congue lectus consequat per massa, praesent nunc augue.', 'video title', 4, 3, NULL, 102),
(254, 'collaborator', '2024-05-28 10:29:30.883769', 'collaborator', '2024-05-28 15:14:28.399473', '<span>Lorem ipsum dolor sit amet consectetur adipiscing, elit conubia aliquet nec torquent vivamus est, vulputate curae metus enim malesuada. Felis luctus molestie libero sagittis massa fringilla nascetur orci, commodo sapien ultricies diam natoque tellus elementum, potenti nibh nunc placerat praesent fermentum habitant. Urna magnis pulvinar aenean eget consequat proin, facilisi potenti ornare turpis molestie interdum laoreet, sapien ligula velit integer morbi. Odio cursus felis lobortis magna erat suscipit in pellentesque venenatis lectus posuere sagittis aliquam, fusce arcu nisl convallis id porttitor enim blandit habitasse a aenean tortor. Neque ullamcorper justo proin posuere dui est duis, class vulputate aliquam natoque aenean molestie, turpis sapien elementum curabitur ultrices curae. Quis parturient proin aliquam nam quisque, eleifend vivamus posuere sociis vestibulum eu, ullamcorper mattis purus tortor. Tincidunt turpis nisi lectus tellus faucibus tristique suscipit duis ligula aliquam metus:</span><div><ul><li><span>&#160;posuere commodo gravida morbi nisl interdum lacinia condimentum auctor aliquet.</span></li></ul></div>', NULL, 'Read and add new words', 1, 4, NULL, 152),
(352, 'collaborator', '2024-05-28 10:51:04.998447', 'collaborator', '2024-05-29 12:30:27.252612', NULL, NULL, NULL, 2, 52, 2, 152),
(402, 'collaborator', '2024-05-28 11:06:33.285041', '', NULL, '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, magna porta eleifend aliquam conubia scelerisque ornare, in magnis donec curae orci felis. Cursus aliquam ad convallis platea urna mauris erat, mi blandit gravida cras phasellus iaculis integer, penatibus ornare quisque pharetra laoreet etiam.</p><p>Potenti nunc cursus magnis gravida tincidunt non aenean, condimentum quis diam etiam suspendisse eget urna, fringilla massa malesuada purus nisi laoreet. Nibh eu venenatis class magna et molestie natoque mi ullamcorper aenean, turpis conubia platea himenaeos fringilla nullam tempus vel integer risus, augue porttitor a porta metus rhoncus feugiat ornare aliquam. Sapien est eu dapibus integer mollis cursus et egestas dui, suspendisse sociis cum turpis habitant gravida fringilla sodales faucibus, iaculis torquent ad vitae elementum volutpat porttitor dis. Eget habitasse viverra ante dignissim purus a commodo, ultrices litora bibendum hac diam dui sociosqu, sed est potenti gravida condimentum velit. Mattis primis maecenas scelerisque hendrerit felis praesent pharetra suspendisse, hac orci eget nostra proin euismod. Feugiat natoque commodo lectus interdum semper metus, odio primis lacinia augue venenatis non dapibus, posuere ultricies tempus iaculis etiam. Pharetra eleifend in morbi ornare elementum condimentum, class aliquet dictumst est posuere, magna volutpat integer litora facilisi.</p>', NULL, NULL, 3, 4, NULL, 152),
(403, 'collaborator', '2024-05-28 11:08:14.572023', '', NULL, NULL, NULL, NULL, 4, 52, 52, 152),
(452, 'collaborator', '2024-05-28 12:04:17.807718', '', NULL, 'https://www.youtube.com/watch?v=yNk1UgFeX0o', 'Describe what you see in video', 'Watch and describe what you see', 1, 3, NULL, 153),
(453, 'collaborator', '2024-05-28 12:05:41.676681', '', NULL, NULL, NULL, NULL, 2, 52, 102, 153),
(502, 'collaborator', '2024-05-28 15:32:48.905545', 'collaborator', '2024-05-29 12:09:29.138767', ';http://localhost:8036/app/images/Oq6nvtyhv0/Oq6nvtyhv0.jpg;http://localhost:8036/app/images/t9y4IsQ5pw/t9y4IsQ5pw.jpg', ';null;Football', 'title', 5, 1, NULL, 102),
(652, 'collaborator', '2024-05-28 21:48:18.097353', '', NULL, NULL, NULL, NULL, 1, 52, 252, 154),
(702, 'collaborator', '2024-06-04 16:19:30.908833', '', NULL, ';http://localhost:8036/app/images/nfivDbr4Oz/nfivDbr4Oz.jpg', ';english', 'title 1', 1, 1, NULL, 302),
(703, 'collaborator', '2024-06-04 16:20:01.590829', 'collaborator', '2024-06-04 16:20:18.299487', '<span>Lorem ipsum dolor sit amet consectetur adipiscing, elit nibh litora curae leo vel morbi, venenatis diam nostra tempor ultrices. Suspendisse magna ut rhoncus eget gravida velit <b>tincidunt </b>sociosqu, volutpat faucibus per vehicula vitae morbi. Auctor dapibus dignissim cum vivamus magna cubilia vitae posuere, pellentesque a taciti ultrices in arcu diam accumsan, nec parturient primis ullamcorper mus nisl volutpat. Sociis tincidunt in curabitur lectus viverra nulla class cras sapien habitant, cum ullamcorper eleifend lobortis imperdiet iaculis ligula potenti gravida, taciti habitasse aliquet nisi condimentum dui eros semper scelerisque. Magna primis volutpat nascetur elementum lacus fusce neque, lacinia id facilisis libero natoque erat sed,&#160;</span><div><span>venenatis consequat dapibus ornare ante justo.</span></div>', NULL, 'textdc', 2, 4, NULL, 302),
(704, 'collaborator', '2024-06-04 16:21:00.453792', '', NULL, NULL, NULL, NULL, 3, 52, 302, 302),
(752, 'collaborator', '2024-06-26 14:37:06.418787', '', NULL, ';http://localhost:8036/app/images/yyq83uhOC1/yyq83uhOC1.jpg;http://localhost:8036/app/images/TQIiAfx7Db/TQIiAfx7Db.jpg', ';Mollit nisi ullamco ;null', 'Magni dolore rem quo', 1, 1, NULL, 352);

-- --------------------------------------------------------

--
-- Table structure for table `exercice_seq`
--

CREATE TABLE `exercice_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exercice_seq`
--

INSERT INTO `exercice_seq` (`next_val`) VALUES
(851);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `createdon` datetime(6) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faq_etudiant`
--

CREATE TABLE `faq_etudiant` (
  `createdon` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faq_etudiant_seq`
--

CREATE TABLE `faq_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_etudiant_seq`
--

INSERT INTO `faq_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `faq_prof`
--

CREATE TABLE `faq_prof` (
  `createdon` datetime(6) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faq_prof_seq`
--

CREATE TABLE `faq_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_prof_seq`
--

INSERT INTO `faq_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `faq_seq`
--

CREATE TABLE `faq_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_seq`
--

INSERT INTO `faq_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `faq_type`
--

CREATE TABLE `faq_type` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `destinataire` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_type`
--

INSERT INTO `faq_type` (`createdon`, `id`, `updatedon`, `createdby`, `destinataire`, `libelle`, `updatedby`) VALUES
(NULL, 1, NULL, NULL, 'teacher', 'DE Class Support', NULL),
(NULL, 2, NULL, NULL, 'teacher', 'Teachers effectiveness', NULL),
(NULL, 3, NULL, NULL, 'teacher', 'Methodological care', NULL),
(NULL, 1485, NULL, NULL, 'teacher', 'Common questions', NULL),
(NULL, 1486, NULL, NULL, 'teacher', 'Salary', NULL),
(NULL, 1487, NULL, NULL, 'student', 'Exams', NULL),
(NULL, 1488, NULL, NULL, 'student', 'Diplome', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq_type_seq`
--

CREATE TABLE `faq_type_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_type_seq`
--

INSERT INTO `faq_type_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `fonction`
--

CREATE TABLE `fonction` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fonction_seq`
--

CREATE TABLE `fonction_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fonction_seq`
--

INSERT INTO `fonction_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial`
--

CREATE TABLE `free_trial` (
  `email_teacher_sent` bit(1) DEFAULT NULL,
  `nombre_student_abonne` int(11) DEFAULT NULL,
  `nombre_student_present` int(11) DEFAULT NULL,
  `nombre_student_total` int(11) DEFAULT NULL,
  `whats_teacher_sent` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_free_trial` datetime(6) DEFAULT NULL,
  `date_free_trial_premier_deuxieme_rappel` datetime(6) DEFAULT NULL,
  `date_free_trial_premier_rappel` datetime(6) DEFAULT NULL,
  `email_teacher_sending_date` datetime(6) DEFAULT NULL,
  `free_trial_configuration` bigint(20) DEFAULT NULL,
  `free_trial_student_email_template` bigint(20) DEFAULT NULL,
  `free_trial_student_whats_template` bigint(20) DEFAULT NULL,
  `free_trial_teacher_email_template` bigint(20) DEFAULT NULL,
  `free_trial_teacher_whats_template` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `statut_free_trial` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `whats_teacher_sending_date` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trialformule`
--

CREATE TABLE `free_trialformule` (
  `status` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_confirmation` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `inscription` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `dayspeerweek` varchar(255) DEFAULT NULL,
  `teacher_age_range` varchar(255) DEFAULT NULL,
  `teacher_genderoption` varchar(255) DEFAULT NULL,
  `teacher_personnality` varchar(255) DEFAULT NULL,
  `timeperday` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trialformule_seq`
--

CREATE TABLE `free_trialformule_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trialformule_seq`
--

INSERT INTO `free_trialformule_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_configuration`
--

CREATE TABLE `free_trial_configuration` (
  `nombre_student_max` int(11) DEFAULT NULL,
  `nombre_student_min` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_application_debut` datetime(6) DEFAULT NULL,
  `date_application_fin` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_configuration_seq`
--

CREATE TABLE `free_trial_configuration_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_configuration_seq`
--

INSERT INTO `free_trial_configuration_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_detail`
--

CREATE TABLE `free_trial_detail` (
  `abonne` bit(1) DEFAULT NULL,
  `email_message_sent` bit(1) DEFAULT NULL,
  `presence` bit(1) DEFAULT NULL,
  `whats_up_message_sent` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_envoi_email_message` datetime(6) DEFAULT NULL,
  `date_envoiwhats_up_message` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `free_trial` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_detail_seq`
--

CREATE TABLE `free_trial_detail_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_detail_seq`
--

INSERT INTO `free_trial_detail_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_seq`
--

CREATE TABLE `free_trial_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_seq`
--

INSERT INTO `free_trial_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_student_email_template`
--

CREATE TABLE `free_trial_student_email_template` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_student_email_template_seq`
--

CREATE TABLE `free_trial_student_email_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_student_email_template_seq`
--

INSERT INTO `free_trial_student_email_template_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_student_whats_template`
--

CREATE TABLE `free_trial_student_whats_template` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_student_whats_template_seq`
--

CREATE TABLE `free_trial_student_whats_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_student_whats_template_seq`
--

INSERT INTO `free_trial_student_whats_template_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_teacher_email_template`
--

CREATE TABLE `free_trial_teacher_email_template` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_teacher_email_template_seq`
--

CREATE TABLE `free_trial_teacher_email_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_teacher_email_template_seq`
--

INSERT INTO `free_trial_teacher_email_template_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_teacher_whats_template`
--

CREATE TABLE `free_trial_teacher_whats_template` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `free_trial_teacher_whats_template_seq`
--

CREATE TABLE `free_trial_teacher_whats_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `free_trial_teacher_whats_template_seq`
--

INSERT INTO `free_trial_teacher_whats_template_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etat`
--

CREATE TABLE `groupe_etat` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etat_seq`
--

CREATE TABLE `groupe_etat_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etat_seq`
--

INSERT INTO `groupe_etat_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etude`
--

CREATE TABLE `groupe_etude` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `nombre_etudiant` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etude`
--

INSERT INTO `groupe_etude` (`createdon`, `id`, `nombre_etudiant`, `updatedon`, `createdby`, `description`, `libelle`, `updatedby`) VALUES
(NULL, 25905, 1, '2024-06-10 15:29:24.841264', NULL, 'Group for 1 person(Individual)', 'Group for 1 person', 'collaborator'),
(NULL, 40491, 30, NULL, NULL, 'Group for 30 person', 'Group for 30 person', NULL),
(NULL, 41253, 10, NULL, NULL, 'Group for 10 person', 'Group for 10 person', NULL),
(NULL, 42307, 100, NULL, NULL, 'Webinar', 'Group for 100 person', NULL),
(NULL, 43263, 100, NULL, NULL, 'Elementary Free Trial', 'Elementary Free Trial', NULL),
(NULL, 43264, 100, NULL, NULL, 'Intermediate Free Trial', 'Intermediate Free Trial', NULL),
(NULL, 43667, 100, NULL, NULL, 'Group for 100 Naji + Inter', 'Group for 100 Naji + Inter', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etude_seq`
--

CREATE TABLE `groupe_etude_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etude_seq`
--

INSERT INTO `groupe_etude_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etudiant`
--

CREATE TABLE `groupe_etudiant` (
  `createdon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `groupe_etat` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `groupe_type` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `nombre_place` bigint(20) DEFAULT NULL,
  `nombre_place_non_vide` bigint(20) DEFAULT NULL,
  `nombre_placevide` bigint(20) DEFAULT NULL,
  `nre_courses` bigint(20) DEFAULT NULL,
  `nre_courses_coming` bigint(20) DEFAULT NULL,
  `nre_courses_completed` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etudiant_detail`
--

CREATE TABLE `groupe_etudiant_detail` (
  `createdon` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etudiant_detail_seq`
--

CREATE TABLE `groupe_etudiant_detail_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etudiant_detail_seq`
--

INSERT INTO `groupe_etudiant_detail_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etudiant_seq`
--

CREATE TABLE `groupe_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etudiant_seq`
--

INSERT INTO `groupe_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_type`
--

CREATE TABLE `groupe_type` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_type_seq`
--

CREATE TABLE `groupe_type_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_type_seq`
--

INSERT INTO `groupe_type_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `home_work`
--

CREATE TABLE `home_work` (
  `cours` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `type_home_work` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `url_image` varchar(255) DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `home_work_etudiant`
--

CREATE TABLE `home_work_etudiant` (
  `note` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_home_work` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `resultat` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `home_work_etudiant_seq`
--

CREATE TABLE `home_work_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_work_etudiant_seq`
--

INSERT INTO `home_work_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `home_work_question`
--

CREATE TABLE `home_work_question` (
  `numero` int(11) DEFAULT NULL,
  `point_reponse_juste` decimal(38,2) DEFAULT NULL,
  `point_reponsefausse` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `type_de_question` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `home_work_question_seq`
--

CREATE TABLE `home_work_question_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_work_question_seq`
--

INSERT INTO `home_work_question_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `home_work_seq`
--

CREATE TABLE `home_work_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_work_seq`
--

INSERT INTO `home_work_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `howe_work_q_s_t_reponse`
--

CREATE TABLE `howe_work_q_s_t_reponse` (
  `numero` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `home_work_question` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `etat_reponse` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `howe_work_q_s_t_reponse_seq`
--

CREATE TABLE `howe_work_q_s_t_reponse_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `howe_work_q_s_t_reponse_seq`
--

INSERT INTO `howe_work_q_s_t_reponse_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `note_quiz_niveau` decimal(38,2) DEFAULT NULL,
  `numero_inscription` int(11) DEFAULT NULL,
  `quiz_finished` bit(1) DEFAULT NULL,
  `subscription_finished` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `datedebutinscription` varchar(255) DEFAULT NULL,
  `datefininscription` varchar(255) DEFAULT NULL,
  `etat_inscription` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `fonction` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `groupe_type` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `interet_etudiant` bigint(20) DEFAULT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `pack_student` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `skill` bigint(20) DEFAULT NULL,
  `statut_social` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `date_registration` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`note_quiz_niveau`, `numero_inscription`, `quiz_finished`, `subscription_finished`, `createdon`, `datedebutinscription`, `datefininscription`, `etat_inscription`, `etudiant`, `fonction`, `groupe_etude`, `groupe_type`, `id`, `interet_etudiant`, `niveau_etude`, `pack_student`, `parcours`, `quiz`, `skill`, `statut_social`, `updatedon`, `createdby`, `date_registration`, `skype`, `updatedby`) VALUES
('0.00', 1, b'0', b'0', '2024-06-01 17:44:50.050020', '2024-06-01 17:44:46.338236', NULL, 1, 6, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 13:13:44.893419', '2024-06-10 13:13:44.888430', NULL, 1, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 13:16:59.616847', '2024-06-10 13:16:59.611847', NULL, 1, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 13:21:30.044264', '2024-06-10 13:21:30.034262', NULL, 1, 4, NULL, NULL, NULL, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 13:30:14.337624', '2024-06-10 13:30:14.330616', NULL, 1, 52, NULL, NULL, NULL, 152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 13:35:50.685195', '2024-06-10 13:35:50.677194', NULL, 1, 102, NULL, NULL, NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 15:50:31.531941', '06/10/2024 17:50', NULL, 1, 152, NULL, NULL, NULL, 252, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 15:59:17.092064', '06/10/2024 17:59', NULL, 1, 202, NULL, NULL, NULL, 302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 16:07:36.772963', '06/10/2024 18:07', NULL, 1, 203, NULL, NULL, NULL, 303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 16:09:16.813305', '06/10/2024 18:09', NULL, 1, 204, NULL, NULL, NULL, 304, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-10 16:14:31.764952', '06/10/2024 18:14', NULL, 1, 252, NULL, NULL, NULL, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-13 14:01:47.257341', '06/13/2024 16:01', NULL, 1, 302, NULL, NULL, NULL, 402, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `inscription_seq`
--

CREATE TABLE `inscription_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscription_seq`
--

INSERT INTO `inscription_seq` (`next_val`) VALUES
(501);

-- --------------------------------------------------------

--
-- Table structure for table `interet_etudiant`
--

CREATE TABLE `interet_etudiant` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interet_etudiant`
--

INSERT INTO `interet_etudiant` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
(NULL, 1, NULL, '1', NULL, 'Business', NULL),
(NULL, 2, NULL, '2', NULL, 'Study', NULL),
(NULL, 3, NULL, '3', NULL, 'Self cultivation', NULL),
(NULL, 4, '2024-06-10 15:29:24.841264', '4', NULL, 'Career', 'collaborator'),
(NULL, 5, '2024-06-10 16:15:35.082889', '5', NULL, 'Travel', 'collaborator'),
(NULL, 6, NULL, '6', NULL, 'Other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interet_etudiant_seq`
--

CREATE TABLE `interet_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interet_etudiant_seq`
--

INSERT INTO `interet_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `invite_student`
--

CREATE TABLE `invite_student` (
  `is_accepted` bit(1) DEFAULT NULL,
  `is_paid_pack` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_accept_invitation` datetime(6) DEFAULT NULL,
  `date_pay_pack` datetime(6) DEFAULT NULL,
  `date_sent_invitation` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `email_invited` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invite_student_seq`
--

CREATE TABLE `invite_student_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invite_student_seq`
--

INSERT INTO `invite_student_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `langue`
--

CREATE TABLE `langue` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`createdon`, `id`, `updatedon`, `createdby`, `libelle`, `ref`, `updatedby`) VALUES
(NULL, 1, '2024-06-10 15:29:24.839647', NULL, 'Arabic', 'ar', 'collaborator'),
(NULL, 2, '2024-06-24 14:48:45.385102', NULL, 'Russian', 'ru', 'collaborator'),
(NULL, 3, NULL, NULL, 'French', 'fr', NULL),
(NULL, 4, '2024-06-24 13:29:04.222646', NULL, 'English', 'en', 'collaborator'),
(NULL, 5, NULL, NULL, 'Chinese', 'cn', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `langue_seq`
--

CREATE TABLE `langue_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langue_seq`
--

INSERT INTO `langue_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `level_test_configuration`
--

CREATE TABLE `level_test_configuration` (
  `note_max` decimal(38,2) DEFAULT NULL,
  `note_min` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `level_test_configuration`
--

INSERT INTO `level_test_configuration` (`note_max`, `note_min`, `createdon`, `id`, `parcours`, `updatedon`, `createdby`, `updatedby`) VALUES
('9.00', '0.00', NULL, 1, 1, NULL, NULL, NULL),
('19.00', '10.00', NULL, 2, 5095, NULL, NULL, NULL),
('25.00', '20.00', NULL, 3, 13000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level_test_configuration_seq`
--

CREATE TABLE `level_test_configuration_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `level_test_configuration_seq`
--

INSERT INTO `level_test_configuration_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `model_permission`
--

CREATE TABLE `model_permission` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_permission`
--

INSERT INTO `model_permission` (`createdon`, `id`, `updatedon`, `createdby`, `libelle`, `reference`, `updatedby`) VALUES
('2024-05-17 20:53:08.940703', 1, NULL, '', NULL, 'ContentType', ''),
('2024-05-17 20:53:09.098582', 2, NULL, '', NULL, 'Etudiant', ''),
('2024-05-17 20:53:09.120815', 3, NULL, '', NULL, 'Paiement', ''),
('2024-05-17 20:53:09.146586', 4, NULL, '', NULL, 'StatutSocial', ''),
('2024-05-17 20:53:09.169763', 5, NULL, '', NULL, 'HomeWorkEtudiant', ''),
('2024-05-17 20:53:09.192583', 6, NULL, '', NULL, 'Quiz', ''),
('2024-05-17 20:53:09.212768', 7, NULL, '', NULL, 'Reponse', ''),
('2024-05-17 20:53:09.233585', 8, NULL, '', NULL, 'ProfReview', ''),
('2024-05-17 20:53:09.252573', 9, NULL, '', NULL, 'News', ''),
('2024-05-17 20:53:09.271587', 10, NULL, '', NULL, 'Skill', ''),
('2024-05-17 20:53:09.291594', 11, NULL, '', NULL, 'InteretEtudiant', ''),
('2024-05-17 20:53:09.313587', 12, NULL, '', NULL, 'Langue', ''),
('2024-05-17 20:53:09.333589', 13, NULL, '', NULL, 'WorkloadBonusProf', ''),
('2024-05-17 20:53:09.355579', 14, NULL, '', NULL, 'PackStudent', ''),
('2024-05-17 20:53:09.378579', 15, NULL, '', NULL, 'SectionItem', ''),
('2024-05-17 20:53:09.411594', 16, NULL, '', NULL, 'EtatInscription', ''),
('2024-05-17 20:53:09.436588', 17, NULL, '', NULL, 'ScheduleProf', ''),
('2024-05-17 20:53:09.457601', 18, NULL, '', NULL, 'Exercice', ''),
('2024-05-17 20:53:09.476741', 19, NULL, '', NULL, 'FreeTrialConfiguration', ''),
('2024-05-17 20:53:09.495765', 20, NULL, '', NULL, 'FreeTrialformule', ''),
('2024-05-17 20:53:09.515572', 21, NULL, '', NULL, 'FaqEtudiant', ''),
('2024-05-17 20:53:09.536786', 22, NULL, '', NULL, 'Prof', ''),
('2024-05-17 20:53:09.558751', 23, NULL, '', NULL, 'FreeTrial', ''),
('2024-05-17 20:53:09.579584', 24, NULL, '', NULL, 'InviteStudent', ''),
('2024-05-17 20:53:09.598689', 25, NULL, '', NULL, 'Parcours', ''),
('2024-05-17 20:53:09.618571', 26, NULL, '', NULL, 'Dictionary', ''),
('2024-05-17 20:53:09.641577', 27, NULL, '', NULL, 'ClassAverageBonus', ''),
('2024-05-17 20:53:09.660779', 28, NULL, '', NULL, 'FreeTrialTeacherWhatsTemplate', ''),
('2024-05-17 20:53:09.678813', 29, NULL, '', NULL, 'StatutFreeTrial', ''),
('2024-05-17 20:53:09.696822', 30, NULL, '', NULL, 'TypeCollaborator', ''),
('2024-05-17 20:53:09.714587', 31, NULL, '', NULL, 'WorkloadBonus', ''),
('2024-05-17 20:53:09.735586', 32, NULL, '', NULL, 'TeacherLocality', ''),
('2024-05-17 20:53:09.758588', 33, NULL, '', NULL, 'Services', ''),
('2024-05-17 20:53:09.779576', 34, NULL, '', NULL, 'HomeWorkQuestion', ''),
('2024-05-17 20:53:09.800576', 35, NULL, '', NULL, 'Salary', ''),
('2024-05-17 20:53:09.819589', 36, NULL, '', NULL, 'TypeReclamationEtudiant', ''),
('2024-05-17 20:53:09.840569', 37, NULL, '', NULL, 'GroupeEtat', ''),
('2024-05-17 20:53:09.862189', 38, NULL, '', NULL, 'ReponseEtudiant', ''),
('2024-05-17 20:53:09.880589', 39, NULL, '', NULL, 'SessionCoursSection', ''),
('2024-05-17 20:53:09.899585', 40, NULL, '', NULL, 'HoweWorkQSTReponse', ''),
('2024-05-17 20:53:09.921584', 41, NULL, '', NULL, 'GroupeEtudiantDetail', ''),
('2024-05-17 20:53:09.941572', 42, NULL, '', NULL, 'Section', ''),
('2024-05-17 20:53:09.962593', 43, NULL, '', NULL, 'EtudiantReview', ''),
('2024-05-17 20:53:09.987785', 44, NULL, '', NULL, 'Question', ''),
('2024-05-17 20:53:10.008574', 45, NULL, '', NULL, 'CategorieProf', ''),
('2024-05-17 20:53:10.027574', 46, NULL, '', NULL, 'RecommendTeacher', ''),
('2024-05-17 20:53:10.046059', 47, NULL, '', NULL, 'Inscription', ''),
('2024-05-17 20:53:10.064577', 48, NULL, '', NULL, 'FaqType', ''),
('2024-05-17 20:53:10.082576', 49, NULL, '', NULL, 'Fonction', ''),
('2024-05-17 20:53:10.100577', 50, NULL, '', NULL, 'NiveauEtude', ''),
('2024-05-17 20:53:10.117572', 51, NULL, '', NULL, 'TypeHomeWork', ''),
('2024-05-17 20:53:10.136639', 52, NULL, '', NULL, 'Vocabulary', ''),
('2024-05-17 20:53:10.157588', 53, NULL, '', NULL, 'ReclamationProf', ''),
('2024-05-17 20:53:10.176807', 54, NULL, '', NULL, 'ReponseEtudiantHomeWork', ''),
('2024-05-17 20:53:10.196897', 55, NULL, '', NULL, 'FreeTrialDetail', ''),
('2024-05-17 20:53:10.216588', 56, NULL, '', NULL, 'QuizEtudiant', ''),
('2024-05-17 20:53:10.235569', 57, NULL, '', NULL, 'GroupeType', ''),
('2024-05-17 20:53:10.256568', 58, NULL, '', NULL, 'FreeTrialTeacherEmailTemplate', ''),
('2024-05-17 20:53:10.276585', 59, NULL, '', NULL, 'Cours', ''),
('2024-05-17 20:53:10.295926', 60, NULL, '', NULL, 'SessionCours', ''),
('2024-05-17 20:53:10.313589', 61, NULL, '', NULL, 'LevelTestConfiguration', ''),
('2024-05-17 20:53:10.333591', 62, NULL, '', NULL, 'Price', ''),
('2024-05-17 20:53:10.352851', 63, NULL, '', NULL, 'FaqProf', ''),
('2024-05-17 20:53:10.379570', 64, NULL, '', NULL, 'Collaborator', ''),
('2024-05-17 20:53:10.406241', 65, NULL, '', NULL, 'ClassAverageBonusProf', ''),
('2024-05-17 20:53:10.424574', 66, NULL, '', NULL, 'FreeTrialStudentWhatsTemplate', ''),
('2024-05-17 20:53:10.444772', 67, NULL, '', NULL, 'HomeWork', ''),
('2024-05-17 20:53:10.465570', 68, NULL, '', NULL, 'ReclamationEtudiant', ''),
('2024-05-17 20:53:10.483394', 69, NULL, '', NULL, 'ConfirmationToken', ''),
('2024-05-17 20:53:10.502232', 70, NULL, '', NULL, 'TypeTeacher', ''),
('2024-05-17 20:53:10.521212', 71, NULL, '', NULL, 'TrancheHoraireProf', ''),
('2024-05-17 20:53:10.540223', 72, NULL, '', NULL, 'FreeTrialStudentEmailTemplate', ''),
('2024-05-17 20:53:10.560466', 73, NULL, '', NULL, 'GroupeEtude', ''),
('2024-05-17 20:53:10.579367', 74, NULL, '', NULL, 'TypeDeQuestion', ''),
('2024-05-17 20:53:10.597216', 75, NULL, '', NULL, 'Faq', ''),
('2024-05-17 20:53:10.616211', 76, NULL, '', NULL, 'GroupeEtudiant', ''),
('2024-05-17 20:53:10.636632', 77, NULL, '', NULL, 'Contact', ''),
('2024-05-17 20:53:10.656206', 78, NULL, '', NULL, 'TypeReclamationProf', ''),
('2024-05-17 20:53:10.674222', 79, NULL, '', NULL, 'User', ''),
('2024-05-17 20:53:10.693223', 80, NULL, '', NULL, 'ModelPermission', ''),
('2024-05-17 20:53:10.707209', 81, NULL, '', NULL, 'ActionPermission', '');

-- --------------------------------------------------------

--
-- Table structure for table `model_permission_seq`
--

CREATE TABLE `model_permission_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_permission_seq`
--

INSERT INTO `model_permission_seq` (`next_val`) VALUES
(82);

-- --------------------------------------------------------

--
-- Table structure for table `model_permission_utilisateur`
--

CREATE TABLE `model_permission_utilisateur` (
  `value` bit(1) DEFAULT NULL,
  `action_permission` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `model_permission` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `sub_attribute` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_permission_utilisateur`
--

INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 1, '2024-05-17 20:53:11.494109', 1, 1, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.504109', 2, 1, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.507143', 3, 1, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.510181', 4, 1, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.514198', 5, 1, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.517169', 6, 1, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.520213', 7, 2, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.523193', 8, 2, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.526107', 9, 2, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.530112', 10, 2, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.533185', 11, 2, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.536113', 12, 2, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.539115', 13, 3, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.543108', 14, 3, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.547110', 15, 3, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.551286', 16, 3, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.557121', 17, 3, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.564136', 18, 3, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.571118', 19, 4, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.578132', 20, 4, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.585130', 21, 4, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.593125', 22, 4, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.600135', 23, 4, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.608114', 24, 4, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.616116', 25, 5, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.622122', 26, 5, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.628135', 27, 5, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.636127', 28, 5, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.643131', 29, 5, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.650129', 30, 5, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.657220', 31, 6, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.664118', 32, 6, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.670126', 33, 6, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.676132', 34, 6, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.683244', 35, 6, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.691282', 36, 6, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.697295', 37, 7, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.703120', 38, 7, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.710119', 39, 7, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.718115', 40, 7, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.725118', 41, 7, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.733125', 42, 7, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.741114', 43, 8, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.748410', 44, 8, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.756131', 45, 8, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.763129', 46, 8, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.770122', 47, 8, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.776124', 48, 8, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.783407', 49, 9, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.790111', 50, 9, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.796130', 51, 9, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.802276', 52, 9, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.810122', 53, 9, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.817116', 54, 9, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.822118', 55, 10, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.830243', 56, 10, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.838112', 57, 10, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.844240', 58, 10, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.850120', 59, 10, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.856937', 60, 10, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.862245', 61, 11, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.868237', 62, 11, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.875121', 63, 11, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.881121', 64, 11, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.888120', 65, 11, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.895116', 66, 11, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.902131', 67, 12, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.909117', 68, 12, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.917121', 69, 12, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.924119', 70, 12, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.931441', 71, 12, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.939171', 72, 12, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.946286', 73, 13, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:11.955120', 74, 13, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:11.966117', 75, 13, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:11.973456', 76, 13, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:11.982243', 77, 13, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:11.989645', 78, 13, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:11.997123', 79, 14, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.006117', 80, 14, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.013120', 81, 14, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.020123', 82, 14, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.026293', 83, 14, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.033283', 84, 14, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.039273', 85, 15, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.045111', 86, 15, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.051116', 87, 15, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.058126', 88, 15, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.065122', 89, 15, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.070214', 90, 15, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.076404', 91, 16, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.082127', 92, 16, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.088119', 93, 16, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.095132', 94, 16, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.101256', 95, 16, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.107121', 96, 16, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.113136', 97, 17, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.119127', 98, 17, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.125125', 99, 17, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.131282', 100, 17, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.137126', 101, 17, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.144126', 102, 17, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.151223', 103, 18, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.160117', 104, 18, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.168310', 105, 18, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.174279', 106, 18, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.182236', 107, 18, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.188316', 108, 18, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.194118', 109, 19, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.201151', 110, 19, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.207129', 111, 19, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.213135', 112, 19, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.220134', 113, 19, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.225118', 114, 19, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.231345', 115, 20, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.237128', 116, 20, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.243477', 117, 20, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.249119', 118, 20, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.255116', 119, 20, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.260116', 120, 20, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.265124', 121, 21, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.270249', 122, 21, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.275139', 123, 21, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.280219', 124, 21, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.286118', 125, 21, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.291133', 126, 21, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.297120', 127, 22, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.303289', 128, 22, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.310140', 129, 22, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.317195', 130, 22, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.323181', 131, 22, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.330118', 132, 22, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.336133', 133, 23, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.343126', 134, 23, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.349209', 135, 23, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.355274', 136, 23, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.362377', 137, 23, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.369114', 138, 23, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.375163', 139, 24, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.382454', 140, 24, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.388128', 141, 24, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.396125', 142, 24, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.402136', 143, 24, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.408193', 144, 24, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.414296', 145, 25, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.421322', 146, 25, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.427548', 147, 25, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.433372', 148, 25, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.439135', 149, 25, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.445416', 150, 25, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.450126', 151, 26, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.456130', 152, 26, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.462179', 153, 26, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.467135', 154, 26, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.473450', 155, 26, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.478293', 156, 26, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.484369', 157, 27, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.489125', 158, 27, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.496782', 159, 27, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.502135', 160, 27, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.508132', 161, 27, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.514116', 162, 27, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.520139', 163, 28, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.526120', 164, 28, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.534177', 165, 28, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.541255', 166, 28, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.547178', 167, 28, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.556121', 168, 28, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.563131', 169, 29, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.570208', 170, 29, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.577119', 171, 29, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.583211', 172, 29, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.589395', 173, 29, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.595118', 174, 29, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.601118', 175, 30, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.608135', 176, 30, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.614125', 177, 30, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.621140', 178, 30, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.627120', 179, 30, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.633117', 180, 30, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.639122', 181, 31, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.644117', 182, 31, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.650125', 183, 31, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.656122', 184, 31, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.662134', 185, 31, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.667119', 186, 31, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.673140', 187, 32, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.678241', 188, 32, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.684133', 189, 32, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.690185', 190, 32, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.696114', 191, 32, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.702137', 192, 32, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.709125', 193, 33, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.715126', 194, 33, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.721123', 195, 33, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.727138', 196, 33, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.733287', 197, 33, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.740138', 198, 33, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.746294', 199, 34, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.752272', 200, 34, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.759122', 201, 34, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.765140', 202, 34, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.774121', 203, 34, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.781119', 204, 34, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.787349', 205, 35, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.793117', 206, 35, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.799617', 207, 35, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.805135', 208, 35, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.810117', 209, 35, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.817129', 210, 35, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.823133', 211, 36, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.829119', 212, 36, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.835179', 213, 36, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.841115', 214, 36, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.847183', 215, 36, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.852758', 216, 36, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.858189', 217, 37, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.863185', 218, 37, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.869178', 219, 37, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.875368', 220, 37, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.881181', 221, 37, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.887127', 222, 37, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.893126', 223, 38, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.899381', 224, 38, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.905159', 225, 38, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.911113', 226, 38, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.917122', 227, 38, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.923133', 228, 38, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.929247', 229, 39, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.935134', 230, 39, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.953112', 231, 39, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.959436', 232, 39, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:12.965157', 233, 39, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:12.972122', 234, 39, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:12.978133', 235, 40, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:12.985139', 236, 40, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:12.992122', 237, 40, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:12.997133', 238, 40, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.003287', 239, 40, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.009120', 240, 40, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.015120', 241, 41, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.022187', 242, 41, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.028116', 243, 41, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.034187', 244, 41, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.040188', 245, 41, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.046182', 246, 41, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.053182', 247, 42, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.059126', 248, 42, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.065132', 249, 42, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.071143', 250, 42, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.077181', 251, 42, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.083123', 252, 42, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.089142', 253, 43, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.095118', 254, 43, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.102128', 255, 43, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.108381', 256, 43, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.116400', 257, 43, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.122112', 258, 43, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.128280', 259, 44, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.134219', 260, 44, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.140132', 261, 44, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.147127', 262, 44, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.153358', 263, 44, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.159136', 264, 44, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.165128', 265, 45, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.172127', 266, 45, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.179623', 267, 45, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.185177', 268, 45, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.191132', 269, 45, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.197122', 270, 45, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.204406', 271, 46, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.211178', 272, 46, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.218134', 273, 46, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.224127', 274, 46, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.230184', 275, 46, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.237281', 276, 46, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.243183', 277, 47, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.249120', 278, 47, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.255179', 279, 47, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.260119', 280, 47, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.265180', 281, 47, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.271243', 282, 47, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.277298', 283, 48, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.283124', 284, 48, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.288377', 285, 48, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.294183', 286, 48, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.299135', 287, 48, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.305128', 288, 48, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.311181', 289, 49, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.317133', 290, 49, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.323139', 291, 49, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.329174', 292, 49, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.335117', 293, 49, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.341120', 294, 49, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.349126', 295, 50, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.356120', 296, 50, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.363424', 297, 50, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.371137', 298, 50, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.377221', 299, 50, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.383167', 300, 50, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.389134', 301, 51, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.395115', 302, 51, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.401121', 303, 51, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.406176', 304, 51, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.413372', 305, 51, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.418195', 306, 51, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.424283', 307, 52, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.430268', 308, 52, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.436147', 309, 52, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.442117', 310, 52, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.448183', 311, 52, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.453194', 312, 52, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.459187', 313, 53, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.464166', 314, 53, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.469189', 315, 53, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.475366', 316, 53, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.480291', 317, 53, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.485128', 318, 53, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.491289', 319, 54, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.496190', 320, 54, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.502410', 321, 54, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.509116', 322, 54, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.515123', 323, 54, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.520119', 324, 54, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.526118', 325, 55, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.532136', 326, 55, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.539228', 327, 55, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.546135', 328, 55, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.552133', 329, 55, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.558135', 330, 55, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.564132', 331, 56, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.570176', 332, 56, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.576136', 333, 56, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.582115', 334, 56, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.588111', 335, 56, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.594259', 336, 56, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.600117', 337, 57, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.606337', 338, 57, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.612371', 339, 57, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.618128', 340, 57, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.624115', 341, 57, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.630344', 342, 57, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.636132', 343, 58, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.642235', 344, 58, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.647184', 345, 58, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.653231', 346, 58, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.658231', 347, 58, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.664134', 348, 58, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.670178', 349, 59, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.675327', 350, 59, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.680174', 351, 59, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.685233', 352, 59, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.691343', 353, 59, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.696228', 354, 59, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.701347', 355, 60, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.707422', 356, 60, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.713118', 357, 60, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.720120', 358, 60, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.728122', 359, 60, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.735249', 360, 60, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.742118', 361, 61, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.750113', 362, 61, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.757205', 363, 61, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.764118', 364, 61, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.770120', 365, 61, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.777871', 366, 61, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.783112', 367, 62, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.790388', 368, 62, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.797133', 369, 62, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.803360', 370, 62, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.809131', 371, 62, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.814625', 372, 62, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.820282', 373, 63, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.825906', 374, 63, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.831183', 375, 63, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.836246', 376, 63, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.841114', 377, 63, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.846113', 378, 63, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.851125', 379, 64, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.856112', 380, 64, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.860150', 381, 64, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.865130', 382, 64, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.870128', 383, 64, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.874263', 384, 64, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.879113', 385, 65, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.884113', 386, 65, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.888260', 387, 65, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.892338', 388, 65, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.897248', 389, 65, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.902132', 390, 65, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.907183', 391, 66, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.912316', 392, 66, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.918324', 393, 66, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.924112', 394, 66, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.930116', 395, 66, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.936168', 396, 66, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.942127', 397, 67, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.948472', 398, 67, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.954136', 399, 67, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.960131', 400, 67, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:13.966247', 401, 67, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:13.973138', 402, 67, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:13.979117', 403, 68, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:13.984672', 404, 68, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:13.991141', 405, 68, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:13.997136', 406, 68, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.003172', 407, 68, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.010120', 408, 68, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.016126', 409, 69, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.023131', 410, 69, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.029130', 411, 69, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.034686', 412, 69, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.040120', 413, 69, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.046180', 414, 69, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.052492', 415, 70, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.059176', 416, 70, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.064394', 417, 70, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.070127', 418, 70, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.076118', 419, 70, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.082186', 420, 70, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.088174', 421, 71, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.093193', 422, 71, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.099735', 423, 71, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.106287', 424, 71, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.112584', 425, 71, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.119339', 426, 71, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.126119', 427, 72, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.132131', 428, 72, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.138132', 429, 72, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.144136', 430, 72, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.150289', 431, 72, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.156119', 432, 72, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.162116', 433, 73, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.168130', 434, 73, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.174133', 435, 73, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.180139', 436, 73, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.185317', 437, 73, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.191136', 438, 73, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.197219', 439, 74, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.203135', 440, 74, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.208125', 441, 74, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.214137', 442, 74, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.220176', 443, 74, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.225424', 444, 74, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.232137', 445, 75, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.237159', 446, 75, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.243138', 447, 75, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.248148', 448, 75, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.253183', 449, 75, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.259179', 450, 75, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.264174', 451, 76, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.269297', 452, 76, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.274291', 453, 76, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.279291', 454, 76, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.284398', 455, 76, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.289125', 456, 76, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.294280', 457, 77, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.299187', 458, 77, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.304136', 459, 77, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.309134', 460, 77, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.314181', 461, 77, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.319131', 462, 77, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:14.324430', 463, 78, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:14.330139', 464, 78, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:14.336275', 465, 78, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:14.342137', 466, 78, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:14.348135', 467, 78, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:14.353337', 468, 78, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.085406', 469, 1, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.089372', 470, 1, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.093299', 471, 1, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.097301', 472, 1, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.101311', 473, 1, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.105344', 474, 1, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.110352', 475, 2, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.114360', 476, 2, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.119363', 477, 2, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.124359', 478, 2, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.129303', 479, 2, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.135310', 480, 2, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.141311', 481, 3, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.147320', 482, 3, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.152385', 483, 3, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.158368', 484, 3, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.164319', 485, 3, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.170370', 486, 3, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.175320', 487, 4, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.181306', 488, 4, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.187371', 489, 4, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.192317', 490, 4, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.198315', 491, 4, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.204365', 492, 4, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.210315', 493, 5, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.216589', 494, 5, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.222457', 495, 5, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.228329', 496, 5, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.234369', 497, 5, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.240368', 498, 5, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.246319', 499, 6, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.252320', 500, 6, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.257560', 501, 6, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.263358', 502, 6, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.269365', 503, 6, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.275307', 504, 6, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.281382', 505, 7, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.287302', 506, 7, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.293359', 507, 7, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.299423', 508, 7, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.305473', 509, 7, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.311321', 510, 7, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.317322', 511, 8, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.323308', 512, 8, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.329307', 513, 8, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.335315', 514, 8, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.340320', 515, 8, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.346471', 516, 8, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.352777', 517, 9, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.358321', 518, 9, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.364303', 519, 9, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.370298', 520, 9, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.376301', 521, 9, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.382315', 522, 9, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.388724', 523, 10, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.393674', 524, 10, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.400300', 525, 10, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.405326', 526, 10, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.411297', 527, 10, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.417303', 528, 10, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.422364', 529, 11, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.427302', 530, 11, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.432308', 531, 11, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.437360', 532, 11, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.443311', 533, 11, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.448321', 534, 11, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.453536', 535, 12, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.459306', 536, 12, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.465320', 537, 12, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.470765', 538, 12, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.476412', 539, 12, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.482501', 540, 12, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.488303', 541, 13, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.494362', 542, 13, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.500312', 543, 13, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.506336', 544, 13, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.511314', 545, 13, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.517530', 546, 13, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.523546', 547, 14, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.529322', 548, 14, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.535740', 549, 14, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.543327', 550, 14, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.549553', 551, 14, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.556361', 552, 14, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.562301', 553, 15, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.568308', 554, 15, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.573490', 555, 15, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.579322', 556, 15, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.585490', 557, 15, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.590388', 558, 15, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.595312', 559, 16, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.601511', 560, 16, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.607366', 561, 16, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.612306', 562, 16, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.617390', 563, 16, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.622519', 564, 16, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.627373', 565, 17, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.632320', 566, 17, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.638372', 567, 17, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.642415', 568, 17, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.648370', 569, 17, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.653319', 570, 17, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.658516', 571, 18, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.663591', 572, 18, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.669322', 573, 18, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.675551', 574, 18, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.681438', 575, 18, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.686567', 576, 18, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.692314', 577, 19, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.697545', 578, 19, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.703318', 579, 19, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.709299', 580, 19, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.715493', 581, 19, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.721317', 582, 19, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.728311', 583, 20, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.735306', 584, 20, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.741308', 585, 20, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.747307', 586, 20, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.754317', 587, 20, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.760526', 588, 20, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.766305', 589, 21, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.772322', 590, 21, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.778609', 591, 21, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.784312', 592, 21, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.790315', 593, 21, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.795972', 594, 21, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.800563', 595, 22, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.806301', 596, 22, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.811509', 597, 22, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.816448', 598, 22, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.822306', 599, 22, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.827300', 600, 22, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.831335', 601, 23, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.837306', 602, 23, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.841429', 603, 23, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.846301', 604, 23, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.851421', 605, 23, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.856300', 606, 23, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.861314', 607, 24, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.866316', 608, 24, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.871307', 609, 24, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.877311', 610, 24, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.882317', 611, 24, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.887311', 612, 24, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.893322', 613, 25, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.899325', 614, 25, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.905320', 615, 25, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.911485', 616, 25, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.917582', 617, 25, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.923328', 618, 25, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.929322', 619, 26, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.935324', 620, 26, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.941312', 621, 26, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.947324', 622, 26, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.953315', 623, 26, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.959490', 624, 26, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.965376', 625, 27, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:16.970295', 626, 27, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:16.976552', 627, 27, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:16.983311', 628, 27, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:16.988303', 629, 27, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:16.994321', 630, 27, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:16.999314', 631, 28, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.004471', 632, 28, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.009301', 633, 28, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.014306', 634, 28, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.019320', 635, 28, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.024303', 636, 28, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.029639', 637, 29, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.034490', 638, 29, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.040305', 639, 29, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.045320', 640, 29, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.050557', 641, 29, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.055303', 642, 29, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.060513', 643, 30, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.066305', 644, 30, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.071537', 645, 30, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.077312', 646, 30, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.083757', 647, 30, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.089406', 648, 30, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.095313', 649, 31, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.100314', 650, 31, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.106318', 651, 31, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.112405', 652, 31, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.118304', 653, 31, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.123307', 654, 31, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.129325', 655, 32, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.134303', 656, 32, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.139468', 657, 32, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.145314', 658, 32, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.150615', 659, 32, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.156322', 660, 32, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.161332', 661, 33, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.167543', 662, 33, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.173324', 663, 33, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.178390', 664, 33, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.184514', 665, 33, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.190317', 666, 33, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.196318', 667, 34, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.202327', 668, 34, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.208659', 669, 34, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.214361', 670, 34, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.219323', 671, 34, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.225562', 672, 34, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.230372', 673, 35, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.236306', 674, 35, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.241674', 675, 35, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.247390', 676, 35, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.253370', 677, 35, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.259369', 678, 35, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.264318', 679, 36, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.269564', 680, 36, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.275324', 681, 36, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.280314', 682, 36, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.286300', 683, 36, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.292299', 684, 36, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.298304', 685, 37, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.304323', 686, 37, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.309498', 687, 37, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.315320', 688, 37, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.321318', 689, 37, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.327847', 690, 37, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.333305', 691, 38, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.339319', 692, 38, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.345321', 693, 38, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.353319', 694, 38, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.358684', 695, 38, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.364729', 696, 38, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.371722', 697, 39, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.378771', 698, 39, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.384887', 699, 39, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.390822', 700, 39, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.397719', 701, 39, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.403734', 702, 39, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.409742', 703, 40, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.415893', 704, 40, NULL, 2, '', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-05-17 20:53:17.420950', 705, 40, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.425885', 706, 40, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.431743', 707, 40, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.436727', 708, 40, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.442738', 709, 41, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.447728', 710, 41, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.453738', 711, 41, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.459716', 712, 41, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.464737', 713, 41, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.481722', 714, 41, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.487731', 715, 42, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.493806', 716, 42, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.499729', 717, 42, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.505736', 718, 42, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.511736', 719, 42, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.516733', 720, 42, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.522739', 721, 43, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.527730', 722, 43, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.534738', 723, 43, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.540735', 724, 43, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.545734', 725, 43, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.551760', 726, 43, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.557726', 727, 44, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.563728', 728, 44, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.568737', 729, 44, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.574725', 730, 44, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.580812', 731, 44, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.586729', 732, 44, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.592741', 733, 45, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.597738', 734, 45, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.602719', 735, 45, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.608018', 736, 45, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.612747', 737, 45, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.618096', 738, 45, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.622935', 739, 46, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.628363', 740, 46, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.632926', 741, 46, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.637726', 742, 46, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.642722', 743, 46, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.647884', 744, 46, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.653729', 745, 47, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.658740', 746, 47, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.664738', 747, 47, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.668996', 748, 47, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.673721', 749, 47, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.677847', 750, 47, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.682832', 751, 48, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.687718', 752, 48, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.691725', 753, 48, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.697728', 754, 48, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.702911', 755, 48, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.707907', 756, 48, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.713724', 757, 49, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.718731', 758, 49, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.724277', 759, 49, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.730724', 760, 49, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.736918', 761, 49, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.743727', 762, 49, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.749910', 763, 50, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.755743', 764, 50, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.761738', 765, 50, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.767727', 766, 50, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.773724', 767, 50, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.778736', 768, 50, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.783950', 769, 51, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.789731', 770, 51, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.794721', 771, 51, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.799722', 772, 51, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.805724', 773, 51, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.811730', 774, 51, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.817035', 775, 52, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.822724', 776, 52, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.828728', 777, 52, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.832728', 778, 52, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.838729', 779, 52, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.842728', 780, 52, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.847719', 781, 53, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.852720', 782, 53, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.856720', 783, 53, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.860765', 784, 53, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.864761', 785, 53, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.869760', 786, 53, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.873757', 787, 54, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.877763', 788, 54, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.882734', 789, 54, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.887726', 790, 54, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.891902', 791, 54, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.896237', 792, 54, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.901737', 793, 55, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.906927', 794, 55, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.911785', 795, 55, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.917731', 796, 55, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.923108', 797, 55, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.927777', 798, 55, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.933723', 799, 56, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.938740', 800, 56, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.944729', 801, 56, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.949744', 802, 56, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.954737', 803, 56, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.960975', 804, 56, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.965730', 805, 57, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:17.971352', 806, 57, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:17.976733', 807, 57, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:17.981741', 808, 57, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:17.986732', 809, 57, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:17.992921', 810, 57, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:17.998733', 811, 58, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.003879', 812, 58, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.009721', 813, 58, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.015732', 814, 58, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.019965', 815, 58, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.025726', 816, 58, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.030735', 817, 59, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.035852', 818, 59, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.041725', 819, 59, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.046725', 820, 59, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.052060', 821, 59, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.057730', 822, 59, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.061743', 823, 60, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.067819', 824, 60, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.072720', 825, 60, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.077820', 826, 60, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.082814', 827, 60, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.087935', 828, 60, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.092726', 829, 61, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.098120', 830, 61, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.103894', 831, 61, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.108726', 832, 61, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.113786', 833, 61, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.118729', 834, 61, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.124748', 835, 62, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.129732', 836, 62, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.135740', 837, 62, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.140774', 838, 62, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.146734', 839, 62, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.152852', 840, 62, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.158778', 841, 63, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.164725', 842, 63, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.169990', 843, 63, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.175726', 844, 63, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.182732', 845, 63, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.188724', 846, 63, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.193896', 847, 64, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.199744', 848, 64, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.204737', 849, 64, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.210721', 850, 64, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.215719', 851, 64, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.221866', 852, 64, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.227195', 853, 65, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.232721', 854, 65, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.236989', 855, 65, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.241943', 856, 65, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.246900', 857, 65, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.251719', 858, 65, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.257253', 859, 66, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.262728', 860, 66, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.268786', 861, 66, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.273732', 862, 66, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.278947', 863, 66, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.284963', 864, 66, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.289722', 865, 67, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.295724', 866, 67, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.300947', 867, 67, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.306722', 868, 67, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.311920', 869, 67, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.317739', 870, 67, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.322721', 871, 68, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.328919', 872, 68, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.333717', 873, 68, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.339795', 874, 68, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.345738', 875, 68, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.350784', 876, 68, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.356723', 877, 69, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.362726', 878, 69, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.368727', 879, 69, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.373783', 880, 69, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.379784', 881, 69, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.384949', 882, 69, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.390971', 883, 70, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.396720', 884, 70, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.401800', 885, 70, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.407724', 886, 70, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.413735', 887, 70, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.418724', 888, 70, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.424928', 889, 71, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.429729', 890, 71, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.434741', 891, 71, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.440724', 892, 71, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.446734', 893, 71, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.454725', 894, 71, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.459737', 895, 72, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.464730', 896, 72, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.469726', 897, 72, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.475739', 898, 72, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.481746', 899, 72, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.486727', 900, 72, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.492737', 901, 73, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.497736', 902, 73, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.502730', 903, 73, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.508743', 904, 73, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.514731', 905, 73, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.520166', 906, 73, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.526735', 907, 74, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.531732', 908, 74, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.537744', 909, 74, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.543151', 910, 74, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.548780', 911, 74, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.554979', 912, 74, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.560793', 913, 75, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.566924', 914, 75, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.572732', 915, 75, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.578733', 916, 75, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.584014', 917, 75, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.589717', 918, 75, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.594718', 919, 76, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.600729', 920, 76, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.605720', 921, 76, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.611826', 922, 76, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.616737', 923, 76, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.622725', 924, 76, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.626722', 925, 77, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.632776', 926, 77, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.638773', 927, 77, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.643739', 928, 77, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.648782', 929, 77, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.653781', 930, 77, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-05-17 20:53:18.658789', 931, 78, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-05-17 20:53:18.664730', 932, 78, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-05-17 20:53:18.670730', 933, 78, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-05-17 20:53:18.675780', 934, 78, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-05-17 20:53:18.681786', 935, 78, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-05-17 20:53:18.686794', 936, 78, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.192543', 937, 1, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.200554', 938, 1, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.203512', 939, 1, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.208551', 940, 1, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.211509', 941, 1, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.215504', 942, 1, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.218552', 943, 2, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.222535', 944, 2, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.225505', 945, 2, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.228526', 946, 2, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.231525', 947, 2, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.234524', 948, 2, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.238511', 949, 3, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.241521', 950, 3, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.245512', 951, 3, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.249506', 952, 3, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.252502', 953, 3, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.256520', 954, 3, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.259504', 955, 4, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.262508', 956, 4, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.265505', 957, 4, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.267504', 958, 4, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.270510', 959, 4, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.272608', 960, 4, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.276508', 961, 5, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.279506', 962, 5, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.283510', 963, 5, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.287508', 964, 5, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.290507', 965, 5, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.295513', 966, 5, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.299506', 967, 6, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.302515', 968, 6, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.307509', 969, 6, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.311513', 970, 6, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.315509', 971, 6, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.319507', 972, 6, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.323506', 973, 7, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.327506', 974, 7, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.331504', 975, 7, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.335509', 976, 7, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.339511', 977, 7, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.342506', 978, 7, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.346511', 979, 8, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.349508', 980, 8, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.353512', 981, 8, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.357548', 982, 8, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.361511', 983, 8, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.366506', 984, 8, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.370525', 985, 9, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.374507', 986, 9, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.378510', 987, 9, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.382510', 988, 9, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.385507', 989, 9, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.390548', 990, 9, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.392543', 991, 10, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.395518', 992, 10, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.399589', 993, 10, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.407520', 994, 10, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.413516', 995, 10, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.418519', 996, 10, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.422536', 997, 11, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.426607', 998, 11, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.431508', 999, 11, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.434546', 1000, 11, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.438514', 1001, 11, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.441506', 1002, 11, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.444507', 1003, 12, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.447543', 1004, 12, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.450506', 1005, 12, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.452509', 1006, 12, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.455551', 1007, 12, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.457544', 1008, 12, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.460520', 1009, 13, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.463510', 1010, 13, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.465507', 1011, 13, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.468505', 1012, 13, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.471510', 1013, 13, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.473541', 1014, 13, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.476532', 1015, 14, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.479509', 1016, 14, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.482508', 1017, 14, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.484504', 1018, 14, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.487514', 1019, 14, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.490507', 1020, 14, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.493509', 1021, 15, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.497520', 1022, 15, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.500731', 1023, 15, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.504509', 1024, 15, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.507511', 1025, 15, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.510558', 1026, 15, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.514507', 1027, 16, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.517512', 1028, 16, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.520525', 1029, 16, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.523551', 1030, 16, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.526514', 1031, 16, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.530514', 1032, 16, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.532546', 1033, 17, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.536510', 1034, 17, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.540544', 1035, 17, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.542613', 1036, 17, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.546511', 1037, 17, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.549543', 1038, 17, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.552506', 1039, 18, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.555507', 1040, 18, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.558509', 1041, 18, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.562511', 1042, 18, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.565547', 1043, 18, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.567507', 1044, 18, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.570520', 1045, 19, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.573549', 1046, 19, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.576507', 1047, 19, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.580517', 1048, 19, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.583510', 1049, 19, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.586515', 1050, 19, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.589548', 1051, 20, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.592608', 1052, 20, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.596516', 1053, 20, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.598697', 1054, 20, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.600610', 1055, 20, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.603538', 1056, 20, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.606562', 1057, 21, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.608614', 1058, 21, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.611506', 1059, 21, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.615509', 1060, 21, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.617733', 1061, 21, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.620517', 1062, 21, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.623508', 1063, 22, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.626545', 1064, 22, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.629557', 1065, 22, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.631610', 1066, 22, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.633609', 1067, 22, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.636506', 1068, 22, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.639574', 1069, 23, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.641666', 1070, 23, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.643607', 1071, 23, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.647506', 1072, 23, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.649508', 1073, 23, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.651539', 1074, 23, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.654519', 1075, 24, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.667565', 1076, 24, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.670509', 1077, 24, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.672812', 1078, 24, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.675547', 1079, 24, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.677505', 1080, 24, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.681509', 1081, 25, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.683508', 1082, 25, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.685544', 1083, 25, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.689507', 1084, 25, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.691542', 1085, 25, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.694514', 1086, 25, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.698541', 1087, 26, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.700544', 1088, 26, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.703510', 1089, 26, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.707508', 1090, 26, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.710511', 1091, 26, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.714517', 1092, 26, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.717510', 1093, 27, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.720520', 1094, 27, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.724546', 1095, 27, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.726517', 1096, 27, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.730523', 1097, 27, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.733511', 1098, 27, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.737508', 1099, 28, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.740544', 1100, 28, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.743512', 1101, 28, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.747506', 1102, 28, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.750506', 1103, 28, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.753509', 1104, 28, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.757511', 1105, 29, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.760507', 1106, 29, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.765512', 1107, 29, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.768508', 1108, 29, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.773509', 1109, 29, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.775510', 1110, 29, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.779510', 1111, 30, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.782506', 1112, 30, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.785506', 1113, 30, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.789508', 1114, 30, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.792508', 1115, 30, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.795516', 1116, 30, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.799508', 1117, 31, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.803509', 1118, 31, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.806507', 1119, 31, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.808507', 1120, 31, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.811515', 1121, 31, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.814506', 1122, 31, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.817505', 1123, 32, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.820508', 1124, 32, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.822505', 1125, 32, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.825608', 1126, 32, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.830510', 1127, 32, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.833506', 1128, 32, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.835619', 1129, 33, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.838530', 1130, 33, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.840594', 1131, 33, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.842594', 1132, 33, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.845508', 1133, 33, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.848505', 1134, 33, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.850503', 1135, 34, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.852505', 1136, 34, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.854510', 1137, 34, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.857503', 1138, 34, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.859529', 1139, 34, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.862516', 1140, 34, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.864532', 1141, 35, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.866532', 1142, 35, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.868532', 1143, 35, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.871507', 1144, 35, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.874504', 1145, 35, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.876507', 1146, 35, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.878509', 1147, 36, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.881529', 1148, 36, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.883532', 1149, 36, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.885507', 1150, 36, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.889504', 1151, 36, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.891507', 1152, 36, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.893508', 1153, 37, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.897543', 1154, 37, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.899508', 1155, 37, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.901659', 1156, 37, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.905512', 1157, 37, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.908506', 1158, 37, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.911515', 1159, 38, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.914550', 1160, 38, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.917508', 1161, 38, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.920524', 1162, 38, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.923509', 1163, 38, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.926507', 1164, 38, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.929511', 1165, 39, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.932505', 1166, 39, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.934537', 1167, 39, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.938509', 1168, 39, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.940537', 1169, 39, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.943519', 1170, 39, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.946515', 1171, 40, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.949684', 1172, 40, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.951537', 1173, 40, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.955511', 1174, 40, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.958511', 1175, 40, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.961515', 1176, 40, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.964507', 1177, 41, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.967504', 1178, 41, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.970512', 1179, 41, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.973507', 1180, 41, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.975504', 1181, 41, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.979506', 1182, 41, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 15:59:59.982509', 1183, 42, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 15:59:59.985507', 1184, 42, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 15:59:59.989505', 1185, 42, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 15:59:59.992503', 1186, 42, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 15:59:59.995507', 1187, 42, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 15:59:59.999548', 1188, 42, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.001608', 1189, 43, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.006506', 1190, 43, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.009507', 1191, 43, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.012509', 1192, 43, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.015504', 1193, 43, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.017508', 1194, 43, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.019508', 1195, 44, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.022504', 1196, 44, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.024503', 1197, 44, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.026544', 1198, 44, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.029513', 1199, 44, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.031567', 1200, 44, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.033562', 1201, 45, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.035507', 1202, 45, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.037508', 1203, 45, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.039787', 1204, 45, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.041627', 1205, 45, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.043621', 1206, 45, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.046546', 1207, 46, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.048614', 1208, 46, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.050545', 1209, 46, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.052514', 1210, 46, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.055615', 1211, 46, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.057614', 1212, 46, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.059609', 1213, 47, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.062519', 1214, 47, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.064588', 1215, 47, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.069516', 1216, 47, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.076524', 1217, 47, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.083573', 1218, 47, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.090538', 1219, 48, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.095526', 1220, 48, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.099517', 1221, 48, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.103510', 1222, 48, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.107508', 1223, 48, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.112510', 1224, 48, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.116516', 1225, 49, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.120507', 1226, 49, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.124509', 1227, 49, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.127509', 1228, 49, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.131506', 1229, 49, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.133506', 1230, 49, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.137506', 1231, 50, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.140511', 1232, 50, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.143523', 1233, 50, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.147508', 1234, 50, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.150506', 1235, 50, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.153523', 1236, 50, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.157507', 1237, 51, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.159511', 1238, 51, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.163510', 1239, 51, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.166507', 1240, 51, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.170515', 1241, 51, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.173508', 1242, 51, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.176508', 1243, 52, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.180506', 1244, 52, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.183509', 1245, 52, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.186517', 1246, 52, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.189507', 1247, 52, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.192505', 1248, 52, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.195509', 1249, 53, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.198505', 1250, 53, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.200505', 1251, 53, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.204509', 1252, 53, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.206508', 1253, 53, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.209505', 1254, 53, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.213520', 1255, 54, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.215535', 1256, 54, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.217505', 1257, 54, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.219512', 1258, 54, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.222535', 1259, 54, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.224534', 1260, 54, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.226534', 1261, 55, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.229509', 1262, 55, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.231506', 1263, 55, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.233533', 1264, 55, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.235507', 1265, 55, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.238533', 1266, 55, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.240535', 1267, 56, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.242532', 1268, 56, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.244507', 1269, 56, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.247538', 1270, 56, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.249616', 1271, 56, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.251790', 1272, 56, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.254532', 1273, 57, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.256620', 1274, 57, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.258615', 1275, 57, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.260510', 1276, 57, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.263547', 1277, 57, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.265591', 1278, 57, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.267556', 1279, 58, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.269514', 1280, 58, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.272543', 1281, 58, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.273585', 1282, 58, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.275609', 1283, 58, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.278508', 1284, 58, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.281509', 1285, 59, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.283543', 1286, 59, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.285504', 1287, 59, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.288615', 1288, 59, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.290627', 1289, 59, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.292610', 1290, 59, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.295508', 1291, 60, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.297542', 1292, 60, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.299546', 1293, 60, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.302508', 1294, 60, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.305544', 1295, 60, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.307541', 1296, 60, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.309507', 1297, 61, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.313515', 1298, 61, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.316508', 1299, 61, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.319508', 1300, 61, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.322514', 1301, 61, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.325508', 1302, 61, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.328508', 1303, 62, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.331544', 1304, 62, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.333508', 1305, 62, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.336517', 1306, 62, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.340507', 1307, 62, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.342506', 1308, 62, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.345510', 1309, 63, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.348507', 1310, 63, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.350541', 1311, 63, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.354515', 1312, 63, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.357506', 1313, 63, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.359543', 1314, 63, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.363513', 1315, 64, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.366548', 1316, 64, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.369508', 1317, 64, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.373504', 1318, 64, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.376510', 1319, 64, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.380508', 1320, 64, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.383507', 1321, 65, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.386512', 1322, 65, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.389508', 1323, 65, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.391507', 1324, 65, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.393513', 1325, 65, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.397554', 1326, 65, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.399511', 1327, 66, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.401505', 1328, 66, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.405523', 1329, 66, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.407543', 1330, 66, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.410511', 1331, 66, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.413549', 1332, 66, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.415628', 1333, 67, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.417559', 1334, 67, NULL, 3, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-01 16:00:00.419512', 1335, 67, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.421651', 1336, 67, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.423610', 1337, 67, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.425619', 1338, 67, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.427513', 1339, 68, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.430582', 1340, 68, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.432668', 1341, 68, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.434606', 1342, 68, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.436521', 1343, 68, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.438611', 1344, 68, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.440608', 1345, 69, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.442617', 1346, 69, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.444514', 1347, 69, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.446611', 1348, 69, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.448608', 1349, 69, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.450742', 1350, 69, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.452509', 1351, 70, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.454544', 1352, 70, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.456542', 1353, 70, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.458664', 1354, 70, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.460512', 1355, 70, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.463590', 1356, 70, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.468577', 1357, 71, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.475577', 1358, 71, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.480533', 1359, 71, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.486520', 1360, 71, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.492533', 1361, 71, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.498522', 1362, 71, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.504518', 1363, 72, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.509554', 1364, 72, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.513518', 1365, 72, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.517518', 1366, 72, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.520517', 1367, 72, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.524513', 1368, 72, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.527513', 1369, 73, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.531514', 1370, 73, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.533505', 1371, 73, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.536538', 1372, 73, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.539508', 1373, 73, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.542504', 1374, 73, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.544512', 1375, 74, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.548507', 1376, 74, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.550535', 1377, 74, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.553516', 1378, 74, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.556551', 1379, 74, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.559546', 1380, 74, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.561507', 1381, 75, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.565506', 1382, 75, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.567509', 1383, 75, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.570508', 1384, 75, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.572507', 1385, 75, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.575539', 1386, 75, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.578509', 1387, 76, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.580546', 1388, 76, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.583509', 1389, 76, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.585517', 1390, 76, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.588541', 1391, 76, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.590550', 1392, 76, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.593509', 1393, 77, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.596515', 1394, 77, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.606545', 1395, 77, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.609548', 1396, 77, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.613528', 1397, 77, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.615544', 1398, 77, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 16:00:00.618513', 1399, 78, NULL, 3, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 16:00:00.622544', 1400, 78, NULL, 3, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 16:00:00.624715', 1401, 78, NULL, 3, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 16:00:00.626600', 1402, 78, NULL, 3, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 16:00:00.629510', 1403, 78, NULL, 3, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 16:00:00.631591', 1404, 78, NULL, 3, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.235423', 2341, 1, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.251174', 2342, 1, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.259196', 2343, 1, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.267185', 2344, 1, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.275348', 2345, 1, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.283190', 2346, 1, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.290183', 2347, 2, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.297177', 2348, 2, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.305370', 2349, 2, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.312182', 2350, 2, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.321179', 2351, 2, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.328177', 2352, 2, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.335350', 2353, 3, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.345345', 2354, 3, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.353374', 2355, 3, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.363556', 2356, 3, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.371185', 2357, 3, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.378176', 2358, 3, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.387195', 2359, 4, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.394176', 2360, 4, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.403181', 2361, 4, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.412175', 2362, 4, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.421201', 2363, 4, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.430179', 2364, 4, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.441661', 2365, 5, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.453233', 2366, 5, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.462180', 2367, 5, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.472187', 2368, 5, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.481188', 2369, 5, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.489178', 2370, 5, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.499619', 2371, 6, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.508175', 2372, 6, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.516192', 2373, 6, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.525173', 2374, 6, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.534184', 2375, 6, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.545177', 2376, 6, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.554176', 2377, 7, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.564182', 2378, 7, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.575177', 2379, 7, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.586179', 2380, 7, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.599334', 2381, 7, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.607180', 2382, 7, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.613171', 2383, 8, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.619276', 2384, 8, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.624175', 2385, 8, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.630172', 2386, 8, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.635375', 2387, 8, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.640170', 2388, 8, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.646169', 2389, 9, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.651174', 2390, 9, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.656276', 2391, 9, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.662176', 2392, 9, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.667292', 2393, 9, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.673169', 2394, 9, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.680173', 2395, 10, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.686186', 2396, 10, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.690277', 2397, 10, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.698174', 2398, 10, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.706451', 2399, 10, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.715187', 2400, 10, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.726182', 2401, 11, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.735188', 2402, 11, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.743180', 2403, 11, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.750173', 2404, 11, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.757180', 2405, 11, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.764330', 2406, 11, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.771374', 2407, 12, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.777401', 2408, 12, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.783187', 2409, 12, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.790170', 2410, 12, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.798194', 2411, 12, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.805190', 2412, 12, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.812185', 2413, 13, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.820183', 2414, 13, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.827178', 2415, 13, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.834350', 2416, 13, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.842189', 2417, 13, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.849412', 2418, 13, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.857180', 2419, 14, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.865173', 2420, 14, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.872182', 2421, 14, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.880284', 2422, 14, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.887414', 2423, 14, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.894183', 2424, 14, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.902181', 2425, 15, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.911174', 2426, 15, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.918214', 2427, 15, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.925536', 2428, 15, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.933180', 2429, 15, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.939183', 2430, 15, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.946178', 2431, 16, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.953193', 2432, 16, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:43.960192', 2433, 16, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:43.968179', 2434, 16, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:43.976183', 2435, 16, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:43.983175', 2436, 16, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:43.991174', 2437, 17, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:43.999180', 2438, 17, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.006194', 2439, 17, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.013189', 2440, 17, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.021178', 2441, 17, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.028194', 2442, 17, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.035177', 2443, 18, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.043192', 2444, 18, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.050170', 2445, 18, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.058175', 2446, 18, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.065267', 2447, 18, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.072178', 2448, 18, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.078292', 2449, 19, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.085482', 2450, 19, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.093195', 2451, 19, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.100298', 2452, 19, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.107192', 2453, 19, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.114178', 2454, 19, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.121177', 2455, 20, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.128188', 2456, 20, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.135397', 2457, 20, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.142197', 2458, 20, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.151178', 2459, 20, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.160184', 2460, 20, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.168190', 2461, 21, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.176809', 2462, 21, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.185189', 2463, 21, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.194366', 2464, 21, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.204181', 2465, 21, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.213344', 2466, 21, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.222579', 2467, 22, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.229197', 2468, 22, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.236177', 2469, 22, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.242346', 2470, 22, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.248174', 2471, 22, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.254185', 2472, 22, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.262405', 2473, 23, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.270180', 2474, 23, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.277373', 2475, 23, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.285180', 2476, 23, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.293197', 2477, 23, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.300247', 2478, 23, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.308174', 2479, 24, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.315365', 2480, 24, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.322175', 2481, 24, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.328183', 2482, 24, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.335190', 2483, 24, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.342180', 2484, 24, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.349650', 2485, 25, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.356176', 2486, 25, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.363238', 2487, 25, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.370177', 2488, 25, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.376196', 2489, 25, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.383191', 2490, 25, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.390191', 2491, 26, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.397192', 2492, 26, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.403177', 2493, 26, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.409352', 2494, 26, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.415170', 2495, 26, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.421173', 2496, 26, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.426191', 2497, 27, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.432172', 2498, 27, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.438176', 2499, 27, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.443185', 2500, 27, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.449172', 2501, 27, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.454191', 2502, 27, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.460515', 2503, 28, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.466248', 2504, 28, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.472239', 2505, 28, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.479178', 2506, 28, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.486631', 2507, 28, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.493196', 2508, 28, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.500198', 2509, 29, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.507486', 2510, 29, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.514195', 2511, 29, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.521188', 2512, 29, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.527793', 2513, 29, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.534183', 2514, 29, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.541362', 2515, 30, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.547198', 2516, 30, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.553336', 2517, 30, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.560177', 2518, 30, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.566677', 2519, 30, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.573184', 2520, 30, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.579197', 2521, 31, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.586196', 2522, 31, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.593184', 2523, 31, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.600177', 2524, 31, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.606174', 2525, 31, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.612415', 2526, 31, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.619178', 2527, 32, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.624172', 2528, 32, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.632175', 2529, 32, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.640194', 2530, 32, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.648398', 2531, 32, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.655300', 2532, 32, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.662199', 2533, 33, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.668191', 2534, 33, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.675181', 2535, 33, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.681192', 2536, 33, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.688184', 2537, 33, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.694177', 2538, 33, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.700190', 2539, 34, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.706173', 2540, 34, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.714180', 2541, 34, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.720195', 2542, 34, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.727416', 2543, 34, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.733204', 2544, 34, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.740192', 2545, 35, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.747182', 2546, 35, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.753203', 2547, 35, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.760184', 2548, 35, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.767183', 2549, 35, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.773177', 2550, 35, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.780195', 2551, 36, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.787180', 2552, 36, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.794195', 2553, 36, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.800186', 2554, 36, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.806275', 2555, 36, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.813240', 2556, 36, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.819176', 2557, 37, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.824217', 2558, 37, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.830182', 2559, 37, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.835394', 2560, 37, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.841176', 2561, 37, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.857173', 2562, 37, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.862226', 2563, 38, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.868228', 2564, 38, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.874317', 2565, 38, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.880183', 2566, 38, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.886219', 2567, 38, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.893176', 2568, 38, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.900190', 2569, 39, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.907277', 2570, 39, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.915580', 2571, 39, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.922194', 2572, 39, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.930189', 2573, 39, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.936232', 2574, 39, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.942188', 2575, 40, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.949197', 2576, 40, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.956272', 2577, 40, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:44.964176', 2578, 40, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:44.972178', 2579, 40, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:44.979178', 2580, 40, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:44.985178', 2581, 41, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:44.992174', 2582, 41, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:44.999182', 2583, 41, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.005249', 2584, 41, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.011195', 2585, 41, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.018175', 2586, 41, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.026195', 2587, 42, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.033180', 2588, 42, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.038177', 2589, 42, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.043326', 2590, 42, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.049178', 2591, 42, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.056171', 2592, 42, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.063180', 2593, 43, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.071181', 2594, 43, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.080182', 2595, 43, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.087184', 2596, 43, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.094177', 2597, 43, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.100353', 2598, 43, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.106448', 2599, 44, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.112179', 2600, 44, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.118983', 2601, 44, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.124172', 2602, 44, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.131181', 2603, 44, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.136199', 2604, 44, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.142197', 2605, 45, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.149179', 2606, 45, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.155182', 2607, 45, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.161178', 2608, 45, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.167185', 2609, 45, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.172179', 2610, 45, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.180174', 2611, 46, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.186392', 2612, 46, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.193182', 2613, 46, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.199279', 2614, 46, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.205320', 2615, 46, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.211177', 2616, 46, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.216184', 2617, 47, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.221963', 2618, 47, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.226185', 2619, 47, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.231171', 2620, 47, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.235175', 2621, 47, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.240350', 2622, 47, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.245184', 2623, 48, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.250189', 2624, 48, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.256348', 2625, 48, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.262186', 2626, 48, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.269177', 2627, 48, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.275179', 2628, 48, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.281181', 2629, 49, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.288184', 2630, 49, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.294183', 2631, 49, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.301173', 2632, 49, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.307376', 2633, 49, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.313348', 2634, 49, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.320182', 2635, 50, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.326408', 2636, 50, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.332256', 2637, 50, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.339179', 2638, 50, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.345176', 2639, 50, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.352408', 2640, 50, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.358178', 2641, 51, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.364183', 2642, 51, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.370183', 2643, 51, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.376183', 2644, 51, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.382180', 2645, 51, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.388174', 2646, 51, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.394175', 2647, 52, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.400179', 2648, 52, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.406184', 2649, 52, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.412351', 2650, 52, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.417181', 2651, 52, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.423198', 2652, 52, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.428176', 2653, 53, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.433238', 2654, 53, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.438175', 2655, 53, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.442191', 2656, 53, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.447175', 2657, 53, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.452178', 2658, 53, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.457174', 2659, 54, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.462176', 2660, 54, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.466448', 2661, 54, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.471180', 2662, 54, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.475183', 2663, 54, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.480238', 2664, 54, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.486301', 2665, 55, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.491191', 2666, 55, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.496377', 2667, 55, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.501262', 2668, 55, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.507223', 2669, 55, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.512175', 2670, 55, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.518195', 2671, 56, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.524172', 2672, 56, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.531173', 2673, 56, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.538174', 2674, 56, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.546177', 2675, 56, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.553180', 2676, 56, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.559174', 2677, 57, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.565296', 2678, 57, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.572194', 2679, 57, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.578199', 2680, 57, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.584187', 2681, 57, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.591201', 2682, 57, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.597194', 2683, 58, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.604171', 2684, 58, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.610187', 2685, 58, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.616249', 2686, 58, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.622236', 2687, 58, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.628236', 2688, 58, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.633481', 2689, 59, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.639225', 2690, 59, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.644223', 2691, 59, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.649191', 2692, 59, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.654222', 2693, 59, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.659188', 2694, 59, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.663222', 2695, 60, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.669180', 2696, 60, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.673189', 2697, 60, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.678269', 2698, 60, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.683175', 2699, 60, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.689184', 2700, 60, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.694181', 2701, 61, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.700173', 2702, 61, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.706605', 2703, 61, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.712188', 2704, 61, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.717191', 2705, 61, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.724182', 2706, 61, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.731187', 2707, 62, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.737356', 2708, 62, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.743172', 2709, 62, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.749197', 2710, 62, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.756223', 2711, 62, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.762182', 2712, 62, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.769192', 2713, 63, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.775236', 2714, 63, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.782175', 2715, 63, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.790191', 2716, 63, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.797170', 2717, 63, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.804202', 2718, 63, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.810179', 2719, 64, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.816356', 2720, 64, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.823245', 2721, 64, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.831200', 2722, 64, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.839360', 2723, 64, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.846370', 2724, 64, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.854191', 2725, 65, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.860182', 2726, 65, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.866173', 2727, 65, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.871170', 2728, 65, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.876202', 2729, 65, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.881171', 2730, 65, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.885178', 2731, 66, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.889188', 2732, 66, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.894174', 2733, 66, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.898177', 2734, 66, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.903318', 2735, 66, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.909184', 2736, 66, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.915187', 2737, 67, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.920180', 2738, 67, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.924290', 2739, 67, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.930172', 2740, 67, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.935179', 2741, 67, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.941177', 2742, 67, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.946187', 2743, 68, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.952173', 2744, 68, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.957174', 2745, 68, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:45.964175', 2746, 68, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:45.970185', 2747, 68, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:45.977177', 2748, 68, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:45.982177', 2749, 69, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:45.989318', 2750, 69, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:45.995178', 2751, 69, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.001349', 2752, 69, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.007336', 2753, 69, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.013173', 2754, 69, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.019202', 2755, 70, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.024178', 2756, 70, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.030211', 2757, 70, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.035231', 2758, 70, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.040174', 2759, 70, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.045324', 2760, 70, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.050270', 2761, 71, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.055349', 2762, 71, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.060190', 2763, 71, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.065381', 2764, 71, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.070279', 2765, 71, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.075246', 2766, 71, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.081178', 2767, 72, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.087179', 2768, 72, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.092194', 2769, 72, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.098365', 2770, 72, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.104185', 2771, 72, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.110596', 2772, 72, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.116191', 2773, 73, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.122187', 2774, 73, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.129197', 2775, 73, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.134190', 2776, 73, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.140186', 2777, 73, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.146174', 2778, 73, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.152361', 2779, 74, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.158207', 2780, 74, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.164188', 2781, 74, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.170186', 2782, 74, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.176209', 2783, 74, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.182180', 2784, 74, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.188204', 2785, 75, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.194204', 2786, 75, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.200379', 2787, 75, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.206183', 2788, 75, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.213245', 2789, 75, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.219182', 2790, 75, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.224199', 2791, 76, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.230250', 2792, 76, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.236222', 2793, 76, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.241608', 2794, 76, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.247245', 2795, 76, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.252189', 2796, 76, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.258192', 2797, 77, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.263233', 2798, 77, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.268482', 2799, 77, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.273184', 2800, 77, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.278310', 2801, 77, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.283189', 2802, 77, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-01 17:44:46.288263', 2803, 78, NULL, 6, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-01 17:44:46.294195', 2804, 78, NULL, 6, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-01 17:44:46.299196', 2805, 78, NULL, 6, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-01 17:44:46.305186', 2806, 78, NULL, 6, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-01 17:44:46.311179', 2807, 78, NULL, 6, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-01 17:44:46.316325', 2808, 78, NULL, 6, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.777260', 3745, 1, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.780278', 3746, 1, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.783259', 3747, 1, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.785259', 3748, 1, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.787260', 3749, 1, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.790263', 3750, 1, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.792262', 3751, 2, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.794262', 3752, 2, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.797266', 3753, 2, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.800260', 3754, 2, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.802264', 3755, 2, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.805262', 3756, 2, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.808262', 3757, 3, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.810260', 3758, 3, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.812259', 3759, 3, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.815283', 3760, 3, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.817278', 3761, 3, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.819264', 3762, 3, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.821284', 3763, 4, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.823279', 3764, 4, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.825279', 3765, 4, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.827278', 3766, 4, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.829260', 3767, 4, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.832268', 3768, 4, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.836270', 3769, 5, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.840270', 3770, 5, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.844264', 3771, 5, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.847267', 3772, 5, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.850260', 3773, 5, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.852296', 3774, 5, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.855266', 3775, 6, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.858263', 3776, 6, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.860296', 3777, 6, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.863265', 3778, 6, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.866259', 3779, 6, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.868296', 3780, 6, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.871281', 3781, 7, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.874261', 3782, 7, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.876261', 3783, 7, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.879263', 3784, 7, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.882261', 3785, 7, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.884260', 3786, 7, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.887265', 3787, 8, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.890261', 3788, 8, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.892260', 3789, 8, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.894263', 3790, 8, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.896289', 3791, 8, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.899260', 3792, 8, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.901261', 3793, 9, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.903264', 3794, 9, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.906263', 3795, 9, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.909261', 3796, 9, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.911261', 3797, 9, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.914263', 3798, 9, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.916264', 3799, 10, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.918264', 3800, 10, NULL, 4, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-10 13:21:28.921263', 3801, 10, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.923262', 3802, 10, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.925261', 3803, 10, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.927260', 3804, 10, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.930264', 3805, 11, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.932261', 3806, 11, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.934261', 3807, 11, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.937265', 3808, 11, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.939262', 3809, 11, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.942260', 3810, 11, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.944264', 3811, 12, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.946269', 3812, 12, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.948264', 3813, 12, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.950261', 3814, 12, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.952266', 3815, 12, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.954260', 3816, 12, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.956262', 3817, 13, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.958263', 3818, 13, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.960280', 3819, 13, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.962262', 3820, 13, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.965260', 3821, 13, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.966261', 3822, 13, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.968262', 3823, 14, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.983258', 3824, 14, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:28.985260', 3825, 14, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:28.988266', 3826, 14, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:28.991260', 3827, 14, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:28.993259', 3828, 14, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:28.996277', 3829, 15, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:28.999259', 3830, 15, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.001265', 3831, 15, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.005285', 3832, 15, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.007261', 3833, 15, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.009261', 3834, 15, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.012269', 3835, 16, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.015261', 3836, 16, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.017260', 3837, 16, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.021266', 3838, 16, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.024260', 3839, 16, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.026262', 3840, 16, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.029269', 3841, 17, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.032261', 3842, 17, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.034260', 3843, 17, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.038270', 3844, 17, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.040263', 3845, 17, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.042264', 3846, 17, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.047282', 3847, 18, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.050266', 3848, 18, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.053277', 3849, 18, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.057262', 3850, 18, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.070279', 3851, 18, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.074259', 3852, 18, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.076261', 3853, 19, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.079268', 3854, 19, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.082261', 3855, 19, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.085260', 3856, 19, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.088263', 3857, 19, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.090268', 3858, 19, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.093278', 3859, 20, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.096265', 3860, 20, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.099261', 3861, 20, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.101258', 3862, 20, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.104268', 3863, 20, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.107263', 3864, 20, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.110262', 3865, 21, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.114264', 3866, 21, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.117259', 3867, 21, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.119260', 3868, 21, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.121261', 3869, 21, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.124262', 3870, 21, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.126260', 3871, 22, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.128261', 3872, 22, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.131260', 3873, 22, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.133261', 3874, 22, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.135258', 3875, 22, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.138262', 3876, 22, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.141259', 3877, 23, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.143259', 3878, 23, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.146268', 3879, 23, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.148259', 3880, 23, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.150259', 3881, 23, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.152260', 3882, 23, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.156259', 3883, 24, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.158260', 3884, 24, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.160262', 3885, 24, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.162259', 3886, 24, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.165261', 3887, 24, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.167259', 3888, 24, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.168259', 3889, 25, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.171282', 3890, 25, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.174260', 3891, 25, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.176258', 3892, 25, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.178258', 3893, 25, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.180260', 3894, 25, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.182259', 3895, 26, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.184259', 3896, 26, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.186262', 3897, 26, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.190261', 3898, 26, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.192261', 3899, 26, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.195261', 3900, 26, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.198261', 3901, 27, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.200265', 3902, 27, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.203264', 3903, 27, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.208274', 3904, 27, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.211263', 3905, 27, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.214269', 3906, 27, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.217259', 3907, 28, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.219260', 3908, 28, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.224264', 3909, 28, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.226261', 3910, 28, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.230270', 3911, 28, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.233260', 3912, 28, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.236262', 3913, 29, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.240269', 3914, 29, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.243262', 3915, 29, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.246263', 3916, 29, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.250260', 3917, 29, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.252265', 3918, 29, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.256265', 3919, 30, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.259262', 3920, 30, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.261260', 3921, 30, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.265265', 3922, 30, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.267264', 3923, 30, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.270263', 3924, 30, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.274268', 3925, 31, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.277262', 3926, 31, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.280289', 3927, 31, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.283261', 3928, 31, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.285259', 3929, 31, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.289262', 3930, 31, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.292267', 3931, 32, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.294265', 3932, 32, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.298263', 3933, 32, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.301260', 3934, 32, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.304266', 3935, 32, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.307261', 3936, 32, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.309259', 3937, 33, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.311260', 3938, 33, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.314267', 3939, 33, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.317261', 3940, 33, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.318259', 3941, 33, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.321263', 3942, 33, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.324260', 3943, 34, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.326260', 3944, 34, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.328259', 3945, 34, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.332261', 3946, 34, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.334258', 3947, 34, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.336261', 3948, 34, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.340272', 3949, 35, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.342259', 3950, 35, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.344261', 3951, 35, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.347263', 3952, 35, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.350261', 3953, 35, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.352261', 3954, 35, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.354261', 3955, 36, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.357262', 3956, 36, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.359261', 3957, 36, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.361262', 3958, 36, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.364262', 3959, 36, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.366259', 3960, 36, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.369262', 3961, 37, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.371261', 3962, 37, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.374260', 3963, 37, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.376258', 3964, 37, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.379264', 3965, 37, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.382263', 3966, 37, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.384262', 3967, 38, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.387261', 3968, 38, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.390270', 3969, 38, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.392260', 3970, 38, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.395265', 3971, 38, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.398280', 3972, 38, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.401259', 3973, 39, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.404263', 3974, 39, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.409260', 3975, 39, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.413276', 3976, 39, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.416259', 3977, 39, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.418265', 3978, 39, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.421266', 3979, 40, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.425262', 3980, 40, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.427261', 3981, 40, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.430272', 3982, 40, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.433264', 3983, 40, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.436262', 3984, 40, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.441264', 3985, 41, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.444258', 3986, 41, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.448266', 3987, 41, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.451259', 3988, 41, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.454264', 3989, 41, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.457269', 3990, 41, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.459259', 3991, 42, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.462264', 3992, 42, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.466264', 3993, 42, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.468271', 3994, 42, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.471268', 3995, 42, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.475260', 3996, 42, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.477264', 3997, 43, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.481261', 3998, 43, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.484267', 3999, 43, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.486261', 4000, 43, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.491261', 4001, 43, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.493264', 4002, 43, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.496280', 4003, 44, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.500265', 4004, 44, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.502264', 4005, 44, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.507265', 4006, 44, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.510260', 4007, 44, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.512268', 4008, 44, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.515261', 4009, 45, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.517260', 4010, 45, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.519260', 4011, 45, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.522273', 4012, 45, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.524261', 4013, 45, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.526260', 4014, 45, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.528259', 4015, 46, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.531261', 4016, 46, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.533261', 4017, 46, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.535258', 4018, 46, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.539263', 4019, 46, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.542260', 4020, 46, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.544258', 4021, 47, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.546274', 4022, 47, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.548263', 4023, 47, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.550261', 4024, 47, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.552262', 4025, 47, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.555265', 4026, 47, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.557259', 4027, 48, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.559260', 4028, 48, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.561258', 4029, 48, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.563277', 4030, 48, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.566259', 4031, 48, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.568259', 4032, 48, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.570260', 4033, 49, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.573265', 4034, 49, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.575288', 4035, 49, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.577287', 4036, 49, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.579263', 4037, 49, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.582260', 4038, 49, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.583260', 4039, 50, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.585289', 4040, 50, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.587264', 4041, 50, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.590261', 4042, 50, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.592260', 4043, 50, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.594259', 4044, 50, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.597270', 4045, 51, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.599265', 4046, 51, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.601258', 4047, 51, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.604265', 4048, 51, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.608267', 4049, 51, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.611264', 4050, 51, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.615277', 4051, 52, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.618261', 4052, 52, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.621265', 4053, 52, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.625263', 4054, 52, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.627266', 4055, 52, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.630273', 4056, 52, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.633261', 4057, 53, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.635260', 4058, 53, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.639264', 4059, 53, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.642262', 4060, 53, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.644259', 4061, 53, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.648270', 4062, 53, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.650260', 4063, 54, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.653260', 4064, 54, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.656267', 4065, 54, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.658259', 4066, 54, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.660260', 4067, 54, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.665275', 4068, 54, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.667261', 4069, 55, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.670265', 4070, 55, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.674270', 4071, 55, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.677265', 4072, 55, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.680262', 4073, 55, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.682263', 4074, 55, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.685259', 4075, 56, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.688261', 4076, 56, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.691259', 4077, 56, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.693265', 4078, 56, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.696261', 4079, 56, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.699261', 4080, 56, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.701260', 4081, 57, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.705269', 4082, 57, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.707259', 4083, 57, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.710259', 4084, 57, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.712280', 4085, 57, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.715259', 4086, 57, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.716259', 4087, 58, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.718287', 4088, 58, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.720260', 4089, 58, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.723260', 4090, 58, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.725261', 4091, 58, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.726260', 4092, 58, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.728280', 4093, 59, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.731262', 4094, 59, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.733260', 4095, 59, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.735274', 4096, 59, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.737262', 4097, 59, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.740259', 4098, 59, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.742261', 4099, 60, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.743261', 4100, 60, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.745261', 4101, 60, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.748280', 4102, 60, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.750274', 4103, 60, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.752259', 4104, 60, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.754261', 4105, 61, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.756260', 4106, 61, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.758261', 4107, 61, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.759259', 4108, 61, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.761279', 4109, 61, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.764295', 4110, 61, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.766259', 4111, 62, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.768278', 4112, 62, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.770261', 4113, 62, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.773285', 4114, 62, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.775288', 4115, 62, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.777279', 4116, 62, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.779264', 4117, 63, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.782302', 4118, 63, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.784292', 4119, 63, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.788284', 4120, 63, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.793271', 4121, 63, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.797268', 4122, 63, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.802268', 4123, 64, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.808273', 4124, 64, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.813279', 4125, 64, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.818280', 4126, 64, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.822276', 4127, 64, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.826263', 4128, 64, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.829273', 4129, 65, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.832273', 4130, 65, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.835260', 4131, 65, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.840266', 4132, 65, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.842263', 4133, 65, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.845264', 4134, 65, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.848267', 4135, 66, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.851261', 4136, 66, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.854272', 4137, 66, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.856281', 4138, 66, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.859261', 4139, 66, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.861279', 4140, 66, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.864296', 4141, 67, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.866260', 4142, 67, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.869266', 4143, 67, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.872262', 4144, 67, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.875262', 4145, 67, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.877260', 4146, 67, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.879279', 4147, 68, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.882262', 4148, 68, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.884271', 4149, 68, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.887267', 4150, 68, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.890259', 4151, 68, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.892261', 4152, 68, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.894269', 4153, 69, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.898263', 4154, 69, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.900261', 4155, 69, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.902260', 4156, 69, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.905268', 4157, 69, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.908263', 4158, 69, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.910263', 4159, 70, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.913284', 4160, 70, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.916261', 4161, 70, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.918264', 4162, 70, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.920268', 4163, 70, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.923283', 4164, 70, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.925278', 4165, 71, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.927274', 4166, 71, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.929263', 4167, 71, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.932258', 4168, 71, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.934279', 4169, 71, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.936280', 4170, 71, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.939261', 4171, 72, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.941259', 4172, 72, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.942281', 4173, 72, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.944278', 4174, 72, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.947261', 4175, 72, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.949259', 4176, 72, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.950281', 4177, 73, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.952281', 4178, 73, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.954263', 4179, 73, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.956280', 4180, 73, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.958279', 4181, 73, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.959259', 4182, 73, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.961287', 4183, 74, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.964286', 4184, 74, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.966259', 4185, 74, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.968292', 4186, 74, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.970260', 4187, 74, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.973259', 4188, 74, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.975278', 4189, 75, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.977259', 4190, 75, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.979262', 4191, 75, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.981289', 4192, 75, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.983278', 4193, 75, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.985259', 4194, 75, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.986287', 4195, 76, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:29.989286', 4196, 76, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:29.991278', 4197, 76, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:29.993259', 4198, 76, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:29.995263', 4199, 76, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:29.997266', 4200, 76, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:29.999260', 4201, 77, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:30.001260', 4202, 77, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:30.004265', 4203, 77, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:30.007259', 4204, 77, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:30.009259', 4205, 77, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:30.012278', 4206, 77, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:21:30.015262', 4207, 78, NULL, 4, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:21:30.018261', 4208, 78, NULL, 4, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:21:30.020266', 4209, 78, NULL, 4, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:21:30.023273', 4210, 78, NULL, 4, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:21:30.025260', 4211, 78, NULL, 4, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:21:30.028262', 4212, 78, NULL, 4, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:10.928059', 4213, 1, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:10.952060', 4214, 1, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:10.963098', 4215, 1, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:10.975062', 4216, 1, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:10.986098', 4217, 1, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:10.998060', 4218, 1, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.011062', 4219, 2, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.025059', 4220, 2, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.036059', 4221, 2, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.048062', 4222, 2, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.058396', 4223, 2, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.069396', 4224, 2, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.080398', 4225, 3, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.096398', 4226, 3, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.108396', 4227, 3, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.118410', 4228, 3, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.128395', 4229, 3, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.137396', 4230, 3, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.147397', 4231, 4, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.157398', 4232, 4, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.167398', 4233, 4, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.177456', 4234, 4, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.186397', 4235, 4, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.196396', 4236, 4, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.207398', 4237, 5, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.216396', 4238, 5, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.225395', 4239, 5, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.235398', 4240, 5, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.243395', 4241, 5, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.253480', 4242, 5, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.261434', 4243, 6, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.271433', 4244, 6, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.280434', 4245, 6, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.290479', 4246, 6, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.298807', 4247, 6, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.308807', 4248, 6, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.316807', 4249, 7, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.325807', 4250, 7, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.335810', 4251, 7, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.344846', 4252, 7, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.353809', 4253, 7, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.362808', 4254, 7, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.373810', 4255, 8, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.381809', 4256, 8, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.390809', 4257, 8, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.399808', 4258, 8, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.407809', 4259, 8, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.416847', 4260, 8, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.424848', 4261, 9, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.433808', 4262, 9, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.441830', 4263, 9, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.450807', 4264, 9, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.459806', 4265, 9, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.468808', 4266, 9, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.476806', 4267, 10, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.494853', 4268, 10, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.505809', 4269, 10, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.515807', 4270, 10, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.523807', 4271, 10, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.532808', 4272, 10, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.541810', 4273, 11, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.549813', 4274, 11, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.558807', 4275, 11, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.566807', 4276, 11, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.586844', 4277, 11, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.596808', 4278, 11, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.605807', 4279, 12, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.613809', 4280, 12, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.621809', 4281, 12, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.640810', 4282, 12, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.650809', 4283, 12, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.658815', 4284, 12, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.666806', 4285, 13, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.674809', 4286, 13, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.682807', 4287, 13, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.699811', 4288, 13, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.709808', 4289, 13, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.718806', 4290, 13, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.725808', 4291, 14, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.734807', 4292, 14, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.742807', 4293, 14, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.750808', 4294, 14, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.758807', 4295, 14, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.766808', 4296, 14, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.775809', 4297, 15, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.783807', 4298, 15, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.790807', 4299, 15, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.798809', 4300, 15, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.806808', 4301, 15, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.813808', 4302, 15, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.821808', 4303, 16, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.829809', 4304, 16, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.837808', 4305, 16, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.845806', 4306, 16, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.852809', 4307, 16, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.869811', 4308, 16, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.878810', 4309, 17, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.886807', 4310, 17, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.904813', 4311, 17, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.914811', 4312, 17, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.922907', 4313, 17, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.930877', 4314, 17, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.939909', 4315, 18, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.946866', 4316, 18, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.954863', 4317, 18, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:11.961863', 4318, 18, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:11.968864', 4319, 18, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:11.975899', 4320, 18, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:11.983865', 4321, 19, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:11.990873', 4322, 19, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:11.998865', 4323, 19, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.005866', 4324, 19, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.013866', 4325, 19, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.020864', 4326, 19, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.027904', 4327, 20, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.034864', 4328, 20, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.042863', 4329, 20, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.049866', 4330, 20, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.056865', 4331, 20, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.064866', 4332, 20, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.071863', 4333, 21, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.089911', 4334, 21, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.100865', 4335, 21, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.107864', 4336, 21, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.114864', 4337, 21, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.121864', 4338, 21, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.130876', 4339, 22, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.137873', 4340, 22, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.144863', 4341, 22, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.151886', 4342, 22, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.158886', 4343, 22, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.165891', 4344, 22, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.172889', 4345, 23, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.179888', 4346, 23, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.186886', 4347, 23, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.193888', 4348, 23, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.200891', 4349, 23, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.207888', 4350, 23, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.214887', 4351, 24, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.220887', 4352, 24, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.227886', 4353, 24, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.234886', 4354, 24, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.240988', 4355, 24, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.247951', 4356, 24, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.253989', 4357, 25, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.260948', 4358, 25, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.267948', 4359, 25, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.273986', 4360, 25, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.280947', 4361, 25, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.286989', 4362, 25, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.292948', 4363, 26, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.299954', 4364, 26, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.306951', 4365, 26, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.312948', 4366, 26, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.319949', 4367, 26, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.325947', 4368, 26, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.332949', 4369, 27, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.339949', 4370, 27, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.346949', 4371, 27, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.352986', 4372, 27, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.360948', 4373, 27, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.368949', 4374, 27, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.374988', 4375, 28, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.381948', 4376, 28, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.387950', 4377, 28, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.394950', 4378, 28, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.400948', 4379, 28, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.408949', 4380, 28, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.414962', 4381, 29, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.421949', 4382, 29, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.428992', 4383, 29, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.435949', 4384, 29, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.441949', 4385, 29, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.447948', 4386, 29, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.454167', 4387, 30, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.461165', 4388, 30, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.467165', 4389, 30, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.474164', 4390, 30, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.480169', 4391, 30, NULL, 52, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 6, '2024-06-10 13:30:12.486164', 4392, 30, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.492164', 4393, 31, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.498167', 4394, 31, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.504163', 4395, 31, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.511163', 4396, 31, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.517164', 4397, 31, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.523164', 4398, 31, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.529164', 4399, 32, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.536164', 4400, 32, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.542166', 4401, 32, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.549165', 4402, 32, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.555164', 4403, 32, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.561163', 4404, 32, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.568169', 4405, 33, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.574165', 4406, 33, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.580167', 4407, 33, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.586164', 4408, 33, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.591167', 4409, 33, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.599165', 4410, 33, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.605165', 4411, 34, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.611164', 4412, 34, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.616165', 4413, 34, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.622164', 4414, 34, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.637169', 4415, 34, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.646166', 4416, 34, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.653164', 4417, 35, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.659163', 4418, 35, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.666164', 4419, 35, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.672176', 4420, 35, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.678162', 4421, 35, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.684166', 4422, 35, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.690164', 4423, 36, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.695165', 4424, 36, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.701165', 4425, 36, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.707164', 4426, 36, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.720170', 4427, 36, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.729168', 4428, 36, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.737165', 4429, 37, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.743165', 4430, 37, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.749164', 4431, 37, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.754165', 4432, 37, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.760164', 4433, 37, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.767166', 4434, 37, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.773164', 4435, 38, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.778163', 4436, 38, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.784413', 4437, 38, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.790417', 4438, 38, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.796414', 4439, 38, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.803412', 4440, 38, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.808412', 4441, 39, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.814411', 4442, 39, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.820414', 4443, 39, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.825437', 4444, 39, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.832440', 4445, 39, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.845443', 4446, 39, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.860445', 4447, 40, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.869441', 4448, 40, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.875437', 4449, 40, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.882439', 4450, 40, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.888439', 4451, 40, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.893437', 4452, 40, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.899441', 4453, 41, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.905443', 4454, 41, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.910437', 4455, 41, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.916438', 4456, 41, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.921439', 4457, 41, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.935444', 4458, 41, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.947442', 4459, 42, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:12.955444', 4460, 42, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:12.962439', 4461, 42, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:12.977446', 4462, 42, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:12.985439', 4463, 42, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:12.992441', 4464, 42, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:12.998442', 4465, 43, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.005439', 4466, 43, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.014440', 4467, 43, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.020439', 4468, 43, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.026437', 4469, 43, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.032441', 4470, 43, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.045444', 4471, 44, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.053442', 4472, 44, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.060438', 4473, 44, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.066438', 4474, 44, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.071440', 4475, 44, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.085445', 4476, 44, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.094444', 4477, 45, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.101440', 4478, 45, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.108438', 4479, 45, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.116437', 4480, 45, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.122438', 4481, 45, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.134444', 4482, 45, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.143444', 4483, 46, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.150442', 4484, 46, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.156439', 4485, 46, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.161437', 4486, 46, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.166439', 4487, 46, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.171440', 4488, 46, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.184449', 4489, 47, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.192442', 4490, 47, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.200442', 4491, 47, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.206440', 4492, 47, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.211437', 4493, 47, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.216437', 4494, 47, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.221506', 4495, 48, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.234550', 4496, 48, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.243551', 4497, 48, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.249505', 4498, 48, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.255548', 4499, 48, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.260556', 4500, 48, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.265539', 4501, 49, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.271507', 4502, 49, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.276501', 4503, 49, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.281501', 4504, 49, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.286502', 4505, 49, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.291505', 4506, 49, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.296501', 4507, 50, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.301543', 4508, 50, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.306560', 4509, 50, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.311541', 4510, 50, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.316542', 4511, 50, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.321543', 4512, 50, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.334548', 4513, 51, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.342547', 4514, 51, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.349545', 4515, 51, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.355560', 4516, 51, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.360544', 4517, 51, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.365545', 4518, 51, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.371544', 4519, 52, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.384548', 4520, 52, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.392548', 4521, 52, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.399546', 4522, 52, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.405548', 4523, 52, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.410544', 4524, 52, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.415543', 4525, 53, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.419544', 4526, 53, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.425543', 4527, 53, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.430555', 4528, 53, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.436542', 4529, 53, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.441576', 4530, 53, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.446588', 4531, 54, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.460593', 4532, 54, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.469594', 4533, 54, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.475591', 4534, 54, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.482589', 4535, 54, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.493599', 4536, 54, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.501590', 4537, 55, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.507633', 4538, 55, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.513620', 4539, 55, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.518629', 4540, 55, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.523626', 4541, 55, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.544595', 4542, 55, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.551630', 4543, 56, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.558626', 4544, 56, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.564593', 4545, 56, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.569628', 4546, 56, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.575588', 4547, 56, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.580590', 4548, 56, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.585627', 4549, 57, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.590588', 4550, 57, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.594645', 4551, 57, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.600589', 4552, 57, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.606595', 4553, 57, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.611587', 4554, 57, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.617588', 4555, 58, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.622591', 4556, 58, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.627591', 4557, 58, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.633588', 4558, 58, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.638595', 4559, 58, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.643633', 4560, 58, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.649632', 4561, 59, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.654590', 4562, 59, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.660589', 4563, 59, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.666595', 4564, 59, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.672603', 4565, 59, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.677588', 4566, 59, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.681643', 4567, 60, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.686590', 4568, 60, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.691630', 4569, 60, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.697591', 4570, 60, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.702635', 4571, 60, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.707629', 4572, 60, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.712607', 4573, 61, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.717605', 4574, 61, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.722605', 4575, 61, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.733616', 4576, 61, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.743607', 4577, 61, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.749607', 4578, 61, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.755608', 4579, 62, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.759604', 4580, 62, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.765608', 4581, 62, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.770607', 4582, 62, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.775605', 4583, 62, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.781608', 4584, 62, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.785604', 4585, 63, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.790607', 4586, 63, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.795608', 4587, 63, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.802608', 4588, 63, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.807606', 4589, 63, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.812609', 4590, 63, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.817605', 4591, 64, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.822606', 4592, 64, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.827606', 4593, 64, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.834606', 4594, 64, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.841606', 4595, 64, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.847606', 4596, 64, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.852606', 4597, 65, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.856607', 4598, 65, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.861607', 4599, 65, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.867607', 4600, 65, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.872607', 4601, 65, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.883615', 4602, 65, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.890611', 4603, 66, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.897611', 4604, 66, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.903609', 4605, 66, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.908606', 4606, 66, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.913606', 4607, 66, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.917605', 4608, 66, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.922606', 4609, 67, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.927607', 4610, 67, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.932606', 4611, 67, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.937608', 4612, 67, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.942605', 4613, 67, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.952615', 4614, 67, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.960610', 4615, 68, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:13.966612', 4616, 68, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:13.974610', 4617, 68, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:13.980614', 4618, 68, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:13.984606', 4619, 68, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:13.991606', 4620, 68, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:13.996610', 4621, 69, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.002606', 4622, 69, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.007605', 4623, 69, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.012620', 4624, 69, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.018608', 4625, 69, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.023605', 4626, 69, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.029608', 4627, 70, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.034605', 4628, 70, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.040608', 4629, 70, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.045608', 4630, 70, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.050606', 4631, 70, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.056607', 4632, 70, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.060605', 4633, 71, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.066606', 4634, 71, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.072606', 4635, 71, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.077605', 4636, 71, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.083606', 4637, 71, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.088618', 4638, 71, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.093605', 4639, 72, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.099607', 4640, 72, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.103606', 4641, 72, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.108606', 4642, 72, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.114606', 4643, 72, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.118605', 4644, 72, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.123606', 4645, 73, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.127605', 4646, 73, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.132604', 4647, 73, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.138624', 4648, 73, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.142604', 4649, 73, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.148609', 4650, 73, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.153606', 4651, 74, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.158606', 4652, 74, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.164609', 4653, 74, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.169608', 4654, 74, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.184604', 4655, 74, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.189605', 4656, 74, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.194605', 4657, 75, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.200605', 4658, 75, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.206604', 4659, 75, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.210605', 4660, 75, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.215604', 4661, 75, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.221607', 4662, 75, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.226606', 4663, 76, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.232606', 4664, 76, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.238607', 4665, 76, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.242606', 4666, 76, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.248606', 4667, 76, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.252606', 4668, 76, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.258607', 4669, 77, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.264608', 4670, 77, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.269606', 4671, 77, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.274606', 4672, 77, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.279610', 4673, 77, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.284605', 4674, 77, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:30:14.289604', 4675, 78, NULL, 52, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:30:14.294604', 4676, 78, NULL, 52, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:30:14.300605', 4677, 78, NULL, 52, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:30:14.306606', 4678, 78, NULL, 52, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:30:14.311606', 4679, 78, NULL, 52, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:30:14.316606', 4680, 78, NULL, 52, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.025820', 4681, 1, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.047860', 4682, 1, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.058821', 4683, 1, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.070819', 4684, 1, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.083832', 4685, 1, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.094820', 4686, 1, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.105816', 4687, 2, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.121816', 4688, 2, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.132821', 4689, 2, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.144817', 4690, 2, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.155815', 4691, 2, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.167820', 4692, 2, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.178819', 4693, 3, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.190816', 4694, 3, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.201819', 4695, 3, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.214819', 4696, 3, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.225814', 4697, 3, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.237823', 4698, 3, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.258818', 4699, 4, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.269819', 4700, 4, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.280823', 4701, 4, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.291818', 4702, 4, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.302821', 4703, 4, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.311820', 4704, 4, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.321816', 4705, 5, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.331817', 4706, 5, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.342820', 4707, 5, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.357818', 4708, 5, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.368819', 4709, 5, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.381820', 4710, 5, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.389818', 4711, 6, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.400816', 4712, 6, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.408821', 4713, 6, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.417815', 4714, 6, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.427822', 4715, 6, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.437820', 4716, 6, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.448819', 4717, 7, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.458821', 4718, 7, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.468821', 4719, 7, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.477819', 4720, 7, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.487831', 4721, 7, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.499818', 4722, 7, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.509820', 4723, 8, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.518820', 4724, 8, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.527816', 4725, 8, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.535816', 4726, 8, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.543813', 4727, 8, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.552819', 4728, 8, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.560815', 4729, 9, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.568817', 4730, 9, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.576817', 4731, 9, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.585818', 4732, 9, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.593815', 4733, 9, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.602843', 4734, 9, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.610818', 4735, 10, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.620815', 4736, 10, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.632827', 4737, 10, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.641821', 4738, 10, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.650818', 4739, 10, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.659822', 4740, 10, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.668816', 4741, 11, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.679818', 4742, 11, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.692817', 4743, 11, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.702815', 4744, 11, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.712818', 4745, 11, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.721822', 4746, 11, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.736815', 4747, 12, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.745817', 4748, 12, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.753817', 4749, 12, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.761820', 4750, 12, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.770818', 4751, 12, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.778818', 4752, 12, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.785816', 4753, 13, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.793816', 4754, 13, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.801818', 4755, 13, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.819824', 4756, 13, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.832817', 4757, 13, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.841822', 4758, 13, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.851859', 4759, 14, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.859818', 4760, 14, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.868817', 4761, 14, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.877815', 4762, 14, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.886815', 4763, 14, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.895820', 4764, 14, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.906821', 4765, 15, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.915815', 4766, 15, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.923821', 4767, 15, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.932820', 4768, 15, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.940818', 4769, 15, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.947821', 4770, 15, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:47.955821', 4771, 16, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:47.963821', 4772, 16, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:47.970817', 4773, 16, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:47.978817', 4774, 16, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:47.985817', 4775, 16, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:47.993818', 4776, 16, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.000814', 4777, 17, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.008818', 4778, 17, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.015820', 4779, 17, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.022815', 4780, 17, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.030819', 4781, 17, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.037816', 4782, 17, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.046823', 4783, 18, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.055818', 4784, 18, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.064822', 4785, 18, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.072821', 4786, 18, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.080821', 4787, 18, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.088816', 4788, 18, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.097824', 4789, 19, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.105826', 4790, 19, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.113821', 4791, 19, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.121823', 4792, 19, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.130822', 4793, 19, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.138824', 4794, 19, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.145819', 4795, 20, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.153816', 4796, 20, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.160820', 4797, 20, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.167817', 4798, 20, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.182830', 4799, 20, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.193817', 4800, 20, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.201814', 4801, 21, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.208819', 4802, 21, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.215814', 4803, 21, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.223818', 4804, 21, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.231819', 4805, 21, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.238818', 4806, 21, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.250816', 4807, 22, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.261822', 4808, 22, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.269822', 4809, 22, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.280820', 4810, 22, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.288826', 4811, 22, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.296821', 4812, 22, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.304819', 4813, 23, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.313821', 4814, 23, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.324817', 4815, 23, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.333815', 4816, 23, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.342819', 4817, 23, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.350820', 4818, 23, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.358819', 4819, 24, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.365818', 4820, 24, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.372820', 4821, 24, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.379817', 4822, 24, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.386818', 4823, 24, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.392818', 4824, 24, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.400815', 4825, 25, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.407818', 4826, 25, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.414818', 4827, 25, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.421821', 4828, 25, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.429820', 4829, 25, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.436818', 4830, 25, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.443816', 4831, 26, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.450821', 4832, 26, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.457822', 4833, 26, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.465828', 4834, 26, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.473822', 4835, 26, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.480821', 4836, 26, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.488834', 4837, 27, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.496817', 4838, 27, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.504818', 4839, 27, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.511819', 4840, 27, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.519821', 4841, 27, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.526818', 4842, 27, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.533825', 4843, 28, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.541822', 4844, 28, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.550817', 4845, 28, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.560814', 4846, 28, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.567817', 4847, 28, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.573924', 4848, 28, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.580985', 4849, 29, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.586983', 4850, 29, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.593986', 4851, 29, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.600985', 4852, 29, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.606988', 4853, 29, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.613989', 4854, 29, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.619985', 4855, 30, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.625985', 4856, 30, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.632985', 4857, 30, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.639987', 4858, 30, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.645985', 4859, 30, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.652988', 4860, 30, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.659986', 4861, 31, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.667987', 4862, 31, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.674986', 4863, 31, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.682984', 4864, 31, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.691984', 4865, 31, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.699991', 4866, 31, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.707985', 4867, 32, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.716982', 4868, 32, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.726983', 4869, 32, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.734984', 4870, 32, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.743985', 4871, 32, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.750985', 4872, 32, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.757984', 4873, 33, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.764984', 4874, 33, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.770986', 4875, 33, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.777983', 4876, 33, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.783982', 4877, 33, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.789987', 4878, 33, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.795985', 4879, 34, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.802984', 4880, 34, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.816989', 4881, 34, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.825988', 4882, 34, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.833984', 4883, 34, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.851985', 4884, 34, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.860987', 4885, 35, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.868984', 4886, 35, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.875981', 4887, 35, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.882982', 4888, 35, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.889989', 4889, 35, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.897982', 4890, 35, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.904985', 4891, 36, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.912987', 4892, 36, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.919989', 4893, 36, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.927986', 4894, 36, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.934988', 4895, 36, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.941988', 4896, 36, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.948992', 4897, 37, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.955990', 4898, 37, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:48.963985', 4899, 37, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:48.970985', 4900, 37, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:48.977987', 4901, 37, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:48.982985', 4902, 37, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:48.988987', 4903, 38, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:48.994983', 4904, 38, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.001982', 4905, 38, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.007984', 4906, 38, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.013984', 4907, 38, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.027222', 4908, 38, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.036212', 4909, 39, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.044212', 4910, 39, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.050210', 4911, 39, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.056212', 4912, 39, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.064219', 4913, 39, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.073209', 4914, 39, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.081209', 4915, 40, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.089215', 4916, 40, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.096213', 4917, 40, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.103209', 4918, 40, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.111210', 4919, 40, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.118212', 4920, 40, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.126223', 4921, 41, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.135210', 4922, 41, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.142212', 4923, 41, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.149208', 4924, 41, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.157213', 4925, 41, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.165212', 4926, 41, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.172209', 4927, 42, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.178207', 4928, 42, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.185206', 4929, 42, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.192207', 4930, 42, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.200211', 4931, 42, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.206207', 4932, 42, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.212208', 4933, 43, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.219211', 4934, 43, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.226211', 4935, 43, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.234210', 4936, 43, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.241206', 4937, 43, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.248209', 4938, 43, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.253209', 4939, 44, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.260207', 4940, 44, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.267209', 4941, 44, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.273210', 4942, 44, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.280214', 4943, 44, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.286211', 4944, 44, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.293209', 4945, 45, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.301210', 4946, 45, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.307212', 4947, 45, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.314208', 4948, 45, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.320212', 4949, 45, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.330224', 4950, 45, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.336211', 4951, 46, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.344231', 4952, 46, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.350207', 4953, 46, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.356210', 4954, 46, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.364210', 4955, 46, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.371226', 4956, 46, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.376211', 4957, 47, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.382210', 4958, 47, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.386209', 4959, 47, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.392208', 4960, 47, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.398210', 4961, 47, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.403209', 4962, 47, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.410208', 4963, 48, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.417208', 4964, 48, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.422214', 4965, 48, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.428212', 4966, 48, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.434213', 4967, 48, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.439215', 4968, 48, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.444210', 4969, 49, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.449208', 4970, 49, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.454209', 4971, 49, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.470214', 4972, 49, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.482220', 4973, 49, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.492214', 4974, 49, NULL, 102, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 1, '2024-06-10 13:35:49.501216', 4975, 50, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.508207', 4976, 50, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.515213', 4977, 50, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.522209', 4978, 50, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.529211', 4979, 50, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.536216', 4980, 50, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.542211', 4981, 51, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.549212', 4982, 51, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.556211', 4983, 51, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.563213', 4984, 51, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.570224', 4985, 51, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.577213', 4986, 51, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.583211', 4987, 52, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.588214', 4988, 52, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.594208', 4989, 52, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.599209', 4990, 52, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.605209', 4991, 52, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.610208', 4992, 52, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.615212', 4993, 53, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.621218', 4994, 53, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.627207', 4995, 53, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.634206', 4996, 53, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.639213', 4997, 53, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.644209', 4998, 53, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.649210', 4999, 54, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.655213', 5000, 54, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.660209', 5001, 54, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.668207', 5002, 54, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.675208', 5003, 54, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.688214', 5004, 54, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.698222', 5005, 55, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.705225', 5006, 55, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.712219', 5007, 55, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.718212', 5008, 55, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.725214', 5009, 55, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.732224', 5010, 55, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.738209', 5011, 56, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.745214', 5012, 56, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.751219', 5013, 56, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.758208', 5014, 56, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.765209', 5015, 56, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.771210', 5016, 56, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.777215', 5017, 57, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.785208', 5018, 57, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.791207', 5019, 57, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.804213', 5020, 57, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.813212', 5021, 57, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.822208', 5022, 57, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.830216', 5023, 58, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.836479', 5024, 58, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.841724', 5025, 58, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.846169', 5026, 58, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.858219', 5027, 58, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.871202', 5028, 58, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.881212', 5029, 59, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.889210', 5030, 59, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.898198', 5031, 59, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.907208', 5032, 59, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.916194', 5033, 59, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.925204', 5034, 59, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.932204', 5035, 60, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.940208', 5036, 60, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.947199', 5037, 60, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.954198', 5038, 60, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:49.961200', 5039, 60, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:49.968195', 5040, 60, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:49.974218', 5041, 61, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:49.980195', 5042, 61, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:49.986201', 5043, 61, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:49.994198', 5044, 61, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.006198', 5045, 61, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.013199', 5046, 61, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.023205', 5047, 62, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.031192', 5048, 62, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.036197', 5049, 62, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.042194', 5050, 62, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.046196', 5051, 62, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.051197', 5052, 62, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.056194', 5053, 63, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.061194', 5054, 63, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.066198', 5055, 63, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.071194', 5056, 63, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.077206', 5057, 63, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.082196', 5058, 63, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.101198', 5059, 64, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.107198', 5060, 64, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.113214', 5061, 64, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.118199', 5062, 64, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.128198', 5063, 64, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.134198', 5064, 64, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.139201', 5065, 65, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.144199', 5066, 65, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.149199', 5067, 65, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.153215', 5068, 65, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.158197', 5069, 65, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.163202', 5070, 65, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.168202', 5071, 66, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.172199', 5072, 66, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.177197', 5073, 66, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.182195', 5074, 66, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.187206', 5075, 66, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.191197', 5076, 66, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.197198', 5077, 67, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.201196', 5078, 67, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.205198', 5079, 67, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.209195', 5080, 67, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.214195', 5081, 67, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.218196', 5082, 67, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.222196', 5083, 68, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.226196', 5084, 68, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.231198', 5085, 68, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.235195', 5086, 68, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.239195', 5087, 68, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.250214', 5088, 68, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.263214', 5089, 69, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.276208', 5090, 69, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.284203', 5091, 69, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.290199', 5092, 69, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.296195', 5093, 69, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.302194', 5094, 69, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.306200', 5095, 70, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.313196', 5096, 70, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.321214', 5097, 70, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.326195', 5098, 70, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.350195', 5099, 70, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.364198', 5100, 70, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.383196', 5101, 71, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.399197', 5102, 71, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.407198', 5103, 71, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.413196', 5104, 71, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.419193', 5105, 71, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.425194', 5106, 71, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.431195', 5107, 72, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.438195', 5108, 72, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.444194', 5109, 72, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.448194', 5110, 72, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.452194', 5111, 72, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.457196', 5112, 72, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.461202', 5113, 73, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.467193', 5114, 73, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.471194', 5115, 73, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.476198', 5116, 73, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.482195', 5117, 73, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.486196', 5118, 73, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.493194', 5119, 74, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.499198', 5120, 74, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.504197', 5121, 74, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.510201', 5122, 74, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.516194', 5123, 74, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.523200', 5124, 74, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.530205', 5125, 75, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.537207', 5126, 75, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.542200', 5127, 75, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.549197', 5128, 75, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.555199', 5129, 75, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.560199', 5130, 75, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.566198', 5131, 76, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.572195', 5132, 76, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.577198', 5133, 76, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.584199', 5134, 76, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.589201', 5135, 76, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.595195', 5136, 76, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.602198', 5137, 77, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.609197', 5138, 77, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.614196', 5139, 77, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.619196', 5140, 77, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.624197', 5141, 77, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.630193', 5142, 77, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 13:35:50.635194', 5143, 78, NULL, 102, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 13:35:50.641195', 5144, 78, NULL, 102, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 13:35:50.646193', 5145, 78, NULL, 102, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 13:35:50.653194', 5146, 78, NULL, 102, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 13:35:50.658198', 5147, 78, NULL, 102, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 13:35:50.663193', 5148, 78, NULL, 102, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:20.719582', 5149, 1, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:20.800622', 5150, 1, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:20.860613', 5151, 1, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:20.927618', 5152, 1, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:20.984605', 5153, 1, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:21.031572', 5154, 1, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:21.079573', 5155, 2, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:21.153574', 5156, 2, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:21.212991', 5157, 2, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:21.267995', 5158, 2, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:21.318121', 5159, 2, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:21.372864', 5160, 2, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:21.424978', 5161, 3, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:21.475981', 5162, 3, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:21.522875', 5163, 3, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:21.582878', 5164, 3, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:21.636921', 5165, 3, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:21.686057', 5166, 3, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:21.733497', 5167, 4, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:21.792990', 5168, 4, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:21.856251', 5169, 4, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:21.914734', 5170, 4, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:21.961687', 5171, 4, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:22.009305', 5172, 4, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:22.058307', 5173, 5, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:22.096305', 5174, 5, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:22.134302', 5175, 5, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:22.175309', 5176, 5, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:22.219507', 5177, 5, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:22.273503', 5178, 5, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:22.334500', 5179, 6, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:22.378501', 5180, 6, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:22.429999', 5181, 6, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:22.473823', 5182, 6, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:22.511632', 5183, 6, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:22.547642', 5184, 6, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:22.585652', 5185, 7, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:22.629698', 5186, 7, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:22.721632', 5187, 7, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:22.745628', 5188, 7, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:22.774631', 5189, 7, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:22.802630', 5190, 7, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:22.828630', 5191, 8, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:22.860631', 5192, 8, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:22.906630', 5193, 8, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:22.942632', 5194, 8, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:22.981636', 5195, 8, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:23.024854', 5196, 8, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:23.068851', 5197, 9, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:23.116853', 5198, 9, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:23.155146', 5199, 9, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:23.193038', 5200, 9, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:23.228351', 5201, 9, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:23.279071', 5202, 9, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:23.326120', 5203, 10, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:23.378203', 5204, 10, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:23.418109', 5205, 10, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:23.459130', 5206, 10, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:23.512800', 5207, 10, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:23.559502', 5208, 10, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:23.598491', 5209, 11, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:23.633662', 5210, 11, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:23.676689', 5211, 11, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:23.725669', 5212, 11, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:23.776701', 5213, 11, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:23.824083', 5214, 11, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:23.861080', 5215, 12, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:23.905847', 5216, 12, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:23.962847', 5217, 12, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:24.015869', 5218, 12, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:24.045836', 5219, 12, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:24.073835', 5220, 12, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:24.115053', 5221, 13, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:24.150849', 5222, 13, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:24.174831', 5223, 13, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:24.192916', 5224, 13, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:24.208847', 5225, 13, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:24.235847', 5226, 13, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:24.263863', 5227, 14, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:24.288856', 5228, 14, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:24.316860', 5229, 14, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:24.342841', 5230, 14, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:24.377838', 5231, 14, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:24.410853', 5232, 14, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:24.460847', 5233, 15, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:24.543307', 5234, 15, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:24.566368', 5235, 15, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:24.587179', 5236, 15, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:24.603919', 5237, 15, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:24.624046', 5238, 15, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:24.657936', 5239, 16, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:24.687927', 5240, 16, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:24.716874', 5241, 16, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:24.735867', 5242, 16, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:24.759874', 5243, 16, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:24.780972', 5244, 16, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:24.806202', 5245, 17, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:24.843027', 5246, 17, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:24.884025', 5247, 17, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:24.919144', 5248, 17, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:24.946141', 5249, 17, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:24.967084', 5250, 17, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:24.987012', 5251, 18, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.001021', 5252, 18, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.015099', 5253, 18, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.036024', 5254, 18, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.063019', 5255, 18, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.101365', 5256, 18, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.125496', 5257, 19, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.147402', 5258, 19, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.171551', 5259, 19, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.197552', 5260, 19, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.228184', 5261, 19, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.261897', 5262, 19, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.302107', 5263, 20, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.318124', 5264, 20, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.330123', 5265, 20, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.344126', 5266, 20, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.358206', 5267, 20, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.372755', 5268, 20, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.389167', 5269, 21, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.403886', 5270, 21, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.422801', 5271, 21, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.435911', 5272, 21, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.451797', 5273, 21, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.467273', 5274, 21, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.494804', 5275, 22, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.511888', 5276, 22, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.525796', 5277, 22, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.538798', 5278, 22, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.553957', 5279, 22, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.569809', 5280, 22, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.587820', 5281, 23, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.616009', 5282, 23, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.649214', 5283, 23, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.676022', 5284, 23, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.700020', 5285, 23, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.725014', 5286, 23, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.749010', 5287, 24, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.773015', 5288, 24, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.796020', 5289, 24, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.825015', 5290, 24, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.854214', 5291, 24, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:25.879026', 5292, 24, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:25.904055', 5293, 25, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:25.931190', 5294, 25, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:25.950112', 5295, 25, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:25.971107', 5296, 25, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:25.992115', 5297, 25, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.013108', 5298, 25, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.038322', 5299, 26, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.061114', 5300, 26, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.083116', 5301, 26, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.109181', 5302, 26, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.133462', 5303, 26, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.156163', 5304, 26, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.177112', 5305, 27, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.197112', 5306, 27, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.217185', 5307, 27, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.238111', 5308, 27, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.260355', 5309, 27, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.281122', 5310, 27, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.303113', 5311, 28, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.327111', 5312, 28, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.352117', 5313, 28, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.373298', 5314, 28, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.394184', 5315, 28, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.417376', 5316, 28, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.439114', 5317, 29, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.465118', 5318, 29, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.489346', 5319, 29, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.515832', 5320, 29, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.542857', 5321, 29, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.566985', 5322, 29, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.590838', 5323, 30, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.611157', 5324, 30, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.632177', 5325, 30, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.652156', 5326, 30, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.677175', 5327, 30, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.700352', 5328, 30, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.725390', 5329, 31, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.748599', 5330, 31, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.773395', 5331, 31, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.795387', 5332, 31, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.815530', 5333, 31, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.834523', 5334, 31, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:26.854523', 5335, 32, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:26.874720', 5336, 32, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:26.898525', 5337, 32, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:26.926527', 5338, 32, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:26.958015', 5339, 32, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:26.981526', 5340, 32, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.003602', 5341, 33, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.025526', 5342, 33, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.046520', 5343, 33, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.069664', 5344, 33, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.092577', 5345, 33, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.115639', 5346, 33, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.136628', 5347, 34, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.159628', 5348, 34, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.181631', 5349, 34, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.201630', 5350, 34, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.220779', 5351, 34, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.239683', 5352, 34, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.258798', 5353, 35, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.279742', 5354, 35, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.301691', 5355, 35, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.324704', 5356, 35, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.351705', 5357, 35, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.374686', 5358, 35, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.397683', 5359, 36, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.415203', 5360, 36, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.435194', 5361, 36, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.453197', 5362, 36, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.472200', 5363, 36, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.493198', 5364, 36, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.512915', 5365, 37, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.533146', 5366, 37, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.558106', 5367, 37, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.579916', 5368, 37, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.604912', 5369, 37, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.635068', 5370, 37, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.662914', 5371, 38, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.682915', 5372, 38, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.706691', 5373, 38, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.731697', 5374, 38, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.754607', 5375, 38, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.774608', 5376, 38, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.798038', 5377, 39, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.819752', 5378, 39, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.838683', 5379, 39, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.856607', 5380, 39, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.873609', 5381, 39, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:27.893932', 5382, 39, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:27.913786', 5383, 40, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:27.935792', 5384, 40, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:27.955981', 5385, 40, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:27.976798', 5386, 40, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:27.995786', 5387, 40, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.016723', 5388, 40, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.035583', 5389, 41, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.052576', 5390, 41, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.069777', 5391, 41, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.085712', 5392, 41, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.102575', 5393, 41, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.130580', 5394, 41, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.153588', 5395, 42, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.176577', 5396, 42, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.203575', 5397, 42, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.230800', 5398, 42, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.252802', 5399, 42, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.275926', 5400, 42, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.291286', 5401, 43, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.300842', 5402, 43, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.311805', 5403, 43, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.322926', 5404, 43, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.332231', 5405, 43, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.342229', 5406, 43, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.352581', 5407, 44, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.360469', 5408, 44, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.370472', 5409, 44, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.381516', 5410, 44, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.404508', 5411, 44, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.426506', 5412, 44, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.440510', 5413, 45, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.458625', 5414, 45, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.469504', 5415, 45, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.480608', 5416, 45, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.493673', 5417, 45, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.505081', 5418, 45, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.518673', 5419, 46, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.535738', 5420, 46, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.559624', 5421, 46, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.576234', 5422, 46, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.595184', 5423, 46, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.625270', 5424, 46, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.640161', 5425, 47, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.657171', 5426, 47, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.672166', 5427, 47, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.689164', 5428, 47, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.705166', 5429, 47, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.722171', 5430, 47, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.737303', 5431, 48, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.754168', 5432, 48, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.771165', 5433, 48, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.791278', 5434, 48, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.808164', 5435, 48, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.828253', 5436, 48, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.846230', 5437, 49, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.863170', 5438, 49, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.877954', 5439, 49, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.892834', 5440, 49, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:28.906819', 5441, 49, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:28.923778', 5442, 49, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:28.938763', 5443, 50, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:28.956761', 5444, 50, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:28.972767', 5445, 50, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:28.990945', 5446, 50, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.007945', 5447, 50, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.030092', 5448, 50, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.045938', 5449, 51, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.062001', 5450, 51, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.076107', 5451, 51, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.090688', 5452, 51, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.105681', 5453, 51, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.121639', 5454, 51, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.136622', 5455, 52, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.153636', 5456, 52, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.170681', 5457, 52, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.188173', 5458, 52, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.204164', 5459, 52, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.221403', 5460, 52, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.238174', 5461, 53, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.254393', 5462, 53, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.269229', 5463, 53, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.282536', 5464, 53, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.296543', 5465, 53, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.311379', 5466, 53, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.326374', 5467, 54, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.341382', 5468, 54, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.356367', 5469, 54, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.373420', 5470, 54, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.390687', 5471, 54, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.406369', 5472, 54, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.427374', 5473, 55, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.448376', 5474, 55, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.463383', 5475, 55, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.478375', 5476, 55, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.492439', 5477, 55, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.505539', 5478, 55, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.519376', 5479, 56, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.533546', 5480, 56, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.548423', 5481, 56, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.568383', 5482, 56, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.586369', 5483, 56, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.605375', 5484, 56, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.626379', 5485, 57, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.646376', 5486, 57, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.667377', 5487, 57, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.684366', 5488, 57, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.697368', 5489, 57, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.711376', 5490, 57, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.726388', 5491, 58, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.739374', 5492, 58, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.755379', 5493, 58, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.771373', 5494, 58, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.787982', 5495, 58, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.805663', 5496, 58, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.822313', 5497, 59, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.837820', 5498, 59, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.852821', 5499, 59, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.869822', 5500, 59, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.884939', 5501, 59, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.898933', 5502, 59, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:29.912942', 5503, 60, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:29.926991', 5504, 60, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:29.941145', 5505, 60, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:29.956119', 5506, 60, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:29.971431', 5507, 60, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:29.987125', 5508, 60, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.042099', 5509, 61, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.057100', 5510, 61, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.071097', 5511, 61, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.085152', 5512, 61, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.098362', 5513, 61, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.112103', 5514, 61, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.125103', 5515, 62, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.138103', 5516, 62, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.151156', 5517, 62, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.165104', 5518, 62, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.179137', 5519, 62, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.194484', 5520, 62, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.208482', 5521, 63, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.223455', 5522, 63, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.240429', 5523, 63, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.257604', 5524, 63, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.276482', 5525, 63, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.291272', 5526, 63, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.304145', 5527, 64, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.318151', 5528, 64, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.332302', 5529, 64, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.348251', 5530, 64, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.369391', 5531, 64, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.386223', 5532, 64, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.401159', 5533, 65, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.415152', 5534, 65, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.433153', 5535, 65, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.453152', 5536, 65, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.480616', 5537, 65, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.496544', 5538, 65, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.513441', 5539, 66, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.532421', 5540, 66, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.544406', 5541, 66, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.557411', 5542, 66, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.571406', 5543, 66, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.583465', 5544, 66, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.614641', 5545, 67, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.652743', 5546, 67, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.675415', 5547, 67, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.692834', 5548, 67, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.707114', 5549, 67, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.720263', 5550, 67, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.729108', 5551, 68, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.740113', 5552, 68, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.756109', 5553, 68, NULL, 152, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 4, '2024-06-10 15:50:30.768333', 5554, 68, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.789445', 5555, 68, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.814114', 5556, 68, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.827105', 5557, 69, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.835107', 5558, 69, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.843705', 5559, 69, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.856108', 5560, 69, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.866109', 5561, 69, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.875112', 5562, 69, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.892112', 5563, 70, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.901107', 5564, 70, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.910108', 5565, 70, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.918174', 5566, 70, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.924636', 5567, 70, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.930501', 5568, 70, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.936497', 5569, 71, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.943869', 5570, 71, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.951704', 5571, 71, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:30.958500', 5572, 71, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:30.964512', 5573, 71, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:30.970498', 5574, 71, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:30.977556', 5575, 72, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:30.986685', 5576, 72, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:30.998513', 5577, 72, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.010501', 5578, 72, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.025173', 5579, 72, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.037177', 5580, 72, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:31.051177', 5581, 73, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:31.064176', 5582, 73, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:31.078176', 5583, 73, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.091172', 5584, 73, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.102180', 5585, 73, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.112225', 5586, 73, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:31.120846', 5587, 74, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:31.128754', 5588, 74, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:31.135751', 5589, 74, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.142752', 5590, 74, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.151751', 5591, 74, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.158751', 5592, 74, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:31.163817', 5593, 75, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:31.169751', 5594, 75, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:31.176749', 5595, 75, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.183751', 5596, 75, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.189751', 5597, 75, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.195751', 5598, 75, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:31.201798', 5599, 76, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:31.208752', 5600, 76, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:31.217888', 5601, 76, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.226020', 5602, 76, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.231996', 5603, 76, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.240845', 5604, 76, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:31.258399', 5605, 77, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:31.272675', 5606, 77, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:31.289720', 5607, 77, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.302699', 5608, 77, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.317710', 5609, 77, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.331698', 5610, 77, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:50:31.357826', 5611, 78, NULL, 152, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:50:31.370709', 5612, 78, NULL, 152, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:50:31.389113', 5613, 78, NULL, 152, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:50:31.404141', 5614, 78, NULL, 152, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:50:31.424029', 5615, 78, NULL, 152, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:50:31.439995', 5616, 78, NULL, 152, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:06.806300', 5617, 1, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:06.900292', 5618, 1, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:06.946333', 5619, 1, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:06.991290', 5620, 1, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:07.038304', 5621, 1, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:07.080297', 5622, 1, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:07.124350', 5623, 2, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:07.173611', 5624, 2, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:07.219651', 5625, 2, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:07.263292', 5626, 2, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:07.307297', 5627, 2, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:07.344457', 5628, 2, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:07.387370', 5629, 3, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:07.436306', 5630, 3, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:07.488296', 5631, 3, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:07.530505', 5632, 3, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:07.565300', 5633, 3, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:07.618300', 5634, 3, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:07.663291', 5635, 4, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:07.720306', 5636, 4, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:07.762294', 5637, 4, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:07.802293', 5638, 4, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:07.854293', 5639, 4, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:07.904298', 5640, 4, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:07.928283', 5641, 5, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:07.952288', 5642, 5, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:07.971285', 5643, 5, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:08.000766', 5644, 5, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:08.033292', 5645, 5, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:08.071296', 5646, 5, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:08.116298', 5647, 6, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:08.161299', 5648, 6, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:08.206292', 5649, 6, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:08.238438', 5650, 6, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:08.263287', 5651, 6, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:08.295290', 5652, 6, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:08.363301', 5653, 7, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:08.411291', 5654, 7, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:08.452293', 5655, 7, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:08.494305', 5656, 7, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:08.535295', 5657, 7, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:08.572298', 5658, 7, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:08.613300', 5659, 8, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:08.646694', 5660, 8, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:08.677421', 5661, 8, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:08.706352', 5662, 8, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:08.741709', 5663, 8, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:08.777311', 5664, 8, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:08.810316', 5665, 9, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:08.840294', 5666, 9, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:08.869953', 5667, 9, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:08.897291', 5668, 9, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:08.929303', 5669, 9, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:08.964297', 5670, 9, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:09.000299', 5671, 10, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:09.035286', 5672, 10, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:09.064289', 5673, 10, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:09.092670', 5674, 10, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:09.121311', 5675, 10, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:09.155294', 5676, 10, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:09.191777', 5677, 11, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:09.225872', 5678, 11, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:09.264292', 5679, 11, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:09.294294', 5680, 11, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:09.323288', 5681, 11, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:09.351292', 5682, 11, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:09.384299', 5683, 12, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:09.415297', 5684, 12, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:09.445437', 5685, 12, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:09.472999', 5686, 12, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:09.509287', 5687, 12, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:09.538292', 5688, 12, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:09.564771', 5689, 13, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:09.590293', 5690, 13, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:09.621290', 5691, 13, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:09.648291', 5692, 13, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:09.679293', 5693, 13, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:09.703291', 5694, 13, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:09.728291', 5695, 14, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:09.753289', 5696, 14, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:09.779293', 5697, 14, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:09.805287', 5698, 14, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:09.837307', 5699, 14, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:09.867298', 5700, 14, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:09.896290', 5701, 15, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:09.924437', 5702, 15, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:09.949426', 5703, 15, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:09.973910', 5704, 15, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:09.999760', 5705, 15, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.025431', 5706, 15, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:10.054432', 5707, 16, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:10.088432', 5708, 16, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:10.114428', 5709, 16, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:10.137442', 5710, 16, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:10.162433', 5711, 16, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.186671', 5712, 16, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:10.211442', 5713, 17, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:10.236439', 5714, 17, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:10.263739', 5715, 17, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:10.290433', 5716, 17, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:10.319445', 5717, 17, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.345435', 5718, 17, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:10.369440', 5719, 18, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:10.395431', 5720, 18, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:10.419444', 5721, 18, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:10.444424', 5722, 18, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:10.469439', 5723, 18, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.497431', 5724, 18, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:10.529446', 5725, 19, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:10.555440', 5726, 19, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:10.579442', 5727, 19, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:10.604428', 5728, 19, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:10.628428', 5729, 19, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.653428', 5730, 19, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:10.680434', 5731, 20, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:10.705888', 5732, 20, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:10.732556', 5733, 20, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:10.755432', 5734, 20, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:10.778560', 5735, 20, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.801562', 5736, 20, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:10.826561', 5737, 21, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:10.852562', 5738, 21, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:10.877563', 5739, 21, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:10.903557', 5740, 21, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:10.951579', 5741, 21, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:10.980560', 5742, 21, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.014654', 5743, 22, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.041556', 5744, 22, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.058553', 5745, 22, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.086561', 5746, 22, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.121834', 5747, 22, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.161012', 5748, 22, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.182086', 5749, 23, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.200004', 5750, 23, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.220062', 5751, 23, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.247019', 5752, 23, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.274102', 5753, 23, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.299031', 5754, 23, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.322014', 5755, 24, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.344037', 5756, 24, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.369009', 5757, 24, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.396013', 5758, 24, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.423023', 5759, 24, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.446029', 5760, 24, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.465008', 5761, 25, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.487017', 5762, 25, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.510184', 5763, 25, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.533013', 5764, 25, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.556020', 5765, 25, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.583291', 5766, 25, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.611018', 5767, 26, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.643012', 5768, 26, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.667136', 5769, 26, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.688015', 5770, 26, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.709014', 5771, 26, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.735010', 5772, 26, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.759023', 5773, 27, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.781013', 5774, 27, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.801300', 5775, 27, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.822023', 5776, 27, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.840013', 5777, 27, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.862069', 5778, 27, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:11.884022', 5779, 28, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:11.905211', 5780, 28, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:11.929333', 5781, 28, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:11.952073', 5782, 28, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:11.974021', 5783, 28, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:11.995193', 5784, 28, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.016023', 5785, 29, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.034256', 5786, 29, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.054145', 5787, 29, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.072019', 5788, 29, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.092014', 5789, 29, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.112015', 5790, 29, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.133017', 5791, 30, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.157021', 5792, 30, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.183010', 5793, 30, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.213008', 5794, 30, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.235016', 5795, 30, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.253004', 5796, 30, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.272017', 5797, 31, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.290011', 5798, 31, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.309167', 5799, 31, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.332016', 5800, 31, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.355147', 5801, 31, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.376011', 5802, 31, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.397025', 5803, 32, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.420020', 5804, 32, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.438085', 5805, 32, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.458015', 5806, 32, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.477011', 5807, 32, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.496011', 5808, 32, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.515016', 5809, 33, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.535018', 5810, 33, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.555016', 5811, 33, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.575140', 5812, 33, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.601017', 5813, 33, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.624013', 5814, 33, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.643009', 5815, 34, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.662067', 5816, 34, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.680044', 5817, 34, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.698081', 5818, 34, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.718021', 5819, 34, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.736007', 5820, 34, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.758015', 5821, 35, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.777581', 5822, 35, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.796014', 5823, 35, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.817007', 5824, 35, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.837010', 5825, 35, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.856011', 5826, 35, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.873018', 5827, 36, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:12.890019', 5828, 36, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:12.908011', 5829, 36, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:12.927006', 5830, 36, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:12.946199', 5831, 36, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:12.966247', 5832, 36, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:12.985126', 5833, 37, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.005016', 5834, 37, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.025022', 5835, 37, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.043081', 5836, 37, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.060008', 5837, 37, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.077011', 5838, 37, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.095314', 5839, 38, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.113025', 5840, 38, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.132085', 5841, 38, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.152018', 5842, 38, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.170150', 5843, 38, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.190019', 5844, 38, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.213019', 5845, 39, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.233012', 5846, 39, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.261013', 5847, 39, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.279013', 5848, 39, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.296012', 5849, 39, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.312095', 5850, 39, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.329015', 5851, 40, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.359122', 5852, 40, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.377014', 5853, 40, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.395022', 5854, 40, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.421013', 5855, 40, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.437194', 5856, 40, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.456194', 5857, 41, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.475184', 5858, 41, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.492124', 5859, 41, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.508674', 5860, 41, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.527360', 5861, 41, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.546032', 5862, 41, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.565252', 5863, 42, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.586016', 5864, 42, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.607011', 5865, 42, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.636158', 5866, 42, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.665014', 5867, 42, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.687130', 5868, 42, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.704086', 5869, 43, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.722010', 5870, 43, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.745177', 5871, 43, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.764262', 5872, 43, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.780011', 5873, 43, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.798012', 5874, 43, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.819024', 5875, 44, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.835012', 5876, 44, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.854015', 5877, 44, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.869101', 5878, 44, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.885020', 5879, 44, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.900022', 5880, 44, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:13.916008', 5881, 45, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:13.931021', 5882, 45, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:13.947026', 5883, 45, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:13.963125', 5884, 45, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:13.980025', 5885, 45, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:13.996010', 5886, 45, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.017013', 5887, 46, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.035418', 5888, 46, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.055031', 5889, 46, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.074162', 5890, 46, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.093024', 5891, 46, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.108018', 5892, 46, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.124065', 5893, 47, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.139241', 5894, 47, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.154172', 5895, 47, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.170028', 5896, 47, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.187179', 5897, 47, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.203082', 5898, 47, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.219076', 5899, 48, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.235014', 5900, 48, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.253016', 5901, 48, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.270084', 5902, 48, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.291029', 5903, 48, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.309017', 5904, 48, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.328008', 5905, 49, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.343014', 5906, 49, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.358190', 5907, 49, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.374029', 5908, 49, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.392167', 5909, 49, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.406067', 5910, 49, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.423007', 5911, 50, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.438303', 5912, 50, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.456064', 5913, 50, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.473023', 5914, 50, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.495018', 5915, 50, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.511009', 5916, 50, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.525056', 5917, 51, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.540026', 5918, 51, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.554080', 5919, 51, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.569005', 5920, 51, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.586078', 5921, 51, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.604022', 5922, 51, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.632223', 5923, 52, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.653336', 5924, 52, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.671019', 5925, 52, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.689016', 5926, 52, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.706175', 5927, 52, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.722012', 5928, 52, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.779010', 5929, 53, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.793175', 5930, 53, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.808164', 5931, 53, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.823125', 5932, 53, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.837017', 5933, 53, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.852160', 5934, 53, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.867269', 5935, 54, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.886010', 5936, 54, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.900008', 5937, 54, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.914051', 5938, 54, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:14.927011', 5939, 54, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:14.940157', 5940, 54, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:14.953425', 5941, 55, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:14.969013', 5942, 55, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:14.983053', 5943, 55, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:14.998009', 5944, 55, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.014030', 5945, 55, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.031102', 5946, 55, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.047031', 5947, 56, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.063137', 5948, 56, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.082038', 5949, 56, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.098294', 5950, 56, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.118028', 5951, 56, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.132065', 5952, 56, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.147097', 5953, 57, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.161013', 5954, 57, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.173062', 5955, 57, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.187019', 5956, 57, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.203017', 5957, 57, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.220016', 5958, 57, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.237011', 5959, 58, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.255022', 5960, 58, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.271181', 5961, 58, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.292014', 5962, 58, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.310012', 5963, 58, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.332012', 5964, 58, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.351015', 5965, 59, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.368135', 5966, 59, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.391014', 5967, 59, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.410087', 5968, 59, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.423020', 5969, 59, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.437006', 5970, 59, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.460017', 5971, 60, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.500007', 5972, 60, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.513006', 5973, 60, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.526005', 5974, 60, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.541097', 5975, 60, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.561117', 5976, 60, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.575172', 5977, 61, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.588023', 5978, 61, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.607018', 5979, 61, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.633012', 5980, 61, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.651009', 5981, 61, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.671017', 5982, 61, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.693024', 5983, 62, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.709008', 5984, 62, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.722005', 5985, 62, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.732008', 5986, 62, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.742008', 5987, 62, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.752005', 5988, 62, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.762238', 5989, 63, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.772005', 5990, 63, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.781092', 5991, 63, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.790069', 5992, 63, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.803013', 5993, 63, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.819005', 5994, 63, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.836152', 5995, 64, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.851013', 5996, 64, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.868022', 5997, 64, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.890023', 5998, 64, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.914007', 5999, 64, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.924002', 6000, 64, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.934003', 6001, 65, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.946047', 6002, 65, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.953001', 6003, 65, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:15.959003', 6004, 65, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:15.965069', 6005, 65, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:15.972005', 6006, 65, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:15.982004', 6007, 66, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:15.988180', 6008, 66, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:15.994010', 6009, 66, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.001088', 6010, 66, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.007003', 6011, 66, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.015058', 6012, 66, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.021112', 6013, 67, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.027003', 6014, 67, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.033051', 6015, 67, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.040006', 6016, 67, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.048006', 6017, 67, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.055005', 6018, 67, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.064018', 6019, 68, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.073009', 6020, 68, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.086128', 6021, 68, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.103281', 6022, 68, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.118013', 6023, 68, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.131038', 6024, 68, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.146025', 6025, 69, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.159018', 6026, 69, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.172021', 6027, 69, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.185180', 6028, 69, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.198015', 6029, 69, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.211145', 6030, 69, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.223017', 6031, 70, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.237022', 6032, 70, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.253017', 6033, 70, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.268022', 6034, 70, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.284020', 6035, 70, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.298013', 6036, 70, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.312022', 6037, 71, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.325010', 6038, 71, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.340018', 6039, 71, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.355018', 6040, 71, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.370250', 6041, 71, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.384353', 6042, 71, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.398012', 6043, 72, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.412024', 6044, 72, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.426015', 6045, 72, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.439026', 6046, 72, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.453026', 6047, 72, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.470023', 6048, 72, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.486014', 6049, 73, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.500014', 6050, 73, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.515214', 6051, 73, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.531184', 6052, 73, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.550209', 6053, 73, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.565009', 6054, 73, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.579271', 6055, 74, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.592495', 6056, 74, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.608253', 6057, 74, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.626008', 6058, 74, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.643027', 6059, 74, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.657009', 6060, 74, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.677020', 6061, 75, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.696014', 6062, 75, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.714092', 6063, 75, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.731006', 6064, 75, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.750017', 6065, 75, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.766017', 6066, 75, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.781011', 6067, 76, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.796012', 6068, 76, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.809181', 6069, 76, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.824007', 6070, 76, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.837009', 6071, 76, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.851009', 6072, 76, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.864046', 6073, 77, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.880258', 6074, 77, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.895015', 6075, 77, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.909120', 6076, 77, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:16.923011', 6077, 77, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:16.938013', 6078, 77, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 15:59:16.952011', 6079, 78, NULL, 202, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 15:59:16.966018', 6080, 78, NULL, 202, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 15:59:16.981009', 6081, 78, NULL, 202, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 15:59:16.995012', 6082, 78, NULL, 202, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 15:59:17.009016', 6083, 78, NULL, 202, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 15:59:17.023009', 6084, 78, NULL, 202, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:25.866213', 6085, 1, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:25.911961', 6086, 1, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:25.949765', 6087, 1, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:25.990769', 6088, 1, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:26.034826', 6089, 1, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:26.070764', 6090, 1, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:26.112944', 6091, 2, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:26.160753', 6092, 2, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:26.201759', 6093, 2, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:26.240839', 6094, 2, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:26.280755', 6095, 2, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:26.315759', 6096, 2, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:26.351767', 6097, 3, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:26.392020', 6098, 3, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:26.432755', 6099, 3, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:26.478767', 6100, 3, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:26.516752', 6101, 3, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:26.551747', 6102, 3, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:26.583756', 6103, 4, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:26.619757', 6104, 4, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:26.657944', 6105, 4, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:26.693765', 6106, 4, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:26.726758', 6107, 4, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:26.760756', 6108, 4, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:26.795826', 6109, 5, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:26.826812', 6110, 5, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:26.863757', 6111, 5, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:26.899772', 6112, 5, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:26.938454', 6113, 5, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:26.978810', 6114, 5, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:27.014243', 6115, 6, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:27.046773', 6116, 6, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:27.086852', 6117, 6, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:27.126832', 6118, 6, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:27.160758', 6119, 6, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:27.200751', 6120, 6, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:27.231750', 6121, 7, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:27.264758', 6122, 7, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:27.320757', 6123, 7, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:27.362755', 6124, 7, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:27.393753', 6125, 7, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:27.425755', 6126, 7, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:27.456768', 6127, 8, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:27.488769', 6128, 8, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:27.522750', 6129, 8, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:27.557002', 6130, 8, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:27.590759', 6131, 8, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:27.622753', 6132, 8, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:27.655825', 6133, 9, NULL, 203, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 2, '2024-06-10 16:07:27.685829', 6134, 9, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:27.720768', 6135, 9, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:27.756773', 6136, 9, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:27.791759', 6137, 9, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:27.825772', 6138, 9, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:27.857995', 6139, 10, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:27.887813', 6140, 10, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:27.921756', 6141, 10, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:27.955759', 6142, 10, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:27.992768', 6143, 10, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:28.026774', 6144, 10, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:28.061775', 6145, 11, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:28.097752', 6146, 11, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:28.133757', 6147, 11, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:28.182758', 6148, 11, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:28.210750', 6149, 11, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:28.225743', 6150, 11, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:28.240745', 6151, 12, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:28.255751', 6152, 12, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:28.271746', 6153, 12, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:28.286743', 6154, 12, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:28.307748', 6155, 12, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:28.337862', 6156, 12, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:28.370769', 6157, 13, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:28.407756', 6158, 13, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:28.440775', 6159, 13, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:28.467750', 6160, 13, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:28.495758', 6161, 13, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:28.525812', 6162, 13, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:28.559813', 6163, 14, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:28.589816', 6164, 14, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:28.620774', 6165, 14, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:28.651829', 6166, 14, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:28.679937', 6167, 14, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:28.742757', 6168, 14, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:28.771764', 6169, 15, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:28.801762', 6170, 15, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:28.832749', 6171, 15, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:28.862918', 6172, 15, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:28.891820', 6173, 15, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:28.918815', 6174, 15, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:28.946760', 6175, 16, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:28.972818', 6176, 16, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:29.001815', 6177, 16, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:29.032761', 6178, 16, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:29.065770', 6179, 16, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:29.094757', 6180, 16, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:29.125838', 6181, 17, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:29.157766', 6182, 17, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:29.188765', 6183, 17, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:29.220756', 6184, 17, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:29.252758', 6185, 17, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:29.284753', 6186, 17, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:29.310756', 6187, 18, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:29.337752', 6188, 18, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:29.364766', 6189, 18, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:29.391756', 6190, 18, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:29.421759', 6191, 18, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:29.450762', 6192, 18, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:29.483752', 6193, 19, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:29.512761', 6194, 19, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:29.535757', 6195, 19, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:29.561755', 6196, 19, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:29.589751', 6197, 19, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:29.619759', 6198, 19, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:29.648466', 6199, 20, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:29.674756', 6200, 20, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:29.701750', 6201, 20, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:29.727762', 6202, 20, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:29.753753', 6203, 20, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:29.779760', 6204, 20, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:29.805755', 6205, 21, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:29.831754', 6206, 21, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:29.859755', 6207, 21, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:29.886760', 6208, 21, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:29.912769', 6209, 21, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:29.936903', 6210, 21, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:29.960823', 6211, 22, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:29.984753', 6212, 22, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.011757', 6213, 22, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.040087', 6214, 22, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:30.067752', 6215, 22, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:30.097759', 6216, 22, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:30.123752', 6217, 23, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:30.157769', 6218, 23, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.189760', 6219, 23, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.227759', 6220, 23, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:30.258760', 6221, 23, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:30.288761', 6222, 23, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:30.319757', 6223, 24, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:30.344753', 6224, 24, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.369754', 6225, 24, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.393751', 6226, 24, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:30.420383', 6227, 24, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:30.442759', 6228, 24, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:30.467812', 6229, 25, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:30.496824', 6230, 25, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.525755', 6231, 25, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.553750', 6232, 25, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:30.576752', 6233, 25, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:30.598756', 6234, 25, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:30.621753', 6235, 26, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:30.645766', 6236, 26, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.670756', 6237, 26, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.696753', 6238, 26, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:30.722810', 6239, 26, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:30.747788', 6240, 26, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:30.771774', 6241, 27, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:30.795760', 6242, 27, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.820331', 6243, 27, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.841834', 6244, 27, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:30.868033', 6245, 27, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:30.893765', 6246, 27, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:30.920751', 6247, 28, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:30.945754', 6248, 28, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:30.970758', 6249, 28, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:30.993754', 6250, 28, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.016752', 6251, 28, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.037961', 6252, 28, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.060891', 6253, 29, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.082913', 6254, 29, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.110892', 6255, 29, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.145154', 6256, 29, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.172896', 6257, 29, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.223887', 6258, 29, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.245927', 6259, 30, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.266889', 6260, 30, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.289891', 6261, 30, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.314424', 6262, 30, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.337948', 6263, 30, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.362950', 6264, 30, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.388904', 6265, 31, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.411912', 6266, 31, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.431947', 6267, 31, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.452082', 6268, 31, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.473225', 6269, 31, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.494031', 6270, 31, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.519028', 6271, 32, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.540025', 6272, 32, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.564781', 6273, 32, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.589020', 6274, 32, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.615018', 6275, 32, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.637024', 6276, 32, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.657027', 6277, 33, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.677020', 6278, 33, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.696020', 6279, 33, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.723037', 6280, 33, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.747024', 6281, 33, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.770027', 6282, 33, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.793022', 6283, 34, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.817021', 6284, 34, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.837021', 6285, 34, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.858374', 6286, 34, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:31.879163', 6287, 34, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:31.899161', 6288, 34, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:31.923356', 6289, 35, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:31.945172', 6290, 35, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:31.967220', 6291, 35, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:31.992231', 6292, 35, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.016552', 6293, 35, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.035220', 6294, 35, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.056222', 6295, 36, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.074249', 6296, 36, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.096162', 6297, 36, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.122216', 6298, 36, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.146169', 6299, 36, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.171431', 6300, 36, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.195215', 6301, 37, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.221166', 6302, 37, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.240171', 6303, 37, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.261157', 6304, 37, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.287168', 6305, 37, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.306161', 6306, 37, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.328177', 6307, 38, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.355233', 6308, 38, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.376354', 6309, 38, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.398163', 6310, 38, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.421158', 6311, 38, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.444558', 6312, 38, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.466158', 6313, 39, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.490165', 6314, 39, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.510162', 6315, 39, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.529164', 6316, 39, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.554350', 6317, 39, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.580287', 6318, 39, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.602169', 6319, 40, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.638158', 6320, 40, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.671164', 6321, 40, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.701162', 6322, 40, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.732169', 6323, 40, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.753857', 6324, 40, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.766155', 6325, 41, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.780154', 6326, 41, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.791158', 6327, 41, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.803153', 6328, 41, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.818152', 6329, 41, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.833413', 6330, 41, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.850945', 6331, 42, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.865155', 6332, 42, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.880166', 6333, 42, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.895155', 6334, 42, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.910155', 6335, 42, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:32.924159', 6336, 42, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:32.936154', 6337, 43, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:32.949157', 6338, 43, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:32.962154', 6339, 43, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:32.976155', 6340, 43, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:32.990155', 6341, 43, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.003155', 6342, 43, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.015153', 6343, 44, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.027157', 6344, 44, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.041155', 6345, 44, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.053156', 6346, 44, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.066153', 6347, 44, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.081152', 6348, 44, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.095153', 6349, 45, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.109179', 6350, 45, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.121154', 6351, 45, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.134156', 6352, 45, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.147153', 6353, 45, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.161158', 6354, 45, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.176157', 6355, 46, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.192153', 6356, 46, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.203153', 6357, 46, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.218157', 6358, 46, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.231154', 6359, 46, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.244156', 6360, 46, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.258156', 6361, 47, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.271155', 6362, 47, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.285174', 6363, 47, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.299164', 6364, 47, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.312155', 6365, 47, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.324156', 6366, 47, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.335156', 6367, 48, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.347158', 6368, 48, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.358155', 6369, 48, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.371180', 6370, 48, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.383153', 6371, 48, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.395155', 6372, 48, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.406160', 6373, 49, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.417162', 6374, 49, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.428157', 6375, 49, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.441191', 6376, 49, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.460162', 6377, 49, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.480073', 6378, 49, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.498714', 6379, 50, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.521157', 6380, 50, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.541190', 6381, 50, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.563159', 6382, 50, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.583164', 6383, 50, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.599160', 6384, 50, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.618365', 6385, 51, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.633159', 6386, 51, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.653167', 6387, 51, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.668158', 6388, 51, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.685489', 6389, 51, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.700163', 6390, 51, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.717159', 6391, 52, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.731156', 6392, 52, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.750160', 6393, 52, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.769174', 6394, 52, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.792164', 6395, 52, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.814172', 6396, 52, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.833165', 6397, 53, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.854160', 6398, 53, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.872164', 6399, 53, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.891166', 6400, 53, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:33.907357', 6401, 53, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:33.925229', 6402, 53, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:33.943745', 6403, 54, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:33.961406', 6404, 54, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:33.980518', 6405, 54, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:33.998513', 6406, 54, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.019504', 6407, 54, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.038528', 6408, 54, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.057509', 6409, 55, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.075511', 6410, 55, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.093997', 6411, 55, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.111515', 6412, 55, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.127665', 6413, 55, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.148148', 6414, 55, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.166769', 6415, 56, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.191705', 6416, 56, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.212663', 6417, 56, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.230649', 6418, 56, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.251655', 6419, 56, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.268660', 6420, 56, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.289666', 6421, 57, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.308654', 6422, 57, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.331656', 6423, 57, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.349656', 6424, 57, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.365713', 6425, 57, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.386705', 6426, 57, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.404733', 6427, 58, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.424749', 6428, 58, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.444668', 6429, 58, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.463653', 6430, 58, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.481659', 6431, 58, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.500958', 6432, 58, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.518653', 6433, 59, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.534043', 6434, 59, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.553659', 6435, 59, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.569661', 6436, 59, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.591711', 6437, 59, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.610654', 6438, 59, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.630653', 6439, 60, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.651665', 6440, 60, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.668648', 6441, 60, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.686648', 6442, 60, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.702733', 6443, 60, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.721654', 6444, 60, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.736653', 6445, 61, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.753671', 6446, 61, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.768666', 6447, 61, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.787648', 6448, 61, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.804683', 6449, 61, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.825669', 6450, 61, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.846269', 6451, 62, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.862687', 6452, 62, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.882666', 6453, 62, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:34.899653', 6454, 62, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:34.920648', 6455, 62, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:34.936699', 6456, 62, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:34.953665', 6457, 63, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:34.967648', 6458, 63, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:34.986705', 6459, 63, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.000669', 6460, 63, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.020654', 6461, 63, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.037654', 6462, 63, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.058661', 6463, 64, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.075666', 6464, 64, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.094652', 6465, 64, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.112653', 6466, 64, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.129675', 6467, 64, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.149648', 6468, 64, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.165941', 6469, 65, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.186661', 6470, 65, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.209795', 6471, 65, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.229653', 6472, 65, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.248113', 6473, 65, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.269656', 6474, 65, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.290652', 6475, 66, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.308651', 6476, 66, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.326655', 6477, 66, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.366843', 6478, 66, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.384664', 6479, 66, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.398993', 6480, 66, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.416659', 6481, 67, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.432997', 6482, 67, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.449705', 6483, 67, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.477663', 6484, 67, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.496656', 6485, 67, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.514655', 6486, 67, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.531650', 6487, 68, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.548665', 6488, 68, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.566654', 6489, 68, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.583656', 6490, 68, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.597648', 6491, 68, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.613654', 6492, 68, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.628653', 6493, 69, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.644656', 6494, 69, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.663908', 6495, 69, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.684652', 6496, 69, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.701650', 6497, 69, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.722658', 6498, 69, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.741653', 6499, 70, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.762654', 6500, 70, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.779659', 6501, 70, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.798664', 6502, 70, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.815652', 6503, 70, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.829654', 6504, 70, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.846665', 6505, 71, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.862652', 6506, 71, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.880653', 6507, 71, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:35.901658', 6508, 71, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:35.922656', 6509, 71, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:35.940651', 6510, 71, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:35.959669', 6511, 72, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:35.978202', 6512, 72, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:35.997665', 6513, 72, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.016011', 6514, 72, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.032650', 6515, 72, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.049487', 6516, 72, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:36.064653', 6517, 73, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:36.084658', 6518, 73, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:36.102651', 6519, 73, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.122664', 6520, 73, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.140950', 6521, 73, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.158793', 6522, 73, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:36.181835', 6523, 74, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:36.204657', 6524, 74, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:36.226674', 6525, 74, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.247654', 6526, 74, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.264182', 6527, 74, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.282980', 6528, 74, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:36.301649', 6529, 75, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:36.319652', 6530, 75, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:36.338654', 6531, 75, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.357656', 6532, 75, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.376669', 6533, 75, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.397651', 6534, 75, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:36.415956', 6535, 76, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:36.435953', 6536, 76, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:36.455953', 6537, 76, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.471957', 6538, 76, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.493955', 6539, 76, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.527120', 6540, 76, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:36.554950', 6541, 77, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:36.583948', 6542, 77, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:36.596950', 6543, 77, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.607294', 6544, 77, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.618948', 6545, 77, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.629945', 6546, 77, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:07:36.641948', 6547, 78, NULL, 203, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:07:36.653947', 6548, 78, NULL, 203, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:07:36.662945', 6549, 78, NULL, 203, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:07:36.674946', 6550, 78, NULL, 203, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:07:36.682949', 6551, 78, NULL, 203, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:07:36.696963', 6552, 78, NULL, 203, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:09.279425', 6553, 1, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:09.303389', 6554, 1, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:09.321309', 6555, 1, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:09.341311', 6556, 1, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:09.362316', 6557, 1, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:09.387300', 6558, 1, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:09.410309', 6559, 2, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:09.434309', 6560, 2, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:09.462492', 6561, 2, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:09.491738', 6562, 2, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:09.523307', 6563, 2, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:09.555301', 6564, 2, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:09.582304', 6565, 3, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:09.607304', 6566, 3, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:09.634139', 6567, 3, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:09.660317', 6568, 3, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:09.685303', 6569, 3, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:09.709626', 6570, 3, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:09.733315', 6571, 4, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:09.758367', 6572, 4, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:09.792765', 6573, 4, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:09.826736', 6574, 4, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:09.864311', 6575, 4, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:09.900312', 6576, 4, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:09.936320', 6577, 5, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:09.970367', 6578, 5, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:10.000325', 6579, 5, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:10.030394', 6580, 5, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:10.063308', 6581, 5, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:10.101438', 6582, 5, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:10.136314', 6583, 6, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:10.173315', 6584, 6, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:10.206309', 6585, 6, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:10.240591', 6586, 6, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:10.270314', 6587, 6, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:10.305308', 6588, 6, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:10.338327', 6589, 7, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:10.377023', 6590, 7, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:10.407312', 6591, 7, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:10.437316', 6592, 7, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:10.467574', 6593, 7, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:10.503313', 6594, 7, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:10.537329', 6595, 8, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:10.573309', 6596, 8, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:10.611330', 6597, 8, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:10.650763', 6598, 8, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:10.689320', 6599, 8, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:10.729603', 6600, 8, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:10.763308', 6601, 9, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:10.795312', 6602, 9, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:10.827323', 6603, 9, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:10.857304', 6604, 9, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:10.893310', 6605, 9, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:10.928312', 6606, 9, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:10.965312', 6607, 10, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:10.997418', 6608, 10, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.029325', 6609, 10, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.059476', 6610, 10, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.086377', 6611, 10, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:11.116368', 6612, 10, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:11.147312', 6613, 11, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:11.186458', 6614, 11, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.229309', 6615, 11, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.274505', 6616, 11, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.319306', 6617, 11, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:11.362316', 6618, 11, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:11.408311', 6619, 12, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:11.426300', 6620, 12, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.443305', 6621, 12, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.463302', 6622, 12, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.481298', 6623, 12, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:11.499418', 6624, 12, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:11.523306', 6625, 13, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:11.548312', 6626, 13, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.571307', 6627, 13, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.589303', 6628, 13, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.611426', 6629, 13, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:11.636301', 6630, 13, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:11.663306', 6631, 14, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:11.685301', 6632, 14, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.710423', 6633, 14, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.733305', 6634, 14, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.762302', 6635, 14, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:11.787300', 6636, 14, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:11.812301', 6637, 15, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:11.840309', 6638, 15, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.856304', 6639, 15, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.872301', 6640, 15, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.889302', 6641, 15, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:11.905307', 6642, 15, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:11.922555', 6643, 16, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:11.938312', 6644, 16, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:11.958300', 6645, 16, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:11.976301', 6646, 16, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:11.992301', 6647, 16, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.009302', 6648, 16, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.023305', 6649, 17, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.038408', 6650, 17, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.052398', 6651, 17, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.065301', 6652, 17, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.079306', 6653, 17, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.097366', 6654, 17, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.112302', 6655, 18, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.128302', 6656, 18, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.142303', 6657, 18, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.155367', 6658, 18, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.166544', 6659, 18, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.182299', 6660, 18, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.194300', 6661, 19, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.208386', 6662, 19, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.220300', 6663, 19, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.236305', 6664, 19, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.249523', 6665, 19, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.262299', 6666, 19, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.275302', 6667, 20, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.287303', 6668, 20, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.299439', 6669, 20, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.311302', 6670, 20, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.323367', 6671, 20, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.339308', 6672, 20, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.353304', 6673, 21, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.365388', 6674, 21, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.377304', 6675, 21, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.388347', 6676, 21, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.410308', 6677, 21, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.434311', 6678, 21, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.456303', 6679, 22, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.481842', 6680, 22, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.505310', 6681, 22, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.529315', 6682, 22, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.550499', 6683, 22, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.571878', 6684, 22, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.608614', 6685, 23, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.640310', 6686, 23, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.671311', 6687, 23, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.692302', 6688, 23, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.704425', 6689, 23, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.718305', 6690, 23, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.730297', 6691, 24, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.744298', 6692, 24, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.757298', 6693, 24, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.767298', 6694, 24, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.776297', 6695, 24, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.785302', 6696, 24, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.800378', 6697, 25, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.812667', 6698, 25, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.825298', 6699, 25, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.839300', 6700, 25, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.853298', 6701, 25, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.866357', 6702, 25, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.881302', 6703, 26, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.895301', 6704, 26, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.909436', 6705, 26, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.923305', 6706, 26, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:12.933297', 6707, 26, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:12.943381', 6708, 26, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:12.954301', 6709, 27, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:12.970351', 6710, 27, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:12.982300', 6711, 27, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:12.993299', 6712, 27, NULL, 204, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 5, '2024-06-10 16:09:13.004299', 6713, 27, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.019371', 6714, 27, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.029300', 6715, 28, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.041302', 6716, 28, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.056301', 6717, 28, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.068302', 6718, 28, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.083298', 6719, 28, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.097299', 6720, 28, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.109299', 6721, 29, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.123370', 6722, 29, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.139308', 6723, 29, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.153304', 6724, 29, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.166299', 6725, 29, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.181301', 6726, 29, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.191297', 6727, 30, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.200301', 6728, 30, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.213298', 6729, 30, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.221299', 6730, 30, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.229358', 6731, 30, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.240300', 6732, 30, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.251301', 6733, 31, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.262303', 6734, 31, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.272300', 6735, 31, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.282305', 6736, 31, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.296306', 6737, 31, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.306304', 6738, 31, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.320320', 6739, 32, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.330375', 6740, 32, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.341302', 6741, 32, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.352299', 6742, 32, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.367301', 6743, 32, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.386303', 6744, 32, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.404305', 6745, 33, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.418303', 6746, 33, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.429301', 6747, 33, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.442386', 6748, 33, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.452303', 6749, 33, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.463300', 6750, 33, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.477301', 6751, 34, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.488305', 6752, 34, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.500300', 6753, 34, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.511303', 6754, 34, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.520301', 6755, 34, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.530416', 6756, 34, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.541304', 6757, 35, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.551300', 6758, 35, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.560405', 6759, 35, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.570303', 6760, 35, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.580300', 6761, 35, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.589300', 6762, 35, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.599330', 6763, 36, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.610301', 6764, 36, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.624302', 6765, 36, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.638302', 6766, 36, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.653355', 6767, 36, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.667304', 6768, 36, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.682400', 6769, 37, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.696299', 6770, 37, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.712790', 6771, 37, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.723300', 6772, 37, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.736542', 6773, 37, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.749298', 6774, 37, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.760300', 6775, 38, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.772299', 6776, 38, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.783298', 6777, 38, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.791298', 6778, 38, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.802537', 6779, 38, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.811301', 6780, 38, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.821300', 6781, 39, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.831382', 6782, 39, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.845419', 6783, 39, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.855300', 6784, 39, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.866298', 6785, 39, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.878593', 6786, 39, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.890327', 6787, 40, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.907323', 6788, 40, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.921298', 6789, 40, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:13.932299', 6790, 40, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:13.947302', 6791, 40, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:13.958300', 6792, 40, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:13.971355', 6793, 41, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:13.980302', 6794, 41, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:13.989299', 6795, 41, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.000368', 6796, 41, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.012300', 6797, 41, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.022299', 6798, 41, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.029298', 6799, 42, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.039299', 6800, 42, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.050299', 6801, 42, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.059297', 6802, 42, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.068435', 6803, 42, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.079301', 6804, 42, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.087298', 6805, 43, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.097301', 6806, 43, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.108304', 6807, 43, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.122430', 6808, 43, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.132304', 6809, 43, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.143451', 6810, 43, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.153410', 6811, 44, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.163301', 6812, 44, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.171324', 6813, 44, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.180299', 6814, 44, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.187366', 6815, 44, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.196299', 6816, 44, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.207377', 6817, 45, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.216357', 6818, 45, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.225369', 6819, 45, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.234302', 6820, 45, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.249382', 6821, 45, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.262303', 6822, 45, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.281461', 6823, 46, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.306317', 6824, 46, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.328447', 6825, 46, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.351513', 6826, 46, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.370318', 6827, 46, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.385300', 6828, 46, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.397304', 6829, 47, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.410301', 6830, 47, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.420383', 6831, 47, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.431311', 6832, 47, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.443410', 6833, 47, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.454305', 6834, 47, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.464306', 6835, 48, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.475301', 6836, 48, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.484298', 6837, 48, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.493300', 6838, 48, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.509306', 6839, 48, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.528415', 6840, 48, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.550306', 6841, 49, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.568307', 6842, 49, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.585315', 6843, 49, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.606318', 6844, 49, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.626436', 6845, 49, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.648311', 6846, 49, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.674503', 6847, 50, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.699314', 6848, 50, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.724300', 6849, 50, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.740303', 6850, 50, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.753297', 6851, 50, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.769299', 6852, 50, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.777395', 6853, 51, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.786307', 6854, 51, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.793327', 6855, 51, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.801300', 6856, 51, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.810374', 6857, 51, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.819297', 6858, 51, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.828353', 6859, 52, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.843313', 6860, 52, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.862620', 6861, 52, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.874300', 6862, 52, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.884300', 6863, 52, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.894300', 6864, 52, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.907304', 6865, 53, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.917299', 6866, 53, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.926299', 6867, 53, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.934301', 6868, 53, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:14.947449', 6869, 53, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:14.959300', 6870, 53, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:14.971302', 6871, 54, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:14.984302', 6872, 54, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:14.992299', 6873, 54, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:14.999298', 6874, 54, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.009302', 6875, 54, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.015301', 6876, 54, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.023496', 6877, 55, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.030300', 6878, 55, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.037303', 6879, 55, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.044299', 6880, 55, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.052349', 6881, 55, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.060303', 6882, 55, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.066452', 6883, 56, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.076302', 6884, 56, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.084358', 6885, 56, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.093299', 6886, 56, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.102301', 6887, 56, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.111301', 6888, 56, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.119302', 6889, 57, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.127305', 6890, 57, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.135300', 6891, 57, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.146299', 6892, 57, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.157449', 6893, 57, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.166302', 6894, 57, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.175303', 6895, 58, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.186302', 6896, 58, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.194305', 6897, 58, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.203308', 6898, 58, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.211300', 6899, 58, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.219364', 6900, 58, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.228300', 6901, 59, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.241485', 6902, 59, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.254316', 6903, 59, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.267316', 6904, 59, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.281336', 6905, 59, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.295768', 6906, 59, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.308307', 6907, 60, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.322302', 6908, 60, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.335313', 6909, 60, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.350308', 6910, 60, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.363420', 6911, 60, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.377404', 6912, 60, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.389310', 6913, 61, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.402305', 6914, 61, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.416305', 6915, 61, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.429388', 6916, 61, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.443320', 6917, 61, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.456310', 6918, 61, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.469319', 6919, 62, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.482310', 6920, 62, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.497311', 6921, 62, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.511305', 6922, 62, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.524314', 6923, 62, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.540334', 6924, 62, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.553304', 6925, 63, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.566309', 6926, 63, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.580304', 6927, 63, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.593379', 6928, 63, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.612439', 6929, 63, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.626309', 6930, 63, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.644315', 6931, 64, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.658313', 6932, 64, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.673318', 6933, 64, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.686307', 6934, 64, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.698305', 6935, 64, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.713305', 6936, 64, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.727317', 6937, 65, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.742320', 6938, 65, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.756311', 6939, 65, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.769352', 6940, 65, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.784310', 6941, 65, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.798305', 6942, 65, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.815315', 6943, 66, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.827875', 6944, 66, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.843317', 6945, 66, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.857308', 6946, 66, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.870444', 6947, 66, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.884312', 6948, 66, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.896302', 6949, 67, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.911301', 6950, 67, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:15.923383', 6951, 67, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:15.936305', 6952, 67, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:15.951304', 6953, 67, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:15.967496', 6954, 67, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:15.984307', 6955, 68, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:15.999309', 6956, 68, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.016308', 6957, 68, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.029306', 6958, 68, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.044305', 6959, 68, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.057308', 6960, 68, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.071481', 6961, 69, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.085429', 6962, 69, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.098509', 6963, 69, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.109452', 6964, 69, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.117301', 6965, 69, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.124304', 6966, 69, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.131303', 6967, 70, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.140305', 6968, 70, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.147306', 6969, 70, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.154395', 6970, 70, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.161311', 6971, 70, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.175549', 6972, 70, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.191365', 6973, 71, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.207323', 6974, 71, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.224691', 6975, 71, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.241317', 6976, 71, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.256319', 6977, 71, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.272315', 6978, 71, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.291305', 6979, 72, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.306570', 6980, 72, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.321305', 6981, 72, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.336311', 6982, 72, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.354300', 6983, 72, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.372459', 6984, 72, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.388309', 6985, 73, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.403306', 6986, 73, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.419310', 6987, 73, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.434428', 6988, 73, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.453324', 6989, 73, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.467537', 6990, 73, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.483316', 6991, 74, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.498311', 6992, 74, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.514319', 6993, 74, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.529319', 6994, 74, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.545329', 6995, 74, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.561450', 6996, 74, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.580319', 6997, 75, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.594312', 6998, 75, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.604309', 6999, 75, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.612302', 7000, 75, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.618375', 7001, 75, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.624302', 7002, 75, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.630301', 7003, 76, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.639309', 7004, 76, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.649309', 7005, 76, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.657302', 7006, 76, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.665304', 7007, 76, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.673307', 7008, 76, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.682484', 7009, 77, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.690306', 7010, 77, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.698303', 7011, 77, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.706302', 7012, 77, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.713302', 7013, 77, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.720302', 7014, 77, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:09:16.726650', 7015, 78, NULL, 204, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:09:16.732356', 7016, 78, NULL, 204, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:09:16.741302', 7017, 78, NULL, 204, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:09:16.751438', 7018, 78, NULL, 204, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:09:16.761301', 7019, 78, NULL, 204, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:09:16.772643', 7020, 78, NULL, 204, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.495952', 7021, 1, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.500954', 7022, 1, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.505995', 7023, 1, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.510953', 7024, 1, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.515960', 7025, 1, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.521194', 7026, 1, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.524951', 7027, 2, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.530952', 7028, 2, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.534988', 7029, 2, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.539960', 7030, 2, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.544951', 7031, 2, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.550042', 7032, 2, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.555994', 7033, 3, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.561956', 7034, 3, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.567965', 7035, 3, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.574957', 7036, 3, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.581957', 7037, 3, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.587957', 7038, 3, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.593962', 7039, 4, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.599955', 7040, 4, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.605954', 7041, 4, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.611958', 7042, 4, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.616955', 7043, 4, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.623959', 7044, 4, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.628969', 7045, 5, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.635033', 7046, 5, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.640055', 7047, 5, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.646957', 7048, 5, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.651974', 7049, 5, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.657957', 7050, 5, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.663741', 7051, 6, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.668957', 7052, 6, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.674956', 7053, 6, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.682960', 7054, 6, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.687955', 7055, 6, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.695282', 7056, 6, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.700953', 7057, 7, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.705957', 7058, 7, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.710962', 7059, 7, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.715954', 7060, 7, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.719965', 7061, 7, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.724954', 7062, 7, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.730239', 7063, 8, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.734958', 7064, 8, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.739952', 7065, 8, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.742950', 7066, 8, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.746956', 7067, 8, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.751424', 7068, 8, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.754949', 7069, 9, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.758952', 7070, 9, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.761951', 7071, 9, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.765953', 7072, 9, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.770953', 7073, 9, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.774955', 7074, 9, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.778952', 7075, 10, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.783955', 7076, 10, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.787952', 7077, 10, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.791953', 7078, 10, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.795954', 7079, 10, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.799951', 7080, 10, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.804958', 7081, 11, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.808952', 7082, 11, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.813954', 7083, 11, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.818421', 7084, 11, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.822971', 7085, 11, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.826957', 7086, 11, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.830950', 7087, 12, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.835102', 7088, 12, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.838953', 7089, 12, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.842950', 7090, 12, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.847955', 7091, 12, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.851951', 7092, 12, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.856952', 7093, 13, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.861953', 7094, 13, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.865969', 7095, 13, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.870050', 7096, 13, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.874956', 7097, 13, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.878956', 7098, 13, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.883952', 7099, 14, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.889114', 7100, 14, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.893958', 7101, 14, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.898959', 7102, 14, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.903957', 7103, 14, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.907957', 7104, 14, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.913015', 7105, 15, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.917956', 7106, 15, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.923075', 7107, 15, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.927956', 7108, 15, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.932074', 7109, 15, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.936954', 7110, 15, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.940953', 7111, 16, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.944955', 7112, 16, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.948952', 7113, 16, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.954189', 7114, 16, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.958959', 7115, 16, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.963960', 7116, 16, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.968955', 7117, 17, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.972956', 7118, 17, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:29.976952', 7119, 17, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:29.980952', 7120, 17, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:29.985135', 7121, 17, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:29.989958', 7122, 17, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:29.993961', 7123, 18, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:29.998153', 7124, 18, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.002957', 7125, 18, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.006958', 7126, 18, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.011956', 7127, 18, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.017081', 7128, 18, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.021956', 7129, 19, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.026952', 7130, 19, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.030953', 7131, 19, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.037178', 7132, 19, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.040953', 7133, 19, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.045958', 7134, 19, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.049963', 7135, 20, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.055957', 7136, 20, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.059952', 7137, 20, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.064957', 7138, 20, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.070956', 7139, 20, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.074954', 7140, 20, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.080953', 7141, 21, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.084954', 7142, 21, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.089953', 7143, 21, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.096072', 7144, 21, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.101955', 7145, 21, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.105953', 7146, 21, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.111956', 7147, 22, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.116953', 7148, 22, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.121956', 7149, 22, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.126572', 7150, 22, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.129951', 7151, 22, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.133951', 7152, 22, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.137956', 7153, 23, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.141951', 7154, 23, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.145953', 7155, 23, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.149957', 7156, 23, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.153958', 7157, 23, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.157957', 7158, 23, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.161950', 7159, 24, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.165956', 7160, 24, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.170955', 7161, 24, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.174020', 7162, 24, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.177953', 7163, 24, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.182950', 7164, 24, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.186951', 7165, 25, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.191080', 7166, 25, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.194955', 7167, 25, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.198960', 7168, 25, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.203954', 7169, 25, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.208957', 7170, 25, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.214203', 7171, 26, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.217954', 7172, 26, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.223056', 7173, 26, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.227963', 7174, 26, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.232957', 7175, 26, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.236954', 7176, 26, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.241956', 7177, 27, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.246953', 7178, 27, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.251954', 7179, 27, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.256955', 7180, 27, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.261951', 7181, 27, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.265962', 7182, 27, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.270956', 7183, 28, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.275955', 7184, 28, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.280958', 7185, 28, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.285958', 7186, 28, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.290954', 7187, 28, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.294954', 7188, 28, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.298954', 7189, 29, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.303954', 7190, 29, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.307952', 7191, 29, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.310955', 7192, 29, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.314954', 7193, 29, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.318978', 7194, 29, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.322950', 7195, 30, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.327041', 7196, 30, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.331954', 7197, 30, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.335954', 7198, 30, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.340561', 7199, 30, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.343953', 7200, 30, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.349105', 7201, 31, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.352953', 7202, 31, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.356953', 7203, 31, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.360952', 7204, 31, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.363951', 7205, 31, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.368957', 7206, 31, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.372104', 7207, 32, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.376957', 7208, 32, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.380957', 7209, 32, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.384952', 7210, 32, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.389105', 7211, 32, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.392954', 7212, 32, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.396951', 7213, 33, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.400959', 7214, 33, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.404956', 7215, 33, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.408955', 7216, 33, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.412956', 7217, 33, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.416956', 7218, 33, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.420956', 7219, 34, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.424950', 7220, 34, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.428955', 7221, 34, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.432956', 7222, 34, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.437069', 7223, 34, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.440954', 7224, 34, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.444957', 7225, 35, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.448953', 7226, 35, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.453954', 7227, 35, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.456956', 7228, 35, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.461954', 7229, 35, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.466378', 7230, 35, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.469955', 7231, 36, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.474957', 7232, 36, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.479038', 7233, 36, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.482954', 7234, 36, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.486956', 7235, 36, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.490952', 7236, 36, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.495954', 7237, 37, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.498951', 7238, 37, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.503953', 7239, 37, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.508954', 7240, 37, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.512955', 7241, 37, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.516951', 7242, 37, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.521956', 7243, 38, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.526955', 7244, 38, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.531953', 7245, 38, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.536955', 7246, 38, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.540956', 7247, 38, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.544960', 7248, 38, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.547952', 7249, 39, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.552953', 7250, 39, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.556954', 7251, 39, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.560964', 7252, 39, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.564963', 7253, 39, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.570964', 7254, 39, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.575964', 7255, 40, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.579962', 7256, 40, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.585112', 7257, 40, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.589957', 7258, 40, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.593958', 7259, 40, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.600967', 7260, 40, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.607974', 7261, 41, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.615959', 7262, 41, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.624966', 7263, 41, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.631960', 7264, 41, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.638955', 7265, 41, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.645962', 7266, 41, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.654964', 7267, 42, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.661958', 7268, 42, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.670960', 7269, 42, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.680966', 7270, 42, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.691963', 7271, 42, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.700965', 7272, 42, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.710965', 7273, 43, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.720958', 7274, 43, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.731379', 7275, 43, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.740965', 7276, 43, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.747955', 7277, 43, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.752958', 7278, 43, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.756956', 7279, 44, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.761955', 7280, 44, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.766961', 7281, 44, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.771956', 7282, 44, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.775961', 7283, 44, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.781956', 7284, 44, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.786054', 7285, 45, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.789952', 7286, 45, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.792952', 7287, 45, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.797081', 7288, 45, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.801956', 7289, 45, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.806244', 7290, 45, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.810956', 7291, 46, NULL, 252, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 2, '2024-06-10 16:14:30.815953', 7292, 46, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.820132', 7293, 46, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.824950', 7294, 46, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.827952', 7295, 46, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.831951', 7296, 46, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.834954', 7297, 47, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.839027', 7298, 47, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.842953', 7299, 47, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.845952', 7300, 47, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.849957', 7301, 47, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.853960', 7302, 47, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.857140', 7303, 48, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.861192', 7304, 48, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.863953', 7305, 48, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.867955', 7306, 48, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.871956', 7307, 48, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.875953', 7308, 48, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.879956', 7309, 49, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.884184', 7310, 49, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.887958', 7311, 49, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.891956', 7312, 49, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.895958', 7313, 49, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.899956', 7314, 49, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.904953', 7315, 50, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.908958', 7316, 50, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.912954', 7317, 50, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.917954', 7318, 50, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.921963', 7319, 50, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.926956', 7320, 50, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.930955', 7321, 51, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.935952', 7322, 51, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.940955', 7323, 51, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.944964', 7324, 51, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.948999', 7325, 51, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.952954', 7326, 51, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.957090', 7327, 52, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.960956', 7328, 52, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.965956', 7329, 52, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.969058', 7330, 52, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.973951', 7331, 52, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.977959', 7332, 52, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:30.982115', 7333, 53, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:30.984955', 7334, 53, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:30.989002', 7335, 53, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:30.991987', 7336, 53, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:30.994950', 7337, 53, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:30.998018', 7338, 53, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.001956', 7339, 54, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.005958', 7340, 54, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.009953', 7341, 54, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.013956', 7342, 54, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.017015', 7343, 54, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.020952', 7344, 54, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.023953', 7345, 55, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.027956', 7346, 55, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.030950', 7347, 55, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.034955', 7348, 55, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.039107', 7349, 55, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.042953', 7350, 55, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.047057', 7351, 56, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.049953', 7352, 56, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.053953', 7353, 56, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.056954', 7354, 56, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.060955', 7355, 56, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.064450', 7356, 56, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.067957', 7357, 57, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.071957', 7358, 57, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.076061', 7359, 57, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.080012', 7360, 57, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.082951', 7361, 57, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.086960', 7362, 57, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.091951', 7363, 58, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.095953', 7364, 58, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.098956', 7365, 58, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.102956', 7366, 58, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.106260', 7367, 58, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.108956', 7368, 58, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.113055', 7369, 59, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.116952', 7370, 59, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.120956', 7371, 59, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.123954', 7372, 59, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.127476', 7373, 59, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.130954', 7374, 59, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.134958', 7375, 60, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.139047', 7376, 60, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.141959', 7377, 60, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.145953', 7378, 60, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.149057', 7379, 60, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.152685', 7380, 60, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.156010', 7381, 61, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.158954', 7382, 61, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.162952', 7383, 61, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.165956', 7384, 61, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.169954', 7385, 61, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.173953', 7386, 61, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.176953', 7387, 62, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.179955', 7388, 62, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.183951', 7389, 62, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.186955', 7390, 62, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.190095', 7391, 62, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.193954', 7392, 62, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.196951', 7393, 63, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.201161', 7394, 63, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.205167', 7395, 63, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.208953', 7396, 63, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.213082', 7397, 63, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.217004', 7398, 63, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.220955', 7399, 64, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.224953', 7400, 64, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.228955', 7401, 64, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.239960', 7402, 64, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.246061', 7403, 64, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.251815', 7404, 64, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.255952', 7405, 65, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.259962', 7406, 65, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.263961', 7407, 65, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.267954', 7408, 65, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.274953', 7409, 65, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.278956', 7410, 65, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.289953', 7411, 66, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.298090', 7412, 66, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.301959', 7413, 66, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.313953', 7414, 66, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.322952', 7415, 66, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.327136', 7416, 66, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.335956', 7417, 67, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.339955', 7418, 67, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.348952', 7419, 67, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.355488', 7420, 67, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.358955', 7421, 67, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.361954', 7422, 67, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.365956', 7423, 68, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.373117', 7424, 68, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.376958', 7425, 68, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.380958', 7426, 68, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.383957', 7427, 68, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.387955', 7428, 68, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.391009', 7429, 69, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.393957', 7430, 69, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.397954', 7431, 69, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.402967', 7432, 69, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.406376', 7433, 69, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.409957', 7434, 69, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.412954', 7435, 70, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.415955', 7436, 70, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.419980', 7437, 70, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.423270', 7438, 70, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.426953', 7439, 70, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.429956', 7440, 70, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.433954', 7441, 71, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.437959', 7442, 71, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.442958', 7443, 71, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.445954', 7444, 71, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.448952', 7445, 71, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.453054', 7446, 71, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.455951', 7447, 72, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.458955', 7448, 72, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.462953', 7449, 72, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.466954', 7450, 72, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.470954', 7451, 72, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.474951', 7452, 72, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.477956', 7453, 73, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.482959', 7454, 73, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.487964', 7455, 73, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.492956', 7456, 73, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.498953', 7457, 73, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.503956', 7458, 73, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.509974', 7459, 74, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.515963', 7460, 74, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.521114', 7461, 74, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.526115', 7462, 74, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.532968', 7463, 74, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.537968', 7464, 74, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.544973', 7465, 75, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.550158', 7466, 75, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.556106', 7467, 75, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.560957', 7468, 75, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.566966', 7469, 75, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.572966', 7470, 75, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.579502', 7471, 76, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.583972', 7472, 76, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.589970', 7473, 76, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.596194', 7474, 76, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.602232', 7475, 76, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.607970', 7476, 76, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.614146', 7477, 77, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.618980', 7478, 77, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.625132', 7479, 77, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.629957', 7480, 77, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.636960', 7481, 77, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.643966', 7482, 77, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-10 16:14:31.649966', 7483, 78, NULL, 252, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-10 16:14:31.657137', 7484, 78, NULL, 252, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-10 16:14:31.663961', 7485, 78, NULL, 252, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-10 16:14:31.669990', 7486, 78, NULL, 252, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-10 16:14:31.676973', 7487, 78, NULL, 252, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-10 16:14:31.683967', 7488, 78, NULL, 252, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.779372', 7489, 1, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.793386', 7490, 1, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.796347', 7491, 1, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.799340', 7492, 1, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.803347', 7493, 1, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.805340', 7494, 1, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.809389', 7495, 2, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.812344', 7496, 2, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.815344', 7497, 2, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.819380', 7498, 2, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.821342', 7499, 2, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.824339', 7500, 2, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.828384', 7501, 3, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.832340', 7502, 3, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.835399', 7503, 3, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.839340', 7504, 3, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.842345', 7505, 3, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.845445', 7506, 3, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.848340', 7507, 4, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.851347', 7508, 4, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.854446', 7509, 4, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.857341', 7510, 4, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.860348', 7511, 4, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.863448', 7512, 4, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.867343', 7513, 5, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.870458', 7514, 5, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.873382', 7515, 5, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.876350', 7516, 5, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.879341', 7517, 5, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.881341', 7518, 5, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.884343', 7519, 6, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.887343', 7520, 6, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.889373', 7521, 6, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.892354', 7522, 6, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.895344', 7523, 6, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.898342', 7524, 6, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.901343', 7525, 7, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.904450', 7526, 7, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.906339', 7527, 7, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.910343', 7528, 7, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.912343', 7529, 7, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.915339', 7530, 7, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.918345', 7531, 8, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.920446', 7532, 8, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.923370', 7533, 8, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.925353', 7534, 8, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.928373', 7535, 8, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.931376', 7536, 8, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.934382', 7537, 9, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.937607', 7538, 9, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.939442', 7539, 9, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.942347', 7540, 9, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.945344', 7541, 9, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.947344', 7542, 9, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.950342', 7543, 10, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.953343', 7544, 10, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.955341', 7545, 10, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.958342', 7546, 10, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.961377', 7547, 10, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.964387', 7548, 10, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.967346', 7549, 11, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.970380', 7550, 11, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.973339', 7551, 11, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.976343', 7552, 11, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.979415', 7553, 11, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.981524', 7554, 11, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:45.984442', 7555, 12, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:45.987446', 7556, 12, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:45.989422', 7557, 12, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:45.992353', 7558, 12, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:45.995450', 7559, 12, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:45.998386', 7560, 12, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.001347', 7561, 13, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.004448', 7562, 13, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.007388', 7563, 13, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.010408', 7564, 13, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.012375', 7565, 13, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.016343', 7566, 13, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.020343', 7567, 14, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.023344', 7568, 14, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.026347', 7569, 14, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.029376', 7570, 14, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.032344', 7571, 14, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.036342', 7572, 14, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.038444', 7573, 15, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.041344', 7574, 15, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.045411', 7575, 15, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.047445', 7576, 15, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.050350', 7577, 15, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.053379', 7578, 15, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.056376', 7579, 16, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.059391', 7580, 16, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.061389', 7581, 16, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.063378', 7582, 16, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.068350', 7583, 16, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.070446', 7584, 16, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.072375', 7585, 17, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.075434', 7586, 17, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.078443', 7587, 17, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.080447', 7588, 17, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.083344', 7589, 17, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.086447', 7590, 17, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.089402', 7591, 18, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.098369', 7592, 18, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.108356', 7593, 18, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.118356', 7594, 18, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.124347', 7595, 18, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.129350', 7596, 18, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.133348', 7597, 19, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.138353', 7598, 19, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.141343', 7599, 19, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.145341', 7600, 19, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.147340', 7601, 19, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.151346', 7602, 19, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.154342', 7603, 20, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.156339', 7604, 20, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.159347', 7605, 20, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.162378', 7606, 20, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.165343', 7607, 20, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.168343', 7608, 20, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.171340', 7609, 21, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.174341', 7610, 21, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.178338', 7611, 21, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.180378', 7612, 21, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.183340', 7613, 21, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.187381', 7614, 21, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.189429', 7615, 22, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.193341', 7616, 22, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.195384', 7617, 22, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.197429', 7618, 22, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.199343', 7619, 22, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.203340', 7620, 22, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.206340', 7621, 23, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.209364', 7622, 23, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.212343', 7623, 23, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.214379', 7624, 23, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.216340', 7625, 23, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.219424', 7626, 23, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.221377', 7627, 24, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.224341', 7628, 24, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.227339', 7629, 24, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.229339', 7630, 24, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.232341', 7631, 24, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.235361', 7632, 24, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.237344', 7633, 25, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.241341', 7634, 25, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.245339', 7635, 25, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.247344', 7636, 25, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.249340', 7637, 25, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.252345', 7638, 25, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.254462', 7639, 26, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.257342', 7640, 26, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.260340', 7641, 26, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.262339', 7642, 26, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.264340', 7643, 26, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.267355', 7644, 26, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.270344', 7645, 27, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.273345', 7646, 27, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.278340', 7647, 27, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.281346', 7648, 27, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.284343', 7649, 27, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.287345', 7650, 27, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.289341', 7651, 28, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.292340', 7652, 28, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.295341', 7653, 28, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.297340', 7654, 28, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.299340', 7655, 28, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.303344', 7656, 28, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.305339', 7657, 29, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.308375', 7658, 29, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.312343', 7659, 29, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.314446', 7660, 29, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.318344', 7661, 29, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.320341', 7662, 29, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.322341', 7663, 30, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.324345', 7664, 30, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.328341', 7665, 30, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.330340', 7666, 30, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.332340', 7667, 30, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.336337', 7668, 30, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.338343', 7669, 31, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.340382', 7670, 31, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.344341', 7671, 31, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.346361', 7672, 31, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.348377', 7673, 31, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.351349', 7674, 31, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.353345', 7675, 32, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.356341', 7676, 32, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.358340', 7677, 32, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.361340', 7678, 32, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.363346', 7679, 32, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.366343', 7680, 32, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.369341', 7681, 33, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.371386', 7682, 33, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.373369', 7683, 33, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.376343', 7684, 33, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.379347', 7685, 33, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.382342', 7686, 33, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.385363', 7687, 34, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.387341', 7688, 34, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.390339', 7689, 34, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.393344', 7690, 34, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.395341', 7691, 34, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.397339', 7692, 34, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.410360', 7693, 35, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.417356', 7694, 35, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.423359', 7695, 35, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.430349', 7696, 35, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.436362', 7697, 35, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.442357', 7698, 35, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.449348', 7699, 36, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.454352', 7700, 36, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.457353', 7701, 36, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.461347', 7702, 36, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.464344', 7703, 36, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.467347', 7704, 36, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.470378', 7705, 37, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.472345', 7706, 37, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.475352', 7707, 37, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.478341', 7708, 37, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.480394', 7709, 37, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.483348', 7710, 37, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.486343', 7711, 38, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.488377', 7712, 38, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.491349', 7713, 38, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.494339', 7714, 38, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.496377', 7715, 38, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.499344', 7716, 38, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.501371', 7717, 39, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.504343', 7718, 39, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.506389', 7719, 39, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.509348', 7720, 39, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.511344', 7721, 39, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.514367', 7722, 39, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.517347', 7723, 40, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.520449', 7724, 40, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.522469', 7725, 40, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.525384', 7726, 40, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.527378', 7727, 40, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.530437', 7728, 40, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.532341', 7729, 41, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.535380', 7730, 41, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.538383', 7731, 41, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.540387', 7732, 41, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.543349', 7733, 41, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.546353', 7734, 41, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.550343', 7735, 42, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.553382', 7736, 42, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.556348', 7737, 42, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.559341', 7738, 42, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.562340', 7739, 42, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.565340', 7740, 42, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.569345', 7741, 43, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.571379', 7742, 43, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.575343', 7743, 43, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.578345', 7744, 43, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.580451', 7745, 43, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.585378', 7746, 43, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.588345', 7747, 44, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.591341', 7748, 44, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.594347', 7749, 44, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.597379', 7750, 44, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.600383', 7751, 44, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.603450', 7752, 44, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.606385', 7753, 45, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.609344', 7754, 45, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.612346', 7755, 45, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.614446', 7756, 45, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.618362', 7757, 45, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.621445', 7758, 45, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.624342', 7759, 46, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.628347', 7760, 46, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.630342', 7761, 46, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.633345', 7762, 46, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.636451', 7763, 46, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.639378', 7764, 46, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.642345', 7765, 47, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.645380', 7766, 47, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.647446', 7767, 47, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.651359', 7768, 47, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.654377', 7769, 47, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.657342', 7770, 47, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.660346', 7771, 48, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.662525', 7772, 48, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.665340', 7773, 48, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.668358', 7774, 48, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.671345', 7775, 48, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.673378', 7776, 48, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.677392', 7777, 49, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.679447', 7778, 49, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.682347', 7779, 49, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.685361', 7780, 49, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.688381', 7781, 49, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.691347', 7782, 49, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.695343', 7783, 50, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.697447', 7784, 50, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.700407', 7785, 50, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.703449', 7786, 50, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.706386', 7787, 50, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.709362', 7788, 50, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.711377', 7789, 51, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.714444', 7790, 51, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.717344', 7791, 51, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.721343', 7792, 51, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.724346', 7793, 51, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.727494', 7794, 51, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.730507', 7795, 52, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.733362', 7796, 52, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.736347', 7797, 52, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.739504', 7798, 52, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.743381', 7799, 52, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.745424', 7800, 52, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.748432', 7801, 53, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.751350', 7802, 53, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.754347', 7803, 53, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.757351', 7804, 53, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.761345', 7805, 53, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.764344', 7806, 53, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.767386', 7807, 54, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.770378', 7808, 54, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.773386', 7809, 54, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.776393', 7810, 54, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.779376', 7811, 54, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.781441', 7812, 54, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.784395', 7813, 55, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.788340', 7814, 55, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.790341', 7815, 55, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.794348', 7816, 55, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.796382', 7817, 55, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.799345', 7818, 55, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.803457', 7819, 56, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.806403', 7820, 56, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.812366', 7821, 56, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.818351', 7822, 56, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.824358', 7823, 56, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.830350', 7824, 56, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.835404', 7825, 57, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.838460', 7826, 57, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.842350', 7827, 57, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.845348', 7828, 57, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.849346', 7829, 57, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.852351', 7830, 57, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.856352', 7831, 58, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.860400', 7832, 58, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.863455', 7833, 58, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.866351', 7834, 58, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.870455', 7835, 58, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.873355', 7836, 58, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.877423', 7837, 59, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.880459', 7838, 59, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.884349', 7839, 59, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.887449', 7840, 59, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.891355', 7841, 59, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.895348', 7842, 59, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.898346', 7843, 60, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.902344', 7844, 60, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.905352', 7845, 60, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.908349', 7846, 60, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.912350', 7847, 60, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.915344', 7848, 60, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.918435', 7849, 61, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.921401', 7850, 61, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.926352', 7851, 61, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.929455', 7852, 61, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.933343', 7853, 61, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.936446', 7854, 61, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.940342', 7855, 62, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.943396', 7856, 62, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.946450', 7857, 62, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.950349', 7858, 62, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.953355', 7859, 62, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.956448', 7860, 62, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.961351', 7861, 63, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.965344', 7862, 63, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.968391', 7863, 63, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.972350', 7864, 63, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:46.975354', 7865, 63, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.979389', 7866, 63, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:46.982344', 7867, 64, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:46.986383', 7868, 64, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:46.988449', 7869, 64, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:46.992354', 7870, 64, NULL, 302, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 5, '2024-06-13 14:01:46.996378', 7871, 64, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:46.999343', 7872, 64, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.003345', 7873, 65, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.005379', 7874, 65, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.008342', 7875, 65, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.010619', 7876, 65, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.013395', 7877, 65, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.015345', 7878, 65, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.018364', 7879, 66, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.021344', 7880, 66, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.023346', 7881, 66, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.027345', 7882, 66, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.030342', 7883, 66, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.033361', 7884, 66, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.035377', 7885, 67, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.037378', 7886, 67, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.040340', 7887, 67, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.042345', 7888, 67, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.045401', 7889, 67, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.047446', 7890, 67, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.049345', 7891, 68, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.052342', 7892, 68, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.054462', 7893, 68, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.056457', 7894, 68, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.059385', 7895, 68, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.061429', 7896, 68, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.064384', 7897, 69, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.067344', 7898, 69, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.069379', 7899, 69, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.071385', 7900, 69, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.073364', 7901, 69, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.076400', 7902, 69, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.078539', 7903, 70, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.080534', 7904, 70, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.082342', 7905, 70, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.085414', 7906, 70, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.087412', 7907, 70, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.089402', 7908, 70, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.091341', 7909, 71, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.094557', 7910, 71, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.097346', 7911, 71, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.099345', 7912, 71, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.102343', 7913, 71, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.104400', 7914, 71, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.106399', 7915, 72, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.109383', 7916, 72, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.111411', 7917, 72, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.113447', 7918, 72, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.115345', 7919, 72, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.118340', 7920, 72, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.120342', 7921, 73, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.136340', 7922, 73, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.138459', 7923, 73, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.140344', 7924, 73, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.143384', 7925, 73, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.145466', 7926, 73, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.147460', 7927, 74, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.150462', 7928, 74, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.152344', 7929, 74, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.155458', 7930, 74, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.157345', 7931, 74, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.160343', 7932, 74, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.162380', 7933, 75, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.165344', 7934, 75, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.168378', 7935, 75, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.171341', 7936, 75, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.173340', 7937, 75, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.176468', 7938, 75, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.178467', 7939, 76, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.180469', 7940, 76, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.183370', 7941, 76, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.185457', 7942, 76, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.187457', 7943, 76, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.190341', 7944, 76, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.193338', 7945, 77, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.195338', 7946, 77, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.197358', 7947, 77, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.201349', 7948, 77, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.203339', 7949, 77, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.206482', 7950, 77, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-13 14:01:47.209425', 7951, 78, NULL, 302, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-13 14:01:47.211422', 7952, 78, NULL, 302, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-13 14:01:47.214339', 7953, 78, NULL, 302, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-13 14:01:47.216340', 7954, 78, NULL, 302, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-13 14:01:47.218462', 7955, 78, NULL, 302, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-13 14:01:47.220459', 7956, 78, NULL, 302, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.679395', 7957, 1, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.693385', 7958, 1, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.698381', 7959, 1, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.701417', 7960, 1, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:28.706449', 7961, 1, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:28.714472', 7962, 1, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.722383', 7963, 2, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.731464', 7964, 2, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.740390', 7965, 2, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.749386', 7966, 2, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:28.757387', 7967, 2, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:28.764387', 7968, 2, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.773388', 7969, 3, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.782388', 7970, 3, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.790385', 7971, 3, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.801445', 7972, 3, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:28.811447', 7973, 3, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:28.820389', 7974, 3, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.828389', 7975, 4, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.839443', 7976, 4, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.848387', 7977, 4, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.856386', 7978, 4, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:28.863523', 7979, 4, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:28.871403', 7980, 4, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.878389', 7981, 5, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.885387', 7982, 5, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.893099', 7983, 5, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.900402', 7984, 5, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:28.907479', 7985, 5, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:28.913558', 7986, 5, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.920382', 7987, 6, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.926381', 7988, 6, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.935389', 7989, 6, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.943387', 7990, 6, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:28.951389', 7991, 6, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:28.960404', 7992, 6, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:28.969393', 7993, 7, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:28.978387', 7994, 7, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:28.986522', 7995, 7, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:28.995394', 7996, 7, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.003394', 7997, 7, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.011394', 7998, 7, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.019382', 7999, 8, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.026394', 8000, 8, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.035593', 8001, 8, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.044387', 8002, 8, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.052491', 8003, 8, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.061873', 8004, 8, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.069390', 8005, 9, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.076378', 8006, 9, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.082383', 8007, 9, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.088387', 8008, 9, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.094387', 8009, 9, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.101386', 8010, 9, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.109382', 8011, 10, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.115382', 8012, 10, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.121382', 8013, 10, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.128546', 8014, 10, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.137463', 8015, 10, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.144030', 8016, 10, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.151386', 8017, 11, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.160398', 8018, 11, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.177395', 8019, 11, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.184399', 8020, 11, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.191385', 8021, 11, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.199402', 8022, 11, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.206389', 8023, 12, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.213539', 8024, 12, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.219390', 8025, 12, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.226396', 8026, 12, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.233873', 8027, 12, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.240390', 8028, 12, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.248386', 8029, 13, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.255542', 8030, 13, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.262517', 8031, 13, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.270390', 8032, 13, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.276624', 8033, 13, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.282382', 8034, 13, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.290384', 8035, 14, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.296872', 8036, 14, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.303415', 8037, 14, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.310764', 8038, 14, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.317381', 8039, 14, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.323381', 8040, 14, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.330390', 8041, 15, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.337392', 8042, 15, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.344549', 8043, 15, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.350383', 8044, 15, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.357391', 8045, 15, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.365011', 8046, 15, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.371386', 8047, 16, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.377381', 8048, 16, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.385390', 8049, 16, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.391388', 8050, 16, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.398396', 8051, 16, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.406461', 8052, 16, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.416392', 8053, 17, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.423677', 8054, 17, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.432391', 8055, 17, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.440140', 8056, 17, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.447508', 8057, 17, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.465519', 8058, 17, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.473386', 8059, 18, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.480718', 8060, 18, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.486748', 8061, 18, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.493744', 8062, 18, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.501747', 8063, 18, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.508745', 8064, 18, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.515740', 8065, 19, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.521159', 8066, 19, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.526746', 8067, 19, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.531743', 8068, 19, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.535751', 8069, 19, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.541741', 8070, 19, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.545804', 8071, 20, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.550742', 8072, 20, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.556746', 8073, 20, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.562747', 8074, 20, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.569961', 8075, 20, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.575739', 8076, 20, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.581006', 8077, 21, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.586739', 8078, 21, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.590834', 8079, 21, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.595825', 8080, 21, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.601044', 8081, 21, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.606742', 8082, 21, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.616007', 8083, 22, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.620740', 8084, 22, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.624962', 8085, 22, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.628738', 8086, 22, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.632740', 8087, 22, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.637780', 8088, 22, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.640804', 8089, 23, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.644738', 8090, 23, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.647781', 8091, 23, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.651811', 8092, 23, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.655868', 8093, 23, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.658809', 8094, 23, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.662846', 8095, 24, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.666743', 8096, 24, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.670739', 8097, 24, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.672736', 8098, 24, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.675738', 8099, 24, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.678739', 8100, 24, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.681739', 8101, 25, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.684736', 8102, 25, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.687736', 8103, 25, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.690738', 8104, 25, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.693738', 8105, 25, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.696856', 8106, 25, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.699737', 8107, 26, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.703737', 8108, 26, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.705737', 8109, 26, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.708737', 8110, 26, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.711736', 8111, 26, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.714736', 8112, 26, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.717736', 8113, 27, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.720736', 8114, 27, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.723737', 8115, 27, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.726739', 8116, 27, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.731004', 8117, 27, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.733792', 8118, 27, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.736808', 8119, 28, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.739799', 8120, 28, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.741736', 8121, 28, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.744738', 8122, 28, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.747909', 8123, 28, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.751737', 8124, 28, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.754851', 8125, 29, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.757968', 8126, 29, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.761742', 8127, 29, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.765992', 8128, 29, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.769754', 8129, 29, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.772738', 8130, 29, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.775791', 8131, 30, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.779749', 8132, 30, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.782739', 8133, 30, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.786738', 8134, 30, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.789740', 8135, 30, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.792739', 8136, 30, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.796742', 8137, 31, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.800737', 8138, 31, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.804739', 8139, 31, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.808740', 8140, 31, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.812740', 8141, 31, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.815847', 8142, 31, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.819746', 8143, 32, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.822740', 8144, 32, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.826741', 8145, 32, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.830742', 8146, 32, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.833736', 8147, 32, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.838736', 8148, 32, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.842742', 8149, 33, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.846011', 8150, 33, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.849740', 8151, 33, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.852744', 8152, 33, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.856744', 8153, 33, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.859740', 8154, 33, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.863833', 8155, 34, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.866739', 8156, 34, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.870741', 8157, 34, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.873813', 8158, 34, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.876739', 8159, 34, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.879740', 8160, 34, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.883740', 8161, 35, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.889742', 8162, 35, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.893743', 8163, 35, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.899741', 8164, 35, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.904751', 8165, 35, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.909984', 8166, 35, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.913746', 8167, 36, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.917747', 8168, 36, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.920743', 8169, 36, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.923745', 8170, 36, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.926744', 8171, 36, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.931745', 8172, 36, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.935748', 8173, 37, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.939743', 8174, 37, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.941744', 8175, 37, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.945745', 8176, 37, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.949149', 8177, 37, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.951736', 8178, 37, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.955742', 8179, 38, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.959746', 8180, 38, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.963932', 8181, 38, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.968745', 8182, 38, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:29.973748', 8183, 38, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:29.978470', 8184, 38, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:29.982748', 8185, 39, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:29.986747', 8186, 39, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:29.990781', 8187, 39, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:29.998751', 8188, 39, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.007757', 8189, 39, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.013778', 8190, 39, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.019976', 8191, 40, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.026746', 8192, 40, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.035207', 8193, 40, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.042752', 8194, 40, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.050749', 8195, 40, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.058881', 8196, 40, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.068743', 8197, 41, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.075747', 8198, 41, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.083748', 8199, 41, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.090749', 8200, 41, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.100274', 8201, 41, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.106749', 8202, 41, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.113745', 8203, 42, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.120058', 8204, 42, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.131751', 8205, 42, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.139745', 8206, 42, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.144911', 8207, 42, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.151941', 8208, 42, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.160919', 8209, 43, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.168744', 8210, 43, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.173879', 8211, 43, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.178764', 8212, 43, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.181739', 8213, 43, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.185743', 8214, 43, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.187739', 8215, 44, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.190739', 8216, 44, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.194748', 8217, 44, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.197969', 8218, 44, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.200740', 8219, 44, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.204737', 8220, 44, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.207924', 8221, 45, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.210943', 8222, 45, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.214026', 8223, 45, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.216736', 8224, 45, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.219757', 8225, 45, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.222997', 8226, 45, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.225858', 8227, 46, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.230744', 8228, 46, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.233986', 8229, 46, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.238106', 8230, 46, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.241739', 8231, 46, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.244740', 8232, 46, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.248739', 8233, 47, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.252754', 8234, 47, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.255737', 8235, 47, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.258735', 8236, 47, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.261936', 8237, 47, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.265741', 8238, 47, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.269747', 8239, 48, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.272734', 8240, 48, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.275155', 8241, 48, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.278738', 8242, 48, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.281738', 8243, 48, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.284737', 8244, 48, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.286736', 8245, 49, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.289737', 8246, 49, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.292833', 8247, 49, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.296742', 8248, 49, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.299797', 8249, 49, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.302744', 8250, 49, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.304737', 8251, 50, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.307736', 8252, 50, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.310912', 8253, 50, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.313735', 8254, 50, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.315736', 8255, 50, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.318735', 8256, 50, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.320912', 8257, 51, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.322735', 8258, 51, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.325737', 8259, 51, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.329158', 8260, 51, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.331853', 8261, 51, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.333736', 8262, 51, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.337736', 8263, 52, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.339735', 8264, 52, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.342854', 8265, 52, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.344736', 8266, 52, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.347735', 8267, 52, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.349736', 8268, 52, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.352735', 8269, 53, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.355735', 8270, 53, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.358740', 8271, 53, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.362156', 8272, 53, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.364737', 8273, 53, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.367746', 8274, 53, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.372744', 8275, 54, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.375891', 8276, 54, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.380134', 8277, 54, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.384000', 8278, 54, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.388742', 8279, 54, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.391741', 8280, 54, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.396748', 8281, 55, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.401742', 8282, 55, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.408750', 8283, 55, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.414746', 8284, 55, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.421063', 8285, 55, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.426746', 8286, 55, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.432746', 8287, 56, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.438792', 8288, 56, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.444749', 8289, 56, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.452752', 8290, 56, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.458743', 8291, 56, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.465768', 8292, 56, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.472740', 8293, 57, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.477753', 8294, 57, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.483740', 8295, 57, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.489742', 8296, 57, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.496753', 8297, 57, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.503749', 8298, 57, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.508750', 8299, 58, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.513743', 8300, 58, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.519748', 8301, 58, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.524743', 8302, 58, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.530749', 8303, 58, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.536748', 8304, 58, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.541745', 8305, 59, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.547749', 8306, 59, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.552747', 8307, 59, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.557739', 8308, 59, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.563748', 8309, 59, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.569750', 8310, 59, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.575752', 8311, 60, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.581749', 8312, 60, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.586746', 8313, 60, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.593768', 8314, 60, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.599749', 8315, 60, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.605746', 8316, 60, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.610935', 8317, 61, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.616748', 8318, 61, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.622750', 8319, 61, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.628745', 8320, 61, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.634743', 8321, 61, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.641265', 8322, 61, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.646749', 8323, 62, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.654273', 8324, 62, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.660901', 8325, 62, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.667747', 8326, 62, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.673739', 8327, 62, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.679742', 8328, 62, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.685750', 8329, 63, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.690748', 8330, 63, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.696747', 8331, 63, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.703744', 8332, 63, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.709752', 8333, 63, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.716744', 8334, 63, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.723750', 8335, 64, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.730751', 8336, 64, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.737742', 8337, 64, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.743746', 8338, 64, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.751748', 8339, 64, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.759744', 8340, 64, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.768748', 8341, 65, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.776745', 8342, 65, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.782874', 8343, 65, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.789749', 8344, 65, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.796757', 8345, 65, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.803748', 8346, 65, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.809756', 8347, 66, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.816970', 8348, 66, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.824118', 8349, 66, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.831757', 8350, 66, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.837747', 8351, 66, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.842747', 8352, 66, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.847739', 8353, 67, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.851032', 8354, 67, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.854738', 8355, 67, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.858741', 8356, 67, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.862744', 8357, 67, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.866743', 8358, 67, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.870739', 8359, 68, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.874743', 8360, 68, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.879888', 8361, 68, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.883740', 8362, 68, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.886744', 8363, 68, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.890741', 8364, 68, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.894740', 8365, 69, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.898746', 8366, 69, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.903743', 8367, 69, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.908750', 8368, 69, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.913750', 8369, 69, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.917960', 8370, 69, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.922744', 8371, 70, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.927752', 8372, 70, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.932747', 8373, 70, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.937743', 8374, 70, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.942751', 8375, 70, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.947775', 8376, 70, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.953160', 8377, 71, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.957742', 8378, 71, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.961746', 8379, 71, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:30.967747', 8380, 71, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:30.973751', 8381, 71, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:30.979756', 8382, 71, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:30.985756', 8383, 72, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:30.991742', 8384, 72, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:30.997758', 8385, 72, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.004749', 8386, 72, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.009750', 8387, 72, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.015753', 8388, 72, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:31.020746', 8389, 73, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:31.025752', 8390, 73, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:31.032763', 8391, 73, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.038743', 8392, 73, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.044753', 8393, 73, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.049758', 8394, 73, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:31.054743', 8395, 74, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:31.059745', 8396, 74, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:31.065753', 8397, 74, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.071743', 8398, 74, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.077748', 8399, 74, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.082744', 8400, 74, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:31.088756', 8401, 75, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:31.094750', 8402, 75, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:31.100753', 8403, 75, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.107751', 8404, 75, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.114746', 8405, 75, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.119742', 8406, 75, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:31.124747', 8407, 76, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:31.130749', 8408, 76, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:31.135919', 8409, 76, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.142747', 8410, 76, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.147742', 8411, 76, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.152750', 8412, 76, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:31.158760', 8413, 77, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:31.163745', 8414, 77, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:31.169749', 8415, 77, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.175300', 8416, 77, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.179749', 8417, 77, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.185981', 8418, 77, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:19:31.192747', 8419, 78, NULL, 352, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:19:31.199746', 8420, 78, NULL, 352, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:19:31.206748', 8421, 78, NULL, 352, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:19:31.211745', 8422, 78, NULL, 352, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:19:31.217749', 8423, 78, NULL, 352, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:19:31.224744', 8424, 78, NULL, 352, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.480940', 8425, 1, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.487932', 8426, 1, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.492992', 8427, 1, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.498934', 8428, 1, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.503937', 8429, 1, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.509950', 8430, 1, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.515997', 8431, 2, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.521933', 8432, 2, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.527934', 8433, 2, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.532982', 8434, 2, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.538931', 8435, 2, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.543951', 8436, 2, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.549929', 8437, 3, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.554969', 8438, 3, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.560985', 8439, 3, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.565938', 8440, 3, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.571003', 8441, 3, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.576934', 8442, 3, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.581965', 8443, 4, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.586948', 8444, 4, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.592989', 8445, 4, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.597934', 8446, 4, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.602935', 8447, 4, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.609988', 8448, 4, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.614927', 8449, 5, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.620927', 8450, 5, NULL, 353, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-24 12:20:09.626938', 8451, 5, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.632932', 8452, 5, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.638964', 8453, 5, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.644933', 8454, 5, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.649949', 8455, 6, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.655938', 8456, 6, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.661939', 8457, 6, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.668932', 8458, 6, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.675084', 8459, 6, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.680925', 8460, 6, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.686932', 8461, 7, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.693112', 8462, 7, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.698058', 8463, 7, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.705056', 8464, 7, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.712058', 8465, 7, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.719057', 8466, 7, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.726187', 8467, 8, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.732056', 8468, 8, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.739058', 8469, 8, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.744054', 8470, 8, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.749057', 8471, 8, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.753283', 8472, 8, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.758153', 8473, 9, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.763053', 8474, 9, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.768205', 8475, 9, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.774060', 8476, 9, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.778078', 8477, 9, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.783087', 8478, 9, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.788056', 8479, 10, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.792051', 8480, 10, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.797156', 8481, 10, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.802246', 8482, 10, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.807067', 8483, 10, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.812068', 8484, 10, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.817359', 8485, 11, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.823061', 8486, 11, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.828054', 8487, 11, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.833054', 8488, 11, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.838121', 8489, 11, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.844254', 8490, 11, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.850055', 8491, 12, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.855052', 8492, 12, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.861053', 8493, 12, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.867060', 8494, 12, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.873542', 8495, 12, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.878063', 8496, 12, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.885052', 8497, 13, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.891053', 8498, 13, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.897201', 8499, 13, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.904058', 8500, 13, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.911055', 8501, 13, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.919065', 8502, 13, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.926058', 8503, 14, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.932055', 8504, 14, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.939117', 8505, 14, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.945062', 8506, 14, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.952057', 8507, 14, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.958052', 8508, 14, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:09.965055', 8509, 15, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:09.971057', 8510, 15, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:09.977362', 8511, 15, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:09.983057', 8512, 15, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:09.989063', 8513, 15, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:09.994059', 8514, 15, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.000060', 8515, 16, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.006058', 8516, 16, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.012059', 8517, 16, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.019058', 8518, 16, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.026054', 8519, 16, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.031052', 8520, 16, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.035048', 8521, 17, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.039049', 8522, 17, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.042307', 8523, 17, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.046052', 8524, 17, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.049267', 8525, 17, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.052165', 8526, 17, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.055078', 8527, 18, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.057044', 8528, 18, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.060246', 8529, 18, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.063257', 8530, 18, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.066046', 8531, 18, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.069149', 8532, 18, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.072045', 8533, 19, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.074046', 8534, 19, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.077045', 8535, 19, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.080118', 8536, 19, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.083048', 8537, 19, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.085045', 8538, 19, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.088045', 8539, 20, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.091043', 8540, 20, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.093045', 8541, 20, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.096045', 8542, 20, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.099109', 8543, 20, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.102043', 8544, 20, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.104044', 8545, 21, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.107170', 8546, 21, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.110045', 8547, 21, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.113043', 8548, 21, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.116044', 8549, 21, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.119043', 8550, 21, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.122048', 8551, 22, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.125047', 8552, 22, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.128046', 8553, 22, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.131055', 8554, 22, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.134179', 8555, 22, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.137243', 8556, 22, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.140113', 8557, 23, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.143049', 8558, 23, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.146045', 8559, 23, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.149045', 8560, 23, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.151049', 8561, 23, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.154049', 8562, 23, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.158047', 8563, 24, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.161046', 8564, 24, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.164125', 8565, 24, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.167321', 8566, 24, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.170052', 8567, 24, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.173056', 8568, 24, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.176264', 8569, 25, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.179045', 8570, 25, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.182046', 8571, 25, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.185045', 8572, 25, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.188046', 8573, 25, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.191051', 8574, 25, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.194048', 8575, 26, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.197046', 8576, 26, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.200048', 8577, 26, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.203048', 8578, 26, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.206375', 8579, 26, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.209050', 8580, 26, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.212047', 8581, 27, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.216052', 8582, 27, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.219356', 8583, 27, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.222576', 8584, 27, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.226055', 8585, 27, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.229049', 8586, 27, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.233047', 8587, 28, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.237046', 8588, 28, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.240185', 8589, 28, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.243049', 8590, 28, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.247047', 8591, 28, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.250054', 8592, 28, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.254054', 8593, 29, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.257046', 8594, 29, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.261045', 8595, 29, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.264053', 8596, 29, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.268049', 8597, 29, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.271053', 8598, 29, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.274053', 8599, 30, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.277725', 8600, 30, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.281049', 8601, 30, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.284048', 8602, 30, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.287054', 8603, 30, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.290051', 8604, 30, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.294056', 8605, 31, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.297539', 8606, 31, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.301056', 8607, 31, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.304049', 8608, 31, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.307510', 8609, 31, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.310049', 8610, 31, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.314156', 8611, 32, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.317257', 8612, 32, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.320049', 8613, 32, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.324046', 8614, 32, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.327225', 8615, 32, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.331053', 8616, 32, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.334203', 8617, 33, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.338085', 8618, 33, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.341418', 8619, 33, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.345051', 8620, 33, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.348372', 8621, 33, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.352055', 8622, 33, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.355048', 8623, 34, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.358044', 8624, 34, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.361282', 8625, 34, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.365052', 8626, 34, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.368047', 8627, 34, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.372047', 8628, 34, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.376052', 8629, 35, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.379047', 8630, 35, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.382164', 8631, 35, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.385053', 8632, 35, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.389048', 8633, 35, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.392049', 8634, 35, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.395361', 8635, 36, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.398306', 8636, 36, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.402056', 8637, 36, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.405048', 8638, 36, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.409049', 8639, 36, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.412046', 8640, 36, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.415047', 8641, 37, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.419049', 8642, 37, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.422049', 8643, 37, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.425049', 8644, 37, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.428051', 8645, 37, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.432176', 8646, 37, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.435048', 8647, 38, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.439047', 8648, 38, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.443047', 8649, 38, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.446047', 8650, 38, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.449212', 8651, 38, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.452048', 8652, 38, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.456044', 8653, 39, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.459049', 8654, 39, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.462049', 8655, 39, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.465052', 8656, 39, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.469046', 8657, 39, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.473047', 8658, 39, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.476055', 8659, 40, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.478048', 8660, 40, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.481050', 8661, 40, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.484352', 8662, 40, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.488189', 8663, 40, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.490049', 8664, 40, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.493048', 8665, 41, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.497056', 8666, 41, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.500056', 8667, 41, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.503047', 8668, 41, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.507049', 8669, 41, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.510045', 8670, 41, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.512048', 8671, 42, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.515050', 8672, 42, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.519054', 8673, 42, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.522046', 8674, 42, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.524052', 8675, 42, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.527094', 8676, 42, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.531057', 8677, 43, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.534058', 8678, 43, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.537296', 8679, 43, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.540555', 8680, 43, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.543493', 8681, 43, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.546474', 8682, 43, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.550094', 8683, 44, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.552092', 8684, 44, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.556062', 8685, 44, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.559092', 8686, 44, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.562113', 8687, 44, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.566256', 8688, 44, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.571051', 8689, 45, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.575051', 8690, 45, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.578105', 8691, 45, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.582111', 8692, 45, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.586111', 8693, 45, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.590056', 8694, 45, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.594049', 8695, 46, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.598101', 8696, 46, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.601479', 8697, 46, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.605048', 8698, 46, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.609143', 8699, 46, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.613091', 8700, 46, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.617051', 8701, 47, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.620114', 8702, 47, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.624055', 8703, 47, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.628051', 8704, 47, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.632054', 8705, 47, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.636631', 8706, 47, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.641162', 8707, 48, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.645368', 8708, 48, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.649055', 8709, 48, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.653054', 8710, 48, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.656109', 8711, 48, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.660619', 8712, 48, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.664050', 8713, 49, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.668094', 8714, 49, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.672242', 8715, 49, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.676428', 8716, 49, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.680054', 8717, 49, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.683114', 8718, 49, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.687294', 8719, 50, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.691391', 8720, 50, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.695049', 8721, 50, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.699069', 8722, 50, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.703051', 8723, 50, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.707115', 8724, 50, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.711106', 8725, 51, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.715118', 8726, 51, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.719064', 8727, 51, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.723112', 8728, 51, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.727052', 8729, 51, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.730165', 8730, 51, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.735215', 8731, 52, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.739061', 8732, 52, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.743111', 8733, 52, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.746111', 8734, 52, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.749558', 8735, 52, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.753166', 8736, 52, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.757055', 8737, 53, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.760052', 8738, 53, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.763125', 8739, 53, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.768058', 8740, 53, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.774058', 8741, 53, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.778528', 8742, 53, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.784056', 8743, 54, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.789068', 8744, 54, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.794072', 8745, 54, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.799058', 8746, 54, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.805069', 8747, 54, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.810126', 8748, 54, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.814053', 8749, 55, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.819056', 8750, 55, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.823335', 8751, 55, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.828056', 8752, 55, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.833532', 8753, 55, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.838281', 8754, 55, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.844058', 8755, 56, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.850056', 8756, 56, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.855053', 8757, 56, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.860055', 8758, 56, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.866062', 8759, 56, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.872062', 8760, 56, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.877242', 8761, 57, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.883284', 8762, 57, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.888064', 8763, 57, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.893246', 8764, 57, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.899056', 8765, 57, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.904048', 8766, 57, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.909190', 8767, 58, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.915056', 8768, 58, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.920053', 8769, 58, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.925058', 8770, 58, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.931066', 8771, 58, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.936047', 8772, 58, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.941060', 8773, 59, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.946427', 8774, 59, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.951050', 8775, 59, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.955051', 8776, 59, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.960056', 8777, 59, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.964245', 8778, 59, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.970056', 8779, 60, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:10.976051', 8780, 60, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:10.980053', 8781, 60, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:10.984395', 8782, 60, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:10.990055', 8783, 60, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:10.994050', 8784, 60, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:10.999056', 8785, 61, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.004054', 8786, 61, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.009059', 8787, 61, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.013057', 8788, 61, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.018068', 8789, 61, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.024060', 8790, 61, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.029054', 8791, 62, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.036057', 8792, 62, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.042058', 8793, 62, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.048055', 8794, 62, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.054056', 8795, 62, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.059370', 8796, 62, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.064400', 8797, 63, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.070055', 8798, 63, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.075059', 8799, 63, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.080054', 8800, 63, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.085055', 8801, 63, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.090052', 8802, 63, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.094272', 8803, 64, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.100058', 8804, 64, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.105174', 8805, 64, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.110118', 8806, 64, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.116053', 8807, 64, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.121311', 8808, 64, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.126051', 8809, 65, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.132058', 8810, 65, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.137055', 8811, 65, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.142185', 8812, 65, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.147058', 8813, 65, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.151696', 8814, 65, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.156056', 8815, 66, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.161059', 8816, 66, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.166057', 8817, 66, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.171303', 8818, 66, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.176290', 8819, 66, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.180056', 8820, 66, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.185051', 8821, 67, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.189077', 8822, 67, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.193651', 8823, 67, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.198056', 8824, 67, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.203056', 8825, 67, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.208055', 8826, 67, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.212062', 8827, 68, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.217051', 8828, 68, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.221219', 8829, 68, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.225420', 8830, 68, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.230055', 8831, 68, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.235056', 8832, 68, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.240066', 8833, 69, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.245056', 8834, 69, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.250180', 8835, 69, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.255446', 8836, 69, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.260055', 8837, 69, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.264448', 8838, 69, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.270056', 8839, 70, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.274051', 8840, 70, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.279056', 8841, 70, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.284057', 8842, 70, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.288217', 8843, 70, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.293051', 8844, 70, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.297055', 8845, 71, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.302132', 8846, 71, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.307058', 8847, 71, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.312057', 8848, 71, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.317051', 8849, 71, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.321368', 8850, 71, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.325401', 8851, 72, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.330055', 8852, 72, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.335177', 8853, 72, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.340059', 8854, 72, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.345054', 8855, 72, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.350050', 8856, 72, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.354087', 8857, 73, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.358065', 8858, 73, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.364267', 8859, 73, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.369051', 8860, 73, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.374058', 8861, 73, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.379050', 8862, 73, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.384051', 8863, 74, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.388056', 8864, 74, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.392462', 8865, 74, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.397057', 8866, 74, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.401252', 8867, 74, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.406060', 8868, 74, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.410450', 8869, 75, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.415050', 8870, 75, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.419060', 8871, 75, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.424071', 8872, 75, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.428056', 8873, 75, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.433210', 8874, 75, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.439057', 8875, 76, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.444230', 8876, 76, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.449051', 8877, 76, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.454433', 8878, 76, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.459332', 8879, 76, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.464064', 8880, 76, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.470053', 8881, 77, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.475066', 8882, 77, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.480237', 8883, 77, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.486073', 8884, 77, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.490434', 8885, 77, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.495047', 8886, 77, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 12:20:11.512056', 8887, 78, NULL, 353, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 12:20:11.517594', 8888, 78, NULL, 353, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 12:20:11.522301', 8889, 78, NULL, 353, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 12:20:11.527050', 8890, 78, NULL, 353, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 12:20:11.533051', 8891, 78, NULL, 353, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 12:20:11.538054', 8892, 78, NULL, 353, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:48.871277', 8893, 1, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:48.897273', 8894, 1, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:48.906446', 8895, 1, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:48.914295', 8896, 1, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:48.922281', 8897, 1, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:48.930286', 8898, 1, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:48.938278', 8899, 2, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:48.948298', 8900, 2, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:48.957283', 8901, 2, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:48.964284', 8902, 2, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:48.973292', 8903, 2, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:48.982355', 8904, 2, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:48.990334', 8905, 3, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:48.999380', 8906, 3, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.007283', 8907, 3, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.018278', 8908, 3, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.027290', 8909, 3, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.034279', 8910, 3, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.041299', 8911, 4, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.049295', 8912, 4, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.058338', 8913, 4, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.065327', 8914, 4, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.072277', 8915, 4, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.080449', 8916, 4, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.088619', 8917, 5, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.097089', 8918, 5, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.105276', 8919, 5, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.113704', 8920, 5, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.122128', 8921, 5, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.128334', 8922, 5, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.136298', 8923, 6, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.143339', 8924, 6, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.151275', 8925, 6, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.159275', 8926, 6, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.167734', 8927, 6, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.177282', 8928, 6, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.186282', 8929, 7, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.194284', 8930, 7, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.201608', 8931, 7, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.208292', 8932, 7, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.216278', 8933, 7, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.223278', 8934, 7, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.230270', 8935, 8, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.237282', 8936, 8, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.244280', 8937, 8, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.252282', 8938, 8, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.260450', 8939, 8, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.267281', 8940, 8, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.274277', 8941, 9, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.281279', 8942, 9, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.289276', 8943, 9, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.297279', 8944, 9, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.304280', 8945, 9, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.311282', 8946, 9, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.318433', 8947, 10, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.326275', 8948, 10, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.333268', 8949, 10, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.341285', 8950, 10, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.347282', 8951, 10, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.355297', 8952, 10, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.364287', 8953, 11, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.372280', 8954, 11, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.379293', 8955, 11, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.387792', 8956, 11, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.394279', 8957, 11, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.400291', 8958, 11, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.406272', 8959, 12, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.412281', 8960, 12, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.419276', 8961, 12, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.425426', 8962, 12, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.432422', 8963, 12, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.438425', 8964, 12, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.445423', 8965, 13, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.452426', 8966, 13, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.460426', 8967, 13, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.467422', 8968, 13, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.474427', 8969, 13, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.482428', 8970, 13, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.489721', 8971, 14, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.497425', 8972, 14, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.504415', 8973, 14, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.510418', 8974, 14, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.518638', 8975, 14, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.526416', 8976, 14, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.533416', 8977, 15, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.541416', 8978, 15, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.549440', 8979, 15, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.556420', 8980, 15, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.563432', 8981, 15, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.570478', 8982, 15, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.577430', 8983, 16, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.584663', 8984, 16, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.591672', 8985, 16, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.599422', 8986, 16, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.605440', 8987, 16, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.612502', 8988, 16, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.618438', 8989, 17, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.626480', 8990, 17, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.633424', 8991, 17, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.640439', 8992, 17, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.647491', 8993, 17, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.654471', 8994, 17, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.661430', 8995, 18, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.669420', 8996, 18, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.676487', 8997, 18, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.685642', 8998, 18, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.692472', 8999, 18, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.699569', 9000, 18, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.707480', 9001, 19, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.714432', 9002, 19, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.722441', 9003, 19, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.730128', 9004, 19, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.737480', 9005, 19, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.744425', 9006, 19, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.752478', 9007, 20, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.759423', 9008, 20, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.767482', 9009, 20, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.774429', 9010, 20, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.783444', 9011, 20, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.791483', 9012, 20, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.799428', 9013, 21, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.806425', 9014, 21, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.814870', 9015, 21, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.822425', 9016, 21, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.829836', 9017, 21, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.837485', 9018, 21, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.845492', 9019, 22, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.852434', 9020, 22, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.860421', 9021, 22, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.867434', 9022, 22, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.874422', 9023, 22, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.881430', 9024, 22, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.888420', 9025, 23, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.896421', 9026, 23, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.903645', 9027, 23, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.910423', 9028, 23, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.918437', 9029, 23, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.924426', 9030, 23, NULL, 402, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 1, '2024-06-24 13:28:49.931431', 9031, 24, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.938093', 9032, 24, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.943424', 9033, 24, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.950420', 9034, 24, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.957420', 9035, 24, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:49.963424', 9036, 24, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:49.970425', 9037, 25, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:49.977420', 9038, 25, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:49.983613', 9039, 25, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:49.990423', 9040, 25, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:49.995421', 9041, 25, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.002423', 9042, 25, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.008425', 9043, 26, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.014604', 9044, 26, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.020489', 9045, 26, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.026487', 9046, 26, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.033422', 9047, 26, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.038438', 9048, 26, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.044645', 9049, 27, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.050420', 9050, 27, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.057480', 9051, 27, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.065267', 9052, 27, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.071436', 9053, 27, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.078488', 9054, 27, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.085482', 9055, 28, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.092423', 9056, 28, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.099426', 9057, 28, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.106472', 9058, 28, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.112489', 9059, 28, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.120422', 9060, 28, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.127422', 9061, 29, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.134420', 9062, 29, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.141421', 9063, 29, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.148433', 9064, 29, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.155423', 9065, 29, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.162417', 9066, 29, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.169623', 9067, 30, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.177424', 9068, 30, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.184426', 9069, 30, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.192423', 9070, 30, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.200426', 9071, 30, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.207733', 9072, 30, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.213423', 9073, 31, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.221419', 9074, 31, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.227423', 9075, 31, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.234431', 9076, 31, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.242417', 9077, 31, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.249554', 9078, 31, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.255977', 9079, 32, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.262424', 9080, 32, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.269424', 9081, 32, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.277424', 9082, 32, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.285415', 9083, 32, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.292426', 9084, 32, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.300430', 9085, 33, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.306424', 9086, 33, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.312836', 9087, 33, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.319417', 9088, 33, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.326427', 9089, 33, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.333424', 9090, 33, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.339420', 9091, 34, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.346447', 9092, 34, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.353424', 9093, 34, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.360427', 9094, 34, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.367424', 9095, 34, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.373437', 9096, 34, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.379513', 9097, 35, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.386427', 9098, 35, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.394424', 9099, 35, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.400418', 9100, 35, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.407430', 9101, 35, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.413424', 9102, 35, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.420427', 9103, 36, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.426424', 9104, 36, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.432417', 9105, 36, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.439550', 9106, 36, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.445420', 9107, 36, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.451422', 9108, 36, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.458419', 9109, 37, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.464425', 9110, 37, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.471427', 9111, 37, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.477424', 9112, 37, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.484421', 9113, 37, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.491418', 9114, 37, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.496433', 9115, 38, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.503427', 9116, 38, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.510427', 9117, 38, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.518424', 9118, 38, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.525414', 9119, 38, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.530426', 9120, 38, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.537627', 9121, 39, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.543417', 9122, 39, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.550427', 9123, 39, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.556426', 9124, 39, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.562424', 9125, 39, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.568421', 9126, 39, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.575424', 9127, 40, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.582424', 9128, 40, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.588423', 9129, 40, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.595426', 9130, 40, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.601421', 9131, 40, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.608437', 9132, 40, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.614426', 9133, 41, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.622548', 9134, 41, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.629421', 9135, 41, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.635424', 9136, 41, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.641424', 9137, 41, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.647425', 9138, 41, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.656442', 9139, 42, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.663425', 9140, 42, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.670547', 9141, 42, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.677424', 9142, 42, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.685421', 9143, 42, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.696083', 9144, 42, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.702437', 9145, 43, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.710421', 9146, 43, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.719717', 9147, 43, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.727417', 9148, 43, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.733427', 9149, 43, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.739428', 9150, 43, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.745417', 9151, 44, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.751431', 9152, 44, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.758422', 9153, 44, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.763423', 9154, 44, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.769417', 9155, 44, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.774418', 9156, 44, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.780696', 9157, 45, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.786418', 9158, 45, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.792417', 9159, 45, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.798423', 9160, 45, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.803447', 9161, 45, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.809706', 9162, 45, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.815426', 9163, 46, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.821426', 9164, 46, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.827433', 9165, 46, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.833487', 9166, 46, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.838436', 9167, 46, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.845485', 9168, 46, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.851422', 9169, 47, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.857662', 9170, 47, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.863483', 9171, 47, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.868477', 9172, 47, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.873424', 9173, 47, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.879427', 9174, 47, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.884429', 9175, 48, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.891469', 9176, 48, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.897424', 9177, 48, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.903428', 9178, 48, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.909428', 9179, 48, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.916571', 9180, 48, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.922427', 9181, 49, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.928419', 9182, 49, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.935488', 9183, 49, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.941479', 9184, 49, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.946434', 9185, 49, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.953427', 9186, 49, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:50.959480', 9187, 50, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:50.965424', 9188, 50, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:50.970478', 9189, 50, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:50.987473', 9190, 50, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:50.993427', 9191, 50, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:50.999453', 9192, 50, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.005478', 9193, 51, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.011480', 9194, 51, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.017545', 9195, 51, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.023420', 9196, 51, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.029479', 9197, 51, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.034523', 9198, 51, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.040482', 9199, 52, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.045429', 9200, 52, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.051425', 9201, 52, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.056544', 9202, 52, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.062445', 9203, 52, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.068423', 9204, 52, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.073422', 9205, 53, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.079427', 9206, 53, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.085487', 9207, 53, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.092089', 9208, 53, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.097438', 9209, 53, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.103476', 9210, 53, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.109486', 9211, 54, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.116423', 9212, 54, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.122490', 9213, 54, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.129449', 9214, 54, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.135425', 9215, 54, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.142474', 9216, 54, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.147425', 9217, 55, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.154422', 9218, 55, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.161474', 9219, 55, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.167473', 9220, 55, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.173426', 9221, 55, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.179423', 9222, 55, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.186427', 9223, 56, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.193423', 9224, 56, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.200435', 9225, 56, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.208426', 9226, 56, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.215423', 9227, 56, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.222426', 9228, 56, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.229420', 9229, 57, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.236584', 9230, 57, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.242431', 9231, 57, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.249423', 9232, 57, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.257814', 9233, 57, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.263429', 9234, 57, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.269431', 9235, 58, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.275425', 9236, 58, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.282426', 9237, 58, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.289421', 9238, 58, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.295431', 9239, 58, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.302420', 9240, 58, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.308423', 9241, 59, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.314518', 9242, 59, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.320689', 9243, 59, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.325424', 9244, 59, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.331414', 9245, 59, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.336414', 9246, 59, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.342422', 9247, 60, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.348425', 9248, 60, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.354420', 9249, 60, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.359427', 9250, 60, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.365417', 9251, 60, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.371428', 9252, 60, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.376419', 9253, 61, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.382426', 9254, 61, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.388560', 9255, 61, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.394482', 9256, 61, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.400424', 9257, 61, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.406420', 9258, 61, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.411431', 9259, 62, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.418432', 9260, 62, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.423420', 9261, 62, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.428747', 9262, 62, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.433594', 9263, 62, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.439421', 9264, 62, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.444420', 9265, 63, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.450421', 9266, 63, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.456423', 9267, 63, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.462435', 9268, 63, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.469420', 9269, 63, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.474424', 9270, 63, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.480419', 9271, 64, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.486424', 9272, 64, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.492421', 9273, 64, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.498424', 9274, 64, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.507423', 9275, 64, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.515506', 9276, 64, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.526424', 9277, 65, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.532426', 9278, 65, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.538418', 9279, 65, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.544433', 9280, 65, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.550422', 9281, 65, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.556433', 9282, 65, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.562424', 9283, 66, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.567424', 9284, 66, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.573427', 9285, 66, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.579424', 9286, 66, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.586426', 9287, 66, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.591431', 9288, 66, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.597434', 9289, 67, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.604426', 9290, 67, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.609421', 9291, 67, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.616427', 9292, 67, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.621424', 9293, 67, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.627422', 9294, 67, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.633417', 9295, 68, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.638420', 9296, 68, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.643424', 9297, 68, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.647425', 9298, 68, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.651704', 9299, 68, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.655414', 9300, 68, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.658417', 9301, 69, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.661417', 9302, 69, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.665413', 9303, 69, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.668688', 9304, 69, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.671417', 9305, 69, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.675419', 9306, 69, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.678574', 9307, 70, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.681420', 9308, 70, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.685415', 9309, 70, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.688756', 9310, 70, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.691820', 9311, 70, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.695413', 9312, 70, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.698414', 9313, 71, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.701413', 9314, 71, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.705415', 9315, 71, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.708839', 9316, 71, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.712414', 9317, 71, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.716416', 9318, 71, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.719417', 9319, 72, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.724415', 9320, 72, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.727417', 9321, 72, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.731419', 9322, 72, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.734464', 9323, 72, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.738416', 9324, 72, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.741420', 9325, 73, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.744413', 9326, 73, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.748726', 9327, 73, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.752414', 9328, 73, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.756424', 9329, 73, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.760416', 9330, 73, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.764416', 9331, 74, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.767412', 9332, 74, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.770416', 9333, 74, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.774579', 9334, 74, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.778653', 9335, 74, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.782415', 9336, 74, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.786415', 9337, 75, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.790411', 9338, 75, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.793414', 9339, 75, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.797724', 9340, 75, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.801412', 9341, 75, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.805415', 9342, 75, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.808603', 9343, 76, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.811412', 9344, 76, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.815540', 9345, 76, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.818418', 9346, 76, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.822415', 9347, 76, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.825422', 9348, 76, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.829421', 9349, 77, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.833423', 9350, 77, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.839425', 9351, 77, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.843435', 9352, 77, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.849420', 9353, 77, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.854440', 9354, 77, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 13:28:51.860433', 9355, 78, NULL, 402, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 13:28:51.866421', 9356, 78, NULL, 402, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 13:28:51.872471', 9357, 78, NULL, 402, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 13:28:51.877426', 9358, 78, NULL, 402, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 13:28:51.883420', 9359, 78, NULL, 402, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 13:28:51.889435', 9360, 78, NULL, 402, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.062575', 9361, 1, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.086646', 9362, 1, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.095574', 9363, 1, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.102587', 9364, 1, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.112581', 9365, 1, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.120635', 9366, 1, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.128579', 9367, 2, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.138581', 9368, 2, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.147578', 9369, 2, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.156574', 9370, 2, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.165701', 9371, 2, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.174590', 9372, 2, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.184573', 9373, 3, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.193793', 9374, 3, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.201855', 9375, 3, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.211729', 9376, 3, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.220570', 9377, 3, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.228645', 9378, 3, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.237576', 9379, 4, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.246118', 9380, 4, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.253634', 9381, 4, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.262574', 9382, 4, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.269624', 9383, 4, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.277624', 9384, 4, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.285632', 9385, 5, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.293645', 9386, 5, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.301624', 9387, 5, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.308573', 9388, 5, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.316649', 9389, 5, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.324622', 9390, 5, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.332583', 9391, 6, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.339637', 9392, 6, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.349025', 9393, 6, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.356588', 9394, 6, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.364574', 9395, 6, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.371632', 9396, 6, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.378996', 9397, 7, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.385631', 9398, 7, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.392584', 9399, 7, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.399648', 9400, 7, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.407232', 9401, 7, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.413628', 9402, 7, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.422150', 9403, 8, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.428627', 9404, 8, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.435628', 9405, 8, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.442579', 9406, 8, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.450588', 9407, 8, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.458567', 9408, 8, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.465572', 9409, 9, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.472571', 9410, 9, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.482283', 9411, 9, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.490792', 9412, 9, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.498576', 9413, 9, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.505636', 9414, 9, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.513640', 9415, 10, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.521635', 9416, 10, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.530576', 9417, 10, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.538577', 9418, 10, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.547590', 9419, 10, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.556584', 9420, 10, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.565698', 9421, 11, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.573959', 9422, 11, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.581623', 9423, 11, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.587623', 9424, 11, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.594574', 9425, 11, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.601630', 9426, 11, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.608634', 9427, 12, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.614638', 9428, 12, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.620574', 9429, 12, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.627639', 9430, 12, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.634637', 9431, 12, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.640737', 9432, 12, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.648576', 9433, 13, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.655579', 9434, 13, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.662576', 9435, 13, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.669890', 9436, 13, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.677580', 9437, 13, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.685578', 9438, 13, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.692574', 9439, 14, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.699580', 9440, 14, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.706574', 9441, 14, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.713586', 9442, 14, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.720591', 9443, 14, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.728578', 9444, 14, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.735577', 9445, 15, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.744591', 9446, 15, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.751579', 9447, 15, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.759584', 9448, 15, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.765587', 9449, 15, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.772575', 9450, 15, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.779577', 9451, 16, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.786572', 9452, 16, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.792573', 9453, 16, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.798585', 9454, 16, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.804780', 9455, 16, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.811736', 9456, 16, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.818776', 9457, 17, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.824727', 9458, 17, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.830782', 9459, 17, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.836783', 9460, 17, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.843249', 9461, 17, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.850400', 9462, 17, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.856800', 9463, 18, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.863736', 9464, 18, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.870788', 9465, 18, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.878724', 9466, 18, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.885862', 9467, 18, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.892790', 9468, 18, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.899724', 9469, 19, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.905730', 9470, 19, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.913787', 9471, 19, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.920730', 9472, 19, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.928729', 9473, 19, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.934729', 9474, 19, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.950729', 9475, 20, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:24.958725', 9476, 20, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:24.965349', 9477, 20, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:24.971728', 9478, 20, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:24.979722', 9479, 20, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:24.987998', 9480, 20, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:24.995726', 9481, 21, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.002721', 9482, 21, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.010042', 9483, 21, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.017733', 9484, 21, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.025728', 9485, 21, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.035723', 9486, 21, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.043817', 9487, 22, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.050807', 9488, 22, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.057729', 9489, 22, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.063722', 9490, 22, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.070720', 9491, 22, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.076721', 9492, 22, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.084724', 9493, 23, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.091729', 9494, 23, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.098721', 9495, 23, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.104720', 9496, 23, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.112723', 9497, 23, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.119719', 9498, 23, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.125721', 9499, 24, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.132725', 9500, 24, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.138721', 9501, 24, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.146723', 9502, 24, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.152730', 9503, 24, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.159723', 9504, 24, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.167150', 9505, 25, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.175730', 9506, 25, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.182729', 9507, 25, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.188726', 9508, 25, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.196727', 9509, 25, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.202728', 9510, 25, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.210028', 9511, 26, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.215729', 9512, 26, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.221872', 9513, 26, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.227720', 9514, 26, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.232720', 9515, 26, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.239725', 9516, 26, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.246733', 9517, 27, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.254059', 9518, 27, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.260728', 9519, 27, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.266720', 9520, 27, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.273861', 9521, 27, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.279728', 9522, 27, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.286732', 9523, 28, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.293728', 9524, 28, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.299754', 9525, 28, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.306724', 9526, 28, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.313743', 9527, 28, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.321720', 9528, 28, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.328729', 9529, 29, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.335726', 9530, 29, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.342740', 9531, 29, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.349733', 9532, 29, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.356859', 9533, 29, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.364188', 9534, 29, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.370725', 9535, 30, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.377728', 9536, 30, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.384723', 9537, 30, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.390732', 9538, 30, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.396727', 9539, 30, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.402720', 9540, 30, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.408717', 9541, 31, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.415739', 9542, 31, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.421720', 9543, 31, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.427952', 9544, 31, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.433720', 9545, 31, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.438834', 9546, 31, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.445823', 9547, 32, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.452874', 9548, 32, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.459875', 9549, 32, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.467830', 9550, 32, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.475200', 9551, 32, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.483215', 9552, 32, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.490311', 9553, 33, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.496886', 9554, 33, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.503888', 9555, 33, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.510825', 9556, 33, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.517879', 9557, 33, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.523837', 9558, 33, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.531818', 9559, 34, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.537879', 9560, 34, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.546822', 9561, 34, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.552841', 9562, 34, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.560829', 9563, 34, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.567886', 9564, 34, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.575193', 9565, 35, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.581828', 9566, 35, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.588834', 9567, 35, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.595877', 9568, 35, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.603824', 9569, 35, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.610827', 9570, 35, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.617835', 9571, 36, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.624837', 9572, 36, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.632832', 9573, 36, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.640830', 9574, 36, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.647821', 9575, 36, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.654827', 9576, 36, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.661823', 9577, 37, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.668824', 9578, 37, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.675828', 9579, 37, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.682831', 9580, 37, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.689829', 9581, 37, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.696831', 9582, 37, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.704819', 9583, 38, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.711827', 9584, 38, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.719828', 9585, 38, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.726824', 9586, 38, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.734822', 9587, 38, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.741833', 9588, 38, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.748824', 9589, 39, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.756821', 9590, 39, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.762821', 9591, 39, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.768826', 9592, 39, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.774829', 9593, 39, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.781825', 9594, 39, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.787828', 9595, 40, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.794827', 9596, 40, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.800830', 9597, 40, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.808162', 9598, 40, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.813828', 9599, 40, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.819820', 9600, 40, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.826820', 9601, 41, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.832827', 9602, 41, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.839133', 9603, 41, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.845831', 9604, 41, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.852830', 9605, 41, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.860843', 9606, 41, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.867829', 9607, 42, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.874639', 9608, 42, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.882825', 9609, 42, NULL, 452, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 4, '2024-06-24 14:32:25.890826', 9610, 42, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.898083', 9611, 42, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.904830', 9612, 42, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.913821', 9613, 43, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.922827', 9614, 43, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.929822', 9615, 43, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.935828', 9616, 43, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.941829', 9617, 43, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.948833', 9618, 43, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.954829', 9619, 44, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.960822', 9620, 44, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:25.966831', 9621, 44, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:25.972822', 9622, 44, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:25.978828', 9623, 44, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:25.984830', 9624, 44, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:25.990837', 9625, 45, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:25.996825', 9626, 45, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.001829', 9627, 45, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.008199', 9628, 45, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.014822', 9629, 45, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.020828', 9630, 45, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.025831', 9631, 46, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.031839', 9632, 46, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.036828', 9633, 46, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.041844', 9634, 46, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.047970', 9635, 46, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.052833', 9636, 46, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.057828', 9637, 47, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.062825', 9638, 47, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.067841', 9639, 47, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.072823', 9640, 47, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.079821', 9641, 47, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.085826', 9642, 47, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.091827', 9643, 48, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.097955', 9644, 48, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.103832', 9645, 48, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.109845', 9646, 48, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.115826', 9647, 48, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.121830', 9648, 48, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.126911', 9649, 49, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.132832', 9650, 49, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.139835', 9651, 49, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.145830', 9652, 49, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.151825', 9653, 49, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.157832', 9654, 49, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.162825', 9655, 50, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.169831', 9656, 50, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.177212', 9657, 50, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.184831', 9658, 50, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.191828', 9659, 50, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.197992', 9660, 50, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.204904', 9661, 51, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.210830', 9662, 51, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.216820', 9663, 51, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.222919', 9664, 51, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.227820', 9665, 51, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.233827', 9666, 51, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.238827', 9667, 52, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.254829', 9668, 52, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.260970', 9669, 52, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.265828', 9670, 52, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.271828', 9671, 52, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.277823', 9672, 52, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.284824', 9673, 53, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.289835', 9674, 53, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.295822', 9675, 53, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.301830', 9676, 53, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.307828', 9677, 53, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.313827', 9678, 53, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.319820', 9679, 54, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.325829', 9680, 54, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.330820', 9681, 54, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.336828', 9682, 54, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.343835', 9683, 54, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.350196', 9684, 54, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.356203', 9685, 55, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.361826', 9686, 55, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.367825', 9687, 55, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.374185', 9688, 55, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.379827', 9689, 55, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.385821', 9690, 55, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.391829', 9691, 56, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.397975', 9692, 56, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.402827', 9693, 56, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.408831', 9694, 56, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.414825', 9695, 56, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.420827', 9696, 56, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.425828', 9697, 57, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.430829', 9698, 57, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.435822', 9699, 57, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.441836', 9700, 57, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.446820', 9701, 57, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.452822', 9702, 57, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.458826', 9703, 58, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.463825', 9704, 58, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.469831', 9705, 58, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.474834', 9706, 58, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.480974', 9707, 58, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.486825', 9708, 58, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.492825', 9709, 59, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.499832', 9710, 59, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.505825', 9711, 59, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.512829', 9712, 59, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.517839', 9713, 59, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.523833', 9714, 59, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.529832', 9715, 60, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.535832', 9716, 60, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.541827', 9717, 60, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.547833', 9718, 60, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.553833', 9719, 60, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.559831', 9720, 60, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.565827', 9721, 61, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.571833', 9722, 61, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.577829', 9723, 61, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.583837', 9724, 61, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.590827', 9725, 61, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.597829', 9726, 61, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.603831', 9727, 62, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.609831', 9728, 62, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.615910', 9729, 62, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.622214', 9730, 62, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.627831', 9731, 62, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.632832', 9732, 62, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.638843', 9733, 63, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.644836', 9734, 63, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.651950', 9735, 63, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.658829', 9736, 63, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.664830', 9737, 63, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.670823', 9738, 63, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.677861', 9739, 64, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.684841', 9740, 64, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.691826', 9741, 64, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.697825', 9742, 64, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.705828', 9743, 64, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.713834', 9744, 64, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.720825', 9745, 65, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.726829', 9746, 65, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.731836', 9747, 65, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.737823', 9748, 65, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.742825', 9749, 65, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.748829', 9750, 65, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.753821', 9751, 66, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.759823', 9752, 66, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.764821', 9753, 66, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.769823', 9754, 66, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.774843', 9755, 66, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.780944', 9756, 66, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.785822', 9757, 67, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.791832', 9758, 67, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.797822', 9759, 67, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.802827', 9760, 67, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.808830', 9761, 67, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.814829', 9762, 67, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.819839', 9763, 68, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.825847', 9764, 68, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.830914', 9765, 68, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.835984', 9766, 68, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.840833', 9767, 68, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.846829', 9768, 68, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.852832', 9769, 69, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.857833', 9770, 69, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.862831', 9771, 69, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.867831', 9772, 69, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.871862', 9773, 69, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.877823', 9774, 69, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.883823', 9775, 70, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.889821', 9776, 70, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.894830', 9777, 70, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.899824', 9778, 70, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.905827', 9779, 70, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.912247', 9780, 70, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.918829', 9781, 71, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.924828', 9782, 71, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.929832', 9783, 71, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.936117', 9784, 71, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.941827', 9785, 71, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.947830', 9786, 71, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.953830', 9787, 72, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.958843', 9788, 72, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.964054', 9789, 72, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:26.969838', 9790, 72, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:26.975824', 9791, 72, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:26.981823', 9792, 72, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:26.987833', 9793, 73, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:26.992824', 9794, 73, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:26.998833', 9795, 73, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:27.003840', 9796, 73, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:27.009824', 9797, 73, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:27.015828', 9798, 73, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:27.021835', 9799, 74, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:27.027839', 9800, 74, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:27.033826', 9801, 74, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:27.039840', 9802, 74, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:27.045833', 9803, 74, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:27.050919', 9804, 74, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:27.056877', 9805, 75, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:27.061906', 9806, 75, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:27.067885', 9807, 75, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:27.072823', 9808, 75, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:27.078830', 9809, 75, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:27.084887', 9810, 75, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:27.089838', 9811, 76, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:27.095833', 9812, 76, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:27.100884', 9813, 76, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:27.106830', 9814, 76, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:27.112992', 9815, 76, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:27.118844', 9816, 76, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:27.124825', 9817, 77, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:27.130878', 9818, 77, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:27.136913', 9819, 77, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:27.143844', 9820, 77, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:27.149834', 9821, 77, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:27.155824', 9822, 77, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:32:27.161888', 9823, 78, NULL, 452, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:32:27.167832', 9824, 78, NULL, 452, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:32:27.174123', 9825, 78, NULL, 452, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:32:27.180834', 9826, 78, NULL, 452, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:32:27.187831', 9827, 78, NULL, 452, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:32:27.193824', 9828, 78, NULL, 452, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.544644', 9829, 1, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.551633', 9830, 1, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.557635', 9831, 1, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.562171', 9832, 1, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.567690', 9833, 1, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.573676', 9834, 1, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.578632', 9835, 2, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.584636', 9836, 2, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.589694', 9837, 2, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.595633', 9838, 2, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.600681', 9839, 2, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.605640', 9840, 2, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.611639', 9841, 3, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.615990', 9842, 3, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.622636', 9843, 3, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.629635', 9844, 3, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.634635', 9845, 3, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.639680', 9846, 3, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.644685', 9847, 4, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.649998', 9848, 4, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.654681', 9849, 4, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.659677', 9850, 4, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.664639', 9851, 4, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.668675', 9852, 4, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.673679', 9853, 5, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.677635', 9854, 5, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.683015', 9855, 5, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.687644', 9856, 5, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.691641', 9857, 5, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.696637', 9858, 5, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.700642', 9859, 6, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.705632', 9860, 6, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.710634', 9861, 6, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.715642', 9862, 6, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.720633', 9863, 6, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.726682', 9864, 6, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.730672', 9865, 7, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.734638', 9866, 7, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.738630', 9867, 7, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.742039', 9868, 7, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.745632', 9869, 7, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.749770', 9870, 7, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.753630', 9871, 8, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.757689', 9872, 8, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.761631', 9873, 8, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.764655', 9874, 8, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.767930', 9875, 8, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.771677', 9876, 8, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.774635', 9877, 9, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.778634', 9878, 9, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.782665', 9879, 9, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.785634', 9880, 9, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.789633', 9881, 9, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.792631', 9882, 9, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.796632', 9883, 10, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.800632', 9884, 10, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.803733', 9885, 10, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.807635', 9886, 10, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.810635', 9887, 10, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.814634', 9888, 10, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.818632', 9889, 11, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.822629', 9890, 11, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.826632', 9891, 11, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.830633', 9892, 11, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.834673', 9893, 11, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.838638', 9894, 11, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.841636', 9895, 12, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.845633', 9896, 12, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.850632', 9897, 12, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.854633', 9898, 12, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.858632', 9899, 12, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.862632', 9900, 12, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.865808', 9901, 13, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.869675', 9902, 13, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.873631', 9903, 13, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.877673', 9904, 13, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.880673', 9905, 13, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.884731', 9906, 13, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.888636', 9907, 14, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.892631', 9908, 14, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.896632', 9909, 14, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.900636', 9910, 14, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.904634', 9911, 14, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.917634', 9912, 14, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.922633', 9913, 15, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.926634', 9914, 15, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.930633', 9915, 15, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.934634', 9916, 15, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.939635', 9917, 15, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.943897', 9918, 15, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.947838', 9919, 16, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.953636', 9920, 16, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.958633', 9921, 16, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.962786', 9922, 16, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.966633', 9923, 16, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.970630', 9924, 16, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.973633', 9925, 17, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.976630', 9926, 17, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:02.980632', 9927, 17, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:02.984630', 9928, 17, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:02.988650', 9929, 17, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:02.991669', 9930, 17, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:02.995632', 9931, 18, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:02.999264', 9932, 18, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.002632', 9933, 18, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.005630', 9934, 18, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.008631', 9935, 18, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.012631', 9936, 18, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.015629', 9937, 19, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.018628', 9938, 19, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.022651', 9939, 19, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.025630', 9940, 19, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.028629', 9941, 19, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.031630', 9942, 19, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.034632', 9943, 20, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.037628', 9944, 20, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.040918', 9945, 20, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.044632', 9946, 20, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.048638', 9947, 20, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.051633', 9948, 20, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.055635', 9949, 21, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.058630', 9950, 21, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.062059', 9951, 21, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.065894', 9952, 21, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.069362', 9953, 21, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.072633', 9954, 21, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.076635', 9955, 22, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.080631', 9956, 22, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.084634', 9957, 22, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.088643', 9958, 22, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.092635', 9959, 22, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.096637', 9960, 22, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.100635', 9961, 23, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.104635', 9962, 23, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.109635', 9963, 23, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.112633', 9964, 23, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.116632', 9965, 23, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.120922', 9966, 23, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.124635', 9967, 24, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.128634', 9968, 24, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.131632', 9969, 24, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.135715', 9970, 24, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.139630', 9971, 24, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.141629', 9972, 24, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.145630', 9973, 25, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.148638', 9974, 25, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.152632', 9975, 25, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.155631', 9976, 25, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.159631', 9977, 25, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.162632', 9978, 25, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.165804', 9979, 26, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.169631', 9980, 26, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.172631', 9981, 26, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.174629', 9982, 26, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.177629', 9983, 26, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.180630', 9984, 26, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.183787', 9985, 27, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.186727', 9986, 27, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.189630', 9987, 27, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.192629', 9988, 27, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.195631', 9989, 27, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.198634', 9990, 27, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.201629', 9991, 28, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.203630', 9992, 28, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.206630', 9993, 28, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.209631', 9994, 28, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.212634', 9995, 28, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.216635', 9996, 28, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.220046', 9997, 29, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.223636', 9998, 29, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.226634', 9999, 29, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.230631', 10000, 29, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.233632', 10001, 29, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.236707', 10002, 29, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.239630', 10003, 30, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.242635', 10004, 30, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.245631', 10005, 30, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.247631', 10006, 30, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.251635', 10007, 30, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.254632', 10008, 30, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.257629', 10009, 31, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.260656', 10010, 31, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.263662', 10011, 31, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.266629', 10012, 31, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.269649', 10013, 31, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.272680', 10014, 31, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.276631', 10015, 32, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.280640', 10016, 32, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.285631', 10017, 32, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.291639', 10018, 32, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.295640', 10019, 32, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.300635', 10020, 32, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.304665', 10021, 33, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.309636', 10022, 33, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.314637', 10023, 33, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.319633', 10024, 33, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.324635', 10025, 33, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.329647', 10026, 33, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.334635', 10027, 34, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.340643', 10028, 34, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.347644', 10029, 34, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.354645', 10030, 34, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.361650', 10031, 34, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.369643', 10032, 34, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.376639', 10033, 35, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.384640', 10034, 35, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.390638', 10035, 35, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.396641', 10036, 35, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.403642', 10037, 35, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.409635', 10038, 35, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.415639', 10039, 36, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.422639', 10040, 36, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.428643', 10041, 36, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.434657', 10042, 36, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.440638', 10043, 36, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.446783', 10044, 36, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.453645', 10045, 37, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.459637', 10046, 37, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.466646', 10047, 37, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.473635', 10048, 37, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.480657', 10049, 37, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.486642', 10050, 37, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.492637', 10051, 38, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.500645', 10052, 38, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.507646', 10053, 38, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.514636', 10054, 38, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.520638', 10055, 38, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.525635', 10056, 38, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.531641', 10057, 39, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.537642', 10058, 39, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.543641', 10059, 39, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.549641', 10060, 39, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.556639', 10061, 39, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.562642', 10062, 39, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.568645', 10063, 40, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.574644', 10064, 40, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.579734', 10065, 40, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.585643', 10066, 40, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.591637', 10067, 40, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.597633', 10068, 40, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.603642', 10069, 41, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.609636', 10070, 41, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.616917', 10071, 41, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.623647', 10072, 41, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.629644', 10073, 41, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.635638', 10074, 41, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.642644', 10075, 42, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.647646', 10076, 42, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.655640', 10077, 42, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.663715', 10078, 42, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.669637', 10079, 42, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.676374', 10080, 42, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.683859', 10081, 43, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.691642', 10082, 43, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.698658', 10083, 43, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.704639', 10084, 43, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.711727', 10085, 43, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.718639', 10086, 43, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.724644', 10087, 44, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.730645', 10088, 44, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.735650', 10089, 44, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.741638', 10090, 44, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.748070', 10091, 44, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.753643', 10092, 44, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.759638', 10093, 45, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.765638', 10094, 45, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.772637', 10095, 45, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.778640', 10096, 45, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.785644', 10097, 45, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.791633', 10098, 45, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.797642', 10099, 46, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.803641', 10100, 46, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.808643', 10101, 46, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.814654', 10102, 46, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.819838', 10103, 46, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.825636', 10104, 46, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.830636', 10105, 47, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.835635', 10106, 47, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.840639', 10107, 47, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.845640', 10108, 47, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.851643', 10109, 47, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.857641', 10110, 47, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.862641', 10111, 48, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.866848', 10112, 48, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.872641', 10113, 48, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.878642', 10114, 48, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.884637', 10115, 48, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.889638', 10116, 48, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.894858', 10117, 49, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.899635', 10118, 49, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.904647', 10119, 49, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.909635', 10120, 49, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.915645', 10121, 49, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.921635', 10122, 49, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.926636', 10123, 50, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.931647', 10124, 50, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.937644', 10125, 50, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.942636', 10126, 50, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.948646', 10127, 50, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.955645', 10128, 50, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.960651', 10129, 51, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:03.966635', 10130, 51, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:03.972643', 10131, 51, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:03.978652', 10132, 51, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:03.984640', 10133, 51, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:03.989726', 10134, 51, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:03.995641', 10135, 52, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.001635', 10136, 52, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.006037', 10137, 52, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.012800', 10138, 52, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.018791', 10139, 52, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.024785', 10140, 52, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.030788', 10141, 53, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.047783', 10142, 53, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.053099', 10143, 53, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.058849', 10144, 53, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.063783', 10145, 53, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.068894', 10146, 53, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.074846', 10147, 54, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.079796', 10148, 54, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.085810', 10149, 54, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.091791', 10150, 54, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.096840', 10151, 54, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.102167', 10152, 54, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.107786', 10153, 55, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.112804', 10154, 55, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.118786', 10155, 55, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.124793', 10156, 55, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.129852', 10157, 55, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.134793', 10158, 55, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.140807', 10159, 56, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.145796', 10160, 56, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.152894', 10161, 56, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.157803', 10162, 56, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.163852', 10163, 56, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.169792', 10164, 56, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.174802', 10165, 57, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.180795', 10166, 57, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.186792', 10167, 57, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.193794', 10168, 57, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.199791', 10169, 57, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.206850', 10170, 57, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.213108', 10171, 58, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.218802', 10172, 58, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.224799', 10173, 58, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.230793', 10174, 58, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.236808', 10175, 58, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.242797', 10176, 58, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.249791', 10177, 59, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.254792', 10178, 59, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.261785', 10179, 59, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.267841', 10180, 59, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.274785', 10181, 59, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.281803', 10182, 59, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.286906', 10183, 60, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.293787', 10184, 60, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.299842', 10185, 60, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.305849', 10186, 60, NULL, 502, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 5, '2024-06-24 14:50:04.311803', 10187, 60, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.318858', 10188, 60, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.324792', 10189, 61, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.331808', 10190, 61, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.336852', 10191, 61, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.342802', 10192, 61, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.348779', 10193, 61, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.354803', 10194, 61, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.362099', 10195, 62, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.369787', 10196, 62, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.377781', 10197, 62, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.383783', 10198, 62, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.390784', 10199, 62, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.397790', 10200, 62, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.403789', 10201, 63, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.409783', 10202, 63, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.415785', 10203, 63, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.421788', 10204, 63, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.427943', 10205, 63, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.433783', 10206, 63, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.438779', 10207, 64, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.444784', 10208, 64, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.452014', 10209, 64, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.459786', 10210, 64, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.466788', 10211, 64, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.473908', 10212, 64, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.479788', 10213, 65, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.484784', 10214, 65, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.490783', 10215, 65, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.494781', 10216, 65, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.499792', 10217, 65, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.504940', 10218, 65, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.509783', 10219, 66, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.514789', 10220, 66, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.520786', 10221, 66, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.525782', 10222, 66, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.531778', 10223, 66, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.535781', 10224, 66, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.540775', 10225, 67, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.545786', 10226, 67, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.550783', 10227, 67, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.556179', 10228, 67, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.560976', 10229, 67, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.565781', 10230, 67, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.570779', 10231, 68, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.575788', 10232, 68, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.581786', 10233, 68, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.587931', 10234, 68, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.592779', 10235, 68, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.597782', 10236, 68, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.602065', 10237, 69, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.606783', 10238, 69, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.611790', 10239, 69, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.616794', 10240, 69, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.622791', 10241, 69, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.627790', 10242, 69, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.632783', 10243, 70, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.636823', 10244, 70, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.641792', 10245, 70, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.646788', 10246, 70, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.651785', 10247, 70, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.656850', 10248, 70, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.661793', 10249, 71, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.666784', 10250, 71, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.671791', 10251, 71, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.675788', 10252, 71, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.680803', 10253, 71, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.686002', 10254, 71, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.691798', 10255, 72, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.696792', 10256, 72, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.700785', 10257, 72, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.706166', 10258, 72, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.710789', 10259, 72, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.716794', 10260, 72, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.721784', 10261, 73, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.726811', 10262, 73, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.731789', 10263, 73, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.736785', 10264, 73, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.741865', 10265, 73, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.747851', 10266, 73, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.753786', 10267, 74, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.758797', 10268, 74, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.763848', 10269, 74, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.769802', 10270, 74, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.774806', 10271, 74, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.780794', 10272, 74, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.786788', 10273, 75, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.792784', 10274, 75, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.797788', 10275, 75, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.803793', 10276, 75, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.808845', 10277, 75, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.814803', 10278, 75, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.820807', 10279, 76, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.826787', 10280, 76, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.832785', 10281, 76, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.837783', 10282, 76, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.841785', 10283, 76, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.847795', 10284, 76, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.853792', 10285, 77, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.859792', 10286, 77, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.865789', 10287, 77, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.870789', 10288, 77, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.876786', 10289, 77, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.881784', 10290, 77, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 14:50:04.887782', 10291, 78, NULL, 502, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 14:50:04.893791', 10292, 78, NULL, 502, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 14:50:04.898814', 10293, 78, NULL, 502, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 14:50:04.904790', 10294, 78, NULL, 502, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 14:50:04.910946', 10295, 78, NULL, 502, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 14:50:04.916786', 10296, 78, NULL, 502, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.427477', 10297, 1, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.590479', 10298, 1, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.593691', 10299, 1, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.597496', 10300, 1, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.600476', 10301, 1, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.603485', 10302, 1, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.607530', 10303, 2, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.609761', 10304, 2, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.612483', 10305, 2, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.616528', 10306, 2, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.618727', 10307, 2, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.623481', 10308, 2, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.626477', 10309, 3, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.629488', 10310, 3, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.632728', 10311, 3, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.635483', 10312, 3, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.639485', 10313, 3, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.643613', 10314, 3, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.646527', 10315, 4, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.649703', 10316, 4, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.653481', 10317, 4, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.657530', 10318, 4, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.660783', 10319, 4, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.664481', 10320, 4, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.667533', 10321, 5, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.670547', 10322, 5, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.673547', 10323, 5, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.675543', 10324, 5, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.677545', 10325, 5, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.681545', 10326, 5, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.683902', 10327, 6, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.686549', 10328, 6, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.690551', 10329, 6, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.693545', 10330, 6, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.696550', 10331, 6, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.699586', 10332, 6, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.701543', 10333, 7, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.704589', 10334, 7, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.707905', 10335, 7, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.710544', 10336, 7, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.713550', 10337, 7, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.716546', 10338, 7, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.719546', 10339, 8, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.723551', 10340, 8, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.725826', 10341, 8, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.727546', 10342, 8, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.731545', 10343, 8, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.733838', 10344, 8, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.735851', 10345, 9, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.739101', 10346, 9, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.741896', 10347, 9, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.744853', 10348, 9, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.746852', 10349, 9, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.750054', 10350, 9, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.752856', 10351, 10, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.755863', 10352, 10, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.758849', 10353, 10, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.760851', 10354, 10, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.763856', 10355, 10, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.766852', 10356, 10, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.768853', 10357, 11, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.771850', 10358, 11, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.774988', 10359, 11, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.777850', 10360, 11, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.779849', 10361, 11, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.783223', 10362, 11, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.785853', 10363, 12, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.788853', 10364, 12, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.791855', 10365, 12, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.793852', 10366, 12, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.796853', 10367, 12, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.800228', 10368, 12, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.802852', 10369, 13, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.805852', 10370, 13, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.808202', 10371, 13, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.810854', 10372, 13, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.813856', 10373, 13, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.816849', 10374, 13, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.819038', 10375, 14, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.821870', 10376, 14, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.824854', 10377, 14, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.827851', 10378, 14, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.830858', 10379, 14, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.833864', 10380, 14, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.835850', 10381, 15, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.838851', 10382, 15, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.841157', 10383, 15, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.844041', 10384, 15, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.846897', 10385, 15, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.850240', 10386, 15, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.852851', 10387, 16, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.854853', 10388, 16, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.858101', 10389, 16, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.860850', 10390, 16, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.862851', 10391, 16, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.866182', 10392, 16, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.869035', 10393, 17, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.871850', 10394, 17, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.874851', 10395, 17, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.877023', 10396, 17, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.879879', 10397, 17, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.882890', 10398, 17, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.885849', 10399, 18, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.888853', 10400, 18, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.891095', 10401, 18, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.893851', 10402, 18, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.896851', 10403, 18, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.900193', 10404, 18, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.902852', 10405, 19, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.904852', 10406, 19, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.908172', 10407, 19, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.910849', 10408, 19, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.913853', 10409, 19, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.917014', 10410, 19, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.918848', 10411, 20, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.921850', 10412, 20, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.924854', 10413, 20, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.926898', 10414, 20, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.929897', 10415, 20, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.933230', 10416, 20, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.935851', 10417, 21, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.938093', 10418, 21, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.941199', 10419, 21, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.943980', 10420, 21, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.946854', 10421, 21, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.950178', 10422, 21, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.952853', 10423, 22, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.955851', 10424, 22, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.957888', 10425, 22, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.960853', 10426, 22, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.964856', 10427, 22, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.966851', 10428, 22, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.969851', 10429, 23, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.972854', 10430, 23, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.974850', 10431, 23, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.977851', 10432, 23, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.980853', 10433, 23, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:49.982888', 10434, 23, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:49.984850', 10435, 24, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:49.987853', 10436, 24, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:49.990171', 10437, 24, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:49.992894', 10438, 24, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:49.995862', 10439, 24, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.009847', 10440, 24, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.012855', 10441, 25, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.014849', 10442, 25, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.017912', 10443, 25, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.019851', 10444, 25, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.029854', 10445, 25, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.033210', 10446, 25, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.035852', 10447, 26, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.038850', 10448, 26, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.041181', 10449, 26, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.043851', 10450, 26, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.046852', 10451, 26, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.048850', 10452, 26, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.051855', 10453, 27, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.054855', 10454, 27, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.057933', 10455, 27, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.059851', 10456, 27, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.063853', 10457, 27, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.066848', 10458, 27, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.068851', 10459, 28, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.070898', 10460, 28, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.073848', 10461, 28, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.076880', 10462, 28, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.079856', 10463, 28, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.081849', 10464, 28, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.084848', 10465, 29, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.087870', 10466, 29, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.090097', 10467, 29, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.091848', 10468, 29, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.094852', 10469, 29, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.097852', 10470, 29, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.099881', 10471, 30, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.102852', 10472, 30, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.105850', 10473, 30, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.108119', 10474, 30, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.110168', 10475, 30, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.113093', 10476, 30, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.115848', 10477, 31, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.118195', 10478, 31, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.120892', 10479, 31, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.124074', 10480, 31, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.126848', 10481, 31, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.128848', 10482, 31, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.131985', 10483, 32, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.134852', 10484, 32, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.136851', 10485, 32, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.140075', 10486, 32, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.142894', 10487, 32, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.144858', 10488, 32, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.148173', 10489, 33, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.150954', 10490, 33, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.153850', 10491, 33, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.156850', 10492, 33, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.159200', 10493, 33, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.161860', 10494, 33, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.164851', 10495, 34, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.167850', 10496, 34, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.169858', 10497, 34, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.172852', 10498, 34, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.174850', 10499, 34, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.177850', 10500, 34, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.179851', 10501, 35, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.182893', 10502, 35, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.184900', 10503, 35, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.186867', 10504, 35, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.189849', 10505, 35, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.191848', 10506, 35, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.193852', 10507, 36, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.196853', 10508, 36, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.198894', 10509, 36, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.201849', 10510, 36, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.204856', 10511, 36, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.207981', 10512, 36, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.210852', 10513, 37, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.212970', 10514, 37, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.215849', 10515, 37, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.218201', 10516, 37, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.221090', 10517, 37, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.224230', 10518, 37, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.227060', 10519, 38, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.230057', 10520, 38, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.233094', 10521, 38, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.235851', 10522, 38, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.238896', 10523, 38, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.241206', 10524, 38, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.243857', 10525, 39, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.246866', 10526, 39, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.249161', 10527, 39, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.252173', 10528, 39, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.254853', 10529, 39, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.258207', 10530, 39, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.260853', 10531, 40, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.263091', 10532, 40, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.266095', 10533, 40, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.268851', 10534, 40, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.271896', 10535, 40, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.274217', 10536, 40, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.277056', 10537, 41, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.279899', 10538, 41, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.282893', 10539, 41, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.284916', 10540, 41, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.288047', 10541, 41, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.291065', 10542, 41, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.292849', 10543, 42, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.295851', 10544, 42, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.298848', 10545, 42, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.301093', 10546, 42, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.303850', 10547, 42, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.306957', 10548, 42, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.309894', 10549, 43, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.312935', 10550, 43, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.314912', 10551, 43, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.317939', 10552, 43, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.320850', 10553, 43, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.323165', 10554, 43, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.326036', 10555, 44, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.329094', 10556, 44, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.331940', 10557, 44, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.334091', 10558, 44, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.336852', 10559, 44, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.340187', 10560, 44, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.343039', 10561, 45, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.345853', 10562, 45, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.348915', 10563, 45, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.351155', 10564, 45, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.354862', 10565, 45, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.356856', 10566, 45, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.360098', 10567, 46, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.362890', 10568, 46, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.366017', 10569, 46, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.368852', 10570, 46, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.371851', 10571, 46, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.373849', 10572, 46, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.375854', 10573, 47, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.378850', 10574, 47, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.381857', 10575, 47, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.384178', 10576, 47, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.386850', 10577, 47, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.390065', 10578, 47, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.392945', 10579, 48, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.395851', 10580, 48, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.397891', 10581, 48, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.400851', 10582, 48, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.403854', 10583, 48, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.406950', 10584, 48, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.410222', 10585, 49, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.412973', 10586, 49, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.414850', 10587, 49, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.417974', 10588, 49, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.420874', 10589, 49, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.423187', 10590, 49, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.426174', 10591, 50, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.428954', 10592, 50, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.431169', 10593, 50, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.434194', 10594, 50, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.436850', 10595, 50, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.439849', 10596, 50, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.441848', 10597, 51, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.443848', 10598, 51, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.446852', 10599, 51, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.449128', 10600, 51, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.451189', 10601, 51, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.453849', 10602, 51, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.456851', 10603, 52, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.458850', 10604, 52, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.460849', 10605, 52, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.463892', 10606, 52, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.465893', 10607, 52, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.468852', 10608, 52, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.470851', 10609, 53, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.473853', 10610, 53, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.475852', 10611, 53, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.479040', 10612, 53, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.481900', 10613, 53, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.484155', 10614, 53, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.486854', 10615, 54, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.489848', 10616, 54, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.492034', 10617, 54, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.493851', 10618, 54, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.496899', 10619, 54, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.499155', 10620, 54, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.501983', 10621, 55, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.504864', 10622, 55, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.506895', 10623, 55, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.509849', 10624, 55, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.512848', 10625, 55, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.514945', 10626, 55, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.517852', 10627, 56, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.520853', 10628, 56, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.522849', 10629, 56, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.526195', 10630, 56, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.529073', 10631, 56, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.531849', 10632, 56, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.534112', 10633, 57, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.535853', 10634, 57, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.539086', 10635, 57, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.541887', 10636, 57, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.544854', 10637, 57, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.546904', 10638, 57, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.550204', 10639, 58, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.552851', 10640, 58, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.555851', 10641, 58, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.559072', 10642, 58, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.561859', 10643, 58, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.564856', 10644, 58, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.567058', 10645, 59, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.568854', 10646, 59, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.572850', 10647, 59, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.574851', 10648, 59, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.576851', 10649, 59, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.580858', 10650, 59, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.582893', 10651, 60, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.585853', 10652, 60, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.588854', 10653, 60, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.591854', 10654, 60, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.593850', 10655, 60, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.596854', 10656, 60, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.599850', 10657, 61, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.601850', 10658, 61, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.603857', 10659, 61, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.607900', 10660, 61, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.610092', 10661, 61, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.613883', 10662, 61, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.616856', 10663, 62, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.618850', 10664, 62, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.622096', 10665, 62, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.624155', 10666, 62, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.626937', 10667, 62, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.629897', 10668, 62, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.632850', 10669, 63, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.634851', 10670, 63, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.637897', 10671, 63, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.641042', 10672, 63, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.643859', 10673, 63, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.646041', 10674, 63, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.648900', 10675, 64, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.651911', 10676, 64, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.654851', 10677, 64, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.657850', 10678, 64, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.660206', 10679, 64, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.663041', 10680, 64, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.666206', 10681, 65, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.668855', 10682, 65, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.671853', 10683, 65, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.674186', 10684, 65, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.676852', 10685, 65, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.678849', 10686, 65, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.682851', 10687, 66, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.684853', 10688, 66, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.688895', 10689, 66, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.691202', 10690, 66, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.693852', 10691, 66, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.696863', 10692, 66, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.699856', 10693, 67, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.701852', 10694, 67, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.704858', 10695, 67, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.707849', 10696, 67, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.709851', 10697, 67, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.712856', 10698, 67, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.715850', 10699, 68, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.717893', 10700, 68, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.720972', 10701, 68, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.724237', 10702, 68, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.726899', 10703, 68, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.729849', 10704, 68, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.732850', 10705, 69, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.734913', 10706, 69, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.737849', 10707, 69, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.741197', 10708, 69, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.743852', 10709, 69, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.746855', 10710, 69, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.749869', 10711, 70, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.752907', 10712, 70, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.755850', 10713, 70, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.758170', 10714, 70, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.760853', 10715, 70, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.763058', 10716, 70, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.765928', 10717, 71, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.768120', 10718, 71, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.770853', 10719, 71, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.773923', 10720, 71, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.776851', 10721, 71, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.779853', 10722, 71, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.782849', 10723, 72, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.784856', 10724, 72, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.787850', 10725, 72, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.790892', 10726, 72, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.792853', 10727, 72, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.795856', 10728, 72, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.798849', 10729, 73, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.800850', 10730, 73, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.803853', 10731, 73, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.806850', 10732, 73, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.809184', 10733, 73, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.811852', 10734, 73, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.814955', 10735, 74, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.817998', 10736, 74, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.820912', 10737, 74, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.824855', 10738, 74, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.826855', 10739, 74, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.829859', 10740, 74, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.832955', 10741, 75, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.834852', 10742, 75, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.838006', 10743, 75, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.841162', 10744, 75, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.843852', 10745, 75, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.846865', 10746, 75, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.849197', 10747, 76, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.851848', 10748, 76, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.854881', 10749, 76, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.858188', 10750, 76, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.860852', 10751, 76, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.863850', 10752, 76, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.866218', 10753, 77, NULL, 503, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:27:50.868851', 10754, 77, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.871080', 10755, 77, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.874182', 10756, 77, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.876850', 10757, 77, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.878851', 10758, 77, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:27:50.881850', 10759, 78, NULL, 503, 'collaborator', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 2, '2024-06-24 15:27:50.883852', 10760, 78, NULL, 503, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:27:50.886897', 10761, 78, NULL, 503, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:27:50.889897', 10762, 78, NULL, 503, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:27:50.892169', 10763, 78, NULL, 503, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:27:50.894854', 10764, 78, NULL, 503, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.287127', 10765, 1, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.291362', 10766, 1, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.294202', 10767, 1, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.299129', 10768, 1, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.301129', 10769, 1, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.304126', 10770, 1, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.307136', 10771, 2, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.310183', 10772, 2, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.312168', 10773, 2, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.316131', 10774, 2, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.319134', 10775, 2, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.322133', 10776, 2, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.326128', 10777, 3, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.328184', 10778, 3, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.332127', 10779, 3, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.335139', 10780, 3, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.338140', 10781, 3, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.341127', 10782, 3, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.343168', 10783, 4, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.346129', 10784, 4, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.350131', 10785, 4, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.353362', 10786, 4, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.356138', 10787, 4, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.359369', 10788, 4, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.362133', 10789, 5, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.366169', 10790, 5, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.369128', 10791, 5, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.371135', 10792, 5, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.375128', 10793, 5, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.378126', 10794, 5, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.380131', 10795, 6, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.383372', 10796, 6, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.386364', 10797, 6, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.389132', 10798, 6, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.392169', 10799, 6, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.394171', 10800, 6, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.398133', 10801, 7, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.401374', 10802, 7, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.404126', 10803, 7, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.408359', 10804, 7, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.411353', 10805, 7, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.414134', 10806, 7, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.417129', 10807, 8, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.420222', 10808, 8, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.423129', 10809, 8, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.426357', 10810, 8, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.429133', 10811, 8, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.432352', 10812, 8, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.435128', 10813, 9, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.438143', 10814, 9, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.441358', 10815, 9, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.444167', 10816, 9, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.447136', 10817, 9, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.450177', 10818, 9, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.453128', 10819, 10, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.456136', 10820, 10, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.459127', 10821, 10, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.462130', 10822, 10, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.466132', 10823, 10, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.469131', 10824, 10, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.472150', 10825, 11, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.475127', 10826, 11, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.479128', 10827, 11, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.482136', 10828, 11, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.484129', 10829, 11, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.487125', 10830, 11, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.490140', 10831, 12, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.493175', 10832, 12, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.496132', 10833, 12, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.500135', 10834, 12, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.503173', 10835, 12, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.507135', 10836, 12, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.509358', 10837, 13, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.512126', 10838, 13, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.516130', 10839, 13, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.519313', 10840, 13, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.521128', 10841, 13, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.525128', 10842, 13, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.527126', 10843, 14, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.530131', 10844, 14, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.533184', 10845, 14, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.536126', 10846, 14, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.538130', 10847, 14, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.542127', 10848, 14, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.544356', 10849, 15, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.546128', 10850, 15, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.550126', 10851, 15, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.552352', 10852, 15, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.555139', 10853, 15, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.558127', 10854, 15, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.560126', 10855, 16, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.562131', 10856, 16, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.566189', 10857, 16, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.569129', 10858, 16, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.572138', 10859, 16, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.575171', 10860, 16, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.578125', 10861, 17, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.580134', 10862, 17, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.584129', 10863, 17, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.586353', 10864, 17, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.589132', 10865, 17, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.591127', 10866, 17, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.594126', 10867, 18, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.596130', 10868, 18, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.599129', 10869, 18, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.601354', 10870, 18, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.604128', 10871, 18, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.608170', 10872, 18, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.610351', 10873, 19, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.612127', 10874, 19, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.615131', 10875, 19, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.618358', 10876, 19, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.621128', 10877, 19, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.624132', 10878, 19, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.626127', 10879, 20, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.629127', 10880, 20, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.632171', 10881, 20, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.634127', 10882, 20, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.637617', 10883, 20, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.640635', 10884, 20, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.643593', 10885, 21, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.645594', 10886, 21, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.648594', 10887, 21, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.650592', 10888, 21, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.653596', 10889, 21, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.656596', 10890, 21, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.659593', 10891, 22, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.661829', 10892, 22, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.664597', 10893, 22, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.667834', 10894, 22, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.670595', 10895, 22, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.674601', 10896, 22, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.676596', 10897, 23, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.679595', 10898, 23, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.682641', 10899, 23, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.684596', 10900, 23, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.686592', 10901, 23, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.689595', 10902, 23, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.691594', 10903, 24, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.694594', 10904, 24, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.696598', 10905, 24, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.698595', 10906, 24, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.701620', 10907, 24, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.704596', 10908, 24, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.706595', 10909, 25, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.709759', 10910, 25, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.711831', 10911, 25, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.714600', 10912, 25, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.717665', 10913, 25, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.719907', 10914, 25, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.722668', 10915, 26, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.724666', 10916, 26, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.727667', 10917, 26, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.729668', 10918, 26, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.733720', 10919, 26, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.735724', 10920, 26, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.738727', 10921, 27, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.741792', 10922, 27, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.744086', 10923, 27, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.747097', 10924, 27, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.749329', 10925, 27, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.752444', 10926, 27, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.755098', 10927, 28, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.758214', 10928, 28, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.760544', 10929, 28, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.763180', 10930, 28, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.765175', 10931, 28, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.768298', 10932, 28, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.771177', 10933, 29, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.774182', 10934, 29, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.777177', 10935, 29, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.779176', 10936, 29, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.783179', 10937, 29, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.785176', 10938, 29, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.787175', 10939, 30, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.790175', 10940, 30, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.793218', 10941, 30, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.795176', 10942, 30, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.798418', 10943, 30, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.801216', 10944, 30, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.803492', 10945, 31, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.806425', 10946, 31, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.809226', 10947, 31, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.812173', 10948, 31, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.815178', 10949, 31, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.817440', 10950, 31, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.820262', 10951, 32, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.822212', 10952, 32, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.825176', 10953, 32, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.827173', 10954, 32, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.829175', 10955, 32, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.832407', 10956, 32, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.834172', 10957, 33, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.837172', 10958, 33, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.839178', 10959, 33, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.842405', 10960, 33, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.845177', 10961, 33, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.848307', 10962, 33, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.851176', 10963, 34, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.853219', 10964, 34, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.856185', 10965, 34, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.858228', 10966, 34, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.861226', 10967, 34, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.864175', 10968, 34, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.866408', 10969, 35, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.869172', 10970, 35, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.871177', 10971, 35, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.873180', 10972, 35, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.876174', 10973, 35, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.878206', 10974, 35, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.881193', 10975, 36, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.884176', 10976, 36, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.887175', 10977, 36, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.889218', 10978, 36, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.892174', 10979, 36, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.895176', 10980, 36, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.897174', 10981, 37, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.900174', 10982, 37, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.902556', 10983, 37, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.905174', 10984, 37, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.908174', 10985, 37, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.910174', 10986, 37, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.913180', 10987, 38, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.916175', 10988, 38, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.918428', 10989, 38, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.920206', 10990, 38, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.923207', 10991, 38, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.926181', 10992, 38, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.928434', 10993, 39, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.931234', 10994, 39, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.934203', 10995, 39, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.936173', 10996, 39, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.939323', 10997, 39, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.942214', 10998, 39, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.944404', 10999, 40, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.947176', 11000, 40, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.950318', 11001, 40, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.952436', 11002, 40, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.955177', 11003, 40, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.958172', 11004, 40, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.960442', 11005, 41, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.962174', 11006, 41, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.965174', 11007, 41, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.967417', 11008, 41, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.969437', 11009, 41, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.972215', 11010, 41, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.975173', 11011, 42, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.977378', 11012, 42, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.981177', 11013, 42, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:27.984381', 11014, 42, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:27.987182', 11015, 42, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:27.989174', 11016, 42, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:27.992513', 11017, 43, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:27.995174', 11018, 43, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:27.997173', 11019, 43, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.000540', 11020, 43, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.003333', 11021, 43, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.006174', 11022, 43, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.009472', 11023, 44, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.012183', 11024, 44, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.015189', 11025, 44, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.017490', 11026, 44, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.020238', 11027, 44, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.023174', 11028, 44, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.026174', 11029, 45, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.028175', 11030, 45, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.031175', 11031, 45, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.034325', 11032, 45, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.037179', 11033, 45, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.039268', 11034, 45, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.042523', 11035, 46, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.045176', 11036, 46, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.048225', 11037, 46, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.051172', 11038, 46, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.053211', 11039, 46, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.056180', 11040, 46, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.058176', 11041, 47, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.061305', 11042, 47, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.064217', 11043, 47, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.066486', 11044, 47, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.069499', 11045, 47, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.072174', 11046, 47, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.075174', 11047, 48, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.077172', 11048, 48, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.079177', 11049, 48, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.081202', 11050, 48, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.084173', 11051, 48, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.087177', 11052, 48, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.090180', 11053, 49, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.093177', 11054, 49, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.095176', 11055, 49, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.098180', 11056, 49, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.100515', 11057, 49, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.103529', 11058, 49, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.106429', 11059, 50, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.109492', 11060, 50, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.112177', 11061, 50, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.115180', 11062, 50, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.117385', 11063, 50, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.120174', 11064, 50, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.122174', 11065, 51, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.125172', 11066, 51, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.127432', 11067, 51, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.129174', 11068, 51, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.133172', 11069, 51, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.135173', 11070, 51, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.137175', 11071, 52, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.140178', 11072, 52, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.142438', 11073, 52, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.144428', 11074, 52, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.147176', 11075, 52, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.150173', 11076, 52, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.153173', 11077, 53, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.155176', 11078, 53, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.158530', 11079, 53, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.161480', 11080, 53, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.164390', 11081, 53, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.167179', 11082, 53, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.169499', 11083, 54, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.172214', 11084, 54, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.175174', 11085, 54, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.177512', 11086, 54, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.180173', 11087, 54, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.183236', 11088, 54, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.185221', 11089, 55, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.188220', 11090, 55, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.191174', 11091, 55, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.193505', 11092, 55, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.196175', 11093, 55, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.199175', 11094, 55, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.201552', 11095, 56, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.204180', 11096, 56, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.206218', 11097, 56, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.209549', 11098, 56, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.212176', 11099, 56, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.214174', 11100, 56, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.217174', 11101, 57, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.220175', 11102, 57, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.222174', 11103, 57, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.225172', 11104, 57, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.238186', 11105, 57, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.240418', 11106, 57, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.243251', 11107, 58, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.246183', 11108, 58, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.248415', 11109, 58, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.251218', 11110, 58, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.253174', 11111, 58, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.256178', 11112, 58, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.258172', 11113, 59, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.260171', 11114, 59, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.264176', 11115, 59, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.268176', 11116, 59, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.270176', 11117, 59, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.273174', 11118, 59, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.275173', 11119, 60, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.277498', 11120, 60, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.280412', 11121, 60, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.282190', 11122, 60, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.285174', 11123, 60, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.288177', 11124, 60, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.291176', 11125, 61, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.293174', 11126, 61, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.295177', 11127, 61, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.298215', 11128, 61, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.300173', 11129, 61, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.303216', 11130, 61, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.305174', 11131, 62, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.308541', 11132, 62, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.311337', 11133, 62, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.314389', 11134, 62, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.317174', 11135, 62, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.320180', 11136, 62, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.323180', 11137, 63, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.325178', 11138, 63, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.328270', 11139, 63, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.331176', 11140, 63, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.333218', 11141, 63, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.335176', 11142, 63, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.337175', 11143, 64, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.340488', 11144, 64, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.343290', 11145, 64, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.345174', 11146, 64, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.348279', 11147, 64, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.350478', 11148, 64, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.353280', 11149, 65, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.356173', 11150, 65, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.358403', 11151, 65, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.361468', 11152, 65, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.364173', 11153, 65, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.367195', 11154, 65, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.369505', 11155, 66, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.372240', 11156, 66, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.374565', 11157, 66, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.377252', 11158, 66, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.379254', 11159, 66, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.382659', 11160, 66, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.384879', 11161, 67, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.387671', 11162, 67, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.390675', 11163, 67, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.392998', 11164, 67, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.395678', 11165, 67, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.397915', 11166, 67, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.400671', 11167, 68, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.403005', 11168, 68, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.405672', 11169, 68, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.409676', 11170, 68, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.411717', 11171, 68, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.414674', 11172, 68, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.418018', 11173, 69, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.420671', 11174, 69, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.422673', 11175, 69, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.426674', 11176, 69, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.428670', 11177, 69, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.431920', 11178, 69, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.434906', 11179, 70, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.437674', 11180, 70, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.439812', 11181, 70, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.443029', 11182, 70, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.445672', 11183, 70, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.448675', 11184, 70, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.451025', 11185, 71, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.453680', 11186, 71, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.456679', 11187, 71, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.459681', 11188, 71, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.463681', 11189, 71, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.466673', 11190, 71, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.469672', 11191, 72, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.472671', 11192, 72, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.474671', 11193, 72, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.477670', 11194, 72, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.479918', 11195, 72, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.482727', 11196, 72, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.484724', 11197, 73, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.486733', 11198, 73, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.489725', 11199, 73, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.491727', 11200, 73, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.493759', 11201, 73, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.496806', 11202, 73, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.499725', 11203, 74, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.502056', 11204, 74, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.504776', 11205, 74, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.507963', 11206, 74, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.510033', 11207, 74, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.512729', 11208, 74, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.515727', 11209, 75, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.518098', 11210, 75, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.520727', 11211, 75, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.523728', 11212, 75, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.526726', 11213, 75, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.528728', 11214, 75, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.531772', 11215, 76, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.534033', 11216, 76, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.536732', 11217, 76, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.539769', 11218, 76, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.542847', 11219, 76, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.544880', 11220, 76, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.547987', 11221, 77, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.551177', 11222, 77, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.553801', 11223, 77, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.556816', 11224, 77, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.558801', 11225, 77, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.561800', 11226, 77, NULL, 504, 'collaborator', NULL, ''),
(b'1', 1, '2024-06-24 15:30:28.564802', 11227, 78, NULL, 504, 'collaborator', NULL, ''),
(b'1', 2, '2024-06-24 15:30:28.567833', 11228, 78, NULL, 504, 'collaborator', NULL, ''),
(b'1', 3, '2024-06-24 15:30:28.569797', 11229, 78, NULL, 504, 'collaborator', NULL, ''),
(b'1', 4, '2024-06-24 15:30:28.572809', 11230, 78, NULL, 504, 'collaborator', NULL, ''),
(b'1', 5, '2024-06-24 15:30:28.574800', 11231, 78, NULL, 504, 'collaborator', NULL, ''),
(b'1', 6, '2024-06-24 15:30:28.578800', 11232, 78, NULL, 504, 'collaborator', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `model_permission_utilisateur_seq`
--

CREATE TABLE `model_permission_utilisateur_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_permission_utilisateur_seq`
--

INSERT INTO `model_permission_utilisateur_seq` (`next_val`) VALUES
(11233);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `numero_ordre` int(11) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `date_news` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `destinataire` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_seq`
--

CREATE TABLE `news_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_seq`
--

INSERT INTO `news_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `niveau_etude`
--

CREATE TABLE `niveau_etude` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `niveau_etude`
--

INSERT INTO `niveau_etude` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
(NULL, 1, NULL, '1', NULL, 'Postgraduate', NULL),
(NULL, 2, NULL, '2', NULL, 'Undergraduate', NULL),
(NULL, 3, NULL, '3', NULL, 'Graduate', NULL),
(NULL, 4, NULL, '4', NULL, 'Other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `niveau_etude_seq`
--

CREATE TABLE `niveau_etude_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `niveau_etude_seq`
--

INSERT INTO `niveau_etude_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `pack_student`
--

CREATE TABLE `pack_student` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` longtext,
  `expectations` longtext,
  `for_groupe` bit(1) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_cours` int(11) DEFAULT NULL,
  `old_price` varchar(255) DEFAULT NULL,
  `pre_requisites` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `total_students` int(11) DEFAULT NULL,
  `why_take_this_course` longtext,
  `level` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pack_student`
--

INSERT INTO `pack_student` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `description`, `expectations`, `for_groupe`, `img_url`, `libelle`, `nombre_cours`, `old_price`, `pre_requisites`, `rating`, `total_students`, `why_take_this_course`, `level`, `price`) VALUES
(35199, NULL, NULL, NULL, NULL, NULL, 'في عالم اليوم المعولم ، هناك العديد من الأسباب لتعلم لغة أجنبية والعديد من المزايا لدراسة اللغة الإنجليزية على وجه التحديد.\n\nفإتقانك للإنجليزية يتيح لك فرصة النجاح في وظيفتك بنسبة تزيد عن 35٪ وكذلك تفتح لك الأفاق للدراسة في الخارج أو حتى السفر لأي دولة في العالم بدون الإضطرار لتعلم لغة أخرى. ثم إن جميع المهارات التي ترغب في تعلمها فهي متاحة أكثر بالإنجليزية على جميع المواقع المهمة', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'SILVER', 8, '1040', 'Level: Intermediate / المستوى: متوسط', '5', 8, 'نهدف على منصتنا أن نأخذ بيدك حتى لتتقن اللغة الإنجليزية مهما كان مستواك أو مشاكل لتستطيع التحدث بطلاقة و كتابة أي نص بطريقة إحترافية، بالإظافة إلى القراءة والإستماع الفعال. فطريقتنا البيداغوجية تعتمد منهجا مختلفا حيث المتعلم هو من يتحدث أكثر و يشارك بطريقة فعالة ليبقى دور الأستاذ هو التوجيه. فشعارنا الإنجليزية من الصفر إلح الإحتراف', 25000, 3),
(35212, NULL, NULL, NULL, NULL, 'p133', 'سيسمح لك إكمال دورة \"متوسط\" بالانتقال إلى المستوى \"فوق المتوسط\" أو الالتحاق بجامعة أجنبية أو الحصول على وظيفة في شركة دولية. يتعرف الطلاب على القواعد والمفردات ، ويفهمون المواقف النموذجية للتواصل مع المتحدثين الأصليين', 'It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you\'ve mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.', b'0', 'https://drive.google.com/uc?export=view&id=175fGvbb5RdWYJibWG2AuDwPF2lLK8PBa', 'GOLD', 24, '4500', 'Level: Intermediate / المستوى: متوسط', '4.6', 0, '١ـ مع اللغة الإنجليزية ، يمكنك الدراسة في جميع أنحاء العالم:\nنظرًا لأن اللغة الإنجليزية يتم التحدث بها في العديد من البلدان المختلفة ، فهناك الآلاف من المدارس والجامعات حول العالم التي تقدم برامج باللغة الإنجليزية. إذا كنت تتحدث الإنجليزية الأكاديمية جيدًا ، فهناك الكثير من الفرص المتاحة لك للعثور على مدرسة ودورة مناسبة تناسب احتياجاتك. تعرف على كيفية الالتحاق بالجامعة في بلد يتحدث الإنجليزية.\n٢ـ تتيح لك اللغة الإنجليزية الوصول إلى ثقافات متعددة:\nتتيح لك المعرفة الجيدة باللغة الإنجليزية الوصول إلى الأفلام والموسيقى والأدب من مئات البلدان حول العالم. ناهيك عن حقيقة أن العديد من الكتب من جميع أنحاء العالم تُرجمت إلى اللغة الإنجليزية. قليل من التجارب ستجعلك تنمو كشخص أكثر من تعلم القيم والعادات وأسلوب الحياة في ثقافة مختلفة عن ثقافتك', 25000, 4),
(35402, NULL, NULL, NULL, NULL, 'gduewdy', 'في عالم اليوم المعولم ، هناك العديد من الأسباب لتعلم لغة أجنبية والعديد من المزايا لدراسة اللغة الإنجليزية على وجه التحديد.\n\nفإتقانك للإنجليزية يتيح لك فرصة النجاح في وظيفتك بنسبة تزيد عن 35٪ وكذلك تفتح لك الأفاق للدراسة في الخارج أو حتى السفر لأي دولة في العالم بدون الإضطرار لتعلم لغة أخرى. ثم إن جميع المهارات التي ترغب في تعلمها فهي متاحة أكثر بالإنجليزية على جميع المواقع المهمة....', 'نهدف على منصتنا أن نأخذ بيدك حتى تتقن اللغة الإنجليزية مهما كان مستواك أو المشاكل التي لتستطيع التحدث بطلاقة و كتابة أي نص بطريقة إحترافية، بالإظافة إلى القراءة والإستماع الفعال. فطريقتنا البيداغوجية تعتمد منهجا مختلفا حيث المتعلم هو من يتحدث أكثر و يشارك بطريقة فعالة ليبقى دور الأستاذ هو التوجيه. فشعارنا الإنجليزية من الصفر إلح الإحتراف', b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'SILVER', 8, '1040', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.7', 70, 'مرونة أكبر في اختيار الوقت واليوم.\n\nكل الوقت لك وحدك مع مدرس لغة إنجليزية معترف به.\n\nمتوفر 24 ساعة في اليوم ، 7 أيام في الأسبوع.\n\nبيداغوجية محترفة بحيث يتكلم الطالب 70٪ والمعلم 30٪ فقط من الوقت.\n\nتنمية المهارات الأربع: الاستماع والقراءة والكتابة والمحادثة.', 1, 3),
(35403, NULL, NULL, NULL, NULL, 'fdryr', 'في عالم اليوم المعولم ، هناك العديد من الأسباب لتعلم لغة أجنبية والعديد من المزايا لدراسة اللغة الإنجليزية على وجه التحديد.\n\nفإتقانك للإنجليزية يتيح لك فرصة النجاح في وظيفتك بنسبة تزيد عن 35٪ وكذلك تفتح لك الأفاق للدراسة في الخارج أو حتى السفر لأي دولة في العالم بدون الإضطرار لتعلم لغة أخرى. ثم إن جميع المهارات التي ترغب في تعلمها فهي متاحة أكثر بالإنجليزية على جميع المواقع المهمة....', 'نهدف على منصتنا أن نأخذ بيدك حتى تتقن اللغة الإنجليزية مهما كان مستواك أو المشاكل التي لتستطيع التحدث بطلاقة و كتابة أي نص بطريقة إحترافية، بالإظافة إلى القراءة والإستماع الفعال. فطريقتنا البيداغوجية تعتمد منهجا مختلفا حيث المتعلم هو من يتحدث أكثر و يشارك بطريقة فعالة ليبقى دور الأستاذ هو التوجيه. فشعارنا الإنجليزية من الصفر إلح الإحتراف', b'0', 'https://drive.google.com/uc?export=view&id=175fGvbb5RdWYJibWG2AuDwPF2lLK8PBa', 'GOLD', 24, '3120', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.8', 12, 'مرونة أكبر في اختيار الوقت واليوم.\n\nكل الوقت لك وحدك مع مدرس لغة إنجليزية معترف به.\n\nمتوفر 24 ساعة في اليوم ، 7 أيام في الأسبوع.\n\nبيداغوجية محترفة بحيث يتكلم الطالب 70٪ والمعلم 30٪ فقط من الوقت.\n\nتنمية المهارات الأربع: الاستماع والقراءة والكتابة والمحادثة.', 1, 4),
(35404, NULL, NULL, NULL, NULL, 'fwedjhw', 'في عالم اليوم المعولم ، هناك العديد من الأسباب لتعلم لغة أجنبية والعديد من المزايا لدراسة اللغة الإنجليزية على وجه التحديد.\n\nفإتقانك للإنجليزية يتيح لك فرصة النجاح في وظيفتك بنسبة تزيد عن 35٪ وكذلك تفتح لك الأفاق للدراسة في الخارج أو حتى السفر لأي دولة في العالم بدون الإضطرار لتعلم لغة أخرى. ثم إن جميع المهارات التي ترغب في تعلمها فهي متاحة أكثر بالإنجليزية على جميع المواقع المهمة....', 'نهدف على منصتنا أن نأخذ بيدك حتى تتقن اللغة الإنجليزية مهما كان مستواك أو المشاكل التي لتستطيع التحدث بطلاقة و كتابة أي نص بطريقة إحترافية، بالإظافة إلى القراءة والإستماع الفعال. فطريقتنا البيداغوجية تعتمد منهجا مختلفا حيث المتعلم هو من يتحدث أكثر و يشارك بطريقة فعالة ليبقى دور الأستاذ هو التوجيه. فشعارنا الإنجليزية من الصفر إلح الإحتراف', b'0', 'https://drive.google.com/uc?export=view&id=1h2G4UJqu71F_OHbTDB1n4DJUXj6w1RM8', 'PLATINUM', 48, '6240', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.8', 12, 'مرونة أكبر في اختيار الوقت واليوم.\n\nكل الوقت لك وحدك مع مدرس لغة إنجليزية معترف به.\n\nمتوفر 24 ساعة في اليوم ، 7 أيام في الأسبوع.\n\nبيداغوجية محترفة بحيث يتكلم الطالب 70٪ والمعلم 30٪ فقط من الوقت.\n\nتنمية المهارات الأربع: الاستماع والقراءة والكتابة والمحادثة.', 1, 5),
(35405, NULL, NULL, NULL, NULL, 'gr-elimentry', 'في عالم اليوم المعولم ، هناك العديد من الأسباب لتعلم لغة أجنبية والعديد من المزايا لدراسة اللغة الإنجليزية على وجه التحديد.\n\nفإتقانك للإنجليزية يتيح لك فرصة النجاح في وظيفتك بنسبة تزيد عن 35٪ وكذلك تفتح لك الأفاق للدراسة في الخارج أو حتى السفر لأي دولة في العالم بدون الإضطرار لتعلم لغة أخرى. ثم إن جميع المهارات التي ترغب في تعلمها فهي متاحة أكثر بالإنجليزية على جميع المواقع المهمة', 'نهدف على منصتنا أن نأخذ بيدك حتى تتقن اللغة الإنجليزية مهما كان مستواك أو المشاكل التي لتستطيع التحدث بطلاقة و كتابة أي نص بطريقة إحترافية، بالإظافة إلى القراءة والإستماع الفعال. فطريقتنا البيداغوجية تعتمد منهجا مختلفا حيث المتعلم هو من يتحدث أكثر و يشارك بطريقة فعالة ليبقى دور الأستاذ هو التوجيه. فشعارنا الإنجليزية من الصفر إلح الإحتراف', b'1', 'https://drive.google.com/uc?export=view&id=175fGvbb5RdWYJibWG2AuDwPF2lLK8PBa', 'PREMIUM', 8, '500', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.8', 33, 'مرونة أكبر في اختيار الوقت واليوم.\n\nكل الوقت لك وحدك مع مدرس لغة إنجليزية معترف به.\n\nمتوفر 24 ساعة في اليوم ، 7 أيام في الأسبوع.\n\nبيداغوجية محترفة بحيث يتكلم الطالب 70٪ والمعلم 30٪ فقط من الوقت.\n\nتنمية المهارات الأربع: الاستماع والقراءة والكتابة والمحادثة.', 1, 6),
(35408, NULL, NULL, NULL, NULL, 'Ui', 'سيسمح لك إكمال دورة \"متوسط\" بالانتقال إلى المستوى \"فوق المتوسط\" أو الالتحاق بجامعة أجنبية أو الحصول على وظيفة في شركة دولية. يتعرف الطلاب على القواعد والمفردات ، ويفهمون المواقف النموذجية للتواصل مع المتحدثين الأصليين', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1h2G4UJqu71F_OHbTDB1n4DJUXj6w1RM8', 'PLATINUM', 48, '9000', 'Level: Intermediate / المستوى: متوسط', '4.9', 1, '١ـ مع اللغة الإنجليزية ، يمكنك الدراسة في جميع أنحاء العالم:\nنظرًا لأن اللغة الإنجليزية يتم التحدث بها في العديد من البلدان المختلفة ، فهناك الآلاف من المدارس والجامعات حول العالم التي تقدم برامج باللغة الإنجليزية. إذا كنت تتحدث الإنجليزية الأكاديمية جيدًا ، فهناك الكثير من الفرص المتاحة لك للعثور على مدرسة ودورة مناسبة تناسب احتياجاتك. تعرف على كيفية الالتحاق بالجامعة في بلد يتحدث الإنجليزية.\n٢ـ تتيح لك اللغة الإنجليزية الوصول إلى ثقافات متعددة:\nتتيح لك المعرفة الجيدة باللغة الإنجليزية الوصول إلى الأفلام والموسيقى والأدب من مئات البلدان حول العالم. ناهيك عن حقيقة أن العديد من الكتب من جميع أنحاء العالم تُرجمت إلى اللغة الإنجليزية. قليل من التجارب ستجعلك تنمو كشخص أكثر من تعلم القيم والعادات وأسلوب الحياة في ثقافة مختلفة عن ثقافتك', 25000, 5),
(35409, NULL, NULL, NULL, NULL, 'Ui', 'تسمح لك الدورة بالتقدم أكثر في تعلم اللغة الإنجليزية. خلال الدروس ، يمكنك التعرف على كلمات وقواعد جديدة للمستوى قبل المتوسط. ستساعد الدروس في تطوير المهارات الحالية: الاستماع والقراءة والكتابة والتحدث', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'SILVER', 8, '1500', 'Level: Elementary / المستوى: ابتدائي', '4.7', 10, '\n١ـ اللغة الإنجليزية هي لغة عالمية:  \nاللغة الإنجليزية هي اللغة الأكثر شيوعًا في العالم. يستطيع واحد من كل خمسة أشخاص التحدث باللغة الإنجليزية أو فهمها على الأقل!\n٢ـ يمكن أن تساعدك دراسة اللغة الإنجليزية في الحصول على وظيفة:\n\nاللغة الإنجليزية هي لغة العلوم والطيران وأجهزة الكمبيوتر والدبلوماسية والسياحة. تزيد معرفة اللغة الإنجليزية من فرصك في الحصول على وظيفة جيدة في شركة متعددة الجنسيات داخل بلدك الأم أو في العثور على عمل في الخارج', 5095, 3),
(35416, NULL, NULL, NULL, NULL, 'gr-pre Inter', 'تسمح لك الدورة بالتقدم أكثر في تعلم اللغة الإنجليزية. خلال الدروس ، يمكنك التعرف على كلمات وقواعد جديدة للمستوى قبل المتوسط. ستساعد الدروس في تطوير المهارات الحالية: الاستماع والقراءة والكتابة والتحدث', NULL, b'1', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'PREMIUM', 8, '450', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.6', 5, '١ـ اللغة الإنجليزية هي لغة عالمية:  \nاللغة الإنجليزية هي اللغة الأكثر شيوعًا في العالم. يستطيع واحد من كل خمسة أشخاص التحدث باللغة الإنجليزية أو فهمها على الأقل!\n٢ـ يمكن أن تساعدك دراسة اللغة الإنجليزية في الحصول على وظيفة:\n\nاللغة الإنجليزية هي لغة العلوم والطيران وأجهزة الكمبيوتر والدبلوماسية والسياحة. تزيد معرفة اللغة الإنجليزية من فرصك في الحصول على وظيفة جيدة في شركة متعددة الجنسيات داخل بلدك الأم أو في العثور على عمل في الخارج', 5095, 6),
(35418, NULL, NULL, NULL, NULL, 'in-pre Inter', 'تسمح لك الدورة بالتقدم أكثر في تعلم اللغة الإنجليزية. خلال الدروس ، يمكنك التعرف على كلمات وقواعد جديدة للمستوى قبل المتوسط. ستساعد الدروس في تطوير المهارات الحالية: الاستماع والقراءة والكتابة والتحدث', '1. Learning English can help you meet new people:\nEnglish is the official language of 53 countries and is used as a lingua franca (a mutually known language) by people from all around the world. This means that whether you’re working in Beijing, or travelling in Brazil, studying English can help you have a conversation with people from all over the world\n2. Many scientific papers are written in English:\nIn the last century, the number of scientific papers written in English has started to outweigh the number of papers written in the native language of the researcher. In the Netherlands, for example, the ratio is a surprising 40 to 1. For this reason, having a knowledge of English is incredibly important to those working in the scientific field.\n', b'0', 'https://drive.google.com/uc?export=view&id=175fGvbb5RdWYJibWG2AuDwPF2lLK8PBa', 'GOLD', 24, '4500', 'Level: Elementary / المستوى: ابتدائي', '4.9', 2, '\n١ـ اللغة الإنجليزية هي لغة عالمية:  \nاللغة الإنجليزية هي اللغة الأكثر شيوعًا في العالم. يستطيع واحد من كل خمسة أشخاص التحدث باللغة الإنجليزية أو فهمها على الأقل!\n٢ـ يمكن أن تساعدك دراسة اللغة الإنجليزية في الحصول على وظيفة:\n\nاللغة الإنجليزية هي لغة العلوم والطيران وأجهزة الكمبيوتر والدبلوماسية والسياحة. تزيد معرفة اللغة الإنجليزية من فرصك في الحصول على وظيفة جيدة في شركة متعددة الجنسيات داخل بلدك الأم أو في العثور على عمل في الخارج', 5095, 4),
(35419, NULL, NULL, NULL, NULL, 'in-pre Inte', 'تسمح لك الدورة بالتقدم أكثر في تعلم اللغة الإنجليزية. خلال الدروس ، يمكنك التعرف على كلمات وقواعد جديدة للمستوى قبل المتوسط. ستساعد الدروس في تطوير المهارات الحالية: الاستماع والقراءة والكتابة والتحدث', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1h2G4UJqu71F_OHbTDB1n4DJUXj6w1RM8', 'PLATINUM', 48, '9000', 'Level: Elementary / المستوى: ابتدائي', '4.9', 1, '\n١ـ اللغة الإنجليزية هي لغة عالمية:  \nاللغة الإنجليزية هي اللغة الأكثر شيوعًا في العالم. يستطيع واحد من كل خمسة أشخاص التحدث باللغة الإنجليزية أو فهمها على الأقل!\n٢ـ يمكن أن تساعدك دراسة اللغة الإنجليزية في الحصول على وظيفة:\n\nاللغة الإنجليزية هي لغة العلوم والطيران وأجهزة الكمبيوتر والدبلوماسية والسياحة. تزيد معرفة اللغة الإنجليزية من فرصك في الحصول على وظيفة جيدة في شركة متعددة الجنسيات داخل بلدك الأم أو في العثور على عمل في الخارج', 5095, 5),
(36759, NULL, NULL, NULL, NULL, 'gr-intermediate', 'تعد دورة اللغة الإنجليزية المتوسطة فرصة للانتقال من المستوى \"شبه المتوسط\" إلى المستوى \"المتوسط\" وتحسين مهارات التحدث لديك. بمساعدة هذه الدورة ، يمكنك فهم النقاط الرئيسية للنص الواضح حول الموضوعات المألوفة ، وإنتاج نصوص بسيطة ومنظمة. بالإضافة إلى أنك ستتمكن من وصف التجارب والأحداث والرغبات والتطلعات وشرح الآراء والخطط', NULL, b'1', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'PREMIUM', 8, '450', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.9', 2, '١ـ السفر أسهل كثيرًا مع معرفة جيدة باللغة الإنجليزية:\nتخيل أنك شخص عربي تقضي إجازة في تايلاند ، بينما قد لا يتمكن موظف الاستقبال في الفندق من الإجابة على سؤالك باللغة العربية ، فمن المحتمل أنه سيتمكن من الإجابة على سؤالك باللغة الإنجليزية.\n٢ـ اللغة الإنجليزية هي لغة الإنترنت:\nاللغة الإنجليزية هي لغة مهمة بشكل خاص على الإنترنت حيث يتم كتابة أكثر من نصف المحتوى على الإنترنت باللغة الإنجليزية. بالإضافة إلى ذلك ، يوجد مقر بعض أكبر شركات التكنولوجيا في العالم في البلدان الناطقة باللغة الإنجليزية', 13000, 6),
(36761, NULL, NULL, NULL, NULL, 'in-intermediate', 'تعد دورة اللغة الإنجليزية المتوسطة فرصة للانتقال من المستوى \"شبه المتوسط\" إلى المستوى \"المتوسط\" وتحسين مهارات التحدث لديك. بمساعدة هذه الدورة ، يمكنك فهم النقاط الرئيسية للنص الواضح حول الموضوعات المألوفة ، وإنتاج نصوص بسيطة ومنظمة. بالإضافة إلى أنك ستتمكن من وصف التجارب والأحداث والرغبات والتطلعات وشرح الآراء والخطط', NULL, b'0', 'https://drive.google.com/uc?export=view&id=175fGvbb5RdWYJibWG2AuDwPF2lLK8PBa', 'GOLD', 24, '4500', 'Level: Pre-Intermediate / المستوى: ما قبل المتوسط', '4.8', 5, '١ـ السفر أسهل كثيرًا مع معرفة جيدة باللغة الإنجليزية:\nتخيل أنك شخص عربي تقضي إجازة في تايلاند ، بينما قد لا يتمكن موظف الاستقبال في الفندق من الإجابة على سؤالك باللغة العربية ، فمن المحتمل أنه سيتمكن من الإجابة على سؤالك باللغة الإنجليزية.\n٢ـ اللغة الإنجليزية هي لغة الإنترنت:\nاللغة الإنجليزية هي لغة مهمة بشكل خاص على الإنترنت حيث يتم كتابة أكثر من نصف المحتوى على الإنترنت باللغة الإنجليزية. بالإضافة إلى ذلك ، يوجد مقر بعض أكبر شركات التكنولوجيا في العالم في البلدان الناطقة باللغة الإنجليزية', 13000, 4),
(37367, NULL, NULL, NULL, NULL, 'in-Intermediate', 'تعد دورة اللغة الإنجليزية المتوسطة فرصة للانتقال من المستوى \"شبه المتوسط\" إلى المستوى \"المتوسط\" وتحسين مهارات التحدث لديك. بمساعدة هذه الدورة ، يمكنك فهم النقاط الرئيسية للنص الواضح حول الموضوعات المألوفة ، وإنتاج نصوص بسيطة ومنظمة. بالإضافة إلى أنك ستتمكن من وصف التجارب والأحداث والرغبات والتطلعات وشرح الآراء والخطط', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1h2G4UJqu71F_OHbTDB1n4DJUXj6w1RM8', 'PLATINUM', 48, '9000', 'Level: Pre-Intermediate', '4.9', 1, '١ـ السفر أسهل كثيرًا مع معرفة جيدة باللغة الإنجليزية:\nتخيل أنك شخص عربي تقضي إجازة في تايلاند ، بينما قد لا يتمكن موظف الاستقبال في الفندق من الإجابة على سؤالك باللغة العربية ، فمن المحتمل أنه سيتمكن من الإجابة على سؤالك باللغة الإنجليزية.\n٢ـ اللغة الإنجليزية هي لغة الإنترنت:\nاللغة الإنجليزية هي لغة مهمة بشكل خاص على الإنترنت حيث يتم كتابة أكثر من نصف المحتوى على الإنترنت باللغة الإنجليزية. بالإضافة إلى ذلك ، يوجد مقر بعض أكبر شركات التكنولوجيا في العالم في البلدان الناطقة باللغة الإنجليزية', 13000, 5),
(37368, NULL, NULL, NULL, NULL, 'in-Intermediate', 'تعد دورة اللغة الإنجليزية المتوسطة فرصة للانتقال من المستوى \"شبه المتوسط\" إلى المستوى \"المتوسط\" وتحسين مهارات التحدث لديك. بمساعدة هذه الدورة ، يمكنك فهم النقاط الرئيسية للنص الواضح حول الموضوعات المألوفة ، وإنتاج نصوص بسيطة ومنظمة. بالإضافة إلى أنك ستتمكن من وصف التجارب والأحداث والرغبات والتطلعات وشرح الآراء والخطط', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'SILVER', 8, '1500', 'Level: Pre-Intermediate / المستوى: ما قبل المتوسط', '4.7', 4, '١ـ السفر أسهل كثيرًا مع معرفة جيدة باللغة الإنجليزية:\nتخيل أنك شخص عربي تقضي إجازة في تايلاند ، بينما قد لا يتمكن موظف الاستقبال في الفندق من الإجابة على سؤالك باللغة العربية ، فمن المحتمل أنه سيتمكن من الإجابة على سؤالك باللغة الإنجليزية.\n٢ـ اللغة الإنجليزية هي لغة الإنترنت:\nاللغة الإنجليزية هي لغة مهمة بشكل خاص على الإنترنت حيث يتم كتابة أكثر من نصف المحتوى على الإنترنت باللغة الإنجليزية. بالإضافة إلى ذلك ، يوجد مقر بعض أكبر شركات التكنولوجيا في العالم في البلدان الناطقة باللغة الإنجليزية', 13000, 3),
(37369, NULL, NULL, NULL, NULL, 'in-advanced', 'The course will help to improve the level of English from the level of \"above average\" to the level of \"excellent\". Here you will upgrade basic skills: reading, listening, writing and speaking. Theoretical knowledge will be tested in practice: new words and grammar are immediately checked in conversation.\nAlso you can enjoy books, music, movies in the original version without a need for subtitles and explanations.\n', NULL, b'0', 'https://drive.google.com/uc?export=view&id=175fGvbb5RdWYJibWG2AuDwPF2lLK8PBa', 'Gold', 30, '6000', 'Level: Upper-Intermediate', '4.8', 0, 'In today’s globalised world there are many reasons to learn a foreign language, and many benefits to studying English specifically.\n\nCurrently, there are around 1.5 billion English speakers around the world, which represents a fifth of the world’s total population. English is spoken in some of the most economically and culturally influential countries globally, and over the centuries has become the main language not only of international communication, but of international business, academia, medicine, science, technology and law.\n', 31050, 4),
(37370, NULL, NULL, NULL, NULL, 'in-advanced', 'The course will help to improve the level of English from the level of \"above average\" to the level of \"excellent\". Here you will upgrade basic skills: reading, listening, writing and speaking. Theoretical knowledge will be tested in practice: new words and grammar are immediately checked in conversation.\nAlso you can enjoy books, music, movies in the original version without a need for subtitles and explanations.\n', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'Silver', 10, '2000', 'Level: Upper-Intermediate', '5', 1, 'In today’s globalised world there are many reasons to learn a foreign language, and many benefits to studying English specifically.\n\nCurrently, there are around 1.5 billion English speakers around the world, which represents a fifth of the world’s total population. English is spoken in some of the most economically and culturally influential countries globally, and over the centuries has become the main language not only of international communication, but of international business, academia, medicine, science, technology and law.\n', 31050, 3),
(37371, NULL, NULL, NULL, NULL, 'in-advanced', 'The course will help to improve the level of English from the level of \"above average\" to the level of \"excellent\". Here you will upgrade basic skills: reading, listening, writing and speaking. Theoretical knowledge will be tested in practice: new words and grammar are immediately checked in conversation.\nAlso you can enjoy books, music, movies in the original version without a need for subtitles and explanations.\n', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1h2G4UJqu71F_OHbTDB1n4DJUXj6w1RM8', 'Platinum', 50, '10000', 'Level: Upper-Intermediate', '4.6', 0, 'In today’s globalised world there are many reasons to learn a foreign language, and many benefits to studying English specifically.\n\nCurrently, there are around 1.5 billion English speakers around the world, which represents a fifth of the world’s total population. English is spoken in some of the most economically and culturally influential countries globally, and over the centuries has become the main language not only of international communication, but of international business, academia, medicine, science, technology and law.\n', 31050, 5),
(40286, NULL, NULL, NULL, NULL, NULL, 'سيسمح لك إكمال دورة \"متوسط\" بالانتقال إلى المستوى \"فوق المتوسط\" أو الالتحاق بجامعة أجنبية أو الحصول على وظيفة في شركة دولية. يتعرف الطلاب على القواعد والمفردات ، ويفهمون المواقف النموذجية للتواصل مع المتحدثين الأصليين', NULL, b'1', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'PREMIUM', 8, '450', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '4.5', 0, '١ـ مع اللغة الإنجليزية ، يمكنك الدراسة في جميع أنحاء العالم:\nنظرًا لأن اللغة الإنجليزية يتم التحدث بها في العديد من البلدان المختلفة ، فهناك الآلاف من المدارس والجامعات حول العالم التي تقدم برامج باللغة الإنجليزية. إذا كنت تتحدث الإنجليزية الأكاديمية جيدًا ، فهناك الكثير من الفرص المتاحة لك للعثور على مدرسة ودورة مناسبة تناسب احتياجاتك. تعرف على كيفية الالتحاق بالجامعة في بلد يتحدث الإنجليزية.\n٢ـ تتيح لك اللغة الإنجليزية الوصول إلى ثقافات متعددة:\nتتيح لك المعرفة الجيدة باللغة الإنجليزية الوصول إلى الأفلام والموسيقى والأدب من مئات البلدان حول العالم. ناهيك عن حقيقة أن العديد من الكتب من جميع أنحاء العالم تُرجمت إلى اللغة الإنجليزية. قليل من التجارب ستجعلك تنمو كشخص أكثر من تعلم القيم والعادات وأسلوب الحياة في ثقافة مختلفة عن ثقافتك', 25000, 6),
(40287, NULL, NULL, NULL, NULL, NULL, 'The course will help to improve the level of English from the level of \"above average\" to the level of \"excellent\". Here you will upgrade basic skills: reading, listening, writing and speaking. Theoretical knowledge will be tested in practice: new words and grammar are immediately checked in conversation.\nAlso you can enjoy books, music, movies in the original version without a need for subtitles and explanations.\n', NULL, b'1', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'PREMIUM', 8, '450', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '5', 0, 'English gives you access to multiple cultures:\nGood knowledge of English will allow you to access films, music and literature from hundreds of countries around the globe. Not to mention the fact that numerous books from across the world are translated into English. Few experiences will make you grow as a person more than learning the values, habits and way of life in a culture that is different from yours.\n English is one of the most important languages for business:\nWhether you’re a business owner, student or employee, English is incredibly important in the business world. English is considered to be one of the most important business languages due to being the de facto language of the United States and the official language of the UK, Canada, India, South Africa and many other countries.\n', 31050, 6),
(53972, NULL, NULL, NULL, NULL, 'one-class', 'في عالم اليوم المعولم ، هناك العديد من الأسباب لتعلم لغة أجنبية والعديد من المزايا لدراسة اللغة الإنجليزية على وجه التحديد.\n\nفإتقانك للإنجليزية يتيح لك فرصة النجاح في وظيفتك بنسبة تزيد عن 35٪ وكذلك تفتح لك الأفاق للدراسة في الخارج أو حتى السفر لأي دولة في العالم بدون الإضطرار لتعلم لغة أخرى. ثم إن جميع المهارات التي ترغب في تعلمها فهي متاحة أكثر بالإنجليزية على جميع المواقع المهمة', NULL, b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'Trial Lesson', 1, '120', 'جهاز كمبيوتر، لابتوب أو هاتف + إنترنيت', '5', 25, 'نهدف على منصتنا أن نأخذ بيدك حتى لتتقن اللغة الإنجليزية مهما كان مستواك أو مشاكل لتستطيع التحدث بطلاقة و كتابة أي نص بطريقة إحترافية، بالإظافة إلى القراءة والإستماع الفعال. فطريقتنا البيداغوجية تعتمد منهجا مختلفا حيث المتعلم هو من يتحدث أكثر و يشارك بطريقة فعالة ليبقى دور الأستاذ هو التوجيه. فشعارنا الإنجليزية من الصفر إلح الإحتراف', 1, 53971),
(63146, NULL, NULL, NULL, NULL, 'ind-for-teens', NULL, NULL, b'0', 'https://drive.google.com/uc?export=view&id=1SpwvuKUPqEcDcElhxauFBdd3kD1BRWIV', 'SILVER', 8, '1600', NULL, NULL, 0, NULL, 55800, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pack_student_seq`
--

CREATE TABLE `pack_student_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pack_student_seq`
--

INSERT INTO `pack_student_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

CREATE TABLE `paiement` (
  `createdon` datetime(6) DEFAULT NULL,
  `date_paiement` datetime(6) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paiement_seq`
--

CREATE TABLE `paiement_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paiement_seq`
--

INSERT INTO `paiement_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `parcours`
--

CREATE TABLE `parcours` (
  `nombre_cours` int(11) DEFAULT NULL,
  `numero_order` int(11) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_creation` datetime(6) DEFAULT NULL,
  `date_publication` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parcours`
--

INSERT INTO `parcours` (`nombre_cours`, `numero_order`, `collaborator`, `createdon`, `date_creation`, `date_publication`, `id`, `updatedon`, `code`, `createdby`, `description`, `libelle`, `updatedby`, `color`, `url`) VALUES
(1, 0, NULL, '2024-05-17 21:16:57.723714', NULL, NULL, 1, '2024-06-04 16:18:32.738638', NULL, 'collaborator', NULL, 'Elementary for teens', 'collaborator', 'cyan', 'http://localhost:8036/app/images/OfKwLevI0q/OfKwLevI0q.jpg'),
(1, 0, NULL, '2024-05-17 21:26:44.957372', NULL, NULL, 4, '2024-06-26 14:35:48.491765', 'E', 'collaborator', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et ante eu turpis pellentesque iaculis. Nullam pharetra.', 'ELEMENTARY', 'collaborator', 'amber', NULL),
(0, 0, NULL, '2024-05-17 21:27:27.440542', NULL, NULL, 5, NULL, 'P', 'collaborator', 'small description', 'PRE INTERMEDIATE', '', 'pink', 'http://localhost:8036/app/images/dt400EN9no/dt400EN9no.jpg'),
(0, 0, NULL, '2024-05-27 13:21:11.740589', NULL, NULL, 52, NULL, 'L', 'collaborator', NULL, 'Lorem ipsum dolor ', '', 'amber', NULL),
(1, 0, NULL, '2024-05-27 13:32:58.947779', NULL, NULL, 102, '2024-05-29 21:11:10.739365', 'L', 'collaborator', NULL, 'Lorem ipsum II', 'collaborator', 'gray', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parcours_seq`
--

CREATE TABLE `parcours_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parcours_seq`
--

INSERT INTO `parcours_seq` (`next_val`) VALUES
(201);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `for_group` bit(1) DEFAULT NULL,
  `nre_course` decimal(38,2) DEFAULT NULL,
  `nre_hours` decimal(38,2) DEFAULT NULL,
  `nre_month` decimal(38,2) DEFAULT NULL,
  `old_price` decimal(38,2) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`for_group`, `nre_course`, `nre_hours`, `nre_month`, `old_price`, `price`, `collaborator`, `createdon`, `id`, `updatedon`, `createdby`, `lib`, `updatedby`) VALUES
(b'0', '8.00', '8.00', '1.00', '1600.00', '1110.00', NULL, NULL, 3, NULL, NULL, 'SILVER', NULL),
(b'0', '24.00', '24.00', '3.00', '4800.00', '2856.00', NULL, NULL, 4, NULL, NULL, 'GOLD', NULL),
(b'0', '48.00', '48.00', '6.00', '9600.00', '5519.00', NULL, NULL, 5, NULL, NULL, 'PLATINUM', NULL),
(b'1', '24.00', '24.00', '1.00', '1860.00', '936.00', NULL, NULL, 6, NULL, NULL, 'PREMIUM', NULL),
(b'0', '1.00', '1.00', '0.00', '81.00', '41.00', NULL, NULL, 53971, NULL, NULL, 'ONE-CLASS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_seq`
--

CREATE TABLE `price_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_seq`
--

INSERT INTO `price_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `prof`
--

CREATE TABLE `prof` (
  `categorie_prof` bigint(20) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `type_teacher` bigint(20) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prof_review`
--

CREATE TABLE `prof_review` (
  `review` int(11) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_review` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prof_review_seq`
--

CREATE TABLE `prof_review_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prof_review_seq`
--

INSERT INTO `prof_review_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `point_reponse_juste` decimal(38,2) DEFAULT NULL,
  `point_reponsefausse` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `type_de_question` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`point_reponse_juste`, `point_reponsefausse`, `createdon`, `id`, `numero`, `quiz`, `type_de_question`, `updatedon`, `createdby`, `libelle`, `ref`, `updatedby`, `url_img`, `url_video`) VALUES
('1.00', '0.00', '2024-05-27 23:53:10.999190', 1, 1, 1, 5, '2024-05-29 12:08:41.472357', 'collaborator', 'Habitasse hac tincidunt sapien parturient, odio scelerisque lacinia.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 10:51:04.979486', 152, 1, 2, 1, '2024-05-29 12:30:27.251608', 'collaborator', 'Pretium hac ..... suscipit maecenas, dictumst lectus', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 10:51:04.988450', 153, 2, 2, 1, '2024-05-29 12:30:27.251608', 'collaborator', 'Sem ridiculus ..... varius cubilia, feugiat ', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 10:51:04.990489', 154, 3, 2, 1, '2024-05-29 12:30:27.251608', 'collaborator', 'Ut tempor nec conubia, est ..... molestie in, faucibus tincidunt.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 10:51:04.993485', 155, 4, 2, 1, '2024-05-29 12:30:27.251608', 'collaborator', 'Nisl ante senectus .... consequat integer, aenean hendrerit duis.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 10:51:04.994483', 156, 5, 2, 1, '2024-05-29 12:30:27.251608', 'collaborator', 'Aliquet varius .... velit egestas aenean, feugiat ultrices in.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 10:51:04.997491', 157, 6, 2, 1, '2024-05-29 12:30:27.252612', 'collaborator', 'Arcu malesuada sollicitudin odio ..... feugiat, litora dapibus nascetur.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 11:08:14.560026', 202, 1, 52, 6, NULL, 'collaborator', 'Lorem ipsum dolor @sit@ amet, consectetur adipiscing.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 11:08:14.570025', 203, 2, 52, 6, NULL, 'collaborator', 'Potenti parturient etiam @fames@ scelerisque, ac duis interdum.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 11:08:14.571027', 204, 3, 52, 6, NULL, 'collaborator', 'Dis porttitor habitasse tellus @per@ dictum quam, lobortis ut dui inceptos.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 12:05:41.653671', 252, 1, 102, 4, NULL, 'collaborator', 'Lorem ipsum @dolor@ sit amet consectetur, adipiscing elit auctor.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 12:05:41.672718', 253, 2, 102, 4, NULL, 'collaborator', 'Tristique turpis @vehicula@ metus ante, lacinia aliquam gravida.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 12:05:41.673676', 254, 3, 102, 4, NULL, 'collaborator', 'Semper iaculis sem nullam @porta@ massa, dis ultrices potenti.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 14:35:57.549085', 256, 7, 2, 1, '2024-05-29 12:30:27.252612', 'collaborator', 'Nec ..... vivamus lectus id diam, non iaculis fusce.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-28 21:48:18.489363', 655, 1, 252, 5, NULL, 'collaborator', 'Lorem ipsum dolor sit amet consectetur adipiscing, elit quam eleifend vehicula.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 21:48:18.491415', 656, 2, 252, 5, NULL, 'collaborator', 'Fames ultrices lectus viverra sed lobortis, eros auctor litora aptent.', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-28 21:48:18.492350', 657, 3, 252, 5, NULL, 'collaborator', 'Faucibus diam pretium ligula nibh sagittis, condimentum eu quis', NULL, '', NULL, NULL),
('1.00', '0.00', '2024-05-29 11:53:57.824578', 752, 1, 252, 5, '2024-05-29 11:53:57.941466', 'collaborator', 'Lorem ipsum dolor sit amet consectetur, adipiscing elit tortor.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-29 11:53:57.903431', 753, 2, 252, 5, '2024-05-29 11:53:57.942462', 'collaborator', 'Mauris convallis metus varius congue iaculis, curae diam justo.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-05-29 12:08:41.451358', 754, 2, 1, 5, '2024-05-29 12:08:41.473359', 'collaborator', 'Lorem ipsum dolor sit amet consectetur, adipiscing elit curae.', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-06-04 16:21:00.398709', 802, 1, 302, 5, '2024-06-04 16:21:00.458962', 'collaborator', 'Lorem ipsum dolor sit amet, consectetur adipiscing e', NULL, 'collaborator', NULL, NULL),
('1.00', '0.00', '2024-06-04 16:21:00.449829', 803, 2, 302, 5, '2024-06-04 16:21:00.459966', 'collaborator', 'Sapien eros felis fames nec, ligula rutrum.', NULL, 'collaborator', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_seq`
--

CREATE TABLE `question_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question_seq`
--

INSERT INTO `question_seq` (`next_val`) VALUES
(901);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `createdon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL,
  `seuil_reussite` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `exercice` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`createdon`, `date_debut`, `date_fin`, `id`, `numero`, `section`, `seuil_reussite`, `updatedon`, `createdby`, `lib`, `ref`, `updatedby`, `exercice`) VALUES
('2024-05-27 23:53:10.804546', NULL, NULL, 1, NULL, NULL, NULL, '2024-05-29 12:08:41.471411', 'collaborator', NULL, NULL, 'collaborator', 102),
('2024-05-28 10:51:04.956482', NULL, NULL, 2, NULL, NULL, NULL, '2024-05-29 12:30:27.251608', 'collaborator', NULL, NULL, 'collaborator', 352),
('2024-05-28 11:08:14.546024', NULL, NULL, 52, NULL, NULL, NULL, '2024-05-28 11:08:14.577028', 'collaborator', NULL, NULL, 'collaborator', 403),
('2024-05-28 12:05:41.604149', NULL, NULL, 102, NULL, NULL, NULL, '2024-05-28 12:05:41.686738', 'collaborator', NULL, NULL, 'collaborator', 453),
('2024-05-28 21:48:17.836403', NULL, NULL, 252, NULL, NULL, NULL, '2024-05-29 11:53:57.940477', 'collaborator', NULL, NULL, 'collaborator', 652),
('2024-06-04 16:21:00.374900', NULL, NULL, 302, NULL, NULL, NULL, '2024-06-04 16:21:00.458962', 'collaborator', NULL, NULL, 'collaborator', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_etudiant`
--

CREATE TABLE `quiz_etudiant` (
  `note` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `question_current` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `resultat` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_etudiant_seq`
--

CREATE TABLE `quiz_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz_etudiant_seq`
--

INSERT INTO `quiz_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_seq`
--

CREATE TABLE `quiz_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz_seq`
--

INSERT INTO `quiz_seq` (`next_val`) VALUES
(401);

-- --------------------------------------------------------

--
-- Table structure for table `reclamation_etudiant`
--

CREATE TABLE `reclamation_etudiant` (
  `post_view` bit(1) DEFAULT NULL,
  `traite` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_reclamation` datetime(6) DEFAULT NULL,
  `date_reponse` datetime(6) DEFAULT NULL,
  `date_traitement` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `type_reclamation_etudiant` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `commentaire_traiteur` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `objet_reclamation_etudiant` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `set_from` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reclamation_etudiant_seq`
--

CREATE TABLE `reclamation_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reclamation_etudiant_seq`
--

INSERT INTO `reclamation_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `reclamation_prof`
--

CREATE TABLE `reclamation_prof` (
  `post_view` bit(1) DEFAULT NULL,
  `traite` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_reclamation` datetime(6) DEFAULT NULL,
  `date_reponse` datetime(6) DEFAULT NULL,
  `date_traitement` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `type_reclamation_prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `commentaire_traiteur` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `objet_reclamation_prof` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reclamation_prof_seq`
--

CREATE TABLE `reclamation_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reclamation_prof_seq`
--

INSERT INTO `reclamation_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `recommend_teacher`
--

CREATE TABLE `recommend_teacher` (
  `nombrevote` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_recommamdation` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recommend_teacher_seq`
--

CREATE TABLE `recommend_teacher_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recommend_teacher_seq`
--

INSERT INTO `recommend_teacher_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

CREATE TABLE `reponse` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `etat_reponse` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reponse`
--

INSERT INTO `reponse` (`createdon`, `id`, `numero`, `question`, `updatedon`, `createdby`, `lib`, `ref`, `updatedby`, `etat_reponse`) VALUES
('2024-05-27 23:53:11.067576', 1, 1, 1, '2024-05-28 21:38:15.622855', 'collaborator', 'true', 'true', 'collaborator', b'1'),
('2024-05-28 10:51:04.983484', 2, 1, 152, NULL, 'collaborator', 'auctor', 'false', '', b'0'),
('2024-05-28 10:51:04.987449', 3, 2, 152, NULL, 'collaborator', 'act', 'true', '', b'1'),
('2024-05-28 10:51:04.988450', 4, 3, 152, NULL, 'collaborator', 'finder', 'false', '', b'0'),
('2024-05-28 10:51:04.988450', 5, 1, 153, NULL, 'collaborator', 'sodales ', 'true', '', b'1'),
('2024-05-28 10:51:04.989489', 6, 2, 153, NULL, 'collaborator', 'botato', 'false', '', b'0'),
('2024-05-28 10:51:04.989489', 7, 3, 153, NULL, 'collaborator', 'azalim', 'false', '', b'0'),
('2024-05-28 10:51:04.989489', 8, 4, 153, NULL, 'collaborator', 'khizo', 'false', '', b'0'),
('2024-05-28 10:51:04.991447', 9, 1, 154, NULL, 'collaborator', 'eu', 'true', '', b'1'),
('2024-05-28 10:51:04.991447', 10, 2, 154, NULL, 'collaborator', 'euro', 'false', '', b'0'),
('2024-05-28 10:51:04.991447', 11, 3, 154, NULL, 'collaborator', 'eux', 'false', '', b'0'),
('2024-05-28 10:51:04.991447', 12, 4, 154, NULL, 'collaborator', 'azalim', 'false', '', b'0'),
('2024-05-28 10:51:04.993485', 13, 1, 155, NULL, 'collaborator', 'tarwa', 'false', '', b'0'),
('2024-05-28 10:51:04.994483', 14, 2, 155, NULL, 'collaborator', 'nullam', 'true', '', b'1'),
('2024-05-28 10:51:04.994483', 15, 3, 155, NULL, 'collaborator', 'ncha', 'false', '', b'0'),
('2024-05-28 10:51:04.995445', 16, 1, 156, NULL, 'collaborator', 'mauris ', 'false', '', b'0'),
('2024-05-28 10:51:04.996481', 17, 2, 156, NULL, 'collaborator', 'handl', 'false', '', b'0'),
('2024-05-28 10:51:04.996481', 18, 3, 156, NULL, 'collaborator', 'going', 'true', '', b'1'),
('2024-05-28 10:51:04.997491', 19, 4, 156, NULL, 'collaborator', 'sizer', 'false', '', b'0'),
('2024-05-28 10:51:04.997491', 20, 1, 157, NULL, 'collaborator', 'sodales ', 'true', '', b'1'),
('2024-05-28 10:51:04.997491', 21, 2, 157, NULL, 'collaborator', 'salades', 'false', '', b'0'),
('2024-05-28 10:51:04.997491', 22, 3, 157, NULL, 'collaborator', 'matixa', 'false', '', b'0'),
('2024-05-28 11:08:14.566038', 52, 1, 202, NULL, 'collaborator', 'sit', 'true', '', b'1'),
('2024-05-28 11:08:14.570025', 53, 1, 203, NULL, 'collaborator', 'femmes', 'true', '', b'1'),
('2024-05-28 11:08:14.571027', 54, 1, 204, NULL, 'collaborator', 'perate', 'true', '', b'1'),
('2024-05-28 12:05:41.664685', 102, 1, 252, NULL, 'collaborator', 'doolor', 'true', '', b'1'),
('2024-05-28 12:05:41.672916', 103, 1, 253, NULL, 'collaborator', 'vehicule', 'true', '', b'1'),
('2024-05-28 12:05:41.675724', 104, 1, 254, NULL, 'collaborator', 'porte', 'true', '', b'1'),
('2024-05-29 11:53:57.873409', 402, 1, 752, NULL, 'collaborator', 'true', NULL, '', b'1'),
('2024-05-29 11:53:57.905431', 403, 1, 753, NULL, 'collaborator', 'false', NULL, '', b'1'),
('2024-05-29 12:08:41.452360', 404, 1, 754, NULL, 'collaborator', 'false', NULL, '', b'1'),
('2024-05-29 12:29:08.583516', 405, 1, 256, NULL, 'collaborator', 'warm', NULL, '', b'1'),
('2024-05-29 12:30:27.247620', 406, 2, 256, NULL, 'collaborator', 'blabla', NULL, '', b'0'),
('2024-05-29 12:30:27.248628', 407, 3, 256, NULL, 'collaborator', 'hjsdh', NULL, '', b'0'),
('2024-06-04 16:21:00.413418', 452, 1, 802, NULL, 'collaborator', 'true', NULL, '', b'1'),
('2024-06-04 16:21:00.451744', 453, 1, 803, NULL, 'collaborator', 'false', NULL, '', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `reponse_etudiant`
--

CREATE TABLE `reponse_etudiant` (
  `note` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `question` bigint(20) DEFAULT NULL,
  `quiz_etudiant` bigint(20) DEFAULT NULL,
  `reponse` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reponse_etudiant_home_work`
--

CREATE TABLE `reponse_etudiant_home_work` (
  `note` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `home_work_etudiant` bigint(20) DEFAULT NULL,
  `home_work_question` bigint(20) DEFAULT NULL,
  `howe_work_q_s_t_reponse` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `prof_note` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reponse_etudiant_home_work_seq`
--

CREATE TABLE `reponse_etudiant_home_work_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reponse_etudiant_home_work_seq`
--

INSERT INTO `reponse_etudiant_home_work_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `reponse_etudiant_seq`
--

CREATE TABLE `reponse_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reponse_etudiant_seq`
--

INSERT INTO `reponse_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `reponse_seq`
--

CREATE TABLE `reponse_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reponse_seq`
--

INSERT INTO `reponse_seq` (`next_val`) VALUES
(551);

-- --------------------------------------------------------

--
-- Table structure for table `role_app`
--

CREATE TABLE `role_app` (
  `created_at` datetime(6) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_app`
--

INSERT INTO `role_app` (`created_at`, `createdon`, `id`, `updated_at`, `updatedon`, `authority`, `createdby`, `updatedby`) VALUES
('2024-05-17 20:53:10.846221', '2024-05-17 20:53:10.867373', 1, NULL, NULL, 'ROLE_ADMIN', '', ''),
('2024-05-17 20:53:15.585152', '2024-05-17 20:53:15.605990', 2, NULL, NULL, 'ROLE_COLLABORATOR', '', ''),
('2024-06-01 15:59:58.985543', '2024-06-01 15:59:59.006550', 3, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-01 17:44:28.373786', '2024-06-01 17:44:28.426784', 5, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 13:13:44.775451', '2024-06-10 13:13:44.792454', 7, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 13:16:59.512882', '2024-06-10 13:16:59.520885', 8, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 13:21:28.562263', '2024-06-10 13:21:28.563293', 11, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 13:30:10.711064', '2024-06-10 13:30:10.721061', 12, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 13:35:46.783816', '2024-06-10 13:35:46.793816', 13, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 15:50:19.682960', '2024-06-10 15:50:19.729034', 14, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 15:59:06.250123', '2024-06-10 15:59:06.296134', 15, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 16:07:25.737834', '2024-06-10 16:07:25.737834', 16, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 16:09:09.231307', '2024-06-10 16:09:09.231307', 17, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-10 16:14:29.163755', '2024-06-10 16:14:29.180352', 18, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-13 14:01:45.536388', '2024-06-13 14:01:45.555353', 19, NULL, NULL, 'ROLE_STUDENT', 'collaborator', ''),
('2024-06-24 12:19:28.299043', '2024-06-24 12:19:28.315983', 20, NULL, NULL, 'ROLE_TEACHER', 'collaborator', ''),
('2024-06-24 12:20:09.394956', '2024-06-24 12:20:09.396051', 21, NULL, NULL, 'ROLE_TEACHER', 'collaborator', ''),
('2024-06-24 13:28:48.391699', '2024-06-24 13:28:48.407732', 22, NULL, NULL, 'ROLE_TEACHER', 'collaborator', ''),
('2024-06-24 14:32:23.339183', '2024-06-24 14:32:23.392575', 23, NULL, NULL, 'ROLE_COLLABORATOR', 'collaborator', ''),
('2024-06-24 14:50:02.314270', '2024-06-24 14:50:02.318523', 24, NULL, NULL, 'ROLE_COLLABORATOR', 'collaborator', ''),
('2024-06-24 15:27:49.387485', '2024-06-24 15:27:49.387485', 25, NULL, NULL, 'ROLE_TEACHER', 'collaborator', ''),
('2024-06-24 15:30:27.242166', '2024-06-24 15:30:27.242166', 26, NULL, NULL, 'ROLE_COLLABORATOR', 'collaborator', '');

-- --------------------------------------------------------

--
-- Table structure for table `role_seq`
--

CREATE TABLE `role_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_seq`
--

INSERT INTO `role_seq` (`next_val`) VALUES
(27);

-- --------------------------------------------------------

--
-- Table structure for table `role_utilisateur`
--

CREATE TABLE `role_utilisateur` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `role` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_utilisateur`
--

INSERT INTO `role_utilisateur` (`createdon`, `id`, `role`, `updatedon`, `user`, `createdby`, `updatedby`) VALUES
('2024-05-17 20:53:14.362372', 1, 1, NULL, 1, '', ''),
('2024-05-17 20:53:18.693234', 2, 2, NULL, 2, '', ''),
('2024-06-01 16:00:00.634544', 3, 3, NULL, 3, 'collaborator', ''),
('2024-06-01 17:44:46.326183', 6, 5, NULL, 6, 'collaborator', ''),
('2024-06-10 13:21:30.032262', 9, 11, NULL, 4, 'collaborator', ''),
('2024-06-10 13:30:14.322606', 10, 12, NULL, 52, 'collaborator', ''),
('2024-06-10 13:35:50.670198', 11, 13, NULL, 102, 'collaborator', ''),
('2024-06-10 15:50:31.463861', 12, 14, NULL, 152, 'collaborator', ''),
('2024-06-10 15:59:17.039023', 13, 15, NULL, 202, 'collaborator', ''),
('2024-06-10 16:07:36.715955', 14, 16, NULL, 203, 'collaborator', ''),
('2024-06-10 16:09:16.784347', 15, 17, NULL, 204, 'collaborator', ''),
('2024-06-10 16:14:31.694202', 16, 18, NULL, 252, 'collaborator', ''),
('2024-06-13 14:01:47.224342', 17, 19, NULL, 302, 'collaborator', ''),
('2024-06-24 12:19:31.238756', 18, 20, NULL, 352, 'collaborator', ''),
('2024-06-24 12:20:11.543083', 19, 21, NULL, 353, 'collaborator', ''),
('2024-06-24 13:28:51.900419', 20, 22, NULL, 402, 'collaborator', ''),
('2024-06-24 14:32:27.203825', 21, 23, NULL, 452, 'collaborator', ''),
('2024-06-24 14:50:04.925783', 22, 24, NULL, 502, 'collaborator', ''),
('2024-06-24 15:27:50.898099', 23, 25, NULL, 503, 'collaborator', ''),
('2024-06-24 15:30:28.583157', 24, 26, NULL, 504, 'collaborator', '');

-- --------------------------------------------------------

--
-- Table structure for table `role_utilisateur_seq`
--

CREATE TABLE `role_utilisateur_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_utilisateur_seq`
--

INSERT INTO `role_utilisateur_seq` (`next_val`) VALUES
(25);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `nbr_session_mensuel` decimal(38,2) DEFAULT NULL,
  `payer` bit(1) DEFAULT NULL,
  `total_bonus_class_average` decimal(38,2) DEFAULT NULL,
  `total_bonus_workload` decimal(38,2) DEFAULT NULL,
  `total_payment` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_seq`
--

CREATE TABLE `salary_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary_seq`
--

INSERT INTO `salary_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_prof`
--

CREATE TABLE `schedule_prof` (
  `course_finished` bit(1) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `profs_id` bigint(20) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `grp_name` varchar(255) DEFAULT NULL,
  `prof_name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_prof_seq`
--

CREATE TABLE `schedule_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule_prof_seq`
--

INSERT INTO `schedule_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `cours` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`cours`, `createdon`, `id`, `updatedon`, `code`, `createdby`, `description`, `libelle`, `updatedby`, `numero`) VALUES
(1, '2024-05-22 16:50:15.032032', 1, NULL, NULL, 'collaborator', NULL, 'section 1', '', 1),
(1, '2024-05-22 16:57:02.145363', 2, NULL, NULL, 'collaborator', NULL, 'section 2', '', 2),
(1, '2024-05-22 16:58:39.294819', 3, NULL, NULL, 'collaborator', NULL, 'section 3', '', 3),
(52, '2024-05-24 15:19:34.677063', 52, NULL, NULL, 'collaborator', NULL, 'section 1', '', 1),
(52, '2024-05-24 15:43:11.715254', 53, NULL, NULL, 'collaborator', NULL, 'section 2', '', 2),
(2, '2024-05-27 13:34:14.488389', 102, '2024-05-28 20:20:09.105563', NULL, 'collaborator', 'Fusce convallis', 'warm up', 'collaborator', 1),
(2, '2024-05-28 00:59:24.274676', 152, NULL, NULL, 'collaborator', NULL, 'section 2', '', 2),
(2, '2024-05-28 00:59:25.872344', 153, NULL, NULL, 'collaborator', NULL, 'section 3', '', 3),
(2, '2024-05-28 00:59:26.875166', 154, NULL, NULL, 'collaborator', NULL, 'section 4', '', 4),
(2, '2024-05-28 00:59:27.667777', 155, NULL, NULL, 'collaborator', NULL, 'section 5', '', 5),
(2, '2024-05-28 00:59:32.691399', 156, NULL, NULL, 'collaborator', NULL, 'section 6', '', 6),
(4, '2024-05-29 20:59:35.854473', 202, '2024-05-29 21:00:48.116385', NULL, 'collaborator', '', 'الدرس الاول', 'collaborator', 1),
(3, '2024-05-29 21:08:40.362645', 252, NULL, NULL, 'collaborator', NULL, 'section 1', '', 1),
(102, '2024-05-29 21:11:51.597693', 253, '2024-05-29 21:11:57.007443', NULL, 'collaborator', NULL, 'section one', 'collaborator', 1),
(152, '2024-06-04 16:18:53.050895', 302, '2024-06-04 16:19:00.041506', NULL, 'collaborator', NULL, 'section fourtnine', 'collaborator', 1),
(152, '2024-06-04 16:21:17.922725', 303, NULL, NULL, 'collaborator', NULL, 'section 2', '', 2),
(202, '2024-06-26 14:36:12.350696', 352, '2024-06-26 14:36:20.190032', NULL, 'collaborator', NULL, 'section one', 'collaborator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `section_item`
--

CREATE TABLE `section_item` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `section` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `example` varchar(255) DEFAULT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `synonyms` varchar(255) DEFAULT NULL,
  `transcription` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `section_item_seq`
--

CREATE TABLE `section_item_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_item_seq`
--

INSERT INTO `section_item_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `section_seq`
--

CREATE TABLE `section_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_seq`
--

INSERT INTO `section_seq` (`next_val`) VALUES
(451);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services_seq`
--

CREATE TABLE `services_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_seq`
--

INSERT INTO `services_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `session_cours`
--

CREATE TABLE `session_cours` (
  `annee` decimal(38,2) DEFAULT NULL,
  `course_finished` bit(1) DEFAULT NULL,
  `duree` decimal(38,2) DEFAULT NULL,
  `homework_finished` bit(1) DEFAULT NULL,
  `mois` decimal(38,2) DEFAULT NULL,
  `payer` bit(1) DEFAULT NULL,
  `totalheure` decimal(38,2) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `nre_add_section_finished` bigint(20) DEFAULT NULL,
  `nre_key_section_finished` bigint(20) DEFAULT NULL,
  `nre_words` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `total_add_section` bigint(20) DEFAULT NULL,
  `total_key_section` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `session_cours_section`
--

CREATE TABLE `session_cours_section` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `section` bigint(20) DEFAULT NULL,
  `session_cours` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `session_cours_section_seq`
--

CREATE TABLE `session_cours_section_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_cours_section_seq`
--

INSERT INTO `session_cours_section_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `session_cours_seq`
--

CREATE TABLE `session_cours_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_cours_seq`
--

INSERT INTO `session_cours_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
(NULL, 1, NULL, NULL, NULL, 'Reading', NULL),
(NULL, 2, '2024-06-10 15:29:24.841264', NULL, NULL, 'Dancing', 'collaborator'),
(NULL, 3, NULL, NULL, NULL, 'Playing video games', NULL),
(NULL, 4, NULL, NULL, NULL, 'Listening music', NULL),
(NULL, 5, NULL, NULL, NULL, 'Sewing', NULL),
(NULL, 6, NULL, NULL, NULL, 'Cook', NULL),
(NULL, 7, NULL, NULL, NULL, 'Playing tennis', NULL),
(NULL, 8, NULL, NULL, NULL, 'Horse riding', NULL),
(NULL, 9, NULL, '', NULL, 'Doing sport', NULL),
(NULL, 10, NULL, NULL, NULL, 'Playing football', NULL),
(NULL, 11, NULL, NULL, NULL, 'Biking', NULL),
(NULL, 12, NULL, NULL, NULL, 'Travel', NULL),
(NULL, 13, NULL, NULL, NULL, 'Hunting', NULL),
(NULL, 14, NULL, NULL, NULL, 'Fishing', NULL),
(NULL, 15, NULL, NULL, NULL, 'Hiking ', NULL),
(NULL, 16, NULL, NULL, NULL, 'Sailing', NULL),
(NULL, 17, NULL, NULL, NULL, 'Swimming', NULL),
(NULL, 18, NULL, NULL, NULL, 'Gardening', NULL),
(NULL, 19, '2024-06-10 16:15:35.082889', NULL, NULL, 'Running', 'collaborator'),
(NULL, 20, NULL, NULL, NULL, 'Scuba diving', NULL),
(NULL, 21, NULL, NULL, NULL, 'Other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill_seq`
--

CREATE TABLE `skill_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill_seq`
--

INSERT INTO `skill_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `statut_free_trial`
--

CREATE TABLE `statut_free_trial` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `statut_free_trial_seq`
--

CREATE TABLE `statut_free_trial_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statut_free_trial_seq`
--

INSERT INTO `statut_free_trial_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `statut_social`
--

CREATE TABLE `statut_social` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statut_social`
--

INSERT INTO `statut_social` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
(NULL, 1, '2024-06-10 15:29:24.840275', '1', NULL, 'Student', 'collaborator'),
(NULL, 2, NULL, '2', NULL, 'Unemployed', NULL),
(NULL, 3, NULL, '3', NULL, 'Employed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statut_social_seq`
--

CREATE TABLE `statut_social_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statut_social_seq`
--

INSERT INTO `statut_social_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_locality`
--

CREATE TABLE `teacher_locality` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_locality_seq`
--

CREATE TABLE `teacher_locality_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher_locality_seq`
--

INSERT INTO `teacher_locality_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `tranche_horaire_prof`
--

CREATE TABLE `tranche_horaire_prof` (
  `day` int(11) DEFAULT NULL,
  `group_index` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `end_hour` varchar(255) DEFAULT NULL,
  `start_hour` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tranche_horaire_prof_seq`
--

CREATE TABLE `tranche_horaire_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tranche_horaire_prof_seq`
--

INSERT INTO `tranche_horaire_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `type_collaborator`
--

CREATE TABLE `type_collaborator` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_collaborator`
--

INSERT INTO `type_collaborator` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
('2024-06-24 14:32:23.802581', 1, NULL, '', 'collaborator', 'school', ''),
('2024-06-24 14:50:02.458808', 2, NULL, '', 'collaborator', 'academy', ''),
('2024-06-24 15:30:27.275131', 3, NULL, '', 'collaborator', 'other', '');

-- --------------------------------------------------------

--
-- Table structure for table `type_collaborator_seq`
--

CREATE TABLE `type_collaborator_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_collaborator_seq`
--

INSERT INTO `type_collaborator_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Table structure for table `type_de_question`
--

CREATE TABLE `type_de_question` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_de_question`
--

INSERT INTO `type_de_question` (`createdon`, `id`, `updatedon`, `createdby`, `lib`, `ref`, `updatedby`) VALUES
(NULL, 1, '2024-05-29 12:29:08.479482', NULL, 'Choose the correct alternative', 't1', 'collaborator'),
(NULL, 2, NULL, NULL, 'Write it up', 't2', NULL),
(NULL, 3, NULL, NULL, 'Translate the phrase', 't3', NULL),
(NULL, 4, NULL, NULL, 'Correct the mistake', 't4', NULL),
(NULL, 5, '2024-05-28 21:29:27.949353', NULL, 'True or False', 't5', 'collaborator'),
(NULL, 6, NULL, NULL, 'Write the correct form', 't6', NULL),
(NULL, 7, NULL, NULL, 'Put words to gap', 't10', NULL),
(NULL, 8, NULL, NULL, 'Put in order', 't11', NULL),
(NULL, 9, NULL, NULL, 'Word By Word', 't12', NULL),
(NULL, 10, NULL, NULL, 'Drag and Drop', 't13', NULL),
(NULL, 11675, NULL, NULL, 'Describe what you see', 't7', NULL),
(NULL, 11701, NULL, NULL, 'Read and add new words', 't8', NULL),
(NULL, 12578, NULL, NULL, 'Study the information', 't14', NULL),
(NULL, 23386, NULL, NULL, 'Watch and add new words', 't9', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_de_question_seq`
--

CREATE TABLE `type_de_question_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_de_question_seq`
--

INSERT INTO `type_de_question_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `type_home_work`
--

CREATE TABLE `type_home_work` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_home_work_seq`
--

CREATE TABLE `type_home_work_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_home_work_seq`
--

INSERT INTO `type_home_work_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `type_reclamation_etudiant`
--

CREATE TABLE `type_reclamation_etudiant` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_reclamation_etudiant_seq`
--

CREATE TABLE `type_reclamation_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_reclamation_etudiant_seq`
--

INSERT INTO `type_reclamation_etudiant_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `type_reclamation_prof`
--

CREATE TABLE `type_reclamation_prof` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_reclamation_prof_seq`
--

CREATE TABLE `type_reclamation_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_reclamation_prof_seq`
--

INSERT INTO `type_reclamation_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `type_teacher`
--

CREATE TABLE `type_teacher` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_teacher`
--

INSERT INTO `type_teacher` (`createdon`, `id`, `updatedon`, `code`, `createdby`, `libelle`, `updatedby`) VALUES
(NULL, 1, NULL, NULL, NULL, 'Strict', NULL),
(NULL, 2, NULL, NULL, NULL, 'Friendly', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_teacher_seq`
--

CREATE TABLE `type_teacher_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_teacher_seq`
--

INSERT INTO `type_teacher_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `account_non_expired` bit(1) NOT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `credentials_non_expired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password_changed` bit(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `dtype` varchar(31) NOT NULL,
  `group_option` varchar(255) DEFAULT NULL,
  `subscribe` bit(1) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `fonction` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `interet_etudiant` bigint(20) DEFAULT NULL,
  `langue` bigint(20) DEFAULT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `pack_student` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `skill` bigint(20) DEFAULT NULL,
  `statut_social` bigint(20) DEFAULT NULL,
  `teacher_locality` bigint(20) DEFAULT NULL,
  `categorie_prof` bigint(20) DEFAULT NULL,
  `type_teacher` bigint(20) DEFAULT NULL,
  `type_collaborator` bigint(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `groupe_etudiant_details` varbinary(255) DEFAULT NULL,
  `inscriptions` varbinary(255) DEFAULT NULL,
  `quiz_etudiants` varbinary(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`account_non_expired`, `account_non_locked`, `credentials_non_expired`, `enabled`, `password_changed`, `created_at`, `created_on`, `id`, `updated_at`, `updated_on`, `created_by`, `email`, `first_name`, `last_name`, `password`, `phone`, `updated_by`, `username`, `dtype`, `group_option`, `subscribe`, `about`, `ref`, `description`, `libelle`, `collaborator`, `fonction`, `groupe_etude`, `interet_etudiant`, `langue`, `niveau_etude`, `pack_student`, `parcours`, `skill`, `statut_social`, `teacher_locality`, `categorie_prof`, `type_teacher`, `type_collaborator`, `full_name`, `avatar`, `groupe_etudiant_details`, `inscriptions`, `quiz_etudiants`, `country`) VALUES
(b'1', b'1', b'1', b'1', b'0', '2024-05-17 20:53:11.465106', '2024-05-17 20:53:11.470255', 1, NULL, NULL, NULL, 'admin', NULL, NULL, '$2a$10$MRP/mPxuORc5c.HL/SAsFey.E2eqclsBFaxHmKkRAVr2uIPUonZH2', NULL, NULL, 'admin', 'User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-05-17 20:53:16.042090', '2024-05-17 20:53:16.045095', 2, NULL, '2024-06-10 15:00:50.261265', '', 'collaborator', NULL, NULL, '$2a$10$BfIiTN7c8GfmQLVpxkCO5.wtr3DH9vpFywIHX32YCMUXEII2NRY/S', NULL, 'collaborator', 'collaborator', 'Collaborator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-01 15:59:59.173543', '2024-06-01 15:59:59.176551', 3, NULL, NULL, 'collaborator', 'elmoudene.ysf@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Youssef EL MOUDENE', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 13:21:28.770264', '2024-06-10 13:21:28.776262', 4, NULL, NULL, 'collaborator', 'youssefelmoudene09@gmail.com', NULL, NULL, '$2a$10$RwlnUJQJEy4FvErYtD/ORutFTxqcgfU0bXxKKwaKBk1yiKckpWiKa', NULL, NULL, 'youssefelmoudene09@gmail.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ahmed banan', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'0', b'0', '2024-06-01 17:44:43.144465', '2024-06-01 17:44:43.170450', 6, NULL, '2024-06-03 16:16:09.886377', '', 'youssef.elmoudene@gmail.com', NULL, NULL, NULL, '0605120314', 'collaborator', NULL, 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Khalid moufid', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 13:30:10.907103', '2024-06-10 13:30:10.911060', 52, NULL, NULL, 'collaborator', 'ima@gmail.com', NULL, NULL, '$2a$10$p0I./ILsZJtgRzmgcFq.w.ZuOiVRRoTijL8oJER7NYFiiKL95/s/6', NULL, NULL, 'ima@gmail.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ima Mathews', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 13:35:46.997818', '2024-06-10 13:35:47.002823', 102, NULL, '2024-06-10 15:29:24.826271', '', 'hezisyzoca@mailinator.com', NULL, NULL, '$2a$10$G.3GrCzTNHHvmlkrMHJ9DO4N7MEEYVuAPCjdZvf.h3cOit7qHLKf2', '+1 (996) 975-9009', 'collaborator', 'Boyle@gmail.com', 'Etudiant', NULL, b'1', 'Repudiandae nulla ne', NULL, NULL, NULL, 2, NULL, 25905, 4, 1, NULL, NULL, 4, 2, 1, NULL, NULL, NULL, NULL, 'Warren Slater', 'http://localhost:8036/app/images/REODGgil8sy/REODGgil8sy.jpg', NULL, NULL, NULL, 'Afghanistan'),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 15:50:20.592843', '2024-06-10 15:50:20.613036', 152, NULL, '2024-06-10 15:50:31.558939', 'collaborator', 'lucas@gmail.com', NULL, NULL, '$2a$10$BJXxMGIEA6NQo4A3Xwj5/OfAbCu0g9Ha0RQriJjrGYNe9xxYzivCy', '+1 (548) 885-6201', 'collaborator', 'lucas@gmail.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lucas Norris', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 15:59:06.693142', '2024-06-10 15:59:06.718302', 202, NULL, '2024-06-10 15:59:17.116192', 'collaborator', 'taqyz@mailinator.com', NULL, NULL, 'Rkh9q9dE3g', '+1 (781) 983-1951', 'collaborator', 'taqyz@mailinator.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dane Atkinson', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 16:07:25.849817', '2024-06-10 16:07:25.859806', 203, NULL, '2024-06-10 16:07:36.782135', 'collaborator', 'loguny@mailinator.com', NULL, NULL, 'cxMukYKtAh', '+1 (643) 264-2685', 'collaborator', 'loguny@mailinator.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Flavia Farrell', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 16:09:09.271653', '2024-06-10 16:09:09.276425', 204, NULL, '2024-06-10 16:09:16.817299', 'collaborator', 'gobaxicep@mailinator.com', NULL, NULL, 'q2RbhXxo7s', '+1 (375) 295-2924', 'collaborator', 'gobaxicep@mailinator.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Barry Moses', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-10 16:14:29.401467', '2024-06-10 16:14:29.416464', 252, NULL, '2024-06-10 16:15:35.081440', 'collaborator', 'sinigosu@mailinator.com', NULL, NULL, 'rcoQ48PT31', '+1 (342) 413-1241', 'collaborator', 'sinigosu@mailinator.com', 'Etudiant', NULL, b'1', NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 1, NULL, NULL, 4, 19, NULL, NULL, NULL, NULL, NULL, 'Ainsley Hardy', NULL, NULL, NULL, NULL, 'Morocco'),
(b'1', b'1', b'1', b'1', b'0', '2024-06-13 14:01:45.747344', '2024-06-13 14:01:45.752345', 302, NULL, '2024-06-13 14:03:45.087571', 'collaborator', 'fepybysipo@mailinator.com', NULL, NULL, 'QlJcvlIgW9', '+1 (162) 572-2016', 'collaborator', 'gosulox@mailinator.com', 'Etudiant', NULL, b'1', 'Consequat Et eu aut', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, 'Kadeem Kelley', 'http://localhost:8036/app/images/gosulox@mailinator.com/gosulox@mailinator.com.jpg', NULL, NULL, NULL, 'Afghanistan'),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 12:19:28.591383', '2024-06-24 12:19:28.601543', 352, NULL, NULL, 'collaborator', 'vuky@mailinator.com', NULL, NULL, 'vuky@mailinator.com', '+1 (679) 734-4396', NULL, 'vuky@mailinator.com', 'Prof', NULL, NULL, NULL, '', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raven Downs', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 12:20:09.459248', '2024-06-24 12:20:09.467947', 353, NULL, NULL, 'collaborator', 'piqutot@mailinator.com', NULL, NULL, 'piqutot@mailinator.com', '+1 (794) 633-2201', NULL, 'piqutot@mailinator.com', 'Prof', NULL, NULL, NULL, '', NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Castor Bell', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 13:28:48.718884', '2024-06-24 13:28:48.735960', 402, NULL, '2024-06-24 13:29:04.219602', 'collaborator', 'lytusekeja@mailinator.com', NULL, NULL, 'lytusekeja@mailinator.com', '+1 (857) 618-5872', 'collaborator', 'lytusekeja@mailinator.com', 'Prof', NULL, NULL, NULL, '', NULL, NULL, 2, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Eden Whitfield', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 14:32:23.902578', '2024-06-24 14:32:23.927917', 452, NULL, '2024-06-24 14:48:45.341189', 'collaborator', 'gubit@mailinator.com', NULL, NULL, 'gubit@mailinator.com', '0605120314', 'collaborator', 'gubit@mailinator.com', 'Collaborator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Youssef EL MOUDENE', NULL, NULL, NULL, NULL, 'American Samoa'),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 14:50:02.500832', '2024-06-24 14:50:02.510692', 502, NULL, NULL, 'collaborator', 'givanyx@mailinator.com', NULL, NULL, 'givanyx@mailinator.com', '+1 (473) 804-3425', NULL, 'givanyx@mailinator.com', 'Collaborator', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'Ivan Mooney', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 15:27:49.420489', '2024-06-24 15:27:49.424482', 503, NULL, NULL, 'collaborator', 'rapodi@mailinator.com', NULL, NULL, 'rapodi@mailinator.com', '+1 (251) 589-5902', NULL, 'rapodi@mailinator.com', 'Prof', NULL, NULL, NULL, '', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Keely Wynn', NULL, NULL, NULL, NULL, NULL),
(b'1', b'1', b'1', b'1', b'0', '2024-06-24 15:30:27.281129', '2024-06-24 15:30:27.284127', 504, NULL, NULL, 'collaborator', 'vegupy@mailinator.com', NULL, NULL, 'vegupy@mailinator.com', '+1 (373) 659-9798', NULL, 'vegupy@mailinator.com', 'Collaborator', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'Laith Gibson', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_app_seq`
--

CREATE TABLE `user_app_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_app_seq`
--

INSERT INTO `user_app_seq` (`next_val`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(601);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `exemple` varchar(255) DEFAULT NULL,
  `explication` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary_seq`
--

CREATE TABLE `vocabulary_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vocabulary_seq`
--

INSERT INTO `vocabulary_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `workload_bonus`
--

CREATE TABLE `workload_bonus` (
  `nombre_session` int(11) DEFAULT NULL,
  `prix` decimal(38,2) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workload_bonus_prof`
--

CREATE TABLE `workload_bonus_prof` (
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `workload_bonus` bigint(20) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workload_bonus_prof_seq`
--

CREATE TABLE `workload_bonus_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workload_bonus_prof_seq`
--

INSERT INTO `workload_bonus_prof_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `workload_bonus_seq`
--

CREATE TABLE `workload_bonus_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workload_bonus_seq`
--

INSERT INTO `workload_bonus_seq` (`next_val`) VALUES
(1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_permission`
--
ALTER TABLE `action_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie_prof`
--
ALTER TABLE `categorie_prof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_average_bonus`
--
ALTER TABLE `class_average_bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKruwwcccitj00alcwpqll77nf4` (`collaborator`);

--
-- Indexes for table `class_average_bonus_prof`
--
ALTER TABLE `class_average_bonus_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9jxfo0e0xa7jkktxdsq4jwibq` (`prof`),
  ADD KEY `FK1gw04x52n985btot1ucheddy5` (`salary`);

--
-- Indexes for table `collaborator`
--
ALTER TABLE `collaborator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh5ll3lo4g0b424ou3kht8tbjo` (`type_collaborator`);

--
-- Indexes for table `confirmation_token`
--
ALTER TABLE `confirmation_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7y3xv4g7g0ujl8a53x6ehjyrh` (`etudiant`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3dkywysdyqv0l7vfrpbics74p` (`collaborator`);

--
-- Indexes for table `content_type`
--
ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKahy5hm3ry3u7lcli8yji618jg` (`parcours`);

--
-- Indexes for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3vedvuiggng4hljgw32despxv` (`etudiant`);

--
-- Indexes for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etat_inscription`
--
ALTER TABLE `etat_inscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK47b7trw1rbm5i4ruy2kep6vlq` (`collaborator`),
  ADD KEY `FKof6077dph2rqxbhx9et19e0eb` (`fonction`),
  ADD KEY `FK25qq0ct4luhk7mqspq7souc3f` (`groupe_etude`),
  ADD KEY `FK5itr0vgj4o09uakfruq18kun6` (`interet_etudiant`),
  ADD KEY `FK5u6l2p5ijpc1ysdm2ppba5lb` (`langue`),
  ADD KEY `FK48pn3f06ofj0cqi36uursc3g8` (`niveau_etude`),
  ADD KEY `FK18qufl4mnj2xetj5ogmkitn06` (`pack_student`),
  ADD KEY `FKai5q082gu30csaib66qxpfj8l` (`parcours`),
  ADD KEY `FKn61sw20mx2wu93u08n2un6ayr` (`skill`),
  ADD KEY `FK3oe7c7whga32j7enpvd6h0r2j` (`statut_social`),
  ADD KEY `FKg75ysigttqach7pxawk7p51ep` (`teacher_locality`);

--
-- Indexes for table `etudiant_review`
--
ALTER TABLE `etudiant_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdr0kyfl32jlc1iaqyr23u0i04` (`cours`),
  ADD KEY `FKbo0cjopoje56ldf9jaaxxjhxv` (`etudiant`),
  ADD KEY `FKk3t91y6xlu7wgkgli6j1b57o6` (`prof`);

--
-- Indexes for table `exercice`
--
ALTER TABLE `exercice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ho4hbgng1tyqxkvh1mrcfe6cg` (`quiz`),
  ADD KEY `FKftk5tiouuild7jwp59y2mxxyj` (`content_type`),
  ADD KEY `FKdvvia8o2w2rbh2et9um2x63fc` (`section`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg74sm2isnspfjl2gpl40i1gso` (`faq_type`);

--
-- Indexes for table `faq_etudiant`
--
ALTER TABLE `faq_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKny4k439w8mtsgwl04gacxq2ky` (`etudiant`),
  ADD KEY `FK8jxblth3byvxeklwfkrmrtx1o` (`faq_type`);

--
-- Indexes for table `faq_prof`
--
ALTER TABLE `faq_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm826cdt7e3vuigwi2auwrgr2o` (`faq_type`),
  ADD KEY `FKigm6pq9usvbki2ropxu4bj401` (`prof`);

--
-- Indexes for table `faq_type`
--
ALTER TABLE `faq_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `free_trial`
--
ALTER TABLE `free_trial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi2xcoes6hxhaprbldr112b52y` (`free_trial_configuration`),
  ADD KEY `FKlubi1b1elkvwir6k3q6d7kyhp` (`free_trial_student_email_template`),
  ADD KEY `FKdt2i36mdw4j4nhv7r8vtsfy9b` (`free_trial_student_whats_template`),
  ADD KEY `FK62crw4si85tffn9o1tx2v5upl` (`free_trial_teacher_email_template`),
  ADD KEY `FKnd3xndb7bgblcjffm9wro6du` (`free_trial_teacher_whats_template`),
  ADD KEY `FKmfhu89ddvm50f1fdv6m6iha2g` (`niveau_etude`),
  ADD KEY `FKs3ihlbs3wuby9gdxcs9r4otc2` (`prof`),
  ADD KEY `FKjsw8mj62tss7mde81eh9cr7v4` (`statut_free_trial`);

--
-- Indexes for table `free_trialformule`
--
ALTER TABLE `free_trialformule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqp2bk31pgb42pf7aeneplagv9` (`inscription`);

--
-- Indexes for table `free_trial_configuration`
--
ALTER TABLE `free_trial_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `free_trial_detail`
--
ALTER TABLE `free_trial_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK55h1r7nloj506bo3sutxr1l8n` (`etudiant`),
  ADD KEY `FK22so7d7qi1cuyghw3sf8tj7ux` (`free_trial`);

--
-- Indexes for table `free_trial_student_email_template`
--
ALTER TABLE `free_trial_student_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `free_trial_student_whats_template`
--
ALTER TABLE `free_trial_student_whats_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `free_trial_teacher_email_template`
--
ALTER TABLE `free_trial_teacher_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `free_trial_teacher_whats_template`
--
ALTER TABLE `free_trial_teacher_whats_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupe_etat`
--
ALTER TABLE `groupe_etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupe_etude`
--
ALTER TABLE `groupe_etude`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupe_etudiant`
--
ALTER TABLE `groupe_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3du0ot05k3biykkighrqbq0bj` (`groupe_etat`),
  ADD KEY `FKf19chs324x9ei6t5rm3epx4cq` (`groupe_etude`),
  ADD KEY `FKb5fkobpnh19cpnddob5051i0v` (`groupe_type`),
  ADD KEY `FKhqi2kse6ips4np4365vovd3r6` (`parcours`),
  ADD KEY `FK53cvqneym1jlajraf8nh4w44i` (`prof`);

--
-- Indexes for table `groupe_etudiant_detail`
--
ALTER TABLE `groupe_etudiant_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs3jgcu7ocfotdmdm0iamn6b0w` (`etudiant`),
  ADD KEY `FKr8x72lnitvm5qj1x0l5jyugbt` (`groupe_etudiant`);

--
-- Indexes for table `groupe_type`
--
ALTER TABLE `groupe_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_work`
--
ALTER TABLE `home_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK44ci3gb97k9wp23sc3gedrqyk` (`cours`),
  ADD KEY `FKmfqby0657lm6a6mcjqj2149o1` (`type_home_work`);

--
-- Indexes for table `home_work_etudiant`
--
ALTER TABLE `home_work_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6sup89lw7i97pski13iu7uf1n` (`etudiant`),
  ADD KEY `FKr3i0bsg73lrefi35ywk6valqw` (`home_work`);

--
-- Indexes for table `home_work_question`
--
ALTER TABLE `home_work_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq21dmbn2sge5l9nern356f6fi` (`home_work`),
  ADD KEY `FKtk8sx20ndjo2oddts9s16wubj` (`type_de_question`);

--
-- Indexes for table `howe_work_q_s_t_reponse`
--
ALTER TABLE `howe_work_q_s_t_reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5r2x5dyq293mofnoiarl59os5` (`home_work_question`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnrowvydlyvqhipcre6ib7ayg0` (`etat_inscription`),
  ADD KEY `FKalko793fl1gm06kwq53w1gynu` (`etudiant`),
  ADD KEY `FKk6yh6drsgma7n1e7337udyl6v` (`fonction`),
  ADD KEY `FK27d0kprttulm0sukspipm7ptk` (`groupe_etude`),
  ADD KEY `FK5phhr2tygcp75wd129o7jlc49` (`groupe_type`),
  ADD KEY `FK6igy4m6867ox3rq0rr6rym96x` (`interet_etudiant`),
  ADD KEY `FKgsx4eotg1djjcj4erybxkbjt7` (`niveau_etude`),
  ADD KEY `FKe9tdu7jc218gjtgffhtovi3te` (`pack_student`),
  ADD KEY `FK1ha9gsbcjddy1otsy6djjg7iv` (`parcours`),
  ADD KEY `FKa5pvpf8u1xd71imbm7eyg4f5t` (`quiz`),
  ADD KEY `FKrcxuicdjp141smpvdtc10q5if` (`skill`),
  ADD KEY `FKgdcsiettljowxye6tj6cd1cka` (`statut_social`);

--
-- Indexes for table `interet_etudiant`
--
ALTER TABLE `interet_etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invite_student`
--
ALTER TABLE `invite_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbs4m9ldskgfg237mwub5ibttf` (`etudiant`);

--
-- Indexes for table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_test_configuration`
--
ALTER TABLE `level_test_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfumtlsoraadbwe0bdm2qnajnu` (`parcours`);

--
-- Indexes for table `model_permission`
--
ALTER TABLE `model_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_permission_utilisateur`
--
ALTER TABLE `model_permission_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKanbrpecqteguq8exl5k9qrpom` (`action_permission`),
  ADD KEY `FKr1a7bvuyitnsb1mgrh800qpl` (`model_permission`),
  ADD KEY `FK7wq2ndtexep9usaj8oojvwlvx` (`user`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgg14bw1a1prjo1b9jule8k8fq` (`collaborator`);

--
-- Indexes for table `niveau_etude`
--
ALTER TABLE `niveau_etude`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pack_student`
--
ALTER TABLE `pack_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8o2q1qwe1qjqjx4s6cemt6s84` (`level`),
  ADD KEY `FKqccki0b6i48a1masitotdw6sw` (`price`);

--
-- Indexes for table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6dbtl5qrg1kjxwh5xsj0nb0pv` (`groupe_etudiant`),
  ADD KEY `FKnp1lw5uob8tvslkjnmcdnowc5` (`prof`);

--
-- Indexes for table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4jtf5cmektmsmtuiorrpnd8i3` (`collaborator`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKogcgru00bxc9bc173fvt4tog5` (`collaborator`);

--
-- Indexes for table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1lu5t25vi6rcecetqp9vkupvg` (`categorie_prof`),
  ADD KEY `FKro10rjqmv3yp1yqo9kaqsjbn6` (`collaborator`),
  ADD KEY `FKnissiloouj0jjdevu6cardkcq` (`parcours`),
  ADD KEY `FKju688rgp14luuefxtx6vf8d2v` (`type_teacher`);

--
-- Indexes for table `prof_review`
--
ALTER TABLE `prof_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfgik1c9q13hbh95xxqxt6kytu` (`cours`),
  ADD KEY `FKtf5bipf3qksucegqg0lqjsjds` (`etudiant`),
  ADD KEY `FK2f9sfmlmyngxsqvgbrc201g4k` (`prof`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn7rkdf65fl89m8jx2c174tdbk` (`quiz`),
  ADD KEY `FKp3btkmc3gy8byspbfyqn08ubb` (`type_de_question`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_mi1n92hgr8q5fd2y73htyb2rw` (`exercice`),
  ADD KEY `FKlrxqh2l9ipwscnak06wbhbwvu` (`section`);

--
-- Indexes for table `quiz_etudiant`
--
ALTER TABLE `quiz_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj66cc5f1ta9bvx99jg2lkdx37` (`etudiant`),
  ADD KEY `FKi9bv4k6mvrn2a0gjv0aeo4oy8` (`quiz`);

--
-- Indexes for table `reclamation_etudiant`
--
ALTER TABLE `reclamation_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKerecn8dtyxuasp872ty9ohhjq` (`type_reclamation_etudiant`);

--
-- Indexes for table `reclamation_prof`
--
ALTER TABLE `reclamation_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjknx7s81cylq1p4y7lejd02bl` (`prof`),
  ADD KEY `FK8fsbomsmjlri7i1du98tdhwvl` (`type_reclamation_prof`);

--
-- Indexes for table `recommend_teacher`
--
ALTER TABLE `recommend_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtm1jpoh1i39jktqf51lyu81qs` (`prof`);

--
-- Indexes for table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqww17yrx5cgjbcu747lgre8ci` (`question`);

--
-- Indexes for table `reponse_etudiant`
--
ALTER TABLE `reponse_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK611oipslqc88pa7j7yqqmf72u` (`question`),
  ADD KEY `FKrcx0v612xf6xx6wsml9mco2h3` (`quiz_etudiant`),
  ADD KEY `FK4hf80to4ievjjdq3bmfgdwxw9` (`reponse`);

--
-- Indexes for table `reponse_etudiant_home_work`
--
ALTER TABLE `reponse_etudiant_home_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnnjmqei727y0u1rivh1daltwb` (`home_work_etudiant`),
  ADD KEY `FK456160ae6nd12q2d5y7m567sr` (`home_work_question`),
  ADD KEY `FKnebaw1q5vebbipkl68omyu39b` (`howe_work_q_s_t_reponse`);

--
-- Indexes for table `role_app`
--
ALTER TABLE `role_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_utilisateur`
--
ALTER TABLE `role_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2fjdcobcg9c6a209t2qd2mgg1` (`role`),
  ADD KEY `FKjor807snrj8ytkt26jvm3wu6c` (`user`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhtcvy2kfqxnf85cag7if9srhr` (`prof`);

--
-- Indexes for table `schedule_prof`
--
ALTER TABLE `schedule_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK33a7ip3jqbafu5joohmdklatc` (`cours`),
  ADD KEY `FK63y8jx726vtsw7oi7li4psr06` (`groupe_etudiant`),
  ADD KEY `FKnpixsixxies6sowxahl3ehaxu` (`prof`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfosokbccblq4mj9g6mo2ktknw` (`cours`);

--
-- Indexes for table `section_item`
--
ALTER TABLE `section_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKplpthekfwb2ydh5ljftao632l` (`section`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_cours`
--
ALTER TABLE `session_cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp2v3kulrxoryk626tr1n07v6n` (`cours`),
  ADD KEY `FKidwlfrj69hdx1m9vhbwf4ip8t` (`groupe_etudiant`),
  ADD KEY `FK1kq233790h625dnbvspnimphp` (`prof`),
  ADD KEY `FK5ahhbwiot1buddfs1b23iypuk` (`salary`);

--
-- Indexes for table `session_cours_section`
--
ALTER TABLE `session_cours_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjvheycal0r3gloj4vcp1pri5n` (`section`),
  ADD KEY `FK7hlnjs1x496awgkl9wfwrqec7` (`session_cours`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statut_free_trial`
--
ALTER TABLE `statut_free_trial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statut_social`
--
ALTER TABLE `statut_social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_locality`
--
ALTER TABLE `teacher_locality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tranche_horaire_prof`
--
ALTER TABLE `tranche_horaire_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgfj4fgstpvqmyeycqgrax2t3p` (`prof`);

--
-- Indexes for table `type_collaborator`
--
ALTER TABLE `type_collaborator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_de_question`
--
ALTER TABLE `type_de_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_home_work`
--
ALTER TABLE `type_home_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_reclamation_etudiant`
--
ALTER TABLE `type_reclamation_etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_reclamation_prof`
--
ALTER TABLE `type_reclamation_prof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_teacher`
--
ALTER TABLE `type_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9q5cjy9t7ultpjlebbesgq1w9` (`collaborator`),
  ADD KEY `FKfcrnrmd0x8ti3td1vcot417qw` (`fonction`),
  ADD KEY `FKc8bby2o7jdjj7pacpfpo2bj6r` (`groupe_etude`),
  ADD KEY `FKbcts6ejkmhmqh1dti19xvtef2` (`interet_etudiant`),
  ADD KEY `FKddp1ld78v56h491wxcfvs8gpp` (`langue`),
  ADD KEY `FK1j914o9lyp6mjierf132mawjo` (`niveau_etude`),
  ADD KEY `FK87lvn3d9xb337koefj58gam98` (`pack_student`),
  ADD KEY `FKimfpxj5uy18qyitn193rnpj3v` (`parcours`),
  ADD KEY `FKncpqcs02kue14y3teuc0bj12i` (`skill`),
  ADD KEY `FKbug521p2lt3c1foh0j0r9tbxx` (`statut_social`),
  ADD KEY `FKiopkx4yvy0mcu5lr6rdekmwjm` (`teacher_locality`),
  ADD KEY `FKb1foe1690lcirh75bvap2lg3h` (`categorie_prof`),
  ADD KEY `FKnnm30cr14vvt6raylyn226ncv` (`type_teacher`),
  ADD KEY `FK8jpsfe6itxx00coqlcewmbv0u` (`type_collaborator`);

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jwsmbypn2jrlpro721bt3yv7` (`section`);

--
-- Indexes for table `workload_bonus`
--
ALTER TABLE `workload_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workload_bonus_prof`
--
ALTER TABLE `workload_bonus_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjp3saesbvciolabu4np0enqbm` (`prof`),
  ADD KEY `FK42mcgkljlaa1j07qb095xqhpg` (`salary`),
  ADD KEY `FKcycvnjjmeip07d0mxvnllhpq4` (`workload_bonus`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_average_bonus`
--
ALTER TABLE `class_average_bonus`
  ADD CONSTRAINT `FKruwwcccitj00alcwpqll77nf4` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Constraints for table `class_average_bonus_prof`
--
ALTER TABLE `class_average_bonus_prof`
  ADD CONSTRAINT `FK1gw04x52n985btot1ucheddy5` FOREIGN KEY (`salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `FK9jxfo0e0xa7jkktxdsq4jwibq` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `collaborator`
--
ALTER TABLE `collaborator`
  ADD CONSTRAINT `FKh5ll3lo4g0b424ou3kht8tbjo` FOREIGN KEY (`type_collaborator`) REFERENCES `type_collaborator` (`id`),
  ADD CONSTRAINT `FKnscb99ydkumy5efftrnq6awkv` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `confirmation_token`
--
ALTER TABLE `confirmation_token`
  ADD CONSTRAINT `FK7y3xv4g7g0ujl8a53x6ehjyrh` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK3dkywysdyqv0l7vfrpbics74p` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Constraints for table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FKahy5hm3ry3u7lcli8yji618jg` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`);

--
-- Constraints for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD CONSTRAINT `FK3vedvuiggng4hljgw32despxv` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK18qufl4mnj2xetj5ogmkitn06` FOREIGN KEY (`pack_student`) REFERENCES `pack_student` (`id`),
  ADD CONSTRAINT `FK25qq0ct4luhk7mqspq7souc3f` FOREIGN KEY (`groupe_etude`) REFERENCES `groupe_etude` (`id`),
  ADD CONSTRAINT `FK3oe7c7whga32j7enpvd6h0r2j` FOREIGN KEY (`statut_social`) REFERENCES `statut_social` (`id`),
  ADD CONSTRAINT `FK47b7trw1rbm5i4ruy2kep6vlq` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`id`),
  ADD CONSTRAINT `FK48pn3f06ofj0cqi36uursc3g8` FOREIGN KEY (`niveau_etude`) REFERENCES `niveau_etude` (`id`),
  ADD CONSTRAINT `FK5itr0vgj4o09uakfruq18kun6` FOREIGN KEY (`interet_etudiant`) REFERENCES `interet_etudiant` (`id`),
  ADD CONSTRAINT `FK5u6l2p5ijpc1ysdm2ppba5lb` FOREIGN KEY (`langue`) REFERENCES `langue` (`id`),
  ADD CONSTRAINT `FKai5q082gu30csaib66qxpfj8l` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKg311d0nd3revkhhabegftnubv` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKg75ysigttqach7pxawk7p51ep` FOREIGN KEY (`teacher_locality`) REFERENCES `teacher_locality` (`id`),
  ADD CONSTRAINT `FKn61sw20mx2wu93u08n2un6ayr` FOREIGN KEY (`skill`) REFERENCES `skill` (`id`),
  ADD CONSTRAINT `FKof6077dph2rqxbhx9et19e0eb` FOREIGN KEY (`fonction`) REFERENCES `fonction` (`id`);

--
-- Constraints for table `etudiant_review`
--
ALTER TABLE `etudiant_review`
  ADD CONSTRAINT `FKbo0cjopoje56ldf9jaaxxjhxv` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKdr0kyfl32jlc1iaqyr23u0i04` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKk3t91y6xlu7wgkgli6j1b57o6` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `exercice`
--
ALTER TABLE `exercice`
  ADD CONSTRAINT `FK5wh0qmit2ollf3vdpwhq8qoan` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKdvvia8o2w2rbh2et9um2x63fc` FOREIGN KEY (`section`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `FKftk5tiouuild7jwp59y2mxxyj` FOREIGN KEY (`content_type`) REFERENCES `content_type` (`id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `FKg74sm2isnspfjl2gpl40i1gso` FOREIGN KEY (`faq_type`) REFERENCES `faq_type` (`id`);

--
-- Constraints for table `faq_etudiant`
--
ALTER TABLE `faq_etudiant`
  ADD CONSTRAINT `FK8jxblth3byvxeklwfkrmrtx1o` FOREIGN KEY (`faq_type`) REFERENCES `faq_type` (`id`),
  ADD CONSTRAINT `FKny4k439w8mtsgwl04gacxq2ky` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `faq_prof`
--
ALTER TABLE `faq_prof`
  ADD CONSTRAINT `FKigm6pq9usvbki2ropxu4bj401` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKm826cdt7e3vuigwi2auwrgr2o` FOREIGN KEY (`faq_type`) REFERENCES `faq_type` (`id`);

--
-- Constraints for table `free_trial`
--
ALTER TABLE `free_trial`
  ADD CONSTRAINT `FK62crw4si85tffn9o1tx2v5upl` FOREIGN KEY (`free_trial_teacher_email_template`) REFERENCES `free_trial_teacher_email_template` (`id`),
  ADD CONSTRAINT `FKdt2i36mdw4j4nhv7r8vtsfy9b` FOREIGN KEY (`free_trial_student_whats_template`) REFERENCES `free_trial_student_whats_template` (`id`),
  ADD CONSTRAINT `FKi2xcoes6hxhaprbldr112b52y` FOREIGN KEY (`free_trial_configuration`) REFERENCES `free_trial_configuration` (`id`),
  ADD CONSTRAINT `FKjsw8mj62tss7mde81eh9cr7v4` FOREIGN KEY (`statut_free_trial`) REFERENCES `statut_free_trial` (`id`),
  ADD CONSTRAINT `FKlubi1b1elkvwir6k3q6d7kyhp` FOREIGN KEY (`free_trial_student_email_template`) REFERENCES `free_trial_student_email_template` (`id`),
  ADD CONSTRAINT `FKmfhu89ddvm50f1fdv6m6iha2g` FOREIGN KEY (`niveau_etude`) REFERENCES `niveau_etude` (`id`),
  ADD CONSTRAINT `FKnd3xndb7bgblcjffm9wro6du` FOREIGN KEY (`free_trial_teacher_whats_template`) REFERENCES `free_trial_teacher_whats_template` (`id`),
  ADD CONSTRAINT `FKs3ihlbs3wuby9gdxcs9r4otc2` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `free_trialformule`
--
ALTER TABLE `free_trialformule`
  ADD CONSTRAINT `FKqp2bk31pgb42pf7aeneplagv9` FOREIGN KEY (`inscription`) REFERENCES `inscription` (`id`);

--
-- Constraints for table `free_trial_detail`
--
ALTER TABLE `free_trial_detail`
  ADD CONSTRAINT `FK22so7d7qi1cuyghw3sf8tj7ux` FOREIGN KEY (`free_trial`) REFERENCES `free_trial` (`id`),
  ADD CONSTRAINT `FK55h1r7nloj506bo3sutxr1l8n` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `groupe_etudiant`
--
ALTER TABLE `groupe_etudiant`
  ADD CONSTRAINT `FK3du0ot05k3biykkighrqbq0bj` FOREIGN KEY (`groupe_etat`) REFERENCES `groupe_etat` (`id`),
  ADD CONSTRAINT `FK53cvqneym1jlajraf8nh4w44i` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKb5fkobpnh19cpnddob5051i0v` FOREIGN KEY (`groupe_type`) REFERENCES `groupe_type` (`id`),
  ADD CONSTRAINT `FKf19chs324x9ei6t5rm3epx4cq` FOREIGN KEY (`groupe_etude`) REFERENCES `groupe_etude` (`id`),
  ADD CONSTRAINT `FKhqi2kse6ips4np4365vovd3r6` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`);

--
-- Constraints for table `groupe_etudiant_detail`
--
ALTER TABLE `groupe_etudiant_detail`
  ADD CONSTRAINT `FKr8x72lnitvm5qj1x0l5jyugbt` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKs3jgcu7ocfotdmdm0iamn6b0w` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `home_work`
--
ALTER TABLE `home_work`
  ADD CONSTRAINT `FK44ci3gb97k9wp23sc3gedrqyk` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKmfqby0657lm6a6mcjqj2149o1` FOREIGN KEY (`type_home_work`) REFERENCES `type_home_work` (`id`);

--
-- Constraints for table `home_work_etudiant`
--
ALTER TABLE `home_work_etudiant`
  ADD CONSTRAINT `FK6sup89lw7i97pski13iu7uf1n` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKr3i0bsg73lrefi35ywk6valqw` FOREIGN KEY (`home_work`) REFERENCES `home_work` (`id`);

--
-- Constraints for table `home_work_question`
--
ALTER TABLE `home_work_question`
  ADD CONSTRAINT `FKq21dmbn2sge5l9nern356f6fi` FOREIGN KEY (`home_work`) REFERENCES `home_work` (`id`),
  ADD CONSTRAINT `FKtk8sx20ndjo2oddts9s16wubj` FOREIGN KEY (`type_de_question`) REFERENCES `type_de_question` (`id`);

--
-- Constraints for table `howe_work_q_s_t_reponse`
--
ALTER TABLE `howe_work_q_s_t_reponse`
  ADD CONSTRAINT `FK5r2x5dyq293mofnoiarl59os5` FOREIGN KEY (`home_work_question`) REFERENCES `home_work_question` (`id`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK1ha9gsbcjddy1otsy6djjg7iv` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FK27d0kprttulm0sukspipm7ptk` FOREIGN KEY (`groupe_etude`) REFERENCES `groupe_etude` (`id`),
  ADD CONSTRAINT `FK5phhr2tygcp75wd129o7jlc49` FOREIGN KEY (`groupe_type`) REFERENCES `groupe_type` (`id`),
  ADD CONSTRAINT `FK6igy4m6867ox3rq0rr6rym96x` FOREIGN KEY (`interet_etudiant`) REFERENCES `interet_etudiant` (`id`),
  ADD CONSTRAINT `FKa5pvpf8u1xd71imbm7eyg4f5t` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKalko793fl1gm06kwq53w1gynu` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKe9tdu7jc218gjtgffhtovi3te` FOREIGN KEY (`pack_student`) REFERENCES `pack_student` (`id`),
  ADD CONSTRAINT `FKgdcsiettljowxye6tj6cd1cka` FOREIGN KEY (`statut_social`) REFERENCES `statut_social` (`id`),
  ADD CONSTRAINT `FKgsx4eotg1djjcj4erybxkbjt7` FOREIGN KEY (`niveau_etude`) REFERENCES `niveau_etude` (`id`),
  ADD CONSTRAINT `FKk6yh6drsgma7n1e7337udyl6v` FOREIGN KEY (`fonction`) REFERENCES `fonction` (`id`),
  ADD CONSTRAINT `FKnrowvydlyvqhipcre6ib7ayg0` FOREIGN KEY (`etat_inscription`) REFERENCES `etat_inscription` (`id`),
  ADD CONSTRAINT `FKrcxuicdjp141smpvdtc10q5if` FOREIGN KEY (`skill`) REFERENCES `skill` (`id`);

--
-- Constraints for table `invite_student`
--
ALTER TABLE `invite_student`
  ADD CONSTRAINT `FKbs4m9ldskgfg237mwub5ibttf` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `level_test_configuration`
--
ALTER TABLE `level_test_configuration`
  ADD CONSTRAINT `FKfumtlsoraadbwe0bdm2qnajnu` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`);

--
-- Constraints for table `model_permission_utilisateur`
--
ALTER TABLE `model_permission_utilisateur`
  ADD CONSTRAINT `FK7wq2ndtexep9usaj8oojvwlvx` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKanbrpecqteguq8exl5k9qrpom` FOREIGN KEY (`action_permission`) REFERENCES `action_permission` (`id`),
  ADD CONSTRAINT `FKr1a7bvuyitnsb1mgrh800qpl` FOREIGN KEY (`model_permission`) REFERENCES `model_permission` (`id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FKgg14bw1a1prjo1b9jule8k8fq` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Constraints for table `pack_student`
--
ALTER TABLE `pack_student`
  ADD CONSTRAINT `FK8o2q1qwe1qjqjx4s6cemt6s84` FOREIGN KEY (`level`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKqccki0b6i48a1masitotdw6sw` FOREIGN KEY (`price`) REFERENCES `price` (`id`);

--
-- Constraints for table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK6dbtl5qrg1kjxwh5xsj0nb0pv` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKnp1lw5uob8tvslkjnmcdnowc5` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `FK4jtf5cmektmsmtuiorrpnd8i3` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKgnpdcqiov5r4rpxoyy331m6ol` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `FKogcgru00bxc9bc173fvt4tog5` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Constraints for table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `FK1lu5t25vi6rcecetqp9vkupvg` FOREIGN KEY (`categorie_prof`) REFERENCES `categorie_prof` (`id`),
  ADD CONSTRAINT `FKh169spa56f14gjy94w1hplg36` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKju688rgp14luuefxtx6vf8d2v` FOREIGN KEY (`type_teacher`) REFERENCES `type_teacher` (`id`),
  ADD CONSTRAINT `FKnissiloouj0jjdevu6cardkcq` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKro10rjqmv3yp1yqo9kaqsjbn6` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`id`);

--
-- Constraints for table `prof_review`
--
ALTER TABLE `prof_review`
  ADD CONSTRAINT `FK2f9sfmlmyngxsqvgbrc201g4k` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKfgik1c9q13hbh95xxqxt6kytu` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKtf5bipf3qksucegqg0lqjsjds` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FKn7rkdf65fl89m8jx2c174tdbk` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKp3btkmc3gy8byspbfyqn08ubb` FOREIGN KEY (`type_de_question`) REFERENCES `type_de_question` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FKlrxqh2l9ipwscnak06wbhbwvu` FOREIGN KEY (`section`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `FKsgsqltca03pv3d1tw95t1tp7k` FOREIGN KEY (`exercice`) REFERENCES `exercice` (`id`);

--
-- Constraints for table `quiz_etudiant`
--
ALTER TABLE `quiz_etudiant`
  ADD CONSTRAINT `FKi9bv4k6mvrn2a0gjv0aeo4oy8` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKj66cc5f1ta9bvx99jg2lkdx37` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Constraints for table `reclamation_etudiant`
--
ALTER TABLE `reclamation_etudiant`
  ADD CONSTRAINT `FKerecn8dtyxuasp872ty9ohhjq` FOREIGN KEY (`type_reclamation_etudiant`) REFERENCES `type_reclamation_etudiant` (`id`);

--
-- Constraints for table `reclamation_prof`
--
ALTER TABLE `reclamation_prof`
  ADD CONSTRAINT `FK8fsbomsmjlri7i1du98tdhwvl` FOREIGN KEY (`type_reclamation_prof`) REFERENCES `type_reclamation_prof` (`id`),
  ADD CONSTRAINT `FKjknx7s81cylq1p4y7lejd02bl` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `recommend_teacher`
--
ALTER TABLE `recommend_teacher`
  ADD CONSTRAINT `FKtm1jpoh1i39jktqf51lyu81qs` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FKqww17yrx5cgjbcu747lgre8ci` FOREIGN KEY (`question`) REFERENCES `question` (`id`);

--
-- Constraints for table `reponse_etudiant`
--
ALTER TABLE `reponse_etudiant`
  ADD CONSTRAINT `FK4hf80to4ievjjdq3bmfgdwxw9` FOREIGN KEY (`reponse`) REFERENCES `reponse` (`id`),
  ADD CONSTRAINT `FK611oipslqc88pa7j7yqqmf72u` FOREIGN KEY (`question`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FKrcx0v612xf6xx6wsml9mco2h3` FOREIGN KEY (`quiz_etudiant`) REFERENCES `quiz_etudiant` (`id`);

--
-- Constraints for table `reponse_etudiant_home_work`
--
ALTER TABLE `reponse_etudiant_home_work`
  ADD CONSTRAINT `FK456160ae6nd12q2d5y7m567sr` FOREIGN KEY (`home_work_question`) REFERENCES `home_work_question` (`id`),
  ADD CONSTRAINT `FKnebaw1q5vebbipkl68omyu39b` FOREIGN KEY (`howe_work_q_s_t_reponse`) REFERENCES `howe_work_q_s_t_reponse` (`id`),
  ADD CONSTRAINT `FKnnjmqei727y0u1rivh1daltwb` FOREIGN KEY (`home_work_etudiant`) REFERENCES `home_work_etudiant` (`id`);

--
-- Constraints for table `role_utilisateur`
--
ALTER TABLE `role_utilisateur`
  ADD CONSTRAINT `FK2fjdcobcg9c6a209t2qd2mgg1` FOREIGN KEY (`role`) REFERENCES `role_app` (`id`),
  ADD CONSTRAINT `FKjor807snrj8ytkt26jvm3wu6c` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FKhtcvy2kfqxnf85cag7if9srhr` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `schedule_prof`
--
ALTER TABLE `schedule_prof`
  ADD CONSTRAINT `FK33a7ip3jqbafu5joohmdklatc` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FK63y8jx726vtsw7oi7li4psr06` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKnpixsixxies6sowxahl3ehaxu` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `FKfosokbccblq4mj9g6mo2ktknw` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`);

--
-- Constraints for table `section_item`
--
ALTER TABLE `section_item`
  ADD CONSTRAINT `FKplpthekfwb2ydh5ljftao632l` FOREIGN KEY (`section`) REFERENCES `section` (`id`);

--
-- Constraints for table `session_cours`
--
ALTER TABLE `session_cours`
  ADD CONSTRAINT `FK1kq233790h625dnbvspnimphp` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK5ahhbwiot1buddfs1b23iypuk` FOREIGN KEY (`salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `FKidwlfrj69hdx1m9vhbwf4ip8t` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKp2v3kulrxoryk626tr1n07v6n` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`);

--
-- Constraints for table `session_cours_section`
--
ALTER TABLE `session_cours_section`
  ADD CONSTRAINT `FK7hlnjs1x496awgkl9wfwrqec7` FOREIGN KEY (`session_cours`) REFERENCES `session_cours` (`id`),
  ADD CONSTRAINT `FKjvheycal0r3gloj4vcp1pri5n` FOREIGN KEY (`section`) REFERENCES `section` (`id`);

--
-- Constraints for table `tranche_horaire_prof`
--
ALTER TABLE `tranche_horaire_prof`
  ADD CONSTRAINT `FKgfj4fgstpvqmyeycqgrax2t3p` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK1j914o9lyp6mjierf132mawjo` FOREIGN KEY (`niveau_etude`) REFERENCES `niveau_etude` (`id`),
  ADD CONSTRAINT `FK87lvn3d9xb337koefj58gam98` FOREIGN KEY (`pack_student`) REFERENCES `pack_student` (`id`),
  ADD CONSTRAINT `FK8jpsfe6itxx00coqlcewmbv0u` FOREIGN KEY (`type_collaborator`) REFERENCES `type_collaborator` (`id`),
  ADD CONSTRAINT `FK9q5cjy9t7ultpjlebbesgq1w9` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKb1foe1690lcirh75bvap2lg3h` FOREIGN KEY (`categorie_prof`) REFERENCES `categorie_prof` (`id`),
  ADD CONSTRAINT `FKbcts6ejkmhmqh1dti19xvtef2` FOREIGN KEY (`interet_etudiant`) REFERENCES `interet_etudiant` (`id`),
  ADD CONSTRAINT `FKbug521p2lt3c1foh0j0r9tbxx` FOREIGN KEY (`statut_social`) REFERENCES `statut_social` (`id`),
  ADD CONSTRAINT `FKc8bby2o7jdjj7pacpfpo2bj6r` FOREIGN KEY (`groupe_etude`) REFERENCES `groupe_etude` (`id`),
  ADD CONSTRAINT `FKddp1ld78v56h491wxcfvs8gpp` FOREIGN KEY (`langue`) REFERENCES `langue` (`id`),
  ADD CONSTRAINT `FKfcrnrmd0x8ti3td1vcot417qw` FOREIGN KEY (`fonction`) REFERENCES `fonction` (`id`),
  ADD CONSTRAINT `FKimfpxj5uy18qyitn193rnpj3v` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKiopkx4yvy0mcu5lr6rdekmwjm` FOREIGN KEY (`teacher_locality`) REFERENCES `teacher_locality` (`id`),
  ADD CONSTRAINT `FKncpqcs02kue14y3teuc0bj12i` FOREIGN KEY (`skill`) REFERENCES `skill` (`id`),
  ADD CONSTRAINT `FKnnm30cr14vvt6raylyn226ncv` FOREIGN KEY (`type_teacher`) REFERENCES `type_teacher` (`id`);

--
-- Constraints for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK6jwsmbypn2jrlpro721bt3yv7` FOREIGN KEY (`section`) REFERENCES `section` (`id`);

--
-- Constraints for table `workload_bonus_prof`
--
ALTER TABLE `workload_bonus_prof`
  ADD CONSTRAINT `FK42mcgkljlaa1j07qb095xqhpg` FOREIGN KEY (`salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `FKcycvnjjmeip07d0mxvnllhpq4` FOREIGN KEY (`workload_bonus`) REFERENCES `workload_bonus` (`id`),
  ADD CONSTRAINT `FKjp3saesbvciolabu4np0enqbm` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
