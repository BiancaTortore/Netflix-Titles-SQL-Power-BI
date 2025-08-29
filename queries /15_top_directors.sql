SELECT director, COUNT(*) AS total_titles
FROM netflix_clean
WHERE director IS NOT NULL AND director <> ''
GROUP BY director
ORDER BY total_titles DESC, director
LIMIT 15;
