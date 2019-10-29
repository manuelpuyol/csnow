-- All bets placed by user 1 --
SELECT
  id,
  match_id,
  winnder_id
FROM
  bets
WHERE
  user_id = 1;

-- Bets per match, counting how many bets in each team --
SELECT
  match_id,
  winner_id,
  COUNT(id)
FROM
  bets
GROUP BY
  match_id,
  winner_id
ORDER BY
  match_id;

-- Get a player ranking evolution through time
SELECT
  player_id,
  rank,
  ranked_at
FROM
  player_rankings
WHERE
  player_id = 33
ORDER BY
  ranked_at
DESC;

-- Gets all tournament champions and the respective tournament --
SELECT
  tournaments.name AS "Tournament",
  teams.name AS "Champions"
FROM
  tournaments
LEFT JOIN
  tournament_placements ON tournament_placements.tournament_id = tournaments.id
LEFT JOIN
  rosters ON tournament_placements.roster_id = rosters.id
LEFT JOIN
  teams ON rosters.team_id = teams.id
WHERE
  tournament_placements.place = '1st';

-- Gets current roster from each team --
SELECT
  teams.name,
  players.nickname
FROM
  teams
INNER JOIN
  rosters ON rosters.team_id = teams.id
INNER JOIN
  player_rosters ON player_rosters.roster_id = rosters.id
INNER JOIN
  players ON player_rosters.player_id = players.id
WHERE
  rosters.end_at IS NULL;

-- Gets the number of likes each player has --
SELECT
  players.nickname,
  COUNT(likes.id) AS "Total Likes"
FROM
  players
INNER JOIN
  likes ON likes.likeable_id = players.id AND likes.likeable_type = 'Player'
GROUP BY
  players.nickname;

-- Gets the number of likes each team has --
SELECT
  teams.name,
  COUNT(likes.id) AS "Total Likes"
FROM
  teams
INNER JOIN
  likes ON likes.likeable_id = teams.id AND likes.likeable_type = 'Team'
GROUP BY
  teams.name;

-- Gets how much each team won in tournaments --
SELECT
  teams.name,
  SUM(tournament_placements.prize)
FROM
  tournament_placements
INNER JOIN
  rosters ON tournament_placements.roster_id = rosters.id
INNER JOIN
  teams ON rosters.team_id = teams.id
GROUP BY
  teams.name;
