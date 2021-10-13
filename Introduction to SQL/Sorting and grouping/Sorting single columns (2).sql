-- Sorting single columns (2)

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

-- 1/3 Get the title of films released in 2000 or 2012, in the order they were released.
SELECT title
FROM films
WHERE release_year IN (2000, 2012)
ORDER BY release_year;

-- 2/3 Get all details for all films except those released in 2015 and order them by duration.
SELECT *
FROM films
WHERE release_year != 2015
ORDER BY duration;

-- 3/3 Get the title and gross earnings for movies which begin with the letter 'M' and order the results alphabetically.
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;