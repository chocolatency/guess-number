#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# clear database 
TRUNCATE_TABLES=$($PSQL "truncate table games, teams;");

# init insert queries string
INSERT_GAMES_QUERY="INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ";

ACUM="22";

# adds record to teams
function ADD_NEW_TEAM {
  if [[ -z $1 ]] 
  then 
    # insert new recoder into teams
    if [[ $2 != "winner" && $2 != "opponent" ]]
    then
      INSERT_INTO_TEAMS=$($PSQL "insert into teams (name) values ('$2')");
    fi
  fi

}

# read data from game.csv
cat games.csv | while IFS=',' read -r YEAR ROUND TEAM_1 TEAM_2 TEAM_1_GOALS TEAM_2_GOALS
do 
  # check if winner record exists
  TEAM_1_ID=$($PSQL "select team_id from teams where name='$TEAM_1';")
  # add new team
  ADD_NEW_TEAM "$TEAM_1_ID" "$TEAM_1" 

  # check if opponent record exists
  TEAM_2_ID=$($PSQL "select team_id from teams where name='$TEAM_2';")
  # add new team
  ADD_NEW_TEAM "$TEAM_2_ID" "$TEAM_2"

  # select id of first team if select query returned nullish
  if [[ -z $TEAM_1_ID ]] 
  then
    TEAM_1_ID=$($PSQL "select team_id from teams where name='$TEAM_1';")
  fi
  
  # select id of second team if select query returned nullish
  if [[ -z $TEAM_2_ID ]]
  then
    TEAM_2_ID=$($PSQL "select team_id from teams where name='$TEAM_2';")
  fi

  # insert games record
  if [[ $ROUND != "round" ]]
  then
    GAME_RECORD=$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($YEAR, '$ROUND', $TEAM_1_ID, $TEAM_2_ID, $TEAM_1_GOALS, $TEAM_2_GOALS);");
  fi
  echo "$GAME_RECORD"

done 

