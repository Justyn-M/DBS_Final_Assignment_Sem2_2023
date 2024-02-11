/* Final_Assignment_Commands.sql - File stores comamands to create the database */
-- 21029112, Justyn Mahen

-- Part 2 (Implementation)
SHOW DATABASES;
tee Final_Assignment_Commands.out
CREATE DATABASE Nobel_Prize_Laureates_21029112;
SHOW DATABASES;
USE Nobel_Prize_Laureates_21029112;
-- Creating the Tables
\. Create_Tables.sql

-- Adding values to the tables
\. Laureates.sql

-- Describing added tables
SHOW TABLES;
DESCRIBE Prize;
DESCRIBE Winner;
DESCRIBE Affiliation;

-- Adding linking values for relationship tables
\. associations.sql

-- Part 3 (Queries)

-- Added 2 more queries than needed (total of 12) to demonsrate my understanding of the topic by adding more complex yet
-- logical and useful queries

-- Which winners have German heritage?
SELECT First_Name, Last_Name FROM Winner WHERE Country = 'Germany';

-- Which awards were given a prize money of more than 5 million?
SELECT Field, Medal, Year_Awarded, Diploma FROM Prize WHERE Cash_Award > 5000000;

-- Which prizes were awarded in 2019?
SELECT Field, Medal, Diploma FROM Prize WHERE Year_Awarded = '2019';

-- Which winners are Female?
SELECT First_Name, Last_Name FROM Winner WHERE Gender = 'Female';

-- How many prizes were awarded before the year 2000?
SELECT COUNT(*) FROM Prize WHERE Year_Awarded < '2000';

-- Which prizes have a cash award greater than the average cash award?
SELECT Field, Year_Awarded
FROM Prize
WHERE Cash_Award > (SELECT AVG(Cash_Award) FROM Prize);


-- Which winners are from the MIT?
SELECT W.First_Name, W.Last_Name
FROM Winner W
JOIN associated_with AW ON W.WinnerID = AW.WinnerID
JOIN Affiliation A ON AW.AffiliationID = A.AffiliationID
WHERE A.Name = 'Massachusetts Institute of Technology (MIT)';

-- What prizes were won by winners affiliated/associated with Universities?
SELECT P.Field, P.Year_Awarded, P.Medal, W.First_Name, W.Last_Name
FROM Prize P
JOIN received_by R ON P.PrizeID = R.PrizeID
JOIN Winner W ON R.WinnerID = W.WinnerID
JOIN associated_with AW ON W.WinnerID = AW.WinnerID
JOIN Affiliation A ON AW.AffiliationID = A.AffiliationID
WHERE A.Type = 'University';

-- How many winners are there of each gender?
SELECT Gender, COUNT(*) as Count
FROM Winner
WHERE Gender IS NOT NULL
GROUP BY Gender;

-- How many winners are from a NPO?
SELECT COUNT(DISTINCT W.WinnerID) 
FROM Winner W
JOIN associated_with AW ON W.WinnerID = AW.WinnerID
JOIN Affiliation A ON AW.AffiliationID = A.AffiliationID
WHERE A.Type = 'Non Profit Organisation';

-- Which Field has the most winners?
SELECT P.Field, COUNT(R.WinnerID) AS Winner_Count
FROM Prize P
JOIN received_by R ON P.PrizeID = R.PrizeID
GROUP BY P.Field
ORDER BY Winner_Count DESC
LIMIT 1;

-- Which country has the most amount of Nobel Laureates?
SELECT Country, COUNT(*) as Number_of_Winners
FROM Winner
GROUP BY Country
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 3 Completed

-- Task 4 (Advanced Concepts)

-- Stored Process 1 Where procedure adds a new prize
DELIMITER //
CREATE PROCEDURE AddNewPrize(pField VARCHAR(30), pYear_Awarded YEAR, pMedal VARCHAR(100), pDiploma TEXT, pCash_Award INT)
BEGIN
    INSERT INTO Prize (Field, Year_Awarded, Medal, Diploma, Cash_Award) 
    VALUES (pField, pYear_Awarded, pMedal, pDiploma, pCash_Award);
END //
DELIMITER ;

-- Stored Process 2 Which adds a new winner and chekcs DOB
DELIMITER //
CREATE PROCEDURE AddNewWinner(pFirstName VARCHAR(30), pLastName VARCHAR(30), pDOB DATE, pDOD DATE, pGender VARCHAR(6), pCountry VARCHAR(50))
BEGIN
    IF pDOB >= CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DOB cannot be in the future!';
    ELSE
        INSERT INTO Winner (First_Name, Last_Name, DOB, DOD, Gender, Country) 
        VALUES (pFirstName, pLastName, pDOB, pDOD, pGender, pCountry);
    END IF;
END //
DELIMITER ;

-- Stored Process 3 Where procedure finds all winners of a certain field
DELIMITER //
CREATE PROCEDURE WinnersByField(pField VARCHAR(100))
BEGIN
    SELECT W.First_Name, W.Last_Name
    FROM Winner W
    JOIN received_by R ON W.WinnerID = R.WinnerID
    JOIN Prize P ON R.PrizeID = P.PrizeID
    WHERE P.Field = pField;
END //
DELIMITER ;

-- Usages of Stored Procedures:

-- It is assumed After using any stored procedures, the user will manually check the database and add the IDs 
-- into the linking tables (received_by & associated_with) accordingly

-- To use Stored Process 1
CALL AddNewPrize('Physiology or Medicine', '2006', 'The Nobel Prize in Physiology or Medicine', 'For their discovery of RNA interference - gene silencing by double-stranded RNA', 10000000);

-- To use Stored Process 2
CALL AddNewWinner('Andrew Z.', 'Fire', '1959-04-27', NULL, 'Male', 'USA');

-- Assumptions
INSERT INTO received_by (WinnerID, PrizeID) VALUES (16, 16);
INSERT INTO associated_with (WinnerID, AffiliationID) VALUES (16, 3);

-- Usage of Stored Process 3
CALL WinnersByField('Physiology or Medicine');

-- Trigger 1 that ensures a Prize isn't already added:
DELIMITER //
CREATE TRIGGER Check_Duplicate_Prizes 
BEFORE INSERT ON Prize 
FOR EACH ROW 
BEGIN
    DECLARE num_prizes INT;

    -- Check if the prize name already exists
    SELECT COUNT(*) INTO num_prizes
    FROM Prize 
    WHERE Diploma = NEW.Diploma;

    IF num_prizes > 0 THEN
        -- Raise error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Prize has already been added to the database';
    END IF;
END //
DELIMITER ;

-- Trigger 2 that checks if an Affiliation is already added

DELIMITER //
CREATE TRIGGER Check_Affiliation 
BEFORE INSERT ON Affiliation 
FOR EACH ROW 
BEGIN
    DECLARE num_affiliations INT;

    -- Check if the affiliation name already exists
    SELECT COUNT(*) INTO num_affiliations 
    FROM Affiliation 
    WHERE Name = NEW.Name;

    IF num_affiliations > 0 THEN
        -- Raise error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Affiliation already exists on database';
    END IF;
END //
DELIMITER ;