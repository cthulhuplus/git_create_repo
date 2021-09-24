#!/bin/bash
# Requires 3 Arguments
# User, GitHub User
# GH Token, GitHub token
# Repo Name, name of the repo to be created in GitHub
export repoName=$3
curl -u "$1:$2" -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/user/repos -d "{\"name\":\"$repoName\"}"
git config --global init.defaultBranch main
echo "# $repoName" >> README.md
git init
git add .
git commit -m "First Commit"
git branch -M main
git remote add origin https://$1:$2@github.com/$1/$repoName.git
git push -u origin main
