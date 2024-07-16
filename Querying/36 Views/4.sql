-- write a SQL query to count how many prints by Hiroshige have English titles that refer to the “Eastern Capital”.
-- Hiroshige’s prints were created in Japan’s “Edo period,” referencing the eastern capital city of Edo, now Tokyo.
select
    count(distinct print_number)
from
    views
where
    english_title like '%Eastern Capital%'
    and artist = 'Hiroshige'
