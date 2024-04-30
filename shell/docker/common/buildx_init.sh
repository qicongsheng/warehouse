#!/bin/bash
docker buildx create --name mutibuilder
docker buildx use mutibuilder
docker buildx inspect --bootstrap

