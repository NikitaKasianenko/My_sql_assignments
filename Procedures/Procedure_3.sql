CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_goals_per_match`(OUT avg_goals DECIMAL(10,2))
BEGIN
   SELECT AVG(home_score + away_score) INTO avg_goals FROM matches;
   -- This procedure will output the average of goals across all matches. (procedure have only out parametr)
END