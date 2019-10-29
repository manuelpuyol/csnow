-- All friens from user 1 --

WITH friends(id) AS (
  SELECT
    requester_id AS id
  FROM
    friendships
  WHERE
    receiver_id = 1
  UNION
  SELECT
    receiver_id AS id
  FROM
    friendships
  WHERE
    requester_id = 1
)
SELECT
  name
FROM
  users
INNER JOIN
  friends ON users.id = friends.id;

-- Get number of matches per tournament --

SELECT
  tournaments.name,
  (
    SELECT
      COUNT(id)
    FROM
      matches
    WHERE
      matches.tournament_id = tournaments.id
  )
FROM
  tournaments;

-- List all tournament's matches --

SELECT
  tournaments.name AS "Tournament",
  upper_teams.name AS "Team 1",
  lower_teams.name AS "Team 2" ,
  winners.name AS "Winner"
FROM
  tournaments
INNER JOIN
  matches ON matches.tournament_id = tournaments.id
INNER JOIN
  rosters AS upper_rosters ON upper_rosters.id = matches.upper_roster_id
INNER JOIN
  teams AS upper_teams ON upper_teams.id = upper_rosters.team_id
INNER JOIN
  rosters AS lower_rosters ON lower_rosters.id = matches.lower_roster_id
INNER JOIN
  teams AS lower_teams ON lower_teams.id = lower_rosters.team_id
LEFT JOIN -- winner may be null --
  rosters AS winner_rosters ON winner_rosters.id = matches.winner_id
LEFT JOIN
  teams AS winners ON winners.id = winner_rosters.team_id
ORDER BY
  tournaments.start_at,
  tournaments.name
DESC;

-- List the last 10 results from a team --

SELECT
  CASE 
    WHEN upper_teams.id = 1 THEN lower_teams.name
    WHEN lower_teams.id = 1 THEN upper_teams.name
  END AS "Versus",
  CASE 
    WHEN winners.id = 1 THEN 'won'
    ELSE 'lost'
  END AS "Result"
FROM
  matches
INNER JOIN
  rosters AS upper_rosters ON upper_rosters.id = matches.upper_roster_id
INNER JOIN
  teams AS upper_teams ON upper_teams.id = upper_rosters.team_id
INNER JOIN
  rosters AS lower_rosters ON lower_rosters.id = matches.lower_roster_id
INNER JOIN
  teams AS lower_teams ON lower_teams.id = lower_rosters.team_id
INNER JOIN
  rosters AS winner_rosters ON winner_rosters.id = matches.winner_id
INNER JOIN
  teams AS winners ON winners.id = winner_rosters.team_id
WHERE
  matches.winner_id IS NOT NULL AND
  (
    upper_teams.id = 1 OR
    lower_teams.id = 1
  )
ORDER BY
  matches.start_at
DESC
LIMIT 10;

-- List all players a specific player has played with --

SELECT
  other_players.nickname
FROM
  players
INNER JOIN
  player_rosters ON player_rosters.player_id = players.id
INNER JOIN
  rosters ON rosters.id = player_rosters.roster_id
INNER JOIN
  player_rosters AS other_player_rosters ON other_player_rosters.roster_id = rosters.id
INNER JOIN
  players AS other_players ON other_players.id = other_player_rosters.player_id
WHERE
  players.id = 1 AND
  other_players.id != 1;

-- List all matches a roster has won --

SELECT
  matches.id
FROM
  matches
INNER JOIN
  rosters ON rosters.id = matches.winner_id
WHERE
  rosters.id = 1;
