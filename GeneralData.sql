USE covid;

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM deaths
ORDER BY 1

-- Total Cases V/S Total Deaths

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
FROM deaths
WHERE Location = 'India'
ORDER BY 1

-- Total Cases V/S Total Population (Taking population constant since covid started)

SELECT Location, date, total_cases, population, (total_cases/population)* 100 as Case_Percentage
FROM deaths
WHERE Location = 'India'
ORDER BY 1