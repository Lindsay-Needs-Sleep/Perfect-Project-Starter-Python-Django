#!/bin/bash
# usage: ./components-start.sh <mode>
# mode: default - dev server
#       p - production build
#       i - interactive

CONTAINER="vite-con"
EXEC="docker compose exec -it ${CONTAINER}"

case $1 in
    i) COMMAND=(bash);;
    p) COMMAND=(bash -c "
        npm install --omit=dev &&
        npm run build
        ");;
    *) COMMAND=(bash -c "
        npm install &&
        npm run dev
        ");;
esac

# Ensure the developement containers are running (python and front are just sleeping)
(cd ./docker && docker compose up $CONTAINER --no-recreate --detach)

echo $EXEC "${COMMAND[@]}"
(cd ./docker && $EXEC "${COMMAND[@]}")
