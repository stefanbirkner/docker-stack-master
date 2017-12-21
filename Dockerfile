FROM ruby:2.4.3
LABEL maintainer="Stefan Birkner <mail@stefan-birkner.de>"

ENV STACK_MASTER_VERSION=1.0.0

RUN gem install stack_master -v $STACK_MASTER_VERSION
RUN mkdir /stack_master

WORKDIR /stack_master
VOLUME /stack_master

ENTRYPOINT [ "stack_master" ]
