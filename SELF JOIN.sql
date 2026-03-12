Self Join = compare rows within the same table


Self Join — Notes
1. Definition

A Self Join is when a table is joined with itself.

It is used when rows in the same table are related to other rows in the same table.

Self Join = Table joined with itself
2. Syntax

We must use aliases because the same table is used twice.

SELECT a.column, b.column
FROM table_name a
JOIN table_name b
ON a.column = b.column;

Aliases:

a → first instance of table
b → second instance of table
3. Example
employees table
id	name	manager_id
1	Rahul	NULL
2	Neha	1
3	Arjun	1
4	Priya	2
Query
SELECT e.name AS employee,
       m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;
Result
employee	manager
Rahul	NULL
Neha	Rahul
Arjun	Rahul
Priya	Neha

Explanation:

manager_id refers to another row in the same table
4. Example — Comparing Rows
employees
id	name	salary
1	Rahul	50000
2	Neha	50000
3	Arjun	70000
4	Priya	50000

Query:

SELECT a.name, b.name
FROM employees a
JOIN employees b
ON a.salary = b.salary
AND a.id <> b.id;

Finds employees with the same salary.

5. Types of Self Join

Self join can use any join type.

Type	Use
Self INNER JOIN	rows with valid relationships
Self LEFT JOIN	keep all rows
Self RIGHT JOIN	rarely used

Example:

FROM employees e
LEFT JOIN employees m
6. Common Use Cases
1️⃣ Employee → Manager relationship
employee.manager_id → employee.id
2️⃣ Hierarchical data
category → parent_category
3️⃣ Comment replies
comment → parent_comment
4️⃣ Duplicate detection

Example:

same email
same phone
same salary
5️⃣ Comparing rows

Example:

employees with same salary
products with same price
7. When NOT to Use Self Join

Self joins can be expensive on large tables.

Example:

events table
500M rows

Joining table with itself may create huge intermediate data.

Instead engineers prefer:

Window Functions

Example:

LAG()
LEAD()
ROW_NUMBER()
8. Pros
Advantage	Explanation
Flexible	compare rows inside same table
Supports hierarchies	parent-child relationships
Works in all SQL databases	standard SQL
9. Cons
Problem	Explanation
Performance	slow on large datasets
Hard to read	multiple aliases confusing
Duplicates	often creates mirrored pairs
Expensive joins	large intermediate tables


Table: employees

| id | name   | manager_id | salary |
|----|--------|------------|--------|
| 1  | Rahul  | NULL       | 70000  |
| 2  | Neha   | 1          | 50000  |
| 3  | Arjun  | 1          | 50000  |
| 4  | Priya  | 2          | 60000  |
| 5  | Aman   | 2          | 50000  |
| 6  | Kavita | 3          | 60000  |
SQL Practice Questions (SELF JOIN)
Question 1

Show employee name and their manager name.

Return:

employee
manager
--
SELECT e.name AS employee,
       m.name AS manager 
FROM employees e
JOIN employees m on e.manager_id= m.id;
--
Question 2

Show employees who have the same salary as another employee.

Return:

employee1
employee2
salary
--
SELECT a.name AS employee1,b.name AS employee2,a.salary
FROM employees a 
JOIN employees b on a.salary = b.salary
WHERE a.id > b.id;
--
Question 3

Show employees and their managers only where the manager exists.

Return:

employee
manager

--
SELECT a.name AS employee,b.name AS manager
FROM employees a 
JOIN employees b on a.manager_id = b.id
--
Question 4
--

--
Show employees whose salary is greater than their managers salary

Return:

employee
manager
employee_salary
manager_salary
--
SELECT a.name AS employee,
       b.name AS manager,
       a.salary AS employee_salary,
       b.salary AS manager_salary
FROM employees a 
JOIN employees b on a.manager_id = b.id
WHERE a.salary > b.salary;       
--
Question 5

Show employees who report to the same manager.

Return:

employee1
employee2
manager_id
--
SELECT a.name AS employee1,
       b.name AS employee2,
       a.manager_id
FROM employees a 
JOIN employees b ON a.manager_id = b.manager_id
WHERE a.id > b.id;
--
Question 6 (Harder – Interview Level)

| id | name   | manager_id | salary |
|----|--------|------------|--------|
| 1  | Rahul  | NULL       | 70000  |
| 2  | Neha   | 1          | 50000  |
| 3  | Arjun  | 1          | 50000  |
| 4  | Priya  | 2          | 60000  |
| 5  | Aman   | 2          | 50000  |
| 6  | Kavita | 3          | 60000  |

Show employees whose salary is the same as their managers salary.

