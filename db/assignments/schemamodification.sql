-- make friendships default 'pending' --
ALTER TABLE
  public.friendships
ALTER COLUMN
  state
SET DEFAULT
  'pending';

-- add timestamp when user accepted or rejected a friendship request --
ALTER TABLE
  public.friendships
ADD COLUMN
  state_changed_at
TIMESTAMP WITHOUT TIME ZONE;

-- add score to match --
ALTER TABLE
  public.matches
ADD COLUMN
  score
CHARACTER VARYING;

-- remove match end_at --
ALTER TABLE
  public.matches
DROP COLUMN
  end_at;