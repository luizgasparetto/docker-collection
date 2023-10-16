#!/bin/sh

declare -A image_config

image_config=(
  [tag]="nginx:collection"
  [http_port]=80
  [https_port]=443
)

docker build \
--build-arg HTTP_PORT=${image_config.http_port} \
--build-arg HTTPS_PORT=${image_config.https_port} \
-t ${image_config.tag} - < "../../Dockerfile"