#!/bin/sh

docker run --rm --name=testwiremock -v `pwd`/test-mappings:/mappings -p 80:8080 streamsimple/wiremock

