-- FNFA Ballon d'Or: player achievement statistics
-- Safe to run once in Supabase SQL Editor. Existing candidates and votes are preserved.
ALTER TABLE public.candidates
  ADD COLUMN IF NOT EXISTS matches_won integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS goals integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS man_of_the_match integer NOT NULL DEFAULT 0;

ALTER TABLE public.candidates
  DROP CONSTRAINT IF EXISTS candidates_matches_won_nonnegative,
  DROP CONSTRAINT IF EXISTS candidates_goals_nonnegative,
  DROP CONSTRAINT IF EXISTS candidates_man_of_the_match_nonnegative;

ALTER TABLE public.candidates
  ADD CONSTRAINT candidates_matches_won_nonnegative CHECK (matches_won >= 0),
  ADD CONSTRAINT candidates_goals_nonnegative CHECK (goals >= 0),
  ADD CONSTRAINT candidates_man_of_the_match_nonnegative CHECK (man_of_the_match >= 0);

-- No policies, existing records, votes, or winner data are changed.
