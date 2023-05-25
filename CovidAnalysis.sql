USE covid;

-- With CTE
WITH PopVSVac (continent, location, date, population, new_vaccinations, PeopleVaccinated)
as
(
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
		SUM(v.new_vaccinations) OVER (Partition By d.location order by d.location, d.date) as PeopleVaccinated
FROM deaths d
JOIN vaccines v
	on d.location = v.location 
    and d.date = v.date
WHERE d.continent is not null
-- GROUP BY d.location
-- ORDER BY 2
)
SELECT *, (PeopleVaccinated/Population)*100 as PercentageVaccinated
FROM PopVSVac

-- Createing a temporary table for above data

CREATE TABLE Vaccinated_Population
(Continent VARCHAR(255),
Location VARCHAR(255),
Date DATETIME,
Population INT,
New_Vaccinations INT,
PeopleVaccinated INT)

INSERT INTO Vaccinated_Population

SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
		SUM(v.new_vaccinations) OVER (Partition By d.location order by d.location, d.date) as PeopleVaccinated
FROM deaths d
JOIN vaccines v
	on d.location = v.location 
    and d.date = v.date
WHERE d.continent is not null
-- GROUP BY d.location
-- ORDER BY 2

SELECT *, (PeopleVaccinated/Population)*100 as PercentageVaccinated
FROM Vaccinated_population

-- Creating View for the above

CREATE VIEW  VaccinatedPopulation
as
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
		SUM(v.new_vaccinations) OVER (Partition By d.location order by d.location, d.date) as PeopleVaccinated
FROM deaths d
JOIN vaccines v
	on d.location = v.location 
    and d.date = v.date
WHERE d.continent is not null



