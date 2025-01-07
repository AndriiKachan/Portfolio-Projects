-- Task 1
-- Retrieve all columns and rows from the table.
SELECT *
FROM olimpics_table
ORDER BY id -- Find athletes who have a NULL value in the Medal column.
SELECT Name,
    Team,
    Medal
FROM olimpics_table
WHERE Medal IS NULL -- Select unique combinations of Sport and Event.
SELECT DISTINCT Sport,
    Event
FROM olimpics_table -- Task 2
    -- Fetch the Name, Sport, and Team of athletes who participated in the "Winter" Olympics in or after the year 2000.
SELECT Name,
    Sport,
    Team,
    Year,
    Season
FROM olimpics_table
WHERE Season = 'Winter'
    AND Year > 2000;
-- Find all athletes whose names start with the letter "A" (case-sensitive).
SELECT Name
FROM olimpics_table
WHERE Name LIKE 'A%';
-- Retrieve all rows, but limit the output to the first 10 records.
SELECT *
FROM olimpics_table
ORDER BY id
LIMIT 10 -- Task 3
    -- Retrieve all columns of athletes who participated in the "2012 Summer" Olympics.
SELECT *
FROM olimpics_table
WHERE Season = 'Summer'
    AND Year = 2012
ORDER BY ID;
-- Find athletes who are older than 25.
SELECT Name,
    Age
FROM olimpics_table
WHERE Age > 25;
-- Fetch data for male athletes only.
SELECT Name,
    Sex
FROM olimpics_table
WHERE Sex = 'M' -- Task 4
    -- Retrieve the Name, Sport, and Medal for female athletes who won a gold medal.
SELECT Name,
    Sport,
    Medal,
    Sex
FROM olimpics_table
WHERE Medal = 'Gold' -- Find all athletes whose height is greater than 180 cm but less than 200 cm.
SELECT Name,
    Height,
    Sex
FROM olimpics_table
WHERE Height BETWEEN 180 AND 200;
-- Fetch athletes who belong to the team "USA".
SELECT Name,
    Team,
    Sport
FROM olimpics_table
WHERE Team = 'United States'
    OR Team = 'United States of America';
-- Task 5
-- Find all athletes who are younger than 18 and participated in the "2016 Summer" Olympics.
SELECT Name,
    Age,
    Season,
    Year
FROM olimpics_table
WHERE Age < 18
    AND Season = 'Summer'
    AND Year = 2016;
-- Retrieve athletes who participated in "Athletics" and won either a silver or bronze medal.
SELECT Name,
    Medal
FROM olimpics_table
WHERE Medal = 'Silver'
    OR Medal = 'Bronze';
-- Fetch all athletes who are between 20 and 30 years old and whose weight is greater than 70 kg.
SELECT Name,
    Age,
    Weight
FROM olimpics_table
WHERE Age BETWEEN 20 AND 30
    AND Weight > 70;
-- Task 6
-- Retrieve all columns of athletes sorted by their Age in ascending order.
SELECT *
FROM Olimpics_table
ORDER BY Age -- Sort the dataset by Name in alphabetical order.
SELECT *
FROM Olimpics_table
ORDER BY Name -- Fetch data for athletes sorted by Year in descending order.
SELECT *
FROM Olimpics_table
ORDER BY Year DESC -- Task 7
    -- Retrieve the Name and Team of athletes and sort the results first by Team (ascending) and then by Name (ascending).
SELECT DISTINCT Team,
    Name
FROM Olimpics_table
ORDER BY Name,
    Team -- Sort the dataset by Height in descending order, and fetch the top 15 tallest athletes.
SELECT DISTINCT Name,
    Height
FROM Olimpics_table
WHERE Height IS NOT NULL
ORDER BY Height DESC
LIMIT 15;
-- Retrieve all rows of athletes and sort them by Medal in ascending order, keeping NULL values last.
SELECT DISTINCT Name,
    Medal
FROM Olimpics_table
ORDER BY Medal -- Task 8
    -- Fetch the names of athletes who participated in "Swimming" and sort them by Weight in descending order.
SELECT DISTINCT Name,
    Weight,
    Sport
FROM Olimpics_table
WHERE Weight IS NOT NULL
    AND Sport = 'Swimming'
ORDER BY Weight DESC
LIMIT 15;
-- Retrieve the Name, Age, and Sport of athletes who are younger than 30, sorted by Age (ascending) and Sport (alphabetically).
SELECT DISTINCT Name,
    Age,
    Sport
FROM Olimpics_table
WHERE Age IS NOT NULL
    AND Age < 30
ORDER BY Age ASC,
    Sport ASC -- Sort the dataset by Sport (alphabetically) and within each sport by Height (descending).
SELECT DISTINCT Name,
    Height,
    Sport
FROM Olimpics_table
WHERE Height IS NOT NULL
ORDER BY Sport ASC,
    Height DESC -- Task 9
    -- Count the total number of athletes in the dataset.
SELECT COUNT(*)
FROM olimpics_table -- Find the average Age of all athletes.
SELECT Round(AVG(Age), 0) AS Average_Age
FROM olimpics_table -- Retrieve the minimum and maximum values for Height.
SELECT MIN(Height) AS min_height,
    MAX(Height) AS max_height
