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

### Automatic update to new release

This repository automates some steps that are needed for a Docker image of the
latest StackMaster release.

A branch with the name `new_release` is automatically merged to `master` by
Travis CI if the tests are successful.

#### Preparation

There are several requirements for getting the automatic update process
started.

Travis CI needs permission to push to this repository. Therefore it needs a
personal GitHub access token with the scope `public_repo`. There are two options
for this token. Either you use your own GitHub account or you create a new
GitHub account for Travis CI that has only access to this repository. I
recommend the second option because AFAIK it is currently the only way to
restrict a personal GitHub access token to a single repository. You create the
token by opening the user's settings page, go to "Developer Settings", go to
"Personal access tokens" and press the button "Generate new token". Give the
token a description and select the scope `public_repo`. Now push the button
"Generate token".

Copy the token and add an environment variable `GITHUB_ACCESS_TOKEN` to the
settings of the Travis CI job.