#!/bin/bash

if [ "$1" = "-nc" ]; then
  echo "Bypassing web service cache"
  NC=true
  NCB=false
else
  NC=false
  NCB=false
fi

docker build --no-cache=$NC -t streamsimple/wiremock:latest .
