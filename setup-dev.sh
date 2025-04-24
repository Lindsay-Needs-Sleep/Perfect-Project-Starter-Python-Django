#!/bin/bash

# django
cp -n proj_django/zzz_config_zzz/settings_local.example.py proj_django/zzz_config_zzz/settings_local.py

# PostgresSQL database variables setup
cp -n docker/postgres.example.env docker/postgres.env

# Required to make sure docker runs with the right user
rm -f docker/.env
echo "CURRENT_HOST_USER_UID=$(id -u)" >> docker/.env
echo "CURRENT_HOST_USER_GID=$(id -g)" >> docker/.env
echo "WORKSPACE_DIR=${PWD##*/}" >> docker/.env

# docker setup
. docker/create-code-volume.sh

# Ensure the docker network exists (for non-devcontainer users)
docker network create ${PWD##*/}-network || true
