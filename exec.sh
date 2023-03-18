#!/bin/bash

# [-c <container default=python] [<command to run>]
# If no command specificied, opens an interactive bash shell inside the running container

CONTAINER=python

while getopts ":c:" flag
do
    echo flg="${flag}"
    echo opt="${OPTARG}"
    case "${flag}" in
        c)
            CONTAINER=${OPTARG}
            ;;
    esac
done

# All of the options
COMMAND=$@
# From Alex, might help
# COMMAND=$(printf '%q' "$@")

# If an alternate container was passed
if [ "$1" = "-c" ]
then
    # Remove container option
    COMMAND=${@:3}
fi

DOCKER="docker compose exec -it ${CONTAINER} bash"

# If COMMAND is non-empty
if [ ! -z "$COMMAND" ]
then
    # we will run the command instead of opening a bash shell
    DOCKER=$DOCKER' -c '
fi

# Just so we don't see the warning that PYTHON_CONTAINER_COMAND is unset
export PYTHON_CONTAINER_COMAND="echo \"executing: '${COMMAND[@]}'\""
$PYTHON_CONTAINER_COMAND

# EXEC_COMMAND=($DOCKER "${COMMAND}")
# (cd ./docker && "${EXEC_COMMAND[@]}")
echo $DOCKER"'${COMMAND}'"
(cd ./docker && $DOCKER"${COMMAND}")
