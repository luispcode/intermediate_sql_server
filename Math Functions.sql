--Calculating the total

-- Write a query that returns an aggregation 
SELECT MixDesc, SUM(Quantity) AS Total
FROM Shipments
-- Group by the relevant column
GROUP BY MixDesc;


-- Counting the number of rows

-- Count the number of rows by MixDesc
SELECT MixDesc, COUNT(MixDesc)
FROM Shipments
GROUP BY MixDesc


--Counting the number of days between dates

-- Return the difference in OrderDate and ShipDate
SELECT OrderDate, ShipDate, 
       DATEDIFF(DD, OrderDate, ShipDate) AS Duration
FROM Shipments

-- Adding days to a date

-- Return the DeliveryDate as 5 days after the ShipDate
SELECT OrderDate, 
       DATEADD(DD,5,ShipDate) AS DeliveryDate
FROM Shipments


-- Rounding numbers

-- Round Cost to the nearest dollar
SELECT Cost, 
       ROUND(Cost,0) AS RoundedCost
FROM Shipments

--Truncating numbers
-- Truncate cost to whole number
SELECT Cost, 
       ROUND(Cost,0,1) AS TruncateCost
FROM Shipments


--Calculating the absolute value

-- Return the absolute value of DeliveryWeight
SELECT DeliveryWeight,
       ABS(DeliveryWeight) AS AbsoluteValue
FROM Shipments


--Calculating squares and square roots

-- Return the square and square root of WeightValue
SELECT WeightValue, 
       SQUARE(WeightValue) AS WeightSquare, 
       SQRT(WeightValue) AS WeightSqrt
FROM Shipments