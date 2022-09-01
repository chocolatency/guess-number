#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

function MAIN_MENU {

  if [[ $1 ]] 
  then
    echo -e "\n$1";
  fi

  SERVISES=$($PSQL "select service_id, name from services order by service_id;");

  echo "$SERVISES" | while read SERVISE_ID BAR SERVISE_NAME
  do
    echo -e "$SERVISE_ID) $SERVISE_NAME"
  done

  # echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"

  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CREATE_APPOINTMENT 1 ;;
    2) CREATE_APPOINTMENT 2 ;;
    3) CREATE_APPOINTMENT 3 ;;
    4) CREATE_APPOINTMENT 4 ;;
    5) CREATE_APPOINTMENT 5 ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

function CREATE_APPOINTMENT {
  echo -e "\n$1"

  # get phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  if [[ -n $CUSTOMER_PHONE ]]
  then
    CUSTOMER_ID=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';");

    if [[ -z $CUSTOMER_ID ]] 
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      if [[ -n $CUSTOMER_NAME ]]
      then
        INSERT_CUSTOMER=$($PSQL "insert into customers (phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');");
      else
        MAIN_MENU "\nThe name field is required."
      fi
    fi

    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    if [[ -n $SERVICE_TIME ]]
    then
      if [[ -z $CUSTOMER_ID ]]
      then
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';");
      fi
      INSERT_APPOINTMENT=$($PSQL "insert into appointments (customer_id, service_id, time) values ($CUSTOMER_ID, $1, '$SERVICE_TIME');");

      echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
    fi

  else 
    MAIN_MENU "\nThe phone field is required."
  fi
}

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU

