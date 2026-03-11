Perfect. Let’s practice like a real SQL interview / data engineer training.
Use the following table: employees

id	name	department	salary	city
1	Rahul	IT	60000	Delhi
2	Neha	HR	45000	Mumbai
3	Arjun	IT	70000	Bangalore
4	Priya	Finance	50000	Delhi
5	Aman	IT	40000	Pune
6	Kavita	HR	55000	Delhi
Question 1 (Very Easy)

Write a query to show all employees from Delhi.
--
SELECT name,city FROM employees WHERE city = 'Delhi';
--

Expected output:

name	city
Rahul	Delhi
Priya	Delhi
Kavita	Delhi
--
Question 2

Write a query to show employees with salary greater than 50000.

Expected output:

name	salary
Rahul	60000
Arjun	70000
Kavita	55000
--
SELECT name,salary FROM employees WHERE salary > 50000;
--
Question 3

Write a query to show employees from IT department.

Return only:

name
salary
--
SELECT name,salary FROM employees WHERE department = 'IT';
--
Question 4 (Important)

Find employees:

salary between 45000 and 60000

Return:

name
salary
--
SELECT name,salary FROM employees WHERE salary BETWEEN 45000 AND 60000;
--
Question 5 (Real Data Engineer Style)

Find employees where:

department = IT

salary > 50000

Return:

name
salary
city
--
SELECT name,salary,city FROM employees WHERE department = 'IT' AND salary > 50000;
--
Question 6 (Pattern Matching)

Find employees whose name starts with 'A'

Return:

name
city
--
SELECT name,city FROM employees WHERE name LIKE 'A%';
--