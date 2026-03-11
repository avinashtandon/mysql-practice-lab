Table: employees
id	name	department	salary	city
1	Rahul	IT	60000	Delhi
2	Neha	HR	45000	Mumbai
3	Arjun	IT	70000	Bangalore
4	Priya	Finance	50000	Delhi
5	Aman	IT	40000	Pune
6	Kavita	HR	55000	Delhi
7	Rohan	Finance	48000	Mumbai
8	Sneha	IT	65000	Bangalore
9	Vikram	HR	52000	Pune
10	Pooja	Finance	47000	Delhi

SQL Practice Questions (ORDER BY + LIMIT + OFFSET)
Question 1

Show all employees sorted by salary (highest first).

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary DESC;
--
Question 2

Show all employees sorted by name alphabetically.

Return:

name
city
--
SELECT name,city FROM employees ORDER BY name ASC;
--
Question 3

Show top 3 highest paid employees.

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary DESC LIMIT 3;
--
Question 4

Show top 5 lowest paid employees.

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary ASC LIMIT 5;
--
Question 5

Show employees sorted by department and then salary (highest first).

Return:

name
department
salary
--
SELECT name,department,salary FROM employees ORDER BY department, salary DESC;
--
Question 6

Show 2nd and 3rd highest paid employees.

Hint: Use OFFSET.

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary DESC LIMIT 2 OFFSET 1;
--
Question 7

Show 4 highest paid employees but skip the highest salary.

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary DESC LIMIT 4 OFFSET 1;
--
Question 8

Show 3 lowest paid employees after skipping the lowest paid employee.

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary ASC LIMIT 3 OFFSET 1;
--
Question 9

Show only the 5th highest paid employee.

Return:

name
salary
--
SELECT name,salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 4;
--
Question 10 (Interview Level)

Show employees from IT department sorted by salary (highest first) and return top 2 employees.

Return:

name
salary
department
--
SELECT name,salary,department FROM employees WHERE department = 'IT' ORDER BY salary DESC LIMIT 2;
--

💡 Rules for solving

Use only these:

SELECT

WHERE

ORDER BY

LIMIT

OFFSET