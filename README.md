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
/* 1/2 Begin by calculating the average life expectancy across all countries for 2015. */
-- Select average life_expectancy
SELECT avg(life_expectancy)
  -- From populations
  FROM populations
-- Where year is 2015
WHERE year = 2015;

/* 2/2 Recall that you can use SQL to do calculations for you. Suppose we wanted only records that were above 1.15 * 100 in terms of life expectancy for 2015: */
SELECT *
  FROM populations
WHERE life_expectancy > 1.15 * 100
  AND year = 2015;

/* Select all fields from populations with records corresponding to larger than 1.15 times the average you calculated in the first task for 2015. In other words, change the 100 in the example above with a subquery.
Hint */
SELECT ___
  FROM ___
WHERE ___ >
  ___ * (SELECT ___(___)
   FROM ___
   WHERE ___ = ___) AND
  ___ = ___;

-- Select fields
SELECT *
  -- From populations
  FROM populations
-- Where life_expectancy is greater than
WHERE life_expectancy > 
  -- 1.15 * subquery
  1.15 * (SELECT avg(life_expectancy)
          FROM populations
          WHERE year = 2015) AND
          year = 2015;
```

#### Subquery inside where (2)

```
/* Make use of the capital field in the countries table in your subquery.
Select the city name, country code, and urban area population fields. */
-- Select fields
SELECT name, country_code, urbanarea_pop
  -- From cities
  FROM cities
-- Where city name in the field of capital cities
WHERE name IN
  -- Subquery
  (SELECT capital
   FROM countries)
ORDER BY urbanarea_pop DESC;
```

#### Subquery inside select

```
/* 1/2 Submit the code to view the result of the provided query. */
SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;

/* 2/2 Convert the GROUP BY code to use a subquery inside of SELECT by filling in the blanks to get a result that matches the one given using the GROUP BY code in the first query.
Again, sort the result by cities_num descending and then by country ascending. */ 

SELECT countries.name AS country,
  -- Subquery
  (SELECT count(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
```

#### Subquery inside from

```
/* 1/2 Begin by determining for each country code how many languages are listed in the languages table using SELECT, FROM, and GROUP BY.
Alias the aggregated field as lang_num. */
-- Select fields (with aliases)
SELECT code, count(languages) AS lang_num
  -- From languages
  FROM languages
-- Group by code
GROUP BY code;

/* 2/2 Include the previous query (aliased as subquery) as a subquery in the FROM clause of a new query.
Select the local name of the country from countries.
Also, select lang_num from subquery.
Make sure to use WHERE appropriately to match code in countries and in subquery.
Sort by lang_num in descending order. */
-- Select fields
SELECT local_code, name
  -- From countries
  FROM countries,
  	-- Subquery (alias as subquery)
  	(SELECT code, COUNT(*) AS lang_num
  	 FROM languages
  	 GROUP BY code) AS subquery
  -- Where codes match
  WHERE countries.code = subquery.code
-- Order by descending number of languages
ORDER BY lang_num desc;
```

#### Advanced subquery

```
/* 1/3 Create an INNER JOIN with countries on the left and economies on the right with USING, without aliasing your tables or columns.
Retrieve the country's name, continent, and inflation rate for 2015. */

-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
  	-- Join to economies
  	INNER JOIN economies
    -- Match on code
    USING (code)
-- Where year is 2015
WHERE year = 2015;

/* 2/3 Select the maximum inflation rate in 2015 AS max_inf grouped by continent using the previous step's query as a subquery in the FROM clause.
Thus, in your subquery you should:
Create an inner join with countries on the left and economies on the right with USING (without aliasing your tables or columns).
Retrieve the country name, continent, and inflation rate for 2015.
Alias the subquery as subquery.
This will result in the six maximum inflation rates in 2015 for the six continents as one field table. Make sure to not include continent in the outer SELECT statement. */
-- Select the maximum inflation rate as max_inf
SELECT max(inflation_rate) AS max_inf
  -- Subquery using FROM (alias as subquery)
  FROM (
      SELECT name, continent, inflation_rate
      FROM countries
      INNER JOIN economies
      USING (code)
      WHERE year = 2015) AS subquery
-- Group by continent
GROUP BY continent;

/* 3/3 Now it's time to append your second query to your first query using AND and IN to obtain the name of the country, its continent, and the maximum inflation rate for each continent in 2015.
For the sake of practice, change all joining conditions to use ON instead of USING.
Hint
You need to expand the WHERE clause in your first query with AND to only find inflation rates that are IN your maximum inflation rates subquery.
You can join tables ON columns using table1.column1 = table2.column2. In this exercise, the column name common to both tables is code. */
-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
	-- Join to economies
	INNER JOIN economies
	-- Match on code
	ON countries.code = economies.code
  -- Where year is 2015
  WHERE year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code = economies.code
             WHERE year = 2015) AS subquery
      -- Group by continent
        GROUP BY continent);
