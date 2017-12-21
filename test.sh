#!/bin/bash

readonly TAG="stefanbirkner/stack_master:test"
failed_tests=0

function build_image {
  docker build -t $TAG . &> /dev/null
}

function check_parameters_are_handed_over {
  output=`docker run $TAG --version`
  #the output of the version command is something like "StackMaster 1.0.0"
  if [[ "$output" = StackMaster* ]]
  then
    echo "- hands over parameters to the stack_master executable"
  else
    echo "- (FAILURE) does not hand over parameters to the stack_master executable"
    increment_failed_tests
  fi
}

function increment_failed_tests {
    failed_tests=$(($failed_tests+1))
}

function main {
  build_image
  
  echo "The tests verified that the Docker image"
  check_parameters_are_handed_over
  echo ""

  if [ $failed_tests -eq 0 ]
  then
    echo "Test succesful"
    exit 0
  else
    echo "Test failed"
    exit 1
  fi
}

main