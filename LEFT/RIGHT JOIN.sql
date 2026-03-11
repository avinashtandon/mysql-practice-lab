Visual Diagram (LEFT JOIN)

        Employees Table          Departments Table
           (LEFT)                     (RIGHT)

        ┌───────────┐              ┌───────────┐
        │           │              │           │
        │ ALL LEFT  │◄────────────►│ MATCHED   │
        │ RECORDS   │              │ RECORDS   │
        │           │              │           │
        │           │              │           │
        └───────────┘              └───────────┘

                RESULT = ALL LEFT + MATCHES


Employees               Departments

Rahul (1)  ───────────► IT (1)
Neha  (2)  ───────────► HR (2)
Arjun (1)  ───────────► IT (1)
Priya (3)  ───────────► Finance (3)
Aman  (5)  ──────X      (NULL)      <-- Kept because it's in the LEFT table

Result:

Rahul  IT
Neha   HR
Arjun  IT
Priya  Finance
Aman   NULL

Think:

LEFT JOIN = Keep everything from the LEFT table

When Data Engineers Use LEFT JOIN

Very common use cases:

1️⃣ Finding missing data

Example: customers with no orders

SELECT c.name
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.id IS NULL;

This finds customers who never ordered.
--


Visual Diagram (RIGHT JOIN)

        Employees Table          Departments Table
           (LEFT)                     (RIGHT)

        ┌───────────┐              ┌───────────┐
        │           │              │           │
        │ MATCHED   │◄────────────►│ ALL RIGHT │
        │ RECORDS   │              │ RECORDS   │
        │           │              │           │
        │           │              │           │
        └───────────┘              └───────────┘

                RESULT = ALL RIGHT + MATCHES


Employees               Departments

Rahul (1)  ◄─────────── IT (1)
Arjun (1)  ◄─────────── IT (1)
Neha  (2)  ◄─────────── HR (2)
Priya (3)  ◄─────────── Finance (3)
(NULL)      X──────     Sales (4)   <-- Kept because it's in the RIGHT table

Result:

Rahul  IT
Arjun  IT
Neha   HR
Priya  Finance
NULL   Sales

Think:

RIGHT JOIN = Keep everything from the RIGHT table
--

Important Data Engineering Insight

Most real-world queries use:

INNER JOIN
LEFT JOIN

RIGHT JOIN is rarely used because the same thing can be done by swapping table order with LEFT JOIN.

Example:

RIGHT JOIN

can usually be rewritten as:

LEFT JOIN (tables swapped)

--------------------------------------------------------


Tables

Table: employees

| id | name  | department_id |
|----|-------|---------------|
| 1  | Rahul | 1             |
| 2  | Neha  | 2             |
| 3  | Arjun | 1             |
| 4  | Priya | 3             |
| 5  | Aman  | 5             |

Table: departments

| id | department_name |
|----|-----------------|
| 1  | IT              |
| 2  | HR              |
| 3  | Finance         |
| 4  | Sales           |

SQL Practice Questions (LEFT JOIN / RIGHT JOIN)
Question 1

Show all employees and their department names even if the department does not exist.

Return:

name
department_name
--
SELECT e.name,d.department_name
FROM employees e 
LEFT JOIN departments d ON e.department_id = d.id;

--
Question 2

Show all departments and employee names even if the department has no employees.

Return:

name
department_name
--
SELECT e.name,d.department_name
FROM employees e
RIGHT JOIN departments d on e.department_id = d.id;

--
Question 3

Show employees whose department does not exist in the departments table.

Return:

name
department_id
--
SELECT e.name,e.department_id
FROM employees e 
LEFT JOIN departments d ON e.department_id = d.id
WHERE d.id IS NULL;

--
Question 4

Show all employees with their department names, but only show employees whose department is HR.

Return:

name
department_name
--
SELECT e.name,d.department_name
FROM employees e 
LEFT JOIN departments d on e.department_id = d.id
WHERE d.department_name = 'HR';

--
Question 5

Show departments that do not have any employees.

Return:

department_name
--
SELECT d.department_name
FROM employees e 
RIGHT JOIN departments d ON e.department_id = d.id
WHERE e.name IS NULL;
--