/* Create_Tables.sql - creating all tables for Nobel Prize Laureates Database */

-- Prize Table
CREATE TABLE Prize (
    PrizeID INT AUTO_INCREMENT PRIMARY KEY,
    Field VARCHAR(30) NOT NULL,
    Year_Awarded YEAR NOT NULL,
    Medal VARCHAR(100) NOT NULL,
    Diploma TEXT NOT NULL,
    Cash_Award INT NOT NULL
);

-- Winner Table
CREATE TABLE Winner (
    WinnerID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(30),
    DOB DATE,
    DOD DATE,
    Gender VARCHAR(6),
    Country VARCHAR(50) NOT NULL
);

-- Affiliation Table
CREATE TABLE Affiliation (
    AffiliationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NULL,
    Country VARCHAR(50) NOT NULL,
    Type VARCHAR(50) NOT NULL
);

-- received_by table
CREATE TABLE received_by (
    WinnerID INT,
    PrizeID INT,
    PRIMARY KEY (WinnerID, PrizeID),
    FOREIGN KEY (WinnerID) REFERENCES Winner(WinnerID),
    FOREIGN KEY (PrizeID) REFERENCES Prize(PrizeID)
);

-- associated_with table
CREATE TABLE associated_with (
    WinnerID INT,
    AffiliationID INT,
    PRIMARY KEY (WinnerID, AffiliationID),
    FOREIGN KEY (WinnerID) REFERENCES Winner(WinnerID),
    FOREIGN KEY (AffiliationID) REFERENCES Affiliation(AffiliationID)
);
