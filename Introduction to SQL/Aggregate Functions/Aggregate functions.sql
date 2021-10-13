-- Aggregate functions
-- Often, you will want to perform some calculation on the data in a database. SQL provides a few functions, called aggregate functions, to help you out with this.

-- For example,

-- SELECT AVG(budget)
-- FROM films;
-- gives you the average value from the budget column of the films table. Similarly, the MAX() function returns the highest budget:

-- SELECT MAX(budget)
-- FROM films;
-- The SUM() function returns the result of adding up the numeric values in a column:

-- SELECT SUM(budget)
-- FROM films;
-- You can probably guess what the MIN() function does! Now it's your turn to try out some SQL functions.

-- Tables' columns:
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |

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

