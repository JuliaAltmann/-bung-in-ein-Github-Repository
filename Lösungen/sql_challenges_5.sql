/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 5

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
    - GROUP BY
    - HAVING
------------------------------------------------------------------------------------------------

*/

USE publications;

/*******************************************************************************
GROUP BY

https://www.w3schools.com/sql/sql_groupby.asp
*******************************************************************************/

-- 1. Find the total amount of authors for each state
SELECT 
    state, COUNT(*) AS amount_authors
FROM
    authors
GROUP BY state;

/* 2. Find the total amount of authors by each state and order them in 
    descending order */
SELECT 
    state, COUNT(*) AS amount_authors
FROM
    authors
GROUP BY state
ORDER BY COUNT(*) DESC;

-- 3. What's the price of the most expensive title from each publisher?
SELECT 
    pub_id, MAX(price)
FROM
    titles
GROUP BY pub_id;

-- 4. Find out the top 3 stores with the most sales
SELECT 
    stor_id, SUM(qty) AS qty_sale
FROM
    sales
GROUP BY stor_id
ORDER BY SUM(qty) DESC
LIMIT 3;

/* 5. Find the average job level for each job_id from the employees table.
    Order the jobs in ascending order by its average job level. */
SELECT 
    job_id, AVG(job_lvl)
FROM
    employee
GROUP BY job_id
ORDER BY AVG(job_lvl);

/* 6. For each type (business, psychology…), find out how many books each
    publisher has. */
SELECT 
    pub_id, type, COUNT(title) AS Count_of_books
FROM
    titles
GROUP BY pub_id, type
ORDER BY pub_id, COUNT(title);

/* 7. Add the average price of each publisher - book type combination from your
   previous query */
SELECT 
    pub_id, type, COUNT(title) AS Count_of_books, ROUND(AVG(price), 2) AS average_price
FROM
    titles
GROUP BY pub_id, type
ORDER BY pub_id, COUNT(title);

/*******************************************************************************
HAVING

https://www.w3schools.com/sql/sql_having.asp
*******************************************************************************/

/* 8. From your previous query, keep only the combinations of publisher - book
   type with an average price higher than 12 */
SELECT 
    pub_id, type, COUNT(title) AS Count_of_books, ROUND(AVG(price), 2) AS average_price
FROM
    titles
GROUP BY pub_id, type
HAVING AVG(price)>=12
ORDER BY average_price;

/* 9. Order the results of your previous query by these two criteria:
      1. Count of books, descendingly
      2. Average price, descendingly */
SELECT 
    pub_id, type, COUNT(title) AS Count_of_books, ROUND(AVG(price), 2) AS average_price
FROM
    titles
GROUP BY pub_id, type
HAVING AVG(price)>=12
ORDER BY Count_of_books, average_price;


/* 10. Some authors have a contract, while others don't - it's indicated in the
     "contract" column of the authors table.
     
     Select all the states and cities where there are 2 or more contracts 
     overall */
SELECT 
    state, city, SUM(contract) AS contracts_more_2
FROM
    authors
GROUP BY state , city
HAVING contracts_more_2>=2
ORDER BY state, city;

SELECT 
    state, city, COUNT(contract) AS contracts_more_2
FROM
    authors
WHERE
    contract > 0
GROUP BY state , city
HAVING contracts_more_2 >= 2
ORDER BY state , city;

/* 
The main difference between WHERE and HAVING is that:
    - the WHERE clause is used to specify a condition for filtering most records
    - the HAVING clause is used to specify a condition for filtering values from 
      an aggregate (such as MAX(), AVG(), COUNT() etc...)
 */

