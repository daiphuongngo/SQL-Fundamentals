# SQL-Fundamentals

This is a repository containing different levels of the SQL Fundamentals's solutions from DataCamp. 
It is surely very fun to practice them often and helpful to understand and write SQL queries from basic to intermediate and advanced levels.

I have splitted this repository into several folders as below:

## Introduction to SQL

### Dataset: IMDb Film 

- people: 

| idb | name | birthdate | deathdate |
|-|-|-|-|

- films: 

| id | title | release_year | country	duration | language | certification | gross | budget |
|-|-|-|-|-|-|-|-|

- reviews:

| id | film_id | num_user | num_critic | imdb_score | num_votes | facebook_likes |
|-|-|-|-|-|-|-|

- roles: 

| id | film_id | person_id | role |
|-|-|-|-|

### 1/Selecting columns

Onboarding | Errors

Onboarding | Multi-step Exercises

SELECTing single columns

SELECTing multiple columns

SELECT DISTINCT

Practice with COUNT

### 2/ Filtering rows

Simple filtering of numeric values

Simple filtering of text

WHERE AND

WHERE AND OR (2)

BETWEEN (2)

WHERE IN

NULL and IS NULL

LIKE and NOT LIKE

### 3/ Aggregate Functions

Aggregate functions practice

Combining aggregate functions with WHERE

It's AS simple AS aliasing

Even more aliasing

### 4/ Sorting and grouping

Sorting single columns

Sorting single columns (2)

Sorting single columns (DESC)

Sorting multiple columns

GROUP BY practice

GROUP BY practice (2)

All together now

All together now (2)

A taste of things to come


## Joining Data in SQL

### Dataset:

- countries_plus: 

| name |	continent |	code | surface_area | geosize_group |
|-|-|-|-|-|

- countries:  

| code | name | continent | region | surface_area | indep_year | local_name | gov_form | capital | cap_long | cap_lat |
|-|-|-|-|-|-|-|-|-|-|-|

- populations: 

| pop_id | country_code | year | fertility_rate | life_expectancy | size |
|-|-|-|-|-|-|

- languages: 

| lang_id | code | name | percent | official |
|-|-|-|-|-|

- economies: 

| econ_id | code | year | income_group | gdp_percapita | gross_savings | inflation_rate | total_investment | unemployment_rate | exports | imports |
|-|-|-|-|-|-|-|-|-|-|-|

- cities: 

| name | country_code | city_proper_pop | metroarea_pop | urbanarea_pop | 
|-|-|-|-|-|

- currencies: 

| curr_id | code | basic_unit | curr_code | frac_unit | frac_perbasic |
|-|-|-|-|-|-|

### 1/ Introduction to joins

Inner join

Inner join (2)

Inner join (3)

Review inner join using on

Inner join with using

Self-join

Case when and then

Inner challenge

### 2/ Outer joins and cross joins

Left Join

Left join (2)

Left join (3)

Right join

Full join

Full join (2)

Full join (3)

Review outer joins

A table of two cities

Outer challenge

### 3/ Set theory clauses

Union

Union (2)

Union all

Intersect

Intersect (2)

Except

Except (2)

Semi-join

Diagnosing problems using anti-join

Set theory challenge

### 4/ Subqueries

Subquery inside where

Subquery inside where (2)

Subquery inside select

Subquery inside from

Advanced subquery

Subquery challenge

Subquery review

Final challenge

Final challenge (2)

Final challenge (3)

## Intermediate SQL

### Dataset:

- teams_germany: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- matches_germany: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- teams_spain: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- matches_spain: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- teams_italy: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- matches_italy: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- matches_2013_2014: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- match: 

| id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
|-|-|-|-|-|-|-|-|-|

- team: 

| id | team_api_id | team_long_name | team_short_name |
|-|-|-|-|

- league: 

| id | country_id | name |
|-|-|-|

- country: 

| id | country | 
|-|-|

### 1/ We'll take the CASE

Basic CASE statements

CASE statements comparing column values

CASE statements comparing two column values part 2

In CASE of rivalry

Filtering your CASE statement

COUNT using CASE WHEN

COUNT and CASE WHEN with multiple conditions

Calculating percent with CASE and AVG

### 2/ Short and Simple Subqueries

Filtering using scalar subqueries

Filtering using a subquery with a list

Filtering with more complex subquery conditions

Joining Subqueries in FROM

Building on Subqueries in FROM

Add a subquery to the SELECT clause

Subqueries in Select for Calculations

Subqueries everywhere! And best practices!

ALL the subqueries EVERYWHERE

Add a subquery in FROM

Add a subquery in SELECT

### 3/ Correlated Queries, Nested Queries, and Common Table Expressions

Basic Correlated Subqueries

Correlated subquery with multiple conditions

Nested subqueries

Nested simple subqueries

Nest a subquery in FROM

Clean up with CTEs

Organizing with CTEs

CTEs with nested subqueries

Get team names with a subquery

Get team names with correlated subqueries

Get team names with CTEs

Which technique to use?

### 4/ Window Functions

The match is OVER

What's OVER here?

Flip OVER your results

PARTITION BY a column

PARTITION BY multiple columns

Slide to the left

Slide to the right

Setting up the home team CTE

Setting up the away team CTE

Putting the CTEs together

Add a window function
