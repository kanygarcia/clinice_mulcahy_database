-- phpMyAdmin SQL Dump
-- version 4.8.4
-- http://www.phpmyadmin.net
--
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
CREATE DATABASE IF NOT EXISTS clinice_mulcahy_database;
-- DROP DATABASE clinice_mulcahy_database;
use clinice_mulcahy_database;

-- Table structure for table 'PATIENT'


CREATE TABLE IF NOT EXISTS PATIENT (
patientID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pName VARCHAR(30),
pSurname VARCHAR(50),
pGender CHAR(1),
pDob DATE,
pAddress VARCHAR(70),
pPhone VARCHAR(25),
pMobile VARCHAR(15),
pMail VARCHAR(50),
rDate DATE
);

--
-- Table structure for table 'TREATMENT'
--

CREATE TABLE IF NOT EXISTS TREATMENT (
treatID INT(3) NOT NULL AUTO_INCREMENT,
tName VARCHAR(25) NOT NULL,
tFee FLOAT(10, 2) NOT NULL,
reqTime VARCHAR(250) NOT NULL,
tDetail VARCHAR(255) NOT NULL,
speciality VARCHAR(50) NOT NULL,
PRIMARY KEY (treatID)
);

--
-- Table structure for table 'SPECIALIST'
--

CREATE TABLE IF NOT EXISTS SPECIALIST (
spcID INT(3) NOT NULL AUTO_INCREMENT,
spcNumber	INT(2) NOT NULL,
speciality CHAR(50) NOT NULL,
sName	CHAR(15) DEFAULT NULL,
sSurname VARCHAR(50) DEFAULT NULL,
sPhone VARCHAR(25) NOT NULL,
sAddress VARCHAR(70) NOT NULL,
sMail	VARCHAR(50) NOT NULL,
comments VARCHAR(250) DEFAULT NULL,
treatID INT(3) NOT NULL,
PRIMARY KEY (spcID)
);

--
-- Table structure for table 'APPOINTMENT'
--

CREATE TABLE IF NOT EXISTS APPOINTMENT (
apptID INT(6) NOT NULL AUTO_INCREMENT,
treatID INT(3) NOT NULL,
aStatus CHAR(15) DEFAULT NULL,
aDate DATE NOT NULL,
aTime TIME(5) NOT NULL,
comments VARCHAR(255) DEFAULT NULL,
patientID INT NOT NULL,
PRIMARY KEY (apptID)
);

--
-- Table structure for table 'APPTDETAILS'
--

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
billNumber INT(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
treatID INT(3) NOT NULL,
billDate DATE NOT NULL,
tFee FLOAT(10) NOT NULL,
billStatus CHAR(8) NOT NULL,
paymentType VARCHAR(10) NOT NULL,
patientID INT NOT NULL
);

--
-- Table structure for table 'PAYMENT'
--

CREATE TABLE IF NOT EXISTS PAYMENT (
receiptNumber INT(10) NOT NULL AUTO_INCREMENT,
billNumber INT(9) NOT NULL,
patientID INT NOT NULL ,
paymentMethod VARCHAR(20) NOT NULL,
amountPaid DECIMAL(10, 2) NOT NULL,
receiptDate DATE NOT NULL,
PRIMARY KEY (receiptNumber)
);

-- ----------------------------------------------------

ALTER TABLE SPECIALIST
ADD CONSTRAINT fk_spcdata
FOREIGN KEY (treatID) REFERENCES TREATMENT(treatID);

ALTER TABLE APPOINTMENT
ADD CONSTRAINT fk_appointment
FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
ADD CONSTRAINT fk_tID
FOREIGN KEY (treatID) REFERENCES TREATMENT(treatID);

ALTER TABLE APPTDETAILS
ADD CONSTRAINT fk_apptdata_appointment
FOREIGN KEY (apptID) REFERENCES APPOINTMENT(apptID),
ADD CONSTRAINT fk_apptdata_specialist
FOREIGN KEY (spcID) REFERENCES SPECIALIST(spcID);
-- ADD CONSTRAINT fk_apptdata_treatment
-- FOREIGN KEY (tDetail) REFERENCES TREATMENT(tDetail);

ALTER TABLE BILL
ADD CONSTRAINT fk_treatBill 
FOREIGN KEY (treatID) REFERENCES TREATMENT(treatID),
ADD CONSTRAINT fk_patientBill 
FOREIGN KEY (patientID) REFERENCES PATIENT(patientID);

