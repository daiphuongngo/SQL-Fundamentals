/* Get team names with a subquery
Let's solve a problem we've encountered a few times in this course so far -- How do you get both the home and away team names into one final query result?

Out of the 4 techniques we just discussed, this can be performed using subqueries, correlated subqueries, and CTEs. 
Let's practice creating similar result sets using each of these 3 methods over the next 3 exercises, starting with subqueries in FROM.
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

/* 1/2 Create a query that left joins team to match in order to get the identity of the home team. This becomes the subquery in the next step. */
SELECT 
	m.id, 
    t.team_long_name AS hometeam
-- Left join team to match
FROM match AS m
LEFT JOIN team as t
ON m.hometeam_id = team_api_id;

/* 2/2 Add a second subquery to the FROM statement to get the away team name, changing only the hometeam_id. 
Left join both subqueries to the match table on the id column.
Warning: if your code is timing out, you have probably made a mistake in the JOIN and tried to join on the wrong fields which caused the table to be too big! 
Read the provided code and comments carefully, and check your ON conditions! */

SELECT
	m.date,
    -- Get the home and away team names
    home.hometeam,
    away.awayteam,
    m.home_goal,
    m.away_goal
FROM match AS m

-- Join the home subquery to the match table
LEFT JOIN (
  SELECT match.id, team.team_long_name AS hometeam
  FROM match
  LEFT JOIN team
  ON match.hometeam_id = team.team_api_id) AS home
ON home.id = m.id

-- Join the away subquery to the match table
LEFT JOIN (
  SELECT match.id, team.team_long_name AS awayteam
  FROM match
  LEFT JOIN team
  -- Get the away team ID in the subquery
  ON match.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;