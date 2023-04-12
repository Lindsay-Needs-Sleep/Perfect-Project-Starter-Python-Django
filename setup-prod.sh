#!/bin/bash

# Create uncommitted files from examples (if they don't already exist)
cp -n ./docker/docker-compose.prod.override.example.yml ./docker/docker-compose.override.yml
# django
cp -n back_src/zzz_config_zzz/settings_local.example.py back_src/zzz_config_zzz/settings_local.py
