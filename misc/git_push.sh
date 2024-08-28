#!/bin/bash

# Define variables
MAIN_BRANCH="main"
SERVER_BRANCH="server-branch"

while true
do
  # Change directory to your repository
  cd ~/Large-Number-Arithmetic-Operation
  
  # If nohup.out exists, move it to the home directory
  if [ -f nohup.out ]; then
    mv nohup.out ~/
  fi
  
  # Checkout server branch or create if it doesn't exist
  git checkout $SERVER_BRANCH || git checkout -b $SERVER_BRANCH
  
  # Pull changes from main branch
  git pull origin $MAIN_BRANCH
  
  # Merge changes from main branch without committing
  git merge origin/$MAIN_BRANCH --no-commit --no-ff
  
  # Keep server branch files if conflict arises
  git checkout --ours .
  
  # Add all changes
  git add .
  
  # Commit changes with a message
  git commit -m "Automated commit from $MAIN_BRANCH"
  
  # Push changes to server branch
  git push origin $SERVER_BRANCH
  
  # Wait for 30 seconds before next iteration
  sleep 30
done
