/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 3

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses/operators:
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

USE publications;

/******************************************************************************
ORDER BY
******************************************************************************/
-- https://www.w3schools.com/sql/sql_orderby.asp

/* 1. Select the title and ytd_sales from the table titles. Order them by the
year to date sales. */
SELECT 
    title, ytd_sales
FROM
    titles
ORDER BY ytd_sales;

-- 2. Repeat the same query, but this time sort the titles in descending order
SELECT 
    title, ytd_sales
FROM
    titles
ORDER BY ytd_sales DESC;

/******************************************************************************
LIMIT

https://www.w3schools.com/mysql/mysql_limit.asp
******************************************************************************/

-- 3. Select the top 5 titles with the most ytd_sales from the table titles
SELECT 
    title
FROM
    titles
ORDER BY ytd_sales DESC
LIMIT 5;

/******************************************************************************
MIN and MAX

https://www.w3schools.com/sql/sql_min_max.asp
******************************************************************************/

-- 4. What's the maximum amount of books ever sold in a single order?
SELECT 
    MAX(qty)
FROM
    sales;

-- 5. What's the price of the cheapest book?
SELECT 
    MIN(price)
FROM
    titles;

/******************************************************************************
COUNT, AVG, and SUM

https://www.w3schools.com/sql/sql_count_avg_sum.asp

******************************************************************************/

 -- 6. How many rows are there in the table authors?
SELECT 
    COUNT(*)
FROM
    authors;

 -- 7. What's the total amount of year-to-date sales?
SELECT
	SUM(ytd_sales) AS year_to_date_sales
FROM 
	titles;
    
-- Feller 
SELECT 
    SUM(qty)
FROM
    sales
WHERE
    ord_date >= 1994 - 01 - 01;

 -- 8. What's the average price of books?
SELECT 
    AVG(price)
FROM
    titles;


/* 9. In a single query, select the count, average and sum of quantity in the
table sales */
SELECT 
    COUNT(*), SUM(qty), AVG(qty)
FROM
    sales;

/*
In the exercises below you will need to use the following clauses/operators:
	- SELECT FROM
    - AS
	- DISTINCT
	- WHERE
	- AND / OR / NOT
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

*/

-- 10. From how many different states are our authors?
SELECT 
    COUNT(DISTINCT state)
FROM
    authors;

-- 11. How many publishers are based in the USA?
SELECT 
    COUNT(pub_name)
FROM
    publishers
WHERE
    country = 'USA';

-- 12. What's the average quantity of titles sold per sale by store 7131?
SELECT 
    AVG(qty)
FROM
    sales
WHERE
    stor_id = '7131';

-- 13. When was the employee with the highest level hired?
SELECT 
    hire_date
FROM
    employee
ORDER BY job_lvl
LIMIT 1;

-- WHERE job_lvl = (SELECT MAX(job_lvl) FROM employee);

-- 14. What's the average price of psychology books?
SELECT 
    AVG(price)
FROM
    titles
WHERE
    type = 'psychology';

-- 15. Which category of books has had more year-to-date sales, "business" or
-- "popular_comp"? You can write two queries to answer this question.
SELECT 
    SUM(ytd_sales)
FROM
    titles
WHERE
    type = 'business'; -- business


SELECT 
    SUM(ytd_sales)
FROM
    titles
WHERE
    type = 'popular_comp';    -- popular_comp


SELECT 
    type, SUM(ytd_sales) AS total_sales
FROM
    titles
WHERE
    type IN ('business' , 'popular_comp')
GROUP BY type
ORDER BY total_sales DESC
LIMIT 1;

-- 16. What's the title and the price of the most expensive book?
SELECT 
    title, price
FROM
    titles
ORDER BY price DESC
LIMIT 1;

-- WHERE price = (SELECT MAX(price) FROM titles);

-- 17. What's the price of the most expensive psychology book?
SELECT 
    MAX(price)
FROM
    titles
WHERE
    type = 'psychology';

-- 18. How many authors live in either San Jose or Salt Lake City
SELECT 
    COUNT(au_id) AS numer_of_authors
FROM
    authors
WHERE
    city = 'San Jose'
        OR city = 'Salt Lake City';