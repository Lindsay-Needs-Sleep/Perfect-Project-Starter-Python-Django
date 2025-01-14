#!/bin/bash

# usage: ./sr-run.sh <mode>
# mode: default - run dev server (debugging enabled)
#       w - run dev server and wait debugger to attach
#       p - run production server
#       t - test (debugging enabled)
#       tw - test and wait debugger to attach
#       s - autofix some styles and style check
#       st - style check and test
#       i - interactive

CONTAINER="soft-reset"
EXEC="docker compose exec -it ${CONTAINER}"

case $1 in
    i) COMMAND=(bash);;
    s) COMMAND=(bash -cex "
        npm install &&
        npm run style-fix
        ");;
    st) COMMAND=(bash -cex "
        npm install &&
        echo 'For style errors, run \"./soft-reset-run.sh s\" to autofix' &&
        npm run style-check
        ");;
    t) COMMAND=();;
    tw) COMMAND=();;
    p) COMMAND=(bash -cex "
        npm install --omit=dev &&
        npm run prod
        ");;
    pw) COMMAND=(bash -cex "
        npm install &&
        npm run prod-wait
        ");;
    w) COMMAND=(bash -cex "
        npm install &&
        npm run dev-wait
        ");;
    *) COMMAND=(bash -cex "
        npm install &&
        npm run dev
        ");;
esac

# Ensure the developement containers are running (python and front are just sleeping)
(cd ./docker && docker compose up $CONTAINER --no-recreate --detach)

echo $EXEC "${COMMAND[@]}"
(cd ./docker && $EXEC "${COMMAND[@]}")
