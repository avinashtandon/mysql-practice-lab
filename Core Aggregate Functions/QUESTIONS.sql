-- ============================================================
-- You will get tables + business problem, and you must decide
-- which SQL technique to use.
--
-- No hints. Think like a data engineer.
-- ============================================================

-- ============================================================
-- Question 1
-- ============================================================
-- Table: orders
-- | order_id | user_id | city   | amount | order_time |
-- |----------|---------|--------|--------|------------|
-- | 1        | 101     | Delhi  | 200    | 2024-01-01 |
-- | 2        | 101     | Delhi  | 150    | 2024-01-02 |
-- | 3        | 102     | Mumbai | 300    | 2024-01-02 |
-- | 4        | 103     | Delhi  | 250    | 2024-01-03 |
-- | 5        | 102     | Mumbai | 100    | 2024-01-04 |
-- | 6        | 104     | Pune   | 400    | 2024-01-05 |
--
-- Problem
-- Return the total revenue generated in each city.
--
-- Expected Output
-- | city | total_revenue |
-- ============================================================

-- Write your query below:
--
SELECT city,
       SUM(amount) AS total_revenue
FROM orders
GROUP BY city;
--

-- ============================================================
-- Question 2
-- ============================================================
-- Table: events
-- | event_id | user_id | event_type | event_time |
-- |----------|---------|------------|------------|
-- | 1        | 101     | login      | 10:00      |
-- | 2        | 101     | purchase   | 10:10      |
-- | 3        | 102     | login      | 10:20      |
-- | 4        | 101     | logout     | 10:30      |
-- | 5        | 103     | login      | 10:40      |
-- | 6        | 102     | purchase   | 10:50      |
--
-- Problem
-- Return how many events each user performed.
--
-- Expected Output
-- | user_id | total_events |
-- ============================================================

-- Write your query below:
--
SELECT user_id,
       COUNT(*)
FROM events
GROUP BY user_id;
--


-- ============================================================
-- Question 3
-- ============================================================
-- Table: transactions
-- | txn_id | user_id | amount | status  |
-- |--------|---------|--------|---------|
-- | 1      | 101     | 200    | success |
-- | 2      | 101     | 100    | failed  |
-- | 3      | 102     | 300    | success |
-- | 4      | 103     | 250    | success |
-- | 5      | 103     | 150    | success |
-- | 6      | 104     | 400    | failed  |
--
-- Problem
-- Return total successful transaction amount for each user.
--
-- Expected Output
-- | user_id | total_amount |
-- ============================================================

-- Write your query below:
--
SELECT user_id,
       SUM(amount) AS total_amount
FROM transactions
WHERE status = 'success'
GROUP BY user_id;

--


-- ============================================================
-- Question 4
-- ============================================================
-- Table: orders
-- | order_id | user_id | amount |
-- |----------|---------|--------|
-- | 1        | 101     | 200    |
-- | 2        | 101     | 150    |
-- | 3        | 102     | 300    |
-- | 4        | 103     | 250    |
-- | 5        | 103     | 350    |
-- | 6        | 104     | 400    |
--
-- Problem
-- Return average order value for each user.
--
-- Expected Output
-- | user_id | avg_order_value |
-- ============================================================

-- Write your query below:
--
SELECT user_id,
       AVG(amount) AS avg_order_value
FROM orders
GROUP BY user_id;
--


