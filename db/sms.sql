-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 10:34 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `role` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Hardware'),
(2, 'Software'),
(3, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `office_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `code`, `office_code`) VALUES
(1, 'Engineering and Construction Department', 'ECD', 'OTS'),
(2, 'Human Resource Department', 'HRD', 'ADM'),
(3, 'Information and Communication Technology Department', 'ICT', 'ADM'),
(4, 'Accounting and Financial Management Department', 'ACC', 'FIN'),
(5, 'Production and Sanitation Department', 'PSD', 'OTS'),
(6, 'General Services, Property And Materials Management Department', 'GPM', 'ADM'),
(7, 'Pipeline and Appurtenances Maintenance Department', 'PAM', 'OTS'),
(8, 'Corporate Planning, Internal Audit, Community Relation, External Affairs and Legal Department', 'CIC', 'OGM'),
(9, 'Commercial Services Department', 'CSD', 'FIN');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(55) NOT NULL,
  `department_code` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `name`, `code`, `department_code`) VALUES
(1, 'Planning and Design Division', 'PDD', 'ECD'),
(2, 'Mainlines Expansion, Rehabilitation and Civil Works Division', 'MRC', 'ECD'),
(3, 'Recruitment and Personnel Welfare Division', 'RSP', 'HRD'),
(4, 'Training and Development Division', 'TND', 'HRD'),
(5, 'Systems Development and Application Division', 'SDA', 'ICT'),
(6, 'Geographical Information System Division', 'GIS', 'ICT'),
(7, 'General Accounting and Payroll Division', 'APD', 'ACC'),
(8, 'Treasury and Budget Division', 'FMD', 'ACC'),
(9, 'Production and Electromechanical Division', 'PED', 'PSD'),
(10, 'Sanitation Division', 'SAD', 'PSD'),
(11, 'Water Quality Division', 'WQD', 'PSD'),
(12, 'Building and Grounds, Transportation and Water Meter Maintenance Division', 'BTW', 'GPM'),
(13, 'Procurement, Quality Control and Property Division', 'PQP', 'GPM'),
(14, 'Water Distribution and Restoration Division', 'WDR', 'PAM'),
(15, 'Leakage Control and NRW Management Divsion', 'LCN', 'PAM'),
(16, 'Legal Services Management and Operations Audit Division', 'LSO', 'CIC'),
(17, 'Corporate Planning, Public Information and Community Relations Division', 'CPC', 'CIC'),
(18, 'Environment and Watershed Protection Division', 'EWD', 'CIC'),
(19, 'Customer Care and New Service Connection Division', 'CND', 'CSD'),
(20, 'Billing and Accounts Division', 'BAD', 'CSD');

-- --------------------------------------------------------

--
-- Table structure for table `incident_report`
--

CREATE TABLE `incident_report` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `incident` varchar(255) NOT NULL,
  `report_date` date NOT NULL,
  `reporter_name` varchar(255) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `assets` varchar(100) NOT NULL,
  `information_source` varchar(100) NOT NULL,
  `details` varchar(255) NOT NULL,
  `attack_vector` varchar(100) NOT NULL,
  `informational` varchar(100) NOT NULL,
  `functional` varchar(100) NOT NULL,
  `recoverability` varchar(100) NOT NULL,
  `action_taken` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_report`
--

INSERT INTO `incident_report` (`id`, `incident`, `report_date`, `reporter_name`, `contact_number`, `email`, `division`, `assets`, `information_source`, `details`, `attack_vector`, `informational`, `functional`, `recoverability`, `action_taken`) VALUES
(0018, 'test', '2022-06-02', 'troy', '123', 'admin@admin.com', 'Planning and Design Division', 'test', 'RED', 'wqe', 'Lost/Stolen Equipment', '', '', '', 'test'),
(0019, 'test', '2022-06-02', 'troy', '123', 'newacc.troy@gmail.com', 'Building and Grounds, Transportation and Water Meter Maintenance Division', 'test', 'RED', 'sa as', 'Attrition', '', '', '', 'test'),
(0020, 'test', '2022-06-02', 'troy', '123', 'newacc.troy@gmail.com', 'Procurement, Quality Control and Property Division', 'test', 'AMBER', 'das asda', 'Lost/Stolen Equipment', '', '', '', 'test'),
(0022, 'test', '2022-06-02', 'troy', '09531023180', 'admin@admin.com', 'Mainlines Expansion, Rehabilitation and Civil Works Division', 'test', 'WHITE', 'qweq', 'Lost/Stolen Equipment', '', '', '', 'test'),
(0023, 'Ransomware', '2022-06-02', 'Eunice Cunanan', '09123456789', 'eunice@email.com', 'Water Quality Division', 'test', 'GREEN', 'test123', 'Unknown', '', '', '', 'test'),
(0028, 'test', '2022-06-03', 'troy', '123', 'newacc.troy@gmail.com', 'Planning and Design Division', 'test', 'RED', 'qwe', 'Unknown', 'None', 'None', 'Regular', 'qwe'),
(0029, 'test', '2022-06-03', 'troy', '123', 'newacc.troy@gmail.com', 'Planning and Design Division', 'test', 'RED', 'qwe', 'Lost/Stolen Equipment', 'Integrity', 'Low', 'Not Applicable', 'qweq'),
(0030, 'malware', '2022-06-05', 'troy', '09531023180', 'newacc.troy@gmail.com', 'Planning and Design Division', 'test', 'RED', '12222', 'Attrition', 'None', 'None', 'Not Applicable', '2312');

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`id`, `code`, `name`) VALUES
(1, 'BOD', 'Office of the Board of Directors'),
(2, 'ADM', 'Office of the AGM for Administration'),
(3, 'FIN', 'Office of the AGM for Finance'),
(4, 'OTS', 'Office of the AGM for Operations and Technical Services'),
(5, 'OGM', 'Office of the General Manager');

