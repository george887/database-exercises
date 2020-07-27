Use employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

-- 1. Find all the employees with the same hire date as employee 101010 using a sub-query.
-- 69 Rows

select hire_date
from employees
where emp_no = "101010";

select concat(first_name, " ", `last_name`) as full_name, emp_no, hire_date
from employees
where hire_date = (select hire_date
from employees
where emp_no = "101010");

select hire_date
from employees
where emp_no = "101010";

select*
from employees
where hire_date = (select hire_date
from employees
where emp_no = "101010");

-- 2. Find all the titles held by all employees with the first name Aamod.
-- 314 total titles, 6 unique titles

select emp_no
from employees
where first_name = "Aamod";

select title
from titles
join employees as e on e.emp_no = titles.emp_no
where titles.emp_no in 
(select emp_no
from employees
where first_name = "Aamod")
order by title;

select emp_no
from employees
where first_name = 'aamod';

select title, count(*)
from titles as t
join employees as e on e.emp_no = t.emp_no
where t.emp_no in (select emp_no
from employees
where first_name = 'aamod')
group by title;

-- 3.How many people in the employees table are no longer working for the company?
select count(emp_no)
from titles
where curdate() > to_date;

select count(emp_no)
from `employees`
where emp_no not in (select emp_no
from dept_emp
where to_date > curdate());

-- 4. Find all the current department managers that are female.
select emp_no
from dept_manager
where to_date > curdate();

select first_name, last_name
from employees
where gender = "F" 
and emp_no in (
select emp_no
from dept_manager
where to_date > curdate());

-- 5. Find all the employees that currently have a higher than average salary.
-- 154543 rows in total. Here is what the first 5 rows will look like:
use employees;
select first_name, last_name, salary
from salaries as s
join employees as e on e.emp_no = s.emp_no
where salary > (select avg(salary) from salaries)
and s.to_date > curdate();

select avg(salary)
from salaries;

select first_name, last_name, salary
from employees as e
join salaries as s on s.emp_no = e.emp_no
where salary > (select avg(salary)
from salaries)
and to_date > curdate();

-- 6.How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
-- 78 salaries
select COUNT(s.salary) as salaries_above_avg
from salaries as s
where s.salary
between ((select MAX(salary) from salaries) - (select std(salary) from salaries))
and (select max(salary) from salaries)
and s.to_date> curdate();

-- 158220
select max(salary)
from salaries;

-- 16904.8282
select std(salary)
from salaries;

select count(*) as "num_salaries_1_sttdev_below_max", count(*) / (select count(*) from salaries) *100 as "percentage_of_current_salaries"
from salaries
where salary >= ((select max(salary) from salaries) - (select stddev(salary) from salaries))
and to_date > curdate();

select count(*)
from salaries 
where to_date > curdate()


-- BONUS Find all the department names that currently have female managers. 
select dept_name
from employees as e
join dept_manager as dept on dept.emp_no = e.emp_no
join departments as d on d.dept_no = dept.dept_no
where gender = "F"
and e.emp_no in (
select emp_no
from dept_manager
where to_date > curdate())
group by dept_name;

-- 2.Find the first and last name of the employee with the highest salary.
select first_name, last_name, salary
from salaries as s
join employees as e on e.emp_no = s.emp_no
where s.salary > 1
and s.to_date > curdate()
order by s.salary desc
limit 1;

-- 3. Find the department name that the employee with the highest salary works in.
select dept_name, first_name
from dept_emp as dept
join employees as e on e.emp_no = dept.emp_no
join departments as d on d.dept_no = dept.dept_no
in (select max(salary) 
from salaries where salary > 1
and salaries.to_date > curdate()
order by salaries.salary desc)
limit 1;
