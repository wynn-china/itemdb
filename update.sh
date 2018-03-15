#!/bin/bash
set -ex

curl -o data.json "https://api.wynncraft.com/public_api.php?action=itemDB&category=all"
git config --global credential.helper "store --file=.git/credentials"
echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials
git config --global user.email "deploy@travis-ci.org"
git config --global user.name "Deployment Bot (from Travis CI)"
git commit -am "Auto update"
git push
