# SQL-Fundamentals

This is a repository containing different levels of the SQL Fundamentals's solutions from DataCamp. 
It is surely very fun to practice them often and helpful to understand and write SQL queries from basic to intermediate and advanced levels.

I have splitted this repository into several folders as below:

## Introduction to SQL

### Dataset: IMDb Film 

- people: 

| idb | name | birthdate | deathdate |
|-|-|-|-|

- films: 

| id | title | release_year | country	duration | language | certification | gross | budget |
|-|-|-|-|-|-|-|-|

- reviews:

| id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
|-|-|-|-|-|-|-|

- roles: 

| id | film_id | person_id | role |
|-|-|-|-|

### 1/Selecting columns

#### Onboarding | Errors

```
SELECT 'DataCamp <3 SQL'
AS result;
```

#### Onboarding | Multi-step Exercises

```
SELECT 'SQL is cool'
AS result;
```

#### SELECTing single columns

```
-- 1/3 Select the title column from the films table.
SELECT title
FROM films;

-- 2/3 Select the release_year column from the films table.
SELECT release_year
FROM films;

-- 3/3 Select the name of each person in the people table.
SELECT name 
FROM people;
```

#### SELECTing multiple columns

```
-- 1/4 Get the title of every film from the films table.
SELECT * 
FROM films;

-- 2/4 Get the title and release year for every film.
SELECT title, release_year
FROM films;

-- 3/4 Get the title, release year and country for every film.
SELECT title, release_year, country
FROM films;

-- 4/4 Get all columns from the films table.
SELECT *
FROM films;
```

#### SELECT DISTINCT

```
-- 1/3 Get all the unique countries represented in the films table.
SELECT DISTINCT country
FROM films;

-- 2/3 Get all the different film certifications from the films table.
SELECT DISTINCT certification
FROM films;

-- 3/3 Get the different types of film roles from the roles table.
SELECT DISTINCT role 
FROM roles;
```

#### Practice with COUNT

```
-- 1/5 Count the number of rows in the people table.
SELECT COUNT(*)
FROM people;

-- 2/5 Count the number of (non-missing) birth dates in the people table.
SELECT COUNT(birthdate)
FROM people;

-- 3/5 Count the number of unique birth dates in the people table.
SELECT COUNT(DISTINCT birthdate)
FROM people;

-- 4/5 Count the number of unique languages in the films table.
SELECT COUNT(DISTINCT language)
FROM films;

-- 5/5 Count the number of unique countries in the films table.
SELECT COUNT(DISTINCT country)
FROM films;
```

### 2/ Filtering rows

#### Simple filtering of numeric values

```
-- 1/3 Get all details for all films released in 2016.
SELECT *
FROM films
WHERE release_year = 2016;

-- 2/3 Get the number of films released before 2000.
SELECT count(title) 
FROM films
WHERE release_year < 2000;

-- 3/3 Get the title and release year of films released after 2000.
SELECT title, release_year
FROM films
WHERE release_year > 2000;
```

#### Simple filtering of text

```
-- 1/4 Get all details for all French language films.
SELECT *
FROM films 
WHERE language = 'French'

-- 2/4 Get the name and birth date of the person born on November 11th, 1974. Remember to use ISO date format ('1974-11-11')!
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11';

-- 3/4 Get the number of Hindi language films.
SELECT count(title)
FROM films 
WHERE language = 'Hindi'

-- 4/4 Get all details for all films with an R certification.
SELECT *
FROM films
WHERE certification = 'R'
```

#### WHERE AND

```
-- 1/3 Get the title and release year for all Spanish language films released before 2000.
SELECT title, release_year 
FROM films
WHERE language = 'Spanish'
AND release_year < 2000

-- 2/3 Get all details for Spanish language films released after 2000.
SELECT *
FROM films
WHERE language = 'Spanish'
AND release_year > 2000;

-- 3/3 Get all details for Spanish language films released after 2000, but before 2010.
SELECT *
FROM films
WHERE release_year > 2000
AND release_year < 2010
AND language = 'Spanish';
```

#### WHERE AND OR (2)

```
-- 1/3 Get the title and release year for films released in the 90s.
SELECT title, release_year
FROM films
WHERE release_year >= 1990 AND release_year < 2000;

-- 2/3 Now, build on your query to filter the records to only include French or Spanish language films.
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
and (language = 'French' or language = 'Spanish');

-- 3/3 Finally, restrict the query to only return films that took in more than $2M gross.
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
and gross > 2000000;
```

#### BETWEEN (2)

```
-- 1/4 Get the title and release year of all films released between 1990 and 2000 (inclusive).
SELECT title, release_year
FROM films 
WHERE release_year BETWEEN 1990 AND 2000;

-- 2/4 Now, build on your previous query to select only films that have budgets over $100 million.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000;

-- 3/4 Now restrict the query to only return Spanish language films.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
and language = 'Spanish';

-- 4/4 Finally, modify to your previous query to include all Spanish language or French language films with the same criteria as before. Don't forget your parentheses!
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'Spanish' or language = 'French');
```

