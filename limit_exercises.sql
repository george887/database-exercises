use employees;
SELECT DISTINCT title FROM titles;

-- List the first 10 distinct last name sorted in descending order. Your result should look like this:
Select distinct last_name
from employees
order by last_name desc
limit 10;

-- Find your query for employees born on Christmas and hired in the 90s from order_by_exercises.sql. Update it to find just the first 5 employees. Their names should be:
select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5;
 
--  Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results. The employee names should be:
select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 5;

select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 10;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 15;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 20;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 25;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 30;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 35;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 40;
 
 select first_name, last_name
 from employees
 where hire_date between'1990-01-01' and '1999-12-31'
 and birth_date like "%-12-25"
 order by birth_date asc, hire_date desc
 limit 5 offset 45;
 
-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?

-- limit, limits the number of results and offset shows the results starting where you limit ended to resume with the according page #