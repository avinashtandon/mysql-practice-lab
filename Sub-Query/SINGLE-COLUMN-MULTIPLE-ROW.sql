/*
================================================================================
1. Students With Same Marks as CS Students
================================================================================

Table: students
+------------+--------------+------------+-------+
| student_id | student_name | department | marks |
+------------+--------------+------------+-------+
| 1          | Ravi         | CS         | 95    |
| 2          | Priya        | IT         | 88    |
| 3          | Arjun        | CS         | 91    |
| 4          | Sneha        | ECE        | 85    |
| 5          | Karan        | IT         | 91    |
| 6          | Meera        | CS         | 78    |
+------------+--------------+------------+-------+

Question:
Find students whose marks are equal to marks scored by CS students.

Expected Output:
+--------------+-------+
| student_name | marks |
+--------------+-------+
| Ravi         | 95    |
| Arjun        | 91    |
| Karan        | 91    |
| Meera        | 78    |
+--------------+-------+
*/

-- Solution

SELECT student_name,marks
FROM students
WHERE marks IN (SELECT marks
                    FROM students
                    WHERE department='CS');

/*
================================================================================
2. Employees Working in Selected Departments
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Karan    | IT         | 80000  |
| 4      | Neha     | Sales      | 50000  |
| 5      | Arjun    | HR         | 45000  |
| 6      | Dev      | Finance    | 90000  |
+--------+----------+------------+--------+

Table: allowed_departments
+-----------+
| dept_name |
+-----------+
| IT        |
| HR        |
+-----------+

Question:
Find employees working in departments listed in the allowed_departments table.

Expected Output:
+----------+------------+
| emp_name | department |
+----------+------------+
| Aman     | IT         |
| Riya     | HR         |
| Karan    | IT         |
| Arjun    | HR         |
+----------+------------+
*/

-- Solution
SELECT emp_name,department
FROM employees
WHERE department IN (SELECT dept_name
FROM allowed_departments);


/*
================================================================================
3. Employees Earning More Than ANY HR Employee
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Karan    | IT         | 80000  |
| 4      | Neha     | Sales      | 50000  |
| 5      | Arjun    | HR         | 45000  |
| 6      | Dev      | Finance    | 90000  |
+--------+----------+------------+--------+

Question:
Find employees earning more than ANY HR employee.

Expected Output:
+----------+--------+
| emp_name | salary |
+----------+--------+
| Aman     | 70000  |
| Karan    | 80000  |
| Neha     | 50000  |
| Arjun    | 45000  |
| Dev      | 90000  |
+----------+--------+
*/

-- Solution



/*
================================================================================
4. Employees Earning More Than ALL HR Employees
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Karan    | IT         | 80000  |
| 4      | Neha     | Sales      | 50000  |
| 5      | Arjun    | HR         | 45000  |
| 6      | Dev      | Finance    | 90000  |
+--------+----------+------------+--------+

Question:
Find employees earning more than ALL HR employees.

Expected Output:
+----------+--------+
| emp_name | salary |
+----------+--------+
| Aman     | 70000  |
| Karan    | 80000  |
| Neha     | 50000  |
| Dev      | 90000  |
+----------+--------+
*/

-- Solution



/*
================================================================================
5. Products Cheaper Than ANY Furniture Product
================================================================================

Table: products
+------------+--------------+-------------+-------+
| product_id | product_name | category    | price |
+------------+--------------+-------------+-------+
| 1          | Laptop       | Electronics | 60000 |
| 2          | Mouse        | Electronics | 800   |
| 3          | Keyboard     | Electronics | 1500  |
| 4          | Chair        | Furniture   | 7000  |
| 5          | Table        | Furniture   | 12000 |
+------------+--------------+-------------+-------+

Question:
Find products whose price is less than ANY furniture product price.

Expected Output:
+--------------+-------+
| product_name | price |
+--------------+-------+
| Mouse        | 800   |
| Keyboard     | 1500  |
+--------------+-------+
*/

-- Solution



/*
================================================================================
6. Products Costlier Than ALL Furniture Products
================================================================================

Table: products
+------------+--------------+-------------+-------+
| product_id | product_name | category    | price |
+------------+--------------+-------------+-------+
| 1          | Laptop       | Electronics | 60000 |
| 2          | Mouse        | Electronics | 800   |
| 3          | Keyboard     | Electronics | 1500  |
| 4          | Chair        | Furniture   | 7000  |
| 5          | Table        | Furniture   | 12000 |
+------------+--------------+-------------+-------+

Question:
Find products whose price is greater than ALL furniture product prices.

Expected Output:
+--------------+-------+
| product_name | price |
+--------------+-------+
| Laptop       | 60000 |
+--------------+-------+
*/

-- Solution



/*
================================================================================
7. Students From Departments Having High Scorers
================================================================================

Table: students
+------------+--------------+------------+-------+
| student_id | student_name | department | marks |
+------------+--------------+------------+-------+
| 1          | Ravi         | CS         | 95    |
| 2          | Priya        | IT         | 88    |
| 3          | Arjun        | CS         | 91    |
| 4          | Sneha        | ECE        | 85    |
| 5          | Karan        | IT         | 91    |
| 6          | Meera        | CS         | 78    |
+------------+--------------+------------+-------+

Question:
Find students whose department matches departments of students scoring above 90.

Expected Output:
+--------------+------------+
| student_name | department |
+--------------+------------+
| Ravi         | CS         |
| Priya        | IT         |
| Arjun        | CS         |
| Karan        | IT         |
| Meera        | CS         |
+--------------+------------+
*/

-- Solution



/*
================================================================================
8. Employees With Same Salary as IT Employees
================================================================================

Table: employees
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 1      | Aman     | IT         | 70000  |
| 2      | Riya     | HR         | 40000  |
| 3      | Karan    | IT         | 80000  |
| 4      | Neha     | Sales      | 50000  |
| 5      | Arjun    | HR         | 45000  |
| 6      | Dev      | Finance    | 90000  |
+--------+----------+------------+--------+

Question:
Find employees whose salary matches salaries of employees in the IT department.

Expected Output:
+----------+--------+
| emp_name | salary |
+----------+--------+
| Aman     | 70000  |
| Karan    | 80000  |
+----------+--------+
*/

-- Solution

