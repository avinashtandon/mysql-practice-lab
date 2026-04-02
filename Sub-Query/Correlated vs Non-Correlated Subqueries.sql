/*
Concept

1. Non-Correlated Subquery
- Runs once
- Independent of outer query
- Think: static lookup
*/

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

/*
👉 Subquery runs once → gives a single value → outer query uses it

2. Correlated Subquery (IMPORTANT for DE interviews)
- Runs for every row of outer query
- Uses columns from outer query
- Think: row-by-row evaluation
*/

SELECT e1.*
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);

/*
👉 Subquery executes per row → expensive on large datasets


======================================================================
Question 1 (Level 1 → DE Thinking Starts)
======================================================================

📊 Table: transactions
transaction_id  user_id  amount  created_at
1               101      100     2024-01-01
2               101      200     2024-01-02
3               102      50      2024-01-01
4               102      300     2024-01-03
5               103      400     2024-01-01

🎯 Problem:
Find transactions where the amount is greater than the user's average transaction amount

🧾 Expected Output:
transaction_id  user_id  amount
2               101      200
4               102      300
*/

-- Solution using Correlated Subquery:
SELECT t1.transaction_id,t1.user_id,t1.amount
FROM transactions t1
WHERE t1.amount > (SELECT AVG(t2.amount)
                   FROM transactions t2
                   WHERE t1.user_id = t2.user_id);



/*
======================================================================
Question 2 (Level 2 → Slight Twist)
======================================================================

📊 Table: orders
order_id  user_id  amount
1         101      100
2         101      500
3         101      200
4         102      50
5         102      70

🎯 Problem:
Find users who have at least one order greater than their own average order amount

🧾 Expected Output:
user_id
101
102
*/

-- Solution using Correlated Subquery:
SELECT DISTINCT o1.user_id
FROM orders o1
WHERE o1.amount > (SELECT AVG(o2.amount)
                FROM orders o2
                WHERE o1.user_id = o2.user_id);



/*
======================================================================
Question 3 (Level 3 → Interview Level)
======================================================================

📊 Table: products
product_id  category  price
1           A         100
2           A         200
3           A         300
4           B         50
5           B         80

🎯 Problem:
Find products that are more expensive than at least 50% of products in their category

🧾 Expected Output:
product_id  category  price
2           A         200
3           A         300
5           B         80
*/

-- Solution using Correlated Subquery:
SELECT p1.product_id,p1.category,p1.price
FROM products p1
WHERE p1.price > (SELECT AVG(p2.price)
                   FROM products p2
                   WHERE p1.product_id = p2.product_id);