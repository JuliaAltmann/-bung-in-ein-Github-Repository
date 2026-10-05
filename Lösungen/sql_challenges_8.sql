/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 8

*******************************************************************************
*******************************************************************************


In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - Subqueries

*/

USE publications;

/*******************************************************************************
Subqueries

https://dev.mysql.com/doc/refman/8.4/en/subqueries.html
*******************************************************************************/


-- 1. Find the name of the publisher with the highest advance.
SELECT p.pub_name, t.advance
FROM publishers AS p
JOIN titles AS t
	USING (pub_id)
ORDER BY t.advance DESC
LIMIT 1;

SELECT  p.pub_name, t.advance
FROM publishers AS p
JOIN titles AS t
	USING (pub_id)
WHERE t.advance = (SELECT MAX(advance)
					FROM titles);

SELECT p.pub_name
FROM publishers p
WHERE p.pub_id =
		(SELECT pub_id
        FROM titles
        ORDER BY advance DESC
        LIMIT 1); -- Lösung von Lehrer
                    

-- wenn 1 punlisher hat mehr als 1 Buch
SELECT p.pub_name, SUM(t.advance) AS total_advance
FROM publishers AS p
JOIN titles AS t
	USING (pub_id)
GROUP BY p.pub_id, p.pub_name
ORDER BY total_advance DESC
LIMIT 1;

SELECT p.pub_name, t.total_advance
FROM publishers AS p
JOIN 
	(SELECT pub_id, SUM(advance) AS total_advance
    FROM titles
    GROUP BY pub_id) AS t
		USING (pub_id)
ORDER BY t.total_advance DESC
LIMIT 1;

-- 2. List the titles of books published by publishers based in 'Boston'.
SELECT 
    t.title
FROM
    titles AS t
WHERE
    t.pub_id IN (SELECT 
            pub_id
        FROM
            publishers AS p
        WHERE
            city = 'Boston');
	
-- 3. Find the authors who have written more than one book.
SELECT 
    a.au_fname, a.au_lname, a.au_id
FROM
    authors AS a
WHERE
    a.au_id IN (SELECT 
            t.au_id
        FROM
            titleauthor AS t
        GROUP BY t.au_id
        HAVING COUNT(t.title_id) > 1);

-- 4. List all authors and the number of books they have written.
SELECT DISTINCT a.au_id, 
				a.au_fname, 
                a.au_lname,
                (SELECT COUNT(*)
                FROM titleauthor AS t
                WHERE t.au_id = a.au_id) AS book_count
FROM authors AS a;

SELECT DISTINCT a.au_id, 
				a.au_fname, 
                a.au_lname,
                COUNT(DISTINCT t.title_id) AS book_count
FROM authors AS a
LEFT JOIN titleauthor AS t
		USING (au_id)
GROUP BY a.au_id, 
				a.au_fname, 
                a.au_lname;       

-- 5. Find the titles with a price higher than the average price.
SELECT 
    title_id, title, price
FROM
    titles
WHERE
    price > (SELECT 
            AVG(price)
        FROM
            titles);


-- 6. Find the name of the publisher who has published the most books.
SELECT p.pub_id, p.pub_name
FROM publishers AS p
WHERE pub_id IN (SELECT t.pub_id # gibt pub who published max count books
					FROM titles AS t
                    GROUP BY t.pub_id
                    HAVING COUNT(*) =
						(SELECT MAX(book_count) # sucht max books count
                        FROM
							(SELECT COUNT(*) AS book_count
                            FROM titles
                            GROUP BY pub_id) #count all books von jeder pub
                        AS counts)
					);

SELECT 
    p.pub_id, p.pub_name
FROM
    publishers AS p
WHERE
    pub_id IN (SELECT 
            t.pub_id
        FROM
            titles AS t
        GROUP BY t.pub_id
        ORDER BY COUNT(tt.itle_id) DESC
        LIMIT 1);

-- 7. List the titles that have never been sold.
SELECT t.title_id, t.title
FROM titles AS t
WHERE NOT EXISTS # sucht Bücher über die gibt kein Info in Verkaufs  
		(SELECT s.title_id
        FROM sales AS s
        WHERE s.title_id = t.title_id)
	;
    
    -- ... NOT IN (SELECT DISTINCT s.title_id
        FROM sales AS s); -- leichter Variant

-- 8. List all titles along with their publisher's name.
SELECT t.title,
		(SELECT p.pub_name
			FROM publishers AS p
            WHERE p.pub_id = t.pub_id) AS pub_name
FROM titles AS t;

-- 9. List the employees who have the same job as 'Helen Bennett'.
SELECT fname, lname
FROM employee
WHERE job_id = 
			(SELECT job_id
            FROM employee
            WHERE fname = 'Helen' AND lname = 'Bennett')
	;
