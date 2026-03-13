-- ============================================================
-- 3. AVG()
-- ============================================================
--
-- Calculates the average of a numeric column.
-- ============================================================


-- ============================================================
-- Example Query
-- ============================================================

SELECT AVG(revenue)
FROM events;


-- ============================================================
-- Calculation Breakdown
-- ============================================================
-- 
-- Let's say the non-NULL revenues are 50 and 100
-- (50 + 100) / 2 = 75
-- 
-- Important:
-- AVG ignores NULL values. It does not treat NULL as 0.
-- ============================================================


-- ============================================================
-- Data Engineering Tip
-- ============================================================
--
-- AVG is internally calculated as:
--
--   SUM(column) / COUNT(column)
--
-- Because COUNT(column) ignores NULLs, the denominator
-- only counts rows that actually have a value. 
--
-- If you want NULLs treated as 0 in the average, use:
--   AVG(COALESCE(column, 0))
-- ============================================================