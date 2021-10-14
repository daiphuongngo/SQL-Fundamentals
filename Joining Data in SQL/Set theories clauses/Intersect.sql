/* Intersect
UNION ALL will extract all records from two tables, while INTERSECT will only return records that both tables have in common. In this exercise, you will create a similar query as before, 
however, this time you will look at the records in common for country code and year for the economies and populations tables.
Note the number of records from the result of this query compared to the similar UNION ALL query result of 814 records. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* Use INTERSECT to determine the records in common for country code and year for the economies and populations tables.
Again, order by code and then by year, both in ascending order. */
-- Select fields
SELECT code, year
  -- From economies
  FROM economies 
	-- Set theory clause
	INTERSECT 
-- Select fields
SELECT country_code, year
  -- From populations
  FROM populations
-- Order by code and year
ORDER BY code, year;
