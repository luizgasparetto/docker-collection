#!/bin/sh

IMAGE_NAME="collection.alpine.nginx"
BUILD_PATH="../.."

HTTP_PORT=80
HTTPS_PORT=443

docker build \
--build-arg HTTP_PORT=${HTTP_PORT} \
--build-arg HTTPS_PORT=${HTTPS_PORT} \
-t $IMAGE_NAME $BUILD_PATH