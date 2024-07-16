-- In 10.sql, write a SQL query to answer a question of your choice about the prints. The query should:
--Make use of AS to rename a column
--Involve at least one condition, using WHERE
--Sort by at least one column, using ORDER BY

select
    average_color as 'avg_colour'
from
    views
where
    brightness > 5
order by
    entropy desc
