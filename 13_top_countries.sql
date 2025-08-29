/* Counts each country independently using the split view */
SELECT country, COUNT(*) AS total_titles
FROM v_countries
GROUP BY country
ORDER BY total_titles DESC, country
LIMIT 15;