ALTER TABLE PAYMENT
ADD CONSTRAINT fk_paymentdata
FOREIGN KEY (billNumber) REFERENCES BILL(billNumber);


INSERT INTO PATIENT (patientID, pName, pSurname, pGender, pDob, pAddress, pPhone, pMobile, pMail, rDate) VALUES  
(18346, 'Kippar', 'Lequeux', 'M', '12/16/1987', '067 Westridge Junction', '161-788-4322', '763-597-4550', 'klequeux0@mapy.cz', '3/19/2016'),
(18347, 'Gar', 'Sargint', 'M', '06/12/1956', '7 Veith Pass', '691-256-6944', '606-304-5505', 'gsargint1@list-manage.com', '3/30/2016'),
(18348, 'Georgette', 'Costell', 'F', '05/08/1996', '2004 Clarendon Junction', '148-420-2655', '791-371-6148', 'gcostell2@cbsnews.com', '6/15/2010'),
(18349, 'Issy', 'Worthy', 'F', '02/22/1932', '58387 Scott Trail', '208-814-0779', '562-471-9718', 'iworthy3@so-net.ne.jp', '3/13/1996'),
(18350, 'Wynny', 'Dargan', 'F', '12/15/1963', '395 Magdeline Point', '686-773-6915', '781-304-8877', 'wdargan4@google.com', '4/10/1993'),
(18351, 'Damara', 'Burrage', 'F', '03/08/1957', '5508 Moland Street', '902-539-4039', '303-395-7746', 'dburrage5@statcounter.com', '10/31/2013'),
(18352, 'Robby', 'Myles', 'M', '03/05/2003', '445 Rieder Pass', '111-308-8817', '767-984-0914', 'rmyles6@cyberchimps.com', '9/22/2016'),
(18353, 'Selinda', 'Sweetsur', 'F', '10/10/2008', '54 Butternut Hill', '386-288-2575', '311-358-4443', 'ssweetsur7@toplist.cz', '6/23/2003'),
(18354, 'Leeland', 'Cranton', 'M', '01/27/1935', '332 Moland Way', '855-266-4194', '517-516-5657', 'lcranton8@indiegogo.com', '11/28/1990'),
(18355, 'Ariel', 'Amiss', 'F', '11/24/2008', '2302 Oakridge Street', '667-290-1104', '517-310-0849', 'aamiss9@elpais.com', '3/20/1995'),
(18356, 'Cristine', 'Beresford', 'F', '11/01/1990', '12 Havey Circle', '337-751-1334', '416-935-2381', 'cberesforda@linkedin.com', '11/14/2014'),
(18357, 'Miranda', 'Bolley', 'F', '05/13/1934', '228 Monica Trail', '851-686-5830', '220-108-8163', 'mbolleyb@stanford.edu', '6/25/1990'),
(18358, 'Bethina', 'MacConchie', 'F', '05/12/1971', '486 Macpherson Crossing', '307-295-3664', '346-622-7488', 'bmacconchiec@elegantthemes.com', '7/18/2004'),
(18359, 'Heinrik', 'Tressler', 'M', '11/18/1970', '47 Rusk Park', '304-724-4271', '248-799-7069', 'htresslerd@goo.gl', '12/27/2014'),
(18360, 'Annadiane', 'Ewbanke', 'F', '02/17/2012', '21901 Washington Court', '112-546-0539', '226-208-9677', 'aewbankee@elegantthemes.com', '11/10/2004');

