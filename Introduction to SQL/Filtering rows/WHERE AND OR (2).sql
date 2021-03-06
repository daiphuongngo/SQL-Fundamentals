-- WHERE AND OR (2)
-- You now know how to select rows that meet some but not all conditions by combining AND and OR.

-- For example, the following query selects all films that were released in 1994 or 1995 which had a rating of PG or R.

-- SELECT title
-- FROM films
-- WHERE (release_year = 1994 OR release_year = 1995)
-- AND (certification = 'PG' OR certification = 'R');
-- Now you'll write a query to get the title and release year of films released in the 90s which were in French or Spanish and which took in more than $2M gross.

-- Tables' columns:
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |

-- 1/3 Get the title and release year for films released in the 90s.
SELECT title, release_year
FROM films
WHERE release_year >= 1990 AND release_year < 2000;

-- 2/3 Now, build on your query to filter the records to only include French or Spanish language films.
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
and (language = 'French' or language = 'Spanish');

-- 3/3 Finally, restrict the query to only return films that took in more than $2M gross.
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
and gross > 2000000;
