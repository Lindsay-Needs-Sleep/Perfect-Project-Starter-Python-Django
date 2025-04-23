# Make bash autocomplete work like windows
echo "TAB:menu-complete" >> /etc/inputrc
# Disable bell sound in bash
echo "set bell-style none" >> /etc/inputrc
# add option to /etc/inputrc to enable case-insensitive tab completion for all users
echo "set completion-ignore-case On" >> /etc/inputrc

# Required to make sure docker runs with the right user
# (Handled by setup-dev for now)
# echo "export CURRENT_HOST_USER_UID=\$(id -u)" >> /home/vscode/.bashrc
# echo "export CURRENT_HOST_USER_GID=\$(id -g)" >> /home/vscode/.bashrc

# add command to print nicer ls
echo "alias ll='ls -alF'" >> /etc/bash.bashrc
# Docker shortcuts
echo "alias d='docker'" >> /etc/bash.bashrc
echo "alias dc='docker compose'" >> /etc/bash.bashrc
# removes all currently unused containers
echo "alias dcrmc='docker rm \$(docker ps -a -q)'" >> /etc/bash.bashrc
# removes all currently unused containers/images
echo "alias dcrmci='docker rm \$(docker ps -a -q); docker rmi \$(docker images -q)'" >> /etc/bash.bashrc
# removes all currently unused containers/volumes
echo "alias dcrmcv='docker rm \$(docker ps -a -q); docker volume rm -f \$(docker volume list -q)'" >> /etc/bash.bashrc
# removes all currently unused containers/images/volumes
echo "alias dcrmciv='docker rm \$(docker ps -a -q); docker rmi \$(docker images -q); docker volume rm -f \$(docker volume list -q)'" >> /etc/bash.bashrc

# project directory configuration
echo "cd $(pwd)" >> /etc/bash.bashrc
# enable git push -f from in the dev container
echo "git config --global --add safe.directory $(pwd)" >> /etc/bash.bashrc
# setup git hooks
echo "git config core.hooksPath git_hooks" >> /etc/bash.bashrc
# to undo: git config --unset core.hookspath

# download node modules for eslinting and stuff
npm install
