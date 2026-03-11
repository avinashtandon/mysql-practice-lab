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

SQL Practice Questions (AND, OR, NOT)
Question 1

Show employees from IT department with salary greater than 60000.

Return:

name
salary
department
--
SELECT salary,department FROM employees WHERE department ='IT' AND salary > 60000;
--

Question 2

Show employees who live in Delhi OR Mumbai.

Return:

name
city
--
SELECT name,city FROM employees WHERE city = 'Delhi' OR 'Mumbai';
--
Question 3

Show employees from HR department AND city Delhi.

Return:

name
department
city
--
SELECT name,department,city FROM employees WHERE department = 'HR' AND city = 'Delhi';
--
Question 4

Show employees not from Finance department.

Return:

name
department
--
SELECT name,department FROM employees WHERE NOT department = 'Finance';
--
Question 5

Show employees from IT department AND city Bangalore.

Return:

name
department
city
--
SELECT name,department,city FROM employees WHERE department = 'IT' AND city = 'Bangalore';
--

