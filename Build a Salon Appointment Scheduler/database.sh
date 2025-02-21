#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# adding column appointment_id, customer_id and service_id

echo $($PSQL "alter table appointments add column appointment_id serial primary key")
echo $($PSQL "alter table customers add column customer_id serial primary key")
echo $($PSQL "alter table services add column service_id serial primary key")

# adding customer id and service id into appointments table for foreign key
echo $($PSQL "alter table appointments add column customer_id int, add column service_id int")

# adding foreign key and referencing column
echo $($PSQL "alter table appointments add foreign key(customer_id) references customers(customer_id)")
echo $($PSQL "alter table appointments add foreign key(service_id) references services(service_id)")

# adding phone column unique in customers, name column in customers and services and time column in appointments
echo $($PSQL "alter table customers add column phone varchar(20) unique, add column name varchar(20)")
echo $($PSQL "alter table services add column name varchar(20)")
echo $($PSQL "alter table appointments add column time varchar(20)")

## adding three different services, one with service id 1
echo $($PSQL "ALTER SEQUENCE services_service_id_seq RESTART WITH 1")
echo $($PSQL "insert into services(name) values ('cut'), ('Color'), ('Manicure'), ('Facial')")
