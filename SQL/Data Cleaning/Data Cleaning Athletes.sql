-- Table and DB Creation
-- Create a new database called Olimpics
CREATE DATABASE Olimpics;
-- Create the table to store athlete data with relevant columns
CREATE TABLE Olimpics_table (
    ID INT NOT NULL,
    -- Athlete's unique ID
    Name VARCHAR(255),
    -- Athlete's name
    Sex VARCHAR(5),
    -- Athlete's gender (e.g., M, F)
    Age VARCHAR,
    -- Athlete's age (to be updated later)
    Height VARCHAR,
    -- Athlete's height (to be updated later)
    Weight VARCHAR,
    -- Athlete's weight (to be updated later)
    Team VARCHAR(50),
    -- Athlete's team
    NOC VARCHAR(5),
    -- National Olympic Committee code
    Games VARCHAR(50),
    -- Games in which the athlete participated
    Year INT NOT NULL,
    -- Year of the event
    Season VARCHAR(50),
    -- Season of the event (e.g., Summer, Winter)
    City VARCHAR(50),
    -- City where the games took place
    Sport VARCHAR(50),
    -- Sport played by the athlete
    Event VARCHAR(255),
    -- Specific event the athlete participated in
    Medal VARCHAR(50) -- Type of medal won (if any)
);
-- CSV Upload
-- Import data from the CSV file into the Olimpics_table
COPY Olimpics_table
FROM '/Users/andriikachan/Downloads/athlete_events_edited.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
-- Updating the Data Types and NULL Variables
-- Replace empty strings or 'NULL' strings with actual NULL values for Height
UPDATE olimpics_table
SET Height = NULL
WHERE Height = ''
    OR Height = 'NULL';
-- Replace empty strings or 'NULL' strings with actual NULL values for Weight
UPDATE olimpics_table
SET Weight = NULL
WHERE Weight = ''
    OR Weight = 'NULL';
-- Replace empty strings or 'NULL' strings with actual NULL values for Medal
UPDATE olimpics_table
SET Medal = NULL
WHERE Medal = ''
    OR Medal = 'NULL';
-- Replace empty strings or 'NULL' strings with actual NULL values for Age
UPDATE olimpics_table
SET Age = NULL
WHERE Age = ''
    OR Age = 'NULL';
-- Check current column data types and nullability
SELECT column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'olimpics_table';
-- Alter the data types for the columns to reflect appropriate types
ALTER TABLE olimpics_table
ALTER COLUMN Height TYPE FLOAT USING Height::FLOAT;
ALTER TABLE olimpics_table
ALTER COLUMN Weight TYPE FLOAT USING Weight::FLOAT;
ALTER TABLE olimpics_table
ALTER COLUMN Medal TYPE VARCHAR(50);
ALTER TABLE olimpics_table
ALTER COLUMN Age TYPE INT USING Age::INT;