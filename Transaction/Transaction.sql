CREATE DEFINER=`root`@`localhost` PROCEDURE `add_player`(
IN player_name VARCHAR(255),
IN player_last_name VARCHAR(255),
IN player_date_of_birth DATE,
IN player_nationality VARCHAR(255),
IN player_position VARCHAR(255),
IN player_number INT
    )
BEGIN
DECLARE player_age INT;
    DECLARE player_exists INT;
    START TRANSACTION;
    SET player_age = TIMESTAMPDIFF(YEAR, player_date_of_birth, CURDATE());
    IF player_age < 18 THEN
        ROLLBACK;
        SELECT 'Player is underage' AS message;
    ELSE
        SELECT COUNT(*) INTO player_exists FROM players WHERE number = player_number;
        
        IF player_exists > 0 THEN
            ROLLBACK;
            SELECT 'Player number already exists' AS message;
        ELSE
            INSERT INTO players(name, last_name, date_of_birth,nationality,position, number) VALUES (player_name, player_last_name, player_date_of_birth,player_nationality,player_position, player_number);
            COMMIT;
            SELECT 'Player added successfully.' AS message;
        END IF;
    END IF;-- This transaction will add new players with verification that the player is over 17 years old (18 and older)
    -- and that he has a unique number,
-- on input is name,last_name,date of birth,natianality, position, number
END