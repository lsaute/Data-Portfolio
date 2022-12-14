--In the following queries, I am using a database which contains data about some of Pixar's classic movies. The following exercises only involve the BoxOffice and Movies table.

--Find the domestic and international sales for each movie
SELECT
    m.title,
    bo.domestic_sales,
    bo.international_sales
FROM movies m
INNER JOIN boxoffice bo
    ON m.id = bo.movie_id;

--Show the sales numbers for each movie that did better internationally rather than domestically
SELECT
    m.title,
    bo.international_sales,
    bo.domestic_sales
FROM movies m
INNER JOIN boxoffice bo
    ON m.id = bo.movie_id
WHERE bo.international_sales > bo.domestic_sales;

--List all the movies by their ratings in descending order
SELECT
    m.title,
    bo.rating
FROM movies m
INNER JOIN boxoffice bo
    ON m.id = bo.movie_id
ORDER BY bo.rating desc;

--List all movies and their combined sales in millions of dollars
SELECT
    m.title,
    (bo.domestic_sales + bo.international_sales)/1000000 AS sales_in_millions
FROM movies m
LEFT JOIN boxoffice bo
    ON m.id = bo.movie_id;
    
--List all movies and their ratings in percent
SELECT
    m.title,
    bo.rating * 10 AS 'Rating %'
FROM movies m
LEFT JOIN boxoffice bo
    ON m.id = bo.movie_id;
    
--List all movies that were released on even number years
SELECT title, year
FROM movies
WHERE year % 2 = 0;

--Find the number of movies each director has directed
SELECT
    director,
    COUNT(*)
FROM movies
GROUP BY director;

--Find the total domestic and international sales that can be attributed to each director
SELECT
    m.director,
    SUM(bo.domestic_sales + bo.international_sales) as total_sales
FROM movies m
JOIN boxoffice bo
    ON m.id = bo.movie_id
GROUP BY m.director;

--Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies
VALUES (14, 'Toy Story 4', 'Lacy', 2010, 80)

-- Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO boxoffice
VALUES (4, 8.7, 340000000, 270000000);



--In the following queries, I am using a database which contains data about employees of a film studio and their assigned office buildings. The following exercises only involve the Employees and Buildings table.

--Find the list of all buildings that have employees
SELECT b.building_name 
FROM employees e
LEFT JOIN buildings b
    ON e.building = b.building_name
GROUP BY b.building_name

--Find the list of all buildings and their capacity
SELECT 
    building_name,
    capacity
FROM buildings

--List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT 
    DISTINCT b.building_name, 
        e.role 
FROM buildings b
  LEFT JOIN employees e
    ON b.building_name = e.building;
    
--Find the name and role of all employees who have not been assigned to a building
SELECT
    name,
    role
FROM employees
WHERE building IS NULL;

--Find the names of the buildings that hold no employees
SELECT 
    b.building_name, 
    name 
FROM buildings b
  LEFT JOIN employees e
    ON b.building_name = e.building
WHERE e.name IS NULL;
