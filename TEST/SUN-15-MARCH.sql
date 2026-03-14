/*
================================================================================
Data Engineering SQL Practice (10 Questions)
Date: SUN-15-MARCH
================================================================================
*/

-- Question 1 — Daily Active Users
/*
Table: user_events

| event_id | user_id | event_type | event_time         |
|----------|---------|------------|--------------------|
| 1        | 101     | login      | 2024-01-01 10:00   |
| 2        | 102     | login      | 2024-01-01 11:00   |
| 3        | 101     | purchase   | 2024-01-01 12:00   |
| 4        | 103     | login      | 2024-01-02 09:00   |
| 5        | 101     | logout     | 2024-01-02 10:00   |

Return daily active users (DAU).

Output:
| date | active_users |
*/

-- Solution:
--
SELECT DATE(event_time) AS date,
       COUNT(DISTINCT(user_id)) AS active_users
FROM user_events
GROUP BY date;
--



--------------------------------------------------------------------------------

-- Question 2 — Revenue per Country
/*
Tables:
orders
| order_id | user_id | amount |
|----------|---------|--------|
| 1        | 101     | 200    |
| 2        | 102     | 150    |
| 3        | 103     | 300    |
| 4        | 101     | 250    |

users
| user_id | country |
|---------|---------|
| 101     | India   |
| 102     | India   |
| 103     | US      |
| 104     | Canada  |

Return:
| country | total_revenue |
*/

-- Solution:
--
SELECT u.country,
       SUM(o.amount) AS total_revenue
FROM orders o 
LEFT JOIN users u
         ON u.user_id = o.user_id
GROUP BY u.country;
--


--------------------------------------------------------------------------------

-- Question 3 — Users With Multiple Orders
/*
Table: orders
| order_id | user_id | amount |
|----------|---------|--------|
| 1        | 101     | 200    |
| 2        | 101     | 150    |
| 3        | 102     | 300    |
| 4        | 103     | 250    |
| 5        | 103     | 100    |
| 6        | 104     | 500    |

Return users who placed more than one order.

Output:
| user_id | order_count |
*/

-- Solution:
--
SELECT user_id,
       COUNT(*) AS order_count
FROM orders
GROUP BY user_id
HAVING order_count > 1;
--
--------------------------------------------------------------------------------

-- Question 4 — Gmail Users Who Placed Orders
/*
Tables:
users
| user_id | email            |
|---------|------------------|
| 1       | rahul@gmail.com  |
| 2       | priya@yahoo.com  |
| 3       | amit@gmail.com   |
| 4       | sara@hotmail.com |

orders
| order_id | user_id |
|----------|---------|
| 1        | 1       |
| 2        | 3       |
| 3        | 3       |

Return Gmail users who have placed at least one order.

Output:
| user_id | email |
*/

-- Solution:
--
SELECT u.user_id,
       u.email 
FROM users u 
INNER JOIN orders o 
          ON o.user_id = u.user_id
WHERE u.email LIKE '%gmail.com%';
--


--------------------------------------------------------------------------------

-- Question 5 — Users Without Orders
/*
Tables:
users
| user_id | name  |
|---------|-------|
| 101     | Rahul |
| 102     | Neha  |
| 103     | Arjun |
| 104     | Sara  |

orders
| order_id | user_id |
|----------|---------|
| 1        | 101     |
| 2        | 102     |
| 3        | 101     |

Return users who never placed an order.

Output:
| user_id | name |
*/

-- Solution:



--------------------------------------------------------------------------------

-- Question 6 — Duplicate Orders Detection
/*
Table: orders
| order_id | user_id | amount | order_time |
|----------|---------|--------|------------|
| 1        | 101     | 200    | 2024-01-01 |
| 2        | 101     | 200    | 2024-01-01 |
| 3        | 102     | 300    | 2024-01-02 |
| 4        | 103     | 250    | 2024-01-03 |
| 5        | 103     | 250    | 2024-01-03 |

Return duplicate records based on:
- user_id
- amount
- order_time
*/

-- Solution:



--------------------------------------------------------------------------------

-- Question 7 — Top Spending Users
/*
Table: orders
| order_id | user_id | amount |
|----------|---------|--------|
| 1        | 101     | 200    |
| 2        | 101     | 150    |
| 3        | 102     | 300    |
| 4        | 102     | 250    |
| 5        | 103     | 100    |

Return top 2 users by total spending.

Output:
| user_id | total_spent |
*/

-- Solution:



--------------------------------------------------------------------------------

-- Question 8 — Orders With Missing Users
/*
Tables:
orders
| order_id | user_id | amount |
|----------|---------|--------|
| 1        | 101     | 200    |
| 2        | 105     | 150    |
| 3        | 103     | 300    |

users
| user_id | name  |
|---------|-------|
| 101     | Rahul |
| 102     | Neha  |
| 103     | Arjun |

Return orders where the user record is missing in the users table.
*/

-- Solution:



--------------------------------------------------------------------------------

-- Question 9 — Daily Revenue Report
/*
Table: orders
| order_id | user_id | amount | order_time |
|----------|---------|--------|------------|
| 1        | 101     | 200    | 2024-01-01 |
| 2        | 102     | 150    | 2024-01-01 |
| 3        | 101     | 300    | 2024-01-02 |
| 4        | 103     | 250    | 2024-01-02 |

Return:
| date | revenue | order_count | unique_users |
*/

-- Solution:



--------------------------------------------------------------------------------

-- Question 10 — Users Referring Other Users (Self Join)
/*
Table: users
| user_id | name  | referred_by |
|---------|-------|-------------|
| 1       | Rahul | NULL        |
| 2       | Neha  | 1           |
| 3       | Arjun | 1           |
| 4       | Sara  | 2           |
| 5       | Amit  | NULL        |

Return:
| referrer_name | referred_user |
*/

-- Solution:



--------------------------------------------------------------------------------