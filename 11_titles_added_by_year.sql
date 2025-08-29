SELECT YEAR(date_added) AS year_added, COUNT(*) AS total_titles
FROM netflix_clean
WHERE date_added IS NOT NULL
GROUP BY YEAR(date_added)
ORDER BY year_added;
