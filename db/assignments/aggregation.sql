-- Gets all teams a player has played for --

SELECT
  players.nickname,
  STRING_AGG(teams.name, ', ')
FROM
  players
INNER JOIN
  player_rosters ON player_rosters.player_id = players.id
INNER JOIN
  rosters ON player_rosters.roster_id = rosters.id
INNER JOIN
  teams ON rosters.team_id = teams.id
GROUP BY
  players.id;

-- List players sorted by total tournament earnings --

SELECT
  players.nickname,
  SUM(tournament_placements.prize) / 5 AS "Earnings" -- Assuming equal division of prize between players in a roster --
FROM
  players
INNER JOIN
  player_rosters ON player_rosters.player_id = players.id
INNER JOIN
  rosters ON player_rosters.roster_id = rosters.id
INNER JOIN
  tournament_placements ON tournament_placements.roster_id = rosters.id
GROUP BY
  players.id
ORDER BY
  "Earnings"
DESC;

-- Get number of matches a player has played --

SELECT
  players.nickname,
  COUNT(matches.id)
FROM
  players
INNER JOIN
  player_rosters ON player_rosters.player_id = players.id
INNER JOIN
  rosters ON player_rosters.roster_id = rosters.id
INNER JOIN
  matches ON matches.upper_roster_id = rosters.id OR matches.lower_roster_id = rosters.id
GROUP BY
  players.id;

-- Get number of correct/incorrect bets per user --

SELECT
  users.email,
  COUNT(bets.id) FILTER ( WHERE bets.winner_id = matches.winner_id ) AS "Correct",
  COUNT(bets.id) FILTER ( WHERE bets.winner_id != matches.winner_id ) AS "Incorrect"
FROM
  users
INNER JOIN
  bets ON bets.user_id = users.id
INNER JOIN
  matches ON matches.id = bets.match_id
GROUP BY
  users.email;

-- Bets per matches per team as percentage--

SELECT
  matches.id,
  COUNT(bets.id) as total,
  COUNT(bets.id) FILTER ( WHERE bets.winner_id = matches.upper_roster_id ) / COUNT(bets.id)::FLOAT AS "Team 1",
  COUNT(bets.id) FILTER ( WHERE bets.winner_id = matches.lower_roster_id ) / COUNT(bets.id)::FLOAT AS "Team 2"
FROM
  matches
INNER JOIN
  bets ON bets.match_id = matches.id
GROUP BY
  matches.id;

-- How many likes each team has --

SELECT
  teams.name,
  COUNT(likes.id)
FROM
  teams
INNER JOIN
  likes ON likes.likeable_id = teams.id AND likes.likeable_type = 'Team'
GROUP BY
  teams.id;

-- How many likes each player has --

SELECT
  players.nickname,
  COUNT(likes.id)
FROM
  players
INNER JOIN
  likes ON likes.likeable_id = players.id AND likes.likeable_type = 'Player'
GROUP BY
  players.id;