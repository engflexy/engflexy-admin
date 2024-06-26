-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 26, 2024 at 03:54 PM
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
('2024-06-26 15:36:41.985897', 1, NULL, '', NULL, 'list', ''),
('2024-06-26 15:36:41.997887', 2, NULL, '', NULL, 'create', ''),
('2024-06-26 15:36:42.006901', 3, NULL, '', NULL, 'delete', ''),
('2024-06-26 15:36:42.015890', 4, NULL, '', NULL, 'edit', ''),
('2024-06-26 15:36:42.022895', 5, NULL, '', NULL, 'view', ''),
('2024-06-26 15:36:42.029890', 6, NULL, '', NULL, 'duplicate', '');

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
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
(1);

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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
('2024-06-26 15:36:41.229020', 1, NULL, 'IMAGE', '', 'Image', ''),
('2024-06-26 15:36:41.279983', 2, NULL, 'MULTI_IMAGE', '', 'Multi-Image', ''),
('2024-06-26 15:36:41.289024', 3, NULL, 'VIDEO', '', 'Video', ''),
('2024-06-26 15:36:41.294983', 4, NULL, 'CONTENT', '', 'Content', ''),
('2024-06-26 15:36:41.303030', 5, NULL, 'QUIZ', '', 'Quiz', '');

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
(101),
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
(0, 0, 0, 4, 0, '2024-05-19 19:00:08.749835', 1, 1, '2024-06-26 15:43:13.478736', 'C', 'collaborator', 'this is course number one', 'http://localhost:8036/app/images/5zxf8Je0un/5zxf8Je0un.jpg', 'course number one ', 'collaborator'),
(0, 0, 0, 2, 0, '2024-05-19 19:23:20.328304', 2, 1, NULL, 'C', 'collaborator', NULL, 'http://localhost:8036/app/images/FCDLCm1Dba/FCDLCm1Dba.jpg', 'course number two', ''),
(0, 0, 0, 6, 0, '2024-05-19 19:34:57.037698', 3, 1, '2024-05-29 21:08:40.528438', 'C', 'collaborator', 'Sunt fugiat numquam ', NULL, 'Cumque minus recusan', 'collaborator'),
(0, 0, 0, 0, 0, '2024-05-19 19:38:34.998696', 4, 1, NULL, 'P', 'collaborator', 'desc for hfad ford', NULL, 'Proident minim agord fard bitin', ''),
(0, 0, 0, 0, 0, '2024-05-19 19:41:17.202630', 5, 1, NULL, 'F', 'collaborator', 'did for vvahu fgphl firl valhab gihm', 'http://localhost:8036/app/images/LfJY2xyH1b/LfJY2xyH1b.jpg', 'forid sasdib bid for tha did', ''),
(0, 0, 0, 0, 0, '2024-06-26 15:53:59.511747', 6, 3, NULL, 'N', 'collaborator1', 'Ea ex quia magni in ', NULL, 'Nesciunt officia al', ''),
(0, 0, 0, 0, 0, '2024-06-26 15:54:20.257781', 7, 2, NULL, 'S', 'collaborator1', 'Ut suscipit sit quo ', NULL, 'Suscipit quo nulla e', ''),
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
(101),
(301),
(301),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
(1);

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
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exercice`
--

CREATE TABLE `exercice` (
  `content_type` bigint(20) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exercice`
--

INSERT INTO `exercice` (`content_type`, `createdon`, `id`, `numero`, `quiz`, `section`, `updatedon`, `content`, `createdby`, `description`, `libelle`, `updatedby`) VALUES
(1, '2024-06-26 15:43:33.335671', 1, 1, NULL, 1, NULL, ';http://localhost:8036/app/images/l8jiB5xbsB/l8jiB5xbsB.jpg', 'collaborator', ';angular', NULL, '');

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
(51),
(851),
(851),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(NULL, 1488, NULL, NULL, 'student', 'Diploma', NULL);

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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
  `datedebutinscription` varchar(255) DEFAULT NULL,
  `datefininscription` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`note_quiz_niveau`, `numero_inscription`, `quiz_finished`, `subscription_finished`, `createdon`, `etat_inscription`, `etudiant`, `fonction`, `groupe_etude`, `groupe_type`, `id`, `interet_etudiant`, `niveau_etude`, `pack_student`, `parcours`, `quiz`, `skill`, `statut_social`, `updatedon`, `createdby`, `date_registration`, `datedebutinscription`, `datefininscription`, `skype`, `updatedby`) VALUES