```

#### Subquery challenge

```
/* Select the country code, inflation rate, and unemployment rate.
Order by inflation rate ascending.
Do not use table aliasing in this exercise. */
-- Select fields
SELECT code, inflation_rate, unemployment_rate
  -- From economies
  FROM economies
  -- Where year is 2015 and code is not in
  WHERE year = 2015 AND code NOT IN
  	-- Subquery
  	(SELECT code
  	 FROM countries
  	 WHERE (gov_form = 'Constitutional Monarchy' OR gov_form LIKE '%Republic'))
-- Order by inflation rate
ORDER BY inflation_rate ASC;
```

#### Final challenge

```
/* Select unique country names. Also select the total investment and imports fields.
Use a left join with countries on the left. (An inner join would also work, but please use a left join here.)
Match on code in the two tables AND use a subquery inside of ON to choose the appropriate languages records.
Order by country name ascending.
Use table aliasing but not field aliasing in this exercise. */

-- Select fields
SELECT DISTINCT c.name, total_investment, imports
  -- From table (with alias)
  FROM countries AS c
    -- Join with table (with alias)
    LEFT JOIN economies AS e
      -- Match on code
      ON (c.code = e.code
      -- and code in Subquery
        AND c.code IN (
          SELECT l.code
          FROM languages AS l
          WHERE official = 'true'
        ) )
  -- Where region and year are correct
  WHERE region = 'Central America' AND year = 2015
-- Order by field
ORDER BY c.name;
```

#### Final challenge (2)

```
/* Include the name of region, its continent, and average fertility rate aliased as avg_fert_rate.
Sort based on avg_fert_rate ascending.
Remember that you'll need to GROUP BY all fields that aren't included in the aggregate function of SELECT. */

-- Select fields
SELECT c.region, c.continent, AVG(p.fertility_rate) AS avg_fert_rate
  -- From left table
  FROM countries AS c
    -- Join to right table
    INNER JOIN populations AS p
      -- Match on join condition
      ON (c.code = p.country_code)
  -- Where specific records matching some condition
  WHERE year = 2015
-- Group appropriately
GROUP BY region, continent
-- Order appropriately
ORDER BY avg_fert_rate ASC;
```

#### Final challenge (3)

```
/* Select the city name, country code, city proper population, and metro area population.
Calculate the percentage of metro area population composed of city proper population for each city in cities, aliased as city_perc.
Focus only on capital cities in Europe and the Americas in a subquery.
Make sure to exclude records with missing data on metro area population.
Order the result by city_perc descending.
Then determine the top 10 capital cities in Europe and the Americas in terms of this city_perc percentage. */

-- Select fields
SELECT name, country_code, city_proper_pop, metroarea_pop,
	  -- Calculate city_perc
      city_proper_pop / metroarea_pop * 100 AS city_perc
  -- From appropriate table    
  FROM cities
  -- Where
  WHERE name IN
    -- Subquery
    (SELECT capital
     FROM countries
     WHERE (continent = 'Europe'
        OR continent LIKE '%America'))
       AND metroarea_pop IS NOT NULL
-- Order appropriately
ORDER BY city_perc DESC
-- Limit amount
LIMIT 10;
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
/* 1/2 Select the team's long name and API id from the teams_germany table.
Filter the query for FC Schalke 04 and FC Bayern Munich using IN, giving you the team_api_IDs needed for the next step. */
SELECT
	-- Select the team long name and team API id
	team_long_name,
	team_api_id
FROM teams_germany
-- Only include FC Schalke 04 and FC Bayern Munich
WHERE team_long_name IN ('FC Schalke 04', 'FC Bayern Munich');

/* 2/2 Create a CASE statement that identifies whether a match in Germany included FC Bayern Munich, FC Schalke 04, or neither as the home team.
Group the query by the CASE statement alias, home_team. */
-- Identify the home team as Bayern Munich, Schalke 04, or neither
SELECT 
	CASE WHEN hometeam_id = 8178 THEN 'FC Schalke 04'
        WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
-- Group by the CASE statement alias
GROUP BY home_team;
```

#### CASE statements comparing column values

```
/* 1/3 Select the date of the match and create a CASE statement to identify matches as home wins, home losses, or ties. */
SELECT 
	-- Select the date of the match
	date,
	-- Identify home wins, losses, or ties
	CASE WHEN home_goal > away_goal THEN 'Home win!'
        WHEN home_goal < away_goal THEN 'Home loss :(' 
        ELSE 'Tie' END AS outcome
FROM matches_spain;

/* 2/3 Left join the teams_spain table team_api_id column to the matches_spain table awayteam_id. This allows us to retrieve the away team's identity.
Select team_long_name from teams_spain as opponent and complete the CASE statement from Step 1. */
SELECT m.date,
	--Select the team long name column and call it 'opponent'
	t.team_long_name AS opponent, 
	-- Complete the CASE statement with an alias
	CASE WHEN m.home_goal > m.away_goal THEN 'Home win!'
        WHEN m.home_goal < m.away_goal THEN 'Home loss :('
        ELSE 'Tie' END AS outcome
FROM matches_spain AS m
-- Left join teams_spain onto matches_spain
LEFT JOIN teams_spain AS t
ON m.awayteam_id = t.team_api_id;

