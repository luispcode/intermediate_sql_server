-- Creating and using variables

-- Declare the variable (a SQL Command, the var name, the datatype)
DECLARE @counter INT 

-- Set the counter to 20
SET @counter = 20

-- Select and increment the counter by one 
SET @Counter = @Counter + 1

-- Print the variable
SELECT @counter


-- Creating a WHILE loop

DECLARE @counter INT 
SET @counter = 20

-- Create a loop
While @counter < 30

-- Loop code starting point
BEGIN
	SELECT @counter = @counter + 1
-- Loop finish
END

-- Check the value of the variable
SELECT @counter


--Queries with derived tables

SELECT a.RecordId, a.Age, a.BloodGlucoseRandom, 
-- Select maximum glucose value (use colname from derived table)    
       b.MaxGlucose
FROM Kidney a
-- Join to derived table
JOIN (SELECT Age, MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney GROUP BY Age) b
-- Join on Age
ON a.Age = b.Age


SELECT *
FROM Kidney as a
-- Create derived table: select age, max blood pressure from kidney grouped by age
JOIN (SELECT Age, Max(BloodPressure) AS MaxBloodPressure FROM kidney GROUP BY Age) as b
-- JOIN on BloodPressure equal to MaxBloodPressure
ON a.BloodPressure = b.MaxBloodPressure
-- Join on Age
AND  a.Age = b.Age


--Creating CTEs

-- Specify the keyowrds to create the CTE
WITH BloodGlucoseRandom (MaxGlucose) 
AS
 (SELECT MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney)

SELECT a.Age, b.MaxGlucose
FROM Kidney AS a
-- Join the CTE on blood glucose equal to max blood glucose
JOIN BloodGlucoseRandom AS b
ON a.BloodGlucoseRandom = b.MaxGlucose ;


-- Create the CTE
WITH  BloodPressure (MaxBloodPressure)
AS 
(SELECT MAX(BloodPressure) AS MaxBloodPressure
FROM Kidney )

SELECT *
FROM Kidney AS a
-- Join the CTE  
JOIN  BloodPressure AS b
ON a.BloodPressure = b.MaxBloodPressure ;


