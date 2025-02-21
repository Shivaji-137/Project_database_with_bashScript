# Salon Appointment Scheduler

Author/code-writer: Shivaji Chaulagain
----
This project is part of the requirements to earn my certification. It involves creating an interactive Bash program that uses PostgreSQL to track customers and appointments for salon.

## Project Structure

- `database.sh`: Script to create the database, tables, and add columns.
- `salon.sql`: SQL file to set up the database schema.
- `salon.sh`: Shell script to interact with users and manage appointments.

## Getting Started

### Prerequisites

- PostgreSQL installed on your system.
- Bash shell.

### Setting Up the Database

1. Run the `database.sh` script to create the database and tables:

    ```bash
    ./database.sh
    ```

2. The `salon.sql` file contains the SQL commands to set up the database schema. You can execute it using:

    ```bash
    psql -U postgres -f salon.sql
    ```

### Running the Application

To start the salon appointment scheduler, run the `salon.sh` script:

```bash
./salon.sh
```

## Scripts Overview

### database.sh

This script creates the database and tables required for the salon appointment scheduler.

### salon.sql

This file contains the SQL commands to set up the database schema.

### salon.sh

This script interacts with users to manage appointments.

## License

This project is provided by freeCodeCamp for earning certification.
