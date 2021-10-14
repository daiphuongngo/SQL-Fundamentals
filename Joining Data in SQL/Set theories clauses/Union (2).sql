/* Union (2)
UNION can also be used to determine all occurrences of a field across multiple tables. Try out this exercise with no starter code. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* Determine all (non-duplicated) country codes in either the cities or the currencies table. The result should be a table with only one field called country_code.
Sort by country_code in alphabetical order.*/
-- Select field
SELECT country_code
  -- From cities
  FROM cities 
	-- Set theory clause
	UNION 
-- Select field
SELECT code 
  -- From currencies
  FROM currencies 
-- Order by country_code
ORDER BY country_code;
