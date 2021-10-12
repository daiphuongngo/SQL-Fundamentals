-- Combining aggregate functions with WHERE
-- Aggregate functions can be combined with the WHERE clause to gain further insights from your data.

-- For example, to get the total budget of movies made in the year 2010 or later:

-- SELECT SUM(budget)
-- FROM films
-- WHERE release_year >= 2010;

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