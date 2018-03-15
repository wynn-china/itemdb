#!/bin/bash
set -ex

SOURCE="https://api.wynncraft.com/public_api.php?action=itemDB&category=all"
OUTPUT="data.json"

curl -o $OUTPUT $SOURCE
git config --global credential.helper "store --file=.git/credentials"
echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials
git config --global user.email "deploy@travis-ci.org"
git config --global user.name "Deployment Bot (from Travis CI)"
git add $OUTPUT
git commit -m "Auto update"
git push origin HEAD:refs/heads/data
