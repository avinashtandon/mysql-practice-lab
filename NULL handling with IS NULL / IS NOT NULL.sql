Table: employees

id name department salary city
1 Rahul IT 60000 Delhi
2 Neha HR NULL Mumbai
3 Arjun IT 70000 NULL
4 Priya Finance 50000 Delhi
5 Aman IT NULL Pune
6 Kavita HR 55000 Delhi
7 Rohan Finance 48000 Mumbai
8 Sneha IT 65000 Bangalore
9 Vikram HR NULL Pune
10 Pooja Finance 47000 Delhi

SQL Practice Questions (NULL Handling)
Question 1

Show employees whose salary is NULL.

Return:

name
salary
--
SELECT name,salary FROM employees WHERE salary IS NULL;
--
Question 2

Show employees whose city is NULL.

Return:

name
city
--
SELECT name,city FROM employees WHERE city IS NULL;
--
Question 3

Show employees whose salary is NOT NULL.

Return:

name
salary
--
SELECT name,salary FROM employees WHERE salary IS NOT NULL;
--
Question 4

Show employees whose city is NOT NULL AND department is HR.

Return:

name
department
city
--
SELECT name,department,city FROM employees WHERE city IS NOT NULL AND department = 'HR';
--
Question 5 (Harder)

Show employees whose salary is NULL OR city is NULL.

Return:

name
salary
city
--
SELECT name,salary,city FROM employees WHERE salary IS NULL OR city IS NULL;
--