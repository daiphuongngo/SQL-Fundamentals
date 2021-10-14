/* Subquery challenge
Let's test your understanding of the subqueries with a challenge problem! Use a subquery to get 2015 economic data for countries that do not have
gov_form of 'Constitutional Monarchy' or
'Republic' in their gov_form.
Here, gov_form stands for the form of the government for each country. Review the different entries for gov_form in the countries table. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* Select the country code, inflation rate, and unemployment rate.
Order by inflation rate ascending.
Do not use table aliasing in this exercise. */
-- Select fields
SELECT code, inflation_rate, unemployment_rate
  -- From economies
  FROM economies
  -- Where year is 2015 and code is not in
  WHERE year = 2015 AND code NOT IN
  	-- Subquery
  	(SELECT code
  	 FROM countries
  	 WHERE (gov_form = 'Constitutional Monarchy' OR gov_form LIKE '%Republic'))
-- Order by inflation rate
ORDER BY inflation_rate ASC;