INSERT INTO TREATMENT (TreatID, tName, tFee, reqTime, tDetail) VALUES 
(001, 'BONDING', '87.98', '1 visit 1h', 'Closed fractures involving skull or face with other bones, without mention or intracranial injury, with prolonged [more than 24 hours] loss of consciousness and return to pre-existing conscious level'),
(002, 'BRACES', '378.16', 'Multiple visits 30 min', 'Other and unspecified disc disorder, unspecified region'),
(003, 'BRIDGES AND IMPLANTS', '631.04', 'Multiple visits 1h', 'Dental drugs topically applied causing adverse effects in therapeutic use'),
(004, 'EXTRACTIONS', '156.31', '20min each', 'Latent schizophrenia, subchronic with acute exacerbation'),
(005, 'CROWN AND CAPS', '326.90', '2h', 'Injury due to war operations by unintentional discharge of own munitions launch device'),
(006, 'DENTURES', '567.42', 'Multiple visits 1h', 'Electrolytic, caloric, and water-balance agents causing adverse effects in therapeutic use'),
(007, 'FILLING AND REPAIRS', '516.70', '1,5h', 'Nonallopathic lesions, lower extremities'),
(008, 'GUM SURGERY', '88.19', '2h', 'Injury to other specified cranial nerves'),
(009, 'TEETH WHITENING', '97.59', '40min', 'Rickettsialpox'),
(010, 'VENEERS', '838.85', '50min', 'Hodgkins disease, mixed cellularity, intrathoracic lymph nodes'),
(011, 'TEETH CLEANING', '97.42', '30min', 'Electrolytic, caloric, and water-balance agents causing adverse effects in therapeutic use');

INSERT INTO SPECIALIST (spcID, spcNumber, speciality, sName, sSurname, sPhone, sAddress, sMail, comments, treatID) VALUES
(111, 01, 'endodontist', 'Hazlett', 'Lindfors', '420-400-1997', '6 Loeprich Street', 'hlindfors0@paypal.com', 'NULL', 011),
(112, 02, 'pedodontic', 'Laurene', 'McArte', '497-206-1406', '082 Ridge Oak Way', 'lmcarte1@phoca.cz', 'NULL', 009),
(113, 03, 'orthodontist', 'Chaddie', 'Fassum', '802-758-4874', '93 Vidon Drive', 'cfassum2@psu.edu', 'NULL', 005),
(114, 04, 'periodontist', 'Mabelle', 'Stoffels', '869-812-2520', '726 Kedzie Pass', 'mstoffels3@woothemes.com', 'NULL', 007),
(115, 05, 'prosthodontist', 'Barclay', 'Baty', '316-613-0006', '08 Carey Court', 'bbaty4@statcounter.com', 'Retired. Her daughter is in charge now', 004),
(116, 06, 'oral and maxilofacial surgeon', 'Joella', 'Boggas', '925-186-1655', '6 Sunnyside Circle', 'jboggas5@chronoengine.com', 'NULL', 004),
(117, 07, 'radiology', 'Cherida', 'Gumbrell', '203-343-8882', '2948 Eliot Drive', 'cgumbrell6@biblegateway.com', 'NULL', 002),
(118, 08, 'pathology', 'Chance', 'Lorenzetti', '114-161-8009', '98468 Gateway Junction', 'clorenzetti7@gizmodo.com', 'NULL', 008),
(119, 01, 'endodontist', 'Andres', 'Grewe', '833-561-2270', '0407 Stoughton Hill', 'agrewe8@stumbleupon.com', 'NULL', 004),
(120, 02, 'pediatric', 'Rurik', 'Hurtado', '442-527-9217', '63280 Farragut Pass', 'rhurtado9@webs.com', 'Was very rude with the last patient. We are not gonna send him more patients for now', 005),
(121, 03, 'enthodontist', 'Gerhardt', 'Gamble', '642-877-9689', '2951 7th Court', 'ggamblea@elegantthemes.com', 'NULL', 011),
(122, 04, 'periodontist', 'Shayne', 'Pollok', '271-805-5359', '06674 Spenser Place', 'spollokb@yahoo.com', 'NULL', 007),
(123, 05, 'prosthodontist', 'Timothy', 'Harries', '975-654-6331', '1 Fieldstone Plaza', 'tharriesc@sciencedaily.com', 'NULL', 008),
(124, 06, 'oral and maxilofacial surgeon', 'Bryanty', 'Yewen', '733-790-4458', '3125 Harper Court', 'byewend@buzzfeed.com', 'On holidays until sept 2019', 011),
(125, 07, 'radiology', 'Martie', 'Cashin', '665-550-9615', '445 South Plaza', 'mcashine@t-online.de', 'She is pregnant, will be back nest july 2019', 004),
(126, 08, 'pathology', 'Paulette', 'Leer', '387-563-7308', '4275 Sachtjen Plaza', 'pleerf@bloglovin.com', 'NULL', 005);

