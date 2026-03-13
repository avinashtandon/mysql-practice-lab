-- ============================================================
-- Core Aggregate Functions (Data Engineering View)
-- ============================================================
-- 1. COUNT()
--
-- Counts number of rows.
-- ============================================================


-- ============================================================
-- Types you must understand:
-- ============================================================
--   • COUNT(*)              → counts ALL rows (including NULLs)
--   • COUNT(column)         → counts non-NULL values only
--   • COUNT(DISTINCT column)→ counts unique non-NULL values
-- ============================================================


-- ============================================================
-- Example Table: events
-- ============================================================
-- | user_id | event_type | revenue |
-- |---------|------------|---------|
-- | 1       | click      | NULL    |
-- | 1       | purchase   | 50      |
-- | 2       | click      | NULL    |
-- | 2       | purchase   | 100     |
-- ============================================================


-- ============================================================
-- Query 1: COUNT(*)
-- ============================================================

SELECT COUNT(*) 
FROM events;

-- Result → 4 rows
-- Counts every row, regardless of NULLs.


-- ============================================================
-- Query 2: COUNT(column) — Important difference!
-- ============================================================

SELECT COUNT(revenue)
FROM events;

-- Result → 2
--
-- Why?
-- Because COUNT(column) ignores NULL values.
-- Only 2 rows have non-NULL revenue (50 and 100).


-- ============================================================
-- Data Engineering Tip
-- ============================================================
--
-- For event logs, always use:
--
--   COUNT(*)
--
-- because events often contain NULL columns.
-- COUNT(column) would silently skip them and give
-- you an incorrect count.
-- ============================================================