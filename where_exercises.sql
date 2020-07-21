USE employees;
-- Question 2 Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
Select first_name
from employees
where  first_name in ('Irena','Vidya','Maya');

-- Question 3 Find all employees whose last name starts with 'E' — 7,330 rows.
Select last_name
from employees
where last_name like ('e%');

-- Question 4 Find all employees hired in the 90s — 135,214 rows.
Select *
from employees
where hire_date between'1990-01-01' and '1999-12-31';
-- Question 5 Find all employees born on Christmas — 842 rows.
Select *
from employees
where birth_date like "%-12-25";

-- Question 6 Find all employees with a 'q' in their last name — 1,873 rows.
Select *
from `employees`
where last_name like "%q%";

-- Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
Select first_name
from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya';

-- Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
Select first_name
from employees
where (first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya') 
and gender = 'm';

-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
Select last_name
from employees
where last_name like "e%" 
or last_name like "%e";

-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
Select *
from employees
where last_name like "e%e";

-- Find all employees hired in the 90s and born on Christmas — 362 rows.
Select hire_date, birth_date
from employees
where birth_date like "%-12-25" 
and hire_date like "199%-%-%";

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
select last_name
from employees
where last_name like "%q%"
and last_name not like "%qu%";

-- Find employees who were hired on holloween and born in october
select *
from employees
where hire_date like "%-10-31"
and birth_date like "%-10-%";