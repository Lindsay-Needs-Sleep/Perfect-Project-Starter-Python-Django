#!/bin/bash

# Create uncommitted files from examples (if they don't already exist)

# docker
cp -n ./docker/docker-compose.prod.override.example.yml ./docker/docker-compose.override.yml

# django
cp -n proj_django/zzz_config_zzz/settings_local.example.py proj_django/zzz_config_zzz/settings_local.py

# PostgresSQL database variables setup
cp -n docker/postgres.example.env docker/postgres.env

# Required to make sure docker runs with the right user
rm -f docker/.env
echo "CURRENT_HOST_USER_UID=$(id -u)" >> docker/.env
echo "CURRENT_HOST_USER_GID=$(id -g)" >> docker/.env
echo "WORKSPACE_DIR=${PWD##*/}" >> docker/.env
