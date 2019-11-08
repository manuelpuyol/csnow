-- Teams that won tournaments with prize of at least 100k --
SELECT
  tournament_champions.champion
FROM
  tournament_champions
LEFT JOIN
  rosters ON rosters.team_id = tournament_champions.team_id
LEFT JOIN
  tournament_placements ON (tournament_placements.tournament_id = tournament_champions.tournament_id AND tournament_placements.roster_id = rosters.id)
WHERE
  tournament_placements.prize >= 100000;

-- All players that have played in a final --
SELECT DISTINCT
  roster_players.nickname
FROM
  roster_players
INNER JOIN
  tournament_placements ON tournament_placements.roster_id = roster_players.roster_id
WHERE
  tournament_placements.place = '1st' OR
  tournament_placements.place = '2nd';

-- Get user emails that have more correct bets than incorrect --
SELECT
  users.email
FROM
  users
INNER JOIN
  user_bets ON user_bets.user_id = users.id
WHERE
  user_bets.correct > user_bets.incorrect;

-- Get all teams an user has bet for --
SELECT
  users.id,
  STRING_AGG(teams.name, ', ')
FROM
  users
INNER JOIN
  bets ON bets.user_id = users.id
INNER JOIN
  rosters ON rosters.id = bets.winner_id
INNER JOIN
  teams ON teams.id = rosters.team_id
GROUP BY
  users.id;

-- Get all teams that have earned at least 100k in tournaments ordered by winnings desc --
SELECT
  teams.id,
  SUM(tournament_placements.prize) AS winnings
FROM
  teams
INNER JOIN
  rosters ON rosters.team_id = teams.id
INNER JOIN
  tournament_placements ON tournament_placements.roster_id = rosters.id
GROUP BY
  teams.id
HAVING
  SUM(tournament_placements.prize) >= 100000
ORDER BY
  winnings
DESC;

-- Get all tournaments each player has won --
SELECT
  players.nickname,
  STRING_AGG(tournaments.name, ', ')
FROM
  tournament_placements
INNER JOIN
  tournaments ON tournaments.id = tournament_placements.tournament_id
INNER JOIN
  player_rosters USING (roster_id)
INNER JOIN
  players ON players.id = player_rosters.player_id
WHERE
  tournament_placements.place = '1st'
GROUP BY
  players.id;

-- Average winnings by team --
SELECT
  teams.name,
  AVG(tournament_placements.prize)
FROM
  tournament_placements
INNER JOIN
  rosters ON rosters.id = tournament_placements.roster_id
INNER JOIN
  teams ON teams.id = rosters.team_id
GROUP BY
  teams.id;

-- Classify users as noobs, intermediates and experts --
-- Where noobs have bets correct < 40%, intermediate have >= 40% =< 60% and experts > 60% --
SELECT
  user_bets.user_id,
  CASE
    WHEN user_bets.correct / (user_bets.total)::FLOAT > 0.6 THEN 'expert'
    WHEN user_bets.correct / (user_bets.total)::FLOAT < 0.4 THEN 'noob'
    ELSE 'intermediate'
  END as classification
FROM
  user_bets;

CREATE TEMP TABLE player_likes AS (
  SELECT
    id,
    user_id,
    likeable_id AS player_id
  FROM
    likes
  WHERE
    likeable_type = 'Player'
);
-- Name the top 5 players with most likes --
SELECT
  players.nickname
FROM
  players
INNER JOIN
  player_likes ON player_likes.player_id = players.id
GROUP BY
  players.id
ORDER BY
  COUNT(player_likes.id)
DESC
LIMIT 5;

CREATE TEMP TABLE match_winners AS (
  SELECT
    teams.id AS team_id,
    teams.name AS team_name,
    rosters.id AS roster_id,
    matches.id AS match_id
  FROM
    matches
  INNER JOIN
    rosters ON rosters.id = matches.winner_id
  INNER JOIN
    teams ON teams.id = rosters.team_id
);
-- How many matches each team won per tournament --
SELECT
  tournaments.id,
  match_winners.team_id,
  COUNT(match_winners.match_id)
FROM
  match_winners
INNER JOIN
  matches ON matches.id = match_winners.match_id
INNER JOIN
  tournaments ON tournaments.id = matches.tournament_id
GROUP BY
  tournaments.id,
  match_winners.team_id
ORDER BY
  tournaments.id;