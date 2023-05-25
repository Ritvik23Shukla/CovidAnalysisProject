USE covid;
-- Cases for each day

SELECT date, SUM(new_cases) as Cases_perday, SUM(new_deaths) as Deaths_each_day, SUM(new_deaths)/SUM(new_cases)*100 as Death_Percentage
FROM deaths
WHERE continent is not null
GROUP BY date
ORDER BY Deaths_each_day DESC

-- View for the above

Create view DeathPercentage as
SELECT date, SUM(new_cases) as Cases_perday, SUM(new_deaths) as Deaths_each_day, SUM(new_deaths)/SUM(new_cases)*100 as Death_Percentage
FROM deaths
WHERE continent is not null
GROUP BY date
ORDER BY Deaths_each_day DESC

-- Total Population vs Vaccination 

SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
		SUM(v.new_vaccinations) OVER (Partition By d.location order by d.location, d.date) as PeopleVaccinated
FROM deaths d
JOIN vaccines v
	on d.location = v.location 
    and d.date = v.date
WHERE d.continent is not null
-- GROUP BY d.location
ORDER BY 2