#### WHERE IN

```
-- 1/3 Get the title and release year of all films released in 1990 or 2000 that were longer than two hours. Remember, duration is in minutes!
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
AND duration > 120;

-- 2/3 Get the title and language of all films which were in English, Spanish, or French.
SELECT title, language
FROM films
WHERE language IN ('French', 'Spanish', 'English');

-- 3/3 Get the title and certification of all films with an NC-17 or R certification.
SELECT title, certification
FROM films
WHERE certification IN ('NC-17', 'R');
```

#### NULL and IS NULL

```
-- 1/3 Get the names of people who are still alive, i.e. whose death date is missing.
SELECT name
FROM people
WHERE deathdate IS NULL;

-- 2/3 Get the title of every film which doesn't have a budget associated with it.
SELECT title
FROM films
WHERE budget IS NULL;

-- 3/3 Get the number of films which don't have a language associated with them.
SELECT count(title)
FROM films
WHERE language IS NULL;
```

#### LIKE and NOT LIKE

```
-- 1/3 Get the names of all people whose names begin with 'B'. The pattern you need is 'B%'.
SELECT name
FROM people
WHERE name LIKE 'B%';

-- 2/3 Get the names of people whose names have 'r' as the second letter. The pattern you need is '_r%'.
SELECT name
FROM people 
WHERE name LIKE '_r%';

-- 3/3 Get the names of people whose names don't start with A. The pattern you need is 'A%'.
SELECT name
FROM people
WHERE name NOT LIKE 'A%'; 
```

### 3/ Aggregate Functions

#### Aggregate functions

```
-- 1/4 Use the SUM() function to get the total duration of all films.
SELECT SUM(duration)
FROM films;

-- 2/4 Get the average duration of all films.
SELECT AVG(duration)
FROM films;

-- 3/4 Get the duration of the shortest film.
SELECT MIN(duration)
FROM films; 

-- 4/4 Get the duration of the longest film.
SELECT MAX(duration)
FROM films;
```

#### Aggregate functions practice

```
-- 1/4 Use the SUM() function to get the total amount grossed by all films.
SELECT SUM(gross)
FROM films;

-- 2/4 Get the average amount grossed by all films.
SELECT AVG(gross)
FROM films;

-- 3/4 Get the amount grossed by the worst performing film.
SELECT MIN(gross)
FROM films;

-- 4/4 Get the amount grossed by the best performing film.
SELECT MAX(gross)
FROM films;
```

#### Combining aggregate functions with WHERE

```
-- 1/4 Use the SUM() function to get the total amount grossed by all films made in the year 2000 or later.
SELECT SUM(gross)
FROM films
WHERE release_year >= 2000;

-- 2/4 Get the average amount grossed by all films whose titles start with the letter 'A'.
SELECT AVG(gross)
FROM films
WHERE title LIKE 'A%';

-- 3/4 Get the amount grossed by the worst performing film in 1994.
SELECT MIN(gross)
FROM films
WHERE release_year = 1994;

-- 4/4 Get the amount grossed by the best performing film between 2000 and 2012, inclusive.
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012;
```

#### It's AS simple AS aliasing

```
-- 1/3 Get the title and net profit (the amount a film grossed, minus its budget) for all films. Alias the net profit as net_profit.
SELECT title, (gross - budget) AS net_profit
FROM films;

-- 2/3 Get the title and duration in hours for all films. The duration is in minutes, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as duration_hours.
SELECT title, (duration/60.) AS duration_hours
FROM films;

-- 3/3 Get the average duration in hours for all films, aliased as avg_duration_hours.
SELECT avg(duration)/60.0 AS avg_duration_hours
FROM films;
```

#### Even more aliasing

```
-- 1/6 Get the release year, budget and gross earnings for each film in the films table.
SELECT release_year, budget, gross
FROM films;

-- 2/6 Modify your query so that only records with a release_year after 1990 are included.
SELECT release_year, budget, gross
FROM films
WHERE release_year > 1990;

-- 3/6 Remove the budget and gross columns, and group your results by release year.
SELECT release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year;

-- 4/6 Modify your query to include the average budget and average gross earnings for the results you have so far. 
-- Alias the average budget as avg_budget; alias the average gross earnings as avg_gross.
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;

-- 5/6 Modify your query so that only years with an average budget of greater than $60 million are included.
-- Hint
-- SELECT ___, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
-- FROM ___
-- WHERE ___ > ___
-- GROUP BY ___
-- HAVING AVG(___) > 60000000;
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;

-- 6/6 Finally, modify your query to order the results from highest average gross earnings to lowest.
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC;
```

### 4/ Sorting and grouping

#### Sorting single columns

