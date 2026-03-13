-- ============================================================
-- Question 1 — Daily Revenue Dashboard
-- ============================================================
-- Table: orders
-- | order_id | user_id | order_time       | amount |
-- |----------|---------|------------------|--------|
-- | 1        | 101     | 2026-03-10 10:10 | 200    |
-- | 2        | 102     | 2026-03-10 11:30 | 150    |
-- | 3        | 101     | 2026-03-11 09:00 | 300    |
-- | 4        | 103     | 2026-03-11 12:00 | 250    |
-- | 5        | 104     | 2026-03-11 15:00 | 100    |
--
-- Business Problem
-- The analytics team wants a daily metrics table.
--
-- Return:
-- | date | revenue | total_orders | unique_users |
-- ============================================================

-- Write your query below:
--
SELECT DATE(order_time) AS date,
       SUM(amount) AS revenue,
       COUNT(*) AS total_orders,
       COUNT(DISTINCT user_id) AS unique_users
FROM orders
GROUP BY DATE(order_time);       
--


-- ============================================================
-- Question 2 — Revenue by Country
-- ============================================================
-- Table: orders
-- | order_id | user_id | order_time | amount | country |
-- |----------|---------|------------|--------|---------|
-- | 1        | 101     | 2026-03-10 | 200    | India   |
-- | 2        | 102     | 2026-03-10 | 150    | India   |
-- | 3        | 103     | 2026-03-10 | 300    | US      |
-- | 4        | 104     | 2026-03-11 | 250    | India   |
-- | 5        | 105     | 2026-03-11 | 400    | US      |
--
-- Business Problem
-- The business wants to track daily revenue per country.
--
-- Return:
-- | date | country | revenue |
-- ============================================================

-- Write your query below:
--
SELECT  DATE(order_time) AS date,
        country,
        SUM(amount)
FROM orders
GROUP BY DATE(order_time),country;
--


-- ============================================================
-- Question 3 — Top Spending Users Per Day
-- ============================================================
-- Table: orders
-- | order_id | user_id | order_time | amount |
-- |----------|---------|------------|--------|
-- | 1        | 101     | 2026-03-10 | 200    |
-- | 2        | 101     | 2026-03-10 | 150    |
-- | 3        | 102     | 2026-03-10 | 300    |
-- | 4        | 103     | 2026-03-11 | 400    |
-- | 5        | 103     | 2026-03-11 | 100    |
--
-- Business Problem
-- Find total spending per user per day.
--
-- Return:
-- | date | user_id | total_spent |
-- ============================================================

-- Write your query below:
--
SELECT DATE(order_time) AS date,
       user_id,
       SUM(amount) AS total_spent
FROM orders
GROUP BY DATE(order_time),user_id;
----------------------------------------------------------------

🧠 Important Data Engineering Insight

Many beginners incorrectly mix:

DISTINCT
GROUP BY

But GROUP BY already guarantees uniqueness of the grouping columns.

So this:

GROUP BY date, user_id

automatically produces one row per (date, user_id).
--


-- ============================================================
-- Question 4 — High Value Revenue Report
-- ============================================================
-- Table: orders
-- | order_id | user_id | order_time | amount |
-- |----------|---------|------------|--------|
-- | 1        | 101     | 2026-03-10 | 200    |
-- | 2        | 102     | 2026-03-10 | 50     |
-- | 3        | 103     | 2026-03-10 | 500    |
-- | 4        | 104     | 2026-03-11 | 600    |
-- | 5        | 105     | 2026-03-11 | 80     |
--
-- Business Problem
-- Finance wants to know daily revenue from high-value orders (>100).
--
-- Return:
-- | date | high_value_revenue |
-- ============================================================

-- Write your query below:
--
SELECT DATE(order_time) AS date,
       SUM(amount) AS high_value_revenue
FROM orders
WHERE amount > 100
GROUP BY DATE(order_time);
--


-- ============================================================
-- Question 5 — User Order Frequency
-- ============================================================
-- Table: orders
-- | order_id | user_id | order_time | amount |
-- |----------|---------|------------|--------|
-- | 1        | 101     | 2026-03-10 | 200    |
-- | 2        | 101     | 2026-03-11 | 150    |
-- | 3        | 101     | 2026-03-12 | 300    |
-- | 4        | 102     | 2026-03-10 | 250    |
-- | 5        | 102     | 2026-03-11 | 100    |
--
-- Business Problem
-- Find how many orders each user placed.
--
-- Return:
-- | user_id | total_orders |
-- ============================================================

-- Write your query below:
--
SELECT user_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY user_id;
--