Return:

employee
manager
salary
--
SELECT a.name AS employee,b.name AS manager, a.salary 
FROM employees a 
JOIN employees b ON a.manager_id = b.id
WHERE a.salary = b.salary;
--


---


Question 1

Show employees who have the same manager.

Return:

employee1
employee2
manager_id
--
SELECT a.name AS employee1, b.name AS employee2, a.manager_id
FROM employees a 
JOIN employees b ON a.manager_id = b.manager_id;

--
Question 2

Show employees whose salary is greater than their managers salary.

Return:

employee
manager
employee_salary
manager_salary
--
SELECT a.name AS employee,
       b.name AS manager,
       a.salary AS employee_salary,
       b.salary AS manager_salary
FROM employees a 
JOIN employees b ON a.id = b.manager_id
WHERE a.salary > b.salary;
--
Question 3

Show employees whose salary is the same as their managers salary.

Return:

employee
manager
salary
--
SELECT a.name AS employee, b.name AS manager, a.salary 
FROM employees a 
JOIN employees b ON a.manager_id = b.id
WHERE a.salary = b.salary;
-----------------------------------------------

Question 1

Show employees whose manager earns more than them.

Return:

employee
manager
employee_salary
manager_salary
--
SELECT a.name AS employee,
       b.name AS manager ,
       a.salary AS employee_salary,
       b.salary AS manager_salary
FROM employees a 
JOIN employees b ON a.manager_id = b.id
WHERE b.salary > a.salary;       
--
Question 2

Show employees who report to the same manager.

Return:

employee1
employee2
manager_id
--
SELECT a.name AS employee1,
       b.name AS employee2,
       a.manager_id
FROM employees a
JOIN employees b ON a.manager_id = b.manager_id
WHERE a.id > b.id;
--
One Mental Shortcut

Before writing a self join, ask:

What relationship am I comparing?
Relationship	Join Condition
employee → manager	a.manager_id = b.id
manager → employee	a.id = b.manager_id
same manager	a.manager_id = b.manager_id
same salary	a.salary = b.salary


--


Table A (a)                        Table B (b)

| id | name  | manager_id |        | id | name  | manager_id |
|----|-------|------------|        |----|-------|------------|
| 1  | Rahul | NULL       |        | 1  | Rahul | NULL       |
| 2  | Neha  | 1          |        | 2  | Neha  | 1          |
| 3  | Arjun | 1          |        | 3  | Arjun | 1          |
| 4  | Priya | 2          |        | 4  | Priya | 2          |
--------------------------------------------------------------

Question 1

Show employees whose manager earns more than them.

Return:

employee
manager
employee_salary
--
SELECT a.name AS employee,
       b.name AS manager,
       a.employee_salary
FROM employees a 
JOIN employees b ON a.manager_id = b.id
    
---------------------------------------------------

Question 1

Show employees who have the same salary as another employee.

Return:

employee1
employee2
salary
--
SELECT a.name AS employee1,
       b.name AS employee2,
       a.salary
FROM employees a 
JOIN employees b ON a.salary = b.salary
WHERE a.id > b.id;
--
Question 2

Show employees and their manager names.

Return:

employee
manager
--
SELECT a.name AS employee,
       b.name AS manager 
FROM employees a 
JOIN employees b on a.manager_id = b.id;
--
Question 3

Show employees who report to the same manager.

Return:

employee1
employee2
manager_id
--
SELECT a.name AS employee1,
       b.name AS employee2,
       a.manager_id
FROM employees a 
JOIN employees b on a.manager_id = b.id;
--

--
Question 1

Show employees and their manager names.

Return:

employee
manager
--
SELECT a.name AS employee,
       b.name AS manager 
FROM employees a 
JOIN employees b ON a.manager_id = b.id;
--
Question 2

Show employees whose salary is greater than their manager’s salary.

Return:

employee
manager
employee_salary
manager_salary
--
SELECT a.name AS employee,
       b.name AS manager,
       a.salary AS employee_salary,
       b.salary AS manager_salary
FROM employees a 
JOIN employees b ON a.manager_id = b.id
WHERE a.salary > b.salary;
--
Question 3

Show employees whose salary is the same as another employee.

Return:

employee1
employee2
salary
--
SELECT a.name AS employee1,
       b.name AS employee2,
       a.salary
FROM employees a 
JOIN employees b ON a.salary = b.salary
WHERE a.id > b.id; 
--
Question 4

Show employees who report to the same manager.

Return:

employee1
employee2
manager_id
Question 5 (Harder)

Show managers and the employees working under them.

Return:

manager
employee
