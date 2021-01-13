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

# Joins Exercises

use employees;
#2. Find the name of all departments currently managed by women.
select departments.`dept_name`, CONCAT(first_name, ' ', `last_name`) as full_name
from `employees`
join dept_manager on dept_manager.emp_no = employees.`emp_no`
join departments on departments.`dept_no` = dept_manager.dept_no
where dept_manager.to_date > CURDATE()
order by dept_name;

#3. Find the name of all departments currently managed by women.
select departments.`dept_name`, CONCAT(first_name, ' ', `last_name`) as full_name
from `employees`
join dept_manager on dept_manager.emp_no = employees.`emp_no`
join departments on departments.`dept_no` = dept_manager.dept_no
where dept_manager.to_date > CURDATE()
and gender = 'F'
order by dept_name;

#4. Find the current titles of employees currently working in the Customer Service department.
select t.title, d.dept_name, count(*) 
from titles as t
join dept_emp as de on de.emp_no = t.emp_no
join departments as d on d.dept_no = de.dept_no
where de.dept_no = 'd009'
and t.to_date > curdate()
group by t.title;

#5. Find the current salary of all current managers.
select dept.dept_name, CONCAT(first_name, ' ', last_name) as full_name, s.salary
from employees as e
join dept_manager on dept_manager.emp_no = e.`emp_no`
join departments as dept on dept.`dept_no` = dept_manager.dept_no
join salaries as s on s.emp_no = dept_manager.emp_no
where dept_manager.to_date > CURDATE()
and s.to_date >curdate()
order by dept.dept_name;

#6. Find the number of current employees in each department.
select d.dept_no, d.dept_name, count(*)
from employees as e
join dept_emp as dep on dep.emp_no = e.emp_no
join departments as d on d.dept_no = dep.dept_no
where dep.to_date > curdate()
group by d.dept_no;

#7. Which department has the highest average salary?
select d.dept_name, avg(salary)
from salaries as s
join dept_emp as dep on dep.emp_no = s.emp_no
join departments as d on d.dept_no = dep.dept_no
where s.to_date>curdate()
and dep.to_date>curdate()
group by d.dept_name
order by avg(salary) desc
limit 1;




