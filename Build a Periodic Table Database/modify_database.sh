PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# renaming weight column to atomic_mass
rename_atomic_mass=$($PSQL "alter table properties rename column weight to atomic_mass")

# rename melting point to melting point celsius and boiling to boiling point celsius
rename_melting_point=$($PSQL "alter table properties rename column melting_point to melting_point_celsius")
rename_boiling_point=$($PSQL "alter table properties rename column boiling_point to boiling_point_celsius")

# set column melting point and boiling point celsius not null values
null_meltingpoint=$($PSQL "alter table properties alter column melting_point_celsius set not null")
null_boilingpoint=$($PSQL "alter table properties alter column boiling_point_celsius set not null")

# adding unique constraint to symbol and name from elements table
unique_symbol=$($PSQL "alter table elements add unique(symbol)")
unique_name=$($PSQL "alter table elements add unique(name)")

# setting symbol and name column not null constraint
null_symbol=$($PSQL "alter table elements alter column symbol set not null")
null_name=$($PSQL "alter table elements alter column name set not null")

# setting atomic_number from properties foreign key
atomic_nbr_foreign=$($PSQL "alter table properties add foreign key (atomic_number) references elements (atomic_number)")

# create types table
types=$($PSQL "create table types()")

# adding type_id and type column and three rows to type column
type_id=$($PSQL "alter table types add column type_id serial primary key")
type=$($PSQL "alter table types add column type varchar(25) not null unique")
type_rows=$($PSQL "insert into types(type) select distinct(type) from properties")

# adding type_id foreign key to properties
add_type_id_col=$($PSQL "alter table properties add column type_id int")
type_id_foreign=$($PSQL "alter table properties add foreign key (type_id) references types (type_id)")

# type_id in properties value links to the correct type from types table
update_properties_type_id=$($PSQL "update properties set type_id=(select type_id from types where properties.type = types.type)")
notnull_type_id=$($PSQL "alter table properties alter column type_id set not null")

# capitalize the first letter of all the symbol values in elements table
capitalize_firstletter_symbol=$($PSQL "update elements set symbol=initcap(symbol)")

# removing all the trailing zeros after decimals from each row of the atomic_mass column
alter_varchar_atomic_mass=$($PSQL "alter table properties alter column atomic_mass type varchar(9)")
float_atomic_mass=$($PSQL "update properties set atomic_mass=cast(atomic_mass as float)")

# adding atomic number 9 and 10 in elements and properties table
adding_to_element=$($PSQL "insert into elements(atomic_number, symbol, name) values(9, 'F', 'Fluorine'), (10, 'Ne', 'Neon')")
adding_to_properties=$($PSQL "insert into properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) values(9, 'nonmetal', 18.998, -220, -188.1, 3), (10, 'nonmetal', 20.18, -248.6, -246.1, 3)")

# deleting atomic number 1000 from elements and properties table. also deleting type column
non_existent_element=$($PSQL "delete from properties where atomic_number=1000")
non_existent_element=$($PSQL "delete from elements where atomic_number=1000")
drop_type_column=$($PSQL "alter table properties drop column type")