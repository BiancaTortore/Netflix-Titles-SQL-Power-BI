/* Quick duration quality check + stats for movies */
SELECT
  COUNT(*)                                           AS movie_rows,
  SUM(duration_minutes IS NULL)                      AS missing_duration_minutes,
  ROUND(AVG(duration_minutes), 1)                    AS avg_minutes,
  MIN(duration_minutes)                              AS min_minutes,
  MAX(duration_minutes)                              AS max_minutes
FROM netflix_clean
WHERE type = 'Movie';
