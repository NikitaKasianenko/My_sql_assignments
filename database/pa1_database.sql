-- Team table
CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    stadium VARCHAR(255) NOT NULL,
    manager VARCHAR(255)
);

-- Insert data into the Team table
INSERT INTO teams (name, city, stadium, manager) VALUES
('Almeria', 'Almeria', 'Almeria Stadium', 'Shivang Kumar Raj'),
('Athletic Bilbao', 'Bilbao', 'San Mamés Stadium', 'Sumeet Singh'),
('Barcelona', 'Barcelona', 'Camp Nou', 'Nikhil Ramesh Patwari'),
('Espanyol', 'Barcelona', 'RCDE Stadium', 'Kanav Singh Sethi'),
('Getafe', 'Getafe', 'Coliseum Alfonso Pérez', 'Shivam Anand'),
('Malaga', 'Malaga', 'La Rosaleda Stadium', 'Saksham K Sehrawet'),
('Mallorca', 'Balearic Islands', 'Son Moix Stadium', 'Dhruv L Sirohi'),
('Numancia', 'Soria', 'Nuevo Estadio Los Pajaritos', 'Prashant K Mishra'),
('Osasuna', 'Pamplona', 'El Sadar Stadium', 'Samar G Singh'),
('Real Madrid', 'Madrid', 'Santiago Bernabéu Stadium', 'Dhruv K Moudgil'),
('Portsmouth', 'Portsmouth', 'Fratton Park', 'Some Manager');

-- Player table
CREATE TABLE players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    position VARCHAR(255) NOT NULL,
    number INT,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

-- Insert data into the Player table
INSERT INTO players (name, last_name, date_of_birth, nationality, position, number, team_id) VALUES
('Christiano', 'Ronaldo', '1990-03-14', 'Portuguese', 'st', 7, 1),
('Angel', 'Maria', '1989-05-17', 'Argentinian', 'st', 11, 2),
('Sergio', 'Ramos', '1991-12-19', 'Spanish', 'lb', 4, 3),
('Iker', 'Casillas', '1989-09-21', 'Spanish', 'gk', 1, 4),
('Mario', 'Gotze', '1990-02-14', 'Italian', 'mid', 10, 5),
('Lionel', 'Messi', '1987-06-24', 'Argentinian', 'st', 10, 6),
('David', 'Villa', '1981-12-03', 'Spanish', 'st', 7, 7),
('Sergio', 'Ronaldinho', '1980-03-21', 'Brazilian', 'mid', 10, 8),
('Xavier', 'Puyol', '1978-04-13', 'Spanish', 'cb', 5, 9),
('Luis', 'Suarez', '1987-01-24', 'Uruguayan', 'st', 9, 10),
('Gareth', 'Bale', '1989-07-16', 'Welsh', 'lw', 11, 1),
('Wayne', 'Rooney', '1985-10-24', 'English', 'st', 10, 2),
('Roger', 'Ferdinand', '1978-11-07', 'English', 'cb', 5, 3),
('Steven', 'Gerrard', '1980-05-30', 'English', 'mid', 8, 4),
('Hulk', 'Givanildo', '1986-07-25', 'Brazilian', 'st', 7, 5),
('Saksham', 'Sehra', '1990-11-09', 'Indian', 'st', 9, 6),
('Gurr', 'Obero', '1985-09-23', 'Indian', 'st', 11, 7),
('Neela', 'Kamlesh', '1988-04-15', 'Indian', 'mid', 8, 8),
('Roger', 'Federer', '1981-08-08', 'Swiss', 'cb', 6, 9),
('Zack', 'Galafinakas', '1969-10-01', 'American', 'gk', 1, 10),
('Howard', 'Wolowitz', '1977-08-23', 'American', 'mid', 6, 1),
('Sheldon', 'Cooper', '1980-02-26', 'American', 'cb', 5, 2),
('Leonard', 'Hofstader', '1979-12-17', 'American', 'cb', 4, 3),
('Raj', 'Koothrappali', '1981-10-06', 'Indian', 'lw', 11, 4),
('Ross', 'Geller', '1967-11-12', 'American', 'st', 9, 5),
('Chandler', 'Bing', '1968-04-08', 'American', 'gk', 1, 6),
('Joey', 'Tribbiani', '1968-07-19', 'American', 'mid', 7, 7),
('Sunil', 'Chhetri', '1984-08-03', 'Indian', 'st', 12, 8),
('Baichung', 'Bhutia', '1976-12-15', 'Indian', 'st', 15, 9),
('Sumeet', 'Singh', '1992-06-08', 'Indian', 'mid', 8, 10);

