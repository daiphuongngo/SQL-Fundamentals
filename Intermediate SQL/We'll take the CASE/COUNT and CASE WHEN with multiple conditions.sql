/* COUNT and CASE WHEN with multiple conditions
In R or Python, you have the ability to calculate a SUM of logical values (i.e., TRUE/FALSE) directly. In SQL, you have to convert these values into 1 and 0 before calculating a sum. This can be done using a CASE statement.
There's one key difference when using SUM to aggregate logical values compared to using COUNT in the previous exercise --
Your goal here is to use the country and match table to determine the total number of matches won by the home team in each country during the 2012/2013, 2013/2014, and 2014/2015 seasons.
 */

-- Tables:
-- teams_germany: | id | team_api_id | team_long_name | team_short_name |
-- matches_germany: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_spain: | id | team_api_id | team_long_name | team_short_name |
-- matches_spain: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_italy: | id | team_api_id | team_long_name | team_short_name |
-- matches_italy: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |

/*Create 3 CASE statements to "count" matches in the '2012/2013', '2013/2014', and '2014/2015' seasons, respectively.
Have each CASE statement return a 1 for every match you want to include, and a 0 for every match to exclude.
Wrap the CASE statement in a SUM to return the total matches played in each season.
Group the query by the country name alias. */

SELECT 
	c.name AS country,
    -- Sum the total records in each season where the home team won
	SUM(CASE WHEN m.season = '2012/2013' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2012_2013,
 	SUM(CASE WHEN m.season = '2013/2014' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY name;