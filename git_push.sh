#!/bin/bash

while true
do
  cd ~/Large-Number-Arithmetic-Operation
  git checkout auto_commit_branch || git checkout -b auto_commit_branch
  git add .
  git commit -m "auto commit"
  git push origin auto_commit_branch
  sleep 1800
done
