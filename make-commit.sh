#!/bin/bash

git config user.name "GitHub Actions"
git config user.email "actions@github.com"


git checkout -B action-commit

git fetch origin main

if ! git diff --quiet action-commit origin/main; then
  echo "Bad! action-commit is not up to date with main, rebasing..."
  git rebase origin/main
  if [ $? -ne 0 ]; then
    echo "Rebase failed, please resolve conflicts manually."
    exit 1
  fi
else
  echo "Good! action-commit is up to date with main."
fi


git commit --allow-empty -m "🤖 Automatically generated commit on $(date +'%Y-%m-%d %H:%M:%S')"

if git push --force origin action-commit; then
  echo "Push successful!"
  exit 0
else
  echo "Push failed."
  exit 1
fi
