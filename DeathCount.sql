-- Highest Death Count

USE covid;

SELECT location, MAX(total_deaths) as Death_count
FROM deaths
WHERE continent is not null
GROUP BY location
ORDER BY Death_count DESC

-- Death Count by continent 

SELECT continent, MAX(total_deaths) as Death_count
FROM deaths
WHERE continent is not null
GROUP BY continent
ORDER BY Death_count DESC

-- View for death count

Create view DeathCount as 
SELECT continent, MAX(total_deaths) as Death_count
FROM deaths
WHERE continent is not null
GROUP BY continent
ORDER BY Death_count DESC