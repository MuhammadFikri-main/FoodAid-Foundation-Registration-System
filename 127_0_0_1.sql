-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2019 at 07:02 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faf`
--
CREATE DATABASE IF NOT EXISTS `faf` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `faf`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nric` varchar(14) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `type`, `status`, `name`, `email`, `nric`, `address`, `contact`, `profession`, `username`, `password`) VALUES
(1, 'volunteer', 'reject', 'Nazrul Naim', 'nazrulnaimiya@gmail.com', '990714-14-6188', 'Selangor', '014-5223562', 'Cashier', 'nazrulnaim', '12345'),
(6, 'beneficiairies', 'reject', 'Aiman Bin Hamdan', 'nazrulnaimiya1@gmail.com', '990704-14-6127', 'Selangor', '014-6523562', 'Teacher', 'Aiman', '12345'),
(56, 'volunteer', 'accept', 'Muhammad Rafie', 'nazrulnaimiya2@gmail.com', '990704-14-6127', 'Selangor', '014-5628956', 'CEO', 'naim', '123'),
(57, 'beneficiairies', 'accept', 'Fakhrul Fahmi Bin Rais', 'nazrulnaimiya3@gmail.com', '990808-14-6565', 'klng', '014-5623562', 'ceo', 'miee', '123'),
(58, 'Executive', 'Staff', 'muhammad ahmadi bin halim', 'foodfoundationm@gmail.com', '911001-01-1111', 'no 17,jalan perimbun 2,taman alam,selangor', '013-3533572', 'Executive', 'ahmadi', '123'),
(59, 'volunteer', 'accept', 'Muhammad Zamri', 'nazrulnaimiya4@gmail.com', '990707-55-6999', 'klang,selangor', '014-6532165', 'ceo', 'naim67', '123'),
(60, 'beneficiairies', 'pending', 'muhammad fikri bin hasnizam', 'mfikri44991@gmail.com', '990404-01-5141', 'pasir gudang,johor', '011-40420880', 'student', 'fikri', '123'),
(61, 'volunteer', 'pending', 'muhammad hafiz bin kamaruddin', 'hafiz@gmail.com', '990404-01-5141', 'Pasir Gudang,johor', '011-40420880', 'Student', 'hafiz', '123'),
(62, 'beneficiairies', 'pending', 'Aiman norhakim bin jailani', 'norhakim@gmai.com', '990404-01-5141', 'Taman molek,johor', '011-40420880', 'student', 'aiman01', '123'),
(63, 'volunteer', 'pending', 'Muhammad Firdaus Bin Ahmad Nazri', 'firdaus@gmail.com', '990101-01-3452', 'banting,selangor', '011-40420880', 'student', 'daus', '123'),
(64, 'volunteer', 'reject', 'Muhammad Arif bin Saari', 'mfikri4499@gmail.com', '990404-01-5141', 'klang,selangor', '011-40000888', 'student', 'arif', '123'),
(65, 'beneficiairies', 'pending', 'Nur aisyah binti rahman', 'mfikri44992@gmail.com', '990402-01-5634', 'skudai,johor', '011-30409228', 'Student', 'aisyah', '123'),
(66, 'volunteer', 'pending', 'Syahmi Bin Shariman', 'syahmi@gmail.com', '981103-10-2312', 'kajang,selangor', '012-4658277', 'Engineer', 'syahmi', '123'),
(67, 'volunteer', 'reject', 'Muhammad Syafiq Bin Jamal', 'nazrulnaimiya@gmail.com', '990404-10-5141', 'Putrajaya', '013-23409872', 'Professor', 'syafiq', '123'),
(68, 'beneficiairies', 'pending', 'Muhammad Fadhli bin Rashid', 'fadhli@gmail.com', '990303-10-8769', 'Batu Pahat,johor', '011-20349512', 'Student', 'fadhli', '123');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` int(255) NOT NULL,
  `acc_id` int(255) NOT NULL,
  `type_of_home` varchar(255) NOT NULL,
  `no_of_people` int(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `no_of_worker` int(255) NOT NULL,
  `meals_per_day` int(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `specific_food` varchar(255) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `kitchen` varchar(255) NOT NULL,
  `facilities` varchar(255) NOT NULL,
  `cold_storage` varchar(255) NOT NULL,
  `chef` varchar(255) NOT NULL,
  `kind_of_food` varchar(255) NOT NULL,
  `purchase_food` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`id`, `acc_id`, `type_of_home`, `no_of_people`, `age`, `gender`, `no_of_worker`, `meals_per_day`, `religion`, `specific_food`, `vehicle`, `kitchen`, `facilities`, `cold_storage`, `chef`, `kind_of_food`, `purchase_food`) VALUES
(1, 6, 'ORPHANAGE ', 78, '0-6 ', 'Male ', 78, 78, 'Islam ', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Salt ', 'Yes'),
(2, 57, 'ORPHANAGE ', 12, '0-6 ', 'Male ', 12, 12, 'Islam ', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Salt ', 'No'),
(3, 60, 'ORPHANAGE ', 50, '0-6 7-12 ', 'Male Female ', 10, 3, 'Islam ', 'Yes', 'Yes', 'No', 'No', 'Yes', 'Yes', 'Salt Sugar Tea/Coffee ', 'No'),
(4, 62, 'ORPHANAGE ', 20, '0-6 ', 'Male ', 7, 3, 'Islam ', 'No', 'No', 'Yes', 'No', 'No', 'No', 'Salt ', 'Yes'),
(5, 65, 'SHELTER FOR HOMELESS PEOPLE ', 50, '26-50 >50 ', 'Male Female ', 10, 3, 'Islam ', 'Yes', 'No', 'Yes', 'No', 'No', 'Yes', 'Salt Tea/Coffee ', 'Yes'),
(6, 68, 'ORPHANAGE SPECIAL CARE CENTER FOR DISABLED PEOPLE ', 60, '0-6 13-18 ', 'Male Female ', 5, 3, 'Islam Christianity ', 'Yes', 'No', 'No', 'Yes', 'Yes', 'No', 'Salt Tea/Coffee ', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `start` time(6) NOT NULL,
  `end` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `address`, `date`, `start`, `end`) VALUES
(10, 'Hari Kanak-kanak', 'jabatan kanak-kanak dunia', '20-06-2019', '08:00:00.000000', '17:00:00.000000'),
(12, 'hari buruh 2019', 'pejabat awam selangor\r\n', '19-06-2019', '10:00:00.000000', '12:00:00.000000'),
(13, 'Majlis Pembukaan Dewan Besar', 'dewan besar', '19-06-2019', '10:00:00.000000', '12:00:00.000000'),
(15, 'bantuan mangsa banjir', 'skudai', '20-06-2019', '08:00:00.000000', '17:00:00.000000'),
(16, 'Hari Kesedaran Kanser', 'Cheras Kuala Lumpur', '14-06-2019', '08:00:00.000000', '21:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `financial`
--

CREATE TABLE `financial` (
  `activity` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `budget` int(255) NOT NULL,
  `id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial`
--

INSERT INTO `financial` (`activity`, `title`, `month`, `year`, `budget`, `id`) VALUES
('programme', 'hari kanak-kanak', 'august', '2019', 5000, 7),
('programme', 'Majlis Reunion', 'january', '2018', 5000, 11),
('aid', 'hari buruh', 'April', '2018', 200, 15),
('programme', 'minggu Kewangan', 'June', '2019', 4000, 16),
('programme', 'makan makan', 'february', '2018', 1000, 17),
('aid', 'kempen berjimat cermat', 'June', '2019', 2000, 18),
('programme', 'Bantuan Mangsa Banjir', 'May', '2019', 500, 20),
('programme', 'bantuan mangsa banjir 2.0', 'May', '2019', 450, 21),
('programme', 'Mangsa Banjir', 'June', '2019', 500, 22),
('programme', 'Bantuan Rumah Sakit', 'October', '2019', 2000, 23),
('aid', 'Sesi Mesra Pelanggan', 'May', '2019', 500, 24),
('programme', 'Kempen Jimat Cermat', 'June', '2019', 500, 25);

-- --------------------------------------------------------

--
-- Table structure for table `home_information`
--

CREATE TABLE `home_information` (
  `id` int(255) NOT NULL,
  `acc_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_information`
--

INSERT INTO `home_information` (`id`, `acc_id`, `name`, `address`, `telephone`, `mobile`, `email`, `fax`, `registration_no`, `owner`) VALUES
(1, 6, 'Kasih Harmoni', 'klang', '014-5653555', '014-5652356', 'nazrulnaimiya@gmail.com', '60-56-23562353', '012345678912', 'CEO'),
(2, 57, 'kasih', 'klng', '014-6383235', '014-8956235', 'nazrulnaimiya@gmail.com', '02-560123456789', '012345678912', 'ceo'),
(3, 60, 'rumah kebajikan rahmat', 'no18,jalan jaya diri,batu pahat,johor', '-', '011-40420880', 'mfikri4499@gmail.com', '-', '123456789098', 'Muhammad rafizal bin romzi'),
(4, 62, 'rumah kebajikan an-nur', 'taman molek.johor', '-', '011-40420880', 'annurhouse@gmail.com', '-', '-', 'Muhammad rafizul bin Shamsiah'),
(5, 65, 'Titian Rahman', 'jalan kesuma 18', '-', '011-34430998', 'aisyah@gmail.com', '-', '-', 'rahman bin shamsul'),
(6, 68, 'Rumah Kebajikan Fadhli', 'jalan Jaya diri 1/10', '-', '011-20300881', 'fadhli@gmail.com', '-', '-', 'Muhamad jamal bin halim');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(255) NOT NULL,
  `acc_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_from` varchar(255) NOT NULL,
  `date_to` varchar(255) NOT NULL,
  `type_of_donation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `acc_id`, `name`, `date_from`, `date_to`, `type_of_donation`) VALUES
