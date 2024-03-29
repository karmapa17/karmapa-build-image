#!/bin/bash

COMMIT=${TRAVIS_COMMIT::8}
REPO=karmapa/$(cat package.json | grep name | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | xargs)

docker --version
docker login --username="$DOCKER_USERNAME" --password="$DOCKER_PASSWORD"
docker build -f Dockerfile -t $REPO:$TRAVIS_BUILD_NUMBER-$COMMIT .
docker push $REPO:$TRAVIS_BUILD_NUMBER-$COMMIT