/* 3/3 Complete the same CASE statement as the previous steps.
Filter for matches where the home team is FC Barcelona (id = 8634). */
SELECT 
	m.date,
	t.team_long_name AS opponent,
    -- Complete the CASE statement with an alias
	CASE WHEN m.home_goal > m.away_goal THEN 'Barcelona win!'
        WHEN m.home_goal < m.away_goal THEN 'Barcelona loss :(' 
        ELSE 'Tie' END AS outcome 
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.awayteam_id = t.team_api_id
-- Filter for Barcelona as the home team
WHERE m.hometeam_id = 8634; 
```

#### CASE statements comparing two column values part 2

```
/* Complete the CASE statement to identify Barcelona's away team games (id = 8634) as wins, losses, or ties.
Left join the teams_spain table team_api_id column on the matches_spain table hometeam_id column. This retrieves the identity of the home team opponent.
Filter the query to only include matches where Barcelona was the away team.*/

-- Select matches where Barcelona was the away team
SELECT  
	m.date,
	t.team_long_name AS opponent,
	CASE WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
        WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :(' 
        ELSE 'Tie' END AS outcome
FROM matches_spain AS m
-- Join teams_spain to matches_spain
LEFT JOIN teams_spain AS t 
ON m.hometeam_id = t.team_api_id
WHERE m.awayteam_id = 8634;
```

#### In CASE of rivalry

```
/* 1/2 Complete the first CASE statement, identifying Barcelona or Real Madrid as the home team using the hometeam_id column.
Complete the second CASE statement in the same way, using awayteam_id.
Hint
Your CASE statement should identify the first team, FC Barcelona, and the second team in the ELSE clause as Real Madrid CF. 
Therefore, your WHEN statement should use the home/away team ID that matches the alias. */

SELECT 
	date,
	-- Identify the home team as Barcelona or Real Madrid
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
        ELSE 'Real Madrid CF' END AS home,
    -- Identify the away team as Barcelona or Real Madrid
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
        ELSE 'Real Madrid CF' END AS away
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);

/* 2/2 Construct the final CASE statement identifying who won each match. Note there are 3 possible outcomes, but 5 conditions that you need to identify.
Fill in the logical operators to identify Barcelona or Real Madrid as the winner. */

SELECT 
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!'
        WHEN home_goal > away_goal AND hometeam_id = 8633 THEN 'Real Madrid win!'
        WHEN home_goal < away_goal AND awayteam_id = 8634 THEN 'Barcelona win!'
        WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!'
        ELSE 'Tie!' END AS outcome
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);
```

#### Filtering your CASE statement

```
/* 1/3 Identify Bologna's team ID listed in the teams_italy table by selecting the team_long_name and team_api_id.*/
-- Select team_long_name and team_api_id from team
SELECT
	team_long_name,
	team_api_id
FROM teams_italy
-- Filter for team long name
WHERE team_long_name = 'Bologna';

/* 2/3 Select the season and date that a match was played.
Complete the CASE statement so that only Bologna's home and away wins are identified. */
-- Select the season and date columns
SELECT 
	season,
	date,
    -- Identify when Bologna won a match
	CASE WHEN hometeam_id = 9857 
        AND home_goal > away_goal 
        THEN 'Bologna Win'
		WHEN awayteam_id = 9857 
        AND away_goal > home_goal 
        THEN 'Bologna Win' 
		END AS outcome
FROM matches_italy;

/* 3/3 Select the home_goal and away_goal for each match.
Use the CASE statement in the WHERE clause to filter all NULL values generated by the statement in the previous step. */
-- Select the season, date, home_goal, and away_goal columns
SELECT 
	season,
    date,
	home_goal,
	away_goal
FROM matches_italy
WHERE 
-- Exclude games not won by Bologna
	CASE WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
		WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win' 
		END IS NOT NULL;
```

#### COUNT using CASE WHEN

```
/* 1/2 Create a CASE statement that identifies the id of matches played in the 2012/2013 season. Specify that you want ELSE values to be NULL.
Wrap the CASE statement in a COUNT function and group the query by the country alias.

Hint
Your CASE statement should count the id of matches in the season you filtered for, and all other values should be NULL by default.
Include a GROUP BY clause in any query with an aggregate function -- including CASE statements. */

SELECT 
	c.name AS country,
    -- Count games from the 2012/2013 season
	COUNT(CASE WHEN m.season = '2012/2013' 
        	THEN m.id ELSE NULL END) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY name;

/* 2/2 Create 3 CASE WHEN statements counting the matches played in each country across the 3 seasons.
END your CASE statement without an ELSE clause. */

