use employees;

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:
select distinct title
from titles;

-- 3. Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY. The results should be:
select distinct last_name
from employees
where last_name like "e%e"
group by last_name;

-- 4.Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
select distinct first_name, last_name
from employees
where last_name like "e%e";

-- 5.Find the unique last names with a 'q' but not 'qu'. Your results should be:
select distinct last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%';



-- 6. Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
-- Referring to 5 
select last_name, count(last_name) as num_of_same_last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name
order by num_of_same_last_name;
-- Referring to 4
select last_name, count(last_name)
from employees
where last_name like "e%e"
group by last_name
order by count(last_name);

-- 7.Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
Select count(*), gender
from employees
where  first_name in ('Irena','Vidya','Maya')
group by gender;

-- 8.Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames? Yes there are suprisingly
select concat(lower(SUBSTR(first_name, 1, 1)), lower(SUBSTR(last_name, 1, 4)), "_", substr(birth_date, 6, 2), substr(birth_date, 3, 2)) as usernames, count(*)
from employees
group by usernames
having count(*) >1;


select first_name, count(first_name) as count_of_same_names
from `employees`
group by first_name
order by first_name;

SELECT first_name
FROM employees
GROUP BY first_name;

SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;

SELECT COUNT(*) FROM employees;

SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;
