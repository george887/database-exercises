select release_date
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

select *
from albums
where `artist` = 'Pink Floyd';

select genre
from albums
where name = 'Nevermind';

select NAME
from albums
where release_date between 1990 and 1999;

Select concat(first_name,' ', last_name) as full_name
from employees
where first_name like "e%e" and last_name like 'e%e';

Select concat(upper(first_name),' ', upper(last_name)) as full_name
from employees
where first_name like "e%e" and last_name like 'e%e';

Select datediff(curdate(), hire_date) as number_days_since_hired, first_name, last_name, hire_date
from employees
 where birth_date like "%-12-25" 
 and hire_date like "199%-%-%";
 
 select min(salary), max(salary), avg(salary)
 from salaries;
 
select concat(lower(SUBSTR(first_name, 1, 1)), lower(substr(last_name, 1, 4)), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2))
from employees
limit 20;
 
 use employees;
 
select distinct title
from titles;

select distinct last_name
from employees
where last_name like "e%e"
group by last_name;

select distinct first_name,last_name
from `employees`
where first_name like 'e%e'
and last_name like 'e%e'
;

select distinct `last_name`
from employees
where last_name like '%q%'
and last_name not like '%qu%';

select distinct `last_name`, count(last_name) as num_of_same
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name
order by num_of_same;

select count(*), gender 
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by gender;

select concat(lower(SUBSTR(first_name, 1, 1)), lower(substr(last_name, 1, 4)), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2)) as username, count(*)
from employees
group by username
limit 20;

select concat(lower(SUBSTR(first_name, 1, 1)), lower(substr(last_name, 1, 4)), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2)) as username, count(*)
from employees
group by username
having count(*) >1
order by count(*) desc;

use join_example_db;

select *
from users
join roles on users.id = roles.id;

select *
from users
left join roles on users.id = roles.id;

select *
from users
right join roles on users.id = roles.id;

select *, count(users.id) as num_of_users
from users
join roles on users.id = roles.id
group by users.id;

select *, count(users.id) as num_of_users
from users
left join roles on users.id = roles.id
group by users.id;

use employees;

select departments.`dept_name`, CONCAT(first_name, ' ', `last_name`) as full_name
from `employees`
join dept_manager on dept_manager.emp_no = employees.`emp_no`
join departments on departments.`dept_no` = dept_manager.dept_no
where dept_manager.to_date > CURDATE()
order by dept_name;

select departments.`dept_name`, CONCAT(first_name, ' ', `last_name`) as full_name
from `employees`
join dept_manager on dept_manager.emp_no = employees.`emp_no`
join departments on departments.`dept_no` = dept_manager.dept_no
where dept_manager.to_date > CURDATE()
and gender = 'F'
order by dept_name;

select t.title, d.dept_name, count(*) 
from titles as t
join dept_emp as de on de.emp_no = t.emp_no
join departments as d on d.dept_no = de.dept_no
where de.dept_no = 'd009'
and t.to_date > curdate()
group by t.title;