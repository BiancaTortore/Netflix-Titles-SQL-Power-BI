SELECT type, COUNT(*) AS total
FROM netflix_clean
GROUP BY type
ORDER BY total DESC;
