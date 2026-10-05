/******************************************************************************
*******************************************************************************

SQL CHALLENGES bonus 2

*******************************************************************************
*******************************************************************************/

USE publications;

-- 1. Using LEFT JOIN: in which cities has "Is Anger the Enemy?" been sold?
SELECT 
    t.title, t.title_id, s.stor_id, st.city
FROM
    titles AS t
        LEFT JOIN
    sales AS s USING (title_id)
        LEFT JOIN
    stores AS st USING (stor_id)
WHERE
    t.title = 'Is Anger the Enemy?';

/* 2. Select all the book titles that have a link to the employee Howard Snyder 
    (he works for the publisher that has published those books). */
SELECT 
    t.title, t.title_id, e.pub_id, e.fname, e.lname
FROM
    titles AS t
        LEFT JOIN
    employee AS e USING (pub_id)
WHERE
    e.fname = 'Howard'
        AND e.lname = 'Snyder';


/* 3. Using the JOIN of your choice: Select the book title with highest number of 
   sales (qty) */
SELECT 
    MAX(s.qty), t.title, t.title_id
FROM
    sales AS s
        LEFT JOIN
    titles AS t USING (title_id)
GROUP BY s.title_id; -- ermittelt die maximale Anzahl an Verkäufen für jedes Buch

 SELECT 
	t.title, t.title_id, SUM(s.qty) AS total_sales
FROM
    titles AS t
        LEFT JOIN
     sales AS s USING (title_id)
GROUP BY t.title_id
ORDER BY total_sales DESC
LIMIT 1;

/* 4. Select all book titles and the full name of their author(s).
      
      - If a book has multiple authors, all authors must be displayed (in 
      multiple rows).
      
      - Books with no authors and authors with no books should not be displayed.
*/
SELECT 
    t.title, ta.au_id, a.au_lname, a.au_fname
FROM
    titles AS t
        INNER JOIN
    titleauthor AS ta USING (title_id)
        LEFT JOIN
    authors AS a USING (au_id)
WHERE
    t.pubdate IS NOT NULL
ORDER BY t.title;

/* 5. Select the full name of authors of Psychology books

   Bonus hint: if you want to prevent duplicates but allow authors with shared
   last names to be displayed, you can concatenate the first and last names
   with CONCAT(), and use the DISTINCT clause on the concatenated names. */
SELECT DISTINCT
    CONCAT(a.au_lname, a.au_fname) AS full_name, a.au_id, t.type
FROM
    authors AS a
        INNER JOIN
    titleauthor AS au USING (au_id)
        INNER JOIN
    titles AS t USING (title_id)
WHERE
    t.type = 'psychology';

/* 6. Explore the table roysched and try to grasp the meaning of each column. 
   The notes below will help:
   
   - "Royalty" means the percentage of the sale price paid to the author(s).
   
   - Sometimes, the royalty may be smaller for the first few sales (which have
     to cover the publishing costs to the publisher) but higher for the sales 
     above a certain threshold.
     
   - In the "roysched" table each title_id can appear multiple times, with
     different royalty values for each range of sales.
     
   - Select all rows for particular title_id, for example "BU1111", and explore
	 the data. */
SELECT *
FROM roysched
ORDER BY title_id, lorange, hirange;


/* 7. Select all the book titles and the maximum royalty they can reach.
    Display only titles that are present in the roysched table. */
  SELECT 
    r.title_id, t.title, MAX(r.royalty) AS max_royalty
FROM
    roysched AS r
        INNER JOIN
    titles AS t USING (title_id)
GROUP BY r.title_id , t.title
ORDER BY r.title_id;
