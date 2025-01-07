-- Table and DB Creation
CREATE DATABASE Olimpics;
CREATE TABLE Olimpics_table (
    ID INT NOT NULL,
    Name VARCHAR(255),
    Sex VARCHAR(5),
    Age VARCHAR,
    Height VARCHAR,
    Weight VARCHAR,
    Team VARCHAR(50),
    NOC VARCHAR(5),
    Games VARCHAR(50),
    Year INT NOT NULL,
    Season VARCHAR(50),
    City VARCHAR(50),
    Sport VARCHAR(50),
    Event VARCHAR(255),
    Medal VARCHAR(50)
);
-- CSV Upload
COPY Olimpics_table
FROM '/Users/andriikachan/Downloads/athlete_events_edited.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
-- Updating the Data Types and NULL Variables
UPDATE olimpics_table
SET Height = NULL
WHERE Height = ''
    OR Height = 'NULL';
UPDATE olimpics_table
SET Weight = NULL
WHERE Weight = ''
    OR Weight = 'NULL';
UPDATE olimpics_table
SET Medal = NULL
WHERE Medal = ''
    OR Medal = 'NULL';
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