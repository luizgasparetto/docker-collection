#!/bin/sh

declare -A image_config
image_config=(
  [name]="collection.alpine.node"
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
-t ${image_config.name} ${image_config.build_path}