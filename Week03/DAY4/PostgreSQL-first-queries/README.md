![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | My First Queries

**1. What are the different genres?**

"Shopping"<br>
"Games"<br>
"Education"<br>
"Reference"<br>
"Business"<br>
"Social Networking"<br>
"Food & Drink"<br>
"Sports"<br>
"Catalogs"<br>
"Weather"<br>
"Book"<br>
"Music"<br>
"Entertainment"<br>
"Medical"<br>
"Utilities"<br>
"Travel"<br>
"Navigation"<br>
"Photo & Video"<br>
"Finance"<br>
"Health & Fitness"<br>
"News"<br><br>
"Productivity"<br>
"Lifestyle"<br>

**2. Which is the genre with the most apps rated?**
| prime_genre  |    sum    |
| ------------ | --------  |
|    Games     |  52878491 |

**3. Which is the genre with most apps?**
| prime_genre  |  count  |
| ------------ | --------|
|    Games     |  3862   |


**4. Which is the one with least?**
| prime_genre  |  count  |
| ------------ | --------|
|  Catalogs    |    10   |


**5. Find the top 10 apps most rated.**
| track_name                 |     sum     |
| ------------               | ------------|
|  Facebook                  |    2974676  |
|  Instagram                 |    2161558  |
|  Clash of Clans            |    2130805  |
|  Temple Run                |    1724546  |
|  Pandora - Music & Radio   |    1126879  |
|  Pinterest                 |    1061624  |
|  Bible                     |    985920   |
|  Candy Crush Saga          |    961794   |
|  Spotify Music             |    878563   |
|  Angry Birds               |   824451    |


**6. Find the top 10 apps best rated by users.**
| track_name                                          |  sum  |
| ------------                                        | ------|
|  VR Roller Coaster                                  |   7   |
|  Mannequin Challenge                                |   7   |
|  Versus - Multiplayer Game (2 players)              |   5   |
|  Evolution Calculator - CP & XP - for Pokemon GO!   |   5   |
|  Ý«¾Õ_¤(¨÷¾Ð_äö)-_Òâ_È_ÀªàÎ_Û¤Ü         |   5   |
| Neon Chrome                                         |   5   |
|  Bitauto Autoprice                                  |   5   |
|  Triller - Music Video & Film Maker                 |   5   |
|  Kingdom Rush Origins HD                            |   5   |
|  Beat Stomper                                       |   5   |


**7. Take a look at the data you retrieved in question 5. Give some insights.**
This result is not realiable because we can't classify as top 10 considering only the total of ratings. 

**8. Take a look at the data you retrieved in question 6. Give some insights.**
This result is not realiable because we can't classify as top 10 considering only the quantity of user ratings.

**9. Now compare the data from questions 5 and 6. What do you see?**
The criterias adopted aren't enough to classify the top 10 apps.
A prove of that, is: the results obtained on quetions 5 and 6 were totally different.
We can't analyse only by the quantity of total ratings, we also need to consider which rate was given.

**10. How could you take the top 3 regarding both user ratings and number of votes?**
| user_rating                                      |    user_rating    |      rating_count_tot     |
| ------------                                     | ----------------- |  -------------------------|
|  Head Soccer                                     |       5           |          481564           |         
|  Plants vs. Zombies                              |       5           |          426463           |  
|  Sniper 3D Assassin: Shoot to Kill Gun Game      |       5           |          386521           |  


**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?**
| track_name                                           |    user_rating    |      rating_count_tot     | price | currency |
| ------------                                         | ----------------- |  -------------------------|-------|----------|
|  Head Soccer                                         |       5           |          481564           |   0   |    USD   |  
|  Plants vs. Zombies                                  |       5           |          426463           |  0.99 |    USD   | 
|  Sniper 3D Assassin: Shoot to Kill Gun Game          |       5           |          386521           |   0   |    USD   | 
|  Geometry Dash Lite                                  |       5           |          370370           |   0   |    USD   | 
|  Infinity Blade                                      |       5           |          326482           | 0.99  |    USD   | 
|  Geometry Dash                                       |       5           |          266440           | 1.99  |    USD   | 
|  Domino's Pizza USA                                  |       5           |          258624           |   0   |    USD   | 
|  CSR Racing 2                                        |       5           |          257100           |   0   |    USD   | 
|  Pictoword: Fun 2 Pics Guess What's the Word Trivia  |       5           |          186089           |   0   |    USD   | 
|  Plants vs. Zombies HD                               |       5           |          163598           |  0.99 |    USD   | 

Analysing the top 10 apps, 06 are free and the others costs between 0.99 ~ 1.99 USD.
Considering this, people care about price of an app because free apps are more likely to be part of TOP 10.


**Bonus: Find the total number of games available in more than 1 language.**
| prime_genre       |       count       |      
| ------------      | ----------------- |  
|  Games            |         1660      |


**Bonus2: Find the number of free vs paid apps**
| price_app       |       count       |      
| ------------    | ----------------- |  
|  paid           |         3141      |
|  free           |         4056      |


**Bonus3: Find the number of free vs paid apps for each genre**
:grey_question: I make 02 queries to answer this quetion, but I'll try to improve the solution.

| prime_genre        |   paid  |
| ------------       | --------|
| Shopping           |   1     |
| Games              |   1605  |
| Education          |   321   |
| Reference          |   44    |
| Social Networking  |   24    |
| Business           |   37    |
| Sports             |   35    |
| Food & Drink       |   20    |
| Catalogs           |   1     |   
| Weather            |   41    |  
| Book               |   46    | 
| Music              |   71    | 
| Entertainment      |   201   | 
| Medical            |   15    | 
| Utilities          |   139   | 
| Travel             |   25    | 
| Navigation         |   26    | 
| Finance            |   20    | 
| Photo & Video      |   182   | 
| Health & Fitness   |   104   | 
| News               |   17    | 
| Productivity       |   116   | 
| Lifestyle          |   50    | 



| prime_genre        |   free  |
| ------------       | --------|
| Shopping           |   121   |
| Games              |   2257  |
| Education          |   132   |
| Reference          |   20    |
| Business           |   20    |
| Social Networking  |   143   |
| Food & Drink       |  	43   |
| Sports             |  	79   |
| Catalogs           |  	9    |
| Weather            |  	31   |
| Book               |  	66   |
| Music              |  	67   |
| Entertainment      |  	334  |
| Medical            |  	8    |
| Utilities          |  	109  |
| Travel             |  	56   |
| Navigation         |  	20   |
| Photo & Video      |   167   |
| Finance            |  	84   |
| Health & Fitness   |  	76   |
| News               |  	58   |
| Productivity       |    62   |
| Lifestyle          |    94   |

