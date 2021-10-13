-- Aggregate functions practice

-- Tables' columns:
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |

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
