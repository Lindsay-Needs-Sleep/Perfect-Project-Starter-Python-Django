#!/bin/bash

# Docker

# override
cp -n ./docker/docker-compose.prod.override.example.yml ./docker/docker-compose.override.yml
# .env
rm -f docker/.env
echo "CURRENT_HOST_USER_UID=$(id -u)" >> docker/.env
echo "CURRENT_HOST_USER_GID=$(id -g)" >> docker/.env
echo "WORKSPACE_DIR=${PWD##*/}" >> docker/.env

# PostgresSQL
cp -n docker/postgres.example.env docker/postgres.env

# django
cp -n proj_django/zzz_config_zzz/settings_local.example.py proj_django/zzz_config_zzz/settings_local.py
