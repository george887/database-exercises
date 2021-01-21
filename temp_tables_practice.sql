# Creating a temp table of employees_with_departmnents, dropping dept_no, and adding email for each employees_with_departmnents

# Created temp table
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

# Calling temp table
select * 
from employees_with_departments;

# Dropping dept_no
ALTER TABLE employees_with_departments DROP COLUMN dept_no;

select * from employees_with_departments;

# Adding email column and setting limit of characters
ALTER TABLE employees_with_departments ADD email VARCHAR(100);

select * from employees_with_departments;

# Creating email address using first name and last name
UPDATE employees_with_departments
SET email = CONCAT(first_name, '.', last_name, '@company.com');

select * from employees_with_departments;

