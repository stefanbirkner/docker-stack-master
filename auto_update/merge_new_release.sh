#!/bin/bash

if [ "$TRAVIS_BRANCH" != "new_release" ]
then 
  exit 0;
fi

git checkout master || exit
git merge --ff-only new_release || exit
git push origin master || exit
git push origin :new_release || exit