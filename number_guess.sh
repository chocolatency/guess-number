#!/bin/bash

# PSQL variable for queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Create secret
SECRET=$((1 + $RANDOM % 1000))

# Prompt an username
echo -e "Enter your username:"

read INPUT_NAME

# Check for user already in database
USER_ID=$($PSQL "select user_id from users where username='$INPUT_NAME';")

# if not add new user record
if [[ -z $USER_ID ]] 
then
  echo -e "Welcome, $INPUT_NAME! It looks like this is your first time here."

  # insert new user
  INSERT_USER=$($PSQL "insert into users (username) values ('$INPUT_NAME');");
  # get new user id
  USER_ID=$($PSQL "select user_id from users where username='$INPUT_NAME';");
  # create game instance for new user
  INSERT_GAME=$($PSQL "insert into games (user_id) values ($USER_ID);")
else 
  # select games played
  GAMES_PLAYED=$($PSQL "select games_played from games where user_id=$USER_ID;");
  # select best game
  BEST_GAME=$($PSQL "select best_game from games where user_id=$USER_ID;");
  # print welcome message
  echo -e "\nWelcome back, $INPUT_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# initialize the counter 
GUESS_COUNTER=0

# guess function
function INPUT_GUESS_NUMBER {
  
  # print message if it passed via arguments
  if [[ -n $1 ]]
  then
    echo -e "\n$1"
  fi
  
  # read input number
  read INPUT_NUMBER

  # update counter
  GUESS_COUNTER=$((GUESS_COUNTER+1))

  # check if input composed of characters
  if [[ $INPUT_NUMBER =~ [a-zA-Z] ]]
  then
    # print appropriate message 
    echo -e "\nThat is not an integer, guess again:"
    INPUT_GUESS_NUMBER
  else
    # process input 
    if [[ $INPUT_NUMBER -lt $SECRET ]]
    then
      echo -e "It's higher than that, guess again:"
      INPUT_GUESS_NUMBER
    elif [[ $INPUT_NUMBER -gt $SECRET ]]
    then
      echo -e "It's lower than that, guess again:"
      INPUT_GUESS_NUMBER
    else 
      BEST_GAME=$($PSQL "select best_game from games where user_id=$USER_ID");
      if [[ $BEST_GAME -gt $GUESS_COUNTER || $BEST_GAME -eq 0 ]]
      then
        UPDATE_BEST_GAME=$($PSQL "update games set best_game=$GUESS_COUNTER where user_id=$USER_ID;")
      fi
      UPDATE_GAME_COUNT=$($PSQL "update games set games_played=games_played + 1 where user_id=$USER_ID");

      echo -e "You guessed it in $GUESS_COUNTER tries. The secret number was $SECRET. Nice job!"
    fi

  fi
}

INPUT_GUESS_NUMBER "Guess the secret number between 1 and 1000:"
