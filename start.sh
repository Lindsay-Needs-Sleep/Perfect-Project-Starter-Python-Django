# Set START_SH_DEBUG and START_SH_DEBUG_WAIT environment variables to true as required for development

# START_SH_DEBUG=true
# START_SH_DEBUG_WAIT=true

if [ "$START_SH_DEBUG" = true ]
then
    DJANGO_OPTS=" --nothreading"
    #  --noreload"
    DEBUGPY="-m debugpy --listen 0.0.0.0:5678"

    if [ "$START_SH_DEBUG_WAIT" = true ]
    then
        DEBUGPY=$DEBUGPY" --wait-for-client"
    fi
else
    DJANGO_OPTS=""
    DEBUGPY=""
fi

cd ./docker

export PYTHON_CONTAINER_COMAND="python "$DEBUGPY" manage.py runserver 0.0.0.0:8080"$DJANGO_OPTS

docker compose up