-- --------------------------------------------------------

--
-- Table structure for table `service_slip`
--

CREATE TABLE `service_slip` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `staff_id` varchar(244) NOT NULL,
  `end_user` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `office` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `division` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `category_type` varchar(255) NOT NULL,
  `sub_category` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `remarks` text NOT NULL,
  `slip_status` varchar(100) NOT NULL,
  `date_requested` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_ended` date NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_slip`
--

INSERT INTO `service_slip` (`id`, `staff_id`, `end_user`, `created_by`, `office`, `department`, `division`, `category`, `category_type`, `sub_category`, `details`, `remarks`, `slip_status`, `date_requested`, `date_created`, `date_ended`, `updated_by`, `date_updated`, `status`) VALUES
(0048, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'dom', 'Troy Michael Garidos', 'ADM', 'HRD', 'RSP', 'Software', 'Complex', 'TWMS', 'install tcms', 'reformat and install tcms', 'done', '2022-04-28', '2022-04-29 10:08:32', '2022-05-02', 'troy garidos', '2022-05-27 03:56:37', 'active'),
(0049, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'dom', 'Troy Michael Garidos', 'BOD', 'no dept', 'no Div', 'Hardware', 'Simple', 'Printer', 'test printer defect', 'Change printer', 'done', '2022-04-29', '2022-04-29 15:28:12', '2022-05-02', 'troy garidos', '2022-05-27 03:56:39', 'deleted'),
(0056, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'sherry', 'Troy Michael Garidos', 'FIN', 'ACC', 'APD', 'Software', 'Simple', 'Queuing', 'defect monitor', 'qwe', 'done', '2022-05-02', '2022-05-02 01:50:24', '2022-05-23', 'Admin', '2022-05-27 03:56:41', 'active'),
(0063, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'troy', 'Troy Michael Garidos', 'ADM', 'ICT', 'SDA', 'Hardware', 'Simple', 'System unit', 'asd', 'qwe', 'done', '2022-05-04', '2022-05-06 14:10:41', '2022-05-23', 'Admin', '2022-05-27 03:56:43', 'active'),
(0064, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'lia', 'Troy Michael Garidos', 'ADM', 'GPM', 'BTW', 'Hardware', 'Complex', 'Monitor', 'wqeqewrwqe', 'dadfsd', 'done', '2022-05-06', '2022-05-06 14:22:42', '2022-05-06', 'Troy Michael Garidos', '2022-05-27 03:56:45', 'active'),
(0065, 'd370dd3a-c135-11ec-b3c5-f0761c64040b', 'Mill Gunay', 'Phyll Fragata', 'OTS', 'ECD', 'PDD', 'Software', 'Complex', 'TCMS', 'install tcms', 'qwe', 'done', '2022-05-20', '2022-05-20 10:24:45', '2022-05-23', 'Admin', '2022-05-23 12:00:57', 'active'),
(0066, '1', 'Mill Gunay', 'Admin', 'ADM', 'HRD', 'RSP', 'Software', 'Complex', 'TWMS', 'test', '123', 'cancel', '2022-05-22', '2022-05-22 20:57:18', '2022-05-23', 'Admin', '2022-05-23 16:20:13', 'deleted'),
(0067, '1', 'troy', 'Admin', 'ADM', 'ICT', 'SDA', 'Hardware', 'Complex', 'Internet', '1321\n', '', 'cancel', '2022-05-25', '2022-05-22 20:59:17', '0000-00-00', 'Admin', '2022-05-23 16:20:05', 'deleted'),
(0068, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'Mill Gunay', 'Troy Michael Garidos', 'ADM', 'HRD', 'RSP', 'Hardware', 'Complex', 'Internet', 'qeqwe', '', 'cancel', '2022-05-23', '2022-05-23 13:40:03', '0000-00-00', 'Troy Michael Garidos', '2022-05-27 03:56:30', 'deleted'),
(0069, '44741865-c136-11ec-b3c5-f0761c64040b', 'Domerk Quiton', 'Jhon Henry Alfeche', 'ADM', 'HRD', 'RSP', 'Hardware', 'Simple', 'Printer', 'paper jam', 'damaged, broken.', 'done', '2022-05-23', '2022-05-23 16:21:17', '2022-05-27', 'Admin', '2022-05-27 08:52:51', 'active'),
(0070, '44741865-c136-11ec-b3c5-f0761c64040b', 'Jhon Doe', 'Jhon Henry Alfeche', 'OTS', 'ECD', 'PDD', 'Hardware', 'Simple', 'Internet', 'ethernet wire', 'fixed', 'done', '2022-05-23', '2022-05-23 16:22:01', '2022-05-23', 'Jhon Henry Alfeche', '2022-05-23 16:22:34', 'active'),
(0071, 'd370dd3a-c135-11ec-b3c5-f0761c64040b', 'Mark Dave', 'Phyll Fragata', 'ADM', 'HRD', 'RSP', 'Hardware', 'Simple', 'Internet', 'adsas', '', 'pending', '2022-05-01', '2022-05-23 16:34:46', '0000-00-00', 'Admin', '2022-06-02 22:27:36', 'active'),
(0072, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Mill Gunay', 'Roland Bacayo', 'BOD', 'No Department', 'No Division', 'Hardware', 'Complex', 'Printer', 'paper jam', '', 'pending', '2022-05-23', '2022-05-23 16:36:58', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0073, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Mill Gunay', 'Roland Bacayo', 'FIN', 'CSD', 'CND', 'Hardware', 'Simple', 'Microsoft Office', 'install ms2013', 'installed 2013', 'done', '2022-05-23', '2022-05-23 16:37:32', '2022-05-23', 'Roland Bacayo', '2022-05-23 16:38:00', 'active'),
(0074, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'Mill Gunay', 'Troy Michael Garidos', 'ADM', 'HRD', 'RSP', 'Software', 'Simple', 'TCMS', '123', 'done', 'done', '2022-05-26', '2022-05-26 01:17:46', '2022-05-26', 'Admin', '2022-05-26 15:43:46', 'active'),
(0075, 'd4b20a1d-c116-11ec-8c62-f0761c64040b', 'Mill Gunay', 'Troy Michael Garidos', 'ADM', 'ICT', 'SDA', 'Software', 'Simple', 'TCMS', 'install tcms', 'installed', 'done', '2022-05-26', '2022-05-26 15:45:13', '2022-05-26', 'Troy Michael Garidos', '2022-05-26 15:45:58', 'active'),
(0076, '1', 'Domerk Quiton', 'Admin', 'BOD', 'No Department', 'No Division', 'Hardware', 'Simple', 'Printer', 'paper jam', '', 'cancel', '2022-05-26', '2022-05-26 22:17:18', '0000-00-00', 'Admin', '2022-05-27 04:02:43', 'deleted'),
(0077, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Domerk Quiton', 'Roland Bacayo', 'ADM', 'HRD', 'TND', 'Hardware', 'Simple', 'Printer', 'paper jam', 'fixed printer', 'done', '2022-05-27', '2022-05-27 03:57:37', '2022-05-27', 'Roland Bacayo', '2022-05-27 03:58:46', 'active'),
(0078, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Jhon Doe', 'Roland Bacayo', 'OTS', 'PSD', 'PED', 'Hardware', 'Simple', 'Monitor', 'replace monitor', '', 'pending', '2022-05-27', '2022-05-27 03:57:59', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0079, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Mark Dave', 'Roland Bacayo', 'OTS', 'ECD', 'PDD', 'Software', 'Simple', 'TWMS', 'install TWMS', '', 'pending', '2022-05-27', '2022-05-27 03:58:20', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0080, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Fred Cruz', 'Roland Bacayo', 'BOD', 'No Department', 'No Division', 'Hardware', 'Simple', 'System unit', 'reformat', '', 'pending', '2022-05-27', '2022-05-27 03:59:39', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0081, '52e8d7ef-c136-11ec-b3c5-f0761c64040b', 'Eunice Cunanan', 'Jay Nosotros', 'OTS', 'PSD', 'PED', 'Software', 'Simple', 'TWMS', 'Install TWMS', 'Installed TWMS', 'done', '2022-05-26', '2022-05-27 09:51:23', '2022-05-27', 'Jay Nosotros', '2022-05-27 09:54:39', 'active'),
(0082, '52e8d7ef-c136-11ec-b3c5-f0761c64040b', 'Mark Dave', 'Jay Nosotros', 'FIN', 'ACC', 'APD', 'Hardware', 'Simple', 'Printer', 'Paper Jam', '', 'pending', '2022-05-26', '2022-05-27 09:53:06', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0083, '52e8d7ef-c136-11ec-b3c5-f0761c64040b', 'Mark Villar', 'Jay Nosotros', 'FIN', 'CSD', 'CND', 'Hardware', 'Simple', 'Internet', 'No internet', '', 'pending', '2022-05-26', '2022-05-27 09:54:07', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0084, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Domerk Quiton', 'Roland Bacayo', 'BOD', 'No Department', 'No Division', 'Hardware', 'Simple', 'Printer', 'Paper Jam', 'fix Paper jam, reformat', 'done', '2022-05-26', '2022-05-27 10:28:08', '2022-05-27', 'Roland Bacayo', '2022-05-27 10:28:50', 'active'),
(0085, '1', 'Jhon Doe', 'Admin', 'ADM', 'ICT', 'SDA', 'Hardware', 'Simple', 'Printer', 'fix', 'done', 'done', '2022-06-02', '2022-06-02 22:17:09', '2022-06-02', 'Admin', '2022-06-02 22:30:33', 'active'),
(0086, '1', 'Domerk Quiton', 'Admin', 'BOD', 'No Department', 'No Division', 'Software', 'Simple', 'SRMS', 'test', 'done', 'done', '2022-06-02', '2022-06-02 22:30:52', '2022-06-02', 'Admin', '2022-06-02 22:33:57', 'active'),
(0087, '1', 'Jhon Doe', 'Admin', 'BOD', 'No Department', 'No Division', 'Hardware', 'Simple', 'Printer', 'broken', '', 'pending', '2022-06-02', '2022-06-02 22:31:36', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0088, '1', 'Mark Dave', 'Admin', 'ADM', 'HRD', 'RSP', 'Software', 'Simple', 'SRMS', 'test', '', 'pending', '2022-06-02', '2022-06-02 22:33:00', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0089, '1', 'Jhon Doe', 'Admin', 'ADM', 'ICT', 'SDA', 'Hardware', 'Simple', 'Printer', 'test', '', 'pending', '2022-06-02', '2022-06-02 22:33:21', '0000-00-00', '', '0000-00-00 00:00:00', 'active'),
(0090, 'e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Jhon Doe', 'Roland Bacayo', 'ADM', 'HRD', 'RSP', 'Software', 'Simple', 'TCMS', 'test', 'done', 'done', '2022-06-02', '2022-06-02 23:15:13', '2022-06-02', 'Roland Bacayo', '2022-06-02 23:15:25', 'active'),
(0091, '1', 'Lia Barangan', 'Admin', 'ADM', 'ICT', 'SDA', 'Software', 'Simple', 'HRIS', '', 'Installed ', 'cancel', '2022-06-02', '2022-06-03 12:24:48', '2022-06-03', 'Admin', '2022-06-03 12:34:33', 'deleted'),
(0092, '1', 'Lia Barangan', 'Admin', 'ADM', 'ICT', 'SDA', 'Software', 'Simple', 'TCMS', 'Install TCMS', 'Installed', 'done', '2022-06-02', '2022-06-03 12:35:51', '2022-06-03', 'Admin', '2022-06-03 12:36:20', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `sub_category` varchar(100) NOT NULL,
  `category` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `sub_category`, `category`) VALUES
(1, 'Internet', 'hardware'),
(2, 'Printer', 'hardware'),
(3, 'Monitor', 'hardware'),
(4, 'UPS', 'hardware'),
(5, 'Charger', 'hardware'),
(6, 'IP phone', 'hardware'),
(7, 'Microsoft Office', 'hardware'),
(8, 'Antivirus', 'hardware'),
(9, 'Shared Folder', 'hardware'),
(10, 'Application Installation', 'hardware'),
(11, 'Face Scanner', 'hardware'),
(12, 'System unit', 'hardware'),
(13, 'Operation System', 'hardware'),
(14, 'Power Connection', 'hardware'),
(15, 'File Server', 'hardware'),
(16, 'TCMS', 'software'),
(17, 'TWMS', 'software'),
(18, 'SRMS', 'software'),
(19, 'MRBS', 'software'),
(20, 'eTTMS', 'software'),
(21, 'TUBS', 'software'),
(22, 'HRIS', 'software'),
(23, 'BAMS', 'software'),
(24, 'Queuing', 'software'),
(25, 'APES', 'software'),
(28, 'Requisition of IT Equipment', 'others'),
(29, 'Justification Letter ', 'others');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `status`, `date_created`) VALUES
('44741865-c136-11ec-b3c5-f0761c64040b', 'Jhon Henry', 'Alfeche', 'JAlfeche123', '202cb962ac59075b964b07152d234b70', 'Staff', 'active', '2022-04-21 13:45:36'),
('52e8d7ef-c136-11ec-b3c5-f0761c64040b', 'Jay', 'Nosotros', 'JNosotros123', '202cb962ac59075b964b07152d234b70', 'Staff', 'active', '2022-04-21 13:46:00'),
('d370dd3a-c135-11ec-b3c5-f0761c64040b', 'Phyll', 'Fragata', 'PFragata123', '202cb962ac59075b964b07152d234b70', 'Staff', 'active', '2022-04-21 13:42:26'),
('d4b20a1d-c116-11ec-8c62-f0761c64040b', 'Troy Michael', 'Garidos', 'troy123', '202cb962ac59075b964b07152d234b70', 'Staff', 'active', '2022-04-21 10:00:34'),
('e4bb8fb9-c135-11ec-b3c5-f0761c64040b', 'Roland', 'Bacayo', 'RBacayo123', '202cb962ac59075b964b07152d234b70', 'Staff', 'active', '2022-04-21 13:42:55'),
('fb1829c3-c135-11ec-b3c5-f0761c64040b', 'Deo', 'Del Rosario', 'DDelRosario123', '202cb962ac59075b964b07152d234b70', 'Staff', 'active', '2022-04-21 13:43:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incident_report`
--
ALTER TABLE `incident_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_slip`
--
ALTER TABLE `service_slip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `incident_report`
--
ALTER TABLE `incident_report`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_slip`
--
ALTER TABLE `service_slip`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
