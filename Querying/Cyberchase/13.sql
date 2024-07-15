-- write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR
-- What is the title and season of all episodes from seasons that had at least 10 episodes in the season and where the title starts with 'The' and does not contain 'Borg'.
-- For each title, show the season the title was in and the count of how many episodes were in that season in total.
SELECT
    s.season,
    s.count_of_episodes_in_season,
    e.title
FROM
    (SELECT
        season,
        COUNT(title) AS count_of_episodes_in_season
    FROM
        episodes
    GROUP BY
        season
    HAVING
        COUNT(title) >= 10
    ) AS s
LEFT JOIN
    episodes as e
    ON s.season = e.season
WHERE
    e.title LIKE "The%" AND e.title NOT LIKE "%Borg%"
;

