SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id

UNION

SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

1️⃣ UNION

UNION removes duplicate rows.

So SQL does:

Run first query

Run second query

Combine results

Remove duplicates


2️⃣ UNION ALL

UNION ALL keeps duplicates.

Performance Difference (Very Important)
Operator	Duplicate Removal	Speed
UNION	Yes	Slower
UNION ALL	No	Faster

Why?

Because UNION must:

sort rows

compare rows

remove duplicates

This is expensive on billions of rows.

4️⃣ What Data Engineers Prefer

In big data systems:

Spark

BigQuery

Snowflake

Redshift

Engineers prefer:

UNION ALL

because it avoids expensive deduplication.

Only use UNION when you actually need duplicate removal.