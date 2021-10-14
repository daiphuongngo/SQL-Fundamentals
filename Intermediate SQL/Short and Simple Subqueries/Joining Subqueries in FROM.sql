/* Joining Subqueries in FROM
The match table in the European Soccer Database does not contain country or team names. 
You can get this information by joining it to the country table, and use this to aggregate information, such as the number of matches played in each country.
If you're interested in filtering data from one of these tables, you can also create a subquery from one of the tables, and then join it to an existing table in the database. 
A subquery in FROM is an effective way of answering detailed questions that requires filtering or transforming data before including it in your final results.
Your goal in this exercise is to generate a subquery using the match table, and then join that subquery to the country table to calculate information 
about matches with 10 or more goals in total!
 */

-- Tables:
-- teams_germany: | id | team_api_id | team_long_name | team_short_name |
-- matches_germany: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_spain: | id | team_api_id | team_long_name | team_short_name |
-- matches_spain: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_italy: | id | team_api_id | team_long_name | team_short_name |
-- matches_italy: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- matches_2013_2014: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- match: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- team: | id | team_api_id | team_long_name | team_short_name |
-- country: | id | name |

/* 1/2 Create the subquery to be used in the next step, which selects the country ID and match ID (id) from the match table.
Filter the query for matches with greater than or equal to 10 goals. */

SELECT 
	-- Select the country ID and match ID
	country_id, 
    id 
FROM match
-- Filter for matches with 10 or more goals in total
WHERE (home_goal + away_goal) >= 10;

/* 2/2 Construct a subquery that selects only matches with 10 or more total goals.
Inner join the subquery onto country in the main query.
Select name from country and count the id column from match. */

SELECT
	-- Select country name and the count match IDs
    c.name AS country_name,
    COUNT(c.id) AS matches
FROM country AS c
-- Inner join the subquery onto country
-- Select the country id and match id columns
INNER JOIN (SELECT country_id, id 
           FROM match
           -- Filter the subquery by matches with 10+ goals
           WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;