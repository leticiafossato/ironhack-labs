SELECT * FROM data;

--1. What are the different genres?
SELECT DISTINCT prime_genre FROM data;

--2. Which is the genre with the most apps rated?
SELECT prime_genre, SUM(rating_count_tot) FROM data 
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC
LIMIT 1;

--3. Which is the genre with most apps?
SELECT prime_genre, COUNT(*) FROM data
GROUP BY prime_genre
ORDER BY COUNT(*) DESC
LIMIT 1;

--4. Which is the one with least?
SELECT prime_genre, COUNT(*) FROM data
GROUP BY prime_genre
ORDER BY COUNT(*) 
LIMIT 1;

--5. Find the top 10 apps most rated.
SELECT track_name, SUM(rating_count_tot) FROM data 
GROUP BY track_name
ORDER BY SUM(rating_count_tot) DESC
LIMIT 10;

--6. Find the top 10 apps best rated by users.
SELECT track_name, SUM(user_rating) FROM data 
GROUP BY track_name
ORDER BY SUM(user_rating) DESC
LIMIT 10;

--7. Take a look at the data you retrieved in question 5. Give some insights.
/* This result is not realiable because we can't classify as top 10 considering only the total of ratings. */

--8. Take a look at the data you retrieved in question 6. Give some insights.
/* This result is not realiable because we can't classify as top 10 considering only the quantity of user ratings.*/

--9. Now compare the data from questions 5 and 6. What do you see?
/* The criterias adopted aren't enough to classify the top 10 apps.
A prove of that, is: the results obtained on quetions 5 and 6 were totally different.
We can't analyse only by one or other, we need to consider the both.*/

--10. How could you take the top 3 regarding both user ratings and number of votes?
SELECT track_name, user_rating, rating_count_tot  FROM data
ORDER BY user_rating DESC ,rating_count_tot DESC
LIMIT 3;
/*We could order the 03 biggest user rating, followrd by the bigger rating_count_tot*/

--11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, user_rating, rating_count_tot, price, currency  FROM data
ORDER BY user_rating DESC ,rating_count_tot DESC
LIMIT 10;
/* Analysing the top 10 apps, 06 are free and the others costs between 0.99 ~ 1.99 USD.
Considering this, people care about price of an app because free apps are more likely to be part of TOP 10. */

--Bonus: Find the total number of games available in more than 1 language.
SELECT prime_genre, COUNT(prime_genre) FROM data
WHERE prime_genre='Games' AND "lang.num">1
GROUP BY prime_genre;

--Bonus2: Find the number of free vs paid apps
SELECT CASE WHEN price=0 then 'free' else 'paid' END AS price_app, COUNT(CASE WHEN price=0 then 'free' else 'paid' END) FROM data
GROUP BY price_app;

--Bonus3: Find the number of free vs paid apps for each genre
SELECT prime_genre, COUNT(prime_genre) AS paid FROM data
WHERE price!=0 
GROUP BY prime_genre;

SELECT prime_genre, COUNT(prime_genre) AS free FROM data
WHERE price=0 
GROUP BY prime_genre;