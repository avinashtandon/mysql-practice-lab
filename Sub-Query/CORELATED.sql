/*
================================================================================
1. Employees Earning Above Department Average
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Karan    | IT         | 80000  |
| 4      | Neha     | HR         | 45000  |
| 5      | Raj      | Sales      | 50000  |
+--------+----------+------------+--------+

Question:
Find employees whose salary is greater than the average salary of their department.

Expected Output:
+----------+------------+--------+
| emp_name | department | salary |
+----------+------------+--------+
| Karan    | IT         | 80000  |
| Neha     | HR         | 45000  |
+----------+------------+--------+
*/

-- Solution

SELECT emp_name,department,salary
FROM employees e1
WHERE e1.salary > (select avg(e2.salary)
FROM employees e2
WHERE e1.department = e2.department)

/*
================================================================================
2. Highest Salary in Each Department
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Karan    | IT         | 80000  |
| 4      | Neha     | HR         | 45000  |
| 5      | Raj      | Sales      | 50000  |
+--------+----------+------------+--------+

Question:
Find employees having the highest salary in their department.

Expected Output:
+----------+------------+--------+
| emp_name | department | salary |
+----------+------------+--------+
| Karan    | IT         | 80000  |
| Neha     | HR         | 45000  |
| Raj      | Sales      | 50000  |
+----------+------------+--------+
*/

-- Solution
SELECT emp_name,department,salary
FROM employees e1
WHERE e1.salary = (SELECT MAX(e2.salary)
FROM employees e2 
WHERE e1.department = e2.department)


/*
================================================================================
3. Customers Who Placed Orders
================================================================================

Table: customers
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 101         | Aman          |
| 102         | Riya          |
| 103         | Raj           |
+-------------+---------------+

Table: orders
+----------+-------------+
| order_id | customer_id |
+----------+-------------+
| 1        | 101         |
| 2        | 102         |
| 3        | 101         |
+----------+-------------+

Question:
Find customers who placed at least one order.

Expected Output:
+---------------+
| customer_name |
+---------------+
| Aman          |
| Riya          |
+---------------+
*/

-- Solution

SELECT customer_name
FROM customers c 
WHERE EXISTS (SELECT 1
FROM orders o 
WHERE C.customer_id = O.customer_id);

/*
================================================================================
4. Customers With No Orders
================================================================================

Table: customers
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 101         | Aman          |
| 102         | Riya          |
| 103         | Raj           |
+-------------+---------------+

Table: orders
+----------+-------------+
| order_id | customer_id |
+----------+-------------+
| 1        | 101         |
| 2        | 102         |
| 3        | 101         |
+----------+-------------+

Question:
Find customers who never placed any order.

Expected Output:
+---------------+
| customer_name |
+---------------+
| Raj           |
+---------------+
*/

-- Solution



/*
================================================================================
5. Products More Expensive Than Category Average
================================================================================

Table: products
+------------+--------------+-------------+-------+
| product_id | product_name | category    | price |
+------------+--------------+-------------+-------+
| 1          | Laptop       | Electronics | 70000 |
| 2          | Mouse        | Electronics | 1000  |
| 3          | Shirt        | Clothing    | 2000  |
| 4          | Jacket       | Clothing    | 5000  |
+------------+--------------+-------------+-------+

Question:
Find products whose price is greater than the average price of their category.

Expected Output:
+--------------+-------------+-------+
| product_name | category    | price |
+--------------+-------------+-------+
| Laptop       | Electronics | 70000 |
| Jacket       | Clothing    | 5000  |
+--------------+-------------+-------+
*/

-- Solution
SELECT product_name,category,price
FROM products p1
WHERE p1.price > (SELECT AVG(p2.price)
FROM products p2
WHERE p1.category = p2.category);