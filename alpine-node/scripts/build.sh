#!/bin/sh

IMAGE_NAME="collection:node"
BUILD_PATH=".."
DEFAULT_PORT=3000

if [ -f .env ]; then
  export $(cat .env | grep PORT | xargs)
fi

if [ -z ${PORT+x} ]; then
  PORT=$DEFAULT_PORT
fi

### Modify path ".." based on your Dockerfile's path
docker build \
--build-arg port=$PORT \
-t $IMAGE_NAME $BUILD_PATH