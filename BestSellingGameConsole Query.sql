--Looking into the table to work with "BestSellingGameConsole" 

SELECT * FROM BestSellingGameConsole

--Showing the game console released in 60's AND 90

SELECT consolename, type, company, released_year
FROM BestSellingGameConsole
WHERE released_year BETWEEN '1960' AND '1990'

--Showing the game console released in 91 AND 23

SELECT consolename, type, company, released_year
FROM BestSellingGameConsole
WHERE released_year BETWEEN '1991' AND '2023'

--Identify least selling console between 1960 vs 1990
SELECT consolename, type, company, released_year, UNITS_SOLD
FROM BestSellingGameConsole
WHERE released_year BETWEEN '1960' AND '1990'
ORDER BY units_sold desc 

--Identifying list console discountinue and year

SELECT consolename, type, company, discontinuation_year, UNITS_SOLD
FROM BestSellingGameConsole
WHERE released_year BETWEEN '1960' AND '1990'
ORDER BY units_sold desc 

-- Count the number of console discountinued by type from 1975 to 2020
SELECT consolename, type, company, discontinuation_year, 
COUNT(discontinuation_year)AS TotalDiscontinuedConsole, UNITS_SOLD
FROM BestSellingGameConsole
WHERE discontinuation_year BETWEEN '1970' AND '2023'
AND type = 'Home'
GROUP BY consolename, type, company, discontinuation_year, UNITS_SOLD

--Best performing console company 

SELECT DISTINCT(company), SUM(units_sold) AS TotalUnitSold 
FROM PortfolioProject..BestSellingGameConsole
GROUP BY company
ORDER BY SUM(units_sold)

--BEST SOLD CONSOLENAME 
SELECT consolename AS BestPerformingConsole, SUM(units_sold) AS TotalUnitSold 
FROM PortfolioProject..BestSellingGameConsole
GROUP BY consolename
ORDER BY SUM(units_sold) DESC

