-- Challenge 1 - Most Profiting Authors
-- Step 1

SELECT ta.au_id AS AuthorID, s.title_id AS TitleID,
      (CAST(t.price AS float) * s.qty) * (CAST(t.royalty AS float) / 100) * (ta.royaltyper / 100) AS RoyaltyPerSale,
      CAST(t.advance AS float) * (ta.royaltyper / 100) AS AdvancePerTitleAndAuthor
INTO TEMP TABLE royalties_per_sale
FROM sales AS s
INNER JOIN titles AS t 
ON s.title_id = t.title_id
INNER JOIN titleauthor AS ta 
ON t.title_id = ta.title_id;

SELECT * FROM royalties_per_sale

-- Step 2
SELECT AuthorID, TitleID, SUM(RoyaltyPerSale) AS RoyaltyPerTitleAndAuthor, AdvancePerTitleAndAuthor
INTO TEMP TABLE royalties_and_advance_per_title_and_author
FROM royalties_per_sale
GROUP BY TitleID, AuthorID, AdvancePerTitleAndAuthor;

SELECT * FROM royalties_and_advance_per_title_and_author

-- Step 3
SELECT AuthorID, ROUND(SUM(RoyaltyPerTitleAndAuthor + AdvancePerTitleAndAuthor)) AS Profits
INTO TEMP TABLE profit_per_author
FROM royalties_and_advance_per_title_and_author
GROUP BY AuthorID;

SELECT *
FROM profit_per_author
ORDER BY Profits desc
LIMIT 3;


-- Challenge 2 - Alternative Solution
-- Step 3
SELECT AuthorID, ROUND(SUM(RoyaltyPerTitleAndAuthor + AdvancePerTitleAndAuthor)) AS Profits
FROM (
    -- Step 2
    SELECT AuthorID, TitleID, SUM(RoyaltyPerSale) AS RoyaltyPerTitleAndAuthor, AdvancePerTitleAndAuthor
    FROM (
      -- Step 1
      SELECT ta.au_id AS AuthorID, s.title_id AS TitleID,
      (CAST(t.price AS float) * s.qty) * (CAST(t.royalty AS float) / 100) * (ta.royaltyper / 100) AS RoyaltyPerSale,
      CAST(t.advance AS float) * (ta.royaltyper / 100) AS AdvancePerTitleAndAuthor
      FROM sales s
      INNER JOIN titles t ON s.title_id = t.title_id
      INNER JOIN titleauthor ta ON t.title_id = ta.title_id
    ) royalties_per_sale
    GROUP BY TitleID, AuthorID, AdvancePerTitleAndAuthor
    ) royalties_and_advance_per_title_and_author
GROUP BY AuthorID
ORDER BY Profits desc
LIMIT 3;



-- Challenge 3 - Create A Permanent Table Of The Most Profiting Authors
SELECT *
INTO TABLE most_profiting_authors
FROM profit_per_author
ORDER BY Profits desc
LIMIT 3;