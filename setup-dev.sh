
# Create uncommitted files from examples (if they don't already exist)
cp -n ./docker/docker-compose.dev.override.example.yml ./docker/docker-compose.override.yml
cp -n .devcontainer/user-installs.example.sh .devcontainer/user-installs.sh
cp -n .vscode/settings.local.example.json .vscode/settings.local.json

# docker setup
. docker/create-code-volume.sh
