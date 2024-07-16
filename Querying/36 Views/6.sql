-- write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”
select
    round(avg(entropy), 2) as 'Hiroshige Average Entropy'
from
    views
where
    artist = 'Hiroshige'
