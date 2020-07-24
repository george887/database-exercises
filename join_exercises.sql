use `join_example_db`;

-- 2.Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results. 

select *
from users
join roles on users.id = roles.id;

select*
from users
left join roles on users.id = roles.id;

select*
from roles
right join users on users.id = roles.id;

-- 3.Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

select *, count(users.id) as number_of_users
from users
join roles on users.id = roles.id
group by users.id;

select*, count(users.id) as number_of_users
from users
left join roles on users.id = roles.id
group by users.id;

select*, count(users.id) as number_of_users
from roles
right join users on users.id = roles.id
group by users.id;

-- 1. Use the employees database.
use employees;


-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
select departments.dept_name, concat(first_name, ' ', last_name) as full_name, employees.emp_no, dept_manager.dept_no
from employees
join dept_manager on dept_manager.emp_no = employees.emp_no
join departments on departments.dept_no = dept_manager.dept_no
where dept_manager.to_date > curdate()
order by dept_name;

-- 3. Find the name of all departments currently managed by women.
select departments.dept_name, concat(first_name, ' ', last_name) as full_name, employees.emp_no, dept_manager.dept_no
from employees
join dept_manager on dept_manager.emp_no = employees.emp_no
join departments on departments.dept_no = dept_manager.dept_no
where dept_manager.to_date > curdate()
and gender = "F";

select e.first_name, e.last_name
 from employees e
 join dept_manager dm on dm.emp_no = e.emp_no
 join departments d on d.dept_no = dm.dept_no
 where dm.to_date > curdate()
 and gender = 'f';

-- 4. Find the current titles of employees currently working in the Customer Service department.

select titles.title as Title, departments.dept_name as Dept_Name, count(titles.title)
from employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
where departments.dept_no = 'd009' 
and dept_emp.to_date > curdate() 
and titles.to_date > curdate()
group by titles.title;

select t.title, d.dept_name, count(*)
from titles as t
join dept_emp as de on de.emp_no = t.emp_no
JOIN departments as d on d.dept_no = de.dept_no
where d.dept_no = 'd009' 
and de.to_date > curdate()
and t.to_date > curdate()
group by t.title;

-- 5.Find the current salary of all current managers.
select d.dept_name, concat(first_name, " ",last_name) as full_name, salary
from employees as e
join salaries as s on s.emp_no = e.emp_no
join dept_manager as dep on dep.emp_no = s.emp_no
join departments as d on d.dept_no = dep.dept_no
where dep.to_date > curdate()
and s.to_date > curdate() 
order by d.dept_name;

select dept_name, concat(first_name, ' ', last_name) as Name, salary
from departments as d
join dept_manager as dep on dep.dept_no = d.dept_no
join employees as e on e.emp_no = dep.emp_no
join salaries as s on s.emp_no = dep.emp_no
where s.to_date > curdate()
and dep.to_date > curdate()
order by dept_name;

-- 6. Find the number of employees in each department.
select d.dept_no, d.dept_name, count(*)
from employees as e
join dept_emp as dep on dep.emp_no = e.emp_no
join departments as d on d.dept_no = dep.dept_no
where dep.to_date > curdate()
group by d.dept_no;

-- 7. Which department has the highest average salary?
select d.dept_name, avg(salary)
from salaries as s
join dept_emp as dep on dep.emp_no = s.emp_no
join departments as d on d.dept_no = dep.dept_no
where s.to_date > curdate()
and dep.to_date > curdate()
group by d.dept_no
order by  avg(salary) desc
limit 1;

-- 8. Who is the highest paid employee in the Marketing department?
select concat(first_name, " ",last_name) as full_name, d.dept_name, max(salary)
from salaries as s
join employees_with_departments as emp on emp.emp_no = s.emp_no
join departments as d on d.dept_no = emp.dept_no
where d.dept_name = "Marketing"
and s.to_date > curdate()
group by full_name
order by  max(salary) desc
limit 1;

-- 9. Which current department manager has the highest salary?
select concat(first_name, " ",last_name) as full_name, d.dept_name, salary
from employees as e
join dept_manager as dep on dep.emp_no = e.emp_no
join departments as d on d.dept_no = dep.dept_no
join salaries as s on s.emp_no = e.emp_no
where dep.to_date > curdate()
and s.to_date > curdate()
limit 1;

-- 10. Bonus Find the names of all current employees, their department name, and their current manager's name.
-- Need all current employees in a department
-- Need current department name
-- Need the current managers for the departments and their names
-- Tie managers to the employees departments
--  

select de.emp_no, de.dept_no, concat(e.first_name, " ", e.last_name) as employee_name, d.dept_name, dm.emp_no as man_emp_num, concat(ee.first_name, " ", ee.last_name) as mg_last_name
from dept_emp as de
join employees as e on e.emp_no = de.emp_no
join departments as d on d.dept_no = de.dept_no
join dept_manager as dm on dm.dept_no = d.dept_no and dm.to_date > curdate()
join employees as ee on ee.emp_no = dm.emp_no
Where de.to_date > curdate()
select distinct sub.dept_name
from (select de.emp_no, de.dept_no, concat(e.first_name, " ", e.last_name) as employee_name, d.dept_name, dm.emp_no as man_emp_num, concat(ee.first_name, " ", ee.last_name) as mg_last_name
from dept_emp as de
join employees as e on e.emp_no = de.emp_no
join departments as d on d.dept_no = de.dept_no
join dept_manager as dm on dm.dept_no = d.dept_no and dm.to_date > curdate()
join employees as ee on ee.emp_no = dm.emp_no
Where de.to_date > curdate()
) as sub;




