-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2014 at 11:47 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Table structure for table `ability`
--

CREATE TABLE IF NOT EXISTS `ability` (
  `studentno` varchar(10) NOT NULL,
  `ability` varchar(45) NOT NULL COMMENT 'can be skill, talent, expertise',
  PRIMARY KEY (`studentno`),
  KEY `ability` (`ability`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `association`
--

CREATE TABLE IF NOT EXISTS `association` (
  `studentno` varchar(10) NOT NULL,
  `assocname` varchar(60) NOT NULL COMMENT 'includes organizations/foundations, etc. ',
  PRIMARY KEY (`studentno`),
  KEY `assocname` (`assocname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE IF NOT EXISTS `award` (
  `awardno` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` varchar(10) NOT NULL,
  `awardtitle` varchar(45) NOT NULL,
  `awardbody` varchar(60) DEFAULT NULL,
  `dategiven` date DEFAULT NULL,
  `awardcol` varchar(45) NOT NULL,
  PRIMARY KEY (`awardno`),
  KEY `studentno` (`studentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `idcompany` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `educationalbg`
--

CREATE TABLE IF NOT EXISTS `educationalbg` (
  `bgno` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` varchar(10) NOT NULL,
  `school` int(11) NOT NULL,
  `yearstart` year(4) NOT NULL,
  `yearend` year(4) NOT NULL,
  `level` varchar(45) NOT NULL COMMENT 'primary, secondary, tertiary',
  `graduate` tinyint(1) DEFAULT NULL COMMENT '1 - graduated\n0 - not',
  `course` varchar(45) DEFAULT NULL COMMENT 'if level is tertiary, course is required\n\nthis includes masters and doctorate degrees',
  `honors` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bgno`),
  KEY `studentno` (`studentno`),
  KEY `fk_educationalbg_school1_idx` (`school`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `graduate`
--

CREATE TABLE IF NOT EXISTS `graduate` (
  `student_no` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `midname` varchar(45) DEFAULT NULL,
  `sex` varchar(6) NOT NULL,
  `bdate` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileno` varchar(11) NOT NULL,
  `telno` int(8) DEFAULT NULL,
  `field` varchar(45) NOT NULL,
  `major` varchar(45) DEFAULT NULL,
  `graduatedate` char(7) NOT NULL,
  PRIMARY KEY (`student_no`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `graduate`
--

-- --------------------------------------------------------

--
-- Table structure for table `grant`
--

CREATE TABLE IF NOT EXISTS `grant` (
  `studentno` varchar(10) NOT NULL,
  `grantname` varchar(45) NOT NULL,
  `grantor` varchar(45) DEFAULT NULL,
  `granttype` varchar(45) DEFAULT NULL COMMENT '* personal\n* government\n* others',
  `grantyear` year(4) DEFAULT NULL COMMENT 'year effective of grant',
  PRIMARY KEY (`studentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `studentno` varchar(10) NOT NULL,
  `language` varchar(45) NOT NULL,
  PRIMARY KEY (`studentno`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profexam`
--

CREATE TABLE IF NOT EXISTS `profexam` (
  `studentno` varchar(10) NOT NULL,
  `profexamname` varchar(60) NOT NULL,
  `datetaken` date NOT NULL,
  `rating` decimal(10,0) NOT NULL,
  PRIMARY KEY (`studentno`),
  KEY `profexamname` (`profexamname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `studentno` varchar(10) NOT NULL,
  `projecttitle` varchar(60) NOT NULL,
  `projectdesc` varchar(300) DEFAULT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  PRIMARY KEY (`studentno`),
  KEY `projecttitle` (`projecttitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE IF NOT EXISTS `publication` (
  `publicationno` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` varchar(20) NOT NULL,
  `publicationtitle` varchar(60) NOT NULL,
  `publicationdate` date NOT NULL,
  `publicationdesc` varchar(300) DEFAULT NULL,
  `publicationbody` varchar(45) DEFAULT NULL,
  `publicationpeers` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentno`),
  KEY `publicationno` (`publicationno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `idschool` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idschool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `update`
--

CREATE TABLE IF NOT EXISTS `update` (
  `studentno` varchar(10) NOT NULL,
  `updateindex` int(11) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `author` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`studentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `workid` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` varchar(10) NOT NULL,
  `idcompany` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `supervisor` tinyint(1) DEFAULT NULL,
  `companytype` tinyint(1) NOT NULL COMMENT 'private-0 (including self-employed)\ngovernment-1',
  `employmentstatus` varchar(45) DEFAULT NULL COMMENT 'values check box on UI :)\nregular or permanent, temporary, casual, contractual, self-employed',
  PRIMARY KEY (`workid`),
  KEY `studentno` (`studentno`),
  KEY `fk_work_graduate_idx` (`studentno`),
  KEY `fk_company_idcompany_idx` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ability`
--
ALTER TABLE `ability`
  ADD CONSTRAINT `fk_ability_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `association`
--
ALTER TABLE `association`
  ADD CONSTRAINT `fk_association_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `fk_award_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `educationalbg`
--
ALTER TABLE `educationalbg`
  ADD CONSTRAINT `fk_educationalbg_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_educationalbg_school1` FOREIGN KEY (`school`) REFERENCES `school` (`idschool`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `grant`
--
ALTER TABLE `grant`
  ADD CONSTRAINT `fk_grant_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `language`
--
ALTER TABLE `language`
  ADD CONSTRAINT `fk_language_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profexam`
--
ALTER TABLE `profexam`
  ADD CONSTRAINT `fk_profexam_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `fk_project_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `fk_publication_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `update`
--
ALTER TABLE `update`
  ADD CONSTRAINT `fk_update_graduate1` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `fk_work_graduate` FOREIGN KEY (`studentno`) REFERENCES `graduate` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_company_idcompany` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
