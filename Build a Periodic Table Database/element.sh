#!/bin/bash

# Written by Shivaji Chaulagain

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

input_argument=$1

check_input_arguments() {
  if [[ -z $input_argument ]]; then
    echo "Please provide an element as an argument."
    exit 0
  fi
  show_element
}

show_element() {
  if [[ $input_argument =~ ^[0-9]+$ ]]; then
    by_atomic_number "$input_argument"
  elif [[ ${#input_argument} -le 2 ]]; then
    by_symbol "$input_argument"
  else
    by_name "$input_argument"
  fi
}

by_atomic_number() {
  atomic_nbr=$1
  result=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e INNER JOIN properties p ON e.atomic_number = p.atomic_number INNER JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number=$atomic_nbr;")

  if [[ -z $result ]]; then
    no_element_msg
  else
    IFS='|' read -r atomic_nbr get_name get_symbol get_type get_mass get_melting_point get_boiling_point <<< "$result"
    echo "The element with atomic number $atomic_nbr is $get_name ($get_symbol). It's a $get_type, with a mass of $get_mass amu. $get_name has a melting point of $get_melting_point celsius and a boiling point of $get_boiling_point celsius."
  fi
}

by_symbol() {
  symbol=$(echo "$1" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
  result=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e INNER JOIN properties p ON e.atomic_number = p.atomic_number INNER JOIN types t ON p.type_id = t.type_id WHERE e.symbol='$symbol';")

  if [[ -z $result ]]; then
    no_element_msg
  else
    IFS='|' read -r atomic_nbr get_name get_symbol get_type get_mass get_melting_point get_boiling_point <<< "$result"
    echo "The element with atomic number $atomic_nbr is $get_name ($get_symbol). It's a $get_type, with a mass of $get_mass amu. $get_name has a melting point of $get_melting_point celsius and a boiling point of $get_boiling_point celsius."
  fi
}

by_name() {
  element_name=$(echo "$1" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
  result=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e INNER JOIN properties p ON e.atomic_number = p.atomic_number INNER JOIN types t ON p.type_id = t.type_id WHERE e.name='$element_name';")

  if [[ -z $result ]]; then
    no_element_msg
  else
    IFS='|' read -r atomic_nbr get_name get_symbol get_type get_mass get_melting_point get_boiling_point <<< "$result"
    echo "The element with atomic number $atomic_nbr is $get_name ($get_symbol). It's a $get_type, with a mass of $get_mass amu. $get_name has a melting point of $get_melting_point celsius and a boiling point of $get_boiling_point celsius."
  fi
}

no_element_msg() {
  echo "I could not find that element in the database."
}

check_input_arguments
