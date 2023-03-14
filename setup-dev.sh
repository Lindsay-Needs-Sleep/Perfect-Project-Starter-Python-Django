
# Create uncommitted files from examples (if they don't already exist)
cp -n ./docker/docker-compose.dev.override.example.yml ./docker/docker-compose.override.yml
cp -n .devcontainer/user-installs.example.sh .devcontainer/user-installs.sh
cp -n .vscode/settings.local.example.json .vscode/settings.local.json


# Required to make sure docker runs with the right user
# May need to delete .env to refresh
rm -f docker/.env-dev
echo "export CURRENT_HOST_USER_UID=$(id -u)" >> docker/.env-dev
echo "export CURRENT_HOST_USER_GID=$(id -g)" >> docker/.env-dev
cp -n docker/.env-dev docker/.env


# docker setup
. docker/create-code-volume.sh