```
-- 1/3 Get the names of people from the people table, sorted alphabetically.
SELECT name
FROM people
ORDER BY name;

-- 2/3 Get the names of people, sorted by birth date.
SELECT name
FROM people
ORDER BY birthdate;

-- 3/3 Get the birth date and name for every person, in order of when they were born.
SELECT birthdate, name
FROM people
ORDER BY birthdate;
```

#### Sorting single columns (2)

```
-- 1/3 Get the title of films released in 2000 or 2012, in the order they were released.
SELECT title
FROM films
WHERE release_year IN (2000, 2012)
ORDER BY release_year;

-- 2/3 Get all details for all films except those released in 2015 and order them by duration.
SELECT *
FROM films
WHERE release_year != 2015
ORDER BY duration;

-- 3/3 Get the title and gross earnings for movies which begin with the letter 'M' and order the results alphabetically.
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;
```

#### Sorting single columns (DESC)

```
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
GROUP BY country 
HAVING COUNT(country) > 10
ORDER BY country
LIMIT 5;
```

#### Sorting multiple columns

```
-- 1/3 Get the IMDB score and film ID for every film from the reviews table, sorted from highest to lowest score.
SELECT imdb_score, 	film_id
FROM reviews
ORDER BY imdb_score DESC;

-- 2/3 Get the title for every film, in reverse order.
SELECT title
FROM films
ORDER BY title DESC;

-- 3/3 Get the title and duration for every film, in order of longest duration to shortest.
SELECT title, duration
FROM films
ORDER BY duration DESC;
```

#### GROUP BY practice

```
-- 1/4 Get the release year and count of films released in each year.
SELECT release_year, count(*)
FROM films
GROUP BY release_year;

-- 2/4 Get the release year and average duration of all films, grouped by release year.
SELECT release_year, AVG(duration)
FROM films
GROUP BY release_year;

-- 3/4 Get the release year and largest budget for all films, grouped by release year.
SELECT release_year, MAX(budget)
FROM films
GROUP BY release_year;

-- 4/4 Get the IMDB score and count of film reviews grouped by IMDB score in the reviews table.
SELECT imdb_score, count(*)
FROM reviews
GROUP BY imdb_score;
```

#### GROUP BY practice (2)

```
-- 1/5 Get the release year and lowest gross earnings per release year.
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year;

-- 2/5 Get the language and total gross amount films in each language made.
SELECT language, SUM(gross)
FROM films
GROUP BY language;

-- 3/5 Get the country and total budget spent making movies in each country.
SELECT country, SUM(budget)
FROM films
GROUP BY country;

-- 4/5 Get the release year, country, and highest budget spent making a film for each year, for each country. Sort your results by release year and country.
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;

-- 5/5 Get the country, release year, and lowest amount grossed per release year per country. Order your results by country and release year.
SELECT country, release_year, MIN(gross)
FROM films
GROUP BY release_year, country
ORDER BY country, release_year;
```

#### All together now

```
-- 1/2 Submit the code in the editor and inspect the results.
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';

-- 2/2 What is the IMDB score for the film To Kill a Mockingbird? 
-- 8.4
```

#### All together now (2)

```
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
GROUP BY country 
HAVING COUNT(country) > 10
ORDER BY country
LIMIT 5;
```

## Joining Data in SQL

### Dataset:

- countries_plus: 

| name |	continent |	code | surface_area | geosize_group |
|-|-|-|-|-|

- countries:  

| code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
|-|-|-|-|-|-|-|-|-|-|-|

- populations: 

| pop_id | country_code | year | fertility_rate | life_expectancy | size |
|-|-|-|-|-|-|

- languages: 

| lang_id | code | name | percent | official |
|-|-|-|-|-|

- economies: 

| econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
|-|-|-|-|-|-|-|-|-|-|-|

- cities: 

| name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
|-|-|-|-|-|

- currencies: 

| curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |
|-|-|-|-|-|-|

### 1/ Introduction to joins

#### Inner join

```
-- 1/3 Begin by selecting all columns from the cities table.
SELECT * 
FROM cities

-- 2/3 Inner join the cities table on the left to the countries table on the right, keeping all of the fields in both tables.
-- You should match the tables on the country_code field in cities and the code field in countries.
-- Do not alias your tables here or in the next step. Using cities and countries is fine for now.
SELECT * 
FROM cities
  -- Inner join to countries
  INNER JOIN countries
    -- Match on the country codes
    ON cities.country_code = countries.code;

-- 3/3 Modify the SELECT statement to keep only the name of the city, the name of the country, and the name of the region the country resides in.
-- Alias the name of the city AS city and the name of the country AS country.
-- Select name fields (with alias) and region 
SELECT cities.name as city, countries.name as country, countries.region
FROM cities
  INNER JOIN countries
    ON cities.country_code = countries.code;
```

#### Inner join (2)

```
-- Join the tables countries (left) and economies (right) aliasing countries AS c and economies AS e.
-- Specify the field to match the tables ON.
-- From this join, SELECT:
-- c.code, aliased as country_code.
-- name, year, and inflation_rate, not aliased.

-- Select fields with aliases
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
  -- Join to economies (alias e)
  INNER JOIN economies AS e
    -- Match on code
    ON c.code = e.code;
```