FROM olimpics_table -- Task 10
    -- Calculate the total number of medals won (excluding NULL values in the Medal column).
SELECT COUNT(Medal)
FROM olimpics_table
WHERE Medal IS NOT NULL;
-- Find the average Weight of athletes who participated in the "Winter" Olympics.
SELECT AVG(Weight)
FROM olimpics_table
WHERE Season = 'Winter' -- Retrieve the youngest (MIN) and oldest (MAX) athletes who participated in "Athletics".
SELECT MIN(Age) AS min_age,
    MAX(Age) AS max_age
FROM olimpics_table
WHERE Sport = 'Athletics' -- Task 11
    -- Count the number of athletes who participated in the "2016 Summer" Olympics and have a Weight greater than 75 kg.
SELECT COUNT(*)
FROM olimpics_table
WHERE Season = 'Summer'
    AND Year = 2016
    AND Weight > 75;
-- Calculate the average Height of female athletes in the team "Canada".
SELECT AVG(Height)
FROM olimpics_table
WHERE Sex = 'F'
    AND Team = 'Canada' -- Find the minimum and maximum Age of athletes who won a gold medal in "Basketball".
SELECT MIN(Age) AS min_age_medal,
    MAX(Age) AS max_age_medal
FROM olimpics_table
WHERE Medal = 'Gold'
    AND Sport = 'Basketball' -- Task 12
    -- Group the dataset by Team and count the number of athletes in each team.
SELECT Team,
    Count(*) AS Athlete_Count_By_Team
FROM olimpics_table
GROUP BY TEAM
ORDER BY Athlete_Count DESC -- Find the total number of medals won by each country (NOC).
SELECT NOC,
    COUNT(Medal) AS Medal_Count_By_Country
FROM olimpics_table
GROUP BY NOC
ORDER BY Medal_Count_By_Country DESC -- Group by Sport and calculate the average Age of athletes in each sport.
SELECT Sport,
    ROUND(AVG(Age), 0) AS AVG_Age_Sport
FROM olimpics_table
GROUP BY Sport
ORDER BY AVG_Age_Sport DESC -- Task 13
    -- Group by Season and count the number of athletes who participated in each season.
SELECT Season,
    COUNT(*) AS Athlete_Count
FROM olimpics_table
GROUP BY Season -- Find the number of medals won by each team (Team) and filter to show only teams that won more than 10 medals.
SELECT Team,
    COUNT(Medal) AS Team_Medal_Count
FROM olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Team
HAVING COUNT(Medal) > 10
ORDER BY Team_Medal_Count DESC;
-- Group the dataset by Year and find the average Weight of athletes for each year.
SELECT Year,
    AVG(Weight) AS AVG_Weight_Year
FROM olimpics_table
WHERE Weight IS NOT NULL
GROUP BY Year
ORDER BY Year -- Task 14
    -- Group the dataset by City and find the minimum and maximum Age of athletes in each city where the Olympics were held.
SELECT City,
    MIN(Age) AS Min_Age,
    MAX(Age) AS Max_Age
FROM olimpics_table
WHERE Age IS NOT NULL
GROUP BY City -- Find the total number of athletes grouped by Sport and Event, and filter to show only those events with more than 20 athletes.
SELECT Sport,
    Event,
    COUNT(*)
FROM olimpics_table
GROUP BY Sport,
    Event
HAVING Count(*) > 20
ORDER BY COUNT(*) DESC -- Group the dataset by Team and Medal, and count how many athletes won each type of medal in each team. Filter to show only teams with at least one gold medal.
SELECT Team,
    Medal,
    COUNT(*) AS Athlete_Count
FROM olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Team,
    Medal
HAVING Team IN (
        SELECT DISTINCT Team
        FROM olimpics_table
        WHERE Medal = 'Gold'
    )
ORDER BY Athlete_Count DESC;
-- Task 15
-- Join the Athletes table with the Participation table to show athlete names, sports, and years.
SELECT Athletes.Name,
    Participation.Sport,
    Participation.Year
FROM Athletes
    INNER JOIN Participation ON Athletes.ID = Participation.Athlete_ID;
-- INNER JOIN: Combines rows from both tables where there is a match.
-- Use a LEFT JOIN to list all athletes and the sports they participated in, including athletes with no participation record.
SELECT Athletes.*,
    Participation.Sport
FROM Athletes
    LEFT JOIN Participation ON Athletes.ID = Participation.Athlete_ID -- LEFT JOIN: Returns all rows from the left table, with matching rows from the right table or NULL if no match.
    -- Use a RIGHT JOIN to list all participation records and athlete names, including records without corresponding athletes.
SELECT Athletes.Name,
    Participation.*
FROM Athletes
    RIGHT JOIN Participation ON Athletes.ID = Participation.Athlete_ID -- RIGHT JOIN: Returns all rows from the right table, with matching rows from the left table or NULL if no match.
    -- Task 16
    -- Perform a self-join on the Participation table to find athletes who participated in the same sport in different years.
SELECT A1.Athlete_ID,
    A1.Sport,
    A1.Year,
    A2.Year AS Other_Year
FROM Participation A1
    JOIN Participation A2 ON A1.Athlete_ID = A2.Athlete_ID
    AND A1.Sport = A2.Sport
    AND A1.Year < A2.Year;
