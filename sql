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

-- Calculate the percentage of total scores contributed by specific users
SELECT (517 + 309 + 304 + 282) / 6366.0;

-- Hacker News Moderating: Count how many times each user posted a specific URL
SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

-- Categorize stories based on their source and count the number of stories from each source
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github.com'
  WHEN url LIKE '%https://medium.com/%' THEN 'MEDIUM'
  WHEN url LIKE '%https://www.nytimes.com/%' THEN 'New York Times' 
  ELSE 'Other'
 END AS 'Source',
 COUNT(*)
FROM hacker_news
GROUP BY 1;

-- Select the first 10 timestamps from the hacker_news table
SELECT timestamp
FROM hacker_news
LIMIT 10;

-- Calculate the average score and count of stories for each hour, ordering by average score in descending order
SELECT strftime('%H', timestamp) AS 'hour', 
      ROUND(AVG(score), 1) AS 'average_score', 
      COUNT(*) AS 'number of stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;


