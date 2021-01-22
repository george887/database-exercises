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

CREATE TEMPORARY TABLE employees.current_employees
SELECT e.emp_no, e.first_name, e.last_name, ewd.dept_no, ewd.dept_name
FROM employees as e
JOIN employees_with_departments as ewd on ewd.emp_no = e.emp_no
LIMIT 20;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

select * 
from employees_with_departments;

ALTER TABLE employees_with_departments DROP COLUMN dept_no;

select * from employees_with_departments;

ALTER TABLE employees_with_departments ADD email VARCHAR(100);

select * from employees_with_departments;

UPDATE employees_with_departments
SET email = CONCAT(first_name, '.', last_name, '@company.com');

select * from employees_with_departments;

#Using the example from the lesson, re-create the employees_with_departments table.

# Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

Alter table employees_with_departments add full_name varchar(100) not null;

select * from employees_with_departments;

update employees_with_departments set full_name = concat(first_name, ' ', `last_name`);

select * from employees_with_departments;

# Remove the first_name and last_name columns from the table.
alter table employees_with_departments drop column first_name;
alter table employees_with_departments drop column last_name;
select * from employees_with_departments;

# Create a temporary table based on the payment table from the sakila database

create temporary table payment as 
select * from sakila.payment;

select * from payment;

# Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

alter table payment add amount_interger int(6);

select * from payment;

update payment set amount_interger = amount* 100;
select * from payment;

# Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

create temporary table avg_salaries as
select emp_no, first_name, last_name, dept_no, dept_name, salary
from employees.employees e
join employees.dept_emp de USING(emp_no)
join employees.departments d USING(dept_no)
join employees.salaries s USING(emp_no)
where s.to_date > curdate() and de.to_date > curdate();

select * from avg_salaries;