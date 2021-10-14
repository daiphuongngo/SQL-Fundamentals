/* Subquery inside from
The last type of subquery you will work with is one inside of FROM.
You will use this to determine the number of languages spoken for each country, identified by the country's local name! 
(Note this may be different than the name field and is stored in the local_name field.) */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* 1/2 Begin by determining for each country code how many languages are listed in the languages table using SELECT, FROM, and GROUP BY.
Alias the aggregated field as lang_num. */
-- Select fields (with aliases)
SELECT code, count(languages) AS lang_num
  -- From languages
  FROM languages
-- Group by code
GROUP BY code;

/* 2/2 Include the previous query (aliased as subquery) as a subquery in the FROM clause of a new query.
Select the local name of the country from countries.
Also, select lang_num from subquery.
Make sure to use WHERE appropriately to match code in countries and in subquery.
Sort by lang_num in descending order. */
-- Select fields
SELECT local_code, name
  -- From countries
  FROM countries,
  	-- Subquery (alias as subquery)
  	(SELECT code, COUNT(*) AS lang_num
  	 FROM languages
  	 GROUP BY code) AS subquery
  -- Where codes match
  WHERE countries.code = subquery.code
-- Order by descending number of languages
ORDER BY lang_num desc;