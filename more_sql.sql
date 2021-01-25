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
