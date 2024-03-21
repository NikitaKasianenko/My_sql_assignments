-- gols each player for each team.
SELECT 
  players.name AS Player_Name,
  players.last_name AS Player_Last_Name,
  teams.name AS Team_Name,
  COUNT(*) AS Goals_Scored
FROM 
  players
INNER JOIN team_squads ON players.id = team_squads.player_id
INNER JOIN teams ON team_squads.team_id = teams.id
INNER JOIN goals ON players.id = goals.player_id AND teams.id = goals.team_id
GROUP BY 
  players.name, players.last_name, teams.name
ORDER BY 
  players.name, players.last_name, teams.name;
