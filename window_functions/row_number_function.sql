-- How can I assign a unique rank to each employee's sales entry based on the month, so that I can track their sales activity in order?

select id,
       employee,
       month,
       sales,
       row_number() over (partition by employee order by month) as row_num
from employee_sale;