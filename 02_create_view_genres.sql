/* Split multi-valued listed_in field into one row per genre */
CREATE OR REPLACE VIEW v_genres AS
SELECT nc.show_id,
       TRIM(j.val) AS genre
FROM netflix_clean nc
JOIN JSON_TABLE(
       CONCAT('["', REPLACE(nc.listed_in, ', ', '","'), '"]'),
       '$[*]' COLUMNS (j VARCHAR(255) PATH '$')
     ) AS jt
     ON nc.listed_in IS NOT NULL
CROSS JOIN LATERAL (SELECT jt.`$` AS val) AS j;
