-- Tournament Champions --
CREATE VIEW tournament_champions AS (
  SELECT
    tournaments.id AS tournament_id,
    teams.id AS team_id,
    tournaments.name AS tournament,
    teams.name AS champion
  FROM
    tournaments
  LEFT JOIN
    tournament_placements ON tournament_placements.tournament_id = tournaments.id
  LEFT JOIN
    rosters ON tournament_placements.roster_id = rosters.id
  LEFT JOIN
    teams ON rosters.team_id = teams.id
  WHERE
    tournament_placements.place = '1st'
);

-- Rosters with players --
CREATE VIEW roster_players AS (
  SELECT
    rosters.id AS roster_id,
    players.id AS player_id,
    players.nickname AS nickname
  FROM
    rosters
  LEFT JOIN
    player_rosters ON player_rosters.roster_id = rosters.id
  LEFT JOIN
    players ON players.id = player_rosters.player_id
);

-- User correct and wrong bets --
CREATE VIEW user_bets AS (
  SELECT
    users.id AS user_id,
    COUNT(bets.id) as total,
    COUNT(bets.id) FILTER ( WHERE bets.winner_id = matches.winner_id ) AS correct,
    COUNT(bets.id) FILTER ( WHERE bets.winner_id != matches.winner_id ) AS incorrect
  FROM
    users
  INNER JOIN
    bets ON bets.user_id = users.id
  INNER JOIN
    matches ON matches.id = bets.match_id
  GROUP BY
    users.id
);
