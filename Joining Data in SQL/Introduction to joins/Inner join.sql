-- Inner join
-- Although this courses focuses on PostgreSQL, you'll find that these joins and the material here applies to different forms of SQL as well.

-- Throughout this course, you'll be working with the countries database containing information about the most populous world cities as well as country-level economic data, population data, and geographic data. This countries database also contains information on languages spoken in each country.

-- You can see the different tables in this database by clicking on the corresponding tabs. Click through them to get a sense for the types of data that each table contains before you continue with the course! Take note of the fields that appear to be shared across the tables.

-- Recall from the video the basic syntax for an INNER JOIN, here including all columns in both tables:

-- SELECT *
-- FROM left_table
-- INNER JOIN right_table
-- ON left_table.id = right_table.id;
-- You'll start off with a SELECT statement and then build up to an INNER JOIN with the cities and countries tables. Let's get to it!

-- Tables:
-- countries:  | code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
-- populations: | pop_id | country_code | year | fertility_rate | life_expectancy | size |
-- lang: | lang_id | code | name | percent | official |
-- economies: | econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
-- cities: | name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 

-- 1/3 Begin by selecting all columns from the cities table.
SELECT * 
FROM cities

-- 2/3 Inner join the cities table on the left to the countries table on the right, keeping all of the fields in both tables.
-- You should match the tables on the country_code field in cities and the code field in countries.
-- Do not alias your tables here or in the next step. Using cities and countries is fine for now.
SELECT * 
FROM cities
  -- Inner join to countries
  INNER JOIN countries
    -- Match on the country codes
    ON cities.country_code = countries.code;

-- 3/3 Modify the SELECT statement to keep only the name of the city, the name of the country, and the name of the region the country resides in.
-- Alias the name of the city AS city and the name of the country AS country.
-- Select name fields (with alias) and region 
SELECT cities.name as city, countries.name as country, countries.region
FROM cities
  INNER JOIN countries
    ON cities.country_code = countries.code;