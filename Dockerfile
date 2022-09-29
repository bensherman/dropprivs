FROM ruby:3

RUN apt-get update

RUN useradd build

COPY dropprivs.rb /
COPY mysecret.txt /

