-- A taste of things to come
-- Congrats on making it to the end of the course! By now you should have a good understanding of the basics of SQL.

-- There's one more concept we're going to introduce. You may have noticed that all your results so far have been from just one table, e.g., films or people.

-- In the real world however, you will often want to query multiple tables. For example, what if you want to see the IMDB score for a particular movie?

-- In this case, you'd want to get the ID of the movie from the films table and then use it to get IMDB information from the reviews table. In SQL, this concept is known as a join, and a basic join is shown in the editor to the right.

-- The query in the editor gets the IMDB score for the film To Kill a Mockingbird! Cool.

-- Tables' columns:
-- people: | idb | name | birthdate | deathdate |
-- films: | id | title | release_year | country	duration | language | certification | gross | budget |
-- reviews: | id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
-- roles: | id | film_id | person_id | role |

-- 1/2 Submit the code in the editor and inspect the results.
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';

-- 2/2 What is the IMDB score for the film To Kill a Mockingbird? 
-- 8.4