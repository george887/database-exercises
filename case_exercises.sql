-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

use employees;

select e.emp_no, dept.dept_no, dept.from_date, dept.to_date, if (dept.to_date > curdate(), true, false)  as is_current_employee
from `employees` as e
join dept_emp as dept on dept.emp_no = e.`emp_no`
join employees_with_departments as ewd on ewd.dept_no = dept.dept_no;

select e.emp_no, count(e.`emp_no`) from 
(select e.emp_no, dept.dept_no, dept.from_date, dept.to_date, case when dept.to_date > curdate() then 1 else 0 end as is_current_employee
from employees as e
join dept_emp as dept using(emp_no)
) e
group by e.emp_no
having count(e.emp_no) > 1;

select dept.emp_no
	,max(e.hire_date) as start_date
	,max(dept.to_date) as end_date
	,max(case when dept.to_date > curdate() then 1 else 0 end) as is_current_emp
from dept_emp as dept
join employees as e using(emp_no)
group by dept.emp_no;

-- 2. Write a query that returns all employee names, and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
select last_name, 
    CASE WHEN last_name < 'I' THEN 'A-H'
         WHEN last_name < 'R' THEN 'I-Q'
         ELSE 'R-Z'
	END AS alpha_group
from employees;

select last_name,
		case when last_name regexp '^[a-h]' then 'a-h'
		when last_name regexp '^[i-q]' then 'i-q'
		when last_name regexp '^[r-z]' then 'r-z'
			else NULL
			end as alpha_group
			from employees
			order by alpha_group;

SELECT first_name, 
	   last_name,
	   CASE WHEN SUBSTR(last_name, 1, 1) < 'I' THEN 'A-H'
	   		WHEN SUBSTR(last_name, 1, 1) < 'R' THEN 'I-Q'
	   		WHEN SUBSTR(last_name, 1, 1) > 'Q' THEN 'R-Z'
	   		ELSE null END AS alpha_group
FROM employees
ORDER BY alpha_group;
			
-- 3 How many employees were born in each decade?
select count(*) as num_employees,
	case when birth_date between "1950-01-01" and "1959-12-31" then "50s"
	else "60s"
	end as decade
from employees
group by decade;

select sum(case when year(birth_date) >= 1950 and year(birth_date) < 1960 then 1 else null END) as fities,
sum(case when year(birth_date) >= 1960 and year(birth_date) < 1970 then 1 else null END) as sixties
from employees;

-- 1965
select max(birth_date)
from employees;

-- 1952
select min(birth_date)
from employees;

-- Bonus What is the average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

select 