#### Inner join (3)

```
-- 1/3 Inner join countries (left) and populations (right) on the code and country_code fields respectively.
-- Alias countries AS c and populations AS p.
-- Select code, name, and region from countries and also select year and fertility_rate from populations (5 fields in total).

-- Select fields
SELECT c.code, c.name, c.region, p.year, p.fertility_rate
  -- From countries (alias as c)
  FROM countries AS c
  -- Join with populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code;

-- 2/3 Add an additional INNER JOIN with economies to your previous query by joining on code.
-- Include the unemployment_rate column that became available through joining with economies.
-- Note that year appears in both populations and economies, so you have to explicitly use e.year instead of year as you did before.

-- Select fields
SELECT c.code, name, region, fertility_rate, e.unemployment_rate, e.year
  -- From countries (alias as c)
  FROM countries AS c
  -- Join to populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code
  -- Join to economies (as e)
  INNER JOIN economies AS e
    -- Match on country code
    ON c.code = e.code;

-- 3/3 Scroll down the query result and take a look at the results for Albania from your previous query. Does something seem off to you?
-- The trouble with doing your last join on c.code = e.code and not also including year is that e.g. the 2010 value for fertility_rate is also paired with the 2015 value for unemployment_rate.
-- Fix your previous query: in your last ON clause, use AND to add an additional joining condition. In addition to joining on code in c and e, also join on year in e and p.

-- Select fields
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
  -- From countries (alias as c)
  FROM countries AS c
  -- Join to populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code
  -- Join to economies (as e)
  INNER JOIN economies AS e
    -- Match on country code and year
    ON c.code = e.code AND e.year = p.year;
```

#### Inner join with using

```
-- Inner join countries on the left and languages on the right with USING(code).
-- Select the fields corresponding to:
-- country name AS country,
-- continent name,
-- language name AS language, and

-- Select fields
SELECT c.name AS country, continent, l.name AS language, l.official
  -- From countries (alias as c)
  FROM countries AS c
  -- Join to languages (as l)
  INNER JOIN languages AS l
    -- Match using code
    USING(code);
```

#### Self-join

```
-- 1/3 Join populations with itself ON country_code.
-- Select the country_code from p1 and the size field from both p1 and p2. SQL won't allow same-named fields, so alias p1.size as size2010 and p2.size as size2015.

-- Select fields with aliases
SELECT p1.country_code, p1.size AS size2010, p2.size AS size2015
-- From populations (alias as p1)
FROM populations AS p1
  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- Match on country code
    ON p1.country_code = p2.country_code;

-- 2/3 Notice from the result that for each country_code you have four entries laying out all combinations of 2010 and 2015.
-- Extend the ON in your query to include only those records where the p1.year (2010) matches with p2.year - 5 (2015 - 5 = 2010). This will omit the three entries per country_code that you aren't interested in.

-- Select fields with aliases
SELECT p1.country_code,
       p1.size AS size2010,
       p2.size AS size2015
-- From populations (alias as p1)
FROM populations AS p1
  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- Match on country code
    ON p1.country_code = p2.country_code
        -- and year (with calculation)
        AND p1.year = p2.year - 5;

-- 3/3 As you just saw, you can also use SQL to calculate values like p2.year - 5 for you. 
-- With two fields like size2010 and size2015, you may want to determine the percentage increase from one field to the next:
-- With two numeric fields A and B, the percentage growth from A to B can be calculated as (B - A) / A * 100.0.
-- Add a new field to SELECT, aliased as growth_perc, that calculates the percentage population growth from 2010 to 2015 for each country, using p2.size and p1.size.

-- Select fields with aliases
SELECT p1.country_code,
       p1.size AS size2010, 
       p2.size AS size2015,
       -- Calculate growth_perc
       ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
-- From populations (alias as p1)
FROM populations AS p1
  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- Match on country code
    ON p1.country_code = p2.country_code
        -- and year (with calculation)
        AND p1.year = p2.year - 5;
```

#### Case when and then

```
-- Using the countries table, create a new field AS geosize_group that groups the countries into three groups:
-- If surface_area is greater than 2 million, geosize_group is 'large'.
-- If surface_area is greater than 350 thousand but not larger than 2 million, geosize_group is 'medium'.
-- Otherwise, geosize_group is 'small'.
SELECT name, continent, code, surface_area,
    -- First case
    CASE WHEN surface_area > 2000000 THEN 'large'
        -- Second case
        WHEN surface_area > 350000 THEN 'medium'
        -- Else clause + end
        ELSE 'small' END
        -- Alias name
        AS geosize_group
-- From table
FROM countries;
```

#### Inner challenge

