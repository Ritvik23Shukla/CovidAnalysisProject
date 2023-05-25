-- Countries with highest infection rate

use covid;

SELECT location, population, MAX(total_cases) as Highest_Count, MAX((total_cases/population)*100) as Highest_infection_percentage
FROM deaths
GROUP BY location, population
ORDER BY Highest_infection_percentage DESC

-- view for above

CREATE VIEW HighestInfectionPercentage as 
SELECT location, population, MAX(total_cases) as Highest_Count, MAX((total_cases/population)*100) as Highest_infection_percentage
FROM deaths
GROUP BY location, population
ORDER BY Highest_infection_percentage DESC
