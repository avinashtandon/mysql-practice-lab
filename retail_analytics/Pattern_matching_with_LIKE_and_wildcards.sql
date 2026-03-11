Table: employees

id name department salary city
1 Rahul IT 60000 Delhi
2 Neha HR 45000 Mumbai
3 Arjun IT 70000 Bangalore
4 Priya Finance 50000 Delhi
5 Aman IT 40000 Pune
6 Kavita HR 55000 Delhi
7 Rohan Finance 48000 Mumbai
8 Sneha IT 65000 Bangalore
9 Vikram HR 52000 Pune
10 Pooja Finance 47000 Delhi

SQL Practice Questions (LIKE)
Question 1

Show employees whose name starts with 'A'.

Return:

name
--
SELECT name FROM employees WHERE name LIKE 'A%';
--
Question 2

Show employees whose name ends with 'a'.

Return:

name
--
SELECT name FROM employees WHERE name LIKE '%a';
--
Question 3

Show employees whose name contains 'oo' anywhere.

Return:

name
--
SELECT name FROM employees WHERE name LIKE '%oo%';
--
Question 4

Show employees whose city starts with 'B'.

Return:

name
city
--
SELECT name,city FROM employees WHERE city LIKE 'B%';
--
Question 5

Show employees whose name has 'a' as the second letter.

Return:

name
--
SELECT name FROM employees WHERE name LIKE '_a%';
--
Question 6

Show employees whose city ends with 'e'.

Return:

name
city
--
SELECT name,city FROM employees WHERE city LIKE '%e';
--
Question 7 (Harder)

Show employees whose name contains 'ra' anywhere.

Return:

name
--
SELECT name FROM employees WHERE name LIKE '%ra%';
--



---------------------------------------------------------

Important Data Engineering Tip

In large datasets, LIKE '%text%' can be slow because it prevents index usage.

Example of slow query:

WHERE name LIKE '%ra%'

Better if possible:

WHERE name LIKE 'ra%'

Because indexes can be used.

This matters when working with millions of rows in data warehouses.