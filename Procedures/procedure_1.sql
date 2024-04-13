CREATE DEFINER=`root`@`localhost` PROCEDURE `player_goals`(IN player_name VARCHAR(255), OUT goals_scored INT)
BEGIN
DECLARE this_player INT;
    SET this_player = (SELECT id FROM players WHERE name = player_name);
    SELECT COUNT(1) INTO goals_scored
    FROM goals
    WHERE this_player = player_id;
    -- This procedure will display the number of goals that a certain player has scored. 
    -- The procedure has two parameters IN, OUT
    -- the procedure takes the name of the player and displays the number of his goals
END