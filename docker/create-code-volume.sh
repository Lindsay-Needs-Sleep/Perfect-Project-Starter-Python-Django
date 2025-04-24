# Create the python code volume with 'docker volume create' due to issue... read more if you want....

# LOCAL_WORKSPACE_FOLDER is defined by vscode's devcontainer, if it's not,
# just use current directory, cuz we're hopefully not nesting docker
[ -z "${LOCAL_WORKSPACE_FOLDER}" ] && LOCAL_WORKSPACE_FOLDER=$(pwd)

# VsCode Dev Containers "Docker outside of Docker" / Windows(?) hack
# (should also work fine for local development environments)
# Since we are running a "Docker outside of Docker" dev container and not a "Docker in Docker" devcontainer
# we are creating "sibling" containers when we start the server/db (they run using the host's docker engine),
# vs. "Docker in Docker" where the devcontainer has it's own docker engine where the server/db are created (with a performance penalty).
# Unfortunately, using the "sibling" approach means that when we want to bind mount the code to the server container we need to use the
# host's file path (eg. C:/blah), which is available through the devcontainer's LOCAL_WORKSPACE_FOLDER, but docker compose is
# confused by windows paths when running in the linux devcontainer, it thinks it is a relative path and appends the current directory
# in front of it (/workspace/server/C:/blah), which obviously doesn't work.  "docker run -v $LOCAL_WORKSPACE_FOLDER:/proj" works, but
# we want to use compose to avoid a monstrous command, so the work around is to manually (below) create/define the bind mount volume
# before hand, and have the docker-compose.yml look for an existing ("external") volume and use that.
# Docker from Docker docs:
# https://github.com/devcontainers/templates/tree/main/src/docker-outside-of-docker-compose#using-bind-mounts-when-working-with-docker-inside-the-container
# https://code.visualstudio.com/remote/advancedcontainers/use-docker-kubernetes
docker volume create --driver local --opt device=$LOCAL_WORKSPACE_FOLDER/django_src --opt type=none --opt o=bind projectname-django-src
docker volume create --driver local --opt device=$LOCAL_WORKSPACE_FOLDER/vite_src --opt type=none --opt o=bind projectname-vite-src
docker volume create --driver local --opt device=$LOCAL_WORKSPACE_FOLDER/public --opt type=none --opt o=bind projectname-public-src
docker volume create --driver local --opt device=$LOCAL_WORKSPACE_FOLDER/node_src --opt type=none --opt o=bind projectname-node-src
docker volume create --driver local --opt device=$LOCAL_WORKSPACE_FOLDER/vol_shared --opt type=none --opt o=bind projectname-shared-src-volume
