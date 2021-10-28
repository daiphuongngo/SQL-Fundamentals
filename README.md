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
```

#### Inner join (2)

```
```

#### Inner join (3)

```
```

#### Review inner join using on

```
```

#### Inner join with using

```
```

#### Self-join

```
```

#### Case when and then

```
```

#### Inner challenge

```
```

### 2/ Outer joins and cross joins

#### Left Join

```
```

#### Left join (2)

```
```

#### Left join (3)

```
```

#### Right join

```
```

#### Full join

```
```

#### Full join (2)

```
```

#### Full join (3)

```
```

```
```

#### Review outer joins

```
```

#### A table of two cities

```
```

#### Outer challenge

```
```

### 3/ Set theory clauses

#### Union

```
```

#### Union (2)

```
```

#### Union all

```
```

#### Intersect

```
```

#### Intersect (2)

```
```

#### Except

```
```

#### Except (2)

```
```

#### Semi-join

```
```

#### Diagnosing problems using anti-join

```
```

#### Set theory challenge

```
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

