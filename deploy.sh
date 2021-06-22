#!/usr/bin/env sh

set -env

yarn server

cd dist

git init
git add -M
git commit -m "New Deployment"
git push -f https://github.com/DVLuan14/manage-tiki-sheet.git master:gh-pages

cd -
