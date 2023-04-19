#!/bin/bash
# usage: ./frontend-start.sh <mode>
# mode: default - dev server
#       p - production build
#       i - interactive

EXEC="docker compose exec -it front"

case $1 in
    i) COMMAND=(bash);;
    p) COMMAND=(bash -c "
        npm install --omit=dev &&
        npm run build
        ");;
    *) COMMAND=(bash -c"
        npm install &&
        npm run dev
        ");;
esac

# Ensure the developement containers are running (python and front are just sleeping)
(cd ./docker && docker compose up front --no-recreate --detach)

echo $EXEC "${COMMAND[@]}"
(cd ./docker && $EXEC "${COMMAND[@]}")
