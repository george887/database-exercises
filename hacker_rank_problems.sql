#1. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
	
select DISTINCT city from STATION 
where  (CITY NOT LIKE '%a'
        AND CITY  NOT LIKE '%e'
        AND CITY NOT LIKE '%i' 
        AND CITY NOT LIKE '%o'
        AND CITY NOT LIKE '%u')

#2.  Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

select distinct CITY
from STATION
where (CITY not like 'A%'
       and CITY not like 'E%'
       and CITY not like 'I%'
       and CITY not like 'O%'
       and CITY not like 'U%')
or (CITY NOT LIKE '%a'
        AND CITY  NOT LIKE '%e'
        AND CITY NOT LIKE '%i' 
        AND CITY NOT LIKE '%o'
        AND CITY NOT LIKE '%u');

3. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

select distinct CITY from STATION 
where (CITY not like 'A%'
      and CITY not like 'E%'
      and CITY not like 'I%'
      and CITY not like 'O%'
      and CITY not like 'U%')
      and (CITY not like '%a'
      and CITY not like '%e'
      and CITY not like '%i'
      and CITY not like '%o'
      and CITY not like '%u')

4.Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select NAME from STUDENTS
where MARKS > 75
order by RIGHT(NAME, 3), ID;



