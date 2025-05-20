-- Q2.
--In each month, rank employees based on their sales from highest to lowest. If two employees have the same sales, they should 
--share the same rank — and the next rank should be skipped.

select id,
       employee,
       month,
       sales,
       rank() over (partition by month order by sales desc ) as rankk
    from employee_sales;



--  Q5.
-- Assign a row number to every row in the entire table, based on sales from highest to lowest.

-- Don’t restart for each employee or month.

-- Just give a simple serial number starting from 1.    


select id,
       employee,
       sales,
       row_number() over (order by sales desc ) as row_numberr
    from employee_sales;