-- Join the Athletes and Participation tables and filter for athletes who participated in "Basketball" and won a medal.
SELECT Athletes.Name,
    COUNT(Participation.Medal) AS Medal_Count
FROM Athletes
    INNER JOIN Participation ON Athletes.ID = Participation.Athlete_ID
WHERE Sport = 'Basketball'
    AND Medal IS NOT NULL
GROUP BY Athletes.Name;
-- Join the Athletes, Participation, and Events tables to retrieve athlete names, event details, and medals won.
SELECT Athletes.Name,
    Participation.Event,
    Participation.Medal
FROM Athletes
    INNER JOIN Participation ON Athletes.ID = Participation.Athlete_ID
WHERE Medal IS NOT NULL -- Task 17
    -- Use a FULL OUTER JOIN to list all athletes and participation details, ensuring no records are missed.
SELECT Athletes.*,
    Participation.*
FROM Athletes
    FULL OUTER JOIN Participation ON Athletes.ID = Participation.Athlete_ID -- FULL OUTER JOIN: Returns all rows from both tables, with NULL for unmatched rows.
    -- Join the Athletes and Participation tables to count the number of athletes and medals won in each sport.
SELECT Participation.Sport,
    COUNT(Athletes.Name) AS Athletes_Count,
    COUNT(Participation.Medal) AS Medal_Count
FROM Athletes
    INNER JOIN Participation ON Athletes.ID = Participation.Athlete_ID
GROUP BY Participation.Sport
ORDER BY Athletes_Count;
-- Join the Athletes, Participation, and Medals tables and filter for athletes who participated in the "Winter" season and won more than one medal.
SELECT Athletes.Name,
    Participation.Season,
    COUNT(Participation.Medal) AS Medal_Count
FROM Athletes
    INNER JOIN Participation ON Athletes.ID = Participation.Athlete_ID
WHERE Season = 'Winter'
GROUP BY Athletes.Name,
    Participation.Season
HAVING COUNT(Participation.Medal) > 1
ORDER BY Medal_Count DESC;
-- Task 18
-- Use a subquery to find all athletes who participated in the year 2000.
SELECT Name
FROM Olimpics_table
WHERE Year IN (
        SELECT Year
        FROM Olimpics_table
        WHERE Year = 2000
        LIMIT 1
    ) -- Find all sports where athletes won a medal in both 2000 and 2004.
SELECT DISTINCT Sport
FROM Olimpics_table
WHERE Medal IS NOT NULL
    AND Year = 2000
    AND Sport IN (
        SELECT Sport
        FROM Olimpics_table
        WHERE Medal IS NOT NULL
            AND Year = 2004
    );
-- Get the athletes who participated in a sport, but did not win a medal.
SELECT DISTINCT Name,
    Sport,
    Medal
FROM Olimpics_table
WHERE Medal IS NULL -- Task 19
    -- Find athletes who participated in a sport and in a year when no other athlete participated in that sport.
SELECT Name,
    Sport,
    Year,
    Medal
FROM olimpics_table
WHERE (Sport, Year) IN (
        SELECT Sport,
            Year
        FROM olimpics_table
        GROUP BY Sport,
            Year
        HAVING COUNT(ID) = 1
    );
-- Use a subquery to get the names of athletes who participated in a sport with more than 10 entries in the Olimpics_table.
SELECT Sport,
    COUNT(DISTINCT Name) AS Unique_Name_Count
FROM Olimpics_table
GROUP BY Sport
HAVING COUNT(DISTINCT Name) > 10
ORDER BY Unique_Name_Count ASC -- Write a query using a subquery to find the athlete who participated in the most events in a given sport.
    WITH -- Here we Define the CTE
    SportParticipationCounts -- Write Subquery 1 (mini-table)
    AS (
        SELECT Name,
            Sport,
            COUNT(*) AS Participation_Count
        FROM Olimpics_table
        GROUP BY Name,
            Sport
    ),
    MaxSportParticipation -- Write Subquery 2 (mini-table)
    AS (
        SELECT Sport,
            MAX(Participation_Count) AS Max_Participation
        FROM SportParticipationCounts
        GROUP BY Sport
    ) -- Main Query
SELECT spc.Name,
    spc.Sport,
    spc.Participation_Count
FROM SportParticipationCounts spc
    JOIN MaxSportParticipation msp ON spc.Sport = msp.Sport -- Filters
WHERE spc.Participation_Count = msp.Max_Participation
ORDER BY Participation_Count DESC;
-- Task 20
-- Use a subquery to find athletes who participated in sports where the number of medal winners in 1996 is higher than in 2000.
WITH Winners_Count_1996 --Mini-table 1 name
AS (
    SELECT Sport,
        COUNT(DISTINCT Name) AS Winners_1996
    FROM Olimpics_table
    WHERE Medal IS NOT NULL
        AND Year = 1996
    GROUP BY Sport
),
Winners_Count_2000 --Mini-table 1 name
AS (
    SELECT Sport,
        COUNT(DISTINCT Name) AS Winners_2000
    FROM Olimpics_table
    WHERE Medal IS NOT NULL
        AND Year = 2000
    GROUP BY Sport
)
SELECT Olimpics_table.Name,
    Olimpics_table.Sport
