# Docker Image for StackMaster

[![Build Status Linux](https://travis-ci.org/stefanbirkner/system-rules.svg?branch=master)](https://travis-ci.org/stefanbirkner/system-rules)

This repository is used to build a Docker image that has
[StackMaster](https://github.com/envato/stack_master) installed. The image is
available from [DockerHub](https://hub.docker.com/) as
[stefanbirkner/stack_master](https://hub.docker.com/r/stefanbirkner/stack_master/).
It is designed to be used to run StackMaster without a local installation of
the tool.

    docker run \
      -e AWS_SECRET_ACCESS_KEY=<your secret access key> \
      -e AWS_ACCESS_KEY_ID=<your access key id> \
      -v $(pwd):/stack_master \
      stefanbirkner/stack_master \
      <your StackMaster command>

It is helpful to create an alias if you want to use it regularly

    alias stack_master="docker run \
      -e AWS_SECRET_ACCESS_KEY=<your secret access key> \
      -e AWS_ACCESS_KEY_ID=<your access key id> \
      -v $(pwd):/stack_master \
      stefanbirkner/stack_master"

Afterwards you can use it like

    stack_master <your StackMaster command>

## How to publish the image

Create the image

    docker build -t stefanbirkner/stack_master:<version> .

Login to DockerHub

    docker login

Publish it

    docker publish stefanbirkner/stack_master:<version>

## Development

Please check that the Dockerfile is correct by running

    ./test.sh

This project supports [Travis CI](https://travis-ci.org/) for continuous
integration. Your pull request will be automatically built and tested by
Travis CI.
