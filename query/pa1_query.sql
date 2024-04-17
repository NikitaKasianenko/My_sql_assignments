
-- команда - менеджер
SELECT name as Team_name, manager as Manager from teams;

SELECT p.name as Name, g.goal_time as Time, m.home_score as Score
    FROM players p
    JOIN goals g ON p.id = g.id
    JOIN matches m ON g.match_id = m.id
    JOIN teams t ON g.id = t.id
    WHERE m.home_score > 3;

-- гравець - команда 
SELECT p.name, p.last_name AS Name, t.name as Team_name FROM players p
    JOIN teams t ON p.team_id = t.id;


-- час голу, рахунки команд, команди 
SELECT m.time as Time, m.home_score as Score, ht.name as Home_Team, m.away_score as Away_Score, at.name as Away_Team  
    FROM matches m
    JOIN teams ht ON ht.id = m.home_team_id
    JOIN teams at ON at.id = m.away_team_id
    ORDER BY Score DESC;

-- команда -  загальна кількість голів 
SELECT t.name AS Team,  s.goals_for AS Goals 
    From Standing s 
    JOIN teams t ON s.team_id = t.id
    ORDER BY Goals DESC;
-- команда, загальна кількісь матчів.
SELECT t.name AS Team, COUNT(*) AS Games
    FROM matches m
    JOIN teams t ON m.home_team_id = t.id OR m.away_team_id = t.id
    GROUP BY t.name;

-- вивід усіх голкіперів команди яких відіграли більше N кількості матчів
SELECT  p.name AS Goalkeeper, t.name AS Team
    FROM players p
    JOIN teams t ON p.team_id = t.id
    JOIN matches m ON t.id = m.home_team_id OR t.id = m.away_team_id
    WHERE p.position = 'gk'
    GROUP BY p.id
    HAVING COUNT(m.id) > 3;


-- усі граівці які забили в перші 10 хв 
SELECT p.name AS Player_Name, g.goal_time AS Goal_Time, m.time AS Match_Time
    FROM players p
    JOIN goals g ON p.id = g.player_id
    JOIN matches m ON g.match_id = m.id
    WHERE TIME_TO_SEC(g.goal_time) <= 600; 

