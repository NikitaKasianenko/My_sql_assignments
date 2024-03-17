
-- "= with non-correlated subqueries result"

-- SELECT Query:  обираємо останнього гравця з таблиці 

SELECT *
FROM players
WHERE id = (SELECT MAX(id) FROM players);

-- UPDATE Query: тепер 'Neymar' грає за позиції "CF"

UPDATE players
SET position = 'CF'
WHERE EXISTS (SELECT * FROM team_squads WHERE players.name = 'Neymar');

 
-- Delete Query: Видаляємо останньго гравця з таблиці
DELETE FROM players
WHERE id = (SELECT MAX(id) FROM players);

-- IN with non-correlated subqueries result
-- SELECT Query: Обираємо гравця з id 1 через таблицю goals

SELECT *
FROM players
WHERE id IN (SELECT player_id FROM goals WHERE goals.player_id = 1);

-- UPDATE Query: зміна позиції на якій грав неймар у всіх командах в яких він коли небуть був.
UPDATE players
SET position = 'CM'
WHERE id IN (SELECT player_id FROM team_squads WHERE player_id = 1);


-- Delete Query -- тепер МБаппе не грає в жодній з команд)
DELETE FROM team_squads
WHERE player_id IN (SELECT id FROM players WHERE last_name = 'Mbappe');

--  NOT IN with non-correlated subqueries result:

-- SELECT Query: усі команди в яких нема неймара)

SELECT name
FROM teams
WHERE id NOT IN (SELECT team_id FROM team_squads WHERE player_id = 1);

-- UPDATE Query: тепер усі окрім неймара грають на позиціі 'CB'

UPDATE players
SET position = 'CB'
WHERE id NOT IN (SELECT player_id FROM team_squads WHERE player_id = 1);

-- DELETE Query: тепер в нас залишись лише ті команди в яких грав неймар

DELETE FROM team_squads 
WHERE player_id NOt IN (SELECT id FROM players WHERE name = 'Neymar');

-- EXISTS with non-correlated subqueries result:

-- SELECT Query: запит обирає всіх гравців які забили голи у матчах, у яких команда господарів забила більше одного гола
SELECT p.name 
FROM players p
WHERE EXISTS (SELECT * FROM goals g 
    Join matches m  on g.match_id = m.id 
    WHERE g.player_id = p.id
    And m.home_score > 1);

-- UPDATE Query: усі гравці які забивали більше ніж 3 гола  тепер мають номер 99 

UPDATE players
SET number = 99
WHERE EXISTS (SELECT 1 FROM goals WHERE goals.player_id = players.id GROUP BY goals.player_id HAVING COUNT(*) > 3);

-- DELETE QUERY: видаляє усі комнди в якіх хтось з гроків забив більш ніж 3 гола

DELETE FROM team_squads 
WHERE EXISTS (SELECT 1 FROM goals WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*)> 3);

-- NOT EXISTS with non-correlated subqueries result:

-- SELECT Query: обирає всі команди в якіх жоден з гравців не забив більш ніж 3 гола
SELECT *
FROM team_squads
WHERE NOT EXISTS (SELECT 1 FROM goals WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*)> 3);

-- UPDATE QUERY: усі гравці які забили менш ніж 3 гола мають номер 99

UPDATE players
SET number = 99 
WHERE NOT EXISTS (SELECT 1 FROM goals WHERE goals.player_id = players.id GROUP BY goals.player_id HAVING COUNT(*)> 3);

-- DELETE QUERY: видаляє усі комнди в якіх хтось з гроків забив мешн ніж 3 гола

DELETE FROM team_squads
WHERE NOT EXISTS (SELECT 1 FROM goals WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*)> 3);

-- = with correlated subqueries result:

-- SELECT Query: час коли  'Paris Saint-Germain'  грала як команда господар
SELECT date_time
FROM matches m
WHERE m.home_team_id = (
    SELECT id
    FROM teams t
    WHERE t.name = 'Paris Saint-Germain'
);
-- UPDATE QUERY: оновлює номер гравців на 10 якщо вони входять в команду з Парижу

UPDATE players
SET number = 10
WHERE id = (
    SELECT ts.player_id
    FROM team_squads ts
    WHERE ts.team_id = (
        SELECT id
        FROM teams t
        WHERE t.city = 'Paris'
        LIMIT 1
    )
    LIMIT 1
);
-- DELETE QUERY: видаляє усі записи з таблиці goals якщо грала команда з Парижу

