SELECT rating, COUNT(*) AS total
FROM netflix_clean
GROUP BY rating
ORDER BY total DESC, rating;
