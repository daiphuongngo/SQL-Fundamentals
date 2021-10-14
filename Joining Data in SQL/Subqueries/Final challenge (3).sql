/* Final challenge (3)
Welcome to the last challenge problem. By now you're a query warrior! Remember that these challenges are designed to take you to the limit to solidify your SQL knowledge! Take a deep breath and solve this step-by-step.
You are now tasked with determining the top 10 capital cities in Europe and the Americas in terms of a calculated percentage using city_proper_pop and metroarea_pop in cities.
Do not use table aliasing in this exercise. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* Select the city name, country code, city proper population, and metro area population.
Calculate the percentage of metro area population composed of city proper population for each city in cities, aliased as city_perc.
Focus only on capital cities in Europe and the Americas in a subquery.
Make sure to exclude records with missing data on metro area population.
Order the result by city_perc descending.
Then determine the top 10 capital cities in Europe and the Americas in terms of this city_perc percentage. 
Hint */
-- Select fields
SELECT ___, ___, ___, ___,  
      -- Calculate city_perc
      ___ / ___ * ___ AS ___
  -- From appropriate table
  FROM ___
  -- Where 
  WHERE ___ IN
    -- Subquery
    (SELECT capital
     FROM ___
     WHERE (___ = ___
        OR ___ LIKE ___))
       AND ___ IS ___ ___
-- Order appropriately
ORDER BY ___ ___
-- Limit amount
___ ___;

-- Select fields
SELECT name, country_code, city_proper_pop, metroarea_pop,
	  -- Calculate city_perc
      city_proper_pop / metroarea_pop * 100 AS city_perc
  -- From appropriate table    
  FROM cities
  -- Where
  WHERE name IN
    -- Subquery
    (SELECT capital
     FROM countries
     WHERE (continent = 'Europe'
        OR continent LIKE '%America'))
       AND metroarea_pop IS NOT NULL
-- Order appropriately
ORDER BY city_perc DESC
-- Limit amount
LIMIT 10;
