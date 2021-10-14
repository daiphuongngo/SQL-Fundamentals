/* You'll now try to figure out which countries had high average life expectancies (at the country level) in 2015. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* 1/2 Begin by calculating the average life expectancy across all countries for 2015. */
-- Select average life_expectancy
SELECT avg(life_expectancy)
  -- From populations
  FROM populations
-- Where year is 2015
WHERE year = 2015;

/* 2/2 Recall that you can use SQL to do calculations for you. Suppose we wanted only records that were above 1.15 * 100 in terms of life expectancy for 2015: */
SELECT *
  FROM populations
WHERE life_expectancy > 1.15 * 100
  AND year = 2015;

/* Select all fields from populations with records corresponding to larger than 1.15 times the average you calculated in the first task for 2015. In other words, change the 100 in the example above with a subquery.
Hint */
SELECT ___
  FROM ___
WHERE ___ >
  ___ * (SELECT ___(___)
   FROM ___
   WHERE ___ = ___) AND
  ___ = ___;

-- Select fields
SELECT *
  -- From populations
  FROM populations
-- Where life_expectancy is greater than
WHERE life_expectancy > 
  -- 1.15 * subquery
  1.15 * (SELECT avg(life_expectancy)
          FROM populations
          WHERE year = 2015) AND
          year = 2015;