FROM Olimpics_table
WHERE Olimpics_table.Sport IN (
        SELECT W96.Sport
        FROM Winners_Count_1996 W96
            JOIN Winners_Count_2000 W00 ON W96.Sport = W00.Sport
        WHERE W96.Winners_1996 > W00.Winners_2000
    )
    AND Olimpics_table.Medal IS NOT NULL;
-- Create a query with a subquery to list all athletes who participated in the same sport in different years but did not win medals in either year.
SELECT DISTINCT Name,
    Sport,
    Medal,
    Year
FROM Olimpics_table
WHERE Sport IN (
        SELECT Sport
        FROM Olimpics_table
        WHERE Medal IS NULL
        GROUP BY Sport,
            Name
        HAVING COUNT(DISTINCT Year) > 1
    )
    AND Medal IS NULL
ORDER BY Name;
-- Task 21
-- Write a query to find all athletes whose name starts with the letter "M" in the Olimpics_table.
SELECT Name,
    COUNT(Medal) AS Medal_Count
FROM Olimpics_table
WHERE Name LIKE 'M%'
    AND Medal IS NOT NULL
GROUP BY NAME
ORDER BY Medal_Count DESC -- Write a query to find all athletes whose name ends with the letters "son" in the Olimpics_table.
SELECT *
FROM Olimpics_table
WHERE Name LIKE '%son' -- Write a query to find all athletes whose name contains the letter "a" followed by any number of characters, followed by the letter "n" (e.g., "Jordan", "Lebron").
SELECT *
FROM Olimpics_table
WHERE Name LIKE '%a%n%' -- Task 22
    -- Write a query to find the absolute value of the difference in medals between two athletes (e.g., Michael Jordan and LeBron James).
SELECT ABS(
        (
            SELECT COUNT(*)
            FROM Olimpics_table
            WHERE Name = 'Marit Bjrgen'
                AND Medal IS NOT NULL
        ) - (
            SELECT COUNT(*)
            FROM Olimpics_table
            WHERE Name = 'Mark James Todd'
                AND Medal IS NOT NULL
        )
    ) AS Medal_Difference;
-- Write a query to round the number of medals won by each athlete to the nearest integer using the ROUND() function.
SELECT Name,
    ROUND(COUNT(Medal)) AS Rounded_Medals
FROM Olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Name
ORDER BY Rounded_Medals DESC;
-- Write a query that uses the FLOOR() function to return the number of medals each athlete won, rounded down to the nearest whole number.
SELECT Name,
    FLOOR(COUNT(Medal)) AS Medals_Rounded_Down
FROM Olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Name
ORDER BY Medals_Rounded_Down DESC;
-- Task 23
-- Write a query to combine the first and last name of athletes into a single column using the CONCAT() function.
SELECT CONCAT(Name, ' | ', Sex) AS Name_Sex
FROM Olimpics_table;
-- Write a query to find the length of the name of each athlete using the LENGTH() function.
SELECT ID,
    Name,
    LENGTH(Name) AS Name_Length
FROM Olimpics_table
ORDER BY Name_Length DESC -- Write a query to replace all occurrences of the letter "A" with the letter "X" in the names of athletes using the REPLACE() function.
SELECT REPLACE(Name, 'o', 'X') AS Modified_Name
FROM Olimpics_table
WHERE Name LIKE 'Robin Hahn' -- Task 24
    -- Write a query to create a view called MedalWinners that lists athletes who won a medal in the 2000 Olympics.
    CREATE VIEW MedalWinners AS -- A view behaves like a table in a query, but it doesn't store data itself
SELECT Name,
    Sport,
    Medal,
    Year
FROM Olimpics_table
WHERE Year = 2000
    AND Medal IS NOT NULL;
SELECT *
FROM MedalWinners -- Write a query to create a view called NonMedalAthletes that lists athletes who did not win any medals, filtering by year.
    CREATE VIEW NonMedalAthletes AS
SELECT Name,
    Medal,
    Year
FROM Olimpics_table
WHERE Medal IS NULL
SELECT *
FROM NonMedalAthletes
ORDER BY Year -- Create a view called TopMedalists that lists athletes who have won more than 5 medals in total across all years.
    CREATE VIEW TopMedalists AS
SELECT Name,
    COUNT(Medal) AS Total_Medals
FROM Olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Name
HAVING COUNT(Medal) > 5;
SELECT *
FROM TopMedalists -- Task 25
    -- Write a query to find all athletes who participated in the Olympics after the year 2000.
SELECT Name,
    Year
FROM Olimpics_table
WHERE Year > 2000 -- Write a query to find the number of years between the athlete's first participation (first record) and their last participation (last record) in the Olympics.
SELECT Name,
    MAX(Year) - MIN(Year) AS Years_Diff
FROM Olimpics_table
GROUP BY Name
ORDER BY Years_Diff DESC;
-- Write a query to find the number of days between an athlete's participation in the 1996 Olympics and their participation in the 2000 Olympics.
SELECT Name,
    DATEDIFF(
        --This function calculates the difference between two dates. 
        (
            SELECT Year
            FROM Olimpics_table
            WHERE Year = 2000
                AND Name = Olimpics_table.Name
        ),
        (
            SELECT Year
            FROM Olimpics_table
            WHERE Year = 1996
                AND Name = Olimpics_table.Name
        )
    ) AS Days_Between