```
-- 1/3 Using the populations table focused only for the year 2015, create a new field aliased as popsize_group to organize population size into
-- 'large' (> 50 million),
-- medium' (> 1 million), and
-- 'small' groups.
-- Select only the country code, population size, and this new popsize_group as fields.

SELECT country_code, size,
    -- First case
    CASE WHEN size > 50000000 THEN 'large'
        -- Second case
        WHEN size > 1000000 THEN 'medium'
        -- Else clause + end
        ELSE 'small' END
        -- Alias name (popsize_group)
        AS popsize_group
-- From table
FROM populations
-- Focus on 2015
WHERE year = 2015;

-- 2/3 Use INTO to save the result of the previous query as pop_plus. You can see an example of this in the countries_plus code in the assignment text. Make sure to include a ; at the end of your WHERE clause!
-- Then, include another query below your first query to display all the records in pop_plus using SELECT * FROM pop_plus; so that you generate results and this will display pop_plus in the query result.
SELECT country_code, size,
    CASE WHEN size > 50000000 THEN 'large'
        WHEN size > 1000000 THEN 'medium'
        ELSE 'small' END
        AS popsize_group
-- Into table
INTO pop_plus
FROM populations
WHERE year = 2015;

-- Select all columns of pop_plus
SELECT * from pop_plus;

-- 3/3 Keep the first query intact that creates pop_plus using INTO.
-- Write a query to join countries_plus AS c on the left with pop_plus AS p on the right matching on the country code fields.
-- Sort the data based on geosize_group, in ascending order so that large appears on top.
-- Select the name, continent, geosize_group, and popsize_group fields.
SELECT country_code, size,
  CASE WHEN size > 50000000
            THEN 'large'
       WHEN size > 1000000
            THEN 'medium'
       ELSE 'small' END
       AS popsize_group
INTO pop_plus       
FROM populations
WHERE year = 2015;

-- Select fields
SELECT name, continent, geosize_group, popsize_group
-- From countries_plus (alias as c)
FROM countries_plus AS c
  -- Join to pop_plus (alias as p)
  INNER JOIN pop_plus AS p
    -- Match on country code
    ON c.code = p.country_code
-- Order the table    
ORDER BY geosize_group ASC;
```

### 2/ Outer joins and cross joins

#### Left Join

```
-- 1/2 Fill in the code based on the instructions in the code comments to complete the inner join. Note how many records are in the result of the join in the query result.
-- Select the city name (with alias), the country code,
-- the country name (with alias), the region,
-- and the city proper population
SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
-- From left table (with alias)
FROM cities AS c1
  -- Join to right table (with alias)
  INNER JOIN countries AS c2
    -- Match on country code
    ON c1.country_code = c2.code
-- Order by descending country code
ORDER BY code DESC;

-- 2/2 Change the code to perform a LEFT JOIN instead of an INNER JOIN. After executing this query, note how many records the query result contains.
SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
FROM cities AS c1
  -- Join right table (with alias)
  LEFT JOIN countries AS c2
    -- Match on country code
    ON c1.country_code = c2.code
-- Order by descending country code
ORDER BY code DESC;
```

#### Left join (2)

```
-- 1/2 Perform an inner join and alias the name of the country field as country and the name of the language field as language.
-- Sort based on descending country name.
/*
Select country name AS country, the country's local name,
the language name AS language, and
the percent of the language spoken in the country
*/
select c.name AS country, local_name, l.name AS language, percent
-- From left table (alias as c)
FROM languages AS l
  -- Join to right table (alias as l)
  INNER JOIN countries AS c
    -- Match on fields
    ON l.code = c.code
-- Order by descending country
ORDER BY country DESC;

-- 2/2 Perform a left join instead of an inner join. Observe the result, and also note the change in the number of records in the result.
-- Carefully review which records appear in the left join result, but not in the inner join result.

/*
Select country name AS country, the country's local name,
the language name AS language, and
the percent of the language spoken in the country
*/
SELECT c.name AS country, local_name, l.name AS language, percent
-- From left table (alias as c)
FROM countries AS c
  -- Join to right table (alias as l)
  LEFT JOIN languages AS l
    -- Match on fields
    ON c.code = l.code
-- Order by descending country
ORDER BY country DESC;
```

#### Left join (3)

```
/* 1/3 Begin with a left join with the countries table on the left and the economies table on the right.
Focus only on records with 2010 as the year. */
-- Select name, region, and gdp_percapita
SELECT name, region, gdp_percapita
-- From countries (alias as c)
FROM countries AS c
  -- Left join with economies (alias as e)
  LEFT JOIN economies AS e
    -- Match on code fields
    ON c.code = e.code
-- Focus on 2010
WHERE e.year = 2010;

/* 2/3 Modify your code to calculate the average GDP per capita AS avg_gdp for each region in 2010.
Select the region and avg_gdp fields. */
-- Select fields
SELECT c.region, AVG(e.gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c
  -- Left join with economies (alias as e)
  LEFT JOIN economies AS e
    -- Match on code fields
    ON e.code = c.code
-- Focus on 2010
WHERE year = 2010
-- Group by region
GROUP BY region;

/* 3/3 Arrange this data on average GDP per capita for each region in 2010 from highest to lowest average GDP per capita. */
-- Select fields
SELECT region, AVG(gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c 
  -- Left join with economies (alias as e)
  LEFT JOIN economies AS e
    -- Match on code fields
    ON e.code = c.code
-- Focus on 2010
WHERE year = 2010
-- Group by region
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC;
```

