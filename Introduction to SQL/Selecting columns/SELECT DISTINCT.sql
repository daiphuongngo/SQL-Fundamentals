-- SELECT DISTINCT
-- Often your results will include many duplicate values. If you want to select all the unique values from a column, you can use the DISTINCT keyword.

-- This might be useful if, for example, you're interested in knowing which languages are represented in the films table:

-- SELECT DISTINCT language
-- FROM films;

-- Tables' columns:
-- roles: | id	| film_id | person_id | role |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |

-- 1/3 Get all the unique countries represented in the films table.
SELECT DISTINCT country
FROM films;

-- 2/3 Get all the different film certifications from the films table.
SELECT DISTINCT certification
FROM films;

-- 3/3 Get the different types of film roles from the roles table.
SELECT DISTINCT role 
FROM roles;