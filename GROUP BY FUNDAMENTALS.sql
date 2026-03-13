-- ============================================================
-- Tables
-- ============================================================

-- Table: employees
-- | id | name   | department | salary |
-- |----|--------|------------|--------|
-- | 1  | Rahul  | IT         | 70000  |
-- | 2  | Neha   | HR         | 50000  |
-- | 3  | Arjun  | IT         | 80000  |
-- | 4  | Priya  | Finance    | 60000  |
-- | 5  | Aman   | IT         | 65000  |
-- | 6  | Kavita | HR         | 55000  |

-- Table: orders
-- | order_id | user_id | city   | amount |
-- |----------|---------|--------|--------|
-- | 1        | 101     | Delhi  | 500    |
-- | 2        | 102     | Mumbai | 700    |
-- | 3        | 101     | Delhi  | 300    |
-- | 4        | 103     | Delhi  | 400    |
-- | 5        | 104     | Mumbai | 600    |
-- | 6        | 101     | Delhi  | 200    |

-- Table: transactions
-- | transaction_id | user_id | amount |
-- |----------------|---------|--------|
-- | 1              | 101     | 200    |
-- | 2              | 102     | 500    |
-- | 3              | 101     | 300    |
-- | 4              | 103     | 400    |
-- | 5              | 102     | 200    |
-- | 6              | 101     | 100    |
Questions
Question 1

Show number of employees in each department.

Return:

department
employee_count
--
SELECT e.department, COUNT (*) AS employee_count
FROM employees e 
GROUP BY e.department;
--
Question 2

Show total revenue generated from each city.

Return:

city
total_orders
total_revenue
Question 3
--
SELECT city,
       COUNT(*) AS total_orders,
       SUM(amount) AS total_revenue
FROM orders 
GROUP BY city;
--
Show total spending done by each user.

Return:

user_id
total_spent
--
SELECT user_id,
       SUM(amount) AS total_spent
FROM transactions
GROUP BY user_id;
--

Question 4

Show cities where total revenue is greater than 1000.

Return:

city
total_revenue

Using table:

orders
-- Table: orders
-- | order_id | user_id | city   | amount |
-- |----------|---------|--------|--------|
-- | 1        | 101     | Delhi  | 500    |
-- | 2        | 102     | Mumbai | 700    |
-- | 3        | 101     | Delhi  | 300    |
-- | 4        | 103     | Delhi  | 400    |
-- | 5        | 104     | Mumbai | 600    |
-- | 6        | 101     | Delhi  | 200    |
--------------------------------------------

Next Question (Important Interview Pattern)
Question 5

Show total revenue per city per user.

Return:

city
user_id
total_revenue
--
SELECT city,
       user_id,
       SUM(amount) AS total_revenue
FROM orders
GROUP BY  city,user_id;
--

Using table:

orders

--
SELECT city,
       SUM(amount) AS total_revenue
FROM orders
GROUP BY city
HAVING total_revenue > 1000;
--