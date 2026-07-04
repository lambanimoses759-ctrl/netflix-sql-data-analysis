SELECT * FROM netflix_title.`netflix_titles(moses lambani)`;
SELECT 
    listed_in AS genre_combination, 
    COUNT(*) AS total_titles
FROM `netflix_title`.`netflix_titles(moses lambani)`
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;
SELECT 
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(t.listed_in, ',', numbers.n), ',', -1)) AS individual_genre,
    COUNT(*) AS total_count
FROM 
    (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) numbers
INNER JOIN `netflix_title`.`netflix_titles(moses lambani)` t
    ON CHAR_LENGTH(t.listed_in) - CHAR_LENGTH(REPLACE(t.listed_in, ',', '')) >= numbers.n - 1
GROUP BY individual_genre
ORDER BY total_count DESC
LIMIT 10;
SELECT
    type,
    AVG(Duration_value) AS average_duration,
    MIN(Duration_value) AS shortest_duration,
    MAX(Duration_value) AS longest_duration
FROM
    `netflix_title`.`netflix_titles(moses lambani)`
GROUP BY 
        type;
	SELECT
     release_year,
     AVG(Duration_value) AS avg_movie_duration,
     COUNT(*) AS total_movies_released
FROM
    `netflix_title`.`netflix_titles(moses lambani)`
WHERE
     type = 'Movie' AND release_year>= 2000
GROUP BY
        release_year
ORDER BY release_year DESC;

SELECT 
    release_year AS 'Year',
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS 'Movies Released',
    SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS 'TV Shows Released',
    COUNT(*) AS 'Total Content'
FROM `netflix_title`.`netflix_titles(moses lambani)`
WHERE release_year BETWEEN 2000 AND 2021
GROUP BY release_year
ORDER BY release_year DESC;