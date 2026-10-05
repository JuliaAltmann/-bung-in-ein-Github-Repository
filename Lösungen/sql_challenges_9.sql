/******************************************************************************
*******************************************************************************

SQL CHALLENGES 9

*******************************************************************************
******************************************************************************/


USE publications;


-- 1. Add a column showing how many characters are in each author's last name
SELECT 
    au_lname, LENGTH(au_lname) AS surname_lenght
FROM
    authors;

-- 2. What is the first name of each author in uppercase?
SELECT 
    au_fname, UPPER(au_fname) AS uppercase_fname, au_lname, UPPER(au_lname) AS uppercase_lname
FROM
    authors;

-- 3. Combine first and last names of authors into a single column.
SELECT 
    au_fname, au_lname, CONCAT(au_fname, ' ', au_lname) AS full_name
FROM
    authors;

-- 4. Show the current date in a column called 'today'.
SELECT 
	CURRENT_DATE() AS today;

-- 5. Calculate the difference in days between a book's publication date and today's date.
SELECT title_id, title,
	DATEDIFF(CURRENT_DATE(), pubdate) AS number_of_days
FROM titles;

-- 6. How many years has it been since each title was published?
SELECT title_id, title,
	TIMESTAMPDIFF(YEAR, pubdate, CURRENT_DATE()) AS number_of_years
FROM titles;
    
-- 7. Find the publication year and month of each title in 'YYYY-MM' format.   
SELECT title_id, title,
	DATE_FORMAT(pubdate, "%Y-%m") AS formatted_date
FROM titles;

-- 8. Concatenate the publisher's name and city into a single column. Separate them with a comma.
SELECT pub_id,
		CONCAT(pub_name, ', ', city) AS info
	FROM publishers;

-- 9. What is the longest title of a book?
SELECT title_id, title,
		LENGTH(title) AS long_title
    FROM titles
    ORDER BY long_title DESC; -- wir haben 2 Bücher mit lengere name, nicht past
    
SELECT title_id, title,
		LENGTH(title) AS long_title
    FROM titles
WHERE LENGTH(title) = 
		(SELECT MAX(LENGTH(title))
        FROM titles);

-- 10. Display the publication date of each title in 'Day-Month-Year' format. For example, '12-June-1991'.
SELECT title_id, title,
	DATE_FORMAT(pubdate, "%d-%M-%Y") AS formatted_date
FROM titles;
    
-- 11. List authors whose last name starts with 'C' and show the first 5 characters of their address.
  SELECT au_id, au_fname, au_lname,
		SUBSTRING(address, 1, 5) AS adress
  FROM authors
  WHERE au_lname LIKE 'C%';

-- 12. Return the difference in days between the current date and the publication date of titles where the difference is greater than 1000 days.
SELECT title_id, title, pubdate,
	DATEDIFF(CURRENT_DATE(), pubdate) AS number_of_days
FROM titles
WHERE DATEDIFF(CURRENT_DATE(), pubdate) > 1000;

SELECT title_id, title, pubdate, -- 2te Variant
	DATEDIFF(CURRENT_DATE(), pubdate) AS number_of_days
FROM titles
HAVING number_of_days > 1000;

-- 13. Find the titles where the length of the title name is greater than the average length of all titles.
SELECT title_id, title,
		LENGTH(title) AS title_length,
        (SELECT ROUND(AVG(LENGTH(title)))
				FROM titles) AS avarage_all_title
	FROM titles
WHERE LENGTH(title) > (SELECT ROUND(AVG(LENGTH(title)))
				FROM titles)
	ORDER BY LENGTH(title) DESC;

-- 14. Get the authors whose first name length is equal to their last name length.
  SELECT au_id, au_lname, LENGTH(au_lname), au_fname, LENGTH(au_fname)
  FROM authors
  WHERE LENGTH(au_lname) = LENGTH(au_fname);

-- 15. Find the longest city name among the authors' addresses.
SELECT city, LENGTH(city)
  FROM authors
  ORDER BY LENGTH(city) DESC; -- passt nur wenn 1 max Ergebniss ist
  
  SELECT au_id, city, LENGTH(city)
  FROM authors
  WHERE LENGTH(city) = 
		(SELECT MAX(LENGTH(city))
        FROM authors);
  
-- 16. Display titles and their publication dates formatted as 'Day of the Week, Month Day, Year'. For example, 'Wednesday, June 12, 1991'.
  SELECT title_id, title,
	DATE_FORMAT(pubdate, "%W, %M %d, %Y") AS formatted_date
FROM titles;  

-- 17. Calculate the difference in days between the first and last publication date for each author.
SELECT ta.au_id,
				DATEDIFF(MAX(t.pubdate), MIN(t.pubdate)) AS difference_date_pub
	FROM titles AS t
    LEFT JOIN titleauthor AS ta
    USING (title_id)
    GROUP BY ta.au_id;
		
    
    
    
    
    