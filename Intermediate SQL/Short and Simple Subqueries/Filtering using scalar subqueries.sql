/* Filtering using scalar subqueries
Subqueries are incredibly powerful for performing complex filters and transformations. 
You can filter data based on single, scalar values using a subquery in ways you cannot by using WHERE statements or joins. Subqueries can also be used for more advanced manipulation of your data set. 
You will likely encounter subqueries in any real-world setting that uses relational databases.
In this exercise, you will generate a list of matches where the total goals scored (for both teams in total) is more than 3 times the average for games in the matches_2013_2014 table, which includes all games played in the 2013/2014 season.
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

/* 1/2 Calculate triple the average home + away goals scored across all matches. This will become your subquery in the next step. 
Note that this column does not have an alias, so it will be called ?column? in your results. */

-- Select the average of home + away goals, multiplied by 3
SELECT 
	3 * AVG(home_goal + away_goal)
FROM matches_2013_2014;

/* 2/2 Select the date, home goals, and away goals in the main query.
Filter the main query for matches where the total goals scored exceed the value in the subquery. */

SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 