('0.00', 1, b'0', b'0', '2024-06-26 15:51:02.631916', 1, 54, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator1', NULL, '06/26/2024 17:51', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-26 15:51:09.301793', 1, 55, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator1', NULL, '06/26/2024 17:51', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-26 15:51:18.214469', 1, 56, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator1', NULL, '06/26/2024 17:51', NULL, NULL, ''),
('0.00', 1, b'0', b'0', '2024-06-26 15:51:24.866420', 1, 57, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'collaborator1', NULL, '06/26/2024 17:51', NULL, NULL, '');

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
(101),
(101),
(101),
(101);

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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
(1),
(1),
(1),
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
('2024-06-26 15:36:41.314983', 1, NULL, '', NULL, 'ContentType', ''),
('2024-06-26 15:36:41.326981', 2, NULL, '', NULL, 'Etudiant', ''),
('2024-06-26 15:36:41.334982', 3, NULL, '', NULL, 'Paiement', ''),
('2024-06-26 15:36:41.343981', 4, NULL, '', NULL, 'StatutSocial', ''),
('2024-06-26 15:36:41.353983', 5, NULL, '', NULL, 'HomeWorkEtudiant', ''),
('2024-06-26 15:36:41.361980', 6, NULL, '', NULL, 'Quiz', ''),
('2024-06-26 15:36:41.369984', 7, NULL, '', NULL, 'Reponse', ''),
('2024-06-26 15:36:41.378022', 8, NULL, '', NULL, 'ProfReview', ''),
('2024-06-26 15:36:41.386019', 9, NULL, '', NULL, 'News', ''),
('2024-06-26 15:36:41.394254', 10, NULL, '', NULL, 'Skill', ''),
('2024-06-26 15:36:41.403254', 11, NULL, '', NULL, 'InteretEtudiant', ''),
('2024-06-26 15:36:41.411257', 12, NULL, '', NULL, 'Langue', ''),
('2024-06-26 15:36:41.419259', 13, NULL, '', NULL, 'WorkloadBonusProf', ''),
('2024-06-26 15:36:41.427254', 14, NULL, '', NULL, 'PackStudent', ''),
('2024-06-26 15:36:41.435257', 15, NULL, '', NULL, 'SectionItem', ''),
('2024-06-26 15:36:41.445253', 16, NULL, '', NULL, 'EtatInscription', ''),
('2024-06-26 15:36:41.453253', 17, NULL, '', NULL, 'ScheduleProf', ''),
('2024-06-26 15:36:41.461256', 18, NULL, '', NULL, 'Exercice', ''),
('2024-06-26 15:36:41.468259', 19, NULL, '', NULL, 'FreeTrialConfiguration', ''),
('2024-06-26 15:36:41.476254', 20, NULL, '', NULL, 'FreeTrialformule', ''),
('2024-06-26 15:36:41.484253', 21, NULL, '', NULL, 'FaqEtudiant', ''),
('2024-06-26 15:36:41.493259', 22, NULL, '', NULL, 'Prof', ''),
('2024-06-26 15:36:41.500255', 23, NULL, '', NULL, 'FreeTrial', ''),
('2024-06-26 15:36:41.510257', 24, NULL, '', NULL, 'InviteStudent', ''),
('2024-06-26 15:36:41.519259', 25, NULL, '', NULL, 'Parcours', ''),
('2024-06-26 15:36:41.527254', 26, NULL, '', NULL, 'Dictionary', ''),
('2024-06-26 15:36:41.537253', 27, NULL, '', NULL, 'ClassAverageBonus', ''),
('2024-06-26 15:36:41.546258', 28, NULL, '', NULL, 'FreeTrialTeacherWhatsTemplate', ''),
('2024-06-26 15:36:41.555258', 29, NULL, '', NULL, 'StatutFreeTrial', ''),
('2024-06-26 15:36:41.565255', 30, NULL, '', NULL, 'TypeCollaborator', ''),
('2024-06-26 15:36:41.575256', 31, NULL, '', NULL, 'WorkloadBonus', ''),
('2024-06-26 15:36:41.584256', 32, NULL, '', NULL, 'TeacherLocality', ''),
('2024-06-26 15:36:41.593255', 33, NULL, '', NULL, 'Services', ''),
('2024-06-26 15:36:41.603256', 34, NULL, '', NULL, 'HomeWorkQuestion', ''),
('2024-06-26 15:36:41.611256', 35, NULL, '', NULL, 'Salary', ''),
('2024-06-26 15:36:41.618322', 36, NULL, '', NULL, 'TypeReclamationEtudiant', ''),
('2024-06-26 15:36:41.626587', 37, NULL, '', NULL, 'GroupeEtat', ''),
('2024-06-26 15:36:41.634586', 38, NULL, '', NULL, 'ReponseEtudiant', ''),
('2024-06-26 15:36:41.642588', 39, NULL, '', NULL, 'SessionCoursSection', ''),
('2024-06-26 15:36:41.649588', 40, NULL, '', NULL, 'HoweWorkQSTReponse', ''),
('2024-06-26 15:36:41.657585', 41, NULL, '', NULL, 'GroupeEtudiantDetail', ''),
('2024-06-26 15:36:41.664587', 42, NULL, '', NULL, 'Section', ''),
('2024-06-26 15:36:41.671891', 43, NULL, '', NULL, 'EtudiantReview', ''),
('2024-06-26 15:36:41.679891', 44, NULL, '', NULL, 'Question', ''),
('2024-06-26 15:36:41.686885', 45, NULL, '', NULL, 'CategorieProf', ''),
('2024-06-26 15:36:41.693891', 46, NULL, '', NULL, 'RecommendTeacher', ''),
('2024-06-26 15:36:41.701890', 47, NULL, '', NULL, 'Inscription', ''),
('2024-06-26 15:36:41.710892', 48, NULL, '', NULL, 'FaqType', ''),
('2024-06-26 15:36:41.718894', 49, NULL, '', NULL, 'Fonction', ''),
('2024-06-26 15:36:41.726889', 50, NULL, '', NULL, 'NiveauEtude', ''),
('2024-06-26 15:36:41.734887', 51, NULL, '', NULL, 'TypeHomeWork', ''),
('2024-06-26 15:36:41.742892', 52, NULL, '', NULL, 'Vocabulary', ''),
('2024-06-26 15:36:41.750893', 53, NULL, '', NULL, 'ReclamationProf', ''),
('2024-06-26 15:36:41.758889', 54, NULL, '', NULL, 'ReponseEtudiantHomeWork', ''),
('2024-06-26 15:36:41.767890', 55, NULL, '', NULL, 'FreeTrialDetail', ''),
('2024-06-26 15:36:41.775888', 56, NULL, '', NULL, 'QuizEtudiant', ''),
('2024-06-26 15:36:41.784894', 57, NULL, '', NULL, 'GroupeType', ''),
('2024-06-26 15:36:41.793889', 58, NULL, '', NULL, 'FreeTrialTeacherEmailTemplate', ''),
('2024-06-26 15:36:41.801888', 59, NULL, '', NULL, 'Cours', ''),
('2024-06-26 15:36:41.809887', 60, NULL, '', NULL, 'SessionCours', ''),
('2024-06-26 15:36:41.816887', 61, NULL, '', NULL, 'LevelTestConfiguration', ''),
('2024-06-26 15:36:41.824895', 62, NULL, '', NULL, 'Price', ''),
('2024-06-26 15:36:41.830894', 63, NULL, '', NULL, 'FaqProf', ''),
('2024-06-26 15:36:41.837888', 64, NULL, '', NULL, 'Collaborator', ''),
('2024-06-26 15:36:41.845891', 65, NULL, '', NULL, 'ClassAverageBonusProf', ''),
('2024-06-26 15:36:41.852888', 66, NULL, '', NULL, 'FreeTrialStudentWhatsTemplate', ''),
('2024-06-26 15:36:41.859929', 67, NULL, '', NULL, 'HomeWork', ''),
('2024-06-26 15:36:41.867890', 68, NULL, '', NULL, 'ReclamationEtudiant', ''),
('2024-06-26 15:36:41.874888', 69, NULL, '', NULL, 'ConfirmationToken', ''),
('2024-06-26 15:36:41.882892', 70, NULL, '', NULL, 'TypeTeacher', ''),
('2024-06-26 15:36:41.889891', 71, NULL, '', NULL, 'TrancheHoraireProf', ''),
('2024-06-26 15:36:41.896894', 72, NULL, '', NULL, 'FreeTrialStudentEmailTemplate', ''),
('2024-06-26 15:36:41.904887', 73, NULL, '', NULL, 'GroupeEtude', ''),
('2024-06-26 15:36:41.912888', 74, NULL, '', NULL, 'TypeDeQuestion', ''),
('2024-06-26 15:36:41.921889', 75, NULL, '', NULL, 'Faq', ''),
('2024-06-26 15:36:41.929890', 76, NULL, '', NULL, 'GroupeEtudiant', ''),
('2024-06-26 15:36:41.936892', 77, NULL, '', NULL, 'Contact', ''),
('2024-06-26 15:36:41.944891', 78, NULL, '', NULL, 'TypeReclamationProf', ''),
('2024-06-26 15:36:41.953891', 79, NULL, '', NULL, 'User', ''),
('2024-06-26 15:36:41.961890', 80, NULL, '', NULL, 'ModelPermission', ''),
('2024-06-26 15:36:41.970887', 81, NULL, '', NULL, 'ActionPermission', '');

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
(b'1', 1, '2024-06-26 15:36:42.143888', 1, 1, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.151888', 2, 1, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.154927', 3, 1, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.158931', 4, 1, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.161894', 5, 1, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.165902', 6, 1, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.168924', 7, 2, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.172890', 8, 2, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.175887', 9, 2, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.178897', 10, 2, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.181888', 11, 2, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.184887', 12, 2, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.187926', 13, 3, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.191892', 14, 3, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.194924', 15, 3, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.208904', 16, 3, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.213937', 17, 3, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.217889', 18, 3, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.220992', 19, 4, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.223927', 20, 4, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.226889', 21, 4, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.229923', 22, 4, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.232974', 23, 4, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.234990', 24, 4, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.238013', 25, 5, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.240888', 26, 5, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.242900', 27, 5, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.245925', 28, 5, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.247955', 29, 5, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.250888', 30, 5, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.253887', 31, 6, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.256894', 32, 6, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.259889', 33, 6, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.263158', 34, 6, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.265888', 35, 6, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.268974', 36, 6, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.271885', 37, 7, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.274891', 38, 7, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.277888', 39, 7, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.280891', 40, 7, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.283145', 41, 7, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.286152', 42, 7, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.289138', 43, 8, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.291888', 44, 8, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.294887', 45, 8, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.297886', 46, 8, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.299889', 47, 8, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.302888', 48, 8, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.305888', 49, 9, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.308891', 50, 9, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.311891', 51, 9, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.315889', 52, 9, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.318889', 53, 9, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.322892', 54, 9, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.327888', 55, 10, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.330903', 56, 10, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.334894', 57, 10, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.337888', 58, 10, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.340889', 59, 10, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.343925', 60, 10, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.347897', 61, 11, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.351888', 62, 11, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.354892', 63, 11, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.358892', 64, 11, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.362889', 65, 11, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.365896', 66, 11, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.368938', 67, 12, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.373893', 68, 12, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.377901', 69, 12, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.380887', 70, 12, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.384887', 71, 12, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.387887', 72, 12, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.390892', 73, 13, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.394887', 74, 13, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.398890', 75, 13, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.401887', 76, 13, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.403892', 77, 13, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.407909', 78, 13, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.410890', 79, 14, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.413889', 80, 14, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.416888', 81, 14, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.419888', 82, 14, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.421887', 83, 14, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.424887', 84, 14, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.427886', 85, 15, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.429886', 86, 15, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.432886', 87, 15, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.435885', 88, 15, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.438886', 89, 15, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.440886', 90, 15, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.442887', 91, 16, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.445886', 92, 16, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.447887', 93, 16, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.449887', 94, 16, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.452887', 95, 16, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.454887', 96, 16, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.456886', 97, 17, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.459886', 98, 17, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.461888', 99, 17, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.464888', 100, 17, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.467888', 101, 17, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.469886', 102, 17, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.471888', 103, 18, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.475887', 104, 18, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.477887', 105, 18, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.480886', 106, 18, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.482888', 107, 18, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.485887', 108, 18, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.487886', 109, 19, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.490888', 110, 19, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.492886', 111, 19, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.494888', 112, 19, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.496889', 113, 19, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.499890', 114, 19, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.501889', 115, 20, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.503889', 116, 20, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.506890', 117, 20, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.508888', 118, 20, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.510890', 119, 20, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.513894', 120, 20, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.516885', 121, 21, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.518892', 122, 21, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.521889', 123, 21, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.524887', 124, 21, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.526887', 125, 21, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.528888', 126, 21, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.531896', 127, 22, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.534890', 128, 22, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.536889', 129, 22, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.539905', 130, 22, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.542886', 131, 22, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.544886', 132, 22, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.547892', 133, 23, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.550888', 134, 23, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.552888', 135, 23, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.555890', 136, 23, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.558891', 137, 23, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.561888', 138, 23, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.563888', 139, 24, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.567887', 140, 24, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.570888', 141, 24, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.573895', 142, 24, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.575888', 143, 24, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.578888', 144, 24, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.581896', 145, 25, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.584885', 146, 25, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.586888', 147, 25, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.589896', 148, 25, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.591888', 149, 25, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.594888', 150, 25, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.596886', 151, 26, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.599890', 152, 26, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.601887', 153, 26, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.604893', 154, 26, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.608888', 155, 26, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.610889', 156, 26, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.612888', 157, 27, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.615905', 158, 27, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.617907', 159, 27, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.619907', 160, 27, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.621909', 161, 27, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.624887', 162, 27, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.627887', 163, 28, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.630888', 164, 28, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.633887', 165, 28, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.635890', 166, 28, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.638889', 167, 28, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.640886', 168, 28, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.642910', 169, 29, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.645911', 170, 29, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.650902', 171, 29, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.655902', 172, 29, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.661896', 173, 29, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.666900', 174, 29, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.672909', 175, 30, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.678912', 176, 30, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.682890', 177, 30, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.686895', 178, 30, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.689909', 179, 30, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.693903', 180, 30, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.696898', 181, 31, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.700891', 182, 31, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.704900', 183, 31, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.708890', 184, 31, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.712891', 185, 31, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.715886', 186, 31, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.718889', 187, 32, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.721889', 188, 32, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.723889', 189, 32, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.726895', 190, 32, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.728892', 191, 32, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.731887', 192, 32, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.733889', 193, 33, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.736887', 194, 33, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.739890', 195, 33, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.742886', 196, 33, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.745885', 197, 33, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.747888', 198, 33, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.750892', 199, 34, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.752887', 200, 34, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.755891', 201, 34, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.758889', 202, 34, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.760888', 203, 34, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.762888', 204, 34, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.765897', 205, 35, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.767890', 206, 35, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.769887', 207, 35, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.772889', 208, 35, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.775887', 209, 35, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.776887', 210, 35, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.779890', 211, 36, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.782889', 212, 36, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.784887', 213, 36, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.786894', 214, 36, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.788890', 215, 36, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.791887', 216, 36, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.794890', 217, 37, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.797893', 218, 37, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.801890', 219, 37, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.803886', 220, 37, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.806890', 221, 37, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.809888', 222, 37, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.811889', 223, 38, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.813888', 224, 38, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.816887', 225, 38, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.818888', 226, 38, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.821888', 227, 38, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.824890', 228, 38, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.827886', 229, 39, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.829885', 230, 39, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.831888', 231, 39, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.833910', 232, 39, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.835908', 233, 39, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.837899', 234, 39, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.839917', 235, 40, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.841888', 236, 40, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.843889', 237, 40, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.845891', 238, 40, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.847888', 239, 40, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.849908', 240, 40, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.851887', 241, 41, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.853898', 242, 41, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.855923', 243, 41, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.857915', 244, 41, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.859908', 245, 41, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.861917', 246, 41, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.863885', 247, 42, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.865886', 248, 42, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.867886', 249, 42, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.869907', 250, 42, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.871907', 251, 42, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.873908', 252, 42, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.875908', 253, 43, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.877909', 254, 43, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.879907', 255, 43, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.881907', 256, 43, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.883908', 257, 43, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.885911', 258, 43, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.887910', 259, 44, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.889888', 260, 44, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.891887', 261, 44, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.893908', 262, 44, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.895908', 263, 44, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.897925', 264, 44, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.899887', 265, 45, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.901889', 266, 45, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.903890', 267, 45, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.906889', 268, 45, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.908889', 269, 45, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.910886', 270, 45, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.912926', 271, 46, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.914889', 272, 46, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.917887', 273, 46, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.919927', 274, 46, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.922890', 275, 46, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.925886', 276, 46, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.927927', 277, 47, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.930888', 278, 47, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.933892', 279, 47, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.936890', 280, 47, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.938892', 281, 47, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.941932', 282, 47, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.944892', 283, 48, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.947896', 284, 48, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.950889', 285, 48, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.952889', 286, 48, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.954899', 287, 48, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.957932', 288, 48, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.960927', 289, 49, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.963899', 290, 49, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.966889', 291, 49, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.969891', 292, 49, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.972898', 293, 49, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.975889', 294, 49, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.978890', 295, 50, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.980890', 296, 50, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.983894', 297, 50, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:42.985929', 298, 50, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:42.988886', 299, 50, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:42.991891', 300, 50, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:42.993926', 301, 51, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:42.995935', 302, 51, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:42.999890', 303, 51, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.001888', 304, 51, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.003927', 305, 51, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.006893', 306, 51, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.009924', 307, 52, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.011927', 308, 52, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.014887', 309, 52, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.017885', 310, 52, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.020154', 311, 52, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.029888', 312, 52, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.031943', 313, 53, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.033992', 314, 53, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.035925', 315, 53, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.038889', 316, 53, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.040999', 317, 53, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.043917', 318, 53, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.048913', 319, 54, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.053898', 320, 54, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.058917', 321, 54, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.064900', 322, 54, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.071903', 323, 54, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.076897', 324, 54, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.081893', 325, 55, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.085893', 326, 55, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.089995', 327, 55, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.093894', 328, 55, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.097895', 329, 55, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.101891', 330, 55, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.105938', 331, 56, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.109891', 332, 56, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.113945', 333, 56, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.117896', 334, 56, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.121897', 335, 56, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.125897', 336, 56, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.128894', 337, 57, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.131888', 338, 57, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.134889', 339, 57, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.137889', 340, 57, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.141891', 341, 57, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.143891', 342, 57, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.146889', 343, 58, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.149892', 344, 58, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.151924', 345, 58, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.154888', 346, 58, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.157887', 347, 58, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.159887', 348, 58, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.162886', 349, 59, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.164887', 350, 59, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.167887', 351, 59, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.169887', 352, 59, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.172888', 353, 59, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.174888', 354, 59, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.177887', 355, 60, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.179887', 356, 60, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.181895', 357, 60, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.184889', 358, 60, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.186887', 359, 60, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.188893', 360, 60, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.191887', 361, 61, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.193888', 362, 61, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.195888', 363, 61, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.198899', 364, 61, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.200887', 365, 61, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.203887', 366, 61, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.205890', 367, 62, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.208888', 368, 62, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.210887', 369, 62, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.213886', 370, 62, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.215891', 371, 62, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.217887', 372, 62, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.220890', 373, 63, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.223886', 374, 63, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.225886', 375, 63, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.228888', 376, 63, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.230891', 377, 63, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.233887', 378, 63, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.235889', 379, 64, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.238887', 380, 64, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.241888', 381, 64, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.243909', 382, 64, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.246908', 383, 64, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.251902', 384, 64, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.256892', 385, 65, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.262903', 386, 65, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.267909', 387, 65, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.272908', 388, 65, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.278897', 389, 65, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.283901', 390, 65, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.288891', 391, 66, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.292906', 392, 66, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.296900', 393, 66, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.299897', 394, 66, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.303892', 395, 66, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.306897', 396, 66, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.309891', 397, 67, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.312889', 398, 67, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.314889', 399, 67, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.317886', 400, 67, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.319893', 401, 67, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.321888', 402, 67, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.324894', 403, 68, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.326888', 404, 68, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.328888', 405, 68, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.330889', 406, 68, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.333886', 407, 68, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.335887', 408, 68, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.337886', 409, 69, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.340889', 410, 69, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.342888', 411, 69, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.344887', 412, 69, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.347890', 413, 69, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.349888', 414, 69, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.351887', 415, 70, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.354886', 416, 70, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.356894', 417, 70, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.358886', 418, 70, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.361886', 419, 70, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.364891', 420, 70, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.366890', 421, 71, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.369890', 422, 71, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.371887', 423, 71, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.374887', 424, 71, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.376891', 425, 71, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.378895', 426, 71, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.381889', 427, 72, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.383887', 428, 72, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.386886', 429, 72, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.388888', 430, 72, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.391886', 431, 72, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.393889', 432, 72, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.395889', 433, 73, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.397889', 434, 73, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.399888', 435, 73, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.402885', 436, 73, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.404886', 437, 73, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.407886', 438, 73, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.409889', 439, 74, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.411889', 440, 74, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.413888', 441, 74, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.416888', 442, 74, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.418889', 443, 74, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.420888', 444, 74, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.423895', 445, 75, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.425888', 446, 75, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.427890', 447, 75, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.430891', 448, 75, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.432891', 449, 75, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.437909', 450, 75, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.440891', 451, 76, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.442886', 452, 76, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.444908', 453, 76, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.446885', 454, 76, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.448886', 455, 76, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.450946', 456, 76, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.452908', 457, 77, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.454917', 458, 77, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.456888', 459, 77, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.458886', 460, 77, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.459886', 461, 77, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.461910', 462, 77, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.463887', 463, 78, NULL, 1, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.465908', 464, 78, NULL, 1, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.467910', 465, 78, NULL, 1, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.469886', 466, 78, NULL, 1, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.471886', 467, 78, NULL, 1, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.473908', 468, 78, NULL, 1, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.913073', 469, 1, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.915066', 470, 1, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.917069', 471, 1, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.919072', 472, 1, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.921070', 473, 1, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.923067', 474, 1, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.925065', 475, 2, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.927068', 476, 2, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.929068', 477, 2, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.931067', 478, 2, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.934068', 479, 2, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.936069', 480, 2, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.939072', 481, 3, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.942069', 482, 3, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.944104', 483, 3, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.947074', 484, 3, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.950068', 485, 3, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.952108', 486, 3, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.954107', 487, 4, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.957075', 488, 4, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.959069', 489, 4, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.961108', 490, 4, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.963067', 491, 4, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.966073', 492, 4, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.968068', 493, 5, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.970110', 494, 5, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.973069', 495, 5, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.975106', 496, 5, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.978073', 497, 5, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.980107', 498, 5, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.983066', 499, 6, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.985078', 500, 6, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:43.987105', 501, 6, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:43.990075', 502, 6, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:43.992069', 503, 6, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:43.994107', 504, 6, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:43.996105', 505, 7, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:43.999075', 506, 7, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.001110', 507, 7, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.004070', 508, 7, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.017106', 509, 7, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.020067', 510, 7, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.022107', 511, 8, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.025093', 512, 8, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.027110', 513, 8, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.030075', 514, 8, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.032118', 515, 8, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.034068', 516, 8, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.037107', 517, 9, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.040067', 518, 9, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.042171', 519, 9, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.044170', 520, 9, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.046170', 521, 9, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.049067', 522, 9, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.051170', 523, 10, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.053143', 524, 10, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.055109', 525, 10, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.057170', 526, 10, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.062076', 527, 10, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.066073', 528, 10, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.071077', 529, 11, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.075084', 530, 11, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.079073', 531, 11, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.084088', 532, 11, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.088076', 533, 11, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.092182', 534, 11, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.097083', 535, 12, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.101091', 536, 12, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.105172', 537, 12, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.109146', 538, 12, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.114084', 539, 12, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.118146', 540, 12, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.123057', 541, 13, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.128062', 542, 13, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.132111', 543, 13, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.138056', 544, 13, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.142055', 545, 13, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.145106', 546, 13, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.149060', 547, 14, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.152049', 548, 14, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.155132', 549, 14, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.159054', 550, 14, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.161047', 551, 14, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.164050', 552, 14, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.167048', 553, 15, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.170089', 554, 15, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.173049', 555, 15, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.176051', 556, 15, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.178047', 557, 15, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.181048', 558, 15, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.184089', 559, 16, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.187087', 560, 16, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.190058', 561, 16, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.192088', 562, 16, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.195091', 563, 16, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.198053', 564, 16, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.201051', 565, 17, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.203090', 566, 17, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.206094', 567, 17, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.209085', 568, 17, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.212053', 569, 17, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.214104', 570, 17, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.217088', 571, 18, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.220071', 572, 18, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.222092', 573, 18, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.225088', 574, 18, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.228047', 575, 18, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.230089', 576, 18, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.233045', 577, 19, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.235092', 578, 19, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.238046', 579, 19, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.240105', 580, 19, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.242046', 581, 19, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.245047', 582, 19, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.247047', 583, 20, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.250046', 584, 20, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.252045', 585, 20, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.254083', 586, 20, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.256123', 587, 20, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.259093', 588, 20, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.261048', 589, 21, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.263109', 590, 21, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.266102', 591, 21, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.268082', 592, 21, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.270149', 593, 21, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.272286', 594, 21, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.277058', 595, 22, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.282140', 596, 22, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.287060', 597, 22, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.293069', 598, 22, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.297130', 599, 22, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.303063', 600, 22, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.310059', 601, 23, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.315060', 602, 23, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.319062', 603, 23, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.323053', 604, 23, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.326053', 605, 23, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.328051', 606, 23, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.331049', 607, 24, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.334049', 608, 24, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.337055', 609, 24, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.339054', 610, 24, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.342054', 611, 24, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.344050', 612, 24, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.347087', 613, 25, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.350049', 614, 25, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.352049', 615, 25, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.354047', 616, 25, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.357051', 617, 25, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.360049', 618, 25, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.362047', 619, 26, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.365054', 620, 26, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.367087', 621, 26, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.370052', 622, 26, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.372095', 623, 26, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.375085', 624, 26, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.377086', 625, 27, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.380049', 626, 27, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.383046', 627, 27, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.385048', 628, 27, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.387046', 629, 27, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.390045', 630, 27, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.393045', 631, 28, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.395045', 632, 28, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.398045', 633, 28, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.400047', 634, 28, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.403045', 635, 28, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.405050', 636, 28, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.408047', 637, 29, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.410046', 638, 29, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.412047', 639, 29, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.415060', 640, 29, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.417052', 641, 29, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.419046', 642, 29, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.421052', 643, 30, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.424048', 644, 30, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.426046', 645, 30, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.428047', 646, 30, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.430048', 647, 30, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.433045', 648, 30, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.435047', 649, 31, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.437047', 650, 31, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.441045', 651, 31, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.443046', 652, 31, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.445069', 653, 31, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.447068', 654, 31, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.450059', 655, 32, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.454055', 656, 32, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.458050', 657, 32, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.463057', 658, 32, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.468061', 659, 32, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.472084', 660, 32, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.476082', 661, 33, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.480053', 662, 33, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.484059', 663, 33, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.489051', 664, 33, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.493059', 665, 33, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.497066', 666, 33, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.501053', 667, 34, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.505055', 668, 34, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.509056', 669, 34, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.513053', 670, 34, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.517060', 671, 34, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.521052', 672, 34, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.525053', 673, 35, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.530055', 674, 35, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.534051', 675, 35, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.538053', 676, 35, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.541049', 677, 35, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.543048', 678, 35, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.546049', 679, 36, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.549049', 680, 36, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.551049', 681, 36, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.554051', 682, 36, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.556056', 683, 36, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.559050', 684, 36, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.562049', 685, 37, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.565056', 686, 37, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.567049', 687, 37, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.570048', 688, 37, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.572053', 689, 37, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.575047', 690, 37, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.577046', 691, 38, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.580046', 692, 38, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.582049', 693, 38, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.584047', 694, 38, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.586047', 695, 38, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.589049', 696, 38, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.591048', 697, 39, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.593046', 698, 39, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.596046', 699, 39, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.599046', 700, 39, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.601045', 701, 39, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.603045', 702, 39, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.604046', 703, 40, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.607046', 704, 40, NULL, 2, '', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-26 15:36:44.609047', 705, 40, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.611047', 706, 40, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.613052', 707, 40, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.615058', 708, 40, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.617046', 709, 41, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.620048', 710, 41, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.622054', 711, 41, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.624046', 712, 41, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.626047', 713, 41, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.628047', 714, 41, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.631063', 715, 42, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.633046', 716, 42, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.636049', 717, 42, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.638048', 718, 42, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.640060', 719, 42, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.642051', 720, 42, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.644047', 721, 43, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.646047', 722, 43, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.649090', 723, 43, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.651090', 724, 43, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.653046', 725, 43, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.656082', 726, 43, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.658083', 727, 44, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.660150', 728, 44, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.662151', 729, 44, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.664127', 730, 44, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.666149', 731, 44, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.671109', 732, 44, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.675054', 733, 45, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.679073', 734, 45, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.684055', 735, 45, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.688058', 736, 45, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.693055', 737, 45, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.697056', 738, 45, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.702061', 739, 46, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.706059', 740, 46, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.710058', 741, 46, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.715062', 742, 46, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.719072', 743, 46, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.723162', 744, 46, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.728154', 745, 47, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.731192', 746, 47, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.734192', 747, 47, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.738145', 748, 47, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.741145', 749, 47, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.745153', 750, 47, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.748145', 751, 48, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.751189', 752, 48, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.754144', 753, 48, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.757144', 754, 48, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.759180', 755, 48, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.762141', 756, 48, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.765143', 757, 49, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.767179', 758, 49, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.769180', 759, 49, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.772141', 760, 49, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.774178', 761, 49, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.777142', 762, 49, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.779144', 763, 50, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.781143', 764, 50, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.784138', 765, 50, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.786142', 766, 50, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.788148', 767, 50, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.791142', 768, 50, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.793142', 769, 51, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.795140', 770, 51, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.798145', 771, 51, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.800182', 772, 51, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.803140', 773, 51, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.805198', 774, 51, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.808141', 775, 52, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.810178', 776, 52, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.812182', 777, 52, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.815182', 778, 52, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.817181', 779, 52, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.819177', 780, 52, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.822100', 781, 53, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.824103', 782, 53, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.827064', 783, 53, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.829102', 784, 53, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.832106', 785, 53, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.834103', 786, 53, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.836099', 787, 54, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.839063', 788, 54, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.841108', 789, 54, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.844060', 790, 54, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.846061', 791, 54, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.849060', 792, 54, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.851064', 793, 55, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.853062', 794, 55, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.856065', 795, 55, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.858112', 796, 55, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.860167', 797, 55, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.868101', 798, 55, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.871062', 799, 56, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.873061', 800, 56, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.875173', 801, 56, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.877171', 802, 56, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.879062', 803, 56, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.881171', 804, 56, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.883238', 805, 57, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.885289', 806, 57, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.890105', 807, 57, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.895082', 808, 57, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.900070', 809, 57, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.905087', 810, 57, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.911071', 811, 58, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.916071', 812, 58, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.922085', 813, 58, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.927074', 814, 58, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.932068', 815, 58, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.935066', 816, 58, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.938066', 817, 59, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.941062', 818, 59, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.944064', 819, 59, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.946065', 820, 59, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.949070', 821, 59, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.952063', 822, 59, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.954106', 823, 60, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.957063', 824, 60, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.959062', 825, 60, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.961100', 826, 60, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.964067', 827, 60, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.966061', 828, 60, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.968063', 829, 61, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.971066', 830, 61, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.973068', 831, 61, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.975061', 832, 61, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.978063', 833, 61, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.980062', 834, 61, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.983060', 835, 62, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:44.985102', 836, 62, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:44.987063', 837, 62, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:44.990065', 838, 62, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:44.992064', 839, 62, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:44.995061', 840, 62, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:44.997128', 841, 63, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.000063', 842, 63, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.002101', 843, 63, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.004066', 844, 63, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.007108', 845, 63, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.010063', 846, 63, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.012062', 847, 64, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.015067', 848, 64, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.017062', 849, 64, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.019064', 850, 64, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.021063', 851, 64, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.024208', 852, 64, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.026209', 853, 65, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.029208', 854, 65, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.031256', 855, 65, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.033209', 856, 65, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.036210', 857, 65, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.038211', 858, 65, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.041208', 859, 66, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.043210', 860, 66, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.045206', 861, 66, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.047209', 862, 66, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.050256', 863, 66, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.052211', 864, 66, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.054208', 865, 67, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.057251', 866, 67, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.060208', 867, 67, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.062343', 868, 67, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.064209', 869, 67, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.066311', 870, 67, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.068249', 871, 68, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.070310', 872, 68, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.073262', 873, 68, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.077214', 874, 68, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.081295', 875, 68, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.086215', 876, 68, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.090215', 877, 69, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.094320', 878, 69, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.099225', 879, 69, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.103211', 880, 69, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.108217', 881, 69, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.113213', 882, 69, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.118216', 883, 70, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.122144', 884, 70, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.127100', 885, 70, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.132162', 886, 70, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.136091', 887, 70, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.141092', 888, 70, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.145083', 889, 71, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.148084', 890, 71, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.151080', 891, 71, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.154081', 892, 71, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.157081', 893, 71, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.160083', 894, 71, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.162083', 895, 72, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.165082', 896, 72, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.167079', 897, 72, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.170080', 898, 72, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.173082', 899, 72, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.175079', 900, 72, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.177082', 901, 73, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.179081', 902, 73, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.182081', 903, 73, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.184082', 904, 73, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.186080', 905, 73, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.189081', 906, 73, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.191080', 907, 74, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.193080', 908, 74, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.195083', 909, 74, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.198087', 910, 74, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.200079', 911, 74, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.202080', 912, 74, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.204083', 913, 75, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.207084', 914, 75, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.209080', 915, 75, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.211079', 916, 75, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.213081', 917, 75, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.216079', 918, 75, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.218080', 919, 76, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.220078', 920, 76, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.223206', 921, 76, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.225201', 922, 76, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.227200', 923, 76, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.229201', 924, 76, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.231207', 925, 77, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.233202', 926, 77, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.235201', 927, 77, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.237204', 928, 77, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.240203', 929, 77, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.242203', 930, 77, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:36:45.244204', 931, 78, NULL, 2, '', NULL, ''),
(b'1', 2, '2024-06-26 15:36:45.246203', 932, 78, NULL, 2, '', NULL, ''),
(b'1', 3, '2024-06-26 15:36:45.249202', 933, 78, NULL, 2, '', NULL, ''),
(b'1', 4, '2024-06-26 15:36:45.250202', 934, 78, NULL, 2, '', NULL, ''),
(b'1', 5, '2024-06-26 15:36:45.252201', 935, 78, NULL, 2, '', NULL, ''),
(b'1', 6, '2024-06-26 15:36:45.255205', 936, 78, NULL, 2, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:06.907617', 937, 1, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:06.917643', 938, 1, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:06.921620', 939, 1, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:06.926680', 940, 1, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:06.931618', 941, 1, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:06.935688', 942, 1, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:06.939654', 943, 2, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:06.943633', 944, 2, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:06.947613', 945, 2, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:06.951676', 946, 2, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:06.955652', 947, 2, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:06.960667', 948, 2, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:06.964646', 949, 3, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:06.970623', 950, 3, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:06.973618', 951, 3, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:06.978639', 952, 3, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:06.983619', 953, 3, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:06.987623', 954, 3, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:06.991616', 955, 4, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:06.995621', 956, 4, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:06.999627', 957, 4, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.003630', 958, 4, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.007623', 959, 4, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.011620', 960, 4, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.015621', 961, 5, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.019678', 962, 5, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.023620', 963, 5, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.027660', 964, 5, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.031621', 965, 5, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.034625', 966, 5, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.038662', 967, 6, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.041628', 968, 6, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.045622', 969, 6, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.048615', 970, 6, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.052618', 971, 6, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.056619', 972, 6, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.070616', 973, 7, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.073625', 974, 7, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.077617', 975, 7, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.080658', 976, 7, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.084625', 977, 7, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.087617', 978, 7, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.090621', 979, 8, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.094623', 980, 8, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.097628', 981, 8, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.101624', 982, 8, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.104619', 983, 8, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.107615', 984, 8, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.111615', 985, 9, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.115617', 986, 9, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.119631', 987, 9, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.123616', 988, 9, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.127619', 989, 9, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.130620', 990, 9, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.134623', 991, 10, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.137633', 992, 10, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.141617', 993, 10, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.145644', 994, 10, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.149622', 995, 10, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.153652', 996, 10, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.157621', 997, 11, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.161632', 998, 11, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.165621', 999, 11, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.169684', 1000, 11, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.173621', 1001, 11, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.177668', 1002, 11, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.181618', 1003, 12, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.186659', 1004, 12, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.190622', 1005, 12, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.194621', 1006, 12, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.198618', 1007, 12, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.202618', 1008, 12, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.206620', 1009, 13, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.210620', 1010, 13, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.214617', 1011, 13, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.218624', 1012, 13, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.223617', 1013, 13, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.228617', 1014, 13, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.231618', 1015, 14, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.235660', 1016, 14, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.238805', 1017, 14, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.242621', 1018, 14, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.245654', 1019, 14, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.249618', 1020, 14, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.253615', 1021, 15, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.257620', 1022, 15, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.261617', 1023, 15, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.265622', 1024, 15, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.268621', 1025, 15, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.271622', 1026, 15, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.274619', 1027, 16, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.278654', 1028, 16, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.281621', 1029, 16, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.284621', 1030, 16, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.287648', 1031, 16, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.290619', 1032, 16, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.294619', 1033, 17, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.297616', 1034, 17, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.300681', 1035, 17, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.304652', 1036, 17, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.306621', 1037, 17, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.310673', 1038, 17, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.314617', 1039, 18, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.317622', 1040, 18, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.320616', 1041, 18, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.324617', 1042, 18, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.328618', 1043, 18, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.331618', 1044, 18, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.336619', 1045, 19, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.339634', 1046, 19, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.343627', 1047, 19, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.348630', 1048, 19, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.352618', 1049, 19, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.356620', 1050, 19, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.360619', 1051, 20, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.365624', 1052, 20, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.368625', 1053, 20, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.373624', 1054, 20, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.377623', 1055, 20, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.381615', 1056, 20, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.385622', 1057, 21, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.390620', 1058, 21, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.394620', 1059, 21, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.398616', 1060, 21, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.402623', 1061, 21, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.407623', 1062, 21, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.412623', 1063, 22, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.416619', 1064, 22, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.420626', 1065, 22, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.424620', 1066, 22, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.428622', 1067, 22, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.431619', 1068, 22, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.436619', 1069, 23, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.438614', 1070, 23, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.442620', 1071, 23, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.446616', 1072, 23, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.449615', 1073, 23, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.453615', 1074, 23, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.456618', 1075, 24, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.459621', 1076, 24, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.462616', 1077, 24, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.466629', 1078, 24, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.469616', 1079, 24, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.472616', 1080, 24, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.476615', 1081, 25, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.479613', 1082, 25, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.482617', 1083, 25, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.486616', 1084, 25, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.489613', 1085, 25, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.492618', 1086, 25, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.495613', 1087, 26, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.498617', 1088, 26, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.501619', 1089, 26, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.517617', 1090, 26, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.520615', 1091, 26, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.523618', 1092, 26, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.527620', 1093, 27, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.530614', 1094, 27, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.534621', 1095, 27, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.538617', 1096, 27, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.543622', 1097, 27, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.549617', 1098, 27, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.553620', 1099, 28, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.558622', 1100, 28, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.568648', 1101, 28, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.574620', 1102, 28, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.579622', 1103, 28, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.587624', 1104, 28, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.593637', 1105, 29, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.598620', 1106, 29, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.602621', 1107, 29, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.606621', 1108, 29, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.610627', 1109, 29, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.614614', 1110, 29, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.618622', 1111, 30, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.622617', 1112, 30, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.626625', 1113, 30, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.631616', 1114, 30, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.634624', 1115, 30, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.638615', 1116, 30, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.640625', 1117, 31, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.644626', 1118, 31, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.646616', 1119, 31, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.650629', 1120, 31, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.653617', 1121, 31, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.656616', 1122, 31, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.659627', 1123, 32, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.662615', 1124, 32, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.664617', 1125, 32, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.667621', 1126, 32, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.671618', 1127, 32, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.673615', 1128, 32, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.676617', 1129, 33, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.678636', 1130, 33, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.681618', 1131, 33, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.683614', 1132, 33, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.687617', 1133, 33, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.689615', 1134, 33, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.692616', 1135, 34, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.695620', 1136, 34, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.697617', 1137, 34, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.700625', 1138, 34, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.703650', 1139, 34, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.706618', 1140, 34, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.708685', 1141, 35, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.711649', 1142, 35, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.714619', 1143, 35, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.717624', 1144, 35, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.720616', 1145, 35, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.722615', 1146, 35, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.725669', 1147, 36, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.728653', 1148, 36, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.731617', 1149, 36, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.735636', 1150, 36, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.737653', 1151, 36, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.740628', 1152, 36, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.744634', 1153, 37, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.747638', 1154, 37, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.751669', 1155, 37, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.754656', 1156, 37, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.758622', 1157, 37, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.761706', 1158, 37, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.764615', 1159, 38, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.768621', 1160, 38, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.772614', 1161, 38, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.776624', 1162, 38, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.780653', 1163, 38, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.784621', 1164, 38, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.788616', 1165, 39, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.791619', 1166, 39, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.795673', 1167, 39, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.799617', 1168, 39, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.803623', 1169, 39, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.806617', 1170, 39, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.810628', 1171, 40, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.813656', 1172, 40, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.817639', 1173, 40, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.821621', 1174, 40, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.824619', 1175, 40, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.828670', 1176, 40, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.831620', 1177, 41, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.835625', 1178, 41, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.839619', 1179, 41, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.842636', 1180, 41, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.846618', 1181, 41, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.849654', 1182, 41, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.852622', 1183, 42, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.855620', 1184, 42, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.858629', 1185, 42, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.861717', 1186, 42, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.864620', 1187, 42, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.867631', 1188, 42, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.871617', 1189, 43, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.874621', 1190, 43, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.878622', 1191, 43, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.881617', 1192, 43, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.885627', 1193, 43, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.887615', 1194, 43, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.890620', 1195, 44, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.893639', 1196, 44, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.896617', 1197, 44, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.898620', 1198, 44, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.901661', 1199, 44, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.904717', 1200, 44, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.907617', 1201, 45, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.910666', 1202, 45, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.913622', 1203, 45, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.916618', 1204, 45, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.919618', 1205, 45, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.922666', 1206, 45, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.925673', 1207, 46, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.928655', 1208, 46, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.931616', 1209, 46, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.934623', 1210, 46, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.937617', 1211, 46, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.940615', 1212, 46, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.944620', 1213, 47, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.946619', 1214, 47, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.950633', 1215, 47, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.953656', 1216, 47, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.956615', 1217, 47, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.960624', 1218, 47, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.963637', 1219, 48, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.966652', 1220, 48, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.970623', 1221, 48, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.973630', 1222, 48, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:07.976634', 1223, 48, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:07.980618', 1224, 48, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:07.984619', 1225, 49, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:07.988621', 1226, 49, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:07.992627', 1227, 49, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:07.997616', 1228, 49, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.001619', 1229, 49, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.005616', 1230, 49, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.009625', 1231, 50, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.014620', 1232, 50, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.018623', 1233, 50, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.021621', 1234, 50, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.025615', 1235, 50, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.029661', 1236, 50, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.032621', 1237, 51, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.036643', 1238, 51, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.039617', 1239, 51, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.042619', 1240, 51, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.046618', 1241, 51, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.049616', 1242, 51, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.052627', 1243, 52, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.055667', 1244, 52, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.058658', 1245, 52, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.061656', 1246, 52, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.064617', 1247, 52, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.067622', 1248, 52, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.070658', 1249, 53, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.073621', 1250, 53, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.075731', 1251, 53, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.078718', 1252, 53, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.081616', 1253, 53, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.084666', 1254, 53, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.086716', 1255, 54, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.089615', 1256, 54, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.092623', 1257, 54, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.095621', 1258, 54, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.097655', 1259, 54, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.100727', 1260, 54, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.103658', 1261, 55, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.106616', 1262, 55, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.108659', 1263, 55, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.111654', 1264, 55, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.114616', 1265, 55, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.118622', 1266, 55, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.121622', 1267, 56, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.124621', 1268, 56, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.127616', 1269, 56, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.129616', 1270, 56, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.132615', 1271, 56, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.136622', 1272, 56, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.138655', 1273, 57, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.142622', 1274, 57, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.145613', 1275, 57, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.148619', 1276, 57, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.151630', 1277, 57, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.154619', 1278, 57, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.157623', 1279, 58, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.160619', 1280, 58, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.163618', 1281, 58, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.167619', 1282, 58, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.170658', 1283, 58, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.173625', 1284, 58, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.176634', 1285, 59, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.180617', 1286, 59, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.184648', 1287, 59, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.187620', 1288, 59, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.190620', 1289, 59, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.193626', 1290, 59, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.196616', 1291, 60, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.200638', 1292, 60, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.204620', 1293, 60, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.206618', 1294, 60, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.209622', 1295, 60, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.213620', 1296, 60, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.216615', 1297, 61, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.220619', 1298, 61, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.223624', 1299, 61, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.226626', 1300, 61, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.229617', 1301, 61, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.233623', 1302, 61, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.236645', 1303, 62, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.239615', 1304, 62, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.243659', 1305, 62, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.246619', 1306, 62, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.249621', 1307, 62, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.252629', 1308, 62, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.255618', 1309, 63, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.257620', 1310, 63, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.260723', 1311, 63, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.263662', 1312, 63, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.266626', 1313, 63, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.269620', 1314, 63, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.271719', 1315, 64, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.274618', 1316, 64, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.277624', 1317, 64, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.279717', 1318, 64, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.283624', 1319, 64, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.286621', 1320, 64, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.289620', 1321, 65, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.292655', 1322, 65, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.295702', 1323, 65, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.297619', 1324, 65, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.300618', 1325, 65, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.303616', 1326, 65, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.306617', 1327, 66, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.308741', 1328, 66, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.312632', 1329, 66, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.317634', 1330, 66, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.322640', 1331, 66, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.329634', 1332, 66, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.335641', 1333, 67, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.339626', 1334, 67, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.342636', 1335, 67, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.346633', 1336, 67, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.349615', 1337, 67, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.353618', 1338, 67, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.356623', 1339, 68, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.359616', 1340, 68, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.362614', 1341, 68, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.364615', 1342, 68, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.367623', 1343, 68, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.371614', 1344, 68, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.373621', 1345, 69, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.376659', 1346, 69, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.379672', 1347, 69, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.383653', 1348, 69, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.386637', 1349, 69, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.389616', 1350, 69, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.392636', 1351, 70, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.395658', 1352, 70, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.398626', 1353, 70, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.401631', 1354, 70, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.404651', 1355, 70, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.408655', 1356, 70, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.411681', 1357, 71, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.415625', 1358, 71, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.418626', 1359, 71, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.421657', 1360, 71, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.424651', 1361, 71, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.428621', 1362, 71, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.430654', 1363, 72, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.433660', 1364, 72, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.436616', 1365, 72, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.439618', 1366, 72, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.442623', 1367, 72, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.445655', 1368, 72, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.449617', 1369, 73, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.452631', 1370, 73, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.455666', 1371, 73, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.458624', 1372, 73, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.461617', 1373, 73, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.463717', 1374, 73, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.466623', 1375, 74, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.468620', 1376, 74, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.471661', 1377, 74, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.474664', 1378, 74, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.476665', 1379, 74, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.479658', 1380, 74, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.484625', 1381, 75, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.490634', 1382, 75, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.495685', 1383, 75, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.501627', 1384, 75, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.506626', 1385, 75, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.511638', 1386, 75, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.516620', 1387, 76, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.521645', 1388, 76, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.526634', 1389, 76, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.531628', 1390, 76, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.536636', 1391, 76, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.540626', 1392, 76, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.544662', 1393, 77, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.548627', 1394, 77, NULL, 52, '', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-26 15:47:08.551627', 1395, 77, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.554660', 1396, 77, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.559620', 1397, 77, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.563615', 1398, 77, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:08.568624', 1399, 78, NULL, 52, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:08.572617', 1400, 78, NULL, 52, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:08.576618', 1401, 78, NULL, 52, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:08.579618', 1402, 78, NULL, 52, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:08.582616', 1403, 78, NULL, 52, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:08.586685', 1404, 78, NULL, 52, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.465625', 1405, 1, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.470621', 1406, 1, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.473621', 1407, 1, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.477628', 1408, 1, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.480618', 1409, 1, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.483630', 1410, 1, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.487615', 1411, 2, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.490619', 1412, 2, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.494627', 1413, 2, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.497616', 1414, 2, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.500625', 1415, 2, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.504617', 1416, 2, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.508635', 1417, 3, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.512623', 1418, 3, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.515620', 1419, 3, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.519617', 1420, 3, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.522622', 1421, 3, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.525621', 1422, 3, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.528615', 1423, 4, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.531658', 1424, 4, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.534619', 1425, 4, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.537619', 1426, 4, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.540618', 1427, 4, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.543615', 1428, 4, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.546622', 1429, 5, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.549636', 1430, 5, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.552657', 1431, 5, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.556620', 1432, 5, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.559623', 1433, 5, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.562617', 1434, 5, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.566617', 1435, 6, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.570616', 1436, 6, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.573618', 1437, 6, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.577620', 1438, 6, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.580617', 1439, 6, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.584619', 1440, 6, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.587627', 1441, 7, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.590616', 1442, 7, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.594622', 1443, 7, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.597619', 1444, 7, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.600622', 1445, 7, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.604622', 1446, 7, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.608625', 1447, 8, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.611618', 1448, 8, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.614621', 1449, 8, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.617637', 1450, 8, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.619635', 1451, 8, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.621619', 1452, 8, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.624626', 1453, 9, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.627615', 1454, 9, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.629635', 1455, 9, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.632618', 1456, 9, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.635635', 1457, 9, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.637614', 1458, 9, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.640616', 1459, 10, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.643634', 1460, 10, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.645635', 1461, 10, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.659723', 1462, 10, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.662637', 1463, 10, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.665622', 1464, 10, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.668617', 1465, 11, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.671616', 1466, 11, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.674624', 1467, 11, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.677653', 1468, 11, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.680617', 1469, 11, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.683635', 1470, 11, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.686618', 1471, 12, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.689623', 1472, 12, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.692618', 1473, 12, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.695656', 1474, 12, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.698622', 1475, 12, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.702647', 1476, 12, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.705619', 1477, 13, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.708631', 1478, 13, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.712615', 1479, 13, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.715660', 1480, 13, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.719625', 1481, 13, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.721615', 1482, 13, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.725621', 1483, 14, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.728618', 1484, 14, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.731624', 1485, 14, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.735636', 1486, 14, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.738617', 1487, 14, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.741624', 1488, 14, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.745661', 1489, 15, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.748619', 1490, 15, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.752684', 1491, 15, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.755626', 1492, 15, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.758620', 1493, 15, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.761656', 1494, 15, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.764659', 1495, 16, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.768627', 1496, 16, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.771617', 1497, 16, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.774624', 1498, 16, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.777625', 1499, 16, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.780618', 1500, 16, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.783623', 1501, 17, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.786719', 1502, 17, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.789626', 1503, 17, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.792626', 1504, 17, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.795621', 1505, 17, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.797616', 1506, 17, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.800713', 1507, 18, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.803717', 1508, 18, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.805618', 1509, 18, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.809616', 1510, 18, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.811717', 1511, 18, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.814624', 1512, 18, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.817623', 1513, 19, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.819719', 1514, 19, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.822614', 1515, 19, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.825678', 1516, 19, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.828619', 1517, 19, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.830616', 1518, 19, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.833679', 1519, 20, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.835617', 1520, 20, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.838615', 1521, 20, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.841626', 1522, 20, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.844619', 1523, 20, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.846617', 1524, 20, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.849626', 1525, 21, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.852705', 1526, 21, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.855617', 1527, 21, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.857619', 1528, 21, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.860717', 1529, 21, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.863618', 1530, 21, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.866626', 1531, 22, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.869654', 1532, 22, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.872630', 1533, 22, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.874672', 1534, 22, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.877649', 1535, 22, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.880617', 1536, 22, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.883636', 1537, 23, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.886658', 1538, 23, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.889627', 1539, 23, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.892626', 1540, 23, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.895658', 1541, 23, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.898624', 1542, 23, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.901623', 1543, 24, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.905623', 1544, 24, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.908624', 1545, 24, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.912620', 1546, 24, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.916627', 1547, 24, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.919620', 1548, 24, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.922633', 1549, 25, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.926639', 1550, 25, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.929659', 1551, 25, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.932673', 1552, 25, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.936621', 1553, 25, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.939619', 1554, 25, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.942618', 1555, 26, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.945655', 1556, 26, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.949624', 1557, 26, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.952662', 1558, 26, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.955621', 1559, 26, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.958617', 1560, 26, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.961618', 1561, 27, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.964618', 1562, 27, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.968644', 1563, 27, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.971617', 1564, 27, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.974622', 1565, 27, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.978620', 1566, 27, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.981624', 1567, 28, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:09.984670', 1568, 28, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:09.987643', 1569, 28, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:09.990616', 1570, 28, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:09.994638', 1571, 28, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:09.996623', 1572, 28, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:09.999714', 1573, 29, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.002656', 1574, 29, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.005620', 1575, 29, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.008665', 1576, 29, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.011618', 1577, 29, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.013615', 1578, 29, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.016714', 1579, 30, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.019659', 1580, 30, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.021618', 1581, 30, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.024713', 1582, 30, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.027616', 1583, 30, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.030621', 1584, 30, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.033622', 1585, 31, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.035717', 1586, 31, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.037616', 1587, 31, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.040620', 1588, 31, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.043720', 1589, 31, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.045718', 1590, 31, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.048665', 1591, 32, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.051618', 1592, 32, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.054614', 1593, 32, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.057624', 1594, 32, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.060620', 1595, 32, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.062615', 1596, 32, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.065619', 1597, 33, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.069624', 1598, 33, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.073623', 1599, 33, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.077684', 1600, 33, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.082675', 1601, 33, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.087627', 1602, 33, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.092626', 1603, 34, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.096619', 1604, 34, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.099673', 1605, 34, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.103623', 1606, 34, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.106623', 1607, 34, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.109633', 1608, 34, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.111620', 1609, 35, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.121618', 1610, 35, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.125621', 1611, 35, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.129618', 1612, 35, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.132616', 1613, 35, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.136619', 1614, 35, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.138618', 1615, 36, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.141664', 1616, 36, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.145618', 1617, 36, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.148619', 1618, 36, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.151623', 1619, 36, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.154617', 1620, 36, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.157636', 1621, 37, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.160620', 1622, 37, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.162614', 1623, 37, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.166623', 1624, 37, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.169620', 1625, 37, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.172619', 1626, 37, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.175623', 1627, 38, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.178617', 1628, 38, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.181617', 1629, 38, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.185637', 1630, 38, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.187615', 1631, 38, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.191646', 1632, 38, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.194624', 1633, 39, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.196620', 1634, 39, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.199617', 1635, 39, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.202619', 1636, 39, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.205622', 1637, 39, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.207620', 1638, 39, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.210618', 1639, 40, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.213616', 1640, 40, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.215664', 1641, 40, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.218616', 1642, 40, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.220650', 1643, 40, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.223618', 1644, 40, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.226617', 1645, 41, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.228613', 1646, 41, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.230617', 1647, 41, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.232623', 1648, 41, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.235647', 1649, 41, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.237616', 1650, 41, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.239616', 1651, 42, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.242619', 1652, 42, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.244646', 1653, 42, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.246616', 1654, 42, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.249622', 1655, 42, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.252618', 1656, 42, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.254655', 1657, 43, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.256657', 1658, 43, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.259733', 1659, 43, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.262751', 1660, 43, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.265628', 1661, 43, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.268621', 1662, 43, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.270718', 1663, 44, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.273619', 1664, 44, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.275667', 1665, 44, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.278654', 1666, 44, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.280619', 1667, 44, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.283622', 1668, 44, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.286657', 1669, 45, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.289619', 1670, 45, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.293622', 1671, 45, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.295656', 1672, 45, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.299628', 1673, 45, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.302617', 1674, 45, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.305636', 1675, 46, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.308628', 1676, 46, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.311621', 1677, 46, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.314620', 1678, 46, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.318626', 1679, 46, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.321622', 1680, 46, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.324622', 1681, 47, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.328623', 1682, 47, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.332618', 1683, 47, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.336614', 1684, 47, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.338628', 1685, 47, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.341668', 1686, 47, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.345616', 1687, 48, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.349619', 1688, 48, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.353616', 1689, 48, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.355640', 1690, 48, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.358624', 1691, 48, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.361617', 1692, 48, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.365619', 1693, 49, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.368621', 1694, 49, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.371616', 1695, 49, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.374647', 1696, 49, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.377617', 1697, 49, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.380625', 1698, 49, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.383619', 1699, 50, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.386654', 1700, 50, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.389659', 1701, 50, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.392673', 1702, 50, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.395620', 1703, 50, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.397615', 1704, 50, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.401620', 1705, 51, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.403717', 1706, 51, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.405618', 1707, 51, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.409620', 1708, 51, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.412634', 1709, 51, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.416689', 1710, 51, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.421630', 1711, 52, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.426657', 1712, 52, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.431625', 1713, 52, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.435629', 1714, 52, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.440636', 1715, 52, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.444630', 1716, 52, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.450626', 1717, 53, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.454638', 1718, 53, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.459639', 1719, 53, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.463641', 1720, 53, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.468627', 1721, 53, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.471620', 1722, 53, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.475670', 1723, 54, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.478618', 1724, 54, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.481672', 1725, 54, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.485626', 1726, 54, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.488621', 1727, 54, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.491634', 1728, 54, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.494621', 1729, 55, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.497618', 1730, 55, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.500621', 1731, 55, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.503618', 1732, 55, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.505621', 1733, 55, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.508619', 1734, 55, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.512615', 1735, 56, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.515626', 1736, 56, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.518625', 1737, 56, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.520652', 1738, 56, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.524642', 1739, 56, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.527617', 1740, 56, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.530623', 1741, 57, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.534619', 1742, 57, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.537616', 1743, 57, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.540617', 1744, 57, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.544615', 1745, 57, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.547622', 1746, 57, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.549669', 1747, 58, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.553624', 1748, 58, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.556617', 1749, 58, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.560632', 1750, 58, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.564621', 1751, 58, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.567620', 1752, 58, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.571618', 1753, 59, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.575619', 1754, 59, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.578617', 1755, 59, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.582629', 1756, 59, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.585640', 1757, 59, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.589662', 1758, 59, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.593642', 1759, 60, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.595657', 1760, 60, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.598653', 1761, 60, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.601671', 1762, 60, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.604615', 1763, 60, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.607618', 1764, 60, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.610635', 1765, 61, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.612636', 1766, 61, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.615624', 1767, 61, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.618616', 1768, 61, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.620641', 1769, 61, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.622616', 1770, 61, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.625619', 1771, 62, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.627614', 1772, 62, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.629615', 1773, 62, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.633623', 1774, 62, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.635634', 1775, 62, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.640621', 1776, 62, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.644634', 1777, 63, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.649626', 1778, 63, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.654626', 1779, 63, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.659634', 1780, 63, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.663642', 1781, 63, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.668623', 1782, 63, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.673621', 1783, 64, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.677621', 1784, 64, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.681619', 1785, 64, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.685621', 1786, 64, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.687660', 1787, 64, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.691631', 1788, 64, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.694616', 1789, 65, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.697617', 1790, 65, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.700628', 1791, 65, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.702617', 1792, 65, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.705616', 1793, 65, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.709620', 1794, 65, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.711616', 1795, 66, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.715618', 1796, 66, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.718618', 1797, 66, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.720617', 1798, 66, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.723618', 1799, 66, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.727618', 1800, 66, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.730624', 1801, 67, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.732617', 1802, 67, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.735618', 1803, 67, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.738618', 1804, 67, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.741624', 1805, 67, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.744616', 1806, 67, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.746617', 1807, 68, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.750627', 1808, 68, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.752614', 1809, 68, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.755629', 1810, 68, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.758626', 1811, 68, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.761618', 1812, 68, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.764622', 1813, 69, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.768630', 1814, 69, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.770654', 1815, 69, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.773618', 1816, 69, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.777619', 1817, 69, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.779619', 1818, 69, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.782624', 1819, 70, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.786620', 1820, 70, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.789621', 1821, 70, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.792637', 1822, 70, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.795657', 1823, 70, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.798655', 1824, 70, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.802620', 1825, 71, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.804616', 1826, 71, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.807617', 1827, 71, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.811635', 1828, 71, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.816633', 1829, 71, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.820630', 1830, 71, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.824624', 1831, 72, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.827618', 1832, 72, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.831624', 1833, 72, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.835623', 1834, 72, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.841631', 1835, 72, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.845667', 1836, 72, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.848630', 1837, 73, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.852622', 1838, 73, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.855620', 1839, 73, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.858624', 1840, 73, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.860618', 1841, 73, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.863618', 1842, 73, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.866629', 1843, 74, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.869717', 1844, 74, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.872676', 1845, 74, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.875621', 1846, 74, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.878657', 1847, 74, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.882620', 1848, 74, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.885616', 1849, 75, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.888619', 1850, 75, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.891633', 1851, 75, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.894618', 1852, 75, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.897615', 1853, 75, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.900676', 1854, 75, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.902618', 1855, 76, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.905620', 1856, 76, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.909694', 1857, 76, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.911651', 1858, 76, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.914654', 1859, 76, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.918622', 1860, 76, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.920657', 1861, 77, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.923632', 1862, 77, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.926620', 1863, 77, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.928655', 1864, 77, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.932642', 1865, 77, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.935617', 1866, 77, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:47:10.938617', 1867, 78, NULL, 53, '', NULL, ''),
(b'1', 2, '2024-06-26 15:47:10.941660', 1868, 78, NULL, 53, '', NULL, ''),
(b'1', 3, '2024-06-26 15:47:10.944616', 1869, 78, NULL, 53, '', NULL, ''),
(b'1', 4, '2024-06-26 15:47:10.947618', 1870, 78, NULL, 53, '', NULL, ''),
(b'1', 5, '2024-06-26 15:47:10.950691', 1871, 78, NULL, 53, '', NULL, ''),
(b'1', 6, '2024-06-26 15:47:10.953615', 1872, 78, NULL, 53, '', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.230856', 1873, 1, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.377859', 1874, 1, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.380136', 1875, 1, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.382862', 1876, 1, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.385105', 1877, 1, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.387858', 1878, 1, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.389865', 1879, 2, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.392856', 1880, 2, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.395136', 1881, 2, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.397857', 1882, 2, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.400097', 1883, 2, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.402863', 1884, 2, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.404858', 1885, 3, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.407857', 1886, 3, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.410928', 1887, 3, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.413857', 1888, 3, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.416854', 1889, 3, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.418855', 1890, 3, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.420859', 1891, 4, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.423856', 1892, 4, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.426128', 1893, 4, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.428854', 1894, 4, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.430856', 1895, 4, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.433855', 1896, 4, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.436121', 1897, 5, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.437855', 1898, 5, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.441856', 1899, 5, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.444167', 1900, 5, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.447859', 1901, 5, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.450858', 1902, 5, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.453858', 1903, 6, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.455857', 1904, 6, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.458860', 1905, 6, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.461153', 1906, 6, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.463855', 1907, 6, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.466855', 1908, 6, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.468854', 1909, 7, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.471168', 1910, 7, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.473856', 1911, 7, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.476177', 1912, 7, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.479208', 1913, 7, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.481860', 1914, 7, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.484165', 1915, 8, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.487143', 1916, 8, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.489854', 1917, 8, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.492879', 1918, 8, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.495858', 1919, 8, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.497858', 1920, 8, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.501190', 1921, 9, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.503996', 1922, 9, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.506860', 1923, 9, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.509178', 1924, 9, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.512079', 1925, 9, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.513857', 1926, 9, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.517168', 1927, 10, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.520022', 1928, 10, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.522857', 1929, 10, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.525096', 1930, 10, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.527857', 1931, 10, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.530176', 1932, 10, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.532858', 1933, 11, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.535168', 1934, 11, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.537854', 1935, 11, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.539859', 1936, 11, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.542862', 1937, 11, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.545220', 1938, 11, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.547860', 1939, 12, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.550858', 1940, 12, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.552860', 1941, 12, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.554880', 1942, 12, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.558860', 1943, 12, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.560855', 1944, 12, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.562855', 1945, 13, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.565857', 1946, 13, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.569160', 1947, 13, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.571977', 1948, 13, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.575102', 1949, 13, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.577856', 1950, 13, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.579894', 1951, 14, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.582863', 1952, 14, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.584854', 1953, 14, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.587165', 1954, 14, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.589863', 1955, 14, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.592161', 1956, 14, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.595147', 1957, 15, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.597862', 1958, 15, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.601020', 1959, 15, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.603862', 1960, 15, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.605856', 1961, 15, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.609200', 1962, 15, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.612139', 1963, 16, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.614865', 1964, 16, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.617855', 1965, 16, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.620171', 1966, 16, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.622857', 1967, 16, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.625857', 1968, 16, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.627857', 1969, 17, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.629856', 1970, 17, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.631859', 1971, 17, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.633858', 1972, 17, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.635854', 1973, 17, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.638856', 1974, 17, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.640944', 1975, 18, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.642854', 1976, 18, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.646085', 1977, 18, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.648856', 1978, 18, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.651162', 1979, 18, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.654214', 1980, 18, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.656883', 1981, 19, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.659862', 1982, 19, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.662165', 1983, 19, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.664856', 1984, 19, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.667860', 1985, 19, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.670184', 1986, 19, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.672856', 1987, 20, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.675163', 1988, 20, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.677858', 1989, 20, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.680175', 1990, 20, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.682856', 1991, 20, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.685893', 1992, 20, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.688863', 1993, 21, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.691855', 1994, 21, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.694196', 1995, 21, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.697021', 1996, 21, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.700099', 1997, 21, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.702862', 1998, 21, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.705182', 1999, 22, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.707856', 2000, 22, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.711196', 2001, 22, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.713974', 2002, 22, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.716999', 2003, 22, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.719153', 2004, 22, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.722135', 2005, 23, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.725094', 2006, 23, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.727160', 2007, 23, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.730091', 2008, 23, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.732856', 2009, 23, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.735863', 2010, 23, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.737855', 2011, 24, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.740904', 2012, 24, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.743860', 2013, 24, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.746176', 2014, 24, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.748859', 2015, 24, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.751165', 2016, 24, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.753998', 2017, 25, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.756859', 2018, 25, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.759159', 2019, 25, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.761985', 2020, 25, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.764873', 2021, 25, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.767176', 2022, 25, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.770134', 2023, 26, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.772858', 2024, 26, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.775885', 2025, 26, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.778861', 2026, 26, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.780857', 2027, 26, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.783897', 2028, 26, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.785896', 2029, 27, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.787857', 2030, 27, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.790856', 2031, 27, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.794105', 2032, 27, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.797006', 2033, 27, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.799859', 2034, 27, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.802892', 2035, 28, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.805857', 2036, 28, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.808858', 2037, 28, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.811194', 2038, 28, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.813858', 2039, 28, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.816872', 2040, 28, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.818978', 2041, 29, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.821856', 2042, 29, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.823859', 2043, 29, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.826853', 2044, 29, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.829114', 2045, 29, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.831870', 2046, 29, NULL, 54, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 1, '2024-06-26 15:51:01.834856', 2047, 30, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.836854', 2048, 30, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.840857', 2049, 30, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.842855', 2050, 30, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.844959', 2051, 30, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.847860', 2052, 30, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.849922', 2053, 31, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.852855', 2054, 31, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.854859', 2055, 31, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.857857', 2056, 31, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.860859', 2057, 31, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.862856', 2058, 31, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.864857', 2059, 32, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.867855', 2060, 32, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.870853', 2061, 32, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.872856', 2062, 32, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.875855', 2063, 32, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.877855', 2064, 32, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.879854', 2065, 33, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.882860', 2066, 33, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.884853', 2067, 33, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.886854', 2068, 33, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.888855', 2069, 33, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.892856', 2070, 33, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.895131', 2071, 34, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.897857', 2072, 34, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.900985', 2073, 34, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.902854', 2074, 34, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.904854', 2075, 34, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.907854', 2076, 34, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.910894', 2077, 35, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.912854', 2078, 35, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.914855', 2079, 35, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.917857', 2080, 35, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.920854', 2081, 35, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.922856', 2082, 35, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.925095', 2083, 36, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.941891', 2084, 36, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.944196', 2085, 36, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.947023', 2086, 36, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.950043', 2087, 36, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.951907', 2088, 36, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.954910', 2089, 37, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.957860', 2090, 37, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.960206', 2091, 37, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.962903', 2092, 37, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.965857', 2093, 37, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.967855', 2094, 37, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.971125', 2095, 38, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.973865', 2096, 38, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.976202', 2097, 38, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.979017', 2098, 38, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.980856', 2099, 38, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.983855', 2100, 38, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:01.985893', 2101, 39, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:01.987855', 2102, 39, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:01.991092', 2103, 39, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:01.993858', 2104, 39, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:01.996164', 2105, 39, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:01.998856', 2106, 39, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.001174', 2107, 40, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.004054', 2108, 40, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.006858', 2109, 40, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.009188', 2110, 40, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.011997', 2111, 40, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.013856', 2112, 40, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.017160', 2113, 41, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.019939', 2114, 41, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.022866', 2115, 41, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.025002', 2116, 41, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.026854', 2117, 41, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.030201', 2118, 41, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.032854', 2119, 42, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.035162', 2120, 42, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.037858', 2121, 42, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.039881', 2122, 42, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.042854', 2123, 42, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.043855', 2124, 42, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.046856', 2125, 43, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.049855', 2126, 43, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.052192', 2127, 43, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.054857', 2128, 43, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.057857', 2129, 43, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.059896', 2130, 43, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.062859', 2131, 44, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.064857', 2132, 44, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.066856', 2133, 44, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.068856', 2134, 44, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.071857', 2135, 44, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.074917', 2136, 44, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.077162', 2137, 45, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.080220', 2138, 45, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.082856', 2139, 45, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.085171', 2140, 45, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.087860', 2141, 45, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.089855', 2142, 45, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.092862', 2143, 46, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.095173', 2144, 46, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.097857', 2145, 46, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.100169', 2146, 46, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.102862', 2147, 46, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.105168', 2148, 46, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.107856', 2149, 47, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.111088', 2150, 47, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.113858', 2151, 47, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.116858', 2152, 47, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.119153', 2153, 47, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.122039', 2154, 47, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.124856', 2155, 48, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.127856', 2156, 48, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.130191', 2157, 48, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.132860', 2158, 48, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.135184', 2159, 48, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.137857', 2160, 48, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.139933', 2161, 49, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.142862', 2162, 49, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.145173', 2163, 49, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.147857', 2164, 49, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.150178', 2165, 49, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.152863', 2166, 49, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.155164', 2167, 50, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.157896', 2168, 50, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.160169', 2169, 50, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.162862', 2170, 50, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.164890', 2171, 50, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.167859', 2172, 50, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.170184', 2173, 51, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.172857', 2174, 51, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.175175', 2175, 51, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.177858', 2176, 51, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.180202', 2177, 51, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.182858', 2178, 51, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.184896', 2179, 52, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.186895', 2180, 52, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.189874', 2181, 52, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.192170', 2182, 52, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.194965', 2183, 52, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.196857', 2184, 52, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.200200', 2185, 53, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.202862', 2186, 53, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.205156', 2187, 53, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.207856', 2188, 53, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.210936', 2189, 53, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.213856', 2190, 53, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.216984', 2191, 54, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.219174', 2192, 54, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.222022', 2193, 54, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.225146', 2194, 54, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.227857', 2195, 54, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.230214', 2196, 54, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.232855', 2197, 55, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.235183', 2198, 55, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.237859', 2199, 55, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.239857', 2200, 55, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.242169', 2201, 55, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.245211', 2202, 55, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.247868', 2203, 56, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.250166', 2204, 56, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.252863', 2205, 56, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.255173', 2206, 56, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.257856', 2207, 56, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.260166', 2208, 56, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.262858', 2209, 57, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.264920', 2210, 57, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.267860', 2211, 57, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.270182', 2212, 57, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.272870', 2213, 57, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.275866', 2214, 57, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.278859', 2215, 58, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.280859', 2216, 58, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.284209', 2217, 58, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.286906', 2218, 58, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.289904', 2219, 58, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.292165', 2220, 58, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.295194', 2221, 59, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.297865', 2222, 59, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.300915', 2223, 59, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.303860', 2224, 59, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.305859', 2225, 59, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.309194', 2226, 59, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.311964', 2227, 60, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.314859', 2228, 60, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.317174', 2229, 60, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.320021', 2230, 60, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.321855', 2231, 60, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.325174', 2232, 60, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.327857', 2233, 61, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.330229', 2234, 61, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.332856', 2235, 61, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.335173', 2236, 61, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.337860', 2237, 61, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.340859', 2238, 61, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.342879', 2239, 62, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.345157', 2240, 62, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.347864', 2241, 62, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.350948', 2242, 62, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.353863', 2243, 62, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.355856', 2244, 62, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.359214', 2245, 63, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.362006', 2246, 63, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.364896', 2247, 63, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.367182', 2248, 63, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.370112', 2249, 63, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.372861', 2250, 63, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.375862', 2251, 64, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.377854', 2252, 64, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.380181', 2253, 64, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.382857', 2254, 64, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.385856', 2255, 64, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.387859', 2256, 64, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.389860', 2257, 65, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.392854', 2258, 65, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.395176', 2259, 65, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.397861', 2260, 65, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.400859', 2261, 65, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.402861', 2262, 65, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.404854', 2263, 66, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.407856', 2264, 66, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.410863', 2265, 66, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.413861', 2266, 66, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.416856', 2267, 66, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.419191', 2268, 66, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.421900', 2269, 67, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.425006', 2270, 67, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.427166', 2271, 67, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.430095', 2272, 67, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.432856', 2273, 67, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.435163', 2274, 67, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.437855', 2275, 68, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.439855', 2276, 68, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.441858', 2277, 68, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.444853', 2278, 68, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.446855', 2279, 68, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.449098', 2280, 68, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.451854', 2281, 69, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.454170', 2282, 69, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.456860', 2283, 69, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.459162', 2284, 69, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.461854', 2285, 69, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.463857', 2286, 69, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.466855', 2287, 70, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.469169', 2288, 70, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.471866', 2289, 70, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.474858', 2290, 70, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.476854', 2291, 70, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.479184', 2292, 70, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.481859', 2293, 71, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.484177', 2294, 71, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.487028', 2295, 71, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.489860', 2296, 71, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.492169', 2297, 71, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.494976', 2298, 71, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.497909', 2299, 72, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.500164', 2300, 72, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.512853', 2301, 72, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.515871', 2302, 72, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.517854', 2303, 72, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.519901', 2304, 72, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.521855', 2305, 73, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.524859', 2306, 73, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.527219', 2307, 73, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.530015', 2308, 73, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.532857', 2309, 73, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.535158', 2310, 73, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.537856', 2311, 74, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.541044', 2312, 74, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.542855', 2313, 74, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.546103', 2314, 74, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.548856', 2315, 74, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.551165', 2316, 74, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.554083', 2317, 75, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.557861', 2318, 75, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.559859', 2319, 75, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.561854', 2320, 75, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.564861', 2321, 75, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.567183', 2322, 75, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.570127', 2323, 76, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.572865', 2324, 76, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.575168', 2325, 76, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.577857', 2326, 76, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.580126', 2327, 76, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.582858', 2328, 76, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.585856', 2329, 77, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.587854', 2330, 77, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.590855', 2331, 77, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.592894', 2332, 77, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.595858', 2333, 77, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.598857', 2334, 77, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:02.600853', 2335, 78, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:02.602908', 2336, 78, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:02.605861', 2337, 78, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:02.607893', 2338, 78, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:02.610170', 2339, 78, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:02.612862', 2340, 78, NULL, 54, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.039570', 2341, 1, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.041612', 2342, 1, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.044571', 2343, 1, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.047572', 2344, 1, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.049671', 2345, 1, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.052574', 2346, 1, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.056609', 2347, 2, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.060572', 2348, 2, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.065574', 2349, 2, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.067571', 2350, 2, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.070576', 2351, 2, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.073568', 2352, 2, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.076571', 2353, 3, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.078575', 2354, 3, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.081852', 2355, 3, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.084570', 2356, 3, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.088587', 2357, 3, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.091572', 2358, 3, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.093570', 2359, 4, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.096575', 2360, 4, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.099570', 2361, 4, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.101615', 2362, 4, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.105573', 2363, 4, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.107571', 2364, 4, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.109570', 2365, 5, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.112571', 2366, 5, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.115571', 2367, 5, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.117570', 2368, 5, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.120573', 2369, 5, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.123852', 2370, 5, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.126616', 2371, 6, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.129578', 2372, 6, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.132577', 2373, 6, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.135573', 2374, 6, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.138580', 2375, 6, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.141570', 2376, 6, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.143572', 2377, 7, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.146592', 2378, 7, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.148844', 2379, 7, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.151673', 2380, 7, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.154628', 2381, 7, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.156763', 2382, 7, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.159731', 2383, 8, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.163578', 2384, 8, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.165851', 2385, 8, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.168576', 2386, 8, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.171630', 2387, 8, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.174728', 2388, 8, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.177576', 2389, 9, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.180570', 2390, 9, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.182741', 2391, 9, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.185578', 2392, 9, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.188783', 2393, 9, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.190850', 2394, 9, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.193576', 2395, 10, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.196598', 2396, 10, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.199730', 2397, 10, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.202573', 2398, 10, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.205573', 2399, 10, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.207611', 2400, 10, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.209852', 2401, 11, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.212646', 2402, 11, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.215576', 2403, 11, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.218574', 2404, 11, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.221618', 2405, 11, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.223852', 2406, 11, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.226690', 2407, 12, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.230651', 2408, 12, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.233576', 2409, 12, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.235570', 2410, 12, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.238580', 2411, 12, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.240875', 2412, 12, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.243576', 2413, 13, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.246903', 2414, 13, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.249753', 2415, 13, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.252570', 2416, 13, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.255576', 2417, 13, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.257616', 2418, 13, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.260580', 2419, 14, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.263569', 2420, 14, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.265571', 2421, 14, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.267615', 2422, 14, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.270573', 2423, 14, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.272788', 2424, 14, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.275721', 2425, 15, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.277573', 2426, 15, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.280917', 2427, 15, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.283726', 2428, 15, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.286573', 2429, 15, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.288897', 2430, 15, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.291784', 2431, 16, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.294580', 2432, 16, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.296876', 2433, 16, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.299899', 2434, 16, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.302577', 2435, 16, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.304882', 2436, 16, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.307636', 2437, 17, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.310572', 2438, 17, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.313571', 2439, 17, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.315568', 2440, 17, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.317569', 2441, 17, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.319579', 2442, 17, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.322804', 2443, 18, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.325616', 2444, 18, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.328625', 2445, 18, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.330570', 2446, 18, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.333615', 2447, 18, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.335571', 2448, 18, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.338795', 2449, 19, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.341601', 2450, 19, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.344617', 2451, 19, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.346887', 2452, 19, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.349571', 2453, 19, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.351846', 2454, 19, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.354571', 2455, 20, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.357578', 2456, 20, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.359876', 2457, 20, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.362578', 2458, 20, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.365591', 2459, 20, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.367611', 2460, 20, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.371572', 2461, 21, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.373929', 2462, 21, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.376575', 2463, 21, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.379572', 2464, 21, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.381571', 2465, 21, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.383570', 2466, 21, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.386575', 2467, 22, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.389659', 2468, 22, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.391572', 2469, 22, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.394573', 2470, 22, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.397570', 2471, 22, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.399836', 2472, 22, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.401729', 2473, 23, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.404572', 2474, 23, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.407571', 2475, 23, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.409637', 2476, 23, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.412570', 2477, 23, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.414838', 2478, 23, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.417571', 2479, 24, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.419574', 2480, 24, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.422677', 2481, 24, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.424832', 2482, 24, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.426568', 2483, 24, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.429806', 2484, 24, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.431835', 2485, 25, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.433526', 2486, 25, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.436660', 2487, 25, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.439567', 2488, 25, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.441525', 2489, 25, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.443529', 2490, 25, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.446528', 2491, 26, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.449526', 2492, 26, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.451530', 2493, 26, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.453533', 2494, 26, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.456529', 2495, 26, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.458841', 2496, 26, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.461530', 2497, 27, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.463854', 2498, 27, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.466534', 2499, 27, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.468527', 2500, 27, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.471857', 2501, 27, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.474647', 2502, 27, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.476639', 2503, 28, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.479847', 2504, 28, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.482821', 2505, 28, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.485529', 2506, 28, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.488528', 2507, 28, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.490865', 2508, 28, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.493527', 2509, 29, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.496529', 2510, 29, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.498839', 2511, 29, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.501761', 2512, 29, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.504576', 2513, 29, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.506838', 2514, 29, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.509527', 2515, 30, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.512530', 2516, 30, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.514855', 2517, 30, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.517527', 2518, 30, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.519535', 2519, 30, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.522528', 2520, 30, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.524531', 2521, 31, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.526704', 2522, 31, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.529852', 2523, 31, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.532640', 2524, 31, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.534844', 2525, 31, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.537537', 2526, 31, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.540532', 2527, 32, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.543530', 2528, 32, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.546527', 2529, 32, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.548856', 2530, 32, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.551654', 2531, 32, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.554528', 2532, 32, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.556533', 2533, 33, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.559527', 2534, 33, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.561535', 2535, 33, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.564526', 2536, 33, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.566782', 2537, 33, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.568531', 2538, 33, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.571789', 2539, 34, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.573528', 2540, 34, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.576527', 2541, 34, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.580526', 2542, 34, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.582822', 2543, 34, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.585528', 2544, 34, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.588567', 2545, 35, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.591532', 2546, 35, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.593528', 2547, 35, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.596902', 2548, 35, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.599768', 2549, 35, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.602537', 2550, 35, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.604834', 2551, 36, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.607649', 2552, 36, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.609526', 2553, 36, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.612805', 2554, 36, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.615767', 2555, 36, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.618535', 2556, 36, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.620621', 2557, 37, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.623690', 2558, 37, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.625857', 2559, 37, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.628736', 2560, 37, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.631760', 2561, 37, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.634809', 2562, 37, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.637526', 2563, 38, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.639847', 2564, 38, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.642746', 2565, 38, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.645607', 2566, 38, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.647527', 2567, 38, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.650548', 2568, 38, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.652526', 2569, 39, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.655894', 2570, 39, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.658605', 2571, 39, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.661531', 2572, 39, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.663868', 2573, 39, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.666743', 2574, 39, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.669527', 2575, 40, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.671857', 2576, 40, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.674756', 2577, 40, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.676527', 2578, 40, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.679845', 2579, 40, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.682816', 2580, 40, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.684527', 2581, 41, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.687527', 2582, 41, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.690535', 2583, 41, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.692767', 2584, 41, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.695533', 2585, 41, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.697527', 2586, 41, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.700532', 2587, 42, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.703526', 2588, 42, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.705884', 2589, 42, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.708744', 2590, 42, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.711526', 2591, 42, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.713852', 2592, 42, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.716647', 2593, 43, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.719533', 2594, 43, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.721566', 2595, 43, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.723566', 2596, 43, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.726594', 2597, 43, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.729529', 2598, 43, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.731829', 2599, 44, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.734649', 2600, 44, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.737486', 2601, 44, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.739759', 2602, 44, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.742646', 2603, 44, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.745523', 2604, 44, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.747477', 2605, 45, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.750613', 2606, 45, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.753566', 2607, 45, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.756462', 2608, 45, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.758769', 2609, 45, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.761460', 2610, 45, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.763769', 2611, 46, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.766598', 2612, 46, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.769459', 2613, 46, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.771772', 2614, 46, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.774593', 2615, 46, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.776457', 2616, 46, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.779454', 2617, 47, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.782454', 2618, 47, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.783456', 2619, 47, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.786458', 2620, 47, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.788476', 2621, 47, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.790476', 2622, 47, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.792475', 2623, 48, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.794455', 2624, 48, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.796476', 2625, 48, NULL, 55, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 4, '2024-06-26 15:51:08.798476', 2626, 48, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.800475', 2627, 48, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.802461', 2628, 48, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.805509', 2629, 49, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.808461', 2630, 49, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.810459', 2631, 49, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.813559', 2632, 49, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.815772', 2633, 49, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.818456', 2634, 49, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.820758', 2635, 50, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.823664', 2636, 50, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.826457', 2637, 50, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.828662', 2638, 50, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.831515', 2639, 50, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.834039', 2640, 50, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.836718', 2641, 51, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.838765', 2642, 51, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.841713', 2643, 51, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.843709', 2644, 51, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.846875', 2645, 51, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.849799', 2646, 51, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.852707', 2647, 52, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.855066', 2648, 52, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.857717', 2649, 52, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.859853', 2650, 52, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.862708', 2651, 52, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.865041', 2652, 52, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.867715', 2653, 53, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.870709', 2654, 53, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.872799', 2655, 53, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.875016', 2656, 53, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.877712', 2657, 53, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.880022', 2658, 53, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.882795', 2659, 54, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.884710', 2660, 54, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.887747', 2661, 54, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.890010', 2662, 54, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.892793', 2663, 54, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.896070', 2664, 54, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.898885', 2665, 55, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.901711', 2666, 55, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.904710', 2667, 55, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.907732', 2668, 55, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.909850', 2669, 55, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.912772', 2670, 55, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.915047', 2671, 56, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.917707', 2672, 56, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.920714', 2673, 56, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.922709', 2674, 56, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.924747', 2675, 56, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.927712', 2676, 56, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.930051', 2677, 57, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.932796', 2678, 57, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.934710', 2679, 57, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.937710', 2680, 57, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.940732', 2681, 57, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.942707', 2682, 57, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.946037', 2683, 58, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.948863', 2684, 58, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.951712', 2685, 58, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.954713', 2686, 58, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.957057', 2687, 58, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.959829', 2688, 58, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.962708', 2689, 59, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.965041', 2690, 59, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.967713', 2691, 59, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.970900', 2692, 59, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.973715', 2693, 59, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.976022', 2694, 59, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.979011', 2695, 60, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.981809', 2696, 60, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.984044', 2697, 60, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:08.987012', 2698, 60, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:08.989709', 2699, 60, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:08.991707', 2700, 60, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:08.993713', 2701, 61, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:08.995979', 2702, 61, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:08.998707', 2703, 61, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.000852', 2704, 61, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.002710', 2705, 61, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.005824', 2706, 61, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.008714', 2707, 62, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.010714', 2708, 62, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.014064', 2709, 62, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.016924', 2710, 62, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.019725', 2711, 62, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.022037', 2712, 62, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.024795', 2713, 63, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.027711', 2714, 63, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.030062', 2715, 63, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.032803', 2716, 63, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.034708', 2717, 63, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.037715', 2718, 63, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.040007', 2719, 64, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.042806', 2720, 64, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.046039', 2721, 64, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.048897', 2722, 64, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.051712', 2723, 64, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.054753', 2724, 64, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.057013', 2725, 65, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.059769', 2726, 65, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.062709', 2727, 65, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.065028', 2728, 65, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.067715', 2729, 65, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.070710', 2730, 65, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.072761', 2731, 66, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.075760', 2732, 66, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.077718', 2733, 66, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.080975', 2734, 66, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.083805', 2735, 66, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.086728', 2736, 66, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.089713', 2737, 67, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.091709', 2738, 67, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.093708', 2739, 67, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.096834', 2740, 67, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.098881', 2741, 67, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.101709', 2742, 67, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.104710', 2743, 68, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.106747', 2744, 68, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.109016', 2745, 68, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.111925', 2746, 68, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.114026', 2747, 68, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.117066', 2748, 68, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.119722', 2749, 69, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.121708', 2750, 69, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.124709', 2751, 69, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.126709', 2752, 69, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.130056', 2753, 69, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.132791', 2754, 69, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.135724', 2755, 70, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.138715', 2756, 70, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.141052', 2757, 70, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.143709', 2758, 70, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.146917', 2759, 70, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.149720', 2760, 70, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.151709', 2761, 71, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.154708', 2762, 71, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.156707', 2763, 71, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.169711', 2764, 71, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.172018', 2765, 71, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.174891', 2766, 71, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.177714', 2767, 72, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.180033', 2768, 72, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.182788', 2769, 72, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.185718', 2770, 72, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.188713', 2771, 72, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.191041', 2772, 72, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.192709', 2773, 73, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.196710', 2774, 73, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.199042', 2775, 73, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.201715', 2776, 73, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.204945', 2777, 73, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.207709', 2778, 73, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.209755', 2779, 74, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.212709', 2780, 74, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.215950', 2781, 74, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.217770', 2782, 74, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.221014', 2783, 74, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.223975', 2784, 74, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.225708', 2785, 75, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.228709', 2786, 75, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.231024', 2787, 75, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.233753', 2788, 75, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.236720', 2789, 75, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.239030', 2790, 75, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.241781', 2791, 76, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.243748', 2792, 76, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.247053', 2793, 76, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.249914', 2794, 76, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.252715', 2795, 76, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.255019', 2796, 76, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.257713', 2797, 77, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.259708', 2798, 77, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.262753', 2799, 77, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.266096', 2800, 77, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.268708', 2801, 77, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.271800', 2802, 77, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:09.274714', 2803, 78, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:09.276793', 2804, 78, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:09.280119', 2805, 78, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:09.282835', 2806, 78, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:09.285792', 2807, 78, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:09.288790', 2808, 78, NULL, 55, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:16.791486', 2809, 1, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:16.955468', 2810, 1, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:16.957471', 2811, 1, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:16.960465', 2812, 1, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:16.962465', 2813, 1, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:16.964482', 2814, 1, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:16.967466', 2815, 2, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:16.969488', 2816, 2, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:16.974485', 2817, 2, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:16.979474', 2818, 2, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:16.982474', 2819, 2, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:16.985471', 2820, 2, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:16.988471', 2821, 3, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:16.991470', 2822, 3, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:16.993469', 2823, 3, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:16.995470', 2824, 3, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:16.997468', 2825, 3, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.000474', 2826, 3, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.002496', 2827, 4, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.004495', 2828, 4, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.006468', 2829, 4, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.009668', 2830, 4, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.012474', 2831, 4, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.014469', 2832, 4, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.017587', 2833, 5, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.019756', 2834, 5, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.022468', 2835, 5, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.025643', 2836, 5, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.027510', 2837, 5, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.030471', 2838, 5, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.033815', 2839, 6, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.036589', 2840, 6, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.038469', 2841, 6, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.041774', 2842, 6, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.044633', 2843, 6, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.047472', 2844, 6, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.050472', 2845, 7, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.052475', 2846, 7, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.054468', 2847, 7, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.057469', 2848, 7, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.059742', 2849, 7, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.062653', 2850, 7, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.065507', 2851, 8, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.067584', 2852, 8, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.070588', 2853, 8, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.073478', 2854, 8, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.075777', 2855, 8, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.078568', 2856, 8, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.081483', 2857, 9, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.083746', 2858, 9, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.086475', 2859, 9, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.088467', 2860, 9, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.091773', 2861, 9, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.094631', 2862, 9, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.097478', 2863, 10, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.100537', 2864, 10, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.102468', 2865, 10, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.105468', 2866, 10, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.107481', 2867, 10, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.110467', 2868, 10, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.112470', 2869, 11, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.115478', 2870, 11, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.118474', 2871, 11, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.120468', 2872, 11, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.123476', 2873, 11, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.126470', 2874, 11, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.128507', 2875, 12, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.130469', 2876, 12, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.133468', 2877, 12, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.136624', 2878, 12, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.139470', 2879, 12, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.141781', 2880, 12, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.144827', 2881, 13, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.147468', 2882, 13, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.150475', 2883, 13, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.152469', 2884, 13, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.154790', 2885, 13, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.157470', 2886, 13, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.160465', 2887, 14, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.162466', 2888, 14, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.165480', 2889, 14, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.167468', 2890, 14, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.170551', 2891, 14, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.172468', 2892, 14, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.175467', 2893, 15, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.177467', 2894, 15, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.180469', 2895, 15, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.183614', 2896, 15, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.185467', 2897, 15, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.188467', 2898, 15, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.191474', 2899, 16, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.193761', 2900, 16, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.196470', 2901, 16, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.198475', 2902, 16, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.201864', 2903, 16, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.204652', 2904, 16, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.207490', 2905, 17, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.209768', 2906, 17, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.212648', 2907, 17, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.215624', 2908, 17, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.217467', 2909, 17, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.220552', 2910, 17, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.223468', 2911, 18, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.225797', 2912, 18, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.228586', 2913, 18, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.231471', 2914, 18, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.233773', 2915, 18, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.236669', 2916, 18, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.239482', 2917, 19, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.241776', 2918, 19, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.244636', 2919, 19, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.247467', 2920, 19, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.250551', 2921, 19, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.252739', 2922, 19, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.255470', 2923, 20, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.258776', 2924, 20, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.261509', 2925, 20, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.263468', 2926, 20, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.266802', 2927, 20, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.269638', 2928, 20, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.271528', 2929, 21, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.274468', 2930, 21, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.276468', 2931, 21, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.278472', 2932, 21, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.281472', 2933, 21, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.283466', 2934, 21, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.285497', 2935, 22, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.287487', 2936, 22, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.289479', 2937, 22, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.292604', 2938, 22, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.295512', 2939, 22, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.298533', 2940, 22, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.300796', 2941, 23, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.303542', 2942, 23, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.305470', 2943, 23, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.308796', 2944, 23, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.311618', 2945, 23, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.314485', 2946, 23, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.316790', 2947, 24, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.319794', 2948, 24, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.322467', 2949, 24, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.324769', 2950, 24, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.327648', 2951, 24, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.330477', 2952, 24, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.332724', 2953, 25, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.335642', 2954, 25, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.337467', 2955, 25, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.340469', 2956, 25, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.342722', 2957, 25, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.345467', 2958, 25, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.347466', 2959, 26, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.350566', 2960, 26, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.353515', 2961, 26, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.356471', 2962, 26, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.358509', 2963, 26, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.360470', 2964, 26, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.363468', 2965, 27, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.365474', 2966, 27, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.367467', 2967, 27, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.370509', 2968, 27, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.372468', 2969, 27, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.375812', 2970, 27, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.378597', 2971, 28, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.381472', 2972, 28, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.383794', 2973, 28, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.386599', 2974, 28, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.389511', 2975, 28, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.391783', 2976, 28, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.394806', 2977, 29, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.397471', 2978, 29, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.400563', 2979, 29, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.403470', 2980, 29, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.405469', 2981, 29, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.408780', 2982, 29, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.411643', 2983, 30, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.414472', 2984, 30, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.416807', 2985, 30, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.419637', 2986, 30, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.421469', 2987, 30, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.425773', 2988, 30, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.428587', 2989, 31, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.431472', 2990, 31, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.433805', 2991, 31, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.436599', 2992, 31, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.439490', 2993, 31, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.441779', 2994, 31, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.444645', 2995, 32, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.447468', 2996, 32, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.450642', 2997, 32, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.453473', 2998, 32, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.455471', 2999, 32, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.458785', 3000, 32, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.461630', 3001, 33, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.464533', 3002, 33, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.467470', 3003, 33, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.469816', 3004, 33, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.472469', 3005, 33, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.474771', 3006, 33, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.477635', 3007, 34, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.480471', 3008, 34, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.483474', 3009, 34, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.485767', 3010, 34, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.488469', 3011, 34, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.491513', 3012, 34, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.494474', 3013, 35, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.496591', 3014, 35, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.499761', 3015, 35, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.502728', 3016, 35, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.505469', 3017, 35, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.507486', 3018, 35, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.510475', 3019, 36, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.512761', 3020, 36, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.515773', 3021, 36, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.518579', 3022, 36, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.521477', 3023, 36, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.524470', 3024, 36, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.526833', 3025, 37, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.529615', 3026, 37, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.532746', 3027, 37, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.535778', 3028, 37, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.538468', 3029, 37, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.540779', 3030, 37, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.543649', 3031, 38, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.546489', 3032, 38, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.549756', 3033, 38, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.552567', 3034, 38, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.555472', 3035, 38, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.558470', 3036, 38, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.560471', 3037, 39, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.563471', 3038, 39, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.566472', 3039, 39, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.568468', 3040, 39, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.570467', 3041, 39, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.573469', 3042, 39, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.575806', 3043, 40, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.578593', 3044, 40, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.581475', 3045, 40, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.583525', 3046, 40, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.585784', 3047, 40, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.588470', 3048, 40, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.591805', 3049, 41, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.594466', 3050, 41, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.596531', 3051, 41, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.599774', 3052, 41, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.602638', 3053, 41, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.605473', 3054, 41, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.608618', 3055, 42, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.610769', 3056, 42, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.613468', 3057, 42, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.615768', 3058, 42, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.618786', 3059, 42, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.621471', 3060, 42, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.624469', 3061, 43, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.626466', 3062, 43, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.628468', 3063, 43, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.631471', 3064, 43, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.633798', 3065, 43, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.636612', 3066, 43, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.639484', 3067, 44, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.641769', 3068, 44, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.644736', 3069, 44, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.647476', 3070, 44, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.649780', 3071, 44, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.652541', 3072, 44, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.654778', 3073, 45, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.657467', 3074, 45, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.659793', 3075, 45, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.662623', 3076, 45, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.665766', 3077, 45, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.668781', 3078, 45, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.671497', 3079, 46, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.674808', 3080, 46, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.677539', 3081, 46, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.679787', 3082, 46, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.682788', 3083, 46, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.685566', 3084, 46, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.687468', 3085, 47, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.690799', 3086, 47, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.693597', 3087, 47, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.696476', 3088, 47, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.699797', 3089, 47, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.702588', 3090, 47, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.705479', 3091, 48, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.707589', 3092, 48, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.710524', 3093, 48, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.712751', 3094, 48, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.715758', 3095, 48, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.718588', 3096, 48, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.721475', 3097, 49, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.724529', 3098, 49, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.726757', 3099, 49, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.729800', 3100, 49, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.732793', 3101, 49, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.735615', 3102, 49, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.737467', 3103, 50, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.740814', 3104, 50, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.743573', 3105, 50, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.746468', 3106, 50, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.749633', 3107, 50, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.752478', 3108, 50, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.754754', 3109, 51, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.757468', 3110, 51, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.759756', 3111, 51, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.762467', 3112, 51, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.764518', 3113, 51, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.766468', 3114, 51, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.769473', 3115, 52, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.771489', 3116, 52, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.774759', 3117, 52, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.777566', 3118, 52, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.780481', 3119, 52, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.782710', 3120, 52, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.785793', 3121, 53, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.788469', 3122, 53, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.791527', 3123, 53, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.793787', 3124, 53, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.796470', 3125, 53, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.799766', 3126, 53, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.802519', 3127, 54, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.804467', 3128, 54, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.808600', 3129, 54, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.811475', 3130, 54, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.814512', 3131, 54, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.816765', 3132, 54, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.819637', 3133, 55, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.822478', 3134, 55, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.824766', 3135, 55, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.827640', 3136, 55, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.830467', 3137, 55, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.832711', 3138, 55, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.835470', 3139, 56, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.837468', 3140, 56, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.839473', 3141, 56, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.842505', 3142, 56, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.844776', 3143, 56, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.847491', 3144, 56, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.850593', 3145, 57, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.853547', 3146, 57, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.856474', 3147, 57, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.858789', 3148, 57, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.861649', 3149, 57, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.864474', 3150, 57, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.866778', 3151, 58, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.869793', 3152, 58, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.872482', 3153, 58, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.875809', 3154, 58, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.878569', 3155, 58, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.880511', 3156, 58, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.883802', 3157, 59, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.886597', 3158, 59, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.889470', 3159, 59, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.891785', 3160, 59, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.894631', 3161, 59, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.897508', 3162, 59, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.899787', 3163, 60, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.902773', 3164, 60, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.905468', 3165, 60, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.908470', 3166, 60, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.910811', 3167, 60, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.913468', 3168, 60, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.916621', 3169, 61, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.919573', 3170, 61, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.921468', 3171, 61, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.924796', 3172, 61, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.927469', 3173, 61, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.929662', 3174, 61, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.932705', 3175, 62, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.935542', 3176, 62, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.937467', 3177, 62, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.940764', 3178, 62, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.943680', 3179, 62, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.946469', 3180, 62, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.948648', 3181, 63, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.951469', 3182, 63, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.953803', 3183, 63, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.956666', 3184, 63, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.958784', 3185, 63, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.961469', 3186, 63, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.963472', 3187, 64, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.966507', 3188, 64, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.968468', 3189, 64, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.971473', 3190, 64, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.974473', 3191, 64, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.976507', 3192, 64, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.978514', 3193, 65, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.980468', 3194, 65, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:17.983508', 3195, 65, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:17.985507', 3196, 65, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:17.987466', 3197, 65, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:17.990471', 3198, 65, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:17.992471', 3199, 66, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:17.995471', 3200, 66, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.008467', 3201, 66, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.010470', 3202, 66, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.012471', 3203, 66, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.015470', 3204, 66, NULL, 56, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 1, '2024-06-26 15:51:18.017467', 3205, 67, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.019468', 3206, 67, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.021467', 3207, 67, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.024504', 3208, 67, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.026470', 3209, 67, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.028508', 3210, 67, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.031483', 3211, 68, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.033505', 3212, 68, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.035506', 3213, 68, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.037469', 3214, 68, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.040467', 3215, 68, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.042466', 3216, 68, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.045466', 3217, 69, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.047490', 3218, 69, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.050469', 3219, 69, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.052472', 3220, 69, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.054469', 3221, 69, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.057472', 3222, 69, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.059468', 3223, 70, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.061501', 3224, 70, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.064505', 3225, 70, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.067475', 3226, 70, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.069761', 3227, 70, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.072549', 3228, 70, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.075593', 3229, 71, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.077467', 3230, 71, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.079469', 3231, 71, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.082799', 3232, 71, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.085649', 3233, 71, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.087467', 3234, 71, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.090815', 3235, 72, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.093632', 3236, 72, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.096469', 3237, 72, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.099517', 3238, 72, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.101761', 3239, 72, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.104592', 3240, 72, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.107469', 3241, 73, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.110469', 3242, 73, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.112483', 3243, 73, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.115469', 3244, 73, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.117469', 3245, 73, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.119514', 3246, 73, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.122476', 3247, 74, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.124510', 3248, 74, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.126468', 3249, 74, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.129581', 3250, 74, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.132754', 3251, 74, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.135642', 3252, 74, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.137504', 3253, 75, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.140816', 3254, 75, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.143614', 3255, 75, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.146479', 3256, 75, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.148782', 3257, 75, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.151814', 3258, 75, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.154564', 3259, 76, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.157471', 3260, 76, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.159764', 3261, 76, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.162587', 3262, 76, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.165510', 3263, 76, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.167469', 3264, 76, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.169469', 3265, 77, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.172468', 3266, 77, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.174781', 3267, 77, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.177590', 3268, 77, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.180486', 3269, 77, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.182768', 3270, 77, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:18.185537', 3271, 78, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:18.187467', 3272, 78, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:18.190808', 3273, 78, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:18.193604', 3274, 78, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:18.196471', 3275, 78, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:18.198771', 3276, 78, NULL, 56, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.698150', 3277, 1, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.701151', 3278, 1, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.705158', 3279, 1, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.707302', 3280, 1, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.709209', 3281, 1, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.713176', 3282, 1, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.716154', 3283, 2, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.718152', 3284, 2, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.722162', 3285, 2, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.724148', 3286, 2, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.727166', 3287, 2, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.731158', 3288, 2, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.733153', 3289, 3, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.736158', 3290, 3, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.739153', 3291, 3, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.742152', 3292, 3, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.744193', 3293, 3, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.748151', 3294, 3, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.750190', 3295, 4, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.755172', 3296, 4, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.758164', 3297, 4, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.760150', 3298, 4, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.765149', 3299, 4, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.767148', 3300, 4, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.770155', 3301, 5, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.773150', 3302, 5, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.775148', 3303, 5, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.778151', 3304, 5, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.782148', 3305, 5, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.784151', 3306, 5, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.786153', 3307, 6, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.790270', 3308, 6, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.792305', 3309, 6, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.796181', 3310, 6, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.799149', 3311, 6, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.801150', 3312, 6, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.805150', 3313, 7, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.807302', 3314, 7, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.809301', 3315, 7, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.813150', 3316, 7, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.815299', 3317, 7, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.817300', 3318, 7, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.820150', 3319, 8, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.824149', 3320, 8, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.826191', 3321, 8, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.829257', 3322, 8, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.832151', 3323, 8, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.834289', 3324, 8, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.838150', 3325, 9, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.840148', 3326, 9, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.842148', 3327, 9, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.845178', 3328, 9, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.848149', 3329, 9, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.850230', 3330, 9, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.852161', 3331, 10, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.856149', 3332, 10, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.858224', 3333, 10, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.860168', 3334, 10, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.864187', 3335, 10, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.866289', 3336, 10, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.869175', 3337, 11, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.872150', 3338, 11, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.874288', 3339, 11, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.876157', 3340, 11, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.880153', 3341, 11, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.882290', 3342, 11, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.884289', 3343, 12, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.887304', 3344, 12, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.890199', 3345, 12, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.892290', 3346, 12, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.895152', 3347, 12, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.897283', 3348, 12, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.899290', 3349, 13, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.902161', 3350, 13, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.905149', 3351, 13, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.907233', 3352, 13, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.909290', 3353, 13, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.912150', 3354, 13, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.914290', 3355, 14, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.916291', 3356, 14, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.918151', 3357, 14, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.921288', 3358, 14, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.923290', 3359, 14, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.925290', 3360, 14, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.928151', 3361, 15, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.930288', 3362, 15, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.932289', 3363, 15, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.935175', 3364, 15, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.937150', 3365, 15, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.940171', 3366, 15, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.942154', 3367, 16, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.944168', 3368, 16, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.947154', 3369, 16, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.949267', 3370, 16, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.951151', 3371, 16, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.954278', 3372, 16, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.956279', 3373, 17, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.959149', 3374, 17, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.961290', 3375, 17, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.963279', 3376, 17, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.966151', 3377, 17, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.968154', 3378, 17, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.971155', 3379, 18, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.973150', 3380, 18, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.975151', 3381, 18, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.978156', 3382, 18, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.980188', 3383, 18, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.982277', 3384, 18, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.985159', 3385, 19, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:23.987283', 3386, 19, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:23.990149', 3387, 19, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:23.992262', 3388, 19, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:23.994162', 3389, 19, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:23.997240', 3390, 19, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:23.999283', 3391, 20, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.002151', 3392, 20, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.004278', 3393, 20, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.006280', 3394, 20, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.009152', 3395, 20, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.011287', 3396, 20, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.014151', 3397, 21, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.016266', 3398, 21, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.018150', 3399, 21, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.021173', 3400, 21, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.023279', 3401, 21, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.025277', 3402, 21, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.028159', 3403, 22, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.030277', 3404, 22, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.032280', 3405, 22, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.034279', 3406, 22, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.037282', 3407, 22, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.039150', 3408, 22, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.042160', 3409, 23, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.045152', 3410, 23, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.047151', 3411, 23, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.049149', 3412, 23, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.052168', 3413, 23, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.054150', 3414, 23, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.056149', 3415, 24, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.059149', 3416, 24, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.062151', 3417, 24, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.064149', 3418, 24, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.066149', 3419, 24, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.069155', 3420, 24, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.071150', 3421, 25, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.074149', 3422, 25, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.076150', 3423, 25, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.079149', 3424, 25, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.081300', 3425, 25, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.083191', 3426, 25, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.086152', 3427, 26, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.089189', 3428, 26, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.091301', 3429, 26, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.094167', 3430, 26, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.097148', 3431, 26, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.099151', 3432, 26, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.101151', 3433, 27, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.104152', 3434, 27, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.107148', 3435, 27, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.109309', 3436, 27, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.112190', 3437, 27, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.114151', 3438, 27, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.117151', 3439, 28, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.120197', 3440, 28, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.123148', 3441, 28, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.125152', 3442, 28, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.128153', 3443, 28, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.131195', 3444, 28, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.133190', 3445, 29, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.136157', 3446, 29, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.139150', 3447, 29, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.141154', 3448, 29, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.143150', 3449, 29, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.146149', 3450, 29, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.149149', 3451, 30, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.151153', 3452, 30, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.154163', 3453, 30, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.156153', 3454, 30, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.158184', 3455, 30, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.161188', 3456, 30, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.163292', 3457, 31, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.165292', 3458, 31, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.167292', 3459, 31, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.170294', 3460, 31, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.172293', 3461, 31, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.174149', 3462, 31, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.177161', 3463, 32, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.179151', 3464, 32, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.182151', 3465, 32, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.184149', 3466, 32, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.187302', 3467, 32, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.189150', 3468, 32, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.192149', 3469, 33, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.194154', 3470, 33, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.196304', 3471, 33, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.198150', 3472, 33, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.201150', 3473, 33, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.204152', 3474, 33, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.206299', 3475, 34, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.208154', 3476, 34, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.210159', 3477, 34, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.213150', 3478, 34, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.215291', 3479, 34, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.217299', 3480, 34, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.220301', 3481, 35, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.222149', 3482, 35, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.225149', 3483, 35, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.227150', 3484, 35, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.230149', 3485, 35, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.232152', 3486, 35, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.234225', 3487, 36, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.237153', 3488, 36, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.239290', 3489, 36, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.241289', 3490, 36, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.243150', 3491, 36, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.246289', 3492, 36, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.248149', 3493, 37, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.250289', 3494, 37, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.253291', 3495, 37, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.255149', 3496, 37, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.258149', 3497, 37, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.260151', 3498, 37, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.263149', 3499, 38, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.265236', 3500, 38, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.267287', 3501, 38, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.270289', 3502, 38, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.273289', 3503, 38, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.275287', 3504, 38, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.278152', 3505, 39, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.280289', 3506, 39, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.282289', 3507, 39, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.284154', 3508, 39, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.287190', 3509, 39, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.289150', 3510, 39, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.292149', 3511, 40, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.294155', 3512, 40, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.296149', 3513, 40, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.299149', 3514, 40, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.301150', 3515, 40, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.304149', 3516, 40, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.306276', 3517, 41, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.308149', 3518, 41, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.310158', 3519, 41, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.312289', 3520, 41, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.315149', 3521, 41, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.317209', 3522, 41, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.320153', 3523, 42, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.322289', 3524, 42, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.324289', 3525, 42, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.326150', 3526, 42, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.329291', 3527, 42, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.331289', 3528, 42, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.333290', 3529, 43, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.336151', 3530, 43, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.338289', 3531, 43, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.340289', 3532, 43, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.342288', 3533, 43, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.345292', 3534, 43, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.347288', 3535, 44, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.349149', 3536, 44, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.352161', 3537, 44, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.354288', 3538, 44, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.357149', 3539, 44, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.359190', 3540, 44, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.362152', 3541, 45, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.364289', 3542, 45, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.366289', 3543, 45, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.368152', 3544, 45, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.371289', 3545, 45, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.373291', 3546, 45, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.375291', 3547, 46, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.378152', 3548, 46, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.380151', 3549, 46, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.382151', 3550, 46, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.384149', 3551, 46, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.387150', 3552, 46, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.389149', 3553, 47, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.392153', 3554, 47, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.395172', 3555, 47, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.397149', 3556, 47, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.399149', 3557, 47, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.401153', 3558, 47, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.404304', 3559, 48, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.406301', 3560, 48, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.408149', 3561, 48, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.411158', 3562, 48, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.413302', 3563, 48, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.415307', 3564, 48, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.417293', 3565, 49, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.420305', 3566, 49, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.423152', 3567, 49, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.425378', 3568, 49, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.428391', 3569, 49, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.430459', 3570, 49, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.432532', 3571, 50, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.434389', 3572, 50, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.437440', 3573, 50, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.439569', 3574, 50, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.441697', 3575, 50, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.443339', 3576, 50, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.446370', 3577, 51, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.448378', 3578, 51, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.450470', 3579, 51, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.453362', 3580, 51, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.455477', 3581, 51, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.457383', 3582, 51, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.459328', 3583, 52, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.462478', 3584, 52, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.464479', 3585, 52, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.466477', 3586, 52, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.469333', 3587, 52, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.471479', 3588, 52, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.473478', 3589, 53, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.475479', 3590, 53, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.478331', 3591, 53, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.481331', 3592, 53, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.483479', 3593, 53, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.486445', 3594, 53, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.489380', 3595, 54, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.491531', 3596, 54, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.493384', 3597, 54, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.495379', 3598, 54, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.498380', 3599, 54, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.500378', 3600, 54, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.502380', 3601, 55, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.505380', 3602, 55, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.507377', 3603, 55, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.509379', 3604, 55, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.512382', 3605, 55, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.514530', 3606, 55, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.516536', 3607, 56, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.519386', 3608, 56, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.522378', 3609, 56, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.524418', 3610, 56, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.526380', 3611, 56, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.529540', 3612, 56, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.531555', 3613, 57, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.533551', 3614, 57, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.536552', 3615, 57, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.538552', 3616, 57, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.541572', 3617, 57, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.543552', 3618, 57, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.545555', 3619, 58, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.548552', 3620, 58, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.550593', 3621, 58, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.552551', 3622, 58, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.555551', 3623, 58, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.557552', 3624, 58, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.560554', 3625, 59, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.563552', 3626, 59, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.565707', 3627, 59, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.568560', 3628, 59, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.570704', 3629, 59, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.573551', 3630, 59, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.575551', 3631, 60, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.578554', 3632, 60, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.580553', 3633, 60, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.582554', 3634, 60, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.584553', 3635, 60, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.587554', 3636, 60, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.589549', 3637, 61, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.592552', 3638, 61, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.595551', 3639, 61, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.598703', 3640, 61, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.601561', 3641, 61, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.604554', 3642, 61, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.606551', 3643, 62, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.608694', 3644, 62, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.611558', 3645, 62, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.614550', 3646, 62, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.616552', 3647, 62, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.618557', 3648, 62, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.621590', 3649, 63, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.623555', 3650, 63, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.626584', 3651, 63, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.629550', 3652, 63, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.631551', 3653, 63, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.634551', 3654, 63, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.636553', 3655, 64, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.639551', 3656, 64, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.641707', 3657, 64, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.643596', 3658, 64, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.646551', 3659, 64, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.648615', 3660, 64, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.650659', 3661, 65, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.653553', 3662, 65, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.655702', 3663, 65, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.657551', 3664, 65, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.660552', 3665, 65, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.662593', 3666, 65, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.664702', 3667, 66, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.666703', 3668, 66, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.679701', 3669, 66, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.681700', 3670, 66, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.683552', 3671, 66, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.686705', 3672, 66, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.688705', 3673, 67, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.690701', 3674, 67, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.693552', 3675, 67, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.695702', 3676, 67, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.697551', 3677, 67, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.699703', 3678, 67, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.701552', 3679, 68, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.703701', 3680, 68, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.705552', 3681, 68, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.708551', 3682, 68, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.710705', 3683, 68, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.713550', 3684, 68, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.715692', 3685, 69, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.717553', 3686, 69, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.720695', 3687, 69, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.722583', 3688, 69, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.724694', 3689, 69, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.727603', 3690, 69, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.729694', 3691, 70, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.731694', 3692, 70, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.733695', 3693, 70, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.736614', 3694, 70, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.738551', 3695, 70, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.741550', 3696, 70, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.743551', 3697, 71, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.745551', 3698, 71, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.747576', 3699, 71, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.749694', 3700, 71, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.752591', 3701, 71, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.754695', 3702, 71, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.756693', 3703, 72, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.758551', 3704, 72, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.762550', 3705, 72, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.764609', 3706, 72, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.766715', 3707, 72, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.769754', 3708, 72, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.771770', 3709, 73, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.773816', 3710, 73, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.775826', 3711, 73, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.778978', 3712, 73, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.781826', 3713, 73, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.783842', 3714, 73, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.786830', 3715, 74, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.788978', 3716, 74, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.790827', 3717, 74, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.793832', 3718, 74, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.795979', 3719, 74, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.797827', 3720, 74, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.799976', 3721, 75, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.802827', 3722, 75, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.804978', 3723, 75, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.806978', 3724, 75, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.808912', 3725, 75, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.811984', 3726, 75, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.814826', 3727, 76, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.816877', 3728, 76, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.819828', 3729, 76, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.821977', 3730, 76, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.823977', 3731, 76, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.826828', 3732, 76, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.828982', 3733, 77, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.831826', 3734, 77, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.833830', 3735, 77, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.836828', 3736, 77, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.838883', 3737, 77, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.840976', 3738, 77, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:24.843446', 3739, 78, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:24.845572', 3740, 78, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:24.847449', 3741, 78, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:24.849573', 3742, 78, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:24.852562', 3743, 78, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:24.854573', 3744, 78, NULL, 57, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.616355', 3745, 1, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.619353', 3746, 1, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.621352', 3747, 1, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.625374', 3748, 1, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.628352', 3749, 1, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.630399', 3750, 1, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.633358', 3751, 2, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.636357', 3752, 2, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.638359', 3753, 2, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.641362', 3754, 2, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.644393', 3755, 2, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.646394', 3756, 2, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.649356', 3757, 3, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.652355', 3758, 3, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.654352', 3759, 3, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.657368', 3760, 3, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.661353', 3761, 3, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.663353', 3762, 3, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.666359', 3763, 4, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.670355', 3764, 4, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.672352', 3765, 4, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.675434', 3766, 4, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.678352', 3767, 4, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.680396', 3768, 4, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.683425', 3769, 5, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.686357', 3770, 5, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.688394', 3771, 5, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.690371', 3772, 5, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.694393', 3773, 5, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.696353', 3774, 5, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.699355', 3775, 6, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.702354', 3776, 6, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.704396', 3777, 6, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.707356', 3778, 6, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.710355', 3779, 6, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.712355', 3780, 6, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.715369', 3781, 7, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.718357', 3782, 7, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.720356', 3783, 7, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.722357', 3784, 7, NULL, 58, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 5, '2024-06-26 15:51:30.725399', 3785, 7, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.727354', 3786, 7, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.730356', 3787, 8, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.733422', 3788, 8, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.735392', 3789, 8, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.737395', 3790, 8, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.740364', 3791, 8, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.743353', 3792, 8, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.746354', 3793, 9, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.748372', 3794, 9, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.751393', 3795, 9, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.753395', 3796, 9, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.755399', 3797, 9, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.759354', 3798, 9, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.761391', 3799, 10, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.763392', 3800, 10, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.766360', 3801, 10, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.769354', 3802, 10, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.771355', 3803, 10, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.773370', 3804, 10, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.776357', 3805, 11, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.779356', 3806, 11, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.781354', 3807, 11, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.784392', 3808, 11, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.787529', 3809, 11, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.790357', 3810, 11, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.792652', 3811, 12, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.795552', 3812, 12, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.798369', 3813, 12, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.801395', 3814, 12, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.803640', 3815, 12, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.806355', 3816, 12, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.809355', 3817, 13, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.811353', 3818, 13, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.813682', 3819, 13, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.817359', 3820, 13, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.819661', 3821, 13, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.822356', 3822, 13, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.825551', 3823, 14, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.827609', 3824, 14, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.830640', 3825, 14, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.833662', 3826, 14, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.836355', 3827, 14, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.838409', 3828, 14, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.841354', 3829, 15, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.843702', 3830, 15, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.846649', 3831, 15, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.849535', 3832, 15, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.851663', 3833, 15, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.854353', 3834, 15, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.856353', 3835, 16, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.859572', 3836, 16, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.862454', 3837, 16, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.864357', 3838, 16, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.867399', 3839, 16, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.870356', 3840, 16, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.872353', 3841, 17, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.875713', 3842, 17, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.878601', 3843, 17, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.881354', 3844, 17, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.884397', 3845, 17, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.886664', 3846, 17, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.889359', 3847, 18, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.892648', 3848, 18, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.895483', 3849, 18, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.898364', 3850, 18, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.901354', 3851, 18, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.903355', 3852, 18, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.905356', 3853, 19, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.908354', 3854, 19, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.910683', 3855, 19, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.913497', 3856, 19, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.916353', 3857, 19, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.918540', 3858, 19, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.921614', 3859, 20, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.925559', 3860, 20, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.928424', 3861, 20, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.930526', 3862, 20, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.933427', 3863, 20, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.935422', 3864, 20, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.937419', 3865, 21, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.939425', 3866, 21, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.942708', 3867, 21, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.945491', 3868, 21, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.947423', 3869, 21, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.950421', 3870, 21, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.953657', 3871, 22, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.956421', 3872, 22, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.959419', 3873, 22, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.961486', 3874, 22, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.964429', 3875, 22, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.967421', 3876, 22, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.969423', 3877, 23, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.971423', 3878, 23, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.974421', 3879, 23, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.976422', 3880, 23, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.979461', 3881, 23, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.982436', 3882, 23, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:30.985604', 3883, 24, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:30.987421', 3884, 24, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:30.990425', 3885, 24, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:30.993421', 3886, 24, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:30.995656', 3887, 24, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:30.997420', 3888, 24, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.000420', 3889, 25, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.002779', 3890, 25, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.005422', 3891, 25, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.008422', 3892, 25, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.010802', 3893, 25, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.013420', 3894, 25, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.015471', 3895, 26, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.018421', 3896, 26, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.020607', 3897, 26, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.022422', 3898, 26, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.025421', 3899, 26, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.027421', 3900, 26, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.029419', 3901, 27, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.032430', 3902, 27, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.035421', 3903, 27, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.037420', 3904, 27, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.039420', 3905, 27, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.042786', 3906, 27, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.045422', 3907, 28, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.047423', 3908, 28, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.050446', 3909, 28, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.052739', 3910, 28, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.055502', 3911, 28, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.058734', 3912, 28, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.061545', 3913, 29, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.064426', 3914, 29, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.066741', 3915, 29, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.069639', 3916, 29, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.072427', 3917, 29, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.075544', 3918, 29, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.077425', 3919, 30, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.080509', 3920, 30, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.083420', 3921, 30, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.085421', 3922, 30, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.087422', 3923, 30, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.089424', 3924, 30, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.092691', 3925, 31, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.094696', 3926, 31, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.096659', 3927, 31, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.099429', 3928, 31, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.101459', 3929, 31, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.103460', 3930, 31, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.105423', 3931, 32, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.108729', 3932, 32, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.111647', 3933, 32, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.114425', 3934, 32, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.117419', 3935, 32, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.120421', 3936, 32, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.123424', 3937, 33, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.125422', 3938, 33, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.127424', 3939, 33, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.130424', 3940, 33, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.133421', 3941, 33, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.135461', 3942, 33, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.138632', 3943, 34, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.141645', 3944, 34, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.143682', 3945, 34, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.145683', 3946, 34, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.147648', 3947, 34, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.151003', 3948, 34, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.153777', 3949, 35, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.156646', 3950, 35, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.159735', 3951, 35, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.161958', 3952, 35, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.164698', 3953, 35, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.167649', 3954, 35, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.169945', 3955, 36, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.172645', 3956, 36, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.175689', 3957, 36, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.177685', 3958, 36, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.179984', 3959, 36, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.195643', 3960, 36, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.198676', 3961, 37, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.200964', 3962, 37, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.203915', 3963, 37, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.206647', 3964, 37, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.208963', 3965, 37, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.211784', 3966, 37, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.214656', 3967, 38, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.216977', 3968, 38, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.220020', 3969, 38, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.222646', 3970, 38, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.225645', 3971, 38, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.227678', 3972, 38, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.229960', 3973, 39, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.232653', 3974, 39, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.234961', 3975, 39, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.237651', 3976, 39, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.240649', 3977, 39, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.242805', 3978, 39, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.245650', 3979, 40, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.247648', 3980, 40, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.251008', 3981, 40, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.253911', 3982, 40, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.256648', 3983, 40, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.258886', 3984, 40, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.261767', 3985, 41, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.263644', 3986, 41, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.266952', 3987, 41, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.269797', 3988, 41, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.272646', 3989, 41, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.274954', 3990, 41, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.277649', 3991, 42, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.280648', 3992, 42, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.283645', 3993, 42, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.285643', 3994, 42, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.287643', 3995, 42, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.290650', 3996, 42, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.292647', 3997, 43, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.295644', 3998, 43, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.297643', 3999, 43, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.299645', 4000, 43, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.303644', 4001, 43, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.305644', 4002, 43, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.308654', 4003, 44, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.311795', 4004, 44, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.314656', 4005, 44, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.317645', 4006, 44, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.320019', 4007, 44, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.322643', 4008, 44, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.325645', 4009, 45, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.327645', 4010, 45, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.329769', 4011, 45, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.332644', 4012, 45, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.335644', 4013, 45, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.337645', 4014, 45, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.339701', 4015, 46, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.342645', 4016, 46, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.345653', 4017, 46, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.348659', 4018, 46, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.350836', 4019, 46, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.352642', 4020, 46, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.355644', 4021, 47, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.358645', 4022, 47, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.360991', 4023, 47, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.363649', 4024, 47, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.366646', 4025, 47, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.368642', 4026, 47, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.371644', 4027, 48, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.373647', 4028, 48, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.376646', 4029, 48, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.378952', 4030, 48, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.381643', 4031, 48, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.383644', 4032, 48, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.385644', 4033, 49, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.388646', 4034, 49, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.391650', 4035, 49, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.393689', 4036, 49, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.395642', 4037, 49, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.398643', 4038, 49, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.401660', 4039, 50, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.403642', 4040, 50, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.406663', 4041, 50, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.409645', 4042, 50, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.412786', 4043, 50, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.415645', 4044, 50, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.419013', 4045, 51, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.421810', 4046, 51, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.424644', 4047, 51, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.427646', 4048, 51, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.429990', 4049, 51, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.432646', 4050, 51, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.434977', 4051, 52, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.437642', 4052, 52, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.439654', 4053, 52, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.442811', 4054, 52, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.445651', 4055, 52, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.447647', 4056, 52, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.450909', 4057, 53, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.453650', 4058, 53, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.455645', 4059, 53, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.458645', 4060, 53, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.461001', 4061, 53, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.463686', 4062, 53, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.466649', 4063, 54, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.468965', 4064, 54, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.471650', 4065, 54, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.474647', 4066, 54, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.476881', 4067, 54, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.479642', 4068, 54, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.481644', 4069, 55, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.484649', 4070, 55, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.486643', 4071, 55, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.489657', 4072, 55, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.491646', 4073, 55, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.494646', 4074, 55, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.496641', 4075, 56, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.498674', 4076, 56, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.501643', 4077, 56, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.503674', 4078, 56, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.505674', 4079, 56, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.508644', 4080, 56, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.511664', 4081, 57, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.514661', 4082, 57, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.517643', 4083, 57, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.519652', 4084, 57, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.522646', 4085, 57, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.524644', 4086, 57, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.527666', 4087, 58, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.531652', 4088, 58, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.534776', 4089, 58, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.536642', 4090, 58, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.539659', 4091, 58, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.542648', 4092, 58, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.544646', 4093, 59, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.546647', 4094, 59, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.549649', 4095, 59, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.551643', 4096, 59, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.553700', 4097, 59, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.556657', 4098, 59, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.559643', 4099, 60, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.561644', 4100, 60, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.563643', 4101, 60, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.566647', 4102, 60, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.569644', 4103, 60, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.571642', 4104, 60, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.573644', 4105, 61, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.576919', 4106, 61, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.579642', 4107, 61, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.581644', 4108, 61, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.583645', 4109, 61, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.585644', 4110, 61, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.587685', 4111, 62, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.590644', 4112, 62, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.592647', 4113, 62, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.596762', 4114, 62, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.599644', 4115, 62, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.603731', 4116, 62, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.606653', 4117, 63, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.609920', 4118, 63, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.612738', 4119, 63, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.615647', 4120, 63, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.617696', 4121, 63, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.619951', 4122, 63, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.622648', 4123, 64, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.624645', 4124, 64, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.627645', 4125, 64, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.629646', 4126, 64, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.632644', 4127, 64, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.635642', 4128, 64, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.637643', 4129, 65, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.639655', 4130, 65, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.642645', 4131, 65, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.645955', 4132, 65, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.648662', 4133, 65, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.651651', 4134, 65, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.654000', 4135, 66, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.667648', 4136, 66, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.680645', 4137, 66, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.683665', 4138, 66, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.685682', 4139, 66, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.688647', 4140, 66, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.691650', 4141, 67, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.693991', 4142, 67, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.696779', 4143, 67, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.699647', 4144, 67, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.702800', 4145, 67, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.705646', 4146, 67, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.707649', 4147, 68, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.710645', 4148, 68, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.712646', 4149, 68, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.714644', 4150, 68, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.717703', 4151, 68, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.719949', 4152, 68, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.722652', 4153, 69, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.724855', 4154, 69, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.727688', 4155, 69, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.729952', 4156, 69, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.732649', 4157, 69, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.735823', 4158, 69, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.738647', 4159, 70, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.741658', 4160, 70, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.743965', 4161, 70, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.746753', 4162, 70, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.749647', 4163, 70, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.752796', 4164, 70, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.754957', 4165, 71, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.757643', 4166, 71, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.759645', 4167, 71, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.763648', 4168, 71, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.766873', 4169, 71, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.769910', 4170, 71, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.772666', 4171, 72, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.775756', 4172, 72, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.778650', 4173, 72, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.781685', 4174, 72, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.783973', 4175, 72, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.786655', 4176, 72, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.788645', 4177, 73, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.791966', 4178, 73, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.794806', 4179, 73, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.796645', 4180, 73, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.799949', 4181, 73, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.802746', 4182, 73, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.804964', 4183, 74, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.807645', 4184, 74, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.810990', 4185, 74, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.813645', 4186, 74, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.816714', 4187, 74, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.818943', 4188, 74, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.821757', 4189, 75, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.824644', 4190, 75, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.827032', 4191, 75, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.829819', 4192, 75, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.832693', 4193, 75, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.835043', 4194, 75, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.837693', 4195, 76, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.839698', 4196, 76, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.842738', 4197, 76, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.845057', 4198, 76, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.848080', 4199, 76, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.850406', 4200, 76, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.853076', 4201, 77, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.855074', 4202, 77, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.858068', 4203, 77, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.860383', 4204, 77, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.862068', 4205, 77, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.865068', 4206, 77, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:31.867352', 4207, 78, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:31.870364', 4208, 78, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:31.872364', 4209, 78, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:31.875414', 4210, 78, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:31.877562', 4211, 78, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:31.879629', 4212, 78, NULL, 58, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.549944', 4213, 1, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.551943', 4214, 1, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.555957', 4215, 1, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.558945', 4216, 1, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.561947', 4217, 1, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.564952', 4218, 1, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.567943', 4219, 2, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.569946', 4220, 2, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.574945', 4221, 2, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.576945', 4222, 2, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.580979', 4223, 2, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.583945', 4224, 2, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.586946', 4225, 3, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.590942', 4226, 3, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.593942', 4227, 3, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.595957', 4228, 3, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.600094', 4229, 3, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.601943', 4230, 3, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.606946', 4231, 4, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.609097', 4232, 4, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.611057', 4233, 4, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.614950', 4234, 4, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.616982', 4235, 4, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.619944', 4236, 4, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.622946', 4237, 5, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.625094', 4238, 5, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.627945', 4239, 5, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.630950', 4240, 5, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.633944', 4241, 5, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.636022', 4242, 5, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.639947', 4243, 6, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.641943', 4244, 6, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.644022', 4245, 6, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.647949', 4246, 6, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.649944', 4247, 6, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.651943', 4248, 6, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.656040', 4249, 7, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.658038', 4250, 7, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.660170', 4251, 7, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.664110', 4252, 7, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.666168', 4253, 7, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.668038', 4254, 7, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.671038', 4255, 8, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.674209', 4256, 8, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.676349', 4257, 8, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.678225', 4258, 8, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.682319', 4259, 8, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.684352', 4260, 8, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.687224', 4261, 9, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.690286', 4262, 9, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.692349', 4263, 9, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.695236', 4264, 9, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.698221', 4265, 9, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.700220', 4266, 9, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.703222', 4267, 10, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.706223', 4268, 10, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.709257', 4269, 10, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.712227', 4270, 10, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.715221', 4271, 10, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.718220', 4272, 10, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.720281', 4273, 11, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.723350', 4274, 11, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.725348', 4275, 11, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.727364', 4276, 11, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.731260', 4277, 11, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.733221', 4278, 11, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.735340', 4279, 12, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.737224', 4280, 12, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.740349', 4281, 12, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.742348', 4282, 12, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.744294', 4283, 12, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.747360', 4284, 12, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.750223', 4285, 13, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.752878', 4286, 13, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.755864', 4287, 13, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.757863', 4288, 13, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.759994', 4289, 13, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.762868', 4290, 13, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.764992', 4291, 14, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.766991', 4292, 14, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.769864', 4293, 14, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.772864', 4294, 14, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.774993', 4295, 14, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.776862', 4296, 14, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.778864', 4297, 15, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.781865', 4298, 15, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.783993', 4299, 15, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.785933', 4300, 15, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.788991', 4301, 15, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.790996', 4302, 15, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.793878', 4303, 16, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.795864', 4304, 16, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.798902', 4305, 16, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.800991', 4306, 16, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.803869', 4307, 16, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.805994', 4308, 16, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.807864', 4309, 17, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.810865', 4310, 17, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.813866', 4311, 17, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.815901', 4312, 17, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.817864', 4313, 17, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.820904', 4314, 17, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.823866', 4315, 18, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.825994', 4316, 18, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.827867', 4317, 18, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.830907', 4318, 18, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.832863', 4319, 18, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.834862', 4320, 18, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.846985', 4321, 19, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.849866', 4322, 19, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.851984', 4323, 19, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.854987', 4324, 19, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.856862', 4325, 19, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.858863', 4326, 19, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.861873', 4327, 20, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.863984', 4328, 20, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.865863', 4329, 20, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.868976', 4330, 20, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.871863', 4331, 20, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.874866', 4332, 20, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.876863', 4333, 21, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.878875', 4334, 21, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.881865', 4335, 21, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.883961', 4336, 21, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.885863', 4337, 21, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.889862', 4338, 21, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.892013', 4339, 22, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.894012', 4340, 22, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.897866', 4341, 22, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.899983', 4342, 22, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.901872', 4343, 22, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.904865', 4344, 22, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.907001', 4345, 23, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.909862', 4346, 23, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.911887', 4347, 23, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.915002', 4348, 23, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.917865', 4349, 23, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.919865', 4350, 23, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.922865', 4351, 24, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.924862', 4352, 24, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.926944', 4353, 24, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.930863', 4354, 24, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.932864', 4355, 24, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.934959', 4356, 24, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.937882', 4357, 25, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.939864', 4358, 25, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.941863', 4359, 25, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.944864', 4360, 25, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.947863', 4361, 25, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.950865', 4362, 25, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.952863', 4363, 26, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.956003', 4364, 26, NULL, 59, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-26 15:51:35.957863', 4365, 26, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.960863', 4366, 26, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.963905', 4367, 26, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.966004', 4368, 26, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.967863', 4369, 27, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.970871', 4370, 27, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.972863', 4371, 27, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.974991', 4372, 27, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.977864', 4373, 27, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.980862', 4374, 27, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.982862', 4375, 28, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.984992', 4376, 28, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:35.987863', 4377, 28, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:35.989992', 4378, 28, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:35.991991', 4379, 28, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:35.994873', 4380, 28, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:35.996864', 4381, 29, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:35.999990', 4382, 29, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.001993', 4383, 29, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.004867', 4384, 29, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.006992', 4385, 29, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.008993', 4386, 29, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.011866', 4387, 30, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.013993', 4388, 30, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.015992', 4389, 30, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.017864', 4390, 30, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.020910', 4391, 30, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.023864', 4392, 30, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.025973', 4393, 31, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.028874', 4394, 31, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.030991', 4395, 31, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.032862', 4396, 31, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.034984', 4397, 31, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.037864', 4398, 31, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.039992', 4399, 32, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.042863', 4400, 32, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.044880', 4401, 32, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.047863', 4402, 32, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.049986', 4403, 32, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.051986', 4404, 32, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.054866', 4405, 33, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.056991', 4406, 33, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.058996', 4407, 33, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.061865', 4408, 33, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.063993', 4409, 33, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.065994', 4410, 33, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.068991', 4411, 34, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.071877', 4412, 34, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.073991', 4413, 34, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.075991', 4414, 34, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.078869', 4415, 34, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.080992', 4416, 34, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.082863', 4417, 35, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.084992', 4418, 35, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.087863', 4419, 35, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.089992', 4420, 35, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.091992', 4421, 35, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.093993', 4422, 35, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.096991', 4423, 36, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.098994', 4424, 36, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.100995', 4425, 36, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.103881', 4426, 36, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.105993', 4427, 36, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.107863', 4428, 36, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.110869', 4429, 37, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.113867', 4430, 37, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.115994', 4431, 37, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.117863', 4432, 37, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.120863', 4433, 37, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.122863', 4434, 37, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.124993', 4435, 38, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.126984', 4436, 38, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.129864', 4437, 38, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.131867', 4438, 38, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.134900', 4439, 38, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.137868', 4440, 38, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.139909', 4441, 39, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.141864', 4442, 39, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.144878', 4443, 39, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.147864', 4444, 39, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.149901', 4445, 39, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.152018', 4446, 39, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.154862', 4447, 40, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.156862', 4448, 40, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.159883', 4449, 40, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.161863', 4450, 40, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.164863', 4451, 40, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.167002', 4452, 40, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.169871', 4453, 41, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.172014', 4454, 41, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.174862', 4455, 41, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.176866', 4456, 41, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.178865', 4457, 41, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.180863', 4458, 41, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.183862', 4459, 42, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.185864', 4460, 42, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.189015', 4461, 42, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.191013', 4462, 42, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.192863', 4463, 42, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.195864', 4464, 42, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.197867', 4465, 43, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.199863', 4466, 43, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.202007', 4467, 43, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.205014', 4468, 43, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.206862', 4469, 43, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.209865', 4470, 43, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.211950', 4471, 44, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.214960', 4472, 44, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.217012', 4473, 44, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.218907', 4474, 44, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.221903', 4475, 44, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.223901', 4476, 44, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.225862', 4477, 45, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.228873', 4478, 45, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.231016', 4479, 45, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.232862', 4480, 45, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.234861', 4481, 45, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.237865', 4482, 45, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.239987', 4483, 46, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.242013', 4484, 46, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.244036', 4485, 46, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.247002', 4486, 46, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.248863', 4487, 46, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.251863', 4488, 46, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.253866', 4489, 47, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.256863', 4490, 47, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.258936', 4491, 47, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.260937', 4492, 47, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.263977', 4493, 47, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.266122', 4494, 47, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.268276', 4495, 48, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.270135', 4496, 48, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.273183', 4497, 48, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.275274', 4498, 48, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.277278', 4499, 48, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.280273', 4500, 48, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.282274', 4501, 49, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.284275', 4502, 49, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.287176', 4503, 49, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.289273', 4504, 49, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.291317', 4505, 49, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.294330', 4506, 49, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.296330', 4507, 50, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.299337', 4508, 50, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.301457', 4509, 50, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.303335', 4510, 50, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.306330', 4511, 50, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.308368', 4512, 50, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.310459', 4513, 51, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.313479', 4514, 51, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.315481', 4515, 51, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.317370', 4516, 51, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.320333', 4517, 51, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.322329', 4518, 51, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.324470', 4519, 52, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.326471', 4520, 52, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.329354', 4521, 52, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.331471', 4522, 52, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.333328', 4523, 52, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.336338', 4524, 52, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.339330', 4525, 53, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.341465', 4526, 53, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.343479', 4527, 53, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.346330', 4528, 53, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.348391', 4529, 53, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.350473', 4530, 53, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.352356', 4531, 54, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.355481', 4532, 54, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.357386', 4533, 54, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.359478', 4534, 54, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.362333', 4535, 54, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.364483', 4536, 54, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.366479', 4537, 55, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.368479', 4538, 55, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.371487', 4539, 55, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.373482', 4540, 55, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.375479', 4541, 55, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.378349', 4542, 55, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.380480', 4543, 56, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.382479', 4544, 56, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.385448', 4545, 56, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.388329', 4546, 56, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.390478', 4547, 56, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.392472', 4548, 56, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.395329', 4549, 57, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.398328', 4550, 57, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.400330', 4551, 57, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.402329', 4552, 57, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.405368', 4553, 57, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.407394', 4554, 57, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.409431', 4555, 58, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.411348', 4556, 58, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.414437', 4557, 58, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.416478', 4558, 58, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.418480', 4559, 58, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.421331', 4560, 58, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.423367', 4561, 59, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.425371', 4562, 59, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.428336', 4563, 59, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.431328', 4564, 59, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.433344', 4565, 59, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.435486', 4566, 59, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.438446', 4567, 60, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.440479', 4568, 60, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.442471', 4569, 60, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.445355', 4570, 60, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.447381', 4571, 60, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.449481', 4572, 60, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.451486', 4573, 61, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.454329', 4574, 61, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.456478', 4575, 61, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.459328', 4576, 61, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.461335', 4577, 61, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.464328', 4578, 61, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.466346', 4579, 62, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.468479', 4580, 62, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.470329', 4581, 62, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.473328', 4582, 62, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.475476', 4583, 62, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.477330', 4584, 62, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.480479', 4585, 63, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.482478', 4586, 63, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.484479', 4587, 63, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.487334', 4588, 63, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.489478', 4589, 63, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.491329', 4590, 63, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.494328', 4591, 64, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.497355', 4592, 64, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.499481', 4593, 64, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.501486', 4594, 64, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.503329', 4595, 64, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.506331', 4596, 64, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.508479', 4597, 65, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.510479', 4598, 65, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.513480', 4599, 65, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.515480', 4600, 65, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.517380', 4601, 65, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.520330', 4602, 65, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.522483', 4603, 66, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.524478', 4604, 66, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.526479', 4605, 66, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.540352', 4606, 66, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.542479', 4607, 66, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.544350', 4608, 66, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.547330', 4609, 67, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.549481', 4610, 67, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.551479', 4611, 67, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.554330', 4612, 67, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.557329', 4613, 67, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.559332', 4614, 67, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.562334', 4615, 68, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.565385', 4616, 68, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.567384', 4617, 68, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.569332', 4618, 68, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.572328', 4619, 68, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.574328', 4620, 68, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.576332', 4621, 69, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.579332', 4622, 69, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.581395', 4623, 69, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.583358', 4624, 69, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.586339', 4625, 69, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.589364', 4626, 69, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.591472', 4627, 70, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.593474', 4628, 70, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.596329', 4629, 70, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.599329', 4630, 70, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.604334', 4631, 70, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.607329', 4632, 70, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.609452', 4633, 71, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.612344', 4634, 71, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.614478', 4635, 71, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.616478', 4636, 71, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.618476', 4637, 71, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.622331', 4638, 71, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.624370', 4639, 72, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.626371', 4640, 72, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.629384', 4641, 72, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.632473', 4642, 72, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.634478', 4643, 72, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.636349', 4644, 72, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.639479', 4645, 73, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.641480', 4646, 73, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.643481', 4647, 73, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.646329', 4648, 73, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.649328', 4649, 73, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.651374', 4650, 73, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.653373', 4651, 74, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.656330', 4652, 74, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.658467', 4653, 74, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.660457', 4654, 74, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.663479', 4655, 74, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.666328', 4656, 74, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.668408', 4657, 75, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.671330', 4658, 75, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.673473', 4659, 75, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.675473', 4660, 75, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.677328', 4661, 75, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.680472', 4662, 75, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.682470', 4663, 76, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.685326', 4664, 76, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.687331', 4665, 76, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.690350', 4666, 76, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.692479', 4667, 76, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.694332', 4668, 76, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.697368', 4669, 77, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.699460', 4670, 77, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.701457', 4671, 77, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.704468', 4672, 77, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.707328', 4673, 77, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.709424', 4674, 77, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:36.711335', 4675, 78, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:36.714330', 4676, 78, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:36.716372', 4677, 78, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:36.719332', 4678, 78, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:36.722327', 4679, 78, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:36.724327', 4680, 78, NULL, 59, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.524944', 4681, 1, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.529945', 4682, 1, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.532944', 4683, 1, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.535983', 4684, 1, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.538945', 4685, 1, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.541002', 4686, 1, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.543978', 4687, 2, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.546945', 4688, 2, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.549043', 4689, 2, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.551952', 4690, 2, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.555944', 4691, 2, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.557944', 4692, 2, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.562946', 4693, 3, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.564985', 4694, 3, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.567961', 4695, 3, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.571943', 4696, 3, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.573945', 4697, 3, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.575978', 4698, 3, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.580094', 4699, 4, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.582944', 4700, 4, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.584967', 4701, 4, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.588943', 4702, 4, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.591094', 4703, 4, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.594959', 4704, 4, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.597944', 4705, 5, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.599944', 4706, 5, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.606102', 4707, 5, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.608963', 4708, 5, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.612945', 4709, 5, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.614965', 4710, 5, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.617963', 4711, 6, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.620942', 4712, 6, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.623944', 4713, 6, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.625952', 4714, 6, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.629943', 4715, 6, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.631943', 4716, 6, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.633960', 4717, 7, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.636944', 4718, 7, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.638987', 4719, 7, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.641947', 4720, 7, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.644950', 4721, 7, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.646943', 4722, 7, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.649944', 4723, 8, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.652946', 4724, 8, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.654964', 4725, 8, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.656963', 4726, 8, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.658961', 4727, 8, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.661943', 4728, 8, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.664997', 4729, 9, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.668966', 4730, 9, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.673973', 4731, 9, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.678956', 4732, 9, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.683953', 4733, 9, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.689951', 4734, 9, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.693948', 4735, 10, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.697951', 4736, 10, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.700958', 4737, 10, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.704977', 4738, 10, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.706945', 4739, 10, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.710955', 4740, 10, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.713945', 4741, 11, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.715973', 4742, 11, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.719948', 4743, 11, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.721977', 4744, 11, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.723984', 4745, 11, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.727947', 4746, 11, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.729978', 4747, 12, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.731976', 4748, 12, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.734949', 4749, 12, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.737945', 4750, 12, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.739976', 4751, 12, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.742948', 4752, 12, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.745947', 4753, 13, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.747947', 4754, 13, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.750957', 4755, 13, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.753947', 4756, 13, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.755947', 4757, 13, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.758958', 4758, 13, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.761977', 4759, 14, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.763987', 4760, 14, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.766948', 4761, 14, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.769973', 4762, 14, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.772945', 4763, 14, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.774947', 4764, 14, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.777945', 4765, 15, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.780974', 4766, 15, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.783957', 4767, 15, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.786957', 4768, 15, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.788945', 4769, 15, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.791946', 4770, 15, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.794946', 4771, 16, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.796947', 4772, 16, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.799946', 4773, 16, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.802949', 4774, 16, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.805946', 4775, 16, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.807947', 4776, 16, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.810952', 4777, 17, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.813974', 4778, 17, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.815945', 4779, 17, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.819946', 4780, 17, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.821972', 4781, 17, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.824962', 4782, 17, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.830956', 4783, 18, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.834967', 4784, 18, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.839948', 4785, 18, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.845965', 4786, 18, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.849955', 4787, 18, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.854948', 4788, 18, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.858952', 4789, 19, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.861979', 4790, 19, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.864977', 4791, 19, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.867950', 4792, 19, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.870944', 4793, 19, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.873977', 4794, 19, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.876947', 4795, 20, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.879974', 4796, 20, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.882946', 4797, 20, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.885947', 4798, 20, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.888977', 4799, 20, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.891950', 4800, 20, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.895947', 4801, 21, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.897946', 4802, 21, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.900964', 4803, 21, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.904951', 4804, 21, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.906949', 4805, 21, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.910947', 4806, 21, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.912946', 4807, 22, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.915948', 4808, 22, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.918948', 4809, 22, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.921956', 4810, 22, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.924952', 4811, 22, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.928950', 4812, 22, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.931963', 4813, 23, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.934953', 4814, 23, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.937948', 4815, 23, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.940977', 4816, 23, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.944957', 4817, 23, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.947948', 4818, 23, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.950947', 4819, 24, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.954946', 4820, 24, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.957952', 4821, 24, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.960949', 4822, 24, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.963948', 4823, 24, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.966948', 4824, 24, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.969948', 4825, 25, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.972944', 4826, 25, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.974946', 4827, 25, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.977946', 4828, 25, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.980944', 4829, 25, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.982949', 4830, 25, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:40.985945', 4831, 26, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:40.987980', 4832, 26, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:40.990979', 4833, 26, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:40.992981', 4834, 26, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:40.995981', 4835, 26, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:40.997981', 4836, 26, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.000979', 4837, 27, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.003980', 4838, 27, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.005980', 4839, 27, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.007979', 4840, 27, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.011021', 4841, 27, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.012979', 4842, 27, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.014979', 4843, 28, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.017992', 4844, 28, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.020027', 4845, 28, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.021979', 4846, 28, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.024077', 4847, 28, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.026978', 4848, 28, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.029077', 4849, 29, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.031979', 4850, 29, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.033995', 4851, 29, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.036979', 4852, 29, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.038993', 4853, 29, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.041132', 4854, 29, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.043979', 4855, 30, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.046077', 4856, 30, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.047993', 4857, 30, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.049979', 4858, 30, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.052981', 4859, 30, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.055076', 4860, 30, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.056979', 4861, 31, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.058994', 4862, 31, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.062111', 4863, 31, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.063979', 4864, 31, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.066030', 4865, 31, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.070020', 4866, 31, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.074099', 4867, 32, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.078990', 4868, 32, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.082989', 4869, 32, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.088003', 4870, 32, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.093004', 4871, 32, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.097991', 4872, 32, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.103000', 4873, 33, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.107055', 4874, 33, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.111987', 4875, 33, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.115077', 4876, 33, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.117987', 4877, 33, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.121985', 4878, 33, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.124984', 4879, 34, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.129080', 4880, 34, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.131983', 4881, 34, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.133989', 4882, 34, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.137067', 4883, 34, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.139987', 4884, 34, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.144993', 4885, 35, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.147988', 4886, 35, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.149984', 4887, 35, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.153030', 4888, 35, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.156024', 4889, 35, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.158985', 4890, 35, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.161980', 4891, 36, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.164018', 4892, 36, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.165982', 4893, 36, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.169078', 4894, 36, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.171062', 4895, 36, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.173077', 4896, 36, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.174980', 4897, 37, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.177979', 4898, 37, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.180108', 4899, 37, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.182079', 4900, 37, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.186985', 4901, 37, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.191034', 4902, 37, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.195995', 4903, 38, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.199999', 4904, 38, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.204991', 4905, 38, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.207987', 4906, 38, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.211988', 4907, 38, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.216026', 4908, 38, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.218988', 4909, 39, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.222024', 4910, 39, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.224981', 4911, 39, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.227979', 4912, 39, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.231008', 4913, 39, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.235028', 4914, 39, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.239995', 4915, 40, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.243995', 4916, 40, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.247994', 4917, 40, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.252999', 4918, 40, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.257984', 4919, 40, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.261986', 4920, 40, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.265035', 4921, 41, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.267990', 4922, 41, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.272032', 4923, 41, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.274985', 4924, 41, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.278985', 4925, 41, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.282031', 4926, 41, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.285986', 4927, 42, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.289038', 4928, 42, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.291984', 4929, 42, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.294992', 4930, 42, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.299034', 4931, 42, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.301986', 4932, 42, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.305071', 4933, 43, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.307985', 4934, 43, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.311985', 4935, 43, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.316032', 4936, 43, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.318987', 4937, 43, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.322071', 4938, 43, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.325982', 4939, 44, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.329027', 4940, 44, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.332988', 4941, 44, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.336992', 4942, 44, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.339989', 4943, 44, NULL, 60, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 6, '2024-06-26 15:51:41.342992', 4944, 44, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.347025', 4945, 45, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.349980', 4946, 45, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.353026', 4947, 45, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.356024', 4948, 45, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.358998', 4949, 45, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.362020', 4950, 45, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.365022', 4951, 46, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.366985', 4952, 46, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.369982', 4953, 46, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.372983', 4954, 46, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.374987', 4955, 46, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.377981', 4956, 46, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.380075', 4957, 47, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.382076', 4958, 47, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.385050', 4959, 47, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.389052', 4960, 47, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.393990', 4961, 47, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.397989', 4962, 47, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.403001', 4963, 48, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.406993', 4964, 48, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.412992', 4965, 48, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.416041', 4966, 48, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.420987', 4967, 48, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.424986', 4968, 48, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.427986', 4969, 49, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.430982', 4970, 49, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.433987', 4971, 49, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.435984', 4972, 49, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.439070', 4973, 49, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.441037', 4974, 49, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.444065', 4975, 50, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.447069', 4976, 50, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.449069', 4977, 50, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.452095', 4978, 50, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.455067', 4979, 50, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.457982', 4980, 50, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.461023', 4981, 51, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.463022', 4982, 51, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.464980', 4983, 51, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.467980', 4984, 51, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.471062', 4985, 51, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.473020', 4986, 51, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.475982', 4987, 52, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.479021', 4988, 52, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.481080', 4989, 52, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.483983', 4990, 52, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.485981', 4991, 52, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.489020', 4992, 52, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.491024', 4993, 53, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.494020', 4994, 53, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.496986', 4995, 53, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.499982', 4996, 53, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.502982', 4997, 53, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.505068', 4998, 53, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.507983', 4999, 54, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.511025', 5000, 54, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.513065', 5001, 54, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.514981', 5002, 54, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.517987', 5003, 54, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.520983', 5004, 54, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.522980', 5005, 55, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.524979', 5006, 55, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.526979', 5007, 55, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.529036', 5008, 55, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.531040', 5009, 55, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.532981', 5010, 55, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.535993', 5011, 56, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.537979', 5012, 56, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.539978', 5013, 56, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.541988', 5014, 56, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.544978', 5015, 56, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.545979', 5016, 56, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.547978', 5017, 57, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.550979', 5018, 57, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.553030', 5019, 57, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.554981', 5020, 57, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.557981', 5021, 57, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.560978', 5022, 57, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.562979', 5023, 58, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.565018', 5024, 58, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.566980', 5025, 58, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.569076', 5026, 58, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.571076', 5027, 58, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.573077', 5028, 58, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.574990', 5029, 59, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.577982', 5030, 59, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.580032', 5031, 59, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.582075', 5032, 59, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.583979', 5033, 59, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.587021', 5034, 59, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.589080', 5035, 60, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.591041', 5036, 60, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.592986', 5037, 60, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.596024', 5038, 60, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.597980', 5039, 60, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.599992', 5040, 60, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.602982', 5041, 61, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.606018', 5042, 61, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.608989', 5043, 61, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.611019', 5044, 61, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.613076', 5045, 61, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.615076', 5046, 61, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.616982', 5047, 62, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.620022', 5048, 62, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.622045', 5049, 62, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.624077', 5050, 62, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.628990', 5051, 62, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.633989', 5052, 62, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.639047', 5053, 63, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.643995', 5054, 63, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.648045', 5055, 63, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.654046', 5056, 63, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.657989', 5057, 63, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.663989', 5058, 63, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.667994', 5059, 64, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.672039', 5060, 64, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.674988', 5061, 64, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.679035', 5062, 64, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.681986', 5063, 64, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.685986', 5064, 64, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.689073', 5065, 65, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.692990', 5066, 65, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.696069', 5067, 65, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.710045', 5068, 65, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.714987', 5069, 65, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.720056', 5070, 65, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.723991', 5071, 66, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.730040', 5072, 66, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.734021', 5073, 66, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.739049', 5074, 66, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.743011', 5075, 66, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.747998', 5076, 66, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.752987', 5077, 67, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.756985', 5078, 67, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.760987', 5079, 67, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.763984', 5080, 67, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.766987', 5081, 67, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.770027', 5082, 67, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.772980', 5083, 68, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.774983', 5084, 68, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.777980', 5085, 68, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.780006', 5086, 68, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.782005', 5087, 68, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.784980', 5088, 68, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.786997', 5089, 69, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.789005', 5090, 69, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.790980', 5091, 69, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.793980', 5092, 69, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.796054', 5093, 69, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.798088', 5094, 69, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.800095', 5095, 70, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.802089', 5096, 70, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.805091', 5097, 70, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.807091', 5098, 70, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.810091', 5099, 70, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.812090', 5100, 70, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.814089', 5101, 71, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.817097', 5102, 71, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.819128', 5103, 71, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.821088', 5104, 71, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.823108', 5105, 71, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.826095', 5106, 71, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.829089', 5107, 72, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.831108', 5108, 72, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.833089', 5109, 72, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.836092', 5110, 72, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.838093', 5111, 72, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.841089', 5112, 72, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.844097', 5113, 73, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.848096', 5114, 73, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.853101', 5115, 73, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.858097', 5116, 73, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.863097', 5117, 73, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.868101', 5118, 73, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.873094', 5119, 74, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.878102', 5120, 74, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.881101', 5121, 74, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.885098', 5122, 74, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.888092', 5123, 74, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.891092', 5124, 74, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.895134', 5125, 75, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.897089', 5126, 75, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.900094', 5127, 75, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.903090', 5128, 75, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.906089', 5129, 75, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.909091', 5130, 75, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.912088', 5131, 76, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.914090', 5132, 76, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.917096', 5133, 76, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.920088', 5134, 76, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.923122', 5135, 76, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.926100', 5136, 76, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.929090', 5137, 77, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.931125', 5138, 77, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.934093', 5139, 77, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.937091', 5140, 77, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.940091', 5141, 77, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.943103', 5142, 77, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:41.945091', 5143, 78, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:41.948090', 5144, 78, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:41.951093', 5145, 78, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:41.954093', 5146, 78, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:41.956090', 5147, 78, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:51:41.959098', 5148, 78, NULL, 60, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:51:59.987862', 5149, 1, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:51:59.990866', 5150, 1, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:51:59.994863', 5151, 1, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:51:59.996902', 5152, 1, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:51:59.999871', 5153, 1, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.002870', 5154, 1, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.004867', 5155, 2, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.007866', 5156, 2, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.010878', 5157, 2, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.012862', 5158, 2, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.015864', 5159, 2, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.018867', 5160, 2, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.020863', 5161, 3, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.023867', 5162, 3, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.025870', 5163, 3, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.028867', 5164, 3, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.031866', 5165, 3, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.033865', 5166, 3, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.036862', 5167, 4, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.038866', 5168, 4, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.041904', 5169, 4, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.044866', 5170, 4, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.046865', 5171, 4, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.048909', 5172, 4, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.051877', 5173, 5, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.053903', 5174, 5, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.056894', 5175, 5, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.058874', 5176, 5, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.061902', 5177, 5, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.063866', 5178, 5, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.066910', 5179, 6, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.069901', 5180, 6, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.071908', 5181, 6, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.074906', 5182, 6, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.077898', 5183, 6, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.079866', 5184, 6, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.082870', 5185, 7, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.085871', 5186, 7, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.087867', 5187, 7, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.089877', 5188, 7, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.092873', 5189, 7, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.094865', 5190, 7, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.097866', 5191, 8, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.099870', 5192, 8, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.102872', 5193, 8, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.104867', 5194, 8, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.107865', 5195, 8, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.110871', 5196, 8, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.113866', 5197, 9, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.116869', 5198, 9, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.119867', 5199, 9, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.122865', 5200, 9, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.125906', 5201, 9, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.128864', 5202, 9, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.131871', 5203, 10, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.134868', 5204, 10, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.137863', 5205, 10, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.139878', 5206, 10, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.142870', 5207, 10, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.145862', 5208, 10, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.148865', 5209, 11, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.151871', 5210, 11, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.154863', 5211, 11, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.156879', 5212, 11, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.160877', 5213, 11, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.163864', 5214, 11, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.167870', 5215, 12, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.170869', 5216, 12, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.172872', 5217, 12, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.175869', 5218, 12, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.177866', 5219, 12, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.180864', 5220, 12, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.183864', 5221, 13, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.185863', 5222, 13, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.187865', 5223, 13, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.190867', 5224, 13, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.193863', 5225, 13, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.195864', 5226, 13, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.197865', 5227, 14, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.200867', 5228, 14, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.202863', 5229, 14, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.204863', 5230, 14, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.207871', 5231, 14, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.209864', 5232, 14, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.212869', 5233, 15, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.214889', 5234, 15, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.216867', 5235, 15, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.218862', 5236, 15, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.220864', 5237, 15, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.222864', 5238, 15, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.225863', 5239, 16, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.227864', 5240, 16, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.229865', 5241, 16, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.232866', 5242, 16, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.234865', 5243, 16, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.236863', 5244, 16, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.238866', 5245, 17, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.241868', 5246, 17, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.243867', 5247, 17, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.245866', 5248, 17, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.247864', 5249, 17, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.250864', 5250, 17, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.252866', 5251, 18, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.254862', 5252, 18, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.257876', 5253, 18, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.259867', 5254, 18, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.261865', 5255, 18, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.263864', 5256, 18, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.266864', 5257, 19, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.268886', 5258, 19, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.270912', 5259, 19, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.272870', 5260, 19, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.274863', 5261, 19, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.276885', 5262, 19, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.278895', 5263, 20, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.280863', 5264, 20, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.282927', 5265, 20, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.284890', 5266, 20, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.286863', 5267, 20, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.288864', 5268, 20, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.291866', 5269, 21, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.293867', 5270, 21, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.295861', 5271, 21, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.297871', 5272, 21, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.300865', 5273, 21, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.302865', 5274, 21, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.304864', 5275, 22, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.307868', 5276, 22, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.309867', 5277, 22, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.311866', 5278, 22, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.314877', 5279, 22, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.317863', 5280, 22, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.319866', 5281, 23, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.321865', 5282, 23, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.324865', 5283, 23, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.325865', 5284, 23, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.327864', 5285, 23, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.330867', 5286, 23, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.332866', 5287, 24, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.334865', 5288, 24, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.336863', 5289, 24, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.339868', 5290, 24, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.341864', 5291, 24, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.343866', 5292, 24, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.345864', 5293, 25, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.347864', 5294, 25, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.350864', 5295, 25, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.352863', 5296, 25, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.354862', 5297, 25, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.357863', 5298, 25, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.359868', 5299, 26, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.362864', 5300, 26, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.365878', 5301, 26, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.367863', 5302, 26, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.369865', 5303, 26, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.371864', 5304, 26, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.375864', 5305, 27, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.377864', 5306, 27, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.379863', 5307, 27, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.383864', 5308, 27, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.385863', 5309, 27, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.387864', 5310, 27, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.390871', 5311, 28, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.393864', 5312, 28, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.395863', 5313, 28, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.398865', 5314, 28, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.401864', 5315, 28, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.403863', 5316, 28, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.406866', 5317, 29, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.409864', 5318, 29, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.411888', 5319, 29, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.414878', 5320, 29, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.417864', 5321, 29, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.419864', 5322, 29, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.422864', 5323, 30, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.425865', 5324, 30, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.427864', 5325, 30, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.430866', 5326, 30, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.433866', 5327, 30, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.435863', 5328, 30, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.438865', 5329, 31, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.441865', 5330, 31, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.443864', 5331, 31, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.446864', 5332, 31, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.449865', 5333, 31, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.451863', 5334, 31, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.454864', 5335, 32, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.457871', 5336, 32, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.459863', 5337, 32, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.462862', 5338, 32, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.464875', 5339, 32, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.467864', 5340, 32, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.469866', 5341, 33, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.472866', 5342, 33, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.475867', 5343, 33, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.477867', 5344, 33, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.480866', 5345, 33, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.483865', 5346, 33, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.485863', 5347, 34, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.488864', 5348, 34, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.490864', 5349, 34, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.492862', 5350, 34, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.494862', 5351, 34, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.496862', 5352, 34, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.499868', 5353, 35, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.502867', 5354, 35, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.504863', 5355, 35, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.507869', 5356, 35, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.509864', 5357, 35, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.512864', 5358, 35, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.514876', 5359, 36, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.517863', 5360, 36, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.519862', 5361, 36, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.521863', 5362, 36, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.523869', 5363, 36, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.526865', 5364, 36, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.528864', 5365, 37, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.530866', 5366, 37, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.533863', 5367, 37, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.549865', 5368, 37, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.551863', 5369, 37, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.553862', 5370, 37, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.556864', 5371, 38, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.559865', 5372, 38, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.562868', 5373, 38, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.565869', 5374, 38, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.567866', 5375, 38, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.570863', 5376, 38, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.572865', 5377, 39, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.574863', 5378, 39, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.576863', 5379, 39, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.579863', 5380, 39, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.581867', 5381, 39, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.584863', 5382, 39, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.586863', 5383, 40, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.589880', 5384, 40, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.592866', 5385, 40, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.594867', 5386, 40, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.597865', 5387, 40, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.600864', 5388, 40, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.603864', 5389, 41, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.605865', 5390, 41, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.608866', 5391, 41, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.611864', 5392, 41, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.613864', 5393, 41, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.616864', 5394, 41, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.618865', 5395, 42, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.621865', 5396, 42, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.627866', 5397, 42, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.629863', 5398, 42, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.632869', 5399, 42, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.634863', 5400, 42, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.636864', 5401, 43, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.639878', 5402, 43, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.642865', 5403, 43, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.644862', 5404, 43, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.646866', 5405, 43, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.649863', 5406, 43, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.651865', 5407, 44, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.653863', 5408, 44, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.655865', 5409, 44, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.658862', 5410, 44, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.660864', 5411, 44, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.662864', 5412, 44, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.665869', 5413, 45, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.667862', 5414, 45, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.669865', 5415, 45, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.671864', 5416, 45, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.674865', 5417, 45, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.676864', 5418, 45, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.678865', 5419, 46, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.680866', 5420, 46, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.683863', 5421, 46, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.685864', 5422, 46, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.688867', 5423, 46, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.690867', 5424, 46, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.692865', 5425, 47, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.695864', 5426, 47, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.697865', 5427, 47, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.700863', 5428, 47, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.702865', 5429, 47, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.704863', 5430, 47, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.707864', 5431, 48, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.709862', 5432, 48, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.711864', 5433, 48, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.714884', 5434, 48, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.717863', 5435, 48, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.719864', 5436, 48, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.721865', 5437, 49, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.724865', 5438, 49, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.726863', 5439, 49, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.729868', 5440, 49, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.731863', 5441, 49, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.733862', 5442, 49, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.735864', 5443, 50, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.737863', 5444, 50, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.740864', 5445, 50, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.741863', 5446, 50, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.743862', 5447, 50, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.745862', 5448, 50, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.748869', 5449, 51, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.750863', 5450, 51, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.752862', 5451, 51, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.754866', 5452, 51, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.757867', 5453, 51, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.759866', 5454, 51, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.762865', 5455, 52, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.764867', 5456, 52, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.767865', 5457, 52, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.770863', 5458, 52, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.773865', 5459, 52, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.777864', 5460, 52, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.779863', 5461, 53, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.782870', 5462, 53, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.784865', 5463, 53, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.786863', 5464, 53, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.789864', 5465, 53, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.791865', 5466, 53, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.793862', 5467, 54, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.795862', 5468, 54, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.798867', 5469, 54, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.800863', 5470, 54, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.802863', 5471, 54, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.804865', 5472, 54, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.807864', 5473, 55, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.809862', 5474, 55, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.811864', 5475, 55, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.813867', 5476, 55, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.816863', 5477, 55, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.818862', 5478, 55, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.820863', 5479, 56, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.823866', 5480, 56, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.825864', 5481, 56, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.827863', 5482, 56, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.829863', 5483, 56, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.832863', 5484, 56, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.834863', 5485, 57, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.836864', 5486, 57, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.839865', 5487, 57, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.841864', 5488, 57, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.843863', 5489, 57, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.846865', 5490, 57, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.849864', 5491, 58, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.851862', 5492, 58, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.853861', 5493, 58, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.855865', 5494, 58, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.858862', 5495, 58, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.860863', 5496, 58, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.862865', 5497, 59, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.865864', 5498, 59, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.868867', 5499, 59, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.870862', 5500, 59, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.872867', 5501, 59, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.875863', 5502, 59, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.877868', 5503, 60, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.879865', 5504, 60, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.882864', 5505, 60, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.884865', 5506, 60, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.886863', 5507, 60, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.888866', 5508, 60, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.902864', 5509, 61, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.904864', 5510, 61, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.906870', 5511, 61, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.908863', 5512, 61, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.910864', 5513, 61, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.913881', 5514, 61, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.915869', 5515, 62, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.917865', 5516, 62, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.919863', 5517, 62, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.921865', 5518, 62, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.924863', 5519, 62, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.926862', 5520, 62, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.928864', 5521, 63, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.931868', 5522, 63, NULL, 61, 'collaborator1', NULL, '');
INSERT INTO `model_permission_utilisateur` (`value`, `action_permission`, `createdon`, `id`, `model_permission`, `updatedon`, `user`, `createdby`, `sub_attribute`, `updatedby`) VALUES
(b'1', 3, '2024-06-26 15:52:00.933862', 5523, 63, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.935868', 5524, 63, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.938866', 5525, 63, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.941864', 5526, 63, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.944863', 5527, 64, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.947867', 5528, 64, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.949864', 5529, 64, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.951863', 5530, 64, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.954865', 5531, 64, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.957867', 5532, 64, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.959864', 5533, 65, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.962865', 5534, 65, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.965865', 5535, 65, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.967866', 5536, 65, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.969864', 5537, 65, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.972865', 5538, 65, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.975864', 5539, 66, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.978864', 5540, 66, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.980865', 5541, 66, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.983865', 5542, 66, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:00.985863', 5543, 66, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:00.988864', 5544, 66, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:00.991864', 5545, 67, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:00.993863', 5546, 67, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:00.995864', 5547, 67, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:00.998869', 5548, 67, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.001865', 5549, 67, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.003863', 5550, 67, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.006868', 5551, 68, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.009864', 5552, 68, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.011865', 5553, 68, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.014864', 5554, 68, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.017867', 5555, 68, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.019868', 5556, 68, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.022865', 5557, 69, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.025864', 5558, 69, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.028865', 5559, 69, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.031869', 5560, 69, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.034866', 5561, 69, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.036865', 5562, 69, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.039864', 5563, 70, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.042864', 5564, 70, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.044865', 5565, 70, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.047877', 5566, 70, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.050867', 5567, 70, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.053863', 5568, 70, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.055866', 5569, 71, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.058865', 5570, 71, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.061863', 5571, 71, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.064867', 5572, 71, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.067863', 5573, 71, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.069865', 5574, 71, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.071866', 5575, 72, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.075864', 5576, 72, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.078867', 5577, 72, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.080867', 5578, 72, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.083864', 5579, 72, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.086865', 5580, 72, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.089867', 5581, 73, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.092865', 5582, 73, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.095862', 5583, 73, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.097880', 5584, 73, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.101866', 5585, 73, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.103866', 5586, 73, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.106868', 5587, 74, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.109864', 5588, 74, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.111867', 5589, 74, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.114865', 5590, 74, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.117864', 5591, 74, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.120865', 5592, 74, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.122873', 5593, 75, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.125864', 5594, 75, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.128865', 5595, 75, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.130864', 5596, 75, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.133865', 5597, 75, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.136863', 5598, 75, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.138866', 5599, 76, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.141865', 5600, 76, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.144863', 5601, 76, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.146865', 5602, 76, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.150866', 5603, 76, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.152863', 5604, 76, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.155865', 5605, 77, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.158865', 5606, 77, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.160866', 5607, 77, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.163868', 5608, 77, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.167865', 5609, 77, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.169866', 5610, 77, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 1, '2024-06-26 15:52:01.173870', 5611, 78, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 2, '2024-06-26 15:52:01.176865', 5612, 78, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 3, '2024-06-26 15:52:01.179867', 5613, 78, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 4, '2024-06-26 15:52:01.182866', 5614, 78, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 5, '2024-06-26 15:52:01.185865', 5615, 78, NULL, 61, 'collaborator1', NULL, ''),
(b'1', 6, '2024-06-26 15:52:01.188866', 5616, 78, NULL, 61, 'collaborator1', NULL, '');

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
(5617);

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
(1),
(1),
(1),
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
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `pack_student`
--

CREATE TABLE `pack_student` (
  `for_groupe` bit(1) DEFAULT NULL,
  `nombre_cours` int(11) DEFAULT NULL,
  `total_students` int(11) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `level` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expectations` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `old_price` varchar(255) DEFAULT NULL,
  `pre_requisites` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `why_take_this_course` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `color` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parcours`
--

INSERT INTO `parcours` (`nombre_cours`, `numero_order`, `collaborator`, `createdon`, `date_creation`, `date_publication`, `id`, `updatedon`, `code`, `color`, `createdby`, `description`, `libelle`, `updatedby`, `url`) VALUES
(1, 0, NULL, '2024-05-17 21:16:57.723714', NULL, NULL, 1, '2024-06-04 16:18:32.738638', NULL, 'cyan', 'collaborator', NULL, 'Elementary for teens', 'collaborator', 'http://localhost:8036/app/images/OfKwLevI0q/OfKwLevI0q.jpg'),
(2, 0, NULL, '2024-06-26 15:53:38.468793', NULL, NULL, 2, '2024-06-26 15:54:28.322060', 'I', 'violet', 'collaborator1', 'Velit quia impedit', 'Itaque quod esse ul', 'collaborator1', NULL),
(1, 0, NULL, '2024-06-26 15:53:46.281998', NULL, NULL, 3, '2024-06-26 15:53:59.517704', 'V', 'yellow', 'collaborator1', 'Praesentium ullamco ', 'Voluptatem voluptat', 'collaborator1', NULL),
(1, 0, NULL, '2024-05-17 21:26:44.957372', NULL, NULL, 4, '2024-06-26 14:35:48.491765', 'E', 'amber', 'collaborator', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et ante eu turpis pellentesque iaculis. Nullam pharetra.', 'ELEMENTARY', 'collaborator', NULL),
(0, 0, NULL, '2024-05-17 21:27:27.440542', NULL, NULL, 5, NULL, 'P', 'pink', 'collaborator', 'small description', 'PRE INTERMEDIATE', '', 'http://localhost:8036/app/images/dt400EN9no/dt400EN9no.jpg'),
(0, 0, NULL, '2024-05-27 13:21:11.740589', NULL, NULL, 52, NULL, 'L', 'amber', 'collaborator', NULL, 'Lorem ipsum dolor ', '', NULL),
(2, 0, NULL, '2024-05-27 13:32:58.947779', NULL, NULL, 102, '2024-06-26 15:54:08.187560', 'L', 'gray', 'collaborator', NULL, 'Lorem ipsum II', 'collaborator1', NULL);

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
(101),
(201),
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
(1),
(1);

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
(1),
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
(1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `createdon` datetime(6) DEFAULT NULL,
  `date_debut` datetime(6) DEFAULT NULL,
  `date_fin` datetime(6) DEFAULT NULL,
  `exercice` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `seuil_reussite` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1);

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
  `etat_reponse` bit(1) DEFAULT NULL,
  `createdon` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1);

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
('2024-06-26 15:36:42.035125', '2024-06-26 15:36:42.035897', 1, NULL, NULL, 'ROLE_ADMIN', '', ''),
('2024-06-26 15:36:43.873072', '2024-06-26 15:36:43.873072', 2, NULL, NULL, 'ROLE_COLLABORATOR', '', ''),
('2024-06-26 15:47:06.591624', '2024-06-26 15:47:06.606614', 4, NULL, NULL, 'ROLE_ADMIN', '', ''),
('2024-06-26 15:47:09.258633', '2024-06-26 15:47:09.259629', 5, NULL, NULL, 'ROLE_COLLABORATOR', '', ''),
('2024-06-26 15:51:01.116867', '2024-06-26 15:51:01.116867', 9, NULL, NULL, 'ROLE_STUDENT', 'collaborator1', ''),
('2024-06-26 15:51:07.910631', '2024-06-26 15:51:07.910631', 10, NULL, NULL, 'ROLE_STUDENT', 'collaborator1', ''),
('2024-06-26 15:51:16.621470', '2024-06-26 15:51:16.622474', 11, NULL, NULL, 'ROLE_STUDENT', 'collaborator1', ''),
('2024-06-26 15:51:23.567156', '2024-06-26 15:51:23.568155', 12, NULL, NULL, 'ROLE_STUDENT', 'collaborator1', ''),
('2024-06-26 15:51:30.495356', '2024-06-26 15:51:30.495356', 13, NULL, NULL, 'ROLE_TEACHER', 'collaborator1', ''),
('2024-06-26 15:51:35.410052', '2024-06-26 15:51:35.410052', 14, NULL, NULL, 'ROLE_TEACHER', 'collaborator1', ''),
('2024-06-26 15:51:40.391946', '2024-06-26 15:51:40.391946', 15, NULL, NULL, 'ROLE_TEACHER', 'collaborator1', ''),
('2024-06-26 15:51:59.853868', '2024-06-26 15:51:59.853868', 16, NULL, NULL, 'ROLE_COLLABORATOR', 'collaborator1', '');

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
(17);

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
('2024-06-26 15:36:43.476891', 1, 1, NULL, 1, '', ''),
('2024-06-26 15:36:45.257201', 2, 2, NULL, 2, '', ''),
('2024-06-26 15:47:08.590621', 3, 4, NULL, 52, '', ''),
('2024-06-26 15:47:10.956624', 4, 5, NULL, 53, '', ''),
('2024-06-26 15:51:02.615860', 5, 9, NULL, 54, 'collaborator1', ''),
('2024-06-26 15:51:09.291121', 6, 10, NULL, 55, 'collaborator1', ''),
('2024-06-26 15:51:18.201674', 7, 11, NULL, 56, 'collaborator1', ''),
('2024-06-26 15:51:24.856571', 8, 12, NULL, 57, 'collaborator1', ''),
('2024-06-26 15:51:31.882362', 9, 13, NULL, 58, 'collaborator1', ''),
('2024-06-26 15:51:36.727327', 10, 14, NULL, 59, 'collaborator1', ''),
('2024-06-26 15:51:41.963092', 11, 15, NULL, 60, 'collaborator1', ''),
('2024-06-26 15:52:01.191865', 12, 16, NULL, 61, 'collaborator1', '');

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
(13);

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
  `color` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `grp_name` varchar(255) DEFAULT NULL,
  `prof_name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
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
  `numero` bigint(20) DEFAULT NULL,
  `updatedon` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`cours`, `createdon`, `id`, `numero`, `updatedon`, `code`, `createdby`, `description`, `libelle`, `updatedby`) VALUES
(1, '2024-06-26 15:43:13.466785', 1, 1, NULL, NULL, 'collaborator', NULL, 'section 1', '');

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
(51);

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
('2024-06-26 15:51:59.878864', 1, NULL, '', 'collaborator1', 'school', '');

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
(51);

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
  `subscribe` bit(1) DEFAULT NULL,
  `categorie_prof` bigint(20) DEFAULT NULL,
  `collaborator` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
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
  `type_collaborator` bigint(20) DEFAULT NULL,
  `type_teacher` bigint(20) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `dtype` varchar(31) NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `group_option` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`account_non_expired`, `account_non_locked`, `credentials_non_expired`, `enabled`, `password_changed`, `subscribe`, `categorie_prof`, `collaborator`, `created_at`, `created_on`, `fonction`, `groupe_etude`, `id`, `interet_etudiant`, `langue`, `niveau_etude`, `pack_student`, `parcours`, `skill`, `statut_social`, `teacher_locality`, `type_collaborator`, `type_teacher`, `updated_at`, `updated_on`, `dtype`, `about`, `avatar`, `country`, `created_by`, `description`, `email`, `full_name`, `group_option`, `libelle`, `password`, `phone`, `ref`, `updated_by`, `username`) VALUES
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, NULL, '2024-06-26 15:36:42.106893', '2024-06-26 15:36:42.110894', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, '$2a$10$HOsbyXru5c02vFNDIw1QNOzlCEbCjskWEgmYCtf.1eyws8DwqNXqm', NULL, NULL, NULL, 'admin'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, NULL, '2024-06-26 15:36:43.907072', '2024-06-26 15:36:43.909071', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Collaborator', NULL, NULL, NULL, NULL, NULL, 'collaborator', NULL, NULL, NULL, '$2a$10$HOsbyXru5c02vFNDIw1QNOzlCEbCjskWEgmYCtf.1eyws8DwqNXqm', NULL, NULL, NULL, 'collaborator'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, NULL, '2024-06-26 15:47:06.870658', '2024-06-26 15:47:06.874622', NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL, NULL, 'admin1', NULL, NULL, NULL, '$2a$10$HOsbyXru5c02vFNDIw1QNOzlCEbCjskWEgmYCtf.1eyws8DwqNXqm', NULL, NULL, NULL, 'admin1'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, NULL, '2024-06-26 15:47:09.456621', '2024-06-26 15:47:09.462616', NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Collaborator', NULL, NULL, NULL, NULL, NULL, 'collaborator1', NULL, NULL, NULL, '$2a$10$3XyqMkGmx0ciBS8S8fqiZ.6V6JnEDY4V6gvo9ZF8FKxgD9ukB.A62', NULL, NULL, NULL, 'collaborator1'),
(b'1', b'1', b'1', b'1', b'0', b'1', NULL, 53, '2024-06-26 15:51:01.225911', '2024-06-26 15:51:01.227855', NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 15:51:02.640854', 'Etudiant', NULL, NULL, NULL, 'collaborator1', NULL, 'wovyn@mailinator.com', 'Urielle Hawkins', NULL, NULL, '$2a$10$NibxzwCdkbUaLK./DN28EeoQXYDDcTWBFot1gtnRr.2tqNC2lj0rq', '+1 (341) 525-4995', NULL, 'collaborator1', 'wovyn@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', b'1', NULL, 53, '2024-06-26 15:51:08.031571', '2024-06-26 15:51:08.034571', NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 15:51:09.306788', 'Etudiant', NULL, NULL, NULL, 'collaborator1', NULL, 'qalileroxu@mailinator.com', 'Quinn Howard', NULL, NULL, '$2a$10$JT7duaJFdO4om4tZjJuGJ.i4wmFracWnB3ioDpZVf2yPfaKyKVLYu', '+1 (765) 179-5184', NULL, 'collaborator1', 'qalileroxu@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', b'1', NULL, 53, '2024-06-26 15:51:16.785465', '2024-06-26 15:51:16.788472', NULL, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 15:51:18.216506', 'Etudiant', NULL, NULL, NULL, 'collaborator1', NULL, 'jupevuvos@mailinator.com', 'Freya Peck', NULL, NULL, '$2a$10$iAT8eUqwp/KrT6OHPrXEPOEQMEbFUICw9Kr2PffYnrDXMhcmehk4a', '+1 (359) 711-9033', NULL, 'collaborator1', 'jupevuvos@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', b'1', NULL, 53, '2024-06-26 15:51:23.690150', '2024-06-26 15:51:23.692154', NULL, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 15:51:24.869423', 'Etudiant', NULL, NULL, NULL, 'collaborator1', NULL, 'goryguh@mailinator.com', 'Wang Weber', NULL, NULL, '$2a$10$yL3PgttgW5x2aDomphF.XuTocaFn5E0/aCcsTy2xcpc9tjS12MPPq', '+1 (952) 824-8196', NULL, 'collaborator1', 'goryguh@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, 53, '2024-06-26 15:51:30.611393', '2024-06-26 15:51:30.613353', NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Prof', NULL, NULL, NULL, 'collaborator1', NULL, 'fury@mailinator.com', 'Elvis Maldonado', NULL, NULL, '$2a$10$j6N7ttWu1NUL5ykzab9BLOApcEM0LbKegpyuxtD4XnMDMmV4ujyTm', '+1 (305) 602-7732', '', NULL, 'fury@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, 53, '2024-06-26 15:51:35.542982', '2024-06-26 15:51:35.545951', NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Prof', NULL, NULL, NULL, 'collaborator1', NULL, 'supu@mailinator.com', 'Stuart Avila', NULL, NULL, '$2a$10$fraunKambo6FpagjelTliuP4paRy0UgHj6Tr7ropQyUWDIZMcxMnq', '+1 (757) 869-7781', '', NULL, 'supu@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, 53, '2024-06-26 15:51:40.521001', '2024-06-26 15:51:40.522944', NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Prof', NULL, NULL, NULL, 'collaborator1', NULL, 'horidilysy@mailinator.com', 'Dawn Christensen', NULL, NULL, '$2a$10$9Cpw4xkr/5T2JBOG8IF5IuEUZjm69n5i/ZOKxgkVUT7UG5hyFrvTS', '+1 (762) 233-3708', '', NULL, 'horidilysy@mailinator.com'),
(b'1', b'1', b'1', b'1', b'0', NULL, NULL, NULL, '2024-06-26 15:51:59.984921', '2024-06-26 15:51:59.986905', NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Collaborator', NULL, NULL, NULL, 'collaborator1', '', 'howa@mailinator.com', 'Lynn Wheeler', NULL, '', '$2a$10$VSxz1TQ6mWp56oLcsvVvFOgRazOfn1tiBqsl5CudMMIsGt8xblVRO', '+1 (719) 423-6332', NULL, NULL, 'howa@mailinator.com');

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
(151);

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
  ADD UNIQUE KEY `UK_mi1n92hgr8q5fd2y73htyb2rw` (`exercice`);

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
  ADD CONSTRAINT `FK4jtf5cmektmsmtuiorrpnd8i3` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `FKogcgru00bxc9bc173fvt4tog5` FOREIGN KEY (`collaborator`) REFERENCES `user` (`id`);

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
