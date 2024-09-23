--4.1 
/* no because it violates the foreign key contraint and 1 and M relationship */

--4.2
/* no because "income" violates the foreign key contraint and '80' is invalid */

--4.3 
/* ChatGPT responses are pretty good, but not perfect. */
CREATE TABLE name_table (
    id SERIAL PRIMARY KEY,
    fips_code VARCHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    UNIQUE (fips_code)

  CREATE TABLE income_table (
    id SERIAL PRIMARY KEY,
    fips_code VARCHAR(10) NOT NULL,
    income DECIMAL(15, 2) NOT NULL,
    year INT NOT NULL,
    FOREIGN KEY (fips_code) REFERENCES name_table(fips_code) ON DELETE CASCADE
);

--4.4 
/* Uploaded pictures */

--4.5 
/* uploaded the diagram perfectly */

--4.6 
/* it worked!*/
SELECT name.name, income.income, income.year 
FROM income 
JOIN name ON income.fips = name.fips
WHERE income.year = (
  SELECT MAX(year) FROM income 
)
ORDER BY income.income DESC
LIMIT 1;

--4.7 
SELECT population 
FROM population 
WHERE fips = '51'
AND year = (SELECT MAX(year) - 5 FROM population)


  
  SELECT 
    ((MAX(pop) - MIN(pop)) / MIN(pop)) * 100 AS growth_rate,
    MAX(year) AS recent_year,
    MIN(year) AS five_years_ago
FROM 
    population
WHERE 
    fips = '51'
AND 
    year >= (SELECT MAX(year) FROM population WHERE fips = '51') - 5;






SELECT 
    recent_data.year AS recent_year,
    recent_data.pop AS recent_population,
    old_data.year AS five_years_ago,
    old_data.pop AS population_five_years_ago,
    ((recent_data.pop - old_data.pop) / old_data.pop) * 100 AS growth_rate
FROM 
    (SELECT 
        pop, 
        year
     FROM 
        population
     WHERE 
        fips = '51'
     ORDER BY 
        year DESC
     LIMIT 1) AS recent_data
JOIN 
    (SELECT 
        pop, 
        year
     FROM 
        population
     WHERE 
        fips = '51'
     ORDER BY 
        year DESC
     OFFSET 5 
     LIMIT 1) AS old_data
ON 1 = 1;

/* prompt needs to be adjusted */
/* I did prompt it to specify the data to ensure it would run in PGAdmin and flow. I did modify some of it and regenerate a few different times to ensure that I had to correct information.

--4.8 
/* No, ChatGPT does not always produce accurate responses. It does come back with correct SQL language but is not always the most efficient or helpful for the specific question you 
are looking for. 





