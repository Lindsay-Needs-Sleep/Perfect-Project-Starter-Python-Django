#!/bin/bash

# usage: ./backend-start.sh <mode>
# mode: default - run server (debugging enabled)
#       w - run server and wait debugger to attach
#       p - run production server
#       t - test (debugging enabled)
#       tw - test and wait debugger to attach
#       m - migrate
#       mm - make migrations
#       s - autofix some styles and style check
#       st - style check and test
#       i - interactive

CONTAINER="django-con"
EXEC="docker compose exec -it ${CONTAINER}"

case $1 in
    i) COMMAND=(bash);;
    s) COMMAND=(bash -c "
        python -W ignore::DeprecationWarning /usr/local/python/autopep8.py . &&
        python /usr/local/python/pycodestyle.py
        ");;
    st) COMMAND=(bash -c "
        echo 'For style errors, run \"./backend-start.sh s\" to autofix' &&
        python /usr/local/python/pycodestyle.py &&
        python manage.py test --keepdb
        ");;
    m) COMMAND=(python manage.py migrate);;
    mm) COMMAND=(python manage.py makemigrations);;
    t) COMMAND=(python /usr/local/python/debugpy --listen 0.0.0.0:5679 manage.py test --keepdb);;
    tw) COMMAND=(python /usr/local/python/debugpy --listen 0.0.0.0:5679 --wait-for-client manage.py test --keepdb);;
    p) COMMAND=(python manage.py runserver 0.0.0.0:8000);;
    w) COMMAND=(python /usr/local/python/debugpy --listen 0.0.0.0:5678 --wait-for-client manage.py runserver 0.0.0.0:8000 --nothreading);;
    *) COMMAND=(python /usr/local/python/debugpy --listen 0.0.0.0:5678 manage.py runserver 0.0.0.0:8000 --nothreading);;
esac

# Ensure the developement containers are running (python and front are just sleeping)
(cd ./docker && docker compose up $CONTAINER --no-recreate --detach)

echo $EXEC "${COMMAND[@]}"
(cd ./docker && $EXEC "${COMMAND[@]}")
