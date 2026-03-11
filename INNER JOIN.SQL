        Employees Table          Departments Table

           ( A )                      ( B )

        ┌───────────┐              ┌───────────┐
        │           │              │           │
        │           │◄────────────►│           │
        │           │   MATCHED    │           │
        │           │   RECORDS    │           │
        │           │              │           │
        └───────────┘              └───────────┘

                RESULT = A ∩ B


Employees               Departments

Rahul (1)  ───────────► IT (1)
Neha  (2)  ───────────► HR (2)
Arjun (1)  ───────────► IT (1)
Priya (3)  ───────────► Finance (3)
Aman  (5)  ──────X     No match

Result:

Rahul  IT
Neha   HR
Arjun  IT
Priya  Finance
Aman is removed because there is no matching department.
---------------------------------------------------------
SQL Practice Questions (INNER JOIN)

Use these tables.

Table: employees

| id | name  | department_id |
|----|-------|---------------|
| 1  | Rahul | 1             |
| 2  | Neha  | 2             |
| 3  | Arjun | 1             |
| 4  | Priya | 3             |
| 5  | Aman  | 2             |

Table: departments

| id | department_name |
|----|-----------------|
| 1  | IT              |
| 2  | HR              |
| 3  | Finance         |
Question 1

Show employee name and department_name.

Return:

name
department_name
--
SELECT e.name,d.department_name
       FROM employees e 
       INNER JOIN departments d on e.department_id = d.id;
--
Question 2

Show employee name and department_name, but only employees from HR.

Return:

name
department_name
--
SELECT e.name,d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
WHERE d.department_name = 'HR';
--
Question 3

Show employee name and department_name sorted by employee name.

Return:

name
department_name
-- 
SELECT e.name,d.department_name
FROM employees e
INNER JOIN departments d on e.department_id = d.id
ORDER BY e.name;
--
Question 4

Show employees who belong to IT department.

Return:

name
department_name
--
SELECT e.name,d.department_name
FROM employees e
INNER JOIN departments d on e.department_id = d.id
WHERE d.department_name = 'IT';
--

Question 5 (Interview Level)

Show employees whose department_id = 2.

Return:

name
department_name
--
SELECT e.name,d.department_name
FROM employees e
INNER JOIN departments d on e.department_id = d.id
WHERE d.id = 2;
--


-------------------------------------------------------
Why Filtering on e.department_id is Preferred

Two queries:

Query A
WHERE d.id = 2
Query B (Preferred)
WHERE e.department_id = 2

Both give the same result.

But in large datasets, Query B is better.