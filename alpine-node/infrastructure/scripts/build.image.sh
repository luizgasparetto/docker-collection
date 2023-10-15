#!/bin/sh

IMAGE_NAME="collection.alpine.node"
BUILD_PATH="../.."
DEFAULT_PORT=3000

if [ -f .env ]; then
  export $(cat .env | grep PORT | xargs)
fi

if [ -z ${PORT+x} ]; then
  PORT=$DEFAULT_PORT
fi

docker build \
--build-arg PORT=$PORT \
-t $IMAGE_NAME $BUILD_PATH