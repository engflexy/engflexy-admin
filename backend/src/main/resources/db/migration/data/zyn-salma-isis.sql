-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 17 août 2024 à 14:27
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zyn`
--

-- --------------------------------------------------------

--
-- Structure de la table `action_permission`
--

CREATE TABLE `action_permission` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `action_permission`
--

INSERT INTO `action_permission` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `libelle`, `reference`) VALUES
(1, '', '2024-06-26 15:36:41.985897', '', NULL, NULL, 'list'),
(2, '', '2024-06-26 15:36:41.997887', '', NULL, NULL, 'create'),
(3, '', '2024-06-26 15:36:42.006901', '', NULL, NULL, 'delete'),
(4, '', '2024-06-26 15:36:42.015890', '', NULL, NULL, 'edit'),
(5, '', '2024-06-26 15:36:42.022895', '', NULL, NULL, 'view'),
(6, '', '2024-06-26 15:36:42.029890', '', NULL, NULL, 'duplicate');

-- --------------------------------------------------------

--
-- Structure de la table `action_permission_seq`
--

CREATE TABLE `action_permission_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `action_permission_seq`
--

INSERT INTO `action_permission_seq` (`next_val`) VALUES
(1),
(7);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_prof`
--

CREATE TABLE `categorie_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `lesson_rate` decimal(38,2) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_prof`
--

INSERT INTO `categorie_prof` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `lesson_rate`, `level`) VALUES
(1, NULL, NULL, 'anonymousUser', '2024-07-24 11:34:28.000000', 'c1', 4.00, 'Junior'),
(2, NULL, NULL, NULL, NULL, 'c2', 4.50, 'Middle'),
(3, NULL, NULL, NULL, NULL, 'c3', 6.00, 'Senior');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_prof_seq`
--

CREATE TABLE `categorie_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_prof_seq`
--

INSERT INTO `categorie_prof_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `class_average_bonus`
--

CREATE TABLE `class_average_bonus` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nombre_session` int(11) DEFAULT NULL,
  `prix` decimal(38,2) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `class_average_bonus_prof`
--

CREATE TABLE `class_average_bonus_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `class_average_bonus_prof_seq`
--

CREATE TABLE `class_average_bonus_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `class_average_bonus_prof_seq`
--

INSERT INTO `class_average_bonus_prof_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `class_average_bonus_seq`
--

CREATE TABLE `class_average_bonus_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `class_average_bonus_seq`
--

INSERT INTO `class_average_bonus_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `confirmation_token`
--

CREATE TABLE `confirmation_token` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `confirmed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `confirmation_token_seq`
--

CREATE TABLE `confirmation_token_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `confirmation_token_seq`
--

INSERT INTO `confirmation_token_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_contact` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `replied` bit(1) DEFAULT NULL,
  `set_from` varchar(255) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact_seq`
--

CREATE TABLE `contact_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contact_seq`
--

INSERT INTO `contact_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `content_type`
--

CREATE TABLE `content_type` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `content_type`
--

INSERT INTO `content_type` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `libelle`) VALUES
(1, '', '2024-06-26 15:36:41.229020', '', NULL, 'IMAGE', 'Image'),
(2, '', '2024-06-26 15:36:41.279983', '', NULL, 'MULTI_IMAGE', 'Multi-Image'),
(3, '', '2024-06-26 15:36:41.289024', '', NULL, 'VIDEO', 'Video'),
(4, '', '2024-06-26 15:36:41.294983', '', NULL, 'CONTENT', 'Content'),
(5, '', '2024-06-26 15:36:41.303030', '', NULL, 'QUIZ', 'Quiz');

-- --------------------------------------------------------

--
-- Structure de la table `content_type_seq`
--

CREATE TABLE `content_type_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `content_type_seq`
--

INSERT INTO `content_type_seq` (`next_val`) VALUES
(1),
(101),
(151);

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

CREATE TABLE `conversation` (
  `conversation_id` bigint(20) NOT NULL,
  `user1_id` bigint(20) DEFAULT NULL,
  `user2_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_link_en_cours` int(11) DEFAULT NULL,
  `nombre_link_finalise` int(11) DEFAULT NULL,
  `nombre_section_en_cours` int(11) DEFAULT NULL,
  `nombre_section_finalise` int(11) DEFAULT NULL,
  `numero_order` int(11) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `description`, `image`, `libelle`, `nombre_link_en_cours`, `nombre_link_finalise`, `nombre_section_en_cours`, `nombre_section_finalise`, `numero_order`, `parcours`) VALUES
(1, 'collaborator', '2024-05-19 19:00:08.749835', 'anonymousUser', '2024-07-30 13:47:51.000000', 'C', 'this is course number one', 'http://localhost:8036/app/images/5zxf8Je0un/5zxf8Je0un.jpg', 'course number one ', 0, 0, 0, 9, 0, 1),
(2, 'collaborator', '2024-05-19 19:23:20.328304', '', NULL, 'C', NULL, 'http://localhost:8036/app/images/FCDLCm1Dba/FCDLCm1Dba.jpg', 'course number two', 0, 0, 0, 2, 0, 1),
(3, 'collaborator', '2024-05-19 19:34:57.037698', 'collaborator', '2024-05-29 21:08:40.528438', 'C', 'Sunt fugiat numquam ', NULL, 'Cumque minus recusan', 0, 0, 0, 6, 0, 1),
(4, 'collaborator', '2024-05-19 19:38:34.998696', '', NULL, 'P', 'desc for hfad ford', NULL, 'Proident minim agord fard bitin', 0, 0, 0, 0, 0, 1),
(5, 'collaborator', '2024-05-19 19:41:17.202630', '', NULL, 'F', 'did for vvahu fgphl firl valhab gihm', 'http://localhost:8036/app/images/LfJY2xyH1b/LfJY2xyH1b.jpg', 'forid sasdib bid for tha did', 0, 0, 0, 0, 0, 1),
(6, 'collaborator1', '2024-06-26 15:53:59.511747', '', NULL, 'N', 'Ea ex quia magni in ', NULL, 'Nesciunt officia al', 0, 0, 0, 0, 0, 3),
(7, 'collaborator1', '2024-06-26 15:54:20.257781', '', NULL, 'S', 'Ut suscipit sit quo ', NULL, 'Suscipit quo nulla e', 0, 0, 0, 0, 0, 2),
(8, 'anonymousUser', '2024-07-27 17:28:11.000000', '', NULL, 'COURSE_001', 'This is a description for Course 1', NULL, 'Course 1', 0, 0, 0, 0, 0, 1),
(52, 'collaborator', '2024-05-24 15:19:19.815809', '', NULL, 'C', 'dsc', NULL, 'course number 10', 0, 0, 0, 0, 0, 1),
(55, 'anonymousUser', '2024-07-29 12:21:20.000000', '', NULL, 'S', 'desc', NULL, 'selmaCours', 0, 0, 0, 0, 0, 10),
(56, 'anonymousUser', '2024-07-29 15:42:06.000000', '', NULL, '&', 'jg,', NULL, '&dn', 0, 0, 0, 0, 0, 1),
(102, 'collaborator', '2024-05-29 21:11:10.681956', 'collaborator', '2024-05-29 21:11:51.601745', 'U', 'learn numbers and letters', 'http://localhost:8036/app/images/UsAKkUYh1W/UsAKkUYh1W.jpg', 'Unit one', 0, 0, 0, 1, 0, 102),
(103, 'anonymousUser', '2024-07-30 12:42:52.000000', '', NULL, 'S', 'ggg', NULL, 'selmaCours', 0, 0, 0, 0, 0, 104),
(104, 'anonymousUser', '2024-07-30 12:43:05.000000', '', NULL, 'G', 'gggg', NULL, 'ggggg', 0, 0, 0, 0, 0, 104),
(105, 'anonymousUser', '2024-07-30 12:43:41.000000', 'anonymousUser', '2024-07-30 12:43:46.000000', 'G', 'gggg', NULL, 'gggg', 0, 0, 0, 1, 0, 1),
(106, 'anonymousUser', '2024-07-30 13:33:12.000000', 'anonymousUser', '2024-07-30 13:36:37.000000', 'R', '-gt-', NULL, 'retdr', 0, 0, 0, 3, 0, 108),
(107, 'anonymousUser', '2024-07-30 13:38:37.000000', '', NULL, 'G', 'gg', NULL, 'ggggg', 0, 0, 0, 0, 0, 108),
(152, 'anonymousUser', '2024-07-30 15:19:38.000000', 'anonymousUser', '2024-07-30 15:27:28.000000', 'R', 'Placeat a ad verita', NULL, 'Ratione incididunt e', 0, 0, 0, 1, 0, 154),
(153, 'anonymousUser', '2024-07-30 15:22:43.000000', 'anonymousUser', '2024-08-15 12:55:28.000000', 'U', 'Quos architecto cumq', NULL, 'Ut modi modi eveniet', 0, 0, 0, 1, 0, 156),
(202, 'collaborator', '2024-06-26 14:35:48.089419', 'collaborator', '2024-06-26 14:36:12.462736', 'C', NULL, NULL, 'course1', 0, 0, 0, 1, 0, 4),
(203, 'anonymousUser', '2024-08-08 15:51:26.000000', 'anonymousUser', '2024-08-13 11:26:26.000000', 'S', 'desc', 'http://localhost:8036/app/images/ffP7yNjumL/ffP7yNjumL.jpg', 'selmaCour', 0, 0, 0, 1, 0, 202),
(204, 'anonymousUser', '2024-08-08 15:52:03.000000', 'anonymousUser', '2024-08-08 15:52:33.000000', 'S', 'ttt', 'http://localhost:8036/app/images/zcA9MsONf0/zcA9MsONf0.jpg', 'selmaCour', 0, 0, 0, 1, 0, 202),
(252, 'anonymousUser', '2024-08-15 13:28:32.000000', 'anonymousUser', '2024-08-15 13:28:35.000000', 'K', 'kkk', 'http://localhost:8036/app/images/Xk91NQv4Fb/Xk91NQv4Fb.jpg', 'kkk', 0, 0, 0, 1, 0, 257);

-- --------------------------------------------------------

--
-- Structure de la table `cours_seq`
--

CREATE TABLE `cours_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours_seq`
--

INSERT INTO `cours_seq` (`next_val`) VALUES
(351),
(351),
(351),
(351),
(351);

-- --------------------------------------------------------

--
-- Structure de la table `dictionary`
--

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `learned` bit(1) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dictionary_seq`
--

CREATE TABLE `dictionary_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dictionary_seq`
--

INSERT INTO `dictionary_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement_seq`
--

CREATE TABLE `etablissement_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etablissement_seq`
--

INSERT INTO `etablissement_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `etat_inscription`
--

CREATE TABLE `etat_inscription` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etat_inscription`
--

INSERT INTO `etat_inscription` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `libelle`, `ref`) VALUES
(1, NULL, NULL, 'collaborator', '2024-06-01 17:44:50.152649', 'Pending', 'E1'),
(2, NULL, NULL, NULL, NULL, 'Validated', 'E2'),
(3, NULL, NULL, NULL, NULL, 'refused', 'E3'),
(4, NULL, NULL, NULL, NULL, 'PAID', 'E4');

-- --------------------------------------------------------

--
-- Structure de la table `etat_inscription_seq`
--

CREATE TABLE `etat_inscription_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etat_inscription_seq`
--

INSERT INTO `etat_inscription_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_review`
--

CREATE TABLE `etudiant_review` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_review` datetime(6) DEFAULT NULL,
  `review` int(11) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_review_seq`
--

CREATE TABLE `etudiant_review_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant_review_seq`
--

INSERT INTO `etudiant_review_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `exercice`
--

CREATE TABLE `exercice` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `content_type` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exercice`
--

INSERT INTO `exercice` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `content`, `description`, `libelle`, `numero`, `content_type`, `quiz`, `section`) VALUES
(1, 'collaborator', '2024-06-26 15:43:33.335671', 'anonymousUser', '2024-07-27 18:14:18.000000', ';http://localhost:8036/app/images/l8jiB5xbsB/l8jiB5xbsB.jpg;http://localhost:8036/app/images/RmPX7l6Zyo/RmPX7l6Zyo.jpg', ';angular;schema', NULL, 1, 1, NULL, 1),
(102, 'anonymousUser', '2024-07-30 12:53:10.000000', '', NULL, NULL, NULL, 'ghghghg', 2, 1, NULL, 1),
(152, 'anonymousUser', '2024-07-30 14:06:13.000000', '', NULL, '<b>hghuvnj</b><div>kkjj,</div>', NULL, 'fgjji', 3, 4, NULL, 1),
(202, 'anonymousUser', '2024-08-08 15:52:53.000000', 'anonymousUser', '2024-08-08 15:53:23.000000', ';http://localhost:8036/app/images/i1NzJVzofG/i1NzJVzofG.jpg', ';null', 'ggg', 1, 1, NULL, 252),
(252, 'anonymousUser', '2024-08-08 15:56:51.000000', '', NULL, 'https://youtu.be/8aLuzHb0Hv4?si=t6FDUUVhrU9Rbwy1', 'desc', 'ex1', 2, 3, NULL, 252),
(253, 'anonymousUser', '2024-08-08 15:58:34.000000', '', NULL, '<b>&#160;selmaa <i>selmaa</i></b><div><u>selmaaa</u></div><div><u>ddddd</u></div><div><sub>fffff</sub></div><div><sub>ggggg<b>gggggggGGGGGGG</b></sub></div>', NULL, 'selmaa', 3, 4, NULL, 252),
(302, 'anonymousUser', '2024-08-15 13:29:19.000000', 'anonymousUser', '2024-08-16 11:21:05.000000', ';http://localhost:8036/app/images/78DXvpLNqN/78DXvpLNqN.jpg', ';hghghg', 'hhh', 1, 1, NULL, 353),
(305, 'anonymousUser', '2024-08-15 13:55:58.000000', '', NULL, 'https://www.youtube.com/watch?v=zOVXrkk4ClU', 'new', 'new', 3, 3, NULL, 353),
(306, 'anonymousUser', '2024-08-15 14:25:07.000000', '', NULL, 'https://www.youtube.com/watch?v=mibTkV_-QHQ', 'nnn', 'nnn', 3, 3, NULL, 353),
(353, 'anonymousUser', '2024-08-16 09:59:52.000000', '', NULL, NULL, NULL, NULL, 4, 5, 2, 353),
(354, 'anonymousUser', '2024-08-16 11:06:06.000000', '', NULL, 'https://www.youtube.com/watch?v=Q-0_GT6eDwU', 'rrr', 'rrr', 5, 3, NULL, 353),
(355, 'anonymousUser', '2024-08-16 11:07:59.000000', 'anonymousUser', '2024-08-16 11:13:29.000000', 'https://www.youtube.com/embed/Q-0_GT6eDwU?start=8&end=30', 'gcvbjnk,l', 'jkjkl', 6, 3, NULL, 353),
(356, 'anonymousUser', '2024-08-16 11:15:47.000000', '', NULL, NULL, NULL, NULL, 7, 5, 3, 353),
(357, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, NULL, NULL, NULL, 8, 5, 4, 353);

-- --------------------------------------------------------

--
-- Structure de la table `exercice_seq`
--

CREATE TABLE `exercice_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exercice_seq`
--

INSERT INTO `exercice_seq` (`next_val`) VALUES
(451),
(451),
(851),
(851),
(851);

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `faq`
--

INSERT INTO `faq` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `answer`, `question`, `faq_type`, `description`, `libelle`) VALUES
(1, NULL, NULL, 'anonymousUser', '2024-07-10 18:34:38.000000', 'Magna consectetur culpa duis ad est tempor pariatur velit ullamco aute exercitation magna sunt commodo minim enim aliquip eiusmod ipsum adipisicing magna ipsum reprehenderit lorem magna voluptate magna aliqua culpa. Sit nisi adipisicing pariatur enim enim', 'Is there a free trial lessons?', 1, NULL, NULL),
(2, NULL, NULL, NULL, NULL, 'Et in lorem qui ipsum deserunt duis exercitation lorem elit qui qui ipsum tempor nulla velit aliquip enim consequat incididunt pariatur duis excepteur elit irure nulla ipsum dolor dolore est. Aute deserunt nostrud id non ipsum do adipisicing laboris in mi', 'What’s the benefits of the Individual Membership?', 1, NULL, NULL),
(3, NULL, NULL, NULL, NULL, 'Sunt mollit irure dolor aliquip sit veniam amet ut sunt dolore cillum sint pariatur qui irure proident velit non excepteur quis ut et quis velit aliqua ea sunt cillum sit. Reprehenderit est culpa ut incididunt sit dolore mollit in occaecat velit culpa con', 'How to download your items', 2, NULL, NULL),
(4, NULL, NULL, NULL, NULL, 'Sint mollit consectetur voluptate fugiat sunt ipsum adipisicing labore exercitation eiusmod enim excepteur enim proident velit sint magna commodo dolor ex ipsum sit nisi deserunt labore eu irure amet ea. Occaecat ut velit et sint pariatur laboris voluptat', 'View and download invoices', 3, NULL, NULL),
(5, 'anonymousUser', '2024-07-10 18:43:01.000000', 'anonymousUser', '2024-07-11 15:41:10.000000', 'selma\'s Answer', 'selma\'s Question', 1, NULL, NULL),
(53, 'anonymousUser', '2024-07-11 13:26:13.000000', '', NULL, 'Ut totam est molest', 'Rerum modi voluptas ', 1486, NULL, NULL),
(54, 'anonymousUser', '2024-07-11 13:30:07.000000', '', NULL, 'In laboriosam delen', 'Porro sed et eum qua', 1486, NULL, NULL),
(55, 'anonymousUser', '2024-07-11 13:32:13.000000', '', NULL, 'Quidem illum aut co', 'In veniam totam sed', 3, NULL, NULL),
(56, 'anonymousUser', '2024-07-11 13:32:35.000000', '', NULL, 'Culpa rerum sit nost', 'Adipisicing recusand', 2, NULL, NULL),
(152, 'anonymousUser', '2024-08-16 11:49:39.000000', 'anonymousUser', '2024-08-16 11:49:53.000000', 'new', 'new ', 1, NULL, NULL),
(153, 'anonymousUser', '2024-08-16 11:51:22.000000', 'anonymousUser', '2024-08-16 12:18:26.000000', 'reponse 2', 'reponse 2', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `faq_etudiant`
--

CREATE TABLE `faq_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faq_etudiant_seq`
--

CREATE TABLE `faq_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `faq_etudiant_seq`
--

INSERT INTO `faq_etudiant_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `faq_prof`
--

CREATE TABLE `faq_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faq_prof_seq`
--

CREATE TABLE `faq_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `faq_prof_seq`
--

INSERT INTO `faq_prof_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `faq_seq`
--

CREATE TABLE `faq_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `faq_seq`
--

INSERT INTO `faq_seq` (`next_val`) VALUES
(251),
(251),
(251),
(251),
(251);

-- --------------------------------------------------------

--
-- Structure de la table `faq_type`
--

CREATE TABLE `faq_type` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `destinataire` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `faq_type`
--

INSERT INTO `faq_type` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `destinataire`, `libelle`) VALUES
(1, NULL, NULL, 'anonymousUser', '2024-07-11 15:41:10.000000', 'teacher', 'DE Class Support'),
(2, NULL, NULL, NULL, NULL, 'teacher', 'Teachers effectiveness'),
(3, NULL, NULL, 'anonymousUser', '2024-08-16 11:59:39.000000', 'teacher', 'Methodological care'),
(1485, NULL, NULL, NULL, NULL, 'teacher', 'Common questions'),
(1486, NULL, NULL, 'anonymousUser', '2024-08-16 10:23:03.000000', 'teacher', 'Salary'),
(1487, NULL, NULL, NULL, NULL, 'student', 'Exams'),
(1488, NULL, NULL, NULL, NULL, 'student', 'Diploma');

-- --------------------------------------------------------

--
-- Structure de la table `faq_type_seq`
--

CREATE TABLE `faq_type_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `faq_type_seq`
--

INSERT INTO `faq_type_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fonction_seq`
--

CREATE TABLE `fonction_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fonction_seq`
--

INSERT INTO `fonction_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial`
--

CREATE TABLE `free_trial` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_free_trial` datetime(6) DEFAULT NULL,
  `date_free_trial_premier_deuxieme_rappel` datetime(6) DEFAULT NULL,
  `date_free_trial_premier_rappel` datetime(6) DEFAULT NULL,
  `email_teacher_sending_date` datetime(6) DEFAULT NULL,
  `email_teacher_sent` bit(1) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `nombre_student_abonne` int(11) DEFAULT NULL,
  `nombre_student_present` int(11) DEFAULT NULL,
  `nombre_student_total` int(11) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `whats_teacher_sending_date` datetime(6) DEFAULT NULL,
  `whats_teacher_sent` bit(1) DEFAULT NULL,
  `free_trial_configuration` bigint(20) DEFAULT NULL,
  `free_trial_student_email_template` bigint(20) DEFAULT NULL,
  `free_trial_student_whats_template` bigint(20) DEFAULT NULL,
  `free_trial_teacher_email_template` bigint(20) DEFAULT NULL,
  `free_trial_teacher_whats_template` bigint(20) DEFAULT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `statut_free_trial` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trialformule`
--

CREATE TABLE `free_trialformule` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_confirmation` datetime(6) DEFAULT NULL,
  `dayspeerweek` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `teacher_age_range` varchar(255) DEFAULT NULL,
  `teacher_genderoption` varchar(255) DEFAULT NULL,
  `teacher_personnality` varchar(255) DEFAULT NULL,
  `timeperday` varchar(255) DEFAULT NULL,
  `inscription` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trialformule_seq`
--

CREATE TABLE `free_trialformule_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trialformule_seq`
--

INSERT INTO `free_trialformule_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_configuration`
--

CREATE TABLE `free_trial_configuration` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_application_debut` datetime(6) DEFAULT NULL,
  `date_application_fin` datetime(6) DEFAULT NULL,
  `nombre_student_max` int(11) DEFAULT NULL,
  `nombre_student_min` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_configuration_seq`
--

CREATE TABLE `free_trial_configuration_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_configuration_seq`
--

INSERT INTO `free_trial_configuration_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_detail`
--

CREATE TABLE `free_trial_detail` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `abonne` bit(1) DEFAULT NULL,
  `date_envoi_email_message` datetime(6) DEFAULT NULL,
  `date_envoiwhats_up_message` datetime(6) DEFAULT NULL,
  `email_message_sent` bit(1) DEFAULT NULL,
  `presence` bit(1) DEFAULT NULL,
  `whats_up_message_sent` bit(1) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `free_trial` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_detail_seq`
--

CREATE TABLE `free_trial_detail_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_detail_seq`
--

INSERT INTO `free_trial_detail_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_seq`
--

CREATE TABLE `free_trial_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_seq`
--

INSERT INTO `free_trial_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_student_email_template`
--

CREATE TABLE `free_trial_student_email_template` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_student_email_template_seq`
--

CREATE TABLE `free_trial_student_email_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_student_email_template_seq`
--

INSERT INTO `free_trial_student_email_template_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_student_whats_template`
--

CREATE TABLE `free_trial_student_whats_template` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_student_whats_template_seq`
--

CREATE TABLE `free_trial_student_whats_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_student_whats_template_seq`
--

INSERT INTO `free_trial_student_whats_template_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_teacher_email_template`
--

CREATE TABLE `free_trial_teacher_email_template` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_teacher_email_template_seq`
--

CREATE TABLE `free_trial_teacher_email_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_teacher_email_template_seq`
--

INSERT INTO `free_trial_teacher_email_template_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_teacher_whats_template`
--

CREATE TABLE `free_trial_teacher_whats_template` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `corps` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free_trial_teacher_whats_template_seq`
--

CREATE TABLE `free_trial_teacher_whats_template_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `free_trial_teacher_whats_template_seq`
--

INSERT INTO `free_trial_teacher_whats_template_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etat`
--

CREATE TABLE `groupe_etat` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etat_seq`
--

CREATE TABLE `groupe_etat_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etat_seq`
--

INSERT INTO `groupe_etat_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etude`
--

CREATE TABLE `groupe_etude` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_etudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etude`
--

INSERT INTO `groupe_etude` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `description`, `libelle`, `nombre_etudiant`) VALUES
(25905, NULL, NULL, 'collaborator', '2024-06-10 15:29:24.841264', 'Group for 1 person(Individual)', 'Group for 1 person', 1),
(40491, NULL, NULL, NULL, NULL, 'Group for 30 person', 'Group for 30 person', 30),
(41253, NULL, NULL, NULL, NULL, 'Group for 10 person', 'Group for 10 person', 10),
(42307, NULL, NULL, NULL, NULL, 'Webinar', 'Group for 100 person', 100),
(43263, NULL, NULL, NULL, NULL, 'Elementary Free Trial', 'Elementary Free Trial', 100),
(43264, NULL, NULL, NULL, NULL, 'Intermediate Free Trial', 'Intermediate Free Trial', 100),
(43667, NULL, NULL, NULL, NULL, 'Group for 100 Naji + Inter', 'Group for 100 Naji + Inter', 100);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etude_seq`
--

CREATE TABLE `groupe_etude_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etude_seq`
--

INSERT INTO `groupe_etude_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etudiant`
--

CREATE TABLE `groupe_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_place` bigint(20) DEFAULT NULL,
  `nombre_place_non_vide` bigint(20) DEFAULT NULL,
  `nombre_placevide` bigint(20) DEFAULT NULL,
  `nre_courses` bigint(20) DEFAULT NULL,
  `nre_courses_coming` bigint(20) DEFAULT NULL,
  `nre_courses_completed` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `groupe_etat` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `groupe_type` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etudiant`
--

INSERT INTO `groupe_etudiant` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `date_debut`, `date_fin`, `libelle`, `nombre_place`, `nombre_place_non_vide`, `nombre_placevide`, `nre_courses`, `nre_courses_coming`, `nre_courses_completed`, `type`, `groupe_etat`, `groupe_etude`, `groupe_type`, `parcours`, `prof`) VALUES
(1, 'anonymousUser', '2024-07-18 16:02:07.000000', '', NULL, NULL, NULL, 'Fleur Dotson', 2, NULL, NULL, 99, NULL, NULL, 'Sit maiores voluptat', NULL, 25905, NULL, 1, 58);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etudiant_detail`
--

CREATE TABLE `groupe_etudiant_detail` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etudiant_detail`
--

INSERT INTO `groupe_etudiant_detail` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `etudiant`, `groupe_etudiant`) VALUES
(1, 'anonymousUser', '2024-07-18 16:02:07.000000', '', NULL, 54, 1),
(2, 'anonymousUser', '2024-07-18 16:02:07.000000', '', NULL, 55, 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etudiant_detail_seq`
--

CREATE TABLE `groupe_etudiant_detail_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etudiant_detail_seq`
--

INSERT INTO `groupe_etudiant_detail_seq` (`next_val`) VALUES
(101),
(101),
(101),
(101),
(101);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_etudiant_seq`
--

CREATE TABLE `groupe_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_etudiant_seq`
--

INSERT INTO `groupe_etudiant_seq` (`next_val`) VALUES
(51),
(51),
(51),
(51),
(51);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_type`
--

CREATE TABLE `groupe_type` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_type_seq`
--

CREATE TABLE `groupe_type_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe_type_seq`
--

INSERT INTO `groupe_type_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `home_work`
--

CREATE TABLE `home_work` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `url_image` varchar(255) DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `type_home_work` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `home_work_etudiant`
--

CREATE TABLE `home_work_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_home_work` datetime(6) DEFAULT NULL,
  `note` decimal(38,2) DEFAULT NULL,
  `resultat` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `home_work_etudiant_seq`
--

CREATE TABLE `home_work_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `home_work_etudiant_seq`
--

INSERT INTO `home_work_etudiant_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `home_work_question`
--

CREATE TABLE `home_work_question` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `point_reponse_juste` decimal(38,2) DEFAULT NULL,
  `point_reponsefausse` decimal(38,2) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL,
  `type_de_question` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `home_work_question_seq`
--

CREATE TABLE `home_work_question_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `home_work_question_seq`
--

INSERT INTO `home_work_question_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `home_work_seq`
--

CREATE TABLE `home_work_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `home_work_seq`
--

INSERT INTO `home_work_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `howe_work_q_s_t_reponse`
--

CREATE TABLE `howe_work_q_s_t_reponse` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `etat_reponse` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `home_work_question` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `howe_work_q_s_t_reponse_seq`
--

CREATE TABLE `howe_work_q_s_t_reponse_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `howe_work_q_s_t_reponse_seq`
--

INSERT INTO `howe_work_q_s_t_reponse_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_registration` varchar(255) DEFAULT NULL,
  `datedebutinscription` varchar(255) DEFAULT NULL,
  `datefininscription` varchar(255) DEFAULT NULL,
  `note_quiz_niveau` decimal(38,2) DEFAULT NULL,
  `numero_inscription` int(11) DEFAULT NULL,
  `quiz_finished` bit(1) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `subscription_finished` bit(1) DEFAULT NULL,
  `etat_inscription` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `fonction` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `groupe_type` bigint(20) DEFAULT NULL,
  `interet_etudiant` bigint(20) DEFAULT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `pack_student` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `skill` bigint(20) DEFAULT NULL,
  `statut_social` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `date_registration`, `datedebutinscription`, `datefininscription`, `note_quiz_niveau`, `numero_inscription`, `quiz_finished`, `skype`, `subscription_finished`, `etat_inscription`, `etudiant`, `fonction`, `groupe_etude`, `groupe_type`, `interet_etudiant`, `niveau_etude`, `pack_student`, `parcours`, `quiz`, `skill`, `statut_social`) VALUES
(1, 'collaborator1', '2024-06-26 15:51:02.631916', '', NULL, NULL, '06/26/2024 17:51', NULL, 0.00, 1, b'0', NULL, b'0', 1, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'collaborator1', '2024-06-26 15:51:09.301793', '', NULL, NULL, '06/26/2024 17:51', NULL, 0.00, 1, b'0', NULL, b'0', 1, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'collaborator1', '2024-06-26 15:51:18.214469', '', NULL, NULL, '06/26/2024 17:51', NULL, 0.00, 1, b'0', NULL, b'0', 1, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_collaborator`
--

CREATE TABLE `inscription_collaborator` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `banner_ad` bit(1) DEFAULT NULL,
  `color` bit(1) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `logo` bit(1) DEFAULT NULL,
  `nbr_student` decimal(38,2) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `inscription_collaborator_state` bigint(20) DEFAULT NULL,
  `package_collaborator` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription_collaborator`
--

INSERT INTO `inscription_collaborator` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `banner_ad`, `color`, `end_date`, `logo`, `nbr_student`, `price`, `start_date`, `collaborator`, `inscription_collaborator_state`, `package_collaborator`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.00, 100.00, NULL, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_collaborator_seq`
--

CREATE TABLE `inscription_collaborator_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription_collaborator_seq`
--

INSERT INTO `inscription_collaborator_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_collaborator_state`
--

CREATE TABLE `inscription_collaborator_state` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription_collaborator_state_seq`
--

CREATE TABLE `inscription_collaborator_state_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription_collaborator_state_seq`
--

INSERT INTO `inscription_collaborator_state_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_seq`
--

CREATE TABLE `inscription_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription_seq`
--

INSERT INTO `inscription_seq` (`next_val`) VALUES
(1),
(101),
(101),
(101),
(101);

-- --------------------------------------------------------

--
-- Structure de la table `interet_etudiant`
--

CREATE TABLE `interet_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `interet_etudiant`
--

INSERT INTO `interet_etudiant` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `libelle`) VALUES
(1, NULL, NULL, NULL, NULL, '1', 'Business'),
(2, NULL, NULL, NULL, NULL, '2', 'Study'),
(3, NULL, NULL, NULL, NULL, '3', 'Self cultivation'),
(4, NULL, NULL, 'collaborator', '2024-06-10 15:29:24.841264', '4', 'Career'),
(5, NULL, NULL, 'collaborator', '2024-06-10 16:15:35.082889', '5', 'Travel'),
(6, NULL, NULL, NULL, NULL, '6', 'Other');

-- --------------------------------------------------------

--
-- Structure de la table `interet_etudiant_seq`
--

CREATE TABLE `interet_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `interet_etudiant_seq`
--

INSERT INTO `interet_etudiant_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `invite_student`
--

CREATE TABLE `invite_student` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_accept_invitation` datetime(6) DEFAULT NULL,
  `date_pay_pack` datetime(6) DEFAULT NULL,
  `date_sent_invitation` datetime(6) DEFAULT NULL,
  `email_invited` varchar(255) DEFAULT NULL,
  `is_accepted` bit(1) DEFAULT NULL,
  `is_paid_pack` bit(1) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invite_student_seq`
--

CREATE TABLE `invite_student_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `invite_student_seq`
--

INSERT INTO `invite_student_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `langue`
--

INSERT INTO `langue` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `libelle`, `ref`) VALUES
(1, NULL, NULL, 'collaborator', '2024-06-10 15:29:24.839647', 'Arabic', 'ar'),
(2, NULL, NULL, 'collaborator', '2024-06-24 14:48:45.385102', 'Russian', 'ru'),
(3, NULL, NULL, 'anonymousUser', '2024-08-02 22:29:34.000000', 'French', 'fr'),
(4, NULL, NULL, 'collaborator', '2024-06-24 13:29:04.222646', 'English', 'en'),
(5, NULL, NULL, NULL, NULL, 'Chinese', 'cn');

-- --------------------------------------------------------

--
-- Structure de la table `langue_seq`
--

CREATE TABLE `langue_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `langue_seq`
--

INSERT INTO `langue_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `level_test_configuration`
--

CREATE TABLE `level_test_configuration` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `note_max` decimal(38,2) DEFAULT NULL,
  `note_min` decimal(38,2) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `level_test_configuration_seq`
--

CREATE TABLE `level_test_configuration_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `level_test_configuration_seq`
--

INSERT INTO `level_test_configuration_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `message_id` bigint(20) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `conversation_id` bigint(20) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model_permission`
--

CREATE TABLE `model_permission` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `model_permission`
--

INSERT INTO `model_permission` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `libelle`, `reference`) VALUES
(1, '', '2024-06-26 15:36:41.314983', '', NULL, NULL, 'ContentType'),
(2, '', '2024-06-26 15:36:41.326981', '', NULL, NULL, 'Etudiant'),
(3, '', '2024-06-26 15:36:41.334982', '', NULL, NULL, 'Paiement'),
(4, '', '2024-06-26 15:36:41.343981', '', NULL, NULL, 'StatutSocial'),
(5, '', '2024-06-26 15:36:41.353983', '', NULL, NULL, 'HomeWorkEtudiant'),
(6, '', '2024-06-26 15:36:41.361980', '', NULL, NULL, 'Quiz'),
(7, '', '2024-06-26 15:36:41.369984', '', NULL, NULL, 'Reponse'),
(8, '', '2024-06-26 15:36:41.378022', '', NULL, NULL, 'ProfReview'),
(9, '', '2024-06-26 15:36:41.386019', '', NULL, NULL, 'News'),
(10, '', '2024-06-26 15:36:41.394254', '', NULL, NULL, 'Skill'),
(11, '', '2024-06-26 15:36:41.403254', '', NULL, NULL, 'InteretEtudiant'),
(12, '', '2024-06-26 15:36:41.411257', '', NULL, NULL, 'Langue'),
(13, '', '2024-06-26 15:36:41.419259', '', NULL, NULL, 'WorkloadBonusProf'),
(14, '', '2024-06-26 15:36:41.427254', '', NULL, NULL, 'PackStudent'),
(15, '', '2024-06-26 15:36:41.435257', '', NULL, NULL, 'SectionItem'),
(16, '', '2024-06-26 15:36:41.445253', '', NULL, NULL, 'EtatInscription'),
(17, '', '2024-06-26 15:36:41.453253', '', NULL, NULL, 'ScheduleProf'),
(18, '', '2024-06-26 15:36:41.461256', '', NULL, NULL, 'Exercice'),
(19, '', '2024-06-26 15:36:41.468259', '', NULL, NULL, 'FreeTrialConfiguration'),
(20, '', '2024-06-26 15:36:41.476254', '', NULL, NULL, 'FreeTrialformule'),
(21, '', '2024-06-26 15:36:41.484253', '', NULL, NULL, 'FaqEtudiant'),
(22, '', '2024-06-26 15:36:41.493259', '', NULL, NULL, 'Prof'),
(23, '', '2024-06-26 15:36:41.500255', '', NULL, NULL, 'FreeTrial'),
(24, '', '2024-06-26 15:36:41.510257', '', NULL, NULL, 'InviteStudent'),
(25, '', '2024-06-26 15:36:41.519259', '', NULL, NULL, 'Parcours'),
(26, '', '2024-06-26 15:36:41.527254', '', NULL, NULL, 'Dictionary'),
(27, '', '2024-06-26 15:36:41.537253', '', NULL, NULL, 'ClassAverageBonus'),
(28, '', '2024-06-26 15:36:41.546258', '', NULL, NULL, 'FreeTrialTeacherWhatsTemplate'),
(29, '', '2024-06-26 15:36:41.555258', '', NULL, NULL, 'StatutFreeTrial'),
(30, '', '2024-06-26 15:36:41.565255', '', NULL, NULL, 'TypeCollaborator'),
(31, '', '2024-06-26 15:36:41.575256', '', NULL, NULL, 'WorkloadBonus'),
(32, '', '2024-06-26 15:36:41.584256', '', NULL, NULL, 'TeacherLocality'),
(33, '', '2024-06-26 15:36:41.593255', '', NULL, NULL, 'Services'),
(34, '', '2024-06-26 15:36:41.603256', '', NULL, NULL, 'HomeWorkQuestion'),
(35, '', '2024-06-26 15:36:41.611256', '', NULL, NULL, 'Salary'),
(36, '', '2024-06-26 15:36:41.618322', '', NULL, NULL, 'TypeReclamationEtudiant'),
(37, '', '2024-06-26 15:36:41.626587', '', NULL, NULL, 'GroupeEtat'),
(38, '', '2024-06-26 15:36:41.634586', '', NULL, NULL, 'ReponseEtudiant'),
(39, '', '2024-06-26 15:36:41.642588', '', NULL, NULL, 'SessionCoursSection'),
(40, '', '2024-06-26 15:36:41.649588', '', NULL, NULL, 'HoweWorkQSTReponse'),
(41, '', '2024-06-26 15:36:41.657585', '', NULL, NULL, 'GroupeEtudiantDetail'),
(42, '', '2024-06-26 15:36:41.664587', '', NULL, NULL, 'Section'),
(43, '', '2024-06-26 15:36:41.671891', '', NULL, NULL, 'EtudiantReview'),
(44, '', '2024-06-26 15:36:41.679891', '', NULL, NULL, 'Question'),
(45, '', '2024-06-26 15:36:41.686885', '', NULL, NULL, 'CategorieProf'),
(46, '', '2024-06-26 15:36:41.693891', '', NULL, NULL, 'RecommendTeacher'),
(47, '', '2024-06-26 15:36:41.701890', '', NULL, NULL, 'Inscription'),
(48, '', '2024-06-26 15:36:41.710892', '', NULL, NULL, 'FaqType'),
(49, '', '2024-06-26 15:36:41.718894', '', NULL, NULL, 'Fonction'),
(50, '', '2024-06-26 15:36:41.726889', '', NULL, NULL, 'NiveauEtude'),
(51, '', '2024-06-26 15:36:41.734887', '', NULL, NULL, 'TypeHomeWork'),
(52, '', '2024-06-26 15:36:41.742892', '', NULL, NULL, 'Vocabulary'),
(53, '', '2024-06-26 15:36:41.750893', '', NULL, NULL, 'ReclamationProf'),
(54, '', '2024-06-26 15:36:41.758889', '', NULL, NULL, 'ReponseEtudiantHomeWork'),
(55, '', '2024-06-26 15:36:41.767890', '', NULL, NULL, 'FreeTrialDetail'),
(56, '', '2024-06-26 15:36:41.775888', '', NULL, NULL, 'QuizEtudiant'),
(57, '', '2024-06-26 15:36:41.784894', '', NULL, NULL, 'GroupeType'),
(58, '', '2024-06-26 15:36:41.793889', '', NULL, NULL, 'FreeTrialTeacherEmailTemplate'),
(59, '', '2024-06-26 15:36:41.801888', '', NULL, NULL, 'Cours'),
(60, '', '2024-06-26 15:36:41.809887', '', NULL, NULL, 'SessionCours'),
(61, '', '2024-06-26 15:36:41.816887', '', NULL, NULL, 'LevelTestConfiguration'),
(62, '', '2024-06-26 15:36:41.824895', '', NULL, NULL, 'Price'),
(63, '', '2024-06-26 15:36:41.830894', '', NULL, NULL, 'FaqProf'),
(64, '', '2024-06-26 15:36:41.837888', '', NULL, NULL, 'Collaborator'),
(65, '', '2024-06-26 15:36:41.845891', '', NULL, NULL, 'ClassAverageBonusProf'),
(66, '', '2024-06-26 15:36:41.852888', '', NULL, NULL, 'FreeTrialStudentWhatsTemplate'),
(67, '', '2024-06-26 15:36:41.859929', '', NULL, NULL, 'HomeWork'),
(68, '', '2024-06-26 15:36:41.867890', '', NULL, NULL, 'ReclamationEtudiant'),
(69, '', '2024-06-26 15:36:41.874888', '', NULL, NULL, 'ConfirmationToken'),
(70, '', '2024-06-26 15:36:41.882892', '', NULL, NULL, 'TypeTeacher'),
(71, '', '2024-06-26 15:36:41.889891', '', NULL, NULL, 'TrancheHoraireProf'),
(72, '', '2024-06-26 15:36:41.896894', '', NULL, NULL, 'FreeTrialStudentEmailTemplate'),
(73, '', '2024-06-26 15:36:41.904887', '', NULL, NULL, 'GroupeEtude'),
(74, '', '2024-06-26 15:36:41.912888', '', NULL, NULL, 'TypeDeQuestion'),
(75, '', '2024-06-26 15:36:41.921889', '', NULL, NULL, 'Faq'),
(76, '', '2024-06-26 15:36:41.929890', '', NULL, NULL, 'GroupeEtudiant'),
(77, '', '2024-06-26 15:36:41.936892', '', NULL, NULL, 'Contact'),
(78, '', '2024-06-26 15:36:41.944891', '', NULL, NULL, 'TypeReclamationProf'),
(79, '', '2024-06-26 15:36:41.953891', '', NULL, NULL, 'User'),
(80, '', '2024-06-26 15:36:41.961890', '', NULL, NULL, 'ModelPermission'),
(81, '', '2024-06-26 15:36:41.970887', '', NULL, NULL, 'ActionPermission');

-- --------------------------------------------------------

--
-- Structure de la table `model_permission_seq`
--

CREATE TABLE `model_permission_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `model_permission_seq`
--

INSERT INTO `model_permission_seq` (`next_val`) VALUES
(1),
(82);

-- --------------------------------------------------------

--
-- Structure de la table `model_permission_utilisateur`
--

CREATE TABLE `model_permission_utilisateur` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `sub_attribute` varchar(255) DEFAULT NULL,
  `value` bit(1) DEFAULT NULL,
  `action_permission` bigint(20) DEFAULT NULL,
  `model_permission` bigint(20) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `model_permission_utilisateur`
--

INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(1, '', '2024-06-26 15:36:42.143888', '', NULL, NULL, b'1', 1, 1, 1),
(2, '', '2024-06-26 15:36:42.151888', '', NULL, NULL, b'1', 2, 1, 1),
(3, '', '2024-06-26 15:36:42.154927', '', NULL, NULL, b'1', 3, 1, 1),
(4, '', '2024-06-26 15:36:42.158931', '', NULL, NULL, b'1', 4, 1, 1),
(5, '', '2024-06-26 15:36:42.161894', '', NULL, NULL, b'1', 5, 1, 1),
(6, '', '2024-06-26 15:36:42.165902', '', NULL, NULL, b'1', 6, 1, 1),
(7, '', '2024-06-26 15:36:42.168924', '', NULL, NULL, b'1', 1, 2, 1),
(8, '', '2024-06-26 15:36:42.172890', '', NULL, NULL, b'1', 2, 2, 1),
(9, '', '2024-06-26 15:36:42.175887', '', NULL, NULL, b'1', 3, 2, 1),
(10, '', '2024-06-26 15:36:42.178897', '', NULL, NULL, b'1', 4, 2, 1),
(11, '', '2024-06-26 15:36:42.181888', '', NULL, NULL, b'1', 5, 2, 1),
(12, '', '2024-06-26 15:36:42.184887', '', NULL, NULL, b'1', 6, 2, 1),
(13, '', '2024-06-26 15:36:42.187926', '', NULL, NULL, b'1', 1, 3, 1),
(14, '', '2024-06-26 15:36:42.191892', '', NULL, NULL, b'1', 2, 3, 1),
(15, '', '2024-06-26 15:36:42.194924', '', NULL, NULL, b'1', 3, 3, 1),
(16, '', '2024-06-26 15:36:42.208904', '', NULL, NULL, b'1', 4, 3, 1),
(17, '', '2024-06-26 15:36:42.213937', '', NULL, NULL, b'1', 5, 3, 1),
(18, '', '2024-06-26 15:36:42.217889', '', NULL, NULL, b'1', 6, 3, 1),
(19, '', '2024-06-26 15:36:42.220992', '', NULL, NULL, b'1', 1, 4, 1),
(20, '', '2024-06-26 15:36:42.223927', '', NULL, NULL, b'1', 2, 4, 1),
(21, '', '2024-06-26 15:36:42.226889', '', NULL, NULL, b'1', 3, 4, 1),
(22, '', '2024-06-26 15:36:42.229923', '', NULL, NULL, b'1', 4, 4, 1),
(23, '', '2024-06-26 15:36:42.232974', '', NULL, NULL, b'1', 5, 4, 1),
(24, '', '2024-06-26 15:36:42.234990', '', NULL, NULL, b'1', 6, 4, 1),
(25, '', '2024-06-26 15:36:42.238013', '', NULL, NULL, b'1', 1, 5, 1),
(26, '', '2024-06-26 15:36:42.240888', '', NULL, NULL, b'1', 2, 5, 1),
(27, '', '2024-06-26 15:36:42.242900', '', NULL, NULL, b'1', 3, 5, 1),
(28, '', '2024-06-26 15:36:42.245925', '', NULL, NULL, b'1', 4, 5, 1),
(29, '', '2024-06-26 15:36:42.247955', '', NULL, NULL, b'1', 5, 5, 1),
(30, '', '2024-06-26 15:36:42.250888', '', NULL, NULL, b'1', 6, 5, 1),
(31, '', '2024-06-26 15:36:42.253887', '', NULL, NULL, b'1', 1, 6, 1),
(32, '', '2024-06-26 15:36:42.256894', '', NULL, NULL, b'1', 2, 6, 1),
(33, '', '2024-06-26 15:36:42.259889', '', NULL, NULL, b'1', 3, 6, 1),
(34, '', '2024-06-26 15:36:42.263158', '', NULL, NULL, b'1', 4, 6, 1),
(35, '', '2024-06-26 15:36:42.265888', '', NULL, NULL, b'1', 5, 6, 1),
(36, '', '2024-06-26 15:36:42.268974', '', NULL, NULL, b'1', 6, 6, 1),
(37, '', '2024-06-26 15:36:42.271885', '', NULL, NULL, b'1', 1, 7, 1),
(38, '', '2024-06-26 15:36:42.274891', '', NULL, NULL, b'1', 2, 7, 1),
(39, '', '2024-06-26 15:36:42.277888', '', NULL, NULL, b'1', 3, 7, 1),
(40, '', '2024-06-26 15:36:42.280891', '', NULL, NULL, b'1', 4, 7, 1),
(41, '', '2024-06-26 15:36:42.283145', '', NULL, NULL, b'1', 5, 7, 1),
(42, '', '2024-06-26 15:36:42.286152', '', NULL, NULL, b'1', 6, 7, 1),
(43, '', '2024-06-26 15:36:42.289138', '', NULL, NULL, b'1', 1, 8, 1),
(44, '', '2024-06-26 15:36:42.291888', '', NULL, NULL, b'1', 2, 8, 1),
(45, '', '2024-06-26 15:36:42.294887', '', NULL, NULL, b'1', 3, 8, 1),
(46, '', '2024-06-26 15:36:42.297886', '', NULL, NULL, b'1', 4, 8, 1),
(47, '', '2024-06-26 15:36:42.299889', '', NULL, NULL, b'1', 5, 8, 1),
(48, '', '2024-06-26 15:36:42.302888', '', NULL, NULL, b'1', 6, 8, 1),
(49, '', '2024-06-26 15:36:42.305888', '', NULL, NULL, b'1', 1, 9, 1),
(50, '', '2024-06-26 15:36:42.308891', '', NULL, NULL, b'1', 2, 9, 1),
(51, '', '2024-06-26 15:36:42.311891', '', NULL, NULL, b'1', 3, 9, 1),
(52, '', '2024-06-26 15:36:42.315889', '', NULL, NULL, b'1', 4, 9, 1),
(53, '', '2024-06-26 15:36:42.318889', '', NULL, NULL, b'1', 5, 9, 1),
(54, '', '2024-06-26 15:36:42.322892', '', NULL, NULL, b'1', 6, 9, 1),
(55, '', '2024-06-26 15:36:42.327888', '', NULL, NULL, b'1', 1, 10, 1),
(56, '', '2024-06-26 15:36:42.330903', '', NULL, NULL, b'1', 2, 10, 1),
(57, '', '2024-06-26 15:36:42.334894', '', NULL, NULL, b'1', 3, 10, 1),
(58, '', '2024-06-26 15:36:42.337888', '', NULL, NULL, b'1', 4, 10, 1),
(59, '', '2024-06-26 15:36:42.340889', '', NULL, NULL, b'1', 5, 10, 1),
(60, '', '2024-06-26 15:36:42.343925', '', NULL, NULL, b'1', 6, 10, 1),
(61, '', '2024-06-26 15:36:42.347897', '', NULL, NULL, b'1', 1, 11, 1),
(62, '', '2024-06-26 15:36:42.351888', '', NULL, NULL, b'1', 2, 11, 1),
(63, '', '2024-06-26 15:36:42.354892', '', NULL, NULL, b'1', 3, 11, 1),
(64, '', '2024-06-26 15:36:42.358892', '', NULL, NULL, b'1', 4, 11, 1),
(65, '', '2024-06-26 15:36:42.362889', '', NULL, NULL, b'1', 5, 11, 1),
(66, '', '2024-06-26 15:36:42.365896', '', NULL, NULL, b'1', 6, 11, 1),
(67, '', '2024-06-26 15:36:42.368938', '', NULL, NULL, b'1', 1, 12, 1),
(68, '', '2024-06-26 15:36:42.373893', '', NULL, NULL, b'1', 2, 12, 1),
(69, '', '2024-06-26 15:36:42.377901', '', NULL, NULL, b'1', 3, 12, 1),
(70, '', '2024-06-26 15:36:42.380887', '', NULL, NULL, b'1', 4, 12, 1),
(71, '', '2024-06-26 15:36:42.384887', '', NULL, NULL, b'1', 5, 12, 1),
(72, '', '2024-06-26 15:36:42.387887', '', NULL, NULL, b'1', 6, 12, 1),
(73, '', '2024-06-26 15:36:42.390892', '', NULL, NULL, b'1', 1, 13, 1),
(74, '', '2024-06-26 15:36:42.394887', '', NULL, NULL, b'1', 2, 13, 1),
(75, '', '2024-06-26 15:36:42.398890', '', NULL, NULL, b'1', 3, 13, 1),
(76, '', '2024-06-26 15:36:42.401887', '', NULL, NULL, b'1', 4, 13, 1),
(77, '', '2024-06-26 15:36:42.403892', '', NULL, NULL, b'1', 5, 13, 1),
(78, '', '2024-06-26 15:36:42.407909', '', NULL, NULL, b'1', 6, 13, 1),
(79, '', '2024-06-26 15:36:42.410890', '', NULL, NULL, b'1', 1, 14, 1),
(80, '', '2024-06-26 15:36:42.413889', '', NULL, NULL, b'1', 2, 14, 1),
(81, '', '2024-06-26 15:36:42.416888', '', NULL, NULL, b'1', 3, 14, 1),
(82, '', '2024-06-26 15:36:42.419888', '', NULL, NULL, b'1', 4, 14, 1),
(83, '', '2024-06-26 15:36:42.421887', '', NULL, NULL, b'1', 5, 14, 1),
(84, '', '2024-06-26 15:36:42.424887', '', NULL, NULL, b'1', 6, 14, 1),
(85, '', '2024-06-26 15:36:42.427886', '', NULL, NULL, b'1', 1, 15, 1),
(86, '', '2024-06-26 15:36:42.429886', '', NULL, NULL, b'1', 2, 15, 1),
(87, '', '2024-06-26 15:36:42.432886', '', NULL, NULL, b'1', 3, 15, 1),
(88, '', '2024-06-26 15:36:42.435885', '', NULL, NULL, b'1', 4, 15, 1),
(89, '', '2024-06-26 15:36:42.438886', '', NULL, NULL, b'1', 5, 15, 1),
(90, '', '2024-06-26 15:36:42.440886', '', NULL, NULL, b'1', 6, 15, 1),
(91, '', '2024-06-26 15:36:42.442887', '', NULL, NULL, b'1', 1, 16, 1),
(92, '', '2024-06-26 15:36:42.445886', '', NULL, NULL, b'1', 2, 16, 1),
(93, '', '2024-06-26 15:36:42.447887', '', NULL, NULL, b'1', 3, 16, 1),
(94, '', '2024-06-26 15:36:42.449887', '', NULL, NULL, b'1', 4, 16, 1),
(95, '', '2024-06-26 15:36:42.452887', '', NULL, NULL, b'1', 5, 16, 1),
(96, '', '2024-06-26 15:36:42.454887', '', NULL, NULL, b'1', 6, 16, 1),
(97, '', '2024-06-26 15:36:42.456886', '', NULL, NULL, b'1', 1, 17, 1),
(98, '', '2024-06-26 15:36:42.459886', '', NULL, NULL, b'1', 2, 17, 1),
(99, '', '2024-06-26 15:36:42.461888', '', NULL, NULL, b'1', 3, 17, 1),
(100, '', '2024-06-26 15:36:42.464888', '', NULL, NULL, b'1', 4, 17, 1),
(101, '', '2024-06-26 15:36:42.467888', '', NULL, NULL, b'1', 5, 17, 1),
(102, '', '2024-06-26 15:36:42.469886', '', NULL, NULL, b'1', 6, 17, 1),
(103, '', '2024-06-26 15:36:42.471888', '', NULL, NULL, b'1', 1, 18, 1),
(104, '', '2024-06-26 15:36:42.475887', '', NULL, NULL, b'1', 2, 18, 1),
(105, '', '2024-06-26 15:36:42.477887', '', NULL, NULL, b'1', 3, 18, 1),
(106, '', '2024-06-26 15:36:42.480886', '', NULL, NULL, b'1', 4, 18, 1),
(107, '', '2024-06-26 15:36:42.482888', '', NULL, NULL, b'1', 5, 18, 1),
(108, '', '2024-06-26 15:36:42.485887', '', NULL, NULL, b'1', 6, 18, 1),
(109, '', '2024-06-26 15:36:42.487886', '', NULL, NULL, b'1', 1, 19, 1),
(110, '', '2024-06-26 15:36:42.490888', '', NULL, NULL, b'1', 2, 19, 1),
(111, '', '2024-06-26 15:36:42.492886', '', NULL, NULL, b'1', 3, 19, 1),
(112, '', '2024-06-26 15:36:42.494888', '', NULL, NULL, b'1', 4, 19, 1),
(113, '', '2024-06-26 15:36:42.496889', '', NULL, NULL, b'1', 5, 19, 1),
(114, '', '2024-06-26 15:36:42.499890', '', NULL, NULL, b'1', 6, 19, 1),
(115, '', '2024-06-26 15:36:42.501889', '', NULL, NULL, b'1', 1, 20, 1),
(116, '', '2024-06-26 15:36:42.503889', '', NULL, NULL, b'1', 2, 20, 1),
(117, '', '2024-06-26 15:36:42.506890', '', NULL, NULL, b'1', 3, 20, 1),
(118, '', '2024-06-26 15:36:42.508888', '', NULL, NULL, b'1', 4, 20, 1),
(119, '', '2024-06-26 15:36:42.510890', '', NULL, NULL, b'1', 5, 20, 1),
(120, '', '2024-06-26 15:36:42.513894', '', NULL, NULL, b'1', 6, 20, 1),
(121, '', '2024-06-26 15:36:42.516885', '', NULL, NULL, b'1', 1, 21, 1),
(122, '', '2024-06-26 15:36:42.518892', '', NULL, NULL, b'1', 2, 21, 1),
(123, '', '2024-06-26 15:36:42.521889', '', NULL, NULL, b'1', 3, 21, 1),
(124, '', '2024-06-26 15:36:42.524887', '', NULL, NULL, b'1', 4, 21, 1),
(125, '', '2024-06-26 15:36:42.526887', '', NULL, NULL, b'1', 5, 21, 1),
(126, '', '2024-06-26 15:36:42.528888', '', NULL, NULL, b'1', 6, 21, 1),
(127, '', '2024-06-26 15:36:42.531896', '', NULL, NULL, b'1', 1, 22, 1),
(128, '', '2024-06-26 15:36:42.534890', '', NULL, NULL, b'1', 2, 22, 1),
(129, '', '2024-06-26 15:36:42.536889', '', NULL, NULL, b'1', 3, 22, 1),
(130, '', '2024-06-26 15:36:42.539905', '', NULL, NULL, b'1', 4, 22, 1),
(131, '', '2024-06-26 15:36:42.542886', '', NULL, NULL, b'1', 5, 22, 1),
(132, '', '2024-06-26 15:36:42.544886', '', NULL, NULL, b'1', 6, 22, 1),
(133, '', '2024-06-26 15:36:42.547892', '', NULL, NULL, b'1', 1, 23, 1),
(134, '', '2024-06-26 15:36:42.550888', '', NULL, NULL, b'1', 2, 23, 1),
(135, '', '2024-06-26 15:36:42.552888', '', NULL, NULL, b'1', 3, 23, 1),
(136, '', '2024-06-26 15:36:42.555890', '', NULL, NULL, b'1', 4, 23, 1),
(137, '', '2024-06-26 15:36:42.558891', '', NULL, NULL, b'1', 5, 23, 1),
(138, '', '2024-06-26 15:36:42.561888', '', NULL, NULL, b'1', 6, 23, 1),
(139, '', '2024-06-26 15:36:42.563888', '', NULL, NULL, b'1', 1, 24, 1),
(140, '', '2024-06-26 15:36:42.567887', '', NULL, NULL, b'1', 2, 24, 1),
(141, '', '2024-06-26 15:36:42.570888', '', NULL, NULL, b'1', 3, 24, 1),
(142, '', '2024-06-26 15:36:42.573895', '', NULL, NULL, b'1', 4, 24, 1),
(143, '', '2024-06-26 15:36:42.575888', '', NULL, NULL, b'1', 5, 24, 1),
(144, '', '2024-06-26 15:36:42.578888', '', NULL, NULL, b'1', 6, 24, 1),
(145, '', '2024-06-26 15:36:42.581896', '', NULL, NULL, b'1', 1, 25, 1),
(146, '', '2024-06-26 15:36:42.584885', '', NULL, NULL, b'1', 2, 25, 1),
(147, '', '2024-06-26 15:36:42.586888', '', NULL, NULL, b'1', 3, 25, 1),
(148, '', '2024-06-26 15:36:42.589896', '', NULL, NULL, b'1', 4, 25, 1),
(149, '', '2024-06-26 15:36:42.591888', '', NULL, NULL, b'1', 5, 25, 1),
(150, '', '2024-06-26 15:36:42.594888', '', NULL, NULL, b'1', 6, 25, 1),
(151, '', '2024-06-26 15:36:42.596886', '', NULL, NULL, b'1', 1, 26, 1),
(152, '', '2024-06-26 15:36:42.599890', '', NULL, NULL, b'1', 2, 26, 1),
(153, '', '2024-06-26 15:36:42.601887', '', NULL, NULL, b'1', 3, 26, 1),
(154, '', '2024-06-26 15:36:42.604893', '', NULL, NULL, b'1', 4, 26, 1),
(155, '', '2024-06-26 15:36:42.608888', '', NULL, NULL, b'1', 5, 26, 1),
(156, '', '2024-06-26 15:36:42.610889', '', NULL, NULL, b'1', 6, 26, 1),
(157, '', '2024-06-26 15:36:42.612888', '', NULL, NULL, b'1', 1, 27, 1),
(158, '', '2024-06-26 15:36:42.615905', '', NULL, NULL, b'1', 2, 27, 1),
(159, '', '2024-06-26 15:36:42.617907', '', NULL, NULL, b'1', 3, 27, 1),
(160, '', '2024-06-26 15:36:42.619907', '', NULL, NULL, b'1', 4, 27, 1),
(161, '', '2024-06-26 15:36:42.621909', '', NULL, NULL, b'1', 5, 27, 1),
(162, '', '2024-06-26 15:36:42.624887', '', NULL, NULL, b'1', 6, 27, 1),
(163, '', '2024-06-26 15:36:42.627887', '', NULL, NULL, b'1', 1, 28, 1),
(164, '', '2024-06-26 15:36:42.630888', '', NULL, NULL, b'1', 2, 28, 1),
(165, '', '2024-06-26 15:36:42.633887', '', NULL, NULL, b'1', 3, 28, 1),
(166, '', '2024-06-26 15:36:42.635890', '', NULL, NULL, b'1', 4, 28, 1),
(167, '', '2024-06-26 15:36:42.638889', '', NULL, NULL, b'1', 5, 28, 1),
(168, '', '2024-06-26 15:36:42.640886', '', NULL, NULL, b'1', 6, 28, 1),
(169, '', '2024-06-26 15:36:42.642910', '', NULL, NULL, b'1', 1, 29, 1),
(170, '', '2024-06-26 15:36:42.645911', '', NULL, NULL, b'1', 2, 29, 1),
(171, '', '2024-06-26 15:36:42.650902', '', NULL, NULL, b'1', 3, 29, 1),
(172, '', '2024-06-26 15:36:42.655902', '', NULL, NULL, b'1', 4, 29, 1),
(173, '', '2024-06-26 15:36:42.661896', '', NULL, NULL, b'1', 5, 29, 1),
(174, '', '2024-06-26 15:36:42.666900', '', NULL, NULL, b'1', 6, 29, 1),
(175, '', '2024-06-26 15:36:42.672909', '', NULL, NULL, b'1', 1, 30, 1),
(176, '', '2024-06-26 15:36:42.678912', '', NULL, NULL, b'1', 2, 30, 1),
(177, '', '2024-06-26 15:36:42.682890', '', NULL, NULL, b'1', 3, 30, 1),
(178, '', '2024-06-26 15:36:42.686895', '', NULL, NULL, b'1', 4, 30, 1),
(179, '', '2024-06-26 15:36:42.689909', '', NULL, NULL, b'1', 5, 30, 1),
(180, '', '2024-06-26 15:36:42.693903', '', NULL, NULL, b'1', 6, 30, 1),
(181, '', '2024-06-26 15:36:42.696898', '', NULL, NULL, b'1', 1, 31, 1),
(182, '', '2024-06-26 15:36:42.700891', '', NULL, NULL, b'1', 2, 31, 1),
(183, '', '2024-06-26 15:36:42.704900', '', NULL, NULL, b'1', 3, 31, 1),
(184, '', '2024-06-26 15:36:42.708890', '', NULL, NULL, b'1', 4, 31, 1),
(185, '', '2024-06-26 15:36:42.712891', '', NULL, NULL, b'1', 5, 31, 1),
(186, '', '2024-06-26 15:36:42.715886', '', NULL, NULL, b'1', 6, 31, 1),
(187, '', '2024-06-26 15:36:42.718889', '', NULL, NULL, b'1', 1, 32, 1),
(188, '', '2024-06-26 15:36:42.721889', '', NULL, NULL, b'1', 2, 32, 1),
(189, '', '2024-06-26 15:36:42.723889', '', NULL, NULL, b'1', 3, 32, 1),
(190, '', '2024-06-26 15:36:42.726895', '', NULL, NULL, b'1', 4, 32, 1),
(191, '', '2024-06-26 15:36:42.728892', '', NULL, NULL, b'1', 5, 32, 1),
(192, '', '2024-06-26 15:36:42.731887', '', NULL, NULL, b'1', 6, 32, 1),
(193, '', '2024-06-26 15:36:42.733889', '', NULL, NULL, b'1', 1, 33, 1),
(194, '', '2024-06-26 15:36:42.736887', '', NULL, NULL, b'1', 2, 33, 1),
(195, '', '2024-06-26 15:36:42.739890', '', NULL, NULL, b'1', 3, 33, 1),
(196, '', '2024-06-26 15:36:42.742886', '', NULL, NULL, b'1', 4, 33, 1),
(197, '', '2024-06-26 15:36:42.745885', '', NULL, NULL, b'1', 5, 33, 1),
(198, '', '2024-06-26 15:36:42.747888', '', NULL, NULL, b'1', 6, 33, 1),
(199, '', '2024-06-26 15:36:42.750892', '', NULL, NULL, b'1', 1, 34, 1),
(200, '', '2024-06-26 15:36:42.752887', '', NULL, NULL, b'1', 2, 34, 1),
(201, '', '2024-06-26 15:36:42.755891', '', NULL, NULL, b'1', 3, 34, 1),
(202, '', '2024-06-26 15:36:42.758889', '', NULL, NULL, b'1', 4, 34, 1),
(203, '', '2024-06-26 15:36:42.760888', '', NULL, NULL, b'1', 5, 34, 1),
(204, '', '2024-06-26 15:36:42.762888', '', NULL, NULL, b'1', 6, 34, 1),
(205, '', '2024-06-26 15:36:42.765897', '', NULL, NULL, b'1', 1, 35, 1),
(206, '', '2024-06-26 15:36:42.767890', '', NULL, NULL, b'1', 2, 35, 1),
(207, '', '2024-06-26 15:36:42.769887', '', NULL, NULL, b'1', 3, 35, 1),
(208, '', '2024-06-26 15:36:42.772889', '', NULL, NULL, b'1', 4, 35, 1),
(209, '', '2024-06-26 15:36:42.775887', '', NULL, NULL, b'1', 5, 35, 1),
(210, '', '2024-06-26 15:36:42.776887', '', NULL, NULL, b'1', 6, 35, 1),
(211, '', '2024-06-26 15:36:42.779890', '', NULL, NULL, b'1', 1, 36, 1),
(212, '', '2024-06-26 15:36:42.782889', '', NULL, NULL, b'1', 2, 36, 1),
(213, '', '2024-06-26 15:36:42.784887', '', NULL, NULL, b'1', 3, 36, 1),
(214, '', '2024-06-26 15:36:42.786894', '', NULL, NULL, b'1', 4, 36, 1),
(215, '', '2024-06-26 15:36:42.788890', '', NULL, NULL, b'1', 5, 36, 1),
(216, '', '2024-06-26 15:36:42.791887', '', NULL, NULL, b'1', 6, 36, 1),
(217, '', '2024-06-26 15:36:42.794890', '', NULL, NULL, b'1', 1, 37, 1),
(218, '', '2024-06-26 15:36:42.797893', '', NULL, NULL, b'1', 2, 37, 1),
(219, '', '2024-06-26 15:36:42.801890', '', NULL, NULL, b'1', 3, 37, 1),
(220, '', '2024-06-26 15:36:42.803886', '', NULL, NULL, b'1', 4, 37, 1),
(221, '', '2024-06-26 15:36:42.806890', '', NULL, NULL, b'1', 5, 37, 1),
(222, '', '2024-06-26 15:36:42.809888', '', NULL, NULL, b'1', 6, 37, 1),
(223, '', '2024-06-26 15:36:42.811889', '', NULL, NULL, b'1', 1, 38, 1),
(224, '', '2024-06-26 15:36:42.813888', '', NULL, NULL, b'1', 2, 38, 1),
(225, '', '2024-06-26 15:36:42.816887', '', NULL, NULL, b'1', 3, 38, 1),
(226, '', '2024-06-26 15:36:42.818888', '', NULL, NULL, b'1', 4, 38, 1),
(227, '', '2024-06-26 15:36:42.821888', '', NULL, NULL, b'1', 5, 38, 1),
(228, '', '2024-06-26 15:36:42.824890', '', NULL, NULL, b'1', 6, 38, 1),
(229, '', '2024-06-26 15:36:42.827886', '', NULL, NULL, b'1', 1, 39, 1),
(230, '', '2024-06-26 15:36:42.829885', '', NULL, NULL, b'1', 2, 39, 1),
(231, '', '2024-06-26 15:36:42.831888', '', NULL, NULL, b'1', 3, 39, 1),
(232, '', '2024-06-26 15:36:42.833910', '', NULL, NULL, b'1', 4, 39, 1),
(233, '', '2024-06-26 15:36:42.835908', '', NULL, NULL, b'1', 5, 39, 1),
(234, '', '2024-06-26 15:36:42.837899', '', NULL, NULL, b'1', 6, 39, 1),
(235, '', '2024-06-26 15:36:42.839917', '', NULL, NULL, b'1', 1, 40, 1),
(236, '', '2024-06-26 15:36:42.841888', '', NULL, NULL, b'1', 2, 40, 1),
(237, '', '2024-06-26 15:36:42.843889', '', NULL, NULL, b'1', 3, 40, 1),
(238, '', '2024-06-26 15:36:42.845891', '', NULL, NULL, b'1', 4, 40, 1),
(239, '', '2024-06-26 15:36:42.847888', '', NULL, NULL, b'1', 5, 40, 1),
(240, '', '2024-06-26 15:36:42.849908', '', NULL, NULL, b'1', 6, 40, 1),
(241, '', '2024-06-26 15:36:42.851887', '', NULL, NULL, b'1', 1, 41, 1),
(242, '', '2024-06-26 15:36:42.853898', '', NULL, NULL, b'1', 2, 41, 1),
(243, '', '2024-06-26 15:36:42.855923', '', NULL, NULL, b'1', 3, 41, 1),
(244, '', '2024-06-26 15:36:42.857915', '', NULL, NULL, b'1', 4, 41, 1),
(245, '', '2024-06-26 15:36:42.859908', '', NULL, NULL, b'1', 5, 41, 1),
(246, '', '2024-06-26 15:36:42.861917', '', NULL, NULL, b'1', 6, 41, 1),
(247, '', '2024-06-26 15:36:42.863885', '', NULL, NULL, b'1', 1, 42, 1),
(248, '', '2024-06-26 15:36:42.865886', '', NULL, NULL, b'1', 2, 42, 1),
(249, '', '2024-06-26 15:36:42.867886', '', NULL, NULL, b'1', 3, 42, 1),
(250, '', '2024-06-26 15:36:42.869907', '', NULL, NULL, b'1', 4, 42, 1),
(251, '', '2024-06-26 15:36:42.871907', '', NULL, NULL, b'1', 5, 42, 1),
(252, '', '2024-06-26 15:36:42.873908', '', NULL, NULL, b'1', 6, 42, 1),
(253, '', '2024-06-26 15:36:42.875908', '', NULL, NULL, b'1', 1, 43, 1),
(254, '', '2024-06-26 15:36:42.877909', '', NULL, NULL, b'1', 2, 43, 1),
(255, '', '2024-06-26 15:36:42.879907', '', NULL, NULL, b'1', 3, 43, 1),
(256, '', '2024-06-26 15:36:42.881907', '', NULL, NULL, b'1', 4, 43, 1),
(257, '', '2024-06-26 15:36:42.883908', '', NULL, NULL, b'1', 5, 43, 1),
(258, '', '2024-06-26 15:36:42.885911', '', NULL, NULL, b'1', 6, 43, 1),
(259, '', '2024-06-26 15:36:42.887910', '', NULL, NULL, b'1', 1, 44, 1),
(260, '', '2024-06-26 15:36:42.889888', '', NULL, NULL, b'1', 2, 44, 1),
(261, '', '2024-06-26 15:36:42.891887', '', NULL, NULL, b'1', 3, 44, 1),
(262, '', '2024-06-26 15:36:42.893908', '', NULL, NULL, b'1', 4, 44, 1),
(263, '', '2024-06-26 15:36:42.895908', '', NULL, NULL, b'1', 5, 44, 1),
(264, '', '2024-06-26 15:36:42.897925', '', NULL, NULL, b'1', 6, 44, 1),
(265, '', '2024-06-26 15:36:42.899887', '', NULL, NULL, b'1', 1, 45, 1),
(266, '', '2024-06-26 15:36:42.901889', '', NULL, NULL, b'1', 2, 45, 1),
(267, '', '2024-06-26 15:36:42.903890', '', NULL, NULL, b'1', 3, 45, 1),
(268, '', '2024-06-26 15:36:42.906889', '', NULL, NULL, b'1', 4, 45, 1),
(269, '', '2024-06-26 15:36:42.908889', '', NULL, NULL, b'1', 5, 45, 1),
(270, '', '2024-06-26 15:36:42.910886', '', NULL, NULL, b'1', 6, 45, 1),
(271, '', '2024-06-26 15:36:42.912926', '', NULL, NULL, b'1', 1, 46, 1),
(272, '', '2024-06-26 15:36:42.914889', '', NULL, NULL, b'1', 2, 46, 1),
(273, '', '2024-06-26 15:36:42.917887', '', NULL, NULL, b'1', 3, 46, 1),
(274, '', '2024-06-26 15:36:42.919927', '', NULL, NULL, b'1', 4, 46, 1),
(275, '', '2024-06-26 15:36:42.922890', '', NULL, NULL, b'1', 5, 46, 1),
(276, '', '2024-06-26 15:36:42.925886', '', NULL, NULL, b'1', 6, 46, 1),
(277, '', '2024-06-26 15:36:42.927927', '', NULL, NULL, b'1', 1, 47, 1),
(278, '', '2024-06-26 15:36:42.930888', '', NULL, NULL, b'1', 2, 47, 1),
(279, '', '2024-06-26 15:36:42.933892', '', NULL, NULL, b'1', 3, 47, 1),
(280, '', '2024-06-26 15:36:42.936890', '', NULL, NULL, b'1', 4, 47, 1),
(281, '', '2024-06-26 15:36:42.938892', '', NULL, NULL, b'1', 5, 47, 1),
(282, '', '2024-06-26 15:36:42.941932', '', NULL, NULL, b'1', 6, 47, 1),
(283, '', '2024-06-26 15:36:42.944892', '', NULL, NULL, b'1', 1, 48, 1),
(284, '', '2024-06-26 15:36:42.947896', '', NULL, NULL, b'1', 2, 48, 1),
(285, '', '2024-06-26 15:36:42.950889', '', NULL, NULL, b'1', 3, 48, 1),
(286, '', '2024-06-26 15:36:42.952889', '', NULL, NULL, b'1', 4, 48, 1),
(287, '', '2024-06-26 15:36:42.954899', '', NULL, NULL, b'1', 5, 48, 1),
(288, '', '2024-06-26 15:36:42.957932', '', NULL, NULL, b'1', 6, 48, 1),
(289, '', '2024-06-26 15:36:42.960927', '', NULL, NULL, b'1', 1, 49, 1),
(290, '', '2024-06-26 15:36:42.963899', '', NULL, NULL, b'1', 2, 49, 1),
(291, '', '2024-06-26 15:36:42.966889', '', NULL, NULL, b'1', 3, 49, 1),
(292, '', '2024-06-26 15:36:42.969891', '', NULL, NULL, b'1', 4, 49, 1),
(293, '', '2024-06-26 15:36:42.972898', '', NULL, NULL, b'1', 5, 49, 1),
(294, '', '2024-06-26 15:36:42.975889', '', NULL, NULL, b'1', 6, 49, 1),
(295, '', '2024-06-26 15:36:42.978890', '', NULL, NULL, b'1', 1, 50, 1),
(296, '', '2024-06-26 15:36:42.980890', '', NULL, NULL, b'1', 2, 50, 1),
(297, '', '2024-06-26 15:36:42.983894', '', NULL, NULL, b'1', 3, 50, 1),
(298, '', '2024-06-26 15:36:42.985929', '', NULL, NULL, b'1', 4, 50, 1),
(299, '', '2024-06-26 15:36:42.988886', '', NULL, NULL, b'1', 5, 50, 1),
(300, '', '2024-06-26 15:36:42.991891', '', NULL, NULL, b'1', 6, 50, 1),
(301, '', '2024-06-26 15:36:42.993926', '', NULL, NULL, b'1', 1, 51, 1),
(302, '', '2024-06-26 15:36:42.995935', '', NULL, NULL, b'1', 2, 51, 1),
(303, '', '2024-06-26 15:36:42.999890', '', NULL, NULL, b'1', 3, 51, 1),
(304, '', '2024-06-26 15:36:43.001888', '', NULL, NULL, b'1', 4, 51, 1),
(305, '', '2024-06-26 15:36:43.003927', '', NULL, NULL, b'1', 5, 51, 1),
(306, '', '2024-06-26 15:36:43.006893', '', NULL, NULL, b'1', 6, 51, 1),
(307, '', '2024-06-26 15:36:43.009924', '', NULL, NULL, b'1', 1, 52, 1),
(308, '', '2024-06-26 15:36:43.011927', '', NULL, NULL, b'1', 2, 52, 1),
(309, '', '2024-06-26 15:36:43.014887', '', NULL, NULL, b'1', 3, 52, 1),
(310, '', '2024-06-26 15:36:43.017885', '', NULL, NULL, b'1', 4, 52, 1),
(311, '', '2024-06-26 15:36:43.020154', '', NULL, NULL, b'1', 5, 52, 1),
(312, '', '2024-06-26 15:36:43.029888', '', NULL, NULL, b'1', 6, 52, 1),
(313, '', '2024-06-26 15:36:43.031943', '', NULL, NULL, b'1', 1, 53, 1),
(314, '', '2024-06-26 15:36:43.033992', '', NULL, NULL, b'1', 2, 53, 1),
(315, '', '2024-06-26 15:36:43.035925', '', NULL, NULL, b'1', 3, 53, 1),
(316, '', '2024-06-26 15:36:43.038889', '', NULL, NULL, b'1', 4, 53, 1),
(317, '', '2024-06-26 15:36:43.040999', '', NULL, NULL, b'1', 5, 53, 1),
(318, '', '2024-06-26 15:36:43.043917', '', NULL, NULL, b'1', 6, 53, 1),
(319, '', '2024-06-26 15:36:43.048913', '', NULL, NULL, b'1', 1, 54, 1),
(320, '', '2024-06-26 15:36:43.053898', '', NULL, NULL, b'1', 2, 54, 1),
(321, '', '2024-06-26 15:36:43.058917', '', NULL, NULL, b'1', 3, 54, 1),
(322, '', '2024-06-26 15:36:43.064900', '', NULL, NULL, b'1', 4, 54, 1),
(323, '', '2024-06-26 15:36:43.071903', '', NULL, NULL, b'1', 5, 54, 1),
(324, '', '2024-06-26 15:36:43.076897', '', NULL, NULL, b'1', 6, 54, 1),
(325, '', '2024-06-26 15:36:43.081893', '', NULL, NULL, b'1', 1, 55, 1),
(326, '', '2024-06-26 15:36:43.085893', '', NULL, NULL, b'1', 2, 55, 1),
(327, '', '2024-06-26 15:36:43.089995', '', NULL, NULL, b'1', 3, 55, 1),
(328, '', '2024-06-26 15:36:43.093894', '', NULL, NULL, b'1', 4, 55, 1),
(329, '', '2024-06-26 15:36:43.097895', '', NULL, NULL, b'1', 5, 55, 1),
(330, '', '2024-06-26 15:36:43.101891', '', NULL, NULL, b'1', 6, 55, 1),
(331, '', '2024-06-26 15:36:43.105938', '', NULL, NULL, b'1', 1, 56, 1),
(332, '', '2024-06-26 15:36:43.109891', '', NULL, NULL, b'1', 2, 56, 1),
(333, '', '2024-06-26 15:36:43.113945', '', NULL, NULL, b'1', 3, 56, 1),
(334, '', '2024-06-26 15:36:43.117896', '', NULL, NULL, b'1', 4, 56, 1),
(335, '', '2024-06-26 15:36:43.121897', '', NULL, NULL, b'1', 5, 56, 1),
(336, '', '2024-06-26 15:36:43.125897', '', NULL, NULL, b'1', 6, 56, 1),
(337, '', '2024-06-26 15:36:43.128894', '', NULL, NULL, b'1', 1, 57, 1),
(338, '', '2024-06-26 15:36:43.131888', '', NULL, NULL, b'1', 2, 57, 1),
(339, '', '2024-06-26 15:36:43.134889', '', NULL, NULL, b'1', 3, 57, 1),
(340, '', '2024-06-26 15:36:43.137889', '', NULL, NULL, b'1', 4, 57, 1),
(341, '', '2024-06-26 15:36:43.141891', '', NULL, NULL, b'1', 5, 57, 1),
(342, '', '2024-06-26 15:36:43.143891', '', NULL, NULL, b'1', 6, 57, 1),
(343, '', '2024-06-26 15:36:43.146889', '', NULL, NULL, b'1', 1, 58, 1),
(344, '', '2024-06-26 15:36:43.149892', '', NULL, NULL, b'1', 2, 58, 1),
(345, '', '2024-06-26 15:36:43.151924', '', NULL, NULL, b'1', 3, 58, 1),
(346, '', '2024-06-26 15:36:43.154888', '', NULL, NULL, b'1', 4, 58, 1),
(347, '', '2024-06-26 15:36:43.157887', '', NULL, NULL, b'1', 5, 58, 1),
(348, '', '2024-06-26 15:36:43.159887', '', NULL, NULL, b'1', 6, 58, 1),
(349, '', '2024-06-26 15:36:43.162886', '', NULL, NULL, b'1', 1, 59, 1),
(350, '', '2024-06-26 15:36:43.164887', '', NULL, NULL, b'1', 2, 59, 1),
(351, '', '2024-06-26 15:36:43.167887', '', NULL, NULL, b'1', 3, 59, 1),
(352, '', '2024-06-26 15:36:43.169887', '', NULL, NULL, b'1', 4, 59, 1),
(353, '', '2024-06-26 15:36:43.172888', '', NULL, NULL, b'1', 5, 59, 1),
(354, '', '2024-06-26 15:36:43.174888', '', NULL, NULL, b'1', 6, 59, 1),
(355, '', '2024-06-26 15:36:43.177887', '', NULL, NULL, b'1', 1, 60, 1),
(356, '', '2024-06-26 15:36:43.179887', '', NULL, NULL, b'1', 2, 60, 1),
(357, '', '2024-06-26 15:36:43.181895', '', NULL, NULL, b'1', 3, 60, 1),
(358, '', '2024-06-26 15:36:43.184889', '', NULL, NULL, b'1', 4, 60, 1),
(359, '', '2024-06-26 15:36:43.186887', '', NULL, NULL, b'1', 5, 60, 1),
(360, '', '2024-06-26 15:36:43.188893', '', NULL, NULL, b'1', 6, 60, 1),
(361, '', '2024-06-26 15:36:43.191887', '', NULL, NULL, b'1', 1, 61, 1),
(362, '', '2024-06-26 15:36:43.193888', '', NULL, NULL, b'1', 2, 61, 1),
(363, '', '2024-06-26 15:36:43.195888', '', NULL, NULL, b'1', 3, 61, 1),
(364, '', '2024-06-26 15:36:43.198899', '', NULL, NULL, b'1', 4, 61, 1),
(365, '', '2024-06-26 15:36:43.200887', '', NULL, NULL, b'1', 5, 61, 1),
(366, '', '2024-06-26 15:36:43.203887', '', NULL, NULL, b'1', 6, 61, 1),
(367, '', '2024-06-26 15:36:43.205890', '', NULL, NULL, b'1', 1, 62, 1),
(368, '', '2024-06-26 15:36:43.208888', '', NULL, NULL, b'1', 2, 62, 1),
(369, '', '2024-06-26 15:36:43.210887', '', NULL, NULL, b'1', 3, 62, 1),
(370, '', '2024-06-26 15:36:43.213886', '', NULL, NULL, b'1', 4, 62, 1),
(371, '', '2024-06-26 15:36:43.215891', '', NULL, NULL, b'1', 5, 62, 1),
(372, '', '2024-06-26 15:36:43.217887', '', NULL, NULL, b'1', 6, 62, 1),
(373, '', '2024-06-26 15:36:43.220890', '', NULL, NULL, b'1', 1, 63, 1),
(374, '', '2024-06-26 15:36:43.223886', '', NULL, NULL, b'1', 2, 63, 1),
(375, '', '2024-06-26 15:36:43.225886', '', NULL, NULL, b'1', 3, 63, 1),
(376, '', '2024-06-26 15:36:43.228888', '', NULL, NULL, b'1', 4, 63, 1),
(377, '', '2024-06-26 15:36:43.230891', '', NULL, NULL, b'1', 5, 63, 1),
(378, '', '2024-06-26 15:36:43.233887', '', NULL, NULL, b'1', 6, 63, 1),
(379, '', '2024-06-26 15:36:43.235889', '', NULL, NULL, b'1', 1, 64, 1),
(380, '', '2024-06-26 15:36:43.238887', '', NULL, NULL, b'1', 2, 64, 1),
(381, '', '2024-06-26 15:36:43.241888', '', NULL, NULL, b'1', 3, 64, 1),
(382, '', '2024-06-26 15:36:43.243909', '', NULL, NULL, b'1', 4, 64, 1),
(383, '', '2024-06-26 15:36:43.246908', '', NULL, NULL, b'1', 5, 64, 1),
(384, '', '2024-06-26 15:36:43.251902', '', NULL, NULL, b'1', 6, 64, 1),
(385, '', '2024-06-26 15:36:43.256892', '', NULL, NULL, b'1', 1, 65, 1),
(386, '', '2024-06-26 15:36:43.262903', '', NULL, NULL, b'1', 2, 65, 1),
(387, '', '2024-06-26 15:36:43.267909', '', NULL, NULL, b'1', 3, 65, 1),
(388, '', '2024-06-26 15:36:43.272908', '', NULL, NULL, b'1', 4, 65, 1),
(389, '', '2024-06-26 15:36:43.278897', '', NULL, NULL, b'1', 5, 65, 1),
(390, '', '2024-06-26 15:36:43.283901', '', NULL, NULL, b'1', 6, 65, 1),
(391, '', '2024-06-26 15:36:43.288891', '', NULL, NULL, b'1', 1, 66, 1),
(392, '', '2024-06-26 15:36:43.292906', '', NULL, NULL, b'1', 2, 66, 1),
(393, '', '2024-06-26 15:36:43.296900', '', NULL, NULL, b'1', 3, 66, 1),
(394, '', '2024-06-26 15:36:43.299897', '', NULL, NULL, b'1', 4, 66, 1),
(395, '', '2024-06-26 15:36:43.303892', '', NULL, NULL, b'1', 5, 66, 1),
(396, '', '2024-06-26 15:36:43.306897', '', NULL, NULL, b'1', 6, 66, 1),
(397, '', '2024-06-26 15:36:43.309891', '', NULL, NULL, b'1', 1, 67, 1),
(398, '', '2024-06-26 15:36:43.312889', '', NULL, NULL, b'1', 2, 67, 1),
(399, '', '2024-06-26 15:36:43.314889', '', NULL, NULL, b'1', 3, 67, 1),
(400, '', '2024-06-26 15:36:43.317886', '', NULL, NULL, b'1', 4, 67, 1),
(401, '', '2024-06-26 15:36:43.319893', '', NULL, NULL, b'1', 5, 67, 1),
(402, '', '2024-06-26 15:36:43.321888', '', NULL, NULL, b'1', 6, 67, 1),
(403, '', '2024-06-26 15:36:43.324894', '', NULL, NULL, b'1', 1, 68, 1),
(404, '', '2024-06-26 15:36:43.326888', '', NULL, NULL, b'1', 2, 68, 1),
(405, '', '2024-06-26 15:36:43.328888', '', NULL, NULL, b'1', 3, 68, 1),
(406, '', '2024-06-26 15:36:43.330889', '', NULL, NULL, b'1', 4, 68, 1),
(407, '', '2024-06-26 15:36:43.333886', '', NULL, NULL, b'1', 5, 68, 1),
(408, '', '2024-06-26 15:36:43.335887', '', NULL, NULL, b'1', 6, 68, 1),
(409, '', '2024-06-26 15:36:43.337886', '', NULL, NULL, b'1', 1, 69, 1),
(410, '', '2024-06-26 15:36:43.340889', '', NULL, NULL, b'1', 2, 69, 1),
(411, '', '2024-06-26 15:36:43.342888', '', NULL, NULL, b'1', 3, 69, 1),
(412, '', '2024-06-26 15:36:43.344887', '', NULL, NULL, b'1', 4, 69, 1),
(413, '', '2024-06-26 15:36:43.347890', '', NULL, NULL, b'1', 5, 69, 1),
(414, '', '2024-06-26 15:36:43.349888', '', NULL, NULL, b'1', 6, 69, 1),
(415, '', '2024-06-26 15:36:43.351887', '', NULL, NULL, b'1', 1, 70, 1),
(416, '', '2024-06-26 15:36:43.354886', '', NULL, NULL, b'1', 2, 70, 1),
(417, '', '2024-06-26 15:36:43.356894', '', NULL, NULL, b'1', 3, 70, 1),
(418, '', '2024-06-26 15:36:43.358886', '', NULL, NULL, b'1', 4, 70, 1),
(419, '', '2024-06-26 15:36:43.361886', '', NULL, NULL, b'1', 5, 70, 1),
(420, '', '2024-06-26 15:36:43.364891', '', NULL, NULL, b'1', 6, 70, 1),
(421, '', '2024-06-26 15:36:43.366890', '', NULL, NULL, b'1', 1, 71, 1),
(422, '', '2024-06-26 15:36:43.369890', '', NULL, NULL, b'1', 2, 71, 1),
(423, '', '2024-06-26 15:36:43.371887', '', NULL, NULL, b'1', 3, 71, 1),
(424, '', '2024-06-26 15:36:43.374887', '', NULL, NULL, b'1', 4, 71, 1),
(425, '', '2024-06-26 15:36:43.376891', '', NULL, NULL, b'1', 5, 71, 1),
(426, '', '2024-06-26 15:36:43.378895', '', NULL, NULL, b'1', 6, 71, 1),
(427, '', '2024-06-26 15:36:43.381889', '', NULL, NULL, b'1', 1, 72, 1),
(428, '', '2024-06-26 15:36:43.383887', '', NULL, NULL, b'1', 2, 72, 1),
(429, '', '2024-06-26 15:36:43.386886', '', NULL, NULL, b'1', 3, 72, 1),
(430, '', '2024-06-26 15:36:43.388888', '', NULL, NULL, b'1', 4, 72, 1),
(431, '', '2024-06-26 15:36:43.391886', '', NULL, NULL, b'1', 5, 72, 1),
(432, '', '2024-06-26 15:36:43.393889', '', NULL, NULL, b'1', 6, 72, 1),
(433, '', '2024-06-26 15:36:43.395889', '', NULL, NULL, b'1', 1, 73, 1),
(434, '', '2024-06-26 15:36:43.397889', '', NULL, NULL, b'1', 2, 73, 1),
(435, '', '2024-06-26 15:36:43.399888', '', NULL, NULL, b'1', 3, 73, 1),
(436, '', '2024-06-26 15:36:43.402885', '', NULL, NULL, b'1', 4, 73, 1),
(437, '', '2024-06-26 15:36:43.404886', '', NULL, NULL, b'1', 5, 73, 1),
(438, '', '2024-06-26 15:36:43.407886', '', NULL, NULL, b'1', 6, 73, 1),
(439, '', '2024-06-26 15:36:43.409889', '', NULL, NULL, b'1', 1, 74, 1),
(440, '', '2024-06-26 15:36:43.411889', '', NULL, NULL, b'1', 2, 74, 1),
(441, '', '2024-06-26 15:36:43.413888', '', NULL, NULL, b'1', 3, 74, 1),
(442, '', '2024-06-26 15:36:43.416888', '', NULL, NULL, b'1', 4, 74, 1),
(443, '', '2024-06-26 15:36:43.418889', '', NULL, NULL, b'1', 5, 74, 1),
(444, '', '2024-06-26 15:36:43.420888', '', NULL, NULL, b'1', 6, 74, 1),
(445, '', '2024-06-26 15:36:43.423895', '', NULL, NULL, b'1', 1, 75, 1),
(446, '', '2024-06-26 15:36:43.425888', '', NULL, NULL, b'1', 2, 75, 1),
(447, '', '2024-06-26 15:36:43.427890', '', NULL, NULL, b'1', 3, 75, 1),
(448, '', '2024-06-26 15:36:43.430891', '', NULL, NULL, b'1', 4, 75, 1),
(449, '', '2024-06-26 15:36:43.432891', '', NULL, NULL, b'1', 5, 75, 1),
(450, '', '2024-06-26 15:36:43.437909', '', NULL, NULL, b'1', 6, 75, 1),
(451, '', '2024-06-26 15:36:43.440891', '', NULL, NULL, b'1', 1, 76, 1),
(452, '', '2024-06-26 15:36:43.442886', '', NULL, NULL, b'1', 2, 76, 1),
(453, '', '2024-06-26 15:36:43.444908', '', NULL, NULL, b'1', 3, 76, 1),
(454, '', '2024-06-26 15:36:43.446885', '', NULL, NULL, b'1', 4, 76, 1),
(455, '', '2024-06-26 15:36:43.448886', '', NULL, NULL, b'1', 5, 76, 1),
(456, '', '2024-06-26 15:36:43.450946', '', NULL, NULL, b'1', 6, 76, 1),
(457, '', '2024-06-26 15:36:43.452908', '', NULL, NULL, b'1', 1, 77, 1),
(458, '', '2024-06-26 15:36:43.454917', '', NULL, NULL, b'1', 2, 77, 1),
(459, '', '2024-06-26 15:36:43.456888', '', NULL, NULL, b'1', 3, 77, 1),
(460, '', '2024-06-26 15:36:43.458886', '', NULL, NULL, b'1', 4, 77, 1),
(461, '', '2024-06-26 15:36:43.459886', '', NULL, NULL, b'1', 5, 77, 1),
(462, '', '2024-06-26 15:36:43.461910', '', NULL, NULL, b'1', 6, 77, 1),
(463, '', '2024-06-26 15:36:43.463887', '', NULL, NULL, b'1', 1, 78, 1),
(464, '', '2024-06-26 15:36:43.465908', '', NULL, NULL, b'1', 2, 78, 1),
(465, '', '2024-06-26 15:36:43.467910', '', NULL, NULL, b'1', 3, 78, 1),
(466, '', '2024-06-26 15:36:43.469886', '', NULL, NULL, b'1', 4, 78, 1),
(467, '', '2024-06-26 15:36:43.471886', '', NULL, NULL, b'1', 5, 78, 1),
(468, '', '2024-06-26 15:36:43.473908', '', NULL, NULL, b'1', 6, 78, 1),
(469, '', '2024-06-26 15:36:43.913073', '', NULL, NULL, b'1', 1, 1, 2),
(470, '', '2024-06-26 15:36:43.915066', '', NULL, NULL, b'1', 2, 1, 2),
(471, '', '2024-06-26 15:36:43.917069', '', NULL, NULL, b'1', 3, 1, 2),
(472, '', '2024-06-26 15:36:43.919072', '', NULL, NULL, b'1', 4, 1, 2),
(473, '', '2024-06-26 15:36:43.921070', '', NULL, NULL, b'1', 5, 1, 2),
(474, '', '2024-06-26 15:36:43.923067', '', NULL, NULL, b'1', 6, 1, 2),
(475, '', '2024-06-26 15:36:43.925065', '', NULL, NULL, b'1', 1, 2, 2),
(476, '', '2024-06-26 15:36:43.927068', '', NULL, NULL, b'1', 2, 2, 2),
(477, '', '2024-06-26 15:36:43.929068', '', NULL, NULL, b'1', 3, 2, 2),
(478, '', '2024-06-26 15:36:43.931067', '', NULL, NULL, b'1', 4, 2, 2),
(479, '', '2024-06-26 15:36:43.934068', '', NULL, NULL, b'1', 5, 2, 2),
(480, '', '2024-06-26 15:36:43.936069', '', NULL, NULL, b'1', 6, 2, 2),
(481, '', '2024-06-26 15:36:43.939072', '', NULL, NULL, b'1', 1, 3, 2),
(482, '', '2024-06-26 15:36:43.942069', '', NULL, NULL, b'1', 2, 3, 2),
(483, '', '2024-06-26 15:36:43.944104', '', NULL, NULL, b'1', 3, 3, 2),
(484, '', '2024-06-26 15:36:43.947074', '', NULL, NULL, b'1', 4, 3, 2),
(485, '', '2024-06-26 15:36:43.950068', '', NULL, NULL, b'1', 5, 3, 2),
(486, '', '2024-06-26 15:36:43.952108', '', NULL, NULL, b'1', 6, 3, 2),
(487, '', '2024-06-26 15:36:43.954107', '', NULL, NULL, b'1', 1, 4, 2),
(488, '', '2024-06-26 15:36:43.957075', '', NULL, NULL, b'1', 2, 4, 2),
(489, '', '2024-06-26 15:36:43.959069', '', NULL, NULL, b'1', 3, 4, 2),
(490, '', '2024-06-26 15:36:43.961108', '', NULL, NULL, b'1', 4, 4, 2),
(491, '', '2024-06-26 15:36:43.963067', '', NULL, NULL, b'1', 5, 4, 2),
(492, '', '2024-06-26 15:36:43.966073', '', NULL, NULL, b'1', 6, 4, 2),
(493, '', '2024-06-26 15:36:43.968068', '', NULL, NULL, b'1', 1, 5, 2),
(494, '', '2024-06-26 15:36:43.970110', '', NULL, NULL, b'1', 2, 5, 2),
(495, '', '2024-06-26 15:36:43.973069', '', NULL, NULL, b'1', 3, 5, 2),
(496, '', '2024-06-26 15:36:43.975106', '', NULL, NULL, b'1', 4, 5, 2),
(497, '', '2024-06-26 15:36:43.978073', '', NULL, NULL, b'1', 5, 5, 2),
(498, '', '2024-06-26 15:36:43.980107', '', NULL, NULL, b'1', 6, 5, 2),
(499, '', '2024-06-26 15:36:43.983066', '', NULL, NULL, b'1', 1, 6, 2),
(500, '', '2024-06-26 15:36:43.985078', '', NULL, NULL, b'1', 2, 6, 2),
(501, '', '2024-06-26 15:36:43.987105', '', NULL, NULL, b'1', 3, 6, 2),
(502, '', '2024-06-26 15:36:43.990075', '', NULL, NULL, b'1', 4, 6, 2),
(503, '', '2024-06-26 15:36:43.992069', '', NULL, NULL, b'1', 5, 6, 2),
(504, '', '2024-06-26 15:36:43.994107', '', NULL, NULL, b'1', 6, 6, 2),
(505, '', '2024-06-26 15:36:43.996105', '', NULL, NULL, b'1', 1, 7, 2),
(506, '', '2024-06-26 15:36:43.999075', '', NULL, NULL, b'1', 2, 7, 2),
(507, '', '2024-06-26 15:36:44.001110', '', NULL, NULL, b'1', 3, 7, 2),
(508, '', '2024-06-26 15:36:44.004070', '', NULL, NULL, b'1', 4, 7, 2),
(509, '', '2024-06-26 15:36:44.017106', '', NULL, NULL, b'1', 5, 7, 2),
(510, '', '2024-06-26 15:36:44.020067', '', NULL, NULL, b'1', 6, 7, 2),
(511, '', '2024-06-26 15:36:44.022107', '', NULL, NULL, b'1', 1, 8, 2),
(512, '', '2024-06-26 15:36:44.025093', '', NULL, NULL, b'1', 2, 8, 2),
(513, '', '2024-06-26 15:36:44.027110', '', NULL, NULL, b'1', 3, 8, 2),
(514, '', '2024-06-26 15:36:44.030075', '', NULL, NULL, b'1', 4, 8, 2),
(515, '', '2024-06-26 15:36:44.032118', '', NULL, NULL, b'1', 5, 8, 2),
(516, '', '2024-06-26 15:36:44.034068', '', NULL, NULL, b'1', 6, 8, 2),
(517, '', '2024-06-26 15:36:44.037107', '', NULL, NULL, b'1', 1, 9, 2),
(518, '', '2024-06-26 15:36:44.040067', '', NULL, NULL, b'1', 2, 9, 2),
(519, '', '2024-06-26 15:36:44.042171', '', NULL, NULL, b'1', 3, 9, 2),
(520, '', '2024-06-26 15:36:44.044170', '', NULL, NULL, b'1', 4, 9, 2),
(521, '', '2024-06-26 15:36:44.046170', '', NULL, NULL, b'1', 5, 9, 2),
(522, '', '2024-06-26 15:36:44.049067', '', NULL, NULL, b'1', 6, 9, 2),
(523, '', '2024-06-26 15:36:44.051170', '', NULL, NULL, b'1', 1, 10, 2),
(524, '', '2024-06-26 15:36:44.053143', '', NULL, NULL, b'1', 2, 10, 2),
(525, '', '2024-06-26 15:36:44.055109', '', NULL, NULL, b'1', 3, 10, 2),
(526, '', '2024-06-26 15:36:44.057170', '', NULL, NULL, b'1', 4, 10, 2),
(527, '', '2024-06-26 15:36:44.062076', '', NULL, NULL, b'1', 5, 10, 2),
(528, '', '2024-06-26 15:36:44.066073', '', NULL, NULL, b'1', 6, 10, 2),
(529, '', '2024-06-26 15:36:44.071077', '', NULL, NULL, b'1', 1, 11, 2),
(530, '', '2024-06-26 15:36:44.075084', '', NULL, NULL, b'1', 2, 11, 2),
(531, '', '2024-06-26 15:36:44.079073', '', NULL, NULL, b'1', 3, 11, 2),
(532, '', '2024-06-26 15:36:44.084088', '', NULL, NULL, b'1', 4, 11, 2),
(533, '', '2024-06-26 15:36:44.088076', '', NULL, NULL, b'1', 5, 11, 2),
(534, '', '2024-06-26 15:36:44.092182', '', NULL, NULL, b'1', 6, 11, 2),
(535, '', '2024-06-26 15:36:44.097083', '', NULL, NULL, b'1', 1, 12, 2),
(536, '', '2024-06-26 15:36:44.101091', '', NULL, NULL, b'1', 2, 12, 2),
(537, '', '2024-06-26 15:36:44.105172', '', NULL, NULL, b'1', 3, 12, 2),
(538, '', '2024-06-26 15:36:44.109146', '', NULL, NULL, b'1', 4, 12, 2),
(539, '', '2024-06-26 15:36:44.114084', '', NULL, NULL, b'1', 5, 12, 2),
(540, '', '2024-06-26 15:36:44.118146', '', NULL, NULL, b'1', 6, 12, 2),
(541, '', '2024-06-26 15:36:44.123057', '', NULL, NULL, b'1', 1, 13, 2),
(542, '', '2024-06-26 15:36:44.128062', '', NULL, NULL, b'1', 2, 13, 2),
(543, '', '2024-06-26 15:36:44.132111', '', NULL, NULL, b'1', 3, 13, 2),
(544, '', '2024-06-26 15:36:44.138056', '', NULL, NULL, b'1', 4, 13, 2),
(545, '', '2024-06-26 15:36:44.142055', '', NULL, NULL, b'1', 5, 13, 2),
(546, '', '2024-06-26 15:36:44.145106', '', NULL, NULL, b'1', 6, 13, 2),
(547, '', '2024-06-26 15:36:44.149060', '', NULL, NULL, b'1', 1, 14, 2),
(548, '', '2024-06-26 15:36:44.152049', '', NULL, NULL, b'1', 2, 14, 2),
(549, '', '2024-06-26 15:36:44.155132', '', NULL, NULL, b'1', 3, 14, 2),
(550, '', '2024-06-26 15:36:44.159054', '', NULL, NULL, b'1', 4, 14, 2),
(551, '', '2024-06-26 15:36:44.161047', '', NULL, NULL, b'1', 5, 14, 2),
(552, '', '2024-06-26 15:36:44.164050', '', NULL, NULL, b'1', 6, 14, 2),
(553, '', '2024-06-26 15:36:44.167048', '', NULL, NULL, b'1', 1, 15, 2),
(554, '', '2024-06-26 15:36:44.170089', '', NULL, NULL, b'1', 2, 15, 2),
(555, '', '2024-06-26 15:36:44.173049', '', NULL, NULL, b'1', 3, 15, 2),
(556, '', '2024-06-26 15:36:44.176051', '', NULL, NULL, b'1', 4, 15, 2),
(557, '', '2024-06-26 15:36:44.178047', '', NULL, NULL, b'1', 5, 15, 2),
(558, '', '2024-06-26 15:36:44.181048', '', NULL, NULL, b'1', 6, 15, 2),
(559, '', '2024-06-26 15:36:44.184089', '', NULL, NULL, b'1', 1, 16, 2),
(560, '', '2024-06-26 15:36:44.187087', '', NULL, NULL, b'1', 2, 16, 2),
(561, '', '2024-06-26 15:36:44.190058', '', NULL, NULL, b'1', 3, 16, 2),
(562, '', '2024-06-26 15:36:44.192088', '', NULL, NULL, b'1', 4, 16, 2),
(563, '', '2024-06-26 15:36:44.195091', '', NULL, NULL, b'1', 5, 16, 2),
(564, '', '2024-06-26 15:36:44.198053', '', NULL, NULL, b'1', 6, 16, 2),
(565, '', '2024-06-26 15:36:44.201051', '', NULL, NULL, b'1', 1, 17, 2),
(566, '', '2024-06-26 15:36:44.203090', '', NULL, NULL, b'1', 2, 17, 2),
(567, '', '2024-06-26 15:36:44.206094', '', NULL, NULL, b'1', 3, 17, 2),
(568, '', '2024-06-26 15:36:44.209085', '', NULL, NULL, b'1', 4, 17, 2),
(569, '', '2024-06-26 15:36:44.212053', '', NULL, NULL, b'1', 5, 17, 2),
(570, '', '2024-06-26 15:36:44.214104', '', NULL, NULL, b'1', 6, 17, 2),
(571, '', '2024-06-26 15:36:44.217088', '', NULL, NULL, b'1', 1, 18, 2),
(572, '', '2024-06-26 15:36:44.220071', '', NULL, NULL, b'1', 2, 18, 2),
(573, '', '2024-06-26 15:36:44.222092', '', NULL, NULL, b'1', 3, 18, 2),
(574, '', '2024-06-26 15:36:44.225088', '', NULL, NULL, b'1', 4, 18, 2),
(575, '', '2024-06-26 15:36:44.228047', '', NULL, NULL, b'1', 5, 18, 2),
(576, '', '2024-06-26 15:36:44.230089', '', NULL, NULL, b'1', 6, 18, 2),
(577, '', '2024-06-26 15:36:44.233045', '', NULL, NULL, b'1', 1, 19, 2),
(578, '', '2024-06-26 15:36:44.235092', '', NULL, NULL, b'1', 2, 19, 2),
(579, '', '2024-06-26 15:36:44.238046', '', NULL, NULL, b'1', 3, 19, 2),
(580, '', '2024-06-26 15:36:44.240105', '', NULL, NULL, b'1', 4, 19, 2),
(581, '', '2024-06-26 15:36:44.242046', '', NULL, NULL, b'1', 5, 19, 2),
(582, '', '2024-06-26 15:36:44.245047', '', NULL, NULL, b'1', 6, 19, 2),
(583, '', '2024-06-26 15:36:44.247047', '', NULL, NULL, b'1', 1, 20, 2),
(584, '', '2024-06-26 15:36:44.250046', '', NULL, NULL, b'1', 2, 20, 2),
(585, '', '2024-06-26 15:36:44.252045', '', NULL, NULL, b'1', 3, 20, 2),
(586, '', '2024-06-26 15:36:44.254083', '', NULL, NULL, b'1', 4, 20, 2),
(587, '', '2024-06-26 15:36:44.256123', '', NULL, NULL, b'1', 5, 20, 2),
(588, '', '2024-06-26 15:36:44.259093', '', NULL, NULL, b'1', 6, 20, 2),
(589, '', '2024-06-26 15:36:44.261048', '', NULL, NULL, b'1', 1, 21, 2),
(590, '', '2024-06-26 15:36:44.263109', '', NULL, NULL, b'1', 2, 21, 2),
(591, '', '2024-06-26 15:36:44.266102', '', NULL, NULL, b'1', 3, 21, 2),
(592, '', '2024-06-26 15:36:44.268082', '', NULL, NULL, b'1', 4, 21, 2),
(593, '', '2024-06-26 15:36:44.270149', '', NULL, NULL, b'1', 5, 21, 2),
(594, '', '2024-06-26 15:36:44.272286', '', NULL, NULL, b'1', 6, 21, 2),
(595, '', '2024-06-26 15:36:44.277058', '', NULL, NULL, b'1', 1, 22, 2),
(596, '', '2024-06-26 15:36:44.282140', '', NULL, NULL, b'1', 2, 22, 2),
(597, '', '2024-06-26 15:36:44.287060', '', NULL, NULL, b'1', 3, 22, 2),
(598, '', '2024-06-26 15:36:44.293069', '', NULL, NULL, b'1', 4, 22, 2),
(599, '', '2024-06-26 15:36:44.297130', '', NULL, NULL, b'1', 5, 22, 2),
(600, '', '2024-06-26 15:36:44.303063', '', NULL, NULL, b'1', 6, 22, 2),
(601, '', '2024-06-26 15:36:44.310059', '', NULL, NULL, b'1', 1, 23, 2),
(602, '', '2024-06-26 15:36:44.315060', '', NULL, NULL, b'1', 2, 23, 2),
(603, '', '2024-06-26 15:36:44.319062', '', NULL, NULL, b'1', 3, 23, 2),
(604, '', '2024-06-26 15:36:44.323053', '', NULL, NULL, b'1', 4, 23, 2),
(605, '', '2024-06-26 15:36:44.326053', '', NULL, NULL, b'1', 5, 23, 2),
(606, '', '2024-06-26 15:36:44.328051', '', NULL, NULL, b'1', 6, 23, 2),
(607, '', '2024-06-26 15:36:44.331049', '', NULL, NULL, b'1', 1, 24, 2),
(608, '', '2024-06-26 15:36:44.334049', '', NULL, NULL, b'1', 2, 24, 2),
(609, '', '2024-06-26 15:36:44.337055', '', NULL, NULL, b'1', 3, 24, 2),
(610, '', '2024-06-26 15:36:44.339054', '', NULL, NULL, b'1', 4, 24, 2),
(611, '', '2024-06-26 15:36:44.342054', '', NULL, NULL, b'1', 5, 24, 2),
(612, '', '2024-06-26 15:36:44.344050', '', NULL, NULL, b'1', 6, 24, 2),
(613, '', '2024-06-26 15:36:44.347087', '', NULL, NULL, b'1', 1, 25, 2),
(614, '', '2024-06-26 15:36:44.350049', '', NULL, NULL, b'1', 2, 25, 2),
(615, '', '2024-06-26 15:36:44.352049', '', NULL, NULL, b'1', 3, 25, 2),
(616, '', '2024-06-26 15:36:44.354047', '', NULL, NULL, b'1', 4, 25, 2),
(617, '', '2024-06-26 15:36:44.357051', '', NULL, NULL, b'1', 5, 25, 2),
(618, '', '2024-06-26 15:36:44.360049', '', NULL, NULL, b'1', 6, 25, 2),
(619, '', '2024-06-26 15:36:44.362047', '', NULL, NULL, b'1', 1, 26, 2),
(620, '', '2024-06-26 15:36:44.365054', '', NULL, NULL, b'1', 2, 26, 2),
(621, '', '2024-06-26 15:36:44.367087', '', NULL, NULL, b'1', 3, 26, 2),
(622, '', '2024-06-26 15:36:44.370052', '', NULL, NULL, b'1', 4, 26, 2),
(623, '', '2024-06-26 15:36:44.372095', '', NULL, NULL, b'1', 5, 26, 2),
(624, '', '2024-06-26 15:36:44.375085', '', NULL, NULL, b'1', 6, 26, 2),
(625, '', '2024-06-26 15:36:44.377086', '', NULL, NULL, b'1', 1, 27, 2),
(626, '', '2024-06-26 15:36:44.380049', '', NULL, NULL, b'1', 2, 27, 2),
(627, '', '2024-06-26 15:36:44.383046', '', NULL, NULL, b'1', 3, 27, 2),
(628, '', '2024-06-26 15:36:44.385048', '', NULL, NULL, b'1', 4, 27, 2),
(629, '', '2024-06-26 15:36:44.387046', '', NULL, NULL, b'1', 5, 27, 2),
(630, '', '2024-06-26 15:36:44.390045', '', NULL, NULL, b'1', 6, 27, 2),
(631, '', '2024-06-26 15:36:44.393045', '', NULL, NULL, b'1', 1, 28, 2),
(632, '', '2024-06-26 15:36:44.395045', '', NULL, NULL, b'1', 2, 28, 2),
(633, '', '2024-06-26 15:36:44.398045', '', NULL, NULL, b'1', 3, 28, 2),
(634, '', '2024-06-26 15:36:44.400047', '', NULL, NULL, b'1', 4, 28, 2),
(635, '', '2024-06-26 15:36:44.403045', '', NULL, NULL, b'1', 5, 28, 2),
(636, '', '2024-06-26 15:36:44.405050', '', NULL, NULL, b'1', 6, 28, 2),
(637, '', '2024-06-26 15:36:44.408047', '', NULL, NULL, b'1', 1, 29, 2),
(638, '', '2024-06-26 15:36:44.410046', '', NULL, NULL, b'1', 2, 29, 2),
(639, '', '2024-06-26 15:36:44.412047', '', NULL, NULL, b'1', 3, 29, 2),
(640, '', '2024-06-26 15:36:44.415060', '', NULL, NULL, b'1', 4, 29, 2),
(641, '', '2024-06-26 15:36:44.417052', '', NULL, NULL, b'1', 5, 29, 2),
(642, '', '2024-06-26 15:36:44.419046', '', NULL, NULL, b'1', 6, 29, 2),
(643, '', '2024-06-26 15:36:44.421052', '', NULL, NULL, b'1', 1, 30, 2),
(644, '', '2024-06-26 15:36:44.424048', '', NULL, NULL, b'1', 2, 30, 2),
(645, '', '2024-06-26 15:36:44.426046', '', NULL, NULL, b'1', 3, 30, 2),
(646, '', '2024-06-26 15:36:44.428047', '', NULL, NULL, b'1', 4, 30, 2),
(647, '', '2024-06-26 15:36:44.430048', '', NULL, NULL, b'1', 5, 30, 2),
(648, '', '2024-06-26 15:36:44.433045', '', NULL, NULL, b'1', 6, 30, 2),
(649, '', '2024-06-26 15:36:44.435047', '', NULL, NULL, b'1', 1, 31, 2),
(650, '', '2024-06-26 15:36:44.437047', '', NULL, NULL, b'1', 2, 31, 2),
(651, '', '2024-06-26 15:36:44.441045', '', NULL, NULL, b'1', 3, 31, 2),
(652, '', '2024-06-26 15:36:44.443046', '', NULL, NULL, b'1', 4, 31, 2),
(653, '', '2024-06-26 15:36:44.445069', '', NULL, NULL, b'1', 5, 31, 2),
(654, '', '2024-06-26 15:36:44.447068', '', NULL, NULL, b'1', 6, 31, 2),
(655, '', '2024-06-26 15:36:44.450059', '', NULL, NULL, b'1', 1, 32, 2),
(656, '', '2024-06-26 15:36:44.454055', '', NULL, NULL, b'1', 2, 32, 2),
(657, '', '2024-06-26 15:36:44.458050', '', NULL, NULL, b'1', 3, 32, 2),
(658, '', '2024-06-26 15:36:44.463057', '', NULL, NULL, b'1', 4, 32, 2),
(659, '', '2024-06-26 15:36:44.468061', '', NULL, NULL, b'1', 5, 32, 2),
(660, '', '2024-06-26 15:36:44.472084', '', NULL, NULL, b'1', 6, 32, 2),
(661, '', '2024-06-26 15:36:44.476082', '', NULL, NULL, b'1', 1, 33, 2),
(662, '', '2024-06-26 15:36:44.480053', '', NULL, NULL, b'1', 2, 33, 2),
(663, '', '2024-06-26 15:36:44.484059', '', NULL, NULL, b'1', 3, 33, 2),
(664, '', '2024-06-26 15:36:44.489051', '', NULL, NULL, b'1', 4, 33, 2),
(665, '', '2024-06-26 15:36:44.493059', '', NULL, NULL, b'1', 5, 33, 2),
(666, '', '2024-06-26 15:36:44.497066', '', NULL, NULL, b'1', 6, 33, 2),
(667, '', '2024-06-26 15:36:44.501053', '', NULL, NULL, b'1', 1, 34, 2),
(668, '', '2024-06-26 15:36:44.505055', '', NULL, NULL, b'1', 2, 34, 2),
(669, '', '2024-06-26 15:36:44.509056', '', NULL, NULL, b'1', 3, 34, 2),
(670, '', '2024-06-26 15:36:44.513053', '', NULL, NULL, b'1', 4, 34, 2),
(671, '', '2024-06-26 15:36:44.517060', '', NULL, NULL, b'1', 5, 34, 2),
(672, '', '2024-06-26 15:36:44.521052', '', NULL, NULL, b'1', 6, 34, 2),
(673, '', '2024-06-26 15:36:44.525053', '', NULL, NULL, b'1', 1, 35, 2),
(674, '', '2024-06-26 15:36:44.530055', '', NULL, NULL, b'1', 2, 35, 2),
(675, '', '2024-06-26 15:36:44.534051', '', NULL, NULL, b'1', 3, 35, 2),
(676, '', '2024-06-26 15:36:44.538053', '', NULL, NULL, b'1', 4, 35, 2),
(677, '', '2024-06-26 15:36:44.541049', '', NULL, NULL, b'1', 5, 35, 2),
(678, '', '2024-06-26 15:36:44.543048', '', NULL, NULL, b'1', 6, 35, 2),
(679, '', '2024-06-26 15:36:44.546049', '', NULL, NULL, b'1', 1, 36, 2),
(680, '', '2024-06-26 15:36:44.549049', '', NULL, NULL, b'1', 2, 36, 2),
(681, '', '2024-06-26 15:36:44.551049', '', NULL, NULL, b'1', 3, 36, 2),
(682, '', '2024-06-26 15:36:44.554051', '', NULL, NULL, b'1', 4, 36, 2),
(683, '', '2024-06-26 15:36:44.556056', '', NULL, NULL, b'1', 5, 36, 2),
(684, '', '2024-06-26 15:36:44.559050', '', NULL, NULL, b'1', 6, 36, 2),
(685, '', '2024-06-26 15:36:44.562049', '', NULL, NULL, b'1', 1, 37, 2),
(686, '', '2024-06-26 15:36:44.565056', '', NULL, NULL, b'1', 2, 37, 2),
(687, '', '2024-06-26 15:36:44.567049', '', NULL, NULL, b'1', 3, 37, 2),
(688, '', '2024-06-26 15:36:44.570048', '', NULL, NULL, b'1', 4, 37, 2),
(689, '', '2024-06-26 15:36:44.572053', '', NULL, NULL, b'1', 5, 37, 2),
(690, '', '2024-06-26 15:36:44.575047', '', NULL, NULL, b'1', 6, 37, 2),
(691, '', '2024-06-26 15:36:44.577046', '', NULL, NULL, b'1', 1, 38, 2),
(692, '', '2024-06-26 15:36:44.580046', '', NULL, NULL, b'1', 2, 38, 2),
(693, '', '2024-06-26 15:36:44.582049', '', NULL, NULL, b'1', 3, 38, 2),
(694, '', '2024-06-26 15:36:44.584047', '', NULL, NULL, b'1', 4, 38, 2),
(695, '', '2024-06-26 15:36:44.586047', '', NULL, NULL, b'1', 5, 38, 2),
(696, '', '2024-06-26 15:36:44.589049', '', NULL, NULL, b'1', 6, 38, 2),
(697, '', '2024-06-26 15:36:44.591048', '', NULL, NULL, b'1', 1, 39, 2),
(698, '', '2024-06-26 15:36:44.593046', '', NULL, NULL, b'1', 2, 39, 2),
(699, '', '2024-06-26 15:36:44.596046', '', NULL, NULL, b'1', 3, 39, 2),
(700, '', '2024-06-26 15:36:44.599046', '', NULL, NULL, b'1', 4, 39, 2),
(701, '', '2024-06-26 15:36:44.601045', '', NULL, NULL, b'1', 5, 39, 2),
(702, '', '2024-06-26 15:36:44.603045', '', NULL, NULL, b'1', 6, 39, 2),
(703, '', '2024-06-26 15:36:44.604046', '', NULL, NULL, b'1', 1, 40, 2),
(704, '', '2024-06-26 15:36:44.607046', '', NULL, NULL, b'1', 2, 40, 2);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(705, '', '2024-06-26 15:36:44.609047', '', NULL, NULL, b'1', 3, 40, 2),
(706, '', '2024-06-26 15:36:44.611047', '', NULL, NULL, b'1', 4, 40, 2),
(707, '', '2024-06-26 15:36:44.613052', '', NULL, NULL, b'1', 5, 40, 2),
(708, '', '2024-06-26 15:36:44.615058', '', NULL, NULL, b'1', 6, 40, 2),
(709, '', '2024-06-26 15:36:44.617046', '', NULL, NULL, b'1', 1, 41, 2),
(710, '', '2024-06-26 15:36:44.620048', '', NULL, NULL, b'1', 2, 41, 2),
(711, '', '2024-06-26 15:36:44.622054', '', NULL, NULL, b'1', 3, 41, 2),
(712, '', '2024-06-26 15:36:44.624046', '', NULL, NULL, b'1', 4, 41, 2),
(713, '', '2024-06-26 15:36:44.626047', '', NULL, NULL, b'1', 5, 41, 2),
(714, '', '2024-06-26 15:36:44.628047', '', NULL, NULL, b'1', 6, 41, 2),
(715, '', '2024-06-26 15:36:44.631063', '', NULL, NULL, b'1', 1, 42, 2),
(716, '', '2024-06-26 15:36:44.633046', '', NULL, NULL, b'1', 2, 42, 2),
(717, '', '2024-06-26 15:36:44.636049', '', NULL, NULL, b'1', 3, 42, 2),
(718, '', '2024-06-26 15:36:44.638048', '', NULL, NULL, b'1', 4, 42, 2),
(719, '', '2024-06-26 15:36:44.640060', '', NULL, NULL, b'1', 5, 42, 2),
(720, '', '2024-06-26 15:36:44.642051', '', NULL, NULL, b'1', 6, 42, 2),
(721, '', '2024-06-26 15:36:44.644047', '', NULL, NULL, b'1', 1, 43, 2),
(722, '', '2024-06-26 15:36:44.646047', '', NULL, NULL, b'1', 2, 43, 2),
(723, '', '2024-06-26 15:36:44.649090', '', NULL, NULL, b'1', 3, 43, 2),
(724, '', '2024-06-26 15:36:44.651090', '', NULL, NULL, b'1', 4, 43, 2),
(725, '', '2024-06-26 15:36:44.653046', '', NULL, NULL, b'1', 5, 43, 2),
(726, '', '2024-06-26 15:36:44.656082', '', NULL, NULL, b'1', 6, 43, 2),
(727, '', '2024-06-26 15:36:44.658083', '', NULL, NULL, b'1', 1, 44, 2),
(728, '', '2024-06-26 15:36:44.660150', '', NULL, NULL, b'1', 2, 44, 2),
(729, '', '2024-06-26 15:36:44.662151', '', NULL, NULL, b'1', 3, 44, 2),
(730, '', '2024-06-26 15:36:44.664127', '', NULL, NULL, b'1', 4, 44, 2),
(731, '', '2024-06-26 15:36:44.666149', '', NULL, NULL, b'1', 5, 44, 2),
(732, '', '2024-06-26 15:36:44.671109', '', NULL, NULL, b'1', 6, 44, 2),
(733, '', '2024-06-26 15:36:44.675054', '', NULL, NULL, b'1', 1, 45, 2),
(734, '', '2024-06-26 15:36:44.679073', '', NULL, NULL, b'1', 2, 45, 2),
(735, '', '2024-06-26 15:36:44.684055', '', NULL, NULL, b'1', 3, 45, 2),
(736, '', '2024-06-26 15:36:44.688058', '', NULL, NULL, b'1', 4, 45, 2),
(737, '', '2024-06-26 15:36:44.693055', '', NULL, NULL, b'1', 5, 45, 2),
(738, '', '2024-06-26 15:36:44.697056', '', NULL, NULL, b'1', 6, 45, 2),
(739, '', '2024-06-26 15:36:44.702061', '', NULL, NULL, b'1', 1, 46, 2),
(740, '', '2024-06-26 15:36:44.706059', '', NULL, NULL, b'1', 2, 46, 2),
(741, '', '2024-06-26 15:36:44.710058', '', NULL, NULL, b'1', 3, 46, 2),
(742, '', '2024-06-26 15:36:44.715062', '', NULL, NULL, b'1', 4, 46, 2),
(743, '', '2024-06-26 15:36:44.719072', '', NULL, NULL, b'1', 5, 46, 2),
(744, '', '2024-06-26 15:36:44.723162', '', NULL, NULL, b'1', 6, 46, 2),
(745, '', '2024-06-26 15:36:44.728154', '', NULL, NULL, b'1', 1, 47, 2),
(746, '', '2024-06-26 15:36:44.731192', '', NULL, NULL, b'1', 2, 47, 2),
(747, '', '2024-06-26 15:36:44.734192', '', NULL, NULL, b'1', 3, 47, 2),
(748, '', '2024-06-26 15:36:44.738145', '', NULL, NULL, b'1', 4, 47, 2),
(749, '', '2024-06-26 15:36:44.741145', '', NULL, NULL, b'1', 5, 47, 2),
(750, '', '2024-06-26 15:36:44.745153', '', NULL, NULL, b'1', 6, 47, 2),
(751, '', '2024-06-26 15:36:44.748145', '', NULL, NULL, b'1', 1, 48, 2),
(752, '', '2024-06-26 15:36:44.751189', '', NULL, NULL, b'1', 2, 48, 2),
(753, '', '2024-06-26 15:36:44.754144', '', NULL, NULL, b'1', 3, 48, 2),
(754, '', '2024-06-26 15:36:44.757144', '', NULL, NULL, b'1', 4, 48, 2),
(755, '', '2024-06-26 15:36:44.759180', '', NULL, NULL, b'1', 5, 48, 2),
(756, '', '2024-06-26 15:36:44.762141', '', NULL, NULL, b'1', 6, 48, 2),
(757, '', '2024-06-26 15:36:44.765143', '', NULL, NULL, b'1', 1, 49, 2),
(758, '', '2024-06-26 15:36:44.767179', '', NULL, NULL, b'1', 2, 49, 2),
(759, '', '2024-06-26 15:36:44.769180', '', NULL, NULL, b'1', 3, 49, 2),
(760, '', '2024-06-26 15:36:44.772141', '', NULL, NULL, b'1', 4, 49, 2),
(761, '', '2024-06-26 15:36:44.774178', '', NULL, NULL, b'1', 5, 49, 2),
(762, '', '2024-06-26 15:36:44.777142', '', NULL, NULL, b'1', 6, 49, 2),
(763, '', '2024-06-26 15:36:44.779144', '', NULL, NULL, b'1', 1, 50, 2),
(764, '', '2024-06-26 15:36:44.781143', '', NULL, NULL, b'1', 2, 50, 2),
(765, '', '2024-06-26 15:36:44.784138', '', NULL, NULL, b'1', 3, 50, 2),
(766, '', '2024-06-26 15:36:44.786142', '', NULL, NULL, b'1', 4, 50, 2),
(767, '', '2024-06-26 15:36:44.788148', '', NULL, NULL, b'1', 5, 50, 2),
(768, '', '2024-06-26 15:36:44.791142', '', NULL, NULL, b'1', 6, 50, 2),
(769, '', '2024-06-26 15:36:44.793142', '', NULL, NULL, b'1', 1, 51, 2),
(770, '', '2024-06-26 15:36:44.795140', '', NULL, NULL, b'1', 2, 51, 2),
(771, '', '2024-06-26 15:36:44.798145', '', NULL, NULL, b'1', 3, 51, 2),
(772, '', '2024-06-26 15:36:44.800182', '', NULL, NULL, b'1', 4, 51, 2),
(773, '', '2024-06-26 15:36:44.803140', '', NULL, NULL, b'1', 5, 51, 2),
(774, '', '2024-06-26 15:36:44.805198', '', NULL, NULL, b'1', 6, 51, 2),
(775, '', '2024-06-26 15:36:44.808141', '', NULL, NULL, b'1', 1, 52, 2),
(776, '', '2024-06-26 15:36:44.810178', '', NULL, NULL, b'1', 2, 52, 2),
(777, '', '2024-06-26 15:36:44.812182', '', NULL, NULL, b'1', 3, 52, 2),
(778, '', '2024-06-26 15:36:44.815182', '', NULL, NULL, b'1', 4, 52, 2),
(779, '', '2024-06-26 15:36:44.817181', '', NULL, NULL, b'1', 5, 52, 2),
(780, '', '2024-06-26 15:36:44.819177', '', NULL, NULL, b'1', 6, 52, 2),
(781, '', '2024-06-26 15:36:44.822100', '', NULL, NULL, b'1', 1, 53, 2),
(782, '', '2024-06-26 15:36:44.824103', '', NULL, NULL, b'1', 2, 53, 2),
(783, '', '2024-06-26 15:36:44.827064', '', NULL, NULL, b'1', 3, 53, 2),
(784, '', '2024-06-26 15:36:44.829102', '', NULL, NULL, b'1', 4, 53, 2),
(785, '', '2024-06-26 15:36:44.832106', '', NULL, NULL, b'1', 5, 53, 2),
(786, '', '2024-06-26 15:36:44.834103', '', NULL, NULL, b'1', 6, 53, 2),
(787, '', '2024-06-26 15:36:44.836099', '', NULL, NULL, b'1', 1, 54, 2),
(788, '', '2024-06-26 15:36:44.839063', '', NULL, NULL, b'1', 2, 54, 2),
(789, '', '2024-06-26 15:36:44.841108', '', NULL, NULL, b'1', 3, 54, 2),
(790, '', '2024-06-26 15:36:44.844060', '', NULL, NULL, b'1', 4, 54, 2),
(791, '', '2024-06-26 15:36:44.846061', '', NULL, NULL, b'1', 5, 54, 2),
(792, '', '2024-06-26 15:36:44.849060', '', NULL, NULL, b'1', 6, 54, 2),
(793, '', '2024-06-26 15:36:44.851064', '', NULL, NULL, b'1', 1, 55, 2),
(794, '', '2024-06-26 15:36:44.853062', '', NULL, NULL, b'1', 2, 55, 2),
(795, '', '2024-06-26 15:36:44.856065', '', NULL, NULL, b'1', 3, 55, 2),
(796, '', '2024-06-26 15:36:44.858112', '', NULL, NULL, b'1', 4, 55, 2),
(797, '', '2024-06-26 15:36:44.860167', '', NULL, NULL, b'1', 5, 55, 2),
(798, '', '2024-06-26 15:36:44.868101', '', NULL, NULL, b'1', 6, 55, 2),
(799, '', '2024-06-26 15:36:44.871062', '', NULL, NULL, b'1', 1, 56, 2),
(800, '', '2024-06-26 15:36:44.873061', '', NULL, NULL, b'1', 2, 56, 2),
(801, '', '2024-06-26 15:36:44.875173', '', NULL, NULL, b'1', 3, 56, 2),
(802, '', '2024-06-26 15:36:44.877171', '', NULL, NULL, b'1', 4, 56, 2),
(803, '', '2024-06-26 15:36:44.879062', '', NULL, NULL, b'1', 5, 56, 2),
(804, '', '2024-06-26 15:36:44.881171', '', NULL, NULL, b'1', 6, 56, 2),
(805, '', '2024-06-26 15:36:44.883238', '', NULL, NULL, b'1', 1, 57, 2),
(806, '', '2024-06-26 15:36:44.885289', '', NULL, NULL, b'1', 2, 57, 2),
(807, '', '2024-06-26 15:36:44.890105', '', NULL, NULL, b'1', 3, 57, 2),
(808, '', '2024-06-26 15:36:44.895082', '', NULL, NULL, b'1', 4, 57, 2),
(809, '', '2024-06-26 15:36:44.900070', '', NULL, NULL, b'1', 5, 57, 2),
(810, '', '2024-06-26 15:36:44.905087', '', NULL, NULL, b'1', 6, 57, 2),
(811, '', '2024-06-26 15:36:44.911071', '', NULL, NULL, b'1', 1, 58, 2),
(812, '', '2024-06-26 15:36:44.916071', '', NULL, NULL, b'1', 2, 58, 2),
(813, '', '2024-06-26 15:36:44.922085', '', NULL, NULL, b'1', 3, 58, 2),
(814, '', '2024-06-26 15:36:44.927074', '', NULL, NULL, b'1', 4, 58, 2),
(815, '', '2024-06-26 15:36:44.932068', '', NULL, NULL, b'1', 5, 58, 2),
(816, '', '2024-06-26 15:36:44.935066', '', NULL, NULL, b'1', 6, 58, 2),
(817, '', '2024-06-26 15:36:44.938066', '', NULL, NULL, b'1', 1, 59, 2),
(818, '', '2024-06-26 15:36:44.941062', '', NULL, NULL, b'1', 2, 59, 2),
(819, '', '2024-06-26 15:36:44.944064', '', NULL, NULL, b'1', 3, 59, 2),
(820, '', '2024-06-26 15:36:44.946065', '', NULL, NULL, b'1', 4, 59, 2),
(821, '', '2024-06-26 15:36:44.949070', '', NULL, NULL, b'1', 5, 59, 2),
(822, '', '2024-06-26 15:36:44.952063', '', NULL, NULL, b'1', 6, 59, 2),
(823, '', '2024-06-26 15:36:44.954106', '', NULL, NULL, b'1', 1, 60, 2),
(824, '', '2024-06-26 15:36:44.957063', '', NULL, NULL, b'1', 2, 60, 2),
(825, '', '2024-06-26 15:36:44.959062', '', NULL, NULL, b'1', 3, 60, 2),
(826, '', '2024-06-26 15:36:44.961100', '', NULL, NULL, b'1', 4, 60, 2),
(827, '', '2024-06-26 15:36:44.964067', '', NULL, NULL, b'1', 5, 60, 2),
(828, '', '2024-06-26 15:36:44.966061', '', NULL, NULL, b'1', 6, 60, 2),
(829, '', '2024-06-26 15:36:44.968063', '', NULL, NULL, b'1', 1, 61, 2),
(830, '', '2024-06-26 15:36:44.971066', '', NULL, NULL, b'1', 2, 61, 2),
(831, '', '2024-06-26 15:36:44.973068', '', NULL, NULL, b'1', 3, 61, 2),
(832, '', '2024-06-26 15:36:44.975061', '', NULL, NULL, b'1', 4, 61, 2),
(833, '', '2024-06-26 15:36:44.978063', '', NULL, NULL, b'1', 5, 61, 2),
(834, '', '2024-06-26 15:36:44.980062', '', NULL, NULL, b'1', 6, 61, 2),
(835, '', '2024-06-26 15:36:44.983060', '', NULL, NULL, b'1', 1, 62, 2),
(836, '', '2024-06-26 15:36:44.985102', '', NULL, NULL, b'1', 2, 62, 2),
(837, '', '2024-06-26 15:36:44.987063', '', NULL, NULL, b'1', 3, 62, 2),
(838, '', '2024-06-26 15:36:44.990065', '', NULL, NULL, b'1', 4, 62, 2),
(839, '', '2024-06-26 15:36:44.992064', '', NULL, NULL, b'1', 5, 62, 2),
(840, '', '2024-06-26 15:36:44.995061', '', NULL, NULL, b'1', 6, 62, 2),
(841, '', '2024-06-26 15:36:44.997128', '', NULL, NULL, b'1', 1, 63, 2),
(842, '', '2024-06-26 15:36:45.000063', '', NULL, NULL, b'1', 2, 63, 2),
(843, '', '2024-06-26 15:36:45.002101', '', NULL, NULL, b'1', 3, 63, 2),
(844, '', '2024-06-26 15:36:45.004066', '', NULL, NULL, b'1', 4, 63, 2),
(845, '', '2024-06-26 15:36:45.007108', '', NULL, NULL, b'1', 5, 63, 2),
(846, '', '2024-06-26 15:36:45.010063', '', NULL, NULL, b'1', 6, 63, 2),
(847, '', '2024-06-26 15:36:45.012062', '', NULL, NULL, b'1', 1, 64, 2),
(848, '', '2024-06-26 15:36:45.015067', '', NULL, NULL, b'1', 2, 64, 2),
(849, '', '2024-06-26 15:36:45.017062', '', NULL, NULL, b'1', 3, 64, 2),
(850, '', '2024-06-26 15:36:45.019064', '', NULL, NULL, b'1', 4, 64, 2),
(851, '', '2024-06-26 15:36:45.021063', '', NULL, NULL, b'1', 5, 64, 2),
(852, '', '2024-06-26 15:36:45.024208', '', NULL, NULL, b'1', 6, 64, 2),
(853, '', '2024-06-26 15:36:45.026209', '', NULL, NULL, b'1', 1, 65, 2),
(854, '', '2024-06-26 15:36:45.029208', '', NULL, NULL, b'1', 2, 65, 2),
(855, '', '2024-06-26 15:36:45.031256', '', NULL, NULL, b'1', 3, 65, 2),
(856, '', '2024-06-26 15:36:45.033209', '', NULL, NULL, b'1', 4, 65, 2),
(857, '', '2024-06-26 15:36:45.036210', '', NULL, NULL, b'1', 5, 65, 2),
(858, '', '2024-06-26 15:36:45.038211', '', NULL, NULL, b'1', 6, 65, 2),
(859, '', '2024-06-26 15:36:45.041208', '', NULL, NULL, b'1', 1, 66, 2),
(860, '', '2024-06-26 15:36:45.043210', '', NULL, NULL, b'1', 2, 66, 2),
(861, '', '2024-06-26 15:36:45.045206', '', NULL, NULL, b'1', 3, 66, 2),
(862, '', '2024-06-26 15:36:45.047209', '', NULL, NULL, b'1', 4, 66, 2),
(863, '', '2024-06-26 15:36:45.050256', '', NULL, NULL, b'1', 5, 66, 2),
(864, '', '2024-06-26 15:36:45.052211', '', NULL, NULL, b'1', 6, 66, 2),
(865, '', '2024-06-26 15:36:45.054208', '', NULL, NULL, b'1', 1, 67, 2),
(866, '', '2024-06-26 15:36:45.057251', '', NULL, NULL, b'1', 2, 67, 2),
(867, '', '2024-06-26 15:36:45.060208', '', NULL, NULL, b'1', 3, 67, 2),
(868, '', '2024-06-26 15:36:45.062343', '', NULL, NULL, b'1', 4, 67, 2),
(869, '', '2024-06-26 15:36:45.064209', '', NULL, NULL, b'1', 5, 67, 2),
(870, '', '2024-06-26 15:36:45.066311', '', NULL, NULL, b'1', 6, 67, 2),
(871, '', '2024-06-26 15:36:45.068249', '', NULL, NULL, b'1', 1, 68, 2),
(872, '', '2024-06-26 15:36:45.070310', '', NULL, NULL, b'1', 2, 68, 2),
(873, '', '2024-06-26 15:36:45.073262', '', NULL, NULL, b'1', 3, 68, 2),
(874, '', '2024-06-26 15:36:45.077214', '', NULL, NULL, b'1', 4, 68, 2),
(875, '', '2024-06-26 15:36:45.081295', '', NULL, NULL, b'1', 5, 68, 2),
(876, '', '2024-06-26 15:36:45.086215', '', NULL, NULL, b'1', 6, 68, 2),
(877, '', '2024-06-26 15:36:45.090215', '', NULL, NULL, b'1', 1, 69, 2),
(878, '', '2024-06-26 15:36:45.094320', '', NULL, NULL, b'1', 2, 69, 2),
(879, '', '2024-06-26 15:36:45.099225', '', NULL, NULL, b'1', 3, 69, 2),
(880, '', '2024-06-26 15:36:45.103211', '', NULL, NULL, b'1', 4, 69, 2),
(881, '', '2024-06-26 15:36:45.108217', '', NULL, NULL, b'1', 5, 69, 2),
(882, '', '2024-06-26 15:36:45.113213', '', NULL, NULL, b'1', 6, 69, 2),
(883, '', '2024-06-26 15:36:45.118216', '', NULL, NULL, b'1', 1, 70, 2),
(884, '', '2024-06-26 15:36:45.122144', '', NULL, NULL, b'1', 2, 70, 2),
(885, '', '2024-06-26 15:36:45.127100', '', NULL, NULL, b'1', 3, 70, 2),
(886, '', '2024-06-26 15:36:45.132162', '', NULL, NULL, b'1', 4, 70, 2),
(887, '', '2024-06-26 15:36:45.136091', '', NULL, NULL, b'1', 5, 70, 2),
(888, '', '2024-06-26 15:36:45.141092', '', NULL, NULL, b'1', 6, 70, 2),
(889, '', '2024-06-26 15:36:45.145083', '', NULL, NULL, b'1', 1, 71, 2),
(890, '', '2024-06-26 15:36:45.148084', '', NULL, NULL, b'1', 2, 71, 2),
(891, '', '2024-06-26 15:36:45.151080', '', NULL, NULL, b'1', 3, 71, 2),
(892, '', '2024-06-26 15:36:45.154081', '', NULL, NULL, b'1', 4, 71, 2),
(893, '', '2024-06-26 15:36:45.157081', '', NULL, NULL, b'1', 5, 71, 2),
(894, '', '2024-06-26 15:36:45.160083', '', NULL, NULL, b'1', 6, 71, 2),
(895, '', '2024-06-26 15:36:45.162083', '', NULL, NULL, b'1', 1, 72, 2),
(896, '', '2024-06-26 15:36:45.165082', '', NULL, NULL, b'1', 2, 72, 2),
(897, '', '2024-06-26 15:36:45.167079', '', NULL, NULL, b'1', 3, 72, 2),
(898, '', '2024-06-26 15:36:45.170080', '', NULL, NULL, b'1', 4, 72, 2),
(899, '', '2024-06-26 15:36:45.173082', '', NULL, NULL, b'1', 5, 72, 2),
(900, '', '2024-06-26 15:36:45.175079', '', NULL, NULL, b'1', 6, 72, 2),
(901, '', '2024-06-26 15:36:45.177082', '', NULL, NULL, b'1', 1, 73, 2),
(902, '', '2024-06-26 15:36:45.179081', '', NULL, NULL, b'1', 2, 73, 2),
(903, '', '2024-06-26 15:36:45.182081', '', NULL, NULL, b'1', 3, 73, 2),
(904, '', '2024-06-26 15:36:45.184082', '', NULL, NULL, b'1', 4, 73, 2),
(905, '', '2024-06-26 15:36:45.186080', '', NULL, NULL, b'1', 5, 73, 2),
(906, '', '2024-06-26 15:36:45.189081', '', NULL, NULL, b'1', 6, 73, 2),
(907, '', '2024-06-26 15:36:45.191080', '', NULL, NULL, b'1', 1, 74, 2),
(908, '', '2024-06-26 15:36:45.193080', '', NULL, NULL, b'1', 2, 74, 2),
(909, '', '2024-06-26 15:36:45.195083', '', NULL, NULL, b'1', 3, 74, 2),
(910, '', '2024-06-26 15:36:45.198087', '', NULL, NULL, b'1', 4, 74, 2),
(911, '', '2024-06-26 15:36:45.200079', '', NULL, NULL, b'1', 5, 74, 2),
(912, '', '2024-06-26 15:36:45.202080', '', NULL, NULL, b'1', 6, 74, 2),
(913, '', '2024-06-26 15:36:45.204083', '', NULL, NULL, b'1', 1, 75, 2),
(914, '', '2024-06-26 15:36:45.207084', '', NULL, NULL, b'1', 2, 75, 2),
(915, '', '2024-06-26 15:36:45.209080', '', NULL, NULL, b'1', 3, 75, 2),
(916, '', '2024-06-26 15:36:45.211079', '', NULL, NULL, b'1', 4, 75, 2),
(917, '', '2024-06-26 15:36:45.213081', '', NULL, NULL, b'1', 5, 75, 2),
(918, '', '2024-06-26 15:36:45.216079', '', NULL, NULL, b'1', 6, 75, 2),
(919, '', '2024-06-26 15:36:45.218080', '', NULL, NULL, b'1', 1, 76, 2),
(920, '', '2024-06-26 15:36:45.220078', '', NULL, NULL, b'1', 2, 76, 2),
(921, '', '2024-06-26 15:36:45.223206', '', NULL, NULL, b'1', 3, 76, 2),
(922, '', '2024-06-26 15:36:45.225201', '', NULL, NULL, b'1', 4, 76, 2),
(923, '', '2024-06-26 15:36:45.227200', '', NULL, NULL, b'1', 5, 76, 2),
(924, '', '2024-06-26 15:36:45.229201', '', NULL, NULL, b'1', 6, 76, 2),
(925, '', '2024-06-26 15:36:45.231207', '', NULL, NULL, b'1', 1, 77, 2),
(926, '', '2024-06-26 15:36:45.233202', '', NULL, NULL, b'1', 2, 77, 2),
(927, '', '2024-06-26 15:36:45.235201', '', NULL, NULL, b'1', 3, 77, 2),
(928, '', '2024-06-26 15:36:45.237204', '', NULL, NULL, b'1', 4, 77, 2),
(929, '', '2024-06-26 15:36:45.240203', '', NULL, NULL, b'1', 5, 77, 2),
(930, '', '2024-06-26 15:36:45.242203', '', NULL, NULL, b'1', 6, 77, 2),
(931, '', '2024-06-26 15:36:45.244204', '', NULL, NULL, b'1', 1, 78, 2),
(932, '', '2024-06-26 15:36:45.246203', '', NULL, NULL, b'1', 2, 78, 2),
(933, '', '2024-06-26 15:36:45.249202', '', NULL, NULL, b'1', 3, 78, 2),
(934, '', '2024-06-26 15:36:45.250202', '', NULL, NULL, b'1', 4, 78, 2),
(935, '', '2024-06-26 15:36:45.252201', '', NULL, NULL, b'1', 5, 78, 2),
(936, '', '2024-06-26 15:36:45.255205', '', NULL, NULL, b'1', 6, 78, 2),
(937, '', '2024-06-26 15:47:06.907617', '', NULL, NULL, b'1', 1, 1, 52),
(938, '', '2024-06-26 15:47:06.917643', '', NULL, NULL, b'1', 2, 1, 52),
(939, '', '2024-06-26 15:47:06.921620', '', NULL, NULL, b'1', 3, 1, 52),
(940, '', '2024-06-26 15:47:06.926680', '', NULL, NULL, b'1', 4, 1, 52),
(941, '', '2024-06-26 15:47:06.931618', '', NULL, NULL, b'1', 5, 1, 52),
(942, '', '2024-06-26 15:47:06.935688', '', NULL, NULL, b'1', 6, 1, 52),
(943, '', '2024-06-26 15:47:06.939654', '', NULL, NULL, b'1', 1, 2, 52),
(944, '', '2024-06-26 15:47:06.943633', '', NULL, NULL, b'1', 2, 2, 52),
(945, '', '2024-06-26 15:47:06.947613', '', NULL, NULL, b'1', 3, 2, 52),
(946, '', '2024-06-26 15:47:06.951676', '', NULL, NULL, b'1', 4, 2, 52),
(947, '', '2024-06-26 15:47:06.955652', '', NULL, NULL, b'1', 5, 2, 52),
(948, '', '2024-06-26 15:47:06.960667', '', NULL, NULL, b'1', 6, 2, 52),
(949, '', '2024-06-26 15:47:06.964646', '', NULL, NULL, b'1', 1, 3, 52),
(950, '', '2024-06-26 15:47:06.970623', '', NULL, NULL, b'1', 2, 3, 52),
(951, '', '2024-06-26 15:47:06.973618', '', NULL, NULL, b'1', 3, 3, 52),
(952, '', '2024-06-26 15:47:06.978639', '', NULL, NULL, b'1', 4, 3, 52),
(953, '', '2024-06-26 15:47:06.983619', '', NULL, NULL, b'1', 5, 3, 52),
(954, '', '2024-06-26 15:47:06.987623', '', NULL, NULL, b'1', 6, 3, 52),
(955, '', '2024-06-26 15:47:06.991616', '', NULL, NULL, b'1', 1, 4, 52),
(956, '', '2024-06-26 15:47:06.995621', '', NULL, NULL, b'1', 2, 4, 52),
(957, '', '2024-06-26 15:47:06.999627', '', NULL, NULL, b'1', 3, 4, 52),
(958, '', '2024-06-26 15:47:07.003630', '', NULL, NULL, b'1', 4, 4, 52),
(959, '', '2024-06-26 15:47:07.007623', '', NULL, NULL, b'1', 5, 4, 52),
(960, '', '2024-06-26 15:47:07.011620', '', NULL, NULL, b'1', 6, 4, 52),
(961, '', '2024-06-26 15:47:07.015621', '', NULL, NULL, b'1', 1, 5, 52),
(962, '', '2024-06-26 15:47:07.019678', '', NULL, NULL, b'1', 2, 5, 52),
(963, '', '2024-06-26 15:47:07.023620', '', NULL, NULL, b'1', 3, 5, 52),
(964, '', '2024-06-26 15:47:07.027660', '', NULL, NULL, b'1', 4, 5, 52),
(965, '', '2024-06-26 15:47:07.031621', '', NULL, NULL, b'1', 5, 5, 52),
(966, '', '2024-06-26 15:47:07.034625', '', NULL, NULL, b'1', 6, 5, 52),
(967, '', '2024-06-26 15:47:07.038662', '', NULL, NULL, b'1', 1, 6, 52),
(968, '', '2024-06-26 15:47:07.041628', '', NULL, NULL, b'1', 2, 6, 52),
(969, '', '2024-06-26 15:47:07.045622', '', NULL, NULL, b'1', 3, 6, 52),
(970, '', '2024-06-26 15:47:07.048615', '', NULL, NULL, b'1', 4, 6, 52),
(971, '', '2024-06-26 15:47:07.052618', '', NULL, NULL, b'1', 5, 6, 52),
(972, '', '2024-06-26 15:47:07.056619', '', NULL, NULL, b'1', 6, 6, 52),
(973, '', '2024-06-26 15:47:07.070616', '', NULL, NULL, b'1', 1, 7, 52),
(974, '', '2024-06-26 15:47:07.073625', '', NULL, NULL, b'1', 2, 7, 52),
(975, '', '2024-06-26 15:47:07.077617', '', NULL, NULL, b'1', 3, 7, 52),
(976, '', '2024-06-26 15:47:07.080658', '', NULL, NULL, b'1', 4, 7, 52),
(977, '', '2024-06-26 15:47:07.084625', '', NULL, NULL, b'1', 5, 7, 52),
(978, '', '2024-06-26 15:47:07.087617', '', NULL, NULL, b'1', 6, 7, 52),
(979, '', '2024-06-26 15:47:07.090621', '', NULL, NULL, b'1', 1, 8, 52),
(980, '', '2024-06-26 15:47:07.094623', '', NULL, NULL, b'1', 2, 8, 52),
(981, '', '2024-06-26 15:47:07.097628', '', NULL, NULL, b'1', 3, 8, 52),
(982, '', '2024-06-26 15:47:07.101624', '', NULL, NULL, b'1', 4, 8, 52),
(983, '', '2024-06-26 15:47:07.104619', '', NULL, NULL, b'1', 5, 8, 52),
(984, '', '2024-06-26 15:47:07.107615', '', NULL, NULL, b'1', 6, 8, 52),
(985, '', '2024-06-26 15:47:07.111615', '', NULL, NULL, b'1', 1, 9, 52),
(986, '', '2024-06-26 15:47:07.115617', '', NULL, NULL, b'1', 2, 9, 52),
(987, '', '2024-06-26 15:47:07.119631', '', NULL, NULL, b'1', 3, 9, 52),
(988, '', '2024-06-26 15:47:07.123616', '', NULL, NULL, b'1', 4, 9, 52),
(989, '', '2024-06-26 15:47:07.127619', '', NULL, NULL, b'1', 5, 9, 52),
(990, '', '2024-06-26 15:47:07.130620', '', NULL, NULL, b'1', 6, 9, 52),
(991, '', '2024-06-26 15:47:07.134623', '', NULL, NULL, b'1', 1, 10, 52),
(992, '', '2024-06-26 15:47:07.137633', '', NULL, NULL, b'1', 2, 10, 52),
(993, '', '2024-06-26 15:47:07.141617', '', NULL, NULL, b'1', 3, 10, 52),
(994, '', '2024-06-26 15:47:07.145644', '', NULL, NULL, b'1', 4, 10, 52),
(995, '', '2024-06-26 15:47:07.149622', '', NULL, NULL, b'1', 5, 10, 52),
(996, '', '2024-06-26 15:47:07.153652', '', NULL, NULL, b'1', 6, 10, 52),
(997, '', '2024-06-26 15:47:07.157621', '', NULL, NULL, b'1', 1, 11, 52),
(998, '', '2024-06-26 15:47:07.161632', '', NULL, NULL, b'1', 2, 11, 52),
(999, '', '2024-06-26 15:47:07.165621', '', NULL, NULL, b'1', 3, 11, 52),
(1000, '', '2024-06-26 15:47:07.169684', '', NULL, NULL, b'1', 4, 11, 52),
(1001, '', '2024-06-26 15:47:07.173621', '', NULL, NULL, b'1', 5, 11, 52),
(1002, '', '2024-06-26 15:47:07.177668', '', NULL, NULL, b'1', 6, 11, 52),
(1003, '', '2024-06-26 15:47:07.181618', '', NULL, NULL, b'1', 1, 12, 52),
(1004, '', '2024-06-26 15:47:07.186659', '', NULL, NULL, b'1', 2, 12, 52),
(1005, '', '2024-06-26 15:47:07.190622', '', NULL, NULL, b'1', 3, 12, 52),
(1006, '', '2024-06-26 15:47:07.194621', '', NULL, NULL, b'1', 4, 12, 52),
(1007, '', '2024-06-26 15:47:07.198618', '', NULL, NULL, b'1', 5, 12, 52),
(1008, '', '2024-06-26 15:47:07.202618', '', NULL, NULL, b'1', 6, 12, 52),
(1009, '', '2024-06-26 15:47:07.206620', '', NULL, NULL, b'1', 1, 13, 52),
(1010, '', '2024-06-26 15:47:07.210620', '', NULL, NULL, b'1', 2, 13, 52),
(1011, '', '2024-06-26 15:47:07.214617', '', NULL, NULL, b'1', 3, 13, 52),
(1012, '', '2024-06-26 15:47:07.218624', '', NULL, NULL, b'1', 4, 13, 52),
(1013, '', '2024-06-26 15:47:07.223617', '', NULL, NULL, b'1', 5, 13, 52),
(1014, '', '2024-06-26 15:47:07.228617', '', NULL, NULL, b'1', 6, 13, 52),
(1015, '', '2024-06-26 15:47:07.231618', '', NULL, NULL, b'1', 1, 14, 52),
(1016, '', '2024-06-26 15:47:07.235660', '', NULL, NULL, b'1', 2, 14, 52),
(1017, '', '2024-06-26 15:47:07.238805', '', NULL, NULL, b'1', 3, 14, 52),
(1018, '', '2024-06-26 15:47:07.242621', '', NULL, NULL, b'1', 4, 14, 52),
(1019, '', '2024-06-26 15:47:07.245654', '', NULL, NULL, b'1', 5, 14, 52),
(1020, '', '2024-06-26 15:47:07.249618', '', NULL, NULL, b'1', 6, 14, 52),
(1021, '', '2024-06-26 15:47:07.253615', '', NULL, NULL, b'1', 1, 15, 52),
(1022, '', '2024-06-26 15:47:07.257620', '', NULL, NULL, b'1', 2, 15, 52),
(1023, '', '2024-06-26 15:47:07.261617', '', NULL, NULL, b'1', 3, 15, 52),
(1024, '', '2024-06-26 15:47:07.265622', '', NULL, NULL, b'1', 4, 15, 52),
(1025, '', '2024-06-26 15:47:07.268621', '', NULL, NULL, b'1', 5, 15, 52),
(1026, '', '2024-06-26 15:47:07.271622', '', NULL, NULL, b'1', 6, 15, 52),
(1027, '', '2024-06-26 15:47:07.274619', '', NULL, NULL, b'1', 1, 16, 52),
(1028, '', '2024-06-26 15:47:07.278654', '', NULL, NULL, b'1', 2, 16, 52),
(1029, '', '2024-06-26 15:47:07.281621', '', NULL, NULL, b'1', 3, 16, 52),
(1030, '', '2024-06-26 15:47:07.284621', '', NULL, NULL, b'1', 4, 16, 52),
(1031, '', '2024-06-26 15:47:07.287648', '', NULL, NULL, b'1', 5, 16, 52),
(1032, '', '2024-06-26 15:47:07.290619', '', NULL, NULL, b'1', 6, 16, 52),
(1033, '', '2024-06-26 15:47:07.294619', '', NULL, NULL, b'1', 1, 17, 52),
(1034, '', '2024-06-26 15:47:07.297616', '', NULL, NULL, b'1', 2, 17, 52),
(1035, '', '2024-06-26 15:47:07.300681', '', NULL, NULL, b'1', 3, 17, 52),
(1036, '', '2024-06-26 15:47:07.304652', '', NULL, NULL, b'1', 4, 17, 52),
(1037, '', '2024-06-26 15:47:07.306621', '', NULL, NULL, b'1', 5, 17, 52),
(1038, '', '2024-06-26 15:47:07.310673', '', NULL, NULL, b'1', 6, 17, 52),
(1039, '', '2024-06-26 15:47:07.314617', '', NULL, NULL, b'1', 1, 18, 52),
(1040, '', '2024-06-26 15:47:07.317622', '', NULL, NULL, b'1', 2, 18, 52),
(1041, '', '2024-06-26 15:47:07.320616', '', NULL, NULL, b'1', 3, 18, 52),
(1042, '', '2024-06-26 15:47:07.324617', '', NULL, NULL, b'1', 4, 18, 52),
(1043, '', '2024-06-26 15:47:07.328618', '', NULL, NULL, b'1', 5, 18, 52),
(1044, '', '2024-06-26 15:47:07.331618', '', NULL, NULL, b'1', 6, 18, 52),
(1045, '', '2024-06-26 15:47:07.336619', '', NULL, NULL, b'1', 1, 19, 52),
(1046, '', '2024-06-26 15:47:07.339634', '', NULL, NULL, b'1', 2, 19, 52),
(1047, '', '2024-06-26 15:47:07.343627', '', NULL, NULL, b'1', 3, 19, 52),
(1048, '', '2024-06-26 15:47:07.348630', '', NULL, NULL, b'1', 4, 19, 52),
(1049, '', '2024-06-26 15:47:07.352618', '', NULL, NULL, b'1', 5, 19, 52),
(1050, '', '2024-06-26 15:47:07.356620', '', NULL, NULL, b'1', 6, 19, 52),
(1051, '', '2024-06-26 15:47:07.360619', '', NULL, NULL, b'1', 1, 20, 52),
(1052, '', '2024-06-26 15:47:07.365624', '', NULL, NULL, b'1', 2, 20, 52),
(1053, '', '2024-06-26 15:47:07.368625', '', NULL, NULL, b'1', 3, 20, 52),
(1054, '', '2024-06-26 15:47:07.373624', '', NULL, NULL, b'1', 4, 20, 52),
(1055, '', '2024-06-26 15:47:07.377623', '', NULL, NULL, b'1', 5, 20, 52),
(1056, '', '2024-06-26 15:47:07.381615', '', NULL, NULL, b'1', 6, 20, 52),
(1057, '', '2024-06-26 15:47:07.385622', '', NULL, NULL, b'1', 1, 21, 52),
(1058, '', '2024-06-26 15:47:07.390620', '', NULL, NULL, b'1', 2, 21, 52),
(1059, '', '2024-06-26 15:47:07.394620', '', NULL, NULL, b'1', 3, 21, 52),
(1060, '', '2024-06-26 15:47:07.398616', '', NULL, NULL, b'1', 4, 21, 52),
(1061, '', '2024-06-26 15:47:07.402623', '', NULL, NULL, b'1', 5, 21, 52),
(1062, '', '2024-06-26 15:47:07.407623', '', NULL, NULL, b'1', 6, 21, 52),
(1063, '', '2024-06-26 15:47:07.412623', '', NULL, NULL, b'1', 1, 22, 52),
(1064, '', '2024-06-26 15:47:07.416619', '', NULL, NULL, b'1', 2, 22, 52),
(1065, '', '2024-06-26 15:47:07.420626', '', NULL, NULL, b'1', 3, 22, 52),
(1066, '', '2024-06-26 15:47:07.424620', '', NULL, NULL, b'1', 4, 22, 52),
(1067, '', '2024-06-26 15:47:07.428622', '', NULL, NULL, b'1', 5, 22, 52),
(1068, '', '2024-06-26 15:47:07.431619', '', NULL, NULL, b'1', 6, 22, 52),
(1069, '', '2024-06-26 15:47:07.436619', '', NULL, NULL, b'1', 1, 23, 52),
(1070, '', '2024-06-26 15:47:07.438614', '', NULL, NULL, b'1', 2, 23, 52),
(1071, '', '2024-06-26 15:47:07.442620', '', NULL, NULL, b'1', 3, 23, 52),
(1072, '', '2024-06-26 15:47:07.446616', '', NULL, NULL, b'1', 4, 23, 52),
(1073, '', '2024-06-26 15:47:07.449615', '', NULL, NULL, b'1', 5, 23, 52),
(1074, '', '2024-06-26 15:47:07.453615', '', NULL, NULL, b'1', 6, 23, 52),
(1075, '', '2024-06-26 15:47:07.456618', '', NULL, NULL, b'1', 1, 24, 52),
(1076, '', '2024-06-26 15:47:07.459621', '', NULL, NULL, b'1', 2, 24, 52),
(1077, '', '2024-06-26 15:47:07.462616', '', NULL, NULL, b'1', 3, 24, 52),
(1078, '', '2024-06-26 15:47:07.466629', '', NULL, NULL, b'1', 4, 24, 52),
(1079, '', '2024-06-26 15:47:07.469616', '', NULL, NULL, b'1', 5, 24, 52),
(1080, '', '2024-06-26 15:47:07.472616', '', NULL, NULL, b'1', 6, 24, 52),
(1081, '', '2024-06-26 15:47:07.476615', '', NULL, NULL, b'1', 1, 25, 52),
(1082, '', '2024-06-26 15:47:07.479613', '', NULL, NULL, b'1', 2, 25, 52),
(1083, '', '2024-06-26 15:47:07.482617', '', NULL, NULL, b'1', 3, 25, 52),
(1084, '', '2024-06-26 15:47:07.486616', '', NULL, NULL, b'1', 4, 25, 52),
(1085, '', '2024-06-26 15:47:07.489613', '', NULL, NULL, b'1', 5, 25, 52),
(1086, '', '2024-06-26 15:47:07.492618', '', NULL, NULL, b'1', 6, 25, 52),
(1087, '', '2024-06-26 15:47:07.495613', '', NULL, NULL, b'1', 1, 26, 52),
(1088, '', '2024-06-26 15:47:07.498617', '', NULL, NULL, b'1', 2, 26, 52),
(1089, '', '2024-06-26 15:47:07.501619', '', NULL, NULL, b'1', 3, 26, 52),
(1090, '', '2024-06-26 15:47:07.517617', '', NULL, NULL, b'1', 4, 26, 52),
(1091, '', '2024-06-26 15:47:07.520615', '', NULL, NULL, b'1', 5, 26, 52),
(1092, '', '2024-06-26 15:47:07.523618', '', NULL, NULL, b'1', 6, 26, 52),
(1093, '', '2024-06-26 15:47:07.527620', '', NULL, NULL, b'1', 1, 27, 52),
(1094, '', '2024-06-26 15:47:07.530614', '', NULL, NULL, b'1', 2, 27, 52),
(1095, '', '2024-06-26 15:47:07.534621', '', NULL, NULL, b'1', 3, 27, 52),
(1096, '', '2024-06-26 15:47:07.538617', '', NULL, NULL, b'1', 4, 27, 52),
(1097, '', '2024-06-26 15:47:07.543622', '', NULL, NULL, b'1', 5, 27, 52),
(1098, '', '2024-06-26 15:47:07.549617', '', NULL, NULL, b'1', 6, 27, 52),
(1099, '', '2024-06-26 15:47:07.553620', '', NULL, NULL, b'1', 1, 28, 52),
(1100, '', '2024-06-26 15:47:07.558622', '', NULL, NULL, b'1', 2, 28, 52),
(1101, '', '2024-06-26 15:47:07.568648', '', NULL, NULL, b'1', 3, 28, 52),
(1102, '', '2024-06-26 15:47:07.574620', '', NULL, NULL, b'1', 4, 28, 52),
(1103, '', '2024-06-26 15:47:07.579622', '', NULL, NULL, b'1', 5, 28, 52),
(1104, '', '2024-06-26 15:47:07.587624', '', NULL, NULL, b'1', 6, 28, 52),
(1105, '', '2024-06-26 15:47:07.593637', '', NULL, NULL, b'1', 1, 29, 52),
(1106, '', '2024-06-26 15:47:07.598620', '', NULL, NULL, b'1', 2, 29, 52),
(1107, '', '2024-06-26 15:47:07.602621', '', NULL, NULL, b'1', 3, 29, 52),
(1108, '', '2024-06-26 15:47:07.606621', '', NULL, NULL, b'1', 4, 29, 52),
(1109, '', '2024-06-26 15:47:07.610627', '', NULL, NULL, b'1', 5, 29, 52),
(1110, '', '2024-06-26 15:47:07.614614', '', NULL, NULL, b'1', 6, 29, 52),
(1111, '', '2024-06-26 15:47:07.618622', '', NULL, NULL, b'1', 1, 30, 52),
(1112, '', '2024-06-26 15:47:07.622617', '', NULL, NULL, b'1', 2, 30, 52),
(1113, '', '2024-06-26 15:47:07.626625', '', NULL, NULL, b'1', 3, 30, 52),
(1114, '', '2024-06-26 15:47:07.631616', '', NULL, NULL, b'1', 4, 30, 52),
(1115, '', '2024-06-26 15:47:07.634624', '', NULL, NULL, b'1', 5, 30, 52),
(1116, '', '2024-06-26 15:47:07.638615', '', NULL, NULL, b'1', 6, 30, 52),
(1117, '', '2024-06-26 15:47:07.640625', '', NULL, NULL, b'1', 1, 31, 52),
(1118, '', '2024-06-26 15:47:07.644626', '', NULL, NULL, b'1', 2, 31, 52),
(1119, '', '2024-06-26 15:47:07.646616', '', NULL, NULL, b'1', 3, 31, 52),
(1120, '', '2024-06-26 15:47:07.650629', '', NULL, NULL, b'1', 4, 31, 52),
(1121, '', '2024-06-26 15:47:07.653617', '', NULL, NULL, b'1', 5, 31, 52),
(1122, '', '2024-06-26 15:47:07.656616', '', NULL, NULL, b'1', 6, 31, 52),
(1123, '', '2024-06-26 15:47:07.659627', '', NULL, NULL, b'1', 1, 32, 52),
(1124, '', '2024-06-26 15:47:07.662615', '', NULL, NULL, b'1', 2, 32, 52),
(1125, '', '2024-06-26 15:47:07.664617', '', NULL, NULL, b'1', 3, 32, 52),
(1126, '', '2024-06-26 15:47:07.667621', '', NULL, NULL, b'1', 4, 32, 52),
(1127, '', '2024-06-26 15:47:07.671618', '', NULL, NULL, b'1', 5, 32, 52),
(1128, '', '2024-06-26 15:47:07.673615', '', NULL, NULL, b'1', 6, 32, 52),
(1129, '', '2024-06-26 15:47:07.676617', '', NULL, NULL, b'1', 1, 33, 52),
(1130, '', '2024-06-26 15:47:07.678636', '', NULL, NULL, b'1', 2, 33, 52),
(1131, '', '2024-06-26 15:47:07.681618', '', NULL, NULL, b'1', 3, 33, 52),
(1132, '', '2024-06-26 15:47:07.683614', '', NULL, NULL, b'1', 4, 33, 52),
(1133, '', '2024-06-26 15:47:07.687617', '', NULL, NULL, b'1', 5, 33, 52),
(1134, '', '2024-06-26 15:47:07.689615', '', NULL, NULL, b'1', 6, 33, 52),
(1135, '', '2024-06-26 15:47:07.692616', '', NULL, NULL, b'1', 1, 34, 52),
(1136, '', '2024-06-26 15:47:07.695620', '', NULL, NULL, b'1', 2, 34, 52),
(1137, '', '2024-06-26 15:47:07.697617', '', NULL, NULL, b'1', 3, 34, 52),
(1138, '', '2024-06-26 15:47:07.700625', '', NULL, NULL, b'1', 4, 34, 52),
(1139, '', '2024-06-26 15:47:07.703650', '', NULL, NULL, b'1', 5, 34, 52),
(1140, '', '2024-06-26 15:47:07.706618', '', NULL, NULL, b'1', 6, 34, 52),
(1141, '', '2024-06-26 15:47:07.708685', '', NULL, NULL, b'1', 1, 35, 52),
(1142, '', '2024-06-26 15:47:07.711649', '', NULL, NULL, b'1', 2, 35, 52),
(1143, '', '2024-06-26 15:47:07.714619', '', NULL, NULL, b'1', 3, 35, 52),
(1144, '', '2024-06-26 15:47:07.717624', '', NULL, NULL, b'1', 4, 35, 52),
(1145, '', '2024-06-26 15:47:07.720616', '', NULL, NULL, b'1', 5, 35, 52),
(1146, '', '2024-06-26 15:47:07.722615', '', NULL, NULL, b'1', 6, 35, 52),
(1147, '', '2024-06-26 15:47:07.725669', '', NULL, NULL, b'1', 1, 36, 52),
(1148, '', '2024-06-26 15:47:07.728653', '', NULL, NULL, b'1', 2, 36, 52),
(1149, '', '2024-06-26 15:47:07.731617', '', NULL, NULL, b'1', 3, 36, 52),
(1150, '', '2024-06-26 15:47:07.735636', '', NULL, NULL, b'1', 4, 36, 52),
(1151, '', '2024-06-26 15:47:07.737653', '', NULL, NULL, b'1', 5, 36, 52),
(1152, '', '2024-06-26 15:47:07.740628', '', NULL, NULL, b'1', 6, 36, 52),
(1153, '', '2024-06-26 15:47:07.744634', '', NULL, NULL, b'1', 1, 37, 52),
(1154, '', '2024-06-26 15:47:07.747638', '', NULL, NULL, b'1', 2, 37, 52),
(1155, '', '2024-06-26 15:47:07.751669', '', NULL, NULL, b'1', 3, 37, 52),
(1156, '', '2024-06-26 15:47:07.754656', '', NULL, NULL, b'1', 4, 37, 52),
(1157, '', '2024-06-26 15:47:07.758622', '', NULL, NULL, b'1', 5, 37, 52),
(1158, '', '2024-06-26 15:47:07.761706', '', NULL, NULL, b'1', 6, 37, 52),
(1159, '', '2024-06-26 15:47:07.764615', '', NULL, NULL, b'1', 1, 38, 52),
(1160, '', '2024-06-26 15:47:07.768621', '', NULL, NULL, b'1', 2, 38, 52),
(1161, '', '2024-06-26 15:47:07.772614', '', NULL, NULL, b'1', 3, 38, 52),
(1162, '', '2024-06-26 15:47:07.776624', '', NULL, NULL, b'1', 4, 38, 52),
(1163, '', '2024-06-26 15:47:07.780653', '', NULL, NULL, b'1', 5, 38, 52),
(1164, '', '2024-06-26 15:47:07.784621', '', NULL, NULL, b'1', 6, 38, 52),
(1165, '', '2024-06-26 15:47:07.788616', '', NULL, NULL, b'1', 1, 39, 52),
(1166, '', '2024-06-26 15:47:07.791619', '', NULL, NULL, b'1', 2, 39, 52),
(1167, '', '2024-06-26 15:47:07.795673', '', NULL, NULL, b'1', 3, 39, 52),
(1168, '', '2024-06-26 15:47:07.799617', '', NULL, NULL, b'1', 4, 39, 52),
(1169, '', '2024-06-26 15:47:07.803623', '', NULL, NULL, b'1', 5, 39, 52),
(1170, '', '2024-06-26 15:47:07.806617', '', NULL, NULL, b'1', 6, 39, 52),
(1171, '', '2024-06-26 15:47:07.810628', '', NULL, NULL, b'1', 1, 40, 52),
(1172, '', '2024-06-26 15:47:07.813656', '', NULL, NULL, b'1', 2, 40, 52),
(1173, '', '2024-06-26 15:47:07.817639', '', NULL, NULL, b'1', 3, 40, 52),
(1174, '', '2024-06-26 15:47:07.821621', '', NULL, NULL, b'1', 4, 40, 52),
(1175, '', '2024-06-26 15:47:07.824619', '', NULL, NULL, b'1', 5, 40, 52),
(1176, '', '2024-06-26 15:47:07.828670', '', NULL, NULL, b'1', 6, 40, 52),
(1177, '', '2024-06-26 15:47:07.831620', '', NULL, NULL, b'1', 1, 41, 52),
(1178, '', '2024-06-26 15:47:07.835625', '', NULL, NULL, b'1', 2, 41, 52),
(1179, '', '2024-06-26 15:47:07.839619', '', NULL, NULL, b'1', 3, 41, 52),
(1180, '', '2024-06-26 15:47:07.842636', '', NULL, NULL, b'1', 4, 41, 52),
(1181, '', '2024-06-26 15:47:07.846618', '', NULL, NULL, b'1', 5, 41, 52),
(1182, '', '2024-06-26 15:47:07.849654', '', NULL, NULL, b'1', 6, 41, 52),
(1183, '', '2024-06-26 15:47:07.852622', '', NULL, NULL, b'1', 1, 42, 52),
(1184, '', '2024-06-26 15:47:07.855620', '', NULL, NULL, b'1', 2, 42, 52),
(1185, '', '2024-06-26 15:47:07.858629', '', NULL, NULL, b'1', 3, 42, 52),
(1186, '', '2024-06-26 15:47:07.861717', '', NULL, NULL, b'1', 4, 42, 52),
(1187, '', '2024-06-26 15:47:07.864620', '', NULL, NULL, b'1', 5, 42, 52),
(1188, '', '2024-06-26 15:47:07.867631', '', NULL, NULL, b'1', 6, 42, 52),
(1189, '', '2024-06-26 15:47:07.871617', '', NULL, NULL, b'1', 1, 43, 52),
(1190, '', '2024-06-26 15:47:07.874621', '', NULL, NULL, b'1', 2, 43, 52),
(1191, '', '2024-06-26 15:47:07.878622', '', NULL, NULL, b'1', 3, 43, 52),
(1192, '', '2024-06-26 15:47:07.881617', '', NULL, NULL, b'1', 4, 43, 52),
(1193, '', '2024-06-26 15:47:07.885627', '', NULL, NULL, b'1', 5, 43, 52),
(1194, '', '2024-06-26 15:47:07.887615', '', NULL, NULL, b'1', 6, 43, 52),
(1195, '', '2024-06-26 15:47:07.890620', '', NULL, NULL, b'1', 1, 44, 52),
(1196, '', '2024-06-26 15:47:07.893639', '', NULL, NULL, b'1', 2, 44, 52),
(1197, '', '2024-06-26 15:47:07.896617', '', NULL, NULL, b'1', 3, 44, 52),
(1198, '', '2024-06-26 15:47:07.898620', '', NULL, NULL, b'1', 4, 44, 52),
(1199, '', '2024-06-26 15:47:07.901661', '', NULL, NULL, b'1', 5, 44, 52),
(1200, '', '2024-06-26 15:47:07.904717', '', NULL, NULL, b'1', 6, 44, 52),
(1201, '', '2024-06-26 15:47:07.907617', '', NULL, NULL, b'1', 1, 45, 52),
(1202, '', '2024-06-26 15:47:07.910666', '', NULL, NULL, b'1', 2, 45, 52),
(1203, '', '2024-06-26 15:47:07.913622', '', NULL, NULL, b'1', 3, 45, 52),
(1204, '', '2024-06-26 15:47:07.916618', '', NULL, NULL, b'1', 4, 45, 52),
(1205, '', '2024-06-26 15:47:07.919618', '', NULL, NULL, b'1', 5, 45, 52),
(1206, '', '2024-06-26 15:47:07.922666', '', NULL, NULL, b'1', 6, 45, 52),
(1207, '', '2024-06-26 15:47:07.925673', '', NULL, NULL, b'1', 1, 46, 52),
(1208, '', '2024-06-26 15:47:07.928655', '', NULL, NULL, b'1', 2, 46, 52),
(1209, '', '2024-06-26 15:47:07.931616', '', NULL, NULL, b'1', 3, 46, 52),
(1210, '', '2024-06-26 15:47:07.934623', '', NULL, NULL, b'1', 4, 46, 52),
(1211, '', '2024-06-26 15:47:07.937617', '', NULL, NULL, b'1', 5, 46, 52),
(1212, '', '2024-06-26 15:47:07.940615', '', NULL, NULL, b'1', 6, 46, 52),
(1213, '', '2024-06-26 15:47:07.944620', '', NULL, NULL, b'1', 1, 47, 52),
(1214, '', '2024-06-26 15:47:07.946619', '', NULL, NULL, b'1', 2, 47, 52),
(1215, '', '2024-06-26 15:47:07.950633', '', NULL, NULL, b'1', 3, 47, 52),
(1216, '', '2024-06-26 15:47:07.953656', '', NULL, NULL, b'1', 4, 47, 52),
(1217, '', '2024-06-26 15:47:07.956615', '', NULL, NULL, b'1', 5, 47, 52),
(1218, '', '2024-06-26 15:47:07.960624', '', NULL, NULL, b'1', 6, 47, 52),
(1219, '', '2024-06-26 15:47:07.963637', '', NULL, NULL, b'1', 1, 48, 52),
(1220, '', '2024-06-26 15:47:07.966652', '', NULL, NULL, b'1', 2, 48, 52),
(1221, '', '2024-06-26 15:47:07.970623', '', NULL, NULL, b'1', 3, 48, 52),
(1222, '', '2024-06-26 15:47:07.973630', '', NULL, NULL, b'1', 4, 48, 52),
(1223, '', '2024-06-26 15:47:07.976634', '', NULL, NULL, b'1', 5, 48, 52),
(1224, '', '2024-06-26 15:47:07.980618', '', NULL, NULL, b'1', 6, 48, 52),
(1225, '', '2024-06-26 15:47:07.984619', '', NULL, NULL, b'1', 1, 49, 52),
(1226, '', '2024-06-26 15:47:07.988621', '', NULL, NULL, b'1', 2, 49, 52),
(1227, '', '2024-06-26 15:47:07.992627', '', NULL, NULL, b'1', 3, 49, 52),
(1228, '', '2024-06-26 15:47:07.997616', '', NULL, NULL, b'1', 4, 49, 52),
(1229, '', '2024-06-26 15:47:08.001619', '', NULL, NULL, b'1', 5, 49, 52),
(1230, '', '2024-06-26 15:47:08.005616', '', NULL, NULL, b'1', 6, 49, 52),
(1231, '', '2024-06-26 15:47:08.009625', '', NULL, NULL, b'1', 1, 50, 52),
(1232, '', '2024-06-26 15:47:08.014620', '', NULL, NULL, b'1', 2, 50, 52),
(1233, '', '2024-06-26 15:47:08.018623', '', NULL, NULL, b'1', 3, 50, 52),
(1234, '', '2024-06-26 15:47:08.021621', '', NULL, NULL, b'1', 4, 50, 52),
(1235, '', '2024-06-26 15:47:08.025615', '', NULL, NULL, b'1', 5, 50, 52),
(1236, '', '2024-06-26 15:47:08.029661', '', NULL, NULL, b'1', 6, 50, 52),
(1237, '', '2024-06-26 15:47:08.032621', '', NULL, NULL, b'1', 1, 51, 52),
(1238, '', '2024-06-26 15:47:08.036643', '', NULL, NULL, b'1', 2, 51, 52),
(1239, '', '2024-06-26 15:47:08.039617', '', NULL, NULL, b'1', 3, 51, 52),
(1240, '', '2024-06-26 15:47:08.042619', '', NULL, NULL, b'1', 4, 51, 52),
(1241, '', '2024-06-26 15:47:08.046618', '', NULL, NULL, b'1', 5, 51, 52),
(1242, '', '2024-06-26 15:47:08.049616', '', NULL, NULL, b'1', 6, 51, 52),
(1243, '', '2024-06-26 15:47:08.052627', '', NULL, NULL, b'1', 1, 52, 52),
(1244, '', '2024-06-26 15:47:08.055667', '', NULL, NULL, b'1', 2, 52, 52),
(1245, '', '2024-06-26 15:47:08.058658', '', NULL, NULL, b'1', 3, 52, 52),
(1246, '', '2024-06-26 15:47:08.061656', '', NULL, NULL, b'1', 4, 52, 52),
(1247, '', '2024-06-26 15:47:08.064617', '', NULL, NULL, b'1', 5, 52, 52),
(1248, '', '2024-06-26 15:47:08.067622', '', NULL, NULL, b'1', 6, 52, 52),
(1249, '', '2024-06-26 15:47:08.070658', '', NULL, NULL, b'1', 1, 53, 52),
(1250, '', '2024-06-26 15:47:08.073621', '', NULL, NULL, b'1', 2, 53, 52),
(1251, '', '2024-06-26 15:47:08.075731', '', NULL, NULL, b'1', 3, 53, 52),
(1252, '', '2024-06-26 15:47:08.078718', '', NULL, NULL, b'1', 4, 53, 52),
(1253, '', '2024-06-26 15:47:08.081616', '', NULL, NULL, b'1', 5, 53, 52),
(1254, '', '2024-06-26 15:47:08.084666', '', NULL, NULL, b'1', 6, 53, 52),
(1255, '', '2024-06-26 15:47:08.086716', '', NULL, NULL, b'1', 1, 54, 52),
(1256, '', '2024-06-26 15:47:08.089615', '', NULL, NULL, b'1', 2, 54, 52),
(1257, '', '2024-06-26 15:47:08.092623', '', NULL, NULL, b'1', 3, 54, 52),
(1258, '', '2024-06-26 15:47:08.095621', '', NULL, NULL, b'1', 4, 54, 52),
(1259, '', '2024-06-26 15:47:08.097655', '', NULL, NULL, b'1', 5, 54, 52),
(1260, '', '2024-06-26 15:47:08.100727', '', NULL, NULL, b'1', 6, 54, 52),
(1261, '', '2024-06-26 15:47:08.103658', '', NULL, NULL, b'1', 1, 55, 52),
(1262, '', '2024-06-26 15:47:08.106616', '', NULL, NULL, b'1', 2, 55, 52),
(1263, '', '2024-06-26 15:47:08.108659', '', NULL, NULL, b'1', 3, 55, 52),
(1264, '', '2024-06-26 15:47:08.111654', '', NULL, NULL, b'1', 4, 55, 52),
(1265, '', '2024-06-26 15:47:08.114616', '', NULL, NULL, b'1', 5, 55, 52),
(1266, '', '2024-06-26 15:47:08.118622', '', NULL, NULL, b'1', 6, 55, 52),
(1267, '', '2024-06-26 15:47:08.121622', '', NULL, NULL, b'1', 1, 56, 52),
(1268, '', '2024-06-26 15:47:08.124621', '', NULL, NULL, b'1', 2, 56, 52),
(1269, '', '2024-06-26 15:47:08.127616', '', NULL, NULL, b'1', 3, 56, 52),
(1270, '', '2024-06-26 15:47:08.129616', '', NULL, NULL, b'1', 4, 56, 52),
(1271, '', '2024-06-26 15:47:08.132615', '', NULL, NULL, b'1', 5, 56, 52),
(1272, '', '2024-06-26 15:47:08.136622', '', NULL, NULL, b'1', 6, 56, 52),
(1273, '', '2024-06-26 15:47:08.138655', '', NULL, NULL, b'1', 1, 57, 52),
(1274, '', '2024-06-26 15:47:08.142622', '', NULL, NULL, b'1', 2, 57, 52),
(1275, '', '2024-06-26 15:47:08.145613', '', NULL, NULL, b'1', 3, 57, 52),
(1276, '', '2024-06-26 15:47:08.148619', '', NULL, NULL, b'1', 4, 57, 52),
(1277, '', '2024-06-26 15:47:08.151630', '', NULL, NULL, b'1', 5, 57, 52),
(1278, '', '2024-06-26 15:47:08.154619', '', NULL, NULL, b'1', 6, 57, 52),
(1279, '', '2024-06-26 15:47:08.157623', '', NULL, NULL, b'1', 1, 58, 52),
(1280, '', '2024-06-26 15:47:08.160619', '', NULL, NULL, b'1', 2, 58, 52),
(1281, '', '2024-06-26 15:47:08.163618', '', NULL, NULL, b'1', 3, 58, 52),
(1282, '', '2024-06-26 15:47:08.167619', '', NULL, NULL, b'1', 4, 58, 52),
(1283, '', '2024-06-26 15:47:08.170658', '', NULL, NULL, b'1', 5, 58, 52),
(1284, '', '2024-06-26 15:47:08.173625', '', NULL, NULL, b'1', 6, 58, 52),
(1285, '', '2024-06-26 15:47:08.176634', '', NULL, NULL, b'1', 1, 59, 52),
(1286, '', '2024-06-26 15:47:08.180617', '', NULL, NULL, b'1', 2, 59, 52),
(1287, '', '2024-06-26 15:47:08.184648', '', NULL, NULL, b'1', 3, 59, 52),
(1288, '', '2024-06-26 15:47:08.187620', '', NULL, NULL, b'1', 4, 59, 52),
(1289, '', '2024-06-26 15:47:08.190620', '', NULL, NULL, b'1', 5, 59, 52),
(1290, '', '2024-06-26 15:47:08.193626', '', NULL, NULL, b'1', 6, 59, 52),
(1291, '', '2024-06-26 15:47:08.196616', '', NULL, NULL, b'1', 1, 60, 52),
(1292, '', '2024-06-26 15:47:08.200638', '', NULL, NULL, b'1', 2, 60, 52),
(1293, '', '2024-06-26 15:47:08.204620', '', NULL, NULL, b'1', 3, 60, 52),
(1294, '', '2024-06-26 15:47:08.206618', '', NULL, NULL, b'1', 4, 60, 52),
(1295, '', '2024-06-26 15:47:08.209622', '', NULL, NULL, b'1', 5, 60, 52),
(1296, '', '2024-06-26 15:47:08.213620', '', NULL, NULL, b'1', 6, 60, 52),
(1297, '', '2024-06-26 15:47:08.216615', '', NULL, NULL, b'1', 1, 61, 52),
(1298, '', '2024-06-26 15:47:08.220619', '', NULL, NULL, b'1', 2, 61, 52),
(1299, '', '2024-06-26 15:47:08.223624', '', NULL, NULL, b'1', 3, 61, 52),
(1300, '', '2024-06-26 15:47:08.226626', '', NULL, NULL, b'1', 4, 61, 52),
(1301, '', '2024-06-26 15:47:08.229617', '', NULL, NULL, b'1', 5, 61, 52),
(1302, '', '2024-06-26 15:47:08.233623', '', NULL, NULL, b'1', 6, 61, 52),
(1303, '', '2024-06-26 15:47:08.236645', '', NULL, NULL, b'1', 1, 62, 52),
(1304, '', '2024-06-26 15:47:08.239615', '', NULL, NULL, b'1', 2, 62, 52),
(1305, '', '2024-06-26 15:47:08.243659', '', NULL, NULL, b'1', 3, 62, 52),
(1306, '', '2024-06-26 15:47:08.246619', '', NULL, NULL, b'1', 4, 62, 52),
(1307, '', '2024-06-26 15:47:08.249621', '', NULL, NULL, b'1', 5, 62, 52),
(1308, '', '2024-06-26 15:47:08.252629', '', NULL, NULL, b'1', 6, 62, 52),
(1309, '', '2024-06-26 15:47:08.255618', '', NULL, NULL, b'1', 1, 63, 52),
(1310, '', '2024-06-26 15:47:08.257620', '', NULL, NULL, b'1', 2, 63, 52),
(1311, '', '2024-06-26 15:47:08.260723', '', NULL, NULL, b'1', 3, 63, 52),
(1312, '', '2024-06-26 15:47:08.263662', '', NULL, NULL, b'1', 4, 63, 52),
(1313, '', '2024-06-26 15:47:08.266626', '', NULL, NULL, b'1', 5, 63, 52),
(1314, '', '2024-06-26 15:47:08.269620', '', NULL, NULL, b'1', 6, 63, 52),
(1315, '', '2024-06-26 15:47:08.271719', '', NULL, NULL, b'1', 1, 64, 52),
(1316, '', '2024-06-26 15:47:08.274618', '', NULL, NULL, b'1', 2, 64, 52),
(1317, '', '2024-06-26 15:47:08.277624', '', NULL, NULL, b'1', 3, 64, 52),
(1318, '', '2024-06-26 15:47:08.279717', '', NULL, NULL, b'1', 4, 64, 52),
(1319, '', '2024-06-26 15:47:08.283624', '', NULL, NULL, b'1', 5, 64, 52),
(1320, '', '2024-06-26 15:47:08.286621', '', NULL, NULL, b'1', 6, 64, 52),
(1321, '', '2024-06-26 15:47:08.289620', '', NULL, NULL, b'1', 1, 65, 52),
(1322, '', '2024-06-26 15:47:08.292655', '', NULL, NULL, b'1', 2, 65, 52),
(1323, '', '2024-06-26 15:47:08.295702', '', NULL, NULL, b'1', 3, 65, 52),
(1324, '', '2024-06-26 15:47:08.297619', '', NULL, NULL, b'1', 4, 65, 52),
(1325, '', '2024-06-26 15:47:08.300618', '', NULL, NULL, b'1', 5, 65, 52),
(1326, '', '2024-06-26 15:47:08.303616', '', NULL, NULL, b'1', 6, 65, 52),
(1327, '', '2024-06-26 15:47:08.306617', '', NULL, NULL, b'1', 1, 66, 52),
(1328, '', '2024-06-26 15:47:08.308741', '', NULL, NULL, b'1', 2, 66, 52),
(1329, '', '2024-06-26 15:47:08.312632', '', NULL, NULL, b'1', 3, 66, 52),
(1330, '', '2024-06-26 15:47:08.317634', '', NULL, NULL, b'1', 4, 66, 52),
(1331, '', '2024-06-26 15:47:08.322640', '', NULL, NULL, b'1', 5, 66, 52),
(1332, '', '2024-06-26 15:47:08.329634', '', NULL, NULL, b'1', 6, 66, 52),
(1333, '', '2024-06-26 15:47:08.335641', '', NULL, NULL, b'1', 1, 67, 52),
(1334, '', '2024-06-26 15:47:08.339626', '', NULL, NULL, b'1', 2, 67, 52),
(1335, '', '2024-06-26 15:47:08.342636', '', NULL, NULL, b'1', 3, 67, 52),
(1336, '', '2024-06-26 15:47:08.346633', '', NULL, NULL, b'1', 4, 67, 52),
(1337, '', '2024-06-26 15:47:08.349615', '', NULL, NULL, b'1', 5, 67, 52),
(1338, '', '2024-06-26 15:47:08.353618', '', NULL, NULL, b'1', 6, 67, 52),
(1339, '', '2024-06-26 15:47:08.356623', '', NULL, NULL, b'1', 1, 68, 52),
(1340, '', '2024-06-26 15:47:08.359616', '', NULL, NULL, b'1', 2, 68, 52),
(1341, '', '2024-06-26 15:47:08.362614', '', NULL, NULL, b'1', 3, 68, 52),
(1342, '', '2024-06-26 15:47:08.364615', '', NULL, NULL, b'1', 4, 68, 52),
(1343, '', '2024-06-26 15:47:08.367623', '', NULL, NULL, b'1', 5, 68, 52),
(1344, '', '2024-06-26 15:47:08.371614', '', NULL, NULL, b'1', 6, 68, 52),
(1345, '', '2024-06-26 15:47:08.373621', '', NULL, NULL, b'1', 1, 69, 52),
(1346, '', '2024-06-26 15:47:08.376659', '', NULL, NULL, b'1', 2, 69, 52),
(1347, '', '2024-06-26 15:47:08.379672', '', NULL, NULL, b'1', 3, 69, 52),
(1348, '', '2024-06-26 15:47:08.383653', '', NULL, NULL, b'1', 4, 69, 52),
(1349, '', '2024-06-26 15:47:08.386637', '', NULL, NULL, b'1', 5, 69, 52),
(1350, '', '2024-06-26 15:47:08.389616', '', NULL, NULL, b'1', 6, 69, 52),
(1351, '', '2024-06-26 15:47:08.392636', '', NULL, NULL, b'1', 1, 70, 52),
(1352, '', '2024-06-26 15:47:08.395658', '', NULL, NULL, b'1', 2, 70, 52),
(1353, '', '2024-06-26 15:47:08.398626', '', NULL, NULL, b'1', 3, 70, 52),
(1354, '', '2024-06-26 15:47:08.401631', '', NULL, NULL, b'1', 4, 70, 52),
(1355, '', '2024-06-26 15:47:08.404651', '', NULL, NULL, b'1', 5, 70, 52),
(1356, '', '2024-06-26 15:47:08.408655', '', NULL, NULL, b'1', 6, 70, 52),
(1357, '', '2024-06-26 15:47:08.411681', '', NULL, NULL, b'1', 1, 71, 52),
(1358, '', '2024-06-26 15:47:08.415625', '', NULL, NULL, b'1', 2, 71, 52),
(1359, '', '2024-06-26 15:47:08.418626', '', NULL, NULL, b'1', 3, 71, 52),
(1360, '', '2024-06-26 15:47:08.421657', '', NULL, NULL, b'1', 4, 71, 52),
(1361, '', '2024-06-26 15:47:08.424651', '', NULL, NULL, b'1', 5, 71, 52),
(1362, '', '2024-06-26 15:47:08.428621', '', NULL, NULL, b'1', 6, 71, 52),
(1363, '', '2024-06-26 15:47:08.430654', '', NULL, NULL, b'1', 1, 72, 52),
(1364, '', '2024-06-26 15:47:08.433660', '', NULL, NULL, b'1', 2, 72, 52),
(1365, '', '2024-06-26 15:47:08.436616', '', NULL, NULL, b'1', 3, 72, 52),
(1366, '', '2024-06-26 15:47:08.439618', '', NULL, NULL, b'1', 4, 72, 52),
(1367, '', '2024-06-26 15:47:08.442623', '', NULL, NULL, b'1', 5, 72, 52),
(1368, '', '2024-06-26 15:47:08.445655', '', NULL, NULL, b'1', 6, 72, 52),
(1369, '', '2024-06-26 15:47:08.449617', '', NULL, NULL, b'1', 1, 73, 52),
(1370, '', '2024-06-26 15:47:08.452631', '', NULL, NULL, b'1', 2, 73, 52),
(1371, '', '2024-06-26 15:47:08.455666', '', NULL, NULL, b'1', 3, 73, 52),
(1372, '', '2024-06-26 15:47:08.458624', '', NULL, NULL, b'1', 4, 73, 52),
(1373, '', '2024-06-26 15:47:08.461617', '', NULL, NULL, b'1', 5, 73, 52),
(1374, '', '2024-06-26 15:47:08.463717', '', NULL, NULL, b'1', 6, 73, 52),
(1375, '', '2024-06-26 15:47:08.466623', '', NULL, NULL, b'1', 1, 74, 52),
(1376, '', '2024-06-26 15:47:08.468620', '', NULL, NULL, b'1', 2, 74, 52),
(1377, '', '2024-06-26 15:47:08.471661', '', NULL, NULL, b'1', 3, 74, 52),
(1378, '', '2024-06-26 15:47:08.474664', '', NULL, NULL, b'1', 4, 74, 52),
(1379, '', '2024-06-26 15:47:08.476665', '', NULL, NULL, b'1', 5, 74, 52),
(1380, '', '2024-06-26 15:47:08.479658', '', NULL, NULL, b'1', 6, 74, 52),
(1381, '', '2024-06-26 15:47:08.484625', '', NULL, NULL, b'1', 1, 75, 52),
(1382, '', '2024-06-26 15:47:08.490634', '', NULL, NULL, b'1', 2, 75, 52),
(1383, '', '2024-06-26 15:47:08.495685', '', NULL, NULL, b'1', 3, 75, 52),
(1384, '', '2024-06-26 15:47:08.501627', '', NULL, NULL, b'1', 4, 75, 52),
(1385, '', '2024-06-26 15:47:08.506626', '', NULL, NULL, b'1', 5, 75, 52),
(1386, '', '2024-06-26 15:47:08.511638', '', NULL, NULL, b'1', 6, 75, 52),
(1387, '', '2024-06-26 15:47:08.516620', '', NULL, NULL, b'1', 1, 76, 52),
(1388, '', '2024-06-26 15:47:08.521645', '', NULL, NULL, b'1', 2, 76, 52),
(1389, '', '2024-06-26 15:47:08.526634', '', NULL, NULL, b'1', 3, 76, 52),
(1390, '', '2024-06-26 15:47:08.531628', '', NULL, NULL, b'1', 4, 76, 52),
(1391, '', '2024-06-26 15:47:08.536636', '', NULL, NULL, b'1', 5, 76, 52),
(1392, '', '2024-06-26 15:47:08.540626', '', NULL, NULL, b'1', 6, 76, 52),
(1393, '', '2024-06-26 15:47:08.544662', '', NULL, NULL, b'1', 1, 77, 52),
(1394, '', '2024-06-26 15:47:08.548627', '', NULL, NULL, b'1', 2, 77, 52);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(1395, '', '2024-06-26 15:47:08.551627', '', NULL, NULL, b'1', 3, 77, 52),
(1396, '', '2024-06-26 15:47:08.554660', '', NULL, NULL, b'1', 4, 77, 52),
(1397, '', '2024-06-26 15:47:08.559620', '', NULL, NULL, b'1', 5, 77, 52),
(1398, '', '2024-06-26 15:47:08.563615', '', NULL, NULL, b'1', 6, 77, 52),
(1399, '', '2024-06-26 15:47:08.568624', '', NULL, NULL, b'1', 1, 78, 52),
(1400, '', '2024-06-26 15:47:08.572617', '', NULL, NULL, b'1', 2, 78, 52),
(1401, '', '2024-06-26 15:47:08.576618', '', NULL, NULL, b'1', 3, 78, 52),
(1402, '', '2024-06-26 15:47:08.579618', '', NULL, NULL, b'1', 4, 78, 52),
(1403, '', '2024-06-26 15:47:08.582616', '', NULL, NULL, b'1', 5, 78, 52),
(1404, '', '2024-06-26 15:47:08.586685', '', NULL, NULL, b'1', 6, 78, 52),
(1405, '', '2024-06-26 15:47:09.465625', '', NULL, NULL, b'1', 1, 1, 53),
(1406, '', '2024-06-26 15:47:09.470621', '', NULL, NULL, b'1', 2, 1, 53),
(1407, '', '2024-06-26 15:47:09.473621', '', NULL, NULL, b'1', 3, 1, 53),
(1408, '', '2024-06-26 15:47:09.477628', '', NULL, NULL, b'1', 4, 1, 53),
(1409, '', '2024-06-26 15:47:09.480618', '', NULL, NULL, b'1', 5, 1, 53),
(1410, '', '2024-06-26 15:47:09.483630', '', NULL, NULL, b'1', 6, 1, 53),
(1411, '', '2024-06-26 15:47:09.487615', '', NULL, NULL, b'1', 1, 2, 53),
(1412, '', '2024-06-26 15:47:09.490619', '', NULL, NULL, b'1', 2, 2, 53),
(1413, '', '2024-06-26 15:47:09.494627', '', NULL, NULL, b'1', 3, 2, 53),
(1414, '', '2024-06-26 15:47:09.497616', '', NULL, NULL, b'1', 4, 2, 53),
(1415, '', '2024-06-26 15:47:09.500625', '', NULL, NULL, b'1', 5, 2, 53),
(1416, '', '2024-06-26 15:47:09.504617', '', NULL, NULL, b'1', 6, 2, 53),
(1417, '', '2024-06-26 15:47:09.508635', '', NULL, NULL, b'1', 1, 3, 53),
(1418, '', '2024-06-26 15:47:09.512623', '', NULL, NULL, b'1', 2, 3, 53),
(1419, '', '2024-06-26 15:47:09.515620', '', NULL, NULL, b'1', 3, 3, 53),
(1420, '', '2024-06-26 15:47:09.519617', '', NULL, NULL, b'1', 4, 3, 53),
(1421, '', '2024-06-26 15:47:09.522622', '', NULL, NULL, b'1', 5, 3, 53),
(1422, '', '2024-06-26 15:47:09.525621', '', NULL, NULL, b'1', 6, 3, 53),
(1423, '', '2024-06-26 15:47:09.528615', '', NULL, NULL, b'1', 1, 4, 53),
(1424, '', '2024-06-26 15:47:09.531658', '', NULL, NULL, b'1', 2, 4, 53),
(1425, '', '2024-06-26 15:47:09.534619', '', NULL, NULL, b'1', 3, 4, 53),
(1426, '', '2024-06-26 15:47:09.537619', '', NULL, NULL, b'1', 4, 4, 53),
(1427, '', '2024-06-26 15:47:09.540618', '', NULL, NULL, b'1', 5, 4, 53),
(1428, '', '2024-06-26 15:47:09.543615', '', NULL, NULL, b'1', 6, 4, 53),
(1429, '', '2024-06-26 15:47:09.546622', '', NULL, NULL, b'1', 1, 5, 53),
(1430, '', '2024-06-26 15:47:09.549636', '', NULL, NULL, b'1', 2, 5, 53),
(1431, '', '2024-06-26 15:47:09.552657', '', NULL, NULL, b'1', 3, 5, 53),
(1432, '', '2024-06-26 15:47:09.556620', '', NULL, NULL, b'1', 4, 5, 53),
(1433, '', '2024-06-26 15:47:09.559623', '', NULL, NULL, b'1', 5, 5, 53),
(1434, '', '2024-06-26 15:47:09.562617', '', NULL, NULL, b'1', 6, 5, 53),
(1435, '', '2024-06-26 15:47:09.566617', '', NULL, NULL, b'1', 1, 6, 53),
(1436, '', '2024-06-26 15:47:09.570616', '', NULL, NULL, b'1', 2, 6, 53),
(1437, '', '2024-06-26 15:47:09.573618', '', NULL, NULL, b'1', 3, 6, 53),
(1438, '', '2024-06-26 15:47:09.577620', '', NULL, NULL, b'1', 4, 6, 53),
(1439, '', '2024-06-26 15:47:09.580617', '', NULL, NULL, b'1', 5, 6, 53),
(1440, '', '2024-06-26 15:47:09.584619', '', NULL, NULL, b'1', 6, 6, 53),
(1441, '', '2024-06-26 15:47:09.587627', '', NULL, NULL, b'1', 1, 7, 53),
(1442, '', '2024-06-26 15:47:09.590616', '', NULL, NULL, b'1', 2, 7, 53),
(1443, '', '2024-06-26 15:47:09.594622', '', NULL, NULL, b'1', 3, 7, 53),
(1444, '', '2024-06-26 15:47:09.597619', '', NULL, NULL, b'1', 4, 7, 53),
(1445, '', '2024-06-26 15:47:09.600622', '', NULL, NULL, b'1', 5, 7, 53),
(1446, '', '2024-06-26 15:47:09.604622', '', NULL, NULL, b'1', 6, 7, 53),
(1447, '', '2024-06-26 15:47:09.608625', '', NULL, NULL, b'1', 1, 8, 53),
(1448, '', '2024-06-26 15:47:09.611618', '', NULL, NULL, b'1', 2, 8, 53),
(1449, '', '2024-06-26 15:47:09.614621', '', NULL, NULL, b'1', 3, 8, 53),
(1450, '', '2024-06-26 15:47:09.617637', '', NULL, NULL, b'1', 4, 8, 53),
(1451, '', '2024-06-26 15:47:09.619635', '', NULL, NULL, b'1', 5, 8, 53),
(1452, '', '2024-06-26 15:47:09.621619', '', NULL, NULL, b'1', 6, 8, 53),
(1453, '', '2024-06-26 15:47:09.624626', '', NULL, NULL, b'1', 1, 9, 53),
(1454, '', '2024-06-26 15:47:09.627615', '', NULL, NULL, b'1', 2, 9, 53),
(1455, '', '2024-06-26 15:47:09.629635', '', NULL, NULL, b'1', 3, 9, 53),
(1456, '', '2024-06-26 15:47:09.632618', '', NULL, NULL, b'1', 4, 9, 53),
(1457, '', '2024-06-26 15:47:09.635635', '', NULL, NULL, b'1', 5, 9, 53),
(1458, '', '2024-06-26 15:47:09.637614', '', NULL, NULL, b'1', 6, 9, 53),
(1459, '', '2024-06-26 15:47:09.640616', '', NULL, NULL, b'1', 1, 10, 53),
(1460, '', '2024-06-26 15:47:09.643634', '', NULL, NULL, b'1', 2, 10, 53),
(1461, '', '2024-06-26 15:47:09.645635', '', NULL, NULL, b'1', 3, 10, 53),
(1462, '', '2024-06-26 15:47:09.659723', '', NULL, NULL, b'1', 4, 10, 53),
(1463, '', '2024-06-26 15:47:09.662637', '', NULL, NULL, b'1', 5, 10, 53),
(1464, '', '2024-06-26 15:47:09.665622', '', NULL, NULL, b'1', 6, 10, 53),
(1465, '', '2024-06-26 15:47:09.668617', '', NULL, NULL, b'1', 1, 11, 53),
(1466, '', '2024-06-26 15:47:09.671616', '', NULL, NULL, b'1', 2, 11, 53),
(1467, '', '2024-06-26 15:47:09.674624', '', NULL, NULL, b'1', 3, 11, 53),
(1468, '', '2024-06-26 15:47:09.677653', '', NULL, NULL, b'1', 4, 11, 53),
(1469, '', '2024-06-26 15:47:09.680617', '', NULL, NULL, b'1', 5, 11, 53),
(1470, '', '2024-06-26 15:47:09.683635', '', NULL, NULL, b'1', 6, 11, 53),
(1471, '', '2024-06-26 15:47:09.686618', '', NULL, NULL, b'1', 1, 12, 53),
(1472, '', '2024-06-26 15:47:09.689623', '', NULL, NULL, b'1', 2, 12, 53),
(1473, '', '2024-06-26 15:47:09.692618', '', NULL, NULL, b'1', 3, 12, 53),
(1474, '', '2024-06-26 15:47:09.695656', '', NULL, NULL, b'1', 4, 12, 53),
(1475, '', '2024-06-26 15:47:09.698622', '', NULL, NULL, b'1', 5, 12, 53),
(1476, '', '2024-06-26 15:47:09.702647', '', NULL, NULL, b'1', 6, 12, 53),
(1477, '', '2024-06-26 15:47:09.705619', '', NULL, NULL, b'1', 1, 13, 53),
(1478, '', '2024-06-26 15:47:09.708631', '', NULL, NULL, b'1', 2, 13, 53),
(1479, '', '2024-06-26 15:47:09.712615', '', NULL, NULL, b'1', 3, 13, 53),
(1480, '', '2024-06-26 15:47:09.715660', '', NULL, NULL, b'1', 4, 13, 53),
(1481, '', '2024-06-26 15:47:09.719625', '', NULL, NULL, b'1', 5, 13, 53),
(1482, '', '2024-06-26 15:47:09.721615', '', NULL, NULL, b'1', 6, 13, 53),
(1483, '', '2024-06-26 15:47:09.725621', '', NULL, NULL, b'1', 1, 14, 53),
(1484, '', '2024-06-26 15:47:09.728618', '', NULL, NULL, b'1', 2, 14, 53),
(1485, '', '2024-06-26 15:47:09.731624', '', NULL, NULL, b'1', 3, 14, 53),
(1486, '', '2024-06-26 15:47:09.735636', '', NULL, NULL, b'1', 4, 14, 53),
(1487, '', '2024-06-26 15:47:09.738617', '', NULL, NULL, b'1', 5, 14, 53),
(1488, '', '2024-06-26 15:47:09.741624', '', NULL, NULL, b'1', 6, 14, 53),
(1489, '', '2024-06-26 15:47:09.745661', '', NULL, NULL, b'1', 1, 15, 53),
(1490, '', '2024-06-26 15:47:09.748619', '', NULL, NULL, b'1', 2, 15, 53),
(1491, '', '2024-06-26 15:47:09.752684', '', NULL, NULL, b'1', 3, 15, 53),
(1492, '', '2024-06-26 15:47:09.755626', '', NULL, NULL, b'1', 4, 15, 53),
(1493, '', '2024-06-26 15:47:09.758620', '', NULL, NULL, b'1', 5, 15, 53),
(1494, '', '2024-06-26 15:47:09.761656', '', NULL, NULL, b'1', 6, 15, 53),
(1495, '', '2024-06-26 15:47:09.764659', '', NULL, NULL, b'1', 1, 16, 53),
(1496, '', '2024-06-26 15:47:09.768627', '', NULL, NULL, b'1', 2, 16, 53),
(1497, '', '2024-06-26 15:47:09.771617', '', NULL, NULL, b'1', 3, 16, 53),
(1498, '', '2024-06-26 15:47:09.774624', '', NULL, NULL, b'1', 4, 16, 53),
(1499, '', '2024-06-26 15:47:09.777625', '', NULL, NULL, b'1', 5, 16, 53),
(1500, '', '2024-06-26 15:47:09.780618', '', NULL, NULL, b'1', 6, 16, 53),
(1501, '', '2024-06-26 15:47:09.783623', '', NULL, NULL, b'1', 1, 17, 53),
(1502, '', '2024-06-26 15:47:09.786719', '', NULL, NULL, b'1', 2, 17, 53),
(1503, '', '2024-06-26 15:47:09.789626', '', NULL, NULL, b'1', 3, 17, 53),
(1504, '', '2024-06-26 15:47:09.792626', '', NULL, NULL, b'1', 4, 17, 53),
(1505, '', '2024-06-26 15:47:09.795621', '', NULL, NULL, b'1', 5, 17, 53),
(1506, '', '2024-06-26 15:47:09.797616', '', NULL, NULL, b'1', 6, 17, 53),
(1507, '', '2024-06-26 15:47:09.800713', '', NULL, NULL, b'1', 1, 18, 53),
(1508, '', '2024-06-26 15:47:09.803717', '', NULL, NULL, b'1', 2, 18, 53),
(1509, '', '2024-06-26 15:47:09.805618', '', NULL, NULL, b'1', 3, 18, 53),
(1510, '', '2024-06-26 15:47:09.809616', '', NULL, NULL, b'1', 4, 18, 53),
(1511, '', '2024-06-26 15:47:09.811717', '', NULL, NULL, b'1', 5, 18, 53),
(1512, '', '2024-06-26 15:47:09.814624', '', NULL, NULL, b'1', 6, 18, 53),
(1513, '', '2024-06-26 15:47:09.817623', '', NULL, NULL, b'1', 1, 19, 53),
(1514, '', '2024-06-26 15:47:09.819719', '', NULL, NULL, b'1', 2, 19, 53),
(1515, '', '2024-06-26 15:47:09.822614', '', NULL, NULL, b'1', 3, 19, 53),
(1516, '', '2024-06-26 15:47:09.825678', '', NULL, NULL, b'1', 4, 19, 53),
(1517, '', '2024-06-26 15:47:09.828619', '', NULL, NULL, b'1', 5, 19, 53),
(1518, '', '2024-06-26 15:47:09.830616', '', NULL, NULL, b'1', 6, 19, 53),
(1519, '', '2024-06-26 15:47:09.833679', '', NULL, NULL, b'1', 1, 20, 53),
(1520, '', '2024-06-26 15:47:09.835617', '', NULL, NULL, b'1', 2, 20, 53),
(1521, '', '2024-06-26 15:47:09.838615', '', NULL, NULL, b'1', 3, 20, 53),
(1522, '', '2024-06-26 15:47:09.841626', '', NULL, NULL, b'1', 4, 20, 53),
(1523, '', '2024-06-26 15:47:09.844619', '', NULL, NULL, b'1', 5, 20, 53),
(1524, '', '2024-06-26 15:47:09.846617', '', NULL, NULL, b'1', 6, 20, 53),
(1525, '', '2024-06-26 15:47:09.849626', '', NULL, NULL, b'1', 1, 21, 53),
(1526, '', '2024-06-26 15:47:09.852705', '', NULL, NULL, b'1', 2, 21, 53),
(1527, '', '2024-06-26 15:47:09.855617', '', NULL, NULL, b'1', 3, 21, 53),
(1528, '', '2024-06-26 15:47:09.857619', '', NULL, NULL, b'1', 4, 21, 53),
(1529, '', '2024-06-26 15:47:09.860717', '', NULL, NULL, b'1', 5, 21, 53),
(1530, '', '2024-06-26 15:47:09.863618', '', NULL, NULL, b'1', 6, 21, 53),
(1531, '', '2024-06-26 15:47:09.866626', '', NULL, NULL, b'1', 1, 22, 53),
(1532, '', '2024-06-26 15:47:09.869654', '', NULL, NULL, b'1', 2, 22, 53),
(1533, '', '2024-06-26 15:47:09.872630', '', NULL, NULL, b'1', 3, 22, 53),
(1534, '', '2024-06-26 15:47:09.874672', '', NULL, NULL, b'1', 4, 22, 53),
(1535, '', '2024-06-26 15:47:09.877649', '', NULL, NULL, b'1', 5, 22, 53),
(1536, '', '2024-06-26 15:47:09.880617', '', NULL, NULL, b'1', 6, 22, 53),
(1537, '', '2024-06-26 15:47:09.883636', '', NULL, NULL, b'1', 1, 23, 53),
(1538, '', '2024-06-26 15:47:09.886658', '', NULL, NULL, b'1', 2, 23, 53),
(1539, '', '2024-06-26 15:47:09.889627', '', NULL, NULL, b'1', 3, 23, 53),
(1540, '', '2024-06-26 15:47:09.892626', '', NULL, NULL, b'1', 4, 23, 53),
(1541, '', '2024-06-26 15:47:09.895658', '', NULL, NULL, b'1', 5, 23, 53),
(1542, '', '2024-06-26 15:47:09.898624', '', NULL, NULL, b'1', 6, 23, 53),
(1543, '', '2024-06-26 15:47:09.901623', '', NULL, NULL, b'1', 1, 24, 53),
(1544, '', '2024-06-26 15:47:09.905623', '', NULL, NULL, b'1', 2, 24, 53),
(1545, '', '2024-06-26 15:47:09.908624', '', NULL, NULL, b'1', 3, 24, 53),
(1546, '', '2024-06-26 15:47:09.912620', '', NULL, NULL, b'1', 4, 24, 53),
(1547, '', '2024-06-26 15:47:09.916627', '', NULL, NULL, b'1', 5, 24, 53),
(1548, '', '2024-06-26 15:47:09.919620', '', NULL, NULL, b'1', 6, 24, 53),
(1549, '', '2024-06-26 15:47:09.922633', '', NULL, NULL, b'1', 1, 25, 53),
(1550, '', '2024-06-26 15:47:09.926639', '', NULL, NULL, b'1', 2, 25, 53),
(1551, '', '2024-06-26 15:47:09.929659', '', NULL, NULL, b'1', 3, 25, 53),
(1552, '', '2024-06-26 15:47:09.932673', '', NULL, NULL, b'1', 4, 25, 53),
(1553, '', '2024-06-26 15:47:09.936621', '', NULL, NULL, b'1', 5, 25, 53),
(1554, '', '2024-06-26 15:47:09.939619', '', NULL, NULL, b'1', 6, 25, 53),
(1555, '', '2024-06-26 15:47:09.942618', '', NULL, NULL, b'1', 1, 26, 53),
(1556, '', '2024-06-26 15:47:09.945655', '', NULL, NULL, b'1', 2, 26, 53),
(1557, '', '2024-06-26 15:47:09.949624', '', NULL, NULL, b'1', 3, 26, 53),
(1558, '', '2024-06-26 15:47:09.952662', '', NULL, NULL, b'1', 4, 26, 53),
(1559, '', '2024-06-26 15:47:09.955621', '', NULL, NULL, b'1', 5, 26, 53),
(1560, '', '2024-06-26 15:47:09.958617', '', NULL, NULL, b'1', 6, 26, 53),
(1561, '', '2024-06-26 15:47:09.961618', '', NULL, NULL, b'1', 1, 27, 53),
(1562, '', '2024-06-26 15:47:09.964618', '', NULL, NULL, b'1', 2, 27, 53),
(1563, '', '2024-06-26 15:47:09.968644', '', NULL, NULL, b'1', 3, 27, 53),
(1564, '', '2024-06-26 15:47:09.971617', '', NULL, NULL, b'1', 4, 27, 53),
(1565, '', '2024-06-26 15:47:09.974622', '', NULL, NULL, b'1', 5, 27, 53),
(1566, '', '2024-06-26 15:47:09.978620', '', NULL, NULL, b'1', 6, 27, 53),
(1567, '', '2024-06-26 15:47:09.981624', '', NULL, NULL, b'1', 1, 28, 53),
(1568, '', '2024-06-26 15:47:09.984670', '', NULL, NULL, b'1', 2, 28, 53),
(1569, '', '2024-06-26 15:47:09.987643', '', NULL, NULL, b'1', 3, 28, 53),
(1570, '', '2024-06-26 15:47:09.990616', '', NULL, NULL, b'1', 4, 28, 53),
(1571, '', '2024-06-26 15:47:09.994638', '', NULL, NULL, b'1', 5, 28, 53),
(1572, '', '2024-06-26 15:47:09.996623', '', NULL, NULL, b'1', 6, 28, 53),
(1573, '', '2024-06-26 15:47:09.999714', '', NULL, NULL, b'1', 1, 29, 53),
(1574, '', '2024-06-26 15:47:10.002656', '', NULL, NULL, b'1', 2, 29, 53),
(1575, '', '2024-06-26 15:47:10.005620', '', NULL, NULL, b'1', 3, 29, 53),
(1576, '', '2024-06-26 15:47:10.008665', '', NULL, NULL, b'1', 4, 29, 53),
(1577, '', '2024-06-26 15:47:10.011618', '', NULL, NULL, b'1', 5, 29, 53),
(1578, '', '2024-06-26 15:47:10.013615', '', NULL, NULL, b'1', 6, 29, 53),
(1579, '', '2024-06-26 15:47:10.016714', '', NULL, NULL, b'1', 1, 30, 53),
(1580, '', '2024-06-26 15:47:10.019659', '', NULL, NULL, b'1', 2, 30, 53),
(1581, '', '2024-06-26 15:47:10.021618', '', NULL, NULL, b'1', 3, 30, 53),
(1582, '', '2024-06-26 15:47:10.024713', '', NULL, NULL, b'1', 4, 30, 53),
(1583, '', '2024-06-26 15:47:10.027616', '', NULL, NULL, b'1', 5, 30, 53),
(1584, '', '2024-06-26 15:47:10.030621', '', NULL, NULL, b'1', 6, 30, 53),
(1585, '', '2024-06-26 15:47:10.033622', '', NULL, NULL, b'1', 1, 31, 53),
(1586, '', '2024-06-26 15:47:10.035717', '', NULL, NULL, b'1', 2, 31, 53),
(1587, '', '2024-06-26 15:47:10.037616', '', NULL, NULL, b'1', 3, 31, 53),
(1588, '', '2024-06-26 15:47:10.040620', '', NULL, NULL, b'1', 4, 31, 53),
(1589, '', '2024-06-26 15:47:10.043720', '', NULL, NULL, b'1', 5, 31, 53),
(1590, '', '2024-06-26 15:47:10.045718', '', NULL, NULL, b'1', 6, 31, 53),
(1591, '', '2024-06-26 15:47:10.048665', '', NULL, NULL, b'1', 1, 32, 53),
(1592, '', '2024-06-26 15:47:10.051618', '', NULL, NULL, b'1', 2, 32, 53),
(1593, '', '2024-06-26 15:47:10.054614', '', NULL, NULL, b'1', 3, 32, 53),
(1594, '', '2024-06-26 15:47:10.057624', '', NULL, NULL, b'1', 4, 32, 53),
(1595, '', '2024-06-26 15:47:10.060620', '', NULL, NULL, b'1', 5, 32, 53),
(1596, '', '2024-06-26 15:47:10.062615', '', NULL, NULL, b'1', 6, 32, 53),
(1597, '', '2024-06-26 15:47:10.065619', '', NULL, NULL, b'1', 1, 33, 53),
(1598, '', '2024-06-26 15:47:10.069624', '', NULL, NULL, b'1', 2, 33, 53),
(1599, '', '2024-06-26 15:47:10.073623', '', NULL, NULL, b'1', 3, 33, 53),
(1600, '', '2024-06-26 15:47:10.077684', '', NULL, NULL, b'1', 4, 33, 53),
(1601, '', '2024-06-26 15:47:10.082675', '', NULL, NULL, b'1', 5, 33, 53),
(1602, '', '2024-06-26 15:47:10.087627', '', NULL, NULL, b'1', 6, 33, 53),
(1603, '', '2024-06-26 15:47:10.092626', '', NULL, NULL, b'1', 1, 34, 53),
(1604, '', '2024-06-26 15:47:10.096619', '', NULL, NULL, b'1', 2, 34, 53),
(1605, '', '2024-06-26 15:47:10.099673', '', NULL, NULL, b'1', 3, 34, 53),
(1606, '', '2024-06-26 15:47:10.103623', '', NULL, NULL, b'1', 4, 34, 53),
(1607, '', '2024-06-26 15:47:10.106623', '', NULL, NULL, b'1', 5, 34, 53),
(1608, '', '2024-06-26 15:47:10.109633', '', NULL, NULL, b'1', 6, 34, 53),
(1609, '', '2024-06-26 15:47:10.111620', '', NULL, NULL, b'1', 1, 35, 53),
(1610, '', '2024-06-26 15:47:10.121618', '', NULL, NULL, b'1', 2, 35, 53),
(1611, '', '2024-06-26 15:47:10.125621', '', NULL, NULL, b'1', 3, 35, 53),
(1612, '', '2024-06-26 15:47:10.129618', '', NULL, NULL, b'1', 4, 35, 53),
(1613, '', '2024-06-26 15:47:10.132616', '', NULL, NULL, b'1', 5, 35, 53),
(1614, '', '2024-06-26 15:47:10.136619', '', NULL, NULL, b'1', 6, 35, 53),
(1615, '', '2024-06-26 15:47:10.138618', '', NULL, NULL, b'1', 1, 36, 53),
(1616, '', '2024-06-26 15:47:10.141664', '', NULL, NULL, b'1', 2, 36, 53),
(1617, '', '2024-06-26 15:47:10.145618', '', NULL, NULL, b'1', 3, 36, 53),
(1618, '', '2024-06-26 15:47:10.148619', '', NULL, NULL, b'1', 4, 36, 53),
(1619, '', '2024-06-26 15:47:10.151623', '', NULL, NULL, b'1', 5, 36, 53),
(1620, '', '2024-06-26 15:47:10.154617', '', NULL, NULL, b'1', 6, 36, 53),
(1621, '', '2024-06-26 15:47:10.157636', '', NULL, NULL, b'1', 1, 37, 53),
(1622, '', '2024-06-26 15:47:10.160620', '', NULL, NULL, b'1', 2, 37, 53),
(1623, '', '2024-06-26 15:47:10.162614', '', NULL, NULL, b'1', 3, 37, 53),
(1624, '', '2024-06-26 15:47:10.166623', '', NULL, NULL, b'1', 4, 37, 53),
(1625, '', '2024-06-26 15:47:10.169620', '', NULL, NULL, b'1', 5, 37, 53),
(1626, '', '2024-06-26 15:47:10.172619', '', NULL, NULL, b'1', 6, 37, 53),
(1627, '', '2024-06-26 15:47:10.175623', '', NULL, NULL, b'1', 1, 38, 53),
(1628, '', '2024-06-26 15:47:10.178617', '', NULL, NULL, b'1', 2, 38, 53),
(1629, '', '2024-06-26 15:47:10.181617', '', NULL, NULL, b'1', 3, 38, 53),
(1630, '', '2024-06-26 15:47:10.185637', '', NULL, NULL, b'1', 4, 38, 53),
(1631, '', '2024-06-26 15:47:10.187615', '', NULL, NULL, b'1', 5, 38, 53),
(1632, '', '2024-06-26 15:47:10.191646', '', NULL, NULL, b'1', 6, 38, 53),
(1633, '', '2024-06-26 15:47:10.194624', '', NULL, NULL, b'1', 1, 39, 53),
(1634, '', '2024-06-26 15:47:10.196620', '', NULL, NULL, b'1', 2, 39, 53),
(1635, '', '2024-06-26 15:47:10.199617', '', NULL, NULL, b'1', 3, 39, 53),
(1636, '', '2024-06-26 15:47:10.202619', '', NULL, NULL, b'1', 4, 39, 53),
(1637, '', '2024-06-26 15:47:10.205622', '', NULL, NULL, b'1', 5, 39, 53),
(1638, '', '2024-06-26 15:47:10.207620', '', NULL, NULL, b'1', 6, 39, 53),
(1639, '', '2024-06-26 15:47:10.210618', '', NULL, NULL, b'1', 1, 40, 53),
(1640, '', '2024-06-26 15:47:10.213616', '', NULL, NULL, b'1', 2, 40, 53),
(1641, '', '2024-06-26 15:47:10.215664', '', NULL, NULL, b'1', 3, 40, 53),
(1642, '', '2024-06-26 15:47:10.218616', '', NULL, NULL, b'1', 4, 40, 53),
(1643, '', '2024-06-26 15:47:10.220650', '', NULL, NULL, b'1', 5, 40, 53),
(1644, '', '2024-06-26 15:47:10.223618', '', NULL, NULL, b'1', 6, 40, 53),
(1645, '', '2024-06-26 15:47:10.226617', '', NULL, NULL, b'1', 1, 41, 53),
(1646, '', '2024-06-26 15:47:10.228613', '', NULL, NULL, b'1', 2, 41, 53),
(1647, '', '2024-06-26 15:47:10.230617', '', NULL, NULL, b'1', 3, 41, 53),
(1648, '', '2024-06-26 15:47:10.232623', '', NULL, NULL, b'1', 4, 41, 53),
(1649, '', '2024-06-26 15:47:10.235647', '', NULL, NULL, b'1', 5, 41, 53),
(1650, '', '2024-06-26 15:47:10.237616', '', NULL, NULL, b'1', 6, 41, 53),
(1651, '', '2024-06-26 15:47:10.239616', '', NULL, NULL, b'1', 1, 42, 53),
(1652, '', '2024-06-26 15:47:10.242619', '', NULL, NULL, b'1', 2, 42, 53),
(1653, '', '2024-06-26 15:47:10.244646', '', NULL, NULL, b'1', 3, 42, 53),
(1654, '', '2024-06-26 15:47:10.246616', '', NULL, NULL, b'1', 4, 42, 53),
(1655, '', '2024-06-26 15:47:10.249622', '', NULL, NULL, b'1', 5, 42, 53),
(1656, '', '2024-06-26 15:47:10.252618', '', NULL, NULL, b'1', 6, 42, 53),
(1657, '', '2024-06-26 15:47:10.254655', '', NULL, NULL, b'1', 1, 43, 53),
(1658, '', '2024-06-26 15:47:10.256657', '', NULL, NULL, b'1', 2, 43, 53),
(1659, '', '2024-06-26 15:47:10.259733', '', NULL, NULL, b'1', 3, 43, 53),
(1660, '', '2024-06-26 15:47:10.262751', '', NULL, NULL, b'1', 4, 43, 53),
(1661, '', '2024-06-26 15:47:10.265628', '', NULL, NULL, b'1', 5, 43, 53),
(1662, '', '2024-06-26 15:47:10.268621', '', NULL, NULL, b'1', 6, 43, 53),
(1663, '', '2024-06-26 15:47:10.270718', '', NULL, NULL, b'1', 1, 44, 53),
(1664, '', '2024-06-26 15:47:10.273619', '', NULL, NULL, b'1', 2, 44, 53),
(1665, '', '2024-06-26 15:47:10.275667', '', NULL, NULL, b'1', 3, 44, 53),
(1666, '', '2024-06-26 15:47:10.278654', '', NULL, NULL, b'1', 4, 44, 53),
(1667, '', '2024-06-26 15:47:10.280619', '', NULL, NULL, b'1', 5, 44, 53),
(1668, '', '2024-06-26 15:47:10.283622', '', NULL, NULL, b'1', 6, 44, 53),
(1669, '', '2024-06-26 15:47:10.286657', '', NULL, NULL, b'1', 1, 45, 53),
(1670, '', '2024-06-26 15:47:10.289619', '', NULL, NULL, b'1', 2, 45, 53),
(1671, '', '2024-06-26 15:47:10.293622', '', NULL, NULL, b'1', 3, 45, 53),
(1672, '', '2024-06-26 15:47:10.295656', '', NULL, NULL, b'1', 4, 45, 53),
(1673, '', '2024-06-26 15:47:10.299628', '', NULL, NULL, b'1', 5, 45, 53),
(1674, '', '2024-06-26 15:47:10.302617', '', NULL, NULL, b'1', 6, 45, 53),
(1675, '', '2024-06-26 15:47:10.305636', '', NULL, NULL, b'1', 1, 46, 53),
(1676, '', '2024-06-26 15:47:10.308628', '', NULL, NULL, b'1', 2, 46, 53),
(1677, '', '2024-06-26 15:47:10.311621', '', NULL, NULL, b'1', 3, 46, 53),
(1678, '', '2024-06-26 15:47:10.314620', '', NULL, NULL, b'1', 4, 46, 53),
(1679, '', '2024-06-26 15:47:10.318626', '', NULL, NULL, b'1', 5, 46, 53),
(1680, '', '2024-06-26 15:47:10.321622', '', NULL, NULL, b'1', 6, 46, 53),
(1681, '', '2024-06-26 15:47:10.324622', '', NULL, NULL, b'1', 1, 47, 53),
(1682, '', '2024-06-26 15:47:10.328623', '', NULL, NULL, b'1', 2, 47, 53),
(1683, '', '2024-06-26 15:47:10.332618', '', NULL, NULL, b'1', 3, 47, 53),
(1684, '', '2024-06-26 15:47:10.336614', '', NULL, NULL, b'1', 4, 47, 53),
(1685, '', '2024-06-26 15:47:10.338628', '', NULL, NULL, b'1', 5, 47, 53),
(1686, '', '2024-06-26 15:47:10.341668', '', NULL, NULL, b'1', 6, 47, 53),
(1687, '', '2024-06-26 15:47:10.345616', '', NULL, NULL, b'1', 1, 48, 53),
(1688, '', '2024-06-26 15:47:10.349619', '', NULL, NULL, b'1', 2, 48, 53),
(1689, '', '2024-06-26 15:47:10.353616', '', NULL, NULL, b'1', 3, 48, 53),
(1690, '', '2024-06-26 15:47:10.355640', '', NULL, NULL, b'1', 4, 48, 53),
(1691, '', '2024-06-26 15:47:10.358624', '', NULL, NULL, b'1', 5, 48, 53),
(1692, '', '2024-06-26 15:47:10.361617', '', NULL, NULL, b'1', 6, 48, 53),
(1693, '', '2024-06-26 15:47:10.365619', '', NULL, NULL, b'1', 1, 49, 53),
(1694, '', '2024-06-26 15:47:10.368621', '', NULL, NULL, b'1', 2, 49, 53),
(1695, '', '2024-06-26 15:47:10.371616', '', NULL, NULL, b'1', 3, 49, 53),
(1696, '', '2024-06-26 15:47:10.374647', '', NULL, NULL, b'1', 4, 49, 53),
(1697, '', '2024-06-26 15:47:10.377617', '', NULL, NULL, b'1', 5, 49, 53),
(1698, '', '2024-06-26 15:47:10.380625', '', NULL, NULL, b'1', 6, 49, 53),
(1699, '', '2024-06-26 15:47:10.383619', '', NULL, NULL, b'1', 1, 50, 53),
(1700, '', '2024-06-26 15:47:10.386654', '', NULL, NULL, b'1', 2, 50, 53),
(1701, '', '2024-06-26 15:47:10.389659', '', NULL, NULL, b'1', 3, 50, 53),
(1702, '', '2024-06-26 15:47:10.392673', '', NULL, NULL, b'1', 4, 50, 53),
(1703, '', '2024-06-26 15:47:10.395620', '', NULL, NULL, b'1', 5, 50, 53),
(1704, '', '2024-06-26 15:47:10.397615', '', NULL, NULL, b'1', 6, 50, 53),
(1705, '', '2024-06-26 15:47:10.401620', '', NULL, NULL, b'1', 1, 51, 53),
(1706, '', '2024-06-26 15:47:10.403717', '', NULL, NULL, b'1', 2, 51, 53),
(1707, '', '2024-06-26 15:47:10.405618', '', NULL, NULL, b'1', 3, 51, 53),
(1708, '', '2024-06-26 15:47:10.409620', '', NULL, NULL, b'1', 4, 51, 53),
(1709, '', '2024-06-26 15:47:10.412634', '', NULL, NULL, b'1', 5, 51, 53),
(1710, '', '2024-06-26 15:47:10.416689', '', NULL, NULL, b'1', 6, 51, 53),
(1711, '', '2024-06-26 15:47:10.421630', '', NULL, NULL, b'1', 1, 52, 53),
(1712, '', '2024-06-26 15:47:10.426657', '', NULL, NULL, b'1', 2, 52, 53),
(1713, '', '2024-06-26 15:47:10.431625', '', NULL, NULL, b'1', 3, 52, 53),
(1714, '', '2024-06-26 15:47:10.435629', '', NULL, NULL, b'1', 4, 52, 53),
(1715, '', '2024-06-26 15:47:10.440636', '', NULL, NULL, b'1', 5, 52, 53),
(1716, '', '2024-06-26 15:47:10.444630', '', NULL, NULL, b'1', 6, 52, 53),
(1717, '', '2024-06-26 15:47:10.450626', '', NULL, NULL, b'1', 1, 53, 53),
(1718, '', '2024-06-26 15:47:10.454638', '', NULL, NULL, b'1', 2, 53, 53),
(1719, '', '2024-06-26 15:47:10.459639', '', NULL, NULL, b'1', 3, 53, 53),
(1720, '', '2024-06-26 15:47:10.463641', '', NULL, NULL, b'1', 4, 53, 53),
(1721, '', '2024-06-26 15:47:10.468627', '', NULL, NULL, b'1', 5, 53, 53),
(1722, '', '2024-06-26 15:47:10.471620', '', NULL, NULL, b'1', 6, 53, 53),
(1723, '', '2024-06-26 15:47:10.475670', '', NULL, NULL, b'1', 1, 54, 53),
(1724, '', '2024-06-26 15:47:10.478618', '', NULL, NULL, b'1', 2, 54, 53),
(1725, '', '2024-06-26 15:47:10.481672', '', NULL, NULL, b'1', 3, 54, 53),
(1726, '', '2024-06-26 15:47:10.485626', '', NULL, NULL, b'1', 4, 54, 53),
(1727, '', '2024-06-26 15:47:10.488621', '', NULL, NULL, b'1', 5, 54, 53),
(1728, '', '2024-06-26 15:47:10.491634', '', NULL, NULL, b'1', 6, 54, 53),
(1729, '', '2024-06-26 15:47:10.494621', '', NULL, NULL, b'1', 1, 55, 53),
(1730, '', '2024-06-26 15:47:10.497618', '', NULL, NULL, b'1', 2, 55, 53),
(1731, '', '2024-06-26 15:47:10.500621', '', NULL, NULL, b'1', 3, 55, 53),
(1732, '', '2024-06-26 15:47:10.503618', '', NULL, NULL, b'1', 4, 55, 53),
(1733, '', '2024-06-26 15:47:10.505621', '', NULL, NULL, b'1', 5, 55, 53),
(1734, '', '2024-06-26 15:47:10.508619', '', NULL, NULL, b'1', 6, 55, 53),
(1735, '', '2024-06-26 15:47:10.512615', '', NULL, NULL, b'1', 1, 56, 53),
(1736, '', '2024-06-26 15:47:10.515626', '', NULL, NULL, b'1', 2, 56, 53),
(1737, '', '2024-06-26 15:47:10.518625', '', NULL, NULL, b'1', 3, 56, 53),
(1738, '', '2024-06-26 15:47:10.520652', '', NULL, NULL, b'1', 4, 56, 53),
(1739, '', '2024-06-26 15:47:10.524642', '', NULL, NULL, b'1', 5, 56, 53),
(1740, '', '2024-06-26 15:47:10.527617', '', NULL, NULL, b'1', 6, 56, 53),
(1741, '', '2024-06-26 15:47:10.530623', '', NULL, NULL, b'1', 1, 57, 53),
(1742, '', '2024-06-26 15:47:10.534619', '', NULL, NULL, b'1', 2, 57, 53),
(1743, '', '2024-06-26 15:47:10.537616', '', NULL, NULL, b'1', 3, 57, 53),
(1744, '', '2024-06-26 15:47:10.540617', '', NULL, NULL, b'1', 4, 57, 53),
(1745, '', '2024-06-26 15:47:10.544615', '', NULL, NULL, b'1', 5, 57, 53),
(1746, '', '2024-06-26 15:47:10.547622', '', NULL, NULL, b'1', 6, 57, 53),
(1747, '', '2024-06-26 15:47:10.549669', '', NULL, NULL, b'1', 1, 58, 53),
(1748, '', '2024-06-26 15:47:10.553624', '', NULL, NULL, b'1', 2, 58, 53),
(1749, '', '2024-06-26 15:47:10.556617', '', NULL, NULL, b'1', 3, 58, 53),
(1750, '', '2024-06-26 15:47:10.560632', '', NULL, NULL, b'1', 4, 58, 53),
(1751, '', '2024-06-26 15:47:10.564621', '', NULL, NULL, b'1', 5, 58, 53),
(1752, '', '2024-06-26 15:47:10.567620', '', NULL, NULL, b'1', 6, 58, 53),
(1753, '', '2024-06-26 15:47:10.571618', '', NULL, NULL, b'1', 1, 59, 53),
(1754, '', '2024-06-26 15:47:10.575619', '', NULL, NULL, b'1', 2, 59, 53),
(1755, '', '2024-06-26 15:47:10.578617', '', NULL, NULL, b'1', 3, 59, 53),
(1756, '', '2024-06-26 15:47:10.582629', '', NULL, NULL, b'1', 4, 59, 53),
(1757, '', '2024-06-26 15:47:10.585640', '', NULL, NULL, b'1', 5, 59, 53),
(1758, '', '2024-06-26 15:47:10.589662', '', NULL, NULL, b'1', 6, 59, 53),
(1759, '', '2024-06-26 15:47:10.593642', '', NULL, NULL, b'1', 1, 60, 53),
(1760, '', '2024-06-26 15:47:10.595657', '', NULL, NULL, b'1', 2, 60, 53),
(1761, '', '2024-06-26 15:47:10.598653', '', NULL, NULL, b'1', 3, 60, 53),
(1762, '', '2024-06-26 15:47:10.601671', '', NULL, NULL, b'1', 4, 60, 53),
(1763, '', '2024-06-26 15:47:10.604615', '', NULL, NULL, b'1', 5, 60, 53),
(1764, '', '2024-06-26 15:47:10.607618', '', NULL, NULL, b'1', 6, 60, 53),
(1765, '', '2024-06-26 15:47:10.610635', '', NULL, NULL, b'1', 1, 61, 53),
(1766, '', '2024-06-26 15:47:10.612636', '', NULL, NULL, b'1', 2, 61, 53),
(1767, '', '2024-06-26 15:47:10.615624', '', NULL, NULL, b'1', 3, 61, 53),
(1768, '', '2024-06-26 15:47:10.618616', '', NULL, NULL, b'1', 4, 61, 53),
(1769, '', '2024-06-26 15:47:10.620641', '', NULL, NULL, b'1', 5, 61, 53),
(1770, '', '2024-06-26 15:47:10.622616', '', NULL, NULL, b'1', 6, 61, 53),
(1771, '', '2024-06-26 15:47:10.625619', '', NULL, NULL, b'1', 1, 62, 53),
(1772, '', '2024-06-26 15:47:10.627614', '', NULL, NULL, b'1', 2, 62, 53),
(1773, '', '2024-06-26 15:47:10.629615', '', NULL, NULL, b'1', 3, 62, 53),
(1774, '', '2024-06-26 15:47:10.633623', '', NULL, NULL, b'1', 4, 62, 53),
(1775, '', '2024-06-26 15:47:10.635634', '', NULL, NULL, b'1', 5, 62, 53),
(1776, '', '2024-06-26 15:47:10.640621', '', NULL, NULL, b'1', 6, 62, 53),
(1777, '', '2024-06-26 15:47:10.644634', '', NULL, NULL, b'1', 1, 63, 53),
(1778, '', '2024-06-26 15:47:10.649626', '', NULL, NULL, b'1', 2, 63, 53),
(1779, '', '2024-06-26 15:47:10.654626', '', NULL, NULL, b'1', 3, 63, 53),
(1780, '', '2024-06-26 15:47:10.659634', '', NULL, NULL, b'1', 4, 63, 53),
(1781, '', '2024-06-26 15:47:10.663642', '', NULL, NULL, b'1', 5, 63, 53),
(1782, '', '2024-06-26 15:47:10.668623', '', NULL, NULL, b'1', 6, 63, 53),
(1783, '', '2024-06-26 15:47:10.673621', '', NULL, NULL, b'1', 1, 64, 53),
(1784, '', '2024-06-26 15:47:10.677621', '', NULL, NULL, b'1', 2, 64, 53),
(1785, '', '2024-06-26 15:47:10.681619', '', NULL, NULL, b'1', 3, 64, 53),
(1786, '', '2024-06-26 15:47:10.685621', '', NULL, NULL, b'1', 4, 64, 53),
(1787, '', '2024-06-26 15:47:10.687660', '', NULL, NULL, b'1', 5, 64, 53),
(1788, '', '2024-06-26 15:47:10.691631', '', NULL, NULL, b'1', 6, 64, 53),
(1789, '', '2024-06-26 15:47:10.694616', '', NULL, NULL, b'1', 1, 65, 53),
(1790, '', '2024-06-26 15:47:10.697617', '', NULL, NULL, b'1', 2, 65, 53),
(1791, '', '2024-06-26 15:47:10.700628', '', NULL, NULL, b'1', 3, 65, 53),
(1792, '', '2024-06-26 15:47:10.702617', '', NULL, NULL, b'1', 4, 65, 53),
(1793, '', '2024-06-26 15:47:10.705616', '', NULL, NULL, b'1', 5, 65, 53),
(1794, '', '2024-06-26 15:47:10.709620', '', NULL, NULL, b'1', 6, 65, 53),
(1795, '', '2024-06-26 15:47:10.711616', '', NULL, NULL, b'1', 1, 66, 53),
(1796, '', '2024-06-26 15:47:10.715618', '', NULL, NULL, b'1', 2, 66, 53),
(1797, '', '2024-06-26 15:47:10.718618', '', NULL, NULL, b'1', 3, 66, 53),
(1798, '', '2024-06-26 15:47:10.720617', '', NULL, NULL, b'1', 4, 66, 53),
(1799, '', '2024-06-26 15:47:10.723618', '', NULL, NULL, b'1', 5, 66, 53),
(1800, '', '2024-06-26 15:47:10.727618', '', NULL, NULL, b'1', 6, 66, 53),
(1801, '', '2024-06-26 15:47:10.730624', '', NULL, NULL, b'1', 1, 67, 53),
(1802, '', '2024-06-26 15:47:10.732617', '', NULL, NULL, b'1', 2, 67, 53),
(1803, '', '2024-06-26 15:47:10.735618', '', NULL, NULL, b'1', 3, 67, 53),
(1804, '', '2024-06-26 15:47:10.738618', '', NULL, NULL, b'1', 4, 67, 53),
(1805, '', '2024-06-26 15:47:10.741624', '', NULL, NULL, b'1', 5, 67, 53),
(1806, '', '2024-06-26 15:47:10.744616', '', NULL, NULL, b'1', 6, 67, 53),
(1807, '', '2024-06-26 15:47:10.746617', '', NULL, NULL, b'1', 1, 68, 53),
(1808, '', '2024-06-26 15:47:10.750627', '', NULL, NULL, b'1', 2, 68, 53),
(1809, '', '2024-06-26 15:47:10.752614', '', NULL, NULL, b'1', 3, 68, 53),
(1810, '', '2024-06-26 15:47:10.755629', '', NULL, NULL, b'1', 4, 68, 53),
(1811, '', '2024-06-26 15:47:10.758626', '', NULL, NULL, b'1', 5, 68, 53),
(1812, '', '2024-06-26 15:47:10.761618', '', NULL, NULL, b'1', 6, 68, 53),
(1813, '', '2024-06-26 15:47:10.764622', '', NULL, NULL, b'1', 1, 69, 53),
(1814, '', '2024-06-26 15:47:10.768630', '', NULL, NULL, b'1', 2, 69, 53),
(1815, '', '2024-06-26 15:47:10.770654', '', NULL, NULL, b'1', 3, 69, 53),
(1816, '', '2024-06-26 15:47:10.773618', '', NULL, NULL, b'1', 4, 69, 53),
(1817, '', '2024-06-26 15:47:10.777619', '', NULL, NULL, b'1', 5, 69, 53),
(1818, '', '2024-06-26 15:47:10.779619', '', NULL, NULL, b'1', 6, 69, 53),
(1819, '', '2024-06-26 15:47:10.782624', '', NULL, NULL, b'1', 1, 70, 53),
(1820, '', '2024-06-26 15:47:10.786620', '', NULL, NULL, b'1', 2, 70, 53),
(1821, '', '2024-06-26 15:47:10.789621', '', NULL, NULL, b'1', 3, 70, 53),
(1822, '', '2024-06-26 15:47:10.792637', '', NULL, NULL, b'1', 4, 70, 53),
(1823, '', '2024-06-26 15:47:10.795657', '', NULL, NULL, b'1', 5, 70, 53),
(1824, '', '2024-06-26 15:47:10.798655', '', NULL, NULL, b'1', 6, 70, 53),
(1825, '', '2024-06-26 15:47:10.802620', '', NULL, NULL, b'1', 1, 71, 53),
(1826, '', '2024-06-26 15:47:10.804616', '', NULL, NULL, b'1', 2, 71, 53),
(1827, '', '2024-06-26 15:47:10.807617', '', NULL, NULL, b'1', 3, 71, 53),
(1828, '', '2024-06-26 15:47:10.811635', '', NULL, NULL, b'1', 4, 71, 53),
(1829, '', '2024-06-26 15:47:10.816633', '', NULL, NULL, b'1', 5, 71, 53),
(1830, '', '2024-06-26 15:47:10.820630', '', NULL, NULL, b'1', 6, 71, 53),
(1831, '', '2024-06-26 15:47:10.824624', '', NULL, NULL, b'1', 1, 72, 53),
(1832, '', '2024-06-26 15:47:10.827618', '', NULL, NULL, b'1', 2, 72, 53),
(1833, '', '2024-06-26 15:47:10.831624', '', NULL, NULL, b'1', 3, 72, 53),
(1834, '', '2024-06-26 15:47:10.835623', '', NULL, NULL, b'1', 4, 72, 53),
(1835, '', '2024-06-26 15:47:10.841631', '', NULL, NULL, b'1', 5, 72, 53),
(1836, '', '2024-06-26 15:47:10.845667', '', NULL, NULL, b'1', 6, 72, 53),
(1837, '', '2024-06-26 15:47:10.848630', '', NULL, NULL, b'1', 1, 73, 53),
(1838, '', '2024-06-26 15:47:10.852622', '', NULL, NULL, b'1', 2, 73, 53),
(1839, '', '2024-06-26 15:47:10.855620', '', NULL, NULL, b'1', 3, 73, 53),
(1840, '', '2024-06-26 15:47:10.858624', '', NULL, NULL, b'1', 4, 73, 53),
(1841, '', '2024-06-26 15:47:10.860618', '', NULL, NULL, b'1', 5, 73, 53),
(1842, '', '2024-06-26 15:47:10.863618', '', NULL, NULL, b'1', 6, 73, 53),
(1843, '', '2024-06-26 15:47:10.866629', '', NULL, NULL, b'1', 1, 74, 53),
(1844, '', '2024-06-26 15:47:10.869717', '', NULL, NULL, b'1', 2, 74, 53),
(1845, '', '2024-06-26 15:47:10.872676', '', NULL, NULL, b'1', 3, 74, 53),
(1846, '', '2024-06-26 15:47:10.875621', '', NULL, NULL, b'1', 4, 74, 53),
(1847, '', '2024-06-26 15:47:10.878657', '', NULL, NULL, b'1', 5, 74, 53),
(1848, '', '2024-06-26 15:47:10.882620', '', NULL, NULL, b'1', 6, 74, 53),
(1849, '', '2024-06-26 15:47:10.885616', '', NULL, NULL, b'1', 1, 75, 53),
(1850, '', '2024-06-26 15:47:10.888619', '', NULL, NULL, b'1', 2, 75, 53),
(1851, '', '2024-06-26 15:47:10.891633', '', NULL, NULL, b'1', 3, 75, 53),
(1852, '', '2024-06-26 15:47:10.894618', '', NULL, NULL, b'1', 4, 75, 53),
(1853, '', '2024-06-26 15:47:10.897615', '', NULL, NULL, b'1', 5, 75, 53),
(1854, '', '2024-06-26 15:47:10.900676', '', NULL, NULL, b'1', 6, 75, 53),
(1855, '', '2024-06-26 15:47:10.902618', '', NULL, NULL, b'1', 1, 76, 53),
(1856, '', '2024-06-26 15:47:10.905620', '', NULL, NULL, b'1', 2, 76, 53),
(1857, '', '2024-06-26 15:47:10.909694', '', NULL, NULL, b'1', 3, 76, 53),
(1858, '', '2024-06-26 15:47:10.911651', '', NULL, NULL, b'1', 4, 76, 53),
(1859, '', '2024-06-26 15:47:10.914654', '', NULL, NULL, b'1', 5, 76, 53),
(1860, '', '2024-06-26 15:47:10.918622', '', NULL, NULL, b'1', 6, 76, 53),
(1861, '', '2024-06-26 15:47:10.920657', '', NULL, NULL, b'1', 1, 77, 53),
(1862, '', '2024-06-26 15:47:10.923632', '', NULL, NULL, b'1', 2, 77, 53),
(1863, '', '2024-06-26 15:47:10.926620', '', NULL, NULL, b'1', 3, 77, 53),
(1864, '', '2024-06-26 15:47:10.928655', '', NULL, NULL, b'1', 4, 77, 53),
(1865, '', '2024-06-26 15:47:10.932642', '', NULL, NULL, b'1', 5, 77, 53),
(1866, '', '2024-06-26 15:47:10.935617', '', NULL, NULL, b'1', 6, 77, 53),
(1867, '', '2024-06-26 15:47:10.938617', '', NULL, NULL, b'1', 1, 78, 53),
(1868, '', '2024-06-26 15:47:10.941660', '', NULL, NULL, b'1', 2, 78, 53),
(1869, '', '2024-06-26 15:47:10.944616', '', NULL, NULL, b'1', 3, 78, 53),
(1870, '', '2024-06-26 15:47:10.947618', '', NULL, NULL, b'1', 4, 78, 53),
(1871, '', '2024-06-26 15:47:10.950691', '', NULL, NULL, b'1', 5, 78, 53),
(1872, '', '2024-06-26 15:47:10.953615', '', NULL, NULL, b'1', 6, 78, 53),
(1873, 'collaborator1', '2024-06-26 15:51:01.230856', '', NULL, NULL, b'1', 1, 1, 54),
(1874, 'collaborator1', '2024-06-26 15:51:01.377859', '', NULL, NULL, b'1', 2, 1, 54),
(1875, 'collaborator1', '2024-06-26 15:51:01.380136', '', NULL, NULL, b'1', 3, 1, 54),
(1876, 'collaborator1', '2024-06-26 15:51:01.382862', '', NULL, NULL, b'1', 4, 1, 54),
(1877, 'collaborator1', '2024-06-26 15:51:01.385105', '', NULL, NULL, b'1', 5, 1, 54),
(1878, 'collaborator1', '2024-06-26 15:51:01.387858', '', NULL, NULL, b'1', 6, 1, 54),
(1879, 'collaborator1', '2024-06-26 15:51:01.389865', '', NULL, NULL, b'1', 1, 2, 54),
(1880, 'collaborator1', '2024-06-26 15:51:01.392856', '', NULL, NULL, b'1', 2, 2, 54),
(1881, 'collaborator1', '2024-06-26 15:51:01.395136', '', NULL, NULL, b'1', 3, 2, 54),
(1882, 'collaborator1', '2024-06-26 15:51:01.397857', '', NULL, NULL, b'1', 4, 2, 54),
(1883, 'collaborator1', '2024-06-26 15:51:01.400097', '', NULL, NULL, b'1', 5, 2, 54),
(1884, 'collaborator1', '2024-06-26 15:51:01.402863', '', NULL, NULL, b'1', 6, 2, 54),
(1885, 'collaborator1', '2024-06-26 15:51:01.404858', '', NULL, NULL, b'1', 1, 3, 54),
(1886, 'collaborator1', '2024-06-26 15:51:01.407857', '', NULL, NULL, b'1', 2, 3, 54),
(1887, 'collaborator1', '2024-06-26 15:51:01.410928', '', NULL, NULL, b'1', 3, 3, 54),
(1888, 'collaborator1', '2024-06-26 15:51:01.413857', '', NULL, NULL, b'1', 4, 3, 54),
(1889, 'collaborator1', '2024-06-26 15:51:01.416854', '', NULL, NULL, b'1', 5, 3, 54),
(1890, 'collaborator1', '2024-06-26 15:51:01.418855', '', NULL, NULL, b'1', 6, 3, 54),
(1891, 'collaborator1', '2024-06-26 15:51:01.420859', '', NULL, NULL, b'1', 1, 4, 54),
(1892, 'collaborator1', '2024-06-26 15:51:01.423856', '', NULL, NULL, b'1', 2, 4, 54),
(1893, 'collaborator1', '2024-06-26 15:51:01.426128', '', NULL, NULL, b'1', 3, 4, 54),
(1894, 'collaborator1', '2024-06-26 15:51:01.428854', '', NULL, NULL, b'1', 4, 4, 54),
(1895, 'collaborator1', '2024-06-26 15:51:01.430856', '', NULL, NULL, b'1', 5, 4, 54),
(1896, 'collaborator1', '2024-06-26 15:51:01.433855', '', NULL, NULL, b'1', 6, 4, 54),
(1897, 'collaborator1', '2024-06-26 15:51:01.436121', '', NULL, NULL, b'1', 1, 5, 54),
(1898, 'collaborator1', '2024-06-26 15:51:01.437855', '', NULL, NULL, b'1', 2, 5, 54),
(1899, 'collaborator1', '2024-06-26 15:51:01.441856', '', NULL, NULL, b'1', 3, 5, 54),
(1900, 'collaborator1', '2024-06-26 15:51:01.444167', '', NULL, NULL, b'1', 4, 5, 54),
(1901, 'collaborator1', '2024-06-26 15:51:01.447859', '', NULL, NULL, b'1', 5, 5, 54),
(1902, 'collaborator1', '2024-06-26 15:51:01.450858', '', NULL, NULL, b'1', 6, 5, 54),
(1903, 'collaborator1', '2024-06-26 15:51:01.453858', '', NULL, NULL, b'1', 1, 6, 54),
(1904, 'collaborator1', '2024-06-26 15:51:01.455857', '', NULL, NULL, b'1', 2, 6, 54),
(1905, 'collaborator1', '2024-06-26 15:51:01.458860', '', NULL, NULL, b'1', 3, 6, 54),
(1906, 'collaborator1', '2024-06-26 15:51:01.461153', '', NULL, NULL, b'1', 4, 6, 54),
(1907, 'collaborator1', '2024-06-26 15:51:01.463855', '', NULL, NULL, b'1', 5, 6, 54),
(1908, 'collaborator1', '2024-06-26 15:51:01.466855', '', NULL, NULL, b'1', 6, 6, 54),
(1909, 'collaborator1', '2024-06-26 15:51:01.468854', '', NULL, NULL, b'1', 1, 7, 54),
(1910, 'collaborator1', '2024-06-26 15:51:01.471168', '', NULL, NULL, b'1', 2, 7, 54),
(1911, 'collaborator1', '2024-06-26 15:51:01.473856', '', NULL, NULL, b'1', 3, 7, 54),
(1912, 'collaborator1', '2024-06-26 15:51:01.476177', '', NULL, NULL, b'1', 4, 7, 54),
(1913, 'collaborator1', '2024-06-26 15:51:01.479208', '', NULL, NULL, b'1', 5, 7, 54),
(1914, 'collaborator1', '2024-06-26 15:51:01.481860', '', NULL, NULL, b'1', 6, 7, 54),
(1915, 'collaborator1', '2024-06-26 15:51:01.484165', '', NULL, NULL, b'1', 1, 8, 54),
(1916, 'collaborator1', '2024-06-26 15:51:01.487143', '', NULL, NULL, b'1', 2, 8, 54),
(1917, 'collaborator1', '2024-06-26 15:51:01.489854', '', NULL, NULL, b'1', 3, 8, 54),
(1918, 'collaborator1', '2024-06-26 15:51:01.492879', '', NULL, NULL, b'1', 4, 8, 54),
(1919, 'collaborator1', '2024-06-26 15:51:01.495858', '', NULL, NULL, b'1', 5, 8, 54),
(1920, 'collaborator1', '2024-06-26 15:51:01.497858', '', NULL, NULL, b'1', 6, 8, 54),
(1921, 'collaborator1', '2024-06-26 15:51:01.501190', '', NULL, NULL, b'1', 1, 9, 54),
(1922, 'collaborator1', '2024-06-26 15:51:01.503996', '', NULL, NULL, b'1', 2, 9, 54),
(1923, 'collaborator1', '2024-06-26 15:51:01.506860', '', NULL, NULL, b'1', 3, 9, 54),
(1924, 'collaborator1', '2024-06-26 15:51:01.509178', '', NULL, NULL, b'1', 4, 9, 54),
(1925, 'collaborator1', '2024-06-26 15:51:01.512079', '', NULL, NULL, b'1', 5, 9, 54),
(1926, 'collaborator1', '2024-06-26 15:51:01.513857', '', NULL, NULL, b'1', 6, 9, 54),
(1927, 'collaborator1', '2024-06-26 15:51:01.517168', '', NULL, NULL, b'1', 1, 10, 54),
(1928, 'collaborator1', '2024-06-26 15:51:01.520022', '', NULL, NULL, b'1', 2, 10, 54),
(1929, 'collaborator1', '2024-06-26 15:51:01.522857', '', NULL, NULL, b'1', 3, 10, 54),
(1930, 'collaborator1', '2024-06-26 15:51:01.525096', '', NULL, NULL, b'1', 4, 10, 54),
(1931, 'collaborator1', '2024-06-26 15:51:01.527857', '', NULL, NULL, b'1', 5, 10, 54),
(1932, 'collaborator1', '2024-06-26 15:51:01.530176', '', NULL, NULL, b'1', 6, 10, 54),
(1933, 'collaborator1', '2024-06-26 15:51:01.532858', '', NULL, NULL, b'1', 1, 11, 54),
(1934, 'collaborator1', '2024-06-26 15:51:01.535168', '', NULL, NULL, b'1', 2, 11, 54),
(1935, 'collaborator1', '2024-06-26 15:51:01.537854', '', NULL, NULL, b'1', 3, 11, 54),
(1936, 'collaborator1', '2024-06-26 15:51:01.539859', '', NULL, NULL, b'1', 4, 11, 54),
(1937, 'collaborator1', '2024-06-26 15:51:01.542862', '', NULL, NULL, b'1', 5, 11, 54),
(1938, 'collaborator1', '2024-06-26 15:51:01.545220', '', NULL, NULL, b'1', 6, 11, 54),
(1939, 'collaborator1', '2024-06-26 15:51:01.547860', '', NULL, NULL, b'1', 1, 12, 54),
(1940, 'collaborator1', '2024-06-26 15:51:01.550858', '', NULL, NULL, b'1', 2, 12, 54),
(1941, 'collaborator1', '2024-06-26 15:51:01.552860', '', NULL, NULL, b'1', 3, 12, 54),
(1942, 'collaborator1', '2024-06-26 15:51:01.554880', '', NULL, NULL, b'1', 4, 12, 54),
(1943, 'collaborator1', '2024-06-26 15:51:01.558860', '', NULL, NULL, b'1', 5, 12, 54),
(1944, 'collaborator1', '2024-06-26 15:51:01.560855', '', NULL, NULL, b'1', 6, 12, 54),
(1945, 'collaborator1', '2024-06-26 15:51:01.562855', '', NULL, NULL, b'1', 1, 13, 54),
(1946, 'collaborator1', '2024-06-26 15:51:01.565857', '', NULL, NULL, b'1', 2, 13, 54),
(1947, 'collaborator1', '2024-06-26 15:51:01.569160', '', NULL, NULL, b'1', 3, 13, 54),
(1948, 'collaborator1', '2024-06-26 15:51:01.571977', '', NULL, NULL, b'1', 4, 13, 54),
(1949, 'collaborator1', '2024-06-26 15:51:01.575102', '', NULL, NULL, b'1', 5, 13, 54),
(1950, 'collaborator1', '2024-06-26 15:51:01.577856', '', NULL, NULL, b'1', 6, 13, 54),
(1951, 'collaborator1', '2024-06-26 15:51:01.579894', '', NULL, NULL, b'1', 1, 14, 54),
(1952, 'collaborator1', '2024-06-26 15:51:01.582863', '', NULL, NULL, b'1', 2, 14, 54),
(1953, 'collaborator1', '2024-06-26 15:51:01.584854', '', NULL, NULL, b'1', 3, 14, 54),
(1954, 'collaborator1', '2024-06-26 15:51:01.587165', '', NULL, NULL, b'1', 4, 14, 54),
(1955, 'collaborator1', '2024-06-26 15:51:01.589863', '', NULL, NULL, b'1', 5, 14, 54),
(1956, 'collaborator1', '2024-06-26 15:51:01.592161', '', NULL, NULL, b'1', 6, 14, 54),
(1957, 'collaborator1', '2024-06-26 15:51:01.595147', '', NULL, NULL, b'1', 1, 15, 54),
(1958, 'collaborator1', '2024-06-26 15:51:01.597862', '', NULL, NULL, b'1', 2, 15, 54),
(1959, 'collaborator1', '2024-06-26 15:51:01.601020', '', NULL, NULL, b'1', 3, 15, 54),
(1960, 'collaborator1', '2024-06-26 15:51:01.603862', '', NULL, NULL, b'1', 4, 15, 54),
(1961, 'collaborator1', '2024-06-26 15:51:01.605856', '', NULL, NULL, b'1', 5, 15, 54),
(1962, 'collaborator1', '2024-06-26 15:51:01.609200', '', NULL, NULL, b'1', 6, 15, 54),
(1963, 'collaborator1', '2024-06-26 15:51:01.612139', '', NULL, NULL, b'1', 1, 16, 54),
(1964, 'collaborator1', '2024-06-26 15:51:01.614865', '', NULL, NULL, b'1', 2, 16, 54),
(1965, 'collaborator1', '2024-06-26 15:51:01.617855', '', NULL, NULL, b'1', 3, 16, 54),
(1966, 'collaborator1', '2024-06-26 15:51:01.620171', '', NULL, NULL, b'1', 4, 16, 54),
(1967, 'collaborator1', '2024-06-26 15:51:01.622857', '', NULL, NULL, b'1', 5, 16, 54),
(1968, 'collaborator1', '2024-06-26 15:51:01.625857', '', NULL, NULL, b'1', 6, 16, 54),
(1969, 'collaborator1', '2024-06-26 15:51:01.627857', '', NULL, NULL, b'1', 1, 17, 54),
(1970, 'collaborator1', '2024-06-26 15:51:01.629856', '', NULL, NULL, b'1', 2, 17, 54),
(1971, 'collaborator1', '2024-06-26 15:51:01.631859', '', NULL, NULL, b'1', 3, 17, 54),
(1972, 'collaborator1', '2024-06-26 15:51:01.633858', '', NULL, NULL, b'1', 4, 17, 54),
(1973, 'collaborator1', '2024-06-26 15:51:01.635854', '', NULL, NULL, b'1', 5, 17, 54),
(1974, 'collaborator1', '2024-06-26 15:51:01.638856', '', NULL, NULL, b'1', 6, 17, 54),
(1975, 'collaborator1', '2024-06-26 15:51:01.640944', '', NULL, NULL, b'1', 1, 18, 54),
(1976, 'collaborator1', '2024-06-26 15:51:01.642854', '', NULL, NULL, b'1', 2, 18, 54),
(1977, 'collaborator1', '2024-06-26 15:51:01.646085', '', NULL, NULL, b'1', 3, 18, 54),
(1978, 'collaborator1', '2024-06-26 15:51:01.648856', '', NULL, NULL, b'1', 4, 18, 54),
(1979, 'collaborator1', '2024-06-26 15:51:01.651162', '', NULL, NULL, b'1', 5, 18, 54),
(1980, 'collaborator1', '2024-06-26 15:51:01.654214', '', NULL, NULL, b'1', 6, 18, 54),
(1981, 'collaborator1', '2024-06-26 15:51:01.656883', '', NULL, NULL, b'1', 1, 19, 54),
(1982, 'collaborator1', '2024-06-26 15:51:01.659862', '', NULL, NULL, b'1', 2, 19, 54),
(1983, 'collaborator1', '2024-06-26 15:51:01.662165', '', NULL, NULL, b'1', 3, 19, 54),
(1984, 'collaborator1', '2024-06-26 15:51:01.664856', '', NULL, NULL, b'1', 4, 19, 54),
(1985, 'collaborator1', '2024-06-26 15:51:01.667860', '', NULL, NULL, b'1', 5, 19, 54),
(1986, 'collaborator1', '2024-06-26 15:51:01.670184', '', NULL, NULL, b'1', 6, 19, 54),
(1987, 'collaborator1', '2024-06-26 15:51:01.672856', '', NULL, NULL, b'1', 1, 20, 54),
(1988, 'collaborator1', '2024-06-26 15:51:01.675163', '', NULL, NULL, b'1', 2, 20, 54),
(1989, 'collaborator1', '2024-06-26 15:51:01.677858', '', NULL, NULL, b'1', 3, 20, 54),
(1990, 'collaborator1', '2024-06-26 15:51:01.680175', '', NULL, NULL, b'1', 4, 20, 54),
(1991, 'collaborator1', '2024-06-26 15:51:01.682856', '', NULL, NULL, b'1', 5, 20, 54),
(1992, 'collaborator1', '2024-06-26 15:51:01.685893', '', NULL, NULL, b'1', 6, 20, 54),
(1993, 'collaborator1', '2024-06-26 15:51:01.688863', '', NULL, NULL, b'1', 1, 21, 54),
(1994, 'collaborator1', '2024-06-26 15:51:01.691855', '', NULL, NULL, b'1', 2, 21, 54),
(1995, 'collaborator1', '2024-06-26 15:51:01.694196', '', NULL, NULL, b'1', 3, 21, 54),
(1996, 'collaborator1', '2024-06-26 15:51:01.697021', '', NULL, NULL, b'1', 4, 21, 54),
(1997, 'collaborator1', '2024-06-26 15:51:01.700099', '', NULL, NULL, b'1', 5, 21, 54),
(1998, 'collaborator1', '2024-06-26 15:51:01.702862', '', NULL, NULL, b'1', 6, 21, 54),
(1999, 'collaborator1', '2024-06-26 15:51:01.705182', '', NULL, NULL, b'1', 1, 22, 54),
(2000, 'collaborator1', '2024-06-26 15:51:01.707856', '', NULL, NULL, b'1', 2, 22, 54),
(2001, 'collaborator1', '2024-06-26 15:51:01.711196', '', NULL, NULL, b'1', 3, 22, 54),
(2002, 'collaborator1', '2024-06-26 15:51:01.713974', '', NULL, NULL, b'1', 4, 22, 54),
(2003, 'collaborator1', '2024-06-26 15:51:01.716999', '', NULL, NULL, b'1', 5, 22, 54),
(2004, 'collaborator1', '2024-06-26 15:51:01.719153', '', NULL, NULL, b'1', 6, 22, 54),
(2005, 'collaborator1', '2024-06-26 15:51:01.722135', '', NULL, NULL, b'1', 1, 23, 54),
(2006, 'collaborator1', '2024-06-26 15:51:01.725094', '', NULL, NULL, b'1', 2, 23, 54),
(2007, 'collaborator1', '2024-06-26 15:51:01.727160', '', NULL, NULL, b'1', 3, 23, 54),
(2008, 'collaborator1', '2024-06-26 15:51:01.730091', '', NULL, NULL, b'1', 4, 23, 54),
(2009, 'collaborator1', '2024-06-26 15:51:01.732856', '', NULL, NULL, b'1', 5, 23, 54),
(2010, 'collaborator1', '2024-06-26 15:51:01.735863', '', NULL, NULL, b'1', 6, 23, 54),
(2011, 'collaborator1', '2024-06-26 15:51:01.737855', '', NULL, NULL, b'1', 1, 24, 54),
(2012, 'collaborator1', '2024-06-26 15:51:01.740904', '', NULL, NULL, b'1', 2, 24, 54),
(2013, 'collaborator1', '2024-06-26 15:51:01.743860', '', NULL, NULL, b'1', 3, 24, 54),
(2014, 'collaborator1', '2024-06-26 15:51:01.746176', '', NULL, NULL, b'1', 4, 24, 54),
(2015, 'collaborator1', '2024-06-26 15:51:01.748859', '', NULL, NULL, b'1', 5, 24, 54),
(2016, 'collaborator1', '2024-06-26 15:51:01.751165', '', NULL, NULL, b'1', 6, 24, 54),
(2017, 'collaborator1', '2024-06-26 15:51:01.753998', '', NULL, NULL, b'1', 1, 25, 54),
(2018, 'collaborator1', '2024-06-26 15:51:01.756859', '', NULL, NULL, b'1', 2, 25, 54),
(2019, 'collaborator1', '2024-06-26 15:51:01.759159', '', NULL, NULL, b'1', 3, 25, 54),
(2020, 'collaborator1', '2024-06-26 15:51:01.761985', '', NULL, NULL, b'1', 4, 25, 54),
(2021, 'collaborator1', '2024-06-26 15:51:01.764873', '', NULL, NULL, b'1', 5, 25, 54),
(2022, 'collaborator1', '2024-06-26 15:51:01.767176', '', NULL, NULL, b'1', 6, 25, 54),
(2023, 'collaborator1', '2024-06-26 15:51:01.770134', '', NULL, NULL, b'1', 1, 26, 54),
(2024, 'collaborator1', '2024-06-26 15:51:01.772858', '', NULL, NULL, b'1', 2, 26, 54),
(2025, 'collaborator1', '2024-06-26 15:51:01.775885', '', NULL, NULL, b'1', 3, 26, 54),
(2026, 'collaborator1', '2024-06-26 15:51:01.778861', '', NULL, NULL, b'1', 4, 26, 54),
(2027, 'collaborator1', '2024-06-26 15:51:01.780857', '', NULL, NULL, b'1', 5, 26, 54),
(2028, 'collaborator1', '2024-06-26 15:51:01.783897', '', NULL, NULL, b'1', 6, 26, 54),
(2029, 'collaborator1', '2024-06-26 15:51:01.785896', '', NULL, NULL, b'1', 1, 27, 54),
(2030, 'collaborator1', '2024-06-26 15:51:01.787857', '', NULL, NULL, b'1', 2, 27, 54),
(2031, 'collaborator1', '2024-06-26 15:51:01.790856', '', NULL, NULL, b'1', 3, 27, 54),
(2032, 'collaborator1', '2024-06-26 15:51:01.794105', '', NULL, NULL, b'1', 4, 27, 54),
(2033, 'collaborator1', '2024-06-26 15:51:01.797006', '', NULL, NULL, b'1', 5, 27, 54),
(2034, 'collaborator1', '2024-06-26 15:51:01.799859', '', NULL, NULL, b'1', 6, 27, 54),
(2035, 'collaborator1', '2024-06-26 15:51:01.802892', '', NULL, NULL, b'1', 1, 28, 54),
(2036, 'collaborator1', '2024-06-26 15:51:01.805857', '', NULL, NULL, b'1', 2, 28, 54),
(2037, 'collaborator1', '2024-06-26 15:51:01.808858', '', NULL, NULL, b'1', 3, 28, 54),
(2038, 'collaborator1', '2024-06-26 15:51:01.811194', '', NULL, NULL, b'1', 4, 28, 54),
(2039, 'collaborator1', '2024-06-26 15:51:01.813858', '', NULL, NULL, b'1', 5, 28, 54),
(2040, 'collaborator1', '2024-06-26 15:51:01.816872', '', NULL, NULL, b'1', 6, 28, 54),
(2041, 'collaborator1', '2024-06-26 15:51:01.818978', '', NULL, NULL, b'1', 1, 29, 54),
(2042, 'collaborator1', '2024-06-26 15:51:01.821856', '', NULL, NULL, b'1', 2, 29, 54),
(2043, 'collaborator1', '2024-06-26 15:51:01.823859', '', NULL, NULL, b'1', 3, 29, 54),
(2044, 'collaborator1', '2024-06-26 15:51:01.826853', '', NULL, NULL, b'1', 4, 29, 54),
(2045, 'collaborator1', '2024-06-26 15:51:01.829114', '', NULL, NULL, b'1', 5, 29, 54),
(2046, 'collaborator1', '2024-06-26 15:51:01.831870', '', NULL, NULL, b'1', 6, 29, 54);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(2047, 'collaborator1', '2024-06-26 15:51:01.834856', '', NULL, NULL, b'1', 1, 30, 54),
(2048, 'collaborator1', '2024-06-26 15:51:01.836854', '', NULL, NULL, b'1', 2, 30, 54),
(2049, 'collaborator1', '2024-06-26 15:51:01.840857', '', NULL, NULL, b'1', 3, 30, 54),
(2050, 'collaborator1', '2024-06-26 15:51:01.842855', '', NULL, NULL, b'1', 4, 30, 54),
(2051, 'collaborator1', '2024-06-26 15:51:01.844959', '', NULL, NULL, b'1', 5, 30, 54),
(2052, 'collaborator1', '2024-06-26 15:51:01.847860', '', NULL, NULL, b'1', 6, 30, 54),
(2053, 'collaborator1', '2024-06-26 15:51:01.849922', '', NULL, NULL, b'1', 1, 31, 54),
(2054, 'collaborator1', '2024-06-26 15:51:01.852855', '', NULL, NULL, b'1', 2, 31, 54),
(2055, 'collaborator1', '2024-06-26 15:51:01.854859', '', NULL, NULL, b'1', 3, 31, 54),
(2056, 'collaborator1', '2024-06-26 15:51:01.857857', '', NULL, NULL, b'1', 4, 31, 54),
(2057, 'collaborator1', '2024-06-26 15:51:01.860859', '', NULL, NULL, b'1', 5, 31, 54),
(2058, 'collaborator1', '2024-06-26 15:51:01.862856', '', NULL, NULL, b'1', 6, 31, 54),
(2059, 'collaborator1', '2024-06-26 15:51:01.864857', '', NULL, NULL, b'1', 1, 32, 54),
(2060, 'collaborator1', '2024-06-26 15:51:01.867855', '', NULL, NULL, b'1', 2, 32, 54),
(2061, 'collaborator1', '2024-06-26 15:51:01.870853', '', NULL, NULL, b'1', 3, 32, 54),
(2062, 'collaborator1', '2024-06-26 15:51:01.872856', '', NULL, NULL, b'1', 4, 32, 54),
(2063, 'collaborator1', '2024-06-26 15:51:01.875855', '', NULL, NULL, b'1', 5, 32, 54),
(2064, 'collaborator1', '2024-06-26 15:51:01.877855', '', NULL, NULL, b'1', 6, 32, 54),
(2065, 'collaborator1', '2024-06-26 15:51:01.879854', '', NULL, NULL, b'1', 1, 33, 54),
(2066, 'collaborator1', '2024-06-26 15:51:01.882860', '', NULL, NULL, b'1', 2, 33, 54),
(2067, 'collaborator1', '2024-06-26 15:51:01.884853', '', NULL, NULL, b'1', 3, 33, 54),
(2068, 'collaborator1', '2024-06-26 15:51:01.886854', '', NULL, NULL, b'1', 4, 33, 54),
(2069, 'collaborator1', '2024-06-26 15:51:01.888855', '', NULL, NULL, b'1', 5, 33, 54),
(2070, 'collaborator1', '2024-06-26 15:51:01.892856', '', NULL, NULL, b'1', 6, 33, 54),
(2071, 'collaborator1', '2024-06-26 15:51:01.895131', '', NULL, NULL, b'1', 1, 34, 54),
(2072, 'collaborator1', '2024-06-26 15:51:01.897857', '', NULL, NULL, b'1', 2, 34, 54),
(2073, 'collaborator1', '2024-06-26 15:51:01.900985', '', NULL, NULL, b'1', 3, 34, 54),
(2074, 'collaborator1', '2024-06-26 15:51:01.902854', '', NULL, NULL, b'1', 4, 34, 54),
(2075, 'collaborator1', '2024-06-26 15:51:01.904854', '', NULL, NULL, b'1', 5, 34, 54),
(2076, 'collaborator1', '2024-06-26 15:51:01.907854', '', NULL, NULL, b'1', 6, 34, 54),
(2077, 'collaborator1', '2024-06-26 15:51:01.910894', '', NULL, NULL, b'1', 1, 35, 54),
(2078, 'collaborator1', '2024-06-26 15:51:01.912854', '', NULL, NULL, b'1', 2, 35, 54),
(2079, 'collaborator1', '2024-06-26 15:51:01.914855', '', NULL, NULL, b'1', 3, 35, 54),
(2080, 'collaborator1', '2024-06-26 15:51:01.917857', '', NULL, NULL, b'1', 4, 35, 54),
(2081, 'collaborator1', '2024-06-26 15:51:01.920854', '', NULL, NULL, b'1', 5, 35, 54),
(2082, 'collaborator1', '2024-06-26 15:51:01.922856', '', NULL, NULL, b'1', 6, 35, 54),
(2083, 'collaborator1', '2024-06-26 15:51:01.925095', '', NULL, NULL, b'1', 1, 36, 54),
(2084, 'collaborator1', '2024-06-26 15:51:01.941891', '', NULL, NULL, b'1', 2, 36, 54),
(2085, 'collaborator1', '2024-06-26 15:51:01.944196', '', NULL, NULL, b'1', 3, 36, 54),
(2086, 'collaborator1', '2024-06-26 15:51:01.947023', '', NULL, NULL, b'1', 4, 36, 54),
(2087, 'collaborator1', '2024-06-26 15:51:01.950043', '', NULL, NULL, b'1', 5, 36, 54),
(2088, 'collaborator1', '2024-06-26 15:51:01.951907', '', NULL, NULL, b'1', 6, 36, 54),
(2089, 'collaborator1', '2024-06-26 15:51:01.954910', '', NULL, NULL, b'1', 1, 37, 54),
(2090, 'collaborator1', '2024-06-26 15:51:01.957860', '', NULL, NULL, b'1', 2, 37, 54),
(2091, 'collaborator1', '2024-06-26 15:51:01.960206', '', NULL, NULL, b'1', 3, 37, 54),
(2092, 'collaborator1', '2024-06-26 15:51:01.962903', '', NULL, NULL, b'1', 4, 37, 54),
(2093, 'collaborator1', '2024-06-26 15:51:01.965857', '', NULL, NULL, b'1', 5, 37, 54),
(2094, 'collaborator1', '2024-06-26 15:51:01.967855', '', NULL, NULL, b'1', 6, 37, 54),
(2095, 'collaborator1', '2024-06-26 15:51:01.971125', '', NULL, NULL, b'1', 1, 38, 54),
(2096, 'collaborator1', '2024-06-26 15:51:01.973865', '', NULL, NULL, b'1', 2, 38, 54),
(2097, 'collaborator1', '2024-06-26 15:51:01.976202', '', NULL, NULL, b'1', 3, 38, 54),
(2098, 'collaborator1', '2024-06-26 15:51:01.979017', '', NULL, NULL, b'1', 4, 38, 54),
(2099, 'collaborator1', '2024-06-26 15:51:01.980856', '', NULL, NULL, b'1', 5, 38, 54),
(2100, 'collaborator1', '2024-06-26 15:51:01.983855', '', NULL, NULL, b'1', 6, 38, 54),
(2101, 'collaborator1', '2024-06-26 15:51:01.985893', '', NULL, NULL, b'1', 1, 39, 54),
(2102, 'collaborator1', '2024-06-26 15:51:01.987855', '', NULL, NULL, b'1', 2, 39, 54),
(2103, 'collaborator1', '2024-06-26 15:51:01.991092', '', NULL, NULL, b'1', 3, 39, 54),
(2104, 'collaborator1', '2024-06-26 15:51:01.993858', '', NULL, NULL, b'1', 4, 39, 54),
(2105, 'collaborator1', '2024-06-26 15:51:01.996164', '', NULL, NULL, b'1', 5, 39, 54),
(2106, 'collaborator1', '2024-06-26 15:51:01.998856', '', NULL, NULL, b'1', 6, 39, 54),
(2107, 'collaborator1', '2024-06-26 15:51:02.001174', '', NULL, NULL, b'1', 1, 40, 54),
(2108, 'collaborator1', '2024-06-26 15:51:02.004054', '', NULL, NULL, b'1', 2, 40, 54),
(2109, 'collaborator1', '2024-06-26 15:51:02.006858', '', NULL, NULL, b'1', 3, 40, 54),
(2110, 'collaborator1', '2024-06-26 15:51:02.009188', '', NULL, NULL, b'1', 4, 40, 54),
(2111, 'collaborator1', '2024-06-26 15:51:02.011997', '', NULL, NULL, b'1', 5, 40, 54),
(2112, 'collaborator1', '2024-06-26 15:51:02.013856', '', NULL, NULL, b'1', 6, 40, 54),
(2113, 'collaborator1', '2024-06-26 15:51:02.017160', '', NULL, NULL, b'1', 1, 41, 54),
(2114, 'collaborator1', '2024-06-26 15:51:02.019939', '', NULL, NULL, b'1', 2, 41, 54),
(2115, 'collaborator1', '2024-06-26 15:51:02.022866', '', NULL, NULL, b'1', 3, 41, 54),
(2116, 'collaborator1', '2024-06-26 15:51:02.025002', '', NULL, NULL, b'1', 4, 41, 54),
(2117, 'collaborator1', '2024-06-26 15:51:02.026854', '', NULL, NULL, b'1', 5, 41, 54),
(2118, 'collaborator1', '2024-06-26 15:51:02.030201', '', NULL, NULL, b'1', 6, 41, 54),
(2119, 'collaborator1', '2024-06-26 15:51:02.032854', '', NULL, NULL, b'1', 1, 42, 54),
(2120, 'collaborator1', '2024-06-26 15:51:02.035162', '', NULL, NULL, b'1', 2, 42, 54),
(2121, 'collaborator1', '2024-06-26 15:51:02.037858', '', NULL, NULL, b'1', 3, 42, 54),
(2122, 'collaborator1', '2024-06-26 15:51:02.039881', '', NULL, NULL, b'1', 4, 42, 54),
(2123, 'collaborator1', '2024-06-26 15:51:02.042854', '', NULL, NULL, b'1', 5, 42, 54),
(2124, 'collaborator1', '2024-06-26 15:51:02.043855', '', NULL, NULL, b'1', 6, 42, 54),
(2125, 'collaborator1', '2024-06-26 15:51:02.046856', '', NULL, NULL, b'1', 1, 43, 54),
(2126, 'collaborator1', '2024-06-26 15:51:02.049855', '', NULL, NULL, b'1', 2, 43, 54),
(2127, 'collaborator1', '2024-06-26 15:51:02.052192', '', NULL, NULL, b'1', 3, 43, 54),
(2128, 'collaborator1', '2024-06-26 15:51:02.054857', '', NULL, NULL, b'1', 4, 43, 54),
(2129, 'collaborator1', '2024-06-26 15:51:02.057857', '', NULL, NULL, b'1', 5, 43, 54),
(2130, 'collaborator1', '2024-06-26 15:51:02.059896', '', NULL, NULL, b'1', 6, 43, 54),
(2131, 'collaborator1', '2024-06-26 15:51:02.062859', '', NULL, NULL, b'1', 1, 44, 54),
(2132, 'collaborator1', '2024-06-26 15:51:02.064857', '', NULL, NULL, b'1', 2, 44, 54),
(2133, 'collaborator1', '2024-06-26 15:51:02.066856', '', NULL, NULL, b'1', 3, 44, 54),
(2134, 'collaborator1', '2024-06-26 15:51:02.068856', '', NULL, NULL, b'1', 4, 44, 54),
(2135, 'collaborator1', '2024-06-26 15:51:02.071857', '', NULL, NULL, b'1', 5, 44, 54),
(2136, 'collaborator1', '2024-06-26 15:51:02.074917', '', NULL, NULL, b'1', 6, 44, 54),
(2137, 'collaborator1', '2024-06-26 15:51:02.077162', '', NULL, NULL, b'1', 1, 45, 54),
(2138, 'collaborator1', '2024-06-26 15:51:02.080220', '', NULL, NULL, b'1', 2, 45, 54),
(2139, 'collaborator1', '2024-06-26 15:51:02.082856', '', NULL, NULL, b'1', 3, 45, 54),
(2140, 'collaborator1', '2024-06-26 15:51:02.085171', '', NULL, NULL, b'1', 4, 45, 54),
(2141, 'collaborator1', '2024-06-26 15:51:02.087860', '', NULL, NULL, b'1', 5, 45, 54),
(2142, 'collaborator1', '2024-06-26 15:51:02.089855', '', NULL, NULL, b'1', 6, 45, 54),
(2143, 'collaborator1', '2024-06-26 15:51:02.092862', '', NULL, NULL, b'1', 1, 46, 54),
(2144, 'collaborator1', '2024-06-26 15:51:02.095173', '', NULL, NULL, b'1', 2, 46, 54),
(2145, 'collaborator1', '2024-06-26 15:51:02.097857', '', NULL, NULL, b'1', 3, 46, 54),
(2146, 'collaborator1', '2024-06-26 15:51:02.100169', '', NULL, NULL, b'1', 4, 46, 54),
(2147, 'collaborator1', '2024-06-26 15:51:02.102862', '', NULL, NULL, b'1', 5, 46, 54),
(2148, 'collaborator1', '2024-06-26 15:51:02.105168', '', NULL, NULL, b'1', 6, 46, 54),
(2149, 'collaborator1', '2024-06-26 15:51:02.107856', '', NULL, NULL, b'1', 1, 47, 54),
(2150, 'collaborator1', '2024-06-26 15:51:02.111088', '', NULL, NULL, b'1', 2, 47, 54),
(2151, 'collaborator1', '2024-06-26 15:51:02.113858', '', NULL, NULL, b'1', 3, 47, 54),
(2152, 'collaborator1', '2024-06-26 15:51:02.116858', '', NULL, NULL, b'1', 4, 47, 54),
(2153, 'collaborator1', '2024-06-26 15:51:02.119153', '', NULL, NULL, b'1', 5, 47, 54),
(2154, 'collaborator1', '2024-06-26 15:51:02.122039', '', NULL, NULL, b'1', 6, 47, 54),
(2155, 'collaborator1', '2024-06-26 15:51:02.124856', '', NULL, NULL, b'1', 1, 48, 54),
(2156, 'collaborator1', '2024-06-26 15:51:02.127856', '', NULL, NULL, b'1', 2, 48, 54),
(2157, 'collaborator1', '2024-06-26 15:51:02.130191', '', NULL, NULL, b'1', 3, 48, 54),
(2158, 'collaborator1', '2024-06-26 15:51:02.132860', '', NULL, NULL, b'1', 4, 48, 54),
(2159, 'collaborator1', '2024-06-26 15:51:02.135184', '', NULL, NULL, b'1', 5, 48, 54),
(2160, 'collaborator1', '2024-06-26 15:51:02.137857', '', NULL, NULL, b'1', 6, 48, 54),
(2161, 'collaborator1', '2024-06-26 15:51:02.139933', '', NULL, NULL, b'1', 1, 49, 54),
(2162, 'collaborator1', '2024-06-26 15:51:02.142862', '', NULL, NULL, b'1', 2, 49, 54),
(2163, 'collaborator1', '2024-06-26 15:51:02.145173', '', NULL, NULL, b'1', 3, 49, 54),
(2164, 'collaborator1', '2024-06-26 15:51:02.147857', '', NULL, NULL, b'1', 4, 49, 54),
(2165, 'collaborator1', '2024-06-26 15:51:02.150178', '', NULL, NULL, b'1', 5, 49, 54),
(2166, 'collaborator1', '2024-06-26 15:51:02.152863', '', NULL, NULL, b'1', 6, 49, 54),
(2167, 'collaborator1', '2024-06-26 15:51:02.155164', '', NULL, NULL, b'1', 1, 50, 54),
(2168, 'collaborator1', '2024-06-26 15:51:02.157896', '', NULL, NULL, b'1', 2, 50, 54),
(2169, 'collaborator1', '2024-06-26 15:51:02.160169', '', NULL, NULL, b'1', 3, 50, 54),
(2170, 'collaborator1', '2024-06-26 15:51:02.162862', '', NULL, NULL, b'1', 4, 50, 54),
(2171, 'collaborator1', '2024-06-26 15:51:02.164890', '', NULL, NULL, b'1', 5, 50, 54),
(2172, 'collaborator1', '2024-06-26 15:51:02.167859', '', NULL, NULL, b'1', 6, 50, 54),
(2173, 'collaborator1', '2024-06-26 15:51:02.170184', '', NULL, NULL, b'1', 1, 51, 54),
(2174, 'collaborator1', '2024-06-26 15:51:02.172857', '', NULL, NULL, b'1', 2, 51, 54),
(2175, 'collaborator1', '2024-06-26 15:51:02.175175', '', NULL, NULL, b'1', 3, 51, 54),
(2176, 'collaborator1', '2024-06-26 15:51:02.177858', '', NULL, NULL, b'1', 4, 51, 54),
(2177, 'collaborator1', '2024-06-26 15:51:02.180202', '', NULL, NULL, b'1', 5, 51, 54),
(2178, 'collaborator1', '2024-06-26 15:51:02.182858', '', NULL, NULL, b'1', 6, 51, 54),
(2179, 'collaborator1', '2024-06-26 15:51:02.184896', '', NULL, NULL, b'1', 1, 52, 54),
(2180, 'collaborator1', '2024-06-26 15:51:02.186895', '', NULL, NULL, b'1', 2, 52, 54),
(2181, 'collaborator1', '2024-06-26 15:51:02.189874', '', NULL, NULL, b'1', 3, 52, 54),
(2182, 'collaborator1', '2024-06-26 15:51:02.192170', '', NULL, NULL, b'1', 4, 52, 54),
(2183, 'collaborator1', '2024-06-26 15:51:02.194965', '', NULL, NULL, b'1', 5, 52, 54),
(2184, 'collaborator1', '2024-06-26 15:51:02.196857', '', NULL, NULL, b'1', 6, 52, 54),
(2185, 'collaborator1', '2024-06-26 15:51:02.200200', '', NULL, NULL, b'1', 1, 53, 54),
(2186, 'collaborator1', '2024-06-26 15:51:02.202862', '', NULL, NULL, b'1', 2, 53, 54),
(2187, 'collaborator1', '2024-06-26 15:51:02.205156', '', NULL, NULL, b'1', 3, 53, 54),
(2188, 'collaborator1', '2024-06-26 15:51:02.207856', '', NULL, NULL, b'1', 4, 53, 54),
(2189, 'collaborator1', '2024-06-26 15:51:02.210936', '', NULL, NULL, b'1', 5, 53, 54),
(2190, 'collaborator1', '2024-06-26 15:51:02.213856', '', NULL, NULL, b'1', 6, 53, 54),
(2191, 'collaborator1', '2024-06-26 15:51:02.216984', '', NULL, NULL, b'1', 1, 54, 54),
(2192, 'collaborator1', '2024-06-26 15:51:02.219174', '', NULL, NULL, b'1', 2, 54, 54),
(2193, 'collaborator1', '2024-06-26 15:51:02.222022', '', NULL, NULL, b'1', 3, 54, 54),
(2194, 'collaborator1', '2024-06-26 15:51:02.225146', '', NULL, NULL, b'1', 4, 54, 54),
(2195, 'collaborator1', '2024-06-26 15:51:02.227857', '', NULL, NULL, b'1', 5, 54, 54),
(2196, 'collaborator1', '2024-06-26 15:51:02.230214', '', NULL, NULL, b'1', 6, 54, 54),
(2197, 'collaborator1', '2024-06-26 15:51:02.232855', '', NULL, NULL, b'1', 1, 55, 54),
(2198, 'collaborator1', '2024-06-26 15:51:02.235183', '', NULL, NULL, b'1', 2, 55, 54),
(2199, 'collaborator1', '2024-06-26 15:51:02.237859', '', NULL, NULL, b'1', 3, 55, 54),
(2200, 'collaborator1', '2024-06-26 15:51:02.239857', '', NULL, NULL, b'1', 4, 55, 54),
(2201, 'collaborator1', '2024-06-26 15:51:02.242169', '', NULL, NULL, b'1', 5, 55, 54),
(2202, 'collaborator1', '2024-06-26 15:51:02.245211', '', NULL, NULL, b'1', 6, 55, 54),
(2203, 'collaborator1', '2024-06-26 15:51:02.247868', '', NULL, NULL, b'1', 1, 56, 54),
(2204, 'collaborator1', '2024-06-26 15:51:02.250166', '', NULL, NULL, b'1', 2, 56, 54),
(2205, 'collaborator1', '2024-06-26 15:51:02.252863', '', NULL, NULL, b'1', 3, 56, 54),
(2206, 'collaborator1', '2024-06-26 15:51:02.255173', '', NULL, NULL, b'1', 4, 56, 54),
(2207, 'collaborator1', '2024-06-26 15:51:02.257856', '', NULL, NULL, b'1', 5, 56, 54),
(2208, 'collaborator1', '2024-06-26 15:51:02.260166', '', NULL, NULL, b'1', 6, 56, 54),
(2209, 'collaborator1', '2024-06-26 15:51:02.262858', '', NULL, NULL, b'1', 1, 57, 54),
(2210, 'collaborator1', '2024-06-26 15:51:02.264920', '', NULL, NULL, b'1', 2, 57, 54),
(2211, 'collaborator1', '2024-06-26 15:51:02.267860', '', NULL, NULL, b'1', 3, 57, 54),
(2212, 'collaborator1', '2024-06-26 15:51:02.270182', '', NULL, NULL, b'1', 4, 57, 54),
(2213, 'collaborator1', '2024-06-26 15:51:02.272870', '', NULL, NULL, b'1', 5, 57, 54),
(2214, 'collaborator1', '2024-06-26 15:51:02.275866', '', NULL, NULL, b'1', 6, 57, 54),
(2215, 'collaborator1', '2024-06-26 15:51:02.278859', '', NULL, NULL, b'1', 1, 58, 54),
(2216, 'collaborator1', '2024-06-26 15:51:02.280859', '', NULL, NULL, b'1', 2, 58, 54),
(2217, 'collaborator1', '2024-06-26 15:51:02.284209', '', NULL, NULL, b'1', 3, 58, 54),
(2218, 'collaborator1', '2024-06-26 15:51:02.286906', '', NULL, NULL, b'1', 4, 58, 54),
(2219, 'collaborator1', '2024-06-26 15:51:02.289904', '', NULL, NULL, b'1', 5, 58, 54),
(2220, 'collaborator1', '2024-06-26 15:51:02.292165', '', NULL, NULL, b'1', 6, 58, 54),
(2221, 'collaborator1', '2024-06-26 15:51:02.295194', '', NULL, NULL, b'1', 1, 59, 54),
(2222, 'collaborator1', '2024-06-26 15:51:02.297865', '', NULL, NULL, b'1', 2, 59, 54),
(2223, 'collaborator1', '2024-06-26 15:51:02.300915', '', NULL, NULL, b'1', 3, 59, 54),
(2224, 'collaborator1', '2024-06-26 15:51:02.303860', '', NULL, NULL, b'1', 4, 59, 54),
(2225, 'collaborator1', '2024-06-26 15:51:02.305859', '', NULL, NULL, b'1', 5, 59, 54),
(2226, 'collaborator1', '2024-06-26 15:51:02.309194', '', NULL, NULL, b'1', 6, 59, 54),
(2227, 'collaborator1', '2024-06-26 15:51:02.311964', '', NULL, NULL, b'1', 1, 60, 54),
(2228, 'collaborator1', '2024-06-26 15:51:02.314859', '', NULL, NULL, b'1', 2, 60, 54),
(2229, 'collaborator1', '2024-06-26 15:51:02.317174', '', NULL, NULL, b'1', 3, 60, 54),
(2230, 'collaborator1', '2024-06-26 15:51:02.320021', '', NULL, NULL, b'1', 4, 60, 54),
(2231, 'collaborator1', '2024-06-26 15:51:02.321855', '', NULL, NULL, b'1', 5, 60, 54),
(2232, 'collaborator1', '2024-06-26 15:51:02.325174', '', NULL, NULL, b'1', 6, 60, 54),
(2233, 'collaborator1', '2024-06-26 15:51:02.327857', '', NULL, NULL, b'1', 1, 61, 54),
(2234, 'collaborator1', '2024-06-26 15:51:02.330229', '', NULL, NULL, b'1', 2, 61, 54),
(2235, 'collaborator1', '2024-06-26 15:51:02.332856', '', NULL, NULL, b'1', 3, 61, 54),
(2236, 'collaborator1', '2024-06-26 15:51:02.335173', '', NULL, NULL, b'1', 4, 61, 54),
(2237, 'collaborator1', '2024-06-26 15:51:02.337860', '', NULL, NULL, b'1', 5, 61, 54),
(2238, 'collaborator1', '2024-06-26 15:51:02.340859', '', NULL, NULL, b'1', 6, 61, 54),
(2239, 'collaborator1', '2024-06-26 15:51:02.342879', '', NULL, NULL, b'1', 1, 62, 54),
(2240, 'collaborator1', '2024-06-26 15:51:02.345157', '', NULL, NULL, b'1', 2, 62, 54),
(2241, 'collaborator1', '2024-06-26 15:51:02.347864', '', NULL, NULL, b'1', 3, 62, 54),
(2242, 'collaborator1', '2024-06-26 15:51:02.350948', '', NULL, NULL, b'1', 4, 62, 54),
(2243, 'collaborator1', '2024-06-26 15:51:02.353863', '', NULL, NULL, b'1', 5, 62, 54),
(2244, 'collaborator1', '2024-06-26 15:51:02.355856', '', NULL, NULL, b'1', 6, 62, 54),
(2245, 'collaborator1', '2024-06-26 15:51:02.359214', '', NULL, NULL, b'1', 1, 63, 54),
(2246, 'collaborator1', '2024-06-26 15:51:02.362006', '', NULL, NULL, b'1', 2, 63, 54),
(2247, 'collaborator1', '2024-06-26 15:51:02.364896', '', NULL, NULL, b'1', 3, 63, 54),
(2248, 'collaborator1', '2024-06-26 15:51:02.367182', '', NULL, NULL, b'1', 4, 63, 54),
(2249, 'collaborator1', '2024-06-26 15:51:02.370112', '', NULL, NULL, b'1', 5, 63, 54),
(2250, 'collaborator1', '2024-06-26 15:51:02.372861', '', NULL, NULL, b'1', 6, 63, 54),
(2251, 'collaborator1', '2024-06-26 15:51:02.375862', '', NULL, NULL, b'1', 1, 64, 54),
(2252, 'collaborator1', '2024-06-26 15:51:02.377854', '', NULL, NULL, b'1', 2, 64, 54),
(2253, 'collaborator1', '2024-06-26 15:51:02.380181', '', NULL, NULL, b'1', 3, 64, 54),
(2254, 'collaborator1', '2024-06-26 15:51:02.382857', '', NULL, NULL, b'1', 4, 64, 54),
(2255, 'collaborator1', '2024-06-26 15:51:02.385856', '', NULL, NULL, b'1', 5, 64, 54),
(2256, 'collaborator1', '2024-06-26 15:51:02.387859', '', NULL, NULL, b'1', 6, 64, 54),
(2257, 'collaborator1', '2024-06-26 15:51:02.389860', '', NULL, NULL, b'1', 1, 65, 54),
(2258, 'collaborator1', '2024-06-26 15:51:02.392854', '', NULL, NULL, b'1', 2, 65, 54),
(2259, 'collaborator1', '2024-06-26 15:51:02.395176', '', NULL, NULL, b'1', 3, 65, 54),
(2260, 'collaborator1', '2024-06-26 15:51:02.397861', '', NULL, NULL, b'1', 4, 65, 54),
(2261, 'collaborator1', '2024-06-26 15:51:02.400859', '', NULL, NULL, b'1', 5, 65, 54),
(2262, 'collaborator1', '2024-06-26 15:51:02.402861', '', NULL, NULL, b'1', 6, 65, 54),
(2263, 'collaborator1', '2024-06-26 15:51:02.404854', '', NULL, NULL, b'1', 1, 66, 54),
(2264, 'collaborator1', '2024-06-26 15:51:02.407856', '', NULL, NULL, b'1', 2, 66, 54),
(2265, 'collaborator1', '2024-06-26 15:51:02.410863', '', NULL, NULL, b'1', 3, 66, 54),
(2266, 'collaborator1', '2024-06-26 15:51:02.413861', '', NULL, NULL, b'1', 4, 66, 54),
(2267, 'collaborator1', '2024-06-26 15:51:02.416856', '', NULL, NULL, b'1', 5, 66, 54),
(2268, 'collaborator1', '2024-06-26 15:51:02.419191', '', NULL, NULL, b'1', 6, 66, 54),
(2269, 'collaborator1', '2024-06-26 15:51:02.421900', '', NULL, NULL, b'1', 1, 67, 54),
(2270, 'collaborator1', '2024-06-26 15:51:02.425006', '', NULL, NULL, b'1', 2, 67, 54),
(2271, 'collaborator1', '2024-06-26 15:51:02.427166', '', NULL, NULL, b'1', 3, 67, 54),
(2272, 'collaborator1', '2024-06-26 15:51:02.430095', '', NULL, NULL, b'1', 4, 67, 54),
(2273, 'collaborator1', '2024-06-26 15:51:02.432856', '', NULL, NULL, b'1', 5, 67, 54),
(2274, 'collaborator1', '2024-06-26 15:51:02.435163', '', NULL, NULL, b'1', 6, 67, 54),
(2275, 'collaborator1', '2024-06-26 15:51:02.437855', '', NULL, NULL, b'1', 1, 68, 54),
(2276, 'collaborator1', '2024-06-26 15:51:02.439855', '', NULL, NULL, b'1', 2, 68, 54),
(2277, 'collaborator1', '2024-06-26 15:51:02.441858', '', NULL, NULL, b'1', 3, 68, 54),
(2278, 'collaborator1', '2024-06-26 15:51:02.444853', '', NULL, NULL, b'1', 4, 68, 54),
(2279, 'collaborator1', '2024-06-26 15:51:02.446855', '', NULL, NULL, b'1', 5, 68, 54),
(2280, 'collaborator1', '2024-06-26 15:51:02.449098', '', NULL, NULL, b'1', 6, 68, 54),
(2281, 'collaborator1', '2024-06-26 15:51:02.451854', '', NULL, NULL, b'1', 1, 69, 54),
(2282, 'collaborator1', '2024-06-26 15:51:02.454170', '', NULL, NULL, b'1', 2, 69, 54),
(2283, 'collaborator1', '2024-06-26 15:51:02.456860', '', NULL, NULL, b'1', 3, 69, 54),
(2284, 'collaborator1', '2024-06-26 15:51:02.459162', '', NULL, NULL, b'1', 4, 69, 54),
(2285, 'collaborator1', '2024-06-26 15:51:02.461854', '', NULL, NULL, b'1', 5, 69, 54),
(2286, 'collaborator1', '2024-06-26 15:51:02.463857', '', NULL, NULL, b'1', 6, 69, 54),
(2287, 'collaborator1', '2024-06-26 15:51:02.466855', '', NULL, NULL, b'1', 1, 70, 54),
(2288, 'collaborator1', '2024-06-26 15:51:02.469169', '', NULL, NULL, b'1', 2, 70, 54),
(2289, 'collaborator1', '2024-06-26 15:51:02.471866', '', NULL, NULL, b'1', 3, 70, 54),
(2290, 'collaborator1', '2024-06-26 15:51:02.474858', '', NULL, NULL, b'1', 4, 70, 54),
(2291, 'collaborator1', '2024-06-26 15:51:02.476854', '', NULL, NULL, b'1', 5, 70, 54),
(2292, 'collaborator1', '2024-06-26 15:51:02.479184', '', NULL, NULL, b'1', 6, 70, 54),
(2293, 'collaborator1', '2024-06-26 15:51:02.481859', '', NULL, NULL, b'1', 1, 71, 54),
(2294, 'collaborator1', '2024-06-26 15:51:02.484177', '', NULL, NULL, b'1', 2, 71, 54),
(2295, 'collaborator1', '2024-06-26 15:51:02.487028', '', NULL, NULL, b'1', 3, 71, 54),
(2296, 'collaborator1', '2024-06-26 15:51:02.489860', '', NULL, NULL, b'1', 4, 71, 54),
(2297, 'collaborator1', '2024-06-26 15:51:02.492169', '', NULL, NULL, b'1', 5, 71, 54),
(2298, 'collaborator1', '2024-06-26 15:51:02.494976', '', NULL, NULL, b'1', 6, 71, 54),
(2299, 'collaborator1', '2024-06-26 15:51:02.497909', '', NULL, NULL, b'1', 1, 72, 54),
(2300, 'collaborator1', '2024-06-26 15:51:02.500164', '', NULL, NULL, b'1', 2, 72, 54),
(2301, 'collaborator1', '2024-06-26 15:51:02.512853', '', NULL, NULL, b'1', 3, 72, 54),
(2302, 'collaborator1', '2024-06-26 15:51:02.515871', '', NULL, NULL, b'1', 4, 72, 54),
(2303, 'collaborator1', '2024-06-26 15:51:02.517854', '', NULL, NULL, b'1', 5, 72, 54),
(2304, 'collaborator1', '2024-06-26 15:51:02.519901', '', NULL, NULL, b'1', 6, 72, 54),
(2305, 'collaborator1', '2024-06-26 15:51:02.521855', '', NULL, NULL, b'1', 1, 73, 54),
(2306, 'collaborator1', '2024-06-26 15:51:02.524859', '', NULL, NULL, b'1', 2, 73, 54),
(2307, 'collaborator1', '2024-06-26 15:51:02.527219', '', NULL, NULL, b'1', 3, 73, 54),
(2308, 'collaborator1', '2024-06-26 15:51:02.530015', '', NULL, NULL, b'1', 4, 73, 54),
(2309, 'collaborator1', '2024-06-26 15:51:02.532857', '', NULL, NULL, b'1', 5, 73, 54),
(2310, 'collaborator1', '2024-06-26 15:51:02.535158', '', NULL, NULL, b'1', 6, 73, 54),
(2311, 'collaborator1', '2024-06-26 15:51:02.537856', '', NULL, NULL, b'1', 1, 74, 54),
(2312, 'collaborator1', '2024-06-26 15:51:02.541044', '', NULL, NULL, b'1', 2, 74, 54),
(2313, 'collaborator1', '2024-06-26 15:51:02.542855', '', NULL, NULL, b'1', 3, 74, 54),
(2314, 'collaborator1', '2024-06-26 15:51:02.546103', '', NULL, NULL, b'1', 4, 74, 54),
(2315, 'collaborator1', '2024-06-26 15:51:02.548856', '', NULL, NULL, b'1', 5, 74, 54),
(2316, 'collaborator1', '2024-06-26 15:51:02.551165', '', NULL, NULL, b'1', 6, 74, 54),
(2317, 'collaborator1', '2024-06-26 15:51:02.554083', '', NULL, NULL, b'1', 1, 75, 54),
(2318, 'collaborator1', '2024-06-26 15:51:02.557861', '', NULL, NULL, b'1', 2, 75, 54),
(2319, 'collaborator1', '2024-06-26 15:51:02.559859', '', NULL, NULL, b'1', 3, 75, 54),
(2320, 'collaborator1', '2024-06-26 15:51:02.561854', '', NULL, NULL, b'1', 4, 75, 54),
(2321, 'collaborator1', '2024-06-26 15:51:02.564861', '', NULL, NULL, b'1', 5, 75, 54),
(2322, 'collaborator1', '2024-06-26 15:51:02.567183', '', NULL, NULL, b'1', 6, 75, 54),
(2323, 'collaborator1', '2024-06-26 15:51:02.570127', '', NULL, NULL, b'1', 1, 76, 54),
(2324, 'collaborator1', '2024-06-26 15:51:02.572865', '', NULL, NULL, b'1', 2, 76, 54),
(2325, 'collaborator1', '2024-06-26 15:51:02.575168', '', NULL, NULL, b'1', 3, 76, 54),
(2326, 'collaborator1', '2024-06-26 15:51:02.577857', '', NULL, NULL, b'1', 4, 76, 54),
(2327, 'collaborator1', '2024-06-26 15:51:02.580126', '', NULL, NULL, b'1', 5, 76, 54),
(2328, 'collaborator1', '2024-06-26 15:51:02.582858', '', NULL, NULL, b'1', 6, 76, 54),
(2329, 'collaborator1', '2024-06-26 15:51:02.585856', '', NULL, NULL, b'1', 1, 77, 54),
(2330, 'collaborator1', '2024-06-26 15:51:02.587854', '', NULL, NULL, b'1', 2, 77, 54),
(2331, 'collaborator1', '2024-06-26 15:51:02.590855', '', NULL, NULL, b'1', 3, 77, 54),
(2332, 'collaborator1', '2024-06-26 15:51:02.592894', '', NULL, NULL, b'1', 4, 77, 54),
(2333, 'collaborator1', '2024-06-26 15:51:02.595858', '', NULL, NULL, b'1', 5, 77, 54),
(2334, 'collaborator1', '2024-06-26 15:51:02.598857', '', NULL, NULL, b'1', 6, 77, 54),
(2335, 'collaborator1', '2024-06-26 15:51:02.600853', '', NULL, NULL, b'1', 1, 78, 54),
(2336, 'collaborator1', '2024-06-26 15:51:02.602908', '', NULL, NULL, b'1', 2, 78, 54),
(2337, 'collaborator1', '2024-06-26 15:51:02.605861', '', NULL, NULL, b'1', 3, 78, 54),
(2338, 'collaborator1', '2024-06-26 15:51:02.607893', '', NULL, NULL, b'1', 4, 78, 54),
(2339, 'collaborator1', '2024-06-26 15:51:02.610170', '', NULL, NULL, b'1', 5, 78, 54),
(2340, 'collaborator1', '2024-06-26 15:51:02.612862', '', NULL, NULL, b'1', 6, 78, 54),
(2341, 'collaborator1', '2024-06-26 15:51:08.039570', '', NULL, NULL, b'1', 1, 1, 55),
(2342, 'collaborator1', '2024-06-26 15:51:08.041612', '', NULL, NULL, b'1', 2, 1, 55),
(2343, 'collaborator1', '2024-06-26 15:51:08.044571', '', NULL, NULL, b'1', 3, 1, 55),
(2344, 'collaborator1', '2024-06-26 15:51:08.047572', '', NULL, NULL, b'1', 4, 1, 55),
(2345, 'collaborator1', '2024-06-26 15:51:08.049671', '', NULL, NULL, b'1', 5, 1, 55),
(2346, 'collaborator1', '2024-06-26 15:51:08.052574', '', NULL, NULL, b'1', 6, 1, 55),
(2347, 'collaborator1', '2024-06-26 15:51:08.056609', '', NULL, NULL, b'1', 1, 2, 55),
(2348, 'collaborator1', '2024-06-26 15:51:08.060572', '', NULL, NULL, b'1', 2, 2, 55),
(2349, 'collaborator1', '2024-06-26 15:51:08.065574', '', NULL, NULL, b'1', 3, 2, 55),
(2350, 'collaborator1', '2024-06-26 15:51:08.067571', '', NULL, NULL, b'1', 4, 2, 55),
(2351, 'collaborator1', '2024-06-26 15:51:08.070576', '', NULL, NULL, b'1', 5, 2, 55),
(2352, 'collaborator1', '2024-06-26 15:51:08.073568', '', NULL, NULL, b'1', 6, 2, 55),
(2353, 'collaborator1', '2024-06-26 15:51:08.076571', '', NULL, NULL, b'1', 1, 3, 55),
(2354, 'collaborator1', '2024-06-26 15:51:08.078575', '', NULL, NULL, b'1', 2, 3, 55),
(2355, 'collaborator1', '2024-06-26 15:51:08.081852', '', NULL, NULL, b'1', 3, 3, 55),
(2356, 'collaborator1', '2024-06-26 15:51:08.084570', '', NULL, NULL, b'1', 4, 3, 55),
(2357, 'collaborator1', '2024-06-26 15:51:08.088587', '', NULL, NULL, b'1', 5, 3, 55),
(2358, 'collaborator1', '2024-06-26 15:51:08.091572', '', NULL, NULL, b'1', 6, 3, 55),
(2359, 'collaborator1', '2024-06-26 15:51:08.093570', '', NULL, NULL, b'1', 1, 4, 55),
(2360, 'collaborator1', '2024-06-26 15:51:08.096575', '', NULL, NULL, b'1', 2, 4, 55),
(2361, 'collaborator1', '2024-06-26 15:51:08.099570', '', NULL, NULL, b'1', 3, 4, 55),
(2362, 'collaborator1', '2024-06-26 15:51:08.101615', '', NULL, NULL, b'1', 4, 4, 55),
(2363, 'collaborator1', '2024-06-26 15:51:08.105573', '', NULL, NULL, b'1', 5, 4, 55),
(2364, 'collaborator1', '2024-06-26 15:51:08.107571', '', NULL, NULL, b'1', 6, 4, 55),
(2365, 'collaborator1', '2024-06-26 15:51:08.109570', '', NULL, NULL, b'1', 1, 5, 55),
(2366, 'collaborator1', '2024-06-26 15:51:08.112571', '', NULL, NULL, b'1', 2, 5, 55),
(2367, 'collaborator1', '2024-06-26 15:51:08.115571', '', NULL, NULL, b'1', 3, 5, 55),
(2368, 'collaborator1', '2024-06-26 15:51:08.117570', '', NULL, NULL, b'1', 4, 5, 55),
(2369, 'collaborator1', '2024-06-26 15:51:08.120573', '', NULL, NULL, b'1', 5, 5, 55),
(2370, 'collaborator1', '2024-06-26 15:51:08.123852', '', NULL, NULL, b'1', 6, 5, 55),
(2371, 'collaborator1', '2024-06-26 15:51:08.126616', '', NULL, NULL, b'1', 1, 6, 55),
(2372, 'collaborator1', '2024-06-26 15:51:08.129578', '', NULL, NULL, b'1', 2, 6, 55),
(2373, 'collaborator1', '2024-06-26 15:51:08.132577', '', NULL, NULL, b'1', 3, 6, 55),
(2374, 'collaborator1', '2024-06-26 15:51:08.135573', '', NULL, NULL, b'1', 4, 6, 55),
(2375, 'collaborator1', '2024-06-26 15:51:08.138580', '', NULL, NULL, b'1', 5, 6, 55),
(2376, 'collaborator1', '2024-06-26 15:51:08.141570', '', NULL, NULL, b'1', 6, 6, 55),
(2377, 'collaborator1', '2024-06-26 15:51:08.143572', '', NULL, NULL, b'1', 1, 7, 55),
(2378, 'collaborator1', '2024-06-26 15:51:08.146592', '', NULL, NULL, b'1', 2, 7, 55),
(2379, 'collaborator1', '2024-06-26 15:51:08.148844', '', NULL, NULL, b'1', 3, 7, 55),
(2380, 'collaborator1', '2024-06-26 15:51:08.151673', '', NULL, NULL, b'1', 4, 7, 55),
(2381, 'collaborator1', '2024-06-26 15:51:08.154628', '', NULL, NULL, b'1', 5, 7, 55),
(2382, 'collaborator1', '2024-06-26 15:51:08.156763', '', NULL, NULL, b'1', 6, 7, 55),
(2383, 'collaborator1', '2024-06-26 15:51:08.159731', '', NULL, NULL, b'1', 1, 8, 55),
(2384, 'collaborator1', '2024-06-26 15:51:08.163578', '', NULL, NULL, b'1', 2, 8, 55),
(2385, 'collaborator1', '2024-06-26 15:51:08.165851', '', NULL, NULL, b'1', 3, 8, 55),
(2386, 'collaborator1', '2024-06-26 15:51:08.168576', '', NULL, NULL, b'1', 4, 8, 55),
(2387, 'collaborator1', '2024-06-26 15:51:08.171630', '', NULL, NULL, b'1', 5, 8, 55),
(2388, 'collaborator1', '2024-06-26 15:51:08.174728', '', NULL, NULL, b'1', 6, 8, 55),
(2389, 'collaborator1', '2024-06-26 15:51:08.177576', '', NULL, NULL, b'1', 1, 9, 55),
(2390, 'collaborator1', '2024-06-26 15:51:08.180570', '', NULL, NULL, b'1', 2, 9, 55),
(2391, 'collaborator1', '2024-06-26 15:51:08.182741', '', NULL, NULL, b'1', 3, 9, 55),
(2392, 'collaborator1', '2024-06-26 15:51:08.185578', '', NULL, NULL, b'1', 4, 9, 55),
(2393, 'collaborator1', '2024-06-26 15:51:08.188783', '', NULL, NULL, b'1', 5, 9, 55),
(2394, 'collaborator1', '2024-06-26 15:51:08.190850', '', NULL, NULL, b'1', 6, 9, 55),
(2395, 'collaborator1', '2024-06-26 15:51:08.193576', '', NULL, NULL, b'1', 1, 10, 55),
(2396, 'collaborator1', '2024-06-26 15:51:08.196598', '', NULL, NULL, b'1', 2, 10, 55),
(2397, 'collaborator1', '2024-06-26 15:51:08.199730', '', NULL, NULL, b'1', 3, 10, 55),
(2398, 'collaborator1', '2024-06-26 15:51:08.202573', '', NULL, NULL, b'1', 4, 10, 55),
(2399, 'collaborator1', '2024-06-26 15:51:08.205573', '', NULL, NULL, b'1', 5, 10, 55),
(2400, 'collaborator1', '2024-06-26 15:51:08.207611', '', NULL, NULL, b'1', 6, 10, 55),
(2401, 'collaborator1', '2024-06-26 15:51:08.209852', '', NULL, NULL, b'1', 1, 11, 55),
(2402, 'collaborator1', '2024-06-26 15:51:08.212646', '', NULL, NULL, b'1', 2, 11, 55),
(2403, 'collaborator1', '2024-06-26 15:51:08.215576', '', NULL, NULL, b'1', 3, 11, 55),
(2404, 'collaborator1', '2024-06-26 15:51:08.218574', '', NULL, NULL, b'1', 4, 11, 55),
(2405, 'collaborator1', '2024-06-26 15:51:08.221618', '', NULL, NULL, b'1', 5, 11, 55),
(2406, 'collaborator1', '2024-06-26 15:51:08.223852', '', NULL, NULL, b'1', 6, 11, 55),
(2407, 'collaborator1', '2024-06-26 15:51:08.226690', '', NULL, NULL, b'1', 1, 12, 55),
(2408, 'collaborator1', '2024-06-26 15:51:08.230651', '', NULL, NULL, b'1', 2, 12, 55),
(2409, 'collaborator1', '2024-06-26 15:51:08.233576', '', NULL, NULL, b'1', 3, 12, 55),
(2410, 'collaborator1', '2024-06-26 15:51:08.235570', '', NULL, NULL, b'1', 4, 12, 55),
(2411, 'collaborator1', '2024-06-26 15:51:08.238580', '', NULL, NULL, b'1', 5, 12, 55),
(2412, 'collaborator1', '2024-06-26 15:51:08.240875', '', NULL, NULL, b'1', 6, 12, 55),
(2413, 'collaborator1', '2024-06-26 15:51:08.243576', '', NULL, NULL, b'1', 1, 13, 55),
(2414, 'collaborator1', '2024-06-26 15:51:08.246903', '', NULL, NULL, b'1', 2, 13, 55),
(2415, 'collaborator1', '2024-06-26 15:51:08.249753', '', NULL, NULL, b'1', 3, 13, 55),
(2416, 'collaborator1', '2024-06-26 15:51:08.252570', '', NULL, NULL, b'1', 4, 13, 55),
(2417, 'collaborator1', '2024-06-26 15:51:08.255576', '', NULL, NULL, b'1', 5, 13, 55),
(2418, 'collaborator1', '2024-06-26 15:51:08.257616', '', NULL, NULL, b'1', 6, 13, 55),
(2419, 'collaborator1', '2024-06-26 15:51:08.260580', '', NULL, NULL, b'1', 1, 14, 55),
(2420, 'collaborator1', '2024-06-26 15:51:08.263569', '', NULL, NULL, b'1', 2, 14, 55),
(2421, 'collaborator1', '2024-06-26 15:51:08.265571', '', NULL, NULL, b'1', 3, 14, 55),
(2422, 'collaborator1', '2024-06-26 15:51:08.267615', '', NULL, NULL, b'1', 4, 14, 55),
(2423, 'collaborator1', '2024-06-26 15:51:08.270573', '', NULL, NULL, b'1', 5, 14, 55),
(2424, 'collaborator1', '2024-06-26 15:51:08.272788', '', NULL, NULL, b'1', 6, 14, 55),
(2425, 'collaborator1', '2024-06-26 15:51:08.275721', '', NULL, NULL, b'1', 1, 15, 55),
(2426, 'collaborator1', '2024-06-26 15:51:08.277573', '', NULL, NULL, b'1', 2, 15, 55),
(2427, 'collaborator1', '2024-06-26 15:51:08.280917', '', NULL, NULL, b'1', 3, 15, 55),
(2428, 'collaborator1', '2024-06-26 15:51:08.283726', '', NULL, NULL, b'1', 4, 15, 55),
(2429, 'collaborator1', '2024-06-26 15:51:08.286573', '', NULL, NULL, b'1', 5, 15, 55),
(2430, 'collaborator1', '2024-06-26 15:51:08.288897', '', NULL, NULL, b'1', 6, 15, 55),
(2431, 'collaborator1', '2024-06-26 15:51:08.291784', '', NULL, NULL, b'1', 1, 16, 55),
(2432, 'collaborator1', '2024-06-26 15:51:08.294580', '', NULL, NULL, b'1', 2, 16, 55),
(2433, 'collaborator1', '2024-06-26 15:51:08.296876', '', NULL, NULL, b'1', 3, 16, 55),
(2434, 'collaborator1', '2024-06-26 15:51:08.299899', '', NULL, NULL, b'1', 4, 16, 55),
(2435, 'collaborator1', '2024-06-26 15:51:08.302577', '', NULL, NULL, b'1', 5, 16, 55),
(2436, 'collaborator1', '2024-06-26 15:51:08.304882', '', NULL, NULL, b'1', 6, 16, 55),
(2437, 'collaborator1', '2024-06-26 15:51:08.307636', '', NULL, NULL, b'1', 1, 17, 55),
(2438, 'collaborator1', '2024-06-26 15:51:08.310572', '', NULL, NULL, b'1', 2, 17, 55),
(2439, 'collaborator1', '2024-06-26 15:51:08.313571', '', NULL, NULL, b'1', 3, 17, 55),
(2440, 'collaborator1', '2024-06-26 15:51:08.315568', '', NULL, NULL, b'1', 4, 17, 55),
(2441, 'collaborator1', '2024-06-26 15:51:08.317569', '', NULL, NULL, b'1', 5, 17, 55),
(2442, 'collaborator1', '2024-06-26 15:51:08.319579', '', NULL, NULL, b'1', 6, 17, 55),
(2443, 'collaborator1', '2024-06-26 15:51:08.322804', '', NULL, NULL, b'1', 1, 18, 55),
(2444, 'collaborator1', '2024-06-26 15:51:08.325616', '', NULL, NULL, b'1', 2, 18, 55),
(2445, 'collaborator1', '2024-06-26 15:51:08.328625', '', NULL, NULL, b'1', 3, 18, 55),
(2446, 'collaborator1', '2024-06-26 15:51:08.330570', '', NULL, NULL, b'1', 4, 18, 55),
(2447, 'collaborator1', '2024-06-26 15:51:08.333615', '', NULL, NULL, b'1', 5, 18, 55),
(2448, 'collaborator1', '2024-06-26 15:51:08.335571', '', NULL, NULL, b'1', 6, 18, 55),
(2449, 'collaborator1', '2024-06-26 15:51:08.338795', '', NULL, NULL, b'1', 1, 19, 55),
(2450, 'collaborator1', '2024-06-26 15:51:08.341601', '', NULL, NULL, b'1', 2, 19, 55),
(2451, 'collaborator1', '2024-06-26 15:51:08.344617', '', NULL, NULL, b'1', 3, 19, 55),
(2452, 'collaborator1', '2024-06-26 15:51:08.346887', '', NULL, NULL, b'1', 4, 19, 55),
(2453, 'collaborator1', '2024-06-26 15:51:08.349571', '', NULL, NULL, b'1', 5, 19, 55),
(2454, 'collaborator1', '2024-06-26 15:51:08.351846', '', NULL, NULL, b'1', 6, 19, 55),
(2455, 'collaborator1', '2024-06-26 15:51:08.354571', '', NULL, NULL, b'1', 1, 20, 55),
(2456, 'collaborator1', '2024-06-26 15:51:08.357578', '', NULL, NULL, b'1', 2, 20, 55),
(2457, 'collaborator1', '2024-06-26 15:51:08.359876', '', NULL, NULL, b'1', 3, 20, 55),
(2458, 'collaborator1', '2024-06-26 15:51:08.362578', '', NULL, NULL, b'1', 4, 20, 55),
(2459, 'collaborator1', '2024-06-26 15:51:08.365591', '', NULL, NULL, b'1', 5, 20, 55),
(2460, 'collaborator1', '2024-06-26 15:51:08.367611', '', NULL, NULL, b'1', 6, 20, 55),
(2461, 'collaborator1', '2024-06-26 15:51:08.371572', '', NULL, NULL, b'1', 1, 21, 55),
(2462, 'collaborator1', '2024-06-26 15:51:08.373929', '', NULL, NULL, b'1', 2, 21, 55),
(2463, 'collaborator1', '2024-06-26 15:51:08.376575', '', NULL, NULL, b'1', 3, 21, 55),
(2464, 'collaborator1', '2024-06-26 15:51:08.379572', '', NULL, NULL, b'1', 4, 21, 55),
(2465, 'collaborator1', '2024-06-26 15:51:08.381571', '', NULL, NULL, b'1', 5, 21, 55),
(2466, 'collaborator1', '2024-06-26 15:51:08.383570', '', NULL, NULL, b'1', 6, 21, 55),
(2467, 'collaborator1', '2024-06-26 15:51:08.386575', '', NULL, NULL, b'1', 1, 22, 55),
(2468, 'collaborator1', '2024-06-26 15:51:08.389659', '', NULL, NULL, b'1', 2, 22, 55),
(2469, 'collaborator1', '2024-06-26 15:51:08.391572', '', NULL, NULL, b'1', 3, 22, 55),
(2470, 'collaborator1', '2024-06-26 15:51:08.394573', '', NULL, NULL, b'1', 4, 22, 55),
(2471, 'collaborator1', '2024-06-26 15:51:08.397570', '', NULL, NULL, b'1', 5, 22, 55),
(2472, 'collaborator1', '2024-06-26 15:51:08.399836', '', NULL, NULL, b'1', 6, 22, 55),
(2473, 'collaborator1', '2024-06-26 15:51:08.401729', '', NULL, NULL, b'1', 1, 23, 55),
(2474, 'collaborator1', '2024-06-26 15:51:08.404572', '', NULL, NULL, b'1', 2, 23, 55),
(2475, 'collaborator1', '2024-06-26 15:51:08.407571', '', NULL, NULL, b'1', 3, 23, 55),
(2476, 'collaborator1', '2024-06-26 15:51:08.409637', '', NULL, NULL, b'1', 4, 23, 55),
(2477, 'collaborator1', '2024-06-26 15:51:08.412570', '', NULL, NULL, b'1', 5, 23, 55),
(2478, 'collaborator1', '2024-06-26 15:51:08.414838', '', NULL, NULL, b'1', 6, 23, 55),
(2479, 'collaborator1', '2024-06-26 15:51:08.417571', '', NULL, NULL, b'1', 1, 24, 55),
(2480, 'collaborator1', '2024-06-26 15:51:08.419574', '', NULL, NULL, b'1', 2, 24, 55),
(2481, 'collaborator1', '2024-06-26 15:51:08.422677', '', NULL, NULL, b'1', 3, 24, 55),
(2482, 'collaborator1', '2024-06-26 15:51:08.424832', '', NULL, NULL, b'1', 4, 24, 55),
(2483, 'collaborator1', '2024-06-26 15:51:08.426568', '', NULL, NULL, b'1', 5, 24, 55),
(2484, 'collaborator1', '2024-06-26 15:51:08.429806', '', NULL, NULL, b'1', 6, 24, 55),
(2485, 'collaborator1', '2024-06-26 15:51:08.431835', '', NULL, NULL, b'1', 1, 25, 55),
(2486, 'collaborator1', '2024-06-26 15:51:08.433526', '', NULL, NULL, b'1', 2, 25, 55),
(2487, 'collaborator1', '2024-06-26 15:51:08.436660', '', NULL, NULL, b'1', 3, 25, 55),
(2488, 'collaborator1', '2024-06-26 15:51:08.439567', '', NULL, NULL, b'1', 4, 25, 55),
(2489, 'collaborator1', '2024-06-26 15:51:08.441525', '', NULL, NULL, b'1', 5, 25, 55),
(2490, 'collaborator1', '2024-06-26 15:51:08.443529', '', NULL, NULL, b'1', 6, 25, 55),
(2491, 'collaborator1', '2024-06-26 15:51:08.446528', '', NULL, NULL, b'1', 1, 26, 55),
(2492, 'collaborator1', '2024-06-26 15:51:08.449526', '', NULL, NULL, b'1', 2, 26, 55),
(2493, 'collaborator1', '2024-06-26 15:51:08.451530', '', NULL, NULL, b'1', 3, 26, 55),
(2494, 'collaborator1', '2024-06-26 15:51:08.453533', '', NULL, NULL, b'1', 4, 26, 55),
(2495, 'collaborator1', '2024-06-26 15:51:08.456529', '', NULL, NULL, b'1', 5, 26, 55),
(2496, 'collaborator1', '2024-06-26 15:51:08.458841', '', NULL, NULL, b'1', 6, 26, 55),
(2497, 'collaborator1', '2024-06-26 15:51:08.461530', '', NULL, NULL, b'1', 1, 27, 55),
(2498, 'collaborator1', '2024-06-26 15:51:08.463854', '', NULL, NULL, b'1', 2, 27, 55),
(2499, 'collaborator1', '2024-06-26 15:51:08.466534', '', NULL, NULL, b'1', 3, 27, 55),
(2500, 'collaborator1', '2024-06-26 15:51:08.468527', '', NULL, NULL, b'1', 4, 27, 55),
(2501, 'collaborator1', '2024-06-26 15:51:08.471857', '', NULL, NULL, b'1', 5, 27, 55),
(2502, 'collaborator1', '2024-06-26 15:51:08.474647', '', NULL, NULL, b'1', 6, 27, 55),
(2503, 'collaborator1', '2024-06-26 15:51:08.476639', '', NULL, NULL, b'1', 1, 28, 55),
(2504, 'collaborator1', '2024-06-26 15:51:08.479847', '', NULL, NULL, b'1', 2, 28, 55),
(2505, 'collaborator1', '2024-06-26 15:51:08.482821', '', NULL, NULL, b'1', 3, 28, 55),
(2506, 'collaborator1', '2024-06-26 15:51:08.485529', '', NULL, NULL, b'1', 4, 28, 55),
(2507, 'collaborator1', '2024-06-26 15:51:08.488528', '', NULL, NULL, b'1', 5, 28, 55),
(2508, 'collaborator1', '2024-06-26 15:51:08.490865', '', NULL, NULL, b'1', 6, 28, 55),
(2509, 'collaborator1', '2024-06-26 15:51:08.493527', '', NULL, NULL, b'1', 1, 29, 55),
(2510, 'collaborator1', '2024-06-26 15:51:08.496529', '', NULL, NULL, b'1', 2, 29, 55),
(2511, 'collaborator1', '2024-06-26 15:51:08.498839', '', NULL, NULL, b'1', 3, 29, 55),
(2512, 'collaborator1', '2024-06-26 15:51:08.501761', '', NULL, NULL, b'1', 4, 29, 55),
(2513, 'collaborator1', '2024-06-26 15:51:08.504576', '', NULL, NULL, b'1', 5, 29, 55),
(2514, 'collaborator1', '2024-06-26 15:51:08.506838', '', NULL, NULL, b'1', 6, 29, 55),
(2515, 'collaborator1', '2024-06-26 15:51:08.509527', '', NULL, NULL, b'1', 1, 30, 55),
(2516, 'collaborator1', '2024-06-26 15:51:08.512530', '', NULL, NULL, b'1', 2, 30, 55),
(2517, 'collaborator1', '2024-06-26 15:51:08.514855', '', NULL, NULL, b'1', 3, 30, 55),
(2518, 'collaborator1', '2024-06-26 15:51:08.517527', '', NULL, NULL, b'1', 4, 30, 55),
(2519, 'collaborator1', '2024-06-26 15:51:08.519535', '', NULL, NULL, b'1', 5, 30, 55),
(2520, 'collaborator1', '2024-06-26 15:51:08.522528', '', NULL, NULL, b'1', 6, 30, 55),
(2521, 'collaborator1', '2024-06-26 15:51:08.524531', '', NULL, NULL, b'1', 1, 31, 55),
(2522, 'collaborator1', '2024-06-26 15:51:08.526704', '', NULL, NULL, b'1', 2, 31, 55),
(2523, 'collaborator1', '2024-06-26 15:51:08.529852', '', NULL, NULL, b'1', 3, 31, 55),
(2524, 'collaborator1', '2024-06-26 15:51:08.532640', '', NULL, NULL, b'1', 4, 31, 55),
(2525, 'collaborator1', '2024-06-26 15:51:08.534844', '', NULL, NULL, b'1', 5, 31, 55),
(2526, 'collaborator1', '2024-06-26 15:51:08.537537', '', NULL, NULL, b'1', 6, 31, 55),
(2527, 'collaborator1', '2024-06-26 15:51:08.540532', '', NULL, NULL, b'1', 1, 32, 55),
(2528, 'collaborator1', '2024-06-26 15:51:08.543530', '', NULL, NULL, b'1', 2, 32, 55),
(2529, 'collaborator1', '2024-06-26 15:51:08.546527', '', NULL, NULL, b'1', 3, 32, 55),
(2530, 'collaborator1', '2024-06-26 15:51:08.548856', '', NULL, NULL, b'1', 4, 32, 55),
(2531, 'collaborator1', '2024-06-26 15:51:08.551654', '', NULL, NULL, b'1', 5, 32, 55),
(2532, 'collaborator1', '2024-06-26 15:51:08.554528', '', NULL, NULL, b'1', 6, 32, 55),
(2533, 'collaborator1', '2024-06-26 15:51:08.556533', '', NULL, NULL, b'1', 1, 33, 55),
(2534, 'collaborator1', '2024-06-26 15:51:08.559527', '', NULL, NULL, b'1', 2, 33, 55),
(2535, 'collaborator1', '2024-06-26 15:51:08.561535', '', NULL, NULL, b'1', 3, 33, 55),
(2536, 'collaborator1', '2024-06-26 15:51:08.564526', '', NULL, NULL, b'1', 4, 33, 55),
(2537, 'collaborator1', '2024-06-26 15:51:08.566782', '', NULL, NULL, b'1', 5, 33, 55),
(2538, 'collaborator1', '2024-06-26 15:51:08.568531', '', NULL, NULL, b'1', 6, 33, 55),
(2539, 'collaborator1', '2024-06-26 15:51:08.571789', '', NULL, NULL, b'1', 1, 34, 55),
(2540, 'collaborator1', '2024-06-26 15:51:08.573528', '', NULL, NULL, b'1', 2, 34, 55),
(2541, 'collaborator1', '2024-06-26 15:51:08.576527', '', NULL, NULL, b'1', 3, 34, 55),
(2542, 'collaborator1', '2024-06-26 15:51:08.580526', '', NULL, NULL, b'1', 4, 34, 55),
(2543, 'collaborator1', '2024-06-26 15:51:08.582822', '', NULL, NULL, b'1', 5, 34, 55),
(2544, 'collaborator1', '2024-06-26 15:51:08.585528', '', NULL, NULL, b'1', 6, 34, 55),
(2545, 'collaborator1', '2024-06-26 15:51:08.588567', '', NULL, NULL, b'1', 1, 35, 55),
(2546, 'collaborator1', '2024-06-26 15:51:08.591532', '', NULL, NULL, b'1', 2, 35, 55),
(2547, 'collaborator1', '2024-06-26 15:51:08.593528', '', NULL, NULL, b'1', 3, 35, 55),
(2548, 'collaborator1', '2024-06-26 15:51:08.596902', '', NULL, NULL, b'1', 4, 35, 55),
(2549, 'collaborator1', '2024-06-26 15:51:08.599768', '', NULL, NULL, b'1', 5, 35, 55),
(2550, 'collaborator1', '2024-06-26 15:51:08.602537', '', NULL, NULL, b'1', 6, 35, 55),
(2551, 'collaborator1', '2024-06-26 15:51:08.604834', '', NULL, NULL, b'1', 1, 36, 55),
(2552, 'collaborator1', '2024-06-26 15:51:08.607649', '', NULL, NULL, b'1', 2, 36, 55),
(2553, 'collaborator1', '2024-06-26 15:51:08.609526', '', NULL, NULL, b'1', 3, 36, 55),
(2554, 'collaborator1', '2024-06-26 15:51:08.612805', '', NULL, NULL, b'1', 4, 36, 55),
(2555, 'collaborator1', '2024-06-26 15:51:08.615767', '', NULL, NULL, b'1', 5, 36, 55),
(2556, 'collaborator1', '2024-06-26 15:51:08.618535', '', NULL, NULL, b'1', 6, 36, 55),
(2557, 'collaborator1', '2024-06-26 15:51:08.620621', '', NULL, NULL, b'1', 1, 37, 55),
(2558, 'collaborator1', '2024-06-26 15:51:08.623690', '', NULL, NULL, b'1', 2, 37, 55),
(2559, 'collaborator1', '2024-06-26 15:51:08.625857', '', NULL, NULL, b'1', 3, 37, 55),
(2560, 'collaborator1', '2024-06-26 15:51:08.628736', '', NULL, NULL, b'1', 4, 37, 55),
(2561, 'collaborator1', '2024-06-26 15:51:08.631760', '', NULL, NULL, b'1', 5, 37, 55),
(2562, 'collaborator1', '2024-06-26 15:51:08.634809', '', NULL, NULL, b'1', 6, 37, 55),
(2563, 'collaborator1', '2024-06-26 15:51:08.637526', '', NULL, NULL, b'1', 1, 38, 55),
(2564, 'collaborator1', '2024-06-26 15:51:08.639847', '', NULL, NULL, b'1', 2, 38, 55),
(2565, 'collaborator1', '2024-06-26 15:51:08.642746', '', NULL, NULL, b'1', 3, 38, 55),
(2566, 'collaborator1', '2024-06-26 15:51:08.645607', '', NULL, NULL, b'1', 4, 38, 55),
(2567, 'collaborator1', '2024-06-26 15:51:08.647527', '', NULL, NULL, b'1', 5, 38, 55),
(2568, 'collaborator1', '2024-06-26 15:51:08.650548', '', NULL, NULL, b'1', 6, 38, 55),
(2569, 'collaborator1', '2024-06-26 15:51:08.652526', '', NULL, NULL, b'1', 1, 39, 55),
(2570, 'collaborator1', '2024-06-26 15:51:08.655894', '', NULL, NULL, b'1', 2, 39, 55),
(2571, 'collaborator1', '2024-06-26 15:51:08.658605', '', NULL, NULL, b'1', 3, 39, 55),
(2572, 'collaborator1', '2024-06-26 15:51:08.661531', '', NULL, NULL, b'1', 4, 39, 55),
(2573, 'collaborator1', '2024-06-26 15:51:08.663868', '', NULL, NULL, b'1', 5, 39, 55),
(2574, 'collaborator1', '2024-06-26 15:51:08.666743', '', NULL, NULL, b'1', 6, 39, 55),
(2575, 'collaborator1', '2024-06-26 15:51:08.669527', '', NULL, NULL, b'1', 1, 40, 55),
(2576, 'collaborator1', '2024-06-26 15:51:08.671857', '', NULL, NULL, b'1', 2, 40, 55),
(2577, 'collaborator1', '2024-06-26 15:51:08.674756', '', NULL, NULL, b'1', 3, 40, 55),
(2578, 'collaborator1', '2024-06-26 15:51:08.676527', '', NULL, NULL, b'1', 4, 40, 55),
(2579, 'collaborator1', '2024-06-26 15:51:08.679845', '', NULL, NULL, b'1', 5, 40, 55),
(2580, 'collaborator1', '2024-06-26 15:51:08.682816', '', NULL, NULL, b'1', 6, 40, 55),
(2581, 'collaborator1', '2024-06-26 15:51:08.684527', '', NULL, NULL, b'1', 1, 41, 55),
(2582, 'collaborator1', '2024-06-26 15:51:08.687527', '', NULL, NULL, b'1', 2, 41, 55),
(2583, 'collaborator1', '2024-06-26 15:51:08.690535', '', NULL, NULL, b'1', 3, 41, 55),
(2584, 'collaborator1', '2024-06-26 15:51:08.692767', '', NULL, NULL, b'1', 4, 41, 55),
(2585, 'collaborator1', '2024-06-26 15:51:08.695533', '', NULL, NULL, b'1', 5, 41, 55),
(2586, 'collaborator1', '2024-06-26 15:51:08.697527', '', NULL, NULL, b'1', 6, 41, 55),
(2587, 'collaborator1', '2024-06-26 15:51:08.700532', '', NULL, NULL, b'1', 1, 42, 55),
(2588, 'collaborator1', '2024-06-26 15:51:08.703526', '', NULL, NULL, b'1', 2, 42, 55),
(2589, 'collaborator1', '2024-06-26 15:51:08.705884', '', NULL, NULL, b'1', 3, 42, 55),
(2590, 'collaborator1', '2024-06-26 15:51:08.708744', '', NULL, NULL, b'1', 4, 42, 55),
(2591, 'collaborator1', '2024-06-26 15:51:08.711526', '', NULL, NULL, b'1', 5, 42, 55),
(2592, 'collaborator1', '2024-06-26 15:51:08.713852', '', NULL, NULL, b'1', 6, 42, 55),
(2593, 'collaborator1', '2024-06-26 15:51:08.716647', '', NULL, NULL, b'1', 1, 43, 55),
(2594, 'collaborator1', '2024-06-26 15:51:08.719533', '', NULL, NULL, b'1', 2, 43, 55),
(2595, 'collaborator1', '2024-06-26 15:51:08.721566', '', NULL, NULL, b'1', 3, 43, 55),
(2596, 'collaborator1', '2024-06-26 15:51:08.723566', '', NULL, NULL, b'1', 4, 43, 55),
(2597, 'collaborator1', '2024-06-26 15:51:08.726594', '', NULL, NULL, b'1', 5, 43, 55),
(2598, 'collaborator1', '2024-06-26 15:51:08.729529', '', NULL, NULL, b'1', 6, 43, 55),
(2599, 'collaborator1', '2024-06-26 15:51:08.731829', '', NULL, NULL, b'1', 1, 44, 55),
(2600, 'collaborator1', '2024-06-26 15:51:08.734649', '', NULL, NULL, b'1', 2, 44, 55),
(2601, 'collaborator1', '2024-06-26 15:51:08.737486', '', NULL, NULL, b'1', 3, 44, 55),
(2602, 'collaborator1', '2024-06-26 15:51:08.739759', '', NULL, NULL, b'1', 4, 44, 55),
(2603, 'collaborator1', '2024-06-26 15:51:08.742646', '', NULL, NULL, b'1', 5, 44, 55),
(2604, 'collaborator1', '2024-06-26 15:51:08.745523', '', NULL, NULL, b'1', 6, 44, 55),
(2605, 'collaborator1', '2024-06-26 15:51:08.747477', '', NULL, NULL, b'1', 1, 45, 55),
(2606, 'collaborator1', '2024-06-26 15:51:08.750613', '', NULL, NULL, b'1', 2, 45, 55),
(2607, 'collaborator1', '2024-06-26 15:51:08.753566', '', NULL, NULL, b'1', 3, 45, 55),
(2608, 'collaborator1', '2024-06-26 15:51:08.756462', '', NULL, NULL, b'1', 4, 45, 55),
(2609, 'collaborator1', '2024-06-26 15:51:08.758769', '', NULL, NULL, b'1', 5, 45, 55),
(2610, 'collaborator1', '2024-06-26 15:51:08.761460', '', NULL, NULL, b'1', 6, 45, 55),
(2611, 'collaborator1', '2024-06-26 15:51:08.763769', '', NULL, NULL, b'1', 1, 46, 55),
(2612, 'collaborator1', '2024-06-26 15:51:08.766598', '', NULL, NULL, b'1', 2, 46, 55),
(2613, 'collaborator1', '2024-06-26 15:51:08.769459', '', NULL, NULL, b'1', 3, 46, 55),
(2614, 'collaborator1', '2024-06-26 15:51:08.771772', '', NULL, NULL, b'1', 4, 46, 55),
(2615, 'collaborator1', '2024-06-26 15:51:08.774593', '', NULL, NULL, b'1', 5, 46, 55),
(2616, 'collaborator1', '2024-06-26 15:51:08.776457', '', NULL, NULL, b'1', 6, 46, 55),
(2617, 'collaborator1', '2024-06-26 15:51:08.779454', '', NULL, NULL, b'1', 1, 47, 55),
(2618, 'collaborator1', '2024-06-26 15:51:08.782454', '', NULL, NULL, b'1', 2, 47, 55),
(2619, 'collaborator1', '2024-06-26 15:51:08.783456', '', NULL, NULL, b'1', 3, 47, 55),
(2620, 'collaborator1', '2024-06-26 15:51:08.786458', '', NULL, NULL, b'1', 4, 47, 55),
(2621, 'collaborator1', '2024-06-26 15:51:08.788476', '', NULL, NULL, b'1', 5, 47, 55),
(2622, 'collaborator1', '2024-06-26 15:51:08.790476', '', NULL, NULL, b'1', 6, 47, 55),
(2623, 'collaborator1', '2024-06-26 15:51:08.792475', '', NULL, NULL, b'1', 1, 48, 55),
(2624, 'collaborator1', '2024-06-26 15:51:08.794455', '', NULL, NULL, b'1', 2, 48, 55),
(2625, 'collaborator1', '2024-06-26 15:51:08.796476', '', NULL, NULL, b'1', 3, 48, 55);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(2626, 'collaborator1', '2024-06-26 15:51:08.798476', '', NULL, NULL, b'1', 4, 48, 55),
(2627, 'collaborator1', '2024-06-26 15:51:08.800475', '', NULL, NULL, b'1', 5, 48, 55),
(2628, 'collaborator1', '2024-06-26 15:51:08.802461', '', NULL, NULL, b'1', 6, 48, 55),
(2629, 'collaborator1', '2024-06-26 15:51:08.805509', '', NULL, NULL, b'1', 1, 49, 55),
(2630, 'collaborator1', '2024-06-26 15:51:08.808461', '', NULL, NULL, b'1', 2, 49, 55),
(2631, 'collaborator1', '2024-06-26 15:51:08.810459', '', NULL, NULL, b'1', 3, 49, 55),
(2632, 'collaborator1', '2024-06-26 15:51:08.813559', '', NULL, NULL, b'1', 4, 49, 55),
(2633, 'collaborator1', '2024-06-26 15:51:08.815772', '', NULL, NULL, b'1', 5, 49, 55),
(2634, 'collaborator1', '2024-06-26 15:51:08.818456', '', NULL, NULL, b'1', 6, 49, 55),
(2635, 'collaborator1', '2024-06-26 15:51:08.820758', '', NULL, NULL, b'1', 1, 50, 55),
(2636, 'collaborator1', '2024-06-26 15:51:08.823664', '', NULL, NULL, b'1', 2, 50, 55),
(2637, 'collaborator1', '2024-06-26 15:51:08.826457', '', NULL, NULL, b'1', 3, 50, 55),
(2638, 'collaborator1', '2024-06-26 15:51:08.828662', '', NULL, NULL, b'1', 4, 50, 55),
(2639, 'collaborator1', '2024-06-26 15:51:08.831515', '', NULL, NULL, b'1', 5, 50, 55),
(2640, 'collaborator1', '2024-06-26 15:51:08.834039', '', NULL, NULL, b'1', 6, 50, 55),
(2641, 'collaborator1', '2024-06-26 15:51:08.836718', '', NULL, NULL, b'1', 1, 51, 55),
(2642, 'collaborator1', '2024-06-26 15:51:08.838765', '', NULL, NULL, b'1', 2, 51, 55),
(2643, 'collaborator1', '2024-06-26 15:51:08.841713', '', NULL, NULL, b'1', 3, 51, 55),
(2644, 'collaborator1', '2024-06-26 15:51:08.843709', '', NULL, NULL, b'1', 4, 51, 55),
(2645, 'collaborator1', '2024-06-26 15:51:08.846875', '', NULL, NULL, b'1', 5, 51, 55),
(2646, 'collaborator1', '2024-06-26 15:51:08.849799', '', NULL, NULL, b'1', 6, 51, 55),
(2647, 'collaborator1', '2024-06-26 15:51:08.852707', '', NULL, NULL, b'1', 1, 52, 55),
(2648, 'collaborator1', '2024-06-26 15:51:08.855066', '', NULL, NULL, b'1', 2, 52, 55),
(2649, 'collaborator1', '2024-06-26 15:51:08.857717', '', NULL, NULL, b'1', 3, 52, 55),
(2650, 'collaborator1', '2024-06-26 15:51:08.859853', '', NULL, NULL, b'1', 4, 52, 55),
(2651, 'collaborator1', '2024-06-26 15:51:08.862708', '', NULL, NULL, b'1', 5, 52, 55),
(2652, 'collaborator1', '2024-06-26 15:51:08.865041', '', NULL, NULL, b'1', 6, 52, 55),
(2653, 'collaborator1', '2024-06-26 15:51:08.867715', '', NULL, NULL, b'1', 1, 53, 55),
(2654, 'collaborator1', '2024-06-26 15:51:08.870709', '', NULL, NULL, b'1', 2, 53, 55),
(2655, 'collaborator1', '2024-06-26 15:51:08.872799', '', NULL, NULL, b'1', 3, 53, 55),
(2656, 'collaborator1', '2024-06-26 15:51:08.875016', '', NULL, NULL, b'1', 4, 53, 55),
(2657, 'collaborator1', '2024-06-26 15:51:08.877712', '', NULL, NULL, b'1', 5, 53, 55),
(2658, 'collaborator1', '2024-06-26 15:51:08.880022', '', NULL, NULL, b'1', 6, 53, 55),
(2659, 'collaborator1', '2024-06-26 15:51:08.882795', '', NULL, NULL, b'1', 1, 54, 55),
(2660, 'collaborator1', '2024-06-26 15:51:08.884710', '', NULL, NULL, b'1', 2, 54, 55),
(2661, 'collaborator1', '2024-06-26 15:51:08.887747', '', NULL, NULL, b'1', 3, 54, 55),
(2662, 'collaborator1', '2024-06-26 15:51:08.890010', '', NULL, NULL, b'1', 4, 54, 55),
(2663, 'collaborator1', '2024-06-26 15:51:08.892793', '', NULL, NULL, b'1', 5, 54, 55),
(2664, 'collaborator1', '2024-06-26 15:51:08.896070', '', NULL, NULL, b'1', 6, 54, 55),
(2665, 'collaborator1', '2024-06-26 15:51:08.898885', '', NULL, NULL, b'1', 1, 55, 55),
(2666, 'collaborator1', '2024-06-26 15:51:08.901711', '', NULL, NULL, b'1', 2, 55, 55),
(2667, 'collaborator1', '2024-06-26 15:51:08.904710', '', NULL, NULL, b'1', 3, 55, 55),
(2668, 'collaborator1', '2024-06-26 15:51:08.907732', '', NULL, NULL, b'1', 4, 55, 55),
(2669, 'collaborator1', '2024-06-26 15:51:08.909850', '', NULL, NULL, b'1', 5, 55, 55),
(2670, 'collaborator1', '2024-06-26 15:51:08.912772', '', NULL, NULL, b'1', 6, 55, 55),
(2671, 'collaborator1', '2024-06-26 15:51:08.915047', '', NULL, NULL, b'1', 1, 56, 55),
(2672, 'collaborator1', '2024-06-26 15:51:08.917707', '', NULL, NULL, b'1', 2, 56, 55),
(2673, 'collaborator1', '2024-06-26 15:51:08.920714', '', NULL, NULL, b'1', 3, 56, 55),
(2674, 'collaborator1', '2024-06-26 15:51:08.922709', '', NULL, NULL, b'1', 4, 56, 55),
(2675, 'collaborator1', '2024-06-26 15:51:08.924747', '', NULL, NULL, b'1', 5, 56, 55),
(2676, 'collaborator1', '2024-06-26 15:51:08.927712', '', NULL, NULL, b'1', 6, 56, 55),
(2677, 'collaborator1', '2024-06-26 15:51:08.930051', '', NULL, NULL, b'1', 1, 57, 55),
(2678, 'collaborator1', '2024-06-26 15:51:08.932796', '', NULL, NULL, b'1', 2, 57, 55),
(2679, 'collaborator1', '2024-06-26 15:51:08.934710', '', NULL, NULL, b'1', 3, 57, 55),
(2680, 'collaborator1', '2024-06-26 15:51:08.937710', '', NULL, NULL, b'1', 4, 57, 55),
(2681, 'collaborator1', '2024-06-26 15:51:08.940732', '', NULL, NULL, b'1', 5, 57, 55),
(2682, 'collaborator1', '2024-06-26 15:51:08.942707', '', NULL, NULL, b'1', 6, 57, 55),
(2683, 'collaborator1', '2024-06-26 15:51:08.946037', '', NULL, NULL, b'1', 1, 58, 55),
(2684, 'collaborator1', '2024-06-26 15:51:08.948863', '', NULL, NULL, b'1', 2, 58, 55),
(2685, 'collaborator1', '2024-06-26 15:51:08.951712', '', NULL, NULL, b'1', 3, 58, 55),
(2686, 'collaborator1', '2024-06-26 15:51:08.954713', '', NULL, NULL, b'1', 4, 58, 55),
(2687, 'collaborator1', '2024-06-26 15:51:08.957057', '', NULL, NULL, b'1', 5, 58, 55),
(2688, 'collaborator1', '2024-06-26 15:51:08.959829', '', NULL, NULL, b'1', 6, 58, 55),
(2689, 'collaborator1', '2024-06-26 15:51:08.962708', '', NULL, NULL, b'1', 1, 59, 55),
(2690, 'collaborator1', '2024-06-26 15:51:08.965041', '', NULL, NULL, b'1', 2, 59, 55),
(2691, 'collaborator1', '2024-06-26 15:51:08.967713', '', NULL, NULL, b'1', 3, 59, 55),
(2692, 'collaborator1', '2024-06-26 15:51:08.970900', '', NULL, NULL, b'1', 4, 59, 55),
(2693, 'collaborator1', '2024-06-26 15:51:08.973715', '', NULL, NULL, b'1', 5, 59, 55),
(2694, 'collaborator1', '2024-06-26 15:51:08.976022', '', NULL, NULL, b'1', 6, 59, 55),
(2695, 'collaborator1', '2024-06-26 15:51:08.979011', '', NULL, NULL, b'1', 1, 60, 55),
(2696, 'collaborator1', '2024-06-26 15:51:08.981809', '', NULL, NULL, b'1', 2, 60, 55),
(2697, 'collaborator1', '2024-06-26 15:51:08.984044', '', NULL, NULL, b'1', 3, 60, 55),
(2698, 'collaborator1', '2024-06-26 15:51:08.987012', '', NULL, NULL, b'1', 4, 60, 55),
(2699, 'collaborator1', '2024-06-26 15:51:08.989709', '', NULL, NULL, b'1', 5, 60, 55),
(2700, 'collaborator1', '2024-06-26 15:51:08.991707', '', NULL, NULL, b'1', 6, 60, 55),
(2701, 'collaborator1', '2024-06-26 15:51:08.993713', '', NULL, NULL, b'1', 1, 61, 55),
(2702, 'collaborator1', '2024-06-26 15:51:08.995979', '', NULL, NULL, b'1', 2, 61, 55),
(2703, 'collaborator1', '2024-06-26 15:51:08.998707', '', NULL, NULL, b'1', 3, 61, 55),
(2704, 'collaborator1', '2024-06-26 15:51:09.000852', '', NULL, NULL, b'1', 4, 61, 55),
(2705, 'collaborator1', '2024-06-26 15:51:09.002710', '', NULL, NULL, b'1', 5, 61, 55),
(2706, 'collaborator1', '2024-06-26 15:51:09.005824', '', NULL, NULL, b'1', 6, 61, 55),
(2707, 'collaborator1', '2024-06-26 15:51:09.008714', '', NULL, NULL, b'1', 1, 62, 55),
(2708, 'collaborator1', '2024-06-26 15:51:09.010714', '', NULL, NULL, b'1', 2, 62, 55),
(2709, 'collaborator1', '2024-06-26 15:51:09.014064', '', NULL, NULL, b'1', 3, 62, 55),
(2710, 'collaborator1', '2024-06-26 15:51:09.016924', '', NULL, NULL, b'1', 4, 62, 55),
(2711, 'collaborator1', '2024-06-26 15:51:09.019725', '', NULL, NULL, b'1', 5, 62, 55),
(2712, 'collaborator1', '2024-06-26 15:51:09.022037', '', NULL, NULL, b'1', 6, 62, 55),
(2713, 'collaborator1', '2024-06-26 15:51:09.024795', '', NULL, NULL, b'1', 1, 63, 55),
(2714, 'collaborator1', '2024-06-26 15:51:09.027711', '', NULL, NULL, b'1', 2, 63, 55),
(2715, 'collaborator1', '2024-06-26 15:51:09.030062', '', NULL, NULL, b'1', 3, 63, 55),
(2716, 'collaborator1', '2024-06-26 15:51:09.032803', '', NULL, NULL, b'1', 4, 63, 55),
(2717, 'collaborator1', '2024-06-26 15:51:09.034708', '', NULL, NULL, b'1', 5, 63, 55),
(2718, 'collaborator1', '2024-06-26 15:51:09.037715', '', NULL, NULL, b'1', 6, 63, 55),
(2719, 'collaborator1', '2024-06-26 15:51:09.040007', '', NULL, NULL, b'1', 1, 64, 55),
(2720, 'collaborator1', '2024-06-26 15:51:09.042806', '', NULL, NULL, b'1', 2, 64, 55),
(2721, 'collaborator1', '2024-06-26 15:51:09.046039', '', NULL, NULL, b'1', 3, 64, 55),
(2722, 'collaborator1', '2024-06-26 15:51:09.048897', '', NULL, NULL, b'1', 4, 64, 55),
(2723, 'collaborator1', '2024-06-26 15:51:09.051712', '', NULL, NULL, b'1', 5, 64, 55),
(2724, 'collaborator1', '2024-06-26 15:51:09.054753', '', NULL, NULL, b'1', 6, 64, 55),
(2725, 'collaborator1', '2024-06-26 15:51:09.057013', '', NULL, NULL, b'1', 1, 65, 55),
(2726, 'collaborator1', '2024-06-26 15:51:09.059769', '', NULL, NULL, b'1', 2, 65, 55),
(2727, 'collaborator1', '2024-06-26 15:51:09.062709', '', NULL, NULL, b'1', 3, 65, 55),
(2728, 'collaborator1', '2024-06-26 15:51:09.065028', '', NULL, NULL, b'1', 4, 65, 55),
(2729, 'collaborator1', '2024-06-26 15:51:09.067715', '', NULL, NULL, b'1', 5, 65, 55),
(2730, 'collaborator1', '2024-06-26 15:51:09.070710', '', NULL, NULL, b'1', 6, 65, 55),
(2731, 'collaborator1', '2024-06-26 15:51:09.072761', '', NULL, NULL, b'1', 1, 66, 55),
(2732, 'collaborator1', '2024-06-26 15:51:09.075760', '', NULL, NULL, b'1', 2, 66, 55),
(2733, 'collaborator1', '2024-06-26 15:51:09.077718', '', NULL, NULL, b'1', 3, 66, 55),
(2734, 'collaborator1', '2024-06-26 15:51:09.080975', '', NULL, NULL, b'1', 4, 66, 55),
(2735, 'collaborator1', '2024-06-26 15:51:09.083805', '', NULL, NULL, b'1', 5, 66, 55),
(2736, 'collaborator1', '2024-06-26 15:51:09.086728', '', NULL, NULL, b'1', 6, 66, 55),
(2737, 'collaborator1', '2024-06-26 15:51:09.089713', '', NULL, NULL, b'1', 1, 67, 55),
(2738, 'collaborator1', '2024-06-26 15:51:09.091709', '', NULL, NULL, b'1', 2, 67, 55),
(2739, 'collaborator1', '2024-06-26 15:51:09.093708', '', NULL, NULL, b'1', 3, 67, 55),
(2740, 'collaborator1', '2024-06-26 15:51:09.096834', '', NULL, NULL, b'1', 4, 67, 55),
(2741, 'collaborator1', '2024-06-26 15:51:09.098881', '', NULL, NULL, b'1', 5, 67, 55),
(2742, 'collaborator1', '2024-06-26 15:51:09.101709', '', NULL, NULL, b'1', 6, 67, 55),
(2743, 'collaborator1', '2024-06-26 15:51:09.104710', '', NULL, NULL, b'1', 1, 68, 55),
(2744, 'collaborator1', '2024-06-26 15:51:09.106747', '', NULL, NULL, b'1', 2, 68, 55),
(2745, 'collaborator1', '2024-06-26 15:51:09.109016', '', NULL, NULL, b'1', 3, 68, 55),
(2746, 'collaborator1', '2024-06-26 15:51:09.111925', '', NULL, NULL, b'1', 4, 68, 55),
(2747, 'collaborator1', '2024-06-26 15:51:09.114026', '', NULL, NULL, b'1', 5, 68, 55),
(2748, 'collaborator1', '2024-06-26 15:51:09.117066', '', NULL, NULL, b'1', 6, 68, 55),
(2749, 'collaborator1', '2024-06-26 15:51:09.119722', '', NULL, NULL, b'1', 1, 69, 55),
(2750, 'collaborator1', '2024-06-26 15:51:09.121708', '', NULL, NULL, b'1', 2, 69, 55),
(2751, 'collaborator1', '2024-06-26 15:51:09.124709', '', NULL, NULL, b'1', 3, 69, 55),
(2752, 'collaborator1', '2024-06-26 15:51:09.126709', '', NULL, NULL, b'1', 4, 69, 55),
(2753, 'collaborator1', '2024-06-26 15:51:09.130056', '', NULL, NULL, b'1', 5, 69, 55),
(2754, 'collaborator1', '2024-06-26 15:51:09.132791', '', NULL, NULL, b'1', 6, 69, 55),
(2755, 'collaborator1', '2024-06-26 15:51:09.135724', '', NULL, NULL, b'1', 1, 70, 55),
(2756, 'collaborator1', '2024-06-26 15:51:09.138715', '', NULL, NULL, b'1', 2, 70, 55),
(2757, 'collaborator1', '2024-06-26 15:51:09.141052', '', NULL, NULL, b'1', 3, 70, 55),
(2758, 'collaborator1', '2024-06-26 15:51:09.143709', '', NULL, NULL, b'1', 4, 70, 55),
(2759, 'collaborator1', '2024-06-26 15:51:09.146917', '', NULL, NULL, b'1', 5, 70, 55),
(2760, 'collaborator1', '2024-06-26 15:51:09.149720', '', NULL, NULL, b'1', 6, 70, 55),
(2761, 'collaborator1', '2024-06-26 15:51:09.151709', '', NULL, NULL, b'1', 1, 71, 55),
(2762, 'collaborator1', '2024-06-26 15:51:09.154708', '', NULL, NULL, b'1', 2, 71, 55),
(2763, 'collaborator1', '2024-06-26 15:51:09.156707', '', NULL, NULL, b'1', 3, 71, 55),
(2764, 'collaborator1', '2024-06-26 15:51:09.169711', '', NULL, NULL, b'1', 4, 71, 55),
(2765, 'collaborator1', '2024-06-26 15:51:09.172018', '', NULL, NULL, b'1', 5, 71, 55),
(2766, 'collaborator1', '2024-06-26 15:51:09.174891', '', NULL, NULL, b'1', 6, 71, 55),
(2767, 'collaborator1', '2024-06-26 15:51:09.177714', '', NULL, NULL, b'1', 1, 72, 55),
(2768, 'collaborator1', '2024-06-26 15:51:09.180033', '', NULL, NULL, b'1', 2, 72, 55),
(2769, 'collaborator1', '2024-06-26 15:51:09.182788', '', NULL, NULL, b'1', 3, 72, 55),
(2770, 'collaborator1', '2024-06-26 15:51:09.185718', '', NULL, NULL, b'1', 4, 72, 55),
(2771, 'collaborator1', '2024-06-26 15:51:09.188713', '', NULL, NULL, b'1', 5, 72, 55),
(2772, 'collaborator1', '2024-06-26 15:51:09.191041', '', NULL, NULL, b'1', 6, 72, 55),
(2773, 'collaborator1', '2024-06-26 15:51:09.192709', '', NULL, NULL, b'1', 1, 73, 55),
(2774, 'collaborator1', '2024-06-26 15:51:09.196710', '', NULL, NULL, b'1', 2, 73, 55),
(2775, 'collaborator1', '2024-06-26 15:51:09.199042', '', NULL, NULL, b'1', 3, 73, 55),
(2776, 'collaborator1', '2024-06-26 15:51:09.201715', '', NULL, NULL, b'1', 4, 73, 55),
(2777, 'collaborator1', '2024-06-26 15:51:09.204945', '', NULL, NULL, b'1', 5, 73, 55),
(2778, 'collaborator1', '2024-06-26 15:51:09.207709', '', NULL, NULL, b'1', 6, 73, 55),
(2779, 'collaborator1', '2024-06-26 15:51:09.209755', '', NULL, NULL, b'1', 1, 74, 55),
(2780, 'collaborator1', '2024-06-26 15:51:09.212709', '', NULL, NULL, b'1', 2, 74, 55),
(2781, 'collaborator1', '2024-06-26 15:51:09.215950', '', NULL, NULL, b'1', 3, 74, 55),
(2782, 'collaborator1', '2024-06-26 15:51:09.217770', '', NULL, NULL, b'1', 4, 74, 55),
(2783, 'collaborator1', '2024-06-26 15:51:09.221014', '', NULL, NULL, b'1', 5, 74, 55),
(2784, 'collaborator1', '2024-06-26 15:51:09.223975', '', NULL, NULL, b'1', 6, 74, 55),
(2785, 'collaborator1', '2024-06-26 15:51:09.225708', '', NULL, NULL, b'1', 1, 75, 55),
(2786, 'collaborator1', '2024-06-26 15:51:09.228709', '', NULL, NULL, b'1', 2, 75, 55),
(2787, 'collaborator1', '2024-06-26 15:51:09.231024', '', NULL, NULL, b'1', 3, 75, 55),
(2788, 'collaborator1', '2024-06-26 15:51:09.233753', '', NULL, NULL, b'1', 4, 75, 55),
(2789, 'collaborator1', '2024-06-26 15:51:09.236720', '', NULL, NULL, b'1', 5, 75, 55),
(2790, 'collaborator1', '2024-06-26 15:51:09.239030', '', NULL, NULL, b'1', 6, 75, 55),
(2791, 'collaborator1', '2024-06-26 15:51:09.241781', '', NULL, NULL, b'1', 1, 76, 55),
(2792, 'collaborator1', '2024-06-26 15:51:09.243748', '', NULL, NULL, b'1', 2, 76, 55),
(2793, 'collaborator1', '2024-06-26 15:51:09.247053', '', NULL, NULL, b'1', 3, 76, 55),
(2794, 'collaborator1', '2024-06-26 15:51:09.249914', '', NULL, NULL, b'1', 4, 76, 55),
(2795, 'collaborator1', '2024-06-26 15:51:09.252715', '', NULL, NULL, b'1', 5, 76, 55),
(2796, 'collaborator1', '2024-06-26 15:51:09.255019', '', NULL, NULL, b'1', 6, 76, 55),
(2797, 'collaborator1', '2024-06-26 15:51:09.257713', '', NULL, NULL, b'1', 1, 77, 55),
(2798, 'collaborator1', '2024-06-26 15:51:09.259708', '', NULL, NULL, b'1', 2, 77, 55),
(2799, 'collaborator1', '2024-06-26 15:51:09.262753', '', NULL, NULL, b'1', 3, 77, 55),
(2800, 'collaborator1', '2024-06-26 15:51:09.266096', '', NULL, NULL, b'1', 4, 77, 55),
(2801, 'collaborator1', '2024-06-26 15:51:09.268708', '', NULL, NULL, b'1', 5, 77, 55),
(2802, 'collaborator1', '2024-06-26 15:51:09.271800', '', NULL, NULL, b'1', 6, 77, 55),
(2803, 'collaborator1', '2024-06-26 15:51:09.274714', '', NULL, NULL, b'1', 1, 78, 55),
(2804, 'collaborator1', '2024-06-26 15:51:09.276793', '', NULL, NULL, b'1', 2, 78, 55),
(2805, 'collaborator1', '2024-06-26 15:51:09.280119', '', NULL, NULL, b'1', 3, 78, 55),
(2806, 'collaborator1', '2024-06-26 15:51:09.282835', '', NULL, NULL, b'1', 4, 78, 55),
(2807, 'collaborator1', '2024-06-26 15:51:09.285792', '', NULL, NULL, b'1', 5, 78, 55),
(2808, 'collaborator1', '2024-06-26 15:51:09.288790', '', NULL, NULL, b'1', 6, 78, 55),
(2809, 'collaborator1', '2024-06-26 15:51:16.791486', '', NULL, NULL, b'1', 1, 1, 56),
(2810, 'collaborator1', '2024-06-26 15:51:16.955468', '', NULL, NULL, b'1', 2, 1, 56),
(2811, 'collaborator1', '2024-06-26 15:51:16.957471', '', NULL, NULL, b'1', 3, 1, 56),
(2812, 'collaborator1', '2024-06-26 15:51:16.960465', '', NULL, NULL, b'1', 4, 1, 56),
(2813, 'collaborator1', '2024-06-26 15:51:16.962465', '', NULL, NULL, b'1', 5, 1, 56),
(2814, 'collaborator1', '2024-06-26 15:51:16.964482', '', NULL, NULL, b'1', 6, 1, 56),
(2815, 'collaborator1', '2024-06-26 15:51:16.967466', '', NULL, NULL, b'1', 1, 2, 56),
(2816, 'collaborator1', '2024-06-26 15:51:16.969488', '', NULL, NULL, b'1', 2, 2, 56),
(2817, 'collaborator1', '2024-06-26 15:51:16.974485', '', NULL, NULL, b'1', 3, 2, 56),
(2818, 'collaborator1', '2024-06-26 15:51:16.979474', '', NULL, NULL, b'1', 4, 2, 56),
(2819, 'collaborator1', '2024-06-26 15:51:16.982474', '', NULL, NULL, b'1', 5, 2, 56),
(2820, 'collaborator1', '2024-06-26 15:51:16.985471', '', NULL, NULL, b'1', 6, 2, 56),
(2821, 'collaborator1', '2024-06-26 15:51:16.988471', '', NULL, NULL, b'1', 1, 3, 56),
(2822, 'collaborator1', '2024-06-26 15:51:16.991470', '', NULL, NULL, b'1', 2, 3, 56),
(2823, 'collaborator1', '2024-06-26 15:51:16.993469', '', NULL, NULL, b'1', 3, 3, 56),
(2824, 'collaborator1', '2024-06-26 15:51:16.995470', '', NULL, NULL, b'1', 4, 3, 56),
(2825, 'collaborator1', '2024-06-26 15:51:16.997468', '', NULL, NULL, b'1', 5, 3, 56),
(2826, 'collaborator1', '2024-06-26 15:51:17.000474', '', NULL, NULL, b'1', 6, 3, 56),
(2827, 'collaborator1', '2024-06-26 15:51:17.002496', '', NULL, NULL, b'1', 1, 4, 56),
(2828, 'collaborator1', '2024-06-26 15:51:17.004495', '', NULL, NULL, b'1', 2, 4, 56),
(2829, 'collaborator1', '2024-06-26 15:51:17.006468', '', NULL, NULL, b'1', 3, 4, 56),
(2830, 'collaborator1', '2024-06-26 15:51:17.009668', '', NULL, NULL, b'1', 4, 4, 56),
(2831, 'collaborator1', '2024-06-26 15:51:17.012474', '', NULL, NULL, b'1', 5, 4, 56),
(2832, 'collaborator1', '2024-06-26 15:51:17.014469', '', NULL, NULL, b'1', 6, 4, 56),
(2833, 'collaborator1', '2024-06-26 15:51:17.017587', '', NULL, NULL, b'1', 1, 5, 56),
(2834, 'collaborator1', '2024-06-26 15:51:17.019756', '', NULL, NULL, b'1', 2, 5, 56),
(2835, 'collaborator1', '2024-06-26 15:51:17.022468', '', NULL, NULL, b'1', 3, 5, 56),
(2836, 'collaborator1', '2024-06-26 15:51:17.025643', '', NULL, NULL, b'1', 4, 5, 56),
(2837, 'collaborator1', '2024-06-26 15:51:17.027510', '', NULL, NULL, b'1', 5, 5, 56),
(2838, 'collaborator1', '2024-06-26 15:51:17.030471', '', NULL, NULL, b'1', 6, 5, 56),
(2839, 'collaborator1', '2024-06-26 15:51:17.033815', '', NULL, NULL, b'1', 1, 6, 56),
(2840, 'collaborator1', '2024-06-26 15:51:17.036589', '', NULL, NULL, b'1', 2, 6, 56),
(2841, 'collaborator1', '2024-06-26 15:51:17.038469', '', NULL, NULL, b'1', 3, 6, 56),
(2842, 'collaborator1', '2024-06-26 15:51:17.041774', '', NULL, NULL, b'1', 4, 6, 56),
(2843, 'collaborator1', '2024-06-26 15:51:17.044633', '', NULL, NULL, b'1', 5, 6, 56),
(2844, 'collaborator1', '2024-06-26 15:51:17.047472', '', NULL, NULL, b'1', 6, 6, 56),
(2845, 'collaborator1', '2024-06-26 15:51:17.050472', '', NULL, NULL, b'1', 1, 7, 56),
(2846, 'collaborator1', '2024-06-26 15:51:17.052475', '', NULL, NULL, b'1', 2, 7, 56),
(2847, 'collaborator1', '2024-06-26 15:51:17.054468', '', NULL, NULL, b'1', 3, 7, 56),
(2848, 'collaborator1', '2024-06-26 15:51:17.057469', '', NULL, NULL, b'1', 4, 7, 56),
(2849, 'collaborator1', '2024-06-26 15:51:17.059742', '', NULL, NULL, b'1', 5, 7, 56),
(2850, 'collaborator1', '2024-06-26 15:51:17.062653', '', NULL, NULL, b'1', 6, 7, 56),
(2851, 'collaborator1', '2024-06-26 15:51:17.065507', '', NULL, NULL, b'1', 1, 8, 56),
(2852, 'collaborator1', '2024-06-26 15:51:17.067584', '', NULL, NULL, b'1', 2, 8, 56),
(2853, 'collaborator1', '2024-06-26 15:51:17.070588', '', NULL, NULL, b'1', 3, 8, 56),
(2854, 'collaborator1', '2024-06-26 15:51:17.073478', '', NULL, NULL, b'1', 4, 8, 56),
(2855, 'collaborator1', '2024-06-26 15:51:17.075777', '', NULL, NULL, b'1', 5, 8, 56),
(2856, 'collaborator1', '2024-06-26 15:51:17.078568', '', NULL, NULL, b'1', 6, 8, 56),
(2857, 'collaborator1', '2024-06-26 15:51:17.081483', '', NULL, NULL, b'1', 1, 9, 56),
(2858, 'collaborator1', '2024-06-26 15:51:17.083746', '', NULL, NULL, b'1', 2, 9, 56),
(2859, 'collaborator1', '2024-06-26 15:51:17.086475', '', NULL, NULL, b'1', 3, 9, 56),
(2860, 'collaborator1', '2024-06-26 15:51:17.088467', '', NULL, NULL, b'1', 4, 9, 56),
(2861, 'collaborator1', '2024-06-26 15:51:17.091773', '', NULL, NULL, b'1', 5, 9, 56),
(2862, 'collaborator1', '2024-06-26 15:51:17.094631', '', NULL, NULL, b'1', 6, 9, 56),
(2863, 'collaborator1', '2024-06-26 15:51:17.097478', '', NULL, NULL, b'1', 1, 10, 56),
(2864, 'collaborator1', '2024-06-26 15:51:17.100537', '', NULL, NULL, b'1', 2, 10, 56),
(2865, 'collaborator1', '2024-06-26 15:51:17.102468', '', NULL, NULL, b'1', 3, 10, 56),
(2866, 'collaborator1', '2024-06-26 15:51:17.105468', '', NULL, NULL, b'1', 4, 10, 56),
(2867, 'collaborator1', '2024-06-26 15:51:17.107481', '', NULL, NULL, b'1', 5, 10, 56),
(2868, 'collaborator1', '2024-06-26 15:51:17.110467', '', NULL, NULL, b'1', 6, 10, 56),
(2869, 'collaborator1', '2024-06-26 15:51:17.112470', '', NULL, NULL, b'1', 1, 11, 56),
(2870, 'collaborator1', '2024-06-26 15:51:17.115478', '', NULL, NULL, b'1', 2, 11, 56),
(2871, 'collaborator1', '2024-06-26 15:51:17.118474', '', NULL, NULL, b'1', 3, 11, 56),
(2872, 'collaborator1', '2024-06-26 15:51:17.120468', '', NULL, NULL, b'1', 4, 11, 56),
(2873, 'collaborator1', '2024-06-26 15:51:17.123476', '', NULL, NULL, b'1', 5, 11, 56),
(2874, 'collaborator1', '2024-06-26 15:51:17.126470', '', NULL, NULL, b'1', 6, 11, 56),
(2875, 'collaborator1', '2024-06-26 15:51:17.128507', '', NULL, NULL, b'1', 1, 12, 56),
(2876, 'collaborator1', '2024-06-26 15:51:17.130469', '', NULL, NULL, b'1', 2, 12, 56),
(2877, 'collaborator1', '2024-06-26 15:51:17.133468', '', NULL, NULL, b'1', 3, 12, 56),
(2878, 'collaborator1', '2024-06-26 15:51:17.136624', '', NULL, NULL, b'1', 4, 12, 56),
(2879, 'collaborator1', '2024-06-26 15:51:17.139470', '', NULL, NULL, b'1', 5, 12, 56),
(2880, 'collaborator1', '2024-06-26 15:51:17.141781', '', NULL, NULL, b'1', 6, 12, 56),
(2881, 'collaborator1', '2024-06-26 15:51:17.144827', '', NULL, NULL, b'1', 1, 13, 56),
(2882, 'collaborator1', '2024-06-26 15:51:17.147468', '', NULL, NULL, b'1', 2, 13, 56),
(2883, 'collaborator1', '2024-06-26 15:51:17.150475', '', NULL, NULL, b'1', 3, 13, 56),
(2884, 'collaborator1', '2024-06-26 15:51:17.152469', '', NULL, NULL, b'1', 4, 13, 56),
(2885, 'collaborator1', '2024-06-26 15:51:17.154790', '', NULL, NULL, b'1', 5, 13, 56),
(2886, 'collaborator1', '2024-06-26 15:51:17.157470', '', NULL, NULL, b'1', 6, 13, 56),
(2887, 'collaborator1', '2024-06-26 15:51:17.160465', '', NULL, NULL, b'1', 1, 14, 56),
(2888, 'collaborator1', '2024-06-26 15:51:17.162466', '', NULL, NULL, b'1', 2, 14, 56),
(2889, 'collaborator1', '2024-06-26 15:51:17.165480', '', NULL, NULL, b'1', 3, 14, 56),
(2890, 'collaborator1', '2024-06-26 15:51:17.167468', '', NULL, NULL, b'1', 4, 14, 56),
(2891, 'collaborator1', '2024-06-26 15:51:17.170551', '', NULL, NULL, b'1', 5, 14, 56),
(2892, 'collaborator1', '2024-06-26 15:51:17.172468', '', NULL, NULL, b'1', 6, 14, 56),
(2893, 'collaborator1', '2024-06-26 15:51:17.175467', '', NULL, NULL, b'1', 1, 15, 56),
(2894, 'collaborator1', '2024-06-26 15:51:17.177467', '', NULL, NULL, b'1', 2, 15, 56),
(2895, 'collaborator1', '2024-06-26 15:51:17.180469', '', NULL, NULL, b'1', 3, 15, 56),
(2896, 'collaborator1', '2024-06-26 15:51:17.183614', '', NULL, NULL, b'1', 4, 15, 56),
(2897, 'collaborator1', '2024-06-26 15:51:17.185467', '', NULL, NULL, b'1', 5, 15, 56),
(2898, 'collaborator1', '2024-06-26 15:51:17.188467', '', NULL, NULL, b'1', 6, 15, 56),
(2899, 'collaborator1', '2024-06-26 15:51:17.191474', '', NULL, NULL, b'1', 1, 16, 56),
(2900, 'collaborator1', '2024-06-26 15:51:17.193761', '', NULL, NULL, b'1', 2, 16, 56),
(2901, 'collaborator1', '2024-06-26 15:51:17.196470', '', NULL, NULL, b'1', 3, 16, 56),
(2902, 'collaborator1', '2024-06-26 15:51:17.198475', '', NULL, NULL, b'1', 4, 16, 56),
(2903, 'collaborator1', '2024-06-26 15:51:17.201864', '', NULL, NULL, b'1', 5, 16, 56),
(2904, 'collaborator1', '2024-06-26 15:51:17.204652', '', NULL, NULL, b'1', 6, 16, 56),
(2905, 'collaborator1', '2024-06-26 15:51:17.207490', '', NULL, NULL, b'1', 1, 17, 56),
(2906, 'collaborator1', '2024-06-26 15:51:17.209768', '', NULL, NULL, b'1', 2, 17, 56),
(2907, 'collaborator1', '2024-06-26 15:51:17.212648', '', NULL, NULL, b'1', 3, 17, 56),
(2908, 'collaborator1', '2024-06-26 15:51:17.215624', '', NULL, NULL, b'1', 4, 17, 56),
(2909, 'collaborator1', '2024-06-26 15:51:17.217467', '', NULL, NULL, b'1', 5, 17, 56),
(2910, 'collaborator1', '2024-06-26 15:51:17.220552', '', NULL, NULL, b'1', 6, 17, 56),
(2911, 'collaborator1', '2024-06-26 15:51:17.223468', '', NULL, NULL, b'1', 1, 18, 56),
(2912, 'collaborator1', '2024-06-26 15:51:17.225797', '', NULL, NULL, b'1', 2, 18, 56),
(2913, 'collaborator1', '2024-06-26 15:51:17.228586', '', NULL, NULL, b'1', 3, 18, 56),
(2914, 'collaborator1', '2024-06-26 15:51:17.231471', '', NULL, NULL, b'1', 4, 18, 56),
(2915, 'collaborator1', '2024-06-26 15:51:17.233773', '', NULL, NULL, b'1', 5, 18, 56),
(2916, 'collaborator1', '2024-06-26 15:51:17.236669', '', NULL, NULL, b'1', 6, 18, 56),
(2917, 'collaborator1', '2024-06-26 15:51:17.239482', '', NULL, NULL, b'1', 1, 19, 56),
(2918, 'collaborator1', '2024-06-26 15:51:17.241776', '', NULL, NULL, b'1', 2, 19, 56),
(2919, 'collaborator1', '2024-06-26 15:51:17.244636', '', NULL, NULL, b'1', 3, 19, 56),
(2920, 'collaborator1', '2024-06-26 15:51:17.247467', '', NULL, NULL, b'1', 4, 19, 56),
(2921, 'collaborator1', '2024-06-26 15:51:17.250551', '', NULL, NULL, b'1', 5, 19, 56),
(2922, 'collaborator1', '2024-06-26 15:51:17.252739', '', NULL, NULL, b'1', 6, 19, 56),
(2923, 'collaborator1', '2024-06-26 15:51:17.255470', '', NULL, NULL, b'1', 1, 20, 56),
(2924, 'collaborator1', '2024-06-26 15:51:17.258776', '', NULL, NULL, b'1', 2, 20, 56),
(2925, 'collaborator1', '2024-06-26 15:51:17.261509', '', NULL, NULL, b'1', 3, 20, 56),
(2926, 'collaborator1', '2024-06-26 15:51:17.263468', '', NULL, NULL, b'1', 4, 20, 56),
(2927, 'collaborator1', '2024-06-26 15:51:17.266802', '', NULL, NULL, b'1', 5, 20, 56),
(2928, 'collaborator1', '2024-06-26 15:51:17.269638', '', NULL, NULL, b'1', 6, 20, 56),
(2929, 'collaborator1', '2024-06-26 15:51:17.271528', '', NULL, NULL, b'1', 1, 21, 56),
(2930, 'collaborator1', '2024-06-26 15:51:17.274468', '', NULL, NULL, b'1', 2, 21, 56),
(2931, 'collaborator1', '2024-06-26 15:51:17.276468', '', NULL, NULL, b'1', 3, 21, 56),
(2932, 'collaborator1', '2024-06-26 15:51:17.278472', '', NULL, NULL, b'1', 4, 21, 56),
(2933, 'collaborator1', '2024-06-26 15:51:17.281472', '', NULL, NULL, b'1', 5, 21, 56),
(2934, 'collaborator1', '2024-06-26 15:51:17.283466', '', NULL, NULL, b'1', 6, 21, 56),
(2935, 'collaborator1', '2024-06-26 15:51:17.285497', '', NULL, NULL, b'1', 1, 22, 56),
(2936, 'collaborator1', '2024-06-26 15:51:17.287487', '', NULL, NULL, b'1', 2, 22, 56),
(2937, 'collaborator1', '2024-06-26 15:51:17.289479', '', NULL, NULL, b'1', 3, 22, 56),
(2938, 'collaborator1', '2024-06-26 15:51:17.292604', '', NULL, NULL, b'1', 4, 22, 56),
(2939, 'collaborator1', '2024-06-26 15:51:17.295512', '', NULL, NULL, b'1', 5, 22, 56),
(2940, 'collaborator1', '2024-06-26 15:51:17.298533', '', NULL, NULL, b'1', 6, 22, 56),
(2941, 'collaborator1', '2024-06-26 15:51:17.300796', '', NULL, NULL, b'1', 1, 23, 56),
(2942, 'collaborator1', '2024-06-26 15:51:17.303542', '', NULL, NULL, b'1', 2, 23, 56),
(2943, 'collaborator1', '2024-06-26 15:51:17.305470', '', NULL, NULL, b'1', 3, 23, 56),
(2944, 'collaborator1', '2024-06-26 15:51:17.308796', '', NULL, NULL, b'1', 4, 23, 56),
(2945, 'collaborator1', '2024-06-26 15:51:17.311618', '', NULL, NULL, b'1', 5, 23, 56),
(2946, 'collaborator1', '2024-06-26 15:51:17.314485', '', NULL, NULL, b'1', 6, 23, 56),
(2947, 'collaborator1', '2024-06-26 15:51:17.316790', '', NULL, NULL, b'1', 1, 24, 56),
(2948, 'collaborator1', '2024-06-26 15:51:17.319794', '', NULL, NULL, b'1', 2, 24, 56),
(2949, 'collaborator1', '2024-06-26 15:51:17.322467', '', NULL, NULL, b'1', 3, 24, 56),
(2950, 'collaborator1', '2024-06-26 15:51:17.324769', '', NULL, NULL, b'1', 4, 24, 56),
(2951, 'collaborator1', '2024-06-26 15:51:17.327648', '', NULL, NULL, b'1', 5, 24, 56),
(2952, 'collaborator1', '2024-06-26 15:51:17.330477', '', NULL, NULL, b'1', 6, 24, 56),
(2953, 'collaborator1', '2024-06-26 15:51:17.332724', '', NULL, NULL, b'1', 1, 25, 56),
(2954, 'collaborator1', '2024-06-26 15:51:17.335642', '', NULL, NULL, b'1', 2, 25, 56),
(2955, 'collaborator1', '2024-06-26 15:51:17.337467', '', NULL, NULL, b'1', 3, 25, 56),
(2956, 'collaborator1', '2024-06-26 15:51:17.340469', '', NULL, NULL, b'1', 4, 25, 56),
(2957, 'collaborator1', '2024-06-26 15:51:17.342722', '', NULL, NULL, b'1', 5, 25, 56),
(2958, 'collaborator1', '2024-06-26 15:51:17.345467', '', NULL, NULL, b'1', 6, 25, 56),
(2959, 'collaborator1', '2024-06-26 15:51:17.347466', '', NULL, NULL, b'1', 1, 26, 56),
(2960, 'collaborator1', '2024-06-26 15:51:17.350566', '', NULL, NULL, b'1', 2, 26, 56),
(2961, 'collaborator1', '2024-06-26 15:51:17.353515', '', NULL, NULL, b'1', 3, 26, 56),
(2962, 'collaborator1', '2024-06-26 15:51:17.356471', '', NULL, NULL, b'1', 4, 26, 56),
(2963, 'collaborator1', '2024-06-26 15:51:17.358509', '', NULL, NULL, b'1', 5, 26, 56),
(2964, 'collaborator1', '2024-06-26 15:51:17.360470', '', NULL, NULL, b'1', 6, 26, 56),
(2965, 'collaborator1', '2024-06-26 15:51:17.363468', '', NULL, NULL, b'1', 1, 27, 56),
(2966, 'collaborator1', '2024-06-26 15:51:17.365474', '', NULL, NULL, b'1', 2, 27, 56),
(2967, 'collaborator1', '2024-06-26 15:51:17.367467', '', NULL, NULL, b'1', 3, 27, 56),
(2968, 'collaborator1', '2024-06-26 15:51:17.370509', '', NULL, NULL, b'1', 4, 27, 56),
(2969, 'collaborator1', '2024-06-26 15:51:17.372468', '', NULL, NULL, b'1', 5, 27, 56),
(2970, 'collaborator1', '2024-06-26 15:51:17.375812', '', NULL, NULL, b'1', 6, 27, 56),
(2971, 'collaborator1', '2024-06-26 15:51:17.378597', '', NULL, NULL, b'1', 1, 28, 56),
(2972, 'collaborator1', '2024-06-26 15:51:17.381472', '', NULL, NULL, b'1', 2, 28, 56),
(2973, 'collaborator1', '2024-06-26 15:51:17.383794', '', NULL, NULL, b'1', 3, 28, 56),
(2974, 'collaborator1', '2024-06-26 15:51:17.386599', '', NULL, NULL, b'1', 4, 28, 56),
(2975, 'collaborator1', '2024-06-26 15:51:17.389511', '', NULL, NULL, b'1', 5, 28, 56),
(2976, 'collaborator1', '2024-06-26 15:51:17.391783', '', NULL, NULL, b'1', 6, 28, 56),
(2977, 'collaborator1', '2024-06-26 15:51:17.394806', '', NULL, NULL, b'1', 1, 29, 56),
(2978, 'collaborator1', '2024-06-26 15:51:17.397471', '', NULL, NULL, b'1', 2, 29, 56),
(2979, 'collaborator1', '2024-06-26 15:51:17.400563', '', NULL, NULL, b'1', 3, 29, 56),
(2980, 'collaborator1', '2024-06-26 15:51:17.403470', '', NULL, NULL, b'1', 4, 29, 56),
(2981, 'collaborator1', '2024-06-26 15:51:17.405469', '', NULL, NULL, b'1', 5, 29, 56),
(2982, 'collaborator1', '2024-06-26 15:51:17.408780', '', NULL, NULL, b'1', 6, 29, 56),
(2983, 'collaborator1', '2024-06-26 15:51:17.411643', '', NULL, NULL, b'1', 1, 30, 56),
(2984, 'collaborator1', '2024-06-26 15:51:17.414472', '', NULL, NULL, b'1', 2, 30, 56),
(2985, 'collaborator1', '2024-06-26 15:51:17.416807', '', NULL, NULL, b'1', 3, 30, 56),
(2986, 'collaborator1', '2024-06-26 15:51:17.419637', '', NULL, NULL, b'1', 4, 30, 56),
(2987, 'collaborator1', '2024-06-26 15:51:17.421469', '', NULL, NULL, b'1', 5, 30, 56),
(2988, 'collaborator1', '2024-06-26 15:51:17.425773', '', NULL, NULL, b'1', 6, 30, 56),
(2989, 'collaborator1', '2024-06-26 15:51:17.428587', '', NULL, NULL, b'1', 1, 31, 56),
(2990, 'collaborator1', '2024-06-26 15:51:17.431472', '', NULL, NULL, b'1', 2, 31, 56),
(2991, 'collaborator1', '2024-06-26 15:51:17.433805', '', NULL, NULL, b'1', 3, 31, 56),
(2992, 'collaborator1', '2024-06-26 15:51:17.436599', '', NULL, NULL, b'1', 4, 31, 56),
(2993, 'collaborator1', '2024-06-26 15:51:17.439490', '', NULL, NULL, b'1', 5, 31, 56),
(2994, 'collaborator1', '2024-06-26 15:51:17.441779', '', NULL, NULL, b'1', 6, 31, 56),
(2995, 'collaborator1', '2024-06-26 15:51:17.444645', '', NULL, NULL, b'1', 1, 32, 56),
(2996, 'collaborator1', '2024-06-26 15:51:17.447468', '', NULL, NULL, b'1', 2, 32, 56),
(2997, 'collaborator1', '2024-06-26 15:51:17.450642', '', NULL, NULL, b'1', 3, 32, 56),
(2998, 'collaborator1', '2024-06-26 15:51:17.453473', '', NULL, NULL, b'1', 4, 32, 56),
(2999, 'collaborator1', '2024-06-26 15:51:17.455471', '', NULL, NULL, b'1', 5, 32, 56),
(3000, 'collaborator1', '2024-06-26 15:51:17.458785', '', NULL, NULL, b'1', 6, 32, 56),
(3001, 'collaborator1', '2024-06-26 15:51:17.461630', '', NULL, NULL, b'1', 1, 33, 56),
(3002, 'collaborator1', '2024-06-26 15:51:17.464533', '', NULL, NULL, b'1', 2, 33, 56),
(3003, 'collaborator1', '2024-06-26 15:51:17.467470', '', NULL, NULL, b'1', 3, 33, 56),
(3004, 'collaborator1', '2024-06-26 15:51:17.469816', '', NULL, NULL, b'1', 4, 33, 56),
(3005, 'collaborator1', '2024-06-26 15:51:17.472469', '', NULL, NULL, b'1', 5, 33, 56),
(3006, 'collaborator1', '2024-06-26 15:51:17.474771', '', NULL, NULL, b'1', 6, 33, 56),
(3007, 'collaborator1', '2024-06-26 15:51:17.477635', '', NULL, NULL, b'1', 1, 34, 56),
(3008, 'collaborator1', '2024-06-26 15:51:17.480471', '', NULL, NULL, b'1', 2, 34, 56),
(3009, 'collaborator1', '2024-06-26 15:51:17.483474', '', NULL, NULL, b'1', 3, 34, 56),
(3010, 'collaborator1', '2024-06-26 15:51:17.485767', '', NULL, NULL, b'1', 4, 34, 56),
(3011, 'collaborator1', '2024-06-26 15:51:17.488469', '', NULL, NULL, b'1', 5, 34, 56),
(3012, 'collaborator1', '2024-06-26 15:51:17.491513', '', NULL, NULL, b'1', 6, 34, 56),
(3013, 'collaborator1', '2024-06-26 15:51:17.494474', '', NULL, NULL, b'1', 1, 35, 56),
(3014, 'collaborator1', '2024-06-26 15:51:17.496591', '', NULL, NULL, b'1', 2, 35, 56),
(3015, 'collaborator1', '2024-06-26 15:51:17.499761', '', NULL, NULL, b'1', 3, 35, 56),
(3016, 'collaborator1', '2024-06-26 15:51:17.502728', '', NULL, NULL, b'1', 4, 35, 56),
(3017, 'collaborator1', '2024-06-26 15:51:17.505469', '', NULL, NULL, b'1', 5, 35, 56),
(3018, 'collaborator1', '2024-06-26 15:51:17.507486', '', NULL, NULL, b'1', 6, 35, 56),
(3019, 'collaborator1', '2024-06-26 15:51:17.510475', '', NULL, NULL, b'1', 1, 36, 56),
(3020, 'collaborator1', '2024-06-26 15:51:17.512761', '', NULL, NULL, b'1', 2, 36, 56),
(3021, 'collaborator1', '2024-06-26 15:51:17.515773', '', NULL, NULL, b'1', 3, 36, 56),
(3022, 'collaborator1', '2024-06-26 15:51:17.518579', '', NULL, NULL, b'1', 4, 36, 56),
(3023, 'collaborator1', '2024-06-26 15:51:17.521477', '', NULL, NULL, b'1', 5, 36, 56),
(3024, 'collaborator1', '2024-06-26 15:51:17.524470', '', NULL, NULL, b'1', 6, 36, 56),
(3025, 'collaborator1', '2024-06-26 15:51:17.526833', '', NULL, NULL, b'1', 1, 37, 56),
(3026, 'collaborator1', '2024-06-26 15:51:17.529615', '', NULL, NULL, b'1', 2, 37, 56),
(3027, 'collaborator1', '2024-06-26 15:51:17.532746', '', NULL, NULL, b'1', 3, 37, 56),
(3028, 'collaborator1', '2024-06-26 15:51:17.535778', '', NULL, NULL, b'1', 4, 37, 56),
(3029, 'collaborator1', '2024-06-26 15:51:17.538468', '', NULL, NULL, b'1', 5, 37, 56),
(3030, 'collaborator1', '2024-06-26 15:51:17.540779', '', NULL, NULL, b'1', 6, 37, 56),
(3031, 'collaborator1', '2024-06-26 15:51:17.543649', '', NULL, NULL, b'1', 1, 38, 56),
(3032, 'collaborator1', '2024-06-26 15:51:17.546489', '', NULL, NULL, b'1', 2, 38, 56),
(3033, 'collaborator1', '2024-06-26 15:51:17.549756', '', NULL, NULL, b'1', 3, 38, 56),
(3034, 'collaborator1', '2024-06-26 15:51:17.552567', '', NULL, NULL, b'1', 4, 38, 56),
(3035, 'collaborator1', '2024-06-26 15:51:17.555472', '', NULL, NULL, b'1', 5, 38, 56),
(3036, 'collaborator1', '2024-06-26 15:51:17.558470', '', NULL, NULL, b'1', 6, 38, 56),
(3037, 'collaborator1', '2024-06-26 15:51:17.560471', '', NULL, NULL, b'1', 1, 39, 56),
(3038, 'collaborator1', '2024-06-26 15:51:17.563471', '', NULL, NULL, b'1', 2, 39, 56),
(3039, 'collaborator1', '2024-06-26 15:51:17.566472', '', NULL, NULL, b'1', 3, 39, 56),
(3040, 'collaborator1', '2024-06-26 15:51:17.568468', '', NULL, NULL, b'1', 4, 39, 56),
(3041, 'collaborator1', '2024-06-26 15:51:17.570467', '', NULL, NULL, b'1', 5, 39, 56),
(3042, 'collaborator1', '2024-06-26 15:51:17.573469', '', NULL, NULL, b'1', 6, 39, 56),
(3043, 'collaborator1', '2024-06-26 15:51:17.575806', '', NULL, NULL, b'1', 1, 40, 56),
(3044, 'collaborator1', '2024-06-26 15:51:17.578593', '', NULL, NULL, b'1', 2, 40, 56),
(3045, 'collaborator1', '2024-06-26 15:51:17.581475', '', NULL, NULL, b'1', 3, 40, 56),
(3046, 'collaborator1', '2024-06-26 15:51:17.583525', '', NULL, NULL, b'1', 4, 40, 56),
(3047, 'collaborator1', '2024-06-26 15:51:17.585784', '', NULL, NULL, b'1', 5, 40, 56),
(3048, 'collaborator1', '2024-06-26 15:51:17.588470', '', NULL, NULL, b'1', 6, 40, 56),
(3049, 'collaborator1', '2024-06-26 15:51:17.591805', '', NULL, NULL, b'1', 1, 41, 56),
(3050, 'collaborator1', '2024-06-26 15:51:17.594466', '', NULL, NULL, b'1', 2, 41, 56),
(3051, 'collaborator1', '2024-06-26 15:51:17.596531', '', NULL, NULL, b'1', 3, 41, 56),
(3052, 'collaborator1', '2024-06-26 15:51:17.599774', '', NULL, NULL, b'1', 4, 41, 56),
(3053, 'collaborator1', '2024-06-26 15:51:17.602638', '', NULL, NULL, b'1', 5, 41, 56),
(3054, 'collaborator1', '2024-06-26 15:51:17.605473', '', NULL, NULL, b'1', 6, 41, 56),
(3055, 'collaborator1', '2024-06-26 15:51:17.608618', '', NULL, NULL, b'1', 1, 42, 56),
(3056, 'collaborator1', '2024-06-26 15:51:17.610769', '', NULL, NULL, b'1', 2, 42, 56),
(3057, 'collaborator1', '2024-06-26 15:51:17.613468', '', NULL, NULL, b'1', 3, 42, 56),
(3058, 'collaborator1', '2024-06-26 15:51:17.615768', '', NULL, NULL, b'1', 4, 42, 56),
(3059, 'collaborator1', '2024-06-26 15:51:17.618786', '', NULL, NULL, b'1', 5, 42, 56),
(3060, 'collaborator1', '2024-06-26 15:51:17.621471', '', NULL, NULL, b'1', 6, 42, 56),
(3061, 'collaborator1', '2024-06-26 15:51:17.624469', '', NULL, NULL, b'1', 1, 43, 56),
(3062, 'collaborator1', '2024-06-26 15:51:17.626466', '', NULL, NULL, b'1', 2, 43, 56),
(3063, 'collaborator1', '2024-06-26 15:51:17.628468', '', NULL, NULL, b'1', 3, 43, 56),
(3064, 'collaborator1', '2024-06-26 15:51:17.631471', '', NULL, NULL, b'1', 4, 43, 56),
(3065, 'collaborator1', '2024-06-26 15:51:17.633798', '', NULL, NULL, b'1', 5, 43, 56),
(3066, 'collaborator1', '2024-06-26 15:51:17.636612', '', NULL, NULL, b'1', 6, 43, 56),
(3067, 'collaborator1', '2024-06-26 15:51:17.639484', '', NULL, NULL, b'1', 1, 44, 56),
(3068, 'collaborator1', '2024-06-26 15:51:17.641769', '', NULL, NULL, b'1', 2, 44, 56),
(3069, 'collaborator1', '2024-06-26 15:51:17.644736', '', NULL, NULL, b'1', 3, 44, 56),
(3070, 'collaborator1', '2024-06-26 15:51:17.647476', '', NULL, NULL, b'1', 4, 44, 56),
(3071, 'collaborator1', '2024-06-26 15:51:17.649780', '', NULL, NULL, b'1', 5, 44, 56),
(3072, 'collaborator1', '2024-06-26 15:51:17.652541', '', NULL, NULL, b'1', 6, 44, 56),
(3073, 'collaborator1', '2024-06-26 15:51:17.654778', '', NULL, NULL, b'1', 1, 45, 56),
(3074, 'collaborator1', '2024-06-26 15:51:17.657467', '', NULL, NULL, b'1', 2, 45, 56),
(3075, 'collaborator1', '2024-06-26 15:51:17.659793', '', NULL, NULL, b'1', 3, 45, 56),
(3076, 'collaborator1', '2024-06-26 15:51:17.662623', '', NULL, NULL, b'1', 4, 45, 56),
(3077, 'collaborator1', '2024-06-26 15:51:17.665766', '', NULL, NULL, b'1', 5, 45, 56),
(3078, 'collaborator1', '2024-06-26 15:51:17.668781', '', NULL, NULL, b'1', 6, 45, 56),
(3079, 'collaborator1', '2024-06-26 15:51:17.671497', '', NULL, NULL, b'1', 1, 46, 56),
(3080, 'collaborator1', '2024-06-26 15:51:17.674808', '', NULL, NULL, b'1', 2, 46, 56),
(3081, 'collaborator1', '2024-06-26 15:51:17.677539', '', NULL, NULL, b'1', 3, 46, 56),
(3082, 'collaborator1', '2024-06-26 15:51:17.679787', '', NULL, NULL, b'1', 4, 46, 56),
(3083, 'collaborator1', '2024-06-26 15:51:17.682788', '', NULL, NULL, b'1', 5, 46, 56),
(3084, 'collaborator1', '2024-06-26 15:51:17.685566', '', NULL, NULL, b'1', 6, 46, 56),
(3085, 'collaborator1', '2024-06-26 15:51:17.687468', '', NULL, NULL, b'1', 1, 47, 56),
(3086, 'collaborator1', '2024-06-26 15:51:17.690799', '', NULL, NULL, b'1', 2, 47, 56),
(3087, 'collaborator1', '2024-06-26 15:51:17.693597', '', NULL, NULL, b'1', 3, 47, 56),
(3088, 'collaborator1', '2024-06-26 15:51:17.696476', '', NULL, NULL, b'1', 4, 47, 56),
(3089, 'collaborator1', '2024-06-26 15:51:17.699797', '', NULL, NULL, b'1', 5, 47, 56),
(3090, 'collaborator1', '2024-06-26 15:51:17.702588', '', NULL, NULL, b'1', 6, 47, 56),
(3091, 'collaborator1', '2024-06-26 15:51:17.705479', '', NULL, NULL, b'1', 1, 48, 56),
(3092, 'collaborator1', '2024-06-26 15:51:17.707589', '', NULL, NULL, b'1', 2, 48, 56),
(3093, 'collaborator1', '2024-06-26 15:51:17.710524', '', NULL, NULL, b'1', 3, 48, 56),
(3094, 'collaborator1', '2024-06-26 15:51:17.712751', '', NULL, NULL, b'1', 4, 48, 56),
(3095, 'collaborator1', '2024-06-26 15:51:17.715758', '', NULL, NULL, b'1', 5, 48, 56),
(3096, 'collaborator1', '2024-06-26 15:51:17.718588', '', NULL, NULL, b'1', 6, 48, 56),
(3097, 'collaborator1', '2024-06-26 15:51:17.721475', '', NULL, NULL, b'1', 1, 49, 56),
(3098, 'collaborator1', '2024-06-26 15:51:17.724529', '', NULL, NULL, b'1', 2, 49, 56),
(3099, 'collaborator1', '2024-06-26 15:51:17.726757', '', NULL, NULL, b'1', 3, 49, 56),
(3100, 'collaborator1', '2024-06-26 15:51:17.729800', '', NULL, NULL, b'1', 4, 49, 56),
(3101, 'collaborator1', '2024-06-26 15:51:17.732793', '', NULL, NULL, b'1', 5, 49, 56),
(3102, 'collaborator1', '2024-06-26 15:51:17.735615', '', NULL, NULL, b'1', 6, 49, 56),
(3103, 'collaborator1', '2024-06-26 15:51:17.737467', '', NULL, NULL, b'1', 1, 50, 56),
(3104, 'collaborator1', '2024-06-26 15:51:17.740814', '', NULL, NULL, b'1', 2, 50, 56),
(3105, 'collaborator1', '2024-06-26 15:51:17.743573', '', NULL, NULL, b'1', 3, 50, 56),
(3106, 'collaborator1', '2024-06-26 15:51:17.746468', '', NULL, NULL, b'1', 4, 50, 56),
(3107, 'collaborator1', '2024-06-26 15:51:17.749633', '', NULL, NULL, b'1', 5, 50, 56),
(3108, 'collaborator1', '2024-06-26 15:51:17.752478', '', NULL, NULL, b'1', 6, 50, 56),
(3109, 'collaborator1', '2024-06-26 15:51:17.754754', '', NULL, NULL, b'1', 1, 51, 56),
(3110, 'collaborator1', '2024-06-26 15:51:17.757468', '', NULL, NULL, b'1', 2, 51, 56),
(3111, 'collaborator1', '2024-06-26 15:51:17.759756', '', NULL, NULL, b'1', 3, 51, 56),
(3112, 'collaborator1', '2024-06-26 15:51:17.762467', '', NULL, NULL, b'1', 4, 51, 56),
(3113, 'collaborator1', '2024-06-26 15:51:17.764518', '', NULL, NULL, b'1', 5, 51, 56),
(3114, 'collaborator1', '2024-06-26 15:51:17.766468', '', NULL, NULL, b'1', 6, 51, 56),
(3115, 'collaborator1', '2024-06-26 15:51:17.769473', '', NULL, NULL, b'1', 1, 52, 56),
(3116, 'collaborator1', '2024-06-26 15:51:17.771489', '', NULL, NULL, b'1', 2, 52, 56),
(3117, 'collaborator1', '2024-06-26 15:51:17.774759', '', NULL, NULL, b'1', 3, 52, 56),
(3118, 'collaborator1', '2024-06-26 15:51:17.777566', '', NULL, NULL, b'1', 4, 52, 56),
(3119, 'collaborator1', '2024-06-26 15:51:17.780481', '', NULL, NULL, b'1', 5, 52, 56),
(3120, 'collaborator1', '2024-06-26 15:51:17.782710', '', NULL, NULL, b'1', 6, 52, 56),
(3121, 'collaborator1', '2024-06-26 15:51:17.785793', '', NULL, NULL, b'1', 1, 53, 56),
(3122, 'collaborator1', '2024-06-26 15:51:17.788469', '', NULL, NULL, b'1', 2, 53, 56),
(3123, 'collaborator1', '2024-06-26 15:51:17.791527', '', NULL, NULL, b'1', 3, 53, 56),
(3124, 'collaborator1', '2024-06-26 15:51:17.793787', '', NULL, NULL, b'1', 4, 53, 56),
(3125, 'collaborator1', '2024-06-26 15:51:17.796470', '', NULL, NULL, b'1', 5, 53, 56),
(3126, 'collaborator1', '2024-06-26 15:51:17.799766', '', NULL, NULL, b'1', 6, 53, 56),
(3127, 'collaborator1', '2024-06-26 15:51:17.802519', '', NULL, NULL, b'1', 1, 54, 56),
(3128, 'collaborator1', '2024-06-26 15:51:17.804467', '', NULL, NULL, b'1', 2, 54, 56),
(3129, 'collaborator1', '2024-06-26 15:51:17.808600', '', NULL, NULL, b'1', 3, 54, 56),
(3130, 'collaborator1', '2024-06-26 15:51:17.811475', '', NULL, NULL, b'1', 4, 54, 56),
(3131, 'collaborator1', '2024-06-26 15:51:17.814512', '', NULL, NULL, b'1', 5, 54, 56),
(3132, 'collaborator1', '2024-06-26 15:51:17.816765', '', NULL, NULL, b'1', 6, 54, 56),
(3133, 'collaborator1', '2024-06-26 15:51:17.819637', '', NULL, NULL, b'1', 1, 55, 56),
(3134, 'collaborator1', '2024-06-26 15:51:17.822478', '', NULL, NULL, b'1', 2, 55, 56),
(3135, 'collaborator1', '2024-06-26 15:51:17.824766', '', NULL, NULL, b'1', 3, 55, 56),
(3136, 'collaborator1', '2024-06-26 15:51:17.827640', '', NULL, NULL, b'1', 4, 55, 56),
(3137, 'collaborator1', '2024-06-26 15:51:17.830467', '', NULL, NULL, b'1', 5, 55, 56),
(3138, 'collaborator1', '2024-06-26 15:51:17.832711', '', NULL, NULL, b'1', 6, 55, 56),
(3139, 'collaborator1', '2024-06-26 15:51:17.835470', '', NULL, NULL, b'1', 1, 56, 56),
(3140, 'collaborator1', '2024-06-26 15:51:17.837468', '', NULL, NULL, b'1', 2, 56, 56),
(3141, 'collaborator1', '2024-06-26 15:51:17.839473', '', NULL, NULL, b'1', 3, 56, 56),
(3142, 'collaborator1', '2024-06-26 15:51:17.842505', '', NULL, NULL, b'1', 4, 56, 56),
(3143, 'collaborator1', '2024-06-26 15:51:17.844776', '', NULL, NULL, b'1', 5, 56, 56),
(3144, 'collaborator1', '2024-06-26 15:51:17.847491', '', NULL, NULL, b'1', 6, 56, 56),
(3145, 'collaborator1', '2024-06-26 15:51:17.850593', '', NULL, NULL, b'1', 1, 57, 56),
(3146, 'collaborator1', '2024-06-26 15:51:17.853547', '', NULL, NULL, b'1', 2, 57, 56),
(3147, 'collaborator1', '2024-06-26 15:51:17.856474', '', NULL, NULL, b'1', 3, 57, 56),
(3148, 'collaborator1', '2024-06-26 15:51:17.858789', '', NULL, NULL, b'1', 4, 57, 56),
(3149, 'collaborator1', '2024-06-26 15:51:17.861649', '', NULL, NULL, b'1', 5, 57, 56),
(3150, 'collaborator1', '2024-06-26 15:51:17.864474', '', NULL, NULL, b'1', 6, 57, 56),
(3151, 'collaborator1', '2024-06-26 15:51:17.866778', '', NULL, NULL, b'1', 1, 58, 56),
(3152, 'collaborator1', '2024-06-26 15:51:17.869793', '', NULL, NULL, b'1', 2, 58, 56),
(3153, 'collaborator1', '2024-06-26 15:51:17.872482', '', NULL, NULL, b'1', 3, 58, 56),
(3154, 'collaborator1', '2024-06-26 15:51:17.875809', '', NULL, NULL, b'1', 4, 58, 56),
(3155, 'collaborator1', '2024-06-26 15:51:17.878569', '', NULL, NULL, b'1', 5, 58, 56),
(3156, 'collaborator1', '2024-06-26 15:51:17.880511', '', NULL, NULL, b'1', 6, 58, 56),
(3157, 'collaborator1', '2024-06-26 15:51:17.883802', '', NULL, NULL, b'1', 1, 59, 56),
(3158, 'collaborator1', '2024-06-26 15:51:17.886597', '', NULL, NULL, b'1', 2, 59, 56),
(3159, 'collaborator1', '2024-06-26 15:51:17.889470', '', NULL, NULL, b'1', 3, 59, 56),
(3160, 'collaborator1', '2024-06-26 15:51:17.891785', '', NULL, NULL, b'1', 4, 59, 56),
(3161, 'collaborator1', '2024-06-26 15:51:17.894631', '', NULL, NULL, b'1', 5, 59, 56),
(3162, 'collaborator1', '2024-06-26 15:51:17.897508', '', NULL, NULL, b'1', 6, 59, 56),
(3163, 'collaborator1', '2024-06-26 15:51:17.899787', '', NULL, NULL, b'1', 1, 60, 56),
(3164, 'collaborator1', '2024-06-26 15:51:17.902773', '', NULL, NULL, b'1', 2, 60, 56),
(3165, 'collaborator1', '2024-06-26 15:51:17.905468', '', NULL, NULL, b'1', 3, 60, 56),
(3166, 'collaborator1', '2024-06-26 15:51:17.908470', '', NULL, NULL, b'1', 4, 60, 56),
(3167, 'collaborator1', '2024-06-26 15:51:17.910811', '', NULL, NULL, b'1', 5, 60, 56),
(3168, 'collaborator1', '2024-06-26 15:51:17.913468', '', NULL, NULL, b'1', 6, 60, 56),
(3169, 'collaborator1', '2024-06-26 15:51:17.916621', '', NULL, NULL, b'1', 1, 61, 56),
(3170, 'collaborator1', '2024-06-26 15:51:17.919573', '', NULL, NULL, b'1', 2, 61, 56),
(3171, 'collaborator1', '2024-06-26 15:51:17.921468', '', NULL, NULL, b'1', 3, 61, 56),
(3172, 'collaborator1', '2024-06-26 15:51:17.924796', '', NULL, NULL, b'1', 4, 61, 56),
(3173, 'collaborator1', '2024-06-26 15:51:17.927469', '', NULL, NULL, b'1', 5, 61, 56),
(3174, 'collaborator1', '2024-06-26 15:51:17.929662', '', NULL, NULL, b'1', 6, 61, 56),
(3175, 'collaborator1', '2024-06-26 15:51:17.932705', '', NULL, NULL, b'1', 1, 62, 56),
(3176, 'collaborator1', '2024-06-26 15:51:17.935542', '', NULL, NULL, b'1', 2, 62, 56),
(3177, 'collaborator1', '2024-06-26 15:51:17.937467', '', NULL, NULL, b'1', 3, 62, 56),
(3178, 'collaborator1', '2024-06-26 15:51:17.940764', '', NULL, NULL, b'1', 4, 62, 56),
(3179, 'collaborator1', '2024-06-26 15:51:17.943680', '', NULL, NULL, b'1', 5, 62, 56),
(3180, 'collaborator1', '2024-06-26 15:51:17.946469', '', NULL, NULL, b'1', 6, 62, 56),
(3181, 'collaborator1', '2024-06-26 15:51:17.948648', '', NULL, NULL, b'1', 1, 63, 56),
(3182, 'collaborator1', '2024-06-26 15:51:17.951469', '', NULL, NULL, b'1', 2, 63, 56),
(3183, 'collaborator1', '2024-06-26 15:51:17.953803', '', NULL, NULL, b'1', 3, 63, 56),
(3184, 'collaborator1', '2024-06-26 15:51:17.956666', '', NULL, NULL, b'1', 4, 63, 56),
(3185, 'collaborator1', '2024-06-26 15:51:17.958784', '', NULL, NULL, b'1', 5, 63, 56),
(3186, 'collaborator1', '2024-06-26 15:51:17.961469', '', NULL, NULL, b'1', 6, 63, 56),
(3187, 'collaborator1', '2024-06-26 15:51:17.963472', '', NULL, NULL, b'1', 1, 64, 56),
(3188, 'collaborator1', '2024-06-26 15:51:17.966507', '', NULL, NULL, b'1', 2, 64, 56),
(3189, 'collaborator1', '2024-06-26 15:51:17.968468', '', NULL, NULL, b'1', 3, 64, 56),
(3190, 'collaborator1', '2024-06-26 15:51:17.971473', '', NULL, NULL, b'1', 4, 64, 56),
(3191, 'collaborator1', '2024-06-26 15:51:17.974473', '', NULL, NULL, b'1', 5, 64, 56),
(3192, 'collaborator1', '2024-06-26 15:51:17.976507', '', NULL, NULL, b'1', 6, 64, 56),
(3193, 'collaborator1', '2024-06-26 15:51:17.978514', '', NULL, NULL, b'1', 1, 65, 56),
(3194, 'collaborator1', '2024-06-26 15:51:17.980468', '', NULL, NULL, b'1', 2, 65, 56),
(3195, 'collaborator1', '2024-06-26 15:51:17.983508', '', NULL, NULL, b'1', 3, 65, 56),
(3196, 'collaborator1', '2024-06-26 15:51:17.985507', '', NULL, NULL, b'1', 4, 65, 56),
(3197, 'collaborator1', '2024-06-26 15:51:17.987466', '', NULL, NULL, b'1', 5, 65, 56),
(3198, 'collaborator1', '2024-06-26 15:51:17.990471', '', NULL, NULL, b'1', 6, 65, 56),
(3199, 'collaborator1', '2024-06-26 15:51:17.992471', '', NULL, NULL, b'1', 1, 66, 56),
(3200, 'collaborator1', '2024-06-26 15:51:17.995471', '', NULL, NULL, b'1', 2, 66, 56),
(3201, 'collaborator1', '2024-06-26 15:51:18.008467', '', NULL, NULL, b'1', 3, 66, 56),
(3202, 'collaborator1', '2024-06-26 15:51:18.010470', '', NULL, NULL, b'1', 4, 66, 56),
(3203, 'collaborator1', '2024-06-26 15:51:18.012471', '', NULL, NULL, b'1', 5, 66, 56),
(3204, 'collaborator1', '2024-06-26 15:51:18.015470', '', NULL, NULL, b'1', 6, 66, 56);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(3205, 'collaborator1', '2024-06-26 15:51:18.017467', '', NULL, NULL, b'1', 1, 67, 56),
(3206, 'collaborator1', '2024-06-26 15:51:18.019468', '', NULL, NULL, b'1', 2, 67, 56),
(3207, 'collaborator1', '2024-06-26 15:51:18.021467', '', NULL, NULL, b'1', 3, 67, 56),
(3208, 'collaborator1', '2024-06-26 15:51:18.024504', '', NULL, NULL, b'1', 4, 67, 56),
(3209, 'collaborator1', '2024-06-26 15:51:18.026470', '', NULL, NULL, b'1', 5, 67, 56),
(3210, 'collaborator1', '2024-06-26 15:51:18.028508', '', NULL, NULL, b'1', 6, 67, 56),
(3211, 'collaborator1', '2024-06-26 15:51:18.031483', '', NULL, NULL, b'1', 1, 68, 56),
(3212, 'collaborator1', '2024-06-26 15:51:18.033505', '', NULL, NULL, b'1', 2, 68, 56),
(3213, 'collaborator1', '2024-06-26 15:51:18.035506', '', NULL, NULL, b'1', 3, 68, 56),
(3214, 'collaborator1', '2024-06-26 15:51:18.037469', '', NULL, NULL, b'1', 4, 68, 56),
(3215, 'collaborator1', '2024-06-26 15:51:18.040467', '', NULL, NULL, b'1', 5, 68, 56),
(3216, 'collaborator1', '2024-06-26 15:51:18.042466', '', NULL, NULL, b'1', 6, 68, 56),
(3217, 'collaborator1', '2024-06-26 15:51:18.045466', '', NULL, NULL, b'1', 1, 69, 56),
(3218, 'collaborator1', '2024-06-26 15:51:18.047490', '', NULL, NULL, b'1', 2, 69, 56),
(3219, 'collaborator1', '2024-06-26 15:51:18.050469', '', NULL, NULL, b'1', 3, 69, 56),
(3220, 'collaborator1', '2024-06-26 15:51:18.052472', '', NULL, NULL, b'1', 4, 69, 56),
(3221, 'collaborator1', '2024-06-26 15:51:18.054469', '', NULL, NULL, b'1', 5, 69, 56),
(3222, 'collaborator1', '2024-06-26 15:51:18.057472', '', NULL, NULL, b'1', 6, 69, 56),
(3223, 'collaborator1', '2024-06-26 15:51:18.059468', '', NULL, NULL, b'1', 1, 70, 56),
(3224, 'collaborator1', '2024-06-26 15:51:18.061501', '', NULL, NULL, b'1', 2, 70, 56),
(3225, 'collaborator1', '2024-06-26 15:51:18.064505', '', NULL, NULL, b'1', 3, 70, 56),
(3226, 'collaborator1', '2024-06-26 15:51:18.067475', '', NULL, NULL, b'1', 4, 70, 56),
(3227, 'collaborator1', '2024-06-26 15:51:18.069761', '', NULL, NULL, b'1', 5, 70, 56),
(3228, 'collaborator1', '2024-06-26 15:51:18.072549', '', NULL, NULL, b'1', 6, 70, 56),
(3229, 'collaborator1', '2024-06-26 15:51:18.075593', '', NULL, NULL, b'1', 1, 71, 56),
(3230, 'collaborator1', '2024-06-26 15:51:18.077467', '', NULL, NULL, b'1', 2, 71, 56),
(3231, 'collaborator1', '2024-06-26 15:51:18.079469', '', NULL, NULL, b'1', 3, 71, 56),
(3232, 'collaborator1', '2024-06-26 15:51:18.082799', '', NULL, NULL, b'1', 4, 71, 56),
(3233, 'collaborator1', '2024-06-26 15:51:18.085649', '', NULL, NULL, b'1', 5, 71, 56),
(3234, 'collaborator1', '2024-06-26 15:51:18.087467', '', NULL, NULL, b'1', 6, 71, 56),
(3235, 'collaborator1', '2024-06-26 15:51:18.090815', '', NULL, NULL, b'1', 1, 72, 56),
(3236, 'collaborator1', '2024-06-26 15:51:18.093632', '', NULL, NULL, b'1', 2, 72, 56),
(3237, 'collaborator1', '2024-06-26 15:51:18.096469', '', NULL, NULL, b'1', 3, 72, 56),
(3238, 'collaborator1', '2024-06-26 15:51:18.099517', '', NULL, NULL, b'1', 4, 72, 56),
(3239, 'collaborator1', '2024-06-26 15:51:18.101761', '', NULL, NULL, b'1', 5, 72, 56),
(3240, 'collaborator1', '2024-06-26 15:51:18.104592', '', NULL, NULL, b'1', 6, 72, 56),
(3241, 'collaborator1', '2024-06-26 15:51:18.107469', '', NULL, NULL, b'1', 1, 73, 56),
(3242, 'collaborator1', '2024-06-26 15:51:18.110469', '', NULL, NULL, b'1', 2, 73, 56),
(3243, 'collaborator1', '2024-06-26 15:51:18.112483', '', NULL, NULL, b'1', 3, 73, 56),
(3244, 'collaborator1', '2024-06-26 15:51:18.115469', '', NULL, NULL, b'1', 4, 73, 56),
(3245, 'collaborator1', '2024-06-26 15:51:18.117469', '', NULL, NULL, b'1', 5, 73, 56),
(3246, 'collaborator1', '2024-06-26 15:51:18.119514', '', NULL, NULL, b'1', 6, 73, 56),
(3247, 'collaborator1', '2024-06-26 15:51:18.122476', '', NULL, NULL, b'1', 1, 74, 56),
(3248, 'collaborator1', '2024-06-26 15:51:18.124510', '', NULL, NULL, b'1', 2, 74, 56),
(3249, 'collaborator1', '2024-06-26 15:51:18.126468', '', NULL, NULL, b'1', 3, 74, 56),
(3250, 'collaborator1', '2024-06-26 15:51:18.129581', '', NULL, NULL, b'1', 4, 74, 56),
(3251, 'collaborator1', '2024-06-26 15:51:18.132754', '', NULL, NULL, b'1', 5, 74, 56),
(3252, 'collaborator1', '2024-06-26 15:51:18.135642', '', NULL, NULL, b'1', 6, 74, 56),
(3253, 'collaborator1', '2024-06-26 15:51:18.137504', '', NULL, NULL, b'1', 1, 75, 56),
(3254, 'collaborator1', '2024-06-26 15:51:18.140816', '', NULL, NULL, b'1', 2, 75, 56),
(3255, 'collaborator1', '2024-06-26 15:51:18.143614', '', NULL, NULL, b'1', 3, 75, 56),
(3256, 'collaborator1', '2024-06-26 15:51:18.146479', '', NULL, NULL, b'1', 4, 75, 56),
(3257, 'collaborator1', '2024-06-26 15:51:18.148782', '', NULL, NULL, b'1', 5, 75, 56),
(3258, 'collaborator1', '2024-06-26 15:51:18.151814', '', NULL, NULL, b'1', 6, 75, 56),
(3259, 'collaborator1', '2024-06-26 15:51:18.154564', '', NULL, NULL, b'1', 1, 76, 56),
(3260, 'collaborator1', '2024-06-26 15:51:18.157471', '', NULL, NULL, b'1', 2, 76, 56),
(3261, 'collaborator1', '2024-06-26 15:51:18.159764', '', NULL, NULL, b'1', 3, 76, 56),
(3262, 'collaborator1', '2024-06-26 15:51:18.162587', '', NULL, NULL, b'1', 4, 76, 56),
(3263, 'collaborator1', '2024-06-26 15:51:18.165510', '', NULL, NULL, b'1', 5, 76, 56),
(3264, 'collaborator1', '2024-06-26 15:51:18.167469', '', NULL, NULL, b'1', 6, 76, 56),
(3265, 'collaborator1', '2024-06-26 15:51:18.169469', '', NULL, NULL, b'1', 1, 77, 56),
(3266, 'collaborator1', '2024-06-26 15:51:18.172468', '', NULL, NULL, b'1', 2, 77, 56),
(3267, 'collaborator1', '2024-06-26 15:51:18.174781', '', NULL, NULL, b'1', 3, 77, 56),
(3268, 'collaborator1', '2024-06-26 15:51:18.177590', '', NULL, NULL, b'1', 4, 77, 56),
(3269, 'collaborator1', '2024-06-26 15:51:18.180486', '', NULL, NULL, b'1', 5, 77, 56),
(3270, 'collaborator1', '2024-06-26 15:51:18.182768', '', NULL, NULL, b'1', 6, 77, 56),
(3271, 'collaborator1', '2024-06-26 15:51:18.185537', '', NULL, NULL, b'1', 1, 78, 56),
(3272, 'collaborator1', '2024-06-26 15:51:18.187467', '', NULL, NULL, b'1', 2, 78, 56),
(3273, 'collaborator1', '2024-06-26 15:51:18.190808', '', NULL, NULL, b'1', 3, 78, 56),
(3274, 'collaborator1', '2024-06-26 15:51:18.193604', '', NULL, NULL, b'1', 4, 78, 56),
(3275, 'collaborator1', '2024-06-26 15:51:18.196471', '', NULL, NULL, b'1', 5, 78, 56),
(3276, 'collaborator1', '2024-06-26 15:51:18.198771', '', NULL, NULL, b'1', 6, 78, 56),
(3277, 'collaborator1', '2024-06-26 15:51:23.698150', '', NULL, NULL, b'1', 1, 1, 57),
(3278, 'collaborator1', '2024-06-26 15:51:23.701151', '', NULL, NULL, b'1', 2, 1, 57),
(3279, 'collaborator1', '2024-06-26 15:51:23.705158', '', NULL, NULL, b'1', 3, 1, 57),
(3280, 'collaborator1', '2024-06-26 15:51:23.707302', '', NULL, NULL, b'1', 4, 1, 57),
(3281, 'collaborator1', '2024-06-26 15:51:23.709209', '', NULL, NULL, b'1', 5, 1, 57),
(3282, 'collaborator1', '2024-06-26 15:51:23.713176', '', NULL, NULL, b'1', 6, 1, 57),
(3283, 'collaborator1', '2024-06-26 15:51:23.716154', '', NULL, NULL, b'1', 1, 2, 57),
(3284, 'collaborator1', '2024-06-26 15:51:23.718152', '', NULL, NULL, b'1', 2, 2, 57),
(3285, 'collaborator1', '2024-06-26 15:51:23.722162', '', NULL, NULL, b'1', 3, 2, 57),
(3286, 'collaborator1', '2024-06-26 15:51:23.724148', '', NULL, NULL, b'1', 4, 2, 57),
(3287, 'collaborator1', '2024-06-26 15:51:23.727166', '', NULL, NULL, b'1', 5, 2, 57),
(3288, 'collaborator1', '2024-06-26 15:51:23.731158', '', NULL, NULL, b'1', 6, 2, 57),
(3289, 'collaborator1', '2024-06-26 15:51:23.733153', '', NULL, NULL, b'1', 1, 3, 57),
(3290, 'collaborator1', '2024-06-26 15:51:23.736158', '', NULL, NULL, b'1', 2, 3, 57),
(3291, 'collaborator1', '2024-06-26 15:51:23.739153', '', NULL, NULL, b'1', 3, 3, 57),
(3292, 'collaborator1', '2024-06-26 15:51:23.742152', '', NULL, NULL, b'1', 4, 3, 57),
(3293, 'collaborator1', '2024-06-26 15:51:23.744193', '', NULL, NULL, b'1', 5, 3, 57),
(3294, 'collaborator1', '2024-06-26 15:51:23.748151', '', NULL, NULL, b'1', 6, 3, 57),
(3295, 'collaborator1', '2024-06-26 15:51:23.750190', '', NULL, NULL, b'1', 1, 4, 57),
(3296, 'collaborator1', '2024-06-26 15:51:23.755172', '', NULL, NULL, b'1', 2, 4, 57),
(3297, 'collaborator1', '2024-06-26 15:51:23.758164', '', NULL, NULL, b'1', 3, 4, 57),
(3298, 'collaborator1', '2024-06-26 15:51:23.760150', '', NULL, NULL, b'1', 4, 4, 57),
(3299, 'collaborator1', '2024-06-26 15:51:23.765149', '', NULL, NULL, b'1', 5, 4, 57),
(3300, 'collaborator1', '2024-06-26 15:51:23.767148', '', NULL, NULL, b'1', 6, 4, 57),
(3301, 'collaborator1', '2024-06-26 15:51:23.770155', '', NULL, NULL, b'1', 1, 5, 57),
(3302, 'collaborator1', '2024-06-26 15:51:23.773150', '', NULL, NULL, b'1', 2, 5, 57),
(3303, 'collaborator1', '2024-06-26 15:51:23.775148', '', NULL, NULL, b'1', 3, 5, 57),
(3304, 'collaborator1', '2024-06-26 15:51:23.778151', '', NULL, NULL, b'1', 4, 5, 57),
(3305, 'collaborator1', '2024-06-26 15:51:23.782148', '', NULL, NULL, b'1', 5, 5, 57),
(3306, 'collaborator1', '2024-06-26 15:51:23.784151', '', NULL, NULL, b'1', 6, 5, 57),
(3307, 'collaborator1', '2024-06-26 15:51:23.786153', '', NULL, NULL, b'1', 1, 6, 57),
(3308, 'collaborator1', '2024-06-26 15:51:23.790270', '', NULL, NULL, b'1', 2, 6, 57),
(3309, 'collaborator1', '2024-06-26 15:51:23.792305', '', NULL, NULL, b'1', 3, 6, 57),
(3310, 'collaborator1', '2024-06-26 15:51:23.796181', '', NULL, NULL, b'1', 4, 6, 57),
(3311, 'collaborator1', '2024-06-26 15:51:23.799149', '', NULL, NULL, b'1', 5, 6, 57),
(3312, 'collaborator1', '2024-06-26 15:51:23.801150', '', NULL, NULL, b'1', 6, 6, 57),
(3313, 'collaborator1', '2024-06-26 15:51:23.805150', '', NULL, NULL, b'1', 1, 7, 57),
(3314, 'collaborator1', '2024-06-26 15:51:23.807302', '', NULL, NULL, b'1', 2, 7, 57),
(3315, 'collaborator1', '2024-06-26 15:51:23.809301', '', NULL, NULL, b'1', 3, 7, 57),
(3316, 'collaborator1', '2024-06-26 15:51:23.813150', '', NULL, NULL, b'1', 4, 7, 57),
(3317, 'collaborator1', '2024-06-26 15:51:23.815299', '', NULL, NULL, b'1', 5, 7, 57),
(3318, 'collaborator1', '2024-06-26 15:51:23.817300', '', NULL, NULL, b'1', 6, 7, 57),
(3319, 'collaborator1', '2024-06-26 15:51:23.820150', '', NULL, NULL, b'1', 1, 8, 57),
(3320, 'collaborator1', '2024-06-26 15:51:23.824149', '', NULL, NULL, b'1', 2, 8, 57),
(3321, 'collaborator1', '2024-06-26 15:51:23.826191', '', NULL, NULL, b'1', 3, 8, 57),
(3322, 'collaborator1', '2024-06-26 15:51:23.829257', '', NULL, NULL, b'1', 4, 8, 57),
(3323, 'collaborator1', '2024-06-26 15:51:23.832151', '', NULL, NULL, b'1', 5, 8, 57),
(3324, 'collaborator1', '2024-06-26 15:51:23.834289', '', NULL, NULL, b'1', 6, 8, 57),
(3325, 'collaborator1', '2024-06-26 15:51:23.838150', '', NULL, NULL, b'1', 1, 9, 57),
(3326, 'collaborator1', '2024-06-26 15:51:23.840148', '', NULL, NULL, b'1', 2, 9, 57),
(3327, 'collaborator1', '2024-06-26 15:51:23.842148', '', NULL, NULL, b'1', 3, 9, 57),
(3328, 'collaborator1', '2024-06-26 15:51:23.845178', '', NULL, NULL, b'1', 4, 9, 57),
(3329, 'collaborator1', '2024-06-26 15:51:23.848149', '', NULL, NULL, b'1', 5, 9, 57),
(3330, 'collaborator1', '2024-06-26 15:51:23.850230', '', NULL, NULL, b'1', 6, 9, 57),
(3331, 'collaborator1', '2024-06-26 15:51:23.852161', '', NULL, NULL, b'1', 1, 10, 57),
(3332, 'collaborator1', '2024-06-26 15:51:23.856149', '', NULL, NULL, b'1', 2, 10, 57),
(3333, 'collaborator1', '2024-06-26 15:51:23.858224', '', NULL, NULL, b'1', 3, 10, 57),
(3334, 'collaborator1', '2024-06-26 15:51:23.860168', '', NULL, NULL, b'1', 4, 10, 57),
(3335, 'collaborator1', '2024-06-26 15:51:23.864187', '', NULL, NULL, b'1', 5, 10, 57),
(3336, 'collaborator1', '2024-06-26 15:51:23.866289', '', NULL, NULL, b'1', 6, 10, 57),
(3337, 'collaborator1', '2024-06-26 15:51:23.869175', '', NULL, NULL, b'1', 1, 11, 57),
(3338, 'collaborator1', '2024-06-26 15:51:23.872150', '', NULL, NULL, b'1', 2, 11, 57),
(3339, 'collaborator1', '2024-06-26 15:51:23.874288', '', NULL, NULL, b'1', 3, 11, 57),
(3340, 'collaborator1', '2024-06-26 15:51:23.876157', '', NULL, NULL, b'1', 4, 11, 57),
(3341, 'collaborator1', '2024-06-26 15:51:23.880153', '', NULL, NULL, b'1', 5, 11, 57),
(3342, 'collaborator1', '2024-06-26 15:51:23.882290', '', NULL, NULL, b'1', 6, 11, 57),
(3343, 'collaborator1', '2024-06-26 15:51:23.884289', '', NULL, NULL, b'1', 1, 12, 57),
(3344, 'collaborator1', '2024-06-26 15:51:23.887304', '', NULL, NULL, b'1', 2, 12, 57),
(3345, 'collaborator1', '2024-06-26 15:51:23.890199', '', NULL, NULL, b'1', 3, 12, 57),
(3346, 'collaborator1', '2024-06-26 15:51:23.892290', '', NULL, NULL, b'1', 4, 12, 57),
(3347, 'collaborator1', '2024-06-26 15:51:23.895152', '', NULL, NULL, b'1', 5, 12, 57),
(3348, 'collaborator1', '2024-06-26 15:51:23.897283', '', NULL, NULL, b'1', 6, 12, 57),
(3349, 'collaborator1', '2024-06-26 15:51:23.899290', '', NULL, NULL, b'1', 1, 13, 57),
(3350, 'collaborator1', '2024-06-26 15:51:23.902161', '', NULL, NULL, b'1', 2, 13, 57),
(3351, 'collaborator1', '2024-06-26 15:51:23.905149', '', NULL, NULL, b'1', 3, 13, 57),
(3352, 'collaborator1', '2024-06-26 15:51:23.907233', '', NULL, NULL, b'1', 4, 13, 57),
(3353, 'collaborator1', '2024-06-26 15:51:23.909290', '', NULL, NULL, b'1', 5, 13, 57),
(3354, 'collaborator1', '2024-06-26 15:51:23.912150', '', NULL, NULL, b'1', 6, 13, 57),
(3355, 'collaborator1', '2024-06-26 15:51:23.914290', '', NULL, NULL, b'1', 1, 14, 57),
(3356, 'collaborator1', '2024-06-26 15:51:23.916291', '', NULL, NULL, b'1', 2, 14, 57),
(3357, 'collaborator1', '2024-06-26 15:51:23.918151', '', NULL, NULL, b'1', 3, 14, 57),
(3358, 'collaborator1', '2024-06-26 15:51:23.921288', '', NULL, NULL, b'1', 4, 14, 57),
(3359, 'collaborator1', '2024-06-26 15:51:23.923290', '', NULL, NULL, b'1', 5, 14, 57),
(3360, 'collaborator1', '2024-06-26 15:51:23.925290', '', NULL, NULL, b'1', 6, 14, 57),
(3361, 'collaborator1', '2024-06-26 15:51:23.928151', '', NULL, NULL, b'1', 1, 15, 57),
(3362, 'collaborator1', '2024-06-26 15:51:23.930288', '', NULL, NULL, b'1', 2, 15, 57),
(3363, 'collaborator1', '2024-06-26 15:51:23.932289', '', NULL, NULL, b'1', 3, 15, 57),
(3364, 'collaborator1', '2024-06-26 15:51:23.935175', '', NULL, NULL, b'1', 4, 15, 57),
(3365, 'collaborator1', '2024-06-26 15:51:23.937150', '', NULL, NULL, b'1', 5, 15, 57),
(3366, 'collaborator1', '2024-06-26 15:51:23.940171', '', NULL, NULL, b'1', 6, 15, 57),
(3367, 'collaborator1', '2024-06-26 15:51:23.942154', '', NULL, NULL, b'1', 1, 16, 57),
(3368, 'collaborator1', '2024-06-26 15:51:23.944168', '', NULL, NULL, b'1', 2, 16, 57),
(3369, 'collaborator1', '2024-06-26 15:51:23.947154', '', NULL, NULL, b'1', 3, 16, 57),
(3370, 'collaborator1', '2024-06-26 15:51:23.949267', '', NULL, NULL, b'1', 4, 16, 57),
(3371, 'collaborator1', '2024-06-26 15:51:23.951151', '', NULL, NULL, b'1', 5, 16, 57),
(3372, 'collaborator1', '2024-06-26 15:51:23.954278', '', NULL, NULL, b'1', 6, 16, 57),
(3373, 'collaborator1', '2024-06-26 15:51:23.956279', '', NULL, NULL, b'1', 1, 17, 57),
(3374, 'collaborator1', '2024-06-26 15:51:23.959149', '', NULL, NULL, b'1', 2, 17, 57),
(3375, 'collaborator1', '2024-06-26 15:51:23.961290', '', NULL, NULL, b'1', 3, 17, 57),
(3376, 'collaborator1', '2024-06-26 15:51:23.963279', '', NULL, NULL, b'1', 4, 17, 57),
(3377, 'collaborator1', '2024-06-26 15:51:23.966151', '', NULL, NULL, b'1', 5, 17, 57),
(3378, 'collaborator1', '2024-06-26 15:51:23.968154', '', NULL, NULL, b'1', 6, 17, 57),
(3379, 'collaborator1', '2024-06-26 15:51:23.971155', '', NULL, NULL, b'1', 1, 18, 57),
(3380, 'collaborator1', '2024-06-26 15:51:23.973150', '', NULL, NULL, b'1', 2, 18, 57),
(3381, 'collaborator1', '2024-06-26 15:51:23.975151', '', NULL, NULL, b'1', 3, 18, 57),
(3382, 'collaborator1', '2024-06-26 15:51:23.978156', '', NULL, NULL, b'1', 4, 18, 57),
(3383, 'collaborator1', '2024-06-26 15:51:23.980188', '', NULL, NULL, b'1', 5, 18, 57),
(3384, 'collaborator1', '2024-06-26 15:51:23.982277', '', NULL, NULL, b'1', 6, 18, 57),
(3385, 'collaborator1', '2024-06-26 15:51:23.985159', '', NULL, NULL, b'1', 1, 19, 57),
(3386, 'collaborator1', '2024-06-26 15:51:23.987283', '', NULL, NULL, b'1', 2, 19, 57),
(3387, 'collaborator1', '2024-06-26 15:51:23.990149', '', NULL, NULL, b'1', 3, 19, 57),
(3388, 'collaborator1', '2024-06-26 15:51:23.992262', '', NULL, NULL, b'1', 4, 19, 57),
(3389, 'collaborator1', '2024-06-26 15:51:23.994162', '', NULL, NULL, b'1', 5, 19, 57),
(3390, 'collaborator1', '2024-06-26 15:51:23.997240', '', NULL, NULL, b'1', 6, 19, 57),
(3391, 'collaborator1', '2024-06-26 15:51:23.999283', '', NULL, NULL, b'1', 1, 20, 57),
(3392, 'collaborator1', '2024-06-26 15:51:24.002151', '', NULL, NULL, b'1', 2, 20, 57),
(3393, 'collaborator1', '2024-06-26 15:51:24.004278', '', NULL, NULL, b'1', 3, 20, 57),
(3394, 'collaborator1', '2024-06-26 15:51:24.006280', '', NULL, NULL, b'1', 4, 20, 57),
(3395, 'collaborator1', '2024-06-26 15:51:24.009152', '', NULL, NULL, b'1', 5, 20, 57),
(3396, 'collaborator1', '2024-06-26 15:51:24.011287', '', NULL, NULL, b'1', 6, 20, 57),
(3397, 'collaborator1', '2024-06-26 15:51:24.014151', '', NULL, NULL, b'1', 1, 21, 57),
(3398, 'collaborator1', '2024-06-26 15:51:24.016266', '', NULL, NULL, b'1', 2, 21, 57),
(3399, 'collaborator1', '2024-06-26 15:51:24.018150', '', NULL, NULL, b'1', 3, 21, 57),
(3400, 'collaborator1', '2024-06-26 15:51:24.021173', '', NULL, NULL, b'1', 4, 21, 57),
(3401, 'collaborator1', '2024-06-26 15:51:24.023279', '', NULL, NULL, b'1', 5, 21, 57),
(3402, 'collaborator1', '2024-06-26 15:51:24.025277', '', NULL, NULL, b'1', 6, 21, 57),
(3403, 'collaborator1', '2024-06-26 15:51:24.028159', '', NULL, NULL, b'1', 1, 22, 57),
(3404, 'collaborator1', '2024-06-26 15:51:24.030277', '', NULL, NULL, b'1', 2, 22, 57),
(3405, 'collaborator1', '2024-06-26 15:51:24.032280', '', NULL, NULL, b'1', 3, 22, 57),
(3406, 'collaborator1', '2024-06-26 15:51:24.034279', '', NULL, NULL, b'1', 4, 22, 57),
(3407, 'collaborator1', '2024-06-26 15:51:24.037282', '', NULL, NULL, b'1', 5, 22, 57),
(3408, 'collaborator1', '2024-06-26 15:51:24.039150', '', NULL, NULL, b'1', 6, 22, 57),
(3409, 'collaborator1', '2024-06-26 15:51:24.042160', '', NULL, NULL, b'1', 1, 23, 57),
(3410, 'collaborator1', '2024-06-26 15:51:24.045152', '', NULL, NULL, b'1', 2, 23, 57),
(3411, 'collaborator1', '2024-06-26 15:51:24.047151', '', NULL, NULL, b'1', 3, 23, 57),
(3412, 'collaborator1', '2024-06-26 15:51:24.049149', '', NULL, NULL, b'1', 4, 23, 57),
(3413, 'collaborator1', '2024-06-26 15:51:24.052168', '', NULL, NULL, b'1', 5, 23, 57),
(3414, 'collaborator1', '2024-06-26 15:51:24.054150', '', NULL, NULL, b'1', 6, 23, 57),
(3415, 'collaborator1', '2024-06-26 15:51:24.056149', '', NULL, NULL, b'1', 1, 24, 57),
(3416, 'collaborator1', '2024-06-26 15:51:24.059149', '', NULL, NULL, b'1', 2, 24, 57),
(3417, 'collaborator1', '2024-06-26 15:51:24.062151', '', NULL, NULL, b'1', 3, 24, 57),
(3418, 'collaborator1', '2024-06-26 15:51:24.064149', '', NULL, NULL, b'1', 4, 24, 57),
(3419, 'collaborator1', '2024-06-26 15:51:24.066149', '', NULL, NULL, b'1', 5, 24, 57),
(3420, 'collaborator1', '2024-06-26 15:51:24.069155', '', NULL, NULL, b'1', 6, 24, 57),
(3421, 'collaborator1', '2024-06-26 15:51:24.071150', '', NULL, NULL, b'1', 1, 25, 57),
(3422, 'collaborator1', '2024-06-26 15:51:24.074149', '', NULL, NULL, b'1', 2, 25, 57),
(3423, 'collaborator1', '2024-06-26 15:51:24.076150', '', NULL, NULL, b'1', 3, 25, 57),
(3424, 'collaborator1', '2024-06-26 15:51:24.079149', '', NULL, NULL, b'1', 4, 25, 57),
(3425, 'collaborator1', '2024-06-26 15:51:24.081300', '', NULL, NULL, b'1', 5, 25, 57),
(3426, 'collaborator1', '2024-06-26 15:51:24.083191', '', NULL, NULL, b'1', 6, 25, 57),
(3427, 'collaborator1', '2024-06-26 15:51:24.086152', '', NULL, NULL, b'1', 1, 26, 57),
(3428, 'collaborator1', '2024-06-26 15:51:24.089189', '', NULL, NULL, b'1', 2, 26, 57),
(3429, 'collaborator1', '2024-06-26 15:51:24.091301', '', NULL, NULL, b'1', 3, 26, 57),
(3430, 'collaborator1', '2024-06-26 15:51:24.094167', '', NULL, NULL, b'1', 4, 26, 57),
(3431, 'collaborator1', '2024-06-26 15:51:24.097148', '', NULL, NULL, b'1', 5, 26, 57),
(3432, 'collaborator1', '2024-06-26 15:51:24.099151', '', NULL, NULL, b'1', 6, 26, 57),
(3433, 'collaborator1', '2024-06-26 15:51:24.101151', '', NULL, NULL, b'1', 1, 27, 57),
(3434, 'collaborator1', '2024-06-26 15:51:24.104152', '', NULL, NULL, b'1', 2, 27, 57),
(3435, 'collaborator1', '2024-06-26 15:51:24.107148', '', NULL, NULL, b'1', 3, 27, 57),
(3436, 'collaborator1', '2024-06-26 15:51:24.109309', '', NULL, NULL, b'1', 4, 27, 57),
(3437, 'collaborator1', '2024-06-26 15:51:24.112190', '', NULL, NULL, b'1', 5, 27, 57),
(3438, 'collaborator1', '2024-06-26 15:51:24.114151', '', NULL, NULL, b'1', 6, 27, 57),
(3439, 'collaborator1', '2024-06-26 15:51:24.117151', '', NULL, NULL, b'1', 1, 28, 57),
(3440, 'collaborator1', '2024-06-26 15:51:24.120197', '', NULL, NULL, b'1', 2, 28, 57),
(3441, 'collaborator1', '2024-06-26 15:51:24.123148', '', NULL, NULL, b'1', 3, 28, 57),
(3442, 'collaborator1', '2024-06-26 15:51:24.125152', '', NULL, NULL, b'1', 4, 28, 57),
(3443, 'collaborator1', '2024-06-26 15:51:24.128153', '', NULL, NULL, b'1', 5, 28, 57),
(3444, 'collaborator1', '2024-06-26 15:51:24.131195', '', NULL, NULL, b'1', 6, 28, 57),
(3445, 'collaborator1', '2024-06-26 15:51:24.133190', '', NULL, NULL, b'1', 1, 29, 57),
(3446, 'collaborator1', '2024-06-26 15:51:24.136157', '', NULL, NULL, b'1', 2, 29, 57),
(3447, 'collaborator1', '2024-06-26 15:51:24.139150', '', NULL, NULL, b'1', 3, 29, 57),
(3448, 'collaborator1', '2024-06-26 15:51:24.141154', '', NULL, NULL, b'1', 4, 29, 57),
(3449, 'collaborator1', '2024-06-26 15:51:24.143150', '', NULL, NULL, b'1', 5, 29, 57),
(3450, 'collaborator1', '2024-06-26 15:51:24.146149', '', NULL, NULL, b'1', 6, 29, 57),
(3451, 'collaborator1', '2024-06-26 15:51:24.149149', '', NULL, NULL, b'1', 1, 30, 57),
(3452, 'collaborator1', '2024-06-26 15:51:24.151153', '', NULL, NULL, b'1', 2, 30, 57),
(3453, 'collaborator1', '2024-06-26 15:51:24.154163', '', NULL, NULL, b'1', 3, 30, 57),
(3454, 'collaborator1', '2024-06-26 15:51:24.156153', '', NULL, NULL, b'1', 4, 30, 57),
(3455, 'collaborator1', '2024-06-26 15:51:24.158184', '', NULL, NULL, b'1', 5, 30, 57),
(3456, 'collaborator1', '2024-06-26 15:51:24.161188', '', NULL, NULL, b'1', 6, 30, 57),
(3457, 'collaborator1', '2024-06-26 15:51:24.163292', '', NULL, NULL, b'1', 1, 31, 57),
(3458, 'collaborator1', '2024-06-26 15:51:24.165292', '', NULL, NULL, b'1', 2, 31, 57),
(3459, 'collaborator1', '2024-06-26 15:51:24.167292', '', NULL, NULL, b'1', 3, 31, 57),
(3460, 'collaborator1', '2024-06-26 15:51:24.170294', '', NULL, NULL, b'1', 4, 31, 57),
(3461, 'collaborator1', '2024-06-26 15:51:24.172293', '', NULL, NULL, b'1', 5, 31, 57),
(3462, 'collaborator1', '2024-06-26 15:51:24.174149', '', NULL, NULL, b'1', 6, 31, 57),
(3463, 'collaborator1', '2024-06-26 15:51:24.177161', '', NULL, NULL, b'1', 1, 32, 57),
(3464, 'collaborator1', '2024-06-26 15:51:24.179151', '', NULL, NULL, b'1', 2, 32, 57),
(3465, 'collaborator1', '2024-06-26 15:51:24.182151', '', NULL, NULL, b'1', 3, 32, 57),
(3466, 'collaborator1', '2024-06-26 15:51:24.184149', '', NULL, NULL, b'1', 4, 32, 57),
(3467, 'collaborator1', '2024-06-26 15:51:24.187302', '', NULL, NULL, b'1', 5, 32, 57),
(3468, 'collaborator1', '2024-06-26 15:51:24.189150', '', NULL, NULL, b'1', 6, 32, 57),
(3469, 'collaborator1', '2024-06-26 15:51:24.192149', '', NULL, NULL, b'1', 1, 33, 57),
(3470, 'collaborator1', '2024-06-26 15:51:24.194154', '', NULL, NULL, b'1', 2, 33, 57),
(3471, 'collaborator1', '2024-06-26 15:51:24.196304', '', NULL, NULL, b'1', 3, 33, 57),
(3472, 'collaborator1', '2024-06-26 15:51:24.198150', '', NULL, NULL, b'1', 4, 33, 57),
(3473, 'collaborator1', '2024-06-26 15:51:24.201150', '', NULL, NULL, b'1', 5, 33, 57),
(3474, 'collaborator1', '2024-06-26 15:51:24.204152', '', NULL, NULL, b'1', 6, 33, 57),
(3475, 'collaborator1', '2024-06-26 15:51:24.206299', '', NULL, NULL, b'1', 1, 34, 57),
(3476, 'collaborator1', '2024-06-26 15:51:24.208154', '', NULL, NULL, b'1', 2, 34, 57),
(3477, 'collaborator1', '2024-06-26 15:51:24.210159', '', NULL, NULL, b'1', 3, 34, 57),
(3478, 'collaborator1', '2024-06-26 15:51:24.213150', '', NULL, NULL, b'1', 4, 34, 57),
(3479, 'collaborator1', '2024-06-26 15:51:24.215291', '', NULL, NULL, b'1', 5, 34, 57),
(3480, 'collaborator1', '2024-06-26 15:51:24.217299', '', NULL, NULL, b'1', 6, 34, 57),
(3481, 'collaborator1', '2024-06-26 15:51:24.220301', '', NULL, NULL, b'1', 1, 35, 57),
(3482, 'collaborator1', '2024-06-26 15:51:24.222149', '', NULL, NULL, b'1', 2, 35, 57),
(3483, 'collaborator1', '2024-06-26 15:51:24.225149', '', NULL, NULL, b'1', 3, 35, 57),
(3484, 'collaborator1', '2024-06-26 15:51:24.227150', '', NULL, NULL, b'1', 4, 35, 57),
(3485, 'collaborator1', '2024-06-26 15:51:24.230149', '', NULL, NULL, b'1', 5, 35, 57),
(3486, 'collaborator1', '2024-06-26 15:51:24.232152', '', NULL, NULL, b'1', 6, 35, 57),
(3487, 'collaborator1', '2024-06-26 15:51:24.234225', '', NULL, NULL, b'1', 1, 36, 57),
(3488, 'collaborator1', '2024-06-26 15:51:24.237153', '', NULL, NULL, b'1', 2, 36, 57),
(3489, 'collaborator1', '2024-06-26 15:51:24.239290', '', NULL, NULL, b'1', 3, 36, 57),
(3490, 'collaborator1', '2024-06-26 15:51:24.241289', '', NULL, NULL, b'1', 4, 36, 57),
(3491, 'collaborator1', '2024-06-26 15:51:24.243150', '', NULL, NULL, b'1', 5, 36, 57),
(3492, 'collaborator1', '2024-06-26 15:51:24.246289', '', NULL, NULL, b'1', 6, 36, 57),
(3493, 'collaborator1', '2024-06-26 15:51:24.248149', '', NULL, NULL, b'1', 1, 37, 57),
(3494, 'collaborator1', '2024-06-26 15:51:24.250289', '', NULL, NULL, b'1', 2, 37, 57),
(3495, 'collaborator1', '2024-06-26 15:51:24.253291', '', NULL, NULL, b'1', 3, 37, 57),
(3496, 'collaborator1', '2024-06-26 15:51:24.255149', '', NULL, NULL, b'1', 4, 37, 57),
(3497, 'collaborator1', '2024-06-26 15:51:24.258149', '', NULL, NULL, b'1', 5, 37, 57),
(3498, 'collaborator1', '2024-06-26 15:51:24.260151', '', NULL, NULL, b'1', 6, 37, 57),
(3499, 'collaborator1', '2024-06-26 15:51:24.263149', '', NULL, NULL, b'1', 1, 38, 57),
(3500, 'collaborator1', '2024-06-26 15:51:24.265236', '', NULL, NULL, b'1', 2, 38, 57),
(3501, 'collaborator1', '2024-06-26 15:51:24.267287', '', NULL, NULL, b'1', 3, 38, 57),
(3502, 'collaborator1', '2024-06-26 15:51:24.270289', '', NULL, NULL, b'1', 4, 38, 57),
(3503, 'collaborator1', '2024-06-26 15:51:24.273289', '', NULL, NULL, b'1', 5, 38, 57),
(3504, 'collaborator1', '2024-06-26 15:51:24.275287', '', NULL, NULL, b'1', 6, 38, 57),
(3505, 'collaborator1', '2024-06-26 15:51:24.278152', '', NULL, NULL, b'1', 1, 39, 57),
(3506, 'collaborator1', '2024-06-26 15:51:24.280289', '', NULL, NULL, b'1', 2, 39, 57),
(3507, 'collaborator1', '2024-06-26 15:51:24.282289', '', NULL, NULL, b'1', 3, 39, 57),
(3508, 'collaborator1', '2024-06-26 15:51:24.284154', '', NULL, NULL, b'1', 4, 39, 57),
(3509, 'collaborator1', '2024-06-26 15:51:24.287190', '', NULL, NULL, b'1', 5, 39, 57),
(3510, 'collaborator1', '2024-06-26 15:51:24.289150', '', NULL, NULL, b'1', 6, 39, 57),
(3511, 'collaborator1', '2024-06-26 15:51:24.292149', '', NULL, NULL, b'1', 1, 40, 57),
(3512, 'collaborator1', '2024-06-26 15:51:24.294155', '', NULL, NULL, b'1', 2, 40, 57),
(3513, 'collaborator1', '2024-06-26 15:51:24.296149', '', NULL, NULL, b'1', 3, 40, 57),
(3514, 'collaborator1', '2024-06-26 15:51:24.299149', '', NULL, NULL, b'1', 4, 40, 57),
(3515, 'collaborator1', '2024-06-26 15:51:24.301150', '', NULL, NULL, b'1', 5, 40, 57),
(3516, 'collaborator1', '2024-06-26 15:51:24.304149', '', NULL, NULL, b'1', 6, 40, 57),
(3517, 'collaborator1', '2024-06-26 15:51:24.306276', '', NULL, NULL, b'1', 1, 41, 57),
(3518, 'collaborator1', '2024-06-26 15:51:24.308149', '', NULL, NULL, b'1', 2, 41, 57),
(3519, 'collaborator1', '2024-06-26 15:51:24.310158', '', NULL, NULL, b'1', 3, 41, 57),
(3520, 'collaborator1', '2024-06-26 15:51:24.312289', '', NULL, NULL, b'1', 4, 41, 57),
(3521, 'collaborator1', '2024-06-26 15:51:24.315149', '', NULL, NULL, b'1', 5, 41, 57),
(3522, 'collaborator1', '2024-06-26 15:51:24.317209', '', NULL, NULL, b'1', 6, 41, 57),
(3523, 'collaborator1', '2024-06-26 15:51:24.320153', '', NULL, NULL, b'1', 1, 42, 57),
(3524, 'collaborator1', '2024-06-26 15:51:24.322289', '', NULL, NULL, b'1', 2, 42, 57),
(3525, 'collaborator1', '2024-06-26 15:51:24.324289', '', NULL, NULL, b'1', 3, 42, 57),
(3526, 'collaborator1', '2024-06-26 15:51:24.326150', '', NULL, NULL, b'1', 4, 42, 57),
(3527, 'collaborator1', '2024-06-26 15:51:24.329291', '', NULL, NULL, b'1', 5, 42, 57),
(3528, 'collaborator1', '2024-06-26 15:51:24.331289', '', NULL, NULL, b'1', 6, 42, 57),
(3529, 'collaborator1', '2024-06-26 15:51:24.333290', '', NULL, NULL, b'1', 1, 43, 57),
(3530, 'collaborator1', '2024-06-26 15:51:24.336151', '', NULL, NULL, b'1', 2, 43, 57),
(3531, 'collaborator1', '2024-06-26 15:51:24.338289', '', NULL, NULL, b'1', 3, 43, 57),
(3532, 'collaborator1', '2024-06-26 15:51:24.340289', '', NULL, NULL, b'1', 4, 43, 57),
(3533, 'collaborator1', '2024-06-26 15:51:24.342288', '', NULL, NULL, b'1', 5, 43, 57),
(3534, 'collaborator1', '2024-06-26 15:51:24.345292', '', NULL, NULL, b'1', 6, 43, 57),
(3535, 'collaborator1', '2024-06-26 15:51:24.347288', '', NULL, NULL, b'1', 1, 44, 57),
(3536, 'collaborator1', '2024-06-26 15:51:24.349149', '', NULL, NULL, b'1', 2, 44, 57),
(3537, 'collaborator1', '2024-06-26 15:51:24.352161', '', NULL, NULL, b'1', 3, 44, 57),
(3538, 'collaborator1', '2024-06-26 15:51:24.354288', '', NULL, NULL, b'1', 4, 44, 57),
(3539, 'collaborator1', '2024-06-26 15:51:24.357149', '', NULL, NULL, b'1', 5, 44, 57),
(3540, 'collaborator1', '2024-06-26 15:51:24.359190', '', NULL, NULL, b'1', 6, 44, 57),
(3541, 'collaborator1', '2024-06-26 15:51:24.362152', '', NULL, NULL, b'1', 1, 45, 57),
(3542, 'collaborator1', '2024-06-26 15:51:24.364289', '', NULL, NULL, b'1', 2, 45, 57),
(3543, 'collaborator1', '2024-06-26 15:51:24.366289', '', NULL, NULL, b'1', 3, 45, 57),
(3544, 'collaborator1', '2024-06-26 15:51:24.368152', '', NULL, NULL, b'1', 4, 45, 57),
(3545, 'collaborator1', '2024-06-26 15:51:24.371289', '', NULL, NULL, b'1', 5, 45, 57),
(3546, 'collaborator1', '2024-06-26 15:51:24.373291', '', NULL, NULL, b'1', 6, 45, 57),
(3547, 'collaborator1', '2024-06-26 15:51:24.375291', '', NULL, NULL, b'1', 1, 46, 57),
(3548, 'collaborator1', '2024-06-26 15:51:24.378152', '', NULL, NULL, b'1', 2, 46, 57),
(3549, 'collaborator1', '2024-06-26 15:51:24.380151', '', NULL, NULL, b'1', 3, 46, 57),
(3550, 'collaborator1', '2024-06-26 15:51:24.382151', '', NULL, NULL, b'1', 4, 46, 57),
(3551, 'collaborator1', '2024-06-26 15:51:24.384149', '', NULL, NULL, b'1', 5, 46, 57),
(3552, 'collaborator1', '2024-06-26 15:51:24.387150', '', NULL, NULL, b'1', 6, 46, 57),
(3553, 'collaborator1', '2024-06-26 15:51:24.389149', '', NULL, NULL, b'1', 1, 47, 57),
(3554, 'collaborator1', '2024-06-26 15:51:24.392153', '', NULL, NULL, b'1', 2, 47, 57),
(3555, 'collaborator1', '2024-06-26 15:51:24.395172', '', NULL, NULL, b'1', 3, 47, 57),
(3556, 'collaborator1', '2024-06-26 15:51:24.397149', '', NULL, NULL, b'1', 4, 47, 57),
(3557, 'collaborator1', '2024-06-26 15:51:24.399149', '', NULL, NULL, b'1', 5, 47, 57),
(3558, 'collaborator1', '2024-06-26 15:51:24.401153', '', NULL, NULL, b'1', 6, 47, 57),
(3559, 'collaborator1', '2024-06-26 15:51:24.404304', '', NULL, NULL, b'1', 1, 48, 57),
(3560, 'collaborator1', '2024-06-26 15:51:24.406301', '', NULL, NULL, b'1', 2, 48, 57),
(3561, 'collaborator1', '2024-06-26 15:51:24.408149', '', NULL, NULL, b'1', 3, 48, 57),
(3562, 'collaborator1', '2024-06-26 15:51:24.411158', '', NULL, NULL, b'1', 4, 48, 57),
(3563, 'collaborator1', '2024-06-26 15:51:24.413302', '', NULL, NULL, b'1', 5, 48, 57),
(3564, 'collaborator1', '2024-06-26 15:51:24.415307', '', NULL, NULL, b'1', 6, 48, 57),
(3565, 'collaborator1', '2024-06-26 15:51:24.417293', '', NULL, NULL, b'1', 1, 49, 57),
(3566, 'collaborator1', '2024-06-26 15:51:24.420305', '', NULL, NULL, b'1', 2, 49, 57),
(3567, 'collaborator1', '2024-06-26 15:51:24.423152', '', NULL, NULL, b'1', 3, 49, 57),
(3568, 'collaborator1', '2024-06-26 15:51:24.425378', '', NULL, NULL, b'1', 4, 49, 57),
(3569, 'collaborator1', '2024-06-26 15:51:24.428391', '', NULL, NULL, b'1', 5, 49, 57),
(3570, 'collaborator1', '2024-06-26 15:51:24.430459', '', NULL, NULL, b'1', 6, 49, 57),
(3571, 'collaborator1', '2024-06-26 15:51:24.432532', '', NULL, NULL, b'1', 1, 50, 57),
(3572, 'collaborator1', '2024-06-26 15:51:24.434389', '', NULL, NULL, b'1', 2, 50, 57),
(3573, 'collaborator1', '2024-06-26 15:51:24.437440', '', NULL, NULL, b'1', 3, 50, 57),
(3574, 'collaborator1', '2024-06-26 15:51:24.439569', '', NULL, NULL, b'1', 4, 50, 57),
(3575, 'collaborator1', '2024-06-26 15:51:24.441697', '', NULL, NULL, b'1', 5, 50, 57),
(3576, 'collaborator1', '2024-06-26 15:51:24.443339', '', NULL, NULL, b'1', 6, 50, 57),
(3577, 'collaborator1', '2024-06-26 15:51:24.446370', '', NULL, NULL, b'1', 1, 51, 57),
(3578, 'collaborator1', '2024-06-26 15:51:24.448378', '', NULL, NULL, b'1', 2, 51, 57),
(3579, 'collaborator1', '2024-06-26 15:51:24.450470', '', NULL, NULL, b'1', 3, 51, 57),
(3580, 'collaborator1', '2024-06-26 15:51:24.453362', '', NULL, NULL, b'1', 4, 51, 57),
(3581, 'collaborator1', '2024-06-26 15:51:24.455477', '', NULL, NULL, b'1', 5, 51, 57),
(3582, 'collaborator1', '2024-06-26 15:51:24.457383', '', NULL, NULL, b'1', 6, 51, 57),
(3583, 'collaborator1', '2024-06-26 15:51:24.459328', '', NULL, NULL, b'1', 1, 52, 57),
(3584, 'collaborator1', '2024-06-26 15:51:24.462478', '', NULL, NULL, b'1', 2, 52, 57),
(3585, 'collaborator1', '2024-06-26 15:51:24.464479', '', NULL, NULL, b'1', 3, 52, 57),
(3586, 'collaborator1', '2024-06-26 15:51:24.466477', '', NULL, NULL, b'1', 4, 52, 57),
(3587, 'collaborator1', '2024-06-26 15:51:24.469333', '', NULL, NULL, b'1', 5, 52, 57),
(3588, 'collaborator1', '2024-06-26 15:51:24.471479', '', NULL, NULL, b'1', 6, 52, 57),
(3589, 'collaborator1', '2024-06-26 15:51:24.473478', '', NULL, NULL, b'1', 1, 53, 57),
(3590, 'collaborator1', '2024-06-26 15:51:24.475479', '', NULL, NULL, b'1', 2, 53, 57),
(3591, 'collaborator1', '2024-06-26 15:51:24.478331', '', NULL, NULL, b'1', 3, 53, 57),
(3592, 'collaborator1', '2024-06-26 15:51:24.481331', '', NULL, NULL, b'1', 4, 53, 57),
(3593, 'collaborator1', '2024-06-26 15:51:24.483479', '', NULL, NULL, b'1', 5, 53, 57),
(3594, 'collaborator1', '2024-06-26 15:51:24.486445', '', NULL, NULL, b'1', 6, 53, 57),
(3595, 'collaborator1', '2024-06-26 15:51:24.489380', '', NULL, NULL, b'1', 1, 54, 57),
(3596, 'collaborator1', '2024-06-26 15:51:24.491531', '', NULL, NULL, b'1', 2, 54, 57),
(3597, 'collaborator1', '2024-06-26 15:51:24.493384', '', NULL, NULL, b'1', 3, 54, 57),
(3598, 'collaborator1', '2024-06-26 15:51:24.495379', '', NULL, NULL, b'1', 4, 54, 57),
(3599, 'collaborator1', '2024-06-26 15:51:24.498380', '', NULL, NULL, b'1', 5, 54, 57),
(3600, 'collaborator1', '2024-06-26 15:51:24.500378', '', NULL, NULL, b'1', 6, 54, 57),
(3601, 'collaborator1', '2024-06-26 15:51:24.502380', '', NULL, NULL, b'1', 1, 55, 57),
(3602, 'collaborator1', '2024-06-26 15:51:24.505380', '', NULL, NULL, b'1', 2, 55, 57),
(3603, 'collaborator1', '2024-06-26 15:51:24.507377', '', NULL, NULL, b'1', 3, 55, 57),
(3604, 'collaborator1', '2024-06-26 15:51:24.509379', '', NULL, NULL, b'1', 4, 55, 57),
(3605, 'collaborator1', '2024-06-26 15:51:24.512382', '', NULL, NULL, b'1', 5, 55, 57),
(3606, 'collaborator1', '2024-06-26 15:51:24.514530', '', NULL, NULL, b'1', 6, 55, 57),
(3607, 'collaborator1', '2024-06-26 15:51:24.516536', '', NULL, NULL, b'1', 1, 56, 57),
(3608, 'collaborator1', '2024-06-26 15:51:24.519386', '', NULL, NULL, b'1', 2, 56, 57),
(3609, 'collaborator1', '2024-06-26 15:51:24.522378', '', NULL, NULL, b'1', 3, 56, 57),
(3610, 'collaborator1', '2024-06-26 15:51:24.524418', '', NULL, NULL, b'1', 4, 56, 57),
(3611, 'collaborator1', '2024-06-26 15:51:24.526380', '', NULL, NULL, b'1', 5, 56, 57),
(3612, 'collaborator1', '2024-06-26 15:51:24.529540', '', NULL, NULL, b'1', 6, 56, 57),
(3613, 'collaborator1', '2024-06-26 15:51:24.531555', '', NULL, NULL, b'1', 1, 57, 57),
(3614, 'collaborator1', '2024-06-26 15:51:24.533551', '', NULL, NULL, b'1', 2, 57, 57),
(3615, 'collaborator1', '2024-06-26 15:51:24.536552', '', NULL, NULL, b'1', 3, 57, 57),
(3616, 'collaborator1', '2024-06-26 15:51:24.538552', '', NULL, NULL, b'1', 4, 57, 57),
(3617, 'collaborator1', '2024-06-26 15:51:24.541572', '', NULL, NULL, b'1', 5, 57, 57),
(3618, 'collaborator1', '2024-06-26 15:51:24.543552', '', NULL, NULL, b'1', 6, 57, 57),
(3619, 'collaborator1', '2024-06-26 15:51:24.545555', '', NULL, NULL, b'1', 1, 58, 57),
(3620, 'collaborator1', '2024-06-26 15:51:24.548552', '', NULL, NULL, b'1', 2, 58, 57),
(3621, 'collaborator1', '2024-06-26 15:51:24.550593', '', NULL, NULL, b'1', 3, 58, 57),
(3622, 'collaborator1', '2024-06-26 15:51:24.552551', '', NULL, NULL, b'1', 4, 58, 57),
(3623, 'collaborator1', '2024-06-26 15:51:24.555551', '', NULL, NULL, b'1', 5, 58, 57),
(3624, 'collaborator1', '2024-06-26 15:51:24.557552', '', NULL, NULL, b'1', 6, 58, 57),
(3625, 'collaborator1', '2024-06-26 15:51:24.560554', '', NULL, NULL, b'1', 1, 59, 57),
(3626, 'collaborator1', '2024-06-26 15:51:24.563552', '', NULL, NULL, b'1', 2, 59, 57),
(3627, 'collaborator1', '2024-06-26 15:51:24.565707', '', NULL, NULL, b'1', 3, 59, 57),
(3628, 'collaborator1', '2024-06-26 15:51:24.568560', '', NULL, NULL, b'1', 4, 59, 57),
(3629, 'collaborator1', '2024-06-26 15:51:24.570704', '', NULL, NULL, b'1', 5, 59, 57),
(3630, 'collaborator1', '2024-06-26 15:51:24.573551', '', NULL, NULL, b'1', 6, 59, 57),
(3631, 'collaborator1', '2024-06-26 15:51:24.575551', '', NULL, NULL, b'1', 1, 60, 57),
(3632, 'collaborator1', '2024-06-26 15:51:24.578554', '', NULL, NULL, b'1', 2, 60, 57),
(3633, 'collaborator1', '2024-06-26 15:51:24.580553', '', NULL, NULL, b'1', 3, 60, 57),
(3634, 'collaborator1', '2024-06-26 15:51:24.582554', '', NULL, NULL, b'1', 4, 60, 57),
(3635, 'collaborator1', '2024-06-26 15:51:24.584553', '', NULL, NULL, b'1', 5, 60, 57),
(3636, 'collaborator1', '2024-06-26 15:51:24.587554', '', NULL, NULL, b'1', 6, 60, 57),
(3637, 'collaborator1', '2024-06-26 15:51:24.589549', '', NULL, NULL, b'1', 1, 61, 57),
(3638, 'collaborator1', '2024-06-26 15:51:24.592552', '', NULL, NULL, b'1', 2, 61, 57),
(3639, 'collaborator1', '2024-06-26 15:51:24.595551', '', NULL, NULL, b'1', 3, 61, 57),
(3640, 'collaborator1', '2024-06-26 15:51:24.598703', '', NULL, NULL, b'1', 4, 61, 57),
(3641, 'collaborator1', '2024-06-26 15:51:24.601561', '', NULL, NULL, b'1', 5, 61, 57),
(3642, 'collaborator1', '2024-06-26 15:51:24.604554', '', NULL, NULL, b'1', 6, 61, 57),
(3643, 'collaborator1', '2024-06-26 15:51:24.606551', '', NULL, NULL, b'1', 1, 62, 57),
(3644, 'collaborator1', '2024-06-26 15:51:24.608694', '', NULL, NULL, b'1', 2, 62, 57),
(3645, 'collaborator1', '2024-06-26 15:51:24.611558', '', NULL, NULL, b'1', 3, 62, 57),
(3646, 'collaborator1', '2024-06-26 15:51:24.614550', '', NULL, NULL, b'1', 4, 62, 57),
(3647, 'collaborator1', '2024-06-26 15:51:24.616552', '', NULL, NULL, b'1', 5, 62, 57),
(3648, 'collaborator1', '2024-06-26 15:51:24.618557', '', NULL, NULL, b'1', 6, 62, 57),
(3649, 'collaborator1', '2024-06-26 15:51:24.621590', '', NULL, NULL, b'1', 1, 63, 57),
(3650, 'collaborator1', '2024-06-26 15:51:24.623555', '', NULL, NULL, b'1', 2, 63, 57),
(3651, 'collaborator1', '2024-06-26 15:51:24.626584', '', NULL, NULL, b'1', 3, 63, 57),
(3652, 'collaborator1', '2024-06-26 15:51:24.629550', '', NULL, NULL, b'1', 4, 63, 57),
(3653, 'collaborator1', '2024-06-26 15:51:24.631551', '', NULL, NULL, b'1', 5, 63, 57),
(3654, 'collaborator1', '2024-06-26 15:51:24.634551', '', NULL, NULL, b'1', 6, 63, 57),
(3655, 'collaborator1', '2024-06-26 15:51:24.636553', '', NULL, NULL, b'1', 1, 64, 57),
(3656, 'collaborator1', '2024-06-26 15:51:24.639551', '', NULL, NULL, b'1', 2, 64, 57),
(3657, 'collaborator1', '2024-06-26 15:51:24.641707', '', NULL, NULL, b'1', 3, 64, 57),
(3658, 'collaborator1', '2024-06-26 15:51:24.643596', '', NULL, NULL, b'1', 4, 64, 57),
(3659, 'collaborator1', '2024-06-26 15:51:24.646551', '', NULL, NULL, b'1', 5, 64, 57),
(3660, 'collaborator1', '2024-06-26 15:51:24.648615', '', NULL, NULL, b'1', 6, 64, 57),
(3661, 'collaborator1', '2024-06-26 15:51:24.650659', '', NULL, NULL, b'1', 1, 65, 57),
(3662, 'collaborator1', '2024-06-26 15:51:24.653553', '', NULL, NULL, b'1', 2, 65, 57),
(3663, 'collaborator1', '2024-06-26 15:51:24.655702', '', NULL, NULL, b'1', 3, 65, 57),
(3664, 'collaborator1', '2024-06-26 15:51:24.657551', '', NULL, NULL, b'1', 4, 65, 57),
(3665, 'collaborator1', '2024-06-26 15:51:24.660552', '', NULL, NULL, b'1', 5, 65, 57),
(3666, 'collaborator1', '2024-06-26 15:51:24.662593', '', NULL, NULL, b'1', 6, 65, 57),
(3667, 'collaborator1', '2024-06-26 15:51:24.664702', '', NULL, NULL, b'1', 1, 66, 57),
(3668, 'collaborator1', '2024-06-26 15:51:24.666703', '', NULL, NULL, b'1', 2, 66, 57),
(3669, 'collaborator1', '2024-06-26 15:51:24.679701', '', NULL, NULL, b'1', 3, 66, 57),
(3670, 'collaborator1', '2024-06-26 15:51:24.681700', '', NULL, NULL, b'1', 4, 66, 57),
(3671, 'collaborator1', '2024-06-26 15:51:24.683552', '', NULL, NULL, b'1', 5, 66, 57),
(3672, 'collaborator1', '2024-06-26 15:51:24.686705', '', NULL, NULL, b'1', 6, 66, 57),
(3673, 'collaborator1', '2024-06-26 15:51:24.688705', '', NULL, NULL, b'1', 1, 67, 57),
(3674, 'collaborator1', '2024-06-26 15:51:24.690701', '', NULL, NULL, b'1', 2, 67, 57),
(3675, 'collaborator1', '2024-06-26 15:51:24.693552', '', NULL, NULL, b'1', 3, 67, 57),
(3676, 'collaborator1', '2024-06-26 15:51:24.695702', '', NULL, NULL, b'1', 4, 67, 57),
(3677, 'collaborator1', '2024-06-26 15:51:24.697551', '', NULL, NULL, b'1', 5, 67, 57),
(3678, 'collaborator1', '2024-06-26 15:51:24.699703', '', NULL, NULL, b'1', 6, 67, 57),
(3679, 'collaborator1', '2024-06-26 15:51:24.701552', '', NULL, NULL, b'1', 1, 68, 57),
(3680, 'collaborator1', '2024-06-26 15:51:24.703701', '', NULL, NULL, b'1', 2, 68, 57),
(3681, 'collaborator1', '2024-06-26 15:51:24.705552', '', NULL, NULL, b'1', 3, 68, 57),
(3682, 'collaborator1', '2024-06-26 15:51:24.708551', '', NULL, NULL, b'1', 4, 68, 57),
(3683, 'collaborator1', '2024-06-26 15:51:24.710705', '', NULL, NULL, b'1', 5, 68, 57),
(3684, 'collaborator1', '2024-06-26 15:51:24.713550', '', NULL, NULL, b'1', 6, 68, 57),
(3685, 'collaborator1', '2024-06-26 15:51:24.715692', '', NULL, NULL, b'1', 1, 69, 57),
(3686, 'collaborator1', '2024-06-26 15:51:24.717553', '', NULL, NULL, b'1', 2, 69, 57),
(3687, 'collaborator1', '2024-06-26 15:51:24.720695', '', NULL, NULL, b'1', 3, 69, 57),
(3688, 'collaborator1', '2024-06-26 15:51:24.722583', '', NULL, NULL, b'1', 4, 69, 57),
(3689, 'collaborator1', '2024-06-26 15:51:24.724694', '', NULL, NULL, b'1', 5, 69, 57),
(3690, 'collaborator1', '2024-06-26 15:51:24.727603', '', NULL, NULL, b'1', 6, 69, 57),
(3691, 'collaborator1', '2024-06-26 15:51:24.729694', '', NULL, NULL, b'1', 1, 70, 57),
(3692, 'collaborator1', '2024-06-26 15:51:24.731694', '', NULL, NULL, b'1', 2, 70, 57),
(3693, 'collaborator1', '2024-06-26 15:51:24.733695', '', NULL, NULL, b'1', 3, 70, 57),
(3694, 'collaborator1', '2024-06-26 15:51:24.736614', '', NULL, NULL, b'1', 4, 70, 57),
(3695, 'collaborator1', '2024-06-26 15:51:24.738551', '', NULL, NULL, b'1', 5, 70, 57),
(3696, 'collaborator1', '2024-06-26 15:51:24.741550', '', NULL, NULL, b'1', 6, 70, 57),
(3697, 'collaborator1', '2024-06-26 15:51:24.743551', '', NULL, NULL, b'1', 1, 71, 57),
(3698, 'collaborator1', '2024-06-26 15:51:24.745551', '', NULL, NULL, b'1', 2, 71, 57),
(3699, 'collaborator1', '2024-06-26 15:51:24.747576', '', NULL, NULL, b'1', 3, 71, 57),
(3700, 'collaborator1', '2024-06-26 15:51:24.749694', '', NULL, NULL, b'1', 4, 71, 57),
(3701, 'collaborator1', '2024-06-26 15:51:24.752591', '', NULL, NULL, b'1', 5, 71, 57),
(3702, 'collaborator1', '2024-06-26 15:51:24.754695', '', NULL, NULL, b'1', 6, 71, 57),
(3703, 'collaborator1', '2024-06-26 15:51:24.756693', '', NULL, NULL, b'1', 1, 72, 57),
(3704, 'collaborator1', '2024-06-26 15:51:24.758551', '', NULL, NULL, b'1', 2, 72, 57),
(3705, 'collaborator1', '2024-06-26 15:51:24.762550', '', NULL, NULL, b'1', 3, 72, 57),
(3706, 'collaborator1', '2024-06-26 15:51:24.764609', '', NULL, NULL, b'1', 4, 72, 57),
(3707, 'collaborator1', '2024-06-26 15:51:24.766715', '', NULL, NULL, b'1', 5, 72, 57),
(3708, 'collaborator1', '2024-06-26 15:51:24.769754', '', NULL, NULL, b'1', 6, 72, 57),
(3709, 'collaborator1', '2024-06-26 15:51:24.771770', '', NULL, NULL, b'1', 1, 73, 57),
(3710, 'collaborator1', '2024-06-26 15:51:24.773816', '', NULL, NULL, b'1', 2, 73, 57),
(3711, 'collaborator1', '2024-06-26 15:51:24.775826', '', NULL, NULL, b'1', 3, 73, 57),
(3712, 'collaborator1', '2024-06-26 15:51:24.778978', '', NULL, NULL, b'1', 4, 73, 57),
(3713, 'collaborator1', '2024-06-26 15:51:24.781826', '', NULL, NULL, b'1', 5, 73, 57),
(3714, 'collaborator1', '2024-06-26 15:51:24.783842', '', NULL, NULL, b'1', 6, 73, 57),
(3715, 'collaborator1', '2024-06-26 15:51:24.786830', '', NULL, NULL, b'1', 1, 74, 57),
(3716, 'collaborator1', '2024-06-26 15:51:24.788978', '', NULL, NULL, b'1', 2, 74, 57),
(3717, 'collaborator1', '2024-06-26 15:51:24.790827', '', NULL, NULL, b'1', 3, 74, 57),
(3718, 'collaborator1', '2024-06-26 15:51:24.793832', '', NULL, NULL, b'1', 4, 74, 57),
(3719, 'collaborator1', '2024-06-26 15:51:24.795979', '', NULL, NULL, b'1', 5, 74, 57),
(3720, 'collaborator1', '2024-06-26 15:51:24.797827', '', NULL, NULL, b'1', 6, 74, 57),
(3721, 'collaborator1', '2024-06-26 15:51:24.799976', '', NULL, NULL, b'1', 1, 75, 57),
(3722, 'collaborator1', '2024-06-26 15:51:24.802827', '', NULL, NULL, b'1', 2, 75, 57),
(3723, 'collaborator1', '2024-06-26 15:51:24.804978', '', NULL, NULL, b'1', 3, 75, 57),
(3724, 'collaborator1', '2024-06-26 15:51:24.806978', '', NULL, NULL, b'1', 4, 75, 57),
(3725, 'collaborator1', '2024-06-26 15:51:24.808912', '', NULL, NULL, b'1', 5, 75, 57),
(3726, 'collaborator1', '2024-06-26 15:51:24.811984', '', NULL, NULL, b'1', 6, 75, 57),
(3727, 'collaborator1', '2024-06-26 15:51:24.814826', '', NULL, NULL, b'1', 1, 76, 57),
(3728, 'collaborator1', '2024-06-26 15:51:24.816877', '', NULL, NULL, b'1', 2, 76, 57),
(3729, 'collaborator1', '2024-06-26 15:51:24.819828', '', NULL, NULL, b'1', 3, 76, 57),
(3730, 'collaborator1', '2024-06-26 15:51:24.821977', '', NULL, NULL, b'1', 4, 76, 57),
(3731, 'collaborator1', '2024-06-26 15:51:24.823977', '', NULL, NULL, b'1', 5, 76, 57),
(3732, 'collaborator1', '2024-06-26 15:51:24.826828', '', NULL, NULL, b'1', 6, 76, 57),
(3733, 'collaborator1', '2024-06-26 15:51:24.828982', '', NULL, NULL, b'1', 1, 77, 57),
(3734, 'collaborator1', '2024-06-26 15:51:24.831826', '', NULL, NULL, b'1', 2, 77, 57),
(3735, 'collaborator1', '2024-06-26 15:51:24.833830', '', NULL, NULL, b'1', 3, 77, 57),
(3736, 'collaborator1', '2024-06-26 15:51:24.836828', '', NULL, NULL, b'1', 4, 77, 57),
(3737, 'collaborator1', '2024-06-26 15:51:24.838883', '', NULL, NULL, b'1', 5, 77, 57),
(3738, 'collaborator1', '2024-06-26 15:51:24.840976', '', NULL, NULL, b'1', 6, 77, 57),
(3739, 'collaborator1', '2024-06-26 15:51:24.843446', '', NULL, NULL, b'1', 1, 78, 57),
(3740, 'collaborator1', '2024-06-26 15:51:24.845572', '', NULL, NULL, b'1', 2, 78, 57),
(3741, 'collaborator1', '2024-06-26 15:51:24.847449', '', NULL, NULL, b'1', 3, 78, 57),
(3742, 'collaborator1', '2024-06-26 15:51:24.849573', '', NULL, NULL, b'1', 4, 78, 57),
(3743, 'collaborator1', '2024-06-26 15:51:24.852562', '', NULL, NULL, b'1', 5, 78, 57),
(3744, 'collaborator1', '2024-06-26 15:51:24.854573', '', NULL, NULL, b'1', 6, 78, 57),
(3745, 'collaborator1', '2024-06-26 15:51:30.616355', '', NULL, NULL, b'1', 1, 1, 58),
(3746, 'collaborator1', '2024-06-26 15:51:30.619353', '', NULL, NULL, b'1', 2, 1, 58),
(3747, 'collaborator1', '2024-06-26 15:51:30.621352', '', NULL, NULL, b'1', 3, 1, 58),
(3748, 'collaborator1', '2024-06-26 15:51:30.625374', '', NULL, NULL, b'1', 4, 1, 58),
(3749, 'collaborator1', '2024-06-26 15:51:30.628352', '', NULL, NULL, b'1', 5, 1, 58),
(3750, 'collaborator1', '2024-06-26 15:51:30.630399', '', NULL, NULL, b'1', 6, 1, 58),
(3751, 'collaborator1', '2024-06-26 15:51:30.633358', '', NULL, NULL, b'1', 1, 2, 58),
(3752, 'collaborator1', '2024-06-26 15:51:30.636357', '', NULL, NULL, b'1', 2, 2, 58),
(3753, 'collaborator1', '2024-06-26 15:51:30.638359', '', NULL, NULL, b'1', 3, 2, 58),
(3754, 'collaborator1', '2024-06-26 15:51:30.641362', '', NULL, NULL, b'1', 4, 2, 58),
(3755, 'collaborator1', '2024-06-26 15:51:30.644393', '', NULL, NULL, b'1', 5, 2, 58),
(3756, 'collaborator1', '2024-06-26 15:51:30.646394', '', NULL, NULL, b'1', 6, 2, 58),
(3757, 'collaborator1', '2024-06-26 15:51:30.649356', '', NULL, NULL, b'1', 1, 3, 58),
(3758, 'collaborator1', '2024-06-26 15:51:30.652355', '', NULL, NULL, b'1', 2, 3, 58),
(3759, 'collaborator1', '2024-06-26 15:51:30.654352', '', NULL, NULL, b'1', 3, 3, 58),
(3760, 'collaborator1', '2024-06-26 15:51:30.657368', '', NULL, NULL, b'1', 4, 3, 58),
(3761, 'collaborator1', '2024-06-26 15:51:30.661353', '', NULL, NULL, b'1', 5, 3, 58),
(3762, 'collaborator1', '2024-06-26 15:51:30.663353', '', NULL, NULL, b'1', 6, 3, 58),
(3763, 'collaborator1', '2024-06-26 15:51:30.666359', '', NULL, NULL, b'1', 1, 4, 58),
(3764, 'collaborator1', '2024-06-26 15:51:30.670355', '', NULL, NULL, b'1', 2, 4, 58),
(3765, 'collaborator1', '2024-06-26 15:51:30.672352', '', NULL, NULL, b'1', 3, 4, 58),
(3766, 'collaborator1', '2024-06-26 15:51:30.675434', '', NULL, NULL, b'1', 4, 4, 58),
(3767, 'collaborator1', '2024-06-26 15:51:30.678352', '', NULL, NULL, b'1', 5, 4, 58),
(3768, 'collaborator1', '2024-06-26 15:51:30.680396', '', NULL, NULL, b'1', 6, 4, 58),
(3769, 'collaborator1', '2024-06-26 15:51:30.683425', '', NULL, NULL, b'1', 1, 5, 58),
(3770, 'collaborator1', '2024-06-26 15:51:30.686357', '', NULL, NULL, b'1', 2, 5, 58),
(3771, 'collaborator1', '2024-06-26 15:51:30.688394', '', NULL, NULL, b'1', 3, 5, 58),
(3772, 'collaborator1', '2024-06-26 15:51:30.690371', '', NULL, NULL, b'1', 4, 5, 58),
(3773, 'collaborator1', '2024-06-26 15:51:30.694393', '', NULL, NULL, b'1', 5, 5, 58),
(3774, 'collaborator1', '2024-06-26 15:51:30.696353', '', NULL, NULL, b'1', 6, 5, 58),
(3775, 'collaborator1', '2024-06-26 15:51:30.699355', '', NULL, NULL, b'1', 1, 6, 58),
(3776, 'collaborator1', '2024-06-26 15:51:30.702354', '', NULL, NULL, b'1', 2, 6, 58),
(3777, 'collaborator1', '2024-06-26 15:51:30.704396', '', NULL, NULL, b'1', 3, 6, 58),
(3778, 'collaborator1', '2024-06-26 15:51:30.707356', '', NULL, NULL, b'1', 4, 6, 58),
(3779, 'collaborator1', '2024-06-26 15:51:30.710355', '', NULL, NULL, b'1', 5, 6, 58),
(3780, 'collaborator1', '2024-06-26 15:51:30.712355', '', NULL, NULL, b'1', 6, 6, 58),
(3781, 'collaborator1', '2024-06-26 15:51:30.715369', '', NULL, NULL, b'1', 1, 7, 58),
(3782, 'collaborator1', '2024-06-26 15:51:30.718357', '', NULL, NULL, b'1', 2, 7, 58),
(3783, 'collaborator1', '2024-06-26 15:51:30.720356', '', NULL, NULL, b'1', 3, 7, 58),
(3784, 'collaborator1', '2024-06-26 15:51:30.722357', '', NULL, NULL, b'1', 4, 7, 58);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(3785, 'collaborator1', '2024-06-26 15:51:30.725399', '', NULL, NULL, b'1', 5, 7, 58),
(3786, 'collaborator1', '2024-06-26 15:51:30.727354', '', NULL, NULL, b'1', 6, 7, 58),
(3787, 'collaborator1', '2024-06-26 15:51:30.730356', '', NULL, NULL, b'1', 1, 8, 58),
(3788, 'collaborator1', '2024-06-26 15:51:30.733422', '', NULL, NULL, b'1', 2, 8, 58),
(3789, 'collaborator1', '2024-06-26 15:51:30.735392', '', NULL, NULL, b'1', 3, 8, 58),
(3790, 'collaborator1', '2024-06-26 15:51:30.737395', '', NULL, NULL, b'1', 4, 8, 58),
(3791, 'collaborator1', '2024-06-26 15:51:30.740364', '', NULL, NULL, b'1', 5, 8, 58),
(3792, 'collaborator1', '2024-06-26 15:51:30.743353', '', NULL, NULL, b'1', 6, 8, 58),
(3793, 'collaborator1', '2024-06-26 15:51:30.746354', '', NULL, NULL, b'1', 1, 9, 58),
(3794, 'collaborator1', '2024-06-26 15:51:30.748372', '', NULL, NULL, b'1', 2, 9, 58),
(3795, 'collaborator1', '2024-06-26 15:51:30.751393', '', NULL, NULL, b'1', 3, 9, 58),
(3796, 'collaborator1', '2024-06-26 15:51:30.753395', '', NULL, NULL, b'1', 4, 9, 58),
(3797, 'collaborator1', '2024-06-26 15:51:30.755399', '', NULL, NULL, b'1', 5, 9, 58),
(3798, 'collaborator1', '2024-06-26 15:51:30.759354', '', NULL, NULL, b'1', 6, 9, 58),
(3799, 'collaborator1', '2024-06-26 15:51:30.761391', '', NULL, NULL, b'1', 1, 10, 58),
(3800, 'collaborator1', '2024-06-26 15:51:30.763392', '', NULL, NULL, b'1', 2, 10, 58),
(3801, 'collaborator1', '2024-06-26 15:51:30.766360', '', NULL, NULL, b'1', 3, 10, 58),
(3802, 'collaborator1', '2024-06-26 15:51:30.769354', '', NULL, NULL, b'1', 4, 10, 58),
(3803, 'collaborator1', '2024-06-26 15:51:30.771355', '', NULL, NULL, b'1', 5, 10, 58),
(3804, 'collaborator1', '2024-06-26 15:51:30.773370', '', NULL, NULL, b'1', 6, 10, 58),
(3805, 'collaborator1', '2024-06-26 15:51:30.776357', '', NULL, NULL, b'1', 1, 11, 58),
(3806, 'collaborator1', '2024-06-26 15:51:30.779356', '', NULL, NULL, b'1', 2, 11, 58),
(3807, 'collaborator1', '2024-06-26 15:51:30.781354', '', NULL, NULL, b'1', 3, 11, 58),
(3808, 'collaborator1', '2024-06-26 15:51:30.784392', '', NULL, NULL, b'1', 4, 11, 58),
(3809, 'collaborator1', '2024-06-26 15:51:30.787529', '', NULL, NULL, b'1', 5, 11, 58),
(3810, 'collaborator1', '2024-06-26 15:51:30.790357', '', NULL, NULL, b'1', 6, 11, 58),
(3811, 'collaborator1', '2024-06-26 15:51:30.792652', '', NULL, NULL, b'1', 1, 12, 58),
(3812, 'collaborator1', '2024-06-26 15:51:30.795552', '', NULL, NULL, b'1', 2, 12, 58),
(3813, 'collaborator1', '2024-06-26 15:51:30.798369', '', NULL, NULL, b'1', 3, 12, 58),
(3814, 'collaborator1', '2024-06-26 15:51:30.801395', '', NULL, NULL, b'1', 4, 12, 58),
(3815, 'collaborator1', '2024-06-26 15:51:30.803640', '', NULL, NULL, b'1', 5, 12, 58),
(3816, 'collaborator1', '2024-06-26 15:51:30.806355', '', NULL, NULL, b'1', 6, 12, 58),
(3817, 'collaborator1', '2024-06-26 15:51:30.809355', '', NULL, NULL, b'1', 1, 13, 58),
(3818, 'collaborator1', '2024-06-26 15:51:30.811353', '', NULL, NULL, b'1', 2, 13, 58),
(3819, 'collaborator1', '2024-06-26 15:51:30.813682', '', NULL, NULL, b'1', 3, 13, 58),
(3820, 'collaborator1', '2024-06-26 15:51:30.817359', '', NULL, NULL, b'1', 4, 13, 58),
(3821, 'collaborator1', '2024-06-26 15:51:30.819661', '', NULL, NULL, b'1', 5, 13, 58),
(3822, 'collaborator1', '2024-06-26 15:51:30.822356', '', NULL, NULL, b'1', 6, 13, 58),
(3823, 'collaborator1', '2024-06-26 15:51:30.825551', '', NULL, NULL, b'1', 1, 14, 58),
(3824, 'collaborator1', '2024-06-26 15:51:30.827609', '', NULL, NULL, b'1', 2, 14, 58),
(3825, 'collaborator1', '2024-06-26 15:51:30.830640', '', NULL, NULL, b'1', 3, 14, 58),
(3826, 'collaborator1', '2024-06-26 15:51:30.833662', '', NULL, NULL, b'1', 4, 14, 58),
(3827, 'collaborator1', '2024-06-26 15:51:30.836355', '', NULL, NULL, b'1', 5, 14, 58),
(3828, 'collaborator1', '2024-06-26 15:51:30.838409', '', NULL, NULL, b'1', 6, 14, 58),
(3829, 'collaborator1', '2024-06-26 15:51:30.841354', '', NULL, NULL, b'1', 1, 15, 58),
(3830, 'collaborator1', '2024-06-26 15:51:30.843702', '', NULL, NULL, b'1', 2, 15, 58),
(3831, 'collaborator1', '2024-06-26 15:51:30.846649', '', NULL, NULL, b'1', 3, 15, 58),
(3832, 'collaborator1', '2024-06-26 15:51:30.849535', '', NULL, NULL, b'1', 4, 15, 58),
(3833, 'collaborator1', '2024-06-26 15:51:30.851663', '', NULL, NULL, b'1', 5, 15, 58),
(3834, 'collaborator1', '2024-06-26 15:51:30.854353', '', NULL, NULL, b'1', 6, 15, 58),
(3835, 'collaborator1', '2024-06-26 15:51:30.856353', '', NULL, NULL, b'1', 1, 16, 58),
(3836, 'collaborator1', '2024-06-26 15:51:30.859572', '', NULL, NULL, b'1', 2, 16, 58),
(3837, 'collaborator1', '2024-06-26 15:51:30.862454', '', NULL, NULL, b'1', 3, 16, 58),
(3838, 'collaborator1', '2024-06-26 15:51:30.864357', '', NULL, NULL, b'1', 4, 16, 58),
(3839, 'collaborator1', '2024-06-26 15:51:30.867399', '', NULL, NULL, b'1', 5, 16, 58),
(3840, 'collaborator1', '2024-06-26 15:51:30.870356', '', NULL, NULL, b'1', 6, 16, 58),
(3841, 'collaborator1', '2024-06-26 15:51:30.872353', '', NULL, NULL, b'1', 1, 17, 58),
(3842, 'collaborator1', '2024-06-26 15:51:30.875713', '', NULL, NULL, b'1', 2, 17, 58),
(3843, 'collaborator1', '2024-06-26 15:51:30.878601', '', NULL, NULL, b'1', 3, 17, 58),
(3844, 'collaborator1', '2024-06-26 15:51:30.881354', '', NULL, NULL, b'1', 4, 17, 58),
(3845, 'collaborator1', '2024-06-26 15:51:30.884397', '', NULL, NULL, b'1', 5, 17, 58),
(3846, 'collaborator1', '2024-06-26 15:51:30.886664', '', NULL, NULL, b'1', 6, 17, 58),
(3847, 'collaborator1', '2024-06-26 15:51:30.889359', '', NULL, NULL, b'1', 1, 18, 58),
(3848, 'collaborator1', '2024-06-26 15:51:30.892648', '', NULL, NULL, b'1', 2, 18, 58),
(3849, 'collaborator1', '2024-06-26 15:51:30.895483', '', NULL, NULL, b'1', 3, 18, 58),
(3850, 'collaborator1', '2024-06-26 15:51:30.898364', '', NULL, NULL, b'1', 4, 18, 58),
(3851, 'collaborator1', '2024-06-26 15:51:30.901354', '', NULL, NULL, b'1', 5, 18, 58),
(3852, 'collaborator1', '2024-06-26 15:51:30.903355', '', NULL, NULL, b'1', 6, 18, 58),
(3853, 'collaborator1', '2024-06-26 15:51:30.905356', '', NULL, NULL, b'1', 1, 19, 58),
(3854, 'collaborator1', '2024-06-26 15:51:30.908354', '', NULL, NULL, b'1', 2, 19, 58),
(3855, 'collaborator1', '2024-06-26 15:51:30.910683', '', NULL, NULL, b'1', 3, 19, 58),
(3856, 'collaborator1', '2024-06-26 15:51:30.913497', '', NULL, NULL, b'1', 4, 19, 58),
(3857, 'collaborator1', '2024-06-26 15:51:30.916353', '', NULL, NULL, b'1', 5, 19, 58),
(3858, 'collaborator1', '2024-06-26 15:51:30.918540', '', NULL, NULL, b'1', 6, 19, 58),
(3859, 'collaborator1', '2024-06-26 15:51:30.921614', '', NULL, NULL, b'1', 1, 20, 58),
(3860, 'collaborator1', '2024-06-26 15:51:30.925559', '', NULL, NULL, b'1', 2, 20, 58),
(3861, 'collaborator1', '2024-06-26 15:51:30.928424', '', NULL, NULL, b'1', 3, 20, 58),
(3862, 'collaborator1', '2024-06-26 15:51:30.930526', '', NULL, NULL, b'1', 4, 20, 58),
(3863, 'collaborator1', '2024-06-26 15:51:30.933427', '', NULL, NULL, b'1', 5, 20, 58),
(3864, 'collaborator1', '2024-06-26 15:51:30.935422', '', NULL, NULL, b'1', 6, 20, 58),
(3865, 'collaborator1', '2024-06-26 15:51:30.937419', '', NULL, NULL, b'1', 1, 21, 58),
(3866, 'collaborator1', '2024-06-26 15:51:30.939425', '', NULL, NULL, b'1', 2, 21, 58),
(3867, 'collaborator1', '2024-06-26 15:51:30.942708', '', NULL, NULL, b'1', 3, 21, 58),
(3868, 'collaborator1', '2024-06-26 15:51:30.945491', '', NULL, NULL, b'1', 4, 21, 58),
(3869, 'collaborator1', '2024-06-26 15:51:30.947423', '', NULL, NULL, b'1', 5, 21, 58),
(3870, 'collaborator1', '2024-06-26 15:51:30.950421', '', NULL, NULL, b'1', 6, 21, 58),
(3871, 'collaborator1', '2024-06-26 15:51:30.953657', '', NULL, NULL, b'1', 1, 22, 58),
(3872, 'collaborator1', '2024-06-26 15:51:30.956421', '', NULL, NULL, b'1', 2, 22, 58),
(3873, 'collaborator1', '2024-06-26 15:51:30.959419', '', NULL, NULL, b'1', 3, 22, 58),
(3874, 'collaborator1', '2024-06-26 15:51:30.961486', '', NULL, NULL, b'1', 4, 22, 58),
(3875, 'collaborator1', '2024-06-26 15:51:30.964429', '', NULL, NULL, b'1', 5, 22, 58),
(3876, 'collaborator1', '2024-06-26 15:51:30.967421', '', NULL, NULL, b'1', 6, 22, 58),
(3877, 'collaborator1', '2024-06-26 15:51:30.969423', '', NULL, NULL, b'1', 1, 23, 58),
(3878, 'collaborator1', '2024-06-26 15:51:30.971423', '', NULL, NULL, b'1', 2, 23, 58),
(3879, 'collaborator1', '2024-06-26 15:51:30.974421', '', NULL, NULL, b'1', 3, 23, 58),
(3880, 'collaborator1', '2024-06-26 15:51:30.976422', '', NULL, NULL, b'1', 4, 23, 58),
(3881, 'collaborator1', '2024-06-26 15:51:30.979461', '', NULL, NULL, b'1', 5, 23, 58),
(3882, 'collaborator1', '2024-06-26 15:51:30.982436', '', NULL, NULL, b'1', 6, 23, 58),
(3883, 'collaborator1', '2024-06-26 15:51:30.985604', '', NULL, NULL, b'1', 1, 24, 58),
(3884, 'collaborator1', '2024-06-26 15:51:30.987421', '', NULL, NULL, b'1', 2, 24, 58),
(3885, 'collaborator1', '2024-06-26 15:51:30.990425', '', NULL, NULL, b'1', 3, 24, 58),
(3886, 'collaborator1', '2024-06-26 15:51:30.993421', '', NULL, NULL, b'1', 4, 24, 58),
(3887, 'collaborator1', '2024-06-26 15:51:30.995656', '', NULL, NULL, b'1', 5, 24, 58),
(3888, 'collaborator1', '2024-06-26 15:51:30.997420', '', NULL, NULL, b'1', 6, 24, 58),
(3889, 'collaborator1', '2024-06-26 15:51:31.000420', '', NULL, NULL, b'1', 1, 25, 58),
(3890, 'collaborator1', '2024-06-26 15:51:31.002779', '', NULL, NULL, b'1', 2, 25, 58),
(3891, 'collaborator1', '2024-06-26 15:51:31.005422', '', NULL, NULL, b'1', 3, 25, 58),
(3892, 'collaborator1', '2024-06-26 15:51:31.008422', '', NULL, NULL, b'1', 4, 25, 58),
(3893, 'collaborator1', '2024-06-26 15:51:31.010802', '', NULL, NULL, b'1', 5, 25, 58),
(3894, 'collaborator1', '2024-06-26 15:51:31.013420', '', NULL, NULL, b'1', 6, 25, 58),
(3895, 'collaborator1', '2024-06-26 15:51:31.015471', '', NULL, NULL, b'1', 1, 26, 58),
(3896, 'collaborator1', '2024-06-26 15:51:31.018421', '', NULL, NULL, b'1', 2, 26, 58),
(3897, 'collaborator1', '2024-06-26 15:51:31.020607', '', NULL, NULL, b'1', 3, 26, 58),
(3898, 'collaborator1', '2024-06-26 15:51:31.022422', '', NULL, NULL, b'1', 4, 26, 58),
(3899, 'collaborator1', '2024-06-26 15:51:31.025421', '', NULL, NULL, b'1', 5, 26, 58),
(3900, 'collaborator1', '2024-06-26 15:51:31.027421', '', NULL, NULL, b'1', 6, 26, 58),
(3901, 'collaborator1', '2024-06-26 15:51:31.029419', '', NULL, NULL, b'1', 1, 27, 58),
(3902, 'collaborator1', '2024-06-26 15:51:31.032430', '', NULL, NULL, b'1', 2, 27, 58),
(3903, 'collaborator1', '2024-06-26 15:51:31.035421', '', NULL, NULL, b'1', 3, 27, 58),
(3904, 'collaborator1', '2024-06-26 15:51:31.037420', '', NULL, NULL, b'1', 4, 27, 58),
(3905, 'collaborator1', '2024-06-26 15:51:31.039420', '', NULL, NULL, b'1', 5, 27, 58),
(3906, 'collaborator1', '2024-06-26 15:51:31.042786', '', NULL, NULL, b'1', 6, 27, 58),
(3907, 'collaborator1', '2024-06-26 15:51:31.045422', '', NULL, NULL, b'1', 1, 28, 58),
(3908, 'collaborator1', '2024-06-26 15:51:31.047423', '', NULL, NULL, b'1', 2, 28, 58),
(3909, 'collaborator1', '2024-06-26 15:51:31.050446', '', NULL, NULL, b'1', 3, 28, 58),
(3910, 'collaborator1', '2024-06-26 15:51:31.052739', '', NULL, NULL, b'1', 4, 28, 58),
(3911, 'collaborator1', '2024-06-26 15:51:31.055502', '', NULL, NULL, b'1', 5, 28, 58),
(3912, 'collaborator1', '2024-06-26 15:51:31.058734', '', NULL, NULL, b'1', 6, 28, 58),
(3913, 'collaborator1', '2024-06-26 15:51:31.061545', '', NULL, NULL, b'1', 1, 29, 58),
(3914, 'collaborator1', '2024-06-26 15:51:31.064426', '', NULL, NULL, b'1', 2, 29, 58),
(3915, 'collaborator1', '2024-06-26 15:51:31.066741', '', NULL, NULL, b'1', 3, 29, 58),
(3916, 'collaborator1', '2024-06-26 15:51:31.069639', '', NULL, NULL, b'1', 4, 29, 58),
(3917, 'collaborator1', '2024-06-26 15:51:31.072427', '', NULL, NULL, b'1', 5, 29, 58),
(3918, 'collaborator1', '2024-06-26 15:51:31.075544', '', NULL, NULL, b'1', 6, 29, 58),
(3919, 'collaborator1', '2024-06-26 15:51:31.077425', '', NULL, NULL, b'1', 1, 30, 58),
(3920, 'collaborator1', '2024-06-26 15:51:31.080509', '', NULL, NULL, b'1', 2, 30, 58),
(3921, 'collaborator1', '2024-06-26 15:51:31.083420', '', NULL, NULL, b'1', 3, 30, 58),
(3922, 'collaborator1', '2024-06-26 15:51:31.085421', '', NULL, NULL, b'1', 4, 30, 58),
(3923, 'collaborator1', '2024-06-26 15:51:31.087422', '', NULL, NULL, b'1', 5, 30, 58),
(3924, 'collaborator1', '2024-06-26 15:51:31.089424', '', NULL, NULL, b'1', 6, 30, 58),
(3925, 'collaborator1', '2024-06-26 15:51:31.092691', '', NULL, NULL, b'1', 1, 31, 58),
(3926, 'collaborator1', '2024-06-26 15:51:31.094696', '', NULL, NULL, b'1', 2, 31, 58),
(3927, 'collaborator1', '2024-06-26 15:51:31.096659', '', NULL, NULL, b'1', 3, 31, 58),
(3928, 'collaborator1', '2024-06-26 15:51:31.099429', '', NULL, NULL, b'1', 4, 31, 58),
(3929, 'collaborator1', '2024-06-26 15:51:31.101459', '', NULL, NULL, b'1', 5, 31, 58),
(3930, 'collaborator1', '2024-06-26 15:51:31.103460', '', NULL, NULL, b'1', 6, 31, 58),
(3931, 'collaborator1', '2024-06-26 15:51:31.105423', '', NULL, NULL, b'1', 1, 32, 58),
(3932, 'collaborator1', '2024-06-26 15:51:31.108729', '', NULL, NULL, b'1', 2, 32, 58),
(3933, 'collaborator1', '2024-06-26 15:51:31.111647', '', NULL, NULL, b'1', 3, 32, 58),
(3934, 'collaborator1', '2024-06-26 15:51:31.114425', '', NULL, NULL, b'1', 4, 32, 58),
(3935, 'collaborator1', '2024-06-26 15:51:31.117419', '', NULL, NULL, b'1', 5, 32, 58),
(3936, 'collaborator1', '2024-06-26 15:51:31.120421', '', NULL, NULL, b'1', 6, 32, 58),
(3937, 'collaborator1', '2024-06-26 15:51:31.123424', '', NULL, NULL, b'1', 1, 33, 58),
(3938, 'collaborator1', '2024-06-26 15:51:31.125422', '', NULL, NULL, b'1', 2, 33, 58),
(3939, 'collaborator1', '2024-06-26 15:51:31.127424', '', NULL, NULL, b'1', 3, 33, 58),
(3940, 'collaborator1', '2024-06-26 15:51:31.130424', '', NULL, NULL, b'1', 4, 33, 58),
(3941, 'collaborator1', '2024-06-26 15:51:31.133421', '', NULL, NULL, b'1', 5, 33, 58),
(3942, 'collaborator1', '2024-06-26 15:51:31.135461', '', NULL, NULL, b'1', 6, 33, 58),
(3943, 'collaborator1', '2024-06-26 15:51:31.138632', '', NULL, NULL, b'1', 1, 34, 58),
(3944, 'collaborator1', '2024-06-26 15:51:31.141645', '', NULL, NULL, b'1', 2, 34, 58),
(3945, 'collaborator1', '2024-06-26 15:51:31.143682', '', NULL, NULL, b'1', 3, 34, 58),
(3946, 'collaborator1', '2024-06-26 15:51:31.145683', '', NULL, NULL, b'1', 4, 34, 58),
(3947, 'collaborator1', '2024-06-26 15:51:31.147648', '', NULL, NULL, b'1', 5, 34, 58),
(3948, 'collaborator1', '2024-06-26 15:51:31.151003', '', NULL, NULL, b'1', 6, 34, 58),
(3949, 'collaborator1', '2024-06-26 15:51:31.153777', '', NULL, NULL, b'1', 1, 35, 58),
(3950, 'collaborator1', '2024-06-26 15:51:31.156646', '', NULL, NULL, b'1', 2, 35, 58),
(3951, 'collaborator1', '2024-06-26 15:51:31.159735', '', NULL, NULL, b'1', 3, 35, 58),
(3952, 'collaborator1', '2024-06-26 15:51:31.161958', '', NULL, NULL, b'1', 4, 35, 58),
(3953, 'collaborator1', '2024-06-26 15:51:31.164698', '', NULL, NULL, b'1', 5, 35, 58),
(3954, 'collaborator1', '2024-06-26 15:51:31.167649', '', NULL, NULL, b'1', 6, 35, 58),
(3955, 'collaborator1', '2024-06-26 15:51:31.169945', '', NULL, NULL, b'1', 1, 36, 58),
(3956, 'collaborator1', '2024-06-26 15:51:31.172645', '', NULL, NULL, b'1', 2, 36, 58),
(3957, 'collaborator1', '2024-06-26 15:51:31.175689', '', NULL, NULL, b'1', 3, 36, 58),
(3958, 'collaborator1', '2024-06-26 15:51:31.177685', '', NULL, NULL, b'1', 4, 36, 58),
(3959, 'collaborator1', '2024-06-26 15:51:31.179984', '', NULL, NULL, b'1', 5, 36, 58),
(3960, 'collaborator1', '2024-06-26 15:51:31.195643', '', NULL, NULL, b'1', 6, 36, 58),
(3961, 'collaborator1', '2024-06-26 15:51:31.198676', '', NULL, NULL, b'1', 1, 37, 58),
(3962, 'collaborator1', '2024-06-26 15:51:31.200964', '', NULL, NULL, b'1', 2, 37, 58),
(3963, 'collaborator1', '2024-06-26 15:51:31.203915', '', NULL, NULL, b'1', 3, 37, 58),
(3964, 'collaborator1', '2024-06-26 15:51:31.206647', '', NULL, NULL, b'1', 4, 37, 58),
(3965, 'collaborator1', '2024-06-26 15:51:31.208963', '', NULL, NULL, b'1', 5, 37, 58),
(3966, 'collaborator1', '2024-06-26 15:51:31.211784', '', NULL, NULL, b'1', 6, 37, 58),
(3967, 'collaborator1', '2024-06-26 15:51:31.214656', '', NULL, NULL, b'1', 1, 38, 58),
(3968, 'collaborator1', '2024-06-26 15:51:31.216977', '', NULL, NULL, b'1', 2, 38, 58),
(3969, 'collaborator1', '2024-06-26 15:51:31.220020', '', NULL, NULL, b'1', 3, 38, 58),
(3970, 'collaborator1', '2024-06-26 15:51:31.222646', '', NULL, NULL, b'1', 4, 38, 58),
(3971, 'collaborator1', '2024-06-26 15:51:31.225645', '', NULL, NULL, b'1', 5, 38, 58),
(3972, 'collaborator1', '2024-06-26 15:51:31.227678', '', NULL, NULL, b'1', 6, 38, 58),
(3973, 'collaborator1', '2024-06-26 15:51:31.229960', '', NULL, NULL, b'1', 1, 39, 58),
(3974, 'collaborator1', '2024-06-26 15:51:31.232653', '', NULL, NULL, b'1', 2, 39, 58),
(3975, 'collaborator1', '2024-06-26 15:51:31.234961', '', NULL, NULL, b'1', 3, 39, 58),
(3976, 'collaborator1', '2024-06-26 15:51:31.237651', '', NULL, NULL, b'1', 4, 39, 58),
(3977, 'collaborator1', '2024-06-26 15:51:31.240649', '', NULL, NULL, b'1', 5, 39, 58),
(3978, 'collaborator1', '2024-06-26 15:51:31.242805', '', NULL, NULL, b'1', 6, 39, 58),
(3979, 'collaborator1', '2024-06-26 15:51:31.245650', '', NULL, NULL, b'1', 1, 40, 58),
(3980, 'collaborator1', '2024-06-26 15:51:31.247648', '', NULL, NULL, b'1', 2, 40, 58),
(3981, 'collaborator1', '2024-06-26 15:51:31.251008', '', NULL, NULL, b'1', 3, 40, 58),
(3982, 'collaborator1', '2024-06-26 15:51:31.253911', '', NULL, NULL, b'1', 4, 40, 58),
(3983, 'collaborator1', '2024-06-26 15:51:31.256648', '', NULL, NULL, b'1', 5, 40, 58),
(3984, 'collaborator1', '2024-06-26 15:51:31.258886', '', NULL, NULL, b'1', 6, 40, 58),
(3985, 'collaborator1', '2024-06-26 15:51:31.261767', '', NULL, NULL, b'1', 1, 41, 58),
(3986, 'collaborator1', '2024-06-26 15:51:31.263644', '', NULL, NULL, b'1', 2, 41, 58),
(3987, 'collaborator1', '2024-06-26 15:51:31.266952', '', NULL, NULL, b'1', 3, 41, 58),
(3988, 'collaborator1', '2024-06-26 15:51:31.269797', '', NULL, NULL, b'1', 4, 41, 58),
(3989, 'collaborator1', '2024-06-26 15:51:31.272646', '', NULL, NULL, b'1', 5, 41, 58),
(3990, 'collaborator1', '2024-06-26 15:51:31.274954', '', NULL, NULL, b'1', 6, 41, 58),
(3991, 'collaborator1', '2024-06-26 15:51:31.277649', '', NULL, NULL, b'1', 1, 42, 58),
(3992, 'collaborator1', '2024-06-26 15:51:31.280648', '', NULL, NULL, b'1', 2, 42, 58),
(3993, 'collaborator1', '2024-06-26 15:51:31.283645', '', NULL, NULL, b'1', 3, 42, 58),
(3994, 'collaborator1', '2024-06-26 15:51:31.285643', '', NULL, NULL, b'1', 4, 42, 58),
(3995, 'collaborator1', '2024-06-26 15:51:31.287643', '', NULL, NULL, b'1', 5, 42, 58),
(3996, 'collaborator1', '2024-06-26 15:51:31.290650', '', NULL, NULL, b'1', 6, 42, 58),
(3997, 'collaborator1', '2024-06-26 15:51:31.292647', '', NULL, NULL, b'1', 1, 43, 58),
(3998, 'collaborator1', '2024-06-26 15:51:31.295644', '', NULL, NULL, b'1', 2, 43, 58),
(3999, 'collaborator1', '2024-06-26 15:51:31.297643', '', NULL, NULL, b'1', 3, 43, 58),
(4000, 'collaborator1', '2024-06-26 15:51:31.299645', '', NULL, NULL, b'1', 4, 43, 58),
(4001, 'collaborator1', '2024-06-26 15:51:31.303644', '', NULL, NULL, b'1', 5, 43, 58),
(4002, 'collaborator1', '2024-06-26 15:51:31.305644', '', NULL, NULL, b'1', 6, 43, 58),
(4003, 'collaborator1', '2024-06-26 15:51:31.308654', '', NULL, NULL, b'1', 1, 44, 58),
(4004, 'collaborator1', '2024-06-26 15:51:31.311795', '', NULL, NULL, b'1', 2, 44, 58),
(4005, 'collaborator1', '2024-06-26 15:51:31.314656', '', NULL, NULL, b'1', 3, 44, 58),
(4006, 'collaborator1', '2024-06-26 15:51:31.317645', '', NULL, NULL, b'1', 4, 44, 58),
(4007, 'collaborator1', '2024-06-26 15:51:31.320019', '', NULL, NULL, b'1', 5, 44, 58),
(4008, 'collaborator1', '2024-06-26 15:51:31.322643', '', NULL, NULL, b'1', 6, 44, 58),
(4009, 'collaborator1', '2024-06-26 15:51:31.325645', '', NULL, NULL, b'1', 1, 45, 58),
(4010, 'collaborator1', '2024-06-26 15:51:31.327645', '', NULL, NULL, b'1', 2, 45, 58),
(4011, 'collaborator1', '2024-06-26 15:51:31.329769', '', NULL, NULL, b'1', 3, 45, 58),
(4012, 'collaborator1', '2024-06-26 15:51:31.332644', '', NULL, NULL, b'1', 4, 45, 58),
(4013, 'collaborator1', '2024-06-26 15:51:31.335644', '', NULL, NULL, b'1', 5, 45, 58),
(4014, 'collaborator1', '2024-06-26 15:51:31.337645', '', NULL, NULL, b'1', 6, 45, 58),
(4015, 'collaborator1', '2024-06-26 15:51:31.339701', '', NULL, NULL, b'1', 1, 46, 58),
(4016, 'collaborator1', '2024-06-26 15:51:31.342645', '', NULL, NULL, b'1', 2, 46, 58),
(4017, 'collaborator1', '2024-06-26 15:51:31.345653', '', NULL, NULL, b'1', 3, 46, 58),
(4018, 'collaborator1', '2024-06-26 15:51:31.348659', '', NULL, NULL, b'1', 4, 46, 58),
(4019, 'collaborator1', '2024-06-26 15:51:31.350836', '', NULL, NULL, b'1', 5, 46, 58),
(4020, 'collaborator1', '2024-06-26 15:51:31.352642', '', NULL, NULL, b'1', 6, 46, 58),
(4021, 'collaborator1', '2024-06-26 15:51:31.355644', '', NULL, NULL, b'1', 1, 47, 58),
(4022, 'collaborator1', '2024-06-26 15:51:31.358645', '', NULL, NULL, b'1', 2, 47, 58),
(4023, 'collaborator1', '2024-06-26 15:51:31.360991', '', NULL, NULL, b'1', 3, 47, 58),
(4024, 'collaborator1', '2024-06-26 15:51:31.363649', '', NULL, NULL, b'1', 4, 47, 58),
(4025, 'collaborator1', '2024-06-26 15:51:31.366646', '', NULL, NULL, b'1', 5, 47, 58),
(4026, 'collaborator1', '2024-06-26 15:51:31.368642', '', NULL, NULL, b'1', 6, 47, 58),
(4027, 'collaborator1', '2024-06-26 15:51:31.371644', '', NULL, NULL, b'1', 1, 48, 58),
(4028, 'collaborator1', '2024-06-26 15:51:31.373647', '', NULL, NULL, b'1', 2, 48, 58),
(4029, 'collaborator1', '2024-06-26 15:51:31.376646', '', NULL, NULL, b'1', 3, 48, 58),
(4030, 'collaborator1', '2024-06-26 15:51:31.378952', '', NULL, NULL, b'1', 4, 48, 58),
(4031, 'collaborator1', '2024-06-26 15:51:31.381643', '', NULL, NULL, b'1', 5, 48, 58),
(4032, 'collaborator1', '2024-06-26 15:51:31.383644', '', NULL, NULL, b'1', 6, 48, 58),
(4033, 'collaborator1', '2024-06-26 15:51:31.385644', '', NULL, NULL, b'1', 1, 49, 58),
(4034, 'collaborator1', '2024-06-26 15:51:31.388646', '', NULL, NULL, b'1', 2, 49, 58),
(4035, 'collaborator1', '2024-06-26 15:51:31.391650', '', NULL, NULL, b'1', 3, 49, 58),
(4036, 'collaborator1', '2024-06-26 15:51:31.393689', '', NULL, NULL, b'1', 4, 49, 58),
(4037, 'collaborator1', '2024-06-26 15:51:31.395642', '', NULL, NULL, b'1', 5, 49, 58),
(4038, 'collaborator1', '2024-06-26 15:51:31.398643', '', NULL, NULL, b'1', 6, 49, 58),
(4039, 'collaborator1', '2024-06-26 15:51:31.401660', '', NULL, NULL, b'1', 1, 50, 58),
(4040, 'collaborator1', '2024-06-26 15:51:31.403642', '', NULL, NULL, b'1', 2, 50, 58),
(4041, 'collaborator1', '2024-06-26 15:51:31.406663', '', NULL, NULL, b'1', 3, 50, 58),
(4042, 'collaborator1', '2024-06-26 15:51:31.409645', '', NULL, NULL, b'1', 4, 50, 58),
(4043, 'collaborator1', '2024-06-26 15:51:31.412786', '', NULL, NULL, b'1', 5, 50, 58),
(4044, 'collaborator1', '2024-06-26 15:51:31.415645', '', NULL, NULL, b'1', 6, 50, 58),
(4045, 'collaborator1', '2024-06-26 15:51:31.419013', '', NULL, NULL, b'1', 1, 51, 58),
(4046, 'collaborator1', '2024-06-26 15:51:31.421810', '', NULL, NULL, b'1', 2, 51, 58),
(4047, 'collaborator1', '2024-06-26 15:51:31.424644', '', NULL, NULL, b'1', 3, 51, 58),
(4048, 'collaborator1', '2024-06-26 15:51:31.427646', '', NULL, NULL, b'1', 4, 51, 58),
(4049, 'collaborator1', '2024-06-26 15:51:31.429990', '', NULL, NULL, b'1', 5, 51, 58),
(4050, 'collaborator1', '2024-06-26 15:51:31.432646', '', NULL, NULL, b'1', 6, 51, 58),
(4051, 'collaborator1', '2024-06-26 15:51:31.434977', '', NULL, NULL, b'1', 1, 52, 58),
(4052, 'collaborator1', '2024-06-26 15:51:31.437642', '', NULL, NULL, b'1', 2, 52, 58),
(4053, 'collaborator1', '2024-06-26 15:51:31.439654', '', NULL, NULL, b'1', 3, 52, 58),
(4054, 'collaborator1', '2024-06-26 15:51:31.442811', '', NULL, NULL, b'1', 4, 52, 58),
(4055, 'collaborator1', '2024-06-26 15:51:31.445651', '', NULL, NULL, b'1', 5, 52, 58),
(4056, 'collaborator1', '2024-06-26 15:51:31.447647', '', NULL, NULL, b'1', 6, 52, 58),
(4057, 'collaborator1', '2024-06-26 15:51:31.450909', '', NULL, NULL, b'1', 1, 53, 58),
(4058, 'collaborator1', '2024-06-26 15:51:31.453650', '', NULL, NULL, b'1', 2, 53, 58),
(4059, 'collaborator1', '2024-06-26 15:51:31.455645', '', NULL, NULL, b'1', 3, 53, 58),
(4060, 'collaborator1', '2024-06-26 15:51:31.458645', '', NULL, NULL, b'1', 4, 53, 58),
(4061, 'collaborator1', '2024-06-26 15:51:31.461001', '', NULL, NULL, b'1', 5, 53, 58),
(4062, 'collaborator1', '2024-06-26 15:51:31.463686', '', NULL, NULL, b'1', 6, 53, 58),
(4063, 'collaborator1', '2024-06-26 15:51:31.466649', '', NULL, NULL, b'1', 1, 54, 58),
(4064, 'collaborator1', '2024-06-26 15:51:31.468965', '', NULL, NULL, b'1', 2, 54, 58),
(4065, 'collaborator1', '2024-06-26 15:51:31.471650', '', NULL, NULL, b'1', 3, 54, 58),
(4066, 'collaborator1', '2024-06-26 15:51:31.474647', '', NULL, NULL, b'1', 4, 54, 58),
(4067, 'collaborator1', '2024-06-26 15:51:31.476881', '', NULL, NULL, b'1', 5, 54, 58),
(4068, 'collaborator1', '2024-06-26 15:51:31.479642', '', NULL, NULL, b'1', 6, 54, 58),
(4069, 'collaborator1', '2024-06-26 15:51:31.481644', '', NULL, NULL, b'1', 1, 55, 58),
(4070, 'collaborator1', '2024-06-26 15:51:31.484649', '', NULL, NULL, b'1', 2, 55, 58),
(4071, 'collaborator1', '2024-06-26 15:51:31.486643', '', NULL, NULL, b'1', 3, 55, 58),
(4072, 'collaborator1', '2024-06-26 15:51:31.489657', '', NULL, NULL, b'1', 4, 55, 58),
(4073, 'collaborator1', '2024-06-26 15:51:31.491646', '', NULL, NULL, b'1', 5, 55, 58),
(4074, 'collaborator1', '2024-06-26 15:51:31.494646', '', NULL, NULL, b'1', 6, 55, 58),
(4075, 'collaborator1', '2024-06-26 15:51:31.496641', '', NULL, NULL, b'1', 1, 56, 58),
(4076, 'collaborator1', '2024-06-26 15:51:31.498674', '', NULL, NULL, b'1', 2, 56, 58),
(4077, 'collaborator1', '2024-06-26 15:51:31.501643', '', NULL, NULL, b'1', 3, 56, 58),
(4078, 'collaborator1', '2024-06-26 15:51:31.503674', '', NULL, NULL, b'1', 4, 56, 58),
(4079, 'collaborator1', '2024-06-26 15:51:31.505674', '', NULL, NULL, b'1', 5, 56, 58),
(4080, 'collaborator1', '2024-06-26 15:51:31.508644', '', NULL, NULL, b'1', 6, 56, 58),
(4081, 'collaborator1', '2024-06-26 15:51:31.511664', '', NULL, NULL, b'1', 1, 57, 58),
(4082, 'collaborator1', '2024-06-26 15:51:31.514661', '', NULL, NULL, b'1', 2, 57, 58),
(4083, 'collaborator1', '2024-06-26 15:51:31.517643', '', NULL, NULL, b'1', 3, 57, 58),
(4084, 'collaborator1', '2024-06-26 15:51:31.519652', '', NULL, NULL, b'1', 4, 57, 58),
(4085, 'collaborator1', '2024-06-26 15:51:31.522646', '', NULL, NULL, b'1', 5, 57, 58),
(4086, 'collaborator1', '2024-06-26 15:51:31.524644', '', NULL, NULL, b'1', 6, 57, 58),
(4087, 'collaborator1', '2024-06-26 15:51:31.527666', '', NULL, NULL, b'1', 1, 58, 58),
(4088, 'collaborator1', '2024-06-26 15:51:31.531652', '', NULL, NULL, b'1', 2, 58, 58),
(4089, 'collaborator1', '2024-06-26 15:51:31.534776', '', NULL, NULL, b'1', 3, 58, 58),
(4090, 'collaborator1', '2024-06-26 15:51:31.536642', '', NULL, NULL, b'1', 4, 58, 58),
(4091, 'collaborator1', '2024-06-26 15:51:31.539659', '', NULL, NULL, b'1', 5, 58, 58),
(4092, 'collaborator1', '2024-06-26 15:51:31.542648', '', NULL, NULL, b'1', 6, 58, 58),
(4093, 'collaborator1', '2024-06-26 15:51:31.544646', '', NULL, NULL, b'1', 1, 59, 58),
(4094, 'collaborator1', '2024-06-26 15:51:31.546647', '', NULL, NULL, b'1', 2, 59, 58),
(4095, 'collaborator1', '2024-06-26 15:51:31.549649', '', NULL, NULL, b'1', 3, 59, 58),
(4096, 'collaborator1', '2024-06-26 15:51:31.551643', '', NULL, NULL, b'1', 4, 59, 58),
(4097, 'collaborator1', '2024-06-26 15:51:31.553700', '', NULL, NULL, b'1', 5, 59, 58),
(4098, 'collaborator1', '2024-06-26 15:51:31.556657', '', NULL, NULL, b'1', 6, 59, 58),
(4099, 'collaborator1', '2024-06-26 15:51:31.559643', '', NULL, NULL, b'1', 1, 60, 58),
(4100, 'collaborator1', '2024-06-26 15:51:31.561644', '', NULL, NULL, b'1', 2, 60, 58),
(4101, 'collaborator1', '2024-06-26 15:51:31.563643', '', NULL, NULL, b'1', 3, 60, 58),
(4102, 'collaborator1', '2024-06-26 15:51:31.566647', '', NULL, NULL, b'1', 4, 60, 58),
(4103, 'collaborator1', '2024-06-26 15:51:31.569644', '', NULL, NULL, b'1', 5, 60, 58),
(4104, 'collaborator1', '2024-06-26 15:51:31.571642', '', NULL, NULL, b'1', 6, 60, 58),
(4105, 'collaborator1', '2024-06-26 15:51:31.573644', '', NULL, NULL, b'1', 1, 61, 58),
(4106, 'collaborator1', '2024-06-26 15:51:31.576919', '', NULL, NULL, b'1', 2, 61, 58),
(4107, 'collaborator1', '2024-06-26 15:51:31.579642', '', NULL, NULL, b'1', 3, 61, 58),
(4108, 'collaborator1', '2024-06-26 15:51:31.581644', '', NULL, NULL, b'1', 4, 61, 58),
(4109, 'collaborator1', '2024-06-26 15:51:31.583645', '', NULL, NULL, b'1', 5, 61, 58),
(4110, 'collaborator1', '2024-06-26 15:51:31.585644', '', NULL, NULL, b'1', 6, 61, 58),
(4111, 'collaborator1', '2024-06-26 15:51:31.587685', '', NULL, NULL, b'1', 1, 62, 58),
(4112, 'collaborator1', '2024-06-26 15:51:31.590644', '', NULL, NULL, b'1', 2, 62, 58),
(4113, 'collaborator1', '2024-06-26 15:51:31.592647', '', NULL, NULL, b'1', 3, 62, 58),
(4114, 'collaborator1', '2024-06-26 15:51:31.596762', '', NULL, NULL, b'1', 4, 62, 58),
(4115, 'collaborator1', '2024-06-26 15:51:31.599644', '', NULL, NULL, b'1', 5, 62, 58),
(4116, 'collaborator1', '2024-06-26 15:51:31.603731', '', NULL, NULL, b'1', 6, 62, 58),
(4117, 'collaborator1', '2024-06-26 15:51:31.606653', '', NULL, NULL, b'1', 1, 63, 58),
(4118, 'collaborator1', '2024-06-26 15:51:31.609920', '', NULL, NULL, b'1', 2, 63, 58),
(4119, 'collaborator1', '2024-06-26 15:51:31.612738', '', NULL, NULL, b'1', 3, 63, 58),
(4120, 'collaborator1', '2024-06-26 15:51:31.615647', '', NULL, NULL, b'1', 4, 63, 58),
(4121, 'collaborator1', '2024-06-26 15:51:31.617696', '', NULL, NULL, b'1', 5, 63, 58),
(4122, 'collaborator1', '2024-06-26 15:51:31.619951', '', NULL, NULL, b'1', 6, 63, 58),
(4123, 'collaborator1', '2024-06-26 15:51:31.622648', '', NULL, NULL, b'1', 1, 64, 58),
(4124, 'collaborator1', '2024-06-26 15:51:31.624645', '', NULL, NULL, b'1', 2, 64, 58),
(4125, 'collaborator1', '2024-06-26 15:51:31.627645', '', NULL, NULL, b'1', 3, 64, 58),
(4126, 'collaborator1', '2024-06-26 15:51:31.629646', '', NULL, NULL, b'1', 4, 64, 58),
(4127, 'collaborator1', '2024-06-26 15:51:31.632644', '', NULL, NULL, b'1', 5, 64, 58),
(4128, 'collaborator1', '2024-06-26 15:51:31.635642', '', NULL, NULL, b'1', 6, 64, 58),
(4129, 'collaborator1', '2024-06-26 15:51:31.637643', '', NULL, NULL, b'1', 1, 65, 58),
(4130, 'collaborator1', '2024-06-26 15:51:31.639655', '', NULL, NULL, b'1', 2, 65, 58),
(4131, 'collaborator1', '2024-06-26 15:51:31.642645', '', NULL, NULL, b'1', 3, 65, 58),
(4132, 'collaborator1', '2024-06-26 15:51:31.645955', '', NULL, NULL, b'1', 4, 65, 58),
(4133, 'collaborator1', '2024-06-26 15:51:31.648662', '', NULL, NULL, b'1', 5, 65, 58),
(4134, 'collaborator1', '2024-06-26 15:51:31.651651', '', NULL, NULL, b'1', 6, 65, 58),
(4135, 'collaborator1', '2024-06-26 15:51:31.654000', '', NULL, NULL, b'1', 1, 66, 58),
(4136, 'collaborator1', '2024-06-26 15:51:31.667648', '', NULL, NULL, b'1', 2, 66, 58),
(4137, 'collaborator1', '2024-06-26 15:51:31.680645', '', NULL, NULL, b'1', 3, 66, 58),
(4138, 'collaborator1', '2024-06-26 15:51:31.683665', '', NULL, NULL, b'1', 4, 66, 58),
(4139, 'collaborator1', '2024-06-26 15:51:31.685682', '', NULL, NULL, b'1', 5, 66, 58),
(4140, 'collaborator1', '2024-06-26 15:51:31.688647', '', NULL, NULL, b'1', 6, 66, 58),
(4141, 'collaborator1', '2024-06-26 15:51:31.691650', '', NULL, NULL, b'1', 1, 67, 58),
(4142, 'collaborator1', '2024-06-26 15:51:31.693991', '', NULL, NULL, b'1', 2, 67, 58),
(4143, 'collaborator1', '2024-06-26 15:51:31.696779', '', NULL, NULL, b'1', 3, 67, 58),
(4144, 'collaborator1', '2024-06-26 15:51:31.699647', '', NULL, NULL, b'1', 4, 67, 58),
(4145, 'collaborator1', '2024-06-26 15:51:31.702800', '', NULL, NULL, b'1', 5, 67, 58),
(4146, 'collaborator1', '2024-06-26 15:51:31.705646', '', NULL, NULL, b'1', 6, 67, 58),
(4147, 'collaborator1', '2024-06-26 15:51:31.707649', '', NULL, NULL, b'1', 1, 68, 58),
(4148, 'collaborator1', '2024-06-26 15:51:31.710645', '', NULL, NULL, b'1', 2, 68, 58),
(4149, 'collaborator1', '2024-06-26 15:51:31.712646', '', NULL, NULL, b'1', 3, 68, 58),
(4150, 'collaborator1', '2024-06-26 15:51:31.714644', '', NULL, NULL, b'1', 4, 68, 58),
(4151, 'collaborator1', '2024-06-26 15:51:31.717703', '', NULL, NULL, b'1', 5, 68, 58),
(4152, 'collaborator1', '2024-06-26 15:51:31.719949', '', NULL, NULL, b'1', 6, 68, 58),
(4153, 'collaborator1', '2024-06-26 15:51:31.722652', '', NULL, NULL, b'1', 1, 69, 58),
(4154, 'collaborator1', '2024-06-26 15:51:31.724855', '', NULL, NULL, b'1', 2, 69, 58),
(4155, 'collaborator1', '2024-06-26 15:51:31.727688', '', NULL, NULL, b'1', 3, 69, 58),
(4156, 'collaborator1', '2024-06-26 15:51:31.729952', '', NULL, NULL, b'1', 4, 69, 58),
(4157, 'collaborator1', '2024-06-26 15:51:31.732649', '', NULL, NULL, b'1', 5, 69, 58),
(4158, 'collaborator1', '2024-06-26 15:51:31.735823', '', NULL, NULL, b'1', 6, 69, 58),
(4159, 'collaborator1', '2024-06-26 15:51:31.738647', '', NULL, NULL, b'1', 1, 70, 58),
(4160, 'collaborator1', '2024-06-26 15:51:31.741658', '', NULL, NULL, b'1', 2, 70, 58),
(4161, 'collaborator1', '2024-06-26 15:51:31.743965', '', NULL, NULL, b'1', 3, 70, 58),
(4162, 'collaborator1', '2024-06-26 15:51:31.746753', '', NULL, NULL, b'1', 4, 70, 58),
(4163, 'collaborator1', '2024-06-26 15:51:31.749647', '', NULL, NULL, b'1', 5, 70, 58),
(4164, 'collaborator1', '2024-06-26 15:51:31.752796', '', NULL, NULL, b'1', 6, 70, 58),
(4165, 'collaborator1', '2024-06-26 15:51:31.754957', '', NULL, NULL, b'1', 1, 71, 58),
(4166, 'collaborator1', '2024-06-26 15:51:31.757643', '', NULL, NULL, b'1', 2, 71, 58),
(4167, 'collaborator1', '2024-06-26 15:51:31.759645', '', NULL, NULL, b'1', 3, 71, 58),
(4168, 'collaborator1', '2024-06-26 15:51:31.763648', '', NULL, NULL, b'1', 4, 71, 58),
(4169, 'collaborator1', '2024-06-26 15:51:31.766873', '', NULL, NULL, b'1', 5, 71, 58),
(4170, 'collaborator1', '2024-06-26 15:51:31.769910', '', NULL, NULL, b'1', 6, 71, 58),
(4171, 'collaborator1', '2024-06-26 15:51:31.772666', '', NULL, NULL, b'1', 1, 72, 58),
(4172, 'collaborator1', '2024-06-26 15:51:31.775756', '', NULL, NULL, b'1', 2, 72, 58),
(4173, 'collaborator1', '2024-06-26 15:51:31.778650', '', NULL, NULL, b'1', 3, 72, 58),
(4174, 'collaborator1', '2024-06-26 15:51:31.781685', '', NULL, NULL, b'1', 4, 72, 58),
(4175, 'collaborator1', '2024-06-26 15:51:31.783973', '', NULL, NULL, b'1', 5, 72, 58),
(4176, 'collaborator1', '2024-06-26 15:51:31.786655', '', NULL, NULL, b'1', 6, 72, 58),
(4177, 'collaborator1', '2024-06-26 15:51:31.788645', '', NULL, NULL, b'1', 1, 73, 58),
(4178, 'collaborator1', '2024-06-26 15:51:31.791966', '', NULL, NULL, b'1', 2, 73, 58),
(4179, 'collaborator1', '2024-06-26 15:51:31.794806', '', NULL, NULL, b'1', 3, 73, 58),
(4180, 'collaborator1', '2024-06-26 15:51:31.796645', '', NULL, NULL, b'1', 4, 73, 58),
(4181, 'collaborator1', '2024-06-26 15:51:31.799949', '', NULL, NULL, b'1', 5, 73, 58),
(4182, 'collaborator1', '2024-06-26 15:51:31.802746', '', NULL, NULL, b'1', 6, 73, 58),
(4183, 'collaborator1', '2024-06-26 15:51:31.804964', '', NULL, NULL, b'1', 1, 74, 58),
(4184, 'collaborator1', '2024-06-26 15:51:31.807645', '', NULL, NULL, b'1', 2, 74, 58),
(4185, 'collaborator1', '2024-06-26 15:51:31.810990', '', NULL, NULL, b'1', 3, 74, 58),
(4186, 'collaborator1', '2024-06-26 15:51:31.813645', '', NULL, NULL, b'1', 4, 74, 58),
(4187, 'collaborator1', '2024-06-26 15:51:31.816714', '', NULL, NULL, b'1', 5, 74, 58),
(4188, 'collaborator1', '2024-06-26 15:51:31.818943', '', NULL, NULL, b'1', 6, 74, 58),
(4189, 'collaborator1', '2024-06-26 15:51:31.821757', '', NULL, NULL, b'1', 1, 75, 58),
(4190, 'collaborator1', '2024-06-26 15:51:31.824644', '', NULL, NULL, b'1', 2, 75, 58),
(4191, 'collaborator1', '2024-06-26 15:51:31.827032', '', NULL, NULL, b'1', 3, 75, 58),
(4192, 'collaborator1', '2024-06-26 15:51:31.829819', '', NULL, NULL, b'1', 4, 75, 58),
(4193, 'collaborator1', '2024-06-26 15:51:31.832693', '', NULL, NULL, b'1', 5, 75, 58),
(4194, 'collaborator1', '2024-06-26 15:51:31.835043', '', NULL, NULL, b'1', 6, 75, 58),
(4195, 'collaborator1', '2024-06-26 15:51:31.837693', '', NULL, NULL, b'1', 1, 76, 58),
(4196, 'collaborator1', '2024-06-26 15:51:31.839698', '', NULL, NULL, b'1', 2, 76, 58),
(4197, 'collaborator1', '2024-06-26 15:51:31.842738', '', NULL, NULL, b'1', 3, 76, 58),
(4198, 'collaborator1', '2024-06-26 15:51:31.845057', '', NULL, NULL, b'1', 4, 76, 58),
(4199, 'collaborator1', '2024-06-26 15:51:31.848080', '', NULL, NULL, b'1', 5, 76, 58),
(4200, 'collaborator1', '2024-06-26 15:51:31.850406', '', NULL, NULL, b'1', 6, 76, 58),
(4201, 'collaborator1', '2024-06-26 15:51:31.853076', '', NULL, NULL, b'1', 1, 77, 58),
(4202, 'collaborator1', '2024-06-26 15:51:31.855074', '', NULL, NULL, b'1', 2, 77, 58),
(4203, 'collaborator1', '2024-06-26 15:51:31.858068', '', NULL, NULL, b'1', 3, 77, 58),
(4204, 'collaborator1', '2024-06-26 15:51:31.860383', '', NULL, NULL, b'1', 4, 77, 58),
(4205, 'collaborator1', '2024-06-26 15:51:31.862068', '', NULL, NULL, b'1', 5, 77, 58),
(4206, 'collaborator1', '2024-06-26 15:51:31.865068', '', NULL, NULL, b'1', 6, 77, 58),
(4207, 'collaborator1', '2024-06-26 15:51:31.867352', '', NULL, NULL, b'1', 1, 78, 58),
(4208, 'collaborator1', '2024-06-26 15:51:31.870364', '', NULL, NULL, b'1', 2, 78, 58),
(4209, 'collaborator1', '2024-06-26 15:51:31.872364', '', NULL, NULL, b'1', 3, 78, 58),
(4210, 'collaborator1', '2024-06-26 15:51:31.875414', '', NULL, NULL, b'1', 4, 78, 58),
(4211, 'collaborator1', '2024-06-26 15:51:31.877562', '', NULL, NULL, b'1', 5, 78, 58),
(4212, 'collaborator1', '2024-06-26 15:51:31.879629', '', NULL, NULL, b'1', 6, 78, 58),
(4213, 'collaborator1', '2024-06-26 15:51:35.549944', '', NULL, NULL, b'1', 1, 1, 59),
(4214, 'collaborator1', '2024-06-26 15:51:35.551943', '', NULL, NULL, b'1', 2, 1, 59),
(4215, 'collaborator1', '2024-06-26 15:51:35.555957', '', NULL, NULL, b'1', 3, 1, 59),
(4216, 'collaborator1', '2024-06-26 15:51:35.558945', '', NULL, NULL, b'1', 4, 1, 59),
(4217, 'collaborator1', '2024-06-26 15:51:35.561947', '', NULL, NULL, b'1', 5, 1, 59),
(4218, 'collaborator1', '2024-06-26 15:51:35.564952', '', NULL, NULL, b'1', 6, 1, 59),
(4219, 'collaborator1', '2024-06-26 15:51:35.567943', '', NULL, NULL, b'1', 1, 2, 59),
(4220, 'collaborator1', '2024-06-26 15:51:35.569946', '', NULL, NULL, b'1', 2, 2, 59),
(4221, 'collaborator1', '2024-06-26 15:51:35.574945', '', NULL, NULL, b'1', 3, 2, 59),
(4222, 'collaborator1', '2024-06-26 15:51:35.576945', '', NULL, NULL, b'1', 4, 2, 59),
(4223, 'collaborator1', '2024-06-26 15:51:35.580979', '', NULL, NULL, b'1', 5, 2, 59),
(4224, 'collaborator1', '2024-06-26 15:51:35.583945', '', NULL, NULL, b'1', 6, 2, 59),
(4225, 'collaborator1', '2024-06-26 15:51:35.586946', '', NULL, NULL, b'1', 1, 3, 59),
(4226, 'collaborator1', '2024-06-26 15:51:35.590942', '', NULL, NULL, b'1', 2, 3, 59),
(4227, 'collaborator1', '2024-06-26 15:51:35.593942', '', NULL, NULL, b'1', 3, 3, 59),
(4228, 'collaborator1', '2024-06-26 15:51:35.595957', '', NULL, NULL, b'1', 4, 3, 59),
(4229, 'collaborator1', '2024-06-26 15:51:35.600094', '', NULL, NULL, b'1', 5, 3, 59),
(4230, 'collaborator1', '2024-06-26 15:51:35.601943', '', NULL, NULL, b'1', 6, 3, 59),
(4231, 'collaborator1', '2024-06-26 15:51:35.606946', '', NULL, NULL, b'1', 1, 4, 59),
(4232, 'collaborator1', '2024-06-26 15:51:35.609097', '', NULL, NULL, b'1', 2, 4, 59),
(4233, 'collaborator1', '2024-06-26 15:51:35.611057', '', NULL, NULL, b'1', 3, 4, 59),
(4234, 'collaborator1', '2024-06-26 15:51:35.614950', '', NULL, NULL, b'1', 4, 4, 59),
(4235, 'collaborator1', '2024-06-26 15:51:35.616982', '', NULL, NULL, b'1', 5, 4, 59),
(4236, 'collaborator1', '2024-06-26 15:51:35.619944', '', NULL, NULL, b'1', 6, 4, 59),
(4237, 'collaborator1', '2024-06-26 15:51:35.622946', '', NULL, NULL, b'1', 1, 5, 59),
(4238, 'collaborator1', '2024-06-26 15:51:35.625094', '', NULL, NULL, b'1', 2, 5, 59),
(4239, 'collaborator1', '2024-06-26 15:51:35.627945', '', NULL, NULL, b'1', 3, 5, 59),
(4240, 'collaborator1', '2024-06-26 15:51:35.630950', '', NULL, NULL, b'1', 4, 5, 59),
(4241, 'collaborator1', '2024-06-26 15:51:35.633944', '', NULL, NULL, b'1', 5, 5, 59),
(4242, 'collaborator1', '2024-06-26 15:51:35.636022', '', NULL, NULL, b'1', 6, 5, 59),
(4243, 'collaborator1', '2024-06-26 15:51:35.639947', '', NULL, NULL, b'1', 1, 6, 59),
(4244, 'collaborator1', '2024-06-26 15:51:35.641943', '', NULL, NULL, b'1', 2, 6, 59),
(4245, 'collaborator1', '2024-06-26 15:51:35.644022', '', NULL, NULL, b'1', 3, 6, 59),
(4246, 'collaborator1', '2024-06-26 15:51:35.647949', '', NULL, NULL, b'1', 4, 6, 59),
(4247, 'collaborator1', '2024-06-26 15:51:35.649944', '', NULL, NULL, b'1', 5, 6, 59),
(4248, 'collaborator1', '2024-06-26 15:51:35.651943', '', NULL, NULL, b'1', 6, 6, 59),
(4249, 'collaborator1', '2024-06-26 15:51:35.656040', '', NULL, NULL, b'1', 1, 7, 59),
(4250, 'collaborator1', '2024-06-26 15:51:35.658038', '', NULL, NULL, b'1', 2, 7, 59),
(4251, 'collaborator1', '2024-06-26 15:51:35.660170', '', NULL, NULL, b'1', 3, 7, 59),
(4252, 'collaborator1', '2024-06-26 15:51:35.664110', '', NULL, NULL, b'1', 4, 7, 59),
(4253, 'collaborator1', '2024-06-26 15:51:35.666168', '', NULL, NULL, b'1', 5, 7, 59),
(4254, 'collaborator1', '2024-06-26 15:51:35.668038', '', NULL, NULL, b'1', 6, 7, 59),
(4255, 'collaborator1', '2024-06-26 15:51:35.671038', '', NULL, NULL, b'1', 1, 8, 59),
(4256, 'collaborator1', '2024-06-26 15:51:35.674209', '', NULL, NULL, b'1', 2, 8, 59),
(4257, 'collaborator1', '2024-06-26 15:51:35.676349', '', NULL, NULL, b'1', 3, 8, 59),
(4258, 'collaborator1', '2024-06-26 15:51:35.678225', '', NULL, NULL, b'1', 4, 8, 59),
(4259, 'collaborator1', '2024-06-26 15:51:35.682319', '', NULL, NULL, b'1', 5, 8, 59),
(4260, 'collaborator1', '2024-06-26 15:51:35.684352', '', NULL, NULL, b'1', 6, 8, 59),
(4261, 'collaborator1', '2024-06-26 15:51:35.687224', '', NULL, NULL, b'1', 1, 9, 59),
(4262, 'collaborator1', '2024-06-26 15:51:35.690286', '', NULL, NULL, b'1', 2, 9, 59),
(4263, 'collaborator1', '2024-06-26 15:51:35.692349', '', NULL, NULL, b'1', 3, 9, 59),
(4264, 'collaborator1', '2024-06-26 15:51:35.695236', '', NULL, NULL, b'1', 4, 9, 59),
(4265, 'collaborator1', '2024-06-26 15:51:35.698221', '', NULL, NULL, b'1', 5, 9, 59),
(4266, 'collaborator1', '2024-06-26 15:51:35.700220', '', NULL, NULL, b'1', 6, 9, 59),
(4267, 'collaborator1', '2024-06-26 15:51:35.703222', '', NULL, NULL, b'1', 1, 10, 59),
(4268, 'collaborator1', '2024-06-26 15:51:35.706223', '', NULL, NULL, b'1', 2, 10, 59),
(4269, 'collaborator1', '2024-06-26 15:51:35.709257', '', NULL, NULL, b'1', 3, 10, 59),
(4270, 'collaborator1', '2024-06-26 15:51:35.712227', '', NULL, NULL, b'1', 4, 10, 59),
(4271, 'collaborator1', '2024-06-26 15:51:35.715221', '', NULL, NULL, b'1', 5, 10, 59),
(4272, 'collaborator1', '2024-06-26 15:51:35.718220', '', NULL, NULL, b'1', 6, 10, 59),
(4273, 'collaborator1', '2024-06-26 15:51:35.720281', '', NULL, NULL, b'1', 1, 11, 59),
(4274, 'collaborator1', '2024-06-26 15:51:35.723350', '', NULL, NULL, b'1', 2, 11, 59),
(4275, 'collaborator1', '2024-06-26 15:51:35.725348', '', NULL, NULL, b'1', 3, 11, 59),
(4276, 'collaborator1', '2024-06-26 15:51:35.727364', '', NULL, NULL, b'1', 4, 11, 59),
(4277, 'collaborator1', '2024-06-26 15:51:35.731260', '', NULL, NULL, b'1', 5, 11, 59),
(4278, 'collaborator1', '2024-06-26 15:51:35.733221', '', NULL, NULL, b'1', 6, 11, 59),
(4279, 'collaborator1', '2024-06-26 15:51:35.735340', '', NULL, NULL, b'1', 1, 12, 59),
(4280, 'collaborator1', '2024-06-26 15:51:35.737224', '', NULL, NULL, b'1', 2, 12, 59),
(4281, 'collaborator1', '2024-06-26 15:51:35.740349', '', NULL, NULL, b'1', 3, 12, 59),
(4282, 'collaborator1', '2024-06-26 15:51:35.742348', '', NULL, NULL, b'1', 4, 12, 59),
(4283, 'collaborator1', '2024-06-26 15:51:35.744294', '', NULL, NULL, b'1', 5, 12, 59),
(4284, 'collaborator1', '2024-06-26 15:51:35.747360', '', NULL, NULL, b'1', 6, 12, 59),
(4285, 'collaborator1', '2024-06-26 15:51:35.750223', '', NULL, NULL, b'1', 1, 13, 59),
(4286, 'collaborator1', '2024-06-26 15:51:35.752878', '', NULL, NULL, b'1', 2, 13, 59),
(4287, 'collaborator1', '2024-06-26 15:51:35.755864', '', NULL, NULL, b'1', 3, 13, 59),
(4288, 'collaborator1', '2024-06-26 15:51:35.757863', '', NULL, NULL, b'1', 4, 13, 59),
(4289, 'collaborator1', '2024-06-26 15:51:35.759994', '', NULL, NULL, b'1', 5, 13, 59),
(4290, 'collaborator1', '2024-06-26 15:51:35.762868', '', NULL, NULL, b'1', 6, 13, 59),
(4291, 'collaborator1', '2024-06-26 15:51:35.764992', '', NULL, NULL, b'1', 1, 14, 59),
(4292, 'collaborator1', '2024-06-26 15:51:35.766991', '', NULL, NULL, b'1', 2, 14, 59),
(4293, 'collaborator1', '2024-06-26 15:51:35.769864', '', NULL, NULL, b'1', 3, 14, 59),
(4294, 'collaborator1', '2024-06-26 15:51:35.772864', '', NULL, NULL, b'1', 4, 14, 59),
(4295, 'collaborator1', '2024-06-26 15:51:35.774993', '', NULL, NULL, b'1', 5, 14, 59),
(4296, 'collaborator1', '2024-06-26 15:51:35.776862', '', NULL, NULL, b'1', 6, 14, 59),
(4297, 'collaborator1', '2024-06-26 15:51:35.778864', '', NULL, NULL, b'1', 1, 15, 59),
(4298, 'collaborator1', '2024-06-26 15:51:35.781865', '', NULL, NULL, b'1', 2, 15, 59),
(4299, 'collaborator1', '2024-06-26 15:51:35.783993', '', NULL, NULL, b'1', 3, 15, 59),
(4300, 'collaborator1', '2024-06-26 15:51:35.785933', '', NULL, NULL, b'1', 4, 15, 59),
(4301, 'collaborator1', '2024-06-26 15:51:35.788991', '', NULL, NULL, b'1', 5, 15, 59),
(4302, 'collaborator1', '2024-06-26 15:51:35.790996', '', NULL, NULL, b'1', 6, 15, 59),
(4303, 'collaborator1', '2024-06-26 15:51:35.793878', '', NULL, NULL, b'1', 1, 16, 59),
(4304, 'collaborator1', '2024-06-26 15:51:35.795864', '', NULL, NULL, b'1', 2, 16, 59),
(4305, 'collaborator1', '2024-06-26 15:51:35.798902', '', NULL, NULL, b'1', 3, 16, 59),
(4306, 'collaborator1', '2024-06-26 15:51:35.800991', '', NULL, NULL, b'1', 4, 16, 59),
(4307, 'collaborator1', '2024-06-26 15:51:35.803869', '', NULL, NULL, b'1', 5, 16, 59),
(4308, 'collaborator1', '2024-06-26 15:51:35.805994', '', NULL, NULL, b'1', 6, 16, 59),
(4309, 'collaborator1', '2024-06-26 15:51:35.807864', '', NULL, NULL, b'1', 1, 17, 59),
(4310, 'collaborator1', '2024-06-26 15:51:35.810865', '', NULL, NULL, b'1', 2, 17, 59),
(4311, 'collaborator1', '2024-06-26 15:51:35.813866', '', NULL, NULL, b'1', 3, 17, 59),
(4312, 'collaborator1', '2024-06-26 15:51:35.815901', '', NULL, NULL, b'1', 4, 17, 59),
(4313, 'collaborator1', '2024-06-26 15:51:35.817864', '', NULL, NULL, b'1', 5, 17, 59),
(4314, 'collaborator1', '2024-06-26 15:51:35.820904', '', NULL, NULL, b'1', 6, 17, 59),
(4315, 'collaborator1', '2024-06-26 15:51:35.823866', '', NULL, NULL, b'1', 1, 18, 59),
(4316, 'collaborator1', '2024-06-26 15:51:35.825994', '', NULL, NULL, b'1', 2, 18, 59),
(4317, 'collaborator1', '2024-06-26 15:51:35.827867', '', NULL, NULL, b'1', 3, 18, 59),
(4318, 'collaborator1', '2024-06-26 15:51:35.830907', '', NULL, NULL, b'1', 4, 18, 59),
(4319, 'collaborator1', '2024-06-26 15:51:35.832863', '', NULL, NULL, b'1', 5, 18, 59),
(4320, 'collaborator1', '2024-06-26 15:51:35.834862', '', NULL, NULL, b'1', 6, 18, 59),
(4321, 'collaborator1', '2024-06-26 15:51:35.846985', '', NULL, NULL, b'1', 1, 19, 59),
(4322, 'collaborator1', '2024-06-26 15:51:35.849866', '', NULL, NULL, b'1', 2, 19, 59),
(4323, 'collaborator1', '2024-06-26 15:51:35.851984', '', NULL, NULL, b'1', 3, 19, 59),
(4324, 'collaborator1', '2024-06-26 15:51:35.854987', '', NULL, NULL, b'1', 4, 19, 59),
(4325, 'collaborator1', '2024-06-26 15:51:35.856862', '', NULL, NULL, b'1', 5, 19, 59),
(4326, 'collaborator1', '2024-06-26 15:51:35.858863', '', NULL, NULL, b'1', 6, 19, 59),
(4327, 'collaborator1', '2024-06-26 15:51:35.861873', '', NULL, NULL, b'1', 1, 20, 59),
(4328, 'collaborator1', '2024-06-26 15:51:35.863984', '', NULL, NULL, b'1', 2, 20, 59),
(4329, 'collaborator1', '2024-06-26 15:51:35.865863', '', NULL, NULL, b'1', 3, 20, 59),
(4330, 'collaborator1', '2024-06-26 15:51:35.868976', '', NULL, NULL, b'1', 4, 20, 59),
(4331, 'collaborator1', '2024-06-26 15:51:35.871863', '', NULL, NULL, b'1', 5, 20, 59),
(4332, 'collaborator1', '2024-06-26 15:51:35.874866', '', NULL, NULL, b'1', 6, 20, 59),
(4333, 'collaborator1', '2024-06-26 15:51:35.876863', '', NULL, NULL, b'1', 1, 21, 59),
(4334, 'collaborator1', '2024-06-26 15:51:35.878875', '', NULL, NULL, b'1', 2, 21, 59),
(4335, 'collaborator1', '2024-06-26 15:51:35.881865', '', NULL, NULL, b'1', 3, 21, 59),
(4336, 'collaborator1', '2024-06-26 15:51:35.883961', '', NULL, NULL, b'1', 4, 21, 59),
(4337, 'collaborator1', '2024-06-26 15:51:35.885863', '', NULL, NULL, b'1', 5, 21, 59),
(4338, 'collaborator1', '2024-06-26 15:51:35.889862', '', NULL, NULL, b'1', 6, 21, 59),
(4339, 'collaborator1', '2024-06-26 15:51:35.892013', '', NULL, NULL, b'1', 1, 22, 59),
(4340, 'collaborator1', '2024-06-26 15:51:35.894012', '', NULL, NULL, b'1', 2, 22, 59),
(4341, 'collaborator1', '2024-06-26 15:51:35.897866', '', NULL, NULL, b'1', 3, 22, 59),
(4342, 'collaborator1', '2024-06-26 15:51:35.899983', '', NULL, NULL, b'1', 4, 22, 59),
(4343, 'collaborator1', '2024-06-26 15:51:35.901872', '', NULL, NULL, b'1', 5, 22, 59),
(4344, 'collaborator1', '2024-06-26 15:51:35.904865', '', NULL, NULL, b'1', 6, 22, 59),
(4345, 'collaborator1', '2024-06-26 15:51:35.907001', '', NULL, NULL, b'1', 1, 23, 59),
(4346, 'collaborator1', '2024-06-26 15:51:35.909862', '', NULL, NULL, b'1', 2, 23, 59),
(4347, 'collaborator1', '2024-06-26 15:51:35.911887', '', NULL, NULL, b'1', 3, 23, 59),
(4348, 'collaborator1', '2024-06-26 15:51:35.915002', '', NULL, NULL, b'1', 4, 23, 59),
(4349, 'collaborator1', '2024-06-26 15:51:35.917865', '', NULL, NULL, b'1', 5, 23, 59),
(4350, 'collaborator1', '2024-06-26 15:51:35.919865', '', NULL, NULL, b'1', 6, 23, 59),
(4351, 'collaborator1', '2024-06-26 15:51:35.922865', '', NULL, NULL, b'1', 1, 24, 59),
(4352, 'collaborator1', '2024-06-26 15:51:35.924862', '', NULL, NULL, b'1', 2, 24, 59),
(4353, 'collaborator1', '2024-06-26 15:51:35.926944', '', NULL, NULL, b'1', 3, 24, 59),
(4354, 'collaborator1', '2024-06-26 15:51:35.930863', '', NULL, NULL, b'1', 4, 24, 59),
(4355, 'collaborator1', '2024-06-26 15:51:35.932864', '', NULL, NULL, b'1', 5, 24, 59),
(4356, 'collaborator1', '2024-06-26 15:51:35.934959', '', NULL, NULL, b'1', 6, 24, 59),
(4357, 'collaborator1', '2024-06-26 15:51:35.937882', '', NULL, NULL, b'1', 1, 25, 59),
(4358, 'collaborator1', '2024-06-26 15:51:35.939864', '', NULL, NULL, b'1', 2, 25, 59),
(4359, 'collaborator1', '2024-06-26 15:51:35.941863', '', NULL, NULL, b'1', 3, 25, 59),
(4360, 'collaborator1', '2024-06-26 15:51:35.944864', '', NULL, NULL, b'1', 4, 25, 59),
(4361, 'collaborator1', '2024-06-26 15:51:35.947863', '', NULL, NULL, b'1', 5, 25, 59),
(4362, 'collaborator1', '2024-06-26 15:51:35.950865', '', NULL, NULL, b'1', 6, 25, 59),
(4363, 'collaborator1', '2024-06-26 15:51:35.952863', '', NULL, NULL, b'1', 1, 26, 59),
(4364, 'collaborator1', '2024-06-26 15:51:35.956003', '', NULL, NULL, b'1', 2, 26, 59);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(4365, 'collaborator1', '2024-06-26 15:51:35.957863', '', NULL, NULL, b'1', 3, 26, 59),
(4366, 'collaborator1', '2024-06-26 15:51:35.960863', '', NULL, NULL, b'1', 4, 26, 59),
(4367, 'collaborator1', '2024-06-26 15:51:35.963905', '', NULL, NULL, b'1', 5, 26, 59),
(4368, 'collaborator1', '2024-06-26 15:51:35.966004', '', NULL, NULL, b'1', 6, 26, 59),
(4369, 'collaborator1', '2024-06-26 15:51:35.967863', '', NULL, NULL, b'1', 1, 27, 59),
(4370, 'collaborator1', '2024-06-26 15:51:35.970871', '', NULL, NULL, b'1', 2, 27, 59),
(4371, 'collaborator1', '2024-06-26 15:51:35.972863', '', NULL, NULL, b'1', 3, 27, 59),
(4372, 'collaborator1', '2024-06-26 15:51:35.974991', '', NULL, NULL, b'1', 4, 27, 59),
(4373, 'collaborator1', '2024-06-26 15:51:35.977864', '', NULL, NULL, b'1', 5, 27, 59),
(4374, 'collaborator1', '2024-06-26 15:51:35.980862', '', NULL, NULL, b'1', 6, 27, 59),
(4375, 'collaborator1', '2024-06-26 15:51:35.982862', '', NULL, NULL, b'1', 1, 28, 59),
(4376, 'collaborator1', '2024-06-26 15:51:35.984992', '', NULL, NULL, b'1', 2, 28, 59),
(4377, 'collaborator1', '2024-06-26 15:51:35.987863', '', NULL, NULL, b'1', 3, 28, 59),
(4378, 'collaborator1', '2024-06-26 15:51:35.989992', '', NULL, NULL, b'1', 4, 28, 59),
(4379, 'collaborator1', '2024-06-26 15:51:35.991991', '', NULL, NULL, b'1', 5, 28, 59),
(4380, 'collaborator1', '2024-06-26 15:51:35.994873', '', NULL, NULL, b'1', 6, 28, 59),
(4381, 'collaborator1', '2024-06-26 15:51:35.996864', '', NULL, NULL, b'1', 1, 29, 59),
(4382, 'collaborator1', '2024-06-26 15:51:35.999990', '', NULL, NULL, b'1', 2, 29, 59),
(4383, 'collaborator1', '2024-06-26 15:51:36.001993', '', NULL, NULL, b'1', 3, 29, 59),
(4384, 'collaborator1', '2024-06-26 15:51:36.004867', '', NULL, NULL, b'1', 4, 29, 59),
(4385, 'collaborator1', '2024-06-26 15:51:36.006992', '', NULL, NULL, b'1', 5, 29, 59),
(4386, 'collaborator1', '2024-06-26 15:51:36.008993', '', NULL, NULL, b'1', 6, 29, 59),
(4387, 'collaborator1', '2024-06-26 15:51:36.011866', '', NULL, NULL, b'1', 1, 30, 59),
(4388, 'collaborator1', '2024-06-26 15:51:36.013993', '', NULL, NULL, b'1', 2, 30, 59),
(4389, 'collaborator1', '2024-06-26 15:51:36.015992', '', NULL, NULL, b'1', 3, 30, 59),
(4390, 'collaborator1', '2024-06-26 15:51:36.017864', '', NULL, NULL, b'1', 4, 30, 59),
(4391, 'collaborator1', '2024-06-26 15:51:36.020910', '', NULL, NULL, b'1', 5, 30, 59),
(4392, 'collaborator1', '2024-06-26 15:51:36.023864', '', NULL, NULL, b'1', 6, 30, 59),
(4393, 'collaborator1', '2024-06-26 15:51:36.025973', '', NULL, NULL, b'1', 1, 31, 59),
(4394, 'collaborator1', '2024-06-26 15:51:36.028874', '', NULL, NULL, b'1', 2, 31, 59),
(4395, 'collaborator1', '2024-06-26 15:51:36.030991', '', NULL, NULL, b'1', 3, 31, 59),
(4396, 'collaborator1', '2024-06-26 15:51:36.032862', '', NULL, NULL, b'1', 4, 31, 59),
(4397, 'collaborator1', '2024-06-26 15:51:36.034984', '', NULL, NULL, b'1', 5, 31, 59),
(4398, 'collaborator1', '2024-06-26 15:51:36.037864', '', NULL, NULL, b'1', 6, 31, 59),
(4399, 'collaborator1', '2024-06-26 15:51:36.039992', '', NULL, NULL, b'1', 1, 32, 59),
(4400, 'collaborator1', '2024-06-26 15:51:36.042863', '', NULL, NULL, b'1', 2, 32, 59),
(4401, 'collaborator1', '2024-06-26 15:51:36.044880', '', NULL, NULL, b'1', 3, 32, 59),
(4402, 'collaborator1', '2024-06-26 15:51:36.047863', '', NULL, NULL, b'1', 4, 32, 59),
(4403, 'collaborator1', '2024-06-26 15:51:36.049986', '', NULL, NULL, b'1', 5, 32, 59),
(4404, 'collaborator1', '2024-06-26 15:51:36.051986', '', NULL, NULL, b'1', 6, 32, 59),
(4405, 'collaborator1', '2024-06-26 15:51:36.054866', '', NULL, NULL, b'1', 1, 33, 59),
(4406, 'collaborator1', '2024-06-26 15:51:36.056991', '', NULL, NULL, b'1', 2, 33, 59),
(4407, 'collaborator1', '2024-06-26 15:51:36.058996', '', NULL, NULL, b'1', 3, 33, 59),
(4408, 'collaborator1', '2024-06-26 15:51:36.061865', '', NULL, NULL, b'1', 4, 33, 59),
(4409, 'collaborator1', '2024-06-26 15:51:36.063993', '', NULL, NULL, b'1', 5, 33, 59),
(4410, 'collaborator1', '2024-06-26 15:51:36.065994', '', NULL, NULL, b'1', 6, 33, 59),
(4411, 'collaborator1', '2024-06-26 15:51:36.068991', '', NULL, NULL, b'1', 1, 34, 59),
(4412, 'collaborator1', '2024-06-26 15:51:36.071877', '', NULL, NULL, b'1', 2, 34, 59),
(4413, 'collaborator1', '2024-06-26 15:51:36.073991', '', NULL, NULL, b'1', 3, 34, 59),
(4414, 'collaborator1', '2024-06-26 15:51:36.075991', '', NULL, NULL, b'1', 4, 34, 59),
(4415, 'collaborator1', '2024-06-26 15:51:36.078869', '', NULL, NULL, b'1', 5, 34, 59),
(4416, 'collaborator1', '2024-06-26 15:51:36.080992', '', NULL, NULL, b'1', 6, 34, 59),
(4417, 'collaborator1', '2024-06-26 15:51:36.082863', '', NULL, NULL, b'1', 1, 35, 59),
(4418, 'collaborator1', '2024-06-26 15:51:36.084992', '', NULL, NULL, b'1', 2, 35, 59),
(4419, 'collaborator1', '2024-06-26 15:51:36.087863', '', NULL, NULL, b'1', 3, 35, 59),
(4420, 'collaborator1', '2024-06-26 15:51:36.089992', '', NULL, NULL, b'1', 4, 35, 59),
(4421, 'collaborator1', '2024-06-26 15:51:36.091992', '', NULL, NULL, b'1', 5, 35, 59),
(4422, 'collaborator1', '2024-06-26 15:51:36.093993', '', NULL, NULL, b'1', 6, 35, 59),
(4423, 'collaborator1', '2024-06-26 15:51:36.096991', '', NULL, NULL, b'1', 1, 36, 59),
(4424, 'collaborator1', '2024-06-26 15:51:36.098994', '', NULL, NULL, b'1', 2, 36, 59),
(4425, 'collaborator1', '2024-06-26 15:51:36.100995', '', NULL, NULL, b'1', 3, 36, 59),
(4426, 'collaborator1', '2024-06-26 15:51:36.103881', '', NULL, NULL, b'1', 4, 36, 59),
(4427, 'collaborator1', '2024-06-26 15:51:36.105993', '', NULL, NULL, b'1', 5, 36, 59),
(4428, 'collaborator1', '2024-06-26 15:51:36.107863', '', NULL, NULL, b'1', 6, 36, 59),
(4429, 'collaborator1', '2024-06-26 15:51:36.110869', '', NULL, NULL, b'1', 1, 37, 59),
(4430, 'collaborator1', '2024-06-26 15:51:36.113867', '', NULL, NULL, b'1', 2, 37, 59),
(4431, 'collaborator1', '2024-06-26 15:51:36.115994', '', NULL, NULL, b'1', 3, 37, 59),
(4432, 'collaborator1', '2024-06-26 15:51:36.117863', '', NULL, NULL, b'1', 4, 37, 59),
(4433, 'collaborator1', '2024-06-26 15:51:36.120863', '', NULL, NULL, b'1', 5, 37, 59),
(4434, 'collaborator1', '2024-06-26 15:51:36.122863', '', NULL, NULL, b'1', 6, 37, 59),
(4435, 'collaborator1', '2024-06-26 15:51:36.124993', '', NULL, NULL, b'1', 1, 38, 59),
(4436, 'collaborator1', '2024-06-26 15:51:36.126984', '', NULL, NULL, b'1', 2, 38, 59),
(4437, 'collaborator1', '2024-06-26 15:51:36.129864', '', NULL, NULL, b'1', 3, 38, 59),
(4438, 'collaborator1', '2024-06-26 15:51:36.131867', '', NULL, NULL, b'1', 4, 38, 59),
(4439, 'collaborator1', '2024-06-26 15:51:36.134900', '', NULL, NULL, b'1', 5, 38, 59),
(4440, 'collaborator1', '2024-06-26 15:51:36.137868', '', NULL, NULL, b'1', 6, 38, 59),
(4441, 'collaborator1', '2024-06-26 15:51:36.139909', '', NULL, NULL, b'1', 1, 39, 59),
(4442, 'collaborator1', '2024-06-26 15:51:36.141864', '', NULL, NULL, b'1', 2, 39, 59),
(4443, 'collaborator1', '2024-06-26 15:51:36.144878', '', NULL, NULL, b'1', 3, 39, 59),
(4444, 'collaborator1', '2024-06-26 15:51:36.147864', '', NULL, NULL, b'1', 4, 39, 59),
(4445, 'collaborator1', '2024-06-26 15:51:36.149901', '', NULL, NULL, b'1', 5, 39, 59),
(4446, 'collaborator1', '2024-06-26 15:51:36.152018', '', NULL, NULL, b'1', 6, 39, 59),
(4447, 'collaborator1', '2024-06-26 15:51:36.154862', '', NULL, NULL, b'1', 1, 40, 59),
(4448, 'collaborator1', '2024-06-26 15:51:36.156862', '', NULL, NULL, b'1', 2, 40, 59),
(4449, 'collaborator1', '2024-06-26 15:51:36.159883', '', NULL, NULL, b'1', 3, 40, 59),
(4450, 'collaborator1', '2024-06-26 15:51:36.161863', '', NULL, NULL, b'1', 4, 40, 59),
(4451, 'collaborator1', '2024-06-26 15:51:36.164863', '', NULL, NULL, b'1', 5, 40, 59),
(4452, 'collaborator1', '2024-06-26 15:51:36.167002', '', NULL, NULL, b'1', 6, 40, 59),
(4453, 'collaborator1', '2024-06-26 15:51:36.169871', '', NULL, NULL, b'1', 1, 41, 59),
(4454, 'collaborator1', '2024-06-26 15:51:36.172014', '', NULL, NULL, b'1', 2, 41, 59),
(4455, 'collaborator1', '2024-06-26 15:51:36.174862', '', NULL, NULL, b'1', 3, 41, 59),
(4456, 'collaborator1', '2024-06-26 15:51:36.176866', '', NULL, NULL, b'1', 4, 41, 59),
(4457, 'collaborator1', '2024-06-26 15:51:36.178865', '', NULL, NULL, b'1', 5, 41, 59),
(4458, 'collaborator1', '2024-06-26 15:51:36.180863', '', NULL, NULL, b'1', 6, 41, 59),
(4459, 'collaborator1', '2024-06-26 15:51:36.183862', '', NULL, NULL, b'1', 1, 42, 59),
(4460, 'collaborator1', '2024-06-26 15:51:36.185864', '', NULL, NULL, b'1', 2, 42, 59),
(4461, 'collaborator1', '2024-06-26 15:51:36.189015', '', NULL, NULL, b'1', 3, 42, 59),
(4462, 'collaborator1', '2024-06-26 15:51:36.191013', '', NULL, NULL, b'1', 4, 42, 59),
(4463, 'collaborator1', '2024-06-26 15:51:36.192863', '', NULL, NULL, b'1', 5, 42, 59),
(4464, 'collaborator1', '2024-06-26 15:51:36.195864', '', NULL, NULL, b'1', 6, 42, 59),
(4465, 'collaborator1', '2024-06-26 15:51:36.197867', '', NULL, NULL, b'1', 1, 43, 59),
(4466, 'collaborator1', '2024-06-26 15:51:36.199863', '', NULL, NULL, b'1', 2, 43, 59),
(4467, 'collaborator1', '2024-06-26 15:51:36.202007', '', NULL, NULL, b'1', 3, 43, 59),
(4468, 'collaborator1', '2024-06-26 15:51:36.205014', '', NULL, NULL, b'1', 4, 43, 59),
(4469, 'collaborator1', '2024-06-26 15:51:36.206862', '', NULL, NULL, b'1', 5, 43, 59),
(4470, 'collaborator1', '2024-06-26 15:51:36.209865', '', NULL, NULL, b'1', 6, 43, 59),
(4471, 'collaborator1', '2024-06-26 15:51:36.211950', '', NULL, NULL, b'1', 1, 44, 59),
(4472, 'collaborator1', '2024-06-26 15:51:36.214960', '', NULL, NULL, b'1', 2, 44, 59),
(4473, 'collaborator1', '2024-06-26 15:51:36.217012', '', NULL, NULL, b'1', 3, 44, 59),
(4474, 'collaborator1', '2024-06-26 15:51:36.218907', '', NULL, NULL, b'1', 4, 44, 59),
(4475, 'collaborator1', '2024-06-26 15:51:36.221903', '', NULL, NULL, b'1', 5, 44, 59),
(4476, 'collaborator1', '2024-06-26 15:51:36.223901', '', NULL, NULL, b'1', 6, 44, 59),
(4477, 'collaborator1', '2024-06-26 15:51:36.225862', '', NULL, NULL, b'1', 1, 45, 59),
(4478, 'collaborator1', '2024-06-26 15:51:36.228873', '', NULL, NULL, b'1', 2, 45, 59),
(4479, 'collaborator1', '2024-06-26 15:51:36.231016', '', NULL, NULL, b'1', 3, 45, 59),
(4480, 'collaborator1', '2024-06-26 15:51:36.232862', '', NULL, NULL, b'1', 4, 45, 59),
(4481, 'collaborator1', '2024-06-26 15:51:36.234861', '', NULL, NULL, b'1', 5, 45, 59),
(4482, 'collaborator1', '2024-06-26 15:51:36.237865', '', NULL, NULL, b'1', 6, 45, 59),
(4483, 'collaborator1', '2024-06-26 15:51:36.239987', '', NULL, NULL, b'1', 1, 46, 59),
(4484, 'collaborator1', '2024-06-26 15:51:36.242013', '', NULL, NULL, b'1', 2, 46, 59),
(4485, 'collaborator1', '2024-06-26 15:51:36.244036', '', NULL, NULL, b'1', 3, 46, 59),
(4486, 'collaborator1', '2024-06-26 15:51:36.247002', '', NULL, NULL, b'1', 4, 46, 59),
(4487, 'collaborator1', '2024-06-26 15:51:36.248863', '', NULL, NULL, b'1', 5, 46, 59),
(4488, 'collaborator1', '2024-06-26 15:51:36.251863', '', NULL, NULL, b'1', 6, 46, 59),
(4489, 'collaborator1', '2024-06-26 15:51:36.253866', '', NULL, NULL, b'1', 1, 47, 59),
(4490, 'collaborator1', '2024-06-26 15:51:36.256863', '', NULL, NULL, b'1', 2, 47, 59),
(4491, 'collaborator1', '2024-06-26 15:51:36.258936', '', NULL, NULL, b'1', 3, 47, 59),
(4492, 'collaborator1', '2024-06-26 15:51:36.260937', '', NULL, NULL, b'1', 4, 47, 59),
(4493, 'collaborator1', '2024-06-26 15:51:36.263977', '', NULL, NULL, b'1', 5, 47, 59),
(4494, 'collaborator1', '2024-06-26 15:51:36.266122', '', NULL, NULL, b'1', 6, 47, 59),
(4495, 'collaborator1', '2024-06-26 15:51:36.268276', '', NULL, NULL, b'1', 1, 48, 59),
(4496, 'collaborator1', '2024-06-26 15:51:36.270135', '', NULL, NULL, b'1', 2, 48, 59),
(4497, 'collaborator1', '2024-06-26 15:51:36.273183', '', NULL, NULL, b'1', 3, 48, 59),
(4498, 'collaborator1', '2024-06-26 15:51:36.275274', '', NULL, NULL, b'1', 4, 48, 59),
(4499, 'collaborator1', '2024-06-26 15:51:36.277278', '', NULL, NULL, b'1', 5, 48, 59),
(4500, 'collaborator1', '2024-06-26 15:51:36.280273', '', NULL, NULL, b'1', 6, 48, 59),
(4501, 'collaborator1', '2024-06-26 15:51:36.282274', '', NULL, NULL, b'1', 1, 49, 59),
(4502, 'collaborator1', '2024-06-26 15:51:36.284275', '', NULL, NULL, b'1', 2, 49, 59),
(4503, 'collaborator1', '2024-06-26 15:51:36.287176', '', NULL, NULL, b'1', 3, 49, 59),
(4504, 'collaborator1', '2024-06-26 15:51:36.289273', '', NULL, NULL, b'1', 4, 49, 59),
(4505, 'collaborator1', '2024-06-26 15:51:36.291317', '', NULL, NULL, b'1', 5, 49, 59),
(4506, 'collaborator1', '2024-06-26 15:51:36.294330', '', NULL, NULL, b'1', 6, 49, 59),
(4507, 'collaborator1', '2024-06-26 15:51:36.296330', '', NULL, NULL, b'1', 1, 50, 59),
(4508, 'collaborator1', '2024-06-26 15:51:36.299337', '', NULL, NULL, b'1', 2, 50, 59),
(4509, 'collaborator1', '2024-06-26 15:51:36.301457', '', NULL, NULL, b'1', 3, 50, 59),
(4510, 'collaborator1', '2024-06-26 15:51:36.303335', '', NULL, NULL, b'1', 4, 50, 59),
(4511, 'collaborator1', '2024-06-26 15:51:36.306330', '', NULL, NULL, b'1', 5, 50, 59),
(4512, 'collaborator1', '2024-06-26 15:51:36.308368', '', NULL, NULL, b'1', 6, 50, 59),
(4513, 'collaborator1', '2024-06-26 15:51:36.310459', '', NULL, NULL, b'1', 1, 51, 59),
(4514, 'collaborator1', '2024-06-26 15:51:36.313479', '', NULL, NULL, b'1', 2, 51, 59),
(4515, 'collaborator1', '2024-06-26 15:51:36.315481', '', NULL, NULL, b'1', 3, 51, 59),
(4516, 'collaborator1', '2024-06-26 15:51:36.317370', '', NULL, NULL, b'1', 4, 51, 59),
(4517, 'collaborator1', '2024-06-26 15:51:36.320333', '', NULL, NULL, b'1', 5, 51, 59),
(4518, 'collaborator1', '2024-06-26 15:51:36.322329', '', NULL, NULL, b'1', 6, 51, 59),
(4519, 'collaborator1', '2024-06-26 15:51:36.324470', '', NULL, NULL, b'1', 1, 52, 59),
(4520, 'collaborator1', '2024-06-26 15:51:36.326471', '', NULL, NULL, b'1', 2, 52, 59),
(4521, 'collaborator1', '2024-06-26 15:51:36.329354', '', NULL, NULL, b'1', 3, 52, 59),
(4522, 'collaborator1', '2024-06-26 15:51:36.331471', '', NULL, NULL, b'1', 4, 52, 59),
(4523, 'collaborator1', '2024-06-26 15:51:36.333328', '', NULL, NULL, b'1', 5, 52, 59),
(4524, 'collaborator1', '2024-06-26 15:51:36.336338', '', NULL, NULL, b'1', 6, 52, 59),
(4525, 'collaborator1', '2024-06-26 15:51:36.339330', '', NULL, NULL, b'1', 1, 53, 59),
(4526, 'collaborator1', '2024-06-26 15:51:36.341465', '', NULL, NULL, b'1', 2, 53, 59),
(4527, 'collaborator1', '2024-06-26 15:51:36.343479', '', NULL, NULL, b'1', 3, 53, 59),
(4528, 'collaborator1', '2024-06-26 15:51:36.346330', '', NULL, NULL, b'1', 4, 53, 59),
(4529, 'collaborator1', '2024-06-26 15:51:36.348391', '', NULL, NULL, b'1', 5, 53, 59),
(4530, 'collaborator1', '2024-06-26 15:51:36.350473', '', NULL, NULL, b'1', 6, 53, 59),
(4531, 'collaborator1', '2024-06-26 15:51:36.352356', '', NULL, NULL, b'1', 1, 54, 59),
(4532, 'collaborator1', '2024-06-26 15:51:36.355481', '', NULL, NULL, b'1', 2, 54, 59),
(4533, 'collaborator1', '2024-06-26 15:51:36.357386', '', NULL, NULL, b'1', 3, 54, 59),
(4534, 'collaborator1', '2024-06-26 15:51:36.359478', '', NULL, NULL, b'1', 4, 54, 59),
(4535, 'collaborator1', '2024-06-26 15:51:36.362333', '', NULL, NULL, b'1', 5, 54, 59),
(4536, 'collaborator1', '2024-06-26 15:51:36.364483', '', NULL, NULL, b'1', 6, 54, 59),
(4537, 'collaborator1', '2024-06-26 15:51:36.366479', '', NULL, NULL, b'1', 1, 55, 59),
(4538, 'collaborator1', '2024-06-26 15:51:36.368479', '', NULL, NULL, b'1', 2, 55, 59),
(4539, 'collaborator1', '2024-06-26 15:51:36.371487', '', NULL, NULL, b'1', 3, 55, 59),
(4540, 'collaborator1', '2024-06-26 15:51:36.373482', '', NULL, NULL, b'1', 4, 55, 59),
(4541, 'collaborator1', '2024-06-26 15:51:36.375479', '', NULL, NULL, b'1', 5, 55, 59),
(4542, 'collaborator1', '2024-06-26 15:51:36.378349', '', NULL, NULL, b'1', 6, 55, 59),
(4543, 'collaborator1', '2024-06-26 15:51:36.380480', '', NULL, NULL, b'1', 1, 56, 59),
(4544, 'collaborator1', '2024-06-26 15:51:36.382479', '', NULL, NULL, b'1', 2, 56, 59),
(4545, 'collaborator1', '2024-06-26 15:51:36.385448', '', NULL, NULL, b'1', 3, 56, 59),
(4546, 'collaborator1', '2024-06-26 15:51:36.388329', '', NULL, NULL, b'1', 4, 56, 59),
(4547, 'collaborator1', '2024-06-26 15:51:36.390478', '', NULL, NULL, b'1', 5, 56, 59),
(4548, 'collaborator1', '2024-06-26 15:51:36.392472', '', NULL, NULL, b'1', 6, 56, 59),
(4549, 'collaborator1', '2024-06-26 15:51:36.395329', '', NULL, NULL, b'1', 1, 57, 59),
(4550, 'collaborator1', '2024-06-26 15:51:36.398328', '', NULL, NULL, b'1', 2, 57, 59),
(4551, 'collaborator1', '2024-06-26 15:51:36.400330', '', NULL, NULL, b'1', 3, 57, 59),
(4552, 'collaborator1', '2024-06-26 15:51:36.402329', '', NULL, NULL, b'1', 4, 57, 59),
(4553, 'collaborator1', '2024-06-26 15:51:36.405368', '', NULL, NULL, b'1', 5, 57, 59),
(4554, 'collaborator1', '2024-06-26 15:51:36.407394', '', NULL, NULL, b'1', 6, 57, 59),
(4555, 'collaborator1', '2024-06-26 15:51:36.409431', '', NULL, NULL, b'1', 1, 58, 59),
(4556, 'collaborator1', '2024-06-26 15:51:36.411348', '', NULL, NULL, b'1', 2, 58, 59),
(4557, 'collaborator1', '2024-06-26 15:51:36.414437', '', NULL, NULL, b'1', 3, 58, 59),
(4558, 'collaborator1', '2024-06-26 15:51:36.416478', '', NULL, NULL, b'1', 4, 58, 59),
(4559, 'collaborator1', '2024-06-26 15:51:36.418480', '', NULL, NULL, b'1', 5, 58, 59),
(4560, 'collaborator1', '2024-06-26 15:51:36.421331', '', NULL, NULL, b'1', 6, 58, 59),
(4561, 'collaborator1', '2024-06-26 15:51:36.423367', '', NULL, NULL, b'1', 1, 59, 59),
(4562, 'collaborator1', '2024-06-26 15:51:36.425371', '', NULL, NULL, b'1', 2, 59, 59),
(4563, 'collaborator1', '2024-06-26 15:51:36.428336', '', NULL, NULL, b'1', 3, 59, 59),
(4564, 'collaborator1', '2024-06-26 15:51:36.431328', '', NULL, NULL, b'1', 4, 59, 59),
(4565, 'collaborator1', '2024-06-26 15:51:36.433344', '', NULL, NULL, b'1', 5, 59, 59),
(4566, 'collaborator1', '2024-06-26 15:51:36.435486', '', NULL, NULL, b'1', 6, 59, 59),
(4567, 'collaborator1', '2024-06-26 15:51:36.438446', '', NULL, NULL, b'1', 1, 60, 59),
(4568, 'collaborator1', '2024-06-26 15:51:36.440479', '', NULL, NULL, b'1', 2, 60, 59),
(4569, 'collaborator1', '2024-06-26 15:51:36.442471', '', NULL, NULL, b'1', 3, 60, 59),
(4570, 'collaborator1', '2024-06-26 15:51:36.445355', '', NULL, NULL, b'1', 4, 60, 59),
(4571, 'collaborator1', '2024-06-26 15:51:36.447381', '', NULL, NULL, b'1', 5, 60, 59),
(4572, 'collaborator1', '2024-06-26 15:51:36.449481', '', NULL, NULL, b'1', 6, 60, 59),
(4573, 'collaborator1', '2024-06-26 15:51:36.451486', '', NULL, NULL, b'1', 1, 61, 59),
(4574, 'collaborator1', '2024-06-26 15:51:36.454329', '', NULL, NULL, b'1', 2, 61, 59),
(4575, 'collaborator1', '2024-06-26 15:51:36.456478', '', NULL, NULL, b'1', 3, 61, 59),
(4576, 'collaborator1', '2024-06-26 15:51:36.459328', '', NULL, NULL, b'1', 4, 61, 59),
(4577, 'collaborator1', '2024-06-26 15:51:36.461335', '', NULL, NULL, b'1', 5, 61, 59),
(4578, 'collaborator1', '2024-06-26 15:51:36.464328', '', NULL, NULL, b'1', 6, 61, 59),
(4579, 'collaborator1', '2024-06-26 15:51:36.466346', '', NULL, NULL, b'1', 1, 62, 59),
(4580, 'collaborator1', '2024-06-26 15:51:36.468479', '', NULL, NULL, b'1', 2, 62, 59),
(4581, 'collaborator1', '2024-06-26 15:51:36.470329', '', NULL, NULL, b'1', 3, 62, 59),
(4582, 'collaborator1', '2024-06-26 15:51:36.473328', '', NULL, NULL, b'1', 4, 62, 59),
(4583, 'collaborator1', '2024-06-26 15:51:36.475476', '', NULL, NULL, b'1', 5, 62, 59),
(4584, 'collaborator1', '2024-06-26 15:51:36.477330', '', NULL, NULL, b'1', 6, 62, 59),
(4585, 'collaborator1', '2024-06-26 15:51:36.480479', '', NULL, NULL, b'1', 1, 63, 59),
(4586, 'collaborator1', '2024-06-26 15:51:36.482478', '', NULL, NULL, b'1', 2, 63, 59),
(4587, 'collaborator1', '2024-06-26 15:51:36.484479', '', NULL, NULL, b'1', 3, 63, 59),
(4588, 'collaborator1', '2024-06-26 15:51:36.487334', '', NULL, NULL, b'1', 4, 63, 59),
(4589, 'collaborator1', '2024-06-26 15:51:36.489478', '', NULL, NULL, b'1', 5, 63, 59),
(4590, 'collaborator1', '2024-06-26 15:51:36.491329', '', NULL, NULL, b'1', 6, 63, 59),
(4591, 'collaborator1', '2024-06-26 15:51:36.494328', '', NULL, NULL, b'1', 1, 64, 59),
(4592, 'collaborator1', '2024-06-26 15:51:36.497355', '', NULL, NULL, b'1', 2, 64, 59),
(4593, 'collaborator1', '2024-06-26 15:51:36.499481', '', NULL, NULL, b'1', 3, 64, 59),
(4594, 'collaborator1', '2024-06-26 15:51:36.501486', '', NULL, NULL, b'1', 4, 64, 59),
(4595, 'collaborator1', '2024-06-26 15:51:36.503329', '', NULL, NULL, b'1', 5, 64, 59),
(4596, 'collaborator1', '2024-06-26 15:51:36.506331', '', NULL, NULL, b'1', 6, 64, 59),
(4597, 'collaborator1', '2024-06-26 15:51:36.508479', '', NULL, NULL, b'1', 1, 65, 59),
(4598, 'collaborator1', '2024-06-26 15:51:36.510479', '', NULL, NULL, b'1', 2, 65, 59),
(4599, 'collaborator1', '2024-06-26 15:51:36.513480', '', NULL, NULL, b'1', 3, 65, 59),
(4600, 'collaborator1', '2024-06-26 15:51:36.515480', '', NULL, NULL, b'1', 4, 65, 59),
(4601, 'collaborator1', '2024-06-26 15:51:36.517380', '', NULL, NULL, b'1', 5, 65, 59),
(4602, 'collaborator1', '2024-06-26 15:51:36.520330', '', NULL, NULL, b'1', 6, 65, 59),
(4603, 'collaborator1', '2024-06-26 15:51:36.522483', '', NULL, NULL, b'1', 1, 66, 59),
(4604, 'collaborator1', '2024-06-26 15:51:36.524478', '', NULL, NULL, b'1', 2, 66, 59),
(4605, 'collaborator1', '2024-06-26 15:51:36.526479', '', NULL, NULL, b'1', 3, 66, 59),
(4606, 'collaborator1', '2024-06-26 15:51:36.540352', '', NULL, NULL, b'1', 4, 66, 59),
(4607, 'collaborator1', '2024-06-26 15:51:36.542479', '', NULL, NULL, b'1', 5, 66, 59),
(4608, 'collaborator1', '2024-06-26 15:51:36.544350', '', NULL, NULL, b'1', 6, 66, 59),
(4609, 'collaborator1', '2024-06-26 15:51:36.547330', '', NULL, NULL, b'1', 1, 67, 59),
(4610, 'collaborator1', '2024-06-26 15:51:36.549481', '', NULL, NULL, b'1', 2, 67, 59),
(4611, 'collaborator1', '2024-06-26 15:51:36.551479', '', NULL, NULL, b'1', 3, 67, 59),
(4612, 'collaborator1', '2024-06-26 15:51:36.554330', '', NULL, NULL, b'1', 4, 67, 59),
(4613, 'collaborator1', '2024-06-26 15:51:36.557329', '', NULL, NULL, b'1', 5, 67, 59),
(4614, 'collaborator1', '2024-06-26 15:51:36.559332', '', NULL, NULL, b'1', 6, 67, 59),
(4615, 'collaborator1', '2024-06-26 15:51:36.562334', '', NULL, NULL, b'1', 1, 68, 59),
(4616, 'collaborator1', '2024-06-26 15:51:36.565385', '', NULL, NULL, b'1', 2, 68, 59),
(4617, 'collaborator1', '2024-06-26 15:51:36.567384', '', NULL, NULL, b'1', 3, 68, 59),
(4618, 'collaborator1', '2024-06-26 15:51:36.569332', '', NULL, NULL, b'1', 4, 68, 59),
(4619, 'collaborator1', '2024-06-26 15:51:36.572328', '', NULL, NULL, b'1', 5, 68, 59),
(4620, 'collaborator1', '2024-06-26 15:51:36.574328', '', NULL, NULL, b'1', 6, 68, 59),
(4621, 'collaborator1', '2024-06-26 15:51:36.576332', '', NULL, NULL, b'1', 1, 69, 59),
(4622, 'collaborator1', '2024-06-26 15:51:36.579332', '', NULL, NULL, b'1', 2, 69, 59),
(4623, 'collaborator1', '2024-06-26 15:51:36.581395', '', NULL, NULL, b'1', 3, 69, 59),
(4624, 'collaborator1', '2024-06-26 15:51:36.583358', '', NULL, NULL, b'1', 4, 69, 59),
(4625, 'collaborator1', '2024-06-26 15:51:36.586339', '', NULL, NULL, b'1', 5, 69, 59),
(4626, 'collaborator1', '2024-06-26 15:51:36.589364', '', NULL, NULL, b'1', 6, 69, 59),
(4627, 'collaborator1', '2024-06-26 15:51:36.591472', '', NULL, NULL, b'1', 1, 70, 59),
(4628, 'collaborator1', '2024-06-26 15:51:36.593474', '', NULL, NULL, b'1', 2, 70, 59),
(4629, 'collaborator1', '2024-06-26 15:51:36.596329', '', NULL, NULL, b'1', 3, 70, 59),
(4630, 'collaborator1', '2024-06-26 15:51:36.599329', '', NULL, NULL, b'1', 4, 70, 59),
(4631, 'collaborator1', '2024-06-26 15:51:36.604334', '', NULL, NULL, b'1', 5, 70, 59),
(4632, 'collaborator1', '2024-06-26 15:51:36.607329', '', NULL, NULL, b'1', 6, 70, 59),
(4633, 'collaborator1', '2024-06-26 15:51:36.609452', '', NULL, NULL, b'1', 1, 71, 59),
(4634, 'collaborator1', '2024-06-26 15:51:36.612344', '', NULL, NULL, b'1', 2, 71, 59),
(4635, 'collaborator1', '2024-06-26 15:51:36.614478', '', NULL, NULL, b'1', 3, 71, 59),
(4636, 'collaborator1', '2024-06-26 15:51:36.616478', '', NULL, NULL, b'1', 4, 71, 59),
(4637, 'collaborator1', '2024-06-26 15:51:36.618476', '', NULL, NULL, b'1', 5, 71, 59),
(4638, 'collaborator1', '2024-06-26 15:51:36.622331', '', NULL, NULL, b'1', 6, 71, 59),
(4639, 'collaborator1', '2024-06-26 15:51:36.624370', '', NULL, NULL, b'1', 1, 72, 59),
(4640, 'collaborator1', '2024-06-26 15:51:36.626371', '', NULL, NULL, b'1', 2, 72, 59),
(4641, 'collaborator1', '2024-06-26 15:51:36.629384', '', NULL, NULL, b'1', 3, 72, 59),
(4642, 'collaborator1', '2024-06-26 15:51:36.632473', '', NULL, NULL, b'1', 4, 72, 59),
(4643, 'collaborator1', '2024-06-26 15:51:36.634478', '', NULL, NULL, b'1', 5, 72, 59),
(4644, 'collaborator1', '2024-06-26 15:51:36.636349', '', NULL, NULL, b'1', 6, 72, 59),
(4645, 'collaborator1', '2024-06-26 15:51:36.639479', '', NULL, NULL, b'1', 1, 73, 59),
(4646, 'collaborator1', '2024-06-26 15:51:36.641480', '', NULL, NULL, b'1', 2, 73, 59),
(4647, 'collaborator1', '2024-06-26 15:51:36.643481', '', NULL, NULL, b'1', 3, 73, 59),
(4648, 'collaborator1', '2024-06-26 15:51:36.646329', '', NULL, NULL, b'1', 4, 73, 59),
(4649, 'collaborator1', '2024-06-26 15:51:36.649328', '', NULL, NULL, b'1', 5, 73, 59),
(4650, 'collaborator1', '2024-06-26 15:51:36.651374', '', NULL, NULL, b'1', 6, 73, 59),
(4651, 'collaborator1', '2024-06-26 15:51:36.653373', '', NULL, NULL, b'1', 1, 74, 59),
(4652, 'collaborator1', '2024-06-26 15:51:36.656330', '', NULL, NULL, b'1', 2, 74, 59),
(4653, 'collaborator1', '2024-06-26 15:51:36.658467', '', NULL, NULL, b'1', 3, 74, 59),
(4654, 'collaborator1', '2024-06-26 15:51:36.660457', '', NULL, NULL, b'1', 4, 74, 59),
(4655, 'collaborator1', '2024-06-26 15:51:36.663479', '', NULL, NULL, b'1', 5, 74, 59),
(4656, 'collaborator1', '2024-06-26 15:51:36.666328', '', NULL, NULL, b'1', 6, 74, 59),
(4657, 'collaborator1', '2024-06-26 15:51:36.668408', '', NULL, NULL, b'1', 1, 75, 59),
(4658, 'collaborator1', '2024-06-26 15:51:36.671330', '', NULL, NULL, b'1', 2, 75, 59),
(4659, 'collaborator1', '2024-06-26 15:51:36.673473', '', NULL, NULL, b'1', 3, 75, 59),
(4660, 'collaborator1', '2024-06-26 15:51:36.675473', '', NULL, NULL, b'1', 4, 75, 59),
(4661, 'collaborator1', '2024-06-26 15:51:36.677328', '', NULL, NULL, b'1', 5, 75, 59),
(4662, 'collaborator1', '2024-06-26 15:51:36.680472', '', NULL, NULL, b'1', 6, 75, 59),
(4663, 'collaborator1', '2024-06-26 15:51:36.682470', '', NULL, NULL, b'1', 1, 76, 59),
(4664, 'collaborator1', '2024-06-26 15:51:36.685326', '', NULL, NULL, b'1', 2, 76, 59),
(4665, 'collaborator1', '2024-06-26 15:51:36.687331', '', NULL, NULL, b'1', 3, 76, 59),
(4666, 'collaborator1', '2024-06-26 15:51:36.690350', '', NULL, NULL, b'1', 4, 76, 59),
(4667, 'collaborator1', '2024-06-26 15:51:36.692479', '', NULL, NULL, b'1', 5, 76, 59),
(4668, 'collaborator1', '2024-06-26 15:51:36.694332', '', NULL, NULL, b'1', 6, 76, 59),
(4669, 'collaborator1', '2024-06-26 15:51:36.697368', '', NULL, NULL, b'1', 1, 77, 59),
(4670, 'collaborator1', '2024-06-26 15:51:36.699460', '', NULL, NULL, b'1', 2, 77, 59),
(4671, 'collaborator1', '2024-06-26 15:51:36.701457', '', NULL, NULL, b'1', 3, 77, 59),
(4672, 'collaborator1', '2024-06-26 15:51:36.704468', '', NULL, NULL, b'1', 4, 77, 59),
(4673, 'collaborator1', '2024-06-26 15:51:36.707328', '', NULL, NULL, b'1', 5, 77, 59),
(4674, 'collaborator1', '2024-06-26 15:51:36.709424', '', NULL, NULL, b'1', 6, 77, 59),
(4675, 'collaborator1', '2024-06-26 15:51:36.711335', '', NULL, NULL, b'1', 1, 78, 59),
(4676, 'collaborator1', '2024-06-26 15:51:36.714330', '', NULL, NULL, b'1', 2, 78, 59),
(4677, 'collaborator1', '2024-06-26 15:51:36.716372', '', NULL, NULL, b'1', 3, 78, 59),
(4678, 'collaborator1', '2024-06-26 15:51:36.719332', '', NULL, NULL, b'1', 4, 78, 59),
(4679, 'collaborator1', '2024-06-26 15:51:36.722327', '', NULL, NULL, b'1', 5, 78, 59),
(4680, 'collaborator1', '2024-06-26 15:51:36.724327', '', NULL, NULL, b'1', 6, 78, 59),
(4681, 'collaborator1', '2024-06-26 15:51:40.524944', '', NULL, NULL, b'1', 1, 1, 60),
(4682, 'collaborator1', '2024-06-26 15:51:40.529945', '', NULL, NULL, b'1', 2, 1, 60),
(4683, 'collaborator1', '2024-06-26 15:51:40.532944', '', NULL, NULL, b'1', 3, 1, 60),
(4684, 'collaborator1', '2024-06-26 15:51:40.535983', '', NULL, NULL, b'1', 4, 1, 60),
(4685, 'collaborator1', '2024-06-26 15:51:40.538945', '', NULL, NULL, b'1', 5, 1, 60),
(4686, 'collaborator1', '2024-06-26 15:51:40.541002', '', NULL, NULL, b'1', 6, 1, 60),
(4687, 'collaborator1', '2024-06-26 15:51:40.543978', '', NULL, NULL, b'1', 1, 2, 60),
(4688, 'collaborator1', '2024-06-26 15:51:40.546945', '', NULL, NULL, b'1', 2, 2, 60),
(4689, 'collaborator1', '2024-06-26 15:51:40.549043', '', NULL, NULL, b'1', 3, 2, 60),
(4690, 'collaborator1', '2024-06-26 15:51:40.551952', '', NULL, NULL, b'1', 4, 2, 60),
(4691, 'collaborator1', '2024-06-26 15:51:40.555944', '', NULL, NULL, b'1', 5, 2, 60),
(4692, 'collaborator1', '2024-06-26 15:51:40.557944', '', NULL, NULL, b'1', 6, 2, 60),
(4693, 'collaborator1', '2024-06-26 15:51:40.562946', '', NULL, NULL, b'1', 1, 3, 60),
(4694, 'collaborator1', '2024-06-26 15:51:40.564985', '', NULL, NULL, b'1', 2, 3, 60),
(4695, 'collaborator1', '2024-06-26 15:51:40.567961', '', NULL, NULL, b'1', 3, 3, 60),
(4696, 'collaborator1', '2024-06-26 15:51:40.571943', '', NULL, NULL, b'1', 4, 3, 60),
(4697, 'collaborator1', '2024-06-26 15:51:40.573945', '', NULL, NULL, b'1', 5, 3, 60),
(4698, 'collaborator1', '2024-06-26 15:51:40.575978', '', NULL, NULL, b'1', 6, 3, 60),
(4699, 'collaborator1', '2024-06-26 15:51:40.580094', '', NULL, NULL, b'1', 1, 4, 60),
(4700, 'collaborator1', '2024-06-26 15:51:40.582944', '', NULL, NULL, b'1', 2, 4, 60),
(4701, 'collaborator1', '2024-06-26 15:51:40.584967', '', NULL, NULL, b'1', 3, 4, 60),
(4702, 'collaborator1', '2024-06-26 15:51:40.588943', '', NULL, NULL, b'1', 4, 4, 60),
(4703, 'collaborator1', '2024-06-26 15:51:40.591094', '', NULL, NULL, b'1', 5, 4, 60),
(4704, 'collaborator1', '2024-06-26 15:51:40.594959', '', NULL, NULL, b'1', 6, 4, 60),
(4705, 'collaborator1', '2024-06-26 15:51:40.597944', '', NULL, NULL, b'1', 1, 5, 60),
(4706, 'collaborator1', '2024-06-26 15:51:40.599944', '', NULL, NULL, b'1', 2, 5, 60),
(4707, 'collaborator1', '2024-06-26 15:51:40.606102', '', NULL, NULL, b'1', 3, 5, 60),
(4708, 'collaborator1', '2024-06-26 15:51:40.608963', '', NULL, NULL, b'1', 4, 5, 60),
(4709, 'collaborator1', '2024-06-26 15:51:40.612945', '', NULL, NULL, b'1', 5, 5, 60),
(4710, 'collaborator1', '2024-06-26 15:51:40.614965', '', NULL, NULL, b'1', 6, 5, 60),
(4711, 'collaborator1', '2024-06-26 15:51:40.617963', '', NULL, NULL, b'1', 1, 6, 60),
(4712, 'collaborator1', '2024-06-26 15:51:40.620942', '', NULL, NULL, b'1', 2, 6, 60),
(4713, 'collaborator1', '2024-06-26 15:51:40.623944', '', NULL, NULL, b'1', 3, 6, 60),
(4714, 'collaborator1', '2024-06-26 15:51:40.625952', '', NULL, NULL, b'1', 4, 6, 60),
(4715, 'collaborator1', '2024-06-26 15:51:40.629943', '', NULL, NULL, b'1', 5, 6, 60),
(4716, 'collaborator1', '2024-06-26 15:51:40.631943', '', NULL, NULL, b'1', 6, 6, 60),
(4717, 'collaborator1', '2024-06-26 15:51:40.633960', '', NULL, NULL, b'1', 1, 7, 60),
(4718, 'collaborator1', '2024-06-26 15:51:40.636944', '', NULL, NULL, b'1', 2, 7, 60),
(4719, 'collaborator1', '2024-06-26 15:51:40.638987', '', NULL, NULL, b'1', 3, 7, 60),
(4720, 'collaborator1', '2024-06-26 15:51:40.641947', '', NULL, NULL, b'1', 4, 7, 60),
(4721, 'collaborator1', '2024-06-26 15:51:40.644950', '', NULL, NULL, b'1', 5, 7, 60),
(4722, 'collaborator1', '2024-06-26 15:51:40.646943', '', NULL, NULL, b'1', 6, 7, 60),
(4723, 'collaborator1', '2024-06-26 15:51:40.649944', '', NULL, NULL, b'1', 1, 8, 60),
(4724, 'collaborator1', '2024-06-26 15:51:40.652946', '', NULL, NULL, b'1', 2, 8, 60),
(4725, 'collaborator1', '2024-06-26 15:51:40.654964', '', NULL, NULL, b'1', 3, 8, 60),
(4726, 'collaborator1', '2024-06-26 15:51:40.656963', '', NULL, NULL, b'1', 4, 8, 60),
(4727, 'collaborator1', '2024-06-26 15:51:40.658961', '', NULL, NULL, b'1', 5, 8, 60),
(4728, 'collaborator1', '2024-06-26 15:51:40.661943', '', NULL, NULL, b'1', 6, 8, 60),
(4729, 'collaborator1', '2024-06-26 15:51:40.664997', '', NULL, NULL, b'1', 1, 9, 60),
(4730, 'collaborator1', '2024-06-26 15:51:40.668966', '', NULL, NULL, b'1', 2, 9, 60),
(4731, 'collaborator1', '2024-06-26 15:51:40.673973', '', NULL, NULL, b'1', 3, 9, 60),
(4732, 'collaborator1', '2024-06-26 15:51:40.678956', '', NULL, NULL, b'1', 4, 9, 60),
(4733, 'collaborator1', '2024-06-26 15:51:40.683953', '', NULL, NULL, b'1', 5, 9, 60),
(4734, 'collaborator1', '2024-06-26 15:51:40.689951', '', NULL, NULL, b'1', 6, 9, 60),
(4735, 'collaborator1', '2024-06-26 15:51:40.693948', '', NULL, NULL, b'1', 1, 10, 60),
(4736, 'collaborator1', '2024-06-26 15:51:40.697951', '', NULL, NULL, b'1', 2, 10, 60),
(4737, 'collaborator1', '2024-06-26 15:51:40.700958', '', NULL, NULL, b'1', 3, 10, 60),
(4738, 'collaborator1', '2024-06-26 15:51:40.704977', '', NULL, NULL, b'1', 4, 10, 60),
(4739, 'collaborator1', '2024-06-26 15:51:40.706945', '', NULL, NULL, b'1', 5, 10, 60),
(4740, 'collaborator1', '2024-06-26 15:51:40.710955', '', NULL, NULL, b'1', 6, 10, 60),
(4741, 'collaborator1', '2024-06-26 15:51:40.713945', '', NULL, NULL, b'1', 1, 11, 60),
(4742, 'collaborator1', '2024-06-26 15:51:40.715973', '', NULL, NULL, b'1', 2, 11, 60),
(4743, 'collaborator1', '2024-06-26 15:51:40.719948', '', NULL, NULL, b'1', 3, 11, 60),
(4744, 'collaborator1', '2024-06-26 15:51:40.721977', '', NULL, NULL, b'1', 4, 11, 60),
(4745, 'collaborator1', '2024-06-26 15:51:40.723984', '', NULL, NULL, b'1', 5, 11, 60),
(4746, 'collaborator1', '2024-06-26 15:51:40.727947', '', NULL, NULL, b'1', 6, 11, 60),
(4747, 'collaborator1', '2024-06-26 15:51:40.729978', '', NULL, NULL, b'1', 1, 12, 60),
(4748, 'collaborator1', '2024-06-26 15:51:40.731976', '', NULL, NULL, b'1', 2, 12, 60),
(4749, 'collaborator1', '2024-06-26 15:51:40.734949', '', NULL, NULL, b'1', 3, 12, 60),
(4750, 'collaborator1', '2024-06-26 15:51:40.737945', '', NULL, NULL, b'1', 4, 12, 60),
(4751, 'collaborator1', '2024-06-26 15:51:40.739976', '', NULL, NULL, b'1', 5, 12, 60),
(4752, 'collaborator1', '2024-06-26 15:51:40.742948', '', NULL, NULL, b'1', 6, 12, 60),
(4753, 'collaborator1', '2024-06-26 15:51:40.745947', '', NULL, NULL, b'1', 1, 13, 60),
(4754, 'collaborator1', '2024-06-26 15:51:40.747947', '', NULL, NULL, b'1', 2, 13, 60),
(4755, 'collaborator1', '2024-06-26 15:51:40.750957', '', NULL, NULL, b'1', 3, 13, 60),
(4756, 'collaborator1', '2024-06-26 15:51:40.753947', '', NULL, NULL, b'1', 4, 13, 60),
(4757, 'collaborator1', '2024-06-26 15:51:40.755947', '', NULL, NULL, b'1', 5, 13, 60),
(4758, 'collaborator1', '2024-06-26 15:51:40.758958', '', NULL, NULL, b'1', 6, 13, 60),
(4759, 'collaborator1', '2024-06-26 15:51:40.761977', '', NULL, NULL, b'1', 1, 14, 60),
(4760, 'collaborator1', '2024-06-26 15:51:40.763987', '', NULL, NULL, b'1', 2, 14, 60),
(4761, 'collaborator1', '2024-06-26 15:51:40.766948', '', NULL, NULL, b'1', 3, 14, 60),
(4762, 'collaborator1', '2024-06-26 15:51:40.769973', '', NULL, NULL, b'1', 4, 14, 60),
(4763, 'collaborator1', '2024-06-26 15:51:40.772945', '', NULL, NULL, b'1', 5, 14, 60),
(4764, 'collaborator1', '2024-06-26 15:51:40.774947', '', NULL, NULL, b'1', 6, 14, 60),
(4765, 'collaborator1', '2024-06-26 15:51:40.777945', '', NULL, NULL, b'1', 1, 15, 60),
(4766, 'collaborator1', '2024-06-26 15:51:40.780974', '', NULL, NULL, b'1', 2, 15, 60),
(4767, 'collaborator1', '2024-06-26 15:51:40.783957', '', NULL, NULL, b'1', 3, 15, 60),
(4768, 'collaborator1', '2024-06-26 15:51:40.786957', '', NULL, NULL, b'1', 4, 15, 60),
(4769, 'collaborator1', '2024-06-26 15:51:40.788945', '', NULL, NULL, b'1', 5, 15, 60),
(4770, 'collaborator1', '2024-06-26 15:51:40.791946', '', NULL, NULL, b'1', 6, 15, 60),
(4771, 'collaborator1', '2024-06-26 15:51:40.794946', '', NULL, NULL, b'1', 1, 16, 60),
(4772, 'collaborator1', '2024-06-26 15:51:40.796947', '', NULL, NULL, b'1', 2, 16, 60),
(4773, 'collaborator1', '2024-06-26 15:51:40.799946', '', NULL, NULL, b'1', 3, 16, 60),
(4774, 'collaborator1', '2024-06-26 15:51:40.802949', '', NULL, NULL, b'1', 4, 16, 60),
(4775, 'collaborator1', '2024-06-26 15:51:40.805946', '', NULL, NULL, b'1', 5, 16, 60),
(4776, 'collaborator1', '2024-06-26 15:51:40.807947', '', NULL, NULL, b'1', 6, 16, 60),
(4777, 'collaborator1', '2024-06-26 15:51:40.810952', '', NULL, NULL, b'1', 1, 17, 60),
(4778, 'collaborator1', '2024-06-26 15:51:40.813974', '', NULL, NULL, b'1', 2, 17, 60),
(4779, 'collaborator1', '2024-06-26 15:51:40.815945', '', NULL, NULL, b'1', 3, 17, 60),
(4780, 'collaborator1', '2024-06-26 15:51:40.819946', '', NULL, NULL, b'1', 4, 17, 60),
(4781, 'collaborator1', '2024-06-26 15:51:40.821972', '', NULL, NULL, b'1', 5, 17, 60),
(4782, 'collaborator1', '2024-06-26 15:51:40.824962', '', NULL, NULL, b'1', 6, 17, 60),
(4783, 'collaborator1', '2024-06-26 15:51:40.830956', '', NULL, NULL, b'1', 1, 18, 60),
(4784, 'collaborator1', '2024-06-26 15:51:40.834967', '', NULL, NULL, b'1', 2, 18, 60),
(4785, 'collaborator1', '2024-06-26 15:51:40.839948', '', NULL, NULL, b'1', 3, 18, 60),
(4786, 'collaborator1', '2024-06-26 15:51:40.845965', '', NULL, NULL, b'1', 4, 18, 60),
(4787, 'collaborator1', '2024-06-26 15:51:40.849955', '', NULL, NULL, b'1', 5, 18, 60),
(4788, 'collaborator1', '2024-06-26 15:51:40.854948', '', NULL, NULL, b'1', 6, 18, 60),
(4789, 'collaborator1', '2024-06-26 15:51:40.858952', '', NULL, NULL, b'1', 1, 19, 60),
(4790, 'collaborator1', '2024-06-26 15:51:40.861979', '', NULL, NULL, b'1', 2, 19, 60),
(4791, 'collaborator1', '2024-06-26 15:51:40.864977', '', NULL, NULL, b'1', 3, 19, 60),
(4792, 'collaborator1', '2024-06-26 15:51:40.867950', '', NULL, NULL, b'1', 4, 19, 60),
(4793, 'collaborator1', '2024-06-26 15:51:40.870944', '', NULL, NULL, b'1', 5, 19, 60),
(4794, 'collaborator1', '2024-06-26 15:51:40.873977', '', NULL, NULL, b'1', 6, 19, 60),
(4795, 'collaborator1', '2024-06-26 15:51:40.876947', '', NULL, NULL, b'1', 1, 20, 60),
(4796, 'collaborator1', '2024-06-26 15:51:40.879974', '', NULL, NULL, b'1', 2, 20, 60),
(4797, 'collaborator1', '2024-06-26 15:51:40.882946', '', NULL, NULL, b'1', 3, 20, 60),
(4798, 'collaborator1', '2024-06-26 15:51:40.885947', '', NULL, NULL, b'1', 4, 20, 60),
(4799, 'collaborator1', '2024-06-26 15:51:40.888977', '', NULL, NULL, b'1', 5, 20, 60),
(4800, 'collaborator1', '2024-06-26 15:51:40.891950', '', NULL, NULL, b'1', 6, 20, 60),
(4801, 'collaborator1', '2024-06-26 15:51:40.895947', '', NULL, NULL, b'1', 1, 21, 60),
(4802, 'collaborator1', '2024-06-26 15:51:40.897946', '', NULL, NULL, b'1', 2, 21, 60),
(4803, 'collaborator1', '2024-06-26 15:51:40.900964', '', NULL, NULL, b'1', 3, 21, 60),
(4804, 'collaborator1', '2024-06-26 15:51:40.904951', '', NULL, NULL, b'1', 4, 21, 60),
(4805, 'collaborator1', '2024-06-26 15:51:40.906949', '', NULL, NULL, b'1', 5, 21, 60),
(4806, 'collaborator1', '2024-06-26 15:51:40.910947', '', NULL, NULL, b'1', 6, 21, 60),
(4807, 'collaborator1', '2024-06-26 15:51:40.912946', '', NULL, NULL, b'1', 1, 22, 60),
(4808, 'collaborator1', '2024-06-26 15:51:40.915948', '', NULL, NULL, b'1', 2, 22, 60),
(4809, 'collaborator1', '2024-06-26 15:51:40.918948', '', NULL, NULL, b'1', 3, 22, 60),
(4810, 'collaborator1', '2024-06-26 15:51:40.921956', '', NULL, NULL, b'1', 4, 22, 60),
(4811, 'collaborator1', '2024-06-26 15:51:40.924952', '', NULL, NULL, b'1', 5, 22, 60),
(4812, 'collaborator1', '2024-06-26 15:51:40.928950', '', NULL, NULL, b'1', 6, 22, 60),
(4813, 'collaborator1', '2024-06-26 15:51:40.931963', '', NULL, NULL, b'1', 1, 23, 60),
(4814, 'collaborator1', '2024-06-26 15:51:40.934953', '', NULL, NULL, b'1', 2, 23, 60),
(4815, 'collaborator1', '2024-06-26 15:51:40.937948', '', NULL, NULL, b'1', 3, 23, 60),
(4816, 'collaborator1', '2024-06-26 15:51:40.940977', '', NULL, NULL, b'1', 4, 23, 60),
(4817, 'collaborator1', '2024-06-26 15:51:40.944957', '', NULL, NULL, b'1', 5, 23, 60),
(4818, 'collaborator1', '2024-06-26 15:51:40.947948', '', NULL, NULL, b'1', 6, 23, 60),
(4819, 'collaborator1', '2024-06-26 15:51:40.950947', '', NULL, NULL, b'1', 1, 24, 60),
(4820, 'collaborator1', '2024-06-26 15:51:40.954946', '', NULL, NULL, b'1', 2, 24, 60),
(4821, 'collaborator1', '2024-06-26 15:51:40.957952', '', NULL, NULL, b'1', 3, 24, 60),
(4822, 'collaborator1', '2024-06-26 15:51:40.960949', '', NULL, NULL, b'1', 4, 24, 60),
(4823, 'collaborator1', '2024-06-26 15:51:40.963948', '', NULL, NULL, b'1', 5, 24, 60),
(4824, 'collaborator1', '2024-06-26 15:51:40.966948', '', NULL, NULL, b'1', 6, 24, 60),
(4825, 'collaborator1', '2024-06-26 15:51:40.969948', '', NULL, NULL, b'1', 1, 25, 60),
(4826, 'collaborator1', '2024-06-26 15:51:40.972944', '', NULL, NULL, b'1', 2, 25, 60),
(4827, 'collaborator1', '2024-06-26 15:51:40.974946', '', NULL, NULL, b'1', 3, 25, 60),
(4828, 'collaborator1', '2024-06-26 15:51:40.977946', '', NULL, NULL, b'1', 4, 25, 60),
(4829, 'collaborator1', '2024-06-26 15:51:40.980944', '', NULL, NULL, b'1', 5, 25, 60),
(4830, 'collaborator1', '2024-06-26 15:51:40.982949', '', NULL, NULL, b'1', 6, 25, 60),
(4831, 'collaborator1', '2024-06-26 15:51:40.985945', '', NULL, NULL, b'1', 1, 26, 60),
(4832, 'collaborator1', '2024-06-26 15:51:40.987980', '', NULL, NULL, b'1', 2, 26, 60),
(4833, 'collaborator1', '2024-06-26 15:51:40.990979', '', NULL, NULL, b'1', 3, 26, 60),
(4834, 'collaborator1', '2024-06-26 15:51:40.992981', '', NULL, NULL, b'1', 4, 26, 60),
(4835, 'collaborator1', '2024-06-26 15:51:40.995981', '', NULL, NULL, b'1', 5, 26, 60),
(4836, 'collaborator1', '2024-06-26 15:51:40.997981', '', NULL, NULL, b'1', 6, 26, 60),
(4837, 'collaborator1', '2024-06-26 15:51:41.000979', '', NULL, NULL, b'1', 1, 27, 60),
(4838, 'collaborator1', '2024-06-26 15:51:41.003980', '', NULL, NULL, b'1', 2, 27, 60),
(4839, 'collaborator1', '2024-06-26 15:51:41.005980', '', NULL, NULL, b'1', 3, 27, 60),
(4840, 'collaborator1', '2024-06-26 15:51:41.007979', '', NULL, NULL, b'1', 4, 27, 60),
(4841, 'collaborator1', '2024-06-26 15:51:41.011021', '', NULL, NULL, b'1', 5, 27, 60),
(4842, 'collaborator1', '2024-06-26 15:51:41.012979', '', NULL, NULL, b'1', 6, 27, 60),
(4843, 'collaborator1', '2024-06-26 15:51:41.014979', '', NULL, NULL, b'1', 1, 28, 60),
(4844, 'collaborator1', '2024-06-26 15:51:41.017992', '', NULL, NULL, b'1', 2, 28, 60),
(4845, 'collaborator1', '2024-06-26 15:51:41.020027', '', NULL, NULL, b'1', 3, 28, 60),
(4846, 'collaborator1', '2024-06-26 15:51:41.021979', '', NULL, NULL, b'1', 4, 28, 60),
(4847, 'collaborator1', '2024-06-26 15:51:41.024077', '', NULL, NULL, b'1', 5, 28, 60),
(4848, 'collaborator1', '2024-06-26 15:51:41.026978', '', NULL, NULL, b'1', 6, 28, 60),
(4849, 'collaborator1', '2024-06-26 15:51:41.029077', '', NULL, NULL, b'1', 1, 29, 60),
(4850, 'collaborator1', '2024-06-26 15:51:41.031979', '', NULL, NULL, b'1', 2, 29, 60),
(4851, 'collaborator1', '2024-06-26 15:51:41.033995', '', NULL, NULL, b'1', 3, 29, 60),
(4852, 'collaborator1', '2024-06-26 15:51:41.036979', '', NULL, NULL, b'1', 4, 29, 60),
(4853, 'collaborator1', '2024-06-26 15:51:41.038993', '', NULL, NULL, b'1', 5, 29, 60),
(4854, 'collaborator1', '2024-06-26 15:51:41.041132', '', NULL, NULL, b'1', 6, 29, 60),
(4855, 'collaborator1', '2024-06-26 15:51:41.043979', '', NULL, NULL, b'1', 1, 30, 60),
(4856, 'collaborator1', '2024-06-26 15:51:41.046077', '', NULL, NULL, b'1', 2, 30, 60),
(4857, 'collaborator1', '2024-06-26 15:51:41.047993', '', NULL, NULL, b'1', 3, 30, 60),
(4858, 'collaborator1', '2024-06-26 15:51:41.049979', '', NULL, NULL, b'1', 4, 30, 60),
(4859, 'collaborator1', '2024-06-26 15:51:41.052981', '', NULL, NULL, b'1', 5, 30, 60),
(4860, 'collaborator1', '2024-06-26 15:51:41.055076', '', NULL, NULL, b'1', 6, 30, 60),
(4861, 'collaborator1', '2024-06-26 15:51:41.056979', '', NULL, NULL, b'1', 1, 31, 60),
(4862, 'collaborator1', '2024-06-26 15:51:41.058994', '', NULL, NULL, b'1', 2, 31, 60),
(4863, 'collaborator1', '2024-06-26 15:51:41.062111', '', NULL, NULL, b'1', 3, 31, 60),
(4864, 'collaborator1', '2024-06-26 15:51:41.063979', '', NULL, NULL, b'1', 4, 31, 60),
(4865, 'collaborator1', '2024-06-26 15:51:41.066030', '', NULL, NULL, b'1', 5, 31, 60),
(4866, 'collaborator1', '2024-06-26 15:51:41.070020', '', NULL, NULL, b'1', 6, 31, 60),
(4867, 'collaborator1', '2024-06-26 15:51:41.074099', '', NULL, NULL, b'1', 1, 32, 60),
(4868, 'collaborator1', '2024-06-26 15:51:41.078990', '', NULL, NULL, b'1', 2, 32, 60),
(4869, 'collaborator1', '2024-06-26 15:51:41.082989', '', NULL, NULL, b'1', 3, 32, 60),
(4870, 'collaborator1', '2024-06-26 15:51:41.088003', '', NULL, NULL, b'1', 4, 32, 60),
(4871, 'collaborator1', '2024-06-26 15:51:41.093004', '', NULL, NULL, b'1', 5, 32, 60),
(4872, 'collaborator1', '2024-06-26 15:51:41.097991', '', NULL, NULL, b'1', 6, 32, 60),
(4873, 'collaborator1', '2024-06-26 15:51:41.103000', '', NULL, NULL, b'1', 1, 33, 60),
(4874, 'collaborator1', '2024-06-26 15:51:41.107055', '', NULL, NULL, b'1', 2, 33, 60),
(4875, 'collaborator1', '2024-06-26 15:51:41.111987', '', NULL, NULL, b'1', 3, 33, 60),
(4876, 'collaborator1', '2024-06-26 15:51:41.115077', '', NULL, NULL, b'1', 4, 33, 60),
(4877, 'collaborator1', '2024-06-26 15:51:41.117987', '', NULL, NULL, b'1', 5, 33, 60),
(4878, 'collaborator1', '2024-06-26 15:51:41.121985', '', NULL, NULL, b'1', 6, 33, 60),
(4879, 'collaborator1', '2024-06-26 15:51:41.124984', '', NULL, NULL, b'1', 1, 34, 60),
(4880, 'collaborator1', '2024-06-26 15:51:41.129080', '', NULL, NULL, b'1', 2, 34, 60),
(4881, 'collaborator1', '2024-06-26 15:51:41.131983', '', NULL, NULL, b'1', 3, 34, 60),
(4882, 'collaborator1', '2024-06-26 15:51:41.133989', '', NULL, NULL, b'1', 4, 34, 60),
(4883, 'collaborator1', '2024-06-26 15:51:41.137067', '', NULL, NULL, b'1', 5, 34, 60),
(4884, 'collaborator1', '2024-06-26 15:51:41.139987', '', NULL, NULL, b'1', 6, 34, 60),
(4885, 'collaborator1', '2024-06-26 15:51:41.144993', '', NULL, NULL, b'1', 1, 35, 60),
(4886, 'collaborator1', '2024-06-26 15:51:41.147988', '', NULL, NULL, b'1', 2, 35, 60),
(4887, 'collaborator1', '2024-06-26 15:51:41.149984', '', NULL, NULL, b'1', 3, 35, 60),
(4888, 'collaborator1', '2024-06-26 15:51:41.153030', '', NULL, NULL, b'1', 4, 35, 60),
(4889, 'collaborator1', '2024-06-26 15:51:41.156024', '', NULL, NULL, b'1', 5, 35, 60),
(4890, 'collaborator1', '2024-06-26 15:51:41.158985', '', NULL, NULL, b'1', 6, 35, 60),
(4891, 'collaborator1', '2024-06-26 15:51:41.161980', '', NULL, NULL, b'1', 1, 36, 60),
(4892, 'collaborator1', '2024-06-26 15:51:41.164018', '', NULL, NULL, b'1', 2, 36, 60),
(4893, 'collaborator1', '2024-06-26 15:51:41.165982', '', NULL, NULL, b'1', 3, 36, 60),
(4894, 'collaborator1', '2024-06-26 15:51:41.169078', '', NULL, NULL, b'1', 4, 36, 60),
(4895, 'collaborator1', '2024-06-26 15:51:41.171062', '', NULL, NULL, b'1', 5, 36, 60),
(4896, 'collaborator1', '2024-06-26 15:51:41.173077', '', NULL, NULL, b'1', 6, 36, 60),
(4897, 'collaborator1', '2024-06-26 15:51:41.174980', '', NULL, NULL, b'1', 1, 37, 60),
(4898, 'collaborator1', '2024-06-26 15:51:41.177979', '', NULL, NULL, b'1', 2, 37, 60),
(4899, 'collaborator1', '2024-06-26 15:51:41.180108', '', NULL, NULL, b'1', 3, 37, 60),
(4900, 'collaborator1', '2024-06-26 15:51:41.182079', '', NULL, NULL, b'1', 4, 37, 60),
(4901, 'collaborator1', '2024-06-26 15:51:41.186985', '', NULL, NULL, b'1', 5, 37, 60),
(4902, 'collaborator1', '2024-06-26 15:51:41.191034', '', NULL, NULL, b'1', 6, 37, 60),
(4903, 'collaborator1', '2024-06-26 15:51:41.195995', '', NULL, NULL, b'1', 1, 38, 60),
(4904, 'collaborator1', '2024-06-26 15:51:41.199999', '', NULL, NULL, b'1', 2, 38, 60),
(4905, 'collaborator1', '2024-06-26 15:51:41.204991', '', NULL, NULL, b'1', 3, 38, 60),
(4906, 'collaborator1', '2024-06-26 15:51:41.207987', '', NULL, NULL, b'1', 4, 38, 60),
(4907, 'collaborator1', '2024-06-26 15:51:41.211988', '', NULL, NULL, b'1', 5, 38, 60),
(4908, 'collaborator1', '2024-06-26 15:51:41.216026', '', NULL, NULL, b'1', 6, 38, 60),
(4909, 'collaborator1', '2024-06-26 15:51:41.218988', '', NULL, NULL, b'1', 1, 39, 60),
(4910, 'collaborator1', '2024-06-26 15:51:41.222024', '', NULL, NULL, b'1', 2, 39, 60),
(4911, 'collaborator1', '2024-06-26 15:51:41.224981', '', NULL, NULL, b'1', 3, 39, 60),
(4912, 'collaborator1', '2024-06-26 15:51:41.227979', '', NULL, NULL, b'1', 4, 39, 60),
(4913, 'collaborator1', '2024-06-26 15:51:41.231008', '', NULL, NULL, b'1', 5, 39, 60),
(4914, 'collaborator1', '2024-06-26 15:51:41.235028', '', NULL, NULL, b'1', 6, 39, 60),
(4915, 'collaborator1', '2024-06-26 15:51:41.239995', '', NULL, NULL, b'1', 1, 40, 60),
(4916, 'collaborator1', '2024-06-26 15:51:41.243995', '', NULL, NULL, b'1', 2, 40, 60),
(4917, 'collaborator1', '2024-06-26 15:51:41.247994', '', NULL, NULL, b'1', 3, 40, 60),
(4918, 'collaborator1', '2024-06-26 15:51:41.252999', '', NULL, NULL, b'1', 4, 40, 60),
(4919, 'collaborator1', '2024-06-26 15:51:41.257984', '', NULL, NULL, b'1', 5, 40, 60),
(4920, 'collaborator1', '2024-06-26 15:51:41.261986', '', NULL, NULL, b'1', 6, 40, 60),
(4921, 'collaborator1', '2024-06-26 15:51:41.265035', '', NULL, NULL, b'1', 1, 41, 60),
(4922, 'collaborator1', '2024-06-26 15:51:41.267990', '', NULL, NULL, b'1', 2, 41, 60),
(4923, 'collaborator1', '2024-06-26 15:51:41.272032', '', NULL, NULL, b'1', 3, 41, 60),
(4924, 'collaborator1', '2024-06-26 15:51:41.274985', '', NULL, NULL, b'1', 4, 41, 60),
(4925, 'collaborator1', '2024-06-26 15:51:41.278985', '', NULL, NULL, b'1', 5, 41, 60),
(4926, 'collaborator1', '2024-06-26 15:51:41.282031', '', NULL, NULL, b'1', 6, 41, 60),
(4927, 'collaborator1', '2024-06-26 15:51:41.285986', '', NULL, NULL, b'1', 1, 42, 60),
(4928, 'collaborator1', '2024-06-26 15:51:41.289038', '', NULL, NULL, b'1', 2, 42, 60),
(4929, 'collaborator1', '2024-06-26 15:51:41.291984', '', NULL, NULL, b'1', 3, 42, 60),
(4930, 'collaborator1', '2024-06-26 15:51:41.294992', '', NULL, NULL, b'1', 4, 42, 60),
(4931, 'collaborator1', '2024-06-26 15:51:41.299034', '', NULL, NULL, b'1', 5, 42, 60),
(4932, 'collaborator1', '2024-06-26 15:51:41.301986', '', NULL, NULL, b'1', 6, 42, 60),
(4933, 'collaborator1', '2024-06-26 15:51:41.305071', '', NULL, NULL, b'1', 1, 43, 60),
(4934, 'collaborator1', '2024-06-26 15:51:41.307985', '', NULL, NULL, b'1', 2, 43, 60),
(4935, 'collaborator1', '2024-06-26 15:51:41.311985', '', NULL, NULL, b'1', 3, 43, 60),
(4936, 'collaborator1', '2024-06-26 15:51:41.316032', '', NULL, NULL, b'1', 4, 43, 60),
(4937, 'collaborator1', '2024-06-26 15:51:41.318987', '', NULL, NULL, b'1', 5, 43, 60),
(4938, 'collaborator1', '2024-06-26 15:51:41.322071', '', NULL, NULL, b'1', 6, 43, 60),
(4939, 'collaborator1', '2024-06-26 15:51:41.325982', '', NULL, NULL, b'1', 1, 44, 60),
(4940, 'collaborator1', '2024-06-26 15:51:41.329027', '', NULL, NULL, b'1', 2, 44, 60),
(4941, 'collaborator1', '2024-06-26 15:51:41.332988', '', NULL, NULL, b'1', 3, 44, 60),
(4942, 'collaborator1', '2024-06-26 15:51:41.336992', '', NULL, NULL, b'1', 4, 44, 60),
(4943, 'collaborator1', '2024-06-26 15:51:41.339989', '', NULL, NULL, b'1', 5, 44, 60);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(4944, 'collaborator1', '2024-06-26 15:51:41.342992', '', NULL, NULL, b'1', 6, 44, 60),
(4945, 'collaborator1', '2024-06-26 15:51:41.347025', '', NULL, NULL, b'1', 1, 45, 60),
(4946, 'collaborator1', '2024-06-26 15:51:41.349980', '', NULL, NULL, b'1', 2, 45, 60),
(4947, 'collaborator1', '2024-06-26 15:51:41.353026', '', NULL, NULL, b'1', 3, 45, 60),
(4948, 'collaborator1', '2024-06-26 15:51:41.356024', '', NULL, NULL, b'1', 4, 45, 60),
(4949, 'collaborator1', '2024-06-26 15:51:41.358998', '', NULL, NULL, b'1', 5, 45, 60),
(4950, 'collaborator1', '2024-06-26 15:51:41.362020', '', NULL, NULL, b'1', 6, 45, 60),
(4951, 'collaborator1', '2024-06-26 15:51:41.365022', '', NULL, NULL, b'1', 1, 46, 60),
(4952, 'collaborator1', '2024-06-26 15:51:41.366985', '', NULL, NULL, b'1', 2, 46, 60),
(4953, 'collaborator1', '2024-06-26 15:51:41.369982', '', NULL, NULL, b'1', 3, 46, 60),
(4954, 'collaborator1', '2024-06-26 15:51:41.372983', '', NULL, NULL, b'1', 4, 46, 60),
(4955, 'collaborator1', '2024-06-26 15:51:41.374987', '', NULL, NULL, b'1', 5, 46, 60),
(4956, 'collaborator1', '2024-06-26 15:51:41.377981', '', NULL, NULL, b'1', 6, 46, 60),
(4957, 'collaborator1', '2024-06-26 15:51:41.380075', '', NULL, NULL, b'1', 1, 47, 60),
(4958, 'collaborator1', '2024-06-26 15:51:41.382076', '', NULL, NULL, b'1', 2, 47, 60),
(4959, 'collaborator1', '2024-06-26 15:51:41.385050', '', NULL, NULL, b'1', 3, 47, 60),
(4960, 'collaborator1', '2024-06-26 15:51:41.389052', '', NULL, NULL, b'1', 4, 47, 60),
(4961, 'collaborator1', '2024-06-26 15:51:41.393990', '', NULL, NULL, b'1', 5, 47, 60),
(4962, 'collaborator1', '2024-06-26 15:51:41.397989', '', NULL, NULL, b'1', 6, 47, 60),
(4963, 'collaborator1', '2024-06-26 15:51:41.403001', '', NULL, NULL, b'1', 1, 48, 60),
(4964, 'collaborator1', '2024-06-26 15:51:41.406993', '', NULL, NULL, b'1', 2, 48, 60),
(4965, 'collaborator1', '2024-06-26 15:51:41.412992', '', NULL, NULL, b'1', 3, 48, 60),
(4966, 'collaborator1', '2024-06-26 15:51:41.416041', '', NULL, NULL, b'1', 4, 48, 60),
(4967, 'collaborator1', '2024-06-26 15:51:41.420987', '', NULL, NULL, b'1', 5, 48, 60),
(4968, 'collaborator1', '2024-06-26 15:51:41.424986', '', NULL, NULL, b'1', 6, 48, 60),
(4969, 'collaborator1', '2024-06-26 15:51:41.427986', '', NULL, NULL, b'1', 1, 49, 60),
(4970, 'collaborator1', '2024-06-26 15:51:41.430982', '', NULL, NULL, b'1', 2, 49, 60),
(4971, 'collaborator1', '2024-06-26 15:51:41.433987', '', NULL, NULL, b'1', 3, 49, 60),
(4972, 'collaborator1', '2024-06-26 15:51:41.435984', '', NULL, NULL, b'1', 4, 49, 60),
(4973, 'collaborator1', '2024-06-26 15:51:41.439070', '', NULL, NULL, b'1', 5, 49, 60),
(4974, 'collaborator1', '2024-06-26 15:51:41.441037', '', NULL, NULL, b'1', 6, 49, 60),
(4975, 'collaborator1', '2024-06-26 15:51:41.444065', '', NULL, NULL, b'1', 1, 50, 60),
(4976, 'collaborator1', '2024-06-26 15:51:41.447069', '', NULL, NULL, b'1', 2, 50, 60),
(4977, 'collaborator1', '2024-06-26 15:51:41.449069', '', NULL, NULL, b'1', 3, 50, 60),
(4978, 'collaborator1', '2024-06-26 15:51:41.452095', '', NULL, NULL, b'1', 4, 50, 60),
(4979, 'collaborator1', '2024-06-26 15:51:41.455067', '', NULL, NULL, b'1', 5, 50, 60),
(4980, 'collaborator1', '2024-06-26 15:51:41.457982', '', NULL, NULL, b'1', 6, 50, 60),
(4981, 'collaborator1', '2024-06-26 15:51:41.461023', '', NULL, NULL, b'1', 1, 51, 60),
(4982, 'collaborator1', '2024-06-26 15:51:41.463022', '', NULL, NULL, b'1', 2, 51, 60),
(4983, 'collaborator1', '2024-06-26 15:51:41.464980', '', NULL, NULL, b'1', 3, 51, 60),
(4984, 'collaborator1', '2024-06-26 15:51:41.467980', '', NULL, NULL, b'1', 4, 51, 60),
(4985, 'collaborator1', '2024-06-26 15:51:41.471062', '', NULL, NULL, b'1', 5, 51, 60),
(4986, 'collaborator1', '2024-06-26 15:51:41.473020', '', NULL, NULL, b'1', 6, 51, 60),
(4987, 'collaborator1', '2024-06-26 15:51:41.475982', '', NULL, NULL, b'1', 1, 52, 60),
(4988, 'collaborator1', '2024-06-26 15:51:41.479021', '', NULL, NULL, b'1', 2, 52, 60),
(4989, 'collaborator1', '2024-06-26 15:51:41.481080', '', NULL, NULL, b'1', 3, 52, 60),
(4990, 'collaborator1', '2024-06-26 15:51:41.483983', '', NULL, NULL, b'1', 4, 52, 60),
(4991, 'collaborator1', '2024-06-26 15:51:41.485981', '', NULL, NULL, b'1', 5, 52, 60),
(4992, 'collaborator1', '2024-06-26 15:51:41.489020', '', NULL, NULL, b'1', 6, 52, 60),
(4993, 'collaborator1', '2024-06-26 15:51:41.491024', '', NULL, NULL, b'1', 1, 53, 60),
(4994, 'collaborator1', '2024-06-26 15:51:41.494020', '', NULL, NULL, b'1', 2, 53, 60),
(4995, 'collaborator1', '2024-06-26 15:51:41.496986', '', NULL, NULL, b'1', 3, 53, 60),
(4996, 'collaborator1', '2024-06-26 15:51:41.499982', '', NULL, NULL, b'1', 4, 53, 60),
(4997, 'collaborator1', '2024-06-26 15:51:41.502982', '', NULL, NULL, b'1', 5, 53, 60),
(4998, 'collaborator1', '2024-06-26 15:51:41.505068', '', NULL, NULL, b'1', 6, 53, 60),
(4999, 'collaborator1', '2024-06-26 15:51:41.507983', '', NULL, NULL, b'1', 1, 54, 60),
(5000, 'collaborator1', '2024-06-26 15:51:41.511025', '', NULL, NULL, b'1', 2, 54, 60),
(5001, 'collaborator1', '2024-06-26 15:51:41.513065', '', NULL, NULL, b'1', 3, 54, 60),
(5002, 'collaborator1', '2024-06-26 15:51:41.514981', '', NULL, NULL, b'1', 4, 54, 60),
(5003, 'collaborator1', '2024-06-26 15:51:41.517987', '', NULL, NULL, b'1', 5, 54, 60),
(5004, 'collaborator1', '2024-06-26 15:51:41.520983', '', NULL, NULL, b'1', 6, 54, 60),
(5005, 'collaborator1', '2024-06-26 15:51:41.522980', '', NULL, NULL, b'1', 1, 55, 60),
(5006, 'collaborator1', '2024-06-26 15:51:41.524979', '', NULL, NULL, b'1', 2, 55, 60),
(5007, 'collaborator1', '2024-06-26 15:51:41.526979', '', NULL, NULL, b'1', 3, 55, 60),
(5008, 'collaborator1', '2024-06-26 15:51:41.529036', '', NULL, NULL, b'1', 4, 55, 60),
(5009, 'collaborator1', '2024-06-26 15:51:41.531040', '', NULL, NULL, b'1', 5, 55, 60),
(5010, 'collaborator1', '2024-06-26 15:51:41.532981', '', NULL, NULL, b'1', 6, 55, 60),
(5011, 'collaborator1', '2024-06-26 15:51:41.535993', '', NULL, NULL, b'1', 1, 56, 60),
(5012, 'collaborator1', '2024-06-26 15:51:41.537979', '', NULL, NULL, b'1', 2, 56, 60),
(5013, 'collaborator1', '2024-06-26 15:51:41.539978', '', NULL, NULL, b'1', 3, 56, 60),
(5014, 'collaborator1', '2024-06-26 15:51:41.541988', '', NULL, NULL, b'1', 4, 56, 60),
(5015, 'collaborator1', '2024-06-26 15:51:41.544978', '', NULL, NULL, b'1', 5, 56, 60),
(5016, 'collaborator1', '2024-06-26 15:51:41.545979', '', NULL, NULL, b'1', 6, 56, 60),
(5017, 'collaborator1', '2024-06-26 15:51:41.547978', '', NULL, NULL, b'1', 1, 57, 60),
(5018, 'collaborator1', '2024-06-26 15:51:41.550979', '', NULL, NULL, b'1', 2, 57, 60),
(5019, 'collaborator1', '2024-06-26 15:51:41.553030', '', NULL, NULL, b'1', 3, 57, 60),
(5020, 'collaborator1', '2024-06-26 15:51:41.554981', '', NULL, NULL, b'1', 4, 57, 60),
(5021, 'collaborator1', '2024-06-26 15:51:41.557981', '', NULL, NULL, b'1', 5, 57, 60),
(5022, 'collaborator1', '2024-06-26 15:51:41.560978', '', NULL, NULL, b'1', 6, 57, 60),
(5023, 'collaborator1', '2024-06-26 15:51:41.562979', '', NULL, NULL, b'1', 1, 58, 60),
(5024, 'collaborator1', '2024-06-26 15:51:41.565018', '', NULL, NULL, b'1', 2, 58, 60),
(5025, 'collaborator1', '2024-06-26 15:51:41.566980', '', NULL, NULL, b'1', 3, 58, 60),
(5026, 'collaborator1', '2024-06-26 15:51:41.569076', '', NULL, NULL, b'1', 4, 58, 60),
(5027, 'collaborator1', '2024-06-26 15:51:41.571076', '', NULL, NULL, b'1', 5, 58, 60),
(5028, 'collaborator1', '2024-06-26 15:51:41.573077', '', NULL, NULL, b'1', 6, 58, 60),
(5029, 'collaborator1', '2024-06-26 15:51:41.574990', '', NULL, NULL, b'1', 1, 59, 60),
(5030, 'collaborator1', '2024-06-26 15:51:41.577982', '', NULL, NULL, b'1', 2, 59, 60),
(5031, 'collaborator1', '2024-06-26 15:51:41.580032', '', NULL, NULL, b'1', 3, 59, 60),
(5032, 'collaborator1', '2024-06-26 15:51:41.582075', '', NULL, NULL, b'1', 4, 59, 60),
(5033, 'collaborator1', '2024-06-26 15:51:41.583979', '', NULL, NULL, b'1', 5, 59, 60),
(5034, 'collaborator1', '2024-06-26 15:51:41.587021', '', NULL, NULL, b'1', 6, 59, 60),
(5035, 'collaborator1', '2024-06-26 15:51:41.589080', '', NULL, NULL, b'1', 1, 60, 60),
(5036, 'collaborator1', '2024-06-26 15:51:41.591041', '', NULL, NULL, b'1', 2, 60, 60),
(5037, 'collaborator1', '2024-06-26 15:51:41.592986', '', NULL, NULL, b'1', 3, 60, 60),
(5038, 'collaborator1', '2024-06-26 15:51:41.596024', '', NULL, NULL, b'1', 4, 60, 60),
(5039, 'collaborator1', '2024-06-26 15:51:41.597980', '', NULL, NULL, b'1', 5, 60, 60),
(5040, 'collaborator1', '2024-06-26 15:51:41.599992', '', NULL, NULL, b'1', 6, 60, 60),
(5041, 'collaborator1', '2024-06-26 15:51:41.602982', '', NULL, NULL, b'1', 1, 61, 60),
(5042, 'collaborator1', '2024-06-26 15:51:41.606018', '', NULL, NULL, b'1', 2, 61, 60),
(5043, 'collaborator1', '2024-06-26 15:51:41.608989', '', NULL, NULL, b'1', 3, 61, 60),
(5044, 'collaborator1', '2024-06-26 15:51:41.611019', '', NULL, NULL, b'1', 4, 61, 60),
(5045, 'collaborator1', '2024-06-26 15:51:41.613076', '', NULL, NULL, b'1', 5, 61, 60),
(5046, 'collaborator1', '2024-06-26 15:51:41.615076', '', NULL, NULL, b'1', 6, 61, 60),
(5047, 'collaborator1', '2024-06-26 15:51:41.616982', '', NULL, NULL, b'1', 1, 62, 60),
(5048, 'collaborator1', '2024-06-26 15:51:41.620022', '', NULL, NULL, b'1', 2, 62, 60),
(5049, 'collaborator1', '2024-06-26 15:51:41.622045', '', NULL, NULL, b'1', 3, 62, 60),
(5050, 'collaborator1', '2024-06-26 15:51:41.624077', '', NULL, NULL, b'1', 4, 62, 60),
(5051, 'collaborator1', '2024-06-26 15:51:41.628990', '', NULL, NULL, b'1', 5, 62, 60),
(5052, 'collaborator1', '2024-06-26 15:51:41.633989', '', NULL, NULL, b'1', 6, 62, 60),
(5053, 'collaborator1', '2024-06-26 15:51:41.639047', '', NULL, NULL, b'1', 1, 63, 60),
(5054, 'collaborator1', '2024-06-26 15:51:41.643995', '', NULL, NULL, b'1', 2, 63, 60),
(5055, 'collaborator1', '2024-06-26 15:51:41.648045', '', NULL, NULL, b'1', 3, 63, 60),
(5056, 'collaborator1', '2024-06-26 15:51:41.654046', '', NULL, NULL, b'1', 4, 63, 60),
(5057, 'collaborator1', '2024-06-26 15:51:41.657989', '', NULL, NULL, b'1', 5, 63, 60),
(5058, 'collaborator1', '2024-06-26 15:51:41.663989', '', NULL, NULL, b'1', 6, 63, 60),
(5059, 'collaborator1', '2024-06-26 15:51:41.667994', '', NULL, NULL, b'1', 1, 64, 60),
(5060, 'collaborator1', '2024-06-26 15:51:41.672039', '', NULL, NULL, b'1', 2, 64, 60),
(5061, 'collaborator1', '2024-06-26 15:51:41.674988', '', NULL, NULL, b'1', 3, 64, 60),
(5062, 'collaborator1', '2024-06-26 15:51:41.679035', '', NULL, NULL, b'1', 4, 64, 60),
(5063, 'collaborator1', '2024-06-26 15:51:41.681986', '', NULL, NULL, b'1', 5, 64, 60),
(5064, 'collaborator1', '2024-06-26 15:51:41.685986', '', NULL, NULL, b'1', 6, 64, 60),
(5065, 'collaborator1', '2024-06-26 15:51:41.689073', '', NULL, NULL, b'1', 1, 65, 60),
(5066, 'collaborator1', '2024-06-26 15:51:41.692990', '', NULL, NULL, b'1', 2, 65, 60),
(5067, 'collaborator1', '2024-06-26 15:51:41.696069', '', NULL, NULL, b'1', 3, 65, 60),
(5068, 'collaborator1', '2024-06-26 15:51:41.710045', '', NULL, NULL, b'1', 4, 65, 60),
(5069, 'collaborator1', '2024-06-26 15:51:41.714987', '', NULL, NULL, b'1', 5, 65, 60),
(5070, 'collaborator1', '2024-06-26 15:51:41.720056', '', NULL, NULL, b'1', 6, 65, 60),
(5071, 'collaborator1', '2024-06-26 15:51:41.723991', '', NULL, NULL, b'1', 1, 66, 60),
(5072, 'collaborator1', '2024-06-26 15:51:41.730040', '', NULL, NULL, b'1', 2, 66, 60),
(5073, 'collaborator1', '2024-06-26 15:51:41.734021', '', NULL, NULL, b'1', 3, 66, 60),
(5074, 'collaborator1', '2024-06-26 15:51:41.739049', '', NULL, NULL, b'1', 4, 66, 60),
(5075, 'collaborator1', '2024-06-26 15:51:41.743011', '', NULL, NULL, b'1', 5, 66, 60),
(5076, 'collaborator1', '2024-06-26 15:51:41.747998', '', NULL, NULL, b'1', 6, 66, 60),
(5077, 'collaborator1', '2024-06-26 15:51:41.752987', '', NULL, NULL, b'1', 1, 67, 60),
(5078, 'collaborator1', '2024-06-26 15:51:41.756985', '', NULL, NULL, b'1', 2, 67, 60),
(5079, 'collaborator1', '2024-06-26 15:51:41.760987', '', NULL, NULL, b'1', 3, 67, 60),
(5080, 'collaborator1', '2024-06-26 15:51:41.763984', '', NULL, NULL, b'1', 4, 67, 60),
(5081, 'collaborator1', '2024-06-26 15:51:41.766987', '', NULL, NULL, b'1', 5, 67, 60),
(5082, 'collaborator1', '2024-06-26 15:51:41.770027', '', NULL, NULL, b'1', 6, 67, 60),
(5083, 'collaborator1', '2024-06-26 15:51:41.772980', '', NULL, NULL, b'1', 1, 68, 60),
(5084, 'collaborator1', '2024-06-26 15:51:41.774983', '', NULL, NULL, b'1', 2, 68, 60),
(5085, 'collaborator1', '2024-06-26 15:51:41.777980', '', NULL, NULL, b'1', 3, 68, 60),
(5086, 'collaborator1', '2024-06-26 15:51:41.780006', '', NULL, NULL, b'1', 4, 68, 60),
(5087, 'collaborator1', '2024-06-26 15:51:41.782005', '', NULL, NULL, b'1', 5, 68, 60),
(5088, 'collaborator1', '2024-06-26 15:51:41.784980', '', NULL, NULL, b'1', 6, 68, 60),
(5089, 'collaborator1', '2024-06-26 15:51:41.786997', '', NULL, NULL, b'1', 1, 69, 60),
(5090, 'collaborator1', '2024-06-26 15:51:41.789005', '', NULL, NULL, b'1', 2, 69, 60),
(5091, 'collaborator1', '2024-06-26 15:51:41.790980', '', NULL, NULL, b'1', 3, 69, 60),
(5092, 'collaborator1', '2024-06-26 15:51:41.793980', '', NULL, NULL, b'1', 4, 69, 60),
(5093, 'collaborator1', '2024-06-26 15:51:41.796054', '', NULL, NULL, b'1', 5, 69, 60),
(5094, 'collaborator1', '2024-06-26 15:51:41.798088', '', NULL, NULL, b'1', 6, 69, 60),
(5095, 'collaborator1', '2024-06-26 15:51:41.800095', '', NULL, NULL, b'1', 1, 70, 60),
(5096, 'collaborator1', '2024-06-26 15:51:41.802089', '', NULL, NULL, b'1', 2, 70, 60),
(5097, 'collaborator1', '2024-06-26 15:51:41.805091', '', NULL, NULL, b'1', 3, 70, 60),
(5098, 'collaborator1', '2024-06-26 15:51:41.807091', '', NULL, NULL, b'1', 4, 70, 60),
(5099, 'collaborator1', '2024-06-26 15:51:41.810091', '', NULL, NULL, b'1', 5, 70, 60),
(5100, 'collaborator1', '2024-06-26 15:51:41.812090', '', NULL, NULL, b'1', 6, 70, 60),
(5101, 'collaborator1', '2024-06-26 15:51:41.814089', '', NULL, NULL, b'1', 1, 71, 60),
(5102, 'collaborator1', '2024-06-26 15:51:41.817097', '', NULL, NULL, b'1', 2, 71, 60),
(5103, 'collaborator1', '2024-06-26 15:51:41.819128', '', NULL, NULL, b'1', 3, 71, 60),
(5104, 'collaborator1', '2024-06-26 15:51:41.821088', '', NULL, NULL, b'1', 4, 71, 60),
(5105, 'collaborator1', '2024-06-26 15:51:41.823108', '', NULL, NULL, b'1', 5, 71, 60),
(5106, 'collaborator1', '2024-06-26 15:51:41.826095', '', NULL, NULL, b'1', 6, 71, 60),
(5107, 'collaborator1', '2024-06-26 15:51:41.829089', '', NULL, NULL, b'1', 1, 72, 60),
(5108, 'collaborator1', '2024-06-26 15:51:41.831108', '', NULL, NULL, b'1', 2, 72, 60),
(5109, 'collaborator1', '2024-06-26 15:51:41.833089', '', NULL, NULL, b'1', 3, 72, 60),
(5110, 'collaborator1', '2024-06-26 15:51:41.836092', '', NULL, NULL, b'1', 4, 72, 60),
(5111, 'collaborator1', '2024-06-26 15:51:41.838093', '', NULL, NULL, b'1', 5, 72, 60),
(5112, 'collaborator1', '2024-06-26 15:51:41.841089', '', NULL, NULL, b'1', 6, 72, 60),
(5113, 'collaborator1', '2024-06-26 15:51:41.844097', '', NULL, NULL, b'1', 1, 73, 60),
(5114, 'collaborator1', '2024-06-26 15:51:41.848096', '', NULL, NULL, b'1', 2, 73, 60),
(5115, 'collaborator1', '2024-06-26 15:51:41.853101', '', NULL, NULL, b'1', 3, 73, 60),
(5116, 'collaborator1', '2024-06-26 15:51:41.858097', '', NULL, NULL, b'1', 4, 73, 60),
(5117, 'collaborator1', '2024-06-26 15:51:41.863097', '', NULL, NULL, b'1', 5, 73, 60),
(5118, 'collaborator1', '2024-06-26 15:51:41.868101', '', NULL, NULL, b'1', 6, 73, 60),
(5119, 'collaborator1', '2024-06-26 15:51:41.873094', '', NULL, NULL, b'1', 1, 74, 60),
(5120, 'collaborator1', '2024-06-26 15:51:41.878102', '', NULL, NULL, b'1', 2, 74, 60),
(5121, 'collaborator1', '2024-06-26 15:51:41.881101', '', NULL, NULL, b'1', 3, 74, 60),
(5122, 'collaborator1', '2024-06-26 15:51:41.885098', '', NULL, NULL, b'1', 4, 74, 60),
(5123, 'collaborator1', '2024-06-26 15:51:41.888092', '', NULL, NULL, b'1', 5, 74, 60),
(5124, 'collaborator1', '2024-06-26 15:51:41.891092', '', NULL, NULL, b'1', 6, 74, 60),
(5125, 'collaborator1', '2024-06-26 15:51:41.895134', '', NULL, NULL, b'1', 1, 75, 60),
(5126, 'collaborator1', '2024-06-26 15:51:41.897089', '', NULL, NULL, b'1', 2, 75, 60),
(5127, 'collaborator1', '2024-06-26 15:51:41.900094', '', NULL, NULL, b'1', 3, 75, 60),
(5128, 'collaborator1', '2024-06-26 15:51:41.903090', '', NULL, NULL, b'1', 4, 75, 60),
(5129, 'collaborator1', '2024-06-26 15:51:41.906089', '', NULL, NULL, b'1', 5, 75, 60),
(5130, 'collaborator1', '2024-06-26 15:51:41.909091', '', NULL, NULL, b'1', 6, 75, 60),
(5131, 'collaborator1', '2024-06-26 15:51:41.912088', '', NULL, NULL, b'1', 1, 76, 60),
(5132, 'collaborator1', '2024-06-26 15:51:41.914090', '', NULL, NULL, b'1', 2, 76, 60),
(5133, 'collaborator1', '2024-06-26 15:51:41.917096', '', NULL, NULL, b'1', 3, 76, 60),
(5134, 'collaborator1', '2024-06-26 15:51:41.920088', '', NULL, NULL, b'1', 4, 76, 60),
(5135, 'collaborator1', '2024-06-26 15:51:41.923122', '', NULL, NULL, b'1', 5, 76, 60),
(5136, 'collaborator1', '2024-06-26 15:51:41.926100', '', NULL, NULL, b'1', 6, 76, 60),
(5137, 'collaborator1', '2024-06-26 15:51:41.929090', '', NULL, NULL, b'1', 1, 77, 60),
(5138, 'collaborator1', '2024-06-26 15:51:41.931125', '', NULL, NULL, b'1', 2, 77, 60),
(5139, 'collaborator1', '2024-06-26 15:51:41.934093', '', NULL, NULL, b'1', 3, 77, 60),
(5140, 'collaborator1', '2024-06-26 15:51:41.937091', '', NULL, NULL, b'1', 4, 77, 60),
(5141, 'collaborator1', '2024-06-26 15:51:41.940091', '', NULL, NULL, b'1', 5, 77, 60),
(5142, 'collaborator1', '2024-06-26 15:51:41.943103', '', NULL, NULL, b'1', 6, 77, 60),
(5143, 'collaborator1', '2024-06-26 15:51:41.945091', '', NULL, NULL, b'1', 1, 78, 60),
(5144, 'collaborator1', '2024-06-26 15:51:41.948090', '', NULL, NULL, b'1', 2, 78, 60),
(5145, 'collaborator1', '2024-06-26 15:51:41.951093', '', NULL, NULL, b'1', 3, 78, 60),
(5146, 'collaborator1', '2024-06-26 15:51:41.954093', '', NULL, NULL, b'1', 4, 78, 60),
(5147, 'collaborator1', '2024-06-26 15:51:41.956090', '', NULL, NULL, b'1', 5, 78, 60),
(5148, 'collaborator1', '2024-06-26 15:51:41.959098', '', NULL, NULL, b'1', 6, 78, 60),
(5149, 'collaborator1', '2024-06-26 15:51:59.987862', '', NULL, NULL, b'1', 1, 1, 61),
(5150, 'collaborator1', '2024-06-26 15:51:59.990866', '', NULL, NULL, b'1', 2, 1, 61),
(5151, 'collaborator1', '2024-06-26 15:51:59.994863', '', NULL, NULL, b'1', 3, 1, 61),
(5152, 'collaborator1', '2024-06-26 15:51:59.996902', '', NULL, NULL, b'1', 4, 1, 61),
(5153, 'collaborator1', '2024-06-26 15:51:59.999871', '', NULL, NULL, b'1', 5, 1, 61),
(5154, 'collaborator1', '2024-06-26 15:52:00.002870', '', NULL, NULL, b'1', 6, 1, 61),
(5155, 'collaborator1', '2024-06-26 15:52:00.004867', '', NULL, NULL, b'1', 1, 2, 61),
(5156, 'collaborator1', '2024-06-26 15:52:00.007866', '', NULL, NULL, b'1', 2, 2, 61),
(5157, 'collaborator1', '2024-06-26 15:52:00.010878', '', NULL, NULL, b'1', 3, 2, 61),
(5158, 'collaborator1', '2024-06-26 15:52:00.012862', '', NULL, NULL, b'1', 4, 2, 61),
(5159, 'collaborator1', '2024-06-26 15:52:00.015864', '', NULL, NULL, b'1', 5, 2, 61),
(5160, 'collaborator1', '2024-06-26 15:52:00.018867', '', NULL, NULL, b'1', 6, 2, 61),
(5161, 'collaborator1', '2024-06-26 15:52:00.020863', '', NULL, NULL, b'1', 1, 3, 61),
(5162, 'collaborator1', '2024-06-26 15:52:00.023867', '', NULL, NULL, b'1', 2, 3, 61),
(5163, 'collaborator1', '2024-06-26 15:52:00.025870', '', NULL, NULL, b'1', 3, 3, 61),
(5164, 'collaborator1', '2024-06-26 15:52:00.028867', '', NULL, NULL, b'1', 4, 3, 61),
(5165, 'collaborator1', '2024-06-26 15:52:00.031866', '', NULL, NULL, b'1', 5, 3, 61),
(5166, 'collaborator1', '2024-06-26 15:52:00.033865', '', NULL, NULL, b'1', 6, 3, 61),
(5167, 'collaborator1', '2024-06-26 15:52:00.036862', '', NULL, NULL, b'1', 1, 4, 61),
(5168, 'collaborator1', '2024-06-26 15:52:00.038866', '', NULL, NULL, b'1', 2, 4, 61),
(5169, 'collaborator1', '2024-06-26 15:52:00.041904', '', NULL, NULL, b'1', 3, 4, 61),
(5170, 'collaborator1', '2024-06-26 15:52:00.044866', '', NULL, NULL, b'1', 4, 4, 61),
(5171, 'collaborator1', '2024-06-26 15:52:00.046865', '', NULL, NULL, b'1', 5, 4, 61),
(5172, 'collaborator1', '2024-06-26 15:52:00.048909', '', NULL, NULL, b'1', 6, 4, 61),
(5173, 'collaborator1', '2024-06-26 15:52:00.051877', '', NULL, NULL, b'1', 1, 5, 61),
(5174, 'collaborator1', '2024-06-26 15:52:00.053903', '', NULL, NULL, b'1', 2, 5, 61),
(5175, 'collaborator1', '2024-06-26 15:52:00.056894', '', NULL, NULL, b'1', 3, 5, 61),
(5176, 'collaborator1', '2024-06-26 15:52:00.058874', '', NULL, NULL, b'1', 4, 5, 61),
(5177, 'collaborator1', '2024-06-26 15:52:00.061902', '', NULL, NULL, b'1', 5, 5, 61),
(5178, 'collaborator1', '2024-06-26 15:52:00.063866', '', NULL, NULL, b'1', 6, 5, 61),
(5179, 'collaborator1', '2024-06-26 15:52:00.066910', '', NULL, NULL, b'1', 1, 6, 61),
(5180, 'collaborator1', '2024-06-26 15:52:00.069901', '', NULL, NULL, b'1', 2, 6, 61),
(5181, 'collaborator1', '2024-06-26 15:52:00.071908', '', NULL, NULL, b'1', 3, 6, 61),
(5182, 'collaborator1', '2024-06-26 15:52:00.074906', '', NULL, NULL, b'1', 4, 6, 61),
(5183, 'collaborator1', '2024-06-26 15:52:00.077898', '', NULL, NULL, b'1', 5, 6, 61),
(5184, 'collaborator1', '2024-06-26 15:52:00.079866', '', NULL, NULL, b'1', 6, 6, 61),
(5185, 'collaborator1', '2024-06-26 15:52:00.082870', '', NULL, NULL, b'1', 1, 7, 61),
(5186, 'collaborator1', '2024-06-26 15:52:00.085871', '', NULL, NULL, b'1', 2, 7, 61),
(5187, 'collaborator1', '2024-06-26 15:52:00.087867', '', NULL, NULL, b'1', 3, 7, 61),
(5188, 'collaborator1', '2024-06-26 15:52:00.089877', '', NULL, NULL, b'1', 4, 7, 61),
(5189, 'collaborator1', '2024-06-26 15:52:00.092873', '', NULL, NULL, b'1', 5, 7, 61),
(5190, 'collaborator1', '2024-06-26 15:52:00.094865', '', NULL, NULL, b'1', 6, 7, 61),
(5191, 'collaborator1', '2024-06-26 15:52:00.097866', '', NULL, NULL, b'1', 1, 8, 61),
(5192, 'collaborator1', '2024-06-26 15:52:00.099870', '', NULL, NULL, b'1', 2, 8, 61),
(5193, 'collaborator1', '2024-06-26 15:52:00.102872', '', NULL, NULL, b'1', 3, 8, 61),
(5194, 'collaborator1', '2024-06-26 15:52:00.104867', '', NULL, NULL, b'1', 4, 8, 61),
(5195, 'collaborator1', '2024-06-26 15:52:00.107865', '', NULL, NULL, b'1', 5, 8, 61),
(5196, 'collaborator1', '2024-06-26 15:52:00.110871', '', NULL, NULL, b'1', 6, 8, 61),
(5197, 'collaborator1', '2024-06-26 15:52:00.113866', '', NULL, NULL, b'1', 1, 9, 61),
(5198, 'collaborator1', '2024-06-26 15:52:00.116869', '', NULL, NULL, b'1', 2, 9, 61),
(5199, 'collaborator1', '2024-06-26 15:52:00.119867', '', NULL, NULL, b'1', 3, 9, 61),
(5200, 'collaborator1', '2024-06-26 15:52:00.122865', '', NULL, NULL, b'1', 4, 9, 61),
(5201, 'collaborator1', '2024-06-26 15:52:00.125906', '', NULL, NULL, b'1', 5, 9, 61),
(5202, 'collaborator1', '2024-06-26 15:52:00.128864', '', NULL, NULL, b'1', 6, 9, 61),
(5203, 'collaborator1', '2024-06-26 15:52:00.131871', '', NULL, NULL, b'1', 1, 10, 61),
(5204, 'collaborator1', '2024-06-26 15:52:00.134868', '', NULL, NULL, b'1', 2, 10, 61),
(5205, 'collaborator1', '2024-06-26 15:52:00.137863', '', NULL, NULL, b'1', 3, 10, 61),
(5206, 'collaborator1', '2024-06-26 15:52:00.139878', '', NULL, NULL, b'1', 4, 10, 61),
(5207, 'collaborator1', '2024-06-26 15:52:00.142870', '', NULL, NULL, b'1', 5, 10, 61),
(5208, 'collaborator1', '2024-06-26 15:52:00.145862', '', NULL, NULL, b'1', 6, 10, 61),
(5209, 'collaborator1', '2024-06-26 15:52:00.148865', '', NULL, NULL, b'1', 1, 11, 61),
(5210, 'collaborator1', '2024-06-26 15:52:00.151871', '', NULL, NULL, b'1', 2, 11, 61),
(5211, 'collaborator1', '2024-06-26 15:52:00.154863', '', NULL, NULL, b'1', 3, 11, 61),
(5212, 'collaborator1', '2024-06-26 15:52:00.156879', '', NULL, NULL, b'1', 4, 11, 61),
(5213, 'collaborator1', '2024-06-26 15:52:00.160877', '', NULL, NULL, b'1', 5, 11, 61),
(5214, 'collaborator1', '2024-06-26 15:52:00.163864', '', NULL, NULL, b'1', 6, 11, 61),
(5215, 'collaborator1', '2024-06-26 15:52:00.167870', '', NULL, NULL, b'1', 1, 12, 61),
(5216, 'collaborator1', '2024-06-26 15:52:00.170869', '', NULL, NULL, b'1', 2, 12, 61),
(5217, 'collaborator1', '2024-06-26 15:52:00.172872', '', NULL, NULL, b'1', 3, 12, 61),
(5218, 'collaborator1', '2024-06-26 15:52:00.175869', '', NULL, NULL, b'1', 4, 12, 61),
(5219, 'collaborator1', '2024-06-26 15:52:00.177866', '', NULL, NULL, b'1', 5, 12, 61),
(5220, 'collaborator1', '2024-06-26 15:52:00.180864', '', NULL, NULL, b'1', 6, 12, 61),
(5221, 'collaborator1', '2024-06-26 15:52:00.183864', '', NULL, NULL, b'1', 1, 13, 61),
(5222, 'collaborator1', '2024-06-26 15:52:00.185863', '', NULL, NULL, b'1', 2, 13, 61),
(5223, 'collaborator1', '2024-06-26 15:52:00.187865', '', NULL, NULL, b'1', 3, 13, 61),
(5224, 'collaborator1', '2024-06-26 15:52:00.190867', '', NULL, NULL, b'1', 4, 13, 61),
(5225, 'collaborator1', '2024-06-26 15:52:00.193863', '', NULL, NULL, b'1', 5, 13, 61),
(5226, 'collaborator1', '2024-06-26 15:52:00.195864', '', NULL, NULL, b'1', 6, 13, 61),
(5227, 'collaborator1', '2024-06-26 15:52:00.197865', '', NULL, NULL, b'1', 1, 14, 61),
(5228, 'collaborator1', '2024-06-26 15:52:00.200867', '', NULL, NULL, b'1', 2, 14, 61),
(5229, 'collaborator1', '2024-06-26 15:52:00.202863', '', NULL, NULL, b'1', 3, 14, 61),
(5230, 'collaborator1', '2024-06-26 15:52:00.204863', '', NULL, NULL, b'1', 4, 14, 61),
(5231, 'collaborator1', '2024-06-26 15:52:00.207871', '', NULL, NULL, b'1', 5, 14, 61),
(5232, 'collaborator1', '2024-06-26 15:52:00.209864', '', NULL, NULL, b'1', 6, 14, 61),
(5233, 'collaborator1', '2024-06-26 15:52:00.212869', '', NULL, NULL, b'1', 1, 15, 61),
(5234, 'collaborator1', '2024-06-26 15:52:00.214889', '', NULL, NULL, b'1', 2, 15, 61),
(5235, 'collaborator1', '2024-06-26 15:52:00.216867', '', NULL, NULL, b'1', 3, 15, 61),
(5236, 'collaborator1', '2024-06-26 15:52:00.218862', '', NULL, NULL, b'1', 4, 15, 61),
(5237, 'collaborator1', '2024-06-26 15:52:00.220864', '', NULL, NULL, b'1', 5, 15, 61),
(5238, 'collaborator1', '2024-06-26 15:52:00.222864', '', NULL, NULL, b'1', 6, 15, 61),
(5239, 'collaborator1', '2024-06-26 15:52:00.225863', '', NULL, NULL, b'1', 1, 16, 61),
(5240, 'collaborator1', '2024-06-26 15:52:00.227864', '', NULL, NULL, b'1', 2, 16, 61),
(5241, 'collaborator1', '2024-06-26 15:52:00.229865', '', NULL, NULL, b'1', 3, 16, 61),
(5242, 'collaborator1', '2024-06-26 15:52:00.232866', '', NULL, NULL, b'1', 4, 16, 61),
(5243, 'collaborator1', '2024-06-26 15:52:00.234865', '', NULL, NULL, b'1', 5, 16, 61),
(5244, 'collaborator1', '2024-06-26 15:52:00.236863', '', NULL, NULL, b'1', 6, 16, 61),
(5245, 'collaborator1', '2024-06-26 15:52:00.238866', '', NULL, NULL, b'1', 1, 17, 61),
(5246, 'collaborator1', '2024-06-26 15:52:00.241868', '', NULL, NULL, b'1', 2, 17, 61),
(5247, 'collaborator1', '2024-06-26 15:52:00.243867', '', NULL, NULL, b'1', 3, 17, 61),
(5248, 'collaborator1', '2024-06-26 15:52:00.245866', '', NULL, NULL, b'1', 4, 17, 61),
(5249, 'collaborator1', '2024-06-26 15:52:00.247864', '', NULL, NULL, b'1', 5, 17, 61),
(5250, 'collaborator1', '2024-06-26 15:52:00.250864', '', NULL, NULL, b'1', 6, 17, 61),
(5251, 'collaborator1', '2024-06-26 15:52:00.252866', '', NULL, NULL, b'1', 1, 18, 61),
(5252, 'collaborator1', '2024-06-26 15:52:00.254862', '', NULL, NULL, b'1', 2, 18, 61),
(5253, 'collaborator1', '2024-06-26 15:52:00.257876', '', NULL, NULL, b'1', 3, 18, 61),
(5254, 'collaborator1', '2024-06-26 15:52:00.259867', '', NULL, NULL, b'1', 4, 18, 61),
(5255, 'collaborator1', '2024-06-26 15:52:00.261865', '', NULL, NULL, b'1', 5, 18, 61),
(5256, 'collaborator1', '2024-06-26 15:52:00.263864', '', NULL, NULL, b'1', 6, 18, 61),
(5257, 'collaborator1', '2024-06-26 15:52:00.266864', '', NULL, NULL, b'1', 1, 19, 61),
(5258, 'collaborator1', '2024-06-26 15:52:00.268886', '', NULL, NULL, b'1', 2, 19, 61),
(5259, 'collaborator1', '2024-06-26 15:52:00.270912', '', NULL, NULL, b'1', 3, 19, 61),
(5260, 'collaborator1', '2024-06-26 15:52:00.272870', '', NULL, NULL, b'1', 4, 19, 61),
(5261, 'collaborator1', '2024-06-26 15:52:00.274863', '', NULL, NULL, b'1', 5, 19, 61),
(5262, 'collaborator1', '2024-06-26 15:52:00.276885', '', NULL, NULL, b'1', 6, 19, 61),
(5263, 'collaborator1', '2024-06-26 15:52:00.278895', '', NULL, NULL, b'1', 1, 20, 61),
(5264, 'collaborator1', '2024-06-26 15:52:00.280863', '', NULL, NULL, b'1', 2, 20, 61),
(5265, 'collaborator1', '2024-06-26 15:52:00.282927', '', NULL, NULL, b'1', 3, 20, 61),
(5266, 'collaborator1', '2024-06-26 15:52:00.284890', '', NULL, NULL, b'1', 4, 20, 61),
(5267, 'collaborator1', '2024-06-26 15:52:00.286863', '', NULL, NULL, b'1', 5, 20, 61),
(5268, 'collaborator1', '2024-06-26 15:52:00.288864', '', NULL, NULL, b'1', 6, 20, 61),
(5269, 'collaborator1', '2024-06-26 15:52:00.291866', '', NULL, NULL, b'1', 1, 21, 61),
(5270, 'collaborator1', '2024-06-26 15:52:00.293867', '', NULL, NULL, b'1', 2, 21, 61),
(5271, 'collaborator1', '2024-06-26 15:52:00.295861', '', NULL, NULL, b'1', 3, 21, 61),
(5272, 'collaborator1', '2024-06-26 15:52:00.297871', '', NULL, NULL, b'1', 4, 21, 61),
(5273, 'collaborator1', '2024-06-26 15:52:00.300865', '', NULL, NULL, b'1', 5, 21, 61),
(5274, 'collaborator1', '2024-06-26 15:52:00.302865', '', NULL, NULL, b'1', 6, 21, 61),
(5275, 'collaborator1', '2024-06-26 15:52:00.304864', '', NULL, NULL, b'1', 1, 22, 61),
(5276, 'collaborator1', '2024-06-26 15:52:00.307868', '', NULL, NULL, b'1', 2, 22, 61),
(5277, 'collaborator1', '2024-06-26 15:52:00.309867', '', NULL, NULL, b'1', 3, 22, 61),
(5278, 'collaborator1', '2024-06-26 15:52:00.311866', '', NULL, NULL, b'1', 4, 22, 61),
(5279, 'collaborator1', '2024-06-26 15:52:00.314877', '', NULL, NULL, b'1', 5, 22, 61),
(5280, 'collaborator1', '2024-06-26 15:52:00.317863', '', NULL, NULL, b'1', 6, 22, 61),
(5281, 'collaborator1', '2024-06-26 15:52:00.319866', '', NULL, NULL, b'1', 1, 23, 61),
(5282, 'collaborator1', '2024-06-26 15:52:00.321865', '', NULL, NULL, b'1', 2, 23, 61),
(5283, 'collaborator1', '2024-06-26 15:52:00.324865', '', NULL, NULL, b'1', 3, 23, 61),
(5284, 'collaborator1', '2024-06-26 15:52:00.325865', '', NULL, NULL, b'1', 4, 23, 61),
(5285, 'collaborator1', '2024-06-26 15:52:00.327864', '', NULL, NULL, b'1', 5, 23, 61),
(5286, 'collaborator1', '2024-06-26 15:52:00.330867', '', NULL, NULL, b'1', 6, 23, 61),
(5287, 'collaborator1', '2024-06-26 15:52:00.332866', '', NULL, NULL, b'1', 1, 24, 61),
(5288, 'collaborator1', '2024-06-26 15:52:00.334865', '', NULL, NULL, b'1', 2, 24, 61),
(5289, 'collaborator1', '2024-06-26 15:52:00.336863', '', NULL, NULL, b'1', 3, 24, 61),
(5290, 'collaborator1', '2024-06-26 15:52:00.339868', '', NULL, NULL, b'1', 4, 24, 61),
(5291, 'collaborator1', '2024-06-26 15:52:00.341864', '', NULL, NULL, b'1', 5, 24, 61),
(5292, 'collaborator1', '2024-06-26 15:52:00.343866', '', NULL, NULL, b'1', 6, 24, 61),
(5293, 'collaborator1', '2024-06-26 15:52:00.345864', '', NULL, NULL, b'1', 1, 25, 61),
(5294, 'collaborator1', '2024-06-26 15:52:00.347864', '', NULL, NULL, b'1', 2, 25, 61),
(5295, 'collaborator1', '2024-06-26 15:52:00.350864', '', NULL, NULL, b'1', 3, 25, 61),
(5296, 'collaborator1', '2024-06-26 15:52:00.352863', '', NULL, NULL, b'1', 4, 25, 61),
(5297, 'collaborator1', '2024-06-26 15:52:00.354862', '', NULL, NULL, b'1', 5, 25, 61),
(5298, 'collaborator1', '2024-06-26 15:52:00.357863', '', NULL, NULL, b'1', 6, 25, 61),
(5299, 'collaborator1', '2024-06-26 15:52:00.359868', '', NULL, NULL, b'1', 1, 26, 61),
(5300, 'collaborator1', '2024-06-26 15:52:00.362864', '', NULL, NULL, b'1', 2, 26, 61),
(5301, 'collaborator1', '2024-06-26 15:52:00.365878', '', NULL, NULL, b'1', 3, 26, 61),
(5302, 'collaborator1', '2024-06-26 15:52:00.367863', '', NULL, NULL, b'1', 4, 26, 61),
(5303, 'collaborator1', '2024-06-26 15:52:00.369865', '', NULL, NULL, b'1', 5, 26, 61),
(5304, 'collaborator1', '2024-06-26 15:52:00.371864', '', NULL, NULL, b'1', 6, 26, 61),
(5305, 'collaborator1', '2024-06-26 15:52:00.375864', '', NULL, NULL, b'1', 1, 27, 61),
(5306, 'collaborator1', '2024-06-26 15:52:00.377864', '', NULL, NULL, b'1', 2, 27, 61),
(5307, 'collaborator1', '2024-06-26 15:52:00.379863', '', NULL, NULL, b'1', 3, 27, 61),
(5308, 'collaborator1', '2024-06-26 15:52:00.383864', '', NULL, NULL, b'1', 4, 27, 61),
(5309, 'collaborator1', '2024-06-26 15:52:00.385863', '', NULL, NULL, b'1', 5, 27, 61),
(5310, 'collaborator1', '2024-06-26 15:52:00.387864', '', NULL, NULL, b'1', 6, 27, 61),
(5311, 'collaborator1', '2024-06-26 15:52:00.390871', '', NULL, NULL, b'1', 1, 28, 61),
(5312, 'collaborator1', '2024-06-26 15:52:00.393864', '', NULL, NULL, b'1', 2, 28, 61),
(5313, 'collaborator1', '2024-06-26 15:52:00.395863', '', NULL, NULL, b'1', 3, 28, 61),
(5314, 'collaborator1', '2024-06-26 15:52:00.398865', '', NULL, NULL, b'1', 4, 28, 61),
(5315, 'collaborator1', '2024-06-26 15:52:00.401864', '', NULL, NULL, b'1', 5, 28, 61),
(5316, 'collaborator1', '2024-06-26 15:52:00.403863', '', NULL, NULL, b'1', 6, 28, 61),
(5317, 'collaborator1', '2024-06-26 15:52:00.406866', '', NULL, NULL, b'1', 1, 29, 61),
(5318, 'collaborator1', '2024-06-26 15:52:00.409864', '', NULL, NULL, b'1', 2, 29, 61),
(5319, 'collaborator1', '2024-06-26 15:52:00.411888', '', NULL, NULL, b'1', 3, 29, 61),
(5320, 'collaborator1', '2024-06-26 15:52:00.414878', '', NULL, NULL, b'1', 4, 29, 61),
(5321, 'collaborator1', '2024-06-26 15:52:00.417864', '', NULL, NULL, b'1', 5, 29, 61),
(5322, 'collaborator1', '2024-06-26 15:52:00.419864', '', NULL, NULL, b'1', 6, 29, 61),
(5323, 'collaborator1', '2024-06-26 15:52:00.422864', '', NULL, NULL, b'1', 1, 30, 61),
(5324, 'collaborator1', '2024-06-26 15:52:00.425865', '', NULL, NULL, b'1', 2, 30, 61),
(5325, 'collaborator1', '2024-06-26 15:52:00.427864', '', NULL, NULL, b'1', 3, 30, 61),
(5326, 'collaborator1', '2024-06-26 15:52:00.430866', '', NULL, NULL, b'1', 4, 30, 61),
(5327, 'collaborator1', '2024-06-26 15:52:00.433866', '', NULL, NULL, b'1', 5, 30, 61),
(5328, 'collaborator1', '2024-06-26 15:52:00.435863', '', NULL, NULL, b'1', 6, 30, 61),
(5329, 'collaborator1', '2024-06-26 15:52:00.438865', '', NULL, NULL, b'1', 1, 31, 61),
(5330, 'collaborator1', '2024-06-26 15:52:00.441865', '', NULL, NULL, b'1', 2, 31, 61),
(5331, 'collaborator1', '2024-06-26 15:52:00.443864', '', NULL, NULL, b'1', 3, 31, 61),
(5332, 'collaborator1', '2024-06-26 15:52:00.446864', '', NULL, NULL, b'1', 4, 31, 61),
(5333, 'collaborator1', '2024-06-26 15:52:00.449865', '', NULL, NULL, b'1', 5, 31, 61),
(5334, 'collaborator1', '2024-06-26 15:52:00.451863', '', NULL, NULL, b'1', 6, 31, 61),
(5335, 'collaborator1', '2024-06-26 15:52:00.454864', '', NULL, NULL, b'1', 1, 32, 61),
(5336, 'collaborator1', '2024-06-26 15:52:00.457871', '', NULL, NULL, b'1', 2, 32, 61),
(5337, 'collaborator1', '2024-06-26 15:52:00.459863', '', NULL, NULL, b'1', 3, 32, 61),
(5338, 'collaborator1', '2024-06-26 15:52:00.462862', '', NULL, NULL, b'1', 4, 32, 61),
(5339, 'collaborator1', '2024-06-26 15:52:00.464875', '', NULL, NULL, b'1', 5, 32, 61),
(5340, 'collaborator1', '2024-06-26 15:52:00.467864', '', NULL, NULL, b'1', 6, 32, 61),
(5341, 'collaborator1', '2024-06-26 15:52:00.469866', '', NULL, NULL, b'1', 1, 33, 61),
(5342, 'collaborator1', '2024-06-26 15:52:00.472866', '', NULL, NULL, b'1', 2, 33, 61),
(5343, 'collaborator1', '2024-06-26 15:52:00.475867', '', NULL, NULL, b'1', 3, 33, 61),
(5344, 'collaborator1', '2024-06-26 15:52:00.477867', '', NULL, NULL, b'1', 4, 33, 61),
(5345, 'collaborator1', '2024-06-26 15:52:00.480866', '', NULL, NULL, b'1', 5, 33, 61),
(5346, 'collaborator1', '2024-06-26 15:52:00.483865', '', NULL, NULL, b'1', 6, 33, 61),
(5347, 'collaborator1', '2024-06-26 15:52:00.485863', '', NULL, NULL, b'1', 1, 34, 61),
(5348, 'collaborator1', '2024-06-26 15:52:00.488864', '', NULL, NULL, b'1', 2, 34, 61),
(5349, 'collaborator1', '2024-06-26 15:52:00.490864', '', NULL, NULL, b'1', 3, 34, 61),
(5350, 'collaborator1', '2024-06-26 15:52:00.492862', '', NULL, NULL, b'1', 4, 34, 61),
(5351, 'collaborator1', '2024-06-26 15:52:00.494862', '', NULL, NULL, b'1', 5, 34, 61),
(5352, 'collaborator1', '2024-06-26 15:52:00.496862', '', NULL, NULL, b'1', 6, 34, 61),
(5353, 'collaborator1', '2024-06-26 15:52:00.499868', '', NULL, NULL, b'1', 1, 35, 61),
(5354, 'collaborator1', '2024-06-26 15:52:00.502867', '', NULL, NULL, b'1', 2, 35, 61),
(5355, 'collaborator1', '2024-06-26 15:52:00.504863', '', NULL, NULL, b'1', 3, 35, 61),
(5356, 'collaborator1', '2024-06-26 15:52:00.507869', '', NULL, NULL, b'1', 4, 35, 61),
(5357, 'collaborator1', '2024-06-26 15:52:00.509864', '', NULL, NULL, b'1', 5, 35, 61),
(5358, 'collaborator1', '2024-06-26 15:52:00.512864', '', NULL, NULL, b'1', 6, 35, 61),
(5359, 'collaborator1', '2024-06-26 15:52:00.514876', '', NULL, NULL, b'1', 1, 36, 61),
(5360, 'collaborator1', '2024-06-26 15:52:00.517863', '', NULL, NULL, b'1', 2, 36, 61),
(5361, 'collaborator1', '2024-06-26 15:52:00.519862', '', NULL, NULL, b'1', 3, 36, 61),
(5362, 'collaborator1', '2024-06-26 15:52:00.521863', '', NULL, NULL, b'1', 4, 36, 61),
(5363, 'collaborator1', '2024-06-26 15:52:00.523869', '', NULL, NULL, b'1', 5, 36, 61),
(5364, 'collaborator1', '2024-06-26 15:52:00.526865', '', NULL, NULL, b'1', 6, 36, 61),
(5365, 'collaborator1', '2024-06-26 15:52:00.528864', '', NULL, NULL, b'1', 1, 37, 61),
(5366, 'collaborator1', '2024-06-26 15:52:00.530866', '', NULL, NULL, b'1', 2, 37, 61),
(5367, 'collaborator1', '2024-06-26 15:52:00.533863', '', NULL, NULL, b'1', 3, 37, 61),
(5368, 'collaborator1', '2024-06-26 15:52:00.549865', '', NULL, NULL, b'1', 4, 37, 61),
(5369, 'collaborator1', '2024-06-26 15:52:00.551863', '', NULL, NULL, b'1', 5, 37, 61),
(5370, 'collaborator1', '2024-06-26 15:52:00.553862', '', NULL, NULL, b'1', 6, 37, 61),
(5371, 'collaborator1', '2024-06-26 15:52:00.556864', '', NULL, NULL, b'1', 1, 38, 61),
(5372, 'collaborator1', '2024-06-26 15:52:00.559865', '', NULL, NULL, b'1', 2, 38, 61),
(5373, 'collaborator1', '2024-06-26 15:52:00.562868', '', NULL, NULL, b'1', 3, 38, 61),
(5374, 'collaborator1', '2024-06-26 15:52:00.565869', '', NULL, NULL, b'1', 4, 38, 61),
(5375, 'collaborator1', '2024-06-26 15:52:00.567866', '', NULL, NULL, b'1', 5, 38, 61),
(5376, 'collaborator1', '2024-06-26 15:52:00.570863', '', NULL, NULL, b'1', 6, 38, 61),
(5377, 'collaborator1', '2024-06-26 15:52:00.572865', '', NULL, NULL, b'1', 1, 39, 61),
(5378, 'collaborator1', '2024-06-26 15:52:00.574863', '', NULL, NULL, b'1', 2, 39, 61),
(5379, 'collaborator1', '2024-06-26 15:52:00.576863', '', NULL, NULL, b'1', 3, 39, 61),
(5380, 'collaborator1', '2024-06-26 15:52:00.579863', '', NULL, NULL, b'1', 4, 39, 61),
(5381, 'collaborator1', '2024-06-26 15:52:00.581867', '', NULL, NULL, b'1', 5, 39, 61),
(5382, 'collaborator1', '2024-06-26 15:52:00.584863', '', NULL, NULL, b'1', 6, 39, 61),
(5383, 'collaborator1', '2024-06-26 15:52:00.586863', '', NULL, NULL, b'1', 1, 40, 61),
(5384, 'collaborator1', '2024-06-26 15:52:00.589880', '', NULL, NULL, b'1', 2, 40, 61),
(5385, 'collaborator1', '2024-06-26 15:52:00.592866', '', NULL, NULL, b'1', 3, 40, 61),
(5386, 'collaborator1', '2024-06-26 15:52:00.594867', '', NULL, NULL, b'1', 4, 40, 61),
(5387, 'collaborator1', '2024-06-26 15:52:00.597865', '', NULL, NULL, b'1', 5, 40, 61),
(5388, 'collaborator1', '2024-06-26 15:52:00.600864', '', NULL, NULL, b'1', 6, 40, 61),
(5389, 'collaborator1', '2024-06-26 15:52:00.603864', '', NULL, NULL, b'1', 1, 41, 61),
(5390, 'collaborator1', '2024-06-26 15:52:00.605865', '', NULL, NULL, b'1', 2, 41, 61),
(5391, 'collaborator1', '2024-06-26 15:52:00.608866', '', NULL, NULL, b'1', 3, 41, 61),
(5392, 'collaborator1', '2024-06-26 15:52:00.611864', '', NULL, NULL, b'1', 4, 41, 61),
(5393, 'collaborator1', '2024-06-26 15:52:00.613864', '', NULL, NULL, b'1', 5, 41, 61),
(5394, 'collaborator1', '2024-06-26 15:52:00.616864', '', NULL, NULL, b'1', 6, 41, 61),
(5395, 'collaborator1', '2024-06-26 15:52:00.618865', '', NULL, NULL, b'1', 1, 42, 61),
(5396, 'collaborator1', '2024-06-26 15:52:00.621865', '', NULL, NULL, b'1', 2, 42, 61),
(5397, 'collaborator1', '2024-06-26 15:52:00.627866', '', NULL, NULL, b'1', 3, 42, 61),
(5398, 'collaborator1', '2024-06-26 15:52:00.629863', '', NULL, NULL, b'1', 4, 42, 61),
(5399, 'collaborator1', '2024-06-26 15:52:00.632869', '', NULL, NULL, b'1', 5, 42, 61),
(5400, 'collaborator1', '2024-06-26 15:52:00.634863', '', NULL, NULL, b'1', 6, 42, 61),
(5401, 'collaborator1', '2024-06-26 15:52:00.636864', '', NULL, NULL, b'1', 1, 43, 61),
(5402, 'collaborator1', '2024-06-26 15:52:00.639878', '', NULL, NULL, b'1', 2, 43, 61),
(5403, 'collaborator1', '2024-06-26 15:52:00.642865', '', NULL, NULL, b'1', 3, 43, 61),
(5404, 'collaborator1', '2024-06-26 15:52:00.644862', '', NULL, NULL, b'1', 4, 43, 61),
(5405, 'collaborator1', '2024-06-26 15:52:00.646866', '', NULL, NULL, b'1', 5, 43, 61),
(5406, 'collaborator1', '2024-06-26 15:52:00.649863', '', NULL, NULL, b'1', 6, 43, 61),
(5407, 'collaborator1', '2024-06-26 15:52:00.651865', '', NULL, NULL, b'1', 1, 44, 61),
(5408, 'collaborator1', '2024-06-26 15:52:00.653863', '', NULL, NULL, b'1', 2, 44, 61),
(5409, 'collaborator1', '2024-06-26 15:52:00.655865', '', NULL, NULL, b'1', 3, 44, 61),
(5410, 'collaborator1', '2024-06-26 15:52:00.658862', '', NULL, NULL, b'1', 4, 44, 61),
(5411, 'collaborator1', '2024-06-26 15:52:00.660864', '', NULL, NULL, b'1', 5, 44, 61),
(5412, 'collaborator1', '2024-06-26 15:52:00.662864', '', NULL, NULL, b'1', 6, 44, 61),
(5413, 'collaborator1', '2024-06-26 15:52:00.665869', '', NULL, NULL, b'1', 1, 45, 61),
(5414, 'collaborator1', '2024-06-26 15:52:00.667862', '', NULL, NULL, b'1', 2, 45, 61),
(5415, 'collaborator1', '2024-06-26 15:52:00.669865', '', NULL, NULL, b'1', 3, 45, 61),
(5416, 'collaborator1', '2024-06-26 15:52:00.671864', '', NULL, NULL, b'1', 4, 45, 61),
(5417, 'collaborator1', '2024-06-26 15:52:00.674865', '', NULL, NULL, b'1', 5, 45, 61),
(5418, 'collaborator1', '2024-06-26 15:52:00.676864', '', NULL, NULL, b'1', 6, 45, 61),
(5419, 'collaborator1', '2024-06-26 15:52:00.678865', '', NULL, NULL, b'1', 1, 46, 61),
(5420, 'collaborator1', '2024-06-26 15:52:00.680866', '', NULL, NULL, b'1', 2, 46, 61),
(5421, 'collaborator1', '2024-06-26 15:52:00.683863', '', NULL, NULL, b'1', 3, 46, 61),
(5422, 'collaborator1', '2024-06-26 15:52:00.685864', '', NULL, NULL, b'1', 4, 46, 61),
(5423, 'collaborator1', '2024-06-26 15:52:00.688867', '', NULL, NULL, b'1', 5, 46, 61),
(5424, 'collaborator1', '2024-06-26 15:52:00.690867', '', NULL, NULL, b'1', 6, 46, 61),
(5425, 'collaborator1', '2024-06-26 15:52:00.692865', '', NULL, NULL, b'1', 1, 47, 61),
(5426, 'collaborator1', '2024-06-26 15:52:00.695864', '', NULL, NULL, b'1', 2, 47, 61),
(5427, 'collaborator1', '2024-06-26 15:52:00.697865', '', NULL, NULL, b'1', 3, 47, 61),
(5428, 'collaborator1', '2024-06-26 15:52:00.700863', '', NULL, NULL, b'1', 4, 47, 61),
(5429, 'collaborator1', '2024-06-26 15:52:00.702865', '', NULL, NULL, b'1', 5, 47, 61),
(5430, 'collaborator1', '2024-06-26 15:52:00.704863', '', NULL, NULL, b'1', 6, 47, 61),
(5431, 'collaborator1', '2024-06-26 15:52:00.707864', '', NULL, NULL, b'1', 1, 48, 61),
(5432, 'collaborator1', '2024-06-26 15:52:00.709862', '', NULL, NULL, b'1', 2, 48, 61),
(5433, 'collaborator1', '2024-06-26 15:52:00.711864', '', NULL, NULL, b'1', 3, 48, 61),
(5434, 'collaborator1', '2024-06-26 15:52:00.714884', '', NULL, NULL, b'1', 4, 48, 61),
(5435, 'collaborator1', '2024-06-26 15:52:00.717863', '', NULL, NULL, b'1', 5, 48, 61),
(5436, 'collaborator1', '2024-06-26 15:52:00.719864', '', NULL, NULL, b'1', 6, 48, 61),
(5437, 'collaborator1', '2024-06-26 15:52:00.721865', '', NULL, NULL, b'1', 1, 49, 61),
(5438, 'collaborator1', '2024-06-26 15:52:00.724865', '', NULL, NULL, b'1', 2, 49, 61),
(5439, 'collaborator1', '2024-06-26 15:52:00.726863', '', NULL, NULL, b'1', 3, 49, 61),
(5440, 'collaborator1', '2024-06-26 15:52:00.729868', '', NULL, NULL, b'1', 4, 49, 61),
(5441, 'collaborator1', '2024-06-26 15:52:00.731863', '', NULL, NULL, b'1', 5, 49, 61),
(5442, 'collaborator1', '2024-06-26 15:52:00.733862', '', NULL, NULL, b'1', 6, 49, 61),
(5443, 'collaborator1', '2024-06-26 15:52:00.735864', '', NULL, NULL, b'1', 1, 50, 61),
(5444, 'collaborator1', '2024-06-26 15:52:00.737863', '', NULL, NULL, b'1', 2, 50, 61),
(5445, 'collaborator1', '2024-06-26 15:52:00.740864', '', NULL, NULL, b'1', 3, 50, 61),
(5446, 'collaborator1', '2024-06-26 15:52:00.741863', '', NULL, NULL, b'1', 4, 50, 61),
(5447, 'collaborator1', '2024-06-26 15:52:00.743862', '', NULL, NULL, b'1', 5, 50, 61),
(5448, 'collaborator1', '2024-06-26 15:52:00.745862', '', NULL, NULL, b'1', 6, 50, 61),
(5449, 'collaborator1', '2024-06-26 15:52:00.748869', '', NULL, NULL, b'1', 1, 51, 61),
(5450, 'collaborator1', '2024-06-26 15:52:00.750863', '', NULL, NULL, b'1', 2, 51, 61),
(5451, 'collaborator1', '2024-06-26 15:52:00.752862', '', NULL, NULL, b'1', 3, 51, 61),
(5452, 'collaborator1', '2024-06-26 15:52:00.754866', '', NULL, NULL, b'1', 4, 51, 61),
(5453, 'collaborator1', '2024-06-26 15:52:00.757867', '', NULL, NULL, b'1', 5, 51, 61),
(5454, 'collaborator1', '2024-06-26 15:52:00.759866', '', NULL, NULL, b'1', 6, 51, 61),
(5455, 'collaborator1', '2024-06-26 15:52:00.762865', '', NULL, NULL, b'1', 1, 52, 61),
(5456, 'collaborator1', '2024-06-26 15:52:00.764867', '', NULL, NULL, b'1', 2, 52, 61),
(5457, 'collaborator1', '2024-06-26 15:52:00.767865', '', NULL, NULL, b'1', 3, 52, 61),
(5458, 'collaborator1', '2024-06-26 15:52:00.770863', '', NULL, NULL, b'1', 4, 52, 61),
(5459, 'collaborator1', '2024-06-26 15:52:00.773865', '', NULL, NULL, b'1', 5, 52, 61),
(5460, 'collaborator1', '2024-06-26 15:52:00.777864', '', NULL, NULL, b'1', 6, 52, 61),
(5461, 'collaborator1', '2024-06-26 15:52:00.779863', '', NULL, NULL, b'1', 1, 53, 61),
(5462, 'collaborator1', '2024-06-26 15:52:00.782870', '', NULL, NULL, b'1', 2, 53, 61),
(5463, 'collaborator1', '2024-06-26 15:52:00.784865', '', NULL, NULL, b'1', 3, 53, 61),
(5464, 'collaborator1', '2024-06-26 15:52:00.786863', '', NULL, NULL, b'1', 4, 53, 61),
(5465, 'collaborator1', '2024-06-26 15:52:00.789864', '', NULL, NULL, b'1', 5, 53, 61),
(5466, 'collaborator1', '2024-06-26 15:52:00.791865', '', NULL, NULL, b'1', 6, 53, 61),
(5467, 'collaborator1', '2024-06-26 15:52:00.793862', '', NULL, NULL, b'1', 1, 54, 61),
(5468, 'collaborator1', '2024-06-26 15:52:00.795862', '', NULL, NULL, b'1', 2, 54, 61),
(5469, 'collaborator1', '2024-06-26 15:52:00.798867', '', NULL, NULL, b'1', 3, 54, 61),
(5470, 'collaborator1', '2024-06-26 15:52:00.800863', '', NULL, NULL, b'1', 4, 54, 61),
(5471, 'collaborator1', '2024-06-26 15:52:00.802863', '', NULL, NULL, b'1', 5, 54, 61),
(5472, 'collaborator1', '2024-06-26 15:52:00.804865', '', NULL, NULL, b'1', 6, 54, 61),
(5473, 'collaborator1', '2024-06-26 15:52:00.807864', '', NULL, NULL, b'1', 1, 55, 61),
(5474, 'collaborator1', '2024-06-26 15:52:00.809862', '', NULL, NULL, b'1', 2, 55, 61),
(5475, 'collaborator1', '2024-06-26 15:52:00.811864', '', NULL, NULL, b'1', 3, 55, 61),
(5476, 'collaborator1', '2024-06-26 15:52:00.813867', '', NULL, NULL, b'1', 4, 55, 61),
(5477, 'collaborator1', '2024-06-26 15:52:00.816863', '', NULL, NULL, b'1', 5, 55, 61),
(5478, 'collaborator1', '2024-06-26 15:52:00.818862', '', NULL, NULL, b'1', 6, 55, 61),
(5479, 'collaborator1', '2024-06-26 15:52:00.820863', '', NULL, NULL, b'1', 1, 56, 61),
(5480, 'collaborator1', '2024-06-26 15:52:00.823866', '', NULL, NULL, b'1', 2, 56, 61),
(5481, 'collaborator1', '2024-06-26 15:52:00.825864', '', NULL, NULL, b'1', 3, 56, 61),
(5482, 'collaborator1', '2024-06-26 15:52:00.827863', '', NULL, NULL, b'1', 4, 56, 61),
(5483, 'collaborator1', '2024-06-26 15:52:00.829863', '', NULL, NULL, b'1', 5, 56, 61),
(5484, 'collaborator1', '2024-06-26 15:52:00.832863', '', NULL, NULL, b'1', 6, 56, 61),
(5485, 'collaborator1', '2024-06-26 15:52:00.834863', '', NULL, NULL, b'1', 1, 57, 61),
(5486, 'collaborator1', '2024-06-26 15:52:00.836864', '', NULL, NULL, b'1', 2, 57, 61),
(5487, 'collaborator1', '2024-06-26 15:52:00.839865', '', NULL, NULL, b'1', 3, 57, 61),
(5488, 'collaborator1', '2024-06-26 15:52:00.841864', '', NULL, NULL, b'1', 4, 57, 61),
(5489, 'collaborator1', '2024-06-26 15:52:00.843863', '', NULL, NULL, b'1', 5, 57, 61),
(5490, 'collaborator1', '2024-06-26 15:52:00.846865', '', NULL, NULL, b'1', 6, 57, 61),
(5491, 'collaborator1', '2024-06-26 15:52:00.849864', '', NULL, NULL, b'1', 1, 58, 61),
(5492, 'collaborator1', '2024-06-26 15:52:00.851862', '', NULL, NULL, b'1', 2, 58, 61),
(5493, 'collaborator1', '2024-06-26 15:52:00.853861', '', NULL, NULL, b'1', 3, 58, 61),
(5494, 'collaborator1', '2024-06-26 15:52:00.855865', '', NULL, NULL, b'1', 4, 58, 61),
(5495, 'collaborator1', '2024-06-26 15:52:00.858862', '', NULL, NULL, b'1', 5, 58, 61),
(5496, 'collaborator1', '2024-06-26 15:52:00.860863', '', NULL, NULL, b'1', 6, 58, 61),
(5497, 'collaborator1', '2024-06-26 15:52:00.862865', '', NULL, NULL, b'1', 1, 59, 61),
(5498, 'collaborator1', '2024-06-26 15:52:00.865864', '', NULL, NULL, b'1', 2, 59, 61),
(5499, 'collaborator1', '2024-06-26 15:52:00.868867', '', NULL, NULL, b'1', 3, 59, 61),
(5500, 'collaborator1', '2024-06-26 15:52:00.870862', '', NULL, NULL, b'1', 4, 59, 61),
(5501, 'collaborator1', '2024-06-26 15:52:00.872867', '', NULL, NULL, b'1', 5, 59, 61),
(5502, 'collaborator1', '2024-06-26 15:52:00.875863', '', NULL, NULL, b'1', 6, 59, 61),
(5503, 'collaborator1', '2024-06-26 15:52:00.877868', '', NULL, NULL, b'1', 1, 60, 61),
(5504, 'collaborator1', '2024-06-26 15:52:00.879865', '', NULL, NULL, b'1', 2, 60, 61),
(5505, 'collaborator1', '2024-06-26 15:52:00.882864', '', NULL, NULL, b'1', 3, 60, 61),
(5506, 'collaborator1', '2024-06-26 15:52:00.884865', '', NULL, NULL, b'1', 4, 60, 61),
(5507, 'collaborator1', '2024-06-26 15:52:00.886863', '', NULL, NULL, b'1', 5, 60, 61),
(5508, 'collaborator1', '2024-06-26 15:52:00.888866', '', NULL, NULL, b'1', 6, 60, 61),
(5509, 'collaborator1', '2024-06-26 15:52:00.902864', '', NULL, NULL, b'1', 1, 61, 61),
(5510, 'collaborator1', '2024-06-26 15:52:00.904864', '', NULL, NULL, b'1', 2, 61, 61),
(5511, 'collaborator1', '2024-06-26 15:52:00.906870', '', NULL, NULL, b'1', 3, 61, 61),
(5512, 'collaborator1', '2024-06-26 15:52:00.908863', '', NULL, NULL, b'1', 4, 61, 61),
(5513, 'collaborator1', '2024-06-26 15:52:00.910864', '', NULL, NULL, b'1', 5, 61, 61),
(5514, 'collaborator1', '2024-06-26 15:52:00.913881', '', NULL, NULL, b'1', 6, 61, 61),
(5515, 'collaborator1', '2024-06-26 15:52:00.915869', '', NULL, NULL, b'1', 1, 62, 61),
(5516, 'collaborator1', '2024-06-26 15:52:00.917865', '', NULL, NULL, b'1', 2, 62, 61),
(5517, 'collaborator1', '2024-06-26 15:52:00.919863', '', NULL, NULL, b'1', 3, 62, 61),
(5518, 'collaborator1', '2024-06-26 15:52:00.921865', '', NULL, NULL, b'1', 4, 62, 61),
(5519, 'collaborator1', '2024-06-26 15:52:00.924863', '', NULL, NULL, b'1', 5, 62, 61),
(5520, 'collaborator1', '2024-06-26 15:52:00.926862', '', NULL, NULL, b'1', 6, 62, 61),
(5521, 'collaborator1', '2024-06-26 15:52:00.928864', '', NULL, NULL, b'1', 1, 63, 61),
(5522, 'collaborator1', '2024-06-26 15:52:00.931868', '', NULL, NULL, b'1', 2, 63, 61);
INSERT INTO `model_permission_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `sub_attribute`, `value`, `action_permission`, `model_permission`, `user`) VALUES
(5523, 'collaborator1', '2024-06-26 15:52:00.933862', '', NULL, NULL, b'1', 3, 63, 61),
(5524, 'collaborator1', '2024-06-26 15:52:00.935868', '', NULL, NULL, b'1', 4, 63, 61),
(5525, 'collaborator1', '2024-06-26 15:52:00.938866', '', NULL, NULL, b'1', 5, 63, 61),
(5526, 'collaborator1', '2024-06-26 15:52:00.941864', '', NULL, NULL, b'1', 6, 63, 61),
(5527, 'collaborator1', '2024-06-26 15:52:00.944863', '', NULL, NULL, b'1', 1, 64, 61),
(5528, 'collaborator1', '2024-06-26 15:52:00.947867', '', NULL, NULL, b'1', 2, 64, 61),
(5529, 'collaborator1', '2024-06-26 15:52:00.949864', '', NULL, NULL, b'1', 3, 64, 61),
(5530, 'collaborator1', '2024-06-26 15:52:00.951863', '', NULL, NULL, b'1', 4, 64, 61),
(5531, 'collaborator1', '2024-06-26 15:52:00.954865', '', NULL, NULL, b'1', 5, 64, 61),
(5532, 'collaborator1', '2024-06-26 15:52:00.957867', '', NULL, NULL, b'1', 6, 64, 61),
(5533, 'collaborator1', '2024-06-26 15:52:00.959864', '', NULL, NULL, b'1', 1, 65, 61),
(5534, 'collaborator1', '2024-06-26 15:52:00.962865', '', NULL, NULL, b'1', 2, 65, 61),
(5535, 'collaborator1', '2024-06-26 15:52:00.965865', '', NULL, NULL, b'1', 3, 65, 61),
(5536, 'collaborator1', '2024-06-26 15:52:00.967866', '', NULL, NULL, b'1', 4, 65, 61),
(5537, 'collaborator1', '2024-06-26 15:52:00.969864', '', NULL, NULL, b'1', 5, 65, 61),
(5538, 'collaborator1', '2024-06-26 15:52:00.972865', '', NULL, NULL, b'1', 6, 65, 61),
(5539, 'collaborator1', '2024-06-26 15:52:00.975864', '', NULL, NULL, b'1', 1, 66, 61),
(5540, 'collaborator1', '2024-06-26 15:52:00.978864', '', NULL, NULL, b'1', 2, 66, 61),
(5541, 'collaborator1', '2024-06-26 15:52:00.980865', '', NULL, NULL, b'1', 3, 66, 61),
(5542, 'collaborator1', '2024-06-26 15:52:00.983865', '', NULL, NULL, b'1', 4, 66, 61),
(5543, 'collaborator1', '2024-06-26 15:52:00.985863', '', NULL, NULL, b'1', 5, 66, 61),
(5544, 'collaborator1', '2024-06-26 15:52:00.988864', '', NULL, NULL, b'1', 6, 66, 61),
(5545, 'collaborator1', '2024-06-26 15:52:00.991864', '', NULL, NULL, b'1', 1, 67, 61),
(5546, 'collaborator1', '2024-06-26 15:52:00.993863', '', NULL, NULL, b'1', 2, 67, 61),
(5547, 'collaborator1', '2024-06-26 15:52:00.995864', '', NULL, NULL, b'1', 3, 67, 61),
(5548, 'collaborator1', '2024-06-26 15:52:00.998869', '', NULL, NULL, b'1', 4, 67, 61),
(5549, 'collaborator1', '2024-06-26 15:52:01.001865', '', NULL, NULL, b'1', 5, 67, 61),
(5550, 'collaborator1', '2024-06-26 15:52:01.003863', '', NULL, NULL, b'1', 6, 67, 61),
(5551, 'collaborator1', '2024-06-26 15:52:01.006868', '', NULL, NULL, b'1', 1, 68, 61),
(5552, 'collaborator1', '2024-06-26 15:52:01.009864', '', NULL, NULL, b'1', 2, 68, 61),
(5553, 'collaborator1', '2024-06-26 15:52:01.011865', '', NULL, NULL, b'1', 3, 68, 61),
(5554, 'collaborator1', '2024-06-26 15:52:01.014864', '', NULL, NULL, b'1', 4, 68, 61),
(5555, 'collaborator1', '2024-06-26 15:52:01.017867', '', NULL, NULL, b'1', 5, 68, 61),
(5556, 'collaborator1', '2024-06-26 15:52:01.019868', '', NULL, NULL, b'1', 6, 68, 61),
(5557, 'collaborator1', '2024-06-26 15:52:01.022865', '', NULL, NULL, b'1', 1, 69, 61),
(5558, 'collaborator1', '2024-06-26 15:52:01.025864', '', NULL, NULL, b'1', 2, 69, 61),
(5559, 'collaborator1', '2024-06-26 15:52:01.028865', '', NULL, NULL, b'1', 3, 69, 61),
(5560, 'collaborator1', '2024-06-26 15:52:01.031869', '', NULL, NULL, b'1', 4, 69, 61),
(5561, 'collaborator1', '2024-06-26 15:52:01.034866', '', NULL, NULL, b'1', 5, 69, 61),
(5562, 'collaborator1', '2024-06-26 15:52:01.036865', '', NULL, NULL, b'1', 6, 69, 61),
(5563, 'collaborator1', '2024-06-26 15:52:01.039864', '', NULL, NULL, b'1', 1, 70, 61),
(5564, 'collaborator1', '2024-06-26 15:52:01.042864', '', NULL, NULL, b'1', 2, 70, 61),
(5565, 'collaborator1', '2024-06-26 15:52:01.044865', '', NULL, NULL, b'1', 3, 70, 61),
(5566, 'collaborator1', '2024-06-26 15:52:01.047877', '', NULL, NULL, b'1', 4, 70, 61),
(5567, 'collaborator1', '2024-06-26 15:52:01.050867', '', NULL, NULL, b'1', 5, 70, 61),
(5568, 'collaborator1', '2024-06-26 15:52:01.053863', '', NULL, NULL, b'1', 6, 70, 61),
(5569, 'collaborator1', '2024-06-26 15:52:01.055866', '', NULL, NULL, b'1', 1, 71, 61),
(5570, 'collaborator1', '2024-06-26 15:52:01.058865', '', NULL, NULL, b'1', 2, 71, 61),
(5571, 'collaborator1', '2024-06-26 15:52:01.061863', '', NULL, NULL, b'1', 3, 71, 61),
(5572, 'collaborator1', '2024-06-26 15:52:01.064867', '', NULL, NULL, b'1', 4, 71, 61),
(5573, 'collaborator1', '2024-06-26 15:52:01.067863', '', NULL, NULL, b'1', 5, 71, 61),
(5574, 'collaborator1', '2024-06-26 15:52:01.069865', '', NULL, NULL, b'1', 6, 71, 61),
(5575, 'collaborator1', '2024-06-26 15:52:01.071866', '', NULL, NULL, b'1', 1, 72, 61),
(5576, 'collaborator1', '2024-06-26 15:52:01.075864', '', NULL, NULL, b'1', 2, 72, 61),
(5577, 'collaborator1', '2024-06-26 15:52:01.078867', '', NULL, NULL, b'1', 3, 72, 61),
(5578, 'collaborator1', '2024-06-26 15:52:01.080867', '', NULL, NULL, b'1', 4, 72, 61),
(5579, 'collaborator1', '2024-06-26 15:52:01.083864', '', NULL, NULL, b'1', 5, 72, 61),
(5580, 'collaborator1', '2024-06-26 15:52:01.086865', '', NULL, NULL, b'1', 6, 72, 61),
(5581, 'collaborator1', '2024-06-26 15:52:01.089867', '', NULL, NULL, b'1', 1, 73, 61),
(5582, 'collaborator1', '2024-06-26 15:52:01.092865', '', NULL, NULL, b'1', 2, 73, 61),
(5583, 'collaborator1', '2024-06-26 15:52:01.095862', '', NULL, NULL, b'1', 3, 73, 61),
(5584, 'collaborator1', '2024-06-26 15:52:01.097880', '', NULL, NULL, b'1', 4, 73, 61),
(5585, 'collaborator1', '2024-06-26 15:52:01.101866', '', NULL, NULL, b'1', 5, 73, 61),
(5586, 'collaborator1', '2024-06-26 15:52:01.103866', '', NULL, NULL, b'1', 6, 73, 61),
(5587, 'collaborator1', '2024-06-26 15:52:01.106868', '', NULL, NULL, b'1', 1, 74, 61),
(5588, 'collaborator1', '2024-06-26 15:52:01.109864', '', NULL, NULL, b'1', 2, 74, 61),
(5589, 'collaborator1', '2024-06-26 15:52:01.111867', '', NULL, NULL, b'1', 3, 74, 61),
(5590, 'collaborator1', '2024-06-26 15:52:01.114865', '', NULL, NULL, b'1', 4, 74, 61),
(5591, 'collaborator1', '2024-06-26 15:52:01.117864', '', NULL, NULL, b'1', 5, 74, 61),
(5592, 'collaborator1', '2024-06-26 15:52:01.120865', '', NULL, NULL, b'1', 6, 74, 61),
(5593, 'collaborator1', '2024-06-26 15:52:01.122873', '', NULL, NULL, b'1', 1, 75, 61),
(5594, 'collaborator1', '2024-06-26 15:52:01.125864', '', NULL, NULL, b'1', 2, 75, 61),
(5595, 'collaborator1', '2024-06-26 15:52:01.128865', '', NULL, NULL, b'1', 3, 75, 61),
(5596, 'collaborator1', '2024-06-26 15:52:01.130864', '', NULL, NULL, b'1', 4, 75, 61),
(5597, 'collaborator1', '2024-06-26 15:52:01.133865', '', NULL, NULL, b'1', 5, 75, 61),
(5598, 'collaborator1', '2024-06-26 15:52:01.136863', '', NULL, NULL, b'1', 6, 75, 61),
(5599, 'collaborator1', '2024-06-26 15:52:01.138866', '', NULL, NULL, b'1', 1, 76, 61),
(5600, 'collaborator1', '2024-06-26 15:52:01.141865', '', NULL, NULL, b'1', 2, 76, 61),
(5601, 'collaborator1', '2024-06-26 15:52:01.144863', '', NULL, NULL, b'1', 3, 76, 61),
(5602, 'collaborator1', '2024-06-26 15:52:01.146865', '', NULL, NULL, b'1', 4, 76, 61),
(5603, 'collaborator1', '2024-06-26 15:52:01.150866', '', NULL, NULL, b'1', 5, 76, 61),
(5604, 'collaborator1', '2024-06-26 15:52:01.152863', '', NULL, NULL, b'1', 6, 76, 61),
(5605, 'collaborator1', '2024-06-26 15:52:01.155865', '', NULL, NULL, b'1', 1, 77, 61),
(5606, 'collaborator1', '2024-06-26 15:52:01.158865', '', NULL, NULL, b'1', 2, 77, 61),
(5607, 'collaborator1', '2024-06-26 15:52:01.160866', '', NULL, NULL, b'1', 3, 77, 61),
(5608, 'collaborator1', '2024-06-26 15:52:01.163868', '', NULL, NULL, b'1', 4, 77, 61),
(5609, 'collaborator1', '2024-06-26 15:52:01.167865', '', NULL, NULL, b'1', 5, 77, 61),
(5610, 'collaborator1', '2024-06-26 15:52:01.169866', '', NULL, NULL, b'1', 6, 77, 61),
(5611, 'collaborator1', '2024-06-26 15:52:01.173870', '', NULL, NULL, b'1', 1, 78, 61),
(5612, 'collaborator1', '2024-06-26 15:52:01.176865', '', NULL, NULL, b'1', 2, 78, 61),
(5613, 'collaborator1', '2024-06-26 15:52:01.179867', '', NULL, NULL, b'1', 3, 78, 61),
(5614, 'collaborator1', '2024-06-26 15:52:01.182866', '', NULL, NULL, b'1', 4, 78, 61),
(5615, 'collaborator1', '2024-06-26 15:52:01.185865', '', NULL, NULL, b'1', 5, 78, 61),
(5616, 'collaborator1', '2024-06-26 15:52:01.188866', '', NULL, NULL, b'1', 6, 78, 61);

-- --------------------------------------------------------

--
-- Structure de la table `model_permission_utilisateur_seq`
--

CREATE TABLE `model_permission_utilisateur_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `model_permission_utilisateur_seq`
--

INSERT INTO `model_permission_utilisateur_seq` (`next_val`) VALUES
(1),
(5617);

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `date_news` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `destinataire` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero_ordre` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `news_seq`
--

CREATE TABLE `news_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `news_seq`
--

INSERT INTO `news_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `niveau_etude`
--

CREATE TABLE `niveau_etude` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `niveau_etude`
--

INSERT INTO `niveau_etude` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `libelle`) VALUES
(1, NULL, NULL, NULL, NULL, '1', 'Postgraduate'),
(2, NULL, NULL, NULL, NULL, '2', 'Undergraduate'),
(3, NULL, NULL, NULL, NULL, '3', 'Graduate'),
(4, NULL, NULL, NULL, NULL, '4', 'Other');

-- --------------------------------------------------------

--
-- Structure de la table `niveau_etude_seq`
--

CREATE TABLE `niveau_etude_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `niveau_etude_seq`
--

INSERT INTO `niveau_etude_seq` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `package_collaborator`
--

CREATE TABLE `package_collaborator` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nbr_student_base` decimal(38,2) DEFAULT NULL,
  `price_banner_ad` decimal(38,2) DEFAULT NULL,
  `price_banner_ad_old` decimal(38,2) DEFAULT NULL,
  `price_base` decimal(38,2) DEFAULT NULL,
  `price_base_old` decimal(38,2) DEFAULT NULL,
  `price_color` decimal(38,2) DEFAULT NULL,
  `price_color_old` decimal(38,2) DEFAULT NULL,
  `price_logo` decimal(38,2) DEFAULT NULL,
  `price_logo_old` decimal(38,2) DEFAULT NULL,
  `collaborator` varbinary(255) DEFAULT NULL,
  `school` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `package_collaborator`
--

INSERT INTO `package_collaborator` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `libelle`, `nbr_student_base`, `price_banner_ad`, `price_banner_ad_old`, `price_base`, `price_base_old`, `price_color`, `price_color_old`, `price_logo`, `price_logo_old`, `collaborator`, `school`) VALUES
(1, '', '2024-07-18 10:18:07.319721', 'anonymousUser', '2024-07-30 14:04:54.342152', 'default package', 1.00, 10.00, 25.00, 15.00, 14.00, 8.00, 14.00, 21.00, 25.00, NULL, NULL),
(2, NULL, NULL, 'anonymousUser', '2024-07-31 12:07:35.905963', 'package test', 10.00, 15.00, 25.00, 60.00, 120.00, 5.00, 15.00, 15.00, 15.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `package_collaborator_seq`
--

CREATE TABLE `package_collaborator_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `package_collaborator_seq`
--

INSERT INTO `package_collaborator_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `pack_student`
--

CREATE TABLE `pack_student` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expectations` varchar(255) DEFAULT NULL,
  `for_groupe` bit(1) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_cours` int(11) DEFAULT NULL,
  `old_price` varchar(255) DEFAULT NULL,
  `pre_requisites` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `total_students` int(11) DEFAULT NULL,
  `why_take_this_course` varchar(255) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pack_student_seq`
--

CREATE TABLE `pack_student_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pack_student_seq`
--

INSERT INTO `pack_student_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_paiement` datetime(6) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement_inscription_collaborator`
--

CREATE TABLE `paiement_inscription_collaborator` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `discount` decimal(38,2) DEFAULT NULL,
  `paiement_date` datetime(6) DEFAULT NULL,
  `remaining` decimal(38,2) DEFAULT NULL,
  `total` decimal(38,2) DEFAULT NULL,
  `inscription_collaborator` bigint(20) DEFAULT NULL,
  `paiement_inscription_collaborator_state` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement_inscription_collaborator_seq`
--

CREATE TABLE `paiement_inscription_collaborator_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement_inscription_collaborator_seq`
--

INSERT INTO `paiement_inscription_collaborator_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `paiement_inscription_collaborator_state`
--

CREATE TABLE `paiement_inscription_collaborator_state` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement_inscription_collaborator_state_seq`
--

CREATE TABLE `paiement_inscription_collaborator_state_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement_inscription_collaborator_state_seq`
--

INSERT INTO `paiement_inscription_collaborator_state_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `paiement_seq`
--

CREATE TABLE `paiement_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement_seq`
--

INSERT INTO `paiement_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `date_creation` datetime(6) DEFAULT NULL,
  `date_publication` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_cours` int(11) DEFAULT NULL,
  `numero_order` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parcours`
--

INSERT INTO `parcours` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `color`, `date_creation`, `date_publication`, `description`, `libelle`, `nombre_cours`, `numero_order`, `url`, `collaborator`) VALUES
(1, 'collaborator', '2024-05-17 21:16:57.723714', 'anonymousUser', '2024-07-30 12:43:41.000000', NULL, 'cyan', NULL, NULL, 'desc', 'Elementary for teensSelma', 6, 0, 'http://localhost:8036/app/images/QYsvaJb2ww/QYsvaJb2ww.jpg', NULL),
(2, 'collaborator1', '2024-06-26 15:53:38.468793', 'collaborator1', '2024-06-26 15:54:28.322060', 'I', 'violet', NULL, NULL, 'Velit quia impedit', 'Itaque quod esse ul', 2, 0, NULL, NULL),
(3, 'collaborator1', '2024-06-26 15:53:46.281998', 'collaborator1', '2024-06-26 15:53:59.517704', 'V', 'yellow', NULL, NULL, 'Praesentium ullamco ', 'Voluptatem voluptat', 1, 0, NULL, NULL),
(4, 'collaborator', '2024-05-17 21:26:44.957372', 'collaborator', '2024-06-26 14:35:48.491765', 'E', 'amber', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et ante eu turpis pellentesque iaculis. Nullam pharetra.', 'ELEMENTARY', 1, 0, NULL, NULL),
(5, 'collaborator', '2024-05-17 21:27:27.440542', '', NULL, 'P', 'pink', NULL, NULL, 'small description', 'PRE INTERMEDIATE', 0, 0, 'http://localhost:8036/app/images/dt400EN9no/dt400EN9no.jpg', NULL),
(10, 'anonymousUser', '2024-07-27 17:05:42.000000', 'anonymousUser', '2024-07-29 12:21:20.000000', 'T', NULL, NULL, NULL, 'desc', 'title', 5, 0, NULL, NULL),
(52, 'collaborator', '2024-05-27 13:21:11.740589', '', NULL, 'L', 'amber', NULL, NULL, NULL, 'Lorem ipsum dolor ', 0, 0, NULL, NULL),
(100, NULL, NULL, 'anonymousUser', '2024-08-02 20:11:33.000000', 'E', NULL, NULL, NULL, 'EngFlexy description', 'EngFlexy Parcours', NULL, NULL, NULL, 3),
(102, 'collaborator', '2024-05-27 13:32:58.947779', 'collaborator1', '2024-06-26 15:54:08.187560', 'L', 'gray', NULL, NULL, NULL, 'Lorem ipsum II', 2, 0, NULL, NULL),
(103, 'anonymousUser', '2024-07-30 12:37:04.000000', '', NULL, 'G', NULL, NULL, NULL, 'ggggg', 'ggggg', 0, 0, NULL, NULL),
(104, 'anonymousUser', '2024-07-30 12:37:34.000000', 'anonymousUser', '2024-07-30 12:43:05.000000', 'S', NULL, NULL, NULL, 'Ut ', 'Sit voluptas ', 2, 0, NULL, NULL),
(108, 'anonymousUser', '2024-07-30 13:32:44.000000', 'anonymousUser', '2024-07-30 13:38:37.000000', 'S', 'amber', NULL, NULL, 'Ut ipsam illum sed ', 'Sunt at veniam arch', 2, 0, NULL, NULL),
(152, 'anonymousUser', '2024-07-30 14:49:36.000000', '', NULL, 'S', 'amber', NULL, NULL, 'Et autem culpa reru', 'Sint velit ut eos su', 0, 0, NULL, NULL),
(153, 'anonymousUser', '2024-07-30 14:51:04.000000', '', NULL, 'A', 'violet', NULL, NULL, 'Dicta ullam lorem al', 'Asperiores ea qui te', 0, 0, NULL, NULL),
(154, 'anonymousUser', '2024-07-30 14:53:30.000000', 'anonymousUser', '2024-07-30 15:27:38.000000', 'D', 'amber', NULL, NULL, 'Tempora facilis moll', 'Dolorem incididunt l', 4, 0, NULL, 2),
(155, 'anonymousUser', '2024-07-30 14:57:44.000000', '', NULL, 'E', 'rose', NULL, NULL, 'Duis vero sint quis ', 'Eu ea eum praesentiu', 0, 0, NULL, 2),
(156, 'anonymousUser', '2024-07-30 15:22:32.000000', 'anonymousUser', '2024-07-30 15:22:43.000000', 'A', 'blue', NULL, NULL, 'Hic culpa laborum m', 'Aliquam nostrum face', 1, 0, NULL, 2),
(202, 'anonymousUser', '2024-08-08 15:49:46.000000', 'anonymousUser', '2024-08-08 15:52:03.000000', 'G', 'yellow', NULL, NULL, 'ggggg', 'ggggg', 2, 0, 'http://localhost:8036/app/images/iguPBG3fZ5/iguPBG3fZ5.jpg', 2),
(252, 'anonymousUser', '2024-08-15 12:54:01.000000', '', NULL, 'F', 'amber', NULL, NULL, 'gggg', 'ffff', 0, 0, NULL, NULL),
(253, 'anonymousUser', '2024-08-15 12:54:25.000000', '', NULL, 'N', 'pink', NULL, NULL, 'new', 'new', 0, 0, 'http://localhost:8036/app/images/2VVM4gMsVc/2VVM4gMsVc.jpg', NULL),
(254, 'anonymousUser', '2024-08-15 12:54:59.000000', '', NULL, 'N', 'yellow', NULL, NULL, 'new', 'new', 0, 0, 'http://localhost:8036/app/images/8oX5zyfvmj/8oX5zyfvmj.jpg', NULL),
(255, 'anonymousUser', '2024-08-15 12:56:15.000000', '', NULL, 'N', 'amber', NULL, NULL, 'new', 'new', 0, 0, 'http://localhost:8036/app/images/prmGwAUhNb/prmGwAUhNb.jpg', NULL),
(256, 'anonymousUser', '2024-08-15 13:08:49.000000', '', NULL, 'J', 'amber', NULL, NULL, 'jj', 'jj', 0, 0, NULL, 2),
(257, 'anonymousUser', '2024-08-15 13:28:13.000000', 'anonymousUser', '2024-08-15 13:28:32.000000', 'H', 'violet', NULL, NULL, 'hhhh', 'hhhh', 1, 0, 'http://localhost:8036/app/images/tsknyKNyg3/tsknyKNyg3.jpg', 2),
(302, 'anonymousUser', '2024-08-17 12:15:40.000000', '', NULL, 'N', 'rose', NULL, NULL, 'new', 'new', 0, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `parcours_seq`
--

CREATE TABLE `parcours_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parcours_seq`
--

INSERT INTO `parcours_seq` (`next_val`) VALUES
(401),
(401),
(401),
(401);

-- --------------------------------------------------------

--
-- Structure de la table `price`
--

CREATE TABLE `price` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `for_group` bit(1) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `nre_course` decimal(38,2) DEFAULT NULL,
  `nre_hours` decimal(38,2) DEFAULT NULL,
  `nre_month` decimal(38,2) DEFAULT NULL,
  `old_price` decimal(38,2) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `price`
--

INSERT INTO `price` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `for_group`, `lib`, `nre_course`, `nre_hours`, `nre_month`, `old_price`, `price`, `collaborator`) VALUES
(3, NULL, NULL, NULL, NULL, b'0', 'SILVER', 8.00, 8.00, 1.00, 1600.00, 1110.00, NULL),
(4, NULL, NULL, NULL, NULL, b'0', 'GOLD', 24.00, 24.00, 3.00, 4800.00, 2856.00, NULL),
(5, NULL, NULL, NULL, NULL, b'0', 'PLATINUM', 48.00, 48.00, 6.00, 9600.00, 5519.00, NULL),
(6, NULL, NULL, NULL, NULL, b'1', 'PREMIUM', 24.00, 24.00, 1.00, 1860.00, 936.00, NULL),
(53971, NULL, NULL, NULL, NULL, b'0', 'ONE-CLASS', 1.00, 1.00, 0.00, 81.00, 41.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `price_seq`
--

CREATE TABLE `price_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `price_seq`
--

INSERT INTO `price_seq` (`next_val`) VALUES
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `prof_review`
--

CREATE TABLE `prof_review` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_review` datetime(6) DEFAULT NULL,
  `review` int(11) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prof_review_seq`
--

CREATE TABLE `prof_review_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prof_review_seq`
--

INSERT INTO `prof_review_seq` (`next_val`) VALUES
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `libelle` TEXT DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `point_reponse_juste` decimal(38,2) DEFAULT NULL,
  `point_reponsefausse` decimal(38,2) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `type_de_question` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `libelle`, `numero`, `point_reponse_juste`, `point_reponsefausse`, `ref`, `url_img`, `url_video`, `quiz`, `type_de_question`) VALUES
(2, 'anonymousUser', '2024-08-16 09:59:52.000000', 'anonymousUser', '2024-08-16 09:59:52.000000', 'rrrtf fgff', 1, 1.00, 0.00, NULL, NULL, NULL, 2, 5),
(3, 'anonymousUser', '2024-08-16 11:15:47.000000', 'anonymousUser', '2024-08-16 11:15:47.000000', 'YYYY', 1, 1.00, 0.00, NULL, NULL, NULL, 3, 5),
(4, 'anonymousUser', '2024-08-16 11:15:47.000000', 'anonymousUser', '2024-08-16 11:15:47.000000', 'YYTTTT', 2, 1.00, 0.00, NULL, NULL, NULL, 3, 5),
(5, 'anonymousUser', '2024-08-16 11:15:47.000000', 'anonymousUser', '2024-08-16 11:15:47.000000', 'TEREFD', 3, 1.00, 0.00, NULL, NULL, NULL, 3, 5),
(6, 'anonymousUser', '2024-08-16 11:15:47.000000', 'anonymousUser', '2024-08-16 11:15:47.000000', 'ERZRZ', 4, 1.00, 0.00, NULL, NULL, NULL, 3, 5),
(7, 'anonymousUser', '2024-08-16 11:18:08.000000', 'anonymousUser', '2024-08-16 11:18:08.000000', 'gftff ....rtryr', 1, 1.00, 0.00, NULL, NULL, NULL, 4, 1),
(8, 'anonymousUser', '2024-08-16 11:18:08.000000', 'anonymousUser', '2024-08-16 11:18:08.000000', 'rete .... uriri', 2, 1.00, 0.00, NULL, NULL, NULL, 4, 1),
(9, 'anonymousUser', '2024-08-16 11:18:08.000000', 'anonymousUser', '2024-08-16 11:18:08.000000', 'tryryr .... ytuti', 3, 1.00, 0.00, NULL, NULL, NULL, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `question_seq`
--

CREATE TABLE `question_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `question_seq`
--

INSERT INTO `question_seq` (`next_val`) VALUES
(101),
(101);

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `seuil_reussite` bigint(20) DEFAULT NULL,
  `exercice` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `date_debut`, `date_fin`, `lib`, `numero`, `ref`, `seuil_reussite`, `exercice`) VALUES
(2, 'anonymousUser', '2024-08-16 09:59:52.000000', 'anonymousUser', '2024-08-16 09:59:52.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'anonymousUser', '2024-08-16 11:15:47.000000', 'anonymousUser', '2024-08-16 11:15:47.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'anonymousUser', '2024-08-16 11:18:08.000000', 'anonymousUser', '2024-08-16 11:18:08.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `quiz_etudiant`
--

CREATE TABLE `quiz_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `note` decimal(38,2) DEFAULT NULL,
  `question_current` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `resultat` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quiz_etudiant_seq`
--

CREATE TABLE `quiz_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `quiz_etudiant_seq`
--

INSERT INTO `quiz_etudiant_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `quiz_seq`
--

CREATE TABLE `quiz_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `quiz_seq`
--

INSERT INTO `quiz_seq` (`next_val`) VALUES
(101),
(101);

-- --------------------------------------------------------

--
-- Structure de la table `reclamation_etudiant`
--

CREATE TABLE `reclamation_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `commentaire_traiteur` varchar(255) DEFAULT NULL,
  `date_reclamation` datetime(6) DEFAULT NULL,
  `date_reponse` datetime(6) DEFAULT NULL,
  `date_traitement` datetime(6) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `objet_reclamation_etudiant` varchar(255) DEFAULT NULL,
  `post_view` bit(1) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `set_from` varchar(255) DEFAULT NULL,
  `traite` bit(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `type_reclamation_etudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reclamation_etudiant_seq`
--

CREATE TABLE `reclamation_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reclamation_etudiant_seq`
--

INSERT INTO `reclamation_etudiant_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `reclamation_prof`
--

CREATE TABLE `reclamation_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `commentaire_traiteur` varchar(255) DEFAULT NULL,
  `date_reclamation` datetime(6) DEFAULT NULL,
  `date_reponse` datetime(6) DEFAULT NULL,
  `date_traitement` datetime(6) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `objet_reclamation_prof` varchar(255) DEFAULT NULL,
  `post_view` bit(1) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `traite` bit(1) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `type_reclamation_prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reclamation_prof_seq`
--

CREATE TABLE `reclamation_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reclamation_prof_seq`
--

INSERT INTO `reclamation_prof_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `recommend_teacher`
--

CREATE TABLE `recommend_teacher` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `date_recommamdation` datetime(6) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `nombrevote` int(11) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recommend_teacher_seq`
--

CREATE TABLE `recommend_teacher_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recommend_teacher_seq`
--

INSERT INTO `recommend_teacher_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `etat_reponse` bit(1) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `etat_reponse`, `lib`, `numero`, `ref`, `question`) VALUES
(2, 'anonymousUser', '2024-08-16 09:59:52.000000', '', NULL, b'1', 'true', 1, NULL, 2),
(3, 'anonymousUser', '2024-08-16 11:15:47.000000', '', NULL, b'1', 'true', 1, NULL, 3),
(4, 'anonymousUser', '2024-08-16 11:15:47.000000', '', NULL, b'1', 'false', 1, NULL, 4),
(5, 'anonymousUser', '2024-08-16 11:15:47.000000', '', NULL, b'1', 'false', 1, NULL, 5),
(6, 'anonymousUser', '2024-08-16 11:15:47.000000', '', NULL, b'1', 'false', 1, NULL, 6),
(7, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'0', 'rete', 1, NULL, 7),
(8, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'1', 'tryrr', 2, NULL, 7),
(9, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'0', 'ryrur', 3, NULL, 7),
(10, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'0', 'erere', 1, NULL, 8),
(11, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'1', 'tryr', 2, NULL, 8),
(12, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'0', 'utuyty', 3, NULL, 8),
(13, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'0', 'ytyt', 1, NULL, 9),
(14, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'1', 'uyut', 2, NULL, 9),
(15, 'anonymousUser', '2024-08-16 11:18:08.000000', '', NULL, b'0', 'ezrzt', 3, NULL, 9);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_etudiant`
--

CREATE TABLE `reponse_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `note` decimal(38,2) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL,
  `quiz_etudiant` bigint(20) DEFAULT NULL,
  `reponse` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_etudiant_home_work`
--

CREATE TABLE `reponse_etudiant_home_work` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `note` decimal(38,2) DEFAULT NULL,
  `prof_note` varchar(255) DEFAULT NULL,
  `home_work_etudiant` bigint(20) DEFAULT NULL,
  `home_work_question` bigint(20) DEFAULT NULL,
  `howe_work_q_s_t_reponse` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_etudiant_home_work_seq`
--

CREATE TABLE `reponse_etudiant_home_work_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reponse_etudiant_home_work_seq`
--

INSERT INTO `reponse_etudiant_home_work_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_etudiant_seq`
--

CREATE TABLE `reponse_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reponse_etudiant_seq`
--

INSERT INTO `reponse_etudiant_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_seq`
--

CREATE TABLE `reponse_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reponse_seq`
--

INSERT INTO `reponse_seq` (`next_val`) VALUES
(101),
(101);

-- --------------------------------------------------------

--
-- Structure de la table `role_app`
--

CREATE TABLE `role_app` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role_app`
--

INSERT INTO `role_app` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `authority`, `created_at`, `updated_at`) VALUES
(1, '', '2024-06-26 15:36:42.035897', '', NULL, 'ROLE_ADMIN', '2024-06-26 15:36:42.035125', NULL),
(2, '', '2024-06-26 15:36:43.873072', '', NULL, 'ROLE_COLLABORATOR', '2024-06-26 15:36:43.873072', NULL),
(4, '', '2024-06-26 15:47:06.606614', '', NULL, 'ROLE_ADMIN', '2024-06-26 15:47:06.591624', NULL),
(5, '', '2024-06-26 15:47:09.259629', '', NULL, 'ROLE_COLLABORATOR', '2024-06-26 15:47:09.258633', NULL),
(9, 'collaborator1', '2024-06-26 15:51:01.116867', '', NULL, 'ROLE_STUDENT', '2024-06-26 15:51:01.116867', NULL),
(10, 'collaborator1', '2024-06-26 15:51:07.910631', '', NULL, 'ROLE_STUDENT', '2024-06-26 15:51:07.910631', NULL),
(11, 'collaborator1', '2024-06-26 15:51:16.622474', '', NULL, 'ROLE_STUDENT', '2024-06-26 15:51:16.621470', NULL),
(12, 'collaborator1', '2024-06-26 15:51:23.568155', '', NULL, 'ROLE_STUDENT', '2024-06-26 15:51:23.567156', NULL),
(13, 'collaborator1', '2024-06-26 15:51:30.495356', '', NULL, 'ROLE_TEACHER', '2024-06-26 15:51:30.495356', NULL),
(14, 'collaborator1', '2024-06-26 15:51:35.410052', '', NULL, 'ROLE_TEACHER', '2024-06-26 15:51:35.410052', NULL),
(15, 'collaborator1', '2024-06-26 15:51:40.391946', '', NULL, 'ROLE_TEACHER', '2024-06-26 15:51:40.391946', NULL),
(16, 'collaborator1', '2024-06-26 15:51:59.853868', '', NULL, 'ROLE_COLLABORATOR', '2024-06-26 15:51:59.853868', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role_seq`
--

CREATE TABLE `role_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role_seq`
--

INSERT INTO `role_seq` (`next_val`) VALUES
(7),
(17);

-- --------------------------------------------------------

--
-- Structure de la table `role_utilisateur`
--

CREATE TABLE `role_utilisateur` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `role` bigint(20) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role_utilisateur`
--

INSERT INTO `role_utilisateur` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `role`, `user`) VALUES
(1, '', '2024-06-26 15:36:43.476891', '', NULL, 1, 1),
(2, '', '2024-06-26 15:36:45.257201', '', NULL, 2, 2),
(3, '', '2024-06-26 15:47:08.590621', '', NULL, 4, 52),
(4, '', '2024-06-26 15:47:10.956624', '', NULL, 5, 53),
(5, 'collaborator1', '2024-06-26 15:51:02.615860', '', NULL, 9, 54),
(6, 'collaborator1', '2024-06-26 15:51:09.291121', '', NULL, 10, 55),
(7, 'collaborator1', '2024-06-26 15:51:18.201674', '', NULL, 11, 56),
(8, 'collaborator1', '2024-06-26 15:51:24.856571', '', NULL, 12, 57),
(9, 'collaborator1', '2024-06-26 15:51:31.882362', '', NULL, 13, 58),
(10, 'collaborator1', '2024-06-26 15:51:36.727327', '', NULL, 14, 59),
(11, 'collaborator1', '2024-06-26 15:51:41.963092', '', NULL, 15, 60),
(12, 'collaborator1', '2024-06-26 15:52:01.191865', '', NULL, 16, 61);

-- --------------------------------------------------------

--
-- Structure de la table `role_utilisateur_seq`
--

CREATE TABLE `role_utilisateur_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role_utilisateur_seq`
--

INSERT INTO `role_utilisateur_seq` (`next_val`) VALUES
(1),
(13);

-- --------------------------------------------------------

--
-- Structure de la table `salary`
--

CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `nbr_session_mensuel` decimal(38,2) DEFAULT NULL,
  `payer` bit(1) DEFAULT NULL,
  `total_bonus_class_average` decimal(38,2) DEFAULT NULL,
  `total_bonus_workload` decimal(38,2) DEFAULT NULL,
  `total_payment` decimal(38,2) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salary`
--

INSERT INTO `salary` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `annee`, `code`, `mois`, `nbr_session_mensuel`, `payer`, `total_bonus_class_average`, `total_bonus_workload`, `total_payment`, `prof`) VALUES
(1, 'anonymousUser', '2024-07-16 13:32:05.000000', 'anonymousUser', '2024-07-24 11:34:28.000000', 2022, 'cc', 0, 7.00, b'1', 0.00, 0.00, 3.00, 58),
(152, 'anonymousUser', '2024-07-24 11:36:55.000000', '', NULL, 2021, 'C1', 0, 1.00, b'1', 0.00, 0.00, 2.00, 59),
(202, 'anonymousUser', '2024-07-29 16:00:27.000000', '', NULL, 2024, 's1', 3, 1.00, b'1', 0.00, 0.00, 22.00, 60),
(252, 'anonymousUser', '2024-08-08 19:04:24.000000', '', NULL, 2021, 'C44', 0, 1.00, b'0', 0.00, 0.00, 122.00, 59);

-- --------------------------------------------------------

--
-- Structure de la table `salary_seq`
--

CREATE TABLE `salary_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salary_seq`
--

INSERT INTO `salary_seq` (`next_val`) VALUES
(351),
(351);

-- --------------------------------------------------------

--
-- Structure de la table `schedule_prof`
--

CREATE TABLE `schedule_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `course_finished` bit(1) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `grp_name` varchar(255) DEFAULT NULL,
  `prof_name` varchar(255) DEFAULT NULL,
  `profs_id` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `schedule_prof_seq`
--

CREATE TABLE `schedule_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `schedule_prof_seq`
--

INSERT INTO `schedule_prof_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `description`, `libelle`, `numero`, `cours`) VALUES
(1, 'collaborator', '2024-06-26 15:43:13.466785', 'anonymousUser', '2024-07-30 12:45:12.000000', NULL, NULL, 'section 1', 1, 1),
(103, 'anonymousUser', '2024-07-30 12:43:46.000000', '', NULL, NULL, NULL, 'section 1', NULL, 105),
(105, 'anonymousUser', '2024-07-30 13:33:16.000000', '', NULL, NULL, NULL, 'section 1', NULL, 106),
(106, 'anonymousUser', '2024-07-30 13:36:13.000000', '', NULL, NULL, NULL, 'section 2', NULL, 106),
(107, 'anonymousUser', '2024-07-30 13:36:37.000000', '', NULL, NULL, NULL, 'section 3', NULL, 106),
(108, 'anonymousUser', '2024-07-30 13:41:58.000000', '', NULL, NULL, NULL, 'section 2', 2, 1),
(152, 'anonymousUser', '2024-07-30 13:47:51.000000', '', NULL, NULL, NULL, 'section 3', 3, 1),
(202, 'anonymousUser', '2024-07-30 15:27:28.000000', '', NULL, NULL, NULL, 'section 1', 1, 152),
(252, 'anonymousUser', '2024-08-08 15:52:33.000000', 'anonymousUser', '2024-08-08 15:53:14.000000', NULL, 'desc', 'section22221', 1, 204),
(302, 'anonymousUser', '2024-08-13 11:26:26.000000', '', NULL, NULL, NULL, 'section 1', 1, 203),
(352, 'anonymousUser', '2024-08-15 12:55:28.000000', '', NULL, NULL, NULL, 'section 1', 1, 153),
(353, 'anonymousUser', '2024-08-15 13:28:35.000000', '', NULL, NULL, NULL, 'section 1', 1, 252);

-- --------------------------------------------------------

--
-- Structure de la table `section_item`
--

CREATE TABLE `section_item` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `example` varchar(255) DEFAULT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `synonyms` varchar(255) DEFAULT NULL,
  `transcription` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `section_item_seq`
--

CREATE TABLE `section_item_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `section_item_seq`
--

INSERT INTO `section_item_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `section_seq`
--

CREATE TABLE `section_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `section_seq`
--

INSERT INTO `section_seq` (`next_val`) VALUES
(451),
(451);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services_seq`
--

CREATE TABLE `services_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `services_seq`
--

INSERT INTO `services_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `session_cours`
--

CREATE TABLE `session_cours` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `annee` decimal(38,2) DEFAULT NULL,
  `course_finished` bit(1) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `duree` decimal(38,2) DEFAULT NULL,
  `homework_finished` bit(1) DEFAULT NULL,
  `mois` decimal(38,2) DEFAULT NULL,
  `nre_add_section_finished` bigint(20) DEFAULT NULL,
  `nre_key_section_finished` bigint(20) DEFAULT NULL,
  `nre_words` bigint(20) DEFAULT NULL,
  `payer` bit(1) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `total_add_section` bigint(20) DEFAULT NULL,
  `total_key_section` bigint(20) DEFAULT NULL,
  `totalheure` decimal(38,2) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `session_cours`
--

INSERT INTO `session_cours` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `annee`, `course_finished`, `date_debut`, `date_fin`, `duree`, `homework_finished`, `mois`, `nre_add_section_finished`, `nre_key_section_finished`, `nre_words`, `payer`, `reference`, `total_add_section`, `total_key_section`, `totalheure`, `cours`, `groupe_etudiant`, `prof`, `salary`) VALUES
(35209, NULL, NULL, NULL, NULL, 0.00, b'1', NULL, '2022-11-07 18:36:51.000000', 0.00, b'0', 0.00, 3, 6, 0, b'1', 'M2KPfC', 3, 6, 0.00, 3, 1, 58, 1),
(35260, NULL, NULL, NULL, NULL, 0.00, b'1', NULL, '2022-11-11 12:53:31.000000', 0.00, b'0', 0.00, 3, 6, 0, b'1', 'BqkTIN', 3, 6, 0.00, 3, 1, 58, 1),
(35475, NULL, NULL, NULL, NULL, 0.00, b'1', NULL, '2022-11-14 15:27:41.000000', 0.00, b'0', 0.00, 3, 6, 0, b'0', 'DccQ5W', 3, 6, 0.00, 3, 1, 58, 1);

-- --------------------------------------------------------

--
-- Structure de la table `session_cours_section`
--

CREATE TABLE `session_cours_section` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL,
  `session_cours` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session_cours_section_seq`
--

CREATE TABLE `session_cours_section_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `session_cours_section_seq`
--

INSERT INTO `session_cours_section_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `session_cours_seq`
--

CREATE TABLE `session_cours_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `session_cours_seq`
--

INSERT INTO `session_cours_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

CREATE TABLE `skill` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `skill_seq`
--

CREATE TABLE `skill_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skill_seq`
--

INSERT INTO `skill_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `statut_free_trial`
--

CREATE TABLE `statut_free_trial` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `statut_free_trial_seq`
--

CREATE TABLE `statut_free_trial_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `statut_free_trial_seq`
--

INSERT INTO `statut_free_trial_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `statut_social`
--

CREATE TABLE `statut_social` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `statut_social_seq`
--

CREATE TABLE `statut_social_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `statut_social_seq`
--

INSERT INTO `statut_social_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `teacher_locality`
--

CREATE TABLE `teacher_locality` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `teacher_locality_seq`
--

CREATE TABLE `teacher_locality_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teacher_locality_seq`
--

INSERT INTO `teacher_locality_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `tranche_horaire_prof`
--

CREATE TABLE `tranche_horaire_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `end_hour` varchar(255) DEFAULT NULL,
  `group_index` int(11) DEFAULT NULL,
  `start_hour` varchar(255) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tranche_horaire_prof_seq`
--

CREATE TABLE `tranche_horaire_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tranche_horaire_prof_seq`
--

INSERT INTO `tranche_horaire_prof_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `type_collaborator`
--

CREATE TABLE `type_collaborator` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_collaborator`
--

INSERT INTO `type_collaborator` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `code`, `libelle`) VALUES
(1, 'collaborator1', '2024-06-26 15:51:59.878864', '', NULL, '', 'school'),
(2, NULL, NULL, 'anonymousUser', '2024-08-02 22:35:00.000000', NULL, 'EngFlexy'),
(4, 'collaborator1', '2024-06-26 15:51:59.878864', '', NULL, '', 'teacher');

-- --------------------------------------------------------

--
-- Structure de la table `type_collaborator_seq`
--

CREATE TABLE `type_collaborator_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_collaborator_seq`
--

INSERT INTO `type_collaborator_seq` (`next_val`) VALUES
(1),
(51);

-- --------------------------------------------------------

--
-- Structure de la table `type_de_question`
--

CREATE TABLE `type_de_question` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_de_question`
--

INSERT INTO `type_de_question` (`id`, `createdby`, `createdon`, `updatedby`, `updatedon`, `lib`, `ref`) VALUES
(1, NULL, NULL, 'anonymousUser', '2024-07-15 23:18:22.013107', 'Choose the correct alternative', 't1'),
(2, NULL, NULL, NULL, NULL, 'Write it up', 't2'),
(3, NULL, NULL, NULL, NULL, 'Translate the phrase', 't3'),
(4, NULL, NULL, NULL, NULL, 'Correct the mistake', 't4'),
(5, NULL, NULL, 'anonymousUser', '2024-07-15 23:18:53.230466', 'True or False', 't5'),
(6, NULL, NULL, 'anonymousUser', '2024-08-16 09:58:42.000000', 'Write the correct form', 't6'),
(7, NULL, NULL, NULL, NULL, 'Put words to gap', 't10'),
(8, NULL, NULL, NULL, NULL, 'Put in order', 't11'),
(9, NULL, NULL, NULL, NULL, 'Word By Word', 't12'),
(10, NULL, NULL, NULL, NULL, 'Drag and Drop', 't13'),
(11675, NULL, NULL, NULL, NULL, 'Describe what you see', 't7'),
(11701, NULL, NULL, NULL, NULL, 'Read and add new words', 't8'),
(12578, NULL, NULL, NULL, NULL, 'Study the information', 't14'),
(23386, NULL, NULL, NULL, NULL, 'Watch and add new words', 't9');

-- --------------------------------------------------------

--
-- Structure de la table `type_de_question_seq`
--

CREATE TABLE `type_de_question_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_de_question_seq`
--

INSERT INTO `type_de_question_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `type_home_work`
--

CREATE TABLE `type_home_work` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_home_work_seq`
--

CREATE TABLE `type_home_work_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_home_work_seq`
--

INSERT INTO `type_home_work_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `type_reclamation_etudiant`
--

CREATE TABLE `type_reclamation_etudiant` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_reclamation_etudiant_seq`
--

CREATE TABLE `type_reclamation_etudiant_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_reclamation_etudiant_seq`
--

INSERT INTO `type_reclamation_etudiant_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `type_reclamation_prof`
--

CREATE TABLE `type_reclamation_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_reclamation_prof_seq`
--

CREATE TABLE `type_reclamation_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_reclamation_prof_seq`
--

INSERT INTO `type_reclamation_prof_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `type_teacher`
--

CREATE TABLE `type_teacher` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_teacher_seq`
--

CREATE TABLE `type_teacher_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_teacher_seq`
--

INSERT INTO `type_teacher_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `account_non_expired` bit(1) NOT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `credentials_non_expired` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_changed` bit(1) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `group_option` varchar(255) DEFAULT NULL,
  `subscribe` bit(1) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `langue` bigint(20) DEFAULT NULL,
  `type_collaborator` bigint(20) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `fonction` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `interet_etudiant` bigint(20) DEFAULT NULL,
  `niveau_etude` bigint(20) DEFAULT NULL,
  `pack_student` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `skill` bigint(20) DEFAULT NULL,
  `statut_social` bigint(20) DEFAULT NULL,
  `teacher_locality` bigint(20) DEFAULT NULL,
  `categorie_prof` bigint(20) DEFAULT NULL,
  `type_teacher` bigint(20) DEFAULT NULL,
  `package_collaborator` varbinary(255) DEFAULT NULL,
  `validation_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`dtype`, `id`, `created_by`, `created_on`, `updated_by`, `updated_on`, `about`, `account_non_expired`, `account_non_locked`, `avatar`, `country`, `created_at`, `credentials_non_expired`, `email`, `enabled`, `full_name`, `password`, `password_changed`, `phone`, `updated_at`, `username`, `description`, `libelle`, `group_option`, `subscribe`, `ref`, `langue`, `type_collaborator`, `collaborator`, `fonction`, `groupe_etude`, `interet_etudiant`, `niveau_etude`, `pack_student`, `parcours`, `skill`, `statut_social`, `teacher_locality`, `categorie_prof`, `type_teacher`, `package_collaborator`, `validation_code`) VALUES
('User', 1, NULL, '2024-06-26 15:36:42.110894', NULL, NULL, NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:36:42.106893', b'1', 'admin', b'1', NULL, '$2a$10$HOsbyXru5c02vFNDIw1QNOzlCEbCjskWEgmYCtf.1eyws8DwqNXqm', b'0', NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Collaborator', 2, NULL, '2024-06-26 15:36:43.000000', 'anonymousUser', '2024-07-31 14:45:40.000000', NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:36:43.000000', b'1', NULL, b'1', NULL, '$2a$10$HOsbyXru5c02vFNDIw1QNOzlCEbCjskWEgmYCtf.1eyws8DwqNXqm', b'0', NULL, NULL, 'collaborator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Collaborator', 3, NULL, NULL, 'anonymousUser', '2024-08-02 22:41:12.000000', 'aaa', b'1', b'1', 'http://localhost:8036/app/images/engflexy.com/engflexy.com.jpg', 'Morocco', NULL, b'1', 'engflexy.com', b'0', 'EngFlexy', 'EngFlexy', b'0', '06123456', NULL, 'EngFlexy', NULL, 'engflexy', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0x02, NULL),
('User', 52, NULL, '2024-06-26 15:47:06.874622', NULL, NULL, NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:47:06.870658', b'1', 'admin1', b'1', NULL, '$2a$10$HOsbyXru5c02vFNDIw1QNOzlCEbCjskWEgmYCtf.1eyws8DwqNXqm', b'0', NULL, NULL, 'admin1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Collaborator', 53, '', '2024-06-26 15:47:09.000000', 'anonymousUser', '2024-08-02 20:17:58.000000', 'ggg', b'1', b'1', NULL, 'Morocco', '2024-06-26 15:47:09.000000', b'1', 'selma.com', b'1', 'selma', '$2a$10$3XyqMkGmx0ciBS8S8fqiZ.6V6JnEDY4V6gvo9ZF8FKxgD9ukB.A62', b'0', NULL, NULL, 'collaborator1', NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 54, 'collaborator1', '2024-06-26 15:51:01.227855', 'collaborator1', '2024-06-26 15:51:02.640854', NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:01.225911', b'1', 'wovyn@mailinator.com', b'1', 'Urielle Hawkins', '$2a$10$NibxzwCdkbUaLK./DN28EeoQXYDDcTWBFot1gtnRr.2tqNC2lj0rq', b'0', '+1 (341) 525-4995', NULL, 'wovyn@mailinator.com', NULL, NULL, NULL, b'1', NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 55, 'collaborator1', '2024-06-26 15:51:08.034571', 'collaborator1', '2024-06-26 15:51:09.306788', NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:08.031571', b'1', 'qalileroxu@mailinator.com', b'1', 'Quinn Howard', '$2a$10$JT7duaJFdO4om4tZjJuGJ.i4wmFracWnB3ioDpZVf2yPfaKyKVLYu', b'0', '+1 (765) 179-5184', NULL, 'qalileroxu@mailinator.com', NULL, NULL, NULL, b'1', NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 56, 'collaborator1', '2024-06-26 15:51:16.788472', 'collaborator1', '2024-06-26 15:51:18.216506', NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:16.785465', b'1', 'jupevuvos@mailinator.com', b'1', 'Freya Peck', '$2a$10$iAT8eUqwp/KrT6OHPrXEPOEQMEbFUICw9Kr2PffYnrDXMhcmehk4a', b'0', '+1 (359) 711-9033', NULL, 'jupevuvos@mailinator.com', NULL, NULL, NULL, b'1', NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 57, 'collaborator1', '2024-06-26 15:51:23.692154', 'collaborator1', '2024-06-26 15:51:24.869423', NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:23.690150', b'1', 'goryguh@mailinator.com', b'1', 'Wang Weber', '$2a$10$yL3PgttgW5x2aDomphF.XuTocaFn5E0/aCcsTy2xcpc9tjS12MPPq', b'0', '+1 (952) 824-8196', NULL, 'goryguh@mailinator.com', NULL, NULL, NULL, b'1', NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 58, '', '2024-06-26 15:51:30.000000', 'anonymousUser', '2024-07-24 11:34:28.000000', NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:30.000000', b'1', 'fury@mailinator.com', b'1', 'Elvis Maldonado', '$2a$10$j6N7ttWu1NUL5ykzab9BLOApcEM0LbKegpyuxtD4XnMDMmV4ujyTm', b'0', '+1 (305) 602-7732', NULL, 'fury@mailinator.com', NULL, NULL, NULL, NULL, '', NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
('Prof', 59, 'collaborator1', '2024-06-26 15:51:35.545951', NULL, NULL, NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:35.542982', b'1', 'supu@mailinator.com', b'1', 'Stuart Avila', '$2a$10$fraunKambo6FpagjelTliuP4paRy0UgHj6Tr7ropQyUWDIZMcxMnq', b'0', '+1 (757) 869-7781', NULL, 'supu@mailinator.com', NULL, NULL, NULL, NULL, '', NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 60, 'collaborator1', '2024-06-26 15:51:40.522944', NULL, NULL, NULL, b'1', b'1', NULL, NULL, '2024-06-26 15:51:40.521001', b'1', 'horidilysy@mailinator.com', b'1', 'Dawn Christensen', '$2a$10$9Cpw4xkr/5T2JBOG8IF5IuEUZjm69n5i/ZOKxgkVUT7UG5hyFrvTS', b'0', '+1 (762) 233-3708', NULL, 'horidilysy@mailinator.com', NULL, NULL, NULL, NULL, '', NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Collaborator', 61, 'collaborator1', '2024-06-26 15:51:59.000000', 'anonymousUser', '2024-08-02 22:41:54.000000', NULL, b'1', b'1', NULL, 'Algeria', '2024-06-26 15:51:59.000000', b'1', 'howa@mailinator.com', b'1', 'Lynn Wheeler', '$2a$10$VSxz1TQ6mWp56oLcsvVvFOgRazOfn1tiBqsl5CudMMIsGt8xblVRO', b'0', '+1 (719) 423-6332', NULL, 'howa@mailinator.com', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(101),
(151);

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `exemple` varchar(255) DEFAULT NULL,
  `explication` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary_seq`
--

CREATE TABLE `vocabulary_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vocabulary_seq`
--

INSERT INTO `vocabulary_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `workload_bonus`
--

CREATE TABLE `workload_bonus` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nombre_session` int(11) DEFAULT NULL,
  `prix` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `workload_bonus_prof`
--

CREATE TABLE `workload_bonus_prof` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `workload_bonus` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `workload_bonus_prof_seq`
--

CREATE TABLE `workload_bonus_prof_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `workload_bonus_prof_seq`
--

INSERT INTO `workload_bonus_prof_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `workload_bonus_seq`
--

CREATE TABLE `workload_bonus_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `workload_bonus_seq`
--

INSERT INTO `workload_bonus_seq` (`next_val`) VALUES
(1),
(1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action_permission`
--
ALTER TABLE `action_permission`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie_prof`
--
ALTER TABLE `categorie_prof`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `class_average_bonus`
--
ALTER TABLE `class_average_bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKruwwcccitj00alcwpqll77nf4` (`collaborator`);

--
-- Index pour la table `class_average_bonus_prof`
--
ALTER TABLE `class_average_bonus_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9jxfo0e0xa7jkktxdsq4jwibq` (`prof`),
  ADD KEY `FK1gw04x52n985btot1ucheddy5` (`salary`);

--
-- Index pour la table `confirmation_token`
--
ALTER TABLE `confirmation_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7y3xv4g7g0ujl8a53x6ehjyrh` (`etudiant`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3dkywysdyqv0l7vfrpbics74p` (`collaborator`);

--
-- Index pour la table `content_type`
--
ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `FKc3qnu8wy9mencjmickh986tms` (`user1_id`),
  ADD KEY `FKbq1kaqp1tk90fjqfwnynhy50k` (`user2_id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKahy5hm3ry3u7lcli8yji618jg` (`parcours`);

--
-- Index pour la table `dictionary`
--
ALTER TABLE `dictionary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3vedvuiggng4hljgw32despxv` (`etudiant`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_inscription`
--
ALTER TABLE `etat_inscription`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant_review`
--
ALTER TABLE `etudiant_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdr0kyfl32jlc1iaqyr23u0i04` (`cours`),
  ADD KEY `FKbo0cjopoje56ldf9jaaxxjhxv` (`etudiant`),
  ADD KEY `FKk3t91y6xlu7wgkgli6j1b57o6` (`prof`);

--
-- Index pour la table `exercice`
--
ALTER TABLE `exercice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ho4hbgng1tyqxkvh1mrcfe6cg` (`quiz`),
  ADD KEY `FKftk5tiouuild7jwp59y2mxxyj` (`content_type`),
  ADD KEY `FKdvvia8o2w2rbh2et9um2x63fc` (`section`);

--
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg74sm2isnspfjl2gpl40i1gso` (`faq_type`);

--
-- Index pour la table `faq_etudiant`
--
ALTER TABLE `faq_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKny4k439w8mtsgwl04gacxq2ky` (`etudiant`),
  ADD KEY `FK8jxblth3byvxeklwfkrmrtx1o` (`faq_type`);

--
-- Index pour la table `faq_prof`
--
ALTER TABLE `faq_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm826cdt7e3vuigwi2auwrgr2o` (`faq_type`),
  ADD KEY `FKigm6pq9usvbki2ropxu4bj401` (`prof`);

--
-- Index pour la table `faq_type`
--
ALTER TABLE `faq_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `free_trial`
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
-- Index pour la table `free_trialformule`
--
ALTER TABLE `free_trialformule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqp2bk31pgb42pf7aeneplagv9` (`inscription`);

--
-- Index pour la table `free_trial_configuration`
--
ALTER TABLE `free_trial_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `free_trial_detail`
--
ALTER TABLE `free_trial_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK55h1r7nloj506bo3sutxr1l8n` (`etudiant`),
  ADD KEY `FK22so7d7qi1cuyghw3sf8tj7ux` (`free_trial`);

--
-- Index pour la table `free_trial_student_email_template`
--
ALTER TABLE `free_trial_student_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `free_trial_student_whats_template`
--
ALTER TABLE `free_trial_student_whats_template`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `free_trial_teacher_email_template`
--
ALTER TABLE `free_trial_teacher_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `free_trial_teacher_whats_template`
--
ALTER TABLE `free_trial_teacher_whats_template`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe_etat`
--
ALTER TABLE `groupe_etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe_etude`
--
ALTER TABLE `groupe_etude`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe_etudiant`
--
ALTER TABLE `groupe_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3du0ot05k3biykkighrqbq0bj` (`groupe_etat`),
  ADD KEY `FKf19chs324x9ei6t5rm3epx4cq` (`groupe_etude`),
  ADD KEY `FKb5fkobpnh19cpnddob5051i0v` (`groupe_type`),
  ADD KEY `FKhqi2kse6ips4np4365vovd3r6` (`parcours`),
  ADD KEY `FK53cvqneym1jlajraf8nh4w44i` (`prof`);

--
-- Index pour la table `groupe_etudiant_detail`
--
ALTER TABLE `groupe_etudiant_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs3jgcu7ocfotdmdm0iamn6b0w` (`etudiant`),
  ADD KEY `FKr8x72lnitvm5qj1x0l5jyugbt` (`groupe_etudiant`);

--
-- Index pour la table `groupe_type`
--
ALTER TABLE `groupe_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `home_work`
--
ALTER TABLE `home_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK44ci3gb97k9wp23sc3gedrqyk` (`cours`),
  ADD KEY `FKmfqby0657lm6a6mcjqj2149o1` (`type_home_work`);

--
-- Index pour la table `home_work_etudiant`
--
ALTER TABLE `home_work_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6sup89lw7i97pski13iu7uf1n` (`etudiant`),
  ADD KEY `FKr3i0bsg73lrefi35ywk6valqw` (`home_work`);

--
-- Index pour la table `home_work_question`
--
ALTER TABLE `home_work_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq21dmbn2sge5l9nern356f6fi` (`home_work`),
  ADD KEY `FKtk8sx20ndjo2oddts9s16wubj` (`type_de_question`);

--
-- Index pour la table `howe_work_q_s_t_reponse`
--
ALTER TABLE `howe_work_q_s_t_reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5r2x5dyq293mofnoiarl59os5` (`home_work_question`);

--
-- Index pour la table `inscription`
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
-- Index pour la table `inscription_collaborator`
--
ALTER TABLE `inscription_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK31cyx6xj8vwci09gy6f0k0oy6` (`collaborator`),
  ADD KEY `FK6qadhneaxuubst26w0gbd26bp` (`inscription_collaborator_state`),
  ADD KEY `FKywieat8g4sdopj4n5ios92h8` (`package_collaborator`);

--
-- Index pour la table `inscription_collaborator_state`
--
ALTER TABLE `inscription_collaborator_state`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `interet_etudiant`
--
ALTER TABLE `interet_etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `invite_student`
--
ALTER TABLE `invite_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbs4m9ldskgfg237mwub5ibttf` (`etudiant`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `level_test_configuration`
--
ALTER TABLE `level_test_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfumtlsoraadbwe0bdm2qnajnu` (`parcours`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `FK6yskk3hxw5sklwgi25y6d5u1l` (`conversation_id`),
  ADD KEY `FK86f0kc2mt26ifwupnivu6v8oa` (`receiver_id`),
  ADD KEY `FKcnj2qaf5yc36v2f90jw2ipl9b` (`sender_id`);

--
-- Index pour la table `model_permission`
--
ALTER TABLE `model_permission`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `model_permission_utilisateur`
--
ALTER TABLE `model_permission_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKanbrpecqteguq8exl5k9qrpom` (`action_permission`),
  ADD KEY `FKr1a7bvuyitnsb1mgrh800qpl` (`model_permission`),
  ADD KEY `FK7wq2ndtexep9usaj8oojvwlvx` (`user`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgg14bw1a1prjo1b9jule8k8fq` (`collaborator`);

--
-- Index pour la table `niveau_etude`
--
ALTER TABLE `niveau_etude`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `package_collaborator`
--
ALTER TABLE `package_collaborator`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pack_student`
--
ALTER TABLE `pack_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8o2q1qwe1qjqjx4s6cemt6s84` (`level`),
  ADD KEY `FKqccki0b6i48a1masitotdw6sw` (`price`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6dbtl5qrg1kjxwh5xsj0nb0pv` (`groupe_etudiant`),
  ADD KEY `FKnp1lw5uob8tvslkjnmcdnowc5` (`prof`);

--
-- Index pour la table `paiement_inscription_collaborator`
--
ALTER TABLE `paiement_inscription_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhpsmbrd66godltuperxnlnv27` (`inscription_collaborator`),
  ADD KEY `FKqru50p3h83asc7ui6bggeajn6` (`paiement_inscription_collaborator_state`);

--
-- Index pour la table `paiement_inscription_collaborator_state`
--
ALTER TABLE `paiement_inscription_collaborator_state`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4jtf5cmektmsmtuiorrpnd8i3` (`collaborator`);

--
-- Index pour la table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKogcgru00bxc9bc173fvt4tog5` (`collaborator`);

--
-- Index pour la table `prof_review`
--
ALTER TABLE `prof_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfgik1c9q13hbh95xxqxt6kytu` (`cours`),
  ADD KEY `FKtf5bipf3qksucegqg0lqjsjds` (`etudiant`),
  ADD KEY `FK2f9sfmlmyngxsqvgbrc201g4k` (`prof`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn7rkdf65fl89m8jx2c174tdbk` (`quiz`),
  ADD KEY `FKp3btkmc3gy8byspbfyqn08ubb` (`type_de_question`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_mi1n92hgr8q5fd2y73htyb2rw` (`exercice`);

--
-- Index pour la table `quiz_etudiant`
--
ALTER TABLE `quiz_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj66cc5f1ta9bvx99jg2lkdx37` (`etudiant`),
  ADD KEY `FKi9bv4k6mvrn2a0gjv0aeo4oy8` (`quiz`);

--
-- Index pour la table `reclamation_etudiant`
--
ALTER TABLE `reclamation_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKerecn8dtyxuasp872ty9ohhjq` (`type_reclamation_etudiant`);

--
-- Index pour la table `reclamation_prof`
--
ALTER TABLE `reclamation_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjknx7s81cylq1p4y7lejd02bl` (`prof`),
  ADD KEY `FK8fsbomsmjlri7i1du98tdhwvl` (`type_reclamation_prof`);

--
-- Index pour la table `recommend_teacher`
--
ALTER TABLE `recommend_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtm1jpoh1i39jktqf51lyu81qs` (`prof`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqww17yrx5cgjbcu747lgre8ci` (`question`);

--
-- Index pour la table `reponse_etudiant`
--
ALTER TABLE `reponse_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK611oipslqc88pa7j7yqqmf72u` (`question`),
  ADD KEY `FKrcx0v612xf6xx6wsml9mco2h3` (`quiz_etudiant`),
  ADD KEY `FK4hf80to4ievjjdq3bmfgdwxw9` (`reponse`);

--
-- Index pour la table `reponse_etudiant_home_work`
--
ALTER TABLE `reponse_etudiant_home_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnnjmqei727y0u1rivh1daltwb` (`home_work_etudiant`),
  ADD KEY `FK456160ae6nd12q2d5y7m567sr` (`home_work_question`),
  ADD KEY `FKnebaw1q5vebbipkl68omyu39b` (`howe_work_q_s_t_reponse`);

--
-- Index pour la table `role_app`
--
ALTER TABLE `role_app`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role_utilisateur`
--
ALTER TABLE `role_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2fjdcobcg9c6a209t2qd2mgg1` (`role`),
  ADD KEY `FKjor807snrj8ytkt26jvm3wu6c` (`user`);

--
-- Index pour la table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhtcvy2kfqxnf85cag7if9srhr` (`prof`);

--
-- Index pour la table `schedule_prof`
--
ALTER TABLE `schedule_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK33a7ip3jqbafu5joohmdklatc` (`cours`),
  ADD KEY `FK63y8jx726vtsw7oi7li4psr06` (`groupe_etudiant`),
  ADD KEY `FKnpixsixxies6sowxahl3ehaxu` (`prof`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfosokbccblq4mj9g6mo2ktknw` (`cours`);

--
-- Index pour la table `section_item`
--
ALTER TABLE `section_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKplpthekfwb2ydh5ljftao632l` (`section`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `session_cours`
--
ALTER TABLE `session_cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp2v3kulrxoryk626tr1n07v6n` (`cours`),
  ADD KEY `FKidwlfrj69hdx1m9vhbwf4ip8t` (`groupe_etudiant`),
  ADD KEY `FK1kq233790h625dnbvspnimphp` (`prof`),
  ADD KEY `FK5ahhbwiot1buddfs1b23iypuk` (`salary`);

--
-- Index pour la table `session_cours_section`
--
ALTER TABLE `session_cours_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjvheycal0r3gloj4vcp1pri5n` (`section`),
  ADD KEY `FK7hlnjs1x496awgkl9wfwrqec7` (`session_cours`);

--
-- Index pour la table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut_free_trial`
--
ALTER TABLE `statut_free_trial`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut_social`
--
ALTER TABLE `statut_social`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `teacher_locality`
--
ALTER TABLE `teacher_locality`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tranche_horaire_prof`
--
ALTER TABLE `tranche_horaire_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgfj4fgstpvqmyeycqgrax2t3p` (`prof`);

--
-- Index pour la table `type_collaborator`
--
ALTER TABLE `type_collaborator`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_de_question`
--
ALTER TABLE `type_de_question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_home_work`
--
ALTER TABLE `type_home_work`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_reclamation_etudiant`
--
ALTER TABLE `type_reclamation_etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_reclamation_prof`
--
ALTER TABLE `type_reclamation_prof`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_teacher`
--
ALTER TABLE `type_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKddp1ld78v56h491wxcfvs8gpp` (`langue`),
  ADD KEY `FK8jpsfe6itxx00coqlcewmbv0u` (`type_collaborator`),
  ADD KEY `FK9q5cjy9t7ultpjlebbesgq1w9` (`collaborator`),
  ADD KEY `FKfcrnrmd0x8ti3td1vcot417qw` (`fonction`),
  ADD KEY `FKc8bby2o7jdjj7pacpfpo2bj6r` (`groupe_etude`),
  ADD KEY `FKbcts6ejkmhmqh1dti19xvtef2` (`interet_etudiant`),
  ADD KEY `FK1j914o9lyp6mjierf132mawjo` (`niveau_etude`),
  ADD KEY `FK87lvn3d9xb337koefj58gam98` (`pack_student`),
  ADD KEY `FKimfpxj5uy18qyitn193rnpj3v` (`parcours`),
  ADD KEY `FKncpqcs02kue14y3teuc0bj12i` (`skill`),
  ADD KEY `FKbug521p2lt3c1foh0j0r9tbxx` (`statut_social`),
  ADD KEY `FKiopkx4yvy0mcu5lr6rdekmwjm` (`teacher_locality`),
  ADD KEY `FKb1foe1690lcirh75bvap2lg3h` (`categorie_prof`),
  ADD KEY `FKnnm30cr14vvt6raylyn226ncv` (`type_teacher`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jwsmbypn2jrlpro721bt3yv7` (`section`);

--
-- Index pour la table `workload_bonus`
--
ALTER TABLE `workload_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `workload_bonus_prof`
--
ALTER TABLE `workload_bonus_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjp3saesbvciolabu4np0enqbm` (`prof`),
  ADD KEY `FK42mcgkljlaa1j07qb095xqhpg` (`salary`),
  ADD KEY `FKcycvnjjmeip07d0mxvnllhpq4` (`workload_bonus`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `conversation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `class_average_bonus`
--
ALTER TABLE `class_average_bonus`
  ADD CONSTRAINT `FKruwwcccitj00alcwpqll77nf4` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `class_average_bonus_prof`
--
ALTER TABLE `class_average_bonus_prof`
  ADD CONSTRAINT `FK1gw04x52n985btot1ucheddy5` FOREIGN KEY (`salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `FK9jxfo0e0xa7jkktxdsq4jwibq` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `confirmation_token`
--
ALTER TABLE `confirmation_token`
  ADD CONSTRAINT `FK7y3xv4g7g0ujl8a53x6ehjyrh` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK3dkywysdyqv0l7vfrpbics74p` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `FKbq1kaqp1tk90fjqfwnynhy50k` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKc3qnu8wy9mencjmickh986tms` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FKahy5hm3ry3u7lcli8yji618jg` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`);

--
-- Contraintes pour la table `dictionary`
--
ALTER TABLE `dictionary`
  ADD CONSTRAINT `FK3vedvuiggng4hljgw32despxv` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `etudiant_review`
--
ALTER TABLE `etudiant_review`
  ADD CONSTRAINT `FKbo0cjopoje56ldf9jaaxxjhxv` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKdr0kyfl32jlc1iaqyr23u0i04` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKk3t91y6xlu7wgkgli6j1b57o6` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `exercice`
--
ALTER TABLE `exercice`
  ADD CONSTRAINT `FK5wh0qmit2ollf3vdpwhq8qoan` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKdvvia8o2w2rbh2et9um2x63fc` FOREIGN KEY (`section`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `FKftk5tiouuild7jwp59y2mxxyj` FOREIGN KEY (`content_type`) REFERENCES `content_type` (`id`);

--
-- Contraintes pour la table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `FKg74sm2isnspfjl2gpl40i1gso` FOREIGN KEY (`faq_type`) REFERENCES `faq_type` (`id`);

--
-- Contraintes pour la table `faq_etudiant`
--
ALTER TABLE `faq_etudiant`
  ADD CONSTRAINT `FK8jxblth3byvxeklwfkrmrtx1o` FOREIGN KEY (`faq_type`) REFERENCES `faq_type` (`id`),
  ADD CONSTRAINT `FKny4k439w8mtsgwl04gacxq2ky` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `faq_prof`
--
ALTER TABLE `faq_prof`
  ADD CONSTRAINT `FKigm6pq9usvbki2ropxu4bj401` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKm826cdt7e3vuigwi2auwrgr2o` FOREIGN KEY (`faq_type`) REFERENCES `faq_type` (`id`);

--
-- Contraintes pour la table `free_trial`
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
-- Contraintes pour la table `free_trialformule`
--
ALTER TABLE `free_trialformule`
  ADD CONSTRAINT `FKqp2bk31pgb42pf7aeneplagv9` FOREIGN KEY (`inscription`) REFERENCES `inscription` (`id`);

--
-- Contraintes pour la table `free_trial_detail`
--
ALTER TABLE `free_trial_detail`
  ADD CONSTRAINT `FK22so7d7qi1cuyghw3sf8tj7ux` FOREIGN KEY (`free_trial`) REFERENCES `free_trial` (`id`),
  ADD CONSTRAINT `FK55h1r7nloj506bo3sutxr1l8n` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `groupe_etudiant`
--
ALTER TABLE `groupe_etudiant`
  ADD CONSTRAINT `FK3du0ot05k3biykkighrqbq0bj` FOREIGN KEY (`groupe_etat`) REFERENCES `groupe_etat` (`id`),
  ADD CONSTRAINT `FK53cvqneym1jlajraf8nh4w44i` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKb5fkobpnh19cpnddob5051i0v` FOREIGN KEY (`groupe_type`) REFERENCES `groupe_type` (`id`),
  ADD CONSTRAINT `FKf19chs324x9ei6t5rm3epx4cq` FOREIGN KEY (`groupe_etude`) REFERENCES `groupe_etude` (`id`),
  ADD CONSTRAINT `FKhqi2kse6ips4np4365vovd3r6` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`);

--
-- Contraintes pour la table `groupe_etudiant_detail`
--
ALTER TABLE `groupe_etudiant_detail`
  ADD CONSTRAINT `FKr8x72lnitvm5qj1x0l5jyugbt` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKs3jgcu7ocfotdmdm0iamn6b0w` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `home_work`
--
ALTER TABLE `home_work`
  ADD CONSTRAINT `FK44ci3gb97k9wp23sc3gedrqyk` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKmfqby0657lm6a6mcjqj2149o1` FOREIGN KEY (`type_home_work`) REFERENCES `type_home_work` (`id`);

--
-- Contraintes pour la table `home_work_etudiant`
--
ALTER TABLE `home_work_etudiant`
  ADD CONSTRAINT `FK6sup89lw7i97pski13iu7uf1n` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKr3i0bsg73lrefi35ywk6valqw` FOREIGN KEY (`home_work`) REFERENCES `home_work` (`id`);

--
-- Contraintes pour la table `home_work_question`
--
ALTER TABLE `home_work_question`
  ADD CONSTRAINT `FKq21dmbn2sge5l9nern356f6fi` FOREIGN KEY (`home_work`) REFERENCES `home_work` (`id`),
  ADD CONSTRAINT `FKtk8sx20ndjo2oddts9s16wubj` FOREIGN KEY (`type_de_question`) REFERENCES `type_de_question` (`id`);

--
-- Contraintes pour la table `howe_work_q_s_t_reponse`
--
ALTER TABLE `howe_work_q_s_t_reponse`
  ADD CONSTRAINT `FK5r2x5dyq293mofnoiarl59os5` FOREIGN KEY (`home_work_question`) REFERENCES `home_work_question` (`id`);

--
-- Contraintes pour la table `inscription`
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
-- Contraintes pour la table `inscription_collaborator`
--
ALTER TABLE `inscription_collaborator`
  ADD CONSTRAINT `FK31cyx6xj8vwci09gy6f0k0oy6` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK6qadhneaxuubst26w0gbd26bp` FOREIGN KEY (`inscription_collaborator_state`) REFERENCES `inscription_collaborator_state` (`id`),
  ADD CONSTRAINT `FKywieat8g4sdopj4n5ios92h8` FOREIGN KEY (`package_collaborator`) REFERENCES `package_collaborator` (`id`);

--
-- Contraintes pour la table `invite_student`
--
ALTER TABLE `invite_student`
  ADD CONSTRAINT `FKbs4m9ldskgfg237mwub5ibttf` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `level_test_configuration`
--
ALTER TABLE `level_test_configuration`
  ADD CONSTRAINT `FKfumtlsoraadbwe0bdm2qnajnu` FOREIGN KEY (`parcours`) REFERENCES `parcours` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK6yskk3hxw5sklwgi25y6d5u1l` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`conversation_id`),
  ADD CONSTRAINT `FK86f0kc2mt26ifwupnivu6v8oa` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKcnj2qaf5yc36v2f90jw2ipl9b` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `model_permission_utilisateur`
--
ALTER TABLE `model_permission_utilisateur`
  ADD CONSTRAINT `FK7wq2ndtexep9usaj8oojvwlvx` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKanbrpecqteguq8exl5k9qrpom` FOREIGN KEY (`action_permission`) REFERENCES `action_permission` (`id`),
  ADD CONSTRAINT `FKr1a7bvuyitnsb1mgrh800qpl` FOREIGN KEY (`model_permission`) REFERENCES `model_permission` (`id`);

--
-- Contraintes pour la table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FKgg14bw1a1prjo1b9jule8k8fq` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `pack_student`
--
ALTER TABLE `pack_student`
  ADD CONSTRAINT `FK8o2q1qwe1qjqjx4s6cemt6s84` FOREIGN KEY (`level`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKqccki0b6i48a1masitotdw6sw` FOREIGN KEY (`price`) REFERENCES `price` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK6dbtl5qrg1kjxwh5xsj0nb0pv` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKnp1lw5uob8tvslkjnmcdnowc5` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `paiement_inscription_collaborator`
--
ALTER TABLE `paiement_inscription_collaborator`
  ADD CONSTRAINT `FKhpsmbrd66godltuperxnlnv27` FOREIGN KEY (`inscription_collaborator`) REFERENCES `inscription_collaborator` (`id`),
  ADD CONSTRAINT `FKqru50p3h83asc7ui6bggeajn6` FOREIGN KEY (`paiement_inscription_collaborator_state`) REFERENCES `paiement_inscription_collaborator_state` (`id`);

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `FK4jtf5cmektmsmtuiorrpnd8i3` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `FKogcgru00bxc9bc173fvt4tog5` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `prof_review`
--
ALTER TABLE `prof_review`
  ADD CONSTRAINT `FK2f9sfmlmyngxsqvgbrc201g4k` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKfgik1c9q13hbh95xxqxt6kytu` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKtf5bipf3qksucegqg0lqjsjds` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FKn7rkdf65fl89m8jx2c174tdbk` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKp3btkmc3gy8byspbfyqn08ubb` FOREIGN KEY (`type_de_question`) REFERENCES `type_de_question` (`id`);

--
-- Contraintes pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FKsgsqltca03pv3d1tw95t1tp7k` FOREIGN KEY (`exercice`) REFERENCES `exercice` (`id`);

--
-- Contraintes pour la table `quiz_etudiant`
--
ALTER TABLE `quiz_etudiant`
  ADD CONSTRAINT `FKi9bv4k6mvrn2a0gjv0aeo4oy8` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKj66cc5f1ta9bvx99jg2lkdx37` FOREIGN KEY (`etudiant`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reclamation_etudiant`
--
ALTER TABLE `reclamation_etudiant`
  ADD CONSTRAINT `FKerecn8dtyxuasp872ty9ohhjq` FOREIGN KEY (`type_reclamation_etudiant`) REFERENCES `type_reclamation_etudiant` (`id`);

--
-- Contraintes pour la table `reclamation_prof`
--
ALTER TABLE `reclamation_prof`
  ADD CONSTRAINT `FK8fsbomsmjlri7i1du98tdhwvl` FOREIGN KEY (`type_reclamation_prof`) REFERENCES `type_reclamation_prof` (`id`),
  ADD CONSTRAINT `FKjknx7s81cylq1p4y7lejd02bl` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `recommend_teacher`
--
ALTER TABLE `recommend_teacher`
  ADD CONSTRAINT `FKtm1jpoh1i39jktqf51lyu81qs` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FKqww17yrx5cgjbcu747lgre8ci` FOREIGN KEY (`question`) REFERENCES `question` (`id`);

--
-- Contraintes pour la table `reponse_etudiant`
--
ALTER TABLE `reponse_etudiant`
  ADD CONSTRAINT `FK4hf80to4ievjjdq3bmfgdwxw9` FOREIGN KEY (`reponse`) REFERENCES `reponse` (`id`),
  ADD CONSTRAINT `FK611oipslqc88pa7j7yqqmf72u` FOREIGN KEY (`question`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FKrcx0v612xf6xx6wsml9mco2h3` FOREIGN KEY (`quiz_etudiant`) REFERENCES `quiz_etudiant` (`id`);

--
-- Contraintes pour la table `reponse_etudiant_home_work`
--
ALTER TABLE `reponse_etudiant_home_work`
  ADD CONSTRAINT `FK456160ae6nd12q2d5y7m567sr` FOREIGN KEY (`home_work_question`) REFERENCES `home_work_question` (`id`),
  ADD CONSTRAINT `FKnebaw1q5vebbipkl68omyu39b` FOREIGN KEY (`howe_work_q_s_t_reponse`) REFERENCES `howe_work_q_s_t_reponse` (`id`),
  ADD CONSTRAINT `FKnnjmqei727y0u1rivh1daltwb` FOREIGN KEY (`home_work_etudiant`) REFERENCES `home_work_etudiant` (`id`);

--
-- Contraintes pour la table `role_utilisateur`
--
ALTER TABLE `role_utilisateur`
  ADD CONSTRAINT `FK2fjdcobcg9c6a209t2qd2mgg1` FOREIGN KEY (`role`) REFERENCES `role_app` (`id`),
  ADD CONSTRAINT `FKjor807snrj8ytkt26jvm3wu6c` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FKhtcvy2kfqxnf85cag7if9srhr` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `schedule_prof`
--
ALTER TABLE `schedule_prof`
  ADD CONSTRAINT `FK33a7ip3jqbafu5joohmdklatc` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FK63y8jx726vtsw7oi7li4psr06` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKnpixsixxies6sowxahl3ehaxu` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `FKfosokbccblq4mj9g6mo2ktknw` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `section_item`
--
ALTER TABLE `section_item`
  ADD CONSTRAINT `FKplpthekfwb2ydh5ljftao632l` FOREIGN KEY (`section`) REFERENCES `section` (`id`);

--
-- Contraintes pour la table `session_cours`
--
ALTER TABLE `session_cours`
  ADD CONSTRAINT `FK1kq233790h625dnbvspnimphp` FOREIGN KEY (`prof`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK5ahhbwiot1buddfs1b23iypuk` FOREIGN KEY (`salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `FKidwlfrj69hdx1m9vhbwf4ip8t` FOREIGN KEY (`groupe_etudiant`) REFERENCES `groupe_etudiant` (`id`),
  ADD CONSTRAINT `FKp2v3kulrxoryk626tr1n07v6n` FOREIGN KEY (`cours`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `session_cours_section`
--
ALTER TABLE `session_cours_section`
  ADD CONSTRAINT `FK7hlnjs1x496awgkl9wfwrqec7` FOREIGN KEY (`session_cours`) REFERENCES `session_cours` (`id`),
  ADD CONSTRAINT `FKjvheycal0r3gloj4vcp1pri5n` FOREIGN KEY (`section`) REFERENCES `section` (`id`);

--
-- Contraintes pour la table `tranche_horaire_prof`
--
ALTER TABLE `tranche_horaire_prof`
  ADD CONSTRAINT `FKgfj4fgstpvqmyeycqgrax2t3p` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
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
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK6jwsmbypn2jrlpro721bt3yv7` FOREIGN KEY (`section`) REFERENCES `section` (`id`);

--
-- Contraintes pour la table `workload_bonus_prof`
--
ALTER TABLE `workload_bonus_prof`
  ADD CONSTRAINT `FK42mcgkljlaa1j07qb095xqhpg` FOREIGN KEY (`salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `FKcycvnjjmeip07d0mxvnllhpq4` FOREIGN KEY (`workload_bonus`) REFERENCES `workload_bonus` (`id`),
  ADD CONSTRAINT `FKjp3saesbvciolabu4np0enqbm` FOREIGN KEY (`prof`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
