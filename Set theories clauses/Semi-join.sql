/* Semi-join
You are now going to use the concept of a semi-join to identify languages spoken in the Middle East. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* 1/3 Begin by selecting all country codes in the Middle East as a single field result using SELECT, FROM, and WHERE. */
-- Select code
SELECT code
  -- From countries
  FROM countries
-- Where region is Middle East
WHERE region = 'Middle East';


/* 2/3 Below the commented code, select only unique languages by name appearing in the languages table.
Order the resulting single field table by name in ascending order. */
-- Query from step 1:
/*
SELECT code
  FROM countries
WHERE region = 'Middle East';
*/

-- Select field
SELECT distinct languages.name
  -- From languages
  FROM languages
-- Order by name
ORDER BY name ASC;

/* 3/3 Combine the previous two queries into one query by adding a WHERE IN statement to the SELECT DISTINCT query to determine the unique languages spoken in the Middle East.
Order the result by name in ascending order. */
-- Query from step 2
SELECT DISTINCT name
  FROM languages
-- Where in statement
WHERE name IN
  -- Query from step 1
  -- Subquery
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
-- Order by name
ORDER BY name ASC;