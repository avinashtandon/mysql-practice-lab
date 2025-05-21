-- ✅ Q9.
-- For each employee, show their sales records along with a serial number — starting from 1 — in the order of month.

select employee,
       month,
       sales,
       row_number() over (partition by employee order by month ) as row_rank
    from employee_sales;




-- ✅ Q10.
-- For each month, rank employees based on their sales — highest sales should be ranked first.

select employee,
       month,
       sales,
       rank() over (partition by month order by sales desc )as row_rank
    from employee_sales;


-- ✅ Q11.
-- Split all employee records into 2 groups — top half (higher sales) and bottom half (lower sales).

select employee,
       month,
       sales,
       ntile(2) over (order by sales desc ) as sales_rank
    from employee_sales;
