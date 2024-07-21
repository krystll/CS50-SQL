-- *** The Lost Letter ***
-- Find the contents and the drop off location of a package addressed from 900 Somerville Avenue

select
    p.contents as "package_contents"
    ,a.address as "scan_address"
    ,a.type    as "scan_address_type"
from
    (-- Identify packages addressed from 900 Somerville Avenue
        select
            p.id
            ,p.contents
        from packages as p
        left join addresses as a
            on a.id = p.from_address_id
        where
            a.address = "900 Somerville Avenue"
    ) as p
left join scans as s -- identify package scans
    on s.package_id = p.id
left join addresses as a -- identify scan address
    on a.id = s.address_id
where
    s.action = "Drop" -- only get drop off scans
;

-- *** The Devious Delivery ***
-- find the delivery address information and package contents for all packages sent from a null address.

select
    pck.contents
    , s.action
    , s.timestamp
    ,sa.address
    ,sa.type
from
    (select
        p.id
        ,p.contents
        ,a.address
        ,a.type
    from packages as p
    left join addresses as a
        on a.id = p.to_address_id
    where
        p.from_address_id is null
    ) as pck
left join scans as s
    on s.package_id = pck.id
left join addresses as sa
    on sa.id = s.address_id
order by s.timestamp asc
;

-- *** The Forgotten Gift ***
-- Find who has a packages sent from 109 Tileston Street to 728 Maple Place and the contents of the package.

select
    pck.id as "package_id"
    ,pck.contents "package_contents"
    ,s.timestamp "scan_timestamp"
    ,s.action
    ,a.address as "scan_address"
    ,d.name as "driver"
from  -- Identify the package(s) addressed from 109 Tileston Street and addressed to 728 Maple Place
    (select
        p.id
        ,p.contents
        ,p.from_address_id
        ,p.to_address_id
    from packages as p
    left join addresses as fa
        on fa.id = p.from_address_id
    left join addresses as ta
        on ta.id = p.to_address_id
    where
        fa.address = "109 Tileston Street"
        and ta.address = "728 Maple Place"
    ) as pck
left join scans as s -- identify package scans
    on s.package_id = pck.id
left join addresses as a -- identify scan address
    on a.id = s.address_id
left join drivers as d -- identify driver who scanned
    on d.id = s.driver_id
order by
    s.timestamp asc
