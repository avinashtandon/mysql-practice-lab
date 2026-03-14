/*
================================================================================
🚀 MYSQL SUBQUERIES: THE ULTIMATE GUIDE (DATA ENGINEER POV)
================================================================================
From Basics (Kid Level) to Advanced (Pro Data Engineer)
================================================================================

--------------------------------------------------------------------------------
1. WHAT IS A SUBQUERY? (Explain Like I'm 5)
--------------------------------------------------------------------------------
Imagine you want to buy the most expensive toy in a store, but you don't know the exact price.
First, you have to ask: "What is the highest price overall?" (Inner Query)
Then, you ask the cashier: "Give me the toy that has THAT exact price." (Outer Query)

A Subquery is just "a query inside another query". Like a Russian nesting doll.

Basic Syntax:
SELECT toy_name 
FROM toys 
WHERE price = (SELECT MAX(price) FROM toys); -- < The Subquery goes in parentheses!

--------------------------------------------------------------------------------
2. WHY DO WE NEED THEM?
--------------------------------------------------------------------------------
- Dynamic Filtering: You can't hardcode values because data changes daily. 
  (e.g., getting customers who bought above the *current* month's average).
- Breaking down complex problems: Solving smaller intermediate pieces before 
  doing the main work.

================================================================================
🌟 TYPES OF SUBQUERIES (What they are & When to use them)
================================================================================

Type 1: SCALAR SUBQUERIES (Returns 1 Row, 1 Column)
---------------------------------------------------
- What: It returns a single mathematical/string value (like '500' or 'Alice').
- How: Use it with =, >, <, >=, <=, <>
- When: You need a single dynamic threshold/value for filtering or basic math.
- Example: 
    SELECT employee_name, salary 
    FROM employees 
    WHERE salary > (SELECT AVG(salary) FROM employees);

Type 2: COLUMN / LIST SUBQUERIES (Returns N Rows, 1 Column)
-----------------------------------------------------------
- What: Returns a single-column list of values (like [10, 20, 30]). 
- How: Use it with IN, NOT IN, ANY, ALL.
- When: Filtering your main table against a list of IDs or categories dynamically.
- Example: 
    SELECT order_id 
    FROM orders 
    WHERE customer_id IN (SELECT id FROM customers WHERE country = 'India');

Type 3: ROW SUBQUERIES (Returns 1 Row, N Columns)
-------------------------------------------------
- What: Compares multiple columns simultaneously against a single row result.
- When: You need to match exact combinations of columns in one go.
- Example:
    SELECT * FROM employees 
    WHERE (department_id, salary) = (
        SELECT department_id, MAX(salary) 
        FROM employees WHERE department_id = 5
    );

Type 4: TABLE SUBQUERIES / DERIVED TABLES (Returns N Rows, N Columns)
---------------------------------------------------------------------
- What: A subquery in the FROM clause. It acts exactly like a temporary table.
- When: You need to pre-aggregate or filter heavy data BEFORE joining it 
        to another main table.
- Mandatory Rule: MySQL requires you to give it an alias!
- Example:
    SELECT temp_table.dept_id, temp_table.total_spent 
    FROM (
        SELECT dept_id, SUM(salary) as total_spent 
        FROM employees 
        GROUP BY dept_id
    ) AS temp_table -- < Alias is mandatory!
    WHERE temp_table.total_spent > 100000;


================================================================================
🧠 INTERMEDIATE: CORRELATED vs UNCORRELATED (CRITICAL CONCEPT!)
================================================================================

1. UNCORRELATED SUBQUERIES (The Good)
- They do NOT depend on the outer query at all. 
- MySQL runs them exactly ONCE, caches the result, and uses it for the outer query.
- Very Fast and safe.
(All examples above were Uncorrelated).

2. CORRELATED SUBQUERIES (The Bad & Ugly - BE CAREFUL!)
- They DEPEND on the outer query. The inner query references a column from the outer query.
- MySQL must run the inner query ONCE FOR EVERY SINGLE ROW in the outer query!
- Example: (Find employees earning more than the average of THEIR OWN department)
    SELECT e1.name, e1.salary, e1.dept_id
    FROM employees e1
    WHERE e1.salary > (
        SELECT AVG(e2.salary) 
        FROM employees e2 
        WHERE e1.dept_id = e2.dept_id -- < THIS references outer 'e1'. Matches row-by-row!
    );
- Impact: If you have 1 Million employees, that inner query runs 1 Million times! 📉🔥

================================================================================
🔥 ADVANCED: THE DATA ENGINEER POV (Performance & Real-world rules)
================================================================================
As a Data Engineer, you don't just write SQL that works; you write SQL that SCALES.
When processing Gigabytes/Terabytes of data, bad subqueries will crash the database.
Here is the PRO playbook:

1. WHEN TO AVOID SUBQUERIES & USE JOINS INSTEAD
------------------------------------------------
Why? Joins are historically highly optimized by the MySQL execution engine. 
It can use indexes on both sides easily, while subqueries in the WHERE clause 
(especially NOT IN) can sometimes trick the optimizer into full table scans.
- Avoid: `SELECT * FROM A WHERE id IN (SELECT a_id FROM B)`
- Prefer: `SELECT A.* FROM A JOIN B ON A.id = B.a_id`
(Note: Modern MySQL 8.0 optimizer is smart enough to convert simple IN subqueries 
to joins under the hood, but explicit joins are often safer and clearer for complex logic).

2. THE "EXISTS" vs "IN" BATTLE (Performance Secret)
---------------------------------------------------
- IN subqueries: Evaluates the inner query entirely, saves the results in memory, 
                 removes duplicates, and compares.
  - Good for: Small literal lists or when the inner query dataset is tiny.
- EXISTS subqueries: Checks for the *presence* of a row. The moment it finds ONE match, 
                     it stops searching (called short-circuiting).
  - Good for: Huge tables in the subquery where you only care if a relationship exists.
  - Example: `SELECT * FROM customers c WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);`
  - TL;DR: If Subquery table is MASSIVE -> Use EXISTS instead of IN. 

3. AVOID CORRELATED SUBQUERIES AT ALL COSTS -> USE WINDOW FUNCTIONS OR JOINS
----------------------------------------------------------------------------
Correlated subqueries murder pipelines. Rewrite them immediately!
- Bad (Correlated): Finding row with Max timestamp for each user.
- Good (Pro DE approach - Window Functions - MySQL 8.0+):
    WITH RankedData AS (
        SELECT user_id, event_name, 
               ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_time DESC) as rn
        FROM events
    )
    SELECT * FROM RankedData WHERE rn = 1;
- Good (Pro DE approach - Joins): 
    Group By user_id, get MAX(time), and JOIN that temp result back to the table.

4. CTEs (`WITH` clause) vs SUBQUERIES IN `FROM`
-----------------------------------------------
- Subqueries nested deeply in the `FROM` clause make the code unreadable ("spaghetti SQL").
- Data Engineers almost always prefer Common Table Expressions (CTEs) to replace deep nested subqueries. They execute the exact same way but read top-to-bottom logically.
- Rule of thumb: If you are nesting a subquery inside a subquery, STOP. Use a CTE instead.

================================================================================
💡 SUMMARY CHEATSHEET FOR DATA ENGINEERS:
================================================================================
1. Need a single dynamic threshold? -> SCALAR Subquery
2. Need to pre-aggregate a massive table before joining? -> SUBQUERY in FROM / CTE
3. Checking if a record exists in another massive table? -> EXISTS 
4. Filtering on a small, predictable list of IDs? -> IN
5. See a Correlated Subquery? -> BURN IT. Rewrite using JOINs or Window Functions!
6. Nesting more than 1 level deep? -> Refactor into CTEs (`WITH` clauses) for readability.
================================================================================
*/
