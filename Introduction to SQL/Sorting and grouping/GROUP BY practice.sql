-- GROUP BY practice
-- As you've just seen, combining aggregate functions with GROUP BY can yield some powerful results!
-- A word of warning: SQL will return an error if you try to SELECT a field that is not in your GROUP BY clause without using it to calculate some kind of value about the entire group.

-- Note that you can combine GROUP BY with ORDER BY to group your results, calculate something about them, and then order your results. For example,

-- SELECT sex, count(*)
-- FROM employees
-- GROUP BY sex
-- ORDER BY count DESC;
-- might return something like

-- sex	count
-- female	19
-- male	15

-- because there are more females at our company than males. Note also that ORDER BY always goes after GROUP BY. Let's try some exercises!

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

-- 1/4 Get the release year and count of films released in each year.
SELECT release_year, count(*)
FROM films
GROUP BY release_year;

-- 2/4 Get the release year and average duration of all films, grouped by release year.
SELECT release_year, AVG(duration)
FROM films
GROUP BY release_year;

-- 3/4 Get the release year and largest budget for all films, grouped by release year.
SELECT release_year, MAX(budget)
FROM films
GROUP BY release_year;

-- 4/4 Get the IMDB score and count of film reviews grouped by IMDB score in the reviews table.
SELECT imdb_score, count(*)
FROM reviews
GROUP BY imdb_score;
