packages.db available at https://cdn.cs50.net/sql/2024/x/psets/1/packages.zip

Schema:

addresses table

The addresses table contains the following columns:

    id, which is the ID of the address
    address, which is the street address itself (i.e., 7660 Sharon Street)
    type, which is the type of address (i.e., residential, commercial, etc.)

drivers table

The drivers table contains the following columns:

    id, which is the ID of the driver
    name, which is the first name of the driver

packages table

The packages table contains the following columns:

    id, which is the ID of the package
    contents, which contains the contents of the package
    from_address_id, which is the ID of the address from which the package was sent
    to_address_id, which is the ID of the address to which the package was sent. It’s not necessarily where it ended up!

scans table

The scans table contains the following columns:

    id, which is the ID of the scan
    driver_id, which is the ID of the driver who created the scan
    package_id, which is the ID of the package scanned
    address_id, which is the ID of the address where the package was scanned
    action, which indicates whether the package was picked up (“Pick”) or dropped off (“Drop”)
    timestamp, which is the day and time at which the package was scanned
