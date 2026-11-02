-- FNFA Awards: persist public live-tally visibility per edition.
-- Existing editions default to hidden; 2026 remains hidden.
ALTER TABLE public.award_editions
  ADD COLUMN IF NOT EXISTS public_live_tally boolean NOT NULL DEFAULT false;
