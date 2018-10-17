#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "grolemund@gmail.com"
git config --global user.name "Garrett Grolemund"

git clone https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output/docs/
git rm -rf *
cp -r ../../docs/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin master
