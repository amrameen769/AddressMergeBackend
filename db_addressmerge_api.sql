-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 07:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_addressmerge_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_candidatecategory`
--

CREATE TABLE `core_candidatecategory` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_candidatecategory`
--

INSERT INTO `core_candidatecategory` (`id`, `categoryName`) VALUES
(1, 'Student'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `core_candidates`
--

CREATE TABLE `core_candidates` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phoneNo` varchar(15) NOT NULL,
  `address` longtext NOT NULL,
  `country` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `candidateCategory_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `sponsor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_candidates`
--

INSERT INTO `core_candidates` (`id`, `firstName`, `lastName`, `email`, `phoneNo`, `address`, `country`, `region`, `city`, `zip`, `createdAt`, `status`, `candidateCategory_id`, `owner_id`, `sponsor_id`) VALUES
(4, 'Ravi', 'RP', 'ravirv@gmail.com', '4785698574', 'Ravi Nilayam', 'Australia', 'South Australia', 'Kefwood', '415263', '2020-04-11 11:24:45.009560', 1, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `core_documents`
--

CREATE TABLE `core_documents` (
  `id` int(11) NOT NULL,
  `docName` varchar(100) NOT NULL,
  `docType_id` int(11) DEFAULT NULL,
  `docContent` longtext NOT NULL,
  `lastEdited` datetime(6) NOT NULL,
  `isTemplate` tinyint(1) NOT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `core_documenttypes`
--

CREATE TABLE `core_documenttypes` (
  `id` int(11) NOT NULL,
  `typeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `core_donations`
--

CREATE TABLE `core_donations` (
  `id` int(11) NOT NULL,
  `donationName` varchar(50) NOT NULL,
  `donationDescription` longtext NOT NULL,
  `donationDate` datetime(6) NOT NULL,
  `donationAmount` double NOT NULL,
  `donationBy_id` int(11) DEFAULT NULL,
  `donationTo_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_donations`
--

INSERT INTO `core_donations` (`id`, `donationName`, `donationDescription`, `donationDate`, `donationAmount`, `donationBy_id`, `donationTo_id`, `owner_id`) VALUES
(2, 'Education', 'Annual Education Fees', '2020-04-11 17:47:37.410000', 10000, 4, 4, 1),
(3, 'House Renovation Funds', 'For 100 Houses', '2020-04-11 17:49:55.102000', 24000000, 5, 4, 1),
(4, 'Hospitals', 'for Equipments', '2020-04-11 17:52:08.133000', 45000, 1, 4, 1),
(5, 'Job Loan', 'Monthly', '2020-04-10 18:07:00.000000', 37000, 3, 4, 1),
(6, 'Schools', 'Faculty funding', '2020-04-01 23:00:00.000000', 25000, 3, 4, 1),
(7, 'HM Hospital', 'Funding for new equipment', '2020-04-09 23:55:00.000000', 24000, 5, 4, 1),
(8, 'College', 'Toilets', '2020-04-11 18:27:40.602000', 50000, 4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_sponsorgroup`
--

CREATE TABLE `core_sponsorgroup` (
  `id` int(11) NOT NULL,
  `groupName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_sponsorgroup`
--

INSERT INTO `core_sponsorgroup` (`id`, `groupName`) VALUES
(1, 'International'),
(2, 'Provincial'),
(3, 'Foundation'),
(4, 'MNC');

-- --------------------------------------------------------

--
-- Table structure for table `core_sponsors`
--

CREATE TABLE `core_sponsors` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneNo` varchar(15) NOT NULL,
  `address` longtext NOT NULL,
  `country` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `sponsorGroup_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_sponsors`
--

INSERT INTO `core_sponsors` (`id`, `firstName`, `lastName`, `email`, `phoneNo`, `address`, `country`, `region`, `city`, `zip`, `createdAt`, `status`, `owner_id`, `sponsorGroup_id`) VALUES
(1, 'Al Ameen', 'AR', 'amrameen769@gmail.com', '7025886445', 'Al Ameen Manzil, Thazhe Pangode, Pangode P.O', 'India', 'Kerala', 'Kallara', '695609', '2020-04-06 14:21:39.213295', 1, 1, 2),
(3, 'George', 'Srambickal', 'georgesramb124@gmail.com', '1247589637', 'DiST Hostel, DePaul Institute Of Science And Technology,\nDepaul nagar', 'India', 'Kerala', 'ANGAMALY South', '683573', '2020-04-10 09:54:14.889411', 1, 1, 2),
(4, 'Akhil', 'Johnson', 'akhiljohnson@gmail.com', '+91 97453 75197', 'Thiruthanathil House, Manjapra, Angamaly', 'India', 'Kerala', 'Angamaly', '683573', '2020-04-10 10:10:37.981034', 1, 1, 2),
(5, 'Infosys', 'Foundations', 'contact@infosysftn.com', '4152857447', 'Infosys Campus, Mysore', 'India', 'Kerala', 'Mysore', '789456', '2020-04-10 12:29:20.338060', 1, 8, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `core_candidatecategory`
--
ALTER TABLE `core_candidatecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_candidates`
--
ALTER TABLE `core_candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Core_candidates_sponsor_id_acdde422_fk_Core_sponsors_id` (`sponsor_id`),
  ADD KEY `Core_candidates_candidateCategory_id_d25dd3a5_fk_Core_cand` (`candidateCategory_id`),
  ADD KEY `Core_candidates_owner_id_b3dfd848_fk_auth_user_id` (`owner_id`);

--
-- Indexes for table `core_documents`
--
ALTER TABLE `core_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Core_documents_owner_id_bb4fd10c_fk_auth_user_id` (`owner_id`),
  ADD KEY `Core_documents_docType_id_33c6a239` (`docType_id`);

--
-- Indexes for table `core_documenttypes`
--
ALTER TABLE `core_documenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_donations`
--
ALTER TABLE `core_donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Core_donations_donationBy_id_e04a94c3_fk_Core_sponsors_id` (`donationBy_id`),
  ADD KEY `Core_donations_donationTo_id_a7eb891a_fk_Core_candidates_id` (`donationTo_id`),
  ADD KEY `Core_donations_owner_id_b5bba24f_fk_auth_user_id` (`owner_id`);

--
-- Indexes for table `core_sponsorgroup`
--
ALTER TABLE `core_sponsorgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_sponsors`
--
ALTER TABLE `core_sponsors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Core_sponsors_owner_id_5593512e_fk_auth_user_id` (`owner_id`),
  ADD KEY `Core_sponsors_sponsorGroup_id_08259c7a_fk_Core_sponsorgroup_id` (`sponsorGroup_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `core_candidatecategory`
--
ALTER TABLE `core_candidatecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_candidates`
--
ALTER TABLE `core_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_documents`
--
ALTER TABLE `core_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_documenttypes`
--
ALTER TABLE `core_documenttypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_donations`
--
ALTER TABLE `core_donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `core_sponsorgroup`
--
ALTER TABLE `core_sponsorgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_sponsors`
--
ALTER TABLE `core_sponsors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `core_candidates`
--
ALTER TABLE `core_candidates`
  ADD CONSTRAINT `Core_candidates_candidateCategory_id_d25dd3a5_fk_Core_cand` FOREIGN KEY (`candidateCategory_id`) REFERENCES `core_candidatecategory` (`id`),
  ADD CONSTRAINT `Core_candidates_owner_id_b3dfd848_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `Core_candidates_sponsor_id_acdde422_fk_Core_sponsors_id` FOREIGN KEY (`sponsor_id`) REFERENCES `core_sponsors` (`id`);

--
-- Constraints for table `core_documents`
--
ALTER TABLE `core_documents`
  ADD CONSTRAINT `Core_documents_docType_id_33c6a239_fk_Core_documenttypes_id` FOREIGN KEY (`docType_id`) REFERENCES `core_documenttypes` (`id`),
  ADD CONSTRAINT `Core_documents_owner_id_bb4fd10c_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_donations`
--
ALTER TABLE `core_donations`
  ADD CONSTRAINT `Core_donations_donationBy_id_e04a94c3_fk_Core_sponsors_id` FOREIGN KEY (`donationBy_id`) REFERENCES `core_sponsors` (`id`),
  ADD CONSTRAINT `Core_donations_donationTo_id_a7eb891a_fk_Core_candidates_id` FOREIGN KEY (`donationTo_id`) REFERENCES `core_candidates` (`id`),
  ADD CONSTRAINT `Core_donations_owner_id_b5bba24f_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_sponsors`
--
ALTER TABLE `core_sponsors`
  ADD CONSTRAINT `Core_sponsors_owner_id_5593512e_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `Core_sponsors_sponsorGroup_id_08259c7a_fk_Core_sponsorgroup_id` FOREIGN KEY (`sponsorGroup_id`) REFERENCES `core_sponsorgroup` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
