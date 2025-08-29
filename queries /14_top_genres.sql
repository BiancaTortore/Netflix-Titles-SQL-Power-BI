SELECT genre, COUNT(*) AS total_titles
FROM v_genres
GROUP BY genre
ORDER BY total_titles DESC, genre
LIMIT 15;
