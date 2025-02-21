#! /bin/bash

# written by "Shivaji Chaulagain"

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "truncate games, teams")

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then

    # this code insert unique winner and opponent teams into name of teams table
    
    win_team_id=$($PSQL "select team_id from teams where name='$winner'")
    if [[ -z $win_team_id ]]
    then
      insert_teams=$($PSQL "insert into teams(name) values('$winner')")
    fi

    oppo_team_id=$($PSQL "select team_id from teams where name='$opponent'")
    if [[ -z $oppo_team_id ]]
    then
      insert_teams=$($PSQL "insert into teams(name) values('$opponent')")
    fi

  fi
done

# this code inserts data into games table
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then

    win_id=$($PSQL "select team_id from teams where name='$winner'")
    oppo_id=$($PSQL "select team_id from teams where name='$opponent'")
    
    insert_into_games=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$year', '$round', '$win_id', '$oppo_id', '$winner_goals', '$opponent_goals')")


  fi
done