/*
================================================================================
1. Employees With Same Department and Salary
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Kunal    | IT         | 70000  |
| 4      | Neha     | Finance    | 60000  |
| 5      | Raj      | HR         | 40000  |
| 6      | Simran   | IT         | 90000  |
+--------+----------+------------+--------+

Question:
Find employees whose (department, salary) matches employees working in HR department.

Expected Output:
+----------+------------+--------+
| emp_name | department | salary |
+----------+------------+--------+
| Riya     | HR         | 40000  |
| Raj      | HR         | 40000  |
+----------+------------+--------+
*/

-- Solution
SELECT emp_name,department,salary
FROM employees
WHERE (department,salary) IN (SELECT department,salary
                               FROM employees
                               WHERE department = 'HR');


/*
================================================================================
2. Products With Same Category and Price
================================================================================

Table: products
+------------+--------------+----------+--------+
| product_id | product_name | category | price  |
+------------+--------------+----------+--------+
| 1          | iPhone       | Mobile   | 80000  |
| 2          | Galaxy       | Mobile   | 75000  |
| 3          | MacBook      | Laptop   | 120000 |
| 4          | Dell XPS     | Laptop   | 120000 |
| 5          | Redmi        | Mobile   | 20000  |
+------------+--------------+----------+--------+

Question:
Find products whose (category, price) matches MacBook.

Expected Output:
+--------------+----------+--------+
| product_name | category | price  |
+--------------+----------+--------+
| MacBook      | Laptop   | 120000 |
| Dell XPS     | Laptop   | 120000 |
+--------------+----------+--------+
*/

-- Solution

SELECT product_name,category,price
FROM products
WHERE (category,price) IN (
    SELECT category,price
    FROM products
    WHERE product_name='MacBook'
);

/*
================================================================================
3. Students With Same Department and Marks
================================================================================

Table: students
+------------+--------------+------------+-------+
| student_id | student_name | department | marks |
+------------+--------------+------------+-------+
| 1          | Ravi         | CS         | 95    |
| 2          | Priya        | IT         | 88    |
| 3          | Arjun        | CS         | 95    |
| 4          | Sneha        | IT         | 91    |
| 5          | Meena        | CS         | 80    |
+------------+--------------+------------+-------+

Question:
Find students whose (department, marks) matches Ravi.

Expected Output:
+--------------+------------+-------+
| student_name | department | marks |
+--------------+------------+-------+
| Ravi         | CS         | 95    |
| Arjun        | CS         | 95    |
+--------------+------------+-------+
*/

-- Solution

SELECT student_name,department,marks
FROM students
WHERE (department,marks) IN (
    SELECT department,marks 
    FROM students
    WHERE student_name='Ravi'
);

/*
================================================================================
4. Orders With Same City and Amount
================================================================================

Table: orders
+----------+---------------+--------+--------+
| order_id | customer_name | city   | amount |
+----------+---------------+--------+--------+
| 1        | Aman          | Delhi  | 5000   |
| 2        | Riya          | Mumbai | 7000   |
| 3        | Kunal         | Delhi  | 5000   |
| 4        | Neha          | Pune   | 9000   |
| 5        | Raj           | Mumbai | 7000   |
+----------+---------------+--------+--------+

Question:
Find orders whose (city, amount) matches Mumbai customers.

Expected Output:
+---------------+--------+--------+
| customer_name | city   | amount |
+---------------+--------+--------+
| Riya          | Mumbai | 7000   |
| Raj           | Mumbai | 7000   |
+---------------+--------+--------+
*/

-- Solution



/*
================================================================================
5. Employees With Same Department and Joining Year
================================================================================

Table: employees
+--------+----------+------------+--------------+
| emp_id | emp_name | department | joining_year |
+--------+----------+------------+--------------+
| 1      | Aman     | IT         | 2021         |
| 2      | Riya     | HR         | 2022         |
| 3      | Kunal    | IT         | 2021         |
| 4      | Neha     | Finance    | 2020         |
| 5      | Raj      | HR         | 2022         |
+--------+----------+------------+--------------+

Question:
Find employees whose (department, joining_year) matches HR employees.

Expected Output:
+----------+------------+--------------+
| emp_name | department | joining_year |
+----------+------------+--------------+
| Riya     | HR         | 2022         |
| Raj      | HR         | 2022         |
+----------+------------+--------------+
*/

-- Solution



/*
================================================================================
6. Duplicate Department and Salary Combination
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Kunal    | IT         | 70000  |
| 4      | Neha     | Finance    | 60000  |
| 5      | Raj      | HR         | 40000  |
| 6      | Simran   | IT         | 90000  |
+--------+----------+------------+--------+

Question:
Find employees whose (department, salary) combination appears more than once.

Expected Output:
+----------+------------+--------+
| emp_name | department | salary |
+----------+------------+--------+
| Aman     | IT         | 70000  |
| Kunal    | IT         | 70000  |
| Riya     | HR         | 40000  |
| Raj      | HR         | 40000  |
+----------+------------+--------+
*/

-- Solution