-- Match table
CREATE TABLE matches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    time DATETIME NOT NULL,
    home_score INT NOT NULL,
    away_score INT NOT NULL,
    venue VARCHAR(255) NOT NULL,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    FOREIGN KEY (home_team_id) REFERENCES teams(id),
    FOREIGN KEY (away_team_id) REFERENCES teams(id)
);

-- Insert data into the Match table
INSERT INTO matches (time, home_score, away_score, venue, home_team_id, away_team_id) VALUES
('2016-04-02 16:40', 6, 2, 'Stamford Bridge', 10, 9),
('2016-04-04 12:22', 4, 5, 'Juegos Deportiva', 1, 3),
('2016-04-05 18:05', 3, 2, 'San Mames', 2, 5),
('2016-04-06 14:12', 2, 4, 'Estadi Cornella El', 4, 6),
('2016-04-08 13:16', 4, 3, 'Son Bibiloni', 7, 8),
('2016-04-09 11:25', 0, 4, 'Juegos Deportivo', 9, 4),
('2016-04-12 09:45', 4, 2, 'Santiago Bernabeau', 10, 9),
('2016-04-14 12:12', 2, 3, 'The Oval', 1, 10),
('2016-04-15 15:16', 4, 1, 'The Gunners', 4, 5),
('2016-04-16 10:25', 1, 0, 'The Gardens', 5, 1),
('2016-04-17 11:46', 0, 5, 'Camp Nou', 3, 1),
('2016-04-19 12:26', 5, 3, 'La Rosaleda', 6, 2),
('2016-04-21 16:00', 3, 0, 'Coliseum Alfonso', 5, 4),
('2016-04-22 18:56', 2, 1, 'Theatre of Dreams', 6, 7),
('2016-04-26 08:00', 1, 5, 'The Colloseum', 8, 4),
('2016-04-30 07:56', 5, 4, 'Villa Park', 7, 8),
('2016-05-01 10:06', 0, 5, 'The Hub', 9, 7),
('2016-05-05 16:50', 3, 2, 'The MLF', 8, 9),
('2016-05-07 15:20', 5, 1, 'The Anfielders', 2, 8),
('2016-05-10 18:23', 2, 0, 'Stadium of Light', 2, 6);

-- Goal table
CREATE TABLE goals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT NOT NULL,
    goal_time TIME NOT NULL,
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (player_id) REFERENCES players(id),
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

-- Insert data into the Goal table
INSERT INTO goals (match_id, player_id, team_id, goal_time) VALUES
(2, 2, 1, '01:00:06'), -- Almeria vs Barcelona
(2, 17, 6, '00:49:24'), -- Almeria vs Malaga 
(3, 4, 2, '00:36:56'), -- Athletic Bilbao vs Getafe
(3, 6, 9, '01:12:12'),
(8, 10, 9, '00:20:30'), -- Osasuna vs Athletic Bilbao
(9, 13, 3, '00:25:10'),  -- Barcelona vs Real Madrid 
(10, 16, 4, '00:40:22'), -- Espanyol vs Osasuna 
(11, 19, 6, '01:15:45'), -- Numancia vs Malaga 
(12, 22, 8, '00:55:30'), -- Portsmouth vs Numancia 
(13, 25, 10, '00:30:15'),-- Real Madrid vs Getafe 
(14, 28, 2, '00:20:40'); -- Athletic Bilbao vs Almeria 

-- Standing table
CREATE TABLE Standing (
    standing_id INT PRIMARY KEY AUTO_INCREMENT,
    league_id INT NOT NULL,
    team_id INT NOT NULL,
    position INT NOT NULL,
    points INT NOT NULL,
    played INT NOT NULL,
    won INT NOT NULL,
    drawn INT NOT NULL,
    lost INT NOT NULL,
    goals_for INT NOT NULL,
    goals_against INT NOT NULL,
    goal_difference INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

-- Insert data into the Standing table
INSERT INTO Standing (league_id, team_id, position, points, played, won, drawn, lost, goals_for, goals_against, goal_difference) VALUES
(1, 1, 1, 3, 4, 1, 0, 3, 11, 9, 2), 
(1, 2, 2, 9, 2, 3, 0, 1, 13, 7, 4),
(1, 3, 2, 3, 2, 1, 0, 1, 5, 8, -3),
(1, 4, 2, 9, 5, 3, 0, 2, 15, 9, 6),
(1, 5, 2, 6, 4, 2, 0, 2, 6, 6, -1),
(1, 6, 2, 9, 4, 3, 0, 1, 13, 8, 5),
(1, 7, 2, 9, 4, 3, 0, 1, 15, 9, 6),
(1, 8, 2, 3, 5, 1, 0, 4, 12, 21, -9),
(1, 9, 3, 0, 4, 0, 0, 4, 6, 22, -16),
(1, 10, 3, 9, 3, 3, 0, 0, 13, 6, 5);

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

