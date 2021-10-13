-- All together now
-- Time to practice using ORDER BY, GROUP BY and HAVING together.

-- Now you're going to write a query that returns the average budget and average gross earnings for films in each year after 1990, if the average budget is greater than $60 million.

-- This is going to be a big query, but you can handle it!

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

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
