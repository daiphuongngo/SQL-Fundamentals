-- Practice with COUNT
-- As you've seen, COUNT(*) tells you how many rows are in a table. However, if you want to count the number of non-missing values in a particular column, you can call COUNT() on just that column.

-- For example, to count the number of birth dates present in the people table:

-- SELECT COUNT(birthdate)
-- FROM people;
-- It's also common to combine COUNT() with DISTINCT to count the number of distinct values in a column.

-- For example, this query counts the number of distinct birth dates contained in the people table:

-- SELECT COUNT(DISTINCT birthdate)
-- FROM people;

-- Tables' columns:
-- people: | id	| name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |

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