FROM Olimpics_table
WHERE Year = 1996
    AND Name IN (
        SELECT DISTINCT Name
        FROM Olimpics_table
        WHERE Year = 2000
    );
-- Task 26
-- Write a query that uses a CASE statement to display "Gold", "Silver", "Bronze", or "No Medal" for athletes based on the value in the Medal column.
SELECT Name,
    CASE
        WHEN Medal = 'Gold' THEN 'Gold'
        WHEN Medal = 'Silver' THEN 'Silver'
        WHEN Medal = 'Bronze' THEN 'Bronze'
        ELSE 'No Medal'
    END AS Medal_Status
FROM Olimpics_table;
-- Use a CASE statement to categorize athletes as "Youth", "Adult", or "Veteran" based on their Age, 
-- ensuring "Youth" is less than 18, "Adult" is between 18-35, and "Veteran" is 36 or older.
SELECT Name,
    Age,
    CASE
        WHEN Age IS NULL THEN 'Not Specified'
        WHEN Age < 18 THEN 'Youth'
        WHEN Age BETWEEN 18 AND 35 THEN 'Adult'
        ELSE 'Veteran'
    END AS Age_Categories
FROM Olimpics_table
WHERE Age IS NOT NULL
ORDER BY Age -- Use a CASE statement to classify athletes into "Short", "Average", "Tall", or "No height data" based on Height, 
    -- where "Short" is less than 160 cm, "Average" is between 160-180 cm, and "Tall" is above 180 cm.
SELECT Name,
    Age,
    Height,
    CASE
        WHEN Height < 160 THEN 'Short'
        WHEN Height BETWEEN 160 AND 180 THEN 'Average'
        WHEN Height > 180 THEN 'Tall'
        ELSE 'Not Specified'
    END AS Height_Categories
FROM Olimpics_table
WHERE Height IS NOT NULL
    AND Age IS NOT NULL
ORDER BY Height -- Use a CASE statement to assign athletes as "Top Performer", "Consistent Performer", "One-Sport Wonder", 
    -- or "No Medal" based on the number of sports they won medals in, where "Top Performer" has 3 or more sports, 
    -- "Consistent Performer" has 2, "One-Sport Wonder" has only 1, and "No Medal" has no medals.
SELECT Name,
    CASE
        WHEN COUNT(DISTINCT Sport) >= 3 THEN 'Top Performer'
        WHEN COUNT(DISTINCT Sport) = 2 THEN 'Consistent Performer'
        WHEN COUNT(DISTINCT Sport) = 1 THEN 'One-Sport Wonder'
        ELSE 'No Medal'
    END AS Performance_Category
FROM Olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Name
ORDER BY Performance_Category;
-- Write a query that uses COALESCE() to display "No Medal" when the Medal field is NULL.
SELECT Name,
    Sport,
    COALESCE(Medal, 'No Medal') AS Medal_Status --If this value is NULL, then give me this instead
FROM Olimpics_table
ORDER BY Name;
-- Task 27
-- Write a query to simulate a transaction: Deduct 1 from the total number of medals won by a specific athlete (e.g., LeBron James).
-- Start a transaction
BEGIN;
-- Delete the latest medal for the athlete
DELETE FROM Olimpics_table
WHERE Name = 'Paavo Johannes Aaltonen'
    AND Medal IS NOT NULL
    AND Year = (
        SELECT MAX(Year)
        FROM Olimpics_table
        WHERE Name = 'Paavo Johannes Aaltonen'
            AND Medal IS NOT NULL
    );
-- Simulate a check (for demonstration purposes)
SELECT *
FROM Olimpics_table
WHERE Name = 'Paavo Johannes Aaltonen';
-- Undo all the changes made in a transaction
ROLLBACK;
-- Commit the transaction if everything is correct
COMMIT;
-- Write a query to commit or rollback a transaction that updates the medal count of an athlete, but only if the total number of medals after the change does not become negative.
-- Start the transaction
BEGIN TRANSACTION;
-- Set a savepoint in case we need to rollback to this point
SAVEPOINT BeforeDeletion;
-- Attempt to delete the most recent medal for 'Paavo Johannes Aaltonen'
DELETE FROM Olimpics_table
WHERE Name = 'Paavo Johannes Aaltonen'
    AND Medal IS NOT NULL
    AND Year = (
        -- Subquery: Find the most recent year the athlete won a medal
        SELECT MAX(Year)
        FROM Olimpics_table
        WHERE Name = 'Paavo Johannes Aaltonen'
            AND Medal IS NOT NULL
    );
-- Check if any rows were deleted
-- Select the count of deleted rows
SELECT COUNT(*) AS RowsDeleted
FROM Olimpics_table
WHERE Name = 'Paavo Johannes Aaltonen'
    AND Medal IS NOT NULL
    AND Year = (
        -- Subquery: Find the most recent year the athlete won a medal
        SELECT MAX(Year)
        FROM Olimpics_table
        WHERE Name = 'Paavo Johannes Aaltonen'
            AND Medal IS NOT NULL
    );