SELECT 
	c.name AS country,
    -- Count matches in each of the 3 seasons
	COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
	COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
	COUNT(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY name;
```

#### COUNT and CASE WHEN with multiple conditions

```
/*Create 3 CASE statements to "count" matches in the '2012/2013', '2013/2014', and '2014/2015' seasons, respectively.
Have each CASE statement return a 1 for every match you want to include, and a 0 for every match to exclude.
Wrap the CASE statement in a SUM to return the total matches played in each season.
Group the query by the country name alias. */

SELECT 
	c.name AS country,
    -- Sum the total records in each season where the home team won
	SUM(CASE WHEN m.season = '2012/2013' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2012_2013,
 	SUM(CASE WHEN m.season = '2013/2014' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY name;
```

#### Calculating percent with CASE and AVG

```
/* 1/3 Create 3 CASE statements to COUNT the total number of home team wins, away team wins, and ties, which will allow you to examine the total number of records. */
SELECT 
    c.name AS country,
    -- Count the home wins, away wins, and ties in each country
	COUNT(CASE WHEN m.home_goal > m.away_goal THEN m.id 
        END) AS home_wins,
	COUNT(CASE WHEN m.home_goal < m.away_goal THEN m.id 
        END) AS away_wins,
	COUNT(CASE WHEN m.home_goal = m.away_goal THEN m.id 
        END) AS ties
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;

/* 2/3 Calculate the percentage of matches tied using a CASE statement inside AVG.
Fill in the logical operators for each statement. Alias your columns as ties_2013_2014 and ties_2014_2015, respectively. */
SELECT 
	c.name AS country,
    -- Calculate the percentage of tied games in each season
	AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			END) AS ties_2013_2014,
	AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			END) AS ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;

/* 3/3 The previous "ties" columns returned values with 14 decimal points, which is not easy to interpret. Use the ROUND function to round to 2 decimal points. */
SELECT 
	c.name AS country,
    -- Round the percentage of tied games to 2 decimal points
	ROUND(AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			 END), 2) AS pct_ties_2013_2014,
	ROUND(AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			 END), 2) AS pct_ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```

### 2/ Short and Simple Subqueries

#### Filtering using scalar subqueries

```
/* 1/2 Calculate triple the average home + away goals scored across all matches. This will become your subquery in the next step. 
Note that this column does not have an alias, so it will be called ?column? in your results. */

-- Select the average of home + away goals, multiplied by 3
SELECT 
	3 * AVG(home_goal + away_goal)
FROM matches_2013_2014;

/* 2/2 Select the date, home goals, and away goals in the main query.
Filter the main query for matches where the total goals scored exceed the value in the subquery. */

SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 
```

#### Filtering using a subquery with a list

```
/* Create a subquery in the WHERE clause that retrieves all unique hometeam_ID values from the match table.
Select the team_long_name and team_short_name from the team table. Exclude all values from the subquery in the main query. */
SELECT 
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team 
-- Exclude all values from the subquery
WHERE team_api_id NOT IN
     (SELECT DISTINCT hometeam_ID  FROM match);
```

#### Filtering with more complex subquery conditions

```
/* Create a subquery in WHERE clause that retrieves all hometeam_ID values from match with a home_goal score greater than or equal to 8.
Select the team_long_name and team_short_name from the team table. Include all values from the subquery in the main query. */

SELECT
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team
-- Filter for teams with 8 or more home goals
WHERE team_api_id IN
	  (SELECT hometeam_id 
       FROM match
       WHERE home_goal >= 8);
```

#### Joining Subqueries in FROM

```
/* 1/2 Create the subquery to be used in the next step, which selects the country ID and match ID (id) from the match table.
Filter the query for matches with greater than or equal to 10 goals. */

SELECT 
	-- Select the country ID and match ID
	country_id, 
    id 
FROM match
-- Filter for matches with 10 or more goals in total
WHERE (home_goal + away_goal) >= 10;

/* 2/2 Construct a subquery that selects only matches with 10 or more total goals.
Inner join the subquery onto country in the main query.
Select name from country and count the id column from match. */

SELECT
	-- Select country name and the count match IDs
    c.name AS country_name,
    COUNT(c.id) AS matches
