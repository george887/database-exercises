# Use the world database for the questions below.

# What languages are spoken in Santa Monica?

select Language, Percentage
from countrylanguage as cl
join city as c on c.CountryCode = cl.CountryCode
where cl.CountryCode = 'USA' and c.name = 'Santa Monica'
order by Percentage;

# How many different countries are in each region?
select Region, count(*) as num_countries
from country
group by Region asc
order by num_countries;

# What is the population for each region?
select Region, sum(Population) as Population
from country 
group by Region
order by Population desc;

# What is the population for each continent?
select Continent, sum(Population) as Population
from country
group by Continent
order by Population desc;

# What is the average life expectancy globally?
select avg(LifeExpectancy)
from country;

# What is the average life expectancy for each region, each continent? Sort the results from shortest to longest
select avg(LifeExpectancy) as Life_Expectancy, Continent
from country
group by Continent
order by Life_Expectancy;

select avg(LifeExpectancy) as Life_Expectancy, Region
from country
group by Region
order by Life_Expectancy;

# Find all the countries whose local name is different from the official name
select Name, LocalName
from country
where Name <> LocalName;

# How many countries have a life expectancy less than 55?
select Name, LifeExpectancy
from country
where LifeExpectancy < 55
order by LifeExpectancy;

# Get all the city names and populations in Asia. Results shown from smallest to largest.
select Name, Population
from country 
where Continent = 'Asia'
order by Population;

# Sakila database
# Display the first and last names in all lowercase of all the actors.
use sakila;

select lower(first_name), lower(last_name)
from actor;

# You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?

select actor_id, first_name, last_name
from actor
where first_name like 'Joe';

# Find all actors whose last name contain the letters "gen":
select actor_id, first_name, last_name
from actor
where last_name like '%gen%';

# Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
select actor_id, first_name, last_name
from actor
where last_name like '%li%'
order by last_name, first_name;

# Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China');

# List the last names of all the actors, as well as how many actors have that last name.
select last_name, count(last_name) as last_name_count
from actor
group by last_name;

# List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
select last_name, count(last_name) as last_name_count
from actor
group by last_name
having last_name_count > 1;

# Use JOIN to display the first and last names, as well as the address, of each staff member.
select first_name, last_name, a.address
from staff
join address as a on a.address_id = staff.address_id;


