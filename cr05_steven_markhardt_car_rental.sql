-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Dez 2019 um 23:40
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr05_steven_markhardt_car_rental`
--
CREATE DATABASE IF NOT EXISTS `cr05_steven_markhardt_car_rental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr05_steven_markhardt_car_rental`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_park`
--

CREATE TABLE `car_park` (
  `car_id` int(11) NOT NULL,
  `car_mod` varchar(55) DEFAULT NULL,
  `car_type` varchar(55) DEFAULT NULL,
  `init_milage` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_park`
--

INSERT INTO `car_park` (`car_id`, `car_mod`, `car_type`, `init_milage`, `available`) VALUES
(1, 'BMW', 'SUV', 30000, 1),
(2, 'MiniCooper', 'compact', 2016, 1),
(3, 'Jaguar', 'classic', 1989, 0),
(4, 'Mercedes', 'E-Class', 30000, 1),
(5, 'FIAT', 'combi', 10000, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contract`
--

CREATE TABLE `contract` (
  `contract_id` int(11) NOT NULL,
  `fk_inq_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `contract_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `contract`
--

INSERT INTO `contract` (`contract_id`, `fk_inq_id`, `fk_employee_id`, `contract_date`) VALUES
(1, 1, 1, '2019-01-07'),
(2, 2, 2, '2019-01-07'),
(3, 3, 4, '2019-01-07'),
(4, 4, 5, '2019-01-07');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_first_name` varchar(55) DEFAULT NULL,
  `employee_last_name` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_first_name`, `employee_last_name`) VALUES
(1, 'Roberta', 'TheGreat'),
(2, 'Johnny', 'TheKing'),
(3, 'Gudrun', 'DOE'),
(4, 'Salsa', 'Verde'),
(5, 'Dagobert', 'Duck');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `end_loc`
--

CREATE TABLE `end_loc` (
  `end_loc_id` int(11) NOT NULL,
  `address_el` varchar(55) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `milage_end` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `end_loc`
--

INSERT INTO `end_loc` (`end_loc_id`, `address_el`, `pick_up_date`, `milage_end`) VALUES
(1, 'DROPOFF1', '2019-03-30', 125625),
(2, 'DROPOFF2', '0000-00-00', 125625),
(3, 'DROPOFF3', '2019-04-30', 125625),
(4, 'DROPOFF4', '2019-05-30', 125625);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inquiry`
--

CREATE TABLE `inquiry` (
  `inq_id` int(11) NOT NULL,
  `fk_usr_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `usr_pick_up_date` date DEFAULT NULL,
  `usr_drop_off_date` date DEFAULT NULL,
  `fk_start_loc_id` int(11) DEFAULT NULL,
  `fk_end_loc_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `inquiry`
--

INSERT INTO `inquiry` (`inq_id`, `fk_usr_id`, `fk_car_id`, `usr_pick_up_date`, `usr_drop_off_date`, `fk_start_loc_id`, `fk_end_loc_id`) VALUES
(1, 1, 2, '2019-03-23', '2019-03-30', 1, 2),
(2, 2, 3, '2019-02-23', '2019-02-25', 2, 1),
(3, 3, 3, '2019-05-18', '2019-05-22', 1, 2),
(4, 4, 5, '2019-06-07', '2019-06-13', 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_usr_id` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_usr_id`, `invoice_date`, `invoice_amount`) VALUES
(1, 1, '2018-05-23', 690),
(2, 2, '2016-02-23', 900),
(3, 3, '2015-03-23', 360),
(4, 4, '2017-02-23', 750);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `loc_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_start_loc_id` int(11) DEFAULT NULL,
  `fk_end_loc_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`loc_id`, `fk_car_id`, `fk_start_loc_id`, `fk_end_loc_id`) VALUES
(1, 1, 2, 4),
(2, 2, 1, 3),
(3, 5, 3, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `first_payment` date DEFAULT NULL,
  `last_payment` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_invoice_id`, `first_payment`, `last_payment`) VALUES
(1, 1, '2018-03-14', '2018-03-30'),
(2, 2, '2017-02-14', '2017-02-25'),
(3, 3, '2019-03-14', '2019-03-17'),
(4, 4, '2019-04-18', '2019-04-21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_loc`
--

CREATE TABLE `start_loc` (
  `start_loc_id` int(11) NOT NULL,
  `address_sl` varchar(55) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `milage_start` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `start_loc`
--

INSERT INTO `start_loc` (`start_loc_id`, `address_sl`, `pick_up_date`, `milage_start`) VALUES
(1, 'Headquarter1', '2019-03-23', 236656),
(2, 'Headquarter2', '2019-02-23', 236656),
(3, 'Headquarter3', '2019-04-23', 236656),
(4, 'Headquarter4', '2019-05-23', 236656);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `usr_id` int(11) NOT NULL,
  `usr_first_name` varchar(55) DEFAULT NULL,
  `usr_last_name` varchar(55) DEFAULT NULL,
  `usr_birth_date` date DEFAULT NULL,
  `usr_address` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`usr_id`, `usr_first_name`, `usr_last_name`, `usr_birth_date`, `usr_address`) VALUES
(1, 'Hubert', 'Schmidt', '1975-10-31', 'Godknowswhere 123'),
(2, 'Rose', 'Rosie', '1973-07-14', 'Schweinsstasse 48'),
(3, 'George', 'Clooney', '1969-05-01', 'Nespressostreet 1'),
(4, 'Mickey', 'Mouse', '1919-06-01', 'Magic Kingdom'),
(5, 'Minnie', 'Mouse', '1919-07-01', 'Magic Kingdom 2');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car_park`
--
ALTER TABLE `car_park`
  ADD PRIMARY KEY (`car_id`);

--
-- Indizes für die Tabelle `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `fk_inq_id` (`fk_inq_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`) USING BTREE;

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `end_loc`
--
ALTER TABLE `end_loc`
  ADD PRIMARY KEY (`end_loc_id`);

--
-- Indizes für die Tabelle `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`inq_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`),
  ADD KEY `fk_end_loc_id` (`fk_end_loc_id`),
  ADD KEY `fk_usr_id` (`fk_usr_id`) USING BTREE;

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_usr_id` (`fk_usr_id`) USING BTREE;

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`),
  ADD KEY `fk_end_loc_id` (`fk_end_loc_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indizes für die Tabelle `start_loc`
--
ALTER TABLE `start_loc`
  ADD PRIMARY KEY (`start_loc_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `car_park`
--
ALTER TABLE `car_park`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `contract`
--
ALTER TABLE `contract`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `end_loc`
--
ALTER TABLE `end_loc`
  MODIFY `end_loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `inq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `start_loc`
--
ALTER TABLE `start_loc`
  MODIFY `start_loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
