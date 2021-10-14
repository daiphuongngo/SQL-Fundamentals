/*Building on Subqueries in FROM
In the previous exercise, you found that England, Netherlands, Germany and Spain were the only countries that had matches in the database where 10 or more goals were scored overall. 
Let's find out some more details about those matches -- when they were played, during which seasons, and how many of the goals were home versus away goals.
You'll notice that in this exercise, the table alias is excluded for every column selected in the main query. 
This is because the main query is extracting data from the subquery, which is treated as a single table.
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

/* Complete the subquery inside the FROM clause. Select the country name from the country table, along with the date, the home goal, the away goal, and the total goals columns from the match table.
Create a column in the subquery that adds home and away goals, called total_goals. This will be used to filter the main query.
Select the country, date, home goals, and away goals in the main query.
Filter the main query for games with 10 or more total goals. */

SELECT
	-- Select country, date, home, and away goals from the subquery
    country,
    date,
    home_goal,
    away_goal
FROM 
	-- Select country name, date, home_goal, away_goal, and total goals in the subquery
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subquery
-- Filter by total goals scored in the main query
WHERE total_goals >= 10;