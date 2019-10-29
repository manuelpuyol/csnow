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