-- If no rows were deleted, rollback to the savepoint
ROLLBACK;
-- You can manually decide to roll back if RowsDeleted is 0.
-- Example:
-- If no rows were deleted, rollback to savepoint:
-- ROLLBACK TO SAVEPOINT BeforeDeletion;
-- Commit the transaction if delete was successful
COMMIT;
-- Write a series of SQL commands to handle a transaction where multiple athletes' medal counts are updated at once, with a ROLLBACK if any error occurs.
-- Medals Check
SELECT Name,
    Medal
FROM Olimpics_table
WHERE Name IN (
        'Paavo Johannes Aaltonen',
        'Kjetil Andr Aamodt',
        'Luc Abalo'
    );
-- Start the transaction
BEGIN TRANSACTION;
-- Set a savepoint in case we need to rollback to this point
SAVEPOINT BeforeUpdate;
-- Update athlete 1's medal count
UPDATE Olimpics_table
SET Medal = 'Gold'
WHERE Name = 'Paavo Johannes Aaltonen'
    AND Medal = 'Bronze';
-- Update athlete 2's medal count
UPDATE Olimpics_table
SET Medal = 'Silver'
WHERE Name = 'Kjetil Andr Aamodt'
    AND Medal = 'Bronze';
-- Update athlete 3's medal count
UPDATE Olimpics_table
SET Medal = 'Gold'
WHERE Name = 'Luc Abalo'
    AND Medal = 'Bronze';
-- If all updates are successful, commit the transaction
COMMIT;
-- If an error occurs, rollback to the savepoint and notify
ROLLBACK TO SAVEPOINT BeforeUpdate;
-- Task 28
-- Write a query to create an index on the Year column to optimize querying the data by year.
CREATE INDEX idx_year ON Olimpics_table (Year);
SELECT *
FROM Olimpics_table
WHERE Year BETWEEN 1996 AND 2000;
-- Task 29
-- Write a simple recursive query to list all the years of participation for an athlete who has participated multiple times in the Olympics.
WITH RECURSIVE cte_name AS (
    -- Base case: Select the earliest year of participation
    SELECT DISTINCT Name,
        MIN(Year) AS Year
    FROM Olimpics_table
    WHERE Name = 'Luc Abalo'
    GROUP BY Name
    UNION ALL
    -- Recursive step: Find subsequent years of participation
    SELECT t.Name,
        t.Year
    FROM Olimpics_table t
        INNER JOIN cte_name py --(alias)
        ON t.Name = py.Name
        AND t.Year > py.Year
)
SELECT DISTINCT Year
FROM cte_name
ORDER BY Year;
-- Write a recursive query to display the hierarchy of medal-winning athletes across multiple Olympic years, starting with the most medalled athlete.
SELECT DISTINCT Name,
    COUNT(Medal) AS Medal_count,
    STRING_AGG(DISTINCT Year::TEXT, ', ') AS Participation_Years
FROM Olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Name
ORDER BY Medal_count DESC
LIMIT 100;
-- Write a recursive query that traces the performance of an athlete in the Olympics, showing how their medal count has increased over time.
SELECT DISTINCT Name,
    COUNT(Medal) AS Medal_count,
    STRING_AGG(Year || ' (' || Medal || ')', ', ') AS Participation_Years
FROM Olimpics_table
WHERE Medal IS NOT NULL
GROUP BY Name
ORDER BY Medal_count DESC
LIMIT 100;
-- Task 30
-- Write a query that uses the PIVOT operation to count the number of medals (Gold, Silver, Bronze) each athlete won in a single year.
SELECT Name,
    Year,
    COUNT(
        CASE
            WHEN Medal = 'Gold' THEN 1
        END
    ) AS Gold_Medals,
    COUNT(
        CASE
            WHEN Medal = 'Silver' THEN 1
        END
    ) AS Silver_Medals,
    COUNT(
        CASE
            WHEN Medal = 'Bronze' THEN 1
        END
    ) AS Bronze_Medals
FROM Olimpics_table
WHERE Medal IN ('Gold', 'Silver', 'Bronze') -- Ensure we only count medals
GROUP BY Name,
    Year
ORDER BY Year;
-- Write a query to unpivot the medal counts for each athlete and show them as separate rows for each medal type (Gold, Silver, Bronze).
SELECT Name,
    Year,
    'Gold' AS Medal_Type,
    COUNT(
        CASE
            WHEN Medal = 'Gold' THEN 1
        END
    ) AS Medal_Count
FROM Olimpics_table
WHERE Medal = 'Gold'
GROUP BY Name,
    Year
UNION ALL
SELECT Name,
    Year,
    'Silver' AS Medal_Type,
    COUNT(
        CASE
            WHEN Medal = 'Silver' THEN 1
        END
    ) AS Medal_Count
FROM Olimpics_table
WHERE Medal = 'Silver'
GROUP BY Name,
    Year
UNION ALL
SELECT Name,
    Year,
    'Bronze' AS Medal_Type,
    COUNT(
        CASE
            WHEN Medal = 'Bronze' THEN 1
        END
    ) AS Medal_Count
FROM Olimpics_table
WHERE Medal = 'Bronze'
GROUP BY Name,
    Year
