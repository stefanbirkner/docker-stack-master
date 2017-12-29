#!/bin/bash

set -e

if [ "$TRAVIS_BRANCH" = "new_release" ]
then
  echo "sfb $TRAVIS_COMMIT"
  git fetch origin master
  git fetch origin new_release
  git checkout master
  git merge --ff-only origin/new_release
  git push origin master
  git push origin :new_release
fi
