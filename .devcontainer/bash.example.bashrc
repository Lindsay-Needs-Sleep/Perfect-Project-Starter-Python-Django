#!/bin/bash

# add command to print nicer ls
alias ll='ls -alF'
# Docker shortcuts
alias d='docker'
alias dc='docker compose'
# removes all currently unused containers
alias dcrmc='docker rm \$(docker ps -a -q)'
# removes all currently unused containers/images
alias dcrmci='docker rm \$(docker ps -a -q); docker rmi \$(docker images -q)'
# removes all currently unused containers/volumes
alias dcrmcv='docker rm \$(docker ps -a -q); docker volume rm -f \$(docker volume list -q)'
# removes all currently unused containers/images/volumes
alias dcrmciv='docker rm \$(docker ps -a -q); docker rmi \$(docker images -q); docker volume rm -f \$(docker volume list -q)'
