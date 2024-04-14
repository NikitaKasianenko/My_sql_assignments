CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tournament_number_2` AS
    SELECT 
        `s`.`id` AS `id`,
        `s`.`match_day_id` AS `match_day_id`,
        `s`.`team_id` AS `team_id`,
        `s`.`points` AS `points`,
        `s`.`played` AS `played`,
        `s`.`won` AS `won`,
        `s`.`drawn` AS `drawn`,
        `s`.`lost` AS `lost`,
        `s`.`goals_for` AS `goals_for`,
        `s`.`goals_against` AS `goals_against`,
        `l`.`name` AS `league_name`,
        `t`.`name` AS `team_name`
    FROM
        (((`standings` `s`
        JOIN `match_days` `md` ON ((`s`.`match_day_id` = `md`.`id`)))
        JOIN `leagues` `l` ON ((`md`.`league_id` = `l`.`id`)))
        JOIN `teams` `t` ON ((`s`.`team_id` = `t`.`id`)))
    WHERE
        (`s`.`match_day_id` = (SELECT 
                MAX(`s2`.`match_day_id`)
            FROM
                (`standings` `s2`
                JOIN `match_days` `md2` ON ((`s2`.`match_day_id` = `md2`.`id`)))
            WHERE
                (`md2`.`league_id` = 2)))