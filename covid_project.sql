-- 1) Extracting the global infection and death rates
-- Since I deleted the total cases column i have to use a CTE, as well as OVER statements to create running totals
-- The percentages update automatically since I used the CTEs/subqueries before the grouping done by the OVER statement
WITH totals_cont AS (
	SELECT population, date, new_cases, SUM(new_cases) OVER(PARTITION BY location ORDER BY date) as running_total_cases_cont, new_deaths, SUM(new_deaths) OVER(ORDER BY date) as running_total_deaths_cont
	  FROM covid_stats
      WHERE location = "World")
SELECT population, date, new_cases, running_total_cases_cont, ROUND((running_total_cases_cont/population)*100,3) AS running_infection_percentage, new_deaths,  running_total_deaths_cont, ROUND((running_total_deaths_cont/population)*100,3) AS running_death_percentage_count
FROM totals_cont;


-- 2) Determining how big a factor population density is in the spread of the virus (used a subquery)
SELECT location, population, date, population_density, new_cases, total_cases, ROUND((total_cases/population)*100,3) as infected_percentage
FROM (SELECT continent, location, population, date, population_density, new_cases, SUM(new_cases) OVER (PARTITION BY location ORDER BY date ASC) as total_cases
      FROM covid_stats
      WHERE continent IS NOT NULL -- this is to ensure that we only get the stats of the respesctive countries, not the continents
      ) as s1;

-- 3) Comparing number of deaths in infection cases to the Human Development Index of the respective country, as it's a broad measure to get a gauge on a country's healthcare quality
WITH total_deaths_tt AS (SELECT continent, location, population, date, human_development_index, new_cases, SUM(new_cases) OVER (PARTITION BY location ORDER BY date ASC) as total_cases, new_deaths, SUM(new_deaths) OVER (PARTITION BY location ORDER BY date ASC) as total_deaths -- This CTE is used to create a running total_deaths calculated column
	  FROM covid_stats
      WHERE continent is NOT NULL
)
SELECT location, population, date, human_development_index, new_cases, total_cases, new_deaths, total_deaths, ROUND((total_deaths/total_cases)*100,3) as infected_death_percentage     
from total_deaths_tt;

-- 4) Total cases and deaths, and percentages for each country for map and drill-down purposes
WITH totals AS (
	SELECT continent, location, population, date, new_cases, SUM(new_cases) OVER(PARTITION BY location) as total_cases, SUM(new_cases) OVER(PARTITION BY location ORDER BY date ASC) as running_total_cases, new_deaths, SUM(new_deaths) OVER(PARTITION BY location) as total_deaths, SUM(new_deaths) OVER(PARTITION BY location ORDER BY date ASC) as running_total_deaths
	  FROM covid_stats
      WHERE continent is NOT NULL -- this makes the query only select countries
      )
SELECT continent, location, population, date, new_cases, running_total_cases, total_cases, ROUND((running_total_cases/population)*100,3) AS running_infection_percentage, total_deaths, new_deaths, running_total_deaths, ROUND((total_deaths/population)*100,3) AS running_death_percentage
FROM totals;

-- 5) Total cases and deaths, and percentages for each continent (and the World total)
WITH totals_cont AS (
	SELECT continent, location, population, new_cases, SUM(new_cases) as total_cases_cont, new_deaths, SUM(new_deaths) as total_deaths_cont
	  FROM covid_stats
      WHERE continent is NULL -- this makes the query only select continents
      GROUP BY location
					)
SELECT location, population, new_cases, total_cases_cont, ROUND((total_cases_cont/population)*100,3) AS infection_percentage, new_deaths, total_deaths_cont, ROUND((total_deaths_cont/population)*100,3) AS death_percentage_cont
FROM totals_cont;
