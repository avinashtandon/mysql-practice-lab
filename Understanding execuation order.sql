-- ============================================================
-- Understanding SQL Execution Order
-- ============================================================
-- Extremely important for data engineers because it helps you:
--
--   • Debug incorrect aggregations
--   • Write optimized queries
--   • Understand execution plans
--   • Avoid expensive full table scans
--   • Correctly use window functions and filters
--
-- Many engineers write SQL in top-to-bottom order,
-- but the database executes it differently.
-- ============================================================


-- ============================================================
-- 1️⃣  Logical Execution Order of SQL
-- ============================================================
--
-- Even though we WRITE SQL like this:
--
--   SELECT
--   FROM
--   JOIN
--   WHERE
--   GROUP BY
--   HAVING
--   WINDOW
--   ORDER BY
--   LIMIT
--
-- The database actually EXECUTES it in this order:
--
-- | Step | Clause   | What Happens               |
-- |------|----------|----------------------------|
-- | 1    | FROM     | Identify tables             |
-- | 2    | JOIN     | Combine tables              |
-- | 3    | ON       | Apply join condition         |
-- | 4    | WHERE    | Filter rows                  |
-- | 5    | GROUP BY | Create groups                |
-- | 6    | HAVING   | Filter aggregated groups     |
-- | 7    | SELECT   | Choose columns               |
-- | 8    | WINDOW   | Apply window functions       |
-- | 9    | ORDER BY | Sort results                 |
-- | 10   | LIMIT    | Restrict result rows         |
-- ============================================================


-- ============================================================
-- 2️⃣  Visual Example
-- ============================================================

SELECT department, AVG(salary)
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING AVG(salary) > 60000
ORDER BY AVG(salary) DESC;

-- Execution flow for the above query:
--
--   1. FROM employees            → pick the table
--   2. WHERE salary > 50000      → filter rows first
--   3. GROUP BY department        → group remaining rows
--   4. HAVING AVG(salary) > 60000 → filter groups
--   5. SELECT department, AVG()   → pick columns
--   6. ORDER BY AVG(salary) DESC  → sort final result
-- ============================================================