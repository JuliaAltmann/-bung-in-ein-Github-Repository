/******************************************************************************
*******************************************************************************

SQL CHALLENGES 10

*******************************************************************************
******************************************************************************/


USE publications;


-- 1. What's the difference between highest and lowest price of titles
 SELECT MAX(price), MIN(price), MAX(price) - MIN(price) AS difference_price
 FROM titles;
    
-- 2. Find titles where the total number of books sold is an even number.
SELECT 
    t.title_id, t.title, SUM(s.qty) AS sales_title
FROM
    titles AS t
        LEFT JOIN
    sales s USING (title_id)
GROUP BY t.title_id
HAVING SUM(qty) % 2 = 0
;

-- 3. Calculate the total revenue by multiplying the quantity sold by the price for each title.
SELECT 
    t.title_id,
    ROUND(t.price, 2),
    SUM(s.qty),
    ROUND(t.price * SUM(s.qty), 2) AS total_revenue
FROM
    titles AS t
        LEFT JOIN
    sales AS s USING (title_id)
GROUP BY t.title_id , t.price;

-- 4. Cheryl Carson and Charlene Locksley got married, what is their collective revenue?
SELECT 
    SUM(t.price * s.qty) AS total_revenue
FROM
    titles AS t
	LEFT JOIN
		sales AS s USING (title_id)
    LEFT JOIN 
		titleauthor AS ta USING (title_id)
    JOIN
		authors AS a ON a.au_id = ta.au_id
WHERE (a.au_fname ="Cheryl" AND a.au_lname ="Carson") 
OR (a.au_fname ="Charlene" AND a.au_lname ="Locksley");
    
-- 5. Calculate the total number of books published by the publishers '0736' and '0877':
SELECT pub_id,
       COUNT(*) AS total_books
FROM titles
WHERE pub_id IN ('0736', '0877')
GROUP BY pub_id;

-- 6. Find all of the books that are more than 10% above the average price of a book in the dataset
-- Selinas Lösung
SELECT
    title,
    price
FROM 
    titles
WHERE
    price > (SELECT AVG(price) * 1.1 FROM titles)
;

-- Ellis Lösung
SELECT title, ROUND(price, 2), (SELECT ROUND(avg(price), 2) FROM titles) AS avg_price
FROM titles
WHERE price > (SELECT avg(price) * 1.10 FROM titles);