#!/bin/bash
# usage: ./frontend-start.sh [command]

# If any argument is passed
if [ ! -z "$1" ]
then
    # eg. ./frontend-start.sh sleep infinity
    # Followed by ./exec.sh -c front bash
    COMMAND=$@
    else
    COMMAND="npm run dev"
fi

export FRONT_CONTAINER_COMAND='bash -c "npm install && '$COMMAND'"'
echo $FRONT_CONTAINER_COMAND

(cd ./docker && docker compose up front)
