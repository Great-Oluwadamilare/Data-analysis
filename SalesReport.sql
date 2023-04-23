--Checking the data to work with

SELECT * FROM Orders

---Breaking Sales Record per year
--Looking Into Product Name sold more in the year 2014
SELECT OrderID, NewOrderDate, ProductName, Count(ProductName) OVER (PARTITION BY ProductName) TotalProductSold2014 
FROM orders
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
--GROUP BY OrderID, NewOrderDate, ProductName

--Looking Into Product Name sold more in the year 2015
SELECT OrderID, NewOrderDate, ProductName, Count(ProductName) OVER (PARTITION BY ProductName) TotalProductSold2015 
FROM orders
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
--GROUP BY OrderID, NewOrderDate, ProductName

--Looking Into Product Name sold more in the year 2016
SELECT OrderID, NewOrderDate, ProductName, Count(ProductName) OVER (PARTITION BY ProductName) TotalProductSold2016 
FROM orders
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
--GROUP BY OrderID, NewOrderDate, ProductName

--Looking Into Product Name sold more in the year 2017
SELECT OrderID, NewOrderDate, ProductName, Count(ProductName) OVER (PARTITION BY ProductName) TotalProductSold2017 
FROM orders
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
--GROUP BY OrderID, NewOrderDate, ProductName

----Showing the return products for the year 

--carry out joining to identify the products returned 
SELECT Orders.OrderID, ProductName, Sales, Quantity 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
ORDER BY Quantity DESC

---Spliting the total products returned into year

--2014
SELECT Orders.OrderID, ProductName, Sales, Quantity 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'

--2015

SELECT Orders.OrderID, ProductName, Sales, Quantity 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'


--2016

SELECT Orders.OrderID, ProductName, Sales, Quantity 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'

--2017

SELECT Orders.OrderID, ProductName, Sales, Quantity 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'

---Showing return product by Region for each year

--2014
SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToWest2014 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
AND Region = 'West'
ORDER BY TotalReturnedToWest2014 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToEast2014 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
AND Region = 'East'
ORDER BY TotalReturnedToEast2014 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToCentral2014 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
AND Region = 'Central'
ORDER BY TotalReturnedToCentral2014 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToSouth2014  
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
AND Region = 'South'
ORDER BY TotalReturnedToSouth2014 DESC

--2015
SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToWest2015  
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
AND Region = 'West'
ORDER BY TotalReturnedToWest2015 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToEast2015 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
AND Region = 'East'
ORDER BY TotalReturnedToEast2015 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToCentral2015  
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
AND Region = 'Central'
ORDER BY TotalReturnedToCentral2015 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToSouth2015 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
AND Region = 'South'
ORDER BY TotalReturnedToSouth2015 DESC 


--2016
SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToWest2016  
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
AND Region = 'West'
ORDER BY TotalReturnedToWest2016 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToEast2016  
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
AND Region = 'East'
ORDER BY TotalReturnedToEast2016 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedToCentral2016 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
AND Region = 'Central'
ORDER BY TotalReturnedToCentral2016 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedtoSouth2016
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
AND Region = 'South'
ORDER BY TotalReturnedtoSouth2016 DESC


--2017
SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedtoWest2017 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
AND Region = 'West'
ORDER BY TotalReturnedtoWest2017 DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedtoEast2017 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
AND Region = 'East'
ORDER BY TotalReturnedtoEast2017  DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedtoCentral2017 
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
AND Region = 'Central'
ORDER BY TotalReturnedtoCentral2017  DESC

SELECT Orders.OrderID, ProductName, Sales, Quantity, Region, (Sales*Quantity) TotalReturnedtoSouth2017
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
AND Region = 'South'
ORDER BY TotalReturnedtoSouth2017 DESC 


----Calcualting total product sales by year 
--2014
SELECT OrderId, ProductName, Sales, Quantity 
FROM Orders
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'

----Checking the value of the items returned in the year 2014
ALTER TABLE Orders
ADD ValueOfReturns2014 INT

UPDATE Orders
SET ValueOfReturns2014 = Sales
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'


SELECT Returns.OrderID,Sales, ValueOfReturns2014
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.orderid
WHERE ValueOfReturns2014 IS NOT NULL


----Checking the value of the items returned in the year 2015
ALTER TABLE Orders
ADD ValueOfReturns2015 INT

UPDATE Orders
SET ValueOfReturns2015 = Sales
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'


SELECT Returns.OrderID,Sales, ValueOfReturns2015
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.orderid
WHERE ValueOfReturns2015 IS NOT NULL

----Checking the value of the items returned in the year 2016
ALTER TABLE Orders
ADD ValueOfReturns2016 INT

UPDATE Orders
SET ValueOfReturns2016 = Sales
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'


SELECT Returns.OrderID,Sales, ValueOfReturns2016
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.orderid
WHERE ValueOfReturns2016 IS NOT NULL


----Checking the value of the items returned in the year 2017
ALTER TABLE Orders
ADD ValueOfReturns2017 INT

UPDATE Orders
SET ValueOfReturns2017 = Sales
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.OrderID
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'


SELECT Returns.OrderID,Sales, ValueOfReturns2017
FROM Orders
JOIN Returns
ON Orders.OrderID = Returns.orderid
WHERE ValueOfReturns2017 IS NOT NULL

--Total Values of Products returns to the company
SELECT ValueOfReturns2014, ValueOfReturns2015, ValueOfReturns2016, ValueOfReturns2017
FROM Orders


--Checking	Sales Performance by States
--State Total Says by year
--2014
SELECT State, SUM(Sales) StatesTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY State
ORDER BY StatesTotalSales DESC

--2015
SELECT State, SUM(Sales) StatesTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY State
ORDER BY StatesTotalSales DESC

--2016
SELECT State, SUM(Sales) StatesTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY State
ORDER BY StatesTotalSales DESC

--2017
SELECT State, SUM(Sales) StatesTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY State
ORDER BY StatesTotalSales DESC

--Checking Sales by region 

--2014
SELECT Region, SUM(Sales) RegionsTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY Region
ORDER BY RegionsTotalSales DESC

--2015
SELECT Region, SUM(Sales) RegionsTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY Region
ORDER BY RegionsTotalSales DESC

--2016
SELECT Region, SUM(Sales) RegionsTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY Region
ORDER BY RegionsTotalSales DESC

--2017
SELECT Region, SUM(Sales) RegionsTotalSales  
FROM Orders
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY Region
ORDER BY RegionsTotalSales DESC


--Checking the TotalProfit by year and region 
--2014
SELECT Region, ROUND(SUM(Profit),2) TotalProfitPerRegion  
FROM Orders
WHERE NewOrderDate BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY Region
ORDER BY TotalProfitPerRegion DESC

--2015
SELECT Region, ROUND(SUM(Profit),2) TotalProfitPerRegion  
FROM Orders
WHERE NewOrderDate BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY Region
ORDER BY TotalProfitPerRegion DESC

--2016
SELECT Region, ROUND(SUM(Profit),2) TotalProfitPerRegion  
FROM Orders
WHERE NewOrderDate BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY Region
ORDER BY TotalProfitPerRegion DESC

--2017
SELECT Region, ROUND(SUM(Profit),2) TotalProfitPerRegion  
FROM Orders
WHERE NewOrderDate BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY Region
ORDER BY TotalProfitPerRegion DESC

