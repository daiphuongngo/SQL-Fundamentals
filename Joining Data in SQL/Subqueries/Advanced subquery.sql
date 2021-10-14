/* Advanced subquery
You can also nest multiple subqueries to answer even more specific questions.

In this exercise, for each of the six continents listed in 2015, you'll identify which country had the maximum inflation rate, and how high it was, using multiple subqueries. 
The table result of your final query should look something like the following, where anything between < > will be filled in with appropriate values:
+------------+---------------+-------------------+
| name       | continent     | inflation_rate    |
|------------+---------------+-------------------|
| <country1> | North America | <max_inflation1>  |
| <country2> | Africa        | <max_inflation2>  |
| <country3> | Oceania       | <max_inflation3>  |
| <country4> | Europe        | <max_inflation4>  |
| <country5> | South America | <max_inflation5>  |
| <country6> | Asia          | <max_inflation6>  |
+------------+---------------+-------------------+

Again, there are multiple ways to get to this solution using only joins, but the focus here is on showing you an introduction into advanced subqueries. */

-- Tables:
-- countries_plus: | name |	continent |	code | surface_area | geosize_group |
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- languages: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
-- currencies: | curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |


/* 1/3 Create an INNER JOIN with countries on the left and economies on the right with USING, without aliasing your tables or columns.
Retrieve the country's name, continent, and inflation rate for 2015.
Hint */
SELECT ___, ___.___, ___, ___
  FROM ___
    ___ JOIN ___
    USING (___)
WHERE ___ = ___;

-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
  	-- Join to economies
  	INNER JOIN economies
    -- Match on code
    USING (code)
-- Where year is 2015
WHERE year = 2015;

/* 2/3 Select the maximum inflation rate in 2015 AS max_inf grouped by continent using the previous step's query as a subquery in the FROM clause.
Thus, in your subquery you should:
Create an inner join with countries on the left and economies on the right with USING (without aliasing your tables or columns).
Retrieve the country name, continent, and inflation rate for 2015.
Alias the subquery as subquery.
This will result in the six maximum inflation rates in 2015 for the six continents as one field table. Make sure to not include continent in the outer SELECT statement. */
-- Select the maximum inflation rate as max_inf
SELECT max(inflation_rate) AS max_inf
  -- Subquery using FROM (alias as subquery)
  FROM (
      SELECT name, continent, inflation_rate
      FROM countries
      INNER JOIN economies
      USING (code)
      WHERE year = 2015) AS subquery
-- Group by continent
GROUP BY continent;

/* 3/3 Now it's time to append your second query to your first query using AND and IN to obtain the name of the country, its continent, and the maximum inflation rate for each continent in 2015.
For the sake of practice, change all joining conditions to use ON instead of USING.
Hint
You need to expand the WHERE clause in your first query with AND to only find inflation rates that are IN your maximum inflation rates subquery.
You can join tables ON columns using table1.column1 = table2.column2. In this exercise, the column name common to both tables is code. */
-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
	-- Join to economies
	INNER JOIN economies
	-- Match on code
	ON countries.code = economies.code
  -- Where year is 2015
  WHERE year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code = economies.code
             WHERE year = 2015) AS subquery
      -- Group by continent
        GROUP BY continent);