/* Subquery inside select
In this exercise, you'll see how some queries can be written using either a join or a subquery.
You have seen previously how to use GROUP BY with aggregate functions and an inner join to get summarized information from multiple tables.
The code given in the first query selects the top nine countries in terms of number of cities appearing in the cities table. Recall that this corresponds to the most populous cities in the world. 
Your task will be to convert the second query to get the same result as the provided code. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* 1/2 Submit the code to view the result of the provided query. */
SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;

/* 
SELECT ___ AS ___,
  (SELECT ___
   FROM ___
   WHERE countries.code = cities.country_code) AS cities_num
FROM ___
ORDER BY ___ ___, ___
LIMIT 9;
*/

/* 2/2 Convert the GROUP BY code to use a subquery inside of SELECT by filling in the blanks to get a result that matches the one given using the GROUP BY code in the first query.
Again, sort the result by cities_num descending and then by country ascending. */ 
/*
SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;
*/

SELECT countries.name AS country,
  -- Subquery
  (SELECT count(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
