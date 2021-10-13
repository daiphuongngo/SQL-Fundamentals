-- It's AS simple AS aliasing
-- You may have noticed in the first exercise of this chapter that the column name of your result was just the name of the function you used. For example,

-- SELECT MAX(budget)
-- FROM films;
-- gives you a result with one column, named max. But what if you use two functions like this?

-- SELECT MAX(budget), MAX(duration)
-- FROM films;
-- Well, then you'd have two columns named max, which isn't very useful!

-- To avoid situations like this, SQL allows you to do something called aliasing. Aliasing simply means you assign a temporary name to something. To alias, you use the AS keyword, which you've already seen earlier in this course.

-- For example, in the above example we could use aliases to make the result clearer:

-- SELECT MAX(budget) AS max_budget,
       -- MAX(duration) AS max_duration
-- FROM films;
-- Aliases are helpful for making results more readable!

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

-- 1/3 Get the title and net profit (the amount a film grossed, minus its budget) for all films. Alias the net profit as net_profit.
SELECT title, (gross - budget) AS net_profit
FROM films;

-- 2/3 Get the title and duration in hours for all films. The duration is in minutes, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as duration_hours.
SELECT title, (duration/60.) AS duration_hours
FROM films;

-- 3/3 Get the average duration in hours for all films, aliased as avg_duration_hours.
SELECT avg(duration)/60.0 AS avg_duration_hours
FROM films;

