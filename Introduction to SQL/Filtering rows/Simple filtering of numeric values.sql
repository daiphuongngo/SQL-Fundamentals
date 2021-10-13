-- Simple filtering of numeric values
-- As you learned in the previous exercise, the WHERE clause can also be used to filter numeric records, such as years or ages.

-- For example, the following query selects all details for films with a budget over ten thousand dollars:

-- SELECT *
-- FROM films
-- WHERE budget > 10000;

-- Tables' columns:
-- films: | id | title | release_year | country	duration | language | certification | gross | budget

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