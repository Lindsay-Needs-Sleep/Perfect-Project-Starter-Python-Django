#!/bin/bash
# usage: ./run-vite.sh <mode>
# mode: default - dev server
#       p - production build
#       sf - autofix some styles and style check
#       st - style check and test
#       i - interactive

CONTAINER="vite-con"
EXEC="docker-compose exec -it ${CONTAINER}"

case $1 in
    i) COMMAND=(bash);;
    p) COMMAND=(bash -c "
        npm install --omit=dev &&
        npm run build
        ");;
    sf) COMMAND=(bash -cex "
        npm install &&
        npm run style-fix
        ");;
    st) COMMAND=(bash -cex "
        npm install &&
        echo 'For style errors, run \"./run-node.sh s\" to autofix' &&
        npm run style-check
        ");;
    *) COMMAND=(bash -c "
        npm install &&
        npm run dev
        ");;
esac

# Ensure the developement containers are running (python and front are just sleeping)
(cd ./docker && docker-compose up $CONTAINER --no-recreate --detach)

echo $EXEC "${COMMAND[@]}"
(cd ./docker && $EXEC "${COMMAND[@]}")
