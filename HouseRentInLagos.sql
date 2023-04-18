--Looking at the data to work with

SELECT * FROM PortfolioProject..rent_lagos

--Checking the sel-contain house Area in Lagos
SELECT price, property_name,neighboorhood,count(neighboorhood) OVER (Partition by neighboorhood) 
MostAffordableSelfConatinBetween70000AND150000
FROM PortfolioProject..rent_lagos
WHERE price BETWEEN '70000' AND '150000' AND  property_name LIKE '%SELF%'
ORDER BY MostAffordableSelfConatinBetween70000AND150000

--Checking the property (self containes)types in Lagos
SELECT  Distinct(neighboorhood), Count(neighboorhood) OVER 
(partition by neighboorhood) TopAreasWithSelfCon
FROM PortfolioProject..rent_lagos
WHERE property_name LIKE '%self%'
ORDER BY TopAreasWithSelfCon

--Checking the property (Duplex)types in Lagos
SELECT  property_name,neighboorhood
FROM PortfolioProject..rent_lagos
WHERE property_name LIKE '%duplex%'

--Checking the property (Flat)types in Lagos
SELECT  property_name,COUNT(neighboorhood) 
FROM PortfolioProject..rent_lagos
WHERE property_name LIKE '%flat%' AND neighboorhood = 'Yaba'
GROUP BY property_name

--Checking the most expensive house rent Area in Lagos BETWEEN'50000000' AND '200000000'
SELECT price, property_name,neighboorhood,count(neighboorhood) OVER (Partition by neighboorhood) 
MostExpensiveHouseRentWithin50000000And200000000
FROM PortfolioProject..rent_lagos
WHERE price BETWEEN'50000000' AND '200000000'
ORDER BY MostExpensiveHouseRentWithin50000000And200000000

-----Checking the expensive DuplexHouseRentBetween1000000And5000000
SELECT price, property_name,neighboorhood,count(neighboorhood) OVER (Partition by neighboorhood) 
DuplexHouseRentBetween1000000And5000000
FROM PortfolioProject..rent_lagos
WHERE price BETWEEN'1000000' AND '5000000' AND property_name LIKE '%Duplex%'  
ORDER BY DuplexHouseRentBetween1000000And5000000

-----Checking the expensive FlatHouseRentBetween1000000And5000000
SELECT price, property_name,neighboorhood,count(neighboorhood) OVER (Partition by neighboorhood) 
FlatHouseRentBetween1000000And5000000
FROM PortfolioProject..rent_lagos
WHERE price BETWEEN'1000000' AND '5000000' AND property_name LIKE '%Flat%'  
ORDER BY FlatHouseRentBetween1000000And5000000

