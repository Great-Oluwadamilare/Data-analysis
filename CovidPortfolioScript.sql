-- Data to work with

SELECT location, date, population, total_cases, new_cases, total_deaths 
FROM PortfolioProject..coviddeaths
ORDER BY 1,2

---Looking at Total Cases Vs Total Death

SELECT location, date, total_cases, total_deaths, 
(total_deaths/total_cases)*100 AS DeathPercentage FROM PortfolioProject..coviddeaths
WHERE location LIKE '%Nigeria'
ORDER BY 1,2

--Looking at Total Cases VS Population
--Shows the percentage of population that was affected with covid
SELECT location, date,population, total_cases,
(total_cases/population)*100 AS InfectedPopulation FROM PortfolioProject..coviddeaths
WHERE location LIKE '%china%'
ORDER BY 1,2

--Looking at countries with the highest infection rate compared to population
SELECT location,population, MAX(total_cases) HighestInfectionCountry,
MAX((total_cases/population))*100 AS HighestInfectedCountry FROM PortfolioProject..coviddeaths
--WHERE location LIKE '%Nigeria%'
GROUP BY location, population
ORDER BY HighestInfectedCountry DESC

-- Looking at countries with the highest death rate compared to population
SELECT location,population, MAX(CAST(total_deaths AS INT)) HighestDeathRateCountry
 FROM PortfolioProject..coviddeaths
 WHERE continent is not null
--WHERE location LIKE '%Nigeria%'
GROUP BY location, population
ORDER BY HighestDeathRateCountry DESC


-- Looking at continent with the highest death rate compared to population
SELECT continent, MAX(CAST(total_deaths AS INT)) HighestDeathRateContinent
 FROM PortfolioProject..coviddeaths
 WHERE continent is not null
--WHERE location LIKE '%Nigeria%'
GROUP BY continent
ORDER BY HighestDeathRateContinent DESC


--Global Numbers 

SELECT  SUM(new_cases) Total_Cases, SUM(CAST(new_deaths as INT)) Total_Deaths, SUM(CAST(new_deaths as INT))/SUM(new_cases)*100 GlobalDeathPercent
 FROM PortfolioProject..coviddeaths
 WHERE continent is not null
--WHERE location LIKE '%Nigeria%'
--GROUP BY date
ORDER BY 1,2 DESC


--Looking at total population vs total vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS INT)) OVER (Partition by dea.location Order by dea.location,
dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..Covidvaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3 DESC
