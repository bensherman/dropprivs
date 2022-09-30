FROM ruby

RUN useradd build

COPY dropprivs.rb /
COPY mysecret.txt /

