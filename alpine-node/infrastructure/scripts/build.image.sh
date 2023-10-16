#!/bin/sh

declare -A image_config

image_config=(
  [tag]="node:collection"
  [build_path]="../.."
  [default_port]=3000
)

if [ -f .env ]; then
  export $(cat .env | grep PORT | xargs)
fi

if [ -z ${PORT+x} ]; then
  PORT=${image_config.default_port}
fi

docker build \
--build-arg PORT=$PORT \
-t ${image_config.tag} ${image_config.build_path}