/* Outer challenge
Now that you're fully equipped to use OUTER JOINs, try a challenge problem to test your knowledge!
In terms of life expectancy for 2010, determine the names of the lowest five countries and their regions. */ 

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* Select country name AS country, region, and life expectancy AS life_exp.
Make sure to use LEFT JOIN, WHERE, ORDER BY, and LIMIT. */
-- Select fields
SELECT c.name AS country, region, p.life_expectancy AS life_exp 
-- From countries (alias as c)
FROM countries AS c
  -- Join to populations (alias as p)
  LEFT JOIN populations AS p 
    -- Match on country code
    ON c.code = p.country_code
-- Focus on 2010
WHERE year = 2010 
-- Order by life_exp
ORDER BY life_exp 
-- Limit to 5 records
LIMIT 5;
