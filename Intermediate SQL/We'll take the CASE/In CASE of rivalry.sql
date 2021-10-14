/* In CASE of rivalry
Barcelona and Real Madrid have been rival teams for more than 80 years. Matches between these two teams are given the name El Clásico (The Classic). In this exercise, you will query a list of matches played between these two rivals.
You will notice in Step 2 that when you have multiple logical conditions in a CASE statement, you may quickly end up with a large number of WHEN clauses to logically test every outcome you are interested in. It's important to make sure you don't accidentally exclude key information in your ELSE clause.
In this exercise, you will retrieve information about matches played between Barcelona (id = 8634) and Real Madrid (id = 8633). Note that the query you are provided with already identifies the Clásico matches using a filter in the WHERE clause.
 */

-- Tables:
-- teams_germany: | id | team_api_id | team_long_name | team_short_name |
-- matches_germany: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_spain: | id | team_api_id | team_long_name | team_short_name |
-- matches_spain: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |
-- teams_italy: | id | team_api_id | team_long_name | team_short_name |
-- matches_italy: | id | country_id | season | stage | date | hometeam_id | awayteam_id | home_goal | away_goal |

/* 1/2 Complete the first CASE statement, identifying Barcelona or Real Madrid as the home team using the hometeam_id column.
Complete the second CASE statement in the same way, using awayteam_id.
Hint
Your CASE statement should identify the first team, FC Barcelona, and the second team in the ELSE clause as Real Madrid CF. 
Therefore, your WHEN statement should use the home/away team ID that matches the alias. */

SELECT 
	date,
	-- Identify the home team as Barcelona or Real Madrid
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
        ELSE 'Real Madrid CF' END AS home,
    -- Identify the away team as Barcelona or Real Madrid
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
        ELSE 'Real Madrid CF' END AS away
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);

/* 2/2 Construct the final CASE statement identifying who won each match. Note there are 3 possible outcomes, but 5 conditions that you need to identify.
Fill in the logical operators to identify Barcelona or Real Madrid as the winner. */

SELECT 
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!'
        WHEN home_goal > away_goal AND hometeam_id = 8633 THEN 'Real Madrid win!'
        WHEN home_goal < away_goal AND awayteam_id = 8634 THEN 'Barcelona win!'
        WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!'
        ELSE 'Tie!' END AS outcome
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);