ORDER BY Medal_Count DESC;
-- Task 31
-- Write a query using ROW_NUMBER() to rank athletes based on the number of medals they won in a specific year.
SELECT Name,
    Year,
    COUNT(Medal) AS Medal_Count,
    ROW_NUMBER() OVER (
        PARTITION BY Year
        ORDER BY COUNT(Medal) DESC
    ) AS Rank
FROM -- ROW_NUMBER() provides a unique rank for each row, like a leaderboard
    Olimpics_table
WHERE Medal IS NOT NULL
    AND YEAR = 2008
GROUP BY Name,
    Year
ORDER BY Medal_count DESC,
    Rank;
-- Write a query using DENSE_RANK() to rank athletes based on their performance in a specific sport (e.g., Basketball) by their total medal count.
SELECT Name,
    Sport,
    COUNT(Medal) AS Medal_Count,
    DENSE_RANK() OVER (
        PARTITION BY Sport
        ORDER BY COUNT(Medal) DESC
    ) AS Rank
FROM Olimpics_table -- DENSE_RANK() is a window function in SQL used to assign ranks to rows within a partition of a result set.
WHERE Medal IS NOT NULL
    AND Sport = 'Swimming' -- Replace with the sport you are interested in
GROUP BY Name,
    Sport
ORDER BY Rank;
-- Write a query using the NTILE() window function to distribute athletes into 4 groups (quartiles) based on their total medal count.
SELECT Name,
    SUM(
        CASE
            WHEN Medal IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS Medal_count,
    NTILE(4) OVER (
        ORDER BY SUM(
                CASE
                    WHEN Medal IS NOT NULL THEN 1
                    ELSE 0
                END
            ) DESC
    ) AS Quartile,
    CASE
        -- The NTILE() function divides the result set into a specified number of approximately equal groups.
        WHEN NTILE(4) OVER (
            ORDER BY SUM(
                    CASE
                        WHEN Medal IS NOT NULL THEN 1
                        ELSE 0
                    END
                ) DESC
        ) = 1 THEN '1st Quartile'
        WHEN NTILE(4) OVER (
            ORDER BY SUM(
                    CASE
                        WHEN Medal IS NOT NULL THEN 1
                        ELSE 0
                    END
                ) DESC
        ) = 2 THEN '2nd Quartile'
        WHEN NTILE(4) OVER (
            ORDER BY SUM(
                    CASE
                        WHEN Medal IS NOT NULL THEN 1
                        ELSE 0
                    END
                ) DESC
        ) = 3 THEN '3rd Quartile'
        WHEN NTILE(4) OVER (
            ORDER BY SUM(
                    CASE
                        WHEN Medal IS NOT NULL THEN 1
                        ELSE 0
                    END
                ) DESC
        ) = 4 THEN '4th Quartile'
    END AS Quartile_Label
FROM Olimpics_table
GROUP BY Name
ORDER BY Quartile,
    Medal_count DESC;
-- Task 32
-- Write a dynamic SQL query to fetch all records for a specific sport passed as a parameter.
DO $$
DECLARE sport_name VARCHAR;
sql_query TEXT;
BEGIN sport_name := 'Football';
sql_query := 'SELECT * FROM Olimpics_table WHERE sport = $1';
EXECUTE sql_query USING sport_name;
END $$;
CREATE OR REPLACE FUNCTION get_olympic_records_by_sport(p_sport VARCHAR) RETURNS TABLE (
        Name VARCHAR,
        sport VARCHAR,
        Year INT,
        Medal VARCHAR
    ) AS $$ BEGIN RETURN QUERY EXECUTE 'SELECT Name, sport, Year, Medal 
         FROM Olimpics_table
         WHERE sport = $1' USING p_sport;
END;
$$ LANGUAGE plpgsql;
SELECT *
FROM get_olympic_records_by_sport('Football');
-- Write a dynamic SQL query that allows the user to pass a year as a parameter, and returns all athletes who participated in that year.
DO $$
DECLARE year_param INT;
sql_query TEXT;
BEGIN year_param := 2008;
sql_query := 'SELECT * FROM Olimpics_table WHERE Year = $1';
EXECUTE sql_query USING year_param;
END $$;
CREATE OR REPLACE FUNCTION get_athletes_by_year(p_year INT) RETURNS TABLE (
        Name VARCHAR,
        sport VARCHAR,
        Year INT,
        Medal VARCHAR
    ) AS $$ BEGIN RETURN QUERY EXECUTE 'SELECT Name, sport, Year, Medal 
         FROM Olimpics_table
         WHERE Year = $1' USING p_year;
END;
$$ LANGUAGE plpgsql;
SELECT *
FROM get_athletes_by_year(2008);
-- Write a dynamic SQL query to create a table that holds medal counts for each athlete, and dynamically populate the table based on the year passed as a parameter.
DO $$
DECLARE year_param INT;
-- Declare the variable for year
table_name TEXT := 'athlete_medal_counts';
-- Define the table name to store medal counts
sql_create_table TEXT;
-- Variable to hold dynamic SQL for creating the table
sql_insert_data TEXT;
-- Variable to hold dynamic SQL for inserting data
BEGIN -- Set the year_param to the desired year, for example, 2020
year_param := 2020;
-- Construct the SQL query to create a table dynamically
sql_create_table := 'CREATE TABLE IF NOT EXISTS ' || table_name || ' (
                            athlete_name VARCHAR,
                            medal_count INT,
                            year INT
                         );';
