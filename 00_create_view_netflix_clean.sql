/* Normalized, analysis-friendly view */
CREATE OR REPLACE VIEW netflix_clean AS
SELECT
  TRIM(show_id) AS show_id,
  CASE WHEN type IN ('Movie','TV Show') THEN type END AS type,
  TRIM(title) AS title,
  NULLIF(TRIM(director), '') AS director,
  NULLIF(TRIM(cast), '') AS cast,
  NULLIF(TRIM(country), '') AS country,
  STR_TO_DATE(NULLIF(TRIM(date_added), ''), '%M %e, %Y') AS date_added,  -- e.g. "September 9, 2019"
  release_year,
  NULLIF(TRIM(rating), '') AS rating,
  TRIM(duration) AS duration_label,                                      -- original text (e.g., "90 min", "2 Seasons")
  CASE WHEN type = 'Movie'
       THEN CAST(SUBSTRING_INDEX(TRIM(duration), ' ', 1) AS UNSIGNED)
  END AS duration_minutes,
  CASE WHEN type = 'TV Show'
       THEN CAST(SUBSTRING_INDEX(TRIM(duration), ' ', 1) AS UNSIGNED)
  END AS seasons,
  TRIM(listed_in) AS listed_in,
  NULLIF(TRIM(description), '') AS description
FROM netflix_titles;
