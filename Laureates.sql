/* Laureates.sql - Commands to insert all values into the tables */
-- 15 Prizes are added to the database

-- Prizes
INSERT INTO Prize (Field, Year_Awarded, Medal, Diploma, Cash_Award)
VALUES 
('Physics', '1975', 'The Nobel Prize in Physics', 'for the discovery of the connection between collective motion and particle motion in atomic nuclei and the development of the theory of the structure of the atomic nucleus based on this connection', 630000),
('Chemistry', '2004', 'The Nobel Prize in Chemistry', 'for the discovery of ubiquitin-mediated protein degradation', 10000000),
('Economic Sciences', '2001', 'The Sveriges Riksbank Prize in Economic Sciences in Memory of Alfred Nobel', 'for their analyses of markets with asymmetric information', 10000000),
('Peace', '2019', 'The Nobel Peace Prize', 'for his efforts to achieve peace and international cooperation, and in particular for his decisive initiative to resolve the border conflict with neighbouring Eritrea', 9000000),
('Physiology or Medicine', '1963', 'The Nobel Prize in Physiology or Medicine', 'for their discoveries concerning the ionic mechanisms involved in excitation and inhibition in the peripheral and central portions of the nerve cell membrane', 265000),
('Physics', '1994', 'The Nobel Prize in Physics', 'for pioneering contributions to the development of neutron scattering techniques for studies of condensed matter', 7000000),
('Peace', '1947', 'The Nobel Peace Prize', 'for their pioneering work in the international peace movement and compassionate effort to relieve human suffering, thereby promoting the fraternity between nations', 146115),
('Peace', '1977', 'The Nobel Peace Prize', 'for worldwide respect for human rights', 700000),
('Economic Sciences', '2019', 'The Sveriges Riksbank Prize in Economic Sciences in Memory of Alfred Nobel', 'for their experimental approach to alleviating global poverty', 9000000),
('Literature', '1997', 'The Nobel Prize in  Literature', 'who emulates the jesters of the Middle Ages in scourging authority and upholding the dignity of the downtrodden', 7500000),
('Physics', '2018', 'The Nobel Prize in Physics', 'for their method of generating high-intensity, ultra-short optical pulses', 9000000),
('Chemistry', '1988', 'The Nobel Prize in Chemistry', 'for the determination of the three-dimensional structure of a photosynthetic reaction centre', 2500000),
('Peace', '2017', 'The Nobel Peace Prize', 'for its work to draw attention to the catastrophic humanitarian consequences of any use of nuclear weapons and for its ground-breaking efforts to achieve a treaty-based prohibition of such weapons', 9000000),
('Physiology or Medicine', '1908', 'The Nobel Prize in Physiology or Medicine', 'in recognition of their work on immunity', 139800),
('Physics', '1963', 'The Nobel Prize in Physics', 'for their discoveries concerning nuclear shell structure', 265000);

-- Winners
INSERT INTO Winner (First_Name, Last_Name, DOB, DOD, Gender, Country)
VALUES
('Aage Niels', 'Bohr', '1922-06-19', '2009-09-08', 'Male', 'Denmark'),
('Aaron', 'Ciechanover', '1947-01-10', NULL, 'Male', 'Israel'),
('A. Michael', 'Spence', '1943-01-01', NULL, 'Male', 'USA'),
('Abiy', 'Ahmed Ali', '1976-08-15', NULL, 'Male', 'Ethiopia'),
('Alan', 'Hodgkin', '1914-02-05', '1998-12-20', 'Male', 'United Kingdom'),
('Clifford G.', 'Shull', '1915-09-23', '2001-03-31', 'Male', 'USA'),
('American Friends Service Committee', NULL, NULL, NULL, NULL, 'USA'),
('Amnesty International', NULL, NULL, NULL, NULL, 'USA'),
('Esther', 'Duflo', '1972-10-25', NULL, 'Female', 'France'),
('Dario', 'Fo', '1926-03-24', '2016-10-13', 'Male', 'Italy'),
('Donna', 'Strickland', '1959-05-27', NULL, 'Female', 'Canada'),
('Johann', 'Deisenhofer', '1943-09-30', NULL, 'Male', 'Germany'),
('International Campaign to Abolish Nuclear Weapons (ICAN)', NULL, NULL, NULL, NULL, 'Australia'),
('Ilya', 'Mechnikov', '1845-05-15', '1916-07-15', 'Male', 'France'),
('Maria', 'Goeppert Mayer', '1906-06-28', '1972-02-20', 'Female', 'Germany');

-- Affiliations
INSERT INTO Affiliation (Name, City, Country, Type)
VALUES
('Copenhagen University', 'Copenhagen', 'Denmark', 'University'),
('Technion - Israel Institute of Technology', 'Haifa', 'Israel', 'Research Institute'),
('Stanford University', 'Stanford CA', 'USA', 'University'),
('University of Cambridge', 'Cambridge', 'UK', 'University'),
('Massachusetts Institute of Technology (MIT)', 'Cambridge MA', 'USA', 'Research Institute'),
('University of Waterloo', 'Waterloo', 'Canada', 'University'),
('University of Texas Southwestern Medical Center at Dallas', 'Dallas TX', 'USA', 'University'),
('Institut Pasteur', 'Paris', 'France', 'Research Institute'),
('University of California', 'San Diego CA', 'USA', 'University'),
('American Friends Service Committee', NULL, 'USA', 'Non Profit Organisation'),
('Amnesty International', NULL, 'USA', 'Non Gov Organisation'),
('International Campaign to Abolish Nuclear Weapons (ICAN)', NULL, 'Australia', 'Non Profit Organisation');