#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: build.sh [tag] [domain]";
  exit 1;
else
  docker build -f Dockerfile --build-arg DOMAIN="$2" -t "$1"/qengine .
fi