DELETE FROM goals
WHERE player_id = (
    SELECT player_id
    FROM team_squads
    WHERE team_id = (
        SELECT id
        FROM teams
        WHERE city = 'Paris'
        LIMIT 1
    )
);
-- IN with correlated subqueries result:

-- SELECT Query:Усі гравці які забивали голи.

SELECT *
FROM players
WHERE id IN (SELECT player_id FROM goals WHERE goals.player_id = players.id);

-- UPDATE Query:усы гравці які забивали гол тепер мають номер 20

UPDATE players
SET number = 20
WHERE id IN (SELECT player_id FROM goals WHERE goals.player_id = players.id);

-- Delete Query: видаляє усі записи з таблиці team_squads де забивав хтось з гравців  

DELETE FROM team_squads
WHERE team_squads.player_id IN (SELECT g.player_id FROM goals g WHERE g.player_id = team_squads.player_id);

-- NOT IN with correlated subqueries result:

-- SELECT Query: усі гравці які не забивали голи 

SELECT *
FROM players
WHERE id NOT IN (SELECT player_id FROM goals WHERE goals.player_id = players.id);

-- UPDATE Query: оновлює ім'я гравця на 21 'loser' якщо він не забивав гол

UPDATE players
SET name = "loser"
WHERE id NOT IN  (SELECT player_id FROM goals WHERE goals.player_id = players.id);

-- DELETE Query: видаляє усі записи з таблиці team_squads якщо хтось з гравців команди не забив гол  

DELETE FROM team_squads
WHERE team_squads.player_id NOT IN (SELECT g.player_id FROM goals g WHERE g.player_id = team_squads.player_id);

-- EXISTS with correlated subqueries result:

-- SELECT Query: Повна інформація про гравців з кожної з команд

SELECT *
FROM players p
WHERE EXISTS (SELECT * FROM team_squads WHERE team_squads.player_id = p.id);

-- UPDATE Query: оновлює номер кожного гравця з кожної команди на 40

UPDATE players
SET number = 40
WHERE EXISTS (SELECT * FROM team_squads WHERE team_squads.player_id = players.id);

-- DELETE Query: видаляє усі записи з табліці team_squads

DELETE FROM team_squads
WHERE EXISTS (SELECT * FROM players WHERE team_squads.player_id = players.id);
-- NOT EXISTS with correlated subqueries result:
-- SELECT Query: повна інформація про матчі де кількість голів 0
SELECT *
FROM matches m
WHERE NOT EXISTS (
    SELECT 1
    FROM goals g
    WHERE g.match_id = m.id
);
-- UPDATE Query: На цей раз змініє призвище грока якщо він не забив гол

UPDATE players p
SET last_name = 'loser again'
WHERE NOT EXISTS (
    SELECT 1
    FROM goals g
    WHERE g.player_id = p.id
);
-- DELETE Query: видаляє усі записи з таблиці team_squads де грок забив менш ніж 3 гола

DELETE FROM team_squads
WHERE NOT EXISTS (
    SELECT 1
    FROM goals g
    WHERE g.player_id = team_squads.player_id
    GROUP BY g.player_id
    HAVING COUNT(*) > 3
);

 -- SELECT queries that include the clause UNION / UNION ALL / INTERSECT / EXCEPT
 -- UNION Query: Об'єднує умена усіх гравців які не забивали рівно  1
 -- гол  та  забивали більше 3 голів (без поворторів)

SELECT name
FROM players
WHERE NOT EXISTS (SELECT 1 FROM goals

    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) = 1)
UNION
SELECT name
FROM players
WHERE EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) > 3);

-- UNION ALL  Query: Об'єднує умена усіх гравців які не забивали рівно  1
 -- гол  та  забивали більше 3 голів (із поворторами)
SELECT name
FROM players
WHERE NOT EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) =1)
UNION all 
SELECT name
FROM players
WHERE EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*)> 3);

-- INTERSECT Query: повертає унікальні рядки
SELECT name
FROM players
WHERE NOT EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) = 1)
INTERSECT -- (працює в mycopiler проте на workbench чому-сь ні)
SELECT name
FROM players
WHERE EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) > 3);
    
-- EXCEPT Query: повернув усіх гравців котрі не забили більш ніж 3 гола
SELECT name
FROM players
WHERE NOT EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) = 1)
EXCEPT -- (працює в mycopiler проте на workbench чому-сь ні)
SELECT name
FROM players
WHERE EXISTS (SELECT 1 FROM goals
    JOIN team_squads on team_squads.player_id = players.id
    WHERE goals.player_id = team_squads.player_id GROUP BY goals.player_id HAVING COUNT(*) > 3);