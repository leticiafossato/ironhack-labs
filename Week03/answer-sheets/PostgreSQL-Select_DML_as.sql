-- Challenge 1. Who Have Published What At Where?

SELECT authors.au_id,
       authors.au_lname,
	   authors.au_fname,
	   titles.title,
	   publishers.pub_name
  FROM authors
        JOIN titleauthor
	      ON authors.au_id = titleauthor.au_id
   LEFT JOIN titles
          ON titleauthor.title_id = titles.title_id
   LEFT JOIN publishers
          ON titles.pub_id = publishers.pub_id;

/*
To check if our query is correct, we should check if the number of rows
in the table queried above is equal to the number of rows in the
titleauthor table.
*/

SELECT COUNT(*) FROM titleauthor;

-- Challenge 2. Who Have Published How Many At Where?

SELECT authors.au_id,
       authors.au_lname,
	   authors.au_fname,
	   publishers.pub_name,
	   COUNT(*) AS title_count
   FROM authors
        JOIN titleauthor
		  ON authors.au_id = titleauthor.au_id
   LEFT JOIN titles
          ON titleauthor.title_id = titles.title_id
   LEFT JOIN publishers
          ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id,
         authors.au_lname,
		 authors.au_fname,
		 publishers.pub_name
ORDER BY title_count DESC;

/*
To check if our query is correct, we should check if the sum of titles
in the title_count column queried above is equal to the number of rows in the
titleauthor table.
*/

SELECT SUM(titles_count.title_count)
  FROM (
	     SELECT authors.au_id,
	            authors.au_lname,
	            authors.au_fname,
	            publishers.pub_name,
	            COUNT(*) AS title_count
	       FROM authors
	            JOIN titleauthor
	              ON authors.au_id = titleauthor.au_id
	       LEFT JOIN titles
	              ON titleauthor.title_id = titles.title_id
	       LEFT JOIN publishers
	              ON titles.pub_id = publishers.pub_id
	   GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
	   ORDER BY title_count DESC
        ) AS titles_count;

-- Challenge 3. Best Selling Authors

SELECT authors.au_id,
       authors.au_lname,
	   authors.au_fname,
	   SUM(sales.qty) AS total
  FROM authors
         JOIN titleauthor
		   ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles
	       ON titleauthor.title_id = titles.title_id
    LEFT JOIN sales
	       ON titles.title_id = sales.title_id
GROUP BY authors.au_id,
         authors.au_lname,
		 authors.au_fname
ORDER BY total DESC
LIMIT 3;

-- Challenge 4. Best Selling Authors Ranking

SELECT authors.au_id,
       authors.au_lname,
	   authors.au_fname,
	   COALESCE(SUM(sales.qty), 0) AS total
  FROM authors
       LEFT JOIN titleauthor
	          ON authors.au_id = titleauthor.au_id
       LEFT JOIN titles
	          ON titleauthor.title_id = titles.title_id
       LEFT JOIN sales
	          ON titles.title_id = sales.title_id
GROUP BY authors.au_id,
         authors.au_lname,
		 authors.au_fname
ORDER BY total DESC;