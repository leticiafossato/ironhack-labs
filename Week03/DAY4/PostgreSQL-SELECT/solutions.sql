--Lab | PostgreSQL Select:

--Challenge 1 - Who Have Published What At Where?
SELECT H.au_id AS "AUTHOR ID", H.au_lname AS "LAST NAME", H.au_fname AS "FIRST NAME", H.title AS "TITLE", F.pub_name AS "PUBLISHER" FROM
(SELECT D.au_id, D.au_lname, D.au_fname, F.title, F.pub_id FROM
(SELECT C.au_id, C.au_lname, C.au_fname, F.title_id
FROM authors AS C
INNER JOIN titleauthor AS F ON C.au_id = F.au_id) AS D
INNER JOIN titles AS F ON D.title_id = F.title_id) AS H
INNER JOIN publishers AS F ON H.pub_id = F.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT MAX(H.au_id) AS "AUTHOR ID", MAX(H.au_lname) AS "LAST NAME", H.au_fname AS "FIRST NAME", MAX(F.pub_name) AS "PUBLISHER", COUNT(F.pub_name) AS "TITLE COUNT" FROM
(SELECT D.au_id, D.au_lname, D.au_fname, F.title, F.pub_id FROM
(SELECT C.au_id, C.au_lname, C.au_fname, F.title_id
FROM authors AS C
INNER JOIN titleauthor AS F ON C.au_id = F.au_id) AS D
INNER JOIN titles AS F ON D.title_id = F.title_id) AS H
INNER JOIN publishers AS F ON H.pub_id = F.pub_id
GROUP BY H.au_fname
ORDER BY "TITLE COUNT" DESC, "FIRST NAME";

-- Challenge 3 - Best Selling Authors
--First, analysing the tables:
SELECT * FROM authors
SELECT * FROM sales
SELECT * FROM titleauthor

--Resolution:
SELECT B.au_id as "AUTHOR ID", MAX(B.au_lname) AS "LAST NAME", MAX(B.au_fname) AS "FIRST NAME", SUM(sales.qty) AS "TOTAL" FROM (SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id) AS B
INNER JOIN sales ON B.title_id=sales.title_id
GROUP BY au_id
ORDER BY "TOTAL" DESC
LIMIT 3;

--Challenge 4 - Best Selling Authors Ranking
SELECT B.au_id as "AUTHOR ID", MAX(B.au_lname) AS "LAST NAME", MAX(B.au_fname) AS "FIRST NAME", SUM(sales.qty) AS "TOTAL" FROM (SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id) AS B
LEFT JOIN sales ON B.title_id=sales.title_id
GROUP BY au_id
ORDER BY "TOTAL" DESC;