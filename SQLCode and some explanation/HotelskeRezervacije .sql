-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2019 at 12:18 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelskerezervacije`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `Id` int(11) NOT NULL,
  `Naziv` varchar(30) NOT NULL,
  `Drzava` varchar(30) NOT NULL,
  `Grad` varchar(30) NOT NULL,
  `Adresa` varchar(30) NOT NULL,
  `BrojZvezdica` smallint(30) NOT NULL,
  `Fotografija` longblob NOT NULL,
  `Opis` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klijenti`
--

CREATE TABLE `klijenti` (
  `Id` int(11) NOT NULL,
  `Ime` varchar(30) NOT NULL,
  `Prezime` varchar(30) NOT NULL,
  `KIme` varchar(30) NOT NULL,
  `Sifra` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefon` varchar(50) NOT NULL,
  `Adresa` varchar(50) NOT NULL,
  `Grad` varchar(30) NOT NULL,
  `Drzava` varchar(30) NOT NULL,
  `Poeni` int(30) NOT NULL,
  `PostanskiBroj` varchar(10) NOT NULL,
  `RolaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klijenti`
--

INSERT INTO `klijenti` (`Id`, `Ime`, `Prezime`, `KIme`, `Sifra`, `Email`, `Telefon`, `Adresa`, `Grad`, `Drzava`, `Poeni`, `PostanskiBroj`, `RolaID`) VALUES
(143, 'Neko', 'Nesto', 'admin', 'admin', 'admin', 'admin@gmail.com', '06666666', 'Neka', 'Tanzanija', 10000, '1111', 2);

-- --------------------------------------------------------

--
-- Table structure for table `menadzerihotela`
--

CREATE TABLE `menadzerihotela` (
  `KlijentID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rezervacije`
--

CREATE TABLE `rezervacije` (
  `Id` int(11) NOT NULL,
  `DatumDolaska` date NOT NULL,
  `DatumOdlaska` date NOT NULL,
  `Novac` decimal(10,0) NOT NULL,
  `BrojOdraslih` smallint(6) NOT NULL,
  `BrojDece` smallint(6) NOT NULL,
  `SobaID` int(11) NOT NULL,
  `KlijentID` int(11) NOT NULL,
  `VremeOdlaska` time NOT NULL,
  `StatusRezervacije` tinyint(1) NOT NULL,
  `Poeni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(11) NOT NULL,
  `Naziv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Naziv`) VALUES
(1, 'Klijent'),
(2, 'Administrator'),
(3, 'Menadžer hotela');

-- --------------------------------------------------------

--
-- Table structure for table `sobe`
--

CREATE TABLE `sobe` (
  `Id` int(11) NOT NULL,
  `BrojSobe` varchar(20) NOT NULL,
  `TipSobeID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `Fotografija` longblob NOT NULL,
  `Opis` varchar(100) NOT NULL,
  `KratkiOpis` varchar(50) NOT NULL,
  `Cena` decimal(10,0) NOT NULL,
  `Kapacitet` smallint(6) NOT NULL,
  `Poeni` int(11) NOT NULL,
  `CenaUPoenima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipsobe`
--

CREATE TABLE `tipsobe` (
  `Id` int(11) NOT NULL,
  `Naziv` varchar(50) NOT NULL,
  `HotelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `klijenti`
--
ALTER TABLE `klijenti`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `KIme` (`KIme`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RolaID` (`RolaID`);

--
-- Indexes for table `menadzerihotela`
--
ALTER TABLE `menadzerihotela`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `HotelID` (`HotelID`),
  ADD KEY `KlijentID` (`KlijentID`);

--
-- Indexes for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SobaID` (`SobaID`),
  ADD KEY `KlijentID` (`KlijentID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sobe`
--
ALTER TABLE `sobe`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `sobe_ibfk_1` (`HotelID`),
  ADD KEY `sobe_ibfk_2` (`TipSobeID`);

--
-- Indexes for table `tipsobe`
--
ALTER TABLE `tipsobe`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `tipsobe_ibfk_1` (`HotelID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `klijenti`
--
ALTER TABLE `klijenti`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `menadzerihotela`
--
ALTER TABLE `menadzerihotela`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rezervacije`
--
ALTER TABLE `rezervacije`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sobe`
--
ALTER TABLE `sobe`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipsobe`
--
ALTER TABLE `tipsobe`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klijenti`
--
ALTER TABLE `klijenti`
  ADD CONSTRAINT `klijenti_ibfk_2` FOREIGN KEY (`RolaID`) REFERENCES `role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menadzerihotela`
--
ALTER TABLE `menadzerihotela`
  ADD CONSTRAINT `menadzerihotela_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menadzerihotela_ibfk_2` FOREIGN KEY (`KlijentID`) REFERENCES `klijenti` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD CONSTRAINT `rezervacije_ibfk_1` FOREIGN KEY (`SobaID`) REFERENCES `sobe` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacije_ibfk_2` FOREIGN KEY (`KlijentID`) REFERENCES `klijenti` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sobe`
--
ALTER TABLE `sobe`
  ADD CONSTRAINT `sobe_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sobe_ibfk_2` FOREIGN KEY (`TipSobeID`) REFERENCES `tipsobe` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tipsobe`
--
ALTER TABLE `tipsobe`
  ADD CONSTRAINT `tipsobe_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
