-- What if I want to rank employees based on their sales, but allow ties (same sales = same rank) and skip the next ranks accordingly?

select id,
       employee,
       month,
       sales,
       rank() over (partition by month order by sales desc ) as sales_rank
from employee_sales