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

#3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

select count(emp_no)
from employees
where emp_no in(select emp_no
	from dept_emp
	where to_date < curdate());

#4.Find all the current department managers that are female. List their names in a comment in your code.
select concat(first_name, ' ', last_name) as full_name
from `employees`
where gender ='F'
and emp_no in (select emp_no
from dept_manager
where to_date>curdate()
	);

# 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

select concat(first_name, ' ', last_name) as full_name, s.salary
from `employees` as e
join salaries as s on s.emp_no = e.emp_no
where s.salary >(select avg(salary) 
	from salaries)
	and s.to_date>curdate()
	order by full_name;

# 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.)

select concat(first_name, ' ', last_name) as full_name, count(s.salary) as salaries_above_avg
from `employees` as e
join salaries as s on s.emp_no = e.emp_no
where s.salary between ((select MAX(salary) from salaries) - (select std(salary) from salaries))
and (select max(salary) from salaries)
and s.to_date> curdate()
group by full_name;