FROM country AS c
-- Inner join the subquery onto country
-- Select the country id and match id columns
INNER JOIN (SELECT country_id, id 
           FROM match
           -- Filter the subquery by matches with 10+ goals
           WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;
```

#### Building on Subqueries in FROM

```
/* Calculate the average home goals and average away goals from the match table for each stage in the FROM clause subquery.
Add a subquery to the WHERE clause that calculates the overall average home goals.
Filter the main query for stages where the average home goals is higher than the overall average.
Select the stage and avg_goals columns from the s subquery into the main query. */

SELECT
	-- Select country, date, home, and away goals from the subquery
    country,
    date,
    home_goal,
    away_goal
FROM
	-- Select country name, date, home_goal, away_goal, and total goals in the subquery
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subquery
-- Filter by total goals scored in the main query
WHERE total_goals >= 10;
```

#### Add a subquery to the SELECT clause

```
/*  In the subquery, select the average total goals by adding home_goal and away_goal.
Filter the results so that only the average of goals in the 2013/2014 season is calculated.
In the main query, select the average total goals by adding home_goal and away_goal. This calculates the average goals for each league.
Filter the results in the main query the same way you filtered the subquery. Group the query by the league name. */

SELECT 
	l.name AS league,
    -- Select and round the league's total goals
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    -- Select & round the average total goals for the season
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
-- Filter for the 2013/2014 season
WHERE season = '2013/2014'
GROUP BY league;
```

#### Subqueries in Select for Calculations

```
/*  Select the average goals scored in a match for each league in the main query.
Select the average goals scored in a match overall for the 2013/2014 season in the subquery.
Subtract the subquery from the average number of goals calculated for each league.
Filter the main query so that only games from the 2013/2014 season are included. */

SELECT
	-- Select the league name and average goals scored
	l.name AS league,
	ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    -- Subtract the overall average from the league average
	ROUND(AVG(m.home_goal + m.away_goal) - 
		(SELECT AVG(home_goal + away_goal)
		 FROM match 
         WHERE season = '2013/2014'),2) AS diff
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
-- Only include 2013/2014 results
WHERE season = '2013/2014'
GROUP BY l.name;
```

#### ALL the subqueries EVERYWHERE

```
/*  Extract the average number of home and away team goals in two SELECT subqueries.
Calculate the average home and away goals for the specific stage in the main query.
Filter both subqueries and the main query so that only data from the 2012/2013 season is included.
Group the query by the m.stage column. */

SELECT 
	-- Select the stage and average goals for each stage
	m.stage,
    ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    -- Select the average overall goals for the 2012/2013 season
    ROUND((SELECT AVG(home_goal + away_goal) 
           FROM match 
           WHERE season = '2012/2013'),2) AS overall
FROM match AS m
-- Filter for the 2012/2013 season
WHERE season = '2012/2013'
-- Group by stage
GROUP BY stage;
```

#### Add a subquery in FROM

```
/* Calculate the average home goals and average away goals from the match table for each stage in the FROM clause subquery.
Add a subquery to the WHERE clause that calculates the overall average home goals.
Filter the main query for stages where the average home goals is higher than the overall average.
Select the stage and avg_goals columns from the s subquery into the main query. */

SELECT 
	-- Select the stage and average goals from the subquery
	stage,
	ROUND(s.avg_goals,2) AS avg_goals
FROM 
	-- Select the stage and average goals in 2012/2013
	(SELECT
		 stage,
         AVG(home_goal + away_goal) AS avg_goals
	 FROM match
	 WHERE season = '2012/2013'
	 GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM match WHERE season = '2012/2013');
```

#### Add a subquery in SELECT

```
/* Create a subquery in SELECT that yields the average goals scored in the 2012/2013 season. Name the new column overall_avg.
Create a subquery in FROM that calculates the average goals scored in each stage during the 2012/2013 season.
Filter the main query for stages where the average goals exceeds the overall average in 2012/2013. */

SELECT 
	-- Select the stage and average goals from s
	s.stage,
    ROUND(s.avg_goals,2) AS avg_goal,
    -- Select the overall average for 2012/2013
    (SELECT AVG(home_goal + away_goal) FROM match WHERE season = '2012/2013') AS overall_avg
FROM 
	-- Select the stage and average goals in 2012/2013 from match
	(SELECT
		 stage,
         AVG(home_goal + away_goal) AS avg_goals
	 FROM match
	 WHERE season = '2012/2013'
	 GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM match WHERE season = '2012/2013');
```

### 3/ Correlated Queries, Nested Queries, and Common Table Expressions

#### Basic Correlated Subqueries

```
/* Select the country_id, date, home_goal, and away_goal columns in the main query.
Complete the AVG value in the subquery.
Complete the subquery column references, so that country_id is matched in the main and subquery.*/
SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal, 
    main.away_goal
FROM match AS main
WHERE 
	-- Filter the main query by the subquery
	(home_goal + away_goal) > 
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);
```

#### Correlated subquery with multiple conditions

```
/*  Select the country_id, date, home_goal, and away_goal columns in the main query.
Complete the subquery: Select the matches with the highest number of total goals.
Match the subquery to the main query using country_id and season.
Fill in the correct logical operator so that total goals equals the max goals recorded in the subquery.*/

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE 
	-- Filter for matches with the highest number of goals scored
	(home_goal + away_goal) = 
        (SELECT MAX(sub.home_goal + sub.away_goal)
         FROM match AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);
```

#### Nested simple subqueries

```
/* Complete the main query to select the season and the max total goals in a match for each season. Name this max_goals.
Complete the first simple subquery to select the max total goals in a match across all seasons. Name this overall_max_goals.
Complete the nested subquery to select the maximum total goals in a match played in July across all seasons.
Select the maximum total goals in the outer subquery. Name this entire subquery july_max_goals. */

SELECT
	-- Select the season and max goals scored in a match
	season,
    MAX(home_goal + away_goal) AS max_goals,
    -- Select the overall max goals scored in a match
   (SELECT MAX(home_goal + away_goal) FROM match) AS overall_max_goals,
   -- Select the max number of goals scored in any match in July
   (SELECT MAX(home_goal + away_goal) 
    FROM match
    WHERE id IN (
          SELECT id FROM match WHERE EXTRACT(MONTH FROM date) = 07)) AS july_max_goals
