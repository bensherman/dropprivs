#!/bin/bash

chmod 644 mysecret.txt
docker build -t dropprivs .
docker run dropprivs ruby dropprivs.rb

chmod 604 mysecret.txt
docker build -t dropprivs .
docker run dropprivs ruby dropprivs.rb