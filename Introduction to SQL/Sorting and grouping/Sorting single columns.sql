-- Sorting single columns
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