FROM match
GROUP BY season;
```

#### Nest a subquery in FROM

```
/* 1/3 Generate a list of matches where at least one team scored 5 or more goals. */
-- Select matches where a team scored 5+ goals
SELECT
	country_id,
    season,
	id
FROM match
WHERE home_goal >= 5 OR away_goal >= 5;

/* 2/3 Turn the query from the previous step into a subquery in the FROM statement.
COUNT the match ids generated in the previous step, and group the query by country_id and season.
Hint
Place the subquery inside parentheses and give it an alias using AS!
All you need to do after that is COUNT the id column and GROUP BY the two non-aggregate columns. */
-- Count match ids
SELECT
    country_id,
    season,
    COUNT(id) AS matches
-- Set up and alias the subquery
FROM (
	SELECT
    	country_id,
    	season,
    	id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) 
    AS subquery
-- Group by country_id and season
GROUP BY country_id, season;

/* 3/3 Finally, declare the same query from step 2 as a subquery in FROM with the alias outer_s.
Left join it to the country table using the outer query's country_id column.
Calculate an AVG of high scoring matches per country in the main query.

Hint
Remember to enclose the subquery in parentheses before its final alias, but after the WHERE statement!
The outermost subquery in SELECT should include a WHERE clause connecting outer_s to country. */
SELECT
	c.name AS country,
    -- Calculate the average matches per season
	AVG(c.id) AS avg_seasonal_high_scores
