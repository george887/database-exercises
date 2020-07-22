use employees;

-- 2. Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
Select concat(first_name,' ', last_name) as full_name
from employees
where first_name like "e%e" and last_name like 'e%e';

-- 3.Convert the names produced in your last query to all uppercase.
Select concat(upper(first_name),' ', upper(last_name)) as full_name
from employees
where first_name like "e%e" and last_name like 'e%e';

-- 4. For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())
Select datediff(curdate(), hire_date) as number_days_since_hired, first_name, last_name, hire_date
from employees
 where birth_date like "%-12-25" 
 and hire_date like "199%-%-%";
 
-- 5. Find the smallest and largest salary from the salaries table.
select min(salary), max(salary), avg(salary)
from salaries;

-- 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
select concat(lower(SUBSTR(first_name, 1, 1)), lower(SUBSTR(last_name, 1, 4)), "_", substr(birth_date, 6, 2), substr(birth_date, 3, 2))
from employees
limit 10;

