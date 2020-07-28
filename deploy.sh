#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo

# Go To Public folder
cd docs

# Add changes to git.
git add .

# Commit changes.
git commit -m "Adding generated files"

# Push source and build repos.
git push origin master

