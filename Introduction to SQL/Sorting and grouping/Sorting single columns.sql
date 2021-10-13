-- Sorting single columns

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

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
