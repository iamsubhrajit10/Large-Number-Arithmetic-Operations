#!/bin/bash

while true
do
  cd ~/Large-Number-Arithmetic-Operation
  # If nohup.out exists, move it to the home directory
  if [ -f nohup.out ]; then
    mv nohup.out ~/
  fi
  git checkout server_commit_branch || git checkout -b server_commit_branch
  git pull origin main
  git add .
  git commit -m "server commit"
  git push origin server_commit_branch
  sleep 1800
done