-- Sorting single columns (DESC)
-- To order results in descending order, you can put the keyword DESC after your ORDER BY. For example, to get all the names in the people table, in reverse alphabetical order:

-- SELECT name
-- FROM people
-- ORDER BY name DESC;

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

-- 1/3 Get the IMDB score and film ID for every film from the reviews table, sorted from highest to lowest score.
SELECT imdb_score, 	film_id
FROM reviews
ORDER BY imdb_score DESC;

-- 2/3 Get the title for every film, in reverse order.
SELECT title
FROM films
ORDER BY title DESC;

-- 3/3 Get the title and duration for every film, in order of longest duration to shortest.
SELECT title, duration
FROM films
ORDER BY duration DESC;