#!/bin/bash
# usage: ./frontend-start.sh <mode>
# mode: default - dev server
#       i - interactive

EXEC="docker compose exec -it front"

case $1 in
    i) COMMAND=(bash);;
    *) COMMAND=(npm run dev);;
esac

# Ensure the developement containers are running (python and front are just sleeping)
(cd ./docker && docker compose up front --no-recreate --detach)

echo $EXEC "${COMMAND[@]}"
(cd ./docker && $EXEC "${COMMAND[@]}")