#### Right join

```
SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM languages
  ___ JOIN countries
    ON ___.___ = ___.___
  ___ JOIN cities
    ON ___.___ = ___.___
ORDER BY city, language;

-- convert this code to use RIGHT JOINs instead of LEFT JOINs

SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM languages
  RIGHT JOIN countries
    ON countries.code = languages.code 
  RIGHT JOIN cities 
    ON countries.code = cities.country_code
ORDER BY city, language;

```

#### Full join

```
/* 1/3 Choose records in which region corresponds to North America or is NULL. */ 
SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  FULL JOIN currencies
    -- Match on code
    USING (code)
-- Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- Order by region
ORDER BY region;

/* 2/3 Repeat the same query as before, using a LEFT JOIN instead of a FULL JOIN. Note what has changed compared to the FULL JOIN result! */ 
SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  LEFT JOIN currencies
    -- Match on code
    USING (code)
-- Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- Order by region
ORDER BY region;

/* 3/3 Repeat the same query again but use an INNER JOIN instead of a FULL JOIN. Note what has changed compared to the FULL JOIN and LEFT JOIN results! */
SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  INNER JOIN currencies
    -- Match on code
    USING (code)
-- Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- Order by region
ORDER BY region;
```

#### Full join (2)

```
/* 1/3 Choose records in which countries.name starts with the capital letter 'V' or is NULL.
Arrange by countries.name in ascending order to more clearly see the results. */
SELECT countries.name, code, languages.name AS language
-- From languages
FROM languages
  -- Join to countries
  FULL JOIN countries
    -- Match on code
    USING (code)
-- Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
-- Order by ascending countries.name
ORDER BY countries.name;

/* 2/3 Repeat the same query as before, using a LEFT JOIN instead of a FULL JOIN. Note what has changed compared to the FULL JOIN result! */ 
SELECT countries.name, code, languages.name AS language
-- From languages
FROM languages
  -- Join to countries
  LEFT JOIN countries
    -- Match on code
    USING (code)
-- Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
-- Order by ascending countries.name
ORDER BY countries.name;

/* Repeat once more, but use an INNER JOIN instead of a LEFT JOIN. Note what has changed compared to the FULL JOIN and LEFT JOIN results. */
SELECT countries.name, code, languages.name AS language
-- From languages
FROM languages
  -- Join to countries
  INNER JOIN countries
    -- Match using code
    USING (code)
-- Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
-- Order by ascending countries.name
ORDER BY countries.name;
```

#### Full join (3)

```
/* Complete a full join with countries on the left and languages on the right.
Next, full join this result with currencies on the right.
Use LIKE to choose the Melanesia and Micronesia regions (Hint: 'M%esia').
Select the fields corresponding to the country name AS country, region, language name AS language, and basic and fractional units of currency. */

-- Select fields (with aliases)
SELECT c1.name AS country, region, l.name AS language,
       basic_unit, frac_unit
-- From countries (alias as c1)
FROM countries AS c1
  -- Join with languages (alias as l)
  FULL JOIN languages AS l
    -- Match on code
    USING (code)
  -- Join with currencies (alias as c2)
  FULL JOIN currencies AS c2
    -- Match on code
    USING (code)
-- Where region like Melanesia and Micronesia
WHERE region LIKE 'M%nesia';
```

#### A table of two cities

```
/* 1/2 Create a CROSS JOIN with cities AS c on the left and languages AS l on the right.
Make use of LIKE and Hyder% to choose Hyderabad in both countries.
Select only the city name AS city and language name AS language. */
-- Select fields
SELECT c.name AS city, l.name AS language
-- From cities (alias as c)
FROM cities AS c        
  -- Join to languages (alias as l)
  CROSS JOIN languages AS l
-- Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';

/* 2/2 Use an INNER JOIN instead of a CROSS JOIN. Think about what the difference will be in the results for this INNER JOIN result and the one for the CROSS JOIN. */
-- Select fields
select c.name as city, l.name as language
-- From cities (alias as c)
from cities as c      
  -- Join to languages (alias as l)
  INNER JOIN languages AS l
    -- Match on country code
    ON c.country_code = l.code
-- Where c.name like Hyderabad
WHERE c.name like 'Hyder%';
```

#### Outer challenge

