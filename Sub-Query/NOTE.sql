SQL SUBQUERIES — DATA ENGINEERING NOTES

---

1. WHAT IS A SUBQUERY (DE PERSPECTIVE)

A subquery is a query inside another query used to:

* Filter data
* Compare values
* Check existence of records
* Build intermediate datasets

Think of it as:
“A way to derive temporary datasets inside a query pipeline”

---

2. TYPES OF SUBQUERIES (BASED ON OUTPUT)

A. SCALAR SUBQUERY (SINGLE VALUE)

Returns exactly one value.

Example:
SELECT AVG(salary) FROM employees;

Used with comparison operators:
=, >, <, >=, <=

Example:
SELECT *
FROM employees
WHERE salary > (
SELECT AVG(salary) FROM employees
);

DE Insight:

* Can be inefficient at scale if recalculated repeatedly
* Prefer pre-aggregation + JOIN for large datasets

---

B. MULTI-ROW SUBQUERY (SET OF VALUES)

Returns multiple rows.

Used with:
IN, NOT IN, ANY, ALL

Example:
SELECT user_id
FROM users
WHERE user_id IN (
SELECT user_id FROM orders
);

DE Insight:

* IN can be slow for large datasets
* Builds intermediate list → memory heavy
* Prefer JOIN or EXISTS for scalability

---

C. CORRELATED SUBQUERY

Depends on outer query row.

Example:
SELECT u.user_id
FROM users u
WHERE EXISTS (
SELECT 1
FROM orders o
WHERE o.user_id = u.user_id
);

Key Behavior:

* Executes logically per row
* Optimizer may convert to semi-join

DE Insight:

* Very useful for event/log data
* Works well with indexes

---

3. COMPARISON OPERATORS WITH SUBQUERIES

Used when subquery returns a single value.

Operators:
=, >, <, >=, <=

Example:
SELECT *
FROM orders
WHERE amount > (
SELECT AVG(amount) FROM orders
);

---

4. LOGICAL OPERATORS WITH SUBQUERIES

A. IN

WHERE user_id IN (subquery)

Matches any value from subquery.

Example:
SELECT user_id
FROM users
WHERE user_id IN (
SELECT user_id FROM orders
);

DE Insight:

* Not efficient for large datasets

---

B. NOT IN (DANGEROUS)

WHERE user_id NOT IN (subquery)

Problem:

* If subquery contains NULL → returns NO rows

Avoid in production systems.

---

C. EXISTS (MOST IMPORTANT)

WHERE EXISTS (subquery)

Returns TRUE if subquery returns at least one row.

Example:
SELECT user_id
FROM users u
WHERE EXISTS (
SELECT 1
FROM events e
WHERE e.user_id = u.user_id
);

DE Insight:

* Stops scanning after first match
* Highly efficient for large tables

---

D. NOT EXISTS

WHERE NOT EXISTS (subquery)

Used for anti-joins.

Example:
SELECT u.user_id
FROM users u
WHERE NOT EXISTS (
SELECT 1
FROM orders o
WHERE o.user_id = u.user_id
);

DE Insight:

* NULL-safe
* Preferred over NOT IN

---

5. ANY AND ALL (ADVANCED)

A. ANY

WHERE amount > ANY (subquery)

Meaning:
Greater than at least one value.

---

B. ALL

WHERE amount > ALL (subquery)

Meaning:
Greater than every value.

Example:
SELECT *
FROM orders
WHERE amount > ALL (
SELECT amount
FROM orders
WHERE status = 'returned'
);

---

6. KEY DATA ENGINEERING COMPARISONS

IN vs EXISTS

IN:

* Builds full list
* Slower on large datasets
* Good for small lookup tables

EXISTS:

* Stops early
* Faster for large datasets
* Preferred for event/log filtering

---

NOT IN vs NOT EXISTS

NOT IN:

* Breaks with NULLs
* Unsafe

NOT EXISTS:

* NULL-safe
* Production-safe
* Preferred

---

7. QUERY EXECUTION THINKING (DE LEVEL)

When using IN:

* Is the subquery large?
* Will it create memory pressure?
* Is there an index?

When using EXISTS:

* Can the DB stop early?
* Is there an index on join column?
* Will it become a semi-join?

---

8. GOLDEN RULES

9. Avoid NOT IN → use NOT EXISTS

10. Avoid large IN → use JOIN or EXISTS

11. Use EXISTS for large event/log tables

12. Precompute aggregates instead of repeated scalar subqueries

13. Always think about execution plan and data size

---

9. REAL-WORLD USAGE MAPPING

Scalar subquery → thresholds (e.g., avg salary)
IN → small lookup tables
EXISTS → user activity / logs
NOT EXISTS → missing data detection (anti-join)

---

END OF NOTES
