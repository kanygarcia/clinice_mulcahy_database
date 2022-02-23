-- phpMyAdmin SQL Dump
-- version 4.8.4
-- http://www.phpmyadmin.net
--
-- Server version: 10.1.37-MariaDB - Source distribution
-- PHP Version: 7.3.0


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'clinice_mulcahy_database'
--

-- --------------------------------------------------------
CREATE DATABASE clinice_mulcahy_database;
-- DROP DATABASE clinice_mulcahy_database;
use clinice_mulcahy_database;
---
-- Table structure for table 'PATIENT'
---

CREATE TABLE IF NOT EXISTS PATIENT (
patientID INT NOT NULL PRIMARY KEY,
pName VARCHAR(30),
pSurname	 VARCHAR(50),
pGender CHAR(1),
pDob DATE,
pAddress VARCHAR(70),
pPhone VARCHAR(25),
pMobile VARCHAR(15),
pMail VARCHAR(50),
rDate DATE
);

---
-- Table structure for table 'TREATMENT'
---

CREATE TABLE IF NOT EXISTS TREATMENT (
treatID INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
tName VARCHAR(25) NOT NULL,
tFee DECIMAL(10, 2) NOT NULL,
reqTime VARCHAR(250) NOT NULL,
tDetail VARCHAR(255) NOT NULL,
speciality VARCHAR(50) NOT NULL,
PRIMARY KEY (treatID)
);

---
-- Table structure for table 'SPECIALIST'
---

CREATE TABLE IF NOT EXISTS SPECIALIST (
spcID INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
spcNumber	INT(2) NOT NULL,
speciality CHAR(50) NOT NULL,
sName	CHAR(15) DEFAULT NULL,
sSurname VARCHAR(50) DEFAULT NULL,
sPhone VARCHAR(25) NOT NULL,
sAddress VARCHAR(70) NOT NULL,
sMail	VARCHAR(50) NOT NULL,
comments VARCHAR(250) DEFAULT NULL,
treatID VARCHAR(3) NOT NULL,
PRIMARY KEY (spcID)
);

---
-- Table structure for table 'APPOINTMENT'
---

CREATE TABLE IF NOT EXISTS APPOINTMENT (
apptID INT(6) NOT NULL PRIMARY KEY AUTO_INCREMENT,
treatID INT(2) NOT NULL,
aStatus CHAR(15) DEFAULT NULL,
aDate DATE NOT NULL,
aTime TIME(5) NOT NULL,
comments VARCHAR(255) DEFAULT NULL,
patientID INT(10) NOT NULL,
PRIMARY KEY (apptID)
);

---
-- Table structure for table 'APPTDETAILS'
---

CREATE TABLE IF NOT EXISTS APPTDETAILS (
apptID INT(9) NOT NULL,
spcID	INT(2) DEFAULT NULL,
tDetail VARCHAR(255) NOT NULL,
aMethod CHAR(15) DEFAULT NULL,
comments VARCHAR(255) DEFAULT NULL
);

--
-- Table structure for table 'BILL'
--

CREATE TABLE IF NOT EXISTS BILL (
billNumber INT(9) NOT NULL PRIMARY KEY,
treatID VARCHAR(3) NOT NULL,
billDate DATE NOT NULL,
tFee FLOAT(10) NOT NULL,
billStatus CHAR(8) NOT NULL,
paymentType VARCHAR(10) NOT NULL,
patientID INT(5) NOT NULL
);

--
-- Table structure for table 'PAYMENT'
--

CREATE TABLE IF NOT EXISTS PAYMENT (
receipNumber INT(10) NOT NULL,
billNumber VARCHAR(11) NOT NULL,
patientID VARCHAR (5) NOT NULL ,
paymentMethod VARCHAR(20) NOT NULL,
amountPaid DECIMAL(10, 2) NOT NULL,
receipDate DATE NOT NULL,
PRIMARY KEY (receipNumber)
);

------------------------------------------------------

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment
FOREIGN KEY (patientID) REFERENCES patient(patientID);

ALTER TABLE bill
ADD CONSTRAINT fk_patientBill 
FOREIGN KEY (patientID) REFERENCES Patient(patientID);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
