-- Sorting multiple columns
-- ORDER BY can also be used to sort on multiple columns. It will sort by the first column specified, then sort by the next, then the next, and so on. For example,

-- SELECT birthdate, name
-- FROM people
-- ORDER BY birthdate, name;
-- sorts on birth dates first (oldest to newest) and then sorts on the names in alphabetical order. The order of columns is important!

-- Try using ORDER BY to sort multiple columns! Remember, to specify multiple columns you separate the column names with a comma.

-- 1/4 Get the birth date and name of people in the people table, in order of when they were born and alphabetically by name.
SELECT birthdate, name 
FROM people
ORDER BY birthdate, name;

--  2/4 Get the release year, duration, and title of films ordered by their release year and duration.
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;

-- 3/4 Get certifications, release years, and titles of films ordered by certification (alphabetically) and release year.
SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year;

-- 4/4 Get the names and birthdates of people ordered by name and birth date.
SELECT name, birthdate
FROM people
ORDER BY name, birthdate;