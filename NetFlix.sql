--CHECKING THE DATE TO WORK WITH

SELECT * FROM PortfolioProject..netflix_titles


--Data Cleaning 

SELECT CONVERT(DATE, date_added)
FROM PortfolioProject..netflix_titles

ALTER TABLE PortfolioProject..netflix_titles
ADD Added_date DATE

UPDATE PortfolioProject..netflix_titles
SET Added_date = CONVERT(DATE, date_added)

ALTER TABLE PortfolioProject..netflix_titles
DROP COLUMN  date_added

--Joining tables
----Showing the movie ratings

SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-Y'
ORDER BY country

SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-G'
ORDER BY country

SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'NC-17'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-MA'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'NR'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'PG'
ORDER BY country

SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-Y7-FV'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-Y7'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-14'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'PG-13'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'G'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'UR'
ORDER BY country

SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'R'
ORDER BY country


SELECT netflix_titles.show_id,type, title, rating, country FROM netflix_titles
Join netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE rating = 'TV-PG'
ORDER BY country

--Checting the top director on netflix 

SELECT netflix_titles.show_id, title, COUNT(director) 
OVER (Partition by director) TOPDirectors
FROM netflix_titles
JOIN netflix_titles_directors
ON netflix_titles.show_id = netflix_titles_directors.show_id
ORDER BY TOPDirectors DESC



--Top 10 Movie Categories on Netflix 

SELECT DISTINCT TOP 10 listed_in, COUNT(listed_in) OVER (PARTITION BY listed_in) AS TopCategoriesMovie
FROM netflix_titles_category
ORDER BY TopCategoriesMovie DESC;

--Top Africa Countries Listed On Netflix Between 2015 - 2019

SELECT netflix_titles.show_id, country, COUNT(country) OVER (PARTITION BY country) 
TopAfricaCountriesMovieOnNetflix, added_date 
FROM netflix_titles
JOIN netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE country IN ('Zimbabwe',
'Uganda',
'Sudan',
'South Africa',
'Somalia',
'Senegal',
'Nigeria',
'Namibia',
'Morocco',
'Mauritius',
'Malawi',
'Kenya',
'Ghana',
'Botswana')
ORDER BY TopAfricaCountriesMovieOnNetflix DESC

--Top 15 Nigeria Movies on Netflix Between 2015 - 2019
SELECT TOP 15 netflix_titles.show_id, title 
TopNigeriaMovieOnNetflix, added_date 
FROM netflix_titles
JOIN netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE country IN ('Nigeria')
ORDER BY added_date 

--Top 15 South Africa Movies on Netflix Between 2015 - 2018
SELECT TOP 15 netflix_titles.show_id, title 
TopSouthAfricaMovieOnNetflix, added_date 
FROM netflix_titles
JOIN netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE country IN ('South Africa')
ORDER BY added_date



--Top Morocco Movies on Netflix Between 2015 - 2018
SELECT TOP 10 netflix_titles.show_id, title 
TopMoroccoMovieOnNetflix, added_date 
FROM netflix_titles
JOIN netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE country IN ('Morocco')
ORDER BY added_date


--Top Ghana Movies on Netflix Between 2015 - 2018
SELECT TOP 10 netflix_titles.show_id, title 
TopGhanaMovieOnNetflix, added_date 
FROM netflix_titles
JOIN netflix_titles_countries
ON netflix_titles.show_id = netflix_titles_countries.show_id
WHERE country IN ('Ghana')
ORDER BY added_date



