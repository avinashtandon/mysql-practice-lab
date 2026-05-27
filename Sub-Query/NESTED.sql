================================================================================
Question 1
================================================================================

Find each employee along with:
- their department
- their salary
- the average salary of their department

Table: employees

+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 90000  |
| 2      | Karan    | IT         | 80000  |
| 3      | Riya     | HR         | 50000  |
| 4      | Neha     | HR         | 40000  |
| 5      | Vikram   | Sales      | 70000  |
| 6      | Sneha    | Sales      | 60000  |
+--------+----------+------------+--------+

Expected Output:

+----------+------------+--------+------------+
| emp_name | department | salary | avg_salary |
+----------+------------+--------+------------+
| Aman     | IT         | 90000  | 85000      |
| Karan    | IT         | 80000  | 85000      |
| Riya     | HR         | 50000  | 45000      |
| Neha     | HR         | 40000  | 45000      |
| Vikram   | Sales      | 70000  | 65000      |
| Sneha    | Sales      | 60000  | 65000      |
+----------+------------+--------+------------+

================================================================================
Question 2
================================================================================

Find each order along with:
- customer id
- order amount
- total amount spent by that customer

Table: orders

+----------+-------------+--------+
| order_id | customer_id | amount |
+----------+-------------+--------+
| 1        | 101         | 500    |
| 2        | 101         | 700    |
| 3        | 102         | 300    |
| 4        | 103         | 1000   |
| 5        | 102         | 200    |
+----------+-------------+--------+

Expected Output:

+----------+-------------+--------+-------------+
| order_id | customer_id | amount | total_spend |
+----------+-------------+--------+-------------+
| 1        | 101         | 500    | 1200        |
| 2        | 101         | 700    | 1200        |
| 3        | 102         | 300    | 500         |
| 4        | 103         | 1000   | 1000        |
| 5        | 102         | 200    | 500         |
+----------+-------------+--------+-------------+

SELECT order_id,customer_id,amount,total_spend
FROM orders o1
JOIN (SELECT customer_id, SUM(amount) AS total_spend
      FROM orders
      GROUP BY customer_id) o2
      ON o1.customer_id = o2.customer_id;

================================================================================
Question 3
================================================================================

Find each product along with:
- product category
- product sales
- total sales of that category

Table: products

+------------+--------------+-------------+-------+
| product_id | product_name | category    | sales |
+------------+--------------+-------------+-------+
| 1          | Laptop       | Electronics | 50000 |
| 2          | Mouse        | Electronics | 10000 |
| 3          | Chair        | Furniture   | 20000 |
| 4          | Table        | Furniture   | 30000 |
+------------+--------------+-------------+-------+

Expected Output:

+--------------+-------------+-------+----------------+
| product_name | category    | sales | category_sales |
+--------------+-------------+-------+----------------+
| Laptop       | Electronics | 50000 | 60000          |
| Mouse        | Electronics | 10000 | 60000          |
| Chair        | Furniture   | 20000 | 50000          |
| Table        | Furniture   | 30000 | 50000          |
+--------------+-------------+-------+----------------+
SELECT product_name,category,sales,p2.category_sales
FROM products p1
JOIN (
    SELECT category,
           SUM(sales) AS category_sales
           FROM products
           GROUP BY category
)p2
ON p1.category = p2.category;

================================================================================
Question 4
================================================================================

Find each student along with:
- their department
- their marks
- average marks of their department

Table: students

+------------+--------------+------------+-------+
| student_id | student_name | department | marks |
+------------+--------------+------------+-------+
| 1          | Ravi         | CS         | 90    |
| 2          | Priya        | CS         | 80    |
| 3          | Arjun        | IT         | 70    |
| 4          | Sneha        | IT         | 60    |
+------------+--------------+------------+-------+

Expected Output:

+--------------+------------+-------+-----------+
| student_name | department | marks | avg_marks |
+--------------+------------+-------+-----------+
| Ravi         | CS         | 90    | 85        |
| Priya        | CS         | 80    | 85        |
| Arjun        | IT         | 70    | 65        |
| Sneha        | IT         | 60    | 65        |
+--------------+------------+-------+-----------+
SELECT student_name,department,Marks,s2.avg_marks
FROM students s1
JOIN (SELECT department,
             AVG(marks) AS avg_marks
      FROM students
      GROUP BY department) s2
ON s1.department = s2.department;
================================================================================
Question 5
================================================================================

Find each employee order along with:
- employee id
- order value
- total order value handled by that employee

Table: employee_orders

+----------+-------------+-------------+
| order_id | employee_id | order_value |
+----------+-------------+-------------+
| 1        | E101        | 5000        |
| 2        | E101        | 3000        |
| 3        | E102        | 7000        |
| 4        | E103        | 2000        |
| 5        | E102        | 1000        |
+----------+-------------+-------------+

Expected Output:

+----------+-------------+-------------+-------------------+
| order_id | employee_id | order_value | total_order_value |
+----------+-------------+-------------+-------------------+
| 1        | E101        | 5000        | 8000              |
| 2        | E101        | 3000        | 8000              |
| 3        | E102        | 7000        | 8000              |
| 4        | E103        | 2000        | 2000              |
| 5        | E102        | 1000        | 8000              |
+----------+-------------+-------------+-------------------+
SELECT order_id,employee_id,order_value,eo2.total_order_value
FROM employee_orders eo1
JOIN (SELECT employee_id,
      SUM(order_value) AS total_order_value
      FROM employee_orders
      GROUP BY employee_id) eo2
ON eo1.employee_id = eo2.employee_id;