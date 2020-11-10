SELECT * FROM data;

-- 1. What are the different genres?
SELECT prime_genre
  FROM data
 GROUP BY prime_genre;

-- or
SELECT DISTINCT(prime_genre) 
  FROM data;

/* 2. Which is the genre with the most apps rated?
The count of ratings an app has received is in the rating_count_tot column. */
SELECT prime_genre,
       COUNT(prime_genre),
	   SUM(rating_count_tot)
  FROM data
 WHERE rating_count_tot > 0
 GROUP BY prime_genre
 ORDER BY count DESC
 LIMIT 1;

/*3. Which is the genre with most apps?*/
SELECT prime_genre,
       COUNT(prime_genre)
  FROM data
 GROUP BY prime_genre
 ORDER BY count DESC
 LIMIT 1;

/*4. Which is the one with least?*/
SELECT prime_genre,
       COUNT(prime_genre)
  FROM data
 GROUP BY prime_genre
 ORDER BY count
 LIMIT 1;

/*5. Find the top 10 apps most rated.*/
SELECT track_name,
	   rating_count_tot
  FROM data
 ORDER BY rating_count_tot DESC
 LIMIT 10;

/*6. Find the top 10 apps best rated by users.*/
SELECT track_name,
       user_rating
  FROM data
 ORDER BY user_rating DESC, rating_count_tot DESC
 LIMIT 10;

/*7. Take a look at the data you retrieved in question 5. Give some insights. */
SELECT *
  FROM data
 ORDER BY rating_count_tot DESC, user_rating DESC
 LIMIT 10;

/*8. Take a look at the data you retrieved in question 6. Give some insights. */
SELECT *
  FROM data
 ORDER BY user_rating DESC, rating_count_tot DESC
 LIMIT 10;

/*9. Now compare the data from questions 5 and 6. What do you see? */
 
 
/*10. How could you take the top 3 regarding both user ratings and number of votes?
*/
SELECT track_name,
	   user_rating,
	   rating_count_tot
  FROM data
 ORDER BY user_rating DESC, rating_count_tot DESC
 LIMIT 3;

/*11. Do people care about the price of an app?
Do some queries, comment why are you doing them and the results you retrieve.
What is your conclusion?
*/
SELECT track_name,
       price
  FROM data
 ORDER BY rating_count_tot DESC
 LIMIT 10;

----

SELECT track_name,
       price
  FROM data
 ORDER BY user_rating DESC, rating_count_tot DESC
 LIMIT 10;

----

SELECT price,
       COUNT(price)
  FROM (SELECT price,
		       rating_count_tot
	      FROM data
		 ORDER BY rating_count_tot DESC
         ) AS minit
 WHERE price = 0
 GROUP BY price;
	             
------

SELECT free_or_paid,
       COUNT(free_or_paid)
  FROM (
	       SELECT price,
	              CASE WHEN price = 0 THEN 'free'
	                                  ELSE 'paid'
	              END AS free_or_paid
	         FROM data) AS subq
 GROUP BY free_or_paid;