```
/* Select country name AS country, region, and life expectancy AS life_exp.
Make sure to use LEFT JOIN, WHERE, ORDER BY, and LIMIT. */
-- Select fields
SELECT c.name AS country, region, p.life_expectancy AS life_exp 
-- From countries (alias as c)
FROM countries AS c
  -- Join to populations (alias as p)
  LEFT JOIN populations AS p 
    -- Match on country code
    ON c.code = p.country_code
-- Focus on 2010
WHERE year = 2010 
-- Order by life_exp
ORDER BY life_exp 
-- Limit to 5 records
LIMIT 5;
```

### 3/ Set theory clauses

#### Union

```
/* Determine all combinations (include duplicates) of country code and year that exist in either the economies or the populations tables. Order by code then year.
The result of the query should only have two columns/fields. Think about how many records this query should result in.
You'll use code very similar to this in your next exercise after the video. Make note of this code after completing it. */
-- Select fields
SELECT code, year
  -- From economies
  FROM economies
	-- Set theory clause
	UNION ALL
-- Select fields
SELECT country_code, year
  -- From populations
  FROM populations
-- Order by code, year
ORDER BY code, year;
```

#### Union (2)

```
/* Determine all (non-duplicated) country codes in either the cities or the currencies table. The result should be a table with only one field called country_code.
Sort by country_code in alphabetical order.*/
-- Select field
SELECT country_code
  -- From cities
  FROM cities 
	-- Set theory clause
	UNION 
-- Select field
SELECT code 
  -- From currencies
  FROM currencies 
-- Order by country_code
ORDER BY country_code;
```

#### Union all

```
/* Combine the two new tables into one table containing all of the fields in economies2010.
Sort this resulting single table by country code and then by year, both in ascending order. */
-- Select fields from 2010 table
SELECT *
  -- From 2010 table
  FROM economies2010
	-- Set theory clause
	UNION
-- Select fields from 2015 table
SELECT * 
  -- From 2015 table
  FROM economies2015
-- Order by code and year
ORDER BY code, year;
```

#### Intersect

```
/* Use INTERSECT to determine the records in common for country code and year for the economies and populations tables.
Again, order by code and then by year, both in ascending order. */
-- Select fields
SELECT code, year
  -- From economies
  FROM economies 
	-- Set theory clause
	INTERSECT 
-- Select fields
SELECT country_code, year
  -- From populations
  FROM populations
-- Order by code and year
ORDER BY code, year;
```

#### Intersect (2)

```
/* Use INTERSECT to answer this question with countries and cities! */
-- Select fields
SELECT name, code
  -- From countries
  FROM countries
	-- Set theory clause
	INTERSECT
-- Select fields
SELECT name, country_code
  -- From cities
  FROM cities;
```

#### Except

```
/* Order the resulting field in ascending order.
Can you spot the city/cities that are actually capital cities which this query misses? */
-- Select field
SELECT name
  -- From cities
  FROM cities
	-- Set theory clause
	EXCEPT
-- Select field
SELECT capital
  -- From countries
  FROM countries
-- Order by result
ORDER BY name ASC;
```

#### Except (2)

```
/* Order by capital in ascending order.
The cities table contains information about 236 of the world's most populous cities. 
The result of your query may surprise you in terms of the number of capital cities that do not appear in this list! */
-- Select field
SELECT capital
  -- From countries
  FROM countries
	-- Set theory clause
	EXCEPT 
-- Select field
SELECT name
  -- From cities
  FROM cities
-- Order by ascending capital
ORDER BY capital ASC;
```

#### Semi-join

```
/* 1/3 Begin by selecting all country codes in the Middle East as a single field result using SELECT, FROM, and WHERE. */
-- Select code
SELECT code
  -- From countries
  FROM countries
-- Where region is Middle East
WHERE region = 'Middle East';


/* 2/3 Below the commented code, select only unique languages by name appearing in the languages table.
Order the resulting single field table by name in ascending order. */
-- Query from step 1:
/*
SELECT code
  FROM countries
WHERE region = 'Middle East';
*/

-- Select field
SELECT distinct languages.name
  -- From languages
  FROM languages
-- Order by name
ORDER BY name ASC;

/* 3/3 Combine the previous two queries into one query by adding a WHERE IN statement to the SELECT DISTINCT query to determine the unique languages spoken in the Middle East.
Order the result by name in ascending order. */
-- Query from step 2
SELECT DISTINCT name
  FROM languages
-- Where in statement
WHERE name IN
  -- Query from step 1
  -- Subquery
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
-- Order by name
ORDER BY name ASC;
```

#### Diagnosing problems using anti-join

