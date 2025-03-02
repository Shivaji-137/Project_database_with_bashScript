#!/bin/bash

# written by Shivaji Chaulagain

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
RANDOM_NUMBER=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

# Check if the user exists in the database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]; then
  # New user: Insert into the database
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Existing user: Fetch game statistics
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games_info WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guess) FROM games_info WHERE user_id=$USER_ID")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Initialize guess counter
GUESS_COUNT=0

# Function to take and validate user input
GUESS_NUMBER() {
  echo "Guess the secret number between 1 and 1000:"
  while read GUESS; do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
    elif ((GUESS < RANDOM_NUMBER)); then
      echo "It's higher than that, guess again:"
    elif ((GUESS > RANDOM_NUMBER)); then
      echo "It's lower than that, guess again:"
    else
      GUESS_COUNT=$((GUESS_COUNT + 1))
      echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
      break
    fi
    GUESS_COUNT=$((GUESS_COUNT + 1))
  done
}

GUESS_NUMBER

# Store game result in the database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games_info(user_id, number_of_guess) VALUES($USER_ID, $GUESS_COUNT)")
