#!/bin/bash

set -e

if [ "$TRAVIS_BRANCH" = "new_release" ]
then
  echo "sfb $TRAVIS_COMMIT"
  git push origin "$TRAVIS_COMMIT:master"
  git push origin :new_release
fi