-- Execute the dynamic table creation SQL
EXECUTE sql_create_table;
-- Construct the SQL query to populate the table dynamically based on the year
sql_insert_data := 'INSERT INTO ' || table_name || ' (athlete_name, medal_count, year) 
                        SELECT Name, COUNT(Medal), $1 
                        FROM Olimpics_table
                        WHERE Year = $1
                        GROUP BY Name;';
-- Execute the dynamic SQL query to insert data into the table
EXECUTE sql_insert_data USING year_param;
-- You can check the populated data by selecting from the table
-- EXECUTE 'SELECT * FROM ' || table_name;
END $$;
SELECT *
FROM athlete_medal_counts;
-- Task 33
-- Write a simple stored procedure that returns the list of all athletes who have won a Gold medal.
-- Creating or replacing a stored procedure to get all athletes who have won a Gold medal
CREATE OR REPLACE PROCEDURE get_gold_medalists_proc() LANGUAGE plpgsql -- Specifies that the procedure is written in PL/pgSQL (PostgreSQL's procedural language)
    AS $$ BEGIN -- Print a message to the console/log indicating the start of the query
    RAISE NOTICE 'Athletes who won a Gold medal:';
-- Perform the query to retrieve all athletes who have won a Gold medal
-- PERFORM is used to execute a query but not return the result, just to execute it
PERFORM *
FROM Olimpics_table
WHERE Medal = 'Gold';
-- Filtering the table to only include rows where the medal is 'Gold'
END;
$$;
-- Calling the procedure to execute it and print out the results (notice message in this case)
CALL get_gold_medalists_proc();
-- Creating or replacing a function to return a table of athletes who won a Gold medal
CREATE OR REPLACE FUNCTION get_gold_medalists() RETURNS TABLE (Name VARCHAR, Year INT, Medal VARCHAR) -- Function returns a table with three columns
    LANGUAGE plpgsql -- Specifies that the function is written in PL/pgSQL
    AS $$ BEGIN -- Query that will be executed when the function is called. It selects athletes who won Gold medals.
    RETURN QUERY
SELECT Olimpics_table.Name,
    Olimpics_table.Year,
    Olimpics_table.Medal -- Select columns Name, Year, and Medal
FROM Olimpics_table -- From the Olimpics_table
WHERE Olimpics_table.Medal = 'Gold';
-- Only include rows where Medal is 'Gold'
END;
$$;
-- Dropping any existing procedure with the same name (if exists) before creating the new one
DROP PROCEDURE IF EXISTS get_gold_medalists_proc();
-- Dropping any existing function with the same name (if exists) before creating the new one
DROP FUNCTION IF EXISTS get_gold_medalists();
-- Calling the function to return the list of athletes who have won a Gold medal
SELECT *
FROM get_gold_medalists();
-- Fetch the data returned by the function
-- Write a stored procedure that accepts a year as an argument and returns the list of athletes who participated in that year.
-- Create or replace the stored procedure to get athletes by year
CREATE OR REPLACE PROCEDURE get_athletes_by_year(p_year INT) LANGUAGE plpgsql -- Using PL/pgSQL language for the procedure
    AS $$ BEGIN -- Print a notice that the query for a specific year is being executed
    RAISE NOTICE 'Fetching athletes who participated in the year: %',
    p_year;
-- Select the list of athletes who participated in the given year (using the parameter p_year)
-- The PERFORM statement is used to execute the query without returning the result directly
PERFORM Name,
sport,
Year,
Medal
FROM Olimpics_table
WHERE Year = p_year;
-- Filter the athletes by the year provided as input
END;
$$;
-- Call the procedure and pass a specific year (e.g., 2020) to get the athletes who participated in that year
CALL get_athletes_by_year(2008);
-- Drop existing function or procedure if it exists
DROP PROCEDURE IF EXISTS get_athletes_by_year;
DROP FUNCTION IF EXISTS get_athletes_by_year;
-- Write a stored function that calculates the average number of medals won by athletes in a specific sport and returns the value.
-- Task 34
-- Write a query to create an index on the Sport column to optimize queries that filter by sport.
CREATE OR REPLACE FUNCTION avg_medals_by_sport(p_sport VARCHAR) RETURNS NUMERIC AS $$
DECLARE avg_medals NUMERIC;
BEGIN -- Calculate the average number of medals for the given sport
SELECT AVG(medal_count) INTO avg_medals
FROM (
        -- Count the number of medals per athlete for the specific sport
        SELECT Name,
            COUNT(Medal) AS medal_count
        FROM Olimpics_table
        WHERE sport = p_sport
        GROUP BY Name
    ) AS medal_counts;
-- Return the average number of medals
RETURN avg_medals;
END;
$$ LANGUAGE plpgsql;
SELECT avg_medals_by_sport('Basketball');
-- Write a query to add an index on the Medal column to speed up filtering for athletes who have won a medal.
CREATE INDEX idx_medal ON Olimpics_table (Medal);
SELECT *
FROM Olimpics_table
WHERE Medal = 'Gold';