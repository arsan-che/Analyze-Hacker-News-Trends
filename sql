-- Select the title and score of the top 5 stories with the highest scores
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Calculate the total score of all stories
SELECT SUM(score)
FROM hacker_news;

-- Select users with a combined score greater than 200 and order them by their total score in descending order
SELECT user, SUM(score)
FROM hacker_news
GROUP BY user 
HAVING SUM(score) > 200
ORDER BY 2 DESC;