insert into APPOINTMENT  (apptID, treatID, aStatus, aDate, aTime, comments, patientID) values 
(113260848, 008, 'CONFIRMED', '04/04/2019', '5:40 PM', null, 18346),
(837379443, 004, 'RESCHEDULED', '05/29/2018', '12:35 PM', 'Reposition Occipital-cervical Joint, Perc Endo Approach', 18347),
(528281393, 007, 'RESCHEDULED', '09/26/2018', '3:35 PM', null, 18348),
(880848649, 003, 'CANCELLED', '12/07/2018', '12:40 PM', 'Removal of Ext Fix from R Metacarpophal Jt, Perc Approach', 18349),
(730779663, 001, 'LATE CANCEL', '05/30/2018', '12:57 PM', null, 18350),
(487527901, 011, 'CONFIRMED', '05/27/2018', '5:44 PM', 'Hyperthermia of Hemibody', 18351),
(492893596, 003, 'CONFIRMED', '02/18/2019', '10:39 AM', null, 18352),
(284832546, 003, 'CANCELLED', '08/04/2018', '2:32 PM', null, 18353),
(142399221, 001, 'CONFIRMED', '08/21/2018', '3:05 PM', 'Alteration of Right Lower Arm with Synth Sub, Perc Approach', 18354),
(041356175, 004, 'CONFIRMED', '05/26/2018', '5:25 PM', 'Resection of Right Clavicle, Open Approach', 18355),
(395199770, 006, 'RESCHEDULED', '05/18/2018', '5:47 PM', 'Replacement of Esophagus with Synthetic Substitute, Endo', 18356),
(375741676, 010, 'CONFIRMED', '06/03/2018', '1:31 PM', null, 18357),
(223644404, 007, 'LATE CANCEL', '01/21/2019', '1:36 PM', null, 18358),
(347041396, 005, 'CONFIRMED', '04/19/2019', '1:57 PM', null, 18359),
(349884037, 010, 'RESCHEDULED', '12/24/2018', '10:52 AM', null, 18360),
(571201338, 003, 'CONFIRMED', '03/02/2019', '11:44 AM', null, 18347),
(057292414, 004, 'CONFIRMED', '05/18/2018', '5:32 PM', null, 18356),
(901227366, 003, 'CANCELLED', '12/01/2018', '10:37 AM', 'Removal of Intraluminal Device from Bladder, Via Opening', 18357),
(048200349, 002, 'CONFIRMED', '05/13/2018', '2:02 PM', 'Introduce Oth Antineoplastic in Cran Cav/Brain, Perc', 18359),
(953222563, 010, 'LATE CANCEL', '02/05/2019', '10:17 AM', 'Lower Veins, Replacement',18360);

INSERT INTO APPTDETAILS (apptID, spcID, tDetail, aMethod, comments) VALUES 
(487527901, null, 'Unspecified occupant of bus injured in collision with heavy transport vehicle or bus in nontraffic accident, subsequent encounter', 'DROPIN', 'Hydromorphone Hydrochloride'),
(284832546, null, 'Pathological fracture in other disease, left foot', 'PHONE', 'ENSULIZOLE, OCTINOXATE, and TITANIUM DIOXIDE'),
(730779663, null, 'Poisoning by unspecified drugs primarily affecting the autonomic nervous system, assault, sequela', 'FOLLOW-UP', 'MENTHOL'),
(492893596, null, 'Unspecified reduction defect of unspecified lower limb', 'DROPIN', 'Bupropion Hydrochloride'),
(528281393, null, 'Burn of second degree of unspecified upper arm', 'MAIL', null),
(571201338, null, 'Displaced apophyseal fracture of right femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', 'MAIL', 'Butalbital, Acetaminophen, and Caffeine'),
(349884037, null, 'Unspecified atrial flutter', 'DROP-IN', 'octinoxate, octisalate, oxybenzone'),
(347041396, null, 'Other central nervous system complications of anesthesia during pregnancy, first trimester', 'FOLLOW-UP', 'Doxazosin'),
(492893596, null, 'Other mechanical complication of other cardiac electronic device, subsequent encounter', 'DROP-IN', 'Ethylhexyl Methoxycinnamate 7.5%, Benzophenone-3 6%, Ethylhexyl Salicylate 5%, Butyl Methoxydibenzoylmethane 1%'),
(395199770, null, 'Unspecified fracture of shaft of unspecified fibula, initial encounter for closed fracture', 'FOLLOW-UP', 'Acetaminophen, Asprin, Caffeine'),
(347041396, null, 'Unspecified fracture of first thoracic vertebra, subsequent encounter for fracture with nonunion', 'FOLLOW-UP', 'Lamotrigine'),
(837379443, 112, 'Other fracture of left femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'PHONE', 'Ibuprofen'),
(223644404, null, 'War operations involving other firearms discharge, civilian, initial encounter', 'FOLLOW-UP', null),
(901227366, 114, 'Other paralytic syndrome following nontraumatic subarachnoid hemorrhage affecting right dominant side', 'MAIL', 'Melphalan Hydrochloride'),
(057292414, null, 'Toxic effect of ingested berries', 'FOLLOW-UP', 'Echinacea Thuja'),
(057292414, null, 'Sarcoidosis, unspecified', 'MAIL', 'TITANIUM DIOXIDE, ZINC OXIDE'),
(730779663, 111, 'Salter-Harris Type I physeal fracture of lower end of humerus', 'DROPIN', 'Glycerin'),
(113260848, null, 'Other and unspecified superficial injuries of front wall of thorax', 'MAIL', null),
(284832546, null, 'Unspecified open wound of other part of head, initial encounter', 'DROPIN', null);

INSERT INTO BILL (billNumber, treatID, billDate, tFee, billStatus, paymentType, patientID) VALUES 
(759185863, 001, '6/27/2018', '87.98', 'PAID', 'AFTER VISIT', 18346),
(759185864, 002, '9/28/2018', '378.16', 'PAID', 'AFTER VISIT', 18352),
(759185865, 003, '5/9/2018', '631.04', 'UNPAID', 'STATEMENT', 18354),
(759185866, 004, '10/16/2018', '156.31', 'PAID', 'AFTER VISIT', 18350),
(759185867, 005, '7/30/2018', '326.90', 'PAID', 'IN ADVANCE', 18359),
(759185868, 006, '5/30/2018', '567.42', 'PAID', 'AFTER VISIT', 18351),
(759185869, 007, '7/14/2018', '516.70', 'PAID', 'AFTER VISIT', 18347),
(759185870, 009, '12/29/2018', '97.59', 'PAID', 'IN ADVANCE', 18359),
(759185871, 010, '7/1/2018', '838.85', 'UNPAID', 'STATEMENT', 18358),
(759185872, 011, '1/31/2019', '97.42', 'PAID', 'AFTER VISIT', 18355),
(759185873, 001, '10/15/2018', '87.98', 'PAID', 'AFTER VISIT', 18358),
(759185874, 002, '3/27/2019', '378.16', 'PAID', 'AFTER VISIT', 18353),
(759185875, 003, '2/14/2019', '631.04', 'UNPAID', 'STATEMENT', 18357),
(759185876, 004, '2/22/2019', '156.31', 'PAID', 'IN ADVANCE', 18348),
(759185877, 008, '2/14/2019', '88.19', 'UNPAID', 'STATEMENT', 18360);

INSERT INTO PAYMENT (receiptNumber, billNumber, patientID, paymentMethod, amountPaid, receiptDate) VALUES
(1541729530, 759185863, 18346, 'CHEQUE', '56.31', '6/27/2018'),
(1541729531, 759185864, 18352, 'CARD', '78.16', '9/28/2018'),
(1541729532, 759185865, 18354, 'CASH', '631.04', '5/9/2018'),
(1541729533, 759185866, 18350, 'CHEQUE', '156.31', '10/16/2018'),
(1541729534, 759185867, 18359, 'CHEQUE', '126.90', '7/30/2018'),
(1541729535, 759185868, 18351, 'CARD', '567.42', '5/30/2018'),
(541729536, 759185869, 18347, 'CARD', '516.70', '7/14/2018'),
(541729537, 759185869, 18360, 'CHEQUE', '88.19', '6/2/2018'),
(541729538, 759185870, 18359, 'CARD', '9959', '1/5/2019'),
(541729539, 759185871, 18358, 'CHEQUE', '838.85', '2/13/2019'),
(541729540, 759185872, 18355, 'CASH', '97.42', '10/24/2018'),
(541729541, 759185873, 18358, 'CHEQUE', '67.42', '10/15/2018'),
(541729542, 759185874, 18353, 'CASH', '378.16', '10/10/2018'),
(541729543, 759185875, 18357, 'CASH', '231.04', '2/14/2019'),
(541729544, 759185876, 18348, 'CARD', '156.31', '2/22/2019');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


