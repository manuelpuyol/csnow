-- User likes a team --
INSERT INTO
  public.likes (user_id, likeable_type, likeable_id, type, created_at, updated_at)
VALUES
  (1, 'Player', 1, 'PlayerLike', NOW(), NOW());

-- User creates a friend request --
INSERT INTO
  public.friendships (state, requester_id, receiver_id, created_at, updated_at)
VALUES
  ('pending', 1, 3, NOW(), NOW());

-- Replicate user likes to their teams --
INSERT INTO
  public.likes (user_id, likeable_type, likeable_id, type, created_at, updated_at)
SELECT
  likes.user_id,
  'Team',
  teams.id,
  'TeamLike',
  NOW(),
  NOW()
FROM
  public.likes
INNER JOIN
  players ON players.id = likes.likeable_id AND likes.likeable_type = 'Player'
INNER JOIN
  player_rosters ON player_rosters.player_id = players.id
INNER JOIN
  rosters ON rosters.id = player_rosters.roster_id
INNER JOIN
  teams ON teams.id = rosters.team_id;

-- Create a new team with a roster--
INSERT INTO
  public.teams (name, logo, active, hltv_id, created_at, updated_at)
VALUES
  ('New Team', 'logo', true, 99999, NOW(), NOW());

INSERT INTO
  public.rosters (start_at, end_at, team_id, created_at, updated_at)
VALUES (
  NOW(),
  NULL,
  (
    SELECT
      teams.id
    FROM
      public.teams
    ORDER BY
      id
    DESC
    LIMIT 1
  ),
  NOW(),
  NOW()
);

-- User dislikes a player --
DELETE
FROM
  public.likes
WHERE
  likes.user_id = 1 AND
  likes.likeable_id = 1 AND
  likes.likeable_type = 'Player';

-- Delete a user --
DELETE
FROM
  public.friendships
WHERE
  friendships.receiver_id = 100 OR
  friendships.requester_id = 100;

DELETE
FROM
  public.bets
WHERE
  bets.user_id = 100;

DELETE
FROM
  public.likes
WHERE
  likes.user_id = 100;

DELETE
FROM
  public.users
WHERE
  users.id = 100;

-- User accepts a friend request --
UPDATE
  public.friendships
SET
  state = 'accepted',
  updated_at = NOW()
WHERE
  friendships.receiver_id = 3 AND
  friendships.requester_id = 1;

-- Mark a player as inactive --
UPDATE
  public.players
SET
  active = false,
  updated_at = NOW()
WHERE
  players.id = 296;