-- NULL and IS NULL
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