FROM country AS c
-- Left join outer_s to country
LEFT JOIN (
  SELECT country_id, season,
         COUNT(id) AS matches
  FROM (
    SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
  -- Close parentheses and alias the subquery
  GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;
```

#### Clean up with CTEs

```
/* Complete the syntax to declare your CTE.
Select the country_id and match id from the match table in your CTE.
Left join the CTE to the league table using country_id. */

-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id, 
  		id
    FROM match
    WHERE (home_goal + away_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l
-- Join the CTE to the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;
```

#### Organizing with CTEs

```
/* Declare your CTE, where you create a list of all matches with the league name.
Select the league, date, home, and away goals from the CTE.
Filter the main query for matches with 10 or more goals. */
-- Set up your CTE

WITH match_list AS (
  -- Select the league, date, home, and away goals
    SELECT 
  		l.name AS league, 
     	m.date, 
  		m.home_goal, 
  		m.away_goal,
       (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN league as l ON m.country_id = l.id)
-- Select the league, date, home, and away goals from the CTE
SELECT league, date, home_goal, away_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >= 10;
```

#### CTEs with nested subqueries

```
-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id,
  	   (home_goal + away_goal) AS goals
    FROM match
  	-- Create a list of match IDs to filter data in the CTE
    WHERE id IN (
       SELECT id
       FROM match
       WHERE season = '2013/2014' AND EXTRACT(MONTH FROM date) = 08))
-- Select the league name and average of goals in the CTE
SELECT 
	l.name,
    AVG(goals)
FROM league AS l
-- Join the CTE onto the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;
```

#### Get team names with a subquery

```
/* 1/2 Create a query that left joins team to match in order to get the identity of the home team. This becomes the subquery in the next step. */
SELECT 
	m.id, 
    t.team_long_name AS hometeam
-- Left join team to match
FROM match AS m
LEFT JOIN team as t
ON m.hometeam_id = team_api_id;

/* 2/2 Add a second subquery to the FROM statement to get the away team name, changing only the hometeam_id. 
Left join both subqueries to the match table on the id column.
Warning: if your code is timing out, you have probably made a mistake in the JOIN and tried to join on the wrong fields which caused the table to be too big! 
Read the provided code and comments carefully, and check your ON conditions! */

SELECT
	m.date,
    -- Get the home and away team names
    home.hometeam,
    away.awayteam,
    m.home_goal,
    m.away_goal
FROM match AS m

-- Join the home subquery to the match table
LEFT JOIN (
  SELECT match.id, team.team_long_name AS hometeam
  FROM match
  LEFT JOIN team
  ON match.hometeam_id = team.team_api_id) AS home
ON home.id = m.id

-- Join the away subquery to the match table
LEFT JOIN (
  SELECT match.id, team.team_long_name AS awayteam
  FROM match
  LEFT JOIN team
  -- Get the away team ID in the subquery
  ON match.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;
```

#### Get team names with CTEs

```
/* 1/3 Select id from match and team_long_name from team. Join these two tables together on hometeam_id in match and team_api_id in team. */
SELECT 
	-- Select match id and team long name
    m.id, 
    t.team_long_name AS hometeam
FROM match AS m
-- Join team to match using team_api_id and hometeam_id
LEFT JOIN team AS t 
ON t.team_api_id = m.hometeam_id;

/* 2/3 Declare the query from the previous step as a common table expression. SELECT everything from the CTE into the main query. Your results will not change at this step! */
-- Declare the home CTE
WITH home AS (
	SELECT m.id, t.team_long_name AS hometeam
	FROM match AS m
	LEFT JOIN team AS t 
	ON m.hometeam_id = t.team_api_id)
-- Select everything from home
SELECT *
FROM home;

/* 3/3 Let's declare the second CTE, away. Join it to the first CTE on the id column.
The date, home_goal, and away_goal columns have been added to the CTEs. SELECT them into the main query.

Hint
Only the first CTE is declared using WITH. Afterward, use the cte's name, away, and AS.
Select the home_goal and away_goal columns into the main query from their respective CTEs! */
WITH home AS (
  SELECT m.id, m.date, 
  		 t.team_long_name AS hometeam, m.home_goal
  FROM match AS m
  LEFT JOIN team AS t 
  ON m.hometeam_id = t.team_api_id),
-- Declare and set up the away CTE
away AS (
  SELECT m.id, m.date, 
  		 t.team_long_name AS awayteam, m.away_goal
  FROM match AS m
  LEFT JOIN team AS t 
  ON m.awayteam_id = t.team_api_id)
-- Select date, home_goal, and away_goal
SELECT 
	home.date,
    home.hometeam,
    away.awayteam,
    home.home_goal,
    away.away_goal
-- Join away and home on the id column
FROM home
INNER JOIN away
ON home.id = away.id;
```

#### Which technique to use?

```
/*
Which technique to use?
The previous three exercises demonstrated that, in many cases, you can use multiple techniques in SQL to answer the same question.

Based on what you learned, which of the following statements is false regarding differences in the use and performance of multiple/nested subqueries, 
correlated subqueries, and common table expressions?

--> Correlated subqueries can reduce the length of your query, which improves query run time. */
```

### 4/ Window Functions

#### The match is OVER

```
/* Select the match ID, country name, season, home, and away goals from the match and country tables.
Complete the query that calculates the average number of goals scored overall and then includes the aggregate value in each row using a window function. */
SELECT 
	-- Select the id, country name, season, home, and away goals
	m.id, 
    c.name AS country, 
    m.season,
	m.home_goal,
	m.away_goal,
    -- Use a window to include the aggregate average in each row
	AVG(m.home_goal + m.away_goal) OVER() AS overall_avg
FROM match AS m
LEFT JOIN country AS c ON m.country_id = c.id;
```

#### What's OVER here?

```
/* Select the league name and average total goals scored from league and match.
Complete the window function so it calculates the rank of average goals scored across all leagues in the database.
Order the rank by the average total of home and away goals scored. */
SELECT 
	-- Select the league name and average goals scored
	l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    -- Rank each league according to the average goals
    RANk() OVER(ORDER BY AVG(m.home_goal + m.away_goal)) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
-- Order the query by the rank you created
ORDER BY league_rank;
```

#### Flip OVER your results

```
/* Complete the same parts of the query as the previous exercise.
Complete the window function to rank each league from highest to lowest average goals scored.
Order the main query by the rank you just created. */

SELECT 
	-- Select the league name and average goals scored
	l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    -- Rank leagues in descending order by average goals
    RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal) DESC) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
-- Order the query by the rank you created
ORDER BY league_rank;
```

#### PARTITION BY a column

```
/* Complete the two window functions that calculate the home and away goal averages. Partition the window functions by season to calculate separate averages for each season.
Filter the query to only include matches played by Legia Warszawa, id = 8673. */

SELECT
	date,
	season,
	home_goal,
	away_goal,
	CASE WHEN hometeam_id = 8673 THEN 'home' 
		 ELSE 'away' END AS warsaw_location,
    -- Calculate the average goals scored partitioned by season
    AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
    AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
-- Filter the data set for Legia Warszawa matches only
WHERE 
	match.name = 'Legia Warszawa' 
    OR match.id = 8673
ORDER BY (home_goal + away_goal) DESC;
```

#### PARTITION BY multiple columns

```
/* Construct two window functions partitioning the average of home and away goals by season and month.
Filter the dataset by Legia Warszawa's team ID (8673) so that the window calculation only includes matches involving them. */

SELECT 
	date,
	season,
    home_goal,
    away_goal,
    CASE WHEN hometeam_id = 8673 THEN 'home' 
         ELSE 'away' END AS warsaw_location,
    -- Calculate the average goals scored partitioned by season
    AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
    AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
-- Filter the data set for Legia Warszawa matches only
WHERE 
	hometeam_id = 8673 
    OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;
```

#### Slide to the left

```
/* Complete the window function by:
Assessing the running total of home goals scored by FC Utrecht.
Assessing the running average of home goals scored.
Ordering both the running average and running total by date. */

SELECT 
	date,
	home_goal,
	away_goal,
    -- Create a running total and running average of home goals
    SUM(home_goal) OVER(ORDER BY date 
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,
    AVG(home_goal) OVER(ORDER BY date 
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg
FROM match
WHERE 
	hometeam_id = 9908 
	AND season = '2011/2012';
```

#### Slide to the right

```
/* Complete the window function by:
Assessing the running total of home goals scored by FC Utrecht.
Assessing the running average of home goals scored.
Ordering both the running average and running total by date, descending. */

SELECT 
	-- Select the date, home goal, and away goals
	date,
    home_goal,
    away_goal,
    -- Create a running total and running average of home goals
    SUM(home_goal) OVER(ORDER BY date DESC
         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_total,
    AVG(home_goal) OVER(ORDER BY date DESC
         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_avg
FROM match
WHERE 
	awayteam_id = 9908 
    AND season = '2011/2012';
```

#### Setting up the home team CTE

```
/* Create a CASE statement that identifies each match as a win, lose, or tie for Manchester United.
Fill out the logical operators for each WHEN clause in the CASE statement (equals, greater than, less than).
Join the tables on home team ID from match, and team_api_id from team.
Filter the query to only include games from the 2014/2015 season where Manchester United was the home team. */

SELECT 
	m.id, 
    t.team_long_name,
    -- Identify matches as home/away wins or ties
	CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
		WHEN m.home_goal < m.away_goal THEN 'MU Loss'
        ELSE 'Tie' END AS outcome
FROM match AS m
-- Left join team on the home team ID and team API id
LEFT JOIN team AS t 
ON m.hometeam_id = t.team_api_id
WHERE 
	-- Filter for 2014/2015 and Manchester United as the home team
	m.season = '2014/2015'
	AND t.team_long_name = 'Manchester United';
```

#### Setting up the away team CTE

```
/* Complete the CASE statement syntax.
Fill out the logical operators identifying each match as a win, loss, or tie for Manchester United.
Join the table on awayteam_id, and team_api_id. */
SELECT 
	m.id, 
    t.team_long_name,
    -- Identify matches as home/away wins or ties
	CASE WHEN m.home_goal > m.away_goal THEN 'MU Loss'
		WHEN m.home_goal < m.away_goal THEN 'MU Win'
        ELSE 'Tie' END AS outcome
-- Join team table to the match table
FROM match AS m
LEFT JOIN team AS t 
ON m.awayteam_id = t.team_api_id
WHERE 
	-- Filter for 2014/2015 and Manchester United as the away team
	m.season = '2014/2015'
	AND t.team_long_name = 'Manchester United';
```

#### Putting the CTEs together

```
/* Declare the home and away CTEs before your main query.
Join your CTEs to the match table using a LEFT JOIN.
Select the relevant data from the CTEs into the main query.
Select the date from match, team names from the CTEs, and home/ away goals from match in the main query. */

-- Set up the home team CTE
WITH home AS (
  SELECT m.id, t.team_long_name,
	  CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
		   WHEN m.home_goal < m.away_goal THEN 'MU Loss' 
  		   ELSE 'Tie' END AS outcome
  FROM match AS m
  LEFT JOIN team AS t ON m.hometeam_id = t.team_api_id),
-- Set up the away team CTE
away AS (
  SELECT m.id, t.team_long_name,
	  CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
		   WHEN m.home_goal < m.away_goal THEN 'MU Loss' 
  		   ELSE 'Tie' END AS outcome
  FROM match AS m
  LEFT JOIN team AS t ON m.awayteam_id = t.team_api_id)
-- Select team names, the date and goals
SELECT DISTINCT
    m.date,
    home.team_long_name AS home_team,
    away.team_long_name AS away_team,
    m.home_goal,
    m.away_goal
-- Join the CTEs onto the match table
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
WHERE m.season = '2014/2015'
      AND (home.team_long_name = 'Manchester United' 
           OR away.team_long_name = 'Manchester United');
```

#### Add a window function

```
/* Set up the CTEs so that the home and away teams each have a name, ID, and score associated with them.
Select the date, home team name, away team name, home goal, and away goals scored in the main query.
Rank the matches and order by the difference in scores in descending order. */

-- Set up the home team CTE
WITH home as (
  SELECT m.id, t.team_long_name,
	  CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
		   WHEN m.home_goal < m.away_goal THEN 'MU Loss' 
  		   ELSE 'Tie' END AS outcome
  FROM match AS m
  LEFT JOIN team AS t ON m.hometeam_id = t.team_api_id),
-- Set up the away team CTE
away AS (
  SELECT m.id, t.team_long_name,
	  CASE WHEN m.home_goal > m.away_goal THEN 'MU Loss'
		   WHEN m.home_goal < m.away_goal THEN 'MU Win' 
  		   ELSE 'Tie' END AS outcome
  FROM match AS m
  LEFT JOIN team AS t ON m.awayteam_id = t.team_api_id)
-- Select columns and and rank the matches by date
SELECT DISTINCT
    date,
    home.team_long_name AS home_team,
    away.team_long_name AS away_team,
    m.home_goal, m.away_goal,
    RANK() OVER(ORDER BY ABS(home_goal - away_goal) DESC) as match_rank
-- Join the CTEs onto the match table
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
WHERE m.season = '2014/2015'
      AND ((home.team_long_name = 'Manchester United' AND home.outcome = 'MU Loss')
      OR (away.team_long_name = 'Manchester United' AND away.outcome = 'MU Loss'));
```

