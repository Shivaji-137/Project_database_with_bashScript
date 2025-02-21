#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"


MAIN_SERVICE(){

  echo -e "1) cut\n2) Color\n3) Manicure\n4) Facial"

  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
  1|2|3|4) CHECK_CUSTOMERS $SERVICE_ID_SELECTED ;;
  *) MAIN_SERVICE "I could not find that service. What would you like today?" ;;
  esac
}

CHECK_CUSTOMERS(){
  echo -e "\nWhat's your phone number?"
  SERVICE_SELECTED=$($PSQL "select name from services where service_id='$1'")
  read CUSTOMER_PHONE
  PHONE_NUMBER=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $PHONE_NUMBER ]]
  then
    NEW_CUSTOMERS "$SERVICE_SELECTED" "$CUSTOMER_PHONE"
  fi
}

NEW_CUSTOMERS(){
  SERVICE="$1"
  PHONE_NBR="$2"
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?" # $1 takes an argument from function
  read SERVICE_TIME
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  INSERT_NEW_CUSTOMER=$($PSQL "insert into customers(phone, name) values('$PHONE_NBR', '$CUSTOMER_NAME')")
  APPOINTMENT "$SERVICE" "$PHONE_NBR" "$SERVICE_TIME" 
}

APPOINTMENT(){
  service="$1"
  phone_nbr="$2"
  service_time="$3"
  customer_id=$($PSQL "select customer_id from customers where phone='$phone_nbr'")
  service_id=$($PSQL "select service_id from services where name='$service'")
  INSERT_INTO_APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($customer_id,$service_id,'$service_time')")
}
MAIN_SERVICE
