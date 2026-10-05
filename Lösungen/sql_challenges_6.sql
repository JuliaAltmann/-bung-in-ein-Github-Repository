/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 6

*******************************************************************************
*******************************************************************************

HOW TO GET THE SCHEMA OF A DATABASE: 
* Windows/Linux: Ctrl + R
* MacOS: Cmd + R

In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - AS
	- LEFT JOIN
    - RIGHT JOIN
    - INNER JOIN
*/

USE publications; 
 
/*******************************************************************************
ALIAS (AS) for tables
*******************************************************************************/

/* 1. Select the table sales, assigning the alias "s" to it. 
   Select the column ord_num using the syntax "table_alias.column" */
SELECT 
    s.ord_num
FROM
    sales AS s;


/*******************************************************************************
JOINS

We will only use LEFT, RIGHT, and INNER joins.
You do not need to worry about the other types for now

- https://www.w3schools.com/sql/sql_join.asp
- https://www.w3schools.com/sql/sql_join_left.asp
- https://www.w3schools.com/sql/sql_join_right.asp
- https://www.w3schools.com/sql/sql_join_inner.asp
*******************************************************************************/

-- 2. Select the title and publisher name of all books
SELECT 
    t.title AS title_of_all_books, p.pub_name AS publisher_name
FROM
    titles AS t
        LEFT JOIN
    publishers AS p ON t.pub_id = p.pub_id;

-- 4. Select the order number, quantity and book title for all sales.
SELECT 
    s.ord_num AS order_numer,
    s.qty AS quantity,
    t.title AS book_title
FROM
    sales AS s
        LEFT JOIN
    titles AS t 
    -- ON s.title_id = t.title_id
    USING (title_id)
    ORDER BY s.qty DESC;

/* 5. Select the full name of all employees and the name of the publisher they 
   work for */
SELECT 
    e.fname AS name,
    e.lname AS surname,
    p.pub_name AS publisher_name
FROM
    employee AS e
        LEFT JOIN
    publishers AS p ON e.pub_id = p.pub_id;

-- 6. Select the full name and job description of all employees.
SELECT 
    e.fname AS name,
    e.lname AS surname,
    j.job_desc AS job_description
FROM
    employee AS e
        LEFT JOIN
    jobs AS j ON e.job_id = j.job_id;

/* 7. Select the full name, job description and publisher name of all employees
   Hint: you will have to perform 2 joins in a single query to merge 3 tables 
         together. */
SELECT 
    e.fname AS name,
    e.lname AS surname,
    j.job_desc AS job_description,
    p.pub_name AS publischer_name
FROM
    employee AS e
		LEFT JOIN
    jobs AS j ON e.job_id = j.job_id
        LEFT JOIN
    publishers AS p ON e.pub_id = p.pub_id;

/* 8. Select the full name, job description and publisher name of employees
   that work for Binnet & Hardley.
   Hint: you can add a WHERE clause after the joins */
SELECT 
    e.fname AS name,
    e.lname AS surname,
    j.job_desc AS job_description,
    p.pub_name AS publischer_name
FROM
    employee AS e
		LEFT JOIN
    jobs AS j ON e.job_id = j.job_id
        LEFT JOIN
    publishers AS p ON e.pub_id = p.pub_id
    WHERE p.pub_name = 'Binnet & Hardley';

/* 9. Select the name and PR Info (from the pub_info table) from all publishers
   based in Berkeley, California. */
SELECT p.pub_name AS all_publishers, pi.pr_info AS pub_info
FROM publishers AS p
LEFT JOIN pub_info AS pi
ON pi.pub_id = p.pub_id
WHERE p.state = 'CA' AND p.city = 'Berkeley';

/* 10. Select all columns from the discounts table.
   Observe the columns it has and now some of them are filled with NULL values.
*/
SELECT *
FROM discounts;


/* 11. Select all store names, their store id and the discounts they offer.

	   - When selecting the store id, select it two times: from the stores table
         and from the discounts table.
         
       - ALL stores should be displayed, even if they don't offer any discount 
         (i.e. have a NULL value on the discount column). */
SELECT 
    s.stor_name, s.stor_id, d.discounttype, d.discount
FROM
    stores AS s
		LEFT JOIN
    discounts AS d ON s.stor_id = d.stor_id OR d.stor_id IS NULL; -- falsch
    
SELECT 
    s.stor_name, s.stor_id, d.stor_id, d.discount
FROM
    stores AS s
        LEFT JOIN
	discounts AS d ON s.stor_id = d.stor_id;


/* 12. Select all store names and the discounts they offer.

       - This time, we don't want to display stores that don't offer any 
         discount.
         
   Hint: change the join type! */
SELECT 
    s.stor_name, s.stor_id, d.stor_id, d.discount
FROM
    stores AS s
		INNER JOIN
    discounts AS d ON s.stor_id = d.stor_id;