(1, 6, 'Hisham', '13-06-2019', '28-06-2019', 'Money'),
(2, 57, 'miiieee', '13-06-2019', '13-06-2019', 'money'),
(3, 60, 'amsyar bin samsudin', '14-03-2018', '22-05-2019', 'bantuan kewangan'),
(4, 62, 'muhammad rafie bin rafizal', '15-08-2019', '23-10-2019', 'bantuan kewangan'),
(5, 65, '-', '-', '-', '-'),
(6, 68, '-', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(255) NOT NULL,
  `acc_id` int(255) NOT NULL,
  `voluntary_work` varchar(255) NOT NULL,
  `member_of_ngo` varchar(255) NOT NULL,
  `foodhandling_exp` varchar(255) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `interest` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`id`, `acc_id`, `voluntary_work`, `member_of_ngo`, `foodhandling_exp`, `transport`, `interest`) VALUES
(1, 1, 'Yes', 'No', 'Yes', 'Yes', 'Fund Raising '),
(2, 56, 'Yes', 'No', 'Yes', 'No', 'Fund Raising '),
(3, 59, 'Yes', 'No', 'Yes', 'No', 'Fund Raising '),
(4, 61, 'Yes', 'No', 'No', 'Yes', 'Fund Raising Admin '),
(5, 63, 'Yes', 'No', 'No', 'Yes', 'Fund Raising Communication '),
(6, 64, 'Yes', 'No', 'No', 'Yes', 'Fund Raising Event Organising '),
(7, 66, 'Yes', 'No', 'Yes', 'Yes', 'Admin '),
(8, 67, 'Yes', 'No', 'No', 'Yes', 'Fund Raising Communication ');

-- --------------------------------------------------------

--
-- Table structure for table `work_experience`
--

CREATE TABLE `work_experience` (
  `id` int(255) NOT NULL,
  `acc_id` int(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `year_from` varchar(255) NOT NULL,
  `year_to` varchar(255) NOT NULL,
  `last_salary` varchar(255) NOT NULL,
  `leave_reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_experience`
--

INSERT INTO `work_experience` (`id`, `acc_id`, `company_name`, `position`, `year_from`, `year_to`, `last_salary`, `leave_reason`) VALUES
(1, 1, 'Harmani', 'Cashier', '13-06-2019', '21-06-2019', 'RM 1500', 'Study'),
(2, 56, 'naim', 'ceo', '13-06-2019', '13-06-2019', 'RM 500', 'study'),
(3, 59, 'Syarikat air johor', 'staff', '13-06-2019', '13-06-2019', 'RM 500', 'better offer'),
(4, 61, 'Syarikat Perairan', 'engineer', '16-02-2017', '20-03-2019', 'RM 2500', 'better offer'),
(5, 63, '-', '-', '-', '-', '-', '-'),
(6, 64, '-', '-', '-', '-', '-', '-'),
(7, 66, '-', '-', '-', '-', '-', '-'),
(8, 67, '-', '-', '-', '-', '-', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financial`
--
ALTER TABLE `financial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_information`
--
ALTER TABLE `home_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_experience`
--
ALTER TABLE `work_experience`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `financial`
--
ALTER TABLE `financial`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `home_information`
--
ALTER TABLE `home_information`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `work_experience`
--
ALTER TABLE `work_experience`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
