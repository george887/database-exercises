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

# Use JOIN to display the total amount rung up by each staff member in August of 2005.
select count(p.amount) as payment_total, p.staff_id, s.first_name, s.last_name
from payment as p
join staff as s on s.staff_id = p.staff_id
where p.payment_date like "2005-08-%"
group by s.staff_id;

# List each film and the number of actors who are listed for that film.
select title, count(actor_id) as number_of_actors
from film as f
join film_actor as fa on fa.film_id = f.film_id
group by title
order by number_of_actors desc;

# How many copies of the film Hunchback Impossible exist in the inventory system?
select title, count(title) as number_of_films
from film as f
join inventory as i on i.film_id = f.film_id
where f.title like "Hunchback Impossible"
group by title;

# The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
select title
from film
join language as l on l.language_id = film.language_id
where title like 'K%' or title like'Q%'
and l.language_id = 1;

# You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
select first_name, last_name, email, address_id
from customer
where address_id in (select address_id 
from address as a
join city on city.city_id = a.city_id
join country as c on c.country_id = city.country_id
where c.country = 'Canada');

# Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title
from film
where film_id in (select film_id
from film_category as fc
join category as c on c.category_id = fc.category_id
where fc.category_id = 8);

# Write a query to display how much business, in dollars, each store brought in.
select sum(amount) as total_payment, s.store_id
from payment
join store as s on s.manager_staff_id = payment.staff_id
group by s.store_id;

# Write a query to display for each store its store ID, city, and country.
select store_id, a.address_id, c.city, co.country
from store
join address as a on a.address_id = store.address_id
join city as c on c.city_id = a.city_id
join country as co on co.country_id = c.country_id;

select store_id, city, country
from store
join address using(address_id)
join city using(city_id)
join country using(country_id);