```
/* 1/3 Begin by determining the number of countries in countries that are listed in Oceania using SELECT, FROM, and WHERE. */
-- Select statement
SELECT COUNT(name)
  -- From countries
  FROM countries
-- Where continent is Oceania
WHERE continent = 'Oceania';

/* 2/3 Complete an inner join with countries AS c1 on the left and currencies AS c2 on the right to get the different currencies used in the countries of Oceania.
Match ON the code field in the two tables.
Include the country code, country name, and basic_unit AS currency.
Observe the query result and make note of how many different countries are listed here. */
-- Select fields (with aliases)
SELECT c1.code, c1.name, c2.basic_unit AS currency
  -- From countries (alias as c1)
  FROM countries AS c1
  	-- Join with currencies (alias as c2)
  	INNER JOIN currencies AS c2
    -- Match on code
    ON c1.code = c2.code
-- Where continent is Oceania
WHERE continent = 'Oceania';

/* 3/3 Note that not all countries in Oceania were listed in the resulting inner join with currencies. Use an anti-join to determine which countries were not included!
Use NOT IN and (SELECT code FROM currencies) as a subquery to get the country code and country name for the Oceanian countries that are not included in the currencies table. */
-- Select fields
SELECT code, name
  -- From Countries
  FROM countries
  -- Where continent is Oceania
  WHERE continent = 'Oceania'
  	-- And code not in
  	AND code NOT IN
  	-- Subquery
  	(SELECT code
	  FROM currencies);
```

#### Set theory challenge

```
/* Identify the country codes that are included in either economies or currencies but not in populations.
Use that result to determine the names of cities in the countries that match the specification in the previous instruction. */

-- Select the city name
SELECT name
  -- Alias the table where city name resides
  FROM cities AS c1
  -- Choose only records matching the result of multiple set theory clauses
  WHERE country_code IN
(
    -- Select appropriate field from economies AS e
    SELECT e.code
    FROM economies AS e
    -- Get all additional (unique) values of the field from currencies AS c2  
    UNION
    SELECT c2.code
    FROM currencies AS c2
    -- Exclude those appearing in populations AS p
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);
```

#### Relating semi-join to a tweaked inner join

```
/* Let's revisit the code from the previous exercise, which retrieves languages spoken in the Middle East. */
SELECT DISTINCT name
FROM languages
WHERE code IN
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
ORDER BY name;

-- Sometimes problems solved with semi-joins can also be solved using an inner join.
SELECT languages.name AS language
FROM languages
INNER JOIN countries
ON languages.code = countries.code
WHERE region = 'Middle East'
ORDER BY language;

/*This inner join isn't quite right. What is missing from this second code block to get it to match with the correct answer produced by the first block?
DISTINCT */
```

### 4/ Subqueries

#### Subquery inside where

```
```

#### Subquery inside where (2)

```
```

#### Subquery inside select

```
```

#### Subquery inside from

```
```

#### Advanced subquery

```
```

#### Subquery challenge

```
```

#### Subquery review

```
```

#### Final challenge

```
```

#### Final challenge (2)

```
```

#### Final challenge (3)

```
```

## Intermediate SQL

### Dataset:

- teams_germany: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- matches_germany: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- teams_spain: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- matches_spain: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- teams_italy: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- matches_italy: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- matches_2013_2014: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- match: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- team: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- league: 

| id | country_id | name |
|-|-|-|

- country: 

| id | country | 
|-|-|

### 1/ We'll take the CASE

#### Basic CASE statements

```
```

#### CASE statements comparing column values

```
```

#### CASE statements comparing two column values part 2

```
```

#### In CASE of rivalry

```
```

#### Filtering your CASE statement

```
```

#### COUNT using CASE WHEN

```
```

#### COUNT and CASE WHEN with multiple conditions

```
```

#### Calculating percent with CASE and AVG

```
```

### 2/ Short and Simple Subqueries

#### Filtering using scalar subqueries

```
```

#### Filtering using a subquery with a list

```
```

#### Filtering with more complex subquery conditions

```
```

#### Joining Subqueries in FROM

```
```

#### Building on Subqueries in FROM

```
```

#### Add a subquery to the SELECT clause

```
```

#### Subqueries in Select for Calculations

```
```

#### Subqueries everywhere! And best practices!

```
```

#### ALL the subqueries EVERYWHERE

```
```

#### Add a subquery in FROM

```
```

#### Add a subquery in SELECT

```
```

### 3/ Correlated Queries, Nested Queries, and Common Table Expressions

#### Basic Correlated Subqueries

```
```

#### Correlated subquery with multiple conditions

```
```

#### Nested subqueries

```
```

#### Nested simple subqueries

```
```

#### Nest a subquery in FROM

```
```

#### Clean up with CTEs

```
```

#### Organizing with CTEs

```
```

#### CTEs with nested subqueries

```
```

#### Get team names with a subquery

```
```

#### Get team names with correlated subqueries

```
```

#### Get team names with CTEs

```
```

#### Which technique to use?

```
```

### 4/ Window Functions

#### The match is OVER

```
```

#### What's OVER here?

```
```

#### Flip OVER your results

```
```

#### PARTITION BY a column

```
```

#### PARTITION BY multiple columns

```
```

#### Slide to the left

```
```

#### Slide to the right

```
```

#### Setting up the home team CTE

```
```

#### Setting up the away team CTE

```
```

#### Putting the CTEs together

```
```

#### Add a window function

```
```

