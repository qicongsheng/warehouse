#!/bin/bash
# container path => /etc/buildkit/buildkitd.toml
curl -o /tmp/buildkitd.toml -L https://www.qics.top/shell/docker/common/buildkitd.toml
docker buildx create --name mutibuilder --config=/tmp/buildkitd.toml
docker buildx use mutibuilder
docker buildx inspect --bootstrap

