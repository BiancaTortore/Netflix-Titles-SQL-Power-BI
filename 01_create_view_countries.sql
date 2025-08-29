/* Split multi-valued country field into one row per country (MySQL 8+ JSON_TABLE) */
CREATE OR REPLACE VIEW v_countries AS
SELECT nc.show_id,
       TRIM(j.val) AS country
FROM netflix_clean nc
JOIN JSON_TABLE(
       CONCAT('["', REPLACE(nc.country, ', ', '","'), '"]'),
       '$[*]' COLUMNS (j VARCHAR(255) PATH '$')
     ) AS jt
     ON nc.country IS NOT NULL
CROSS JOIN LATERAL (SELECT jt.`$` AS val) AS j;
