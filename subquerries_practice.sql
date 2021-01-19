# From our employees database, find all current department managers names and birth dates:

use employees;
select first_name, last_name, birth_date
from `employees`
where emp_no in (
	select emp_no
	from dept_manager
	where to_date>curdate());

#1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

select first_name, last_name, hire_date
from employees
where hire_date in (
	'1990-10-22'
	);

select concat(first_name, ' ', `last_name`) as full_name, hire_date
from employees
where hire_date = (select hire_date
from employees 
where emp_no = '101010');

-- 2. Find all the titles held by all employees with the first name Aamod.
-- 168 total titles, 6 unique titles

select title
from titles
join employees as e on e.emp_no = titles.emp_no
where titles.emp_no in (
	select emp_no
	from employees
	where first_name = 'Aamod'
	and to_date>curdate())
	order by title;


