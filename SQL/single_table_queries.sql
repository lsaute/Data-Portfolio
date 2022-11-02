--In the following queries, I am using a database which contains data about some of Pixar's classic movies. The following exercises only involve the Movies table.

--Find the title of each film
SELECT title 
FROM movies;

--Find the director of each film
SELECT director 
FROM movies;

--Find the title and director of each film
SELECT 
    title,
    director 
FROM movies;

--Find the title and year of each film
SELECT 
    title,
    year 
FROM movies;

--Find all the information about each film
SELECT *
FROM movies;

--Find the movie with a row id of 6
SELECT * 
FROM movies
WHERE id = 6;

--Find the movies released in the years between 2000 and 2010
SELECT * 
FROM movies
WHERE year BETWEEN 2000 AND 2010;

--Find the movies not released in the years between 2000 and 2010
SELECT * 
FROM movies
WHERE year NOT BETWEEN 2000 AND 2010;

--Find the first 5 Pixar movies and their release year
SELECT * 
FROM movies
ORDER BY year asc
LIMIT 5;

--Find all the Toy Story movies
SELECT * 
FROM movies
WHERE title LIKE 'Toy Story%';

--Find all the movies directed by John Lasseter
SELECT * 
FROM movies
WHERE director = 'John Lasseter';

--Find all the movies (and director) not directed by John Lasseter
SELECT
    title,
    director
FROM movies
WHERE director != 'John Lasseter';

--Find all the WALL-* movies
SELECT *
FROM movies
WHERE title LIKE 'WALL%';

--List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director 
FROM movies
ORDER BY director asc;

--List the last four Pixar movies released (ordered from most recent to least)
SELECT *
FROM movies
ORDER BY year desc
LIMIT 4;

--List the first five Pixar movies sorted alphabetically
SELECT title 
FROM movies
ORDER BY title ASC
LIMIT 5;

--List the next five Pixar movies sorted alphabetically
SELECT title 
FROM movies
ORDER BY title ASC
LIMIT 5
OFFSET 5;



--In the following queries, I am using a database which contains data about some of the most populous cities in North America. The following exercises only involve the North_american_cities table.

--List all the Canadian cities and their populations
SELECT * 
FROM north_american_cities
WHERE country = 'Canada';

--Order all the cities in the United States by their latitude from north to south
SELECT * 
FROM north_american_cities
WHERE country = 'United States'
ORDER BY latitude desc;

--List all the cities west of Chicago, ordered from west to east
SELECT * 
FROM north_american_cities
WHERE longitude < -87.629798
ORDER by longitude asc;

--List the two largest cities in Mexico (by population)
SELECT * 
FROM north_american_cities
WHERE country = 'Mexico'
ORDER by population desc
LIMIT 2;

--List the third and fourth largest cities (by population) in the United States and their population
SELECT
    city,
    population
FROM north_american_cities
WHERE country = 'United States'
ORDER by population desc
LIMIT 2
OFFSET 2;



--In the following queries, I am using a database which contains data about employees of film studio. The following exercises only involve the Employees table.

--Find the longest time that an employee has been at the studio
SELECT * 
FROM employees
ORDER BY years_employed desc
LIMIT 1;

--For each role, find the average number of years employed by employees in that role
SELECT
    role,
    AVG(years_employed)
FROM employees
GROUP BY role;

--Find the total number of employee years worked in each building
SELECT
    building,
    SUM(years_employed)
FROM employees
GROUP BY building;

--Find the number of Artists in the studio (without a HAVING clause)
SELECT 
    role, 
    COUNT(*) as Number_of_artists
FROM employees
WHERE role = "Artist";

--Find the number of Employees of each role in the studio
SELECT 
    role, 
    COUNT(*)
FROM employees
GROUP BY role;

--Find the total number of years employed by all Engineers
SELECT 
    role, 
    SUM(years_employed)
FROM employees
WHERE role = 'Engineer';
