SELECT
  id,
  employee,
  month,
  sales,
  NTILE(4) OVER (ORDER BY sales DESC) AS quartile
FROM employee_sales;
