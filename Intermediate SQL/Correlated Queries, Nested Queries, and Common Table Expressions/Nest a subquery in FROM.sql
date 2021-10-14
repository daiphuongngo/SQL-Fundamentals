/* Nest a subquery in FROM
What's the average number of matches per season where a team scored 5 or more goals? How does this differ by country?
Let's use a nested, correlated subquery to perform this operation. In the real world, you will probably find that nesting multiple subqueries is a task you don't have to perform often. 
In some cases, however, you may find yourself struggling to properly group by the column you want, 
or to calculate information requiring multiple mathematical transformations (i.e., an AVG of a COUNT).
Nesting subqueries and performing your transformations one step at a time, adding it to a subquery, and then performing the next set of transformations is often the easiest way to yield accurate information about your data. Let's get to it!
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
-- league: | id | country_id | name |

/* 1/3 Generate a list of matches where at least one team scored 5 or more goals. */
-- Select matches where a team scored 5+ goals
SELECT
	country_id,
    season,
	id
FROM match
WHERE home_goal >= 5 OR away_goal >= 5;

/* 2/3 Turn the query from the previous step into a subquery in the FROM statement.
COUNT the match ids generated in the previous step, and group the query by country_id and season.
Hint
Place the subquery inside parentheses and give it an alias using AS!
All you need to do after that is COUNT the id column and GROUP BY the two non-aggregate columns. */
-- Count match ids
SELECT
    country_id,
    season,
    COUNT(id) AS matches
-- Set up and alias the subquery
FROM (
	SELECT
    	country_id,
    	season,
    	id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) 
    AS subquery
-- Group by country_id and season
GROUP BY country_id, season;

/* 3/3 Finally, declare the same query from step 2 as a subquery in FROM with the alias outer_s.
Left join it to the country table using the outer query's country_id column.
Calculate an AVG of high scoring matches per country in the main query.

Hint
Remember to enclose the subquery in parentheses before its final alias, but after the WHERE statement!
The outermost subquery in SELECT should include a WHERE clause connecting outer_s to country. */
SELECT
	c.name AS country,
    -- Calculate the average matches per season
	AVG(c.id) AS avg_seasonal_high_scores
FROM country AS c
-- Left join outer_s to country
LEFT JOIN (
  SELECT country_id, season,
         COUNT(id) AS matches
  FROM (
    SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
  -- Close parentheses and alias the subquery
  GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;