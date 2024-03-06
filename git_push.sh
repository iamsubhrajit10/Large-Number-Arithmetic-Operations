#!/bin/bash

while true
do
  cd ~/Large-Number-Arithmetic-Operation
  git checkout server_commit_branch || git checkout -b server_commit_branch
  git add .
  git commit -m "server commit"
  git push origin server_commit_branch
  git checkout main
  sleep 1800
done
