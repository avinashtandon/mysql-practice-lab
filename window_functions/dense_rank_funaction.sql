-- ❓ Question:
-- What if I want to rank employees like RANK(), but without skipping ranks when there are ties?

-- 🧠 Goal:
-- Like RANK(), it gives same rank to same values

-- But next rank is not skipped — it’s dense!



select id,
       employee,
       month,
       sales,
       dense_rank() over (partition by month order by sales desc ) as dense_ran
from employee_sales