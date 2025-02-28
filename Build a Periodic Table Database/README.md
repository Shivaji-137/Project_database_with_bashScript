# Periodic Table Database

Author/code-writer: Shivaji Chaulagain
----
This project is part of the requirements to earn my certification. It involves creating a Bash script to get information about chemical elements from a periodic table database.

## Project Structure

- `modify_database.sh`: Script to create the database, tables, and add columns.
- `periodic_table.sql`: SQL file to set up the database schema.
- `element.sh`: Shell script to interact with users and retrieve information about chemical elements.

## Getting Started

### Prerequisites

- PostgreSQL installed on your system.
- Bash shell.

### Setting Up the Database

1. Run the `modify_database.sh` script to modify the database and tables:

    ```bash
    ./modify_database.sh
    ```

2. The `periodic_table.sql` file contains the SQL commands to set up the database schema. You can execute it using:

    ```bash
    psql -U postgres -f periodic_table.sql
    ```

### Running the Application

To start the periodic table database script, run the `element.sh` script with passing argument by symbol or atomic number or element name:

```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```


## License

This project is provided by freeCodeCamp for earning certification.