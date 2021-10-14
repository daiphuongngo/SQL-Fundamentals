/* COUNT using CASE WHEN
Do the number of soccer matches played in a given European country differ across seasons? We will use the European Soccer Database to answer this question.
You will examine the number of matches played in 3 seasons within each country listed in the database. This is much easier to explore with each season's matches in separate columns. 
Using the country and unfiltered match table, you will count the number of matches played in each country during the 2012/2013, 2013/2014, and 2014/2015 match seasons.
 */

-- Tables:
-- teams_germany: | id | team_api_id | team_long_name | team_short_name |
-- matches_germany: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_spain: | id | team_api_id | team_long_name | team_short_name |
-- matches_spain: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_italy: | id | team_api_id | team_long_name | team_short_name |
-- matches_italy: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |

/* 1/2 Create a CASE statement that identifies the id of matches played in the 2012/2013 season. Specify that you want ELSE values to be NULL.
Wrap the CASE statement in a COUNT function and group the query by the country alias.

Hint
Your CASE statement should count the id of matches in the season you filtered for, and all other values should be NULL by default.
Include a GROUP BY clause in any query with an aggregate function -- including CASE statements. */

SELECT 
	c.name AS country,
    -- Count games from the 2012/2013 season
	COUNT(CASE WHEN m.season = '2012/2013' 
        	THEN m.id ELSE NULL END) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY name;

/* 2/2 Create 3 CASE WHEN statements counting the matches played in each country across the 3 seasons.
END your CASE statement without an ELSE clause. */

SELECT 
	c.name AS country,
    -- Count matches in each of the 3 seasons
	COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
	COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
	COUNT(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY name;
