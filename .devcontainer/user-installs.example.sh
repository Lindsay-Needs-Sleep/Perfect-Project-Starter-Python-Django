# Make bash autocomplete work like windows
echo "TAB:menu-complete" >> /etc/inputrc
# Disable bell sound in bash
echo "set bell-style none" >> /etc/inputrc
# add option to /etc/inputrc to enable case-insensitive tab completion for all users
echo "set completion-ignore-case On" >> /etc/inputrc

# add command to print nicer ls
echo "alias ll='ls -alF'" >> /etc/bash.bashrc
# Docker shortcuts
echo "alias d='docker'" >> /etc/bash.bashrc
echo "alias dc='docker compose'" >> /etc/bash.bashrc
echo "alias dcrmall='docker rm $$(docker ps -a -q); docker rmi $$(docker images -q); docker volume rm -f $$(docker volume list -q)'"

