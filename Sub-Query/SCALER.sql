/*
================================================================================
1. Employees Earning Above Company Average
================================================================================

Question:
Find employees whose salary is greater than the company average salary.

Table: employees
+--------+----------+------------+--------+--------------+
| emp_id | emp_name | department | salary | joining_year |
+--------+----------+------------+--------+--------------+
| 1      | Aman     | IT         | 70000  | 2021         |
| 2      | Riya     | HR         | 40000  | 2022         |
| 3      | Kabir    | IT         | 80000  | 2020         |
| 4      | Neha     | Finance    | 60000  | 2021         |
| 5      | Arjun    | HR         | 45000  | 2023         |
| 6      | Sneha    | Finance    | 90000  | 2019         |
| 7      | Rahul    | IT         | 50000  | 2024         |
| 8      | Priya    | HR         | 55000  | 2020         |
+--------+----------+------------+--------+--------------+

Expected Output Format:
+----------+--------+
| emp_name | salary |
+----------+--------+
| Aman     | 70000  |
| Kabir    | 80000  |
| Sneha    | 90000  |
+----------+--------+
*/

-- Solution
SELECT emp_name,salary
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees);