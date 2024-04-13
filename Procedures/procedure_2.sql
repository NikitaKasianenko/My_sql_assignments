CREATE DEFINER=`root`@`localhost` PROCEDURE `country_goals`(IN country_name VARCHAR(255))
BEGIN
    DECLARE total_goals INT;

    SELECT COUNT(1) INTO total_goals
    FROM goals
    WHERE player_id IN (SELECT id FROM players WHERE nationality = country_name);

    SELECT total_goals;
    -- This procedure will display the number of goals scored by a team from a particular country.
    -- The procedure expects a country name as input
END