#!/bin/bash

# Create uncommitted files from examples (if they don't already exist)
cp -n ./docker/docker-compose.prod.override.example.yml ./docker/docker-compose.override.yml
# django
cp -n pythoncodefolder/settings_local.example.py pythoncodefolder/settings_local.py
