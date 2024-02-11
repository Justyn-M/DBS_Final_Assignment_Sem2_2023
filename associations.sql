/* associations.sql - Inserting data into received_by adn assosiaciated_with tables to link values from Prize to winner and winner to affiliation */
-- received_by
INSERT INTO received_by (PrizeID, WinnerID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- associated_with
INSERT INTO associated_with (WinnerID, AffiliationID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(5, 4),
(6, 5),
(7, 10),
(8, 11),
(9, 5),
(11, 6),
(12, 7),
(13, 12),
(14, 8),
(15, 9);