# This is the project I completed in freecodecamp relational database certification course where I make my own universe databases with creation of table galaxy, star, planet and moon.


# Celestial Bodies Database Project

## Overview
This project involves creating a PostgreSQL database that models celestial bodies, including galaxies, stars, planets, and moons. You'll work with tables and perform various database operations like inserting, querying, and linking records using foreign keys.

## Instructions

1. **Log in to PostgreSQL**  
   To begin, log in to PostgreSQL using the following command in the terminal:
   ```bash
   psql --username=freecodecamp --dbname=postgres
   ```

2. **Connect to Your Database**  
   After logging in, create and connect to your `universe` database:
   ```bash
   CREATE DATABASE universe;
   \c universe
   ```

3. **Create Tables**  
   Create the necessary tables (`galaxy`, `star`, `planet`, and `moon`) following these guidelines:
   - Each table should have a primary key that automatically increments.
   - Each table should have a `name` column of type `VARCHAR`.
   - The `star` table should reference the `galaxy` table via a foreign key.
   - The `planet` table should reference the `star` table via a foreign key.
   - The `moon` table should reference the `planet` table via a foreign key.

4. **Data Types**  
   Use the following data types as required:
   - `INT` for non-primary, non-foreign key columns.
   - `NUMERIC` at least once.
   - `TEXT` at least once.
   - `BOOLEAN` at least twice.

5. **Add Constraints**  
   - At least two columns per table should not accept NULL values.
   - At least one column in each table must be unique.
   - Primary key columns should follow the naming convention `table_name_id` (e.g., `moon_id` for the `moon` table).
   - Foreign key columns should match the name of the referenced column.

6. **Table Requirements**  
   - Your database should have at least 5 tables.
   - The `galaxy` and `star` tables should have at least 6 rows each.
   - The `planet` table should have at least 12 rows.
   - The `moon` table should have at least 20 rows.
   - Each table should have at least 3 columns, and the `galaxy`, `star`, `planet`, and `moon` tables should have at least 5